TwitchSettings = TwitchSettings or {
	cutoff_for_guaranteed_negative_vote = -300,
	initial_downtime = 60,
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
		twitch = true,
		deed = true,
		adventure = true,
		lobby_browser = true,
		event = true,
		custom = true
	}
}
TwitchVoteTemplates = {}

require("scripts/settings/twitch_vote_templates_buffs")
require("scripts/settings/twitch_vote_templates_items")
require("scripts/settings/twitch_vote_templates_spawning")

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

return
