local skull_unit = "units/props/skull_of_fury"
local spawn_z_offset = 2
local buff_name = "curse_skulls_of_fury"
local BASE_SPAWN_CHANCE = 0
local breed_additional_spawn_chance = {
	skaven_plague_monk = 0.05,
	chaos_raider = 0.1,
	chaos_marauder = 0.05,
	beastmen_bestigor = 0.2,
	chaos_berzerker = 0.05,
	skaven_clan_rat_with_shield = 0.05,
	skaven_stormfiend = 0.5,
	chaos_marauder_with_shield = 0.05,
	beastmen_minotaur = 0.5,
	chaos_fanatic = 0.05,
	skaven_clan_rat = 0.05,
	beastmen_ungor = 0.05,
	chaos_warrior = 0.2,
	skaven_rat_ogre = 0.5,
	beastmen_ungor_archer = 0.05,
	chaos_troll = 0.5,
	chaos_spawn = 0.5,
	skaven_storm_vermin_commander = 0.1,
	skaven_storm_vermin = 0.05,
	beastmen_gor = 0.05,
	skaven_storm_vermin_with_shield = 0.1
}

return {
	description = "curse_skulls_of_fury_desc",
	package_name = "resource_packages/mutators/mutator_curse_skulls_of_fury",
	display_name = "curse_skulls_of_fury_name",
	icon = "deus_curse_khorne_01",
	server_start_function = function (context, data)
		data.seed = Managers.mechanism:get_level_seed("mutator")
		data.unit_extension_template = "buffed_timed_explosion_unit"
		data.extension_init_data = {
			buff_system = {
				breed = "n/a",
				initial_buff_names = {
					buff_name
				}
			},
			area_damage_system = {
				explosion_template_name = "curse_skulls_of_fury_explosion"
			}
		}
	end,
	server_ai_killed_function = function (context, data, killed_unit, killer_unit, death_data)
		local random = 1
		data.seed, random = Math.next_random(data.seed)
		local breed = Unit.get_data(killed_unit, "breed")
		local breed_spawn_chance = (breed and breed_additional_spawn_chance[breed.name]) or 0
		local spawn_chance = BASE_SPAWN_CHANCE + breed_spawn_chance

		if random < spawn_chance then
			local position = Vector3.copy(POSITION_LOOKUP[killed_unit])
			position.z = position.z + spawn_z_offset
			local rotation = Quaternion.identity()

			Managers.state.unit_spawner:spawn_network_unit(skull_unit, data.unit_extension_template, data.extension_init_data, position, rotation)

			local random_player_unit = DialogueSystem:get_random_player()

			if random_player_unit then
				local dialogue_input = ScriptUnit.extension_input(random_player_unit, "dialogue_system")
				local event_data = FrameTable.alloc_table()

				dialogue_input:trigger_dialogue_event("curse_danger_spotted", event_data)
			end
		end
	end,
	server_player_hit_function = function (context, data, hit_unit, attacker_unit, hit_data)
		local damage_type = hit_data[2]

		if damage_type == "skulls_of_fury" then
			local dialogue_input = ScriptUnit.extension_input(hit_unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()

			dialogue_input:trigger_dialogue_event("curse_damage_taken", event_data)
		end
	end
}
