CareerActionNames.empire_soldier[#CareerActionNames.empire_soldier + 1] = "action_career_es_4"
PlayerBreeds.hero_es_questingknight = {
	is_hero = true,
	name = "hero_es_questingknight",
	vortexable = true,
	awards_positive_reinforcement_message = true,
	is_player = true,
	disable_local_hit_reactions = true,
	poison_resistance = 0,
	armor_category = 4,
	threat_value = 8,
	hit_zones = PlayerBreedHitZones.kruber_breed_hit_zones
}
CareerSettings.es_questingknight = {
	profile_name = "empire_soldier",
	display_name = "es_questingknight",
	package_name = "resource_packages/careers/es_questingknight",
	name = "es_questingknight",
	preview_idle_animation = "career_idle_04",
	preview_animation = "career_select_04",
	icon = "icons_placeholder",
	base_skin = "skin_es_questingknight_blue_and_white",
	picking_image = "medium_unit_frame_portrait_kruber_questingknight",
	preview_wield_slot = "melee",
	playfab_name = "es_4",
	category_image = "icons_placeholder",
	sound_character = "empire_soldier_bretonnian_knight",
	portrait_image_picking = "picking_portrait_kruber_questingknight",
	talent_tree_index = 4,
	description = "markus_3_desc",
	portrait_image = "unit_frame_portrait_kruber_questingknight",
	portrait_thumbnail = "portrait_kruber_questingknight_thumbnail",
	sort_order = 1,
	required_dlc = "lake",
	breed = PlayerBreeds.hero_es_questingknight,
	item_types = {},
	activated_ability = ActivatedAbilitySettings.es_4,
	passive_ability = PassiveAbilitySettings.es_4,
	attributes = {
		max_hp = 150,
		max_hp_kd = 300,
		base_critical_strike_chance = 0.05
	},
	video = {
		material_name = "es_questingknight",
		resource = "video/career_videos/kruber/es_questingknight"
	},
	unique_subtitles = {
		"gk_",
		4
	},
	preview_items = {
		{
			item_name = "es_bastard_sword_preview"
		},
		{
			item_name = "questing_knight_hat_0000"
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

		return true, reason, dlc_name
	end,
	is_dlc_unlocked = function (career)
		if Managers.unlock:is_dlc_unlocked("lake") then
			if IS_WINDOWS or Managers.backend:dlc_unlocked_at_signin("lake") then
				return true, nil, "lake"
			else
				return false, "popup_needs_restart_topic", "lake"
			end
		else
			return false, "dlc_not_owned", "lake"
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
		"ranged",
		"necklace",
		"ring",
		"trinket"
	}
}
CareerNameAchievementMapping.es_questingknight = "questingknight"

return
