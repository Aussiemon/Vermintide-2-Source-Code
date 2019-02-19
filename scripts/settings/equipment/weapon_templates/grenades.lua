local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			charge_sound_stop_event = "stop_player_combat_weapon_grenade_ignite_loop",
			ammo_usage = 1,
			anim_end_event = "attack_finished",
			kind = "charge",
			minimum_hold_time = 1.1,
			charge_sound_name = "player_combat_weapon_grenade_ignite_loop",
			charge_time = 1,
			explode_time = 3.5,
			block_pickup = true,
			uninterruptible = true,
			anim_event = "grenade_charge",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			allowed_chain_actions = {
				{
					sub_action = "throw",
					start_time = 1,
					action = "action_one",
					input = "action_one_release"
				},
				{
					sub_action = "cancel",
					start_time = 0.55,
					action = "action_one",
					input = "action_two"
				},
				{
					start_time = 0,
					blocker = true,
					input = "action_one_hold"
				},
				{
					sub_action = "throw",
					start_time = 1.1,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		cancel = {
			anim_event = "grenade_charge_cancel",
			block_pickup = true,
			kind = "dummy",
			total_time = 1.25,
			allowed_chain_actions = {}
		},
		throw = {
			uninterruptible = true,
			anim_end_event = "attack_finished",
			hide_weapon_after_fire = true,
			kind = "charged_projectile",
			is_impact_type = true,
			block_pickup = true,
			alert_sound_range_hit = 10,
			fire_time = 0.3,
			throw_time = 0.13,
			throw_up_this_much_in_target_direction = 0.15,
			ammo_usage = 1,
			forced_charge_level = 1,
			speed = 1750,
			throw_offset_length_in_target_direction = 0.1,
			anim_event = "attack_throw",
			total_time = 0.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			throw_offset = Vector3Box(0, 0, 0.9),
			allowed_chain_actions = {},
			projectile_info = Projectiles.grenade,
			impact_data = {
				grenade = true,
				targets = 1,
				aoe = ExplosionTemplates.grenade
			},
			timed_data = {
				life_time = 3,
				aoe = ExplosionTemplates.grenade
			},
			angular_velocity = {
				10,
				0,
				0
			}
		}
	},
	action_two = {
		default = {
			kind = "dummy",
			weapon_action_hand = "left",
			total_time = 0,
			allowed_chain_actions = {}
		},
		give_item = ActionTemplates.give_item_on_defend
	},
	action_instant_throw_grenade = {
		default = {
			kind = "dummy",
			weapon_action_hand = "left",
			total_time = 0,
			allowed_chain_actions = {}
		},
		instant_throw = {
			uninterruptible = true,
			anim_end_event = "attack_finished",
			hide_weapon_after_fire = true,
			kind = "charged_projectile",
			throw_time = 0.13,
			is_impact_type = true,
			block_pickup = true,
			alert_sound_range_hit = 10,
			fire_time = 0,
			auto_validate_on_gamepad = true,
			throw_up_this_much_in_target_direction = 0.15,
			ammo_usage = 1,
			forced_charge_level = 1,
			speed = 1750,
			throw_offset_length_in_target_direction = 0.1,
			anim_event = "attack_throw",
			total_time = 0.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			condition_func = function (user_unit)
				return true
			end,
			throw_offset = Vector3Box(0, 0, 0.9),
			allowed_chain_actions = {},
			projectile_info = Projectiles.grenade,
			impact_data = {
				grenade = true,
				targets = 1,
				aoe = ExplosionTemplates.grenade
			},
			timed_data = {
				life_time = 3,
				aoe = ExplosionTemplates.grenade
			},
			angular_velocity = {
				10,
				0,
				0
			}
		}
	},
	action_instant_give_item = ActionTemplates.instant_give_item,
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield,
	action_instant_grenade_throw = ActionTemplates.instant_grenade_throw,
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
	destroy_when_out_of_ammo = true,
	max_ammo = 1,
	ammo_per_clip = 1,
	reload_time = 0,
	ignore_ammo_pickup = true
}
weapon_template.pickup_data = {
	pickup_name = "impact_grenade"
}
weapon_template.right_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_01_t1"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right
weapon_template.left_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_lighter_01_t1"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.left
weapon_template.wield_anim = "to_grenade"
weapon_template.gui_texture = "hud_consumable_icon_grenade"
weapon_template.crosshair_style = "default"
weapon_template.max_fatigue_points = 4
weapon_template.dodge_distance = 1
weapon_template.dodge_speed = 1
weapon_template.dodge_count = 3
weapon_template.can_give_other = true
local weapon_template_smoke_dot = weapon_template_smoke_dot or {}
weapon_template_smoke_dot.actions = {
	action_one = {
		default = {
			charge_sound_stop_event = "stop_player_combat_weapon_grenade_ignite_loop",
			ammo_usage = 1,
			anim_end_event = "attack_finished",
			kind = "charge",
			minimum_hold_time = 1.1,
			charge_sound_name = "player_combat_weapon_grenade_ignite_loop",
			charge_time = 1,
			explode_time = 3.5,
			block_pickup = true,
			uninterruptible = true,
			anim_event = "grenade_charge",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			allowed_chain_actions = {
				{
					sub_action = "throw",
					start_time = 1,
					action = "action_one",
					input = "action_one_release"
				},
				{
					sub_action = "cancel",
					start_time = 0.55,
					action = "action_one",
					input = "action_two"
				},
				{
					start_time = 0,
					blocker = true,
					input = "action_one_hold"
				},
				{
					sub_action = "throw",
					start_time = 1.1,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		cancel = {
			anim_event = "grenade_charge_cancel",
			block_pickup = true,
			kind = "dummy",
			total_time = 1.25,
			allowed_chain_actions = {}
		},
		throw = {
			uninterruptible = true,
			anim_end_event = "attack_finished",
			hide_weapon_after_fire = true,
			kind = "charged_projectile",
			alert_sound_range_hit = 10,
			fire_time = 0,
			is_impact_type = false,
			block_pickup = true,
			throw_time = 0.13,
			ammo_usage = 1,
			forced_charge_level = 1,
			speed = 2000,
			throw_offset_length_in_target_direction = 0.1,
			anim_event = "attack_throw",
			total_time = 0.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			throw_offset = Vector3Box(0, 0, 0.1),
			allowed_chain_actions = {},
			projectile_info = Projectiles.grenade_fire,
			impact_data = {
				sound_event_name = "player_combat_weapon_fire_grenade_explosion",
				grenade = true,
				targets = 1,
				aoe = ExplosionTemplates.fire_grenade
			},
			timed_data = {
				life_time = 3,
				aoe = ExplosionTemplates.fire_grenade
			},
			angular_velocity = {
				0,
				0,
				0
			}
		}
	},
	action_instant_throw_grenade = {
		default = {
			kind = "dummy",
			weapon_action_hand = "left",
			total_time = 0,
			allowed_chain_actions = {}
		},
		instant_throw = {
			uninterruptible = true,
			anim_end_event = "attack_finished",
			hide_weapon_after_fire = true,
			kind = "charged_projectile",
			is_impact_type = false,
			alert_sound_range_hit = 10,
			fire_time = 0,
			block_pickup = true,
			auto_validate_on_gamepad = true,
			throw_time = 0.13,
			ammo_usage = 1,
			forced_charge_level = 1,
			speed = 2000,
			throw_offset_length_in_target_direction = 0.1,
			anim_event = "attack_throw",
			total_time = 0.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			condition_func = function (user_unit)
				return true
			end,
			throw_offset = Vector3Box(0, 0, 0.1),
			allowed_chain_actions = {},
			projectile_info = Projectiles.grenade_fire,
			impact_data = {
				sound_event_name = "player_combat_weapon_fire_grenade_explosion",
				grenade = true,
				targets = 1,
				aoe = ExplosionTemplates.fire_grenade
			},
			timed_data = {
				life_time = 3,
				aoe = ExplosionTemplates.fire_grenade
			},
			angular_velocity = {
				0,
				0,
				0
			}
		}
	},
	action_instant_give_item = ActionTemplates.instant_give_item,
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield,
	action_instant_grenade_throw = ActionTemplates.instant_grenade_throw,
	action_instant_heal_self = ActionTemplates.instant_equip_and_heal_self,
	action_instant_heal_other = ActionTemplates.instant_equip_and_heal_other,
	action_instant_drink_potion = ActionTemplates.instant_equip_and_drink_potion,
	action_instant_equip_tome = ActionTemplates.instant_equip_tome,
	action_instant_equip_grimoire = ActionTemplates.instant_equip_grimoire,
	action_instant_equip_grenade = ActionTemplates.instant_equip_grenade_only,
	action_instant_equip_healing_draught = ActionTemplates.instant_equip_and_drink_healing_draught
}
weapon_template_smoke_dot.ammo_data = {
	ammo_hand = "right",
	destroy_when_out_of_ammo = true,
	max_ammo = 1,
	ammo_per_clip = 1,
	reload_time = 0
}
weapon_template_smoke_dot.pickup_data = {
	pickup_name = "dot_grenade"
}
weapon_template_smoke_dot.right_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_01_t1"
weapon_template_smoke_dot.right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right
weapon_template_smoke_dot.left_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_lighter_01_t1"
weapon_template_smoke_dot.left_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.left
weapon_template_smoke_dot.wield_anim = "to_grenade"
weapon_template_smoke_dot.gui_texture = "hud_consumable_icon_grenade"
weapon_template_smoke_dot.crosshair_style = "default"
weapon_template_smoke_dot.max_fatigue_points = 4
weapon_template_smoke_dot.can_give_other = true
local weapon_template_fire_dot = weapon_template_fire_dot or {}
weapon_template_fire_dot.actions = {
	action_one = {
		default = {
			charge_sound_stop_event = "stop_player_combat_weapon_grenade_ignite_loop",
			ammo_usage = 1,
			anim_end_event = "attack_finished",
			kind = "charge",
			minimum_hold_time = 1.1,
			charge_sound_name = "player_combat_weapon_grenade_ignite_loop",
			charge_time = 1,
			explode_time = 3.5,
			block_pickup = true,
			uninterruptible = true,
			anim_event = "grenade_charge",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			allowed_chain_actions = {
				{
					sub_action = "throw",
					start_time = 1,
					action = "action_one",
					input = "action_one_release"
				},
				{
					sub_action = "cancel",
					start_time = 0.55,
					action = "action_one",
					input = "action_two"
				},
				{
					start_time = 0,
					blocker = true,
					input = "action_one_hold"
				},
				{
					sub_action = "throw",
					start_time = 1.1,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		cancel = {
			anim_event = "grenade_charge_cancel",
			block_pickup = true,
			kind = "dummy",
			total_time = 1.25,
			allowed_chain_actions = {}
		},
		throw = {
			uninterruptible = true,
			anim_end_event = "attack_finished",
			hide_weapon_after_fire = true,
			kind = "charged_projectile",
			alert_sound_range_hit = 10,
			fire_time = 0.3,
			is_impact_type = false,
			block_pickup = true,
			throw_time = 0.13,
			ammo_usage = 1,
			forced_charge_level = 1,
			speed = 2000,
			throw_offset_length_in_target_direction = 0.1,
			anim_event = "attack_throw",
			total_time = 0.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			throw_offset = Vector3Box(0, 0, 0.1),
			allowed_chain_actions = {},
			projectile_info = Projectiles.grenade_fire,
			impact_data = {
				grenade = true,
				targets = 1,
				aoe = ExplosionTemplates.fire_grenade
			},
			timed_data = {
				life_time = 15,
				aoe = ExplosionTemplates.fire_grenade
			},
			angular_velocity = {
				0,
				0,
				0
			}
		}
	},
	action_two = {
		default = {
			kind = "dummy",
			weapon_action_hand = "left",
			total_time = 0,
			allowed_chain_actions = {}
		},
		give_item = ActionTemplates.give_item_on_defend
	},
	action_instant_throw_grenade = {
		default = {
			kind = "dummy",
			weapon_action_hand = "left",
			total_time = 0,
			allowed_chain_actions = {}
		},
		instant_throw = {
			uninterruptible = true,
			anim_end_event = "attack_finished",
			hide_weapon_after_fire = true,
			kind = "charged_projectile",
			is_impact_type = false,
			alert_sound_range_hit = 10,
			fire_time = 0,
			block_pickup = true,
			auto_validate_on_gamepad = true,
			throw_time = 0.13,
			ammo_usage = 1,
			forced_charge_level = 1,
			speed = 2000,
			throw_offset_length_in_target_direction = 0.1,
			anim_event = "attack_throw",
			total_time = 0.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			condition_func = function (user_unit)
				return true
			end,
			throw_offset = Vector3Box(0, 0, 0.1),
			allowed_chain_actions = {},
			projectile_info = Projectiles.grenade_fire,
			impact_data = {
				grenade = true,
				targets = 1,
				aoe = ExplosionTemplates.fire_grenade
			},
			timed_data = {
				life_time = 15,
				aoe = ExplosionTemplates.fire_grenade
			},
			angular_velocity = {
				0,
				0,
				0
			}
		}
	},
	action_instant_give_item = ActionTemplates.instant_give_item,
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield,
	action_instant_grenade_throw = ActionTemplates.instant_grenade_throw,
	action_instant_heal_self = ActionTemplates.instant_equip_and_heal_self,
	action_instant_heal_other = ActionTemplates.instant_equip_and_heal_other,
	action_instant_drink_potion = ActionTemplates.instant_equip_and_drink_potion,
	action_instant_equip_tome = ActionTemplates.instant_equip_tome,
	action_instant_equip_grimoire = ActionTemplates.instant_equip_grimoire,
	action_instant_equip_grenade = ActionTemplates.instant_equip_grenade_only,
	action_instant_equip_healing_draught = ActionTemplates.instant_equip_and_drink_healing_draught
}
weapon_template_fire_dot.ammo_data = {
	ammo_hand = "right",
	destroy_when_out_of_ammo = true,
	max_ammo = 1,
	ammo_per_clip = 1,
	reload_time = 0
}
weapon_template_fire_dot.pickup_data = {
	pickup_name = "dot_grenade"
}
weapon_template_fire_dot.right_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_01_t1"
weapon_template_fire_dot.right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right
weapon_template_fire_dot.left_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_lighter_01_t1"
weapon_template_fire_dot.left_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.left
weapon_template_fire_dot.wield_anim = "to_grenade"
weapon_template_fire_dot.gui_texture = "hud_consumable_icon_grenade"
weapon_template_fire_dot.crosshair_style = "default"
weapon_template_fire_dot.max_fatigue_points = 4
weapon_template_fire_dot.can_give_other = true
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1
	},
	change_dodge_speed = {
		external_optional_multiplier = 1
	}
}
local frag_grenade_t1 = table.clone(weapon_template)
frag_grenade_t1.left_hand_unit = weapon_template.left_hand_unit
frag_grenade_t1.wield_anim = weapon_template.wield_anim
frag_grenade_t1.right_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_01_t1"
frag_grenade_t1.left_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_lighter_01_t1"
frag_grenade_t1.pickup_data.pickup_name = "frag_grenade_t1"
local frag_grenade_t2 = table.clone(weapon_template)
frag_grenade_t2.left_hand_unit = weapon_template.left_hand_unit
frag_grenade_t2.wield_anim = weapon_template.wield_anim
frag_grenade_t2.right_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t2/wpn_emp_grenade_01_t2"
frag_grenade_t2.left_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t2/wpn_emp_grenade_lighter_01_t2"
frag_grenade_t2.pickup_data.pickup_name = "frag_grenade_t2"
local smoke_grenade_t1 = table.clone(weapon_template_smoke_dot)
smoke_grenade_t1.left_hand_unit = weapon_template_smoke_dot.left_hand_unit
smoke_grenade_t1.wield_anim = weapon_template_smoke_dot.wield_anim
smoke_grenade_t1.right_hand_unit = "units/weapons/player/wpn_emp_grenade_02_t1/wpn_emp_grenade_02_t1"
smoke_grenade_t1.left_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_lighter_01_t1"
smoke_grenade_t1.pickup_data.pickup_name = "smoke_grenade_t1"
smoke_grenade_t1.actions.action_one.throw.projectile_info = Projectiles.grenade_gas
smoke_grenade_t1.actions.action_instant_throw_grenade.instant_throw.projectile_info = Projectiles.grenade_gas
local smoke_grenade_t2 = table.clone(weapon_template_smoke_dot)
smoke_grenade_t2.left_hand_unit = weapon_template_smoke_dot.left_hand_unit
smoke_grenade_t2.wield_anim = weapon_template_smoke_dot.wield_anim
smoke_grenade_t2.right_hand_unit = "units/weapons/player/wpn_emp_grenade_02_t2/wpn_emp_grenade_02_t2"
smoke_grenade_t2.left_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t2/wpn_emp_grenade_lighter_01_t2"
smoke_grenade_t2.pickup_data.pickup_name = "smoke_grenade_t2"
smoke_grenade_t2.actions.action_one.throw.projectile_info = Projectiles.grenade_gas
smoke_grenade_t2.actions.action_instant_throw_grenade.instant_throw.projectile_info = Projectiles.grenade_gas
local fire_grenade_t1 = table.clone(weapon_template_fire_dot)
fire_grenade_t1.left_hand_unit = weapon_template_fire_dot.left_hand_unit
fire_grenade_t1.wield_anim = weapon_template_fire_dot.wield_anim
fire_grenade_t1.right_hand_unit = "units/weapons/player/wpn_emp_grenade_03_t1/wpn_emp_grenade_03_t1"
fire_grenade_t1.left_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_lighter_01_t1"
fire_grenade_t1.pickup_data.pickup_name = "fire_grenade_t1"
fire_grenade_t1.actions.action_one.throw.projectile_info = Projectiles.grenade_fire
fire_grenade_t1.actions.action_instant_throw_grenade.instant_throw.projectile_info = Projectiles.grenade_fire
local fire_grenade_t2 = table.clone(weapon_template_fire_dot)
fire_grenade_t2.left_hand_unit = weapon_template_fire_dot.left_hand_unit
fire_grenade_t2.wield_anim = weapon_template_fire_dot.wield_anim
fire_grenade_t2.right_hand_unit = "units/weapons/player/wpn_emp_grenade_03_t2/wpn_emp_grenade_03_t2"
fire_grenade_t2.left_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t2/wpn_emp_grenade_lighter_01_t2"
fire_grenade_t2.pickup_data.pickup_name = "fire_grenade_t2"
fire_grenade_t2.actions.action_one.throw.projectile_info = Projectiles.grenade_fire
fire_grenade_t2.actions.action_instant_throw_grenade.instant_throw.projectile_info = Projectiles.grenade_fire

return {
	grenade = table.clone(weapon_template),
	frag_grenade_t1 = frag_grenade_t1,
	frag_grenade_t2 = frag_grenade_t2,
	smoke_grenade_t1 = smoke_grenade_t1,
	smoke_grenade_t2 = smoke_grenade_t2,
	fire_grenade_t1 = fire_grenade_t1,
	fire_grenade_t2 = fire_grenade_t2
}
