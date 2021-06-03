require("scripts/unit_extensions/default_player_unit/careers/career_ability_settings")
require("scripts/settings/breeds/breed_players")

CareerActionNames = {
	bright_wizard = {
		"action_career_bw_1"
	},
	dwarf_ranger = {
		"action_career_dr_3"
	},
	empire_soldier = {},
	witch_hunter = {
		"action_career_wh_2"
	},
	wood_elf = {
		"action_career_we_3",
		"action_career_we_3_piercing"
	}
}

local function local_is_unlocked_function(career, hero_name, hero_level)
	local unlocked, reason = career:override_available_for_mechanism()

	if unlocked ~= nil then
		return unlocked, reason
	end

	local dlc_name = nil
	unlocked, reason, dlc_name = career:is_dlc_unlocked()

	if not unlocked then
		return false, reason, dlc_name
	end

	return ProgressionUnlocks.is_unlocked_for_profile(career.display_name, hero_name, hero_level)
end

local function local_is_dlc_unlocked(career)
	return true
end

local function local_override_available_for_mechanism(career)
	local settings = Managers.mechanism:mechanism_setting("override_career_availability")
	local career_name = career.display_name

	if settings and settings[career_name] ~= nil then
		return settings[career_name], "disabled_for_mechanism"
	end

	return nil
end

