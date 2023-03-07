local settings = DLCSettings.scorpion
settings.achievement_outline = {
	levels = {
		entries = {
			"scorpion_cataclysm_unlock_kill_all_lords"
		},
		categories = {
			{
				sorting = 5,
				name = "achv_menu_levels_crater_category_title",
				entries = {
					"scorpion_complete_weaves_1",
					"scorpion_complete_weaves_2",
					"scorpion_complete_weaves_3",
					"scorpion_complete_weaves_4",
					"scorpion_complete_weaves_5",
					"scorpion_complete_weaves_6",
					"scorpion_complete_weaves_7",
					"scorpion_complete_weaves_8",
					"scorpion_complete_weaves_9",
					"scorpion_complete_weaves_10"
				}
			}
		}
	},
	heroes = {
		categories = {
			{
				name = "inventory_name_empire_soldier",
				entries = {
					"scorpion_markus_weapon_skin_1",
					"scorpion_markus_weapon_skin_2"
				}
			},
			{
				name = "inventory_name_dwarf_ranger",
				entries = {
					"scorpion_bardin_weapon_skin_1",
					"scorpion_bardin_weapon_skin_2"
				}
			},
			{
				name = "inventory_name_wood_elf",
				entries = {
					"scorpion_kerillian_weapon_skin_1",
					"scorpion_kerillian_weapon_skin_2"
				}
			},
			{
				name = "inventory_name_witch_hunter",
				entries = {
					"scorpion_victor_weapon_skin_1",
					"scorpion_victor_weapon_skin_2"
				}
			},
			{
				name = "inventory_name_bright_wizard",
				entries = {
					"scorpion_sienna_weapon_skin_1",
					"scorpion_sienna_weapon_skin_2"
				}
			}
		}
	},
	weaves = {
		entries = {
			"scorpion_weaves_1_season_1",
			"scorpion_weaves_2_season_1",
			"scorpion_weaves_3_season_1",
			"scorpion_weaves_4_season_1",
			"scorpion_weaves_5_season_1",
			"scorpion_weaves_6_season_1",
			"scorpion_weaves_7_season_1",
			"scorpion_weaves_8_season_1",
			"scorpion_weaves_9_season_1",
			"scorpion_weaves_10_season_1",
			"scorpion_weaves_11_season_1"
		},
		categories = {
			{
				sorting = 100,
				name = "achv_menu_season_1_scorpion_category_title",
				entries = {
					"scorpion_weaves_rainbow_es_mercenary_season_1",
					"scorpion_weaves_rainbow_es_huntsman_season_1",
					"scorpion_weaves_rainbow_es_knight_season_1",
					"scorpion_weaves_rainbow_dr_ranger_season_1",
					"scorpion_weaves_rainbow_dr_ironbreaker_season_1",
					"scorpion_weaves_rainbow_dr_slayer_season_1",
					"scorpion_weaves_rainbow_we_waywatcher_season_1",
					"scorpion_weaves_rainbow_we_maidenguard_season_1",
					"scorpion_weaves_rainbow_we_shade_season_1",
					"scorpion_weaves_rainbow_wh_captain_season_1",
					"scorpion_weaves_rainbow_wh_bountyhunter_season_1",
					"scorpion_weaves_rainbow_wh_zealot_season_1",
					"scorpion_weaves_rainbow_bw_adept_season_1",
					"scorpion_weaves_rainbow_bw_scholar_season_1",
					"scorpion_weaves_rainbow_bw_unchained_season_1",
					"scorpion_weaves_complete_es_mercenary_season_1",
					"scorpion_weaves_complete_es_huntsman_season_1",
					"scorpion_weaves_complete_es_knight_season_1",
					"scorpion_weaves_complete_dr_ranger_season_1",
					"scorpion_weaves_complete_dr_ironbreaker_season_1",
					"scorpion_weaves_complete_dr_slayer_season_1",
					"scorpion_weaves_complete_we_waywatcher_season_1",
					"scorpion_weaves_complete_we_maidenguard_season_1",
					"scorpion_weaves_complete_we_shade_season_1",
					"scorpion_weaves_complete_wh_captain_season_1",
					"scorpion_weaves_complete_wh_bountyhunter_season_1",
					"scorpion_weaves_complete_wh_zealot_season_1",
					"scorpion_weaves_complete_bw_adept_season_1",
					"scorpion_weaves_complete_bw_scholar_season_1",
					"scorpion_weaves_complete_bw_unchained_season_1",
					"scorpion_weaves_life_season_1",
					"scorpion_weaves_heavens_season_1",
					"scorpion_weaves_death_season_1",
					"scorpion_weaves_beasts_season_1",
					"scorpion_weaves_light_season_1",
					"scorpion_weaves_fire_season_1",
					"scorpion_weaves_shadow_season_1",
					"scorpion_weaves_metal_season_1"
				}
			},
			{
				sorting = 99,
				name = "achv_menu_season_2_scorpion_category_title",
				entries = {
					"scorpion_complete_unranked_weaves_season_2",
					"scorpion_tier_1_season_2",
					"scorpion_tier_2_season_2",
					"scorpion_tier_3_season_2"
				}
			},
			{
				sorting = 98,
				name = "achv_menu_season_3_scorpion_category_title",
				entries = {
					"scorpion_complete_unranked_weaves_season_3",
					"scorpion_tier_1_season_3",
					"scorpion_tier_2_season_3",
					"scorpion_tier_3_season_3"
				}
			},
			{
				sorting = 98,
				name = "achv_menu_season_4_scorpion_category_title",
				entries = {
					"scorpion_complete_unranked_weaves_season_4",
					"scorpion_tier_1_season_4",
					"scorpion_tier_2_season_4",
					"scorpion_tier_3_season_4",
					"scorpion_tier_4_season_4"
				}
			}
		}
	}
}

if not IS_WINDOWS then
	local weaves = settings.achievement_outline.weaves
	local weave_entries = weaves.entries
	local categories = weaves.categories

	for i = #categories, 1, -1 do
		local category = categories[i]

		for _, entry in ipairs(category.entries) do
			weave_entries[#weave_entries + 1] = entry
		end
	end

	weaves.categories = {}
end

settings.achievement_template_file_names = {
	"scripts/settings/dlcs/scorpion/scorpion_seasonal_settings",
	"scripts/managers/achievements/achievement_templates_scorpion"
}
