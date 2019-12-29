local add_event_challenge = AchievementTemplateHelper.add_event_challenge
local add_levels_complete_challenge = AchievementTemplateHelper.add_levels_complete_challenge
local add_meta_challenge = AchievementTemplateHelper.add_meta_challenge
local PLACEHOLDER_ICON = AchievementTemplateHelper.PLACEHOLDER_ICON
local achievements = AchievementTemplates.achievements

add_event_challenge(achievements, "penny_portals_portal")
add_event_challenge(achievements, "penny_portals_heads")
add_event_challenge(achievements, "penny_portals_cleanser")
add_event_challenge(achievements, "penny_portals_vintage")
add_event_challenge(achievements, "penny_portals_hideout")

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

for i = 1, #difficulties, 1 do
	local difficulty_key = difficulties[i]
	local difficulty_name = DifficultyMapping[difficulty_key]

	add_levels_complete_challenge(achievements, "penny_complete_portals_" .. difficulty_name, portals, DifficultySettings[difficulty_key].rank)
end

add_meta_challenge(achievements, "penny_complete_portals", {
	"penny_portals_portal",
	"penny_portals_heads",
	"penny_portals_cleanser",
	"penny_portals_vintage",
	"penny_portals_hideout"
})

return
