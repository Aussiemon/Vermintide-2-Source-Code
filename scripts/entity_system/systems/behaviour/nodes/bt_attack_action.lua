require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTAttackAction = class(BTAttackAction, BTNode)
local DEFAULT_SPEED_MODIFIER_ON_TARGET_DODGE = 0.2
local DEFAULT_SPEED_LERP_TIME_ON_TARGET_DODGE = 0.6
local DEFAULT_DODGE_ROTATION_TIME = 1
local REEVAL_TIME = 0.5

BTAttackAction.init = function (self, ...)
	BTAttackAction.super.init(self, ...)
end

BTAttackAction.name = "BTAttackAction"

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end
end

BTAttackAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.active_node = BTAttackAction
	blackboard.attack_finished = false
	blackboard.attack_aborted = false
	blackboard.has_engaged = true
	blackboard.locked_attack_rotation = false
	blackboard.target_speed = 0
	blackboard.moving_attack = action.moving_attack
	local target_unit = blackboard.target_unit
	local target_unit_status_extension = (ScriptUnit.has_extension(target_unit, "status_system") and ScriptUnit.extension(target_unit, "status_system")) or nil
	local attack = self:_select_attack(action, unit, target_unit, blackboard, target_unit_status_extension)
	local attack_anim = randomize(attack.anims)
	blackboard.attack_anim = attack_anim

	if action.blocked_anim then
		blackboard.blocked_anim = action.blocked_anim
	end

	local box_range = attack.damage_box_range

	if box_range then
		blackboard.attack_range_up = box_range.up
		blackboard.attack_range_down = box_range.down
		blackboard.attack_range_flat = box_range.flat
	end

	if target_unit_status_extension then
		blackboard.attack_token = (target_unit_status_extension and target_unit_status_extension:want_an_attack()) or nil
	else
		blackboard.attack_token = true
	end

	local network_manager = Managers.state.network
	local unit_id = network_manager:unit_game_object_id(unit)

	if blackboard.attack_token and target_unit_status_extension then
		local attack_intensity = (blackboard.moving_attack and action.moving_attack_intensity) or action.attack_intensity or 0.75

		target_unit_status_extension:add_attack_intensity(attack_intensity * (0.75 + 0.5 * math.random()))

		local is_behind_player = AiUtils.unit_is_behind_player(unit, target_unit)
		local breed = blackboard.breed
		local should_backstab = breed.use_backstab_vo and blackboard.total_slots_count < 5 and is_behind_player

		if should_backstab then
			DialogueSystem:TriggerBackstab(target_unit, unit, blackboard)

			blackboard.backstab_attack_trigger = true
		end
	end

	blackboard.target_unit_status_extension = target_unit_status_extension

	network_manager:anim_event(unit, "to_combat")

	local target_unit_id, is_level_unit = network_manager:game_object_or_level_id(target_unit)

	network_manager.network_transmit:send_rpc_all("rpc_enemy_has_target", unit_id, target_unit_id, is_level_unit)

	blackboard.attack_setup_delayed = true
	blackboard.attacking_target = target_unit
	blackboard.spawn_to_running = nil
	local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, target_unit)
	blackboard.attack_rotation = QuaternionBox(rotation)
	blackboard.attack_rotation_lock_timer = t
	blackboard.attack_dodge_window_start = (action.dodge_window_start and action.dodge_window_start + t) or t
end

BTAttackAction.anim_cb_attack_vce = function (self, unit, blackboard)
	local network_manager = Managers.state.network
	local game = network_manager:game()

	if game and blackboard.target_unit_status_extension then
		self:trigger_attack_sound(blackboard.action, unit, blackboard.target_unit, blackboard, blackboard.target_unit_status_extension)
	end
end

BTAttackAction.trigger_attack_sound = function (self, action, unit, target_unit, blackboard, target_unit_status_extension)
	if blackboard.attack_token and target_unit_status_extension then
		DialogueSystem:TriggerAttack(target_unit, unit, false, blackboard)
	end
end

