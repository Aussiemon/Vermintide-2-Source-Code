require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTAttackAction = class(BTAttackAction, BTNode)

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

local DEFAULT_DODGE_ROTATION_TIME = 1.5
local EMPTY_TABLE = {}

BTAttackAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.active_node = BTAttackAction
	blackboard.attack_aborted = false
	blackboard.attack_finished = false
	blackboard.attack_finished_t = nil
	blackboard.attack_token = true
	blackboard.locked_attack_rotation = false
	blackboard.moving_attack = action.moving_attack
	blackboard.past_damage_in_attack = false
	blackboard.target_speed = 0
	local target_unit = blackboard.target_unit
	local target_unit_status_extension = ScriptUnit.has_extension(target_unit, "status_system")
	local target_unit_slot_extension = ScriptUnit.has_extension(target_unit, "ai_slot_system")
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

	if blackboard.attack_token and target_unit_status_extension then
		local breed = blackboard.breed

		if breed.use_backstab_vo and target_unit_slot_extension and target_unit_slot_extension.num_occupied_slots <= 5 then
			local player = Managers.player:unit_owner(target_unit)

			if player and not player.bot_player then
				local is_flanking = AiUtils.unit_is_flanking_player(unit, target_unit)

				if is_flanking then
					blackboard.backstab_attack_trigger = true
				end

				if player.local_player then
					if is_flanking then
						local dialogue_extension = ScriptUnit.extension(unit, "dialogue_system")
						local wwise_source, wwise_world = WwiseUtils.make_unit_auto_source(blackboard.world, unit, dialogue_extension.voice_node)
						local sound_event = breed.backstab_player_sound_event
						local audio_system_extension = Managers.state.entity:system("audio_system")

						audio_system_extension:_play_event_with_source(wwise_world, sound_event, wwise_source)
					end
				else
					local network_manager = Managers.state.network
					local network_transmit = network_manager.network_transmit
					local unit_id = network_manager:unit_game_object_id(unit)
					local peer_id = player:network_id()

					network_transmit:send_rpc("rpc_check_trigger_backstab_sfx", peer_id, unit_id)
				end
			end
		end
	end

	blackboard.target_unit_status_extension = target_unit_status_extension
	blackboard.attack_setup_delayed = true
	blackboard.attacking_target = target_unit
	blackboard.spawn_to_running = nil
	local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, target_unit)
	blackboard.attack_rotation = QuaternionBox(rotation)
	blackboard.attack_rotation_lock_timer = t
	local dodge_window_start = action.dodge_window_start
	local dodge_window_duration = action.dodge_window_duration or EMPTY_TABLE
	local difficulty = Managers.state.difficulty:get_difficulty()

	if dodge_window_start and type(dodge_window_start) == "table" then
		dodge_window_start = dodge_window_start[difficulty]
	end

	blackboard.attack_dodge_window_start = dodge_window_start and dodge_window_start + t or t
	blackboard.attack_dodge_window_duration = dodge_window_duration[difficulty] or DEFAULT_DODGE_ROTATION_TIME

	if action.attack_finished_duration then
		local attack_finished_duration = action.attack_finished_duration[difficulty]

		if attack_finished_duration then
			blackboard.attack_finished_t = t + Math.random_range(attack_finished_duration[1], attack_finished_duration[2])
		end
	end

	AiUtils.add_attack_intensity(target_unit, action, blackboard)

	if blackboard.moving_attack and ScriptUnit.has_extension(unit, "ai_slot_system") then
		local ai_slot_system = Managers.state.entity:system("ai_slot_system")

		ai_slot_system:set_release_slot_lock(unit, true)

		blackboard.keep_target = true
	end

	local target_unit_attack_intensity_extension = ScriptUnit.has_extension(target_unit, "attack_intensity_system")

	if target_unit_attack_intensity_extension then
		blackboard.target_unit_attack_intensity_extension = target_unit_attack_intensity_extension
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
		local step_attack_with_callback = action.step_attack_with_callback
		local knocked_down_attack = action.knocked_down_attack

		if high_attack and high_attack.z_threshold < z_offset then
			return high_attack
		elseif mid_attack and z_offset < mid_attack.z_threshold and mid_attack.flat_threshold < flat_distance then
			return mid_attack
		elseif low_attack and z_offset < low_attack.z_threshold then
			return low_attack
		elseif knocked_down_attack and z_offset < knocked_down_attack.z_threshold and target_unit_status_extension and target_unit_status_extension:is_knocked_down() then
			return knocked_down_attack
		elseif step_attack_with_callback and (blackboard.target_speed_away > (step_attack_with_callback.step_speed_moving or 1) and flat_distance > (step_attack_with_callback.step_distance_moving or 1.5) or flat_distance > (step_attack_with_callback.step_distance_stationary or 2.5)) then
			blackboard.moving_attack_with_callback = true

			if step_attack_with_callback.attack_hit_animation then
				blackboard.attack_hit_animation = step_attack_with_callback.attack_hit_animation
			end

			return step_attack_with_callback
		elseif step_attack and (blackboard.target_speed_away > (step_attack.step_speed_moving or 1) and flat_distance > (step_attack.step_distance_moving or 1.5) or flat_distance > (step_attack.step_distance_stationary or 2.5)) then
			blackboard.moving_attack = step_attack.moving_attack

			return step_attack
		else
			return default_attack
		end
	end
