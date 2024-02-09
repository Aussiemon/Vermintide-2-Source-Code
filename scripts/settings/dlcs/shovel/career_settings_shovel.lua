﻿-- chunkname: @scripts/settings/dlcs/shovel/career_settings_shovel.lua

CareerActionNames.bright_wizard[#CareerActionNames.bright_wizard + 1] = "action_career_bw_necromancer"
CareerSettings.bw_necromancer = {
	additional_ui_info_file = "scripts/settings/dlcs/shovel/additional_career_info_ui",
	base_skin = "skin_bw_necromancer",
	description = "sienna_4_desc",
	display_name = "bw_necromancer",
	icon = "icons_placeholder",
	name = "bw_necromancer",
	package_name = "resource_packages/careers/bw_necromancer",
	picking_image = "medium_unit_frame_portrait_sienna_necromancer",
	playfab_name = "bw_necromancer",
	portrait_image = "unit_frame_portrait_sienna_necromancer",
	portrait_image_picking = "picking_portrait_sienna_necromancer",
	portrait_thumbnail = "portrait_sienna_necromancer_thumbnail",
	preview_animation = "career_select_04",
	preview_idle_animation = "career_idle_04",
	preview_wield_slot = "ranged",
	profile_name = "bright_wizard",
	required_dlc = "shovel",
	show_pet_ui = true,
	sort_order = 1,
	sound_character = "bright_wizard_necromancer",
	talent_tree_index = 4,
	breed = PlayerBreeds.hero_bw_necromancer,
	item_types = {},
	activated_ability = ActivatedAbilitySettings.bw_necromancer,
	passive_ability = PassiveAbilitySettings.bw_necromancer,
	attributes = {
		base_critical_strike_chance = 0.05,
		max_hp = 100,
		max_hp_kd = 300,
	},
	video = {
		material_name = "bw_necromancer",
		resource = "video/career_videos/sienna/bw_necromancer",
	},
	unique_subtitles = {
		"nm_",
		4,
	},
	preview_items = {
		{
			item_name = "bw_necromancy_staff",
		},
		{
			item_name = "bw_necromancer_hat_0000",
		},
	},
	preview_props = {
		{
			animation_event = "career_select_spawn",
			unit_name = "units/beings/npcs/necromancer_skeleton/chr_npc_necromancer_skeleton_selection",
			package_names = {
				"resource_packages/breeds/pet_skeleton_selection",
			},
			offset = {
				-0.6,
				-1,
				0,
			},
		},
		{
			animation_event = "career_select_spawn_02",
			unit_name = "units/beings/npcs/necromancer_skeleton/chr_npc_necromancer_skeleton_selection",
			package_names = {
				"resource_packages/breeds/pet_skeleton_selection",
			},
			offset = {
				0.6,
				-1,
				0,
			},
		},
	},
	is_unlocked_function = function (career, hero_name, hero_level)
		local unlocked, reason = career:override_available_for_mechanism()

		if unlocked ~= nil then
			return unlocked, reason
		end

		local dlc_name

		unlocked, reason, dlc_name = career:is_dlc_unlocked()

		if not unlocked then
			return false, reason, dlc_name
		end

		return true, reason, dlc_name
	end,
	is_dlc_unlocked = function (career)
		if Managers.unlock:is_dlc_unlocked("shovel") then
			return true, nil, "shovel"
		else
			return false, "dlc_not_owned", "shovel"
		end
	end,
	override_available_for_mechanism = function (career)
		local settings = Managers.mechanism:mechanism_setting_for_title("override_career_availability")
		local career_name = career.display_name

		if settings and settings[career_name] ~= nil then
			return settings[career_name], "disabled_for_mechanism"
		end

		return nil
	end,
	requires_packages = {
		trapped_soul_skull = {
			"units/beings/player/bright_wizard_necromancer/talents/trapped_soul_skull",
		},
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
	additional_item_slots = {
		slot_potion = 1,
	},
	additional_inventory = {
		slot_potion = {
			"bw_necromancer_career_utility_weapon",
		},
	},
}
OverchargeData = OverchargeData or {}
OverchargeData.bw_necromancer = {
	explosion_template = "overcharge_explosion_brw",
	hit_overcharge_threshold_sound = "ui_special_attack_ready",
	no_critical_onscreen_particles = true,
	onscreen_particles_id = "fx/necromancer_overcharge_screenspace",
	overcharge_threshold = 10,
	overcharge_value_decrease_rate = 1,
	overcharge_warning_critical_sound_event = "Play_weapon_necro_staff_overcharge_warning_critical",
	overcharge_warning_high_sound_event = "Play_weapon_necro_staff_overcharge_warning_high",
	overcharge_warning_low_sound_event = "Play_weapon_necro_staff_overcharge_warning_low",
	overcharge_warning_med_sound_event = "Play_weapon_necro_staff_overcharge_warning_med",
	time_until_overcharge_decreases = 0.5,
	overcharge_ui = {
		material = "overcharge_bar",
		color_normal = {
			255,
			180,
			195,
			182,
		},
		color_medium = {
			255,
			90,
			250,
			221,
		},
		color_high = {
			255,
			15,
			247,
			205,
		},
	},
}
PlayerUnitStatusSettings = PlayerUnitStatusSettings or {}
PlayerUnitStatusSettings.overcharge_values = table.merge(PlayerUnitStatusSettings.overcharge_values or {}, {})
CareerNameAchievementMapping.bw_necromancer = "bw_necromancer"