BTAttackAction._select_attack = function (self, action, unit, target_unit, blackboard, target_unit_status_extension)
	local target_type = Unit.get_data(target_unit, "target_type")
	local target_exception_attack = target_type and action.target_type_exceptions and action.target_type_exceptions[target_type]

	if target_exception_attack then
		return target_exception_attack
	else
		local self_pos = POSITION_LOOKUP[unit]
		local target_pos = POSITION_LOOKUP[target_unit] or Unit.world_position(unit, 0)
		local z_offset = target_pos.z - self_pos.z
		local flat_distance = Vector3.distance(Vector3.flat(self_pos), Vector3.flat(target_pos))
		local default_attack = action.default_attack
		local high_attack = action.high_attack
		local mid_attack = action.mid_attack
		local low_attack = action.low_attack
		local step_attack = action.step_attack
		local knocked_down_attack = action.knocked_down_attack

		if high_attack and high_attack.z_threshold < z_offset then
			return high_attack
		elseif mid_attack and z_offset < mid_attack.z_threshold and mid_attack.flat_threshold < flat_distance then
			return mid_attack
		elseif low_attack and z_offset < low_attack.z_threshold then
			return low_attack
		elseif knocked_down_attack and z_offset < knocked_down_attack.z_threshold and target_unit_status_extension and target_unit_status_extension:is_knocked_down() then
			return knocked_down_attack
		elseif step_attack and ((blackboard.target_speed_away > (step_attack.step_speed_moving or 1) and flat_distance > (step_attack.step_distance_moving or 1.5)) or flat_distance > (step_attack.step_distance_stationary or 2.5)) then
			blackboard.moving_attack = true

			return step_attack
		else
			return default_attack
		end
	end
end

BTAttackAction.leave = function (self, unit, blackboard, t, reason, destroy)
	if blackboard.move_state ~= "idle" and AiUtils.unit_alive(unit) then
		if not blackboard.blocked then
			local network_manager = Managers.state.network

			network_manager:anim_event(unit, "idle")
		end

		blackboard.move_state = "idle"
	end

	blackboard.attack_token = false
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(true)
	navigation_extension:set_max_speed(default_move_speed)

	blackboard.attack_rotation = nil
	blackboard.locked_attack_rotation = nil
	blackboard.attack_rotation_lock_timer = nil
	blackboard.target_unit_status_extension = nil
	blackboard.target_dodged_during_attack = nil
	blackboard.current_time_for_dodge = nil
	blackboard.attack_dodge_window_start = nil
	blackboard.target_speed = 0
	blackboard.update_timer = 0
	blackboard.active_node = nil
	blackboard.attack_aborted = nil
	blackboard.attacking_target = nil
	blackboard.anim_cb_stagger_immune = nil
	blackboard.attack_anim = nil
	blackboard.anim_cb_damage = nil

	if blackboard.action.use_box_range then
		blackboard.attack_range_up = nil
		blackboard.attack_range_down = nil
		blackboard.attack_range_flat = nil
	end

	blackboard.action = nil
	blackboard.backstab_attack_trigger = nil
	blackboard.moving_attack = nil

	if ScriptUnit.has_extension(unit, "ai_shield_system") then
		local shield_extension = ScriptUnit.extension(unit, "ai_shield_system")

		shield_extension:set_is_blocking(true)
	end
end

BTAttackAction.run = function (self, unit, blackboard, t, dt)
	if not Unit.alive(blackboard.attacking_target) then
		return "done"
	end

	if blackboard.attack_aborted then
		return "done"
	end

	if blackboard.attack_finished then
		blackboard.skulk_time = nil
		blackboard.skulk_time_force_attack = nil

		return "done"
	end

	if blackboard.anim_cb_damage then
		blackboard.anim_cb_damage = nil

		if blackboard.moving_attack then
			blackboard.navigation_extension:set_enabled(false)
			blackboard.locomotion_extension:set_wanted_velocity(Vector3(0, 0, 0))
		end

		if ScriptUnit.has_extension(unit, "ai_shield_system") then
			local shield_extension = ScriptUnit.extension(unit, "ai_shield_system")

			shield_extension:set_is_blocking(false)
		end
	end

	local action = self._tree_node.action_data

	if blackboard.moving_attack then
		local breed = blackboard.breed
		local navigation_extension = blackboard.navigation_extension
		local distance = blackboard.target_dist
		local target_speed = blackboard.target_speed_away_small_sample

		if distance > 2.5 then
			if blackboard.locked_attack_rotation then
				target_speed = breed.run_speed * 0.25
			else
				target_speed = breed.run_speed * 1.1
			end
		elseif distance > 1.5 then
			if blackboard.locked_attack_rotation then
				target_speed = 0
			else
				target_speed = target_speed * 1.4
			end
		end

		if math.abs(target_speed - blackboard.target_speed) > 0.25 then
			blackboard.target_speed = target_speed

			navigation_extension:set_max_speed(math.clamp(target_speed, 0, breed.run_speed))
		end
	end

	if blackboard.attack_setup_delayed then
		if not blackboard.moving_attack then
			blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())
			blackboard.navigation_extension:set_enabled(false)
		end

		blackboard.attack_setup_delayed = false
	end

	self:attack(unit, t, dt, blackboard)

	return "running"
