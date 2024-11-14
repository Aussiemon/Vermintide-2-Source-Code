-- chunkname: @scripts/managers/achievements/achievements_outline.lua

local heroes = {
	name = "achv_menu_heroes_category_title",
	present_progression = true,
	entries = {
		"unlock_first_talent_point",
		"unlock_all_talent_points",
		"complete_level_all",
		"level_thirty_all",
		"complete_all_helmgart_levels_all_careers_recruit",
		"complete_all_helmgart_levels_all_careers_veteran",
		"complete_all_helmgart_levels_all_careers_champion",
		"complete_all_helmgart_levels_all_careers_legend",
	},
	categories = {
		{
			name = "inventory_name_empire_soldier",
			sorting = 1,
			entries = {
				"achievement_markus_level_1",
				"achievement_markus_level_2",
				"achievement_markus_level_3",
				"level_thirty_empire_soldier",
				"scorpion_markus_reach_level_35",
				"complete_all_helmgart_levels_recruit_es_mercenary",
				"complete_all_helmgart_levels_veteran_es_mercenary",
				"complete_all_helmgart_levels_champion_es_mercenary",
				"complete_all_helmgart_levels_legend_es_mercenary",
				"complete_100_missions_champion_es_mercenary",
				"complete_all_helmgart_levels_recruit_es_huntsman",
				"complete_all_helmgart_levels_veteran_es_huntsman",
				"complete_all_helmgart_levels_champion_es_huntsman",
				"complete_all_helmgart_levels_legend_es_huntsman",
				"complete_100_missions_champion_es_huntsman",
				"complete_all_helmgart_levels_recruit_es_knight",
				"complete_all_helmgart_levels_veteran_es_knight",
				"complete_all_helmgart_levels_champion_es_knight",
				"complete_all_helmgart_levels_legend_es_knight",
				"complete_100_missions_champion_es_knight",
			},
		},
		{
			name = "inventory_name_dwarf_ranger",
			sorting = 2,
			entries = {
				"achievement_bardin_level_1",
				"achievement_bardin_level_2",
				"achievement_bardin_level_3",
				"level_thirty_dwarf_ranger",
				"scorpion_bardin_reach_level_35",
				"complete_all_helmgart_levels_recruit_dr_ranger",
				"complete_all_helmgart_levels_veteran_dr_ranger",
				"complete_all_helmgart_levels_champion_dr_ranger",
				"complete_all_helmgart_levels_legend_dr_ranger",
				"complete_100_missions_champion_dr_ranger",
				"complete_all_helmgart_levels_recruit_dr_ironbreaker",
				"complete_all_helmgart_levels_veteran_dr_ironbreaker",
				"complete_all_helmgart_levels_champion_dr_ironbreaker",
				"complete_all_helmgart_levels_legend_dr_ironbreaker",
				"complete_100_missions_champion_dr_ironbreaker",
				"complete_all_helmgart_levels_recruit_dr_slayer",
				"complete_all_helmgart_levels_veteran_dr_slayer",
				"complete_all_helmgart_levels_champion_dr_slayer",
				"complete_all_helmgart_levels_legend_dr_slayer",
				"complete_100_missions_champion_dr_slayer",
			},
		},
		{
			name = "inventory_name_wood_elf",
			sorting = 3,
			entries = {
				"achievement_kerillian_level_1",
				"achievement_kerillian_level_2",
				"achievement_kerillian_level_3",
				"level_thirty_wood_elf",
				"scorpion_kerillian_reach_level_35",
				"complete_all_helmgart_levels_recruit_we_waywatcher",
				"complete_all_helmgart_levels_veteran_we_waywatcher",
				"complete_all_helmgart_levels_champion_we_waywatcher",
				"complete_all_helmgart_levels_legend_we_waywatcher",
				"complete_100_missions_champion_we_waywatcher",
				"complete_all_helmgart_levels_recruit_we_maidenguard",
				"complete_all_helmgart_levels_veteran_we_maidenguard",
				"complete_all_helmgart_levels_champion_we_maidenguard",
				"complete_all_helmgart_levels_legend_we_maidenguard",
				"complete_100_missions_champion_we_maidenguard",
				"complete_all_helmgart_levels_recruit_we_shade",
				"complete_all_helmgart_levels_veteran_we_shade",
				"complete_all_helmgart_levels_champion_we_shade",
				"complete_all_helmgart_levels_legend_we_shade",
				"complete_100_missions_champion_we_shade",
			},
		},
		{
			name = "inventory_name_witch_hunter",
			sorting = 4,
			entries = {
				"achievement_victor_level_1",
				"achievement_victor_level_2",
				"achievement_victor_level_3",
				"level_thirty_witch_hunter",
				"scorpion_victor_reach_level_35",
				"complete_all_helmgart_levels_recruit_wh_captain",
				"complete_all_helmgart_levels_veteran_wh_captain",
				"complete_all_helmgart_levels_champion_wh_captain",
				"complete_all_helmgart_levels_legend_wh_captain",
				"complete_100_missions_champion_wh_captain",
				"complete_all_helmgart_levels_recruit_wh_bountyhunter",
				"complete_all_helmgart_levels_veteran_wh_bountyhunter",
				"complete_all_helmgart_levels_champion_wh_bountyhunter",
				"complete_all_helmgart_levels_legend_wh_bountyhunter",
				"complete_100_missions_champion_wh_bountyhunter",
				"complete_all_helmgart_levels_recruit_wh_zealot",
				"complete_all_helmgart_levels_veteran_wh_zealot",
				"complete_all_helmgart_levels_champion_wh_zealot",
				"complete_all_helmgart_levels_legend_wh_zealot",
				"complete_100_missions_champion_wh_zealot",
			},
		},
		{
			name = "inventory_name_bright_wizard",
			sorting = 5,
			entries = {
				"achievement_sienna_level_1",
				"achievement_sienna_level_2",
				"achievement_sienna_level_3",
				"level_thirty_bright_wizard",
				"scorpion_sienna_reach_level_35",
				"complete_all_helmgart_levels_recruit_bw_adept",
				"complete_all_helmgart_levels_veteran_bw_adept",
				"complete_all_helmgart_levels_champion_bw_adept",
				"complete_all_helmgart_levels_legend_bw_adept",
				"complete_100_missions_champion_bw_adept",
				"complete_all_helmgart_levels_recruit_bw_scholar",
				"complete_all_helmgart_levels_veteran_bw_scholar",
				"complete_all_helmgart_levels_champion_bw_scholar",
				"complete_all_helmgart_levels_legend_bw_scholar",
				"complete_100_missions_champion_bw_scholar",
				"complete_all_helmgart_levels_recruit_bw_unchained",
				"complete_all_helmgart_levels_veteran_bw_unchained",
				"complete_all_helmgart_levels_champion_bw_unchained",
				"complete_all_helmgart_levels_legend_bw_unchained",
				"complete_100_missions_champion_bw_unchained",
			},
		},
	},
}
local levels = {
	name = "achv_menu_levels_category_title",
	present_progression = true,
	entries = {
		"complete_all_helmgart_levels_recruit",
		"complete_all_helmgart_levels_veteran",
		"complete_all_helmgart_levels_champion",
		"complete_all_helmgart_levels_legend",
		"scorpion_complete_all_helmgart_levels_cataclysm",
		"complete_bogenhafen_recruit",
		"complete_bogenhafen_veteran",
		"complete_bogenhafen_champion",
		"complete_bogenhafen_legend",
		"scorpion_complete_bogenhafen_cataclysm",
	},
	categories = {
		{
			name = "achv_menu_levels_helmgart_category_title",
			sorting = 1,
			entries = {
				"complete_tutorial",
				"complete_act_one",
				"scorpion_complete_helmgart_act_one_cataclysm",
				"complete_act_two",
				"scorpion_complete_helmgart_act_two_cataclysm",
				"complete_act_three",
				"scorpion_complete_helmgart_act_three_cataclysm",
				"complete_skittergate_recruit",
				"complete_skittergate_veteran",
				"complete_skittergate_champion",
				"complete_skittergate_legend",
				"scorpion_complete_skittergate_cataclysm",
				"kill_bodvarr_burblespew_recruit",
				"kill_bodvarr_burblespew_veteran",
				"kill_bodvarr_burblespew_champion",
				"kill_bodvarr_burblespew_legend",
				"kill_skarrik_rasknitt_recruit",
				"kill_skarrik_rasknitt_veteran",
				"kill_skarrik_rasknitt_champion",
				"kill_skarrik_rasknitt_legend",
				"elven_ruins_align_leylines_timed",
				"farmlands_rescue_prisoners_timed",
				"military_kill_chaos_warriors_in_event",
				"ground_zero_burblespew_tornado_enemies",
				"fort_kill_enemies_cannonball",
				"nurgle_player_showered_in_pus",
				"bell_destroy_bell_flee_timed",
				"catacombs_stay_inside_ritual_pool",
				"mines_kill_final_troll_timed",
				"warcamp_bodvarr_charge_warriors",
				"skaven_stronghold_skarrik_kill_skaven",
				"ussingen_no_event_barrels",
				"skittergate_deathrattler_rasknitt_timed",
				"complete_all_helmgart_level_achievements",
				"elven_ruins_align_leylines_timed_cata",
				"farmlands_rescue_prisoners_timed_cata",
				"military_kill_chaos_warriors_in_event_cata",
				"ground_zero_burblespew_tornado_enemies_cata",
				"fort_kill_enemies_cannonball_cata",
				"nurgle_player_showered_in_pus_cata",
				"bell_destroy_bell_flee_timed_cata",
				"catacombs_stay_inside_ritual_pool_cata",
				"mines_kill_final_troll_timed_cata",
				"warcamp_bodvarr_charge_warriors_cata",
				"skaven_stronghold_skarrik_kill_skaven_cata",
				"ussingen_no_event_barrels_cata",
				"skittergate_deathrattler_rasknitt_timed_cata",
			},
		},
		{
			name = "achv_menu_levels_bogenhafen_category_title",
			sorting = 2,
			entries = {
				"complete_bogenhafen_slum_recruit",
				"complete_bogenhafen_slum_veteran",
				"complete_bogenhafen_slum_champion",
				"complete_bogenhafen_slum_legend",
				"complete_bogenhafen_city_recruit",
				"complete_bogenhafen_city_veteran",
				"complete_bogenhafen_city_champion",
				"complete_bogenhafen_city_legend",
				"bogenhafen_city_all_wine_collected",
				"bogenhafen_city_jumping_puzzle",
				"bogenhafen_slum_find_hidden_stash",
				"bogenhafen_slum_jumping_puzzle",
				"bogenhafen_city_no_braziers_lit",
				"bogenhafen_city_torch_not_picked_up",
				"bogenhafen_city_fast_switches",
				"bogenhafen_slum_no_ratling_damage",
				"bogenhafen_slum_no_windows_broken",
				"bogenhafen_slum_event_speedrun",
				"bogenhafen_collect_all_cosmetics",
			},
		},
	},
}
local crafting = {
	name = "achv_menu_crafting_category_title",
	present_progression = true,
	entries = {
		"craft_item",
		"craft_fifty_items",
		"salvage_item",
		"salvage_hundred_items",
	},
}
local items = {
	name = "achv_menu_items_category_title",
	present_progression = true,
	entries = {
		"equip_common_quality",
		"equip_rare_quality",
		"equip_exotic_quality",
		"equip_all_exotic_quality",
		"equip_veteran_quality",
		"equip_all_veteran_quality",
	},
}
local deeds = {
	name = "achv_menu_deeds_category_title",
	present_progression = true,
	entries = {
		"complete_deeds_1",
		"complete_deeds_2",
		"complete_deeds_3",
		"complete_deeds_4",
		"complete_deeds_5",
		"complete_deeds_6",
		"complete_deeds_7",
		"complete_deeds_8",
	},
}
local enemies = {
	name = "achv_menu_enemies_category_title",
	present_progression = true,
	entries = {
		"skaven_warpfire_thrower_1",
		"skaven_warpfire_thrower_2",
		"skaven_warpfire_thrower_3",
		"skaven_pack_master_1",
		"skaven_pack_master_2",
		"skaven_pack_master_3",
		"skaven_gutter_runner_1",
		"skaven_gutter_runner_2",
		"skaven_gutter_runner_3",
		"skaven_poison_wind_globardier_1",
		"skaven_poison_wind_globardier_2",
		"skaven_poison_wind_globardier_3",
		"skaven_ratling_gunner_1",
		"skaven_ratling_gunner_2",
		"skaven_ratling_gunner_3",
		"chaos_corruptor_sorcerer_1",
		"chaos_corruptor_sorcerer_2",
		"chaos_corruptor_sorcerer_3",
		"chaos_vortex_sorcerer_1",
		"chaos_vortex_sorcerer_2",
		"chaos_vortex_sorcerer_3",
		"chaos_spawn_1",
		"chaos_spawn_2",
		"chaos_troll_1",
		"chaos_troll_2",
		"skaven_rat_ogre_1",
		"skaven_rat_ogre_2",
		"skaven_stormfiend_1",
		"skaven_stormfiend_2",
		"helmgart_lord_1",
	},
}
local weaves = {
	name = "achv_menu_weaves_category_title",
	present_progression = false,
	entries = {},
	categories = {},
}
local achievements = {
	name = "achv_menu_achievements_category_title",
	categories = {
		levels,
		heroes,
		enemies,
		items,
		crafting,
		deeds,
		weaves,
	},
}

