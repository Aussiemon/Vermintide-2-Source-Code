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
				tree_column = tree_column
			}
		end
	end

	talents_by_career[career_name] = career_talents
	local career_properties = {}

	for _, property_name in ipairs(settings.properties) do
		local property = weave_properties[property_name]

		fassert(property, "Property %q in weave_loadout_settings_%s.lua does not exist", property_name, career_name)

		career_properties[property_name] = property
	end

	properties_by_career[career_name] = career_properties
	local career_traits = {}

	for _, trait_name in ipairs(settings.traits) do
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
			unlock_level = 2,
			category = "offence_accessory"
		},
		{
			unlock_level = 5,
			category = "offence_accessory"
		},
		{
			unlock_level = 8,
			category = "offence_accessory"
		},
		{
			unlock_level = 11,
			category = "offence_accessory"
		},
		{
			unlock_level = 14,
			category = "offence_accessory"
		},
		{
			unlock_level = 17,
			category = "offence_accessory"
		},
		{
			unlock_level = 20,
			category = "offence_accessory"
		},
		{
			unlock_level = 23,
			category = "offence_accessory"
		},
		{
			unlock_level = 26,
			category = "offence_accessory"
		},
		{
			unlock_level = 29,
			category = "offence_accessory"
		},
		{
			unlock_level = 3,
			category = "defence_accessory"
		},
		{
			unlock_level = 6,
			category = "defence_accessory"
		},
		{
			unlock_level = 9,
			category = "defence_accessory"
		},
		{
			unlock_level = 12,
			category = "defence_accessory"
		},
		{
			unlock_level = 15,
			category = "defence_accessory"
		},
		{
			unlock_level = 18,
			category = "defence_accessory"
		},
		{
			unlock_level = 21,
			category = "defence_accessory"
		},
		{
			unlock_level = 24,
			category = "defence_accessory"
		},
		{
			unlock_level = 27,
			category = "defence_accessory"
		},
		{
			unlock_level = 29,
			category = "defence_accessory"
		},
		{
			unlock_level = 4,
			category = "utility_accessory"
		},
		{
			unlock_level = 7,
			category = "utility_accessory"
		},
		{
			unlock_level = 10,
			category = "utility_accessory"
		},
		{
			unlock_level = 13,
			category = "utility_accessory"
		},
		{
			unlock_level = 16,
			category = "utility_accessory"
		},
		{
			unlock_level = 19,
			category = "utility_accessory"
		},
		{
			unlock_level = 22,
			category = "utility_accessory"
		},
		{
			unlock_level = 25,
			category = "utility_accessory"
		},
		{
			unlock_level = 28,
			category = "utility_accessory"
		},
		{
			unlock_level = 29,
			category = "utility_accessory"
		}
	},
	talents = {
		{
			unlock_level = 5,
			category = 1
		},
		{
			unlock_level = 10,
			category = 2
		},
		{
			unlock_level = 15,
			category = 3
		},
		{
			unlock_level = 20,
			category = 4
		},
		{
			unlock_level = 25,
			category = 5
		},
		{
			unlock_level = 30,
			category = 6
		}
	},
	traits = {
		{
			unlock_level = 10,
			category = "offence_accessory"
		},
		{
			unlock_level = 15,
			category = "defence_accessory"
		},
		{
			unlock_level = 20,
			category = "utility_accessory"
		}
	}
}
WeaveWeaponProgression = {
	properties = {
		{
			unlock_level = 2
		},
		{
			unlock_level = 3
		},
		{
			unlock_level = 4
		},
		{
			unlock_level = 5
		},
		{
			unlock_level = 6
		},
		{
			unlock_level = 7
		},
		{
			unlock_level = 9
		},
		{
			unlock_level = 10
		},
		{
			unlock_level = 11
		},
		{
			unlock_level = 12
		}
	},
	traits = {
		{
			unlock_level = 8
		}
	}
}
WeaveMasterySettings = {
	mastery_cap_weapon = 400,
	career_mastery_per_magic_level = 50,
	item_mastery_per_magic_level = 15,
	mastery_cap_amulet = 1400
}

return
