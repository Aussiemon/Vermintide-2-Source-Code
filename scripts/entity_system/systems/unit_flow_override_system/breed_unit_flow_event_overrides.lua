-- chunkname: @scripts/entity_system/systems/unit_flow_override_system/breed_unit_flow_event_overrides.lua

require("scripts/settings/breeds")

local breed_unit_flow_event_overrides = {
	chr_beastmen_bestigor = {
		burn_death = false,
		burn_death_critical = false,
		category = "medium",
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_beastmen_gor = {
		burn_death = false,
		burn_death_critical = false,
		category = "small",
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_beastmen_minotaur = {
		burn_death = false,
		burn_death_critical = false,
		category = "large",
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_beastmen_standard_bearer = {
		burn_death = false,
		burn_death_critical = false,
		category = "small",
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_beastmen_ungor = {
		category = "small",
	},
	chr_beastmen_ungor_archer = {
		category = "small",
	},
	chr_blk_shadow_lieutenant = {
		burn_death = false,
		burn_death_critical = false,
		category = "medium",
		poisoned = false,
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_chaos_berzerker = {
		burn_death = false,
		burn_death_critical = false,
		category = "small",
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_chaos_dummy_sorcerer_boss_drachenfels = {
		burn_death = false,
		burn_death_critical = false,
		category = "medium",
		poisoned = false,
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_chaos_fanatic = {
		category = "small",
	},
	chr_chaos_marauder = {
		category = "small",
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_chaos_mutator_sorcerer = {
		burn = false,
		burn_death = false,
		burn_death_critical = false,
		burn_infinity = false,
		category = "medium",
		poisoned = false,
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_chaos_raider = {
		burn_death = false,
		burn_death_critical = false,
		category = "small",
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_chaos_sorcerer = {
		burn_death = false,
		burn_death_critical = false,
		category = "medium",
		poisoned = false,
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_chaos_sorcerer_boss = {
		burn_death = false,
		burn_death_critical = false,
		category = "medium",
		poisoned = false,
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_chaos_sorcerer_boss_drachenfels = {
		burn_death = false,
		burn_death_critical = false,
		category = "medium",
		poisoned = false,
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_chaos_sorcerer_corruptor = {
		burn_death = false,
		burn_death_critical = false,
		category = "medium",
		poisoned = false,
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_chaos_spawn = {
		burn_death = false,
		burn_death_critical = false,
		category = "large",
		poisoned = false,
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_chaos_troll = {
		burn_death = false,
		burn_death_critical = false,
		category = "large",
		poisoned = false,
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_chaos_vortex_sorcerer = {
		burn_death = false,
		burn_death_critical = false,
		category = "medium",
		poisoned = false,
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_chaos_warrior = {
		burn_death = false,
		burn_death_critical = false,
		category = "small",
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_chaos_warrior_boss = {
		burn_death = false,
		burn_death_critical = false,
		category = "medium",
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_critter_nurgling = {
		category = "small",
		poisoned = false,
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_npc_necromancer_skeleton = {
		burn_death = false,
		burn_death_critical = false,
		category = "small",
		poisoned = false,
	},
	chr_skaven_clan_rat = {
		category = "small",
	},
	chr_skaven_grey_seer = {
		burn_death = false,
		burn_death_critical = false,
		category = "small",
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_skaven_gutter_runner = {
		burn_death = false,
		burn_death_critical = false,
		category = "small",
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_skaven_loot_rat = {
		category = "small",
	},
	chr_skaven_mutator_slave_rat = {
		category = "small",
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_skaven_pack_master = {
		burn_death = false,
		burn_death_critical = false,
		category = "small",
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_skaven_plague_monk = {
		burn_death = false,
		burn_death_critical = false,
		category = "small",
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_skaven_rat_ogre = {
		burn_death = false,
		burn_death_critical = false,
		category = "medium",
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_skaven_ratlinggunner = {
		burn_death = false,
		burn_death_critical = false,
		category = "small",
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_skaven_slave = {
		category = "small",
	},
	chr_skaven_stormfiend = {
		burn_death = false,
		burn_death_critical = false,
		category = "medium",
		poisoned = false,
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_skaven_stormfiend_boss = {
		burn_death = false,
		burn_death_critical = false,
		category = "medium",
		poisoned = false,
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_skaven_stormvermin = {
		burn_death = false,
		burn_death_critical = false,
		category = "small",
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_skaven_stormvermin_champion = {
		burn_death = false,
		burn_death_critical = false,
		category = "medium",
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_skaven_stormvermin_warlord = {
		burn_death = false,
		burn_death_critical = false,
		category = "medium",
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_skaven_warpfire_thrower = {
		burn_death = false,
		burn_death_critical = false,
		category = "small",
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_skaven_wind_globadier = {
		burn_death = false,
		burn_death_critical = false,
		category = "small",
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
	chr_undead_ethereal_skeleton = {
		burn = false,
		burn_death = false,
		burn_death_critical = false,
		burn_infinity = false,
		category = "small",
		poisoned = false,
		warpfire_burn = false,
		warpfire_burn_death = false,
	},
}
local BREED_FLOW_EVENT_OVERRIDE_DATA_LOOKUP = {}

for breed_name, breed_data in pairs(Breeds) do
	for unit_name, event_data in pairs(breed_unit_flow_event_overrides) do
		local breed_unit_name = breed_data.base_unit
		local reverse_breed_unit_name = string.reverse(breed_unit_name)
		local start_idx, end_idx = string.find(reverse_breed_unit_name, "/")

		reverse_breed_unit_name = string.sub(reverse_breed_unit_name, 1, start_idx - 1)
		breed_unit_name = string.reverse(reverse_breed_unit_name)

		if breed_unit_name == unit_name then
			BREED_FLOW_EVENT_OVERRIDE_DATA_LOOKUP[breed_name] = event_data
		end
	end
end

return BREED_FLOW_EVENT_OVERRIDE_DATA_LOOKUP
