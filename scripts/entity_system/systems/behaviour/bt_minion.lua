-- chunkname: @scripts/entity_system/systems/behaviour/bt_minion.lua

local USE_PRECOMPILED_ROOT_TABLES = true

BreedBehaviors = BreedBehaviors or {}

dofile("scripts/entity_system/systems/behaviour/trees/skaven/skaven_gutter_runner_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/skaven/skaven_horde_rat_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/skaven/skaven_horde_shield_rat_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/skaven/skaven_horde_rat_defend_destructible_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/skaven/skaven_loot_rat_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/skaven/skaven_pack_rat_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/skaven/skaven_slave_rat_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/skaven/skaven_dummy_clan_rat_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/skaven/skaven_packmaster_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/skaven/skaven_plague_monk_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/skaven/skaven_poison_wind_globadier_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/skaven/skaven_rat_ogre_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/skaven/skaven_ratling_gunner_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/skaven/skaven_shield_rat_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/skaven/skaven_storm_vermin_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/skaven/skaven_storm_vermin_champion_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/skaven/skaven_stormfiend_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/skaven/skaven_stormfiend_demo_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/skaven/skaven_warpfire_thrower_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/skaven/skaven_grey_seer_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/skaven/skaven_stormfiend_boss_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/skaven/skaven_storm_vermin_warlord_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/chaos/chaos_berzerker_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/chaos/chaos_marauder_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/chaos/chaos_fanatic_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/chaos/chaos_raider_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/chaos/chaos_shield_marauder_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/chaos/chaos_spawn_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/chaos/chaos_troll_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/chaos/chaos_troll_chief_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/chaos/chaos_dummy_troll_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/chaos/chaos_dummy_sorcerer_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/chaos/chaos_warrior_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/chaos/chaos_bulwark_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/chaos/chaos_vortex_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/chaos/chaos_vortex_sorcerer_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/chaos/chaos_corruptor_sorcerer_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/chaos/chaos_tether_sorcerer_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/chaos/chaos_plague_wave_spawner_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/chaos/chaos_exalted_champion_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/chaos/chaos_exalted_sorcerer_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/chaos/chaos_tentacle_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/chaos/chaos_zombie_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/chaos/chaos_skeleton_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/undead/ethereal_skeleton_with_hammer_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/undead/ethereal_skeleton_with_shield_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/critters/critter_pig_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/critters/critter_rat_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/critters/critter_nurgling_behavior")
dofile("scripts/entity_system/systems/behaviour/trees/training_dummy_behavior")
DLCUtils.dofile_list("behaviour_trees")

if USE_PRECOMPILED_ROOT_TABLES then
	for bt_name, bt_node in pairs(BreedBehaviors) do
		bt_node[1] = "BTSelector_" .. bt_name
		bt_node.name = bt_name .. "_GENERATED"
	end
else
	for bt_name, bt_node in pairs(BreedBehaviors) do
		bt_node[1] = "BTSelector"
		bt_node.name = bt_name
	end
end
