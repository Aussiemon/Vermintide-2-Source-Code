local add_event_challenge = AchievementTemplateHelper.add_event_challenge
local add_levels_complete_challenge = AchievementTemplateHelper.add_levels_complete_challenge
local add_meta_challenge = AchievementTemplateHelper.add_meta_challenge
local PLACEHOLDER_ICON = AchievementTemplateHelper.PLACEHOLDER_ICON
local achievements = AchievementTemplates.achievements
local XB1_ACHIEVEMENT_ID = {
	penny_portals_heads = 86,
	penny_portals_vintage = 87
}
local PS4_ACHIEVEMENT_ID = {
	penny_portals_vintage = "081"
}

add_event_challenge(achievements, "penny_portals_portal", nil, nil, nil, XB1_ACHIEVEMENT_ID.penny_portals_portal, PS4_ACHIEVEMENT_ID.penny_portals_portal)
add_event_challenge(achievements, "penny_portals_heads", nil, nil, nil, XB1_ACHIEVEMENT_ID.penny_portals_heads, PS4_ACHIEVEMENT_ID.penny_portals_heads)
add_event_challenge(achievements, "penny_portals_cleanser", nil, nil, nil, XB1_ACHIEVEMENT_ID.penny_portals_cleanser, PS4_ACHIEVEMENT_ID.penny_portals_cleanser)
add_event_challenge(achievements, "penny_portals_vintage", nil, nil, nil, XB1_ACHIEVEMENT_ID.penny_portals_vintage, PS4_ACHIEVEMENT_ID.penny_portals_vintage)
add_event_challenge(achievements, "penny_portals_hideout", nil, nil, nil, XB1_ACHIEVEMENT_ID.penny_portals_hideout, PS4_ACHIEVEMENT_ID.penny_portals_hideout)

local portals = {
	LevelSettings.dlc_portals
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
	local name = "penny_complete_portals_" .. difficulty_name

	add_levels_complete_challenge(achievements, name, portals, DifficultySettings[difficulty_key].rank, nil, nil, XB1_ACHIEVEMENT_ID[name], PS4_ACHIEVEMENT_ID[name])
end

add_meta_challenge(achievements, "penny_complete_portals", {
	"penny_portals_portal",
	"penny_portals_heads",
	"penny_portals_cleanser",
	"penny_portals_vintage",
	"penny_portals_hideout"
})
