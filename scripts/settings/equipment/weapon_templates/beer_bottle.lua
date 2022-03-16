local weapon_template = {
	actions = {
		action_one = {
			default = {
				anim_event = "drink",
				anim_end_event = "attack_finished",
				ammo_usage = 1,
				kind = "one_time_consumable",
				weapon_action_hand = "right",
				block_pickup = true,
				uninterruptible = true,
				buff_template = "increase_intoxication_level",
				total_time = 1.9,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				allowed_chain_actions = {}
			}
		},
		action_dropped = {
			default = {
				alert_sound_range_hit = 10,
				anim_end_event = "attack_finished",
				kind = "throw",
				velocity_multiplier = 1,
				throw_time = 0.35,
				ammo_usage = 1,
				weapon_action_hand = "left",
				block_pickup = true,
				speed = 5,
				uninterruptible = true,
				anim_event = "attack_throw",
				total_time = 0.7,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				allowed_chain_actions = {},
				angular_velocity = {
					0,
					-5,
					0
				},
				throw_offset = {
					0.25,
					1.2,
					0
				},
				projectile_info = {
					projectile_unit_template_name = "pickup_unit",
					pickup_name = "beer_bottle",
					drop_on_player_destroyed = true,
					projectile_unit_name = "units/weapons/player/pup_ale/pup_ale"
				}
			}
		},
		action_wield = ActionTemplates.wield_and_use
	},
	ammo_data = {
		ammo_hand = "right",
		destroy_when_out_of_ammo = true,
		max_ammo = 1,
		ammo_per_clip = 1,
		reload_time = 0,
		ignore_ammo_pickup = true
	},
	right_hand_unit = "units/weapons/player/wpn_ale/wpn_ale",
	right_hand_attachment_node_linking = AttachmentNodeLinking.potion_right,
	wield_anim = "to_potion",
	gui_texture = "hud_consumable_icon_potion",
	gui_texture = "hud_consumable_icon_potion",
	pickup_data = {
		pickup_name = "beer_bottle"
	},
	max_fatigue_points = 4,
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
	beer_bottle = table.clone(weapon_template)
}