CareerSettings = {
	dr_ironbreaker = {
		profile_name = "dwarf_ranger",
		name = "dr_ironbreaker",
		display_name = "dr_ironbreaker",
		portrait_image_picking = "picking_portrait_bardin_ironbreaker",
		package_name = "resource_packages/careers/dr_ironbreaker",
		preview_idle_animation = "career_idle_01",
		sound_character = "dwarf_ironbreaker",
		preview_animation = "career_select_01",
		icon = "icons_placeholder",
		talent_tree_index = 1,
		description = "bardin_1_desc",
		base_skin = "skin_dr_ironbreaker",
		picking_image = "medium_unit_frame_portrait_bardin_ironbreaker",
		preview_wield_slot = "melee",
		playfab_name = "dr_1",
		portrait_image = "unit_frame_portrait_bardin_ironbreaker",
		category_image = "category_icon_bardin_ironbreaker",
		portrait_thumbnail = "portrait_bardin_ironbreaker_thumbnail",
		sort_order = 2,
		breed = PlayerBreeds.hero_dr_ironbreaker,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.dr_1,
		passive_ability = PassiveAbilitySettings.dr_1,
		attributes = {
			movement_speed = 10,
			base_critical_strike_chance = 0.05,
			max_hp = 150,
			max_hp_kd = 300,
			attack_speed_speed = 10
		},
		video = {
			material_name = "dr_ironbreaker",
			resource = "video/career_videos/bardin/dr_ironbreaker"
		},
		preview_items = {
			{
				item_name = "dr_shield_hammer"
			},
			{
				item_name = "ironbreaker_hat_0000"
			}
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee"
			},
			slot_ranged = {
				"ranged"
			},
			slot_necklace = {
				"necklace"
			},
			slot_ring = {
				"ring"
			},
			slot_trinket_1 = {
				"trinket"
			},
			slot_hat = {
				"hat"
			},
			slot_skin = {
				"skin"
			},
			slot_frame = {
				"frame"
			}
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	dr_slayer = {
		profile_name = "dwarf_ranger",
		name = "dr_slayer",
		display_name = "dr_slayer",
		portrait_image_picking = "picking_portrait_bardin_slayer",
		package_name = "resource_packages/careers/dr_slayer",
		preview_idle_animation = "career_idle_02",
		sound_character = "dwarf_slayer",
		preview_animation = "career_select_02",
		icon = "icons_placeholder",
		talent_tree_index = 2,
		description = "bardin_2_desc",
		base_skin = "skin_dr_slayer",
		picking_image = "medium_unit_frame_portrait_bardin_slayer",
		preview_wield_slot = "melee",
		playfab_name = "dr_2",
		portrait_image = "unit_frame_portrait_bardin_slayer",
		category_image = "category_icon_bardin_slayer",
		portrait_thumbnail = "portrait_bardin_slayer_thumbnail",
		sort_order = 3,
		breed = PlayerBreeds.hero_dr_slayer,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.dr_2,
		passive_ability = PassiveAbilitySettings.dr_2,
		attributes = {
			max_hp = 125,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05,
			movement_speed = 9
		},
		video = {
			material_name = "dr_slayer",
			resource = "video/career_videos/bardin/dr_slayer"
		},
		preview_items = {
			{
				item_name = "dr_dual_wield_axes"
			},
			{
				item_name = "slayer_hat_0000"
			}
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee"
			},
			slot_ranged = {
				"melee",
				"ranged"
			},
			slot_necklace = {
				"necklace"
			},
			slot_ring = {
				"ring"
			},
			slot_trinket_1 = {
				"trinket"
			},
			slot_hat = {
				"hat"
			},
			slot_skin = {
				"skin"
			},
			slot_frame = {
				"frame"
			}
		},
		loadout_equipment_slots = {
			"melee",
			"melee",
			"necklace",
			"ring",
			"trinket"
		}
	},
	dr_ranger = {
		profile_name = "dwarf_ranger",
		name = "dr_ranger",
		display_name = "dr_ranger",
		portrait_image_picking = "picking_portrait_bardin_ranger",
		package_name = "resource_packages/careers/dr_ranger",
		preview_idle_animation = "career_idle_03",
		sound_character = "dwarf_ranger",
		preview_animation = "career_select_03",
		icon = "icons_placeholder",
		talent_tree_index = 3,
		description = "bardin_3_desc",
		base_skin = "skin_dr_ranger",
		picking_image = "medium_unit_frame_portrait_bardin_ranger",
		preview_wield_slot = "ranged",
		playfab_name = "dr_3",
		portrait_image = "unit_frame_portrait_bardin_ranger",
		category_image = "category_icon_bardin_ranger",
		portrait_thumbnail = "portrait_bardin_ranger_thumbnail",
		sort_order = 1,
		breed = PlayerBreeds.hero_dr_ranger,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.dr_3,
		passive_ability = PassiveAbilitySettings.dr_3,
		attributes = {
			max_hp = 100,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05,
			movement_speed = 8
		},
		video = {
			material_name = "dr_ranger",
			resource = "video/career_videos/bardin/dr_ranger"
		},
		preview_items = {
			{
				item_name = "dr_crossbow"
			},
			{
				item_name = "ranger_hat_0000"
			}
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee"
			},
			slot_ranged = {
				"ranged"
			},
			slot_necklace = {
				"necklace"
			},
			slot_ring = {
				"ring"
			},
			slot_trinket_1 = {
				"trinket"
			},
			slot_hat = {
				"hat"
			},
			slot_skin = {
				"skin"
			},
			slot_frame = {
				"frame"
			}
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	es_huntsman = {
		profile_name = "empire_soldier",
		name = "es_huntsman",
		display_name = "es_huntsman",
		portrait_image_picking = "picking_portrait_kruber_huntsman",
		package_name = "resource_packages/careers/es_huntsman",
		preview_idle_animation = "career_idle_03",
		sound_character = "empire_soldier_huntsman",
		preview_animation = "career_select_03",
		icon = "icons_placeholder",
		talent_tree_index = 1,
		description = "markus_1_desc",
		base_skin = "skin_es_huntsman",
		picking_image = "medium_unit_frame_portrait_kruber_huntsman",
		preview_wield_slot = "ranged",
		playfab_name = "es_1",
		portrait_image = "unit_frame_portrait_kruber_huntsman",
		category_image = "category_icon_kruber_huntsman",
		portrait_thumbnail = "portrait_kruber_huntsman_thumbnail",
		sort_order = 2,
		breed = PlayerBreeds.hero_es_huntsman,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.es_1,
		passive_ability = PassiveAbilitySettings.es_1,
		attributes = {
			max_hp = 100,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05
		},
		video = {
			material_name = "es_huntsman",
			resource = "video/career_videos/kruber/es_huntsman"
		},
		preview_items = {
			{
				item_name = "es_handgun"
			},
			{
				item_name = "huntsman_hat_0000"
			}
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee"
			},
			slot_ranged = {
				"ranged"
			},
			slot_necklace = {
				"necklace"
			},
			slot_ring = {
				"ring"
			},
			slot_trinket_1 = {
				"trinket"
			},
			slot_hat = {
				"hat"
			},
			slot_skin = {
				"skin"
			},
			slot_frame = {
				"frame"
			}
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	es_knight = {
		profile_name = "empire_soldier",
		name = "es_knight",
		display_name = "es_knight",
		portrait_image_picking = "picking_portrait_kruber_knight",
		package_name = "resource_packages/careers/es_knight",
		preview_idle_animation = "career_idle_02",
		sound_character = "empire_soldier_knight",
		preview_animation = "career_select_02",
		icon = "icons_placeholder",
		talent_tree_index = 2,
		description = "markus_2_desc",
		base_skin = "skin_es_knight",
		picking_image = "medium_unit_frame_portrait_kruber_knight",
		preview_wield_slot = "melee",
		playfab_name = "es_2",
		portrait_image = "unit_frame_portrait_kruber_knight",
		category_image = "category_icon_kruber_knight",
		portrait_thumbnail = "portrait_kruber_knight_thumbnail",
		sort_order = 3,
		breed = PlayerBreeds.hero_es_knight,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.es_2,
		passive_ability = PassiveAbilitySettings.es_2,
		attributes = {
			max_hp = 150,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05
		},
		video = {
			material_name = "es_knight",
			resource = "video/career_videos/kruber/es_knight"
		},
		preview_items = {
			{
				item_name = "es_sword_shield"
			},
			{
				item_name = "knight_hat_0000"
			}
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee"
			},
			slot_ranged = {
				"ranged"
			},
			slot_necklace = {
				"necklace"
			},
			slot_ring = {
				"ring"
			},
			slot_trinket_1 = {
				"trinket"
			},
			slot_hat = {
				"hat"
			},
			slot_skin = {
				"skin"
			},
			slot_frame = {
				"frame"
			}
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	es_mercenary = {
		profile_name = "empire_soldier",
		name = "es_mercenary",
		display_name = "es_mercenary",
		portrait_image_picking = "picking_portrait_kruber_mercenary",
		package_name = "resource_packages/careers/es_mercenary",
		preview_idle_animation = "career_idle_01",
		sound_character = "empire_soldier",
		preview_animation = "career_select_01",
		icon = "icons_placeholder",
		talent_tree_index = 3,
		description = "markus_3_desc",
		base_skin = "skin_es_mercenary",
		picking_image = "medium_unit_frame_portrait_kruber_mercenary",
		preview_wield_slot = "melee",
		playfab_name = "es_3",
		portrait_image = "unit_frame_portrait_kruber_mercenary",
		category_image = "category_icon_kruber_mercenary",
		portrait_thumbnail = "portrait_kruber_mercenary_thumbnail",
		sort_order = 1,
		breed = PlayerBreeds.hero_es_mercenary,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.es_3,
		passive_ability = PassiveAbilitySettings.es_3,
		attributes = {
			max_hp = 125,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05
		},
		video = {
			material_name = "es_mercenary",
			resource = "video/career_videos/kruber/es_mercenary"
		},
		preview_items = {
			{
				item_name = "es_halberd"
			},
			{
				item_name = "mercenary_hat_0000"
			}
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee"
			},
			slot_ranged = {
				"ranged"
			},
			slot_necklace = {
				"necklace"
			},
			slot_ring = {
				"ring"
			},
			slot_trinket_1 = {
				"trinket"
			},
			slot_hat = {
				"hat"
			},
			slot_skin = {
				"skin"
			},
			slot_frame = {
				"frame"
			}
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	we_shade = {
		profile_name = "wood_elf",
		name = "we_shade",
		display_name = "we_shade",
		portrait_image_picking = "picking_portrait_kerillian_shade",
		package_name = "resource_packages/careers/we_shade",
		preview_idle_animation = "career_idle_01",
		sound_character = "wood_elf_shade",
		preview_animation = "career_select_01",
		icon = "icons_placeholder",
		talent_tree_index = 1,
		description = "kerillian_1_desc",
		base_skin = "skin_ww_shade",
		picking_image = "medium_unit_frame_portrait_kerillian_shade",
		preview_wield_slot = "melee",
		playfab_name = "we_1",
		portrait_image = "unit_frame_portrait_kerillian_shade",
		category_image = "category_icon_kerillian_shade",
		portrait_thumbnail = "portrait_kerillian_shade_thumbnail",
		sort_order = 3,
		breed = PlayerBreeds.hero_we_shade,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.we_1,
		passive_ability = PassiveAbilitySettings.we_1,
		attributes = {
			max_hp = 100,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.1
		},
		video = {
			material_name = "we_shade",
			resource = "video/career_videos/kerillian/we_shade"
		},
		preview_items = {
			{
				item_name = "we_dual_wield_sword_dagger"
			},
			{
				item_name = "shade_hat_0000"
			}
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee"
			},
			slot_ranged = {
				"ranged"
			},
			slot_necklace = {
				"necklace"
			},
			slot_ring = {
				"ring"
			},
			slot_trinket_1 = {
				"trinket"
			},
			slot_hat = {
				"hat"
			},
			slot_skin = {
				"skin"
			},
			slot_frame = {
				"frame"
			}
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	we_maidenguard = {
		profile_name = "wood_elf",
		name = "we_maidenguard",
		display_name = "we_maidenguard",
		portrait_image_picking = "picking_portrait_kerillian_maidenguard",
		package_name = "resource_packages/careers/we_maidenguard",
		preview_idle_animation = "career_idle_03",
		sound_character = "wood_elf_handmaiden",
		preview_animation = "career_select_03",
		icon = "icons_placeholder",
		talent_tree_index = 2,
		description = "kerillian_2_desc",
		base_skin = "skin_ww_maidenguard",
		picking_image = "medium_unit_frame_portrait_kerillian_maidenguard",
		preview_wield_slot = "melee",
		playfab_name = "we_2",
		portrait_image = "unit_frame_portrait_kerillian_maidenguard",
		category_image = "category_icon_kerillian_handmaiden",
		portrait_thumbnail = "portrait_kerillian_maidenguard_thumbnail",
		sort_order = 2,
		breed = PlayerBreeds.hero_we_maidenguard,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.we_2,
		passive_ability = PassiveAbilitySettings.we_2,
		attributes = {
			max_hp = 125,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05
		},
		video = {
			material_name = "we_maidenguard",
			resource = "video/career_videos/kerillian/we_maidenguard"
		},
		preview_items = {
			{
				item_name = "we_spear"
			},
			{
				item_name = "maidenguard_hat_0000"
			}
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee"
			},
			slot_ranged = {
				"ranged"
			},
			slot_necklace = {
				"necklace"
			},
			slot_ring = {
				"ring"
			},
			slot_trinket_1 = {
				"trinket"
			},
			slot_hat = {
				"hat"
			},
			slot_skin = {
				"skin"
			},
			slot_frame = {
				"frame"
			}
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	we_waywatcher = {
		profile_name = "wood_elf",
		name = "we_waywatcher",
		display_name = "we_waywatcher",
		portrait_image_picking = "picking_portrait_kerillian_waywatcher",
		package_name = "resource_packages/careers/we_waywatcher",
		preview_idle_animation = "career_idle_02",
		sound_character = "wood_elf",
		preview_animation = "career_select_02",
		icon = "icons_placeholder",
		talent_tree_index = 3,
		description = "kerillian_3_desc",
		base_skin = "skin_ww_waywatcher",
		picking_image = "medium_unit_frame_portrait_kerillian_waywatcher",
		preview_wield_slot = "ranged",
		playfab_name = "we_3",
		portrait_image = "unit_frame_portrait_kerillian_waywatcher",
		category_image = "category_icon_kerillian_waystalker",
		portrait_thumbnail = "portrait_kerillian_waywatcher_thumbnail",
		sort_order = 1,
		breed = PlayerBreeds.hero_we_waywatcher,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.we_3,
		passive_ability = PassiveAbilitySettings.we_3,
		attributes = {
			max_hp = 100,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05
		},
		video = {
			material_name = "we_waywatcher",
			resource = "video/career_videos/kerillian/we_waywatcher"
		},
		preview_items = {
			{
				item_name = "we_longbow"
			},
			{
				item_name = "waywatcher_hat_0000"
			}
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		talent_packages = function (talent_ids, packages_list, is_first_person)
			local weapon_name = ActivatedAbilitySettings.we_3[1].weapon_name
			local weapon = ItemMasterList[weapon_name]

			if weapon and weapon.slot_to_use then
				local item = BackendUtils.get_loadout_item("we_waywatcher", weapon.slot_to_use)
				local item_data = item and rawget(ItemMasterList, item.key)
				local item_template_name = item_data and item_data.template

				if not item_template_name or not weapon.valid_templates_to_replace[item_template_name] then
					local default_item_name = weapon.default_item_to_replace
					local default_item_data = ItemMasterList[default_item_name]
					local weapon_template = Weapons[weapon.template]
					local default_items = BackendUtils.get_item_units(default_item_data)
					local weapon_packages = WeaponUtils.get_weapon_packages(weapon_template, default_items, is_first_person)

					for j = 1, #weapon_packages, 1 do
						local package_name = weapon_packages[j]
						packages_list[package_name] = false
					end
				end
			end
		end,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee"
			},
			slot_ranged = {
				"ranged"
			},
			slot_necklace = {
				"necklace"
			},
			slot_ring = {
				"ring"
			},
			slot_trinket_1 = {
				"trinket"
			},
			slot_hat = {
				"hat"
			},
			slot_skin = {
				"skin"
			},
			slot_frame = {
				"frame"
			}
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	wh_zealot = {
		profile_name = "witch_hunter",
		name = "wh_zealot",
		display_name = "wh_zealot",
		portrait_image_picking = "picking_portrait_victor_zealot",
		package_name = "resource_packages/careers/wh_zealot",
		preview_idle_animation = "career_idle_03",
		sound_character = "witch_hunter_zealot",
		preview_animation = "career_select_03",
		icon = "icons_placeholder",
		talent_tree_index = 1,
		description = "victor_1_desc",
		base_skin = "skin_wh_zealot",
		picking_image = "medium_unit_frame_portrait_victor_zealot",
		preview_wield_slot = "melee",
		playfab_name = "wh_1",
		portrait_image = "unit_frame_portrait_victor_zealot",
		category_image = "category_icon_victor_zealot",
		portrait_thumbnail = "portrait_victor_zealot_thumbnail",
		sort_order = 3,
		breed = PlayerBreeds.hero_wh_zealot,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.wh_1,
		passive_ability = PassiveAbilitySettings.wh_1,
		attributes = {
			max_hp = 150,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05
		},
		video = {
			material_name = "wh_zealot",
			resource = "video/career_videos/victor/wh_zealot"
		},
		preview_items = {
			{
				item_name = "es_1h_flail"
			},
			{
				item_name = "zealot_hat_0000"
			}
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee"
			},
			slot_ranged = {
				"ranged"
			},
			slot_necklace = {
				"necklace"
			},
			slot_ring = {
				"ring"
			},
			slot_trinket_1 = {
				"trinket"
			},
			slot_hat = {
				"hat"
			},
			slot_skin = {
				"skin"
			},
			slot_frame = {
				"frame"
			}
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	wh_bountyhunter = {
		profile_name = "witch_hunter",
		name = "wh_bountyhunter",
		display_name = "wh_bountyhunter",
		portrait_image_picking = "picking_portrait_victor_bounty_hunter",
		package_name = "resource_packages/careers/wh_bountyhunter",
		preview_idle_animation = "career_idle_02",
		sound_character = "witch_hunter_bounty_hunter",
		preview_animation = "career_select_02",
		icon = "icons_placeholder",
		talent_tree_index = 2,
		description = "victor_2_desc",
		base_skin = "skin_wh_bountyhunter",
		picking_image = "medium_unit_frame_portrait_victor_bountyhunter",
		preview_wield_slot = "ranged",
		playfab_name = "wh_2",
		portrait_image = "unit_frame_portrait_victor_bountyhunter",
		category_image = "category_icon_victor_bountyhunter",
		portrait_thumbnail = "portrait_victor_bounty_hunter_thumbnail",
		sort_order = 2,
		breed = PlayerBreeds.hero_wh_bountyhunter,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.wh_2,
		passive_ability = PassiveAbilitySettings.wh_2,
		attributes = {
			max_hp = 100,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05
		},
		video = {
			material_name = "wh_bountyhunter",
			resource = "video/career_videos/victor/wh_bountyhunter"
		},
		preview_items = {
			{
				item_name = "wh_repeating_pistols"
			},
			{
				item_name = "bountyhunter_hat_0000"
			}
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee"
			},
			slot_ranged = {
				"ranged"
			},
			slot_necklace = {
				"necklace"
			},
			slot_ring = {
				"ring"
			},
			slot_trinket_1 = {
				"trinket"
			},
			slot_hat = {
				"hat"
			},
			slot_skin = {
				"skin"
			},
			slot_frame = {
				"frame"
			}
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	wh_captain = {
		profile_name = "witch_hunter",
		name = "wh_captain",
		display_name = "wh_captain",
		portrait_image_picking = "picking_portrait_victor_captain",
		package_name = "resource_packages/careers/wh_captain",
		preview_idle_animation = "career_idle_01",
		sound_character = "witch_hunter",
		preview_animation = "career_select_01",
		icon = "icons_placeholder",
		talent_tree_index = 3,
		description = "victor_3_desc",
		base_skin = "skin_wh_captain",
		picking_image = "medium_unit_frame_portrait_victor_captain",
		preview_wield_slot = "melee",
		playfab_name = "wh_3",
		portrait_image = "unit_frame_portrait_victor_captain",
		category_image = "category_icon_victor_captain",
		portrait_thumbnail = "portrait_victor_captain_thumbnail",
		sort_order = 1,
		breed = PlayerBreeds.hero_wh_captain,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.wh_3,
		passive_ability = PassiveAbilitySettings.wh_3,
		attributes = {
			max_hp = 125,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.1
		},
		video = {
			material_name = "wh_captain",
			resource = "video/career_videos/victor/wh_captain"
		},
		preview_items = {
			{
				item_name = "wh_fencing_sword"
			},
			{
				item_name = "witchhunter_hat_0000"
			}
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee"
			},
			slot_ranged = {
				"ranged"
			},
			slot_necklace = {
				"necklace"
			},
			slot_ring = {
				"ring"
			},
			slot_trinket_1 = {
				"trinket"
			},
			slot_hat = {
				"hat"
			},
			slot_skin = {
				"skin"
			},
			slot_frame = {
				"frame"
			}
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	bw_scholar = {
		profile_name = "bright_wizard",
		name = "bw_scholar",
		display_name = "bw_scholar",
		portrait_image_picking = "picking_portrait_sienna_scholar",
		package_name = "resource_packages/careers/bw_scholar",
		preview_idle_animation = "career_idle_03",
		sound_character = "bright_wizard",
		preview_animation = "career_select_03",
		icon = "icons_placeholder",
		talent_tree_index = 1,
		description = "sienna_1_desc",
		base_skin = "skin_bw_scholar",
		picking_image = "medium_unit_frame_portrait_sienna_scholar",
		preview_wield_slot = "ranged",
		playfab_name = "bw_1",
		portrait_image = "unit_frame_portrait_sienna_scholar",
		category_image = "category_icon_sienna_scholar",
		portrait_thumbnail = "portrait_sienna_scholar_thumbnail",
		sort_order = 2,
		breed = PlayerBreeds.hero_bw_scholar,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.bw_1,
		passive_ability = PassiveAbilitySettings.bw_1,
		attributes = {
			max_hp = 100,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05
		},
		video = {
			material_name = "bw_scholar",
			resource = "video/career_videos/sienna/bw_scholar"
		},
		preview_items = {
			{
				item_name = "bw_skullstaff_spear"
			},
			{
				item_name = "scholar_hat_0000"
			}
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee"
			},
			slot_ranged = {
				"ranged"
			},
			slot_necklace = {
				"necklace"
			},
			slot_ring = {
				"ring"
			},
			slot_trinket_1 = {
				"trinket"
			},
			slot_hat = {
				"hat"
			},
			slot_skin = {
				"skin"
			},
			slot_frame = {
				"frame"
			}
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	bw_adept = {
		profile_name = "bright_wizard",
		name = "bw_adept",
		display_name = "bw_adept",
		portrait_image_picking = "picking_portrait_sienna_adept",
		package_name = "resource_packages/careers/bw_adept",
		preview_idle_animation = "career_idle_02",
		sound_character = "bright_wizard_battle_wizard",
		preview_animation = "career_select_02",
		icon = "icons_placeholder",
		talent_tree_index = 2,
		description = "sienna_2_desc",
		base_skin = "skin_bw_adept",
		picking_image = "medium_unit_frame_portrait_sienna_adept",
		preview_wield_slot = "ranged",
		playfab_name = "bw_2",
		portrait_image = "unit_frame_portrait_sienna_adept",
		category_image = "category_icon_sienna_adept",
		portrait_thumbnail = "portrait_sienna_adept_thumbnail",
		sort_order = 1,
		breed = PlayerBreeds.hero_bw_adept,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.bw_2,
		passive_ability = PassiveAbilitySettings.bw_2,
		attributes = {
			max_hp = 100,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05
		},
		video = {
			material_name = "bw_adept",
			resource = "video/career_videos/sienna/bw_adept"
		},
		preview_items = {
			{
				item_name = "bw_skullstaff_fireball"
			},
			{
				item_name = "adept_hat_0000"
			}
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee"
			},
			slot_ranged = {
				"ranged"
			},
			slot_necklace = {
				"necklace"
			},
			slot_ring = {
				"ring"
			},
			slot_trinket_1 = {
				"trinket"
			},
			slot_hat = {
				"hat"
			},
			slot_skin = {
				"skin"
			},
			slot_frame = {
				"frame"
			}
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	bw_unchained = {
		profile_name = "bright_wizard",
		name = "bw_unchained",
		display_name = "bw_unchained",
		portrait_image_picking = "picking_portrait_sienna_unchained",
		package_name = "resource_packages/careers/bw_unchained",
		preview_idle_animation = "career_idle_01",
		sound_character = "bright_wizard_unchained",
		preview_animation = "career_select_01",
		icon = "icons_placeholder",
		talent_tree_index = 3,
		description = "sienna_3_desc",
		base_skin = "skin_bw_unchained",
		picking_image = "medium_unit_frame_portrait_sienna_unchained",
		preview_wield_slot = "melee",
		playfab_name = "bw_3",
		portrait_image = "unit_frame_portrait_sienna_unchained",
		category_image = "category_icon_sienna_unchained",
		portrait_thumbnail = "portrait_sienna_unchained_thumbnail",
		sort_order = 3,
		breed = PlayerBreeds.hero_bw_unchained,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.bw_3,
		passive_ability = PassiveAbilitySettings.bw_3,
		attributes = {
			max_hp = 150,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05
		},
		video = {
			material_name = "bw_unchained",
			resource = "video/career_videos/sienna/bw_unchained"
		},
		preview_items = {
			{
				item_name = "bw_flame_sword"
			},
			{
				item_name = "unchained_hat_0000"
			}
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee"
			},
			slot_ranged = {
				"ranged"
			},
			slot_necklace = {
				"necklace"
			},
			slot_ring = {
				"ring"
			},
			slot_trinket_1 = {
				"trinket"
			},
			slot_hat = {
				"hat"
			},
			slot_skin = {
				"skin"
			},
			slot_frame = {
				"frame"
			}
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	},
	empire_soldier_tutorial = {
		profile_name = "empire_soldier",
		display_name = "empire_soldier",
		name = "empire_soldier_tutorial",
		package_name = "resource_packages/careers/es_knight",
		sound_character = "empire_soldier_knight",
		preview_idle_animation = "career_idle_02",
		preview_animation = "career_select_02",
		icon = "icons_placeholder",
		description = "markus_2_desc",
		base_skin = "skin_es_knight",
		picking_image = "medium_unit_frame_portrait_kruber_knight",
		preview_wield_slot = "melee",
		portrait_image = "unit_frame_portrait_kruber_knight",
		category_image = "category_icon_kruber_knight",
		portrait_thumbnail = "portrait_kruber_knight_thumbnail",
		sort_order = 1,
		breed = PlayerBreeds.hero_es_mercenary,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.es_2,
		passive_ability = PassiveAbilitySettings.es_2,
		attributes = {
			max_hp = 150,
			max_hp_kd = 300,
			base_critical_strike_chance = 0.05
		},
		video = {
			material_name = "es_knight",
			resource = "video/career_videos/kruber/es_knight"
		},
		preview_items = {
			{
				item_name = "es_sword_shield"
			},
			{
				item_name = "knight_hat_0000"
			}
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee"
			},
			slot_ranged = {
				"ranged"
			},
			slot_necklace = {
				"necklace"
			},
			slot_ring = {
				"ring"
			},
			slot_trinket_1 = {
				"trinket"
			},
			slot_hat = {
				"hat"
			},
			slot_skin = {
				"skin"
			},
			slot_frame = {
				"frame"
			}
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket"
		}
	}
}
CareerNameAchievementMapping = {
	dr_ranger = "ranger",
	es_knight = "knight",
	we_waywatcher = "waywatcher",
	es_mercenary = "mercenary",
	we_maidenguard = "maidenguard",
	dr_slayer = "slayer",
	wh_captain = "witchhunter",
	bw_adept = "adept",
	wh_zealot = "zealot",
	es_huntsman = "huntsman",
	dr_ironbreaker = "ironbreaker",
	we_shade = "shade",
	bw_unchained = "unchained",
	bw_scholar = "scholar",
	wh_bountyhunter = "bountyhunter"
}

DLCUtils.require_list("career_setting_files")

if script_data.honduras_demo then
	CareerSettings.we_shade.preview_items = {
		{
			item_name = "we_spear"
		},
		{
			item_name = "shade_hat_0000"
		}
	}
	CareerSettings.we_shade.preview_animation = "career_select_03"
	CareerSettings.es_knight.preview_items = {
		{
			item_name = "es_2h_hammer"
		},
		{
			item_name = "knight_hat_0000"
		}
	}
	CareerSettings.es_knight.preview_animation = nil
end

return
