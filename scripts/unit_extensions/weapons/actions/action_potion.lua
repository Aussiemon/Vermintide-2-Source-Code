ActionPotion = class(ActionPotion, ActionBase)
local PLAYER_AND_BOT_UNITS = PLAYER_AND_BOT_UNITS

ActionPotion.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionPotion.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end
end

ActionPotion.client_owner_start_action = function (self, new_action, t)
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
	local potion_spread = buff_extension:has_buff_type("trait_ring_potion_spread")
	local targets = {
		owner_unit
	}
	local smallest_distance = TrinketSpreadDistance
	local additional_target = nil

	if potion_spread then
		local num_players = #PLAYER_AND_BOT_UNITS
		local owner_player_position = POSITION_LOOKUP[owner_unit]

		for i = 1, num_players, 1 do
			local other_player_unit = PLAYER_AND_BOT_UNITS[i]

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

	if buff_extension:has_buff_perk("potion_duration") then
		buff_template = buff_template .. "_increased"
	end

	local num_targets = #targets
	local network_manager = Managers.state.network
	local buff_template_name_id = NetworkLookup.buff_templates[buff_template]
	local owner_unit_id = network_manager:unit_game_object_id(owner_unit)

	if not buff_extension:has_buff_type("trait_ring_all_potions") then
		for i = 1, num_targets, 1 do
			local target_unit = targets[i]
			local unit_object_id = network_manager:unit_game_object_id(target_unit)
			local target_unit_buff_extension = ScriptUnit.extension(target_unit, "buff_system")

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

		for i = 1, #additional_potion_buffs, 1 do
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
		local _, procced = buff_extension:apply_buffs_to_value(0, StatBuffIndex.NOT_CONSUME_POTION)

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

	local player = Managers.player:unit_owner(owner_unit)
	local position = POSITION_LOOKUP[owner_unit]

	Managers.telemetry.events:player_used_item(player, self.item_name, position)
end

return
