-- chunkname: @scripts/settings/dlcs/cog/career_settings_cog.lua

CareerActionNames.dwarf_ranger[#CareerActionNames.dwarf_ranger + 1] = "action_career_dr_4"

setmetatable(PlayerBreeds.hero_dr_engineer, {
	__newindex = function (table, key, value)
		if type(key) == "number" then
			error("HON-32308. Trying to modify read only table.")
		end

		rawset(table, key, value)
	end,
})

CareerSettings.dr_engineer = {
	base_skin = "skin_dr_engineer",
	category_image = "icons_placeholder",
	description = "bardin_4_desc",
	display_name = "dr_engineer",
	icon = "icons_placeholder",
	name = "dr_engineer",
	package_name = "resource_packages/careers/dr_engineer",
	picking_image = "medium_unit_frame_portrait_bardin_engineer",
	playfab_name = "dr_4",
	portrait_image = "unit_frame_portrait_bardin_engineer",
	portrait_image_picking = "picking_portrait_bardin_engineer",
	portrait_thumbnail = "portrait_bardin_engineer_thumbnail",
	preview_animation = "career_select_04",
	preview_idle_animation = "career_idle_04",
	preview_wield_slot = "ranged",
	profile_name = "dwarf_ranger",
	required_dlc = "cog",
	should_reload_career_weapon = true,
	sort_order = 4,
	sound_character = "dwarf_engineer",
	talent_tree_index = 4,
	breed = PlayerBreeds.hero_dr_engineer,
	item_types = {},
	activated_ability = ActivatedAbilitySettings.dr_4,
	passive_ability = PassiveAbilitySettings.dr_4,
	attributes = {
		base_critical_strike_chance = 0.05,
		max_hp = 125,
	},
	video = {
		material_name = "dr_engineer",
		resource = "video/career_videos/bardin/dr_engineer",
	},
	preview_items = {
		{
			item_name = "bardin_engineer_career_skill_weapon_preview",
		},
		{
			item_name = "engineer_hat_0000",
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
		if Managers.unlock:is_dlc_unlocked("cog") then
			return true, nil, "cog"
		else
			return false, "dlc_not_owned", "cog"
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
	animation_variables = {
		is_engineer = 1,
	},
	talent_packages = function (talent_ids, packages_list, is_first_person, is_bot)
		local career_weapon_index = 1

		for _, talent_id in ipairs(talent_ids) do
			local talent = TalentUtils.get_talent_by_id("dwarf_ranger", talent_id)

			if talent and talent.talent_career_weapon_index then
				career_weapon_index = talent.talent_career_weapon_index
			end
		end

		local weapon_names = ActivatedAbilitySettings.dr_4[1].weapon_names_by_index
		local weapon_name = weapon_names[career_weapon_index]
		local weapon = ItemMasterList[weapon_name]
		local weapon_template = WeaponUtils.get_weapon_template(weapon.template)
		local career_name = "dr_engineer"
		local weapon_packages = WeaponUtils.get_weapon_packages(weapon_template, weapon, is_first_person, career_name)

		for j = 1, #weapon_packages do
			local package_name = weapon_packages[j]

			packages_list[package_name] = false
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
		slot_pose = {
			"weapon_pose",
		},
	},
	loadout_equipment_slots = {
		"melee",
		"ranged",
		"necklace",
		"ring",
		"trinket",
		"weapon_pose",
	},
	additional_item_slots = {
		slot_grenade = 2,
	},
}
OverchargeData = OverchargeData or {}
OverchargeData.dr_engineer = {
	explosion_template = "overcharge_explosion_dwarf",
	hit_overcharge_threshold_sound = "ui_special_attack_ready",
	overcharge_threshold = 10,
	overcharge_value_decrease_rate = 1.3,
	overcharge_warning_critical_sound_event = "drakegun_overcharge_warning_critical",
	overcharge_warning_high_sound_event = "drakegun_overcharge_warning_high",
	overcharge_warning_low_sound_event = "drakegun_overcharge_warning_low",
	overcharge_warning_med_sound_event = "drakegun_overcharge_warning_med",
	time_until_overcharge_decreases = 0.25,
}
PlayerUnitStatusSettings = PlayerUnitStatusSettings or {}
PlayerUnitStatusSettings.overcharge_values = table.merge(PlayerUnitStatusSettings.overcharge_values or {}, {
	cog_hammer_charge_light = 3,
	cog_hammer_heavy_1_burn = 10,
	cog_hammer_heavy_1_explosion = 40,
})
CareerNameAchievementMapping.dr_engineer = "engineer"
