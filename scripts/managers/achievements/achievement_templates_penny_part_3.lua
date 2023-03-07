local add_event_challenge = AchievementTemplateHelper.add_event_challenge
local add_levels_complete_challenge = AchievementTemplateHelper.add_levels_complete_challenge
local add_meta_challenge = AchievementTemplateHelper.add_meta_challenge
local PLACEHOLDER_ICON = AchievementTemplateHelper.PLACEHOLDER_ICON
local achievements = AchievementTemplates.achievements
local XB1_ACHIEVEMENT_ID = {
	penny_complete_veteran = 83,
	penny_castle_eruptions = 90,
	penny_complete_recruit = 82,
	penny_complete_legend = 85,
	penny_complete_champion = 84,
	penny_castle_no_kill = 91
}
local PS4_ACHIEVEMENT_ID = {
	penny_castle_eruptions = "083"
}

add_event_challenge(achievements, "penny_castle_chalice", nil, nil, nil, XB1_ACHIEVEMENT_ID.penny_castle_chalice, PS4_ACHIEVEMENT_ID.penny_castle_chalice)
add_event_challenge(achievements, "penny_castle_skull", nil, nil, nil, XB1_ACHIEVEMENT_ID.penny_castle_skull, PS4_ACHIEVEMENT_ID.penny_castle_skull)
add_event_challenge(achievements, "penny_castle_flask", nil, nil, nil, XB1_ACHIEVEMENT_ID.penny_castle_flask, PS4_ACHIEVEMENT_ID.penny_castle_flask)
add_event_challenge(achievements, "penny_castle_eruptions", nil, nil, nil, XB1_ACHIEVEMENT_ID.penny_castle_eruptions, PS4_ACHIEVEMENT_ID.penny_castle_eruptions)
add_event_challenge(achievements, "penny_castle_no_kill", nil, nil, nil, XB1_ACHIEVEMENT_ID.penny_castle_no_kill, PS4_ACHIEVEMENT_ID.penny_castle_no_kill)

local penny_levels = {
	LevelSettings.dlc_portals,
	LevelSettings.dlc_bastion,
	LevelSettings.dlc_castle
}
local castle = {
	LevelSettings.dlc_castle
}
local difficulties = {
	"normal",
	"hard",
	"harder",
	"hardest",
	"cataclysm"
}

for i = 1, #difficulties do
	local difficulty_key = difficulties[i]
	local difficulty_name = DifficultyMapping[difficulty_key]
	local name = "penny_complete_" .. difficulty_name

	add_levels_complete_challenge(achievements, name, penny_levels, DifficultySettings[difficulty_key].rank, nil, nil, XB1_ACHIEVEMENT_ID[name], PS4_ACHIEVEMENT_ID[name])

	local name = "penny_complete_castle_" .. difficulty_name

	add_levels_complete_challenge(achievements, name, castle, DifficultySettings[difficulty_key].rank, nil, nil, XB1_ACHIEVEMENT_ID[name], PS4_ACHIEVEMENT_ID[name])
end

add_meta_challenge(achievements, "penny_complete_castle", {
	"penny_castle_chalice",
	"penny_castle_skull",
	"penny_castle_flask",
	"penny_castle_eruptions",
	"penny_castle_no_kill"
})
