-- chunkname: @scripts/settings/equipment/weapon_templates/vs_packmaster_claw.lua

local weapon_template = {}

weapon_template.actions = {}
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.vs_packmaster_claw
weapon_template.wield_anim = "idle"
weapon_template.display_unit = "units/weapons/weapon_display/display_2h_weapon"
weapon_template.buff_type = "MELEE_2H"
weapon_template.weapon_type = "POLEARM"
weapon_template.max_fatigue_points = 6
weapon_template.dodge_count = 3
weapon_template.block_angle = 90
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.5
weapon_template.outer_block_fatigue_point_multiplier = 2
weapon_template.sound_event_block_within_arc = "weapon_foley_blunt_1h_block_wood"
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.2,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.2,
	},
}
weapon_template.attack_meta_data = {
	tap_attack = {
		arc = 0,
		penetrating = true,
	},
	hold_attack = {
		arc = 0,
		penetrating = true,
	},
}
weapon_template.aim_assist_settings = {
	base_multiplier = 0,
	effective_max_range = 4,
	max_range = 5,
	no_aim_input_multiplier = 0,
	vertical_only = true,
	breed_scalars = {
		skaven_clan_rat = 0.5,
		skaven_slave = 0.5,
		skaven_storm_vermin = 1,
	},
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_high_damage",
	"weapon_keyword_armour_piercing",
	"weapon_keyword_shield_breaking",
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "light_attack_left",
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "heavy_attack_left",
	},
}
weapon_template.tooltip_detail = {
	light = {
		action_name = "action_one",
		sub_action_name = "default",
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "default",
	},
	push = {
		action_name = "action_one",
		sub_action_name = "push",
	},
}
weapon_template.wwise_dep_right_hand = {
	"wwise/one_handed_axes",
}

local vs_packmaster_claw = table.clone(weapon_template)

vs_packmaster_claw.crosshair_style = "dot"

local vs_poison_wind_globadier_orb = table.clone(weapon_template)

vs_poison_wind_globadier_orb.right_hand_attachment_node_linking = AttachmentNodeLinking.vs_poison_wind_globadier_orb
vs_poison_wind_globadier_orb.crosshair_style = "dot"

local vs_gutter_runner_claws = table.clone(weapon_template)

vs_gutter_runner_claws.right_hand_attachment_node_linking = AttachmentNodeLinking.vs_gutter_runner_claws.right
vs_gutter_runner_claws.left_hand_attachment_node_linking = AttachmentNodeLinking.vs_gutter_runner_claws.left
vs_gutter_runner_claws.crosshair_style = "dot"

return {
	vs_packmaster_claw = vs_packmaster_claw,
	vs_poison_wind_globadier_orb = vs_poison_wind_globadier_orb,
	vs_gutter_runner_claws = vs_gutter_runner_claws,
}
