ActionPotion = class(ActionPotion)
ActionPotion.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	self.owner_unit = owner_unit
	self.weapon_unit = weapon_unit
	self.is_server = is_server
	self.world = world
	self.item_name = item_name

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end

	return 
end
ActionPotion.client_owner_start_action = function (self, new_action, t)
	self.current_action = new_action

	return 
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
	local potion_spread = buff_extension.has_buff_type(buff_extension, "trait_trinket_potion_spread")
	local targets = {}

	if potion_spread then
		local num_player_units = 2

		for i = 1, num_player_units, 1 do
			local player_unit = player_and_bot_units[i]
			local other_player_position = POSITION_LOOKUP[player_unit]
			local local_player_position = POSITION_LOOKUP[owner_unit]

			if Vector3.distance(local_player_position, other_player_position) < TrinketSpreadDistance then
				targets[#targets + 1] = player_unit
			end
		end
	else
		targets[#targets + 1] = owner_unit
	end

	if buff_extension.has_buff_perk(buff_extension, "potion_duration") then
		buff_template = buff_template .. "_increased"

		print("derp")
	end

	local num_targets = #targets
	local network_manager = Managers.state.network
	local buff_template_name_id = NetworkLookup.buff_templates[buff_template]
	local owner_unit_id = network_manager.unit_game_object_id(network_manager, owner_unit)

	if not buff_extension.has_buff_type(buff_extension, "trait_ring_all_potions") then
		for i = 1, num_targets, 1 do
			local unit = targets[i]
			local unit_object_id = network_manager.unit_game_object_id(network_manager, unit)
			local buff_extension = ScriptUnit.extension(unit, "buff_system")

			if self.is_server then
				buff_extension.add_buff(buff_extension, buff_template)
				network_manager.network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, owner_unit_id, 0, false)
			else
				network_manager.network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, owner_unit_id, 0, true)
			end
		end
	else
		local potion_buffs = {
			"speed_boost_potion_reduced",
			"damage_boost_potion_reduced",
			"cooldown_reduction_potion_reduced"
		}

		for i = 1, #potion_buffs, 1 do
			buff_extension.add_buff(buff_extension, potion_buffs[i])
		end
	end

	if self.ammo_extension then
		local ammo_usage = current_action.ammo_usage
		local _, procced = buff_extension.apply_buffs_to_value(buff_extension, 0, StatBuffIndex.NOT_CONSUME_POTION)

		if not procced then
			self.ammo_extension:use_ammo(ammo_usage)
		else
			local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")

			inventory_extension.wield_previous_weapon(inventory_extension)

			if buff_extension.has_buff_type(buff_extension, "trait_ring_not_consume_potion_damage") then
				DamageUtils.debug_deal_damage(self.owner_unit, "basic_debug_damage_player")
			end
		end
	end

	local player = Managers.player:unit_owner(owner_unit)
	local position = POSITION_LOOKUP[owner_unit]

	Managers.telemetry.events:player_used_item(player, self.item_name, position)

	return 
end

return 