end

BTAttackAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(true)
	navigation_extension:set_max_speed(default_move_speed)

	if blackboard.move_state ~= "idle" and AiUtils.unit_alive(unit) then
		blackboard.move_state = "idle"
	end

	if blackboard.moving_attack and ScriptUnit.has_extension(unit, "ai_slot_system") then
		local ai_slot_system = Managers.state.entity:system("ai_slot_system")

		ai_slot_system:set_release_slot_lock(unit, false)

		blackboard.keep_target = nil
	end

	if ScriptUnit.has_extension(unit, "ai_shield_system") then
		local shield_extension = ScriptUnit.extension(unit, "ai_shield_system")

		shield_extension:set_is_blocking(true)
	end

	self:clear_blackboard(unit, blackboard, t)
end

BTAttackAction.clear_blackboard = function (self, unit, blackboard, t)
	if blackboard.action.use_box_range then
		blackboard.attack_range_up = nil
		blackboard.attack_range_down = nil
		blackboard.attack_range_flat = nil
	end

	blackboard.action = nil
	blackboard.active_node = nil
	blackboard.anim_cb_attack_cooldown = nil
	blackboard.anim_cb_damage = nil
	blackboard.anim_cb_running_attack_end = nil
	blackboard.anim_cb_running_attack_start = nil
	blackboard.anim_cb_stagger_immune = nil
	blackboard.attack_aborted = nil
	blackboard.attack_anim = nil
	blackboard.attack_dodge_window_start = nil
	blackboard.attack_dodge_window_duration = nil
	blackboard.attack_finished = nil
	blackboard.attack_finished_duration = nil
	blackboard.attack_finished_t = nil
	blackboard.attack_hit_animation = nil
	blackboard.attack_rotation = nil
	blackboard.attack_rotation_lock_timer = nil
	blackboard.attack_token = nil
	blackboard.attacking_target = nil
	blackboard.backstab_attack_trigger = nil
	blackboard.locked_attack_rotation = nil
	blackboard.moving_attack = nil
	blackboard.moving_attack_with_callback = nil
	blackboard.past_damage_in_attack = nil
	blackboard.target_speed = 0
	blackboard.target_unit_attack_intensity_extension = nil
	blackboard.target_unit_status_extension = nil
end

