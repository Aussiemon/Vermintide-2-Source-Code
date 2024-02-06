-- chunkname: @scripts/settings/dlcs/morris/morris_potion_settings.lua

local deus_potions_settings = DLCSettings.morris.pickups.deus_potions

local function generate_non_refreshable_potion_template(potion_name)
	local weapon_template = {}

	weapon_template.actions = {
		action_one = {
			default = {
				ammo_usage = 1,
				anim_end_event = "attack_finished",
				anim_event = "attack_heal",
				block_pickup = true,
				damage_window_end = 0.2,
				damage_window_start = 0.05,
				kind = "buff",
				total_time = 1.3,
				uninterruptible = true,
				weapon_action_hand = "left",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				condition_func = function (action_user)
					local buff_extension = ScriptUnit.extension(action_user, "buff_system")
					local has_normal_buff = buff_extension:has_buff_type(potion_name .. "_potion")
					local has_increased_buff = buff_extension:has_buff_type(potion_name .. "_potion_increased")
					local has_buff = has_normal_buff or has_increased_buff

					return not has_buff
				end,
				allowed_chain_actions = {},
				buff_template = potion_name .. "_potion",
			},
		},
		action_two = {
			default = ActionTemplates.give_item_on_defend,
		},
		action_instant_drink_potion = {
			default = {
				kind = "dummy",
				total_time = 0,
				weapon_action_hand = "left",
				allowed_chain_actions = {},
			},
			instant_drink = {
				ammo_usage = 1,
				anim_end_event = "attack_finished",
				anim_event = "attack_heal",
				auto_validate_on_gamepad = true,
				block_pickup = true,
				damage_window_end = 0.2,
				damage_window_start = 0.05,
				interaction_priority = 2,
				kind = "buff",
				total_time = 1.3,
				uninterruptible = true,
				weapon_action_hand = "left",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				allowed_chain_actions = {},
				buff_template = potion_name .. "_potion",
				condition_func = function (attacker_unit)
					return true
				end,
			},
		},
		action_instant_give_item = ActionTemplates.instant_give_item,
		action_inspect = ActionTemplates.action_inspect_left,
		action_career_skill = ActionTemplates.career_skill_dummy,
		action_wield = ActionTemplates.wield_left,
		action_instant_grenade_throw = ActionTemplates.instant_grenade_throw,
		action_instant_heal_self = ActionTemplates.instant_equip_and_heal_self,
	}
	weapon_template.ammo_data = {
		ammo_hand = "left",
		ammo_per_clip = 1,
		destroy_when_out_of_ammo = true,
		ignore_ammo_pickup = true,
		max_ammo = 1,
		reload_time = 0,
	}
	weapon_template.left_hand_unit = "units/weapons/player/wpn_potion_buff/wpn_potion_buff"
	weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.potion
	weapon_template.wield_anim = "to_potion"
	weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/common"
	weapon_template.load_state_machine = false
	weapon_template.gui_texture = "hud_consumable_icon_potion"
	weapon_template.max_fatigue_points = 4
	weapon_template.can_give_other = true
	weapon_template.buffs = {
		change_dodge_distance = {
			external_optional_multiplier = 1,
		},
		change_dodge_speed = {
			external_optional_multiplier = 1,
		},
	}
	weapon_template.pickup_data = {
		pickup_name = potion_name .. "_potion",
	}
	weapon_template.material_settings = deus_potions_settings[potion_name .. "_potion"].material_settings

	return weapon_template
end

return {
	liquid_bravado_potion = generate_non_refreshable_potion_template("liquid_bravado"),
	vampiric_draught_potion = generate_non_refreshable_potion_template("vampiric_draught"),
	moot_milk_potion = generate_non_refreshable_potion_template("moot_milk"),
	friendly_murderer_potion = generate_non_refreshable_potion_template("friendly_murderer"),
	killer_in_the_shadows_potion = generate_non_refreshable_potion_template("killer_in_the_shadows"),
	pockets_full_of_bombs_potion = generate_non_refreshable_potion_template("pockets_full_of_bombs"),
	hold_my_beer_potion = generate_non_refreshable_potion_template("hold_my_beer"),
	poison_proof_potion = generate_non_refreshable_potion_template("poison_proof"),
}
