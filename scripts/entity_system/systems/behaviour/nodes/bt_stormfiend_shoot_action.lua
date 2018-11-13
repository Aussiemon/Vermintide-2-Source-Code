require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTStormfiendShootAction = class(BTStormfiendShootAction, BTNode)

BTStormfiendShootAction.init = function (self, ...)
	BTStormfiendShootAction.super.init(self, ...)
end

BTStormfiendShootAction.name = "BTStormfiendShootAction"

local function debug_print(...)
	if script_data.debug_stormfiend then
		print("BTStormfiendShootAction:", ...)
	end
end

local SPHERE_CAST_RADIUS = 0.4
local SPHERE_CAST_MAX_NUM_HITS = 10

BTStormfiendShootAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	local world = blackboard.world
	blackboard.action = action
	blackboard.active_node = BTStormfiendShootAction
	blackboard.attack_finished = false
	blackboard.shoot_data = blackboard.shoot_data or {}
	blackboard.physics_world = blackboard.physics_world or World.get_data(world, "physics_world")
	blackboard.attacking_target = blackboard.target_unit

	if self:init_attack(unit, blackboard, action, t) then
		local data = blackboard.shoot_data
		blackboard.anim_locked = t + action.attack_times[data.attack_animation]
		blackboard.move_state = "attacking"
		blackboard.attack_aborted = false
		blackboard.keep_target = true
		blackboard.find_new_shoot_position = nil

		self:set_global_environment_intensity(unit, blackboard.group_blackboard, action)

		if action.use_demo_flow_event then
			AiBreedSnippets.on_stormfiend_demo_shoot(unit, blackboard)
		end
	else
		blackboard.attack_aborted = true

		if not blackboard.navigation_extension:is_following_path() then
			blackboard.find_new_shoot_position = true
		end

		debug_print("ATTACK WAS NOT OK [Aborting]")
	end
end

BTStormfiendShootAction.set_global_environment_intensity = function (self, unit, group_blackboard, action)
	local max_intensity = action.environment_max_intensity
	local old_intensity = group_blackboard.firewall_environment_intensity or 0
	local new_intensity = math.min(old_intensity + action.environment_intensity_increase_per_firewall, max_intensity)
	local sound_parameter = action.global_sound_parameter
	local audio_system = Managers.state.entity:system("audio_system")

	audio_system:set_global_parameter_with_lerp(sound_parameter, new_intensity)

	local percentage_taken = new_intensity / max_intensity
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local parameter_id = NetworkLookup.global_parameter_names[sound_parameter]

	network_transmit:send_rpc_clients("rpc_client_audio_set_global_parameter_with_lerp", parameter_id, percentage_taken)

	group_blackboard.firewall_environment_intensity = new_intensity
end

BTStormfiendShootAction._calculate_attack_animation = function (self, right_vector, forward_vector, dir, attack_anims)
	local right_dot = Vector3.dot(right_vector, dir)
	local fwd_dot = Vector3.dot(forward_vector, dir)
	local abs_right = math.abs(right_dot)
	local abs_fwd = math.abs(fwd_dot)
	local animation_driven_rotation, anim, arm = nil
	local is_left_or_right = abs_fwd < abs_right

	if is_left_or_right and right_dot > 0.5 then
		arm = "attack_right"
		anim = attack_anims.right[arm]
		animation_driven_rotation = true
	elseif is_left_or_right and right_dot < -0.5 then
		arm = "attack_left"
		anim = attack_anims.left[arm]
		animation_driven_rotation = true
	elseif fwd_dot > 0 then
		arm = NetworkLookup.attack_arm[math.random(1, 2)]
		anim = attack_anims.fwd[arm]
		animation_driven_rotation = false
	else
		arm = "attack_right"
		anim = attack_anims.bwd[arm]
		animation_driven_rotation = true
	end

	return anim, arm, animation_driven_rotation
end

