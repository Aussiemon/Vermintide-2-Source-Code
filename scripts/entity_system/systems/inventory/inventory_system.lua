require("scripts/unit_extensions/default_player_unit/inventory/simple_inventory_extension")
require("scripts/unit_extensions/default_player_unit/inventory/simple_husk_inventory_extension")

InventorySystem = class(InventorySystem, ExtensionSystemBase)
local RPCS = {
	"rpc_show_inventory",
	"rpc_play_simple_particle_with_vector_variable",
	"rpc_add_equipment",
	"rpc_give_equipment",
	"rpc_add_equipment_limited_item",
	"rpc_wield_equipment",
	"rpc_destroy_slot",
	"rpc_add_equipment_buffs",
	"rpc_add_no_wield_required_equipment_buffs",
	"rpc_add_inventory_slot_item",
	"rpc_start_weapon_fx",
	"rpc_stop_weapon_fx",
	"rpc_update_additional_slot"
}
local extensions = {
	"SimpleHuskInventoryExtension",
	"SimpleInventoryExtension"
}

InventorySystem.init = function (self, entity_system_creation_context, system_name)
	InventorySystem.super.init(self, entity_system_creation_context, system_name, extensions)

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	self.world = entity_system_creation_context.world
	self.player_manager = entity_system_creation_context.player_manager
	self.profile_synchronizer = entity_system_creation_context.profile_synchronizer
	self.num_grimoires = 0
	self.num_side_objectives = 0
	local sides_to_update = {}
	local sides = Managers.state.side:sides()
	local j = 1

	for i = 1, #sides do
		local side = sides[i]

		if side.using_grims_and_tomes then
			sides_to_update[j] = side
			j = j + 1
		end
	end

	self.sides_to_update = sides_to_update
end

local function add_grimoire()
	local mission_system = Managers.state.entity:system("mission_system")
	local buff_system = Managers.state.entity:system("buff_system")
	local mission_name = "grimoire_hidden_mission"

	mission_system:request_mission(mission_name)
	mission_system:update_mission(mission_name, true, nil, true)

	local group_buff_name_id = NetworkLookup.group_buff_templates.grimoire

	buff_system:rpc_add_group_buff(nil, group_buff_name_id, 1)
end

local function remove_grimoire()
	local mission_system = Managers.state.entity:system("mission_system")
	local buff_system = Managers.state.entity:system("buff_system")
	local mission_name = "grimoire_hidden_mission"

	mission_system:update_mission(mission_name, false, nil, true)

	local group_buff_name_id = NetworkLookup.group_buff_templates.grimoire

	buff_system:rpc_remove_group_buff(nil, group_buff_name_id, 1)
end

local function add_side_objective()
	local mission_system = Managers.state.entity:system("mission_system")
	local mission_name = "tome_bonus_mission"

	mission_system:request_mission(mission_name)
	mission_system:update_mission(mission_name, true, nil, true)
end

local function remove_side_objective()
	local mission_system = Managers.state.entity:system("mission_system")
	local mission_name = "tome_bonus_mission"

	mission_system:update_mission(mission_name, false, nil, true)
end

InventorySystem.update = function (self, context, t)
	InventorySystem.super.update(self, context, t)

	if self.is_server then
		local event_objective = self._event_objective
		local sides = self.sides_to_update

		for i = 1, #sides do
			local side = sides[i]
			local units = side.PLAYER_AND_BOT_UNITS
			self.num_grimoires = self:update_mission_inventory_item(units, "slot_potion", "wpn_grimoire_01", self.num_grimoires, add_grimoire, remove_grimoire)
			self.num_side_objectives = self:update_mission_inventory_item(units, "slot_healthkit", "wpn_side_objective_tome_01", self.num_side_objectives, add_side_objective, remove_side_objective)

			if event_objective then
				self.num_event_objectives = self:update_mission_inventory_item(units, "slot_potion", event_objective, self.num_event_objectives, self._add_event_objective, self._remove_event_objective)
			end
		end
	end
end

