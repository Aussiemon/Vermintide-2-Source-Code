-- chunkname: @scripts/settings/dlcs/shovel/shovel_sound_settings.lua

local settings = DLCSettings.shovel

settings.dialogue_lookup = {
	"dialogues/generated/lookup_bright_wizard_shovel",
	"dialogues/generated/lookup_dlc_shovel",
}
settings.dialogue_settings = {
	inn_level = {
		"dialogues/generated/dlc_shovel",
	},
	inn_level_halloween = {
		"dialogues/generated/dlc_shovel",
	},
	inn_level_skulls = {
		"dialogues/generated/dlc_shovel",
	},
	inn_level_sonnstill = {
		"dialogues/generated/dlc_shovel",
	},
	morris_hub = {
		"dialogues/generated/dlc_shovel",
	},
}
settings.dialogue_events = {
	"minion_command_attack",
	"minion_command_defend",
}
settings.auto_load_files = {
	"dialogues/generated/bright_wizard_shovel",
}
settings.network_sound_events = {
	"Play_career_necro_ability_raise_dead_cast",
	"Play_career_necro_ability_raise_dead_cast_husk",
	"Play_career_necro_ability_raise_dead_spawn",
	"Play_career_necro_ability_raise_dead_retributors_spawn",
	"Play_career_necro_ability_raise_dead_vanguard_spawn",
	"Play_career_necro_passive_shadow_blood",
	"weapon_sienna_necro_staff_cast_projectile",
	"weapon_sienna_necro_staff_finger_snap",
	"weapon_sienna_necro_staff_projectile_explode",
	"career_necro_skeleton_damage",
	"Play_career_necro_ability_withering_wave_start",
	"Play_career_necro_ability_skeleton_taunt",
	"Play_weapon_necro_staff_suck_pop",
	"weapon_sienna_necro_staff_projectile_chain",
	"Play_career_necro_ability_trapped_souls",
	"Play_career_necro_skeleton_charge",
	"Play_skeleton_minion_charge_vce",
	"Play_career_necro_ability_soul_rip_orb_pickup",
	"Play_career_necro_skeleton_defend",
	"Play_career_necro_ability_cursed_blood",
}
