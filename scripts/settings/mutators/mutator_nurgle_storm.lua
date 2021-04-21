return {
	description = "description_nurgle_storm",
	icon = "mutator_icon_nurgle_storm",
	display_name = "display_name_nurgle_storm",
	server_initialize_function = function (context, data)
		data.spawn_nurgle_storm_at = Managers.time:time("game") + 30
		data.vortex_template_name = "nurgle_storm_mutator"
		data.vortex_template = VortexTemplates[data.vortex_template_name]
		data.inner_decal_unit_name = "units/decals/decal_vortex_circle_inner"
		data.outer_decal_unit_name = "units/decals/decal_vortex_circle_outer"
		data.storm_spawn_position = Vector3Box()
		data.offset_spawn_distance = 20
		data.delay_between_spawns = 5
	end,
	server_update_function = function (context, data)
		local game_session = Network.game_session()

		if game_session == nil then
			return
		end

		local t = Managers.time:time("game")
		local vortex_template = data.vortex_template

		if global_is_inside_inn then
			return
		end

		if data.summoning_vortex_t and data.summoning_vortex_t < t and not Unit.alive(data.summoned_vortex_unit) then
			local breed_name = vortex_template.breed_name
			local breed = Breeds[breed_name]
			local spawn_category = "vortex"
			local optional_data = {
				prepare_func = function (breed, extension_init_data)
					extension_init_data.ai_supplementary_system = {
						vortex_template_name = data.vortex_template_name,
						inner_decal_unit = data.summoning_vortex_inner_decal_unit,
						outer_decal_unit = data.summoning_vortex_outer_decal_unit
					}
				end,
				spawned_func = function (vortex_unit, breed, optional_data)
					data.summoned_vortex_unit = vortex_unit
					local blackboard = BLACKBOARDS[vortex_unit]
					blackboard.directed_wander_position_boxed = data.directed_wander_position_boxed
				end
			}
			local spawn_pos = data.storm_spawn_position:unbox()

			Managers.state.conflict:spawn_queued_unit(breed, Vector3Box(spawn_pos), QuaternionBox(Quaternion.identity()), spawn_category, nil, nil, optional_data)

			data.summoning_vortex_t = nil
		elseif Unit.alive(data.summoned_vortex_unit) then
			data.spawn_nurgle_storm_at = t + data.delay_between_spawns
		elseif data.spawn_nurgle_storm_at < t then
			local conflict_director = Managers.state.conflict
			local nav_world = Managers.state.entity:system("ai_system"):nav_world()
			local spawn_ahead = math.random() > 0.5
			local main_path_info = conflict_director.main_path_info
			local player_unit = (spawn_ahead and main_path_info.ahead_unit) or main_path_info.behind_unit
			local offset_spawn_distance = data.offset_spawn_distance
			local storm_spawn_position, player_travel_dist = nil

			if player_unit then
				local player_info = conflict_director.main_path_player_info[player_unit]
				player_travel_dist = player_info.travel_dist
				local dist = math.max(player_travel_dist + offset_spawn_distance * ((spawn_ahead and 1) or -1), 0)
				local wanted_position = MainPathUtils.point_on_mainpath(nil, dist)
				storm_spawn_position = wanted_position and LocomotionUtils.pos_on_mesh(nav_world, wanted_position, 1, 1)

				if not storm_spawn_position and wanted_position then
					local p = GwNavQueries.inside_position_from_outside_position(nav_world, wanted_position, 6, 6, 8, 0.5)

					if p then
						storm_spawn_position = p
					end
				end
			end

			if storm_spawn_position then
				local spawn_radius = 2
				local inner_radius_p = math.min(spawn_radius / vortex_template.full_inner_radius, 1)
				local inner_decal_unit_name = data.inner_decal_unit_name
				local inner_decal_unit = nil

				if inner_decal_unit_name then
					local inner_spawn_pose = Matrix4x4.from_quaternion_position(Quaternion.identity(), storm_spawn_position)
					local inner_radius = math.max(vortex_template.min_inner_radius, inner_radius_p * vortex_template.full_inner_radius)

					Matrix4x4.set_scale(inner_spawn_pose, Vector3(inner_radius, inner_radius, inner_radius))

					inner_decal_unit = Managers.state.unit_spawner:spawn_network_unit(inner_decal_unit_name, "network_synched_dummy_unit", nil, inner_spawn_pose)
				end

				local outer_decal_unit_name = data.outer_decal_unit_name
				local outer_decal_unit = nil

				if outer_decal_unit_name then
					local outer_spawn_pose = Matrix4x4.from_quaternion_position(Quaternion.identity(), storm_spawn_position)
					local outer_radius = math.max(vortex_template.min_outer_radius, inner_radius_p * vortex_template.full_outer_radius)

					Matrix4x4.set_scale(outer_spawn_pose, Vector3(outer_radius, outer_radius, outer_radius))

					outer_decal_unit = Managers.state.unit_spawner:spawn_network_unit(outer_decal_unit_name, "network_synched_dummy_unit", nil, outer_spawn_pose)
				end

				local directed_wander_position = MainPathUtils.point_on_mainpath(nil, player_travel_dist + offset_spawn_distance * 2 * ((spawn_ahead and -1) or 1))

				if directed_wander_position then
					data.summoning_vortex_inner_decal_unit = inner_decal_unit
					data.summoning_vortex_outer_decal_unit = outer_decal_unit
					data.summoning_vortex_t = t + 2.5

					data.storm_spawn_position:store(storm_spawn_position)

					data.spawn_nurgle_storm_at = t + 5
					data.directed_wander_position_boxed = Vector3Box(directed_wander_position)
				else
					data.spawn_nurgle_storm_at = t + 1
				end
			else
				data.spawn_nurgle_storm_at = t + 1
			end
		end
	end,
	server_stop_function = function (context, data)
		return
	end
}
