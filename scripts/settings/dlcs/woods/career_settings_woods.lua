-- chunkname: @scripts/settings/dlcs/woods/career_settings_woods.lua

CareerActionNames.wood_elf[#CareerActionNames.wood_elf + 1] = "action_career_we_thornsister"
PlayerBreeds.hero_we_thornsister = {
	armor_category = 4,
	awards_positive_reinforcement_message = true,
	cannot_be_aggroed = true,
	disable_local_hit_reactions = true,
	is_hero = true,
	is_player = true,
	name = "hero_we_thornsister",
	poison_resistance = 0,
	threat_value = 8,
	vortexable = true,
	hit_zones = PlayerBreedHitZones.player_breed_hit_zones,
	status_effect_settings = {
		category = "small",
	},
}
CareerSettings.we_thornsister = {
	base_skin = "skin_ww_thornsister",
	category_image = "icons_placeholder",
	description = "kerillian_4_desc",
	display_name = "we_thornsister",
	icon = "icons_placeholder",
	name = "we_thornsister",
	package_name = "resource_packages/careers/we_thornsister",
	picking_image = "medium_unit_frame_portrait_kerillian_thornsister",
	playfab_name = "we_thornsister",
	portrait_image = "unit_frame_portrait_kerillian_thornsister",
	portrait_image_picking = "picking_portrait_kerillian_thornsister",
	portrait_thumbnail = "portrait_kerillian_thornsister_thumbnail",
	preview_animation = "career_select_04",
	preview_idle_animation = "career_idle_04",
	preview_wield_slot = "ranged",
	profile_name = "wood_elf",
	required_dlc = "woods",
	sort_order = 1,
	sound_character = "wood_elf_sister",
	talent_tree_index = 4,
	breed = PlayerBreeds.hero_we_thornsister,
	item_types = {},
	activated_ability = ActivatedAbilitySettings.we_thornsister,
	passive_ability = PassiveAbilitySettings.we_thornsister,
	attributes = {
		base_critical_strike_chance = 0.05,
		max_hp = 125,
		max_hp_kd = 300,
	},
	video = {
		material_name = "we_thornsister",
		resource = "video/career_videos/kerillian/we_thornsister",
	},
	unique_subtitles = {
		"st_",
		4,
	},
	preview_items = {
		{
			item_name = "we_life_staff",
		},
		{
			item_name = "thornsister_hat_0000",
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
		if Managers.unlock:is_dlc_unlocked("woods") then
			return true, nil, "woods"
		else
			return false, "dlc_not_owned", "woods"
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
	requires_packages = {
		wall_units = {
			"units/beings/player/way_watcher_thornsister/abilities/ww_thornsister_thorn_wall_01",
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
}
OverchargeData = OverchargeData or {}
OverchargeData.we_thornsister = {
	critical_onscreen_particles_id = "fx/thornsister_overcharge",
	explode_vfx_name = "fx/thornsister_overcharge_explosion_3p",
	hit_overcharge_threshold_sound = "ui_special_attack_ready",
	lockout_overcharge_decay_rate = 4,
	no_explosion = true,
	no_forced_movement = true,
	onscreen_particles_id = "fx/thornsister_overcharge",
	overcharge_explosion_time = 0.1,
	overcharge_threshold = 10,
	overcharge_value_decrease_rate = 1,
	overcharge_warning_critical_sound_event = "weapon_life_staff_overcharge_warning_critical",
	overcharge_warning_high_sound_event = "weapon_life_staff_overcharge_warning_high",
	overcharge_warning_med_sound_event = "weapon_life_staff_overcharge_warning_medium",
	percent_health_lost = 0.4,
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
			0,
			255,
			165,
		},
		color_high = {
			255,
			0,
			255,
			0,
		},
	},
}
PlayerUnitStatusSettings = PlayerUnitStatusSettings or {}
PlayerUnitStatusSettings.overcharge_values = table.merge(PlayerUnitStatusSettings.overcharge_values or {}, {
	life_staff_light = 4,
})
CareerNameAchievementMapping.we_thornsister = "thornsister"
