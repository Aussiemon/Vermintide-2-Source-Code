require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTStormfiendDualShootAction = class(BTStormfiendDualShootAction, BTNode)

BTStormfiendDualShootAction.init = function (self, ...)
	BTStormfiendDualShootAction.super.init(self, ...)
end

BTStormfiendDualShootAction.name = "BTStormfiendDualShootAction"
local SPHERE_CAST_RADIUS = 0.4
local SPHERE_CAST_MAX_NUM_HITS = 10
local unit_alive = Unit.alive

BTStormfiendDualShootAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	local world = blackboard.world
	blackboard.action = action
	blackboard.active_node = BTStormfiendDualShootAction
	blackboard.attack_finished = false
	blackboard.shoot_data = blackboard.shoot_data or {}
	blackboard.physics_world = blackboard.physics_world or World.get_data(world, "physics_world")
	blackboard.anim_locked = t + action.attack_time
	blackboard.move_state = "attacking"
	blackboard.attack_aborted = false
	blackboard.keep_target = true
	blackboard.find_new_shoot_position = nil
	blackboard.left_muzzle_node = Unit.node(unit, "fx_left_muzzle")
	blackboard.right_muzzle_node = Unit.node(unit, "fx_right_muzzle")
	blackboard.weapon_setup = action.weapon_setup
	local network_manager = Managers.state.network

	network_manager:anim_event(unit, "to_combat")
	network_manager:anim_event(unit, action.attack_animation)

	blackboard.rotation_time = t + action.rotation_time

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())
end

BTStormfiendDualShootAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.navigation_extension:set_enabled(true)

	blackboard.action = nil
	blackboard.active_node = nil
	blackboard.anim_locked = nil
	blackboard.attack_aborted = nil
	blackboard.attack_rotation = nil
	blackboard.attack_started_at_t = nil
	blackboard.keep_target = nil
	blackboard.weapon_setup = nil
	blackboard.bot_threats_data = nil
	blackboard.current_bot_threat_index = nil
	blackboard.create_bot_threat_at_t = nil
	blackboard.bot_threat_range = nil
	blackboard.shoot_sfx_id = nil
end

BTStormfiendDualShootAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.attack_aborted or not unit_alive(blackboard.target_unit) then
		return "failed"
	end

	if t < blackboard.rotation_time then
		local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.target_unit)
		local rotation_speed = blackboard.action.rotation_speed

		if rotation_speed then
			blackboard.locomotion_extension:use_lerp_rotation(true)
			blackboard.locomotion_extension:set_rotation_speed(rotation_speed)
		end

		blackboard.locomotion_extension:set_wanted_rotation(rot)
	end

	if t < blackboard.anim_locked then
		local data = blackboard.shoot_data
		local weapon_setup = blackboard.weapon_setup

		if data.is_firing then
			if t < data.stop_firing_t then
				if weapon_setup and weapon_setup == "ratling_gun" then
					self:_update_ratling_gun(unit, blackboard, t, dt)
				else
					self:shoot_hit_check(unit, blackboard)
				end
			elseif data.stop_firing_t <= t and weapon_setup == "warpfire_thrower" then
				self:_stop_beam_sfx(unit, blackboard, data)
			elseif data.stop_firing_t <= t and blackboard.shoot_sfx_id_1 then
				WwiseWorld.stop_event(Managers.world:wwise_world(blackboard.world), blackboard.shoot_sfx_id_1)
				WwiseWorld.stop_event(Managers.world:wwise_world(blackboard.world), blackboard.shoot_sfx_id_2)

				blackboard.shoot_sfx_id_1 = nil
				blackboard.shoot_sfx_id_2 = nil
			end
		end

		if blackboard.attack_finished then
			blackboard.attack_finished = nil
			local action = blackboard.action

			if action.stop_shoot_sfx then
				WwiseUtils.trigger_unit_event(blackboard.world, action.stop_shoot_sfx, unit, Unit.node(unit, "fx_left_muzzle"))
				WwiseUtils.trigger_unit_event(blackboard.world, action.stop_shoot_sfx, unit, Unit.node(unit, "fx_right_muzzle"))
			end
		end

		return "running"
	else
		return "done"
	end
end

