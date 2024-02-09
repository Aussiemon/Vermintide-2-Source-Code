-- chunkname: @scripts/unit_extensions/default_player_unit/careers/career_ability_settings_vs.lua

require("scripts/unit_extensions/default_player_unit/careers/career_ability_dark_pact_base")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_chaos_troll_vomit")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_corruptor_grab")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_corruptor_teleport")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_gutter_runner_foff")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_gutter_runner_pounce")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_packmaster_equip")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_packmaster_grab")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_packmaster_hoist")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_poison_wind_globadier_throw")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_ratling_gunner_fire")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_sorcerer_teleport")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_vortex_sorcerer")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_warpfire_thrower")

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")

ActivatedAbilitySettings.vs_gutter_runner = {
	{
		cooldown = 0,
		description = "career_active_desc_dr_2_2",
		display_name = "career_active_name_dr_2",
		hud_icon = "dark_pact_ability_pounce",
		icon = "dark_pact_ability_pounce",
		input_action = "action_one",
		name = "pounce",
		spawn_cooldown_percent = 0,
		ability_class = CareerAbilityGutterRunnerPounce,
	},
	{
		cooldown = 15,
		description = "career_active_desc_dr_2_2",
		display_name = "career_active_name_dr_2",
		hud_icon = "dark_pact_ability_invisible",
		icon = "dark_pact_ability_invisible",
		input_action = "action_career",
		name = "foff",
		show_in_hud = true,
		spawn_cooldown_percent = 0,
		ability_class = CareerAbilityGutterRunnerFoff,
	},
}
ActivatedAbilitySettings.vs_poison_wind_globadier = {
	{
		cooldown = 12,
		cooldown_anim_time = 1.25,
		description = "career_active_desc_dr_2_2",
		display_name = "career_active_name_dr_2",
		hud_icon = "dark_pact_ability_throw_gas",
		icon = "dark_pact_ability_throw_gas",
		input_action = "action_one",
		max_stacks = 0,
		name = "gas",
		spawn_cooldown_percent = 0,
		starting_stack_count = 0,
		ability_class = CareerAbilityPoisonWindGlobadierThrow,
	},
}
ActivatedAbilitySettings.vs_packmaster = {
	{
		cooldown = 5,
		description = "career_active_desc_dr_2_2",
		display_name = "career_active_name_dr_2",
		hud_icon = "dark_pact_ability_hook",
		icon = "dark_pact_ability_hook",
		input_action = "action_one",
		name = "grab",
		spawn_cooldown_percent = 0,
		ability_class = CareerAbilityPackmasterGrab,
	},
	{
		cooldown = 0,
		description = "career_active_desc_dr_2_2",
		display_name = "career_active_name_dr_2",
		hud_icon = "dark_pact_ability_hoist",
		icon = "dark_pact_ability_hoist",
		input_action = "action_one",
		name = "hoist",
		spawn_cooldown_percent = 0,
		ability_class = CareerAbilityPackmasterHoist,
	},
	{
		cooldown = 0,
		description = "career_active_desc_dr_2_2",
		display_name = "career_active_name_dr_2",
		hud_icon = "dark_pact_ability_hook_return",
		icon = "dark_pact_ability_hook_return",
		input_action = "action_career",
		name = "equip",
		spawn_cooldown_percent = 0,
		startup_delay_time = 4,
		ability_class = CareerAbilityPackmasterEquip,
	},
}
ActivatedAbilitySettings.vs_ratling_gunner = {
	{
		cooldown = 5,
		description = "career_active_desc_dr_2_2",
		display_name = "career_active_name_dr_2",
		hud_icon = "dark_pact_ability_teleport",
		icon = "bardin_slayer_activated_ability",
		input_action = "action_one",
		name = "fire",
		spawn_cooldown_percent = 0,
		ability_class = CareerAbilityRatlingGunnerFire,
	},
	{
		cooldown = 5,
		description = "career_active_desc_dr_2_2",
		display_name = "career_active_name_dr_2",
		hud_icon = "dark_pact_ability_teleport",
		icon = "bardin_slayer_activated_ability",
		input_action = "weapon_reload",
		name = "reload",
		spawn_cooldown_percent = 0,
		ability_class = CareerAbilityRatlingGunnerReload,
	},
}
ActivatedAbilitySettings.vs_warpfire_thrower = {
	{
		cooldown = 2,
		description = "career_active_desc_dr_2_2",
		display_name = "career_active_name_dr_2",
		icon = "bardin_slayer_activated_ability",
		input_action = "action_one",
		name = "fire",
		spawn_cooldown_percent = 0,
		ability_class = CareerAbilityWarpfireThrower,
	},
}
ActivatedAbilitySettings.vs_chaos_spawn = {
	{
		cooldown = 4,
		description = "career_active_desc_dr_2_2",
		display_name = "career_active_name_dr_2",
		icon = "bardin_slayer_activated_ability",
		name = "fire",
		spawn_cooldown_percent = 0,
		ability_class = CareerAbilityCorruptorGrab,
	},
}
ActivatedAbilitySettings.vs_stormfiend = {
	{
		cooldown = 4,
		description = "career_active_desc_dr_2_2",
		display_name = "career_active_name_dr_2",
		icon = "bardin_slayer_activated_ability",
		name = "fire",
		spawn_cooldown_percent = 0,
		ability_class = CareerAbilityCorruptorGrab,
	},
}
ActivatedAbilitySettings.vs_rat_ogre = {
	{
		cooldown = 4,
		description = "career_active_desc_dr_2_2",
		display_name = "career_active_name_dr_2",
		icon = "bardin_slayer_activated_ability",
		name = "fire",
		spawn_cooldown_percent = 0,
		ability_class = CareerAbilityCorruptorGrab,
	},
}
PassiveAbilitySettings.vs_gutter_runner = {
	description = "career_passive_desc_dr_2a_2",
	display_name = "career_passive_name_dr_2",
	icon = "bardin_slayer_passive",
	buffs = {
		"vs_pactsworn_melee_damage_taken",
	},
	perks = {},
}
PassiveAbilitySettings.vs_poison_wind_globadier = {
	description = "career_passive_desc_dr_2a_2",
	display_name = "career_passive_name_dr_2",
	icon = "bardin_slayer_passive",
	buffs = {
		"vs_pactsworn_melee_damage_taken",
	},
	perks = {},
}
PassiveAbilitySettings.vs_packmaster = {
	description = "career_passive_desc_dr_2a_2",
	display_name = "career_passive_name_dr_2",
	icon = "bardin_slayer_passive",
	buffs = {
		"vs_pactsworn_melee_damage_taken",
	},
	perks = {},
}
PassiveAbilitySettings.vs_ratling_gunner = {
	description = "career_passive_desc_dr_2a_2",
	display_name = "career_passive_name_dr_2",
	icon = "bardin_slayer_passive",
	buffs = {
		"vs_pactsworn_melee_damage_taken",
	},
	perks = {},
}
PassiveAbilitySettings.vs_warpfire_thrower = {
	description = "career_passive_desc_dr_2a_2",
	display_name = "career_passive_name_dr_2",
	icon = "bardin_slayer_passive",
	buffs = {
		"vs_pactsworn_melee_damage_taken",
	},
	perks = {},
}
PassiveAbilitySettings.vs_chaos_spawn = {
	description = "career_passive_desc_dr_2a_2",
	display_name = "career_passive_name_dr_2",
	icon = "bardin_slayer_passive",
	buffs = {},
	perks = {},
}
PassiveAbilitySettings.vs_stormfiend = {
	description = "career_passive_desc_dr_2a_2",
	display_name = "career_passive_name_dr_2",
	icon = "bardin_slayer_passive",
	buffs = {},
	perks = {},
}
PassiveAbilitySettings.vs_rat_ogre = {
	description = "career_passive_desc_dr_2a_2",
	display_name = "career_passive_name_dr_2",
	icon = "bardin_slayer_passive",
	buffs = {},
	perks = {},
}

for ability_id, ability_list in pairs(ActivatedAbilitySettings) do
	for i = 1, #ability_list do
		local data = ability_list[i]

		data.ability_id = i
	end
end
