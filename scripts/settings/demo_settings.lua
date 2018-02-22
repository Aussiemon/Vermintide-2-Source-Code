if not Demosettings then
	slot0 = {
		disable_free_flight = true,
		career_index = "we_shade",
		disable_intro_trailer = true,
		level_resource_package = "resource_packages/levels/honduras/debug/ussingen_demo",
		camera_end_position = "character_position_camera",
		starting_camera_name = "logo_position_camera",
		wanted_profile_index = 4,
		level_name = "levels/honduras/debug/ussingen_demo/world",
		attract_timer = 45,
		inventory_resource_package = "resource_packages/inventory",
		demo_idle_timer = 90,
		demo_level = "ussingen_demo",
		difficulty = "normal",
		key_combinations_allowed = {
			[Window.KEYSTROKE_ALT_ENTER] = ((BUILD == "dev" or BUILD == "debug") and true) or false,
			[Window.KEYSTROKE_ALT_F4] = ((BUILD == "dev" or BUILD == "debug") and true) or false,
			[Window.KEYSTROKE_ALT_TAB] = ((BUILD == "dev" or BUILD == "debug") and true) or false,
			[Window.KEYSTROKE_WINDOWS] = ((BUILD == "dev" or BUILD == "debug") and true) or false
		},
		characters = {
			{
				profile_name = "wood_elf",
				career_index = 3,
				zoom_offset = Vector3Box(0, -1, -0.1),
				position_offset = Vector3Box(0.9, 2.3, 0),
				rotation = QuaternionBox(Quaternion.axis_angle(Vector3(0, 0, 1), math.degrees_to_radians(-15)))
			},
			{
				profile_name = "empire_soldier",
				career_index = 3,
				zoom_offset = Vector3Box(-0, -1, -0.1),
				position_offset = Vector3Box(-0.9, 2.3, 0),
				rotation = QuaternionBox(Quaternion.axis_angle(Vector3(0, 0, 1), math.degrees_to_radians(65)))
			}
		},
		play_on_select = {
			wood_elf = "Play_wood_elf_career_presentation_shade_vo",
			empire_soldier = "Play_soldier_career_presentation_huntsman_vo"
		}
	}
end

DemoSettings = slot0
DemoBackendSaveDataVersion = 4
DefaultDemoLocalBackendData = {
	items = {
		{
			key = "wh_fencing_sword_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "wh_brace_of_pistols_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "wh_hat_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "bw_sword_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "bw_skullstaff_fireball_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "bw_gate_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "dr_shield_axe_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "dr_rakegun_0001",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "dr_helmet_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "we_spear_0001",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "we_shortbow_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "ww_hood_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "es_2h_hammer_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "es_blunderbuss_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "es_hat_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "wh_2h_sword_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "bw_skullstaff_geiser_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "dr_2h_axe_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "we_1h_sword_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "es_repeating_handgun_0001",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "witchhunter_hat_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "zealot_hat_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "bountyhunter_hat_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "wh_1h_falchion_0001",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "wh_1h_axe_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "wh_repeating_pistols_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "wh_crossbow_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "unchained_hat_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "adept_hat_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "scholar_hat_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "bw_flame_sword_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "bw_1h_mace_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "bw_skullstaff_spear_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "ironbreaker_hat_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "slayer_hat_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "ranger_hat_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "dr_shield_hammer_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "dr_dual_wield_axes_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "dr_1h_axe_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "dr_drake_pistol_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "shade_hat_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "maidenguard_hat_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "we_dual_wield_daggers_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "we_dual_wield_sword_dagger_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "we_spear_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "we_longbow_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "we_crossbow_repeater_0001",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "huntsman_hat_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "mercenary_hat_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "knight_hat_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "es_1h_mace_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "es_halberd_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "es_handgun_0000",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		},
		{
			key = "es_2h_hammer_tutorial",
			xp = 0,
			power_level = 0,
			data = {
				amount = 1
			}
		}
	},
	loadout = {
		witch_hunter = {
			slot_hat = 3,
			slot_melee = 1,
			slot_ranged = 2
		},
		bright_wizard = {
			slot_hat = 6,
			slot_melee = 4,
			slot_ranged = 5
		},
		dwarf_ranger = {
			slot_hat = 9,
			slot_melee = 7,
			slot_ranged = 8
		},
		wood_elf = {
			slot_hat = 12,
			slot_melee = 10,
			slot_ranged = 11
		},
		empire_soldier = {
			slot_hat = 15,
			slot_melee = 13,
			slot_ranged = 14
		},
		wh_zealot = {
			slot_hat = 22,
			slot_melee = 24,
			slot_ranged = 27
		},
		wh_bountyhunter = {
			slot_hat = 23,
			slot_melee = 24,
			slot_ranged = 26
		},
		wh_captain = {
			slot_hat = 21,
			slot_melee = 1,
			slot_ranged = 2
		},
		bw_scholar = {
			slot_hat = 30,
			slot_melee = 4,
			slot_ranged = 33
		},
		bw_adept = {
			slot_hat = 29,
			slot_melee = 32,
			slot_ranged = 5
		},
		bw_unchained = {
			slot_hat = 28,
			slot_melee = 31,
			slot_ranged = 17
		},
		dr_ironbreaker = {
			slot_hat = 34,
			slot_melee = 37,
			slot_ranged = 40
		},
		dr_slayer = {
			slot_hat = 35,
			slot_melee = 38,
			slot_ranged = 8
		},
		dr_ranger = {
			slot_hat = 36,
			slot_melee = 39,
			slot_ranged = 8
		},
		we_shade = {
			slot_hat = 41,
			slot_melee = 10,
			slot_ranged = 47
		},
		we_maidenguard = {
			slot_hat = 42,
			slot_melee = 45,
			slot_ranged = 11
		},
		we_waywatcher = {
			slot_hat = 12,
			slot_melee = 10,
			slot_ranged = 46
		},
		es_huntsman = {
			slot_hat = 48,
			slot_melee = 51,
			slot_ranged = 53
		},
		es_knight = {
			slot_hat = 50,
			slot_melee = 13,
			slot_ranged = 20
		},
		es_mercenary = {
			slot_hat = 49,
			slot_melee = 52,
			slot_ranged = 14
		},
		empire_soldier_tutorial = {
			slot_hat = 15,
			slot_melee = 54
		}
	},
	profile_attributes = {
		prestige = 0,
		experience = 0
	},
	stats = {},
	save_data_version = DemoBackendSaveDataVersion
}
DEFAULT_DEMO_ATTRIBUTES = {
	hero_attributes_witch_hunter = {
		hero_attribute_experience = "0",
		hero_attribute_career = "2",
		hero_attribute_prestige = "0"
	},
	hero_attributes_bright_wizard = {
		hero_attribute_experience = "0",
		hero_attribute_career = "3",
		hero_attribute_prestige = "0"
	},
	hero_attributes_dwarf_ranger = {
		hero_attribute_experience = "0",
		hero_attribute_career = "2",
		hero_attribute_prestige = "0"
	},
	hero_attributes_wood_elf = {
		hero_attribute_experience = "0",
		hero_attribute_career = "3",
		hero_attribute_prestige = "0"
	},
	hero_attributes_empire_soldier = {
		hero_attribute_experience = "0",
		hero_attribute_career = "3",
		hero_attribute_prestige = "0"
	},
	hero_attributes_empire_soldier_tutorial = {
		hero_attribute_experience = "0",
		hero_attribute_career = "1",
		hero_attribute_prestige = "0"
	}
}

return 
