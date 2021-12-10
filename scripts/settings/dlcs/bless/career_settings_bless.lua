CareerActionNames.witch_hunter[#CareerActionNames.witch_hunter + 1] = "action_career_wh_priest"
PlayerBreeds.hero_wh_priest = {
	is_hero = true,
	name = "hero_wh_priest",
	vortexable = true,
	awards_positive_reinforcement_message = true,
	is_player = true,
	disable_local_hit_reactions = true,
	poison_resistance = 0,
	armor_category = 4,
	threat_value = 8,
	hit_zones = PlayerBreedHitZones.player_breed_hit_zones
}
CareerSettings.wh_priest = {
	profile_name = "witch_hunter",
	name = "wh_priest",
	display_name = "wh_priest",
	portrait_image_picking = "picking_portrait_victor_priest",
	package_name = "resource_packages/careers/wh_priest",
	preview_idle_animation = "career_idle_04",
	preview_animation = "career_select_04",
	sound_character = "witch_hunter_priest",
	min_head_lookat_z = -0.5,
	icon = "icons_placeholder",
	talent_tree_index = 4,
	description = "victor_4_desc",
	base_skin = "skin_wh_priest",
	picking_image = "medium_unit_frame_portrait_victor_priest",
	preview_wield_slot = "melee",
	playfab_name = "wh_priest",
	portrait_image = "unit_frame_portrait_victor_priest",
	portrait_thumbnail = "portrait_victor_priest_thumbnail",
	sort_order = 1,
	breed = PlayerBreeds.hero_wh_priest,
	item_types = {},
	activated_ability = ActivatedAbilitySettings.wh_priest,
	passive_ability = PassiveAbilitySettings.wh_priest,
	attributes = {
		max_hp = 150,
		max_hp_kd = 300,
		base_critical_strike_chance = 0.05
	},
	video = {
		material_name = "wh_priest",
		resource = "video/career_videos/victor/wh_priest"
	},
	unique_subtitles = {
		"wp_",
		4
	},
	preview_items = {
		{
			item_name = "wh_priest_career_weapon_preview"
		},
		{
			item_name = "priest_hat_0000"
		}
	},
	is_unlocked_function = function (career, hero_name, hero_level)
		local unlocked, reason = career:override_available_for_mechanism()

		if unlocked ~= nil then
			return unlocked, reason
		end

		local dlc_name = nil
		unlocked, reason, dlc_name = career:is_dlc_unlocked()

		if not unlocked then
			return false, reason, dlc_name
		end

		return true
	end,
	is_dlc_unlocked = function (career)
		if Managers.unlock:is_dlc_unlocked("bless") then
			return true
		else
			return false, "dlc_not_owned", "bless"
		end
	end,
	override_available_for_mechanism = function (career)
		local settings = Managers.mechanism:mechanism_setting("override_career_availability")
		local career_name = career.display_name

		if settings and settings[career_name] ~= nil then
			return settings[career_name], "disabled_for_mechanism"
		end

		return nil
	end,
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
}
OverchargeData = OverchargeData or {}
OverchargeData.wh_priest = {
	overcharge_threshold = 10,
	overcharge_warning_critical_sound_event = "drakegun_overcharge_warning_critical",
	time_until_overcharge_decreases = 5,
	overcharge_warning_low_sound_event = "drakegun_overcharge_warning_low",
	overcharge_value_decrease_rate = 0,
	overcharge_warning_high_sound_event = "drakegun_overcharge_warning_high",
	explosion_template = "overcharge_explosion_dwarf",
	overcharge_warning_med_sound_event = "drakegun_overcharge_warning_med",
	hit_overcharge_threshold_sound = "ui_special_attack_ready"
}
CareerNameAchievementMapping.wh_priest = "wh_priest"

return
