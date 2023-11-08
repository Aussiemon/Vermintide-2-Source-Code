local enemies_per_frame = 5
local buffed_current_index = 0
local faded_current_index = 0
local dead_units = {}

return {
	description = "weaves_shadow_mutator_desc",
	display_name = "weaves_shadow_mutator_name",
	icon = "mutator_icon_shadow_illusion",
	faded_units = {},
	linked_units = {},
	linked_units_visibility = {},
	buffed_units = {},
	buff_params = {
		external_optional_multiplier = -0.9
	},
	server_start_function = function (context, data)
		local wind_strength = Managers.weave:get_wind_strength() or 1
		local wind_settings = Managers.weave:get_active_wind_settings()
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		data.buff_system = Managers.state.entity:system("buff_system")
		data.hero_side = Managers.state.side:get_side_from_name("heroes")
		data.lantern_spawned = false
		data.light_radius = wind_settings and wind_settings.light_radius[difficulty_name][wind_strength]
	end,
	server_ai_killed_function = function (context, data, killed_unit, killer_unit, killing_blow)
		if data.template.linked_units_visibility[killed_unit] then
			local blackboard = BLACKBOARDS[killer_unit]

			if blackboard then
				local breed = blackboard.breed
				local killer_unit_is_player = breed.is_player

				if killer_unit_is_player then
					data.template.increment_challenge_stat(killer_unit)
				end
			end
		end
	end,
	increment_challenge_stat = function (player_unit)
		if ScorpionSeasonalSettings.current_season_id == 1 then
			local stat_group_name = "season_1"
			local stat_name = "weave_shadow_kill_no_shrouded"
			local player = Managers.player:owner(player_unit)

			if player.local_player then
				local statistics_db = Managers.player:statistics_db()
				local local_player = Managers.player:local_player()
				local stats_id = local_player:stats_id()

				statistics_db:increment_stat(stats_id, stat_group_name, stat_name)
			else
				local stat_group_index = NetworkLookup.statistics_group_name[stat_group_name]
				local stat_name_index = NetworkLookup.statistics[stat_name]
				local peer_id = player:network_id()

				Managers.state.network.network_transmit:send_rpc("rpc_increment_stat_group", peer_id, stat_group_index, stat_name_index)
			end
		end
	end,
	server_update_function = function (context, data, dt, t)
		local hero_side = data.hero_side
		local spawned_enemies = hero_side:enemy_units()
		local template = data.template
		local buffed_units = template.buffed_units
		local buff_params = template.buff_params
		local PLAYER_UNITS = hero_side.PLAYER_UNITS

		for i = 1, enemies_per_frame do
			buffed_current_index = buffed_current_index + 1
			local unit = spawned_enemies[buffed_current_index]
			local remove_buff = false

			if unit then
				for name, player in pairs(PLAYER_UNITS) do
					local radius = data.light_radius
					local pos = POSITION_LOOKUP[player]

					if ScriptUnit.has_extension(unit, "buff_system") and HEALTH_ALIVE[unit] then
						local unit_pos = POSITION_LOOKUP[unit]
						local dist_sq = Vector3.distance_squared(pos, unit_pos)

						if dist_sq <= radius * radius then
							remove_buff = true

							break
						end
					end
				end

				local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

				if buff_extension then
					local has_shadow_mutator_buff = buff_extension:has_buff_type("mutator_shadow_damage_reduction")

					if remove_buff then
						if has_shadow_mutator_buff and buffed_units[unit] then
							local id = buffed_units[unit]

							data.buff_system:remove_server_controlled_buff(unit, id)

							buffed_units[unit] = nil
						end
					else
						local ping_extension = ScriptUnit.has_extension(unit, "ping_system")

						if ping_extension then
							local is_pinged = ping_extension:pinged()

							if is_pinged then
								local ping_system = Managers.state.entity:system("ping_system")

								ping_system:remove_ping_from_unit(unit)
							end
						end

						if not has_shadow_mutator_buff then
							local server_buff_id = data.buff_system:add_buff(unit, "mutator_shadow_damage_reduction", unit, true)
							buffed_units[unit] = server_buff_id
						end
					end
				end
			else
				buffed_current_index = 0
			end
		end

		if #dead_units > 0 then
			table.clear(dead_units)
		end

		for buffed_unit, _ in pairs(buffed_units) do
			if not HEALTH_ALIVE[buffed_unit] then
				dead_units[#dead_units + 1] = buffed_unit
			end
		end

		for i = 1, #dead_units do
			local dead_unit = dead_units[i]
			buffed_units[dead_unit] = nil
		end
	end,
	client_start_function = function (context, data)
		data.hero_side = Managers.state.side:get_side_from_name("heroes")
		data.light_spawned = false
	end,
	client_player_respawned_function = function (context, data, spawned_unit)
		local player_unit = Managers.player:local_player().player_unit

		if spawned_unit == player_unit then
			local position = Unit.local_position(player_unit, 0)
			local rotation = Unit.local_rotation(player_unit, 0)
			local unit = World.spawn_unit(context.world, "units/weapons/player/wpn_shadow_gargoyle_head/wpn_shadow_gargoyle_head", position, rotation)
			local light = Unit.light(unit, "light")

			Light.set_falloff_end(light, data.light_radius)
			Light.set_falloff_start(light, data.light_radius - 1)
			World.link_unit(context.world, unit, 0, player_unit, 0)
		end
	end,
	client_update_function = function (context, data)
		local wind_strength = Managers.weave:get_wind_strength() or 1
		local wind_settings = Managers.weave:get_active_wind_settings()
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local hero_side = data.hero_side
		local spawned_enemies = hero_side:enemy_units()
		local fade_system = Managers.state.entity:system("fade_system")
		local template = data.template
		local faded_units = template.faded_units
		local linked_units = template.linked_units
		local linked_units_visibility = template.linked_units_visibility
		local player_manager = Managers.player
		local player_unit = player_manager:local_player().player_unit
		data.light_radius = wind_settings and wind_settings.light_radius[difficulty_name][wind_strength] or 6

		if player_unit and not data.light_spawned then
			local position = Unit.local_position(player_unit, 0)
			local rotation = Unit.local_rotation(player_unit, 0)
			local unit = World.spawn_unit(context.world, "units/weapons/player/wpn_shadow_gargoyle_head/wpn_shadow_gargoyle_head", position, rotation)
			local light = Unit.light(unit, "light")

			Light.set_falloff_end(light, data.light_radius)
			Light.set_falloff_start(light, data.light_radius - 1)
			World.link_unit(context.world, unit, 0, player_unit, 0)

			data.light_spawned = true
		end

		if not player_unit and not data.light_spawned then
			return
		end

		local camera_unit = player_manager:local_player().camera_follow_unit
		local camera_extension = ScriptUnit.has_extension(camera_unit, "camera_system")
		local observed_player = nil

		if camera_extension then
			local observed_player_id = camera_extension:get_observed_player_id()
			observed_player = observed_player_id and player_manager:players()[observed_player_id]
		end

		if observed_player and Unit.alive(observed_player.player_unit) then
			player_unit = observed_player.player_unit
		end

		for i = 1, enemies_per_frame do
			faded_current_index = faded_current_index + 1
			local unit = spawned_enemies[faded_current_index]

			if unit then
				local unit_pos = POSITION_LOOKUP[unit]
				local scalar = 1

				if not faded_units[unit] and HEALTH_ALIVE[unit] then
					fade_system:set_min_fade(unit, scalar)

					faded_units[unit] = scalar
					local projectile_linker_extension = ScriptUnit.has_extension(unit, "projectile_linker_system")

					if projectile_linker_extension then
						local world = context.world
						local effect_unit = World.spawn_unit(world, "units/fx/vfx_static_shadow_01", unit_pos)

						projectile_linker_extension:link_projectile(effect_unit, Vector3(0, 0, 0), Quaternion.identity(), 0)

						local breed = Unit.get_data(unit, "breed")

						if breed and breed.name == "skaven_warpfire_thrower" then
							Unit.flow_event(unit, "disable_vfx")
						end

						linked_units[unit] = effect_unit
						linked_units_visibility[unit] = true
					end
				end

				local radius = data.light_radius
				local pos = POSITION_LOOKUP[player_unit]
				local dist_sq = player_unit and Vector3.distance_squared(pos, unit_pos) or radius * radius
				local effect_unit = linked_units[unit]
				local effect_unit_visible = linked_units_visibility[unit]

				if dist_sq < radius * radius or not HEALTH_ALIVE[unit] then
					scalar = 0

					if effect_unit and effect_unit_visible then
						local breed = Unit.get_data(unit, "breed")

						if breed and breed.name == "skaven_warpfire_thrower" and HEALTH_ALIVE[unit] then
							Unit.flow_event(unit, "enable_vfx")
						end

						if Unit.alive(effect_unit) then
							Unit.flow_event(effect_unit, "lua_shadow_effect_off")
						end

						if Unit.alive(unit) then
							WwiseUtils.trigger_unit_event(context.world, "Play_winds_shadow_reveal_enemy", unit)
						end

						linked_units_visibility[unit] = false
					end
				elseif effect_unit and not effect_unit_visible then
					local breed = Unit.get_data(unit, "breed")

					if breed and breed.name == "skaven_warpfire_thrower" then
						Unit.flow_event(unit, "disable_vfx")
					end

					Unit.flow_event(effect_unit, "lua_shadow_effect_on")

					linked_units_visibility[unit] = true
				end

				local old_scalar = faded_units[unit]

				if scalar ~= old_scalar then
					fade_system:set_min_fade(unit, scalar)

					faded_units[unit] = scalar
				end
			else
				faded_current_index = 0
			end
		end

		if #dead_units > 0 then
			table.clear(dead_units)
		end

		for faded_unit, _ in pairs(faded_units) do
			if not HEALTH_ALIVE[faded_unit] then
				dead_units[#dead_units + 1] = faded_unit
			end
		end

		for i = 1, #dead_units do
			local dead_unit = dead_units[i]
			faded_units[dead_unit] = nil
			local linked_unit = linked_units[dead_unit]

			if Unit.alive(linked_unit) then
				World.destroy_unit(context.world, linked_unit)
			end
		end
	end
}