BTStormfiendShootAction._calculate_aim = function (self, unit, unit_position, attack_arm, forward_vector, rotation_needed, blackboard, action, target_unit, target_position, target_direction)
	local muzzle_node_name = action.muzzle_nodes[attack_arm]
	local muzzle_node = Unit.node(unit, muzzle_node_name)
	local muzzle_pos = Unit.world_position(unit, muzzle_node)

	if rotation_needed then
		local angle = Vector3.flat_angle(forward_vector, target_direction)
		local rotation = Quaternion.axis_angle(Vector3.up(), angle)
		local local_muzzle_pos = muzzle_pos - unit_position
		muzzle_pos = unit_position + Quaternion.rotate(rotation, local_muzzle_pos)
	end

	local shoulder_node_name = action.shoulder_nodes[attack_arm]
	local shoulder_node = Unit.node(unit, shoulder_node_name)
	local shoulder_pos = Unit.world_position(unit, shoulder_node)
	local shoulder_to_muzzle = muzzle_pos - shoulder_pos
	local shoulder_to_muzzle_direction = Vector3.normalize(shoulder_to_muzzle)
	local shoulder_to_muzzle_length = Vector3.length(shoulder_to_muzzle)
	local physics_world = blackboard.physics_world
	local arm_collides = PhysicsWorld.immediate_raycast(physics_world, shoulder_pos, shoulder_to_muzzle_direction, shoulder_to_muzzle_length, "any", "collision_filter", "filter_ai_line_of_sight_check")

	if arm_collides then
		return nil, nil, nil
	end

	local attack_start_distance = action.start_distance
	local attack_maximum_length = action.maximum_length
	local start_position = unit_position + target_direction * attack_start_distance
	local end_check_position = start_position + target_direction * attack_maximum_length
	local above = 1
	local below = 2
	local nav_world = blackboard.nav_world
	local traverse_logic = blackboard.navigation_extension:traverse_logic()
	local attack_minimum_length = action.minimum_length
	local attack_minimum_length_sq = attack_minimum_length^2
	local within_firewall_allowed_range = attack_minimum_length_sq < Vector3.distance_squared(start_position, target_position)
	local ray_can_go_unit_to_start, ray_can_go_start_to_target = nil

	if within_firewall_allowed_range then
		ray_can_go_unit_to_start = LocomotionUtils.ray_can_go_on_mesh(nav_world, unit_position, start_position, traverse_logic, above, below)
		ray_can_go_start_to_target = ray_can_go_unit_to_start and LocomotionUtils.ray_can_go_on_mesh(nav_world, start_position, target_position, traverse_logic, above, below)
	end

	local can_hit_target = false
	local aim_start_position, aim_end_position = nil

	if ray_can_go_start_to_target then
		can_hit_target = true
	else
		local target_head_node = Unit.node(target_unit, "c_head")
		local target_head_position = Unit.world_position(target_unit, target_head_node)
		local result = PhysicsWorld.linear_sphere_sweep(physics_world, muzzle_pos, target_head_position, SPHERE_CAST_RADIUS, SPHERE_CAST_MAX_NUM_HITS, "collision_filter", "filter_enemy_player_ray_projectile", "report_initial_overlap")

		if result then
			local num_hits = #result

			for i = 1, num_hits, 1 do
				local hit = result[i]
				local actor = hit.actor
				local hit_unit = Actor.unit(actor)
				local is_character = DamageUtils.is_character(hit_unit)

				if not is_character then
					break
				elseif hit_unit == target_unit then
					can_hit_target = true
					aim_end_position = target_head_position

					break
				end
			end
		end
	end

	local firewall_start_position = nil

	if can_hit_target then
		local _, projected_start_position, _, hit_position = LocomotionUtils.raycast_on_navmesh(nav_world, start_position, end_check_position, traverse_logic, above, below)
		local end_position_distance_sq = (projected_start_position and Vector3.distance_squared(projected_start_position, hit_position)) or 0
		firewall_start_position = (attack_minimum_length_sq < end_position_distance_sq and projected_start_position) or nil
		aim_start_position = projected_start_position
		aim_end_position = aim_end_position or hit_position
	end

	local aim_start_offset = action.aim_start_offset
	aim_start_position = (aim_start_position or start_position) + target_direction * aim_start_offset

	return firewall_start_position, aim_start_position, aim_end_position