end

BTAttackAction.attack_cooldown = function (self, unit, blackboard)
	local t = Managers.time:time("game")
	local cooldown, cooldown_at = self:get_attack_cooldown_finished_at(unit, blackboard, t)
	blackboard.attack_cooldown_at = cooldown_at
	blackboard.is_in_attack_cooldown = cooldown
end

BTAttackAction.attack_success = function (self, unit, blackboard)
	local breed = blackboard.breed

	if breed.use_backstab_vo and blackboard.backstab_attack_trigger then
		DialogueSystem:TriggerBackstabHit(blackboard.target_unit, unit)

		blackboard.backstab_attack_trigger = false
	end
end

BTAttackAction.attack = function (self, unit, t, dt, blackboard)
	local bb = blackboard
	local action = bb.action
	local locomotion = ScriptUnit.extension(unit, "locomotion_system")

	if bb.move_state ~= "attacking" then
		bb.move_state = "attacking"

		Managers.state.network:anim_event(unit, bb.attack_anim)
	end

	local target_status_ext = bb.target_unit_status_extension

	if target_status_ext then
		local target_is_dodging = target_status_ext:get_is_dodging() or target_status_ext:is_invisible()
		local should_rotate = not target_is_dodging and bb.attack_rotation_lock_timer < t
		local should_lock_rotation = target_is_dodging and not bb.locked_attack_rotation and bb.moving_attack and bb.target_dist < 3 and bb.attack_dodge_window_start < t

		if should_rotate then
			local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, bb.attacking_target)

			bb.attack_rotation:store(rotation)

			if bb.locked_attack_rotation then
				bb.locked_attack_rotation = false
			end
		elseif should_lock_rotation then
			bb.attack_rotation_lock_timer = t + (action.dodge_rotation_time or DEFAULT_DODGE_ROTATION_TIME)
			bb.locked_attack_rotation = true
		end
	end

	locomotion:set_wanted_rotation(blackboard.attack_rotation:unbox())
end

BTAttackAction.get_attack_cooldown_finished_at = function (self, unit, blackboard, t)
	local attacking_target = blackboard.attacking_target

	if not Unit.alive(attacking_target) then
		return false, 0
	end

	local dimishing_damage_data = blackboard.action.dimishing_damage

	if not dimishing_damage_data then
		return false, 0
	end

	local has_ai_slot_extension = ScriptUnit.has_extension(attacking_target, "ai_slot_system")

	if not has_ai_slot_extension then
		return false, 0
	end

	local ai_slot_system = Managers.state.entity:system("ai_slot_system")
	local slots_n = ai_slot_system:slots_count(attacking_target)

	if slots_n == 0 then
		return false, 0
	end

	local dimishing_damage = dimishing_damage_data[math.min(slots_n, 9)]

	if not dimishing_damage then
		local action_data = blackboard.action
		local difficulty = Managers.state.difficulty:get_difficulty()

		if action_data.dimishing_damage and action_data.difficulty_diminishing_damage then
			dimishing_damage_data = action_data.difficulty_diminishing_damage[difficulty]
			dimishing_damage = dimishing_damage_data[math.min(slots_n, 9)]
		end
	end

	local cooldown_data = dimishing_damage.cooldown
	local cooldown = AiUtils.random(cooldown_data[1], cooldown_data[2])

	return true, cooldown + t
end

return
