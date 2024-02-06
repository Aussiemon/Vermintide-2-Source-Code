-- chunkname: @scripts/unit_extensions/weapons/projectiles/true_flight_templates.lua

TrueFlightTemplates = TrueFlightTemplates or {}
TrueFlightTemplates.active_ability_kerillian_way_watcher = {
	broadphase_radius = 7.5,
	dont_target_friendly = true,
	dot_threshold = 1,
	find_target_func = "find_closest_highest_value_target",
	forward_search_distance_to_find_target = 5,
	keep_target_on_miss_check_func = "legitimate_only_dot_check",
	legitimate_target_func = "legitimate_target_keep_target",
	lerp_constant = 150,
	lerp_squared_distance_threshold = 625,
	life_time_factor = 0.6,
	retarget_on_miss = true,
	speed_multiplier = 0.01,
	target_node = "c_head",
	target_tracking_check_func = "update_towards_target",
	time_between_raycasts = 0.05,
	max_on_target_time = math.huge,
}
TrueFlightTemplates.active_ability_sienna_scholar = {
	broadphase_radius = 7.5,
	dot_threshold = 1,
	find_target_func = "find_closest_highest_value_target",
	forward_search_distance_to_find_target = 5,
	keep_target_on_miss_check_func = "legitimate_only_dot_check",
	legitimate_target_func = "legitimate_target_keep_target",
	lerp_constant = 150,
	lerp_distance_threshold = 625,
	life_time_factor = 0.6,
	retarget_on_miss = true,
	speed_multiplier = 0.01,
	target_node = "c_head",
	target_tracking_check_func = "update_towards_target",
	time_between_raycasts = 0.05,
	max_on_target_time = math.huge,
}
TrueFlightTemplates.machinegun = {
	broadphase_radius = 5,
	dot_threshold = 0.9999,
	lerp_constant = 50,
	lerp_squared_distance_threshold = 2000,
	speed_multiplier = 0.001,
	time_between_raycasts = 0.1,
}
TrueFlightTemplates.carbine = {
	broadphase_radius = 5,
	dot_threshold = 0.9999,
	lerp_constant = 50,
	lerp_squared_distance_threshold = 2000,
	speed_multiplier = 0.01,
	time_between_raycasts = 0.05,
}
TrueFlightTemplates.sniper = {
	broadphase_radius = 10,
	dot_threshold = 0.9999,
	lerp_constant = 50,
	lerp_squared_distance_threshold = 2000,
	speed_multiplier = 0.01,
	time_between_raycasts = 0.05,
}
TrueFlightTemplates.sorcerer_magic_missile = {
	bot_threat_at_distance = 5,
	create_bot_threat = true,
	dot_threshold = 0.9999,
	find_target_func = "find_player_target",
	initial_target_node = "c_spine",
	legitimate_target_func = "legitimate_only_dot_check",
	lerp_constant = 50,
	lerp_squared_distance_threshold = 2000,
	speed_multiplier = 1,
	target_node = "c_spine",
	target_players = true,
	target_tracking_check_func = "update_towards_target",
	time_between_raycasts = 0.1,
	lerp_modifier_func = function (distance)
		return distance < 7 and 0.01 or 5 / distance
	end,
}
TrueFlightTemplates.sorcerer_strike_missile = {
	create_bot_threat = true,
	dot_threshold = 0.9999,
	find_target_func = "find_player_target",
	initial_target_node = "c_spine",
	legitimate_target_func = "legitimate_only_dot_check",
	lerp_constant = 50,
	lerp_squared_distance_threshold = 2000,
	lingering_duration = 0.4,
	speed_multiplier = 1,
	target_node = "c_spine",
	target_players = true,
	target_tracking_check_func = "update_towards_strike_missile_target",
	time_between_raycasts = 0.1,
	triggered_speed_mult = 6,
	lerp_modifier_func = function (distance)
		return distance < 7 and 0.01 or 3 / distance
	end,
	template_state_func = function (parent, projectile_unit, state_id, is_server)
		if state_id == 1 then
			Unit.flow_event(projectile_unit, "lua_projectile_triggered")
		elseif state_id == 2 then
			Unit.flow_event(projectile_unit, "lua_projectile_striking")
		end
	end,
}
TrueFlightTemplates.sorcerer_magic_missile_ground = {
	dot_threshold = 0.9999,
	find_target_func = "find_player_target",
	lerp_constant = 50,
	lerp_squared_distance_threshold = 2000,
	speed_multiplier = 1,
	target_players = true,
	target_tracking_check_func = "update_towards_position_target",
	time_between_raycasts = 0.1,
	lerp_modifier_func = function (distance)
		return distance < 7 and 0.01 or 5 / distance
	end,
}
TrueFlightTemplates.sorcerer_slow_bomb_missile = {
	attached_life_time = 10,
	death_reaction_template = "killable_projectile",
	dot_threshold = 0.9999,
	find_target_func = "find_player_target",
	initial_target_node = "c_spine",
	legitimate_target_func = "legitimate_always",
	lerp_constant = 50,
	lerp_squared_distance_threshold = 2000,
	overpowered_blob_health = 5,
	speed_multiplier = 1.5,
	target_node = "c_spine",
	target_players = true,
	target_tracking_check_func = "update_towards_slow_bomb_target",
	time_between_raycasts = 0.1,
	trigger_dist = 0.5,
	triggered_speed_mult = 3.5,
	update_after_impact = true,
	health = {
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
	},
	lerp_modifier_func = function (distance)
		return distance < 5 and 1 or 5 / distance
	end,
	template_state_func = function (parent, projectile_unit, state_id, is_server, hit_unit)
		if state_id == 1 then
			Unit.flow_event(projectile_unit, "lua_projectile_triggered")
		elseif state_id == 2 then
			local parent_unit = hit_unit

			if not parent_unit then
				return
			end

			if is_server then
				-- Nothing
			end
		end
	end,
	init_func = function (unit, world)
		local large_actor = Unit.actor(unit, "c_large")

		Actor.set_collision_enabled(large_actor, false)
	end,
}
TrueFlightTemplates.sorcerer_vortex_dummy_missile = {
	broadphase_radius = 7.5,
	speed_multiplier = 1,
	target_players = true,
	target_tracking_check_func = "update_towards_position_target",
	time_between_raycasts = 0.05,
	lerp_modifier_func = function (distance, height, t)
		local max_radius = math.clamp(112.5 / (height + 0.01)^2, 0.25, 40)
		local denominator = max_radius - 0.5 * max_radius * math.abs(math.sin(0.5 * t))
		local final_value = distance / denominator

		return final_value
	end,
}
TrueFlightTemplates.necromancer_trapped_soul = {
	broadphase_radius = 7.5,
	dont_target_friendly = true,
	dont_target_patrols = true,
	dot_threshold = 0.9999,
	ignore_dead = true,
	lerp_distance_threshold = 625,
	retarget_broadphase_offset = 0,
	speed_multiplier = 6.5,
	target_node = "c_neck",
	target_players = false,
	target_tracking_check_func = "update_towards_target",
	time_between_raycasts = 0.1,
	valid_target_dot = 0.99,
	max_on_target_time = math.huge,
	lerp_modifier_func = function (distance, height, t)
		return 0.75
	end,
	init_func = function (unit, world, seed, custom_data)
		custom_data.seed = seed
		custom_data.spin_dir = 1 - bit.band(seed, 128) / 64
		seed, custom_data.wobble_min = math.next_random_range(seed, 0.3, 0.3)
		seed, custom_data.wobble_max = math.next_random_range(seed, 0.3, 0.4)
		seed, custom_data.wobble_speed = math.next_random_range(seed, 2.5, 5)
		seed, custom_data.wobble_vertical_mult = math.next_random_range(seed, 0.7, 1)
		seed, custom_data.wobble_horizontal_mult = math.next_random_range(seed, 1, 1.2)
		seed, custom_data.wobble_stabiliztion_speed = math.next_random_range(seed, 0.3, 0.5)
	end,
	update_unit_position = function (unit, position, rotation, custom_data, locomotion_ext)
		local target_vector = Vector3Box.unbox(locomotion_ext.target_vector_boxed)
		local time_lived = locomotion_ext.t - locomotion_ext.spawn_time
		local current_wobble_scale = custom_data.lerped_wobble_scale or 1
		local dist_from_target = ALIVE[locomotion_ext.target_unit] and Vector3.distance(POSITION_LOOKUP[locomotion_ext.target_unit], position) or 0
		local wanted_wobble_scale = math.remap(1, 5, 0, 1, math.clamp(dist_from_target, 1, 5))
		local dt = locomotion_ext.dt
		local dist_from_enemy_scale = math.clamp01(current_wobble_scale + dt * math.sign(wanted_wobble_scale - current_wobble_scale))

		custom_data.lerped_wobble_scale = dist_from_enemy_scale

		local projectile_speed_scaler = locomotion_ext.speed
		local amount_t = math.easeCubic(math.clamp(time_lived * custom_data.wobble_stabiliztion_speed * projectile_speed_scaler, 0, 1))
		local transition_scale = math.clamp(amount_t * 100, 0, 1)
		local amount_mult = math.lerp(custom_data.wobble_max, custom_data.wobble_min, amount_t) * transition_scale * dist_from_enemy_scale
		local vertical_wobble_amount = amount_mult * custom_data.wobble_vertical_mult
		local horizontal_wobble_amount = amount_mult * custom_data.wobble_horizontal_mult
		local wobble_speed = custom_data.wobble_speed * custom_data.spin_dir
		local phase_offset = 2.007128639793479
		local local_wobble_offset = Vector3(math.sin(time_lived * wobble_speed - phase_offset) * horizontal_wobble_amount, 0, math.cos(time_lived * wobble_speed - phase_offset) * vertical_wobble_amount)
		local wobble_offset = Quaternion.rotate(Quaternion.look(target_vector), local_wobble_offset)
		local wobble_dist = horizontal_wobble_amount < math.epsilon and 0 or Vector3.dot(Vector3.right(), local_wobble_offset) / horizontal_wobble_amount
		local rot_offset = Quaternion.axis_angle(Vector3.forward(), -wobble_dist * math.pi * 0.1)
		local fwd_rot = Quaternion.look(target_vector)

		rot_offset = Quaternion.multiply(fwd_rot, rot_offset)

		Unit.set_local_rotation(unit, 0, rot_offset)
		Unit.set_local_position(unit, 0, position + wobble_offset)
	end,
}

local template_index = 0

TrueFlightTemplatesLookup = TrueFlightTemplatesLookup or {}

for name, template in pairs(TrueFlightTemplates) do
	template_index = template_index + 1
	template.lookup_id = template_index
	TrueFlightTemplatesLookup[template_index] = name
end