end

BTStormfiendShootAction.init_attack = function (self, unit, blackboard, action, t)
	local action = blackboard.action
	local should_switch_setup = action.switch_between_weapon_setups

	if should_switch_setup then
		local target_distance = blackboard.target_dist
		local warpfire_switch_dist = action.warpfire_switch_range
		local ratling_gun_switch_range = action.ratling_gun_switch_range

		if target_distance < warpfire_switch_dist then
			blackboard.weapon_setup = "warpfire_thrower"
		else
			blackboard.weapon_setup = "ratling_gun"
		end
	else
		blackboard.weapon_setup = action.weapon_setup or "warpfire_thrower"
	end

	local unit_position = POSITION_LOOKUP[unit]
	local attacking_target = blackboard.attacking_target
	local target_position = POSITION_LOOKUP[attacking_target]
	local target_direction = Vector3.normalize(target_position - unit_position)
	local attack_anims = action.attack_anims
	local rotation = Unit.world_rotation(unit, 0)
	local forward_vector = Quaternion.forward(rotation)
	local right_vector = Quaternion.right(rotation)
	local attack_animation, attack_arm, anim_driven = self:_calculate_attack_animation(right_vector, forward_vector, target_direction, attack_anims, unit_position)
	local firewall_start_position, aim_start_position, aim_end_position = self:_calculate_aim(unit, unit_position, attack_arm, forward_vector, anim_driven, blackboard, action, attacking_target, target_position, target_direction)
	local attack_is_ok = aim_end_position ~= nil

	if attack_is_ok then
		blackboard.navigation_extension:stop()
		blackboard.locomotion_extension:use_lerp_rotation(not anim_driven)
		LocomotionUtils.set_animation_driven_movement(unit, anim_driven)

		if anim_driven then
			local attack_anims_data = action.attack_anims_data
			local rotation_scale = AiAnimUtils.get_animation_rotation_scale(unit, target_position, attack_animation, attack_anims_data)

			LocomotionUtils.set_animation_rotation_scale(unit, rotation_scale)
		end

		local network_manager = Managers.state.network

		network_manager:anim_event(unit, "to_combat")
		network_manager:anim_event(unit, attack_animation)

		local aim_constraint_target_name = action.aim_constraint_target[attack_arm]
		local data = blackboard.shoot_data
		data.aim_start_position = Vector3Box(aim_start_position)
		data.current_aim_position = Vector3Box(aim_start_position)
		data.aim_end_position = Vector3Box(aim_end_position)
		data.firewall_start_position = (firewall_start_position and Vector3Box(firewall_start_position)) or nil
		data.direction = Vector3Box(target_direction)
		data.aim_constraint_target_var = Unit.animation_find_constraint_target(unit, aim_constraint_target_name)
		data.attack_arm = attack_arm
		data.firing_time = action.firing_time
		data.attack_animation = attack_animation
		data.aim_constraint_animations = action.aim_constraint_animations[attack_arm]
		data.hit_enemies = {}
		local game = network_manager:game()
		local go_id = Managers.state.unit_storage:go_id(unit)

		if game and go_id then
			local attack_arm_id = NetworkLookup.attack_arm[attack_arm]

			GameSession.set_game_object_field(game, go_id, "attack_arm", attack_arm_id)
		end

		local attack_rotation = LocomotionUtils.look_at_position_flat(unit, aim_start_position)
		blackboard.attack_rotation = QuaternionBox(attack_rotation)
		blackboard.attack_started_at_t = t
		local bot_threats = action.bot_threats and (action.bot_threats[attack_animation] or (action.bot_threats[1] and action.bot_threats))

		if bot_threats then
			local current_threat_index = 1
			local bot_threat = bot_threats[current_threat_index]
			local bot_threat_start_time = bot_threat.start_time
			blackboard.create_bot_threat_at_t = t + bot_threat_start_time
			blackboard.current_bot_threat_index = current_threat_index
			blackboard.bot_threats_data = bot_threats
			local to_aim_end_flat = Vector3.flat(aim_end_position - unit_position)
			blackboard.bot_threat_range = Vector3.length(to_aim_end_flat) - bot_threat.offset_forward + 1.5 * SPHERE_CAST_RADIUS
		end
	end

	return attack_is_ok
