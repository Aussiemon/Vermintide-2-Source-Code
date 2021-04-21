require("scripts/settings/environmental_hazards")
require("scripts/settings/level_settings")
require("scripts/settings/level_unlock_settings")
require("scripts/settings/game_mode_settings")
require("scripts/settings/player_data")
require("scripts/settings/equipment/attachments")
require("scripts/settings/equipment/cosmetics")
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
require("scripts/settings/spawn_unit_templates")
require("scripts/unit_extensions/weaves/weave_item_templates")
require("scripts/settings/unlock_settings")
DLCUtils.require_list("statistics_database")
require("scripts/settings/twitch_settings")
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
	"dialogues/generated/lookup_bright_wizard_honduras",
	"dialogues/generated/lookup_dwarf_ranger_honduras",
	"dialogues/generated/lookup_empire_soldier_honduras",
	"dialogues/generated/lookup_enemies",
	"dialogues/generated/lookup_player_conversations_honduras",
	"dialogues/generated/lookup_special_occasions_honduras",
	"dialogues/generated/lookup_witch_hunter_honduras",
	"dialogues/generated/lookup_wood_elf_honduras",
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
	"dialogues/generated/lookup_hub_conversations",
	"dialogues/generated/lookup_ping_dialogues_honduras",
	"dialogues/generated/lookup_pactsworn_player_vo",
	"dialogues/generated/lookup_vs_player_vo",
	"dialogues/generated/lookup_wood_elf_generic_vo",
	"dialogues/generated/lookup_empire_soldier_generic_vo",
	"dialogues/generated/lookup_bright_wizard_generic_vo",
	"dialogues/generated/lookup_dwarf_ranger_generic_vo",
	"dialogues/generated/lookup_witch_hunter_generic_vo",
	"dialogues/generated/lookup_weather_vo",
	"dialogues/generated/lookup_fleur_conversations"
}
NetworkLookup = {}

function create_lookup(lookup, hashtable)
	local i = #lookup

	for key, _ in pairs(hashtable) do
		i = i + 1
		lookup[i] = key
	end

	return lookup
end

DLCUtils.append("dialogue_lookup", dialogue_lookup_tables)

for _, dlc in pairs(DLCSettings) do
	local lookups = dlc.network_lookups

	if lookups then
		for name, table_data in pairs(lookups) do
			if type(table_data) == "table" then
				local table_name = table_data.table_name
				local base_table = table_data.base_table or {}
				NetworkLookup[name] = create_lookup(base_table, rawget(_G, table_name))
			else
				local table_names = string.split(table_data, ".")
				local table_values = rawget(_G, table_names[1])

				for i = 2, #table_names, 1 do
					local table_name = table_names[i]
					table_values = table_values[table_name]
				end

				NetworkLookup[name] = create_lookup({}, table_values)
			end
		end
	end
end

for _, dialogue_lookup_table in ipairs(dialogue_lookup_tables) do
	if Application.can_get("lua", dialogue_lookup_table) then
		dofile(dialogue_lookup_table)
	end

	if Application.can_get("lua", dialogue_lookup_table .. "_markers") then
		dofile(dialogue_lookup_table .. "_markers")
	end
end

dofile("scripts/network_lookup/anims_lookup_table")

NetworkLookup.item_drop_reasons = {
	"death",
	"shield_break"
}
local attachments_table = {}