InventorySystem.update_mission_inventory_item = function (self, units, slot_name, item_name, previous_num_items, add_func, remove_func)
	local num_items = 0

	for i = 1, #units do
		local unit = units[i]
		local inventory_extension = ScriptUnit.extension(unit, "inventory_system")

		if inventory_extension:has_inventory_item(slot_name, item_name) then
			num_items = num_items + 1
		end
	end

	if previous_num_items < num_items then
		local difference = num_items - previous_num_items

		for i = 1, difference do
			add_func()
		end
	elseif num_items < previous_num_items then
		local difference = previous_num_items - num_items

		for i = 1, difference do
			remove_func()
		end
	end

	return num_items
end

InventorySystem.destroy = function (self)
	self.network_event_delegate:unregister(self)
end

InventorySystem.register_event_objective = function (self, objective_name, add_func, remove_func)
	self.num_event_objectives = 0
	self._event_objective = objective_name
	self._add_event_objective = add_func
	self._remove_event_objective = remove_func
end

InventorySystem.rpc_show_inventory = function (self, channel_id, unit_id, show_inventory)
	local unit = self.unit_storage:unit(unit_id)

	if not unit or not ALIVE[unit] then
		return
	end

	local inventory_extension = ScriptUnit.extension(unit, "inventory_system")

	inventory_extension:show_third_person_inventory(show_inventory)

	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		Managers.state.network.network_transmit:send_rpc_clients_except("rpc_show_inventory", peer_id, unit_id, show_inventory)
	end
end

InventorySystem.rpc_play_simple_particle_with_vector_variable = function (self, channel_id, effect_id, position, variable_id, variable_value)
	if self.is_server then
		self.network_transmit:send_rpc_clients("rpc_play_simple_particle_with_vector_variable", effect_id, position, variable_id, variable_value)
	end

	local world = self.world
	local effect_name = NetworkLookup.effects[effect_id]
	local variable_name = NetworkLookup.effects[variable_id]
	local effect_id = World.create_particles(world, effect_name, position)
	local effect_variable_id = World.find_particles_variable(world, effect_name, variable_name)

	World.set_particles_variable(world, effect_id, effect_variable_id, variable_value)
end

InventorySystem.rpc_destroy_slot = function (self, channel_id, go_id, slot_id)
	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_destroy_slot", peer_id, go_id, slot_id)
	end

	local unit = self.unit_storage:unit(go_id)
	local slot_name = NetworkLookup.equipment_slots[slot_id]
	local inventory = ScriptUnit.extension(unit, "inventory_system")

	inventory:destroy_slot(slot_name)
end

InventorySystem.rpc_give_equipment = function (self, channel_id, interactor_game_object_id, game_object_id, slot_id, item_name_id, position)
	local unit = self.unit_storage:unit(game_object_id)
	local failed = false

	if Unit.alive(unit) and not ScriptUnit.extension(unit, "status_system"):is_dead() then
		local owner = Managers.player:owner(unit)

		if not owner.remote then
			local inventory = ScriptUnit.extension(unit, "inventory_system")
			local slot_name = NetworkLookup.equipment_slots[slot_id]
			local slot_full = inventory:get_slot_data(slot_name)
			local can_store = slot_full and inventory:can_store_additional_item(slot_name)

			if slot_full and not can_store then
				failed = true
			else
				local item_name = NetworkLookup.item_names[item_name_id]
				local item_data = ItemMasterList[item_name]

				if slot_full then
					inventory:store_additional_item(slot_name, item_data)
				else
					inventory:add_equipment(slot_name, item_data)

					if not LEVEL_EDITOR_TEST then
						local weapon_skin_id = NetworkLookup.weapon_skins["n/a"]

						if self.is_server then
							self.network_transmit:send_rpc_clients("rpc_add_equipment", game_object_id, slot_id, item_name_id, weapon_skin_id)
						else
							self.network_transmit:send_rpc_server("rpc_add_equipment", game_object_id, slot_id, item_name_id, weapon_skin_id)
						end
					end
				end

				local pickup_name = BackendUtils.get_item_template(item_data).pickup_data.pickup_name
				local pickup_settings = AllPickups[pickup_name]
				local wwise_world = Managers.world:wwise_world(self.world)
				local sound_event = pickup_settings.pickup_sound_event
				local interactor_unit = self.unit_storage:unit(interactor_game_object_id)
				local interactor_player = interactor_unit and Managers.player:owner(interactor_unit)

				if not owner.bot_player and interactor_player and not interactor_player.local_player then
					if sound_event then
						WwiseWorld.trigger_event(wwise_world, sound_event)
					end

					local peer_id = CHANNEL_TO_PEER_ID[channel_id]

					Managers.state.event:trigger("give_item_feedback", peer_id .. item_name, interactor_player, item_name)
				end
			end
		else
			assert(self.is_server, "rpc_give_equipment sent to non-owner non-server, should not happen")
			self.network_transmit:send_rpc("rpc_give_equipment", owner:network_id(), interactor_game_object_id, game_object_id, slot_id, item_name_id, position)
		end
	else
		failed = true
	end

	if failed then
		local item_name = NetworkLookup.item_names[item_name_id]
		local item_data = ItemMasterList[item_name]
		local pickup_name = BackendUtils.get_item_template(item_data).pickup_data.pickup_name
		local pickup_name_id = NetworkLookup.pickup_names[pickup_name]
		local pickup_spawn_type_id = NetworkLookup.pickup_spawn_types.dropped

		if self.is_server then
			self.entity_manager:system("pickup_system"):rpc_spawn_pickup_with_physics(Network.peer_id(), pickup_name_id, position, Quaternion.identity(), pickup_spawn_type_id)
		else
			self.network_transmit:send_rpc_server("rpc_spawn_pickup_with_physics", pickup_name_id, position, Quaternion.identity(), pickup_spawn_type_id)
		end
	end
