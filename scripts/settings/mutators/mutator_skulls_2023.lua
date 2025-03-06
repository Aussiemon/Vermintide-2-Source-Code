-- chunkname: @scripts/settings/mutators/mutator_skulls_2023.lua

local PICKUP_NAME = "skulls_2023"
local EXTRA_MUTATORS_PICKUP_COUNT = 5
local EXTRA_MUTATORS = {
	"hordes_galore",
}

return {
	description = "description_mutator_skulls_2023",
	display_name = "display_name_mutator_skulls_2023",
	icon = "mutator_icon_skulls_2023",
	packages = {
		"resource_packages/dlcs/skulls_2023_event",
	},
	dialogue_settings = {
		"dialogues/generated/npc_dlc_event_skulls",
	},
	server_start_function = function (context, data)
		local pickup_system = Managers.state.entity:system("pickup_system")
		local pickup_units = {}
		local with_physics = false
		local spawn_type = "spawner"
		local primary_pickup_spawners = pickup_system.primary_pickup_spawners

		for i = 1, #primary_pickup_spawners do
			local spawner_unit = primary_pickup_spawners[i]
			local spawner_extension = ScriptUnit.extension(spawner_unit, "pickup_system")
			local position, rotation = spawner_extension:get_spawn_location_data()
			local unit = pickup_system:spawn_pickup(PICKUP_NAME, position, rotation, with_physics, spawn_type)

			pickup_units[unit] = true
		end

		local secondary_pickup_spawners = pickup_system.secondary_pickup_spawners

		for i = 1, #secondary_pickup_spawners do
			local spawner_unit = secondary_pickup_spawners[i]
			local spawner_extension = ScriptUnit.extension(spawner_unit, "pickup_system")
			local position, rotation = spawner_extension:get_spawn_location_data()
			local unit = pickup_system:spawn_pickup(PICKUP_NAME, position, rotation, with_physics, spawn_type)

			pickup_units[unit] = true
		end

		data.pickup_units = pickup_units
		data.num_skulls_picked = 0
		data.mission_giver_unit = Managers.state.unit_spawner:spawn_network_unit("units/hub_elements/empty", "dialogue_node", {
			dialogue_system = {
				dialogue_profile = "inn_keeper",
			},
		})

		local function register_skulls_pickup_cb()
			data.num_skulls_picked = data.num_skulls_picked + 1

			if data.num_skulls_picked >= EXTRA_MUTATORS_PICKUP_COUNT then
				local mutator_handler = Managers.state.game_mode._mutator_handler

				mutator_handler:initialize_mutators(EXTRA_MUTATORS)

				for i = 1, #EXTRA_MUTATORS do
					mutator_handler:activate_mutator(EXTRA_MUTATORS[i])
				end

				local audio_system = Managers.state.entity:system("audio_system")

				audio_system:play_2d_audio_event("Play_skulls_event_mutator_extra_hordes")
				Managers.state.event:unregister("register_skulls_2023_pickup", data)
			end
		end

		data.on_skull_picked_up = register_skulls_pickup_cb

		Managers.state.event:register(data, "register_skulls_2023_pickup", "on_skull_picked_up")
	end,
	server_stop_function = function (context, data)
		if data.pickup_units then
			for unit in pairs(data.pickup_units) do
				if Unit.alive(unit) then
					Managers.state.unit_spawner:mark_for_deletion(unit)
				end
			end

			data.pickup_units = nil
		end

		if data.mission_giver_unit then
			Managers.state.unit_spawner:mark_for_deletion(data.mission_giver_unit)
		end

		Managers.state.event:unregister("register_skulls_2023_pickup", data)
	end,
}