BTStormfiendDualShootAction.create_firewall = function (self, unit, data)
	local start_pos = data.firewall_start_position:unbox()
	local direction = data.direction:unbox()
	local extension_init_data = {
		area_damage_system = {
			liquid_template = "stormfiend_firewall",
			flow_dir = direction,
			source_unit = unit
		}
	}
	local aoe_unit_name = "units/hub_elements/empty"
	local liquid_aoe_unit = Managers.state.unit_spawner:spawn_network_unit(aoe_unit_name, "liquid_aoe_unit", extension_init_data, start_pos)
	local liquid_area_damage_extension = ScriptUnit.extension(liquid_aoe_unit, "area_damage_system")

	liquid_area_damage_extension:ready()
end

BTStormfiendDualShootAction.shoot_hit_check = function (self, unit, blackboard)
	local action = blackboard.action
	local data = blackboard.shoot_data
	local attack_arm = data.attack_arm
	local muzzle_node = action.muzzle_nodes[attack_arm]
	local stormfiend_arm_node = Unit.node(unit, muzzle_node)
	local stormfiend_arm_pos = Unit.world_position(unit, stormfiend_arm_node)
	local aim_position = data.current_aim_position:unbox()
	local physics_world = blackboard.physics_world
	local radius = SPHERE_CAST_RADIUS
	local max_hits = SPHERE_CAST_MAX_NUM_HITS
	local result = PhysicsWorld.linear_sphere_sweep(physics_world, stormfiend_arm_pos, aim_position, radius, max_hits, "collision_filter", "filter_enemy_player_ray_projectile", "report_initial_overlap")
	local debug_hit_index = nil

	if result then
		local immune_breeds = action.immune_breeds
		local num_hits = #result

		for i = 1, num_hits, 1 do
			local hit = result[i]
			local actor = hit.actor
			local hit_unit = Actor.unit(actor)
			local is_character = DamageUtils.is_character(hit_unit)

			if not is_character then
				debug_hit_index = i

				break
			end

			local is_alive = AiUtils.unit_alive(hit_unit)

			if hit_unit ~= unit and is_alive then
				local unit_hit_is_player = DamageUtils.is_player_unit(hit_unit)
				local hit_enemies = data.hit_enemies
				local breed = not unit_hit_is_player and Unit.get_data(hit_unit, "breed")

				if unit_hit_is_player then
					local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

					if not buff_extension:has_buff_type("stormfiend_warpfire_face") then
						local buff_system = Managers.state.entity:system("buff_system")

						buff_system:add_buff(hit_unit, "stormfiend_warpfire_face_base", unit)
					end
				elseif breed and not immune_breeds[breed.name] and not hit_enemies[hit_unit] then
					local attacker_unit = unit
					local armor_type = breed.armor_category or 1
					local damage_type = action.damage_type
					local damage = action.damage[armor_type]
					local damage_direction = data.direction:unbox()
					local damage_source = blackboard.breed.name

					DamageUtils.add_damage_network(hit_unit, attacker_unit, damage, "torso", damage_type, damage_direction, damage_source)

					hit_enemies[hit_unit] = true
				end
			end
		end
	end

	self:_debug_fire_beam(stormfiend_arm_pos, aim_position, true, debug_hit_index, result, "immediate")
end

BTStormfiendDualShootAction._stop_beam_sfx = function (self, unit, blackboard, shoot_data)
	local action = blackboard.action
	local attack_arm = shoot_data.attack_arm
	local node_name = action.muzzle_nodes[attack_arm]
	local event = action.beam_sfx_stop_event
	local audio_system = Managers.state.entity:system("audio_system")

	audio_system:play_audio_unit_event(event, unit, node_name)
end

BTStormfiendDualShootAction._fire_from_position_direction = function (self, unit, blackboard, data, dt, muzzle_node_name)
	local action = blackboard.action
	local muzzle_node = Unit.node(unit, muzzle_node_name)
	local muzzle_pos = Unit.world_position(unit, muzzle_node)
	local muzzle_rot = Unit.world_rotation(unit, muzzle_node)
	local offset_rotation = nil

	if muzzle_node_name == "fx_right_muzzle" then
		offset_rotation = Quaternion.look(Vector3.right())
	else
		offset_rotation = Quaternion.look(Vector3.right() + Vector3.up() * 0.2)
	end

	local new_rotation = Quaternion.multiply(muzzle_rot, offset_rotation)
	local position = muzzle_pos + Quaternion.forward(new_rotation)
	local direction = Vector3.normalize(position - muzzle_pos)
	local fire_pos = muzzle_pos - Vector3.normalize(direction) * 1.25

	return fire_pos, direction
end