end

BTStormfiendShootAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local data = blackboard.shoot_data

	if data.aim_constraint_animations then
		local network_manager = Managers.state.network
		local aim_constraint_animation = data.aim_constraint_animations.off

		network_manager:anim_event(unit, aim_constraint_animation)
	end

	self:_stop_beam_sfx(unit, blackboard, data)

	local action = blackboard.action
	local attack_arm = data.attack_arm

	if attack_arm then
		local muzzle_node_name = action.muzzle_nodes[attack_arm]
		local muzzle_node = Unit.node(unit, muzzle_node_name)

		if action.stop_shoot_sfx then
			WwiseUtils.trigger_unit_event(blackboard.world, action.stop_shoot_sfx, unit, muzzle_node)
		end
	end

	table.clear(data)
	blackboard.locomotion_extension:use_lerp_rotation(true)
	LocomotionUtils.set_animation_driven_movement(unit, false)
	LocomotionUtils.set_animation_rotation_scale(unit, 1)

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
	blackboard.attacking_target = nil
end

BTStormfiendShootAction.run = function (self, unit, blackboard, t, dt)
	if not Unit.alive(blackboard.attacking_target) or blackboard.attack_aborted then
		return "failed"
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
			elseif data.stop_firing_t <= t then
				self:_stop_beam_sfx(unit, blackboard, data)
			elseif data.stop_firing_t <= t and blackboard.shoot_sfx_id then
				WwiseWorld.stop_event(Managers.world:wwise_world(blackboard.world), blackboard.shoot_sfx_id)

				blackboard.shoot_sfx_id = nil
			end
		end

		local create_bot_threat_at_t = blackboard.create_bot_threat_at_t

		if create_bot_threat_at_t and create_bot_threat_at_t < t then
			local attack_rotation = blackboard.attack_rotation:unbox()
			local bot_threats = blackboard.bot_threats_data
			local current_bot_threat_index = blackboard.current_bot_threat_index
			local current_bot_threat = bot_threats[current_bot_threat_index]
			local bot_threat_range = blackboard.bot_threat_range

			self:_create_bot_aoe_threat(unit, attack_rotation, current_bot_threat, bot_threat_range)

			local next_bot_threat_index = current_bot_threat_index + 1
			local next_bot_threat = bot_threats[next_bot_threat_index]

			if next_bot_threat then
				local attack_started_at_t = blackboard.attack_started_at_t
				blackboard.create_bot_threat_at_t = attack_started_at_t + next_bot_threat.start_time
				blackboard.current_bot_threat_index = next_bot_threat_index
			else
				blackboard.create_bot_threat_at_t = nil
				blackboard.current_bot_threat_index = nil
			end
		end

		if blackboard.attack_finished then
			blackboard.attack_finished = nil
			local network_manager = Managers.state.network
			local aim_constraint_animation = data.aim_constraint_animations.off

			network_manager:anim_event(unit, aim_constraint_animation)

			data.aim_constraint_animations = nil
		end

		return "running"
	else
		return "done"
	end
end