end

InventorySystem.rpc_add_equipment = function (self, channel_id, go_id, slot_id, item_name_id, weapon_skin_id)
	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_add_equipment", peer_id, go_id, slot_id, item_name_id, weapon_skin_id)
	end

	local unit = self.unit_storage:unit(go_id)

	if unit == nil or not ALIVE[unit] then
		return
	end

	local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")

	if inventory_extension then
		local slot_name = NetworkLookup.equipment_slots[slot_id]
		local item_name = NetworkLookup.item_names[item_name_id]
		local skin_name = NetworkLookup.weapon_skins[weapon_skin_id]

		if skin_name == "n/a" then
			skin_name = nil
		end

		inventory_extension:add_equipment(slot_name, item_name, skin_name)
	end
end

InventorySystem.rpc_add_inventory_slot_item = function (self, channel_id, go_id, slot_id, item_name_id, weapon_skin_id)
	local unit = self.unit_storage:unit(go_id)

	if unit == nil or not ALIVE[unit] then
		return
	end

	local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")

	if inventory_extension then
		local slot_name = NetworkLookup.equipment_slots[slot_id]
		local item_name = NetworkLookup.item_names[item_name_id]
		local item_data = ItemMasterList[item_name]

		inventory_extension:destroy_slot(slot_name)
		inventory_extension:add_equipment(slot_name, item_data)

		local wielded_slot_name = inventory_extension:get_wielded_slot_name()

		if wielded_slot_name == slot_name then
			CharacterStateHelper.stop_weapon_actions(inventory_extension, "picked_up_object")
			inventory_extension:wield(slot_name)
		end

		if self.is_server then
			self.network_transmit:send_rpc_clients("rpc_add_equipment", go_id, slot_id, item_name_id, weapon_skin_id)
		else
			self.network_transmit:send_rpc_server("rpc_add_equipment", go_id, slot_id, item_name_id, weapon_skin_id)
		end
	end
end

InventorySystem.rpc_add_equipment_buffs = function (self, channel_id, go_id, slot_id, num_buffs, buff_ids, buff_value_type_ids, buff_values)
	fassert(self.is_server, "attempting to add buffs as a client VIA rpc_add_equipment_buffs")

	local unit = self.unit_storage:unit(go_id)
	local slot_name = NetworkLookup.equipment_slots[slot_id]
	local buffs = BuffUtils.buffs_from_rpc_params(num_buffs, buff_ids, buff_value_type_ids, buff_values)
	local inventory = ScriptUnit.extension(unit, "inventory_system")
	local reason = "wield"

	inventory:set_buffs_to_slot(reason, slot_name, buffs)
end