DLCUtils.append("achievement_categories", achievements.categories)

for _, dlc in pairs(DLCSettings) do
	local achievement_outline = dlc.achievement_outline

	if achievement_outline then
		for category_name, data in pairs(achievement_outline) do
			local category

			if category_name == "levels" then
				category = levels
			elseif category_name == "heroes" then
				category = heroes
			elseif category_name == "enemies" then
				category = enemies
			elseif category_name == "items" then
				category = items
			elseif category_name == "crafting" then
				category = crafting
			elseif category_name == "deeds" then
				category = deeds
			elseif category_name == "weaves" then
				category = weaves
			else
				category = {}
			end

			if data.entries then
				if category.entries then
					table.append(category.entries, data.entries)
				else
					category.entries = table.clone(data.entries)
				end
			end

			local categories = data.categories

			if categories then
				for i = 1, #categories do
					local sub_category = categories[i]
					local sub_category_name = sub_category.name
					local current_categories = category.categories
					local sub_category_found = false

					for j = 1, #current_categories do
						local current_sub_category = current_categories[j]
						local current_sub_category_name = current_sub_category.name

						if sub_category_name == current_sub_category_name and not sub_category_found then
							table.append(current_sub_category.entries, sub_category.entries)

							sub_category_found = true
						end
					end

					if not sub_category_found then
						current_categories[#current_categories + 1] = table.clone(sub_category)
					end
				end
			end
		end
	end
end

for _, category in ipairs(achievements.categories) do
	local sub_categories = category.categories

	if sub_categories then
		table.sort(sub_categories, function (a, b)
			return a.sorting < b.sorting
		end)
	end
end

local function assign_category_type(base_category, category_type)
	base_category.type = category_type

	if base_category.categories then
		for i, category in ipairs(base_category.categories) do
			assign_category_type(category, category_type)
		end
	end
end

assign_category_type(achievements, "achievements")

return achievements
