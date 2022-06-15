require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTFireProjectileAction = class(BTFireProjectileAction, BTNode)

BTFireProjectileAction.init = function (self, ...)
	BTFireProjectileAction.super.init(self, ...)
end

BTFireProjectileAction.name = "BTFireProjectileAction"

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end
end

BTFireProjectileAction = class(BTFireProjectileAction, BTNode)
BTFireProjectileAction.name = "BTFireProjectileAction"

BTFireProjectileAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.active_node = BTFireProjectileAction
	blackboard.attack_finished = false
	blackboard.attack_aborted = false
	blackboard.anim_cb_spawn_projectile = nil

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3(0, 0, 0))

	blackboard.aim_cooldown = t + math.random(action.aim_cooldown[1], action.aim_cooldown[2])
	blackboard.start_check_for_dodge_t = blackboard.aim_cooldown - action.dodge_window
	blackboard.ranged_state = "aiming"
	blackboard.move_state = "attacking"
	local network_manager = Managers.state.network

	network_manager:anim_event(unit, action.aim_animation)

	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	ai_slot_system:do_slot_search(unit, false)
	self:_check_for_volley_attack(blackboard, unit, t)

	blackboard.attacking_target = blackboard.volley_target_unit or blackboard.target_unit
	local target_unit_status_extension = ScriptUnit.has_extension(blackboard.attacking_target, "status_system")
	blackboard.target_unit_status_extension = target_unit_status_extension
	local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event(blackboard.action.leader_fire_volley_dialogue_event, event_data)
end