BTAttackAction.run = function (self, unit, blackboard, t, dt)
	if not Unit.alive(blackboard.attacking_target) then
		return "done"
	end

	if blackboard.attack_aborted then
		return "done"
	end

	if blackboard.anim_cb_damage then
		blackboard.anim_cb_damage = nil
		blackboard.past_damage_in_attack = true

		if blackboard.moving_attack then
			blackboard.navigation_extension:set_enabled(false)
			blackboard.locomotion_extension:set_wanted_velocity(Vector3(0, 0, 0))
		end

		if ScriptUnit.has_extension(unit, "ai_shield_system") then
			local shield_extension = ScriptUnit.extension(unit, "ai_shield_system")

			shield_extension:set_is_blocking(false)
		end
	end

	if blackboard.anim_cb_attack_cooldown and blackboard.attack_finished_t and blackboard.attack_finished_t < t or not blackboard.attack_finished_t and blackboard.attack_finished then
		return "done"
	end

	if blackboard.moving_attack then
		local breed = blackboard.breed
		local distance = blackboard.destination_dist
		local target_speed = blackboard.target_speed_away_small_sample
		local run_speed = breed.run_speed

		if distance > 0.5 then
			if blackboard.locked_attack_rotation then
				target_speed = run_speed * 0.85
			else
				target_speed = run_speed * 1.1
			end
		elseif blackboard.locked_attack_rotation then
			target_speed = run_speed * 0.65
		else
			target_speed = target_speed * 1.2
		end

		if math.abs(target_speed - blackboard.target_speed) > 0.25 then
			blackboard.target_speed = target_speed
			local navigation_extension = blackboard.navigation_extension

			navigation_extension:set_max_speed(math.clamp(target_speed, 0, run_speed))
		end
	end

	if blackboard.attack_setup_delayed then
		if not blackboard.moving_attack then
			blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())
			blackboard.navigation_extension:set_enabled(false)
		end

		blackboard.attack_setup_delayed = false
	end

	if blackboard.moving_attack_with_callback then
		if blackboard.anim_cb_running_attack_start then
			blackboard.navigation_extension:set_enabled(true)

			blackboard.anim_cb_running_attack_start = nil
		elseif blackboard.anim_cb_running_attack_end then
			blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())
			blackboard.navigation_extension:set_enabled(false)

			blackboard.anim_cb_running_attack_end = nil
		end
	end

	self:_attack(unit, t, dt, blackboard)
	self:_handle_movement(unit, t, dt, blackboard)

	return "running"
end

BTAttackAction.attack_cooldown = function (self, unit, blackboard)
	local t = Managers.time:time("game")
	local cooldown, cooldown_at = self:_get_attack_cooldown_finished_at(unit, blackboard, t)
	blackboard.attack_cooldown_at = cooldown_at
	blackboard.is_in_attack_cooldown = cooldown
end

BTAttackAction.attack_success = function (self, unit, blackboard)
	local breed = blackboard.breed

	if breed.use_backstab_vo and blackboard.backstab_attack_trigger then
		DialogueSystem:trigger_backstab_hit(blackboard.target_unit, unit)

		blackboard.backstab_attack_trigger = false
	end

	if blackboard.attack_hit_animation then
		Managers.state.network:anim_event(unit, blackboard.attack_hit_animation)
		blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())
		blackboard.navigation_extension:set_enabled(false)
	end
end

BTAttackAction.attack_blocked = function (self, unit, blackboard, direction)
	local action = blackboard.action
	local target_unit = blackboard.attacking_target
	local blocked_push_speed = action.player_push_speed_blocked

	if blocked_push_speed then
		local target_status_extension = ScriptUnit.extension(target_unit, "status_system")

		if not target_status_extension:is_disabled() then
			local attacker_pos = POSITION_LOOKUP[unit] or Unit.world_position(unit, 0)
			local target_pos = POSITION_LOOKUP[target_unit] or Unit.local_position(target_unit, 0)
			local damage_direction = Vector3.normalize(target_pos - attacker_pos)
			local player_locomotion = ScriptUnit.extension(target_unit, "locomotion_system")

			player_locomotion:add_external_velocity(blocked_push_speed * damage_direction, action.max_player_push_speed)
		end
	end
end

BTAttackAction._attack = function (self, unit, t, dt, blackboard)
	local bb = blackboard

	if bb.move_state ~= "attacking" then
		bb.move_state = "attacking"

		Managers.state.network:anim_event(unit, bb.attack_anim)
	end
end

local DEFAULT_DODGE_DISTANCE_THRESHOLD = 4

