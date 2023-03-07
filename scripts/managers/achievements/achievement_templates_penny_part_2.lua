local add_event_challenge = AchievementTemplateHelper.add_event_challenge
local add_levels_complete_challenge = AchievementTemplateHelper.add_levels_complete_challenge
local add_meta_challenge = AchievementTemplateHelper.add_meta_challenge
local PLACEHOLDER_ICON = AchievementTemplateHelper.PLACEHOLDER_ICON
local achievements = AchievementTemplates.achievements
local XB1_ACHIEVEMENT_ID = {
	penny_bastion_sprinter = 89,
	penny_bastion_torch = 88
}
local PS4_ACHIEVEMENT_ID = {
	penny_bastion_sprinter = "082"
}
local bastion_sprinter = 50

add_event_challenge(achievements, "penny_portals_grapes", nil, nil, nil, XB1_ACHIEVEMENT_ID.penny_portals_grapes, PS4_ACHIEVEMENT_ID.penny_portals_grapes)
add_event_challenge(achievements, "penny_portals_coop", nil, nil, nil, XB1_ACHIEVEMENT_ID.penny_portals_coop, PS4_ACHIEVEMENT_ID.penny_portals_coop)
add_event_challenge(achievements, "penny_portals_templerun", nil, nil, nil, XB1_ACHIEVEMENT_ID.penny_portals_templerun, PS4_ACHIEVEMENT_ID.penny_portals_templerun)
add_event_challenge(achievements, "penny_portals_careful", nil, nil, nil, XB1_ACHIEVEMENT_ID.penny_portals_careful, PS4_ACHIEVEMENT_ID.penny_portals_careful)
add_event_challenge(achievements, "penny_bastion_journal", nil, nil, nil, XB1_ACHIEVEMENT_ID.penny_bastion_journal, PS4_ACHIEVEMENT_ID.penny_bastion_journal)
add_event_challenge(achievements, "penny_bastion_overstay", nil, nil, nil, XB1_ACHIEVEMENT_ID.penny_bastion_overstay, PS4_ACHIEVEMENT_ID.penny_bastion_overstay)
add_event_challenge(achievements, "penny_bastion_sprinter", nil, {
	bastion_sprinter
}, nil, XB1_ACHIEVEMENT_ID.penny_bastion_sprinter, PS4_ACHIEVEMENT_ID.penny_bastion_sprinter)
add_event_challenge(achievements, "penny_bastion_yorick", nil, nil, nil, XB1_ACHIEVEMENT_ID.penny_bastion_yorick, PS4_ACHIEVEMENT_ID.penny_bastion_yorick)
add_event_challenge(achievements, "penny_bastion_torch", nil, nil, nil, XB1_ACHIEVEMENT_ID.penny_bastion_torch, PS4_ACHIEVEMENT_ID.penny_bastion_torch)

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

for i = 1, #difficulties do
	local difficulty_key = difficulties[i]
	local difficulty_name = DifficultyMapping[difficulty_key]
	local name = "penny_complete_bastion_" .. difficulty_name

	add_levels_complete_challenge(achievements, name, bastion, DifficultySettings[difficulty_key].rank, nil, nil, XB1_ACHIEVEMENT_ID[name], PS4_ACHIEVEMENT_ID[name])
end

add_meta_challenge(achievements, "penny_complete_bastion", {
	"penny_bastion_journal",
	"penny_bastion_overstay",
	"penny_bastion_sprinter",
	"penny_bastion_yorick",
	"penny_bastion_torch"
})
