-- chunkname: @scripts/settings/weaves/weave_loadout/weave_loadout_settings.lua

require("scripts/settings/weaves/weave_loadout/weave_loadout_settings_bw_adept")
require("scripts/settings/weaves/weave_loadout/weave_loadout_settings_bw_scholar")
require("scripts/settings/weaves/weave_loadout/weave_loadout_settings_bw_unchained")
require("scripts/settings/weaves/weave_loadout/weave_loadout_settings_dr_ironbreaker")
require("scripts/settings/weaves/weave_loadout/weave_loadout_settings_dr_ranger")
require("scripts/settings/weaves/weave_loadout/weave_loadout_settings_dr_slayer")
require("scripts/settings/weaves/weave_loadout/weave_loadout_settings_es_huntsman")
require("scripts/settings/weaves/weave_loadout/weave_loadout_settings_es_knight")
require("scripts/settings/weaves/weave_loadout/weave_loadout_settings_es_mercenary")
require("scripts/settings/weaves/weave_loadout/weave_loadout_settings_we_maidenguard")
require("scripts/settings/weaves/weave_loadout/weave_loadout_settings_we_shade")
require("scripts/settings/weaves/weave_loadout/weave_loadout_settings_we_waywatcher")
require("scripts/settings/weaves/weave_loadout/weave_loadout_settings_wh_bountyhunter")
require("scripts/settings/weaves/weave_loadout/weave_loadout_settings_wh_captain")
require("scripts/settings/weaves/weave_loadout/weave_loadout_settings_wh_zealot")
require("scripts/settings/profiles/career_settings")
require("scripts/managers/talents/talent_settings")
require("scripts/settings/equipment/weave_traits")
require("scripts/settings/equipment/weave_properties")

local talent_id_lookup = TalentIDLookup
local weave_properties = WeaveProperties.properties
local weave_traits = WeaveTraits.traits
local default_properties = {
	"weave_attack_speed",
	"weave_crit_boost",
	"weave_power_vs_skaven",
	"weave_power_vs_chaos",
	"weave_power_vs_unarmoured",
	"weave_power_vs_armoured",
	"weave_power_vs_large",
	"weave_power_vs_frenzy",
	"weave_stamina",
	"weave_health",
	"weave_push_block_arc",
	"weave_block_cost",
	"weave_protection_skaven",
	"weave_protection_chaos",
	"weave_protection_aoe",
	"weave_crit_chance",
	"weave_ability_cooldown_reduction",
	"weave_curse_resistance",
	"weave_respawn_speed",
	"weave_revive_speed",
	"weave_fatigue_regen",
	"weave_movespeed",
}
local default_traits = {
	"weave_melee_attack_speed_on_crit",
	"weave_melee_timed_block_cost",
	"weave_melee_counter_push_power",
	"weave_melee_reduce_cooldown_on_crit",
	"weave_melee_increase_damage_on_block",
	"weave_melee_shield_on_assist",
	"weave_ranged_replenish_ammo_headshot",
	"weave_ranged_restore_stamina_headshot",
	"weave_ranged_reduced_overcharge",
	"weave_ranged_reduce_cooldown_on_crit",
	"weave_ranged_replenish_ammo_on_crit",
	"weave_ranged_remove_overcharge_on_crit",
	"weave_ranged_increase_power_level_vs_armour_crit",
	"weave_ranged_consecutive_hits_increase_power",
	"weave_ring_not_consume_potion",
	"weave_ring_potion_spread",
	"weave_ring_all_potions",
	"weave_ring_potion_duration",
	"weave_necklace_not_consume_healing",
	"weave_necklace_heal_self_on_heal_other",
	"weave_necklace_increased_healing_received",
	"weave_necklace_no_healing_health_regen",
	"weave_necklace_damage_taken_reduction_on_heal",
	"weave_trinket_not_consume_grenade",
	"weave_trinket_increase_grenade_radius",
	"weave_trinket_grenade_damage_taken",
}
local talents_by_career = {}
local properties_by_career = {}
local traits_by_career = {}

