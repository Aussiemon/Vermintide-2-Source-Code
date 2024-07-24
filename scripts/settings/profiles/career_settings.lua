-- chunkname: @scripts/settings/profiles/career_settings.lua

require("scripts/unit_extensions/default_player_unit/careers/career_ability_settings")
require("scripts/settings/breeds/breed_players")

CareerActionNames = {
	bright_wizard = {
		"action_career_bw_1",
	},
	dwarf_ranger = {
		"action_career_dr_3",
	},
	empire_soldier = {},
	witch_hunter = {
		"action_career_wh_2",
	},
	wood_elf = {
		"action_career_we_3",
		"action_career_we_3_piercing",
	},
}

local function local_is_unlocked_function(career, hero_name, hero_level)
	local unlocked, reason = career:override_available_for_mechanism()

	if not unlocked then
		return unlocked, reason
	end

	local dlc_name

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
	local settings = Managers.mechanism:mechanism_setting_for_title("override_career_availability")
	local career_name = career.display_name

	if settings and settings[career_name] == false then
		return false, "disabled_for_mechanism"
	end

	return true
end

CareerSettings = {
	dr_ironbreaker = {
		base_skin = "skin_dr_ironbreaker",
		category_image = "category_icon_bardin_ironbreaker",
		description = "bardin_1_desc",
		display_name = "dr_ironbreaker",
		icon = "icons_placeholder",
		name = "dr_ironbreaker",
		package_name = "resource_packages/careers/dr_ironbreaker",
		picking_image = "medium_unit_frame_portrait_bardin_ironbreaker",
		playfab_name = "dr_1",
		portrait_image = "unit_frame_portrait_bardin_ironbreaker",
		portrait_image_picking = "picking_portrait_bardin_ironbreaker",
		portrait_thumbnail = "portrait_bardin_ironbreaker_thumbnail",
		preview_animation = "career_select_01",
		preview_idle_animation = "career_idle_01",
		preview_wield_slot = "melee",
		profile_name = "dwarf_ranger",
		sort_order = 2,
		sound_character = "dwarf_ironbreaker",
		talent_tree_index = 1,
		breed = PlayerBreeds.hero_dr_ironbreaker,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.dr_1,
		passive_ability = PassiveAbilitySettings.dr_1,
		attributes = {
			attack_speed_speed = 10,
			base_critical_strike_chance = 0.05,
			max_hp = 150,
			movement_speed = 10,
		},
		video = {
			material_name = "dr_ironbreaker",
			resource = "video/career_videos/bardin/dr_ironbreaker",
		},
		preview_items = {
			{
				item_name = "dr_shield_hammer",
			},
			{
				item_name = "ironbreaker_hat_0000",
			},
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee",
			},
			slot_ranged = {
				"ranged",
			},
			slot_necklace = {
				"necklace",
			},
			slot_ring = {
				"ring",
			},
			slot_trinket_1 = {
				"trinket",
			},
			slot_hat = {
				"hat",
			},
			slot_skin = {
				"skin",
			},
			slot_frame = {
				"frame",
			},
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket",
		},
	},
	dr_slayer = {
		base_skin = "skin_dr_slayer",
		category_image = "category_icon_bardin_slayer",
		description = "bardin_2_desc",
		display_name = "dr_slayer",
		icon = "icons_placeholder",
		name = "dr_slayer",
		package_name = "resource_packages/careers/dr_slayer",
		picking_image = "medium_unit_frame_portrait_bardin_slayer",
		playfab_name = "dr_2",
		portrait_image = "unit_frame_portrait_bardin_slayer",
		portrait_image_picking = "picking_portrait_bardin_slayer",
		portrait_thumbnail = "portrait_bardin_slayer_thumbnail",
		preview_animation = "career_select_02",
		preview_idle_animation = "career_idle_02",
		preview_wield_slot = "melee",
		profile_name = "dwarf_ranger",
		sort_order = 3,
		sound_character = "dwarf_slayer",
		talent_tree_index = 2,
		breed = PlayerBreeds.hero_dr_slayer,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.dr_2,
		passive_ability = PassiveAbilitySettings.dr_2,
		attributes = {
			base_critical_strike_chance = 0.05,
			max_hp = 125,
			movement_speed = 9,
		},
		video = {
			material_name = "dr_slayer",
			resource = "video/career_videos/bardin/dr_slayer",
		},
		preview_items = {
			{
				item_name = "dr_dual_wield_axes",
			},
			{
				item_name = "slayer_hat_0000",
			},
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee",
			},
			slot_ranged = {
				"melee",
				"ranged",
			},
			slot_necklace = {
				"necklace",
			},
			slot_ring = {
				"ring",
			},
			slot_trinket_1 = {
				"trinket",
			},
			slot_hat = {
				"hat",
			},
			slot_skin = {
				"skin",
			},
			slot_frame = {
				"frame",
			},
		},
		loadout_equipment_slots = {
			"melee",
			"melee",
			"necklace",
			"ring",
			"trinket",
		},
	},
	dr_ranger = {
		base_skin = "skin_dr_ranger",
		category_image = "category_icon_bardin_ranger",
		description = "bardin_3_desc",
		display_name = "dr_ranger",
		icon = "icons_placeholder",
		name = "dr_ranger",
		package_name = "resource_packages/careers/dr_ranger",
		picking_image = "medium_unit_frame_portrait_bardin_ranger",
		playfab_name = "dr_3",
		portrait_image = "unit_frame_portrait_bardin_ranger",
		portrait_image_picking = "picking_portrait_bardin_ranger",
		portrait_thumbnail = "portrait_bardin_ranger_thumbnail",
		preview_animation = "career_select_03",
		preview_idle_animation = "career_idle_03",
		preview_wield_slot = "ranged",
		profile_name = "dwarf_ranger",
		sort_order = 1,
		sound_character = "dwarf_ranger",
		talent_tree_index = 3,
		breed = PlayerBreeds.hero_dr_ranger,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.dr_3,
		passive_ability = PassiveAbilitySettings.dr_3,
		attributes = {
			base_critical_strike_chance = 0.05,
			max_hp = 100,
			movement_speed = 8,
		},
		video = {
			material_name = "dr_ranger",
			resource = "video/career_videos/bardin/dr_ranger",
		},
		preview_items = {
			{
				item_name = "dr_crossbow",
			},
			{
				item_name = "ranger_hat_0000",
			},
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee",
			},
			slot_ranged = {
				"ranged",
			},
			slot_necklace = {
				"necklace",
			},
			slot_ring = {
				"ring",
			},
			slot_trinket_1 = {
				"trinket",
			},
			slot_hat = {
				"hat",
			},
			slot_skin = {
				"skin",
			},
			slot_frame = {
				"frame",
			},
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket",
		},
	},
	es_huntsman = {
		base_skin = "skin_es_huntsman",
		category_image = "category_icon_kruber_huntsman",
		description = "markus_1_desc",
		display_name = "es_huntsman",
		icon = "icons_placeholder",
		name = "es_huntsman",
		package_name = "resource_packages/careers/es_huntsman",
		picking_image = "medium_unit_frame_portrait_kruber_huntsman",
		playfab_name = "es_1",
		portrait_image = "unit_frame_portrait_kruber_huntsman",
		portrait_image_picking = "picking_portrait_kruber_huntsman",
		portrait_thumbnail = "portrait_kruber_huntsman_thumbnail",
		preview_animation = "career_select_03",
		preview_idle_animation = "career_idle_03",
		preview_wield_slot = "ranged",
		profile_name = "empire_soldier",
		sort_order = 2,
		sound_character = "empire_soldier_huntsman",
		talent_tree_index = 1,
		breed = PlayerBreeds.hero_es_huntsman,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.es_1,
		passive_ability = PassiveAbilitySettings.es_1,
		attributes = {
			base_critical_strike_chance = 0.05,
			max_hp = 100,
		},
		video = {
			material_name = "es_huntsman",
			resource = "video/career_videos/kruber/es_huntsman",
		},
		preview_items = {
			{
				item_name = "es_handgun",
			},
			{
				item_name = "huntsman_hat_0000",
			},
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee",
			},
			slot_ranged = {
				"ranged",
			},
			slot_necklace = {
				"necklace",
			},
			slot_ring = {
				"ring",
			},
			slot_trinket_1 = {
				"trinket",
			},
			slot_hat = {
				"hat",
			},
			slot_skin = {
				"skin",
			},
			slot_frame = {
				"frame",
			},
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket",
		},
	},
	es_knight = {
		base_skin = "skin_es_knight",
		category_image = "category_icon_kruber_knight",
		description = "markus_2_desc",
		display_name = "es_knight",
		icon = "icons_placeholder",
		name = "es_knight",
		package_name = "resource_packages/careers/es_knight",
		picking_image = "medium_unit_frame_portrait_kruber_knight",
		playfab_name = "es_2",
		portrait_image = "unit_frame_portrait_kruber_knight",
		portrait_image_picking = "picking_portrait_kruber_knight",
		portrait_thumbnail = "portrait_kruber_knight_thumbnail",
		preview_animation = "career_select_02",
		preview_idle_animation = "career_idle_02",
		preview_wield_slot = "melee",
		profile_name = "empire_soldier",
		sort_order = 3,
		sound_character = "empire_soldier_knight",
		talent_tree_index = 2,
		breed = PlayerBreeds.hero_es_knight,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.es_2,
		passive_ability = PassiveAbilitySettings.es_2,
		attributes = {
			base_critical_strike_chance = 0.05,
			max_hp = 150,
		},
		video = {
			material_name = "es_knight",
			resource = "video/career_videos/kruber/es_knight",
		},
		preview_items = {
			{
				item_name = "es_sword_shield",
			},
			{
				item_name = "knight_hat_0000",
			},
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee",
			},
			slot_ranged = {
				"ranged",
			},
			slot_necklace = {
				"necklace",
			},
			slot_ring = {
				"ring",
			},
			slot_trinket_1 = {
				"trinket",
			},
			slot_hat = {
				"hat",
			},
			slot_skin = {
				"skin",
			},
			slot_frame = {
				"frame",
			},
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket",
		},
	},
	es_mercenary = {
		base_skin = "skin_es_mercenary",
		category_image = "category_icon_kruber_mercenary",
		description = "markus_3_desc",
		display_name = "es_mercenary",
		icon = "icons_placeholder",
		name = "es_mercenary",
		package_name = "resource_packages/careers/es_mercenary",
		picking_image = "medium_unit_frame_portrait_kruber_mercenary",
		playfab_name = "es_3",
		portrait_image = "unit_frame_portrait_kruber_mercenary",
		portrait_image_picking = "picking_portrait_kruber_mercenary",
		portrait_thumbnail = "portrait_kruber_mercenary_thumbnail",
		preview_animation = "career_select_01",
		preview_idle_animation = "career_idle_01",
		preview_wield_slot = "melee",
		profile_name = "empire_soldier",
		sort_order = 1,
		sound_character = "empire_soldier",
		talent_tree_index = 3,
		breed = PlayerBreeds.hero_es_mercenary,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.es_3,
		passive_ability = PassiveAbilitySettings.es_3,
		attributes = {
			base_critical_strike_chance = 0.05,
			max_hp = 125,
		},
		video = {
			material_name = "es_mercenary",
			resource = "video/career_videos/kruber/es_mercenary",
		},
		preview_items = {
			{
				item_name = "es_halberd",
			},
			{
				item_name = "mercenary_hat_0000",
			},
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee",
			},
			slot_ranged = {
				"ranged",
			},
			slot_necklace = {
				"necklace",
			},
			slot_ring = {
				"ring",
			},
			slot_trinket_1 = {
				"trinket",
			},
			slot_hat = {
				"hat",
			},
			slot_skin = {
				"skin",
			},
			slot_frame = {
				"frame",
			},
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket",
		},
	},
	we_shade = {
		base_skin = "skin_ww_shade",
		category_image = "category_icon_kerillian_shade",
		description = "kerillian_1_desc",
		display_name = "we_shade",
		icon = "icons_placeholder",
		name = "we_shade",
		package_name = "resource_packages/careers/we_shade",
		picking_image = "medium_unit_frame_portrait_kerillian_shade",
		playfab_name = "we_1",
		portrait_image = "unit_frame_portrait_kerillian_shade",
		portrait_image_picking = "picking_portrait_kerillian_shade",
		portrait_thumbnail = "portrait_kerillian_shade_thumbnail",
		preview_animation = "career_select_01",
		preview_idle_animation = "career_idle_01",
		preview_wield_slot = "melee",
		profile_name = "wood_elf",
		sort_order = 3,
		sound_character = "wood_elf_shade",
		talent_tree_index = 1,
		breed = PlayerBreeds.hero_we_shade,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.we_1,
		passive_ability = PassiveAbilitySettings.we_1,
		attributes = {
			base_critical_strike_chance = 0.1,
			max_hp = 100,
		},
		video = {
			material_name = "we_shade",
			resource = "video/career_videos/kerillian/we_shade",
		},
		preview_items = {
			{
				item_name = "we_dual_wield_sword_dagger",
			},
			{
				item_name = "shade_hat_0000",
			},
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee",
			},
			slot_ranged = {
				"ranged",
			},
			slot_necklace = {
				"necklace",
			},
			slot_ring = {
				"ring",
			},
			slot_trinket_1 = {
				"trinket",
			},
			slot_hat = {
				"hat",
			},
			slot_skin = {
				"skin",
			},
			slot_frame = {
				"frame",
			},
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket",
		},
	},
	we_maidenguard = {
		base_skin = "skin_ww_maidenguard",
		category_image = "category_icon_kerillian_handmaiden",
		description = "kerillian_2_desc",
		display_name = "we_maidenguard",
		icon = "icons_placeholder",
		name = "we_maidenguard",
		package_name = "resource_packages/careers/we_maidenguard",
		picking_image = "medium_unit_frame_portrait_kerillian_maidenguard",
		playfab_name = "we_2",
		portrait_image = "unit_frame_portrait_kerillian_maidenguard",
		portrait_image_picking = "picking_portrait_kerillian_maidenguard",
		portrait_thumbnail = "portrait_kerillian_maidenguard_thumbnail",
		preview_animation = "career_select_03",
		preview_idle_animation = "career_idle_03",
		preview_wield_slot = "melee",
		profile_name = "wood_elf",
		sort_order = 2,
		sound_character = "wood_elf_handmaiden",
		talent_tree_index = 2,
		breed = PlayerBreeds.hero_we_maidenguard,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.we_2,
		passive_ability = PassiveAbilitySettings.we_2,
		attributes = {
			base_critical_strike_chance = 0.05,
			max_hp = 125,
		},
		video = {
			material_name = "we_maidenguard",
			resource = "video/career_videos/kerillian/we_maidenguard",
		},
		preview_items = {
			{
				item_name = "we_spear",
			},
			{
				item_name = "maidenguard_hat_0000",
			},
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee",
			},
			slot_ranged = {
				"ranged",
			},
			slot_necklace = {
				"necklace",
			},
			slot_ring = {
				"ring",
			},
			slot_trinket_1 = {
				"trinket",
			},
			slot_hat = {
				"hat",
			},
			slot_skin = {
				"skin",
			},
			slot_frame = {
				"frame",
			},
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket",
		},
	},
	we_waywatcher = {
		base_skin = "skin_ww_waywatcher",
		category_image = "category_icon_kerillian_waystalker",
		description = "kerillian_3_desc",
		display_name = "we_waywatcher",
		icon = "icons_placeholder",
		name = "we_waywatcher",
		package_name = "resource_packages/careers/we_waywatcher",
		picking_image = "medium_unit_frame_portrait_kerillian_waywatcher",
		playfab_name = "we_3",
		portrait_image = "unit_frame_portrait_kerillian_waywatcher",
		portrait_image_picking = "picking_portrait_kerillian_waywatcher",
		portrait_thumbnail = "portrait_kerillian_waywatcher_thumbnail",
		preview_animation = "career_select_02",
		preview_idle_animation = "career_idle_02",
		preview_wield_slot = "ranged",
		profile_name = "wood_elf",
		sort_order = 1,
		sound_character = "wood_elf",
		talent_tree_index = 3,
		breed = PlayerBreeds.hero_we_waywatcher,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.we_3,
		passive_ability = PassiveAbilitySettings.we_3,
		attributes = {
			base_critical_strike_chance = 0.05,
			max_hp = 100,
		},
		video = {
			material_name = "we_waywatcher",
			resource = "video/career_videos/kerillian/we_waywatcher",
		},
		preview_items = {
			{
				item_name = "we_longbow",
			},
			{
				item_name = "waywatcher_hat_0000",
			},
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		talent_packages = function (talent_ids, packages_list, is_first_person, is_bot)
			local weapon_name = ActivatedAbilitySettings.we_3[1].weapon_name
			local weapon = ItemMasterList[weapon_name]

			if weapon and weapon.slot_to_use then
				local item = BackendUtils.get_loadout_item("we_waywatcher", weapon.slot_to_use, is_bot)
				local item_data = item and rawget(ItemMasterList, item.key)
				local item_template_name = item_data and item_data.template

				if not item_template_name or not weapon.valid_templates_to_replace[item_template_name] then
					local default_item_name = weapon.default_item_to_replace
					local default_item_data = ItemMasterList[default_item_name]
					local weapon_template = Weapons[weapon.template]
					local default_items = BackendUtils.get_item_units(default_item_data)
					local weapon_packages = WeaponUtils.get_weapon_packages(weapon_template, default_items, is_first_person)

					for j = 1, #weapon_packages do
						local package_name = weapon_packages[j]

						packages_list[package_name] = false
					end
				end
			end
		end,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee",
			},
			slot_ranged = {
				"ranged",
			},
			slot_necklace = {
				"necklace",
			},
			slot_ring = {
				"ring",
			},
			slot_trinket_1 = {
				"trinket",
			},
			slot_hat = {
				"hat",
			},
			slot_skin = {
				"skin",
			},
			slot_frame = {
				"frame",
			},
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket",
		},
	},
	wh_zealot = {
		base_skin = "skin_wh_zealot",
		category_image = "category_icon_victor_zealot",
		description = "victor_1_desc",
		display_name = "wh_zealot",
		icon = "icons_placeholder",
		name = "wh_zealot",
		package_name = "resource_packages/careers/wh_zealot",
		picking_image = "medium_unit_frame_portrait_victor_zealot",
		playfab_name = "wh_1",
		portrait_image = "unit_frame_portrait_victor_zealot",
		portrait_image_picking = "picking_portrait_victor_zealot",
		portrait_thumbnail = "portrait_victor_zealot_thumbnail",
		preview_animation = "career_select_03",
		preview_idle_animation = "career_idle_03",
		preview_wield_slot = "melee",
		profile_name = "witch_hunter",
		sort_order = 3,
		sound_character = "witch_hunter_zealot",
		talent_tree_index = 1,
		breed = PlayerBreeds.hero_wh_zealot,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.wh_1,
		passive_ability = PassiveAbilitySettings.wh_1,
		attributes = {
			base_critical_strike_chance = 0.05,
			max_hp = 150,
		},
		video = {
			material_name = "wh_zealot",
			resource = "video/career_videos/victor/wh_zealot",
		},
		preview_items = {
			{
				item_name = "es_1h_flail",
			},
			{
				item_name = "zealot_hat_0000",
			},
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		animation_variables = {
			is_zealot = 1,
		},
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee",
			},
			slot_ranged = {
				"ranged",
			},
			slot_necklace = {
				"necklace",
			},
			slot_ring = {
				"ring",
			},
			slot_trinket_1 = {
				"trinket",
			},
			slot_hat = {
				"hat",
			},
			slot_skin = {
				"skin",
			},
			slot_frame = {
				"frame",
			},
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket",
		},
	},
	wh_bountyhunter = {
		base_skin = "skin_wh_bountyhunter",
		category_image = "category_icon_victor_bountyhunter",
		description = "victor_2_desc",
		display_name = "wh_bountyhunter",
		icon = "icons_placeholder",
		name = "wh_bountyhunter",
		package_name = "resource_packages/careers/wh_bountyhunter",
		picking_image = "medium_unit_frame_portrait_victor_bountyhunter",
		playfab_name = "wh_2",
		portrait_image = "unit_frame_portrait_victor_bountyhunter",
		portrait_image_picking = "picking_portrait_victor_bounty_hunter",
		portrait_thumbnail = "portrait_victor_bounty_hunter_thumbnail",
		preview_animation = "career_select_02",
		preview_idle_animation = "career_idle_02",
		preview_wield_slot = "ranged",
		profile_name = "witch_hunter",
		sort_order = 2,
		sound_character = "witch_hunter_bounty_hunter",
		talent_tree_index = 2,
		breed = PlayerBreeds.hero_wh_bountyhunter,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.wh_2,
		passive_ability = PassiveAbilitySettings.wh_2,
		attributes = {
			base_critical_strike_chance = 0.05,
			max_hp = 100,
		},
		video = {
			material_name = "wh_bountyhunter",
			resource = "video/career_videos/victor/wh_bountyhunter",
		},
		preview_items = {
			{
				item_name = "wh_repeating_pistols",
			},
			{
				item_name = "bountyhunter_hat_0000",
			},
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee",
			},
			slot_ranged = {
				"ranged",
			},
			slot_necklace = {
				"necklace",
			},
			slot_ring = {
				"ring",
			},
			slot_trinket_1 = {
				"trinket",
			},
			slot_hat = {
				"hat",
			},
			slot_skin = {
				"skin",
			},
			slot_frame = {
				"frame",
			},
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket",
		},
	},
	wh_captain = {
		base_skin = "skin_wh_captain",
		category_image = "category_icon_victor_captain",
		description = "victor_3_desc",
		display_name = "wh_captain",
		icon = "icons_placeholder",
		name = "wh_captain",
		package_name = "resource_packages/careers/wh_captain",
		picking_image = "medium_unit_frame_portrait_victor_captain",
		playfab_name = "wh_3",
		portrait_image = "unit_frame_portrait_victor_captain",
		portrait_image_picking = "picking_portrait_victor_captain",
		portrait_thumbnail = "portrait_victor_captain_thumbnail",
		preview_animation = "career_select_01",
		preview_idle_animation = "career_idle_01",
		preview_wield_slot = "melee",
		profile_name = "witch_hunter",
		sort_order = 1,
		sound_character = "witch_hunter",
		talent_tree_index = 3,
		breed = PlayerBreeds.hero_wh_captain,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.wh_3,
		passive_ability = PassiveAbilitySettings.wh_3,
		attributes = {
			base_critical_strike_chance = 0.1,
			max_hp = 125,
		},
		video = {
			material_name = "wh_captain",
			resource = "video/career_videos/victor/wh_captain",
		},
		preview_items = {
			{
				item_name = "wh_fencing_sword",
			},
			{
				item_name = "witchhunter_hat_0000",
			},
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee",
			},
			slot_ranged = {
				"ranged",
			},
			slot_necklace = {
				"necklace",
			},
			slot_ring = {
				"ring",
			},
			slot_trinket_1 = {
				"trinket",
			},
			slot_hat = {
				"hat",
			},
			slot_skin = {
				"skin",
			},
			slot_frame = {
				"frame",
			},
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket",
		},
	},
	bw_scholar = {
		base_skin = "skin_bw_scholar",
		category_image = "category_icon_sienna_scholar",
		description = "sienna_1_desc",
		display_name = "bw_scholar",
		icon = "icons_placeholder",
		name = "bw_scholar",
		package_name = "resource_packages/careers/bw_scholar",
		picking_image = "medium_unit_frame_portrait_sienna_scholar",
		playfab_name = "bw_1",
		portrait_image = "unit_frame_portrait_sienna_scholar",
		portrait_image_picking = "picking_portrait_sienna_scholar",
		portrait_thumbnail = "portrait_sienna_scholar_thumbnail",
		preview_animation = "career_select_03",
		preview_idle_animation = "career_idle_03",
		preview_wield_slot = "ranged",
		profile_name = "bright_wizard",
		sort_order = 2,
		sound_character = "bright_wizard",
		talent_tree_index = 1,
		breed = PlayerBreeds.hero_bw_scholar,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.bw_1,
		passive_ability = PassiveAbilitySettings.bw_1,
		attributes = {
			base_critical_strike_chance = 0.05,
			max_hp = 100,
		},
		video = {
			material_name = "bw_scholar",
			resource = "video/career_videos/sienna/bw_scholar",
		},
		preview_items = {
			{
				item_name = "bw_skullstaff_spear",
			},
			{
				item_name = "scholar_hat_0000",
			},
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee",
			},
			slot_ranged = {
				"ranged",
			},
			slot_necklace = {
				"necklace",
			},
			slot_ring = {
				"ring",
			},
			slot_trinket_1 = {
				"trinket",
			},
			slot_hat = {
				"hat",
			},
			slot_skin = {
				"skin",
			},
			slot_frame = {
				"frame",
			},
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket",
		},
	},
	bw_adept = {
		base_skin = "skin_bw_adept",
		category_image = "category_icon_sienna_adept",
		description = "sienna_2_desc",
		display_name = "bw_adept",
		icon = "icons_placeholder",
		name = "bw_adept",
		package_name = "resource_packages/careers/bw_adept",
		picking_image = "medium_unit_frame_portrait_sienna_adept",
		playfab_name = "bw_2",
		portrait_image = "unit_frame_portrait_sienna_adept",
		portrait_image_picking = "picking_portrait_sienna_adept",
		portrait_thumbnail = "portrait_sienna_adept_thumbnail",
		preview_animation = "career_select_02",
		preview_idle_animation = "career_idle_02",
		preview_wield_slot = "ranged",
		profile_name = "bright_wizard",
		sort_order = 1,
		sound_character = "bright_wizard_battle_wizard",
		talent_tree_index = 2,
		breed = PlayerBreeds.hero_bw_adept,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.bw_2,
		passive_ability = PassiveAbilitySettings.bw_2,
		attributes = {
			base_critical_strike_chance = 0.05,
			max_hp = 100,
		},
		video = {
			material_name = "bw_adept",
			resource = "video/career_videos/sienna/bw_adept",
		},
		preview_items = {
			{
				item_name = "bw_skullstaff_fireball",
			},
			{
				item_name = "adept_hat_0000",
			},
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee",
			},
			slot_ranged = {
				"ranged",
			},
			slot_necklace = {
				"necklace",
			},
			slot_ring = {
				"ring",
			},
			slot_trinket_1 = {
				"trinket",
			},
			slot_hat = {
				"hat",
			},
			slot_skin = {
				"skin",
			},
			slot_frame = {
				"frame",
			},
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket",
		},
	},
	bw_unchained = {
		base_skin = "skin_bw_unchained",
		category_image = "category_icon_sienna_unchained",
		description = "sienna_3_desc",
		display_name = "bw_unchained",
		icon = "icons_placeholder",
		name = "bw_unchained",
		package_name = "resource_packages/careers/bw_unchained",
		picking_image = "medium_unit_frame_portrait_sienna_unchained",
		playfab_name = "bw_3",
		portrait_image = "unit_frame_portrait_sienna_unchained",
		portrait_image_picking = "picking_portrait_sienna_unchained",
		portrait_thumbnail = "portrait_sienna_unchained_thumbnail",
		preview_animation = "career_select_01",
		preview_idle_animation = "career_idle_01",
		preview_wield_slot = "melee",
		profile_name = "bright_wizard",
		sort_order = 3,
		sound_character = "bright_wizard_unchained",
		talent_tree_index = 3,
		breed = PlayerBreeds.hero_bw_unchained,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.bw_3,
		passive_ability = PassiveAbilitySettings.bw_3,
		attributes = {
			base_critical_strike_chance = 0.05,
			max_hp = 150,
		},
		video = {
			material_name = "bw_unchained",
			resource = "video/career_videos/sienna/bw_unchained",
		},
		preview_items = {
			{
				item_name = "bw_flame_sword",
			},
			{
				item_name = "unchained_hat_0000",
			},
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee",
			},
			slot_ranged = {
				"ranged",
			},
			slot_necklace = {
				"necklace",
			},
			slot_ring = {
				"ring",
			},
			slot_trinket_1 = {
				"trinket",
			},
			slot_hat = {
				"hat",
			},
			slot_skin = {
				"skin",
			},
			slot_frame = {
				"frame",
			},
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket",
		},
	},
	empire_soldier_tutorial = {
		base_skin = "skin_es_knight",
		category_image = "category_icon_kruber_knight",
		description = "markus_2_desc",
		display_name = "empire_soldier",
		icon = "icons_placeholder",
		name = "empire_soldier_tutorial",
		package_name = "resource_packages/careers/es_knight",
		picking_image = "medium_unit_frame_portrait_kruber_knight",
		portrait_image = "unit_frame_portrait_kruber_knight",
		portrait_thumbnail = "portrait_kruber_knight_thumbnail",
		preview_animation = "career_select_02",
		preview_idle_animation = "career_idle_02",
		preview_wield_slot = "melee",
		profile_name = "empire_soldier",
		sort_order = 1,
		sound_character = "empire_soldier_knight",
		breed = PlayerBreeds.hero_es_mercenary,
		item_types = {},
		activated_ability = ActivatedAbilitySettings.es_2,
		passive_ability = PassiveAbilitySettings.es_2,
		attributes = {
			base_critical_strike_chance = 0.05,
			max_hp = 150,
		},
		video = {
			material_name = "es_knight",
			resource = "video/career_videos/kruber/es_knight",
		},
		preview_items = {
			{
				item_name = "es_sword_shield",
			},
			{
				item_name = "knight_hat_0000",
			},
		},
		is_unlocked_function = local_is_unlocked_function,
		is_dlc_unlocked = local_is_dlc_unlocked,
		override_available_for_mechanism = local_override_available_for_mechanism,
		item_slot_types_by_slot_name = {
			slot_melee = {
				"melee",
			},
			slot_ranged = {
				"ranged",
			},
			slot_necklace = {
				"necklace",
			},
			slot_ring = {
				"ring",
			},
			slot_trinket_1 = {
				"trinket",
			},
			slot_hat = {
				"hat",
			},
			slot_skin = {
				"skin",
			},
			slot_frame = {
				"frame",
			},
		},
		loadout_equipment_slots = {
			"melee",
			"ranged",
			"necklace",
			"ring",
			"trinket",
		},
	},
}
CareerNameAchievementMapping = {
	bw_adept = "adept",
	bw_scholar = "scholar",
	bw_unchained = "unchained",
	dr_ironbreaker = "ironbreaker",
	dr_ranger = "ranger",
	dr_slayer = "slayer",
	es_huntsman = "huntsman",
	es_knight = "knight",
	es_mercenary = "mercenary",
	we_maidenguard = "maidenguard",
	we_shade = "shade",
	we_waywatcher = "waywatcher",
	wh_bountyhunter = "bountyhunter",
	wh_captain = "witchhunter",
	wh_zealot = "zealot",
}

DLCUtils.require_list("career_setting_files")

CareerSettingsOriginal = table.shallow_copy(CareerSettings)

if script_data.honduras_demo then
	CareerSettings.we_shade.preview_items = {
		{
			item_name = "we_spear",
		},
		{
			item_name = "shade_hat_0000",
		},
	}
	CareerSettings.we_shade.preview_animation = "career_select_03"
	CareerSettings.es_knight.preview_items = {
		{
			item_name = "es_2h_hammer",
		},
		{
			item_name = "knight_hat_0000",
		},
	}
	CareerSettings.es_knight.preview_animation = nil
end
