TrueFlightTemplates = TrueFlightTemplates or {}
TrueFlightTemplates.active_ability_kerillian_way_watcher = {
	retarget_on_miss = true,
	forward_search_distance_to_find_target = 5,
	target_node = "c_head",
	target_tracking_check_func = "update_towards_target",
	legitimate_target_func = "legitimate_target_keep_target",
	dot_threshold = 1,
	lerp_squared_distance_threshold = 625,
	speed_multiplier = 0.01,
	broadphase_radius = 7.5,
	find_target_func = "find_closest_highest_value_target",
	life_time_factor = 0.6,
	time_between_raycasts = 0.05,
	lerp_constant = 150,
	max_on_target_time = math.huge
}
TrueFlightTemplates.active_ability_sienna_scholar = {
	retarget_on_miss = true,
	dot_threshold = 1,
	forward_search_distance_to_find_target = 5,
	target_node = "c_head",
	target_tracking_check_func = "update_towards_target",
	legitimate_target_func = "legitimate_target_keep_target",
	broadphase_radius = 7.5,
	speed_multiplier = 0.01,
	time_between_raycasts = 0.05,
	find_target_func = "find_closest_highest_value_target",
	life_time_factor = 0.6,
	lerp_distance_threshold = 625,
	lerp_constant = 150,
	max_on_target_time = math.huge
}
TrueFlightTemplates.machinegun = {
	speed_multiplier = 0.001,
	lerp_constant = 50,
	time_between_raycasts = 0.1,
	broadphase_radius = 5,
	dot_threshold = 0.9999,
	lerp_squared_distance_threshold = 2000
}
TrueFlightTemplates.carbine = {
	speed_multiplier = 0.01,
	lerp_constant = 50,
	time_between_raycasts = 0.05,
	broadphase_radius = 5,
	dot_threshold = 0.9999,
	lerp_squared_distance_threshold = 2000
}
TrueFlightTemplates.sniper = {
	speed_multiplier = 0.01,
	lerp_constant = 50,
	time_between_raycasts = 0.05,
	broadphase_radius = 10,
	dot_threshold = 0.9999,
	lerp_squared_distance_threshold = 2000
}
TrueFlightTemplates.sorcerer_magic_missile = {
	target_tracking_check_func = "update_towards_target",
	legitimate_target_func = "legitimate_only_dot_check",
	target_node = "c_spine",
	create_bot_threat = true,
	bot_threat_at_distance = 5,
	dot_threshold = 0.9999,
	lerp_squared_distance_threshold = 2000,
	speed_multiplier = 1,
	initial_target_node = "c_spine",
	find_target_func = "find_player_target",
	target_players = true,
	time_between_raycasts = 0.1,
	lerp_constant = 50,
	lerp_modifier_func = function (distance)
		return (distance < 7 and 0.01) or 5 / distance
	end
}
TrueFlightTemplates.sorcerer_strike_missile = {
	create_bot_threat = true,
	triggered_speed_mult = 6,
	target_node = "c_spine",
	lingering_duration = 0.4,
	target_tracking_check_func = "update_towards_strike_missile_target",
	legitimate_target_func = "legitimate_only_dot_check",
	dot_threshold = 0.9999,
	lerp_squared_distance_threshold = 2000,
	speed_multiplier = 1,
	initial_target_node = "c_spine",
	find_target_func = "find_player_target",
	target_players = true,
	time_between_raycasts = 0.1,
	lerp_constant = 50,
	lerp_modifier_func = function (distance)
		return (distance < 7 and 0.01) or 3 / distance
	end,
	template_state_func = function (parent, projectile_unit, state_id, is_server)
		if state_id == 1 then
			Unit.flow_event(projectile_unit, "lua_projectile_triggered")
		elseif state_id == 2 then
			Unit.flow_event(projectile_unit, "lua_projectile_striking")
		end
	end
}
TrueFlightTemplates.sorcerer_magic_missile_ground = {
	target_tracking_check_func = "update_towards_position_target",
	dot_threshold = 0.9999,
	lerp_squared_distance_threshold = 2000,
	speed_multiplier = 1,
	find_target_func = "find_player_target",
	target_players = true,
	time_between_raycasts = 0.1,
	lerp_constant = 50,
	lerp_modifier_func = function (distance)
		return (distance < 7 and 0.01) or 5 / distance
	end
}
TrueFlightTemplates.sorcerer_slow_bomb_missile = {
	overpowered_blob_health = 5,
	target_node = "c_spine",
	target_tracking_check_func = "update_towards_slow_bomb_target",
	legitimate_target_func = "legitimate_always",
	dot_threshold = 0.9999,
	lerp_squared_distance_threshold = 2000,
	speed_multiplier = 1,
	initial_target_node = "c_spine",
	time_between_raycasts = 0.1,
	triggered_speed_mult = 3.5,
	update_after_impact = true,
	trigger_dist = 0,
	attached_life_time = 10,
	find_target_func = "find_player_target",
	target_players = true,
	death_reaction_template = "killable_projectile",
	lerp_constant = 50,
	health = {
		5,
		7,
		15,
		35,
		50,
		70,
		70,
		70
	},
	lerp_modifier_func = function (distance)
		return (distance < 5 and 1) or 5 / distance
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
			end
		end
	end,
	init_func = function (unit, world)
		local large_actor = Unit.actor(unit, "c_large")

		Actor.set_collision_enabled(large_actor, false)
	end
}
TrueFlightTemplates.sorcerer_vortex_dummy_missile = {
	speed_multiplier = 1,
	time_between_raycasts = 0.05,
	target_tracking_check_func = "update_towards_position_target",
	target_players = true,
	broadphase_radius = 7.5,
	lerp_modifier_func = function (distance, height, t)
		local max_radius = math.clamp(112.5 / (height + 0.01)^2, 0.25, 40)
		local denominator = max_radius - 0.5 * max_radius * math.abs(math.sin(0.5 * t))
		local final_value = distance / denominator

		return final_value
	end
}
local template_index = 0
TrueFlightTemplatesLookup = TrueFlightTemplatesLookup or {}

for name, template in pairs(TrueFlightTemplates) do
	template_index = template_index + 1
	template.lookup_id = template_index
	TrueFlightTemplatesLookup[template_index] = name
end

return
