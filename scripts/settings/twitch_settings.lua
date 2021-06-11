TwitchSettings = TwitchSettings or {
	initial_downtime = 60,
	cutoff_for_guaranteed_negative_vote = -300,
	starting_funds = 0,
	max_diff = 200,
	max_a_b_vote_cost_diff = 100,
	default_draw_vote = "twitch_vote_draw",
	cutoff_for_guaranteed_positive_vote = 300,
	standard_vote = {
		default_vote_a_str = "#a",
		default_vote_b_str = "#b"
	},
	multiple_choice = {
		default_vote_b_str = "#b",
		default_vote_c_str = "#c",
		default_vote_d_str = "#d",
		default_vote_a_str = "#a",
		default_vote_e_str = "#e"
	},
	supported_game_modes = {
		ps4 = {
			weave_quick_play = false,
			deed = false,
			deus_twitch = true,
			adventure_mode = false,
			event = false,
			deus_custom = false,
			deus_quickplay = false,
			custom = false,
			weave = false,
			adventure = true,
			twitch = true,
			versus = false
		},
		xb1 = {
			weave_quick_play = false,
			deed = false,
			deus_twitch = true,
			adventure_mode = false,
			event = false,
			deus_custom = false,
			deus_quickplay = false,
			custom = false,
			weave = false,
			adventure = true,
			twitch = true,
			versus = false
		},
		win32 = {
			weave_quick_play = true,
			deed = true,
			deus_twitch = true,
			adventure_mode = true,
			event = true,
			deus_custom = true,
			deus_quickplay = true,
			custom = true,
			weave = true,
			adventure = true,
			twitch = true,
			versus = true
		}
	},
	positive_vote_options = table.enum("enable_positive_votes", "disable_giving_items", "disable_positive_votes")
}
TwitchVoteTemplates = {}

require("scripts/settings/twitch_vote_templates_buffs")
require("scripts/settings/twitch_vote_templates_items")
require("scripts/settings/twitch_vote_templates_spawning")
require("scripts/settings/twitch_vote_templates_mutators")

for _, dlc in pairs(DLCSettings) do
	local dlc_twitch_settings = dlc.twitch_settings
	local dlc_vote_templates_file = dlc_twitch_settings and dlc_twitch_settings.vote_templates_file

	if dlc_vote_templates_file then
		require(dlc_vote_templates_file)
	end
end

local TEMP_TABLE = {}
local min_diff = math.huge

for name, template in pairs(TwitchVoteTemplates) do
	TEMP_TABLE[name] = name

	for compare_name, compare_template in pairs(TwitchVoteTemplates) do
		if not TEMP_TABLE[compare_name] then
			local diff = math.abs(compare_template.cost + template.cost)

			if diff < min_diff then
				min_diff = diff
			end
		end
	end
end

fassert(min_diff <= TwitchSettings.max_diff, "[TwitchSettings] The minimum difference between vote templates exceeeds %s", TwitchSettings.max_diff)

TwitchVoteTemplatesLookup = {}
TwitchMultipleChoiceVoteTemplatesLookup = {}
TwitchStandardVoteTemplatesLookup = {}
TwitchPositiveVoteTemplatesLookup = {}
TwitchNegativeVoteTemplatesLookup = {}
TwitchBossEquivalentSpawnTemplatesLookup = {}
TwitchBossesSpawnBreedNamesLookup = {}
TwitchSpecialsSpawnBreedNamesLookup = {}

for name, template in pairs(TwitchVoteTemplates) do
	template.name = name
	TwitchVoteTemplatesLookup[#TwitchVoteTemplatesLookup + 1] = name

	if template.multiple_choice then
		TwitchMultipleChoiceVoteTemplatesLookup[#TwitchMultipleChoiceVoteTemplatesLookup + 1] = name
	else
		TwitchStandardVoteTemplatesLookup[#TwitchStandardVoteTemplatesLookup + 1] = name
	end

	if template.cost < 0 then
		TwitchPositiveVoteTemplatesLookup[#TwitchPositiveVoteTemplatesLookup + 1] = name
	else
		TwitchNegativeVoteTemplatesLookup[#TwitchNegativeVoteTemplatesLookup + 1] = name
	end

	if template.breed_name then
		local breed = Breeds[template.breed_name]

		if breed.boss then
			template.boss = true
			TwitchBossesSpawnBreedNamesLookup[template.breed_name] = template
		elseif breed.special then
			template.special = true
			TwitchSpecialsSpawnBreedNamesLookup[template.breed_name] = template
		end
	end

	if template.boss_equivalent then
		TwitchBossEquivalentSpawnTemplatesLookup[#TwitchBossEquivalentSpawnTemplatesLookup + 1] = name
	end
end

TwitchVoteWhitelists = TwitchVoteWhitelists or {}

for _, dlc in pairs(DLCSettings) do
	local dlc_twitch_settings = dlc.twitch_settings

	if dlc_twitch_settings then
		local dlc_supported_game_modes = dlc_twitch_settings.supported_game_modes

		if dlc_supported_game_modes then
			for platform, settings in pairs(TwitchSettings.supported_game_modes) do
				table.merge(settings, dlc_supported_game_modes)
			end
		end

		local dlc_vote_whitelists = dlc_twitch_settings.vote_whitelists

		if dlc_vote_whitelists then
			for game_mode, vote_whitelist in pairs(dlc_vote_whitelists) do
				if TwitchVoteWhitelists[game_mode] then
					table.merge(TwitchVoteWhitelists[game_mode], vote_whitelist)
				else
					TwitchVoteWhitelists[game_mode] = vote_whitelist
				end
			end
		end
	end
end

return
