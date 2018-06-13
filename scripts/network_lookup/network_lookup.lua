require("scripts/settings/environmental_hazards")
require("scripts/settings/level_settings")
require("scripts/settings/level_unlock_settings")
require("scripts/settings/game_mode_settings")
require("scripts/settings/player_data")
require("scripts/settings/equipment/attachments")
require("scripts/settings/equipment/cosmetics")
require("scripts/settings/equipment/player_wwise_dependencies")
require("scripts/settings/profiles/career_settings")
require("scripts/settings/equipment/weapons")
require("scripts/settings/equipment/pickups")
require("scripts/settings/material_effect_mappings")
require("scripts/settings/player_unit_status_settings")
require("scripts/managers/voting/vote_templates")
require("scripts/settings/difficulty_settings")
require("scripts/settings/player_movement_settings")
require("scripts/managers/backend/statistics_database")
require("scripts/settings/terror_event_blueprints")
require("scripts/unit_extensions/generic/interactions")
require("scripts/settings/survival_settings")
require("scripts/settings/twitch_settings")
require("scripts/settings/equipment/power_level_templates")
require("scripts/settings/equipment/damage_profile_templates")
require("scripts/settings/paintings")
require("scripts/unit_extensions/weapons/area_damage/liquid/damage_blob_templates")
require("scripts/unit_extensions/weapons/area_damage/liquid/damage_wave_templates")
require("scripts/unit_extensions/weapons/area_damage/liquid/liquid_area_damage_templates")
require("scripts/settings/equipment/weapon_skins")

DialogueLookup = DialogueLookup or {}

setmetatable(DialogueLookup, nil)
table.clear(DialogueLookup)

DialogueLookup_n = 0
MarkerLookup = MarkerLookup or {}

setmetatable(MarkerLookup, nil)
table.clear(MarkerLookup)

MarkerLookup_n = 0
local dialogue_lookup_tables = {
	"dialogues/generated/lookup_bright_wizard_bridge",
	"dialogues/generated/lookup_bright_wizard_cemetery",
	"dialogues/generated/lookup_bright_wizard_city_wall",
	"dialogues/generated/lookup_bright_wizard_courtyard",
	"dialogues/generated/lookup_bright_wizard_docks",
	"dialogues/generated/lookup_bright_wizard_end_boss",
	"dialogues/generated/lookup_bright_wizard_farm",
	"dialogues/generated/lookup_bright_wizard_forest_ambush",
	"dialogues/generated/lookup_bright_wizard_honduras",
	"dialogues/generated/lookup_bright_wizard_magnus_tower",
	"dialogues/generated/lookup_bright_wizard_merchant",
	"dialogues/generated/lookup_bright_wizard_sewers",
	"dialogues/generated/lookup_bright_wizard_skaven_tunnels",
	"dialogues/generated/lookup_bright_wizard_wizard_tower",
	"dialogues/generated/lookup_dwarf_ranger_bridge",
	"dialogues/generated/lookup_dwarf_ranger_cemetery",
	"dialogues/generated/lookup_dwarf_ranger_city_wall",
	"dialogues/generated/lookup_dwarf_ranger_courtyard",
	"dialogues/generated/lookup_dwarf_ranger_docks",
	"dialogues/generated/lookup_dwarf_ranger_end_boss",
	"dialogues/generated/lookup_dwarf_ranger_farm",
	"dialogues/generated/lookup_dwarf_ranger_forest_ambush",
	"dialogues/generated/lookup_dwarf_ranger_honduras",
	"dialogues/generated/lookup_dwarf_ranger_magnus_tower",
	"dialogues/generated/lookup_dwarf_ranger_merchant",
	"dialogues/generated/lookup_dwarf_ranger_sewers",
	"dialogues/generated/lookup_dwarf_ranger_skaven_tunnels",
	"dialogues/generated/lookup_dwarf_ranger_wizard_tower",
	"dialogues/generated/lookup_empire_soldier_cemetery",
	"dialogues/generated/lookup_empire_soldier_city_wall",
	"dialogues/generated/lookup_empire_soldier_courtyard",
	"dialogues/generated/lookup_empire_soldier_docks",
	"dialogues/generated/lookup_empire_soldier_end_boss",
	"dialogues/generated/lookup_empire_soldier_farm",
	"dialogues/generated/lookup_empire_soldier_forest_ambush",
	"dialogues/generated/lookup_empire_soldier_honduras",
	"dialogues/generated/lookup_empire_soldier_magnus_tower",
	"dialogues/generated/lookup_empire_soldier_merchant",
	"dialogues/generated/lookup_empire_soldier_sewers",
	"dialogues/generated/lookup_empire_soldier_skaven_tunnels",
	"dialogues/generated/lookup_empire_soldier_wizard_tower",
	"dialogues/generated/lookup_enemies",
	"dialogues/generated/lookup_player_conversations_honduras",
	"dialogues/generated/lookup_special_occasions_honduras",
	"dialogues/generated/lookup_witch_hunter_bridge",
	"dialogues/generated/lookup_witch_hunter_cemetery",
	"dialogues/generated/lookup_witch_hunter_city_wall",
	"dialogues/generated/lookup_witch_hunter_courtyard",
	"dialogues/generated/lookup_witch_hunter_docks",
	"dialogues/generated/lookup_witch_hunter_end_boss",
	"dialogues/generated/lookup_witch_hunter_farm",
	"dialogues/generated/lookup_witch_hunter_forest_ambush",
	"dialogues/generated/lookup_witch_hunter_honduras",
	"dialogues/generated/lookup_witch_hunter_magnus_tower",
	"dialogues/generated/lookup_witch_hunter_merchant",
	"dialogues/generated/lookup_witch_hunter_sewers",
	"dialogues/generated/lookup_witch_hunter_skaven_tunnels",
	"dialogues/generated/lookup_witch_hunter_wizard_tower",
	"dialogues/generated/lookup_wood_elf_bridge",
	"dialogues/generated/lookup_wood_elf_cemetery",
	"dialogues/generated/lookup_wood_elf_city_wall",
	"dialogues/generated/lookup_wood_elf_courtyard",
	"dialogues/generated/lookup_wood_elf_docks",
	"dialogues/generated/lookup_wood_elf_end_boss",
	"dialogues/generated/lookup_wood_elf_farm",
	"dialogues/generated/lookup_wood_elf_forest_ambush",
	"dialogues/generated/lookup_wood_elf_honduras",
	"dialogues/generated/lookup_wood_elf_magnus_tower",
	"dialogues/generated/lookup_wood_elf_merchant",
	"dialogues/generated/lookup_wood_elf_sewers",
	"dialogues/generated/lookup_wood_elf_skaven_tunnels",
	"dialogues/generated/lookup_wood_elf_wizard_tower",
	"dialogues/generated/lookup_wood_elf_chamber",
	"dialogues/generated/lookup_witch_hunter_chamber",
	"dialogues/generated/lookup_empire_soldier_chamber",
	"dialogues/generated/lookup_dwarf_ranger_chamber",
	"dialogues/generated/lookup_bright_wizard_chamber",
	"dialogues/generated/lookup_bright_wizard_elven_ruins",
	"dialogues/generated/lookup_witch_hunter_elven_ruins",
	"dialogues/generated/lookup_empire_soldier_elven_ruins",
	"dialogues/generated/lookup_dwarf_ranger_elven_ruins",
	"dialogues/generated/lookup_wood_elf_elven_ruins",
	"dialogues/generated/lookup_hero_conversations_elven_ruins",
	"dialogues/generated/lookup_bright_wizard_catacombs",
	"dialogues/generated/lookup_witch_hunter_catacombs",
	"dialogues/generated/lookup_empire_soldier_catacombs",
	"dialogues/generated/lookup_dwarf_ranger_catacombs",
	"dialogues/generated/lookup_wood_elf_catacombs",
	"dialogues/generated/lookup_hero_conversations_catacombs",
	"dialogues/generated/lookup_bright_wizard_military",
	"dialogues/generated/lookup_witch_hunter_military",
	"dialogues/generated/lookup_dwarf_ranger_military",
	"dialogues/generated/lookup_empire_soldier_military",
	"dialogues/generated/lookup_wood_elf_military",
	"dialogues/generated/lookup_conversations_prologue",
	"dialogues/generated/lookup_bright_wizard_mines",
	"dialogues/generated/lookup_witch_hunter_mines",
	"dialogues/generated/lookup_dwarf_ranger_mines",
	"dialogues/generated/lookup_empire_soldier_mines",
	"dialogues/generated/lookup_wood_elf_mines",
	"dialogues/generated/lookup_wood_elf_ussingen",
	"dialogues/generated/lookup_empire_soldier_ussingen",
	"dialogues/generated/lookup_bright_wizard_ussingen",
	"dialogues/generated/lookup_dwarf_ranger_ussingen",
	"dialogues/generated/lookup_witch_hunter_ussingen",
	"dialogues/generated/lookup_hero_conversations_ussingen",
	"dialogues/generated/lookup_marker_events",
	"dialogues/generated/lookup_bright_wizard_fort",
	"dialogues/generated/lookup_dwarf_ranger_fort",
	"dialogues/generated/lookup_witch_hunter_fort",
	"dialogues/generated/lookup_wood_elf_fort",
	"dialogues/generated/lookup_empire_soldier_fort",
	"dialogues/generated/lookup_hero_conversations_fort",
	"dialogues/generated/lookup_bright_wizard_skaven_stronghold",
	"dialogues/generated/lookup_dwarf_ranger_skaven_stronghold",
	"dialogues/generated/lookup_witch_hunter_skaven_stronghold",
	"dialogues/generated/lookup_wood_elf_skaven_stronghold",
	"dialogues/generated/lookup_empire_soldier_skaven_stronghold",
	"dialogues/generated/lookup_skaven_warlord_skaven_stronghold_level",
	"dialogues/generated/lookup_bright_wizard_nurgle",
	"dialogues/generated/lookup_dwarf_ranger_nurgle",
	"dialogues/generated/lookup_witch_hunter_nurgle",
	"dialogues/generated/lookup_wood_elf_nurgle",
	"dialogues/generated/lookup_empire_soldier_nurgle",
	"dialogues/generated/lookup_bright_wizard_warcamp",
	"dialogues/generated/lookup_dwarf_ranger_warcamp",
	"dialogues/generated/lookup_witch_hunter_warcamp",
	"dialogues/generated/lookup_wood_elf_warcamp",
	"dialogues/generated/lookup_empire_soldier_warcamp",
	"dialogues/generated/lookup_hero_conversations_war_camp",
	"dialogues/generated/lookup_bright_wizard_farmland",
	"dialogues/generated/lookup_dwarf_ranger_farmland",
	"dialogues/generated/lookup_witch_hunter_farmland",
	"dialogues/generated/lookup_wood_elf_farmland",
	"dialogues/generated/lookup_empire_soldier_farmland",
	"dialogues/generated/lookup_hero_conversations_farmlands",
	"dialogues/generated/lookup_bright_wizard_skittergate",
	"dialogues/generated/lookup_dwarf_ranger_skittergate",
	"dialogues/generated/lookup_witch_hunter_skittergate",
	"dialogues/generated/lookup_wood_elf_skittergate",
	"dialogues/generated/lookup_empire_soldier_skittergate",
	"dialogues/generated/lookup_grey_seer_skittergate",
	"dialogues/generated/lookup_bright_wizard_bell",
	"dialogues/generated/lookup_dwarf_ranger_bell",
	"dialogues/generated/lookup_witch_hunter_bell",
	"dialogues/generated/lookup_wood_elf_bell",
	"dialogues/generated/lookup_empire_soldier_bell",
	"dialogues/generated/lookup_bright_wizard_ground_zero",
	"dialogues/generated/lookup_dwarf_ranger_ground_zero",
	"dialogues/generated/lookup_witch_hunter_ground_zero",
	"dialogues/generated/lookup_wood_elf_ground_zero",
	"dialogues/generated/lookup_empire_soldier_ground_zero",
	"dialogues/generated/lookup_hero_conversations_ground_zero",
	"dialogues/generated/lookup_hub_conversations"
}