InventorySystem.rpc_add_no_wield_required_equipment_buffs = function (self, sender, go_id, slot_id, num_buffs, buff_ids, buff_value_type_ids, buff_values)
	fassert(self.is_server, "attempting to add buffs as a client VIA rpc_add_no_wield_required_equipment_buffs")

	local unit = self.unit_storage:unit(go_id)
	local slot_name = NetworkLookup.equipment_slots[slot_id]
	local buffs = BuffUtils.buffs_from_rpc_params(num_buffs, buff_ids, buff_value_type_ids, buff_values)
	local inventory = ScriptUnit.extension(unit, "inventory_system")
	local reason = "equip"

	inventory:set_buffs_to_slot(reason, slot_name, buffs)
end

InventorySystem.rpc_add_equipment_limited_item = function (self, channel_id, go_id, slot_id, item_name_id, spawner_unit_id, limited_item_id)
	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_add_equipment_limited_item", peer_id, go_id, slot_id, item_name_id, spawner_unit_id, limited_item_id)
	end

	local unit = self.unit_storage:unit(go_id)
	local slot_name = NetworkLookup.equipment_slots[slot_id]
	local item_name = NetworkLookup.item_names[item_name_id]
	local spawner_unit = Managers.state.network:game_object_or_level_unit(spawner_unit_id, true)
	local inventory = ScriptUnit.extension(unit, "inventory_system")

	inventory:add_equipment_limited_item(slot_name, item_name, spawner_unit, limited_item_id)
end

InventorySystem.rpc_wield_equipment = function (self, channel_id, go_id, slot_id)
	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_wield_equipment", peer_id, go_id, slot_id)
	end

	local unit = self.unit_storage:unit(go_id)
	local slot_name = NetworkLookup.equipment_slots[slot_id]
	local inventory = ScriptUnit.extension(unit, "inventory_system")

	inventory:wield(slot_name)
end

InventorySystem.rpc_start_weapon_fx = function (self, channel_id, go_id, item_name_id, fx_id)
	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_start_weapon_fx", peer_id, go_id, item_name_id, fx_id)
	end

	local item_name = NetworkLookup.item_names[item_name_id]
	local unit = self.unit_storage:unit(go_id)
	local inventory = ScriptUnit.extension(unit, "inventory_system")
	local wielded_slot_data = inventory:get_wielded_slot_data()
	local wielded_item_data = wielded_slot_data and wielded_slot_data.item_data
	local wielded_item_name = wielded_item_data and wielded_item_data.name

	if item_name and item_name == wielded_item_name then
		local item_data = ItemMasterList[item_name]
		local item_template = BackendUtils.get_item_template(item_data)
		local fx_name = item_template.particle_fx_lookup[fx_id]

		inventory:start_weapon_fx(fx_name, false)
	end
end

InventorySystem.rpc_stop_weapon_fx = function (self, channel_id, go_id, item_name_id, fx_id)
	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_stop_weapon_fx", peer_id, go_id, item_name_id, fx_id)
	end

	local item_name = NetworkLookup.item_names[item_name_id]
	local unit = self.unit_storage:unit(go_id)
	local inventory = ScriptUnit.extension(unit, "inventory_system")
	local wielded_slot_data = inventory:get_wielded_slot_data()
	local wielded_item_data = wielded_slot_data and wielded_slot_data.item_data
	local wielded_item_name = wielded_item_data and wielded_item_data.name

	if item_name and item_name == wielded_item_name then
		local item_data = ItemMasterList[item_name]
		local item_template = BackendUtils.get_item_template(item_data)
		local fx_name = item_template.particle_fx_lookup[fx_id]

		inventory:stop_weapon_fx(fx_name, false)
	end
end

InventorySystem.rpc_update_additional_slot = function (self, channel_id, go_id, slot_id, items)
	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_update_additional_slot", peer_id, go_id, slot_id, items)
	end

	local looked_up_items = {}

	for i = 1, #items do
		local item = items[i]
		looked_up_items[#looked_up_items + 1] = NetworkLookup.item_names[item]
	end

	local unit = self.unit_storage:unit(go_id)
	local inventory = ScriptUnit.extension(unit, "inventory_system")
	local slot_name = NetworkLookup.equipment_slots[slot_id]

	inventory:update_additional_items(slot_name, looked_up_items)
end
