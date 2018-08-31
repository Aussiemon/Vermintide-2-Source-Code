MixerSettings = {
	cutoff_for_guaranteed_negative_vote = -300,
	initial_downtime = 60,
	default_draw_vote = "twitch_vote_draw",
	default_downtime = 30,
	starting_funds = 0,
	default_vote_time = 45,
	max_diff = 200,
	max_a_b_vote_cost_diff = 100,
	difficulty = 50,
	cutoff_for_guaranteed_positive_vote = 300,
	profile_index_to_letter_lookup = {
		"a",
		"b",
		"c",
		"d",
		"e"
	},
	valid_multiple_choice_scenes = {
		multiple_choice_bcde = true,
		multiple_choice_abcd = true,
		multiple_choice_abce = true,
		multiple_choice_abde = true,
		multiple_choice_acde = true
	},
	standard_vote = {
		default_vote_a_str = "vote_left",
		num_options = 2,
		sparks_vote_a_str = "sparks_vote_left",
		default_vote_b_str = "vote_right",
		sparks_vote_b_str = "sparks_vote_right"
	},
	multiple_choice = {
		sparks_vote_a_str = "sparks_vote_a",
		num_options = 4,
		default_vote_e_str = "vote_e",
		default_vote_b_str = "vote_b",
		default_vote_c_str = "vote_c",
		default_vote_d_str = "vote_d",
		default_vote_a_str = "vote_a",
		sparks_vote_c_str = "sparks_vote_c",
		sparks_vote_d_str = "sparks_vote_d",
		sparks_vote_e_str = "sparks_vote_e",
		sparks_vote_b_str = "sparks_vote_b"
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

fassert(min_diff <= MixerSettings.max_diff, "[MixerSettings] The minimum difference between vote templates exceeeds %s", MixerSettings.max_diff)

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