for career_name, settings in pairs(WeaveLoadoutSettings) do
	local career_talents = {}

	for tree_row, tier_talents in ipairs(settings.talent_tree) do
		for tree_column, talent_name in ipairs(tier_talents) do
			local talent_id = talent_id_lookup[talent_name].talent_id
			local hero_name = CareerSettings[career_name].profile_name
			local talent = Talents[hero_name][talent_id]

			fassert(talent, "Talent %q in weave_loadout_settings_%s.lua does not exist", talent_name, career_name)

			career_talents[talent_name] = {
				talent = talent,
				tree_row = tree_row,
				tree_column = tree_column,
			}
		end
	end

	talents_by_career[career_name] = career_talents

	local career_properties = {}
	local properties = table.merge(table.clone(default_properties), settings.properties)

	for _, property_name in ipairs(properties) do
		local property = weave_properties[property_name]

		fassert(property, "Property %q in weave_loadout_settings_%s.lua does not exist", property_name, career_name)

		career_properties[property_name] = property
	end

	properties_by_career[career_name] = career_properties

	local career_traits = {}
	local traits = table.merge(table.clone(default_traits), settings.traits)

	for _, trait_name in ipairs(traits) do
		local trait = weave_traits[trait_name]

		fassert(trait, "Trait %q in weave_loadout_settings_%s.lua does not exist", trait_name, career_name)

		career_traits[trait_name] = trait
	end

	traits_by_career[career_name] = career_traits
end

WeaveTalentsByCareer = talents_by_career
WeavePropertiesByCareer = properties_by_career
WeaveTraitsByCareer = traits_by_career
WeaveCareerProgression = {
	properties = {
		{
			category = "offence_accessory",
			unlock_level = 2,
		},
		{
			category = "offence_accessory",
			unlock_level = 5,
		},
		{
			category = "offence_accessory",
			unlock_level = 8,
		},
		{
			category = "offence_accessory",
			unlock_level = 11,
		},
		{
			category = "offence_accessory",
			unlock_level = 14,
		},
		{
			category = "offence_accessory",
			unlock_level = 17,
		},
		{
			category = "offence_accessory",
			unlock_level = 20,
		},
		{
			category = "offence_accessory",
			unlock_level = 23,
		},
		{
			category = "offence_accessory",
			unlock_level = 26,
		},
		{
			category = "offence_accessory",
			unlock_level = 29,
		},
		{
			category = "defence_accessory",
			unlock_level = 3,
		},
		{
			category = "defence_accessory",
			unlock_level = 6,
		},
		{
			category = "defence_accessory",
			unlock_level = 9,
		},
		{
			category = "defence_accessory",
			unlock_level = 12,
		},
		{
			category = "defence_accessory",
			unlock_level = 15,
		},
		{
			category = "defence_accessory",
			unlock_level = 18,
		},
		{
			category = "defence_accessory",
			unlock_level = 21,
		},
		{
			category = "defence_accessory",
			unlock_level = 24,
		},
		{
			category = "defence_accessory",
			unlock_level = 27,
		},
		{
			category = "defence_accessory",
			unlock_level = 29,
		},
		{
			category = "utility_accessory",
			unlock_level = 4,
		},
		{
			category = "utility_accessory",
			unlock_level = 7,
		},
		{
			category = "utility_accessory",
			unlock_level = 10,
		},
		{
			category = "utility_accessory",
			unlock_level = 13,
		},
		{
			category = "utility_accessory",
			unlock_level = 16,
		},
		{
			category = "utility_accessory",
			unlock_level = 19,
		},
		{
			category = "utility_accessory",
			unlock_level = 22,
		},
		{
			category = "utility_accessory",
			unlock_level = 25,
		},
		{
			category = "utility_accessory",
			unlock_level = 28,
		},
		{
			category = "utility_accessory",
			unlock_level = 29,
		},
	},
	talents = {
		{
			category = 1,
			unlock_level = 5,
		},
		{
			category = 2,
			unlock_level = 10,
		},
		{
			category = 3,
			unlock_level = 15,
		},
		{
			category = 4,
			unlock_level = 20,
		},
		{
			category = 5,
			unlock_level = 25,
		},
		{
			category = 6,
			unlock_level = 30,
		},
	},
	traits = {
		{
			category = "offence_accessory",
			unlock_level = 10,
		},
		{
			category = "defence_accessory",
			unlock_level = 15,
		},
		{
			category = "utility_accessory",
			unlock_level = 20,
		},
	},
}
WeaveWeaponProgression = {
	properties = {
		{
			unlock_level = 2,
		},
		{
			unlock_level = 3,
		},
		{
			unlock_level = 4,
		},
		{
			unlock_level = 5,
		},
		{
			unlock_level = 6,
		},
		{
			unlock_level = 7,
		},
		{
			unlock_level = 9,
		},
		{
			unlock_level = 10,
		},
		{
			unlock_level = 11,
		},
		{
			unlock_level = 12,
		},
	},
	traits = {
		{
			unlock_level = 8,
		},
	},
}
WeaveMasterySettings = {
	career_mastery_per_magic_level = 50,
	item_mastery_per_magic_level = 15,
	mastery_cap_amulet = 1400,
	mastery_cap_weapon = 400,
}
