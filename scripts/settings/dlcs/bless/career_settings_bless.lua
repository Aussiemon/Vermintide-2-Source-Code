-- chunkname: @scripts/settings/dlcs/bless/career_settings_bless.lua

CareerActionNames.witch_hunter[#CareerActionNames.witch_hunter + 1] = "action_career_wh_priest"
CareerSettings.wh_priest = {
	base_skin = "skin_wh_priest",
	category_image = "store_category_icon_priest",
	description = "victor_4_desc",
	display_name = "wh_priest",
	icon = "icons_placeholder",
	min_head_lookat_z = -0.5,
	name = "wh_priest",
	package_name = "resource_packages/careers/wh_priest",
	picking_image = "medium_unit_frame_portrait_victor_priest",
	playfab_name = "wh_priest",
	portrait_image = "unit_frame_portrait_victor_priest",
	portrait_image_picking = "picking_portrait_victor_priest",
	portrait_thumbnail = "portrait_victor_priest_thumbnail",
	preview_animation = "career_select_04",
	preview_idle_animation = "career_idle_04",
	preview_wield_slot = "melee",
	profile_name = "witch_hunter",
	required_dlc = "bless",
	sort_order = 4,
	sound_character = "witch_hunter_priest",
	talent_tree_index = 4,
	breed = PlayerBreeds.hero_wh_priest,
	item_types = {},
	activated_ability = ActivatedAbilitySettings.wh_priest,
	passive_ability = PassiveAbilitySettings.wh_priest,
	attributes = {
		base_critical_strike_chance = 0.05,
		max_hp = 150,
	},
	video = {
		material_name = "wh_priest",
		resource = "video/career_videos/victor/wh_priest",
	},
	unique_subtitles = {
		"wp_",
		4,
	},
	preview_items = {
		{
			item_name = "wh_priest_career_weapon_preview",
		},
		{
			item_name = "priest_hat_0000",
		},
	},
	is_unlocked_function = function (career, hero_name, hero_level)
		local unlocked, reason = career:override_available_for_mechanism()

		if not unlocked then
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
		if Managers.unlock:is_dlc_unlocked("bless") then
			return true, nil, "bless"
		else
			return false, "dlc_not_owned", "bless"
		end
	end,
	override_available_for_mechanism = function (career)
		local settings = Managers.mechanism:mechanism_setting_for_title("override_career_availability")
		local career_name = career.display_name

		if settings and settings[career_name] == false then
			return false, "disabled_for_mechanism"
		end

		return true
	end,
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
		slot_pose = {
			"weapon_pose",
		},
	},
	loadout_equipment_slots = {
		"melee",
		"melee",
		"necklace",
		"ring",
		"trinket",
		"weapon_pose",
	},
}
OverchargeData = OverchargeData or {}
OverchargeData.wh_priest = {
	explosion_template = "overcharge_explosion_dwarf",
	hit_overcharge_threshold_sound = "ui_special_attack_ready",
	overcharge_threshold = 10,
	overcharge_value_decrease_rate = 0,
	overcharge_warning_critical_sound_event = "drakegun_overcharge_warning_critical",
	overcharge_warning_high_sound_event = "drakegun_overcharge_warning_high",
	overcharge_warning_low_sound_event = "drakegun_overcharge_warning_low",
	overcharge_warning_med_sound_event = "drakegun_overcharge_warning_med",
	time_until_overcharge_decreases = 5,
}
CareerNameAchievementMapping.wh_priest = "wh_priest"