BTStormfiendShootAction._calculate_oobb_collision = function (self, bot_threat, bot_threat_range, self_pos, self_rot)
	local range = bot_threat_range
	local height = bot_threat.height
	local width = bot_threat.width
	local offset_up = bot_threat.offset_up
	local offset_forward = bot_threat.offset_forward
	local half_width = width * 0.5
	local half_range = range * 0.5
	local half_height = height * 0.5
	local size = Vector3(half_width, half_range, half_height)
	local forward = Quaternion.rotate(self_rot, Vector3.forward()) * (offset_forward + half_range)
	local up = Vector3.up() * (offset_up + half_height)
	local oobb_pos = self_pos + forward + up

	return oobb_pos, self_rot, size
end

BTStormfiendShootAction._create_bot_aoe_threat = function (self, unit, attack_rotation, bot_threat, bot_threat_range)
	local bot_threat_duration = bot_threat.duration
	local unit_position = POSITION_LOOKUP[unit]
	local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
	local obstacle_position, obstacle_rotation, obstacle_size = self:_calculate_oobb_collision(bot_threat, bot_threat_range, unit_position, attack_rotation)

	ai_bot_group_system:aoe_threat_created(obstacle_position, "oobb", obstacle_size, obstacle_rotation, bot_threat_duration)
end

BTStormfiendShootAction.create_firewall = function (self, unit, blackboard, data)
	local start_pos = data.firewall_start_position:unbox()
	local nav_world = blackboard.nav_world
	local success, z = GwNavQueries.triangle_from_position(nav_world, start_pos, 1, 1)

	if success then
		start_pos = Vector3.copy(start_pos)
		start_pos.z = z
	else
		start_pos = GwNavQueries.inside_position_from_outside_position(nav_world, start_pos, 3, 3, 1, 1)
	end

	if not start_pos then
		return
	end

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

BTStormfiendShootAction.shoot_hit_check = function (self, unit, blackboard)
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

	if result then
		local immune_breeds = action.immune_breeds
		local num_hits = #result

		for i = 1, num_hits, 1 do
			local hit = result[i]
			local actor = hit.actor
			local hit_unit = Actor.unit(actor)
			local hit_position = hit.position
			local is_character = DamageUtils.is_character(hit_unit)

			if not is_character then
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

						blackboard.has_dealt_burn_damage = true
					end
				elseif breed and not immune_breeds[breed.name] and not hit_enemies[hit_unit] then
					local attacker_unit = unit
					local armor_type = breed.armor_category or 1
					local damage_type = action.damage_type
					local damage = action.damage[armor_type]
					local damage_direction = data.direction:unbox()
					local damage_source = blackboard.breed.name

					DamageUtils.add_damage_network(hit_unit, attacker_unit, damage, "torso", damage_type, hit_position, damage_direction, damage_source)

					hit_enemies[hit_unit] = true
				end
			end
		end
	end
end

BTStormfiendShootAction._stop_beam_sfx = function (self, unit, blackboard, shoot_data)
	local action = blackboard.action
	local attack_arm = shoot_data.attack_arm
	local node_name = action.muzzle_nodes[attack_arm]
	local event = action.beam_sfx_stop_event
	local audio_system = Managers.state.entity:system("audio_system")

	audio_system:play_audio_unit_event(event, unit, node_name)
end

BTStormfiendShootAction._fire_from_position_direction = function (self, unit, blackboard, data, dt)
	local action = blackboard.action
	local attack_arm = data.attack_arm
	local node_name = action.muzzle_nodes[attack_arm]
	local muzzle_node = Unit.node(unit, node_name)
	local muzzle_pos = Unit.world_position(unit, muzzle_node)
	local unit_spine_pos = Unit.world_position(blackboard.attacking_target, Unit.node(blackboard.attacking_target, "j_spine"))
	local target_position = unit_spine_pos
	local current_pos = data.current_gun_aim_position:unbox()
	local lerp_value = math.min(dt * 6, 1)
	local position = Vector3.lerp(current_pos, target_position, lerp_value)
	local direction = Vector3.normalize(position - muzzle_pos)

	data.current_gun_aim_position:store(position)

	local fire_pos = muzzle_pos - Vector3.normalize(direction) * 1.25

	return fire_pos, direction
