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
	sound_character = "empire_soldier",
	name = "es_questingknight",
	portrait_image_picking = "picking_portrait_kruber_questingknight",
	package_name = "resource_packages/careers/es_questingknight",
	preview_idle_animation = "career_idle_04",
	preview_animation = "career_select_04",
	icon = "icons_placeholder",
	talent_tree_index = 4,
	description = "markus_3_desc",
	base_skin = "skin_es_questingknight_blue_and_white",
	preview_wield_slot = "melee",
	playfab_name = "es_4",
	portrait_image = "unit_frame_portrait_kruber_questingknight",
	portrait_thumbnail = "portrait_kruber_questingknight_thumbnail",
	sort_order = 1,
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
	preview_items = {
		{
			item_name = "es_bastard_sword_preview"
		},
		{
			item_name = "questing_knight_hat_0000"
		}
	},
	is_unlocked_function = function (hero_name, hero_level)
		if Managers.unlock:is_dlc_unlocked("lake") then
			return true
		else
			return false, Localize("dlc_not_owned"), "lake"
		end
	end,
	is_dlc_unlocked = function ()
		if Managers.unlock:is_dlc_unlocked("lake") then
			return true
		else
			return false, Localize("dlc_not_owned"), "lake"
		end
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
CareerNameAchievementMapping.es_questingknight = "questingknight"

return
