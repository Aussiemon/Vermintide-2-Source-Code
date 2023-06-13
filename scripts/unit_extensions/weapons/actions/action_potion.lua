ActionPotion = class(ActionPotion, ActionBase)

ActionPotion.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionPotion.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end
end

ActionPotion.client_owner_start_action = function (self, new_action, t)
	ActionPotion.super.client_owner_start_action(self, new_action, t)

	self.current_action = new_action
end

ActionPotion.client_owner_post_update = function (self, dt, t, world, can_damage)
	return
end

ActionPotion.finish = function (self, reason)
	if reason ~= "action_complete" then
		return
	end

	local current_action = self.current_action
	local owner_unit = self.owner_unit
	local buff_template = current_action.buff_template
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	local career_extension = ScriptUnit.has_extension(owner_unit, "career_system")
	local cooldown_reduction_override = buff_extension:has_buff_perk("cooldown_reduction_override") and buff_template == "cooldown_reduction_potion"
	local potion_spread = buff_extension:has_buff_type("trait_ring_potion_spread") or buff_extension:has_buff_type("weave_trait_ring_potion_spread")
	local targets = {
		owner_unit
	}
	local smallest_distance = TrinketSpreadDistance
	local additional_target = nil

	if potion_spread then
		local side = Managers.state.side.side_by_unit[owner_unit]
		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_players = #player_and_bot_units
		local owner_player_position = POSITION_LOOKUP[owner_unit]

		for i = 1, num_players do
			local other_player_unit = player_and_bot_units[i]

			if Unit.alive(other_player_unit) and other_player_unit ~= owner_unit then
				local other_player_position = POSITION_LOOKUP[other_player_unit]
				local distance = Vector3.distance(owner_player_position, other_player_position)

				if distance <= smallest_distance then
					smallest_distance = distance
					additional_target = other_player_unit
				end
			end
		end
	end

	if additional_target then
		targets[#targets + 1] = additional_target
	end

	local increased_buff_template = buff_template .. "_increased"

	if buff_extension:has_buff_perk("potion_duration") and BuffTemplates[increased_buff_template] then
		buff_template = increased_buff_template
	end

	local num_targets = #targets
	local network_manager = Managers.state.network
	local buff_template_name_id = NetworkLookup.buff_templates[buff_template]
	local owner_unit_id = network_manager:unit_game_object_id(owner_unit)

	Managers.razer_chroma:play_animation(current_action.buff_template, false, RAZER_ADD_ANIMATION_TYPE.REPLACE)

	if not buff_extension:has_buff_type("trait_ring_all_potions") and not buff_extension:has_buff_type("weave_trait_ring_all_potions") then
		for i = 1, num_targets do
			local target_unit = targets[i]
			local unit_object_id = network_manager:unit_game_object_id(target_unit)
			local target_unit_buff_extension = ScriptUnit.extension(target_unit, "buff_system")

			if cooldown_reduction_override and career_extension then
				career_extension:set_activated_ability_cooldown_unpaused()
				career_extension:reduce_activated_ability_cooldown_percent(1)
			end

			if self.is_server then
				target_unit_buff_extension:add_buff(buff_template)
				network_manager.network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, owner_unit_id, 0, false)
			else
				network_manager.network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, owner_unit_id, 0, true)
			end
		end
	else
		local additional_potion_buffs = {
			"speed_boost_potion_reduced",
			"damage_boost_potion_reduced",
			"cooldown_reduction_potion_reduced"
		}

		if cooldown_reduction_override and career_extension then
			career_extension:set_activated_ability_cooldown_unpaused()
			career_extension:reduce_activated_ability_cooldown_percent(0.5)
		end

		for i = 1, #additional_potion_buffs do
			local additional_buff_template_name_id = NetworkLookup.buff_templates[additional_potion_buffs[i]]

			if self.is_server then
				buff_extension:add_buff(additional_potion_buffs[i])
				network_manager.network_transmit:send_rpc_clients("rpc_add_buff", owner_unit_id, additional_buff_template_name_id, owner_unit_id, 0, false)
			else
				network_manager.network_transmit:send_rpc_server("rpc_add_buff", owner_unit_id, additional_buff_template_name_id, owner_unit_id, 0, true)
			end
		end
	end

	if self.ammo_extension then
		local ammo_usage = current_action.ammo_usage
		local _, procced = buff_extension:apply_buffs_to_value(0, "not_consume_potion")

		if not procced then
			self.ammo_extension:use_ammo(ammo_usage)
		else
			local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")

			inventory_extension:wield_previous_weapon()

			if buff_extension:has_buff_type("trait_ring_not_consume_potion_damage") then
				DamageUtils.debug_deal_damage(self.owner_unit, "basic_debug_damage_player")
			end
		end
	end

	buff_extension:trigger_procs("on_potion_consumed", self.item_name)

	local player = Managers.player:unit_owner(owner_unit)
	local position = POSITION_LOOKUP[owner_unit]

	Managers.telemetry_events:player_used_item(player, self.item_name, position)
end