for attachment_name, _ in pairs(Attachments) do
	attachments_table[#attachments_table + 1] = attachment_name
end

NetworkLookup.cosmetics = create_lookup({
	"default"
}, Cosmetics)
local item_template_table = {}
NetworkLookup.actions = {}
NetworkLookup.sub_actions = {}

for item_template_name, item_template in pairs(Weapons) do
	item_template_table[#item_template_table + 1] = item_template_name

	for action_name, sub_actions in pairs(item_template.actions) do
		if not table.contains(NetworkLookup.actions, action_name) then
			NetworkLookup.actions[#NetworkLookup.actions + 1] = action_name
		end

		for sub_action_name, _ in pairs(sub_actions) do
			if not table.contains(NetworkLookup.sub_actions, sub_action_name) then
				NetworkLookup.sub_actions[#NetworkLookup.sub_actions + 1] = sub_action_name
			end
		end
	end
end

NetworkLookup.item_names = create_lookup({
	"n/a"
}, ItemMasterList)
NetworkLookup.item_template_names = {
	"n/a"
}

table.append(NetworkLookup.item_template_names, item_template_table)
table.append(NetworkLookup.item_template_names, attachments_table)

NetworkLookup.equipment_slots = {}

for _, slot_settings in ipairs(InventorySettings.slots) do
	NetworkLookup.equipment_slots[#NetworkLookup.equipment_slots + 1] = slot_settings.name
end

NetworkLookup.mutator_templates = create_lookup({}, MutatorTemplates)
NetworkLookup.breeds = create_lookup({}, Breeds)

for breed_name, breed in pairs(PlayerBreeds) do
	NetworkLookup.breeds[#NetworkLookup.breeds + 1] = breed_name
end

local temp = {}

for _, breed in pairs(Breeds) do
	local translation = breed.hitbox_ragdoll_translation

	if translation then
		for _, ragdoll_actor in pairs(translation) do
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
	"life_drain",
	"overcharge",
	"knockdown_bleed",
	"volume_insta_kill",
	"career_ability",
	"charge_ability_hit",
	"charge_ability_hit_blast",
	"corpse_explosion",
	"buff",
	"life_tap"
}

for hazard, _ in pairs(EnvironmentalHazards) do
	damage_sources[#damage_sources + 1] = hazard
end

table.append(damage_sources, NetworkLookup.item_names)
table.append(damage_sources, NetworkLookup.breeds)
DLCUtils.append("network_damage_sources", damage_sources)

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
	"units/beings/player/skaven_gutter_runner/chr_skaven_gutter_runner",
	"units/beings/player/skaven_pack_master/chr_skaven_pack_master",
	"units/beings/player/skaven_wind_globadier/chr_skaven_wind_globadier",
	"units/beings/player/chaos_sorcerer_corruptor/chr_chaos_sorcerer_corruptor",
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
	"units/beings/enemies/skaven_stormvermin/chr_skaven_stormvermin_baked",
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
	"units/weapons/player/wpn_bullet_temp/wpn_bullet_temp_3ps",
	"units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_3ps",
	"units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1_3ps",
	"units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t2_3ps",
	"units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t3_3ps",
	"units/weapons/player/wpn_we_quiver_t1/wpn_we_poison_arrow_t1_3ps",
	"units/weapons/player/wpn_we_quiver_t1/wpn_we_homing_arrow_t1_3ps",
	"units/weapons/player/wpn_we_quiver_t1/wpn_we_tripple_arrow_t1_3ps",
	"units/weapons/player/wpn_burning_head/wpn_burning_head_3p",
	"units/weapons/player/wpn_burning_head/wpn_burning_head_3ps",
	"units/weapons/player/wpn_emp_arrows/wpn_es_arrow_t1_3ps",
	"units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_01_t1_3p",
	"units/weapons/player/wpn_emp_grenade_01_t2/wpn_emp_grenade_01_t2_3p",
	"units/weapons/player/wpn_emp_grenade_02_t1/wpn_emp_grenade_02_t1_3p",
	"units/weapons/player/wpn_emp_grenade_02_t2/wpn_emp_grenade_02_t2_3p",
	"units/weapons/player/wpn_emp_grenade_03_t1/wpn_emp_grenade_03_t1_3p",
	"units/weapons/player/wpn_emp_grenade_03_t2/wpn_emp_grenade_03_t2_3p",
	"units/weapons/player/fireball_projectile/fireball_projectile_3ps",
	"units/weapons/player/fireball_projectile/charged_fireball_projectile_3ps",
	"units/weapons/projectile/insect_swarm_missile/insect_swarm_missile_01",
	"units/weapons/projectile/strike_missile/strike_missile",
	"units/weapons/projectile/strike_missile_drachenfels/strike_missile_drachenfels",
	"units/weapons/projectile/warp_lightning_bolt/warp_lightning_bolt",
	"units/weapons/enemy/wpn_overpowering_blob/wpn_overpowering_blob",
	"units/weapons/player/wpn_dwarf_smoke_grenade_01/wpn_dwarf_smoke_grenade_01_3p",
	"units/weapons/player/pup_potion/pup_potion_t1",
	"units/weapons/player/pup_potion/pup_potion_buff",
	"units/weapons/player/pup_first_aid_kit/pup_first_aid_kit",
	"units/weapons/player/pup_first_aid/pup_first_aid",
	"units/props/dice_bowl/pup_loot_die",
	"units/weapons/player/pup_lore_page/pup_lore_page_01",
	"units/weapons/player/pup_sacks/pup_sacks_01",
	"units/gameplay/timed_door_base_02/pup_timed_door_stick",
	"units/weapons/player/pup_explosive_barrel/pup_explosive_barrel_01",
	"units/weapons/player/pup_oil_jug_01/pup_oil_jug_01",
	"units/weapons/player/pup_explosive_barrel/pup_gun_powder_barrel_01",
	"units/weapons/player/pup_grenades/pup_grenade_01_t1",
	"units/weapons/player/pup_grenades/pup_grenade_01_t2",
	"units/weapons/player/pup_grenades/pup_grenade_03_t1",
	"units/weapons/player/pup_grenades/pup_grenade_03_t2",
	"units/weapons/player/pup_scrolls/pup_scroll_t1",
	"units/weapons/player/pup_ammo_box/pup_ammo_box",
	"units/weapons/player/pup_ammo_box/pup_ammo_box_limited",
	"units/weapons/player/pup_torch/pup_torch",
	"units/weapons/player/pup_shadow_torch/pup_shadow_torch",
	"units/weapons/player/pup_grimoire_01/pup_grimoire_01",
	"units/weapons/player/pup_side_objective_tome/pup_side_objective_tome_01",
	"units/weapons/player/pup_cannon_ball_01/pup_cannon_ball_01",
	"units/weapons/player/wpn_cannon_ball_01/wpn_cannon_ball_01",
	"units/weapons/player/wpn_cannon_ball_01/wpn_cannon_ball_01_3p",
	"units/weapons/player/pup_gargoyle_head/pup_gargoyle_head_01",
	"units/weapons/player/pup_shadow_gargoyle_head/pup_shadow_gargoyle_head_01",
	"units/weapons/player/wpn_shadow_flare/wpn_shadow_flare",
	"units/weapons/player/wpn_shadow_flare/wpn_shadow_flare_3p",
	"units/weapons/player/wpn_gargoyle_head/wpn_gargoyle_head",
	"units/weapons/player/pup_magic_crystal/pup_magic_crystal",
	"units/weapons/player/wpn_magic_crystal/wpn_magic_crystal",
	"units/weapons/player/wpn_magic_crystal/wpn_magic_crystal_3p",
	"units/weapons/player/wpn_shadow_gargoyle_head/wpn_shadow_gargoyle_head",
	"units/weapons/player/wpn_gargoyle_head/wpn_gargoyle_head_3p",
	"units/weapons/player/wpn_shadow_gargoyle_head/wpn_shadow_gargoyle_head_3p",
	"units/weapons/player/pup_potion_01/pup_potion_extra_01",
	"units/weapons/player/pup_potion_01/pup_potion_healing_01",
	"units/weapons/player/pup_potion_01/pup_potion_speed_01",
	"units/weapons/player/pup_potion_01/pup_potion_strenght_01",
	"units/weapons/player/pup_painting/pup_painting_scraps",
	"units/gameplay/training_dummy/training_dummy",
	"units/gameplay/training_dummy/wpn_training_dummy",
	"units/gameplay/training_dummy/wpn_training_dummy_3p",
	"units/gameplay/training_dummy/training_dummy_armored",
	"units/gameplay/training_dummy/wpn_training_dummy_armored",
	"units/gameplay/training_dummy/wpn_training_dummy_armored_3p",
	"units/gameplay/training_dummy/training_dummy_skaven/training_dummy_skaven",
	"units/gameplay/training_dummy/training_dummy_skaven/wpn_training_dummy_skaven",
	"units/gameplay/training_dummy/training_dummy_skaven/wpn_training_dummy_skaven_3p",
	"units/weapons/player/pup_magic_barrel/pup_magic_barrel_01",
	"units/weapons/player/pup_magic_barrel/wpn_magic_barrel_01",
	"units/weapons/player/pup_magic_barrel/wpn_magic_barrel_01_3p",
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
	"units/gameplay/portal_blob/portalblob",
	"units/brushes/brush_thorn_life_mutator",
	"units/weave/life/life_thorn_bushes_mutator",
	"units/hub_elements/objective_unit",
	"units/props/lanterns/lantern_02/prop_lantern_02_blue_static",
	"units/fx/vfx_animation_death_spirit_02",
	"units/fx/essence_unit",
	"units/decals/decal_heavens_01",
	"units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1_3p",
	"units/weapons/player/wpn_we_quiver_t1/wpn_we_broken_arrow_01_3ps",
	"units/weapons/player/wpn_we_quiver_t1/wpn_we_broken_arrow_02_3ps",
	"units/weapons/player/wpn_we_quiver_t1/wpn_we_broken_arrow_03_3ps"
}

DLCUtils.append("husk_lookup", NetworkLookup.husks)

NetworkLookup.go_types = {
	"player",
	"ai_player",
	"player_sync_data",
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
	"ai_unit_beastmen_bestigor",
	"ai_unit_beastmen_minotaur",
	"damage_wave_unit",
	"damage_blob_unit",
	"ai_unit_vortex",
	"ai_unit_plague_wave_spawner",
	"player_projectile_unit",
	"aoe_projectile_unit",
	"aoe_projectile_unit_fixed_impact",
	"projectile_unit",
	"pickup_torch_unit",
	"pickup_torch_unit_init",
	"prop_projectile_unit",
	"pickup_projectile_unit",
	"pickup_projectile_unit_limited",
	"life_time_pickup_projectile_unit",
	"limited_owned_pickup_projectile_unit",
	"explosive_pickup_projectile_unit",
	"explosive_pickup_projectile_unit_limited",
	"true_flight_projectile_unit",
	"ai_true_flight_projectile_unit",
	"ai_true_flight_killable_projectile_unit",
	"ai_true_flight_projectile_unit_without_raycast",
	"prop_unit",
	"positioned_prop_unit",
	"objective_unit",
	"standard_unit",
	"overpowering_blob_unit",
	"network_synched_dummy_unit",
	"position_synched_dummy_unit",
	"buff_aoe_unit",
	"thrown_weapon_unit",
	"aoe_unit",
	"thorn_bush_unit",
	"shadow_flare_light",
	"pickup_unit",
	"life_time_pickup_unit",
	"limited_owned_pickup_unit",
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
	"keep_decoration_painting",
	"weave",
	"timed_explosion_unit",
	"progress_timer",
	"game_mode_data",
	"ai_unit_chaos_troll",
	"destructible_objective_unit",
	"weave_objective",
	"weave_capture_point_unit",
	"weave_target_unit",
	"weave_interaction_unit",
	"weave_doom_wheel_unit",
	"weave_kill_enemies_unit",
	"versus_character_selection_unit",
	"horde_surge",
	"engineer_career_data"
}

DLCUtils.append("network_go_types", NetworkLookup.go_types)

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
	"health_conversion",
	"health_regen",
	"healing_draught_temp_health",
	"bandage_temp_health",
	"buff_shared_medpack_temp_health",
	"mutator",
	"raw_heal"
}
NetworkLookup.conflict_director_lock_lookup = create_lookup({}, ConflictDirectorLockedFunctions)
NetworkLookup.dlcs = create_lookup({}, UnlockSettings[1].unlocks)
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
	"network_hash",
	"mission_id",
	"selected_mission_id",
	"num_players",
	"matchmaking",
	"player_slot_1",
	"player_slot_2",
	"player_slot_3",
	"player_slot_4",
	"player_slot_5",
	"host",
	"unique_server_name",
	"difficulty",
	"game_started",
	"room_id",
	"session_id",
	"is_private",
	"matchmaking_type",
	"mechanism"
}
NetworkLookup.lobby_data_values = {
	"false",
	"true",
	"searching"
}
NetworkLookup.mechanisms = {
	"weave",
	"adventure"
}

DLCUtils.append("mechanisms", NetworkLookup.mechanisms)

NetworkLookup.game_modes = {
	"adventure",
	"custom",
	"n/a",
	"tutorial",
	"demo",
	"event",
	"twitch",
	"deed",
	"weave",
	"adventure_mode"
}

DLCUtils.append("game_modes", NetworkLookup.game_modes)

NetworkLookup.matchmaking_types = {
	"standard",
	"custom",
	"n/a",
	"tutorial",
	"demo",
	"event",
	"deed"
}

DLCUtils.append("matchmaking_types", NetworkLookup.matchmaking_types)

NetworkLookup.buff_attack_types = {
	"n/a",
	"aoe",
	"projectile",
	"heavy_attack",
	"light_attack",
	"instant_projectile",
	"grenade",
	"ability",
	"wind_mutator"
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
					local health_stagger_anims_table = data.stagger_anims

					for _, dir_table in ipairs(health_stagger_anims_table) do
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
	"plague_ground",
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
	"blade_storm",
	"death_explosion",
	"nurgle_ball",
	"nurgle_geyser",
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
	"throwing_axe",
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
	"life_drain",
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
	"weapon_bleed_dot_dagger",
	"weapon_bleed_dot_whc",
	"weapon_bleed_dot_maidenguard",
	"sync_health",
	"killing_blow",
	"military_finish",
	"life_tap",
	"volume_generic_dot",
	"volume_insta_kill",
	"inside_forbidden_tag_volume",
	"undefined",
	"charge_death"
}

for _, dlc in pairs(DLCSettings) do
	local damage_types = dlc.network_damage_types

	if damage_types then
		table.append(NetworkLookup.damage_types, damage_types)
	end
end

NetworkLookup.weave_names = create_lookup({
	"n/a"
}, WeaveSettings.templates)
NetworkLookup.weave_objective_names = create_lookup({}, WeaveSettings.weave_objective_names)
NetworkLookup.weave_item_template_names = create_lookup({}, WeaveItemTemplates)

if GameModeSettings.versus then
	NetworkLookup.versus_objective_names = create_lookup({
		"n/a"
	}, GameModeSettings.versus.objective_names)
end

NetworkLookup.hit_react_types = {
	"light",
	"medium",
	"heavy",
	"slow_bomb"
}
NetworkLookup.buff_weapon_types = {
	"n/a",
	"MELEE_1H",
	"MELEE_2H",
	"RANGED",
	"RANGED_ABILITY"
}
NetworkLookup.single_weapon_states = {
	"shoot_start",
	"stop_shooting",
	"shoot_end",
	"windup_start",
	"windup_end"
}
NetworkLookup.buff_templates = create_lookup({
	"n/a"
}, BuffTemplates)
NetworkLookup.group_buff_templates = create_lookup({
	"n/a"
}, GroupBuffTemplates)
NetworkLookup.buff_data_types = {
	"n/a",
	"variable_value",
	"external_optional_multiplier"
}
NetworkLookup.proc_events = {
	"on_reload",
	"on_ammo_used",
	"on_unwield",
	"on_last_ammo_used",
	"on_gained_ammo_from_no_ammo",
	"on_bardin_consumable_picked_up_any_player",
	"on_push"
}
NetworkLookup.proc_functions = create_lookup({}, ProcFunctions)
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
	"vs_globadier_impact",
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
NetworkLookup.standard_templates = create_lookup({}, BeastmenStandardTemplates)
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

for _, settings in pairs(GameModeSettings) do
	if settings.additional_game_end_reasons then
		for _, reason in ipairs(settings.additional_game_end_reasons) do
			NetworkLookup.game_end_reasons[#NetworkLookup.game_end_reasons + 1] = reason
		end
	end
end

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
NetworkLookup.mission_ids = create_lookup({
	"next_level",
	"n/a"
}, LevelSettings)
NetworkLookup.mission_ids = create_lookup(NetworkLookup.mission_ids, WeaveSettings.templates)
NetworkLookup.act_keys = create_lookup({
	"n/a"
}, GameActs)
NetworkLookup.mechanism_keys = create_lookup({}, MechanismSettings)
NetworkLookup.game_mode_keys = create_lookup({}, GameModeSettings)
NetworkLookup.fatigue_types = create_lookup({}, PlayerUnitStatusSettings.fatigue_point_costs)
NetworkLookup.pickup_names = create_lookup({}, AllPickups)
NetworkLookup.unlockable_level_keys = table.clone(UnlockableLevels)
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
	"fx/chr_warp_fire_flamethrower_01",
	"fx/chr_warp_fire_explosion_01",
	"fx/wpnfx_range_crit_01",
	"fx/chaos_sorcerer_plague_wave_hit_01",
	"fx/chr_nurgle_explosion_01",
	"fx/warp_lightning_bolt_impact",
	"fx/chr_iron_breaker_ability_taunt",
	"fx/chr_grey_seer_lightning_hit_02",
	"fx/chr_chaos_sorcerer_boss_projectile_flies_impact",
	"fx/drachenfels_flies_impact",
	"fx/drachenfels_boss_teleport_enter"
}

for _, dlc in pairs(DLCSettings) do
	local effects = dlc.effects

	if effects then
		for i = 1, #effects, 1 do
			local name = effects[i]

			if not table.contains(NetworkLookup.effects, name) then
				NetworkLookup.effects[#NetworkLookup.effects + 1] = name
			end
		end
	end
end

NetworkLookup.light_weight_projectile_effects = create_lookup({}, LightWeightProjectileEffects)
NetworkLookup.flow_events = {
	"arrow_left",
	"arrow_right",
	"arrow_center"
}
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
	"stopping_interaction",
	"waiting_for_abort"
}
NetworkLookup.statuses = {
	"knocked_down",
	"pounced_down",
	"dead",
	"blocking",
	"charge_blocking",
	"wounded",
	"revived",
	"pushed",
	"charged",
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
	"Play_bullet_pass_by_fake",
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
	"Play_career_ability_maiden_guard_charge",
	"Play_career_ability_shade_shadowstep_charge",
	"Play_career_ability_kerillian_shade_enter",
	"Play_career_ability_kerillian_shade_loop",
	"Play_career_ability_kerillian_shade_exit",
	"Play_career_ability_kerillian_shade_loop_husk",
	"Stop_career_ability_kerillian_shade_loop_husk",
	"Play_career_ability_mercenary_shout_out",
	"Play_career_ability_markus_huntsman_enter",
	"Play_career_ability_markus_huntsman_loop",
	"Play_career_ability_markus_huntsman_exit",
	"Play_career_ability_markus_huntsman_loop_husk",
	"Stop_career_ability_markus_huntsman_loop_husk",
	"Play_career_ability_kruber_charge_enter",
	"Play_career_ability_kruber_charge_forward",
	"Stop_career_ability_kruber_charge_forward",
	"Play_career_ability_kruber_charge_hit_player",
	"Play_career_ability_bardin_ranger_enter",
	"Play_career_ability_bardin_ranger_exit",
	"Play_career_ability_bardin_ironbreaker_enter",
	"Play_career_ability_bardin_ironbreaker_exit",
	"Play_career_ability_bardin_slayer_enter",
	"Play_career_ability_bardin_slayer_exit",
	"Play_career_ability_bardin_slayer_jump",
	"Play_career_ability_bardin_slayer_impact",
	"Play_career_ability_captain_shout_out",
	"Play_career_ability_victor_zealot_enter",
	"Play_career_ability_zealot_charge",
	"Play_career_ability_victor_zealot_exit",
	"Play_career_ability_unchained_fire",
	"Play_career_ability_sienna_unchained",
	"Play_weapon_ability_pyromancer_skull_spawn",
	"Play_weapon_ability_pyromancer_skull_spawn_husk",
	"Stop_weapon_ability_pyromancer_skull_spawn",
	"Stop_weapon_ability_pyromancer_skull_spawn_husk",
	"Play_weapon_ability_pyromancer_skull_shoot",
	"Play_weapon_ability_pyromancer_skull_shoot_husk",
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
	"Play_weapon_fire_torch_wood_shield_hit",
	"blunt_hit_shield_metal",
	"slashing_hit_shield_metal",
	"stab_hit_shield_metal",
	"Play_weapon_fire_torch_metal_shield_hit",
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
	"Play_enemy_berserker_attack_husk_vce",
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
	"Play_emitter_grey_seer_lightning_bolt_hit",
	"enemy_gutterrunner_stinger",
	"Play_vortex_sorcerer_spawn",
	"Play_enemy_corruptor_sorcerer_sucking_magic",
	"Stop_enemy_corruptor_sorcerer_sucking_magic",
	"Play_enemy_corruptor_sorcerer_throw_magic",
	"Stop_enemy_corruptor_sorcerer_throw_magic",
	"Play_generic_pushed_impact",
	"Play_generic_pushed_impact_large",
	"Play_generic_pushed_impact_small",
	"Play_generic_pushed_impact_small_armour",
	"Play_generic_pushed_impact_large_armour",
	"Play_enemy_ungor_attack_player_back_vce",
	"Play_enemy_ungor_attack_vce",
	"Play_enemy_ungor_attack_husk_vce",
	"Play_enemy_ungor_die_vce",
	"play_enemy_gor_attack_player_back_vce",
	"play_enemy_gor_attack_vce",
	"play_enemy_gor_attack_husk_vce",
	"play_enemy_gor_attack_short_vce",
	"play_enemy_gor_attack_short_husk_vce",
	"play_enemy_gor_die_vce",
	"Play_enemy_bestigor_attack_player_back_vce",
	"Play_enemy_bestigor_attack_short_vce",
	"Play_enemy_bestigor_attack_short_husk_vce",
	"Play_enemy_bestigor_die_short_vce",
	"enemy_horde_beastmen_stinger",
	"Play_enemy_ungor_archer_group_attack_vce",
	"Play_enemy_ungor_archer_attack_order_vce",
	"play_enemy_standard_bearer_attack_vce",
	"play_enemy_standard_bearer_attack_husk_vce",
	"Play_enemy_standard_bearer_attack_player_back_vce",
	"Play_standard_bearer_die_vce",
	"Play_enemy_minotaur_spawn",
	"Play_enemy_minotaur_die_vce",
	"Stop_enemy_beastmen_standar_spell_loop",
	"Play_enemy_standard_bearer_place_standar",
	"Play_enemy_beastmen_standar_spell_loop",
	"Play_enemy_beastmen_standar_destroy",
	"Play_enemy_beastmen_standar_taking_damage",
	"Play_prop_magic_barrel_socket",
	"Play_prop_magic_barrel_explosion",
	"Play_enemy_vce_chaos_warrior_attack_player_back",
	"Play_plague_monk_attack_player_back_vce",
	"Play_stormvermin_attack_player_back_vce",
	"Play_enemy_mutator_chaos_sorcerer_wind_loop",
	"Stop_enemy_mutator_chaos_sorcerer_wind_loop",
	"Play_enemy_mutator_chaos_sorcerer_skulking_loop",
	"Stop_enemy_mutator_chaos_sorcerer_skulking_loop",
	"Play_enemy_mutator_chaos_sorcerer_hunting_loop",
	"Stop_enemy_mutator_chaos_sorcerer_hunting_loop",
	"player_combat_weapon_steampistol_fire",
	"player_combat_weapon_steampistol_fire_fast",
	"Play_wpn_engineer_pistol_charge",
	"Play_wpn_engineer_pistol_charge_stop",
	"Play_wpn_engineer_pistol_equip",
	"Play_wpn_engineer_pistol_equip_no_ammo",
	"Play_wpn_engineer_pistol_foley",
	"Play_wpn_engineer_pistol_inspect",
	"Play_wpn_engineer_pistol_inspect_stop",
	"Play_wpn_engineer_pistol_last_bullet",
	"Play_wpn_engineer_pistol_no_ammo",
	"Play_wpn_engineer_pistol_reload",
	"Play_wpn_engineer_pistol_reload_husk",
	"Play_wpn_engineer_pistol_spinning_loop",
	"Play_wpn_engineer_pistol_spinning_start",
	"Play_wpn_engineer_pistol_spinning_stop",
	"Stop_wpn_engineer_pistol_spinning_loop"
}

for _, dlc in pairs(DLCSettings) do
	local sound_events = dlc.network_sound_events

	if sound_events then
		for i = 1, #sound_events, 1 do
			local sound_event = sound_events[i]
			NetworkLookup.sound_events[#NetworkLookup.sound_events + 1] = sound_event
		end
	end
end

NetworkLookup.global_parameter_names = {
	"occupied_slots_percentage",
	"stormfiend_mood",
	"demo_slowmo",
	"champion_crowd_voices",
	"champion_crowd_voices_walla",
	"charge_parameter",
	"morris_music_intensity"
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
	"skaven_clan_rat_sword",
	"opt_skaven_clan_rat_sword",
	"skaven_slave_sword",
	"opt_skaven_slave_sword",
	"dual_sword",
	"dual_axes",
	"spear",
	"skaven_clan_rat_spear",
	"opt_skaven_clan_rat_spear",
	"skaven_slave_spear",
	"opt_skaven_slave_spear",
	"halberd",
	"halberd_stormvermin_champion",
	"sword_and_shield",
	"skaven_clan_rat_sword_and_shield",
	"opt_skaven_clan_rat_sword_and_shield",
	"stormvermin_sword_and_shield",
	"stormvermin_dual_wield",
	"pack_master",
	"loot_rat_sack",
	"ratlinggun",
	"rat_ogre",
	"stormfiend_warpfire",
	"gutter_runner",
	"chaos_troll",
	"chaos_sorcerer",
	"chaos_sorcerer_vortex",
	"chaos_mutator_sorcerer",
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
	"zombie_blobs",
	"beastmen_ungor_1h",
	"beastmen_ungor_spear",
	"opt_beastmen_ungor_spear",
	"beastmen_gor_1h",
	"opt_beastmen_gor_1h",
	"beastmen_bestigor_2h_axe",
	"beastmen_standard_bearer_2h_axe",
	"beastmen_2h_axe_standard",
	"beastmen_standard_bearer_dual_setup",
	"beastmen_ungor_bow",
	"opt_beastmen_ungor_bow",
	"beastmen_ungor_just_add_spear",
	"beastmen_ungor_archer_bow_and_spear",
	"opt_beastmen_ungor_archer_bow_and_spear",
	"beastmen_minotaur_dual_axes"
}

DLCUtils.append("ai_inventory", NetworkLookup.ai_inventory)

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
	"eac_authorize_failed",
	"host_has_no_backend_connection",
	"host_plays_prologue",
	"client_is_banned",
	"cannot_join_weave",
	"game_aborted",
	"signal_done_timeout"
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
	"reload_failed",
	"spawning"
}
NetworkLookup.dialogue_event_data_names = {
	"num_units",
	"distance",
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
	"mutator_torch",
	"shadow_torch",
	"grain_sack",
	"beer_barrel",
	"gargoyle_head",
	"weave_gargoyle_head",
	"magic_crystal",
	"magic_barrel",
	"shadow_flare",
	"shadow_gargoyle_head",
	"explosive_barrel",
	"lamp_oil",
	"explosive_barrel_objective",
	"door_stick",
	"drachenfels_statue",
	"dwarf_explosive_barrel",
	"cannon_ball",
	"training_dummy",
	"training_dummy_armored",
	"training_dummy_skaven",
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

DLCUtils.append("dialogue_event_data_lookup", NetworkLookup.dialogue_event_data_names)
DLCUtils.append("dialogue_events", NetworkLookup.dialogue_events)

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
	"draw",
	"won_between_winds",
	"pre_horde",
	"pre_ambush",
	"horde",
	"pre_ambush_beastmen",
	"horde_beastmen",
	"horde_chaos",
	"pre_ambush_chaos",
	"no_boss",
	"rat_ogre",
	"stormfiend",
	"chaos_spawn",
	"minotaur",
	"troll",
	"champion_skaven_stormvermin",
	"champion_chaos_exalted_warcamp",
	"champion_chaos_exalted_norsca",
	"champion_chaos_exalted_sorcerer",
	"champion_skaven_stormvermin_warlord",
	"champion_skaven_grey_seer",
	"attract_mode",
	"dungeon",
	"escape_mb1",
	"escape_mb2",
	"escape_mb3",
	"false",
	"mission",
	"mission_2",
	"mission_no_horn",
	"no_music",
	"no_music_no_horn",
	"skittergate_run",
	"survival",
	"terror_crawlbrawl",
	"terror_mb1",
	"terror_mb2",
	"terror_mb3",
	"terror_mb4",
	"terror_mb5",
	"terror_mb6",
	"terror_mb7",
	"terror_remix1",
	"terror_remix2",
	"terror_remix3",
	"ussingen",
	"winds"
}
NetworkLookup.locations = {
	"test",
	"test2"
}
NetworkLookup.statistics_group_name = {
	"season_1"
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
	"elven_ruins_speed_event_cata",
	"farmlands_speed_event_cata",
	"bell_speed_event_cata",
	"mines_speed_event_cata",
	"skittergate_speed_event_cata",
	"exalted_champion_charge_chaos_warrior_cata",
	"military_statue_kill_chaos_warriors_cata",
	"halescourge_tornado_enemies_cata",
	"storm_vermin_warlord_kills_enemies_cata",
	"nurgle_bathed_all_cata",
	"ussingen_used_no_barrels_cata",
	"forest_fort_kill_cannonball_cata",
	"catacombs_added_souls_cata",
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
	"killed_lord_as_last_player_standing",
	"scorpion_bestigor_charge_chaos_warrior",
	"scorpion_kill_minotaur_farmlands_oak",
	"scorpion_kill_archers_kill_minotaur",
	"scorpion_slay_gors_warpfire_damage"
}

DLCUtils.append("statistics_lookup", NetworkLookup.statistics)

local music_group_states = {}
local music_lookups = NetworkLookup.music_group_states

for _, state in ipairs(music_lookups) do
	music_group_states[state] = true
end

for _, settings in pairs(LevelSettings) do
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
	"obsolete_request",
	"cannot_join_weave",
	"dlc_required",
	"user_blocked"
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
	"africa",
	"default"
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
NetworkLookup.spawn_states = {
	"w8_to_spawn",
	"w8_for_profile",
	"spawning",
	"spawned",
	"dead"
}
NetworkLookup.lobby_type = {
	"lobby",
	"server"
}
NetworkLookup.weave_winds = {
	"none",
	"fire",
	"beasts",
	"death",
	"heavens",
	"light",
	"shadow",
	"life",
	"metal"
}
NetworkLookup.connection_states = {
	"connecting",
	"connected",
	"disconnecting",
	"disconnected"
}
NetworkLookup.rarities = create_lookup({}, RaritySettings)
NetworkLookup.bot_orders = create_lookup({}, AIBotGroupSystem.bot_orders)
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
NetworkLookup.spawn_unit_templates = create_lookup({}, SpawnUnitTemplates)
NetworkLookup.weapon_skins = create_lookup({
	"n/a"
}, WeaponSkins.skins)
NetworkLookup.performance_titles = create_lookup({
	"n/a"
}, PerformanceTitles.titles)
NetworkLookup.social_wheel_events = create_lookup({
	"n/a"
}, SocialWheelSettingsLookup)
NetworkLookup.challenges = create_lookup({}, InGameChallengeTemplates)
NetworkLookup.challenge_rewards = create_lookup({}, InGameChallengeRewards)
NetworkLookup.challenge_categories = {}

DLCUtils.append("challenge_categories", NetworkLookup.challenge_categories)

NetworkLookup.boon_consume_types = {
	"time",
	"venture",
	"charges"
}

local function is_sync_statistics(stat)
	if stat.value then
		return stat.sync_on_hot_join or stat.sync_to_host
	else
		for _, stat_definition in pairs(stat) do
			if is_sync_statistics(stat_definition) then
				return true
			end
		end
	end
end

local function statistics_path_names(path_names, stat)
	if not stat.value then
		for stat_name, stat_definition in pairs(stat) do
			if is_sync_statistics(stat_definition) then
				path_names[stat_name] = true

				statistics_path_names(path_names, stat_definition)
			end
		end
	end
end

local path_names = {}

for _, stat_definitions in pairs(StatisticsDefinitions) do
	statistics_path_names(path_names, stat_definitions)
end

NetworkLookup.statistics_path_names = create_lookup({}, path_names)
NetworkLookup.mission_names = create_lookup({}, Missions)
NetworkLookup.projectile_gravity_settings = create_lookup({}, ProjectileGravitySettings)
NetworkLookup.voting_types = create_lookup({}, VoteTemplates)
NetworkLookup.session_stats = create_lookup({}, StatisticsDefinitions.session)
local flow_events = {}

for level_key, terror_events in pairs(TerrorEventBlueprints) do
	for _, blueprint in pairs(terror_events) do
		for _, event in ipairs(blueprint) do
			local name = event.flow_event_name

			if name and not event.disable_network_send then
				flow_events[name] = true
			end
		end
	end
end

for _, blueprint in pairs(GenericTerrorEvents) do
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
DLCUtils.append("inventory_package_list", NetworkLookup.inventory_packages)

local NETWORK_LOOKUP_DUPLICATES_ALLOWED = {
	locations = true
}

local function init(self, name)
	for index, str in ipairs(self) do
		if not self[str] then
			self[str] = index
		elseif not NETWORK_LOOKUP_DUPLICATES_ALLOWED[name] then
			ferror("[NetworkLookup.lua] Duplicate entry %q in %q.", str, name)
		end
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

temp_aws_test_dumped = false

if not temp_aws_test_dumped and Development.parameter("mechanism") == "versus" then
	print("AWS_TEST LEVEL_KEYS:")

	local level_keys = NetworkLookup.level_keys

	for i = 1, #level_keys, 1 do
		print(i, level_keys[i])
	end

	temp_aws_test_dumped = true
end

return