BTAttackAction._handle_movement = function (self, unit, t, dt, blackboard)
	local bb = blackboard
	local distance = blackboard.target_dist
	local is_in_dodge_window = bb.attack_dodge_window_start and bb.attack_dodge_window_start < t

	if is_in_dodge_window and not bb.past_damage_in_attack then
		local target_status_ext = bb.target_unit_status_extension

		if target_status_ext then
			local target_is_dodging = target_status_ext:get_is_dodging() or target_status_ext:is_invisible()
			local should_rotate = not target_is_dodging and bb.attack_rotation_lock_timer < t
			local should_lock_rotation = target_is_dodging and not bb.locked_attack_rotation and distance < DEFAULT_DODGE_DISTANCE_THRESHOLD

			if should_rotate then
				local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, bb.attacking_target)

				bb.attack_rotation:store(rotation)

				if bb.locked_attack_rotation then
					bb.locked_attack_rotation = false
				end
			elseif should_lock_rotation then
				bb.attack_rotation_lock_timer = t + blackboard.attack_dodge_window_duration
				bb.locked_attack_rotation = true
			end
		end

		local locomotion_extension = bb.locomotion_extension

		locomotion_extension:set_wanted_rotation(blackboard.attack_rotation:unbox())
	else
		local locomotion_extension = bb.locomotion_extension

		locomotion_extension:set_wanted_rotation(blackboard.attack_rotation:unbox())
	end

	if bb.locked_attack_rotation and bb.attack_rotation_lock_timer and bb.attack_rotation_lock_timer < t or DEFAULT_DODGE_DISTANCE_THRESHOLD < distance then
		bb.locked_attack_rotation = false
	end
end

BTAttackAction._get_attack_cooldown_finished_at = function (self, unit, blackboard, t)
	local attacking_target = blackboard.attacking_target

	if not Unit.alive(attacking_target) then
		return false, 0
	end

	local diminishing_damage_data = blackboard.action.diminishing_damage

	if not diminishing_damage_data then
		return false, 0
	end

	local target_unit_slot_extension = ScriptUnit.has_extension(attacking_target, "ai_slot_system")

	if not target_unit_slot_extension or not target_unit_slot_extension.has_slots_attached then
		return false, 0
	end

	local slots_n = target_unit_slot_extension.num_occupied_slots

	if slots_n == 0 then
		return false, 0
	end

	local diminishing_damage = diminishing_damage_data[math.min(slots_n, 9)]

	if not diminishing_damage then
		local action_data = blackboard.action
		local difficulty = Managers.state.difficulty:get_difficulty()

		if action_data.diminishing_damage and action_data.difficulty_diminishing_damage then
			diminishing_damage_data = action_data.difficulty_diminishing_damage[difficulty]
			diminishing_damage = diminishing_damage_data[math.min(slots_n, 9)]
		end
	end

	local cooldown_data = diminishing_damage.cooldown
	local cooldown = AiUtils.random(cooldown_data[1], cooldown_data[2])

	return true, cooldown + t
end

BTAttackAction.anim_cb_attack_vce = function (self, unit, blackboard)
	local network_manager = Managers.state.network
	local game = network_manager:game()

	if game and blackboard.target_unit_status_extension then
		DialogueSystem:trigger_attack(blackboard, blackboard.target_unit, unit, false, false)
	end
end

BTAttackAction.anim_cb_attack_vce_long = function (self, unit, blackboard)
	local network_manager = Managers.state.network
	local game = network_manager:game()

	if game and blackboard.target_unit_status_extension then
		DialogueSystem:trigger_attack(blackboard, blackboard.target_unit, unit, false, true)
	end
end

BTAttackAction.anim_cb_running_attack_start = function (self, unit, blackboard)
	local network_manager = Managers.state.network
	local game = network_manager:game()

	if game then
		blackboard.anim_cb_running_attack_start = true
	end
end

BTAttackAction.anim_cb_attack_finished = function (self, unit, blackboard)
	local network_manager = Managers.state.network
	local game = network_manager:game()

	if game then
		blackboard.attacks_done = blackboard.attacks_done + 1
		blackboard.attack_finished = true
	end
end
