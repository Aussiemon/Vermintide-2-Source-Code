﻿-- chunkname: @scripts/settings/mutators/mutator_geheimnisnacht_2021.lua

local spawn_lists = {
	skaven = {
		"skaven_plague_monk",
		"skaven_clan_rat",
		"skaven_plague_monk",
		"skaven_clan_rat",
		"skaven_plague_monk",
		"skaven_clan_rat",
	},
	chaos = {
		"chaos_marauder",
		"chaos_marauder",
		"chaos_marauder",
		"chaos_marauder",
		"chaos_marauder",
	},
}
local spawn_categories = table.keys(spawn_lists)
local event_settings = {
	whitebox = {
		ritual_locations = {
			{
				0,
				0,
				0,
				0,
			},
		},
	},
	warcamp = {
		ritual_locations = {
			{
				-151.1,
				-20,
				19.15,
				0,
			},
		},
	},
	nurgle = {
		ritual_locations = {
			{
				175.1,
				-114.5,
				2.5,
				0,
			},
		},
	},
	dlc_wizards_tower = {
		ritual_locations = {
			{
				4.45,
				36.4,
				77.01,
				0,
			},
		},
	},
	dlc_bastion = {
		ritual_locations = {
			{
				109.6,
				56.7,
				-52.8,
				0,
			},
		},
	},
	dlc_dwarf_beacons = {
		ritual_locations = {
			{
				-128.2,
				-102.8,
				-15.3,
				0,
			},
		},
	},
}
local hard_mode_mutators = {
	"geheimnisnacht_2021_hard_mode",
}

local function side_objective_picked_up()
	local mutator_handler = Managers.state.game_mode._mutator_handler

	mutator_handler:initialize_mutators(hard_mode_mutators)

	for i = 1, #hard_mode_mutators do
		mutator_handler:activate_mutator(hard_mode_mutators[i])
	end
end

local function side_objective_picked_dropped()
	local mutator_handler = Managers.state.game_mode._mutator_handler

	for i = 1, #hard_mode_mutators do
		local mutator_name = hard_mode_mutators[i]
		local mutator_active = mutator_handler:has_activated_mutator(mutator_name)

		if mutator_active then
			mutator_handler:deactivate_mutator(mutator_name)
		end
	end
end

return {
	curse_package_name = "resource_packages/dlcs/geheimnisnacht_2021_event",
	description = "description_mutator_geheimnisnacht_2021",
	display_name = "display_name_mutator_geheimnisnacht_2021",
	icon = "mutator_icon_death_spirits",
	server_start_function = function (context, data)
		local level_key = Managers.state.game_mode:level_key()
		local settings = event_settings[level_key]

		if settings then
			local ritual_locations = settings.ritual_locations
			local up = Vector3.up()

			for i = 1, #ritual_locations do
				local location = ritual_locations[i]
				local pos = Vector3(location[1], location[2], location[3])
				local rot = Quaternion.axis_angle(up, math.rad(location[4]))

				data.template.spawn_ritual_ring(pos, rot)
			end

			local inventory_system = Managers.state.entity:system("inventory_system")

			inventory_system:register_event_objective("wpn_geheimnisnacht_2021_side_objective", side_objective_picked_up, side_objective_picked_dropped)
		end
	end,
	spawn_ritual_ring = function (position, rotation)
		local unit_name = "units/gameplay/ritual_site_01"
		local extension_init_data = {
			health_system = {
				damage_cap_per_hit = 1,
				health = 15,
			},
			death_system = {
				death_reaction_template = "geheimnisnacht_2021_altar",
			},
			hit_reaction_system = {
				hit_reaction_template = "level_object",
			},
		}
		local altar_unit = Managers.state.unit_spawner:spawn_network_unit(unit_name, "geheimnisnacht_2021_altar", extension_init_data, position, rotation)
		local spread = 2.5
		local idle_variations = {
			"idle_pray_01",
			"idle_pray_02",
			"idle_pray_03",
			"idle_pray_04",
			"idle_pray_05",
		}
		local optional_data_base = {
			far_off_despawn_immunity = true,
			ignore_breed_limits = true,
			spawned_func = function (unit, breed, optional_data)
				local ai_extension = ScriptUnit.extension(unit, "ai_system")

				ai_extension:set_perception("perception_regular", "pick_closest_target_with_spillover_wakeup_group")

				local blackboard = BLACKBOARDS[unit]

				if blackboard then
					blackboard.ignore_interest_points = true
					blackboard.only_trust_your_own_eyes = true
				end

				local buff_system = Managers.state.entity:system("buff_system")

				buff_system:add_buff(unit, "geheimnisnacht_2021_event_cultist_buff", unit)

				if breed == Breeds.chaos_marauder and ScriptUnit.has_extension(unit, "ai_inventory_system") then
					local network_manager = Managers.state.network
					local unit_id = network_manager:unit_game_object_id(unit)

					network_manager.network_transmit:send_rpc_all("rpc_ai_inventory_wield", unit_id, 1)
				end
			end,
		}
		local spawn_category = "event"
		local spawn_type = "event"
		local faction = spawn_categories[math.random(#spawn_categories)]
		local spawn_list = spawn_lists[faction]
		local num_cultists = #spawn_list
		local spawn_animation
		local conflict_director = Managers.state.conflict
		local forward = Vector3.forward() * spread
		local up = Vector3.up()
		local rot_offset = Quaternion.axis_angle(up, math.pi)
		local angle_increment = math.pi * 2 / num_cultists
		local group_data = {
			template = "geheimnisnacht_2021_altar_cultists",
			id = Managers.state.entity:system("ai_group_system"):generate_group_id(),
			size = num_cultists,
		}

		for i = 1, num_cultists do
			local breed = Breeds[spawn_list[i]]
			local optional_data = table.shallow_copy(optional_data_base)

			optional_data.idle_animation = idle_variations[math.random(#idle_variations)]

			local spawn_rot = Quaternion.multiply(rotation, Quaternion.axis_angle(up, angle_increment * (i - 1)))
			local spawn_pos = position + Quaternion.rotate(spawn_rot, forward)

			spawn_rot = Quaternion.multiply(spawn_rot, rot_offset)

			conflict_director:spawn_queued_unit(breed, Vector3Box(spawn_pos), QuaternionBox(spawn_rot), spawn_category, spawn_animation, spawn_type, optional_data, group_data)
		end

		local altar_extension = ScriptUnit.extension(altar_unit, "props_system")

		altar_extension:assign_cultist_group_id(group_data.id)
		altar_extension:setup_faction(faction)
	end,
}
