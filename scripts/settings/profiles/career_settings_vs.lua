-- chunkname: @scripts/settings/profiles/career_settings_vs.lua

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

	return true
end

local function local_is_dlc_unlocked(career)
	if Managers.unlock:is_dlc_unlocked("carousel") then
		return true
	else
		return false, "dlc_not_owned", "carousel"
	end
end

local function local_override_available_for_mechanism(career)
	local settings = Managers.mechanism:mechanism_setting_for_title("override_career_availability")
	local career_name = career.display_name

	if settings and settings[career_name] == false then
		return false, "disabled_for_mechanism"
	end

	return true
end

CareerActionNames.vs_gutter_runner = {}
CareerActionNames.vs_poison_wind_globadier = {}
CareerActionNames.vs_packmaster = {}
CareerActionNames.vs_ratling_gunner = {}
CareerActionNames.vs_warpfire_thrower = {}
CareerActionNames.vs_chaos_troll = {}
CareerSettings.vs_undecided = {
	description = "vs_pactsworn_undecided_desc",
	display_name = "vs_undecided",
	excluded_from_weave_loadouts = true,
	icon = "icons_placeholder",
	name = "vs_undecided",
	playfab_name = "vs_undecided",
	profile_name = "vs_undecided",
	is_unlocked_function = local_is_unlocked_function,
	is_dlc_unlocked = local_is_dlc_unlocked,
	override_available_for_mechanism = local_override_available_for_mechanism,
}
CareerSettings.vs_gutter_runner = {
	base_skin = "skaven_gutter_runner_skin_0000",
	base_weapon = "vs_gutter_runner_claws",
	category_image = "category_icon_vs_gutter_runner",
	description = "vs_pactsworn_special_gutter_runner_desc",
	display_name = "vs_gutter_runner",
	excluded_from_weave_loadouts = true,
	icon = "icons_placeholder",
	name = "vs_gutter_runner",
	package_name = "resource_packages/careers/wh_zealot",
	picking_image = "medium_unit_frame_portrait_gutter_runner",
	playfab_name = "vs_gutter_runner",
	portrait_image = "unit_frame_portrait_vs_gutter_runner",
	preview_animation = "idle",
	preview_idle_animation = "idle",
	preview_wield_slot = "melee",
	profile_name = "vs_gutter_runner",
	sort_order = 3,
	sound_character = "witch_hunter_zealot",
	talent_tree_index = 1,
	breed = PlayerBreeds.vs_gutter_runner,
	item_types = {},
	activated_ability = ActivatedAbilitySettings.vs_gutter_runner,
	passive_ability = PassiveAbilitySettings.vs_gutter_runner,
	attributes = {
		base_critical_strike_chance = 0.05,
		max_hp = 30,
	},
	video = {
		material_name = "wh_zealot",
		resource = "video/career_videos/victor/wh_zealot",
	},
	preview_items = {
		{
			item_name = "vs_gutter_runner_claws",
		},
	},
	career_info_settings = {
		{
			description = "vs_htp_gutter_pounce_description_line1",
			gamepad_input = "action_one",
			icon = "htp_icon_gutter_runner_01",
			input_action = "action_one",
			title = "vs_htp_gutter_pounce",
		},
		{
			description = "vs_htp_gutter_smoke_description_line1",
			gamepad_input = "ability",
			icon = "htp_icon_gutter_runner_02",
			input_action = "action_career",
			title = "vs_htp_gutter_smoke",
		},
	},
	is_unlocked_function = local_is_unlocked_function,
	is_dlc_unlocked = local_is_dlc_unlocked,
	override_available_for_mechanism = local_override_available_for_mechanism,
	loadout_equipment_slots = {
		"melee",
		"ranged",
		"necklace",
		"ring",
		"trinket",
	},
	item_slot_types_by_slot_name = {
		slot_melee = {
			"melee",
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
	additional_character_states_list = {
		"GutterRunnerStateFoff",
		"GutterRunnerStateProwling",
		"GutterRunnerStatePinning",
		"GutterRunnerStatePouncing",
		"GutterRunnerStateStanding",
		"GutterRunnerStateWalking",
		"GutterRunnerStateJumping",
		"GutterRunnerStateFalling",
	},
}
CareerSettings.vs_poison_wind_globadier = {
	base_skin = "skaven_wind_globadier_skin_0000",
	base_weapon = "vs_poison_wind_globadier_orb",
	category_image = "category_icon_vs_poison_wind_globadier",
	description = "vs_pactsworn_special_globadier_desc",
	display_name = "vs_poison_wind_globadier",
	excluded_from_weave_loadouts = true,
	hide_weapons = true,
	icon = "icons_placeholder",
	name = "vs_poison_wind_globadier",
	package_name = "resource_packages/careers/dr_slayer",
	picking_image = "medium_unit_frame_portrait_globardier",
	playfab_name = "vs_poison_wind_globadier",
	portrait_image = "unit_frame_portrait_vs_poison_wind_globadier",
	preview_animation = "idle",
	preview_idle_animation = "idle",
	preview_wield_slot = "melee",
	profile_name = "vs_poison_wind_globadier",
	sort_order = 3,
	sound_character = "dwarf_slayer",
	talent_tree_index = 1,
	breed = PlayerBreeds.vs_poison_wind_globadier,
	item_types = {},
	activated_ability = ActivatedAbilitySettings.vs_poison_wind_globadier,
	passive_ability = PassiveAbilitySettings.vs_poison_wind_globadier,
	attributes = {
		base_critical_strike_chance = 0.05,
		max_hp = 30,
	},
	video = {
		material_name = "dr_slayer",
		resource = "video/career_videos/bardin/dr_slayer",
	},
	preview_items = {
		{
			item_name = "vs_poison_wind_globadier_orb",
		},
	},
	career_info_settings = {
		{
			description = "vs_htp_globadier_globe_description_line2",
			gamepad_input = "action_one",
			icon = "htp_icon_globardier_01",
			input_action = "action_one",
			title = "vs_htp_globadier_globe",
		},
	},
	is_unlocked_function = local_is_unlocked_function,
	is_dlc_unlocked = local_is_dlc_unlocked,
	override_available_for_mechanism = local_override_available_for_mechanism,
	loadout_equipment_slots = {
		"melee",
		"melee",
		"necklace",
		"ring",
		"trinket",
	},
	item_slot_types_by_slot_name = {
		slot_melee = {
			"melee",
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
	additional_character_states_list = {
		"PoisonWindGlobadierStateStanding",
		"PoisonWindGlobadierStateSuiciding",
		"PoisonWindGlobadierStateThrowing",
		"PoisonWindGlobadierStateWalking",
		"PoisonWindGlobadierStateJumping",
		"PoisonWindGlobadierStateFalling",
	},
}
CareerSettings.vs_packmaster = {
	base_skin = "skaven_pack_master_skin_0000",
	base_weapon = "vs_packmaster_claw",
	category_image = "category_icon_vs_packmaster",
	description = "vs_pactsworn_special_packmaster_desc",
	display_name = "vs_packmaster",
	excluded_from_weave_loadouts = true,
	icon = "icons_placeholder",
	name = "vs_packmaster",
	package_name = "resource_packages/careers/dr_slayer",
	picking_image = "medium_unit_frame_portrait_packmaster",
	playfab_name = "vs_packmaster",
	portrait_image = "unit_frame_portrait_vs_packmaster",
	preview_animation = "idle",
	preview_idle_animation = "idle",
	preview_wield_slot = "melee",
	profile_name = "vs_packmaster",
	sort_order = 3,
	sound_character = "dwarf_slayer",
	talent_tree_index = 1,
	breed = PlayerBreeds.vs_packmaster,
	item_types = {},
	activated_ability = ActivatedAbilitySettings.vs_packmaster,
	passive_ability = PassiveAbilitySettings.vs_packmaster,
	attributes = {
		base_critical_strike_chance = 0.05,
		max_hp = 30,
	},
	video = {
		material_name = "dr_slayer",
		resource = "video/career_videos/bardin/dr_slayer",
	},
	preview_items = {
		{
			item_name = "vs_packmaster_claw",
		},
	},
	career_info_settings = {
		{
			description = "vs_htp_packmaster_hook_description_line1",
			gamepad_input = "action_one",
			icon = "htp_icon_packmaster_01",
			input_action = "action_one",
			title = "vs_htp_packmaster_hook",
		},
		{
			description = "vs_htp_packmaster_hoist_description_line1",
			gamepad_input = "action_one",
			icon = "htp_icon_packmaster_02",
			input_action = "action_one",
			title = "vs_htp_packmaster_hoist",
		},
	},
	is_unlocked_function = local_is_unlocked_function,
	is_dlc_unlocked = local_is_dlc_unlocked,
	override_available_for_mechanism = local_override_available_for_mechanism,
	loadout_equipment_slots = {
		"melee",
		"melee",
		"necklace",
		"ring",
		"trinket",
	},
	item_slot_types_by_slot_name = {
		slot_melee = {
			"melee",
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
	additional_character_states_list = {
		"PackmasterStateDragging",
		"PackmasterStateEquipping",
		"PackmasterStateGrabbing",
		"PackmasterStateHoisting",
		"PackmasterStateStanding",
		"PackmasterStateWalking",
		"PackmasterStateJumping",
		"PackmasterStateFalling",
	},
}
CareerSettings.vs_ratling_gunner = {
	base_skin = "skaven_ratling_gunner_skin_0000",
	base_weapon = "vs_ratling_gunner_gun",
	category_image = "category_icon_vs_ratling_gunner",
	description = "vs_pactsworn_special_rattling_gunner_desc",
	display_name = "vs_ratling_gunner",
	excluded_from_weave_loadouts = true,
	icon = "icons_placeholder",
	name = "vs_ratling_gunner",
	package_name = "resource_packages/careers/dr_slayer",
	picking_image = "medium_unit_frame_portrait_ratling_gunner",
	playfab_name = "vs_ratling_gunner",
	portrait_image = "unit_frame_portrait_vs_ratling_gunner",
	preview_animation = "idle",
	preview_idle_animation = "idle",
	preview_wield_slot = "melee",
	profile_name = "vs_ratling_gunner",
	sort_order = 3,
	sound_character = "dwarf_slayer",
	talent_tree_index = 1,
	breed = PlayerBreeds.vs_ratling_gunner,
	item_types = {},
	activated_ability = ActivatedAbilitySettings.vs_ratling_gunner,
	passive_ability = PassiveAbilitySettings.vs_ratling_gunner,
	attributes = {
		base_critical_strike_chance = 0.05,
		max_hp = 50,
	},
	video = {
		material_name = "dr_slayer",
		resource = "video/career_videos/bardin/dr_slayer",
	},
	preview_items = {
		{
			item_name = "vs_ratling_gunner_gun",
		},
	},
	career_info_settings = {
		{
			description = "vs_htp_ratling_gun_description_line1",
			gamepad_input = "action_one",
			icon = "htp_icon_ratling_gunner_01",
			input_action = "action_one",
			title = "vs_htp_ratling_rapidfire",
		},
		{
			description = "vs_htp_ratling_reload_description_line1",
			gamepad_input = "weapon_reload_input",
			icon = "icons_placeholder",
			input_action = "weapon_reload_hold",
			title = "vs_htp_ratling_reload",
		},
	},
	is_unlocked_function = local_is_unlocked_function,
	is_dlc_unlocked = local_is_dlc_unlocked,
	override_available_for_mechanism = local_override_available_for_mechanism,
	loadout_equipment_slots = {
		"melee",
		"melee",
		"necklace",
		"ring",
		"trinket",
	},
	item_slot_types_by_slot_name = {
		slot_melee = {
			"melee",
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
	additional_character_states_list = {
		"RatlingGunnerStateStanding",
		"RatlingGunnerStateWalking",
		"RatlingGunnerStateJumping",
		"RatlingGunnerStateFalling",
	},
}
CareerSettings.vs_warpfire_thrower = {
	base_skin = "skaven_warpfire_thrower_skin_0000",
	base_weapon = "vs_warpfire_thrower_gun",
	category_image = "category_icon_vs_warpfire_thrower",
	description = "vs_pactsworn_special_warpfire_thrower_desc",
	display_name = "vs_warpfire_thrower",
	excluded_from_weave_loadouts = true,
	icon = "icons_placeholder",
	name = "vs_warpfire_thrower",
	package_name = "resource_packages/careers/dr_slayer",
	picking_image = "medium_unit_frame_portrait_warpfire",
	playfab_name = "vs_warpfire_thrower",
	portrait_image = "unit_frame_portrait_vs_warpfire_thrower",
	preview_animation = "idle",
	preview_wield_slot = "melee",
	profile_name = "vs_warpfire_thrower",
	sort_order = 3,
	sound_character = "dwarf_slayer",
	talent_tree_index = 1,
	breed = PlayerBreeds.vs_warpfire_thrower,
	item_types = {},
	activated_ability = ActivatedAbilitySettings.vs_warpfire_thrower,
	passive_ability = PassiveAbilitySettings.vs_warpfire_thrower,
	attributes = {
		base_critical_strike_chance = 0.05,
		max_hp = 40,
	},
	video = {
		material_name = "dr_slayer",
		resource = "video/career_videos/bardin/dr_slayer",
	},
	preview_items = {
		{
			item_name = "vs_warpfire_thrower_gun",
		},
	},
	career_info_settings = {
		{
			description = "vs_htp_warpfire_blast_description_line1",
			gamepad_input = "action_one",
			icon = "htp_icon_warpfire_thrower_01",
			input_action = "action_one",
			title = "vs_htp_wapfire_blast",
		},
	},
	is_unlocked_function = local_is_unlocked_function,
	is_dlc_unlocked = local_is_dlc_unlocked,
	override_available_for_mechanism = local_override_available_for_mechanism,
	loadout_equipment_slots = {
		"melee",
		"melee",
		"necklace",
		"ring",
		"trinket",
	},
	item_slot_types_by_slot_name = {
		slot_melee = {
			"melee",
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
	additional_character_states_list = {
		"WarpfireThrowerStateStanding",
		"WarpfireThrowerStateWalking",
		"WarpfireThrowerStateFiring",
		"WarpfireThrowerStateJumping",
		"WarpfireThrowerStateFalling",
	},
}
CareerSettings.vs_chaos_troll = {
	base_skin = "chaos_troll_skin_0000",
	base_weapon = "vs_chaos_troll_axe",
	category_image = "icons_placeholder",
	description = "vs_pactsworn_special_chaos_troll_desc",
	display_name = "vs_chaos_troll",
	excluded_from_weave_loadouts = true,
	icon = "icons_placeholder",
	name = "vs_chaos_troll",
	package_name = "resource_packages/careers/dr_slayer",
	picking_image = "medium_unit_frame_portrait_troll",
	playfab_name = "vs_chaos_troll",
	portrait_image = "unit_frame_portrait_vs_chaos_troll",
	preview_animation = "idle",
	preview_idle_animation = "idle",
	preview_wield_slot = "melee",
	profile_name = "vs_chaos_troll",
	sort_order = 3,
	sound_character = "dwarf_slayer",
	talent_tree_index = 1,
	breed = PlayerBreeds.vs_chaos_troll,
	item_types = {},
	activated_ability = ActivatedAbilitySettings.vs_chaos_troll,
	passive_ability = PassiveAbilitySettings.vs_chaos_troll,
	attributes = {
		base_critical_strike_chance = 0.05,
		max_hp = 800,
	},
	video = {
		material_name = "dr_slayer",
		resource = "video/career_videos/bardin/dr_slayer",
	},
	preview_items = {
		{
			item_name = "vs_chaos_troll_axe",
		},
	},
	career_info_settings = {
		{
			description = "vs_htp_troll_melee_description_line1",
			gamepad_input = "action_one",
			icon = "htp_icon_gutter_runner_01",
			input_action = "action_one",
			title = "vs_htp_troll_melee",
		},
		{
			description = "vs_htp_troll_vomit_description_line1",
			gamepad_input = "ability",
			icon = "htp_icon_gutter_runner_02",
			input_action = "action_career",
			title = "vs_htp_troll_vomit",
		},
	},
	is_unlocked_function = local_is_unlocked_function,
	is_dlc_unlocked = local_is_dlc_unlocked,
	override_available_for_mechanism = local_override_available_for_mechanism,
	loadout_equipment_slots = {
		"melee",
		"melee",
		"necklace",
		"ring",
		"trinket",
	},
	item_slot_types_by_slot_name = {
		slot_melee = {
			"melee",
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
	additional_character_states_list = {
		"ChaosTrollStateStanding",
		"ChaosTrollStateVomiting",
		"ChaosTrollStateWalking",
		"ChaosTrollStateJumping",
		"ChaosTrollStateFalling",
	},
}
CareerSettings.spectator = {
	display_name = "spectator",
	name = "spectator",
	video = {
		material_name = "dr_slayer",
		resource = "video/career_videos/bardin/dr_slayer",
	},
	item_slot_types_by_slot_name = {},
	is_unlocked_function = function (career, hero_name, hero_level)
		return false
	end,
	is_dlc_unlocked = function (career)
		return false
	end,
	override_available_for_mechanism = function (career)
		return false
	end,
}