for _, dlc in pairs(DLCSettings) do
	local dlc_lookup_tables = dlc.dialogue_lookup

	if dlc_lookup_tables then
		for _, dialogue_lookup_table in ipairs(dlc_lookup_tables) do
			dialogue_lookup_tables[#dialogue_lookup_tables + 1] = dialogue_lookup_table
		end
	end
end

for _, dialogue_lookup_table in ipairs(dialogue_lookup_tables) do
	dofile(dialogue_lookup_table)

	if Application.can_get("lua", dialogue_lookup_table .. "_markers") then
		dofile(dialogue_lookup_table .. "_markers")
	end
end

NetworkLookup = {}

dofile("scripts/network_lookup/anims_lookup_table")

NetworkLookup.item_drop_reasons = {
	"death",
	"shield_break"
}

function create_lookup(lookup, hashtable)
	local i = #lookup

	for key, _ in pairs(hashtable) do
		i = i + 1
		lookup[i] = key
	end

	return lookup
end

local attachments_table = {}

for attachment_name, attachment_data in pairs(Attachments) do
	attachments_table[#attachments_table + 1] = attachment_name
end

NetworkLookup.cosmetics = create_lookup({}, Cosmetics)
NetworkLookup.cosmetics[#NetworkLookup.cosmetics + 1] = "default"
local item_template_table = {}
NetworkLookup.actions = {}
NetworkLookup.sub_actions = {}

for item_template_name, item_template in pairs(Weapons) do
	item_template_table[#item_template_table + 1] = item_template_name

	for action_name, sub_actions in pairs(item_template.actions) do
		if not table.contains(NetworkLookup.actions, action_name) then
			NetworkLookup.actions[#NetworkLookup.actions + 1] = action_name
		end

		for sub_action_name, sub_action_data in pairs(sub_actions) do
			if not table.contains(NetworkLookup.sub_actions, sub_action_name) then
				NetworkLookup.sub_actions[#NetworkLookup.sub_actions + 1] = sub_action_name
			end
		end
	end
end

NetworkLookup.item_names = {
	"n/a"
}

for item_name, item_data in pairs(ItemMasterList) do
	NetworkLookup.item_names[#NetworkLookup.item_names + 1] = item_name
end

NetworkLookup.item_template_names = {
	"n/a"
}

table.append(NetworkLookup.item_template_names, item_template_table)
table.append(NetworkLookup.item_template_names, attachments_table)

NetworkLookup.equipment_slots = {}

for index, slot_settings in ipairs(InventorySettings.slots) do
	NetworkLookup.equipment_slots[#NetworkLookup.equipment_slots + 1] = slot_settings.name
end

NetworkLookup.mutator_templates = create_lookup({}, MutatorTemplates)
NetworkLookup.breeds = {
	"skaven_clan_rat",
	"skaven_clan_rat_with_shield",
	"skaven_dummy_clan_rat",
	"skaven_slave",
	"skaven_dummy_slave",
	"skaven_loot_rat",
	"skaven_storm_vermin",
	"skaven_storm_vermin_champion",
	"skaven_storm_vermin_commander",
	"skaven_storm_vermin_warlord",
	"skaven_storm_vermin_with_shield",
	"skaven_poison_wind_globadier",
	"skaven_gutter_runner",
	"skaven_pack_master",
	"skaven_plague_monk",
	"skaven_ratling_gunner",
	"skaven_rat_ogre",
	"skaven_stormfiend",
	"skaven_stormfiend_boss",
	"skaven_grey_seer",
	"skaven_stormfiend_demo",
	"skaven_warpfire_thrower",
	"skaven_clan_rat_tutorial",
	"chaos_warrior",
	"chaos_exalted_champion_warcamp",
	"chaos_exalted_champion_norsca",
	"chaos_exalted_sorcerer",
	"chaos_tentacle_sorcerer",
	"chaos_tentacle",
	"critter_pig",
	"critter_rat",
	"pet_pig",
	"pet_rat",
	"chaos_marauder",
	"chaos_marauder_tutorial",
	"chaos_raider_tutorial",
	"chaos_fanatic",
	"chaos_marauder_with_shield",
	"chaos_berzerker",
	"chaos_raider",
	"chaos_troll",
	"chaos_dummy_troll",
	"chaos_dummy_sorcerer",
	"chaos_vortex_sorcerer",
	"chaos_vortex",
	"chaos_plague_sorcerer",
	"chaos_corruptor_sorcerer",
	"chaos_plague_wave_spawner",
	"chaos_spawn",
	"chaos_spawn_exalted_champion_norsca",
	"chaos_zombie"
}
local temp = {}

for breed_name, breed in pairs(Breeds) do
	local translation = breed.hitbox_ragdoll_translation

	if translation then
		for hitbox_actor, ragdoll_actor in pairs(translation) do
			temp[ragdoll_actor] = true
		end
	end
end

local hit_ragdoll_actors = {
	"n/a"
}

for ragdoll_actor, _ in pairs(temp) do
	hit_ragdoll_actors[#hit_ragdoll_actors + 1] = ragdoll_actor
end

NetworkLookup.hit_ragdoll_actors = hit_ragdoll_actors
local damage_sources = {
	"undefined",
	"debug",
	"ground_impact",
	"suicide",
	"wounded_degen",
	"health_degen",
	"temporary_health_degen",
	"dot_debuff",
	"overcharge",
	"knockdown_bleed",
	"volume_insta_kill",
	"career_ability"
}

for hazard, _ in pairs(EnvironmentalHazards) do
	damage_sources[#damage_sources + 1] = hazard
end

table.append(damage_sources, NetworkLookup.item_names)
table.append(damage_sources, NetworkLookup.breeds)

NetworkLookup.damage_sources = damage_sources
NetworkLookup.breeds[#NetworkLookup.breeds + 1] = "n/a"
NetworkLookup.husks = {
	"units/decals/decal_vortex_circle_inner",
	"units/decals/decal_vortex_circle_outer",
	"units/beings/player/witch_hunter/third_person_base/chr_third_person_husk_base",
	"units/beings/player/witch_hunter_bounty_hunter/third_person_base/chr_third_person_husk_base",
	"units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_husk_base",
	"units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_husk_base",
	"units/beings/player/bright_wizard/third_person_base/chr_third_person_husk_base",
	"units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_husk_base",
	"units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_husk_base",
	"units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_husk_base",
	"units/beings/player/dwarf_ranger/third_person_base/chr_third_person_husk_base",
	"units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_husk_base",
	"units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_husk_base",
	"units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_husk_base",
	"units/beings/player/way_watcher/third_person_base/chr_third_person_husk_base",
	"units/beings/player/way_watcher_shade/third_person_base/chr_third_person_husk_base",
	"units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_husk_base",
	"units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_husk_base",
	"units/beings/player/empire_soldier/third_person_base/chr_third_person_husk_base",
	"units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_husk_base",
	"units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_husk_base",
	"units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_husk_base",
	"units/beings/enemies/skaven_clan_rat/chr_skaven_clan_rat",
	"units/beings/enemies/skaven_clan_rat/chr_skaven_clan_rat_baked_var1",
	"units/beings/enemies/skaven_clan_rat/chr_skaven_clan_rat_baked_var2",
	"units/beings/enemies/skaven_clan_rat/chr_skaven_clan_rat_baked_var3",
	"units/beings/enemies/skaven_clan_rat/chr_skaven_clan_rat_baked_var4",
	"units/beings/enemies/skaven_clan_rat/chr_skaven_slave",
	"units/beings/enemies/skaven_clan_rat/chr_skaven_slave_baked",
	"units/beings/enemies/skaven_loot_rat/chr_skaven_loot_rat",
	"units/beings/enemies/skaven_pack_master/chr_skaven_pack_master",
	"units/beings/enemies/skaven_plague_monk/chr_skaven_plague_monk",
	"units/beings/enemies/chaos_sorcerer_fx/chr_chaos_sorcerer_fx",
	"units/beings/enemies/skaven_ratlinggunner/chr_skaven_ratlinggunner",
	"units/beings/enemies/skaven_stormvermin/chr_skaven_stormvermin",
	"units/beings/enemies/skaven_stormvermin_champion/chr_skaven_stormvermin_champion",
	"units/beings/enemies/skaven_stormvermin_champion/chr_skaven_stormvermin_warlord",
	"units/beings/enemies/skaven_wind_globadier/chr_skaven_wind_globadier",
	"units/beings/enemies/skaven_gutter_runner/chr_skaven_gutter_runner",
	"units/beings/enemies/skaven_rat_ogre/chr_skaven_rat_ogre",
	"units/beings/enemies/skaven_stormfiend/chr_skaven_stormfiend",
	"units/beings/enemies/skaven_stormfiend/chr_skaven_stormfiend_boss",
	"units/beings/enemies/skaven_grey_seer/chr_skaven_grey_seer",
	"units/beings/enemies/skaven_warpfire_thrower/chr_skaven_warpfire_thrower",
	"units/beings/enemies/chaos_marauder/chr_chaos_marauder",
	"units/beings/enemies/chaos_marauder/chr_chaos_marauder_baked_var1",
	"units/beings/enemies/chaos_marauder/chr_chaos_marauder_baked_var2",
	"units/beings/enemies/chaos_marauder/chr_chaos_marauder_baked_var3",
	"units/beings/enemies/chaos_marauder/chr_chaos_marauder_baked_var4",
	"units/beings/enemies/chaos_fanatic/chr_chaos_fanatic",
	"units/beings/enemies/chaos_fanatic/chr_chaos_fanatic_baked_var1",
	"units/beings/enemies/chaos_fanatic/chr_chaos_fanatic_baked_var2",
	"units/beings/enemies/chaos_fanatic/chr_chaos_fanatic_baked_var3",
	"units/beings/enemies/chaos_nurgle_corpses/chr_npc_chaos_nurgle_corpse",
	"units/beings/enemies/chaos_raider/chr_chaos_raider",
	"units/beings/enemies/chaos_raider/chr_chaos_raider_baked",
	"units/beings/enemies/chaos_berzerker/chr_chaos_berzerker",
	"units/beings/enemies/chaos_berzerker/chr_chaos_berzerker_baked",
	"units/beings/enemies/chaos_warrior/chr_chaos_warrior",
	"units/beings/enemies/chaos_warrior/chr_chaos_warrior_exalted",
	"units/beings/enemies/chaos_warrior_boss/chr_chaos_warrior_boss",
	"units/beings/enemies/chaos_troll/chr_chaos_troll",
	"units/beings/enemies/chaos_tentacle/chr_chaos_tentacle",
	"units/beings/enemies/chaos_tentacle_portal/chr_chaos_tentacle_portal",
	"units/beings/enemies/chaos_sorcerer/chr_chaos_sorcerer",
	"units/beings/enemies/chaos_sorcerer_boss/chr_chaos_sorcerer_boss",
	"units/beings/enemies/chaos_sorcerer_corruptor/chr_chaos_sorcerer_corruptor",
	"units/beings/enemies/chaos_sorcerer_tentacle/chr_chaos_sorcerer_tentacle",
	"units/beings/enemies/chaos_vortex_sorcerer/chr_chaos_vortex_sorcerer",
	"units/beings/enemies/chaos_spawn/chr_chaos_spawn",
	"units/weapons/enemy/wpn_chaos_plague_vortex/wpn_chaos_plague_vortex",
	"units/beings/critters/chr_critter_pig/chr_critter_pig",
	"units/beings/critters/chr_critter_common_rat/chr_critter_common_rat",
	"units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_3ps",
	"units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1_3ps",
	"units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t2_3ps",
	"units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t3_3ps",
	"units/weapons/player/wpn_we_quiver_t1/wpn_we_poison_arrow_t1_3ps",
	"units/weapons/player/wpn_we_quiver_t1/wpn_we_homing_arrow_t1_3ps",
	"units/weapons/player/wpn_we_quiver_t1/wpn_we_tripple_arrow_t1_3ps",
	"units/weapons/projectile/burning_head/burning_head",
	"units/weapons/player/wpn_emp_arrows/wpn_es_arrow_t1_3ps",
	"units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_01_t1_3p",
	"units/weapons/player/wpn_emp_grenade_01_t2/wpn_emp_grenade_01_t2_3p",
	"units/weapons/player/wpn_emp_grenade_02_t1/wpn_emp_grenade_02_t1_3p",
	"units/weapons/player/wpn_emp_grenade_02_t2/wpn_emp_grenade_02_t2_3p",
	"units/weapons/player/wpn_emp_grenade_03_t1/wpn_emp_grenade_03_t1_3p",
	"units/weapons/player/wpn_emp_grenade_03_t2/wpn_emp_grenade_03_t2_3p",
	"units/weapons/player/fireball_projectile/fireball_projectile_3ps",
	"units/weapons/player/fireball_projectile/charged_fireball_projectile_3ps",
	"units/weapons/player/flame_wave_projectile/flame_wave_projectile_3ps",
	"units/weapons/projectile/insect_swarm_missile/insect_swarm_missile_01",
	"units/weapons/projectile/strike_missile/strike_missile",
	"units/weapons/projectile/warp_lightning_bolt/warp_lightning_bolt",
	"units/weapons/enemy/wpn_overpowering_blob/wpn_overpowering_blob",
	"units/weapons/player/pup_potion/pup_potion_t1",
	"units/weapons/player/pup_potion/pup_potion_buff",
	"units/weapons/player/pup_first_aid_kit/pup_first_aid_kit",
	"units/weapons/player/pup_first_aid/pup_first_aid",
	"units/props/dice_bowl/pup_loot_die",
	"units/weapons/player/pup_lore_page/pup_lore_page_01",
	"units/weapons/player/pup_sacks/pup_sacks_01",
	"units/gameplay/timed_door_base_02/pup_timed_door_stick",
	"units/weapons/player/pup_drachenfels_statue/pup_drachenfels_statue",
	"units/weapons/player/pup_explosive_barrel/pup_explosive_barrel_01",
	"units/weapons/player/pup_oil_jug_01/pup_oil_jug_01",
	"units/weapons/player/pup_dwarf_barrel_01/pup_dwarf_barrel_01",
	"units/weapons/player/pup_explosive_barrel/pup_gun_powder_barrel_01",
	"units/weapons/player/pup_grenades/pup_grenade_01_t1",
	"units/weapons/player/pup_grenades/pup_grenade_01_t2",
	"units/weapons/player/pup_grenades/pup_grenade_02_t1",
	"units/weapons/player/pup_grenades/pup_grenade_02_t2",
	"units/weapons/player/pup_grenades/pup_grenade_03_t1",
	"units/weapons/player/pup_grenades/pup_grenade_03_t2",
	"units/weapons/player/pup_scrolls/pup_scroll_t1",
	"units/weapons/player/pup_ammo_box/pup_ammo_box",
	"units/weapons/player/pup_ammo_box/pup_ammo_box_limited",
	"units/weapons/player/pup_torch/pup_torch",
	"units/weapons/player/pup_grimoire_01/pup_grimoire_01",
	"units/weapons/player/pup_side_objective_tome/pup_side_objective_tome_01",
	"units/weapons/player/pup_cannon_ball_01/pup_cannon_ball_01",
	"units/weapons/player/wpn_cannon_ball_01/wpn_cannon_ball_01",
	"units/weapons/player/wpn_cannon_ball_01/wpn_cannon_ball_01_3p",
	"units/weapons/player/pup_potion_01/pup_potion_extra_01",
	"units/weapons/player/pup_potion_01/pup_potion_healing_01",
	"units/weapons/player/pup_potion_01/pup_potion_speed_01",
	"units/weapons/player/pup_potion_01/pup_potion_strenght_01",
	"units/gameplay/training_dummy/training_dummy",
	"units/gameplay/training_dummy/wpn_training_dummy",
	"units/gameplay/training_dummy/wpn_training_dummy_3p",
	"units/gameplay/training_dummy/training_dummy_armored",
	"units/gameplay/training_dummy/wpn_training_dummy_armored",
	"units/gameplay/training_dummy/wpn_training_dummy_armored_3p",
	"units/weapons/projectile/poison_wind_globe/poison_wind_globe",
	"units/weapons/projectile/vortex_rune/vortex_rune",
	"units/weapons/projectile/magic_missile/magic_missile",
	"units/weapons/player/pup_sacks/pup_sacks_01_test",
	"units/weapons/player/drakegun_projectile/drakegun_projectile_3ps",
	"units/weapons/player/drakegun_projectile_charged/drakegun_projectile_charged_3ps",
	"units/weapons/player/drake_pistol_projectile/drake_pistol_projectile_3ps",
	"units/weapons/player/spear_projectile/spear_3ps",
	"units/weapons/player/spear_projectile/spark_3ps",
	"units/hub_elements/empty",
	"units/hub_elements/interest_points/pack_spawning/ai_interest_point_1pack",
	"units/hub_elements/interest_points/pack_spawning/ai_interest_point_2pack",
	"units/hub_elements/interest_points/pack_spawning/ai_interest_point_3pack",
	"units/hub_elements/interest_points/pack_spawning/ai_interest_point_4pack",
	"units/hub_elements/interest_points/pack_spawning/ai_interest_point_4pack_02",
	"units/hub_elements/interest_points/pack_spawning/ai_interest_point_6pack_01",
	"units/hub_elements/interest_points/pack_spawning/ai_interest_point_6pack_02",
	"units/hub_elements/interest_points/pack_spawning/ai_interest_point_8pack",
	"units/props/endurance_badges/prop_endurance_badge_01",
	"units/props/endurance_badges/prop_endurance_badge_02",
	"units/props/endurance_badges/prop_endurance_badge_03",
	"units/props/endurance_badges/prop_endurance_badge_04",
	"units/props/endurance_badges/prop_endurance_badge_05",
	"units/weapons/enemy/wpn_chaos_set/wpn_chaos_2h_axe_03",
	"units/weapons/enemy/wpn_chaos_set/wpn_chaos_2h_axe_03_boss",
	"units/gameplay/timed_door_base_02/timed_door_stick_pup",
	"units/gameplay/timed_door_base_02/timed_door_base_02_handle",
	"units/gameplay/line_of_sight_blocker/hemisphere_los_blocker",
	"units/gameplay/portal_blob/portalblob"
}
NetworkLookup.go_types = {
	"player",
	"ai_player",
	"player_sync_data",
	"team",
	"player_unit",
	"player_bot_unit",
	"ai_unit",
	"ai_unit_with_inventory",
	"ai_unit_with_inventory_and_target",
	"ai_lord_with_inventory_and_target",
	"ai_unit_with_inventory_and_shield",
	"ai_unit_with_inventory_and_shield_and_target",
	"ai_unit_storm_vermin_warlord",
	"ai_unit_pack_master",
	"ai_unit_ratling_gunner",
	"ai_unit_warpfire_thrower",
	"ai_unit_stormfiend",
	"ai_inventory_item",
	"ai_unit_tentacle",
	"ai_unit_tentacle_portal",
	"damage_wave_unit",
	"damage_blob_unit",
	"ai_unit_vortex",
	"ai_unit_plague_wave_spawner",
	"player_projectile_unit",
	"flame_wave_projectile_unit",
	"aoe_projectile_unit",
	"projectile_unit",
	"pickup_torch_unit",
	"pickup_torch_unit_init",
	"pickup_projectile_unit",
	"pickup_projectile_unit_limited",
	"explosive_pickup_projectile_unit",
	"explosive_pickup_projectile_unit_limited",
	"true_flight_projectile_unit",
	"ai_true_flight_projectile_unit",
	"ai_true_flight_killable_projectile_unit",
	"ai_true_flight_projectile_unit_without_raycast",
	"prop_unit",
	"overpowering_blob_unit",
	"network_synched_dummy_unit",
	"thrown_weapon_unit",
	"aoe_unit",
	"pickup_unit",
	"objective_pickup_unit",
	"player_profile",
	"music_states",
	"interest_point_unit",
	"interest_point_level_unit",
	"sync_unit",
	"player_unit_health",
	"liquid_aoe_unit",
	"payload",
	"twitch_vote",
	"lure_unit",
	"pickup_training_dummy_unit",
	"keep_decoration_painting"
}
NetworkLookup.spawn_health_state = {
	"alive",
	"bleeding",
	"knocked_down",
	"disabled",
	"dead",
	"unhurt",
	"wounded",
	"down"
}
NetworkLookup.attack_arm = {
	"attack_left",
	"attack_right"
}
NetworkLookup.die_types = {
	"wood",
	"metal",
	"gold",
	"warpstone"
}
NetworkLookup.voice = {
	"husk_vce_charge_swing",
	"husk_vce_swing",
	"chr_vce_finish_off"
}
NetworkLookup.stamina_state = {
	"normal",
	"tired"
}
NetworkLookup.door_states = {
	"closed",
	"open_forward",
	"open_backward",
	"open"
}
NetworkLookup.heal_types = {
	"n/a",
	"bandage_trinket",
	"healing_draught",
	"proc",
	"potion",
	"bandage",
	"buff",
	"heal_from_proc",
	"buff_shared_medpack",
	"shield_by_assist",
	"debug",
	"leech",
	"career_skill",
	"career_passive",
	"health_regen"
}
NetworkLookup.difficulties = create_lookup({}, DifficultySettings)
NetworkLookup.linked_particle_policies = {
	"destroy",
	"stop",
	"unlink"
}
NetworkLookup.collision_filters = {
	"filter_player_and_enemy_hit_box_check",
	"filter_enemy_ray_projectile",
	"filter_player_ray_projectile",
	"filter_player_ray_projectile_no_player",
	"filter_enemy_unit",
	"n/a"
}
NetworkLookup.hit_zones = {
	"head",
	"body",
	"torso",
	"left_arm",
	"right_arm",
	"left_leg",
	"right_leg",
	"tail",
	"neck",
	"neck1",
	"n/a",
	"full",
	"aux",
	"left_tentacle",
	"weakspot",
	"ward"
}
NetworkLookup.lobby_data = {
	"level_key",
	"selected_level_key",
	"num_players",
	"matchmaking",
	"player_slot_1",
	"player_slot_2",
	"player_slot_3",
	"player_slot_4",
	"player_slot_5",
	"host",
	"network_hash",
	"unique_server_name",
	"difficulty",
	"game_started",
	"room_id",
	"session_id",
	"is_private",
	"time_of_search",
	"game_mode"
}
NetworkLookup.lobby_data_values = {
	"false",
	"true",
	"searching"
}
NetworkLookup.game_modes = {
	"adventure",
	"survival",
	"tutorial",
	"demo"
}
NetworkLookup.buff_attack_types = {
	"n/a",
	"aoe",
	"projectile",
	"heavy_attack",
	"light_attack",
	"instant_projectile",
	"grenade"
}
local anims_temp = {}
local actions_temp = {}

for _, breed_data in pairs(BreedActions) do
	for action_name, action_data in pairs(breed_data) do
		actions_temp[action_name] = true

		if action_name == "stagger" then
			local anims_table = action_data.stagger_anims

			if anims_table then
				for _, dir_table in ipairs(anims_table) do
					for _, anims in pairs(dir_table) do
						for _, anim in ipairs(anims) do
							anims_temp[anim] = anim
						end
					end
				end
			else
				local health_based_stagger_data = action_data.health_based_stagger_anims

				for _, data in pairs(health_based_stagger_data) do
					local anims_table = data.stagger_anims

					for _, dir_table in ipairs(anims_table) do
						for _, anims in pairs(dir_table) do
							for _, anim in ipairs(anims) do
								anims_temp[anim] = anim
							end
						end
					end
				end
			end

			local shield_stagger_anims = action_data.shield_stagger_anims

			if shield_stagger_anims then
				for _, dir_table in ipairs(shield_stagger_anims) do
					for _, anims in pairs(dir_table) do
						for _, anim in ipairs(anims) do
							anims_temp[anim] = anim
						end
					end
				end
			end

			local shield_block_anims = action_data.shield_block_anims

			if shield_block_anims then
				for _, dir_table in ipairs(shield_block_anims) do
					for _, anims in pairs(dir_table) do
						for _, anim in ipairs(anims) do
							anims_temp[anim] = anim
						end
					end
				end
			end

			local shield_break_anims = action_data.shield_break_anims

			if shield_break_anims then
				for _, dir_table in ipairs(shield_break_anims) do
					for _, anims in pairs(dir_table) do
						for _, anim in ipairs(anims) do
							anims_temp[anim] = anim
						end
					end
				end
			end

			local dodge_anims = action_data.dodge_anims

			if dodge_anims then
				for _, dir_table in ipairs(dodge_anims) do
					for _, anims in pairs(dir_table) do
						for _, anim in ipairs(anims) do
							anims_temp[anim] = anim
						end
					end
				end
			end
		elseif action_name == "blocked" then
			local anims_table = action_data.blocked_anims

			for _, anim in ipairs(anims_table) do
				anims_temp[anim] = anim
			end
		end
	end
end

local smart_object_animation_types = {
	"animation_edge",
	"animation_fence",
	"animation_land",
	"animation_jump"
}

for _, template in pairs(SmartObjectSettings.templates) do
	for _, threshold_table_types in pairs(template) do
		for _, threshold_table in ipairs(threshold_table_types) do
			for _, animation_type in ipairs(smart_object_animation_types) do
				local anim_config = threshold_table[animation_type]

				if anim_config then
					if type(anim_config) == "table" then
						for _, anim in ipairs(anim_config) do
							anims_temp[anim] = anim
						end
					else
						anims_temp[anim_config] = anim_config
					end
				end
			end
		end
	end
end

for _, direction in pairs(PlayerUnitMovementSettings.catapulted.directions) do
	for _, anim in pairs(direction) do
		anims_temp[anim] = anim
	end
end

NetworkLookup.bt_action_names = create_lookup({
	"n/a"
}, actions_temp)

for _, variation_table in pairs(BTHesitationVariations) do
	for _, variation_name in pairs(variation_table) do
		anims_temp[variation_name] = variation_name
	end
end

NetworkLookup.anims = create_lookup(NetworkLookup.anims, anims_temp)

table.clear(anims_temp)
table.clear(actions_temp)

NetworkLookup.damage_types = {
	"buff",
	"arrow",
	"yield",
	"kinetic",
	"cutting",
	"vomit_ground",
	"vomit_face",
	"plague_face",
	"warpfire_ground",
	"warpfire_face",
	"cutting_berserker",
	"player_stunned_damage",
	"piercing",
	"slashing_buffed",
	"slashing",
	"blunt",
	"projectile",
	"player_overcharge_explosion_brw",
	"player_overcharge_explosion_dwarf",
	"knockdown_bleed",
	"light_slashing_linesman",
	"light_slashing_linesman_hs",
	"slashing_linesman",
	"heavy_slashing_linesman",
	"light_slashing_smiter",
	"slashing_smiter",
	"heavy_slashing_smiter",
	"light_slashing_fencer",
	"slashing_fencer",
	"heavy_slashing_fencer",
	"light_slashing_tank",
	"slashing_tank",
	"heavy_slashing_tank",
	"slashing_smiter_uppercut",
	"heavy_slashing_smiter_uppercut",
	"light_blunt_linesman",
	"blunt_linesman",
	"heavy_blunt_linesman",
	"light_blunt_smiter",
	"blunt_smiter",
	"heavy_blunt_smiter",
	"light_blunt_fencer",
	"blunt_fencer",
	"heavy_blunt_fencer",
	"light_blunt_tank",
	"blunt_tank",
	"blunt_tank_uppercut",
	"heavy_blunt_tank",
	"light_stab_linesman",
	"stab_linesman",
	"heavy_stab_linesman",
	"light_stab_smiter",
	"stab_smiter",
	"heavy_stab_smiter",
	"light_stab_fencer",
	"stab_fencer",
	"burning_stab_fencer",
	"heavy_stab_fencer",
	"light_stab_tank",
	"stab_tank",
	"heavy_stab_tank",
	"shot_sniper",
	"shot_carbine",
	"shot_machinegun",
	"shot_shotgun",
	"shot_repeating_handgun",
	"drakegun",
	"drakegun_shot",
	"drakegun_glance",
	"arrow_sniper",
	"arrow_carbine",
	"arrow_machinegun",
	"arrow_poison",
	"bolt_sniper",
	"bolt_carbine",
	"bolt_machinegun",
	"burn",
	"burn_sniper",
	"burn_shotgun",
	"burn_carbine",
	"burn_machinegun",
	"burninating",
	"bleed",
	"burning_tank",
	"heavy_burning_tank",
	"light_burning_linesman",
	"burning_linesman",
	"burning_smiter",
	"damage_over_time",
	"wounded_dot",
	"health_degen",
	"temporary_health_degen",
	"arrow_poison_dot",
	"aoe_poison_dot",
	"death_zone",
	"crush",
	"poison",
	"forced",
	"grenade",
	"grenade_glance",
	"fire_grenade",
	"fire_grenade_glance",
	"elven_magic",
	"elven_magic_glance",
	"destructible_level_object_hit",
	"push",
	"pack_master_grab",
	"overcharge",
	"weapon_bleed_dot_test",
	"sync_health",
	"killing_blow",
	"military_finish",
	"volume_generic_dot",
	"volume_insta_kill",
	"globadier_gas_dot",
	"inside_forbidden_tag_volume",
	"undefined"
}
NetworkLookup.hit_react_types = {
	"light",
	"medium",
	"heavy",
	"slow_bomb"
}
NetworkLookup.buff_templates = {
	"n/a",
	"damage_boost_potion_increased",
	"speed_boost_potion_increased",
	"cooldown_reduction_potion_increased",
	"invulnerability_potion_increased",
	"damage_boost_potion_reduced",
	"speed_boost_potion_reduced",
	"cooldown_reduction_potion_reduced",
	"invulnerability_potion_reduced",
	"damage_boost_potion",
	"speed_boost_potion",
	"cooldown_reduction_potion",
	"invulnerability_potion",
	"damage_reduction_boost",
	"super_jump",
	"increase_all_healing",
	"tank_stance",
	"ninja_fencer_stance",
	"smiter_stance",
	"lines_man_stance",
	"imba_super_test_buff",
	"movement_volume_generic_slowdown",
	"globadier_gas_dot",
	"grimoire_health_debuff",
	"bile_troll_vomit_ground_base",
	"plague_wave_ground_base",
	"bile_troll_vomit_face_base",
	"plague_wave_face_base",
	"vortex_base",
	"stormfiend_warpfire_ground_base",
	"stormfiend_warpfire_face_base",
	"bardin_ironbreaker_activated_ability",
	"bardin_ironbreaker_block_cost_on_last_standing",
	"bardin_ironbreaker_defence_on_low_health",
	"bardin_ironbreaker_defence_buff",
	"bardin_ironbreaker_activated_ability_block_cost",
	"bardin_ironbreaker_activated_ability_duration",
	"bardin_ironbreaker_activated_ability_duration_block_cost",
	"bardin_ironbreaker_activated_ability_heal",
	"bardin_ironbreaker_max_health",
	"bardin_slayer_activated_ability",
	"bardin_slayer_activated_ability_uninterruptible",
	"bardin_slayer_activated_ability_attackspeed",
	"bardin_slayer_activated_ability_movement",
	"bardin_slayer_attack_speed_on_last_standing_buff",
	"bardin_slayer_debuff_defence_on_crit",
	"bardin_slayer_passive_stacking_damage_buff",
	"bardin_slayer_passive_stacking_defence_buff",
	"bardin_slayer_passive_stacking_damage_buff_increased_duration",
	"bardin_slayer_passive_cooldown_reduction_on_max_stacks",
	"bardin_ranger_activated_ability",
	"bardin_ranger_crit_hit_damage_on_high_health",
	"bardin_ranger_defence_on_disabled",
	"bardin_ranger_melee_damage_on_no_ammo",
	"defence_debuff_enemies",
	"we_no_ammo_consumed",
	"we_heal_on_kill_uninterruptible",
	"victor_zealot_activated_ability",
	"victor_zealot_activated_ability_heal_buff",
	"victor_zealot_activated_ability_duration",
	"victor_zealot_defence_on_low_health",
	"victor_zealot_gain_invulnerability_on_lethal_damage_taken",
	"victor_zealot_invulnerability_cooldown",
	"victor_zealot_invulnerability_on_lethal_damage_taken",
	"victor_zealot_passive_attack_speed_aura_buff",
	"victor_witchhunter_activated_ability",
	"victor_witchhunter_activated_ability_crit_buff",
	"victor_witchhunter_activated_ability_duration",
	"victor_witchhunter_damage_on_grimoire_picked_up",
	"victor_witchhunter_passive_debuff",
	"victor_witchhunter_headshot_damage_increase",
	"victor_witchhunter_defence_buff_on_disabled",
	"victor_witchhunter_ping_target_crit_chance",
	"victor_bountyhunter_melee_damage_on_no_ammo_buff",
	"markus_knight_defence_buff",
	"markus_mercenary_activated_ability",
	"markus_mercenary_attack_speed_on_last_standing",
	"markus_mercenary_defence_on_disabled",
	"markus_mercenary_passive_proc",
	"markus_mercenary_passive_defence",
	"markus_mercenary_passive_power_level",
	"markus_mercenary_defence_on_low_health",
	"es_swing_through_targets",
	"markus_knight_activated_ability",
	"markus_knight_block_cost_on_last_standing",
	"markus_knight_defence_on_low_health",
	"markus_knight_passive_defence_aura",
	"markus_knight_passive_stamina_aura_buff",
	"markus_knight_passive_movement_speed_aura_buff",
	"markus_knight_improved_passive_defence_aura_buff",
	"markus_knight_max_health",
	"markus_huntsman_activated_ability",
	"markus_huntsman_activated_ability_damage_on_exit",
	"markus_huntsman_activated_ability_regen_buff",
	"markus_huntsman_activated_ability_regen",
	"markus_huntsman_passive_crit_aura_buff",
	"markus_huntsman_crit_chance_on_last_standing",
	"markus_huntsman_debuff_defence_on_crit",
	"markus_huntsman_defence_debuff",
	"markus_huntsman_activated_ability_headshot_multiplier",
	"markus_huntsman_activated_ability_damage",
	"sienna_unchained_activated_ability_duration",
	"sienna_unchained_increased_defence_on_low_health",
	"sienna_unchained_defence_buff",
	"sienna_scholar_defence_on_disabled",
	"sienna_scholar_vent_damage_on_last_standing",
	"sienna_adept_activated_ability",
	"sienna_adept_defence_on_last_standing",
	"sienna_unchained_activated_ability",
	"kerillian_shade_activated_ability",
	"kerillian_shade_activated_ability_duration",
	"kerillian_shade_crit_hit_damage_on_low_health",
	"kerillian_shade_revive_speed_on_last_standing",
	"kerillian_shade_damage_on_grimoire_picked_up",
	"kerillian_maidenguard_activated_ability",
	"kerillian_maidenguard_activated_ability_invis_duration",
	"kerillian_maidenguard_defence_on_last_standing",
	"kerillian_maidenguard_passive_stamina_regen_buff",
	"kerillian_waywatcher_crit_hit_damage_on_high_health",
	"passive_career_bw_1_1",
	"passive_career_bw_1_2",
	"warpfire_thrower_ground_base",
	"warpfire_thrower_face_base",
	"sienna_adept_ability_trail",
	"burning_1W_dot",
	"burning_3W_dot",
	"beam_burning_dot",
	"burning_flamethrower_dot",
	"burning_dot",
	"arrow_poison_dot",
	"aoe_poison_dot",
	"weapon_bleed_dot_test",
	"weapon_bleed_dot_maidenguard",
	"slow_grenade_slow",
	"chaos_zombie_explosion",
	"chaos_magic_missile",
	"chaos_slow_bomb_missile",
	"vermintide_face_base",
	"catacombs_corpse_pit",
	"traits_heal_on_crit",
	"traits_melee_shield_on_assist",
	"trait_necklace_no_healing_health_regen",
	"trait_necklace_heal_self_on_heal_other",
	"trait_necklace_increased_healing_received",
	"trait_necklace_damage_taken_reduction_on_heal",
	"trait_trinket_grenade_damage_taken",
	"traits_melee_increase_damage_on_block",
	"traits_melee_counter_push_power",
	"traits_ranged_restore_stamina_headshot",
	"traits_ranged_remove_overcharge_on_crit",
	"traits_ranged_increase_power_level_vs_armour_crit",
	"traits_ranged_consecutive_hits_increase_power",
	"properties_curse_resistance",
	"properties_protection_skaven",
	"properties_protection_chaos",
	"properties_protection_aoe",
	"properties_crit_boost",
	"properties_power_vs_skaven",
	"properties_power_vs_chaos",
	"properties_power_vs_unarmoured",
	"properties_power_vs_armoured",
	"properties_power_vs_large",
	"properties_power_vs_frenzy",
	"properties_health",
	"properties_revive_speed",
	"twitch_speed_boost",
	"twitch_damage_boost",
	"twitch_cooldown_reduction_boost",
	"twitch_no_overcharge_no_ammo_reloads",
	"twitch_health_regen",
	"twitch_health_degen",
	"twitch_grimoire_health_debuff",
	"twitch_power_boost_dismember",
	"trait_ring_potion_spread"
}
NetworkLookup.buff_data_types = {
	"n/a",
	"variable_value",
	"external_optional_multiplier"
}
NetworkLookup.group_buff_templates = {
	"grimoire"
}
NetworkLookup.proc_events = {
	"on_reload",
	"on_ammo_used",
	"on_unwield",
	"on_last_ammo_used",
	"on_gained_ammo_from_no_ammo"
}
NetworkLookup.coop_feedback = {
	"give_item",
	"aid",
	"save",
	"heal",
	"assisted_respawn",
	"revive",
	"discarded_grimoire"
}
NetworkLookup.projectile_templates = {
	"throw_trajectory",
	"grenade_impact",
	"explosion_impact",
	"arrow_impact",
	"pickup_impact",
	"explosion",
	"spawn_pickup",
	"skull_staff",
	"direct_impact"
}
NetworkLookup.overpowered_templates = create_lookup({}, PlayerUnitMovementSettings.overpowered_templates)
NetworkLookup.vortex_templates = create_lookup({}, VortexTemplates)
NetworkLookup.tentacle_templates = create_lookup({}, TentacleTemplates)
NetworkLookup.explosion_templates = create_lookup({
	"n/a"
}, ExplosionTemplates)
NetworkLookup.area_damage_templates = create_lookup({}, AreaDamageTemplates.templates)
NetworkLookup.liquid_area_damage_templates = create_lookup({}, LiquidAreaDamageTemplates.templates)
NetworkLookup.damage_wave_templates = create_lookup({}, DamageWaveTemplates.templates)
NetworkLookup.damage_blob_templates = create_lookup({}, DamageBlobTemplates.templates)
NetworkLookup.game_end_reasons = {
	"won",
	"lost",
	"start_game",
	"reload"
}
NetworkLookup.set_wounded_reasons = {
	"healed",
	"knocked_down",
	"revived",
	"reached_min_health"
}
NetworkLookup.level_keys = create_lookup({
	"next_level",
	"n/a"
}, LevelSettings)
NetworkLookup.act_keys = create_lookup({
	"n/a"
}, GameActs)
NetworkLookup.game_mode_keys = create_lookup({}, GameModeSettings)
NetworkLookup.fatigue_types = create_lookup({}, PlayerUnitStatusSettings.fatigue_point_costs)
NetworkLookup.pickup_names = create_lookup({}, AllPickups)
NetworkLookup.pickup_spawn_types = {
	"spawner",
	"guaranteed",
	"triggered",
	"dropped",
	"thrown",
	"limited",
	"loot",
	"rare",
	"debug",
	"buff"
}
NetworkLookup.effects = {
	"n/a",
	"fx/chr_kruber_shockwave",
	"fx/chr_corruptor_beam",
	"fx/chr_corruptor_in",
	"fx/chr_corruptor_out",
	"fx/handgonne_muzzle_flash",
	"fx/impact_blood",
	"fx/bullet_sand",
	"fx/wpnfx_burning_head_trail",
	"fx/wpnfx_pistol_bullet_trail",
	"fx/wpnfx_barrel_explosion",
	"fx/wpnfx_grenade_impact",
	"fx/wpnfx_frag_grenade_impact",
	"fx/wpnfx_smoke_grenade_impact",
	"fx/wpnfx_smoke_grenade_impact_Upgraded",
	"fx/wpnfx_fire_grenade_impact",
	"fx/wpnfx_warplock_pistol_impact_flesh",
	"fx/chr_player_fak_healed",
	"fx/wpnfx_poison_wind_globe_impact",
	"fx/chr_gutter_death",
	"fx/screenspace_poison_globe_impact",
	"fx/wpnfx_fire_grenade_impact_remains",
	"fx/wpnfx_poison_arrow_impact",
	"fx/wpnfx_poison_arrow_impact_clan_rat",
	"fx/wpnfx_poison_arrow_impact_storm_vermin",
	"fx/wpnfx_poison_arrow_impact_globadier",
	"fx/wpnfx_poison_arrow_impact_gutter_runner",
	"fx/wpnfx_staff_beam_trail",
	"fx/wpnfx_staff_beam_trail_3p",
	"fx/wpnfx_staff_beam_target",
	"fx/wpnfx_staff_geiser_charge",
	"fx/wpnfx_staff_geiser_fire_small",
	"fx/wpnfx_staff_geiser_fire_medium",
	"fx/wpnfx_staff_geiser_fire_large",
	"fx/chr_gutter_foff",
	"fx/chr_chaos_sorcerer_teleport",
	"fx/chr_chaos_sorcerer_teleport_direction",
	"fx/chr_stormvermin_champion_beam_impact_dot",
	"fx/chr_stormvermin_champion_beam_anticipation_dot",
	"spawn_cylinder",
	"fx/wpnfx_flamethrower_1p_01",
	"fx/wpnfx_flamethrower_01",
	"fx/wpnfx_flamethrower_hit_01",
	"fx/wpnfx_range_crit_01",
	"fx/chaos_sorcerer_plague_wave_hit_01",
	"fx/chr_nurgle_explosion_01",
	"fx/doomwheel_explosion",
	"fx/warp_lightning_bolt_impact",
	"fx/chr_iron_breaker_ability_taunt",
	"fx/chr_grey_seer_lightning_hit_02",
	"fx/chr_chaos_sorcerer_boss_projectile_flies_impact"
}
NetworkLookup.light_weight_projectile_particle_effects = create_lookup({}, LightWeightProjectileParticleEffects)
NetworkLookup.localized_strings = {
	"level_completed",
	"attackers_win",
	"flag_captured",
	"flag_lost_fallback",
	"defenders_win",
	"attackers_zone",
	"defenders_zone",
	"neutral_zone"
}
NetworkLookup.surface_material_effects = create_lookup({}, MaterialEffectMappings)
NetworkLookup.local_player_id = {
	"local_player_1",
	"local_player_2",
	"local_player_3",
	"local_player_4",
	"player_bot_1",
	"player_bot_2",
	"player_bot_3",
	"player_bot_4",
	"enemy_main"
}
NetworkLookup.interactions = create_lookup({}, InteractionDefinitions)
NetworkLookup.interaction_states = {
	"starting_interaction",
	"doing_interaction",
	"waiting_to_interact",
	"stopping_interaction"
}
NetworkLookup.statuses = {
	"knocked_down",
	"pounced_down",
	"dead",
	"blocking",
	"wounded",
	"revived",
	"pushed",
	"pack_master_pulling",
	"pack_master_dragging",
	"pack_master_hoisting",
	"pack_master_hanging",
	"pack_master_dropping",
	"pack_master_released",
	"pack_master_unhooked",
	"chaos_corruptor_grabbed",
	"chaos_corruptor_dragging",
	"chaos_corruptor_released",
	"crouching",
	"pulled_up",
	"ready_for_assisted_respawn",
	"assisted_respawning",
	"respawned",
	"ladder_climbing",
	"ledge_hanging",
	"overcharge_exploding",
	"dodging",
	"grabbed_by_tentacle",
	"grabbed_by_chaos_spawn",
	"in_vortex",
	"near_vortex",
	"invisible",
	"in_end_zone",
	"in_liquid",
	"overpowered"
}
NetworkLookup.grabbed_by_tentacle = {
	"portal_hanging",
	"portal_consume",
	"portal_release"
}
NetworkLookup.grabbed_by_chaos_spawn = {
	"grabbed",
	"beating_with",
	"thrown_away",
	"chewed_on",
	"idle"
}
NetworkLookup.sound_events = {
	"weapon_stormvermin_champion_sword_block",
	"bullet_pass_by",
	"enemy_horde_stinger",
	"enemy_horde_stingers_plague_monk",
	"enemy_horde_chaos_stinger",
	"enemy_terror_event_stinger",
	"horde_stinger_skaven_gutter_runner",
	"chr_vce_enemy_idle",
	"player_combat_weapon_grenade_explosion",
	"player_combat_weapon_drakegun_fire",
	"Play_enemy_globadier_suicide_start",
	"Play_enemy_combat_globadier_suicide_explosion",
	"Stop_enemy_foley_globadier_boiling_loop",
	"Play_loot_rat_near_sound",
	"player_combat_weapon_staff_fireball_fire",
	"player_combat_weapon_drakepistol_fire",
	"weapon_staff_spark_spear_charged",
	"weapon_staff_spark_spear",
	"Play_career_ability_kerillian_shade_enter",
	"Play_career_ability_kerillian_shade_loop",
	"Play_career_ability_kerillian_shade_exit",
	"Play_career_ability_kerillian_shade_loop_husk",
	"Stop_career_ability_kerillian_shade_loop_husk",
	"Play_career_ability_markus_huntsman_enter",
	"Play_career_ability_markus_huntsman_loop",
	"Play_career_ability_markus_huntsman_exit",
	"Play_career_ability_markus_huntsman_loop_husk",
	"Stop_career_ability_markus_huntsman_loop_husk",
	"Play_career_ability_bardin_ranger_enter",
	"Play_career_ability_bardin_ranger_exit",
	"Play_career_ability_bardin_slayer_enter",
	"Play_career_ability_bardin_slayer_exit",
	"Play_career_ability_victor_zealot_enter",
	"Play_career_ability_victor_zealot_exit",
	"Play_career_ability_sienna_unchained",
	"player_combat_weapon_staff_geiser_fire",
	"player_combat_weapon_bow_fire_light_poison",
	"player_combat_weapon_bow_fire_heavy_poison",
	"player_combat_weapon_bow_fire_light_homing",
	"player_combat_weapon_bow_fire_heavy_homing",
	"player_combat_weapon_bow_fire_heavy",
	"player_combat_weapon_bow_fire_light",
	"player_combat_weapon_shortbow_fire_light_poison",
	"player_combat_weapon_shortbow_fire_heavy_poison",
	"player_combat_weapon_shortbow_fire_light_homing",
	"player_combat_weapon_shortbow_fire_heavy_homing",
	"player_combat_weapon_shortbow_fire_heavy",
	"player_combat_weapon_shortbow_fire_light",
	"storm_vermin_patrol_formate",
	"Play_stormvermin_patrol_foley",
	"storm_vermin_patrol_player_spotted",
	"storm_vermin_patrol_charge",
	"Play_stormvemin_patrol_formated",
	"Play_stormvermin_patrol_forming",
	"Play_stormvermin_patrol_voice",
	"Play_stormvermin_patrol_shield_foley",
	"chaos_marauder_patrol_charge",
	"chaos_marauder_patrol_foley",
	"chaos_marauder_patrol_formate",
	"chaos_marauder_patrol_formated",
	"chaos_marauder_patrol_forming",
	"chaos_marauder_patrol_player_spotted",
	"chaos_marauder_patrol_voice",
	"blunt_hit_shield_wood",
	"slashing_hit_shield_wood",
	"stab_hit_shield_wood",
	"blunt_hit_shield_metal",
	"slashing_hit_shield_metal",
	"stab_hit_shield_metal",
	"weapon_staff_fire_cone",
	"Play_clan_rat_attack_player_back_vce",
	"Play_clan_rat_attack_player_vce",
	"Play_clan_rat_attack_husk_vce",
	"Play_clan_rat_attack_vce",
	"Play_slave_rat_attack_player_vce",
	"Play_slave_rat_attack_husk_vce",
	"Play_enemy_plague_monk_death_new_vce",
	"Play_hud_matchmaking_countdown",
	"Play_hud_enemy_attack_back_hit",
	"player_combat_weapon_repeating_crossbow_elf_fire",
	"player_combat_weapon_staff_charge_husk",
	"stop_player_combat_weapon_staff_charge_husk",
	"player_combat_weapon_staff_fire_beam_husk",
	"stop_player_combat_weapon_staff_fire_beam_husk",
	"Play_stormfiend_ambience",
	"Stop_stormfiend_ambience",
	"Play_enemy_marauder_death_vce",
	"Play_enemy_marauder_swing_vce",
	"Play_enemy_marauder_attack_vce",
	"Play_enemy_marauder_attack_player_vce",
	"Play_enemy_marauder_attack_husk_vce",
	"Play_enemy_marauder_attack_player_back_vce",
	"Play_enemy_berserker_attack_player_vce",
	"ecm_gameplay_backstab_a_player",
	"ecm_gameplay_flanking_players",
	"Play_breed_triggered_sound",
	"Play_enemy_vce_chaos_warrior_die",
	"Play_plague_monk_frenzy_attack_vce",
	"Play_plague_monk_heavy_attack_vce",
	"Play_enemy_plague_monk_start_frenzy",
	"Play_enemy_sorcerer_tentacle_foley_attack_swing",
	"Play_enemy_sorcerer_tentacle_foley_player_grabbed",
	"Stop_enemy_sorcerer_portal_loop",
	"Play_enemy_sorcerer_portal_puke",
	"executioner_sword_critical",
	"Play_enemy_stormvermin_champion_electric_floor",
	"Play_stormfiend_torch_loop",
	"Stop_stormfiend_torch_loop",
	"chaos_sorcerer_vortex_summoning",
	"chaos_sorcerer_plague_summoning",
	"Play_enemy_vce_chaos_warrior_taunt",
	"chaos_sorcerer_plague_targeting_dwarf",
	"chaos_sorcerer_plague_targeting_elf",
	"chaos_sorcerer_plague_targeting_saltspyre",
	"chaos_sorcerer_plague_targeting_soldier",
	"chaos_sorcerer_plague_targeting_wizard",
	"Play_enemy_troll_vce_alert",
	"Play_enemy_troll_vce_idle",
	"Play_enemy_troll_vce_hurt",
	"Play_enemy_champion_axe_impact",
	"Play_enemy_champion_throw_axe",
	"Play_enemy_champion_pull_axe",
	"Stop_enemy_champion_axe",
	"weapon_sword_block",
	"Play_player_combat_crit_hit_3D",
	"chaos_corruptor_spawning",
	"chaos_corruptor_spawning_stop",
	"chaos_corruptor_corrupting",
	"chaos_corruptor_corrupting_stop",
	"Play_emitter_grey_seer_lightning_bolt_hit"
}
NetworkLookup.global_parameter_names = {
	"occupied_slots_percentage",
	"stormfiend_mood",
	"demo_slowmo",
	"champion_crowd_voices",
	"champion_crowd_voices_walla"
}
local weapon_sound_events = {}

for _, weapon_table in pairs(Weapons) do
	for _, action_table in pairs(weapon_table.actions) do
		for _, sub_action_table in pairs(action_table) do
			if sub_action_table.impact_sound_event then
				weapon_sound_events[sub_action_table.impact_sound_event] = true
			end

			if sub_action_table.no_damage_impact_sound_event then
				weapon_sound_events[sub_action_table.no_damage_impact_sound_event] = true
			end
		end
	end
end

NetworkLookup.sound_events = create_lookup(NetworkLookup.sound_events, weapon_sound_events)
local attack_template_sound_types = {}

for _, attack_template in pairs(AttackTemplates) do
	local sound_type = attack_template.sound_type

	if sound_type then
		attack_template_sound_types[sound_type] = true
	end
end

NetworkLookup.melee_impact_sound_types = create_lookup({
	"n/a"
}, attack_template_sound_types)
NetworkLookup.sound_event_param_names = {
	"drakegun_charge_fire",
	"enemy_vo"
}
NetworkLookup.sound_event_param_string_values = {
	"skaven_slave"
}
NetworkLookup.gate_states = {
	"open",
	"closed"
}
NetworkLookup.movement_funcs = {
	"none",
	"update_local_animation_driven_movement"
}
NetworkLookup.ai_inventory = {
	"empty",
	"sword",
	"dual_sword",
	"dual_axes",
	"spear",
	"halberd",
	"halberd_stormvermin_champion",
	"sword_and_shield",
	"stormvermin_sword_and_shield",
	"stormvermin_dual_wield",
	"pack_master",
	"loot_rat_sack",
	"ratlinggun",
	"rat_ogre",
	"gutter_runner",
	"chaos_troll",
	"chaos_sorcerer",
	"chaos_sorcerer_vortex",
	"chaos_exalted_sorcerer",
	"mace",
	"axe",
	"warrior_axe",
	"exalted_axe",
	"exalted_spawn_axe",
	"axe_2h",
	"warpfiregun",
	"marauder_mace",
	"marauder_sword_and_shield",
	"raider_axe_2h",
	"berzerker_dual_axes",
	"warlord_dual_setups",
	"fanatic",
	"zombie_blobs"
}
NetworkLookup.connection_fails = {
	"no_peer_data_on_join",
	"no_peer_data_on_enter_game",
	"no_peer_data_on_drop_in",
	"no_peer_data_on_connection_state",
	"no_peer_data_on_game_object_sync_done",
	"unable_to_acquire_profile",
	"host_left_game",
	"unknown_error",
	"full_server",
	"eac_authorize_failed"
}
NetworkLookup.health_statuses = {
	"alive",
	"respawn",
	"disabled",
	"knocked_down",
	"dead",
	"unhurt",
	"wounded",
	"down"
}
NetworkLookup.dialogue_events = {
	"startled",
	"backstab",
	"pwg_projectile_hit",
	"enemy_attack",
	"surrounded",
	"knocked_down",
	"throwing_item",
	"running",
	"commanding",
	"shouting",
	"command_change_target",
	"command_globadier",
	"command_gutter_runner",
	"command_rat_ogre",
	"stance_triggered",
	"on_healing_draught",
	"falling",
	"landing",
	"activate_ability",
	"activate_ability_taunt",
	"flanking",
	"reload_failed"
}
NetworkLookup.dialogue_event_data_names = {
	"num_units",
	"distance",
	"height_distance",
	"attack_tag",
	"rat_ogre_change_target",
	"pwg_projectile",
	"pwg_suicide_run",
	"current_amount",
	"thrower_name",
	"bomb_miss",
	"target_name",
	"has_shield",
	"witch_hunter",
	"empire_soldier",
	"dwarf_ranger",
	"bright_wizard",
	"wood_elf",
	"item_type",
	"grenade",
	"grimoire",
	"torch",
	"grain_sack",
	"beer_barrel",
	"explosive_barrel",
	"lamp_oil",
	"explosive_barrel_objective",
	"door_stick",
	"drachenfels_statue",
	"dwarf_explosive_barrel",
	"cannon_ball",
	"training_dummy",
	"training_dummy_armored",
	"stance_type",
	"offensive",
	"defensive",
	"horde",
	"horde_type",
	"ambush",
	"vector",
	"item_name",
	"healthkit_first_aid_kit_01",
	"ranged_weapon",
	"fail_reason",
	"out_of_ammo"
}
NetworkLookup.hero_names = {
	"dwarf_ranger",
	"wood_elf",
	"bright_wizard",
	"witch_hunter",
	"empire_soldier",
	"empire_soldier_tutorial"
}
NetworkLookup.music_states = {
	"in_combat"
}
NetworkLookup.liquid_damage_blob_states = {
	"filled",
	"remove",
	"destroy"
}
NetworkLookup.damage_wave_states = {
	"arrived",
	"impact",
	"hide",
	"running"
}
NetworkLookup.music_group_states = {
	"high_battle",
	"med_battle",
	"low_battle",
	"normal",
	"need_help",
	"knocked_down",
	"dead",
	"explore",
	"lost",
	"survival_lost",
	"won",
	"pre_horde",
	"pre_ambush",
	"horde",
	"horde_chaos",
	"pre_ambush_chaos",
	"no_boss",
	"rat_ogre",
	"stormfiend",
	"chaos_spawn",
	"troll",
	"champion_skaven_stormvermin",
	"storm_vermin_patrol",
	"champion_chaos_exalted_warcamp",
	"champion_chaos_exalted_norsca",
	"champion_chaos_exalted_sorcerer",
	"champion_skaven_stormvermin_warlord",
	"champion_skaven_grey_seer"
}
NetworkLookup.locations = {
	"test",
	"test2"
}
NetworkLookup.statistics = {
	"elven_ruins_speed_event",
	"farmlands_speed_event",
	"bell_speed_event",
	"mines_speed_event",
	"skittergate_speed_event",
	"exalted_champion_charge_chaos_warrior",
	"military_statue_kill_chaos_warriors",
	"halescourge_tornado_enemies",
	"storm_vermin_warlord_kills_enemies",
	"nurgle_bathed_all",
	"ussingen_used_no_barrels",
	"forest_fort_kill_cannonball",
	"catacombs_added_souls",
	"globadier_kill_before_throwing",
	"globadier_kill_during_suicide",
	"globadier_enemies_killed_by_poison",
	"warpfire_kill_before_shooting",
	"warpfire_kill_on_power_cell",
	"warpfire_enemies_killed_by_warpfire",
	"pack_master_dodged_attack",
	"pack_master_kill_abducting_ally",
	"pack_master_rescue_hoisted_ally",
	"gutter_runner_killed_on_pounce",
	"gutter_runner_push_on_pounce",
	"gutter_runner_push_on_target_pounced",
	"corruptor_killed_at_teleport_time",
	"corruptor_dodged_attack",
	"corruptor_killed_while_grabbing",
	"vortex_sorcerer_killed_while_summoning",
	"vortex_sorcerer_killed_while_ally_in_vortex",
	"vortex_sorcerer_killed_by_melee",
	"ratling_gunner_killed_by_melee",
	"ratling_gunner_killed_while_shooting",
	"ratling_gunner_blocked_shot",
	"chaos_spawn_killed_while_grabbing",
	"chaos_spawn_killed_without_having_grabbed",
	"chaos_troll_killed_without_regen",
	"chaos_troll_killed_without_bile_damage",
	"rat_ogre_killed_mid_leap",
	"rat_ogre_killed_without_dealing_damage",
	"stormfiend_killed_without_burn_damage",
	"stormfiend_killed_on_controller",
	"killed_lord_as_last_player_standing"
}
local music_group_states = {}
local music_lookups = NetworkLookup.music_group_states

for _, state in ipairs(music_lookups) do
	music_group_states[state] = true
end

for level, settings in pairs(LevelSettings) do
	if type(settings) == "table" then
		for i, location in ipairs(settings.locations) do
			NetworkLookup.locations[#NetworkLookup.locations + 1] = location
		end

		local won_state = settings.music_won_state

		if won_state and not music_group_states[won_state] then
			music_lookups[#music_lookups + 1] = won_state
			music_group_states[won_state] = true
		end
	end
end

NetworkLookup.tutorials = {
	"skaven_loot_rat",
	"skaven_storm_vermin",
	"skaven_storm_vermin_champion",
	"skaven_storm_vermin_commander",
	"skaven_storm_vermin_warlord",
	"skaven_poison_wind_globadier",
	"skaven_gutter_runner",
	"skaven_pack_master",
	"skaven_ratling_gunner",
	"skaven_rat_ogre",
	"skaven_stormfiend",
	"skaven_stormfiend_boss",
	"skaven_stormfiend_demo",
	"skaven_warpfire_thrower",
	"chaos_troll",
	"chaos_spawn",
	"chaos_spawn_exalted_champion_norsca",
	"chaos_zombie",
	"chaos_exalted_champion_warcamp",
	"chaos_exalted_champion_norsca"
}
NetworkLookup.objective_tooltips = {
	"objective_pickup",
	"objective_socket",
	"objective_unit"
}
NetworkLookup.pacing = {
	"pacing_build_up",
	"pacing_sustain_peak",
	"pacing_peak_fade",
	"pacing_relax"
}
NetworkLookup.game_ping_reply = {
	"lobby_ok",
	"lobby_id_mismatch",
	"game_mode_ended",
	"not_searching_for_players",
	"lobby_has_active_deed",
	"obsolete_request"
}
NetworkLookup.sync_names = {
	"ferry_lady",
	"ferry_lady2"
}
NetworkLookup.tentacle_template = {
	"attack",
	"evaded",
	"release",
	"fate_sealed"
}
NetworkLookup.matchmaking_regions = {
	"south_east_asia",
	"northern_europe",
	"western_europe",
	"eastern_europe",
	"southern_europe",
	"middle_east",
	"russia",
	"north_america",
	"south_america",
	"south_africa",
	"australia",
	"south_asia",
	"china",
	"europe",
	"africa"
}
NetworkLookup.debug_commands = {
	"load_patched_items_into_backend",
	"set_time_scale",
	"set_time_paused"
}
NetworkLookup.twitch_rpc_types = {
	"rpc_add_client_twitch_vote",
	"rpc_finish_twitch_vote",
	"rpc_disconnected_from_twitch"
}
NetworkLookup.twitch_vote_types = {
	"standard_vote",
	"multiple_choice"
}
NetworkLookup.twitch_vote_templates = create_lookup({
	"draw",
	"none"
}, TwitchVoteTemplates)
NetworkLookup.attack_templates = create_lookup({
	"n/a"
}, AttackTemplates)
NetworkLookup.damage_profiles = create_lookup({}, DamageProfileTemplates)
NetworkLookup.dot_type_lookup = create_lookup({
	"n/a"
}, DotTypeLookup)
NetworkLookup.boost_curves = create_lookup({}, BoostCurves)
NetworkLookup.boons = create_lookup({
	"n/a"
}, BoonTemplates)
NetworkLookup.weapon_skins = create_lookup({
	"n/a"
}, WeaponSkins.skins)
NetworkLookup.performance_titles = create_lookup({
	"n/a"
}, PerformanceTitles.titles)

local function statistics_path_names(path_names, stat)
	if not stat.value then
		for stat_name, stat_definition in pairs(stat) do
			path_names[stat_name] = true

			statistics_path_names(path_names, stat_definition)
		end
	end
end

local path_names = {}

for category, stat_definitions in pairs(StatisticsDefinitions) do
	statistics_path_names(path_names, stat_definitions)
end

NetworkLookup.statistics_path_names = create_lookup({}, path_names)
NetworkLookup.mission_names = create_lookup({}, Missions)
NetworkLookup.projectile_gravity_settings = create_lookup({}, ProjectileGravitySettings)
NetworkLookup.voting_types = create_lookup({}, VoteTemplates)
NetworkLookup.session_stats = create_lookup({}, StatisticsDefinitions.session)
local lookup_table = {}
local flow_events = {}

for _, blueprint in pairs(TerrorEventBlueprints) do
	for _, event in ipairs(blueprint) do
		local name = event.flow_event_name

		if name and not event.disable_network_send then
			flow_events[name] = true
		end
	end
end

NetworkLookup.terror_flow_events = create_lookup({}, flow_events)
NetworkLookup.inventory_packages = dofile("scripts/network_lookup/inventory_package_list")
local career_packages = dofile("scripts/network_lookup/career_package_list")

table.append(NetworkLookup.inventory_packages, career_packages)

local paintings = {}

for _, orientations in pairs(Paintings) do
	for _, levels in pairs(orientations) do
		for _, name in pairs(levels) do
			paintings[name] = true
		end
	end
end

NetworkLookup.keep_decoration_paintings = create_lookup({}, paintings)

local function init(self, name)
	for index, str in ipairs(self) do
		fassert(not self[str], "[NetworkLookup.lua] Duplicate entry %q in %q.", str, name)

		self[str] = index
	end

	local index_error_print = "[NetworkLookup.lua] Table " .. name .. " does not contain key: "
	local meta = {
		__index = function (_, key)
			error(index_error_print .. tostring(key))
		end
	}

	setmetatable(self, meta)
end

local DialogueLookup = DialogueLookup
NetworkLookup.dialogues = DialogueLookup
local MarkerLookup = MarkerLookup
NetworkLookup.markers = MarkerLookup or {}

for key, lookup_table in pairs(NetworkLookup) do
	init(lookup_table, key)
end

return