end

BTStormfiendShootAction._update_ratling_gun = function (self, unit, blackboard, t, dt)
	local data = blackboard.shoot_data
	local time_in_shoot_action = t - data.shoot_start
	local percentage_in_shoot_action = math.clamp(time_in_shoot_action / data.shoot_duration * data.max_fire_rate_at_percentage_modifier, 0, 1)
	local current_time_between_shots = math.lerp(data.time_between_shots_at_start, data.time_between_shots_at_end, percentage_in_shoot_action)
	local shots_to_fire = (math.floor(time_in_shoot_action / current_time_between_shots) + 1) - data.shots_fired

	for i = 1, shots_to_fire, 1 do
		data.shots_fired = data.shots_fired + 1

		self:_shoot_ratling_gun(unit, blackboard, t, dt)
	end
end

BTStormfiendShootAction._shoot_ratling_gun = function (self, unit, blackboard, t, dt)
	local action = blackboard.action
	local two_pi = math.pi * 2
	local data = blackboard.shoot_data
	local world = blackboard.world
	local physics_world = World.get_data(world, "physics_world")
	local light_weight_projectile_template_name = action.light_weight_projectile_template_name
	local light_weight_projectile_template = LightWeightProjectiles[light_weight_projectile_template_name]
	local from_position, direction = self:_fire_from_position_direction(unit, blackboard, data, dt)
	local normalized_direction = Vector3.normalize(direction)
	local spread_angle = Math.random() * light_weight_projectile_template.spread
	local dir_rot = Quaternion.look(normalized_direction, Vector3.up())
	local pitch = Quaternion(Vector3.right(), spread_angle)
	local roll = Quaternion(Vector3.forward(), Math.random() * two_pi)
	local spread_rot = Quaternion.multiply(Quaternion.multiply(dir_rot, roll), pitch)
	local spread_direction = Quaternion.forward(spread_rot)
	local distance = 40
	local collision_filter = "filter_enemy_player_ray_projectile"
	local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
	local power_level = light_weight_projectile_template.attack_power_level[difficulty_rank]
	local action_data = {
		attack_template = light_weight_projectile_template.attack_template,
		power_level = power_level,
		damage_profile = light_weight_projectile_template.damage_profile,
		hit_effect = light_weight_projectile_template.hit_effect,
		afro_hit_sound = light_weight_projectile_template.afro_hit_sound,
		player_push_velocity = Vector3Box(normalized_direction * light_weight_projectile_template.impact_push_speed)
	}
	local attack_arm = data.attack_arm
	local node_name = action.muzzle_nodes[attack_arm]
	local muzzle_node = Unit.node(unit, node_name)

	if action.shoot_sfx and not blackboard.shoot_sfx_id then
		blackboard.shoot_sfx_id = WwiseUtils.trigger_unit_event(blackboard.world, action.shoot_sfx, unit, muzzle_node)
	end

	local projectile_system = Managers.state.entity:system("projectile_system")

	projectile_system:create_light_weight_projectile(Unit.get_data(unit, "breed").name, unit, from_position, spread_direction, light_weight_projectile_template.projectile_speed, light_weight_projectile_template.projectile_max_range, collision_filter, action_data, light_weight_projectile_template.light_weight_projectile_particle_effect)
end

BTStormfiendShootAction.anim_cb_attack_fire = function (self, unit, blackboard)
	if Managers.state.network:game() then
		local action = blackboard.action
		local data = blackboard.shoot_data
		local time_manager = Managers.time
		local t = time_manager:time("game")

		if blackboard.weapon_setup == "warpfire_thrower" then
			if data.firewall_start_position then
				BTStormfiendShootAction:create_firewall(unit, blackboard, data)
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
			data.current_gun_aim_position = Vector3Box(POSITION_LOOKUP[blackboard.attacking_target])
		end

		data.is_firing = true
		data.stop_firing_t = t + action.firing_time
	end
end

