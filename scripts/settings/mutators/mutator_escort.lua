-- chunkname: @scripts/settings/mutators/mutator_escort.lua

return {
	buildup_sound_global_parameter = "mutator_escort_buildup",
	description = "description_mutator_escort",
	display_name = "display_name_mutator_escort",
	end_effect_required_duration = 4.5,
	icon = "mutator_icon_escort",
	pickup_name = "mutator_statue_01",
	screenspace_effect_name = "fx/screenspace_statue_veins/screenspace_statue_veins",
	screenspace_end_effect_name = "fx/screenspace_statue_veins/screenspace_statue_veins_fade_out",
	time_until_explosion = 10,
	packages = {
		"resource_packages/mutators/mutator_escort",
	},
	is_player_carrying_pickup = function (pickup_name, side)
		local pickup_settings = AllPickups[pickup_name]
		local slot_name = pickup_settings.slot_name
		local PLAYER_AND_BOT_UNITS = side.PLAYER_AND_BOT_UNITS

		for i = 1, #PLAYER_AND_BOT_UNITS do
			local player_unit = PLAYER_AND_BOT_UNITS[i]

			if ALIVE[player_unit] then
				local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
				local slot_data = inventory_extension:get_slot_data(slot_name)
				local item_data = slot_data and slot_data.item_data
				local item_name = item_data and item_data.name

				if item_name == pickup_name then
					return true
				end
			end
		end

		return false
	end,
	create_screen_space_effect = function (template, client_data)
		local local_player = client_data.local_player
		local player_unit = local_player.player_unit

		if ALIVE[player_unit] then
			local screenspace_effect_name = template.screenspace_effect_name
			local first_person_extension = ScriptUnit.extension(player_unit, "first_person_system")

			client_data.screen_effect_id = first_person_extension:create_screen_particles(screenspace_effect_name)
			client_data.screen_effect_t = Managers.time:time("game")
		end
	end,
	remove_screen_space_effect = function (template, client_data)
		local local_player = client_data.local_player
		local player_unit = local_player.player_unit

		if ALIVE[player_unit] and client_data.screen_effect_id then
			local first_person_extension = ScriptUnit.extension(player_unit, "first_person_system")
			local screen_effect_id = client_data.screen_effect_id

			first_person_extension:destroy_screen_particles(screen_effect_id)

			local t = Managers.time:time("game")
			local duration = t - client_data.screen_effect_t
			local required_duration = template.end_effect_required_duration

			if required_duration < duration then
				local screenspace_end_effect_name = template.screenspace_end_effect_name

				first_person_extension:create_screen_particles(screenspace_end_effect_name)
			end
		end

		client_data.screen_effect_id = nil
		client_data.screen_effect_t = nil
	end,
	server_start_function = function (context, data)
		data.server = {
			escort_unit_spawned = false,
		}
		data.hero_side = Managers.state.side:get_side_from_name("heroes")
	end,
	server_update_function = function (context, data)
		local template = data.template
		local pickup_name = template.pickup_name
		local server_data = data.server
		local hero_side = data.hero_side
		local PLAYER_UNITS = hero_side.PLAYER_UNITS

		if not server_data.escort_unit_spawned and PLAYER_UNITS[1] then
			local player_unit = PLAYER_UNITS[1]
			local pickup_settings = AllPickups[pickup_name]
			local slot_name = pickup_settings.slot_name
			local item_name = pickup_settings.item_name
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")

			inventory_extension:destroy_slot(slot_name)
			inventory_extension:add_equipment(slot_name, item_name)

			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local go_id = Managers.state.unit_storage:go_id(player_unit)
			local slot_id = NetworkLookup.equipment_slots[slot_name]
			local item_id = NetworkLookup.item_names[item_name]
			local weapon_skin_id = NetworkLookup.weapon_skins["n/a"]

			network_transmit:send_rpc_clients("rpc_add_equipment", go_id, slot_id, item_id, weapon_skin_id)
			inventory_extension:wield(slot_name)

			server_data.escort_unit_spawned = true
		elseif server_data.escort_unit_spawned then
			local player_is_carrying_pickup = template.is_player_carrying_pickup(pickup_name, hero_side)

			if player_is_carrying_pickup and server_data.pickup_dropped_at_t then
				server_data.pickup_dropped_at_t = nil
				server_data.explosion_t = nil
			elseif not player_is_carrying_pickup then
				local t = Managers.time:time("game")

				if not server_data.pickup_dropped_at_t then
					server_data.pickup_dropped_at_t = t
					server_data.explosion_t = t + template.time_until_explosion
				end

				if t > server_data.explosion_t and not server_data.players_killed then
					local hero_side = data.hero_side
					local PLAYER_AND_BOT_UNITS = hero_side.PLAYER_AND_BOT_UNITS

					for i = 1, #PLAYER_AND_BOT_UNITS do
						local player_unit = PLAYER_AND_BOT_UNITS[i]

						if ALIVE[player_unit] then
							local health_extension = ScriptUnit.extension(player_unit, "health_system")

							health_extension:die()
						end
					end

					server_data.players_killed = true
				end
			end
		end
	end,
	lose_condition_function = function (context, data)
		local server_data = data.server
		local t = Managers.time:time("game")
		local delay = 2

		return server_data.explosion_t and t > server_data.explosion_t, delay
	end,
	end_zone_activation_condition_function = function (context, data)
		local server_data = data.server

		return server_data.pickup_dropped_at_t == nil
	end,
	client_start_function = function (context, data)
		local player_manager = Managers.player
		local local_player = player_manager:local_player()

		data.client = {
			escort_unit_spawned = false,
			local_player = local_player,
		}
		data.hero_side = Managers.state.side:get_side_from_name("heroes")
	end,
	client_update_function = function (context, data)
		local template = data.template
		local pickup_name = template.pickup_name
		local player_is_carrying_pickup = template.is_player_carrying_pickup(pickup_name, data.hero_side)
		local client_data = data.client

		if client_data.escort_unit_spawned then
			if player_is_carrying_pickup and client_data.pickup_dropped_at_t then
				client_data.pickup_dropped_at_t = nil
				client_data.explosion_t = nil

				template.remove_screen_space_effect(template, client_data)
			elseif not player_is_carrying_pickup then
				local t = Managers.time:time("game")

				if not client_data.pickup_dropped_at_t then
					client_data.pickup_dropped_at_t = t
					client_data.explosion_t = t + template.time_until_explosion

					template.create_screen_space_effect(template, client_data)
				end

				local sound_value = math.auto_lerp(client_data.pickup_dropped_at_t, client_data.explosion_t, 0, 1, t)
				local audio_system = Managers.state.entity:system("audio_system")

				audio_system:set_global_parameter(template.buildup_sound_global_parameter, sound_value)
			end
		elseif player_is_carrying_pickup then
			client_data.escort_unit_spawned = true
		end
	end,
	client_stop_function = function (context, data)
		local template = data.template
		local client_data = data.client

		if client_data.screen_effect_id then
			template.remove_screen_space_effect(template, client_data)
		end
	end,
}