BTFireProjectileAction._check_for_volley_attack = function (self, blackboard, unit, t)
	local target_unit = blackboard.target_unit
	local nearby_archers = {}

	if blackboard.is_volley_leader or not blackboard.has_volley_target then
		local broadphase = blackboard.group_blackboard.broadphase
		local broadphase_query_result = blackboard.archer_broadphase_results
		local radius = 15
		local self_pos = POSITION_LOOKUP[unit]
		local num_results = Broadphase.query(broadphase, self_pos, radius, broadphase_query_result)
		local fire_volley_at_t = blackboard.fire_volley_at_t or t + 1 + math.random()
		local group_position = Vector3(0, 0, 0)

		if num_results >= 3 then
			for i = 1, num_results, 1 do
				local nearby_unit = broadphase_query_result[i]
				local nearby_unit_blackboard = BLACKBOARDS[nearby_unit]
				local nearby_unit_breed = nearby_unit_blackboard.breed
				local nearby_unit_position = POSITION_LOOKUP[nearby_unit]

				if nearby_unit_breed.is_archer then
					nearby_archers[#nearby_archers + 1] = nearby_unit_blackboard
					group_position = group_position + nearby_unit_position
				end
			end
		end

		local num_nearby_archers = #nearby_archers

		if num_nearby_archers >= 3 then
			local longest_fire_time = 0

			for i = 1, num_nearby_archers, 1 do
				local nearby_unit_blackboard = nearby_archers[i]

				if nearby_unit_blackboard.unit ~= unit then
					nearby_unit_blackboard.volley_target_unit = target_unit
					nearby_unit_blackboard.has_volley_target = true
					local nearby_unit_fire_volley_at_t = fire_volley_at_t + Math.random_range(0.15, 1.5)
					nearby_unit_blackboard.fire_volley_at_t = nearby_unit_fire_volley_at_t

					if longest_fire_time < nearby_unit_fire_volley_at_t then
						longest_fire_time = nearby_unit_fire_volley_at_t
					end

					if not nearby_unit_blackboard.confirmed_player_sighting then
						AiUtils.activate_unit(nearby_unit_blackboard)
					end
				end
			end

			blackboard.volley_target_unit = target_unit
			blackboard.fire_volley_at_t = longest_fire_time + Math.random_range(0.15, 0.3)
			local audio_system = Managers.state.entity:system("audio_system")
			local group_volley_sound = blackboard.action.group_volley_sound
			local center_position = group_position / num_nearby_archers

			audio_system:play_audio_position_event(group_volley_sound, center_position)

			blackboard.is_volley_leader = true
			blackboard.nearby_archers = nearby_archers
		end
	end
end

BTFireProjectileAction.leave = function (self, unit, blackboard, t, reason)
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(true)
	navigation_extension:set_max_speed(default_move_speed)
	blackboard.locomotion_extension:set_rotation_speed(nil)

	blackboard.action = nil
	blackboard.active_node = nil
	blackboard.aim_cooldown = nil
	blackboard.anim_cb_spawn_projectile = nil
	blackboard.attack_aborted = nil
	blackboard.attack_success = nil
	blackboard.attacking_target = nil
	blackboard.fire_volley_at_t = nil
	blackboard.ranged_state = nil
	blackboard.shoot_cooldown = nil
	blackboard.target_is_dodging = nil
	blackboard.target_unit_status_extension = nil
	blackboard.volley_target_unit = nil
	blackboard.ranged_state = nil
	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	ai_slot_system:do_slot_search(unit, true)
end

BTFireProjectileAction.run = function (self, unit, blackboard, t, dt)
	local attacking_target = blackboard.attacking_target

	if not Unit.alive(attacking_target) then
		return "done"
	end

	if blackboard.attack_aborted then
		return "done"
	end

	if blackboard.start_check_for_dodge_t and blackboard.start_check_for_dodge_t < t then
		local target_is_dodging = blackboard.target_unit_status_extension and blackboard.target_unit_status_extension:get_is_dodging()
		blackboard.target_is_dodging = target_is_dodging

		if blackboard.anim_cb_spawn_projectile then
			blackboard.start_check_for_dodge_t = nil
		end
	end

	local rotation = Unit.world_rotation(unit, 0)
	local rotation_forward = Vector3.flat(Quaternion.forward(rotation))
	local rotation_forward_normalized = Vector3.normalize(rotation_forward)
	local target_position = POSITION_LOOKUP[attacking_target]
	local unit_position = POSITION_LOOKUP[unit]
	local to_target = Vector3.flat(target_position - unit_position)
	local to_target_normalized = Vector3.normalize(to_target)
	local dot = Vector3.dot(to_target_normalized, rotation_forward_normalized)

	if dot < math.inverse_sqrt_2 then
		local rot = LocomotionUtils.rotation_towards_unit_flat(unit, attacking_target)

		blackboard.locomotion_extension:set_wanted_rotation(rot)
	end

	local network_manager = Managers.state.network
	local state = blackboard.ranged_state
	local action = blackboard.action

	if state == "aiming" then
		if blackboard.has_volley_target or blackboard.is_volley_leader then
			if blackboard.aim_cooldown <= t and blackboard.fire_volley_at_t and blackboard.fire_volley_at_t < t then
				blackboard.ranged_state = "shooting"

				network_manager:anim_event(unit, action.shoot_animation)
			elseif blackboard.aim_cooldown <= t and not blackboard.fire_volley_at_t then
				blackboard.ranged_state = "shooting"

				network_manager:anim_event(unit, action.shoot_animation)
			end
		elseif blackboard.aim_cooldown <= t and blackboard.has_line_of_sight then
			blackboard.ranged_state = "shooting"

			network_manager:anim_event(unit, action.shoot_animation)
		elseif blackboard.aim_cooldown <= t then
			blackboard.ranged_state = "aftermath"
			blackboard.shoot_cooldown = t
		end
	elseif state == "shooting" then
		if blackboard.anim_cb_spawn_projectile then
			self:_fire_projectile(unit, blackboard, dt)

			blackboard.shoot_cooldown = t + action.shoot_cooldown
			blackboard.ranged_state = "aftermath"
		end
	elseif blackboard.shoot_cooldown < t then
		return "done"
	end

	return "running"
end

BTFireProjectileAction._fire_from_position_direction = function (self, blackboard, unit, dt, projectile_speed, g)
	local target_pos = nil
	local attacking_target = blackboard.attacking_target

	if Unit.has_node(attacking_target, "j_neck") then
		local node = Unit.node(attacking_target, "j_neck")
		target_pos = Unit.world_position(attacking_target, node)
	else
		target_pos = POSITION_LOOKUP[attacking_target] + Vector3(0, 0, 1.5)
	end

	local fire_node = Unit.node(unit, "j_lefthand")
	local fire_position = Unit.world_position(unit, fire_node)
	local target_locomotion = ScriptUnit.has_extension(attacking_target, "locomotion_system")
	local target_current_velocity = (target_locomotion.small_sample_size_average_velocity and target_locomotion:small_sample_size_average_velocity()) or Vector3.zero()
	local target_current_speed = Vector3.length(target_current_velocity)

	if target_current_speed > 4 then
		target_current_velocity = target_current_velocity * 4 / target_current_speed
	end

	local angle, estimated_target_position = WeaponHelper.angle_to_hit_moving_target(fire_position, target_pos, projectile_speed, target_current_velocity, g, 0.1)
	local to_target = estimated_target_position - fire_position

	if angle then
		Vector3.set_z(to_target, 0)

		local to_vec_flat = Vector3.normalize(to_target)
		local velocity = Quaternion.rotate(Quaternion.axis_angle(Vector3.cross(to_vec_flat, Vector3.up()), angle), to_vec_flat) * projectile_speed

		return fire_position, to_target, velocity
	end

	return false
end

local PI = math.pi
local TWO_PI = PI * 2

BTFireProjectileAction._fire_projectile = function (self, unit, blackboard, dt)
	local action = blackboard.action
	local projectile_speed = action.projectile_speed
	local projectile_gravity = action.projectile_gravity
	local from_position, _, velocity = self:_fire_from_position_direction(blackboard, unit, dt, projectile_speed, projectile_gravity)

	if not from_position then
		return false
	end

	local light_weight_projectile_template_name = action.light_weight_projectile_template_name
	local light_weight_projectile_template = LightWeightProjectiles[light_weight_projectile_template_name]
	local collision_filter = "filter_enemy_player_afro_ray_projectile"
	local difficulty_hit_chance = action.difficulty_hit_chance
	local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
	local power_level = light_weight_projectile_template.attack_power_level[difficulty_rank]
	local target_is_dodging = blackboard.target_is_dodging
	local first_shot_spread = not blackboard.fired_first_shot and light_weight_projectile_template.first_shot_spread
	local hit = true

	if difficulty_rank and difficulty_hit_chance then
		local hit_chance = difficulty_hit_chance[difficulty_rank]
		hit = math.random() <= hit_chance

		if not hit or first_shot_spread then
			local collision_filter_miss = "filter_enemy_player_afro_ray_projectile_no_hitbox"
			collision_filter = collision_filter_miss
		end
	end

	local flat_speed = Vector3.length(Vector3.flat(velocity))
	local normalized_direction = Vector3.normalize(velocity)
	local spread = light_weight_projectile_template.spread
	local dodge_spread = light_weight_projectile_template.dodge_spread
	local spread_angle = Math.random() * (first_shot_spread or (target_is_dodging and dodge_spread) or spread)
	spread_angle = (hit and spread_angle) or light_weight_projectile_template.miss_spread or 0
	local pitch = Quaternion(Vector3.right(), spread_angle)
	local roll = Quaternion(Vector3.forward(), (Math.random() - 0.5) * PI)
	local dir_rot = Quaternion.look(normalized_direction, Vector3.up())
	local spread_rot = Quaternion.multiply(Quaternion.multiply(dir_rot, roll), pitch)
	local spread_direction = Quaternion.forward(spread_rot)
	local action_data = {
		power_level = power_level,
		damage_profile = light_weight_projectile_template.damage_profile,
		hit_effect = light_weight_projectile_template.hit_effect,
		player_push_velocity = Vector3Box(normalized_direction * light_weight_projectile_template.impact_push_speed),
		projectile_linker = light_weight_projectile_template.projectile_linker,
		first_person_hit_flow_events = light_weight_projectile_template.first_person_hit_flow_events
	}
	local projectile_system = Managers.state.entity:system("projectile_system")
	local gravity = projectile_gravity
	local owner_peer_id = Network.peer_id()

	projectile_system:create_light_weight_projectile(blackboard.breed.name, unit, from_position, spread_direction, light_weight_projectile_template.projectile_speed, gravity, flat_speed, light_weight_projectile_template.projectile_max_range, collision_filter, action_data, light_weight_projectile_template.light_weight_projectile_effect, owner_peer_id)

	blackboard.fired_first_shot = true
end

return
