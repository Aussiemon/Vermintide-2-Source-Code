local push_radius = 2
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {},
	action_two = {
		default = {
			damage_window_start = 0.05,
			charge_value = "action_push",
			outer_push_angle = 180,
			kind = "push_stagger",
			damage_window_end = 0.2,
			hit_effect = "melee_hit_slashing",
			attack_template = "basic_sweep_push",
			weapon_action_hand = "left",
			push_angle = 100,
			anim_event = "attack_push",
			total_time = 0.8,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_one",
					end_time = 0.7,
					input = "action_one"
				}
			},
			push_radius = push_radius,
			condition_func = function (attacker_unit, input_extension)
				local status_extension = ScriptUnit.extension(attacker_unit, "status_system")

				return not status_extension.fatigued(status_extension)
			end
		}
	},
	action_wield = ActionTemplates.wield_left
}
weapon_template.ammo_data = {
	destroy_when_out_of_ammo = true,
	max_ammo = 1,
	ammo_per_clip = 1,
	reload_time = 0,
	ignore_ammo_pickup = true
}
weapon_template.left_hand_unit = "units/weapons/player/wpn_scrolls/wpn_scroll"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.left
weapon_template.wield_anim = "to_first_aid"
weapon_template.gui_texture = "hud_consumable_icon_potion"
weapon_template.max_fatigue_points = 1
weapon_template.dodge_distance = 1.15
weapon_template.dodge_speed = 1.15
weapon_template.dodge_count = 3
local aoe_damage_scroll_action = aoe_damage_scroll_action or {}
aoe_damage_scroll_action = {
	effect_name = "fx/scroll_magic_darts",
	weapon_action_hand = "left",
	ammo_usage = 1,
	kind = "aoe_damage",
	attack_template = "aoe_damage",
	anim_event = "parry_pose",
	size = 6,
	total_time = 1,
	allowed_chain_actions = {}
}
Weapons = Weapons or {}
Weapons.scroll = weapon_template
Weapons.aoe_damage_scroll = Weapons.aoe_damage_scroll or table.clone(weapon_template)
Weapons.aoe_damage_scroll.left_hand_unit = "units/weapons/player/wpn_scroll/wpn_scroll"
Weapons.aoe_damage_scroll.actions.action_one.default = Weapons.aoe_damage_scroll.actions.action_one.default or table.clone(aoe_damage_scroll_action)
Weapons.aoe_damage_scroll.gui_texture = "hud_consumable_icon_potion"

return 
