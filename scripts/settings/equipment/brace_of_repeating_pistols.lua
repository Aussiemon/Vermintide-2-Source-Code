local push_radius = 2
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			damage_window_end = 0,
			damage_window_start = 0.1,
			ammo_usage = 1,
			kind = "handgun",
			total_time_secondary = 2,
			fire_time = 0,
			attack_template = "shot_machinegun",
			anim_event_secondary = "reload",
			hit_effect = "bullet_impact",
			charge_value = "bullet_hit",
			alert_sound_range_fire = 12,
			anim_event = "attack_shoot",
			reload_time = 1.25,
			alert_sound_range_hit = 2,
			total_time = 1,
			allowed_chain_actions = {
				{
					sub_action = "default_two",
					start_time = 0.12,
					action = "action_one",
					auto_chain = true
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_career_skill",
					input = "action_career_skill"
				}
			}
		},
		locked_shots = {
			anim_event = "attack_shoot",
			attack_template = "shot_machinegun",
			charge_value = "bullet_hit",
			kind = "handgun_lock",
			hit_effect = "bullet_impact",
			total_time = math.huge,
			allowed_chain_actions = {}
		}
	},
	action_two = {
		default = {
			minimum_hold_time = 0.5,
			ammo_requirement = 1,
			can_abort_reload = true,
			anim_end_event = "attack_finished",
			kind = "handgun_lock_targeting",
			max_targets = 6,
			hold_input = "action_two_hold",
			anim_event = "lock_target",
			end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			allowed_chain_actions = {
				{
					sub_action = "locked_shots",
					start_time = 0.3,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_career_skill",
					input = "action_career_skill"
				}
			},
			condition_func = function (unit, input_extension, ammo_extension)
				if ammo_extension and ammo_extension.total_remaining_ammo(ammo_extension) <= 0 then
					return false
				end

				return true
			end
		}
	},
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield,
	action_career_skill = ActionTemplates.career_skill_dummy,
	action_instant_grenade_throw = ActionTemplates.instant_equip_grenade,
	action_instant_heal_self = ActionTemplates.instant_equip_and_heal_self,
	action_instant_heal_other = ActionTemplates.instant_equip_and_heal_other,
	action_instant_drink_potion = ActionTemplates.instant_equip_and_drink_potion,
	action_instant_equip_tome = ActionTemplates.instant_equip_tome,
	action_instant_equip_grimoire = ActionTemplates.instant_equip_grimoire,
	action_instant_equip_grenade = ActionTemplates.instant_equip_grenade_only,
	action_instant_equip_healing_draught = ActionTemplates.instant_equip_and_drink_healing_draught
}
weapon_template.ammo_data = {
	ammo_hand = "right",
	ammo_per_reload = 24,
	max_ammo = 60,
	ammo_per_clip = 24,
	play_reload_anim_on_wield_reload = true,
	reload_time = 1,
	reload_on_ammo_pickup = true
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_head",
	can_charge_shot = false
}
local action_template = weapon_template.actions.action_one.default
weapon_template.actions.action_one.default_two = table.clone(action_template)
weapon_template.actions.action_one.default_two.allowed_chain_actions = {
	{
		sub_action = "default_three",
		start_time = 0.12,
		action = "action_one",
		auto_chain = true
	}
}
weapon_template.actions.action_one.default_three = table.clone(action_template)
weapon_template.actions.action_one.default_three.allowed_chain_actions = {
	{
		sub_action = "default",
		start_time = 0.8,
		action = "action_one",
		sound_time_offset = -0.05,
		chain_ready_sound = "weapon_gun_ready",
		input = "action_one"
	},
	{
		sub_action = "default",
		start_time = 0.8,
		action = "action_one",
		input = "action_one_hold"
	},
	{
		sub_action = "default",
		start_time = 0.4,
		action = "action_two",
		input = "action_two"
	},
	{
		sub_action = "default",
		start_time = 0.4,
		action = "action_wield",
		input = "action_wield"
	},
	{
		sub_action = "default",
		start_time = 0,
		action = "action_career_skill",
		input = "action_career_skill"
	}
}
weapon_template.default_spread_template = "repeating pistol"
weapon_template.right_hand_unit = ""
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right
weapon_template.left_hand_unit = ""
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.left
weapon_template.display_unit = "units/weapons/weapon_display/display_pistols"
weapon_template.wield_anim = "to_dual_pistol"
weapon_template.crosshair_style = "default"
weapon_template.gui_texture = "hud_weapon_icon_repeating_handgun"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "BRACE_OF_PISTOLS"
weapon_template.dodge_distance = 1.3
weapon_template.dodge_speed = 1.3
weapon_template.dodge_count = 1
weapon_template.wwise_dep_right_hand = {
	"wwise/handgun_rifle"
}
weapon_template.third_person_attached_units = {
	{
		unit = "units/weapons/player/wpn_empire_pistol_brace/wpn_empire_pistol_brace_3p",
		attachment_node_linking = AttachmentNodeLinking.pistol_brace
	},
	{
		unit = "units/weapons/player/wpn_empire_pistol_brace/wpn_empire_pistol_brace_3p",
		attachment_node_linking = AttachmentNodeLinking.pistol_brace
	}
}
weapon_template.tooltip_keywords = {
	"keyword_1",
	"keyword_2",
	"keyword_3"
}
weapon_template.compare_statistics = {
	attacks = {
		light_attack = {
			speed = 0.4,
			range = 0.4,
			damage = 0.6,
			targets = 0.2,
			stagger = 0.4
		},
		heavy_attack = {
			speed = 0.8,
			range = 0.4,
			damage = 0.6,
			targets = 0.2,
			stagger = 0.4
		}
	},
	perks = {
		light_attack = {
			"armor_penetration"
		},
		heavy_attack = {
			"armor_penetration"
		}
	}
}
Weapons = Weapons or {}
Weapons.brace_of_repeating_pistols_template_1 = table.clone(weapon_template)

return 