BTStormfiendShootAction.anim_cb_attack_start = function (self, unit, blackboard)
	local data = blackboard.shoot_data

	if Managers.state.network:game() and data and data.aim_constraint_animations then
		local data = blackboard.shoot_data
		local network_manager = Managers.state.network
		local aim_constraint_animation = data.aim_constraint_animations.on

		network_manager:anim_event(unit, aim_constraint_animation)

		data.attack_started = true
	end
end

BTStormfiendShootAction._debug_firewall = function (self, minimum_length, start_position, wanted_end_pos, projected_start_pos, projected_end_pos)
	if script_data.debug_stormfiend then
		local drawer = Managers.state.debug:drawer({
			mode = "retained",
			name = "BTStormfiendShootAction"
		})
		local success_color = Colors.get("green")
		local neutral_color = Colors.get("yellow")
		local fail_color = Colors.get("red")
		local distance = (projected_start_pos and Vector3.distance(projected_start_pos, projected_end_pos)) or 0
		local debug_start_pos = projected_start_pos or start_position
		local debug_end_pos = projected_end_pos or wanted_end_pos
		local to_wanted_pos = wanted_end_pos - debug_start_pos

		drawer:sphere(debug_start_pos, 0.25, (projected_start_pos and success_color) or fail_color)
		drawer:vector(debug_start_pos, to_wanted_pos, neutral_color)
		drawer:sphere(debug_end_pos, 0.25, (minimum_length < distance and success_color) or fail_color)
		debug_print("FIREWALL DISTANCE", distance, "MINIMUM DISTANCE", minimum_length)
	end
end

BTStormfiendShootAction._debug_fire_beam = function (self, start_position, end_position, success, stop_hit_index, hits, draw_mode)
	if script_data.debug_stormfiend then
		local drawer, success_color, fail_color, normal_color, stop_color, disabled_color = nil

		if draw_mode == "retained" then
			fail_color = Colors.get("red")
			success_color = Colors.get("green")
			disabled_color = Colors.get("gray")
			stop_color = Colors.get("dark_orange")
			normal_color = Colors.get("gold")
			drawer = Managers.state.debug:drawer({
				mode = "retained",
				name = "BTStormfiendShootAction"
			})
		else
			fail_color = Colors.get("indian_red")
			success_color = Colors.get("light_green")
			disabled_color = Colors.get("light_gray")
			stop_color = Colors.get("orange")
			normal_color = Colors.get("yellow")
			drawer = QuickDrawer
		end

		drawer:sphere(start_position, SPHERE_CAST_RADIUS, (success and success_color) or fail_color)
		drawer:line(start_position, end_position, (success and success_color) or fail_color)
		drawer:sphere(end_position, SPHERE_CAST_RADIUS, (success and success_color) or fail_color)

		if hits then
			local num_hits = #hits
			local ray_direction = Vector3.normalize(end_position - start_position)

			for i = 1, num_hits, 1 do
				local hit = hits[i]
				local distance = hit.distance
				local hit_position_world = hit.position
				local hit_position_along_ray = start_position + ray_direction * distance
				local color = nil

				if stop_hit_index == nil or i < stop_hit_index then
					color = normal_color
				elseif i == stop_hit_index then
					color = stop_color
				else
					color = disabled_color
				end

				drawer:sphere(hit_position_along_ray, SPHERE_CAST_RADIUS, color)
				drawer:sphere(hit_position_world, 0.05, color)
			end
		end
	end
end

BTStormfiendShootAction._debug_colliding_arm = function (self, shoulder_position, muzzle_position)
	if script_data.debug_stormfiend then
		local drawer = Managers.state.debug:drawer({
			mode = "retained",
			name = "BTStormfiendShootAction"
		})

		drawer:sphere(shoulder_position, 0.1, Colors.get("black"))
		drawer:line(shoulder_position, muzzle_position, Colors.get("black"))
		drawer:sphere(muzzle_position, 0.1, Colors.get("black"))
	end
end

return
