TwitchSettings = {
	max_diff = 200,
	initial_downtime = 60,
	default_vote_time = 30,
	default_downtime = 30,
	default_draw_vote = "twitch_vote_draw",
	funds = 0,
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

for name, template in pairs(TwitchVoteTemplates) do
	TwitchVoteTemplatesLookup[#TwitchVoteTemplatesLookup + 1] = name
	TwitchVoteTemplatesLookup[name] = #TwitchVoteTemplatesLookup

	if template.multiple_choice then
		TwitchMultipleChoiceVoteTemplatesLookup[#TwitchMultipleChoiceVoteTemplatesLookup + 1] = name
		TwitchMultipleChoiceVoteTemplatesLookup[name] = #TwitchMultipleChoiceVoteTemplatesLookup
	else
		TwitchStandardVoteTemplatesLookup[#TwitchStandardVoteTemplatesLookup + 1] = name
		TwitchStandardVoteTemplatesLookup[name] = #TwitchStandardVoteTemplatesLookup
	end
end

return 
