-- chunkname: @scripts/managers/backend/statistics_definitions_vs.lua

require("scripts/settings/breeds")

local session = StatisticsDefinitions.session
local player = StatisticsDefinitions.player
local unit_test = StatisticsDefinitions.unit_test

player.vs_damage_dealt_to_pactsworn = {
	sync_on_hot_join = true,
	value = 0,
}
player.vs_disables_per_breed = {}
player.vs_badge_knocked_down_target_per_breed = {}
player.vs_badge_escaped_death_per_breed = {}
player.vs_badge_double_kill_per_breed = {}
player.vs_badge_triple_kill_per_breed = {}
player.vs_badge_quadra_kill_per_breed = {}
player.vs_badge_damage_invisible_per_breed = {}
player.vs_badge_interrupt_hero_per_breed = {}
player.vs_badge_flame_a_hoisted_hero_per_breed = {}
player.vs_badge_ratling_hit_all_heroes_per_breed = {}
player.vs_badge_warpfire_hit_all_heroes_per_breed = {}
player.vs_badge_globadier_hit_all_heroes_per_breed = {}
player.vs_badge_ratling_damage_in_one_clip_per_breed = {}
player.vs_badge_warpfire_damage_in_one_clip_per_breed = {}
player.vs_badge_survive_grenade_per_breed = {}
player.vs_badge_attack_healing_hero_per_breed = {}
player.vs_badge_grab_a_hero_per_breed = {}
player.vs_badge_grab_two_heroes_per_breed = {}
player.vs_badge_long_haul_per_breed = {}
player.vs_badge_hit_dodging_hero_per_breed = {}
player.vs_badge_hoist_hero_per_breed = {}
player.vs_badge_hit_while_reloading_per_breed = {}
player.vs_badge_first_hit_per_breed = {}
player.vs_badge_pounce_hero_per_breed = {}
player.vs_badge_long_pounce_per_breed = {}
player.vs_badge_multiple_pounces_per_breed = {}
player.vs_badge_globe_impact_per_breed = {}
player.vs_badge_globe_impact_2_per_breed = {}
player.vs_badge_globe_impact_3_per_breed = {}
player.vs_badge_globe_impact_4_per_breed = {}
player.vs_badge_knock_down_dragged_hero_per_breed = {}
player.vs_badge_push_off_per_breed = {}
player.vs_badge_stabbing_frenzy_per_breed = {}
player.vs_badge_impact_revive_per_breed = {}
player.vs_badge_two_downs_one_clip_per_breed = {}
player.vs_badge_moving_target_per_breed = {}
player.vs_badge_long_impact_per_breed = {}
player.vs_badge_stealth_pounce_per_breed = {}
player.vs_badge_mob_damage_per_breed = {}
player.vs_badge_warpfire_ambush_per_breed = {}

