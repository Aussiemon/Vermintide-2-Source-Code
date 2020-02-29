local add_event_challenge = AchievementTemplateHelper.add_event_challenge
local add_levels_complete_challenge = AchievementTemplateHelper.add_levels_complete_challenge
local add_meta_challenge = AchievementTemplateHelper.add_meta_challenge
local PLACEHOLDER_ICON = AchievementTemplateHelper.PLACEHOLDER_ICON
local achievements = AchievementTemplates.achievements
local bastion_sprinter = 50

add_event_challenge(achievements, "penny_portals_grapes")
add_event_challenge(achievements, "penny_portals_coop")
add_event_challenge(achievements, "penny_portals_templerun")
add_event_challenge(achievements, "penny_portals_careful")
add_event_challenge(achievements, "penny_bastion_journal")
add_event_challenge(achievements, "penny_bastion_overstay")
add_event_challenge(achievements, "penny_bastion_sprinter", nil, {
	bastion_sprinter
})
add_event_challenge(achievements, "penny_bastion_yorick")
add_event_challenge(achievements, "penny_bastion_torch")

local bastion = {
	LevelSettings.dlc_bastion
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

	add_levels_complete_challenge(achievements, "penny_complete_bastion_" .. difficulty_name, bastion, DifficultySettings[difficulty_key].rank)
end

add_meta_challenge(achievements, "penny_complete_bastion", {
	"penny_bastion_journal",
	"penny_bastion_overstay",
	"penny_bastion_sprinter",
	"penny_bastion_yorick",
	"penny_bastion_torch"
})

return
