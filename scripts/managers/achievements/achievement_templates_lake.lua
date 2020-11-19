local add_event_challenge = AchievementTemplateHelper.add_event_challenge
local add_levels_complete_challenge = AchievementTemplateHelper.add_levels_complete_challenge
local add_levels_complete_per_hero_challenge = AchievementTemplateHelper.add_levels_complete_per_hero_challenge
local add_levels_streak_per_hero_challenge = AchievementTemplateHelper.add_levels_streak_per_hero_challenge
local add_career_mission_count_challenge = AchievementTemplateHelper.add_career_mission_count_challenge
local add_weapon_kills_per_breeds_challenge = AchievementTemplateHelper.add_weapon_kills_per_breeds_challenge
local add_meta_challenge = AchievementTemplateHelper.add_meta_challenge
local add_health_challenge = AchievementTemplateHelper.add_health_challenge
local add_stat_count_challenge = AchievementTemplateHelper.add_stat_count_challenge
local PLACEHOLDER_ICON = AchievementTemplateHelper.PLACEHOLDER_ICON
local achievements = AchievementTemplates.achievements
local achievement_settings = DLCSettings.lake
local XB1_ACHIEVEMENT_ID = {}
local PS4_ACHIEVEMENT_ID = {}
local difficulties = {
	"normal",
	"hard",
	"harder",
	"hardest",
	"cataclysm"
}
local main_game_levels = HelmgartLevels

add_event_challenge(achievements, "lake_charge_stagger", nil, nil, "lake_upgrade", XB1_ACHIEVEMENT_ID.lake_charge_stagger, PS4_ACHIEVEMENT_ID.lake_charge_stagger)
add_event_challenge(achievements, "lake_bastard_block", nil, nil, "lake_upgrade", XB1_ACHIEVEMENT_ID.lake_bastard_block, PS4_ACHIEVEMENT_ID.lake_bastard_block)
add_event_challenge(achievements, "lake_speed_quest", nil, {
	achievement_settings.speed_quest_complete_time
}, "lake_upgrade", nil, nil)
add_event_challenge(achievements, "lake_timing_quest", nil, {
	achievement_settings.timing_quest_complete_margain
}, "lake_upgrade", nil, nil)

local harder_difficulties = {
	"harder",
	"hardest",
	"cataclysm"
}

add_career_mission_count_challenge(achievements, "lake_complete_100_missions", "completed_career_levels", "es_questingknight", difficulties, 100, nil, nil, "lake_upgrade", nil, nil)
add_health_challenge(achievements, "lake_untouchable", "es_questingknight", 0.9, nil, "lake_upgrade", nil, nil)

local elite_breeds = {}
local boss_breeds = {}

for breed_name, breed in pairs(Breeds) do
	if Breeds[breed_name].elite == true then
		elite_breeds[#elite_breeds + 1] = breed_name
	end

	if Breeds[breed_name].boss == true then
		boss_breeds[#boss_breeds + 1] = breed_name
	end
end

add_weapon_kills_per_breeds_challenge(achievements, "lake_boss_killblow", {
	"markus_questingknight_career_skill_weapon"
}, boss_breeds, 5, nil, "lake_upgrade", true, nil, nil)

local act_1_levels = GameActs.act_1
local act_2_levels = GameActs.act_2
local act_3_levels = GameActs.act_3
local diff = DifficultySettings.hardest.rank

add_levels_complete_per_hero_challenge(achievements, "lake_mission_streak_act1_legend", act_1_levels, diff, "es_questingknight", true, nil, "lake_upgrade", XB1_ACHIEVEMENT_ID.lake_mission_streak_act1, PS4_ACHIEVEMENT_ID.lake_mission_streak_act1)
add_levels_complete_per_hero_challenge(achievements, "lake_mission_streak_act2_legend", act_2_levels, diff, "es_questingknight", true, nil, "lake_upgrade", XB1_ACHIEVEMENT_ID.lake_mission_streak_act2, PS4_ACHIEVEMENT_ID.lake_mission_streak_act2)
add_levels_complete_per_hero_challenge(achievements, "lake_mission_streak_act3_legend", act_3_levels, diff, "es_questingknight", true, nil, "lake_upgrade", XB1_ACHIEVEMENT_ID.lake_mission_streak_act3, PS4_ACHIEVEMENT_ID.lake_mission_streak_act3)

for i = 1, #difficulties, 1 do
	local difficulty_key = difficulties[i]
	local name = "lake_complete_all_helmgart_levels_" .. DifficultyMapping[difficulty_key]

	add_levels_complete_per_hero_challenge(achievements, name, main_game_levels, DifficultySettings[difficulty_key].rank, "es_questingknight", false, nil, "lake_upgrade", XB1_ACHIEVEMENT_ID.complete_all_helmgart_levels, PS4_ACHIEVEMENT_ID.complete_all_helmgart_levels)
end

local all_challenges = {
	"lake_complete_all_helmgart_levels_recruit_es_questingknight",
	"lake_complete_all_helmgart_levels_veteran_es_questingknight",
	"lake_complete_all_helmgart_levels_champion_es_questingknight",
	"lake_complete_all_helmgart_levels_legend_es_questingknight",
	"lake_complete_100_missions_es_questingknight",
	"lake_mission_streak_act1_legend_es_questingknight",
	"lake_mission_streak_act2_legend_es_questingknight",
	"lake_mission_streak_act3_legend_es_questingknight",
	"lake_boss_killblow",
	"lake_charge_stagger",
	"lake_bastard_block",
	"lake_untouchable",
	"lake_speed_quest",
	"lake_timing_quest"
}

add_meta_challenge(achievements, "complete_all_grailknight_challenges", all_challenges, nil, "lake_upgrade", nil, nil)

QuestSettings.track_bastard_block_breeds.hero_es_questingknight = true
QuestSettings.track_charge_stagger_breeds.es_questingknight = true

return