BTStormfiendDualShootAction._update_ratling_gun = function (self, unit, blackboard, t, dt)
	local data = blackboard.shoot_data
	local time_in_shoot_action = t - data.shoot_start
	local percentage_in_shoot_action = math.clamp(time_in_shoot_action / data.shoot_duration * data.max_fire_rate_at_percentage_modifier, 0, 1)
	local current_time_between_shots = math.lerp(data.time_between_shots_at_start, data.time_between_shots_at_end, percentage_in_shoot_action)
	local shots_to_fire = (math.floor(time_in_shoot_action / current_time_between_shots) + 1) - data.shots_fired

	for i = 1, shots_to_fire, 1 do
		data.shots_fired = data.shots_fired + 1

		self:_shoot_ratling_gun(unit, blackboard, t, dt, "fx_left_muzzle")
		self:_shoot_ratling_gun(unit, blackboard, t, dt, "fx_right_muzzle")
	end

	local action = blackboard.action

	if action.shoot_sfx and not blackboard.shoot_sfx_id_1 then
		blackboard.shoot_sfx_id_1 = WwiseUtils.trigger_unit_event(blackboard.world, action.shoot_sfx, unit, Unit.node(unit, "fx_left_muzzle"))
		blackboard.shoot_sfx_id_2 = WwiseUtils.trigger_unit_event(blackboard.world, action.shoot_sfx, unit, Unit.node(unit, "fx_right_muzzle"))
	end
end

BTStormfiendDualShootAction._shoot_ratling_gun = function (self, unit, blackboard, t, dt, muzzle_node_name)
	local action = blackboard.action
	local two_pi = math.pi * 2
	local data = blackboard.shoot_data
	local world = blackboard.world
	local physics_world = World.get_data(world, "physics_world")
	local from_position, direction = self:_fire_from_position_direction(unit, blackboard, data, dt, muzzle_node_name)
	local normalized_direction = Vector3.normalize(direction)
	local spread_angle = Math.random() * action.spread
	local dir_rot = Quaternion.look(normalized_direction, Vector3.up())
	local pitch = Quaternion(Vector3.right(), spread_angle)
	local roll = Quaternion(Vector3.forward(), Math.random() * two_pi)
	local spread_rot = Quaternion.multiply(Quaternion.multiply(dir_rot, roll), pitch)
	local spread_direction = Quaternion.forward(spread_rot)
	local distance = 40
	local collision_filter = "filter_enemy_player_ray_projectile"
	local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
	local power_level = action.attack_power_level[difficulty_rank]
	local action_data = {
		attack_template = action.attack_template,
		power_level = power_level,
		armour_modifier = action.armour_modifier,
		power_distribution = action.power_distribution,
		cleave_distribution = action.cleave_distribution,
		hit_effect = action.hit_effect,
		afro_hit_sound = action.afro_hit_sound,
		player_push_velocity = Vector3Box(normalized_direction * action.impact_push_speed)
	}
	local projectile_system = Managers.state.entity:system("projectile_system")

	projectile_system:create_light_weight_projectile(Unit.get_data(unit, "breed").name, unit, from_position, spread_direction, action.projectile_speed, action.projectile_max_range, collision_filter, action_data, action.light_weight_projectile_particle_effect)
end

BTStormfiendDualShootAction.anim_cb_attack_fire = function (self, unit, blackboard)
	if Managers.state.network:game() then
		local action = blackboard.action
		local data = blackboard.shoot_data
		local time_manager = Managers.time
		local t = time_manager:time("game")

		if blackboard.weapon_setup == "warpfire_thrower" then
			if data.firewall_start_position then
				BTStormfiendDualShootAction:create_firewall(unit, data)
			end

			local world = blackboard.world
			local attack_arm = data.attack_arm
			local node_name = action.muzzle_nodes[attack_arm]
			local event = action.beam_sfx_start_event
			local audio_system = Managers.state.entity:system("audio_system")

			audio_system:play_audio_unit_event(event, unit, node_name)
		elseif blackboard.weapon_setup == "ratling_gun" then
			data.shoot_start = t
			data.shoot_duration = 2
			data.shots_fired = 0
			data.time_between_shots_at_start = 1 / action.fire_rate_at_start
			data.time_between_shots_at_end = 1 / action.fire_rate_at_end
			data.max_fire_rate_at_percentage_modifier = 1 / action.max_fire_rate_at_percentage
			data.current_gun_aim_position = Vector3Box(POSITION_LOOKUP[blackboard.target_unit])
		end

		data.is_firing = true
		data.stop_firing_t = t + action.firing_time
	end
end

BTStormfiendDualShootAction.anim_cb_attack_start = function (self, unit, blackboard)
	data.attack_started = true
end

return