for breed_name, breed in pairs(PlayerBreeds) do
	player.vs_disables_per_breed[breed_name] = {
		sync_on_hot_join = true,
		value = 0,
		name = breed_name,
	}

	local db_kills_per_breed_name = "vs_kills_per_breed_" .. breed_name
	local db_knocked_down_name = "vs_badge_knocked_down_target_per_breed" .. breed_name

	player.vs_badge_knocked_down_target_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_knocked_down_name,
	}

	local db_double_kill_per_breed_name = "vs_badge_double_kill_per_breed_" .. breed_name

	player.vs_badge_double_kill_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_double_kill_per_breed_name,
	}

	local db_triple_kill_per_breed_name = "vs_badge_triple_kill_per_breed_" .. breed_name

	player.vs_badge_triple_kill_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_triple_kill_per_breed_name,
	}

	local db_quadra_kill_per_breed_name = "vs_badge_quadra_kill_per_breed_" .. breed_name

	player.vs_badge_quadra_kill_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_quadra_kill_per_breed_name,
	}

	local db_vs_badge_escaped_death_per_breed_name = "vs_badge_escaped_death_per_breed_" .. breed_name

	player.vs_badge_escaped_death_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_escaped_death_per_breed_name,
	}

	local db_vs_badge_damage_invisible_per_breed_name = "vs_badge_damage_invisible_per_breed_" .. breed_name

	player.vs_badge_damage_invisible_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_damage_invisible_per_breed_name,
	}

	local db_vs_badge_interrupt_hero_per_breed_name = "vs_badge_interrupt_hero_per_breed_" .. breed_name

	player.vs_badge_interrupt_hero_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_interrupt_hero_per_breed_name,
	}

	local db_vs_badge_flame_a_hoisted_hero_name = "vs_badge_flame_a_hoisted_hero_per_breed_" .. breed_name

	player.vs_badge_flame_a_hoisted_hero_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_flame_a_hoisted_hero_name,
	}

	local db_vs_badge_ratling_hit_all_heroes_name = "vs_badge_ratling_hit_all_heroes_per_breed_" .. breed_name

	player.vs_badge_ratling_hit_all_heroes_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_ratling_hit_all_heroes_name,
	}

	local db_vs_badge_warpfire_hit_all_heroes_name = "vs_badge_warpfire_hit_all_heroes_per_breed_" .. breed_name

	player.vs_badge_warpfire_hit_all_heroes_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_warpfire_hit_all_heroes_name,
	}

	local db_vs_badge_gloabadier_hit_all_heroes_name = "vs_badge_globadier_hit_all_heroes_per_breed_" .. breed_name

	player.vs_badge_globadier_hit_all_heroes_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_globadier_hit_all_heroes_name,
	}

	local db_vs_badge_ratling_damage_in_one_clip_name = "vs_badge_ratling_damage_in_one_clip_per_breed_" .. breed_name

	player.vs_badge_ratling_damage_in_one_clip_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_ratling_damage_in_one_clip_name,
	}

	local db_vs_badge_warpfire_damage_in_one_clip_name = "vs_badge_warpfire_damage_in_one_clip_per_breed_" .. breed_name

	player.vs_badge_warpfire_damage_in_one_clip_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_warpfire_damage_in_one_clip_name,
	}

	local db_vs_badge_survive_grenade_per_breed_name = "vs_badge_survive_grenade_per_breed_" .. breed_name

	player.vs_badge_survive_grenade_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_survive_grenade_per_breed_name,
	}

	local db_vs_badge_attack_healing_hero_per_breed_name = "vs_badge_attack_healing_hero_per_breed_" .. breed_name

	player.vs_badge_attack_healing_hero_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_attack_healing_hero_per_breed_name,
	}

	local db_vs_badge_grab_a_hero_per_breed_name = "vs_badge_grab_a_hero_per_breed_" .. breed_name

	player.vs_badge_grab_a_hero_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_grab_a_hero_per_breed_name,
	}

	local db_vs_badge_grab_two_heroes_per_breed_name = "vs_badge_grab_two_heroes_per_breed_" .. breed_name

	player.vs_badge_grab_two_heroes_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_grab_two_heroes_per_breed_name,
	}

	local db_vs_badge_long_haul_per_breed_name = "vs_badge_long_haul_per_breed_" .. breed_name

	player.vs_badge_long_haul_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_long_haul_per_breed_name,
	}

	local db_vs_badge_hit_dodging_hero_per_breed_name = "vs_badge_hit_dodging_hero_per_breed_" .. breed_name

	player.vs_badge_hit_dodging_hero_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_hit_dodging_hero_per_breed_name,
	}

	local db_vs_badge_hoist_hero_per_breed_name = "vs_badge_hoist_hero_per_breed_" .. breed_name

	player.vs_badge_hoist_hero_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_hoist_hero_per_breed_name,
	}

	local db_vs_badge_hit_while_reloading_per_breed_name = "vs_badge_hit_while_reloading_per_breed_" .. breed_name

	player.vs_badge_hit_while_reloading_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_hit_while_reloading_per_breed_name,
	}

	local db_vs_badge_first_hit_per_breed_name = "vs_badge_first_hit_per_breed_" .. breed_name

	player.vs_badge_first_hit_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_first_hit_per_breed_name,
	}

	local db_vs_badge_pounce_hero_per_breed_name = "vs_badge_pounce_hero_per_breed_" .. breed_name

	player.vs_badge_pounce_hero_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_pounce_hero_per_breed_name,
	}

	local db_vs_badge_long_pounce_per_breed_name = "vs_badge_long_pounce_per_breed_" .. breed_name

	player.vs_badge_long_pounce_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_long_pounce_per_breed_name,
	}

	local db_vs_badge_multiple_pounces_per_breed_name = "vs_badge_multiple_pounces_per_breed_" .. breed_name

	player.vs_badge_multiple_pounces_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_multiple_pounces_per_breed_name,
	}

	local db_vs_badge_globe_impact_per_breed_name = "vs_badge_globe_impact_per_breed_" .. breed_name

	player.vs_badge_globe_impact_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_globe_impact_per_breed_name,
	}

	local db_vs_badge_globe_impact_2_per_breed_name = "vs_badge_globe_impact_2_per_breed_" .. breed_name

	player.vs_badge_globe_impact_2_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_globe_impact_2_per_breed_name,
	}

	local db_vs_badge_globe_impact_3_per_breed_name = "vs_badge_globe_impact_3_per_breed_" .. breed_name

	player.vs_badge_globe_impact_3_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_globe_impact_3_per_breed_name,
	}

	local db_vs_badge_globe_impact_4_per_breed_name = "vs_badge_globe_impact_4_per_breed_" .. breed_name

	player.vs_badge_globe_impact_4_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_globe_impact_4_per_breed_name,
	}

	local db_vs_badge_knock_down_dragged_hero_per_breed_name = "vs_badge_knock_down_dragged_hero_per_breed_" .. breed_name

	player.vs_badge_knock_down_dragged_hero_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_knock_down_dragged_hero_per_breed_name,
	}

	local db_vs_badge_push_off_per_breed_name = "vs_badge_push_off_per_breed_" .. breed_name

	player.vs_badge_push_off_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_push_off_per_breed_name,
	}

	local db_vs_badge_stabbing_frenzy_per_breed_name = "vs_badge_stabbing_frenzy_per_breed_" .. breed_name

	player.vs_badge_stabbing_frenzy_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_stabbing_frenzy_per_breed_name,
	}

	local db_vs_badge_impact_revive_per_breed_name = "vs_badge_impact_revive_per_breed_" .. breed_name

	player.vs_badge_impact_revive_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_impact_revive_per_breed_name,
	}

	local db_vs_badge_two_downs_one_clip_per_breed_name = "vs_badge_two_downs_one_clip_per_breed_" .. breed_name

	player.vs_badge_two_downs_one_clip_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_two_downs_one_clip_per_breed_name,
	}

	local db_vs_badge_moving_target_per_breed_name = "vs_badge_moving_target_per_breed_" .. breed_name

	player.vs_badge_moving_target_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_moving_target_per_breed_name,
	}

	local db_vs_badge_long_impact_per_breed_name = "vs_badge_long_impact_per_breed_" .. breed_name

	player.vs_badge_long_impact_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_long_impact_per_breed_name,
	}

	local db_vs_badge_stealth_pounce_per_breed_name = "vs_badge_stealth_pounce_per_breed_" .. breed_name

	player.vs_badge_stealth_pounce_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_stealth_pounce_per_breed_name,
	}

	local db_vs_badge_mob_damage_per_breed_name = "vs_badge_mob_damage_per_breed_" .. breed_name

	player.vs_badge_mob_damage_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_mob_damage_per_breed_name,
	}

	local db_vs_badge_warpfire_ambush_per_breed_name = "vs_badge_warpfire_ambush_per_breed_" .. breed_name

	player.vs_badge_warpfire_ambush_per_breed[breed_name] = {
		source = "player_data",
		value = 0,
		name = breed_name,
		database_name = db_vs_badge_warpfire_ambush_per_breed_name,
	}
end
