CareerActionNames.dwarf_ranger[#CareerActionNames.dwarf_ranger + 1] = "action_career_dr_4"
PlayerBreeds.hero_dr_engineer = {
	is_hero = true,
	name = "hero_dr_engineer",
	vortexable = true,
	awards_positive_reinforcement_message = true,
	is_player = true,
	disable_local_hit_reactions = true,
	poison_resistance = 0,
	armor_category = 4,
	threat_value = 8,
	hit_zones = PlayerBreedHitZones.player_breed_hit_zones
}
CareerSettings.dr_engineer = {
	profile_name = "dwarf_ranger",
	display_name = "dr_engineer",
	sound_character = "dwarf_engineer",
	package_name = "resource_packages/careers/dr_engineer",
	name = "dr_engineer",
	preview_idle_animation = "career_idle_04",
	preview_animation = "career_select_04",
	icon = "icons_placeholder",
	base_skin = "skin_dr_engineer",
	picking_image = "medium_unit_frame_portrait_bardin_engineer",
	preview_wield_slot = "ranged",
	playfab_name = "dr_4",
	should_reload_career_weapon = true,
	portrait_image_picking = "picking_portrait_bardin_engineer",
	talent_tree_index = 4,
	description = "bardin_4_desc",
	portrait_image = "unit_frame_portrait_bardin_engineer",
	portrait_thumbnail = "portrait_bardin_engineer_thumbnail",
	sort_order = 1,
	required_dlc = "cog",
	breed = PlayerBreeds.hero_dr_engineer,
	item_types = {},
	activated_ability = ActivatedAbilitySettings.dr_4,
	passive_ability = PassiveAbilitySettings.dr_4,
	attributes = {
		max_hp = 100,
		max_hp_kd = 300,
		base_critical_strike_chance = 0.05
	},
	video = {
		material_name = "dr_engineer",
		resource = "video/career_videos/bardin/dr_engineer"
	},
	preview_items = {
		{
			item_name = "bardin_engineer_career_skill_weapon_preview"
		},
		{
			item_name = "engineer_hat_0000"
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
		if Managers.unlock:is_dlc_unlocked("cog") then
			return true
		else
			return false, "dlc_not_owned", "cog"
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
	fp_anim_setup = function (fp_unit)
		if Unit.animation_has_variable(fp_unit, "is_engineer") then
			local variable_index = Unit.animation_find_variable(fp_unit, "is_engineer")

			Unit.animation_set_variable(fp_unit, variable_index, 1)
		end
	end,
	talent_packages = function (talent_ids, packages_list, is_first_person)
		local career_skill_index = 1
		local career_weapon_index = 1

		for _, talent_id in ipairs(talent_ids) do
			local talent = Talents.dwarf_ranger[talent_id]

			if talent and talent.talent_career_skill_index then
				career_skill_index = talent.talent_career_skill_index
			end

			if talent and talent.talent_career_weapon_index then
				career_weapon_index = talent.talent_career_weapon_index
			end
		end

		local weapon_names = ActivatedAbilitySettings.dr_4[career_skill_index].weapon_names_by_index
		local weapon_name = weapon_names[career_weapon_index]
		local weapon = ItemMasterList[weapon_name]
		local weapon_tempalte = Weapons[weapon.template]
		local weapon_packages = WeaponUtils.get_weapon_packages(weapon_tempalte, weapon, is_first_person)

		for j = 1, #weapon_packages, 1 do
			local package_name = weapon_packages[j]
			packages_list[package_name] = false
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
	},
	additional_item_slots = {
		slot_grenade = 2
	}
}
OverchargeData = OverchargeData or {}
OverchargeData.dr_engineer = {
	overcharge_threshold = 10,
	overcharge_warning_critical_sound_event = "drakegun_overcharge_warning_critical",
	time_until_overcharge_decreases = 0.25,
	overcharge_warning_low_sound_event = "drakegun_overcharge_warning_low",
	overcharge_value_decrease_rate = 1.3,
	overcharge_warning_high_sound_event = "drakegun_overcharge_warning_high",
	explosion_template = "overcharge_explosion_dwarf",
	overcharge_warning_med_sound_event = "drakegun_overcharge_warning_med",
	hit_overcharge_threshold_sound = "ui_special_attack_ready"
}
PlayerUnitStatusSettings = PlayerUnitStatusSettings or {}
PlayerUnitStatusSettings.overcharge_values = table.merge(PlayerUnitStatusSettings.overcharge_values or {}, {
	cog_hammer_charge_light = 3,
	cog_hammer_heavy_1_burn = 10,
	cog_hammer_heavy_1_explosion = 40
})
CareerNameAchievementMapping.dr_engineer = "engineer"

return
