local weapon_template = {
	actions = {
		action_one = {
			default = {
				damage_window_end = 0.2,
				ammo_usage = 1,
				anim_end_event = "attack_finished",
				kind = "healing_draught",
				damage_window_start = 0.05,
				weapon_action_hand = "left",
				block_pickup = true,
				dialogue_event = "on_healing_draught",
				anim_event = "attack_heal",
				total_time = 1.2,
				allowed_chain_actions = {},
				condition_func = function (user_unit)
					local health_extension = ScriptUnit.extension(user_unit, "health_system")
					local status_extension = ScriptUnit.extension(user_unit, "status_system")
					local full_health = health_extension:current_permanent_health_percent() >= 1
					local is_wounded = status_extension:is_wounded()

					return is_wounded or not full_health
				end,
				chain_condition_func = function (user_unit)
					local health_extension = ScriptUnit.extension(user_unit, "health_system")
					local status_extension = ScriptUnit.extension(user_unit, "status_system")
					local full_health = health_extension:current_permanent_health_percent() >= 1
					local is_wounded = status_extension:is_wounded()

					return is_wounded or not full_health
				end
			}
		},
		action_two = {
			default = ActionTemplates.give_item_on_defend
		},
		action_inspect = ActionTemplates.action_inspect_left,
		action_wield = ActionTemplates.wield_left,
		action_instant_give_item = ActionTemplates.instant_give_item,
		action_instant_heal_self = {
			default = {
				kind = "dummy",
				weapon_action_hand = "left",
				total_time = 1,
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0.5,
						action = "action_one",
						auto_chain = true
					}
				}
			}
		}
	},
	ammo_data = {
		ammo_hand = "left",
		destroy_when_out_of_ammo = true,
		max_ammo = 1,
		ammo_per_clip = 1,
		reload_time = 0
	},
	pickup_data = {
		pickup_name = "healing_draught"
	},
	left_hand_unit = "units/weapons/player/wpn_potion/wpn_potion",
	left_hand_attachment_node_linking = AttachmentNodeLinking.potion,
	wield_anim = "to_potion",
	state_machine = "units/beings/player/first_person_base/state_machines/common",
	load_state_machine = false,
	gui_texture = "hud_consumable_icon_potion",
	max_fatigue_points = 1,
	can_heal_self = true,
	fast_heal = true,
	can_give_other = true,
	bot_heal_threshold = 0.4,
	buffs = {
		change_dodge_distance = {
			external_optional_multiplier = 1
		},
		change_dodge_speed = {
			external_optional_multiplier = 1
		}
	}
}

return {
	healing_draught = table.clone(weapon_template)
}
