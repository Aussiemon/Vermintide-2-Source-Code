require("scripts/unit_extensions/default_player_unit/inventory/gear_utils")
require("scripts/managers/backend/backend_utils")

SimpleInventoryExtension = class(SimpleInventoryExtension)
local consumable_slots = {
	"slot_potion",
	"slot_grenade",
	"slot_healthkit"
}

SimpleInventoryExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._world = extension_init_context.world
	self._unit = unit
	self._profile = extension_init_data.profile
	self._profile_index = FindProfileIndex(self._profile.display_name)
	self._attached_units = {}
	self._equipment = {
		slots = {},
		item_data = {}
	}
	local player = extension_init_data.player
	self.is_server = Managers.player.is_server
	self.is_bot = player.bot_player or false
	self.player = player
	self.initial_inventory = extension_init_data.initial_inventory
	self.initial_ammo_percent = extension_init_data.ammo_percent
	self._show_first_person = true
	self._show_third_person = false
	self._show_first_person_lights = true
	self.current_item_buffs = {
		wield = {},
		equip = {
			slot_melee = {},
			slot_ranged = {}
		}
	}
	self._items_to_spawn = {}
	self.resync_ids = {}
	self.recently_acquired_list = {}
	self._loaded_projectile_settings = {}
	self._selected_consumable_slot = nil
	self._previously_wielded_weapon_slot = "slot_melee"
	self._previously_wielded_slot = "slot_melee"
	self._previously_wielded_non_level_slot = "slot_melee"
	self._backend_items = Managers.backend:get_interface("items")
end

SimpleInventoryExtension.get_weapon_unit = function (self)
	local equipment = self._equipment
	local weapon_unit = equipment.left_hand_wielded_unit or equipment.right_hand_wielded_unit

	return weapon_unit
end

SimpleInventoryExtension.get_all_weapon_unit = function (self)
	local equipment = self._equipment

	return equipment.left_hand_wielded_unit, equipment.right_hand_wielded_unit
end

SimpleInventoryExtension.extensions_ready = function (self, world, unit)
	local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
	self.first_person_extension = first_person_extension
	self._first_person_unit = first_person_extension:get_first_person_unit()
	self.buff_extension = ScriptUnit.extension(unit, "buff_system")
	local career_extension = ScriptUnit.extension(unit, "career_system")
	self.career_extension = career_extension
	local talent_extension = ScriptUnit.has_extension(unit, "talent_system")
	self.talent_extension = talent_extension
	local equipment = self._equipment
	local profile = self._profile
	local unit_1p = self._first_person_unit
	local unit_3p = self._unit

	self:add_equipment_by_category("weapon_slots")
	self:add_equipment_by_category("enemy_weapon_slots")

	local weapon_index = (talent_extension and talent_extension:get_talent_weapon_index()) or 1
	self.initial_inventory.slot_career_skill_weapon = career_extension:career_skill_weapon_name(weapon_index)

	self:add_equipment_by_category("career_skill_weapon_slots")
	Unit.set_data(self._first_person_unit, "equipment", self._equipment)

	if profile.default_wielded_slot then
		local default_wielded_slot = profile.default_wielded_slot
		local slot_data = self._equipment.slots[default_wielded_slot]

		if not slot_data then
			table.dump(self._equipment.slots, "self._equipment.slots", 1)
			Application.error("Tried to wield default slot %s for %s that contained no weapon.", default_wielded_slot, career_extension:career_name())
		end

		self:_wield_slot(equipment, slot_data, unit_1p, unit_3p)

		local item_data = slot_data.item_data
		local item_template = BackendUtils.get_item_template(item_data)

		self:_spawn_attached_units(item_template.first_person_attached_units)

		local backend_id = item_data.backend_id
		local buffs = self:_get_property_and_trait_buffs(backend_id)

		self:apply_buffs(buffs, "wield", item_data.name, default_wielded_slot)
	end

	self._equipment.wielded_slot = profile.default_wielded_slot
end

SimpleInventoryExtension.update_career_skill_weapon_slot = function (self, world, unit)
	local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
	self._first_person_unit = first_person_extension:get_first_person_unit()
	local career_extension = self.career_extension
	local talent_extension = self.talent_extension
	local weapon_index = (talent_extension and talent_extension:get_talent_weapon_index()) or 1
	self.initial_inventory.slot_career_skill_weapon = career_extension:career_skill_weapon_name(weapon_index)

	self:add_equipment_by_category("career_skill_weapon_slots")
	Unit.set_data(self._first_person_unit, "equipment", self._equipment)
end

SimpleInventoryExtension.game_object_initialized = function (self, unit, unit_go_id)
	local network_manager = Managers.state.network
	local is_server = self.is_server
	local equipment = self._equipment
	local slots = equipment.slots

	for slot_name, slot_data in pairs(slots) do
		local item_data = slot_data.item_data
		local slot_id = NetworkLookup.equipment_slots[slot_name]
		local item_id = NetworkLookup.item_names[item_data.name]
		local weapon_skin_id = NetworkLookup.weapon_skins[slot_data.skin or "n/a"]

		if is_server then
			network_manager.network_transmit:send_rpc_clients("rpc_add_equipment", unit_go_id, slot_id, item_id, weapon_skin_id)
		else
			network_manager.network_transmit:send_rpc_server("rpc_add_equipment", unit_go_id, slot_id, item_id, weapon_skin_id)

			if slot_name == "slot_ranged" or slot_name == "slot_melee" then
				local backend_id = item_data.backend_id

				self:_send_rpc_add_equipment_buffs(unit_go_id, slot_id, item_id, backend_id)
			end
		end
	end

	local wielded_slot = equipment.wielded_slot
	local slot_id = NetworkLookup.equipment_slots[wielded_slot]

	if is_server then
		network_manager.network_transmit:send_rpc_clients("rpc_wield_equipment", unit_go_id, slot_id)
	else
		network_manager.network_transmit:send_rpc_server("rpc_wield_equipment", unit_go_id, slot_id)
	end

	local blackboard = BLACKBOARDS[unit]
	blackboard.weapon_unit = self:get_weapon_unit()
end

SimpleInventoryExtension._send_rpc_add_equipment_buffs = function (self, unit_go_id, slot_id, item_id, backend_id)
	local buffs = self:_get_property_and_trait_buffs(backend_id)
	local server_buffs = {}
	server_buffs = table.merge(server_buffs, buffs.server)
	server_buffs = table.merge(server_buffs, buffs.both)
	local buff_name_1, buff_variable_data_1, buff_data_type_1, buff_value_1, buff_name_2, buff_variable_data_2, buff_data_type_2, buff_value_2, buff_name_3, buff_variable_data_3, buff_data_type_3, buff_value_3, buff_name_4, buff_variable_data_4, buff_data_type_4, buff_value_4 = nil
	buff_name_1, buff_variable_data_1 = next(server_buffs)

	if buff_name_1 then
		buff_data_type_1, buff_value_1 = next(buff_variable_data_1)
		buff_name_2, buff_variable_data_2 = next(server_buffs, buff_name_1)

		if buff_name_2 then
			buff_data_type_2, buff_value_2 = next(buff_variable_data_2)
			buff_name_3, buff_variable_data_3 = next(server_buffs, buff_name_2)

			if buff_name_3 then
				buff_data_type_3, buff_value_3 = next(buff_variable_data_3)
				buff_name_4, buff_variable_data_4 = next(server_buffs, buff_name_3)

				if buff_name_4 then
					buff_data_type_4, buff_value_4 = next(buff_variable_data_4)
				end
			end
		end
	end

	local default_buff_id = NetworkLookup.buff_templates["n/a"]
	local buff_1_id = (buff_name_1 and NetworkLookup.buff_templates[buff_name_1]) or default_buff_id
	local buff_2_id = (buff_name_2 and NetworkLookup.buff_templates[buff_name_2]) or default_buff_id
	local buff_3_id = (buff_name_3 and NetworkLookup.buff_templates[buff_name_3]) or default_buff_id
	local buff_4_id = (buff_name_4 and NetworkLookup.buff_templates[buff_name_4]) or default_buff_id
	local default_buff_data_type_id = NetworkLookup.buff_data_types["n/a"]
	local buff_data_type_1_id = (buff_name_1 and NetworkLookup.buff_data_types[buff_data_type_1]) or default_buff_data_type_id
	local buff_data_type_2_id = (buff_name_2 and NetworkLookup.buff_data_types[buff_data_type_2]) or default_buff_data_type_id
	local buff_data_type_3_id = (buff_name_3 and NetworkLookup.buff_data_types[buff_data_type_3]) or default_buff_data_type_id
	local buff_data_type_4_id = (buff_name_4 and NetworkLookup.buff_data_types[buff_data_type_4]) or default_buff_data_type_id

	if buff_name_1 then
		local network_manager = Managers.state.network
		local network_transmit = network_manager.network_transmit

		network_transmit:send_rpc_server("rpc_add_equipment_buffs", unit_go_id, slot_id, buff_1_id, buff_data_type_1_id, buff_value_1 or 1, buff_2_id, buff_data_type_2_id, buff_value_2 or 1, buff_3_id, buff_data_type_3_id, buff_value_3 or 1, buff_4_id, buff_data_type_4_id, buff_value_4 or 1)
	end
end

SimpleInventoryExtension._override_career_skill_item_template = function (self, item_data)
	local override_item_template = nil
	local slot_to_use = item_data.slot_to_use

	if slot_to_use then
		local equipment = self._equipment
		local slots = equipment.slots
		local override_slot_data = slots[slot_to_use]
		local slot_override_item_template = override_slot_data.item_template
		local item_template = BackendUtils.get_item_template(item_data)
		item_template.left_hand_attachment_node_linking = slot_override_item_template.left_hand_attachment_node_linking
		item_template.right_hand_attachment_node_linking = slot_override_item_template.right_hand_attachment_node_linking
		item_template.wield_anim = slot_override_item_template.wield_anim
		item_template.wield_anim_no_ammo = slot_override_item_template.wield_anim_no_ammo
		override_item_template = item_template
	end

	return override_item_template
end

SimpleInventoryExtension.add_equipment_by_category = function (self, category)
	local career_name = self.career_extension:career_name()
	local category_slots = InventorySettings[category]
	local num_slots = #category_slots

	for i = 1, num_slots, 1 do
		repeat
			local slot = category_slots[i]
			local slot_name = slot.name
			local item = BackendUtils.get_loadout_item(career_name, slot_name)
			local item_data = nil

			if item then
				item_data = table.clone(item.data)
				item_data.backend_id = item.backend_id
			else
				local item_name = self.initial_inventory[slot_name]
				item_data = rawget(ItemMasterList, item_name)

				if not item_data then
					break
				end
			end

			if item_data.slot_to_use then
				local override_slot_data = self._equipment.slots[item_data.slot_to_use]
				local override_item_data = override_slot_data.item_data
				item_data.left_hand_unit = override_item_data.left_hand_unit
				item_data.right_hand_unit = override_item_data.right_hand_unit
			end

			self:add_equipment(slot_name, item_data, nil, nil, self.initial_ammo_percent[slot_name])
		until true
	end
end

SimpleInventoryExtension.destroy = function (self)
	for slot_id, slot_data in pairs(self._equipment.slots) do
		GearUtils.destroy_slot(self._world, self._unit, slot_data, self._equipment, true)
	end

	self:_despawn_attached_units()
end

SimpleInventoryExtension._unlink_unit = function (self, unit, reason, attachment_node_linking)
	World.unlink_unit(self._world, unit)

	local node_linking_data = attachment_node_linking.wielded or attachment_node_linking

	for i, attachment_nodes in ipairs(node_linking_data) do
		local target_node = attachment_nodes.target

		if target_node ~= 0 then
			local target_node_index = (type(target_node) == "string" and Unit.node(unit, target_node)) or target_node
			local parent = Unit.scene_graph_parent(unit, target_node_index)

			Unit.scene_graph_link(unit, target_node_index, 0)
		end
	end

	Unit.set_flow_variable(unit, "lua_drop_reason", reason)
	Unit.set_shader_pass_flag_for_meshes_in_unit_and_childs(unit, "outline_unit", false)
	Unit.flow_event(unit, "lua_dropped")

	local actor = Unit.create_actor(unit, "rp_dropped")

	Actor.add_angular_velocity(actor, Vector3(math.random(), math.random(), math.random()) * 40)
	Actor.add_velocity(actor, Vector3(2 * math.random() - 0.5, 2 * math.random() - 0.5, 4.5))
end

SimpleInventoryExtension.drop_equipped_weapons = function (self, reason, unit)
	return
end

SimpleInventoryExtension.equipment = function (self)
	return self._equipment
end

SimpleInventoryExtension.update = function (self, unit, input, dt, context, t)
	self:_update_selected_consumable_slot()
	self:_update_loaded_projectile_settings()
	self:_update_resync_loadout()

	local current_ammo, max_ammo = self:current_ammo_status("slot_ranged")
	local ammo_percentage = 1

	if current_ammo and max_ammo then
		ammo_percentage = current_ammo / max_ammo
	end

	local network_manager = Managers.state.network
	local game = network_manager:game()
	local go_id = Managers.state.unit_storage:go_id(unit)
	ammo_percentage = math.min(1, ammo_percentage)

	GameSession.set_game_object_field(game, go_id, "ammo_percentage", ammo_percentage)
end

SimpleInventoryExtension.recently_acquired = function (self, slot_name)
	local slot_data = self.recently_acquired_list[slot_name]
	self.recently_acquired_list[slot_name] = nil

	return slot_data
end

SimpleInventoryExtension._update_resync_loadout = function (self)
	local _, equipment_to_spawn = next(self._items_to_spawn)

	if not equipment_to_spawn then
		return
	end

	if self.resync_loadout_needed then
		for _, resynced_equipment_to_spawn in ipairs(self._items_to_spawn) do
			self.resync_ids[#self.resync_ids + 1] = self:_resync_loadout(resynced_equipment_to_spawn)
		end

		self.resync_loadout_needed = false
		self._is_resyncing_loadout = true
	end

	local _, resync_id = next(self.resync_ids)

	if resync_id and self:all_clients_loaded_resource(resync_id) then
		self:_spawn_resynced_loadout(equipment_to_spawn)
		table.remove(self._items_to_spawn, 1)
		table.remove(self.resync_ids, 1)
	end

	if #self.resync_ids == 0 then
		self._is_resyncing_loadout = nil
	end
end

SimpleInventoryExtension.can_wield = function (self)
	local equipment = self._equipment
	local current_wielded_slot = self._equipment.wielded_slot
	local slot_data = equipment.slots[current_wielded_slot]
	local item_data = slot_data.item_data
	local item_template = BackendUtils.get_item_template(item_data)
	local can_wield = true

	if item_template.block_wielding then
		can_wield = false
	end

	return can_wield
end

SimpleInventoryExtension.wield_previous_weapon = function (self)
	local slot_name = self._previously_wielded_weapon_slot

	self:wield(slot_name)
end

SimpleInventoryExtension.wield_previous_slot = function (self)
	local slot_name = self._previously_wielded_slot

	self:wield(slot_name)
end

SimpleInventoryExtension.wield_previous_non_level_slot = function (self)
	local slot_name = self._previously_wielded_non_level_slot

	self:wield(slot_name)
end

SimpleInventoryExtension.rewield_wielded_slot = function (self)
	local equipment = self._equipment
	local wielded_slot = equipment.wielded_slot

	self:wield(wielded_slot)
end

SimpleInventoryExtension.wield = function (self, slot_name)
	local equipment = self._equipment
	local slot_data = equipment.slots[slot_name]

	if slot_data == nil then
		return
	end

	if equipment.wielded_slot ~= slot_name then
		self.buff_extension:trigger_procs("on_unwield")
	end

	self:_despawn_attached_units()

	local item_data = slot_data.item_data
	local item_template = BackendUtils.get_item_template(item_data)
	local wielded_weapon = self:_wield_slot(equipment, slot_data, self._first_person_unit, self._unit)
	equipment.wielded_slot = slot_name
	local career_extension = self.career_extension

	CharacterStateHelper.stop_weapon_actions(self, "weapon_wielded")
	CharacterStateHelper.stop_career_abilities(career_extension, "weapon_wielded")

	local backend_id = item_data.backend_id
	local buffs = self:_get_property_and_trait_buffs(backend_id)

	if item_template.buffs then
		for buff_name, buff_data in pairs(item_template.buffs) do
			buffs.client[buff_name] = buff_data
		end
	end

	self:apply_buffs(buffs, "wield", item_data.name, slot_name)

	if wielded_weapon then
		self:show_first_person_inventory(self._show_first_person)
		self:show_first_person_inventory_lights(self._show_first_person_lights)
		self:show_third_person_inventory(self._show_third_person)
	end

	local network_manager = Managers.state.network
	local game_session = network_manager:game()
	local slot_id = NetworkLookup.equipment_slots[slot_name]
	local go_id = Managers.state.unit_storage:go_id(self._unit)

	if game_session and not LEVEL_EDITOR_TEST then
		if self.is_server then
			network_manager.network_transmit:send_rpc_clients("rpc_wield_equipment", go_id, slot_id)
		else
			network_manager.network_transmit:send_rpc_server("rpc_wield_equipment", go_id, slot_id)
		end
	end

	self:_spawn_attached_units(item_template.first_person_attached_units)

	if slot_name == "slot_melee" or slot_name == "slot_ranged" then
		self._previously_wielded_weapon_slot = slot_name
	end

	if slot_name == "slot_melee" or slot_name == "slot_ranged" or slot_name == "slot_grenade" or slot_name == "slot_healthkit" or slot_name == "slot_potion" or slot_name == "slot_level_event" then
		self._previously_wielded_slot = slot_name
	end

	if slot_name == "slot_melee" or slot_name == "slot_ranged" or slot_name == "slot_grenade" or slot_name == "slot_healthkit" or slot_name == "slot_potion" then
		self._previously_wielded_non_level_slot = slot_name
	end
end

SimpleInventoryExtension._despawn_attached_units = function (self)
	local attached_units = self._attached_units

	for index, attached_unit in pairs(attached_units) do
		Managers.state.unit_spawner:mark_for_deletion(attached_unit)

		attached_units[index] = nil
	end
end

SimpleInventoryExtension._spawn_attached_units = function (self, attached_units)
	if attached_units == nil then
		return
	end

	local unit = self._unit
	local world = self._world
	local own_attached_units = self._attached_units

	for index, attached_unit in pairs(attached_units) do
		local spawned_unit = AttachmentUtils.create_weapon_visual_attachment(world, unit, attached_unit.unit, attached_unit.attachment_node_linking)
		own_attached_units[index] = spawned_unit
	end
end

local params = {}

SimpleInventoryExtension.apply_buffs = function (self, buffs_by_buffer, reason, item_name, slot_name)
	local buff_extension = self.buff_extension
	local current_item_buffs = self.current_item_buffs[reason]

	if reason == "wield" then
		for i = 1, #current_item_buffs, 1 do
			local buff_id = current_item_buffs[i]

			buff_extension:remove_buff(buff_id)
		end

		table.clear(current_item_buffs)
	elseif reason == "equip" then
		current_item_buffs = current_item_buffs[slot_name]

		if current_item_buffs then
			for i = 1, #current_item_buffs, 1 do
				local buff_id = current_item_buffs[i]

				buff_extension:remove_buff(buff_id)
			end

			table.clear(current_item_buffs)
		end
	end

	local index = 1

	for buffer, buffs in pairs(buffs_by_buffer) do
		if self.is_server or buffer == "client" or buffer == "both" then
			for buff_name, variable_data in pairs(buffs) do
				local buff_data = BuffTemplates[buff_name]

				fassert(buff_data, "buff name %s does not exist on item %s, typo?", buff_name, item_name)
				table.clear(params)

				for data_type, data_value in pairs(variable_data) do
					params[data_type] = data_value
				end

				current_item_buffs[index] = buff_extension:add_buff(buff_name, params)
				index = index + 1
			end
		end
	end
end

SimpleInventoryExtension.has_inventory_item = function (self, slot_name, item_name)
	local slot_data = self:get_slot_data(slot_name)

	if slot_data then
		local item_data = slot_data.item_data
		local name = item_data.name

		return name == item_name
	end

	return false
end

SimpleInventoryExtension.add_equipment = function (self, slot_name, item_data, unit_template, extra_extension_data, ammo_percent)
	local world = self._world
	local equipment = self._equipment
	local unit_1p = self._first_person_unit
	local unit_3p = self._unit
	local is_bot = self.is_bot
	local override_item_units = nil
	local override_item_template = self:_override_career_skill_item_template(item_data)

	if item_data.slot_to_use then
		local other_slot_slot_data = self._equipment.slots[item_data.slot_to_use]
		override_item_units = BackendUtils.get_item_units(item_data)
		local other_slot_item_units = BackendUtils.get_item_units(other_slot_slot_data.item_data)

		for key, _ in pairs(item_data.item_units_to_replace) do
			if other_slot_item_units[key] then
				override_item_units[key] = other_slot_item_units[key]
			end
		end
	end

	local slot_equipment_data = GearUtils.create_equipment(world, slot_name, item_data, unit_1p, unit_3p, is_bot, unit_template, extra_extension_data, ammo_percent, override_item_template, override_item_units)
	slot_equipment_data.master_item = item_data
	equipment.slots[slot_name] = slot_equipment_data
	self.recently_acquired_list[slot_name] = slot_equipment_data

	CosmeticUtils.update_cosmetic_slot(self.player, slot_name, item_data.name, slot_equipment_data.skin)
end

SimpleInventoryExtension.show_first_person_inventory_lights = function (self, show)
	self._show_first_person_lights = show
	local right_hand_wielded_unit = self._equipment.right_hand_wielded_unit

	if right_hand_wielded_unit and Unit.alive(right_hand_wielded_unit) and Unit.has_visibility_group(right_hand_wielded_unit, "normal") then
		local num_lights = Unit.num_lights(right_hand_wielded_unit)

		for i = 1, num_lights, 1 do
			Light.set_enabled(Unit.light(right_hand_wielded_unit, i - 1), show)
		end
	end

	local left_hand_wielded_unit = self._equipment.left_hand_wielded_unit

	if left_hand_wielded_unit and Unit.alive(left_hand_wielded_unit) and Unit.has_visibility_group(left_hand_wielded_unit, "normal") then
		local num_lights = Unit.num_lights(left_hand_wielded_unit)

		for i = 1, num_lights, 1 do
			Light.set_enabled(Unit.light(left_hand_wielded_unit, i - 1), show)
		end
	end
end

SimpleInventoryExtension.show_first_person_inventory = function (self, show)
	self._show_first_person = show
	local right_hand_wielded_unit = self._equipment.right_hand_wielded_unit

	if right_hand_wielded_unit and Unit.alive(right_hand_wielded_unit) then
		if Unit.has_visibility_group(right_hand_wielded_unit, "normal") then
			Unit.set_visibility(right_hand_wielded_unit, "normal", show)
		else
			Unit.set_unit_visibility(right_hand_wielded_unit, show)
		end

		if show then
			Unit.flow_event(right_hand_wielded_unit, "lua_wield")
		else
			Unit.flow_event(right_hand_wielded_unit, "lua_unwield")
		end
	end

	local left_hand_wielded_unit = self._equipment.left_hand_wielded_unit

	if left_hand_wielded_unit and Unit.alive(left_hand_wielded_unit) then
		if Unit.has_visibility_group(left_hand_wielded_unit, "normal") then
			Unit.set_visibility(left_hand_wielded_unit, "normal", show)
		else
			Unit.set_unit_visibility(left_hand_wielded_unit, show)
		end

		if show then
			Unit.flow_event(left_hand_wielded_unit, "lua_wield")
		else
			Unit.flow_event(left_hand_wielded_unit, "lua_unwield")
		end
	end

	self:show_first_person_ammo(show)
	self:_despawn_attached_units()

	local equipment = self._equipment
	local current_wielded_slot = equipment.wielded_slot

	if current_wielded_slot then
		local slot_data = equipment.slots[current_wielded_slot]

		if slot_data then
			local item_data = slot_data.item_data
			local item_template = BackendUtils.get_item_template(item_data)

			if show then
				self:_spawn_attached_units(item_template.first_person_attached_units)
			else
				self:_spawn_attached_units(item_template.third_person_attached_units)
			end
		end
	end

	if show then
		Unit.flow_event(self._first_person_unit, "lua_wield")
	else
		Unit.flow_event(self._first_person_unit, "lua_unwield")
	end
end

SimpleInventoryExtension.show_first_person_ammo = function (self, show)
	local equipment = self._equipment
	local right_hand_wielded_unit = equipment.right_hand_wielded_unit
	local left_hand_wielded_unit = equipment.left_hand_wielded_unit

	if right_hand_wielded_unit and Unit.alive(right_hand_wielded_unit) then
		local right_hand_ammo_unit_1p = equipment.right_hand_ammo_unit_1p

		if right_hand_ammo_unit_1p then
			Unit.set_unit_visibility(right_hand_ammo_unit_1p, show)

			if show then
				Unit.flow_event(right_hand_ammo_unit_1p, "lua_wield")
			else
				Unit.flow_event(right_hand_ammo_unit_1p, "lua_unwield")
			end
		end
	end

	if left_hand_wielded_unit and Unit.alive(left_hand_wielded_unit) then
		local left_hand_ammo_unit_1p = equipment.left_hand_ammo_unit_1p

		if left_hand_ammo_unit_1p then
			Unit.set_unit_visibility(left_hand_ammo_unit_1p, show)

			if show then
				Unit.flow_event(left_hand_ammo_unit_1p, "lua_wield")
			else
				Unit.flow_event(left_hand_ammo_unit_1p, "lua_unwield")
			end
		end
	end
end

SimpleInventoryExtension.show_third_person_inventory = function (self, show)
	self._show_third_person = show
	local right_hand_wielded_unit = self._equipment.right_hand_wielded_unit_3p

	if right_hand_wielded_unit then
		if Unit.has_visibility_group(right_hand_wielded_unit, "normal") then
			Unit.set_visibility(right_hand_wielded_unit, "normal", show)
		else
			Unit.set_unit_visibility(right_hand_wielded_unit, show)
		end

		local right_hand_ammo_unit_3p = self._equipment.right_hand_ammo_unit_3p

		if right_hand_ammo_unit_3p then
			Unit.set_unit_visibility(right_hand_ammo_unit_3p, show)
		end

		if show then
			Unit.flow_event(right_hand_wielded_unit, "lua_wield")

			if right_hand_ammo_unit_3p then
				Unit.flow_event(right_hand_ammo_unit_3p, "lua_wield")
			end
		else
			Unit.flow_event(right_hand_wielded_unit, "lua_unwield")

			if right_hand_ammo_unit_3p then
				Unit.flow_event(right_hand_ammo_unit_3p, "lua_unwield")
			end
		end
	end

	local left_hand_wielded_unit = self._equipment.left_hand_wielded_unit_3p

	if left_hand_wielded_unit then
		if Unit.has_visibility_group(left_hand_wielded_unit, "normal") then
			Unit.set_visibility(left_hand_wielded_unit, "normal", show)
		else
			Unit.set_unit_visibility(left_hand_wielded_unit, show)
		end

		local left_hand_ammo_unit_3p = self._equipment.left_hand_ammo_unit_3p

		if left_hand_ammo_unit_3p then
			Unit.set_unit_visibility(left_hand_ammo_unit_3p, show)
		end

		if show then
			Unit.flow_event(left_hand_wielded_unit, "lua_wield")

			if left_hand_ammo_unit_3p then
				Unit.flow_event(left_hand_ammo_unit_3p, "lua_wield")
			end
		else
			Unit.flow_event(left_hand_wielded_unit, "lua_unwield")

			if left_hand_ammo_unit_3p then
				Unit.flow_event(left_hand_ammo_unit_3p, "lua_unwield")
			end
		end
	end

	self:_despawn_attached_units()

	local equipment = self._equipment
	local current_wielded_slot = self._equipment.wielded_slot

	if current_wielded_slot then
		local slot_data = equipment.slots[current_wielded_slot]

		if slot_data then
			local item_data = slot_data.item_data
			local item_template = BackendUtils.get_item_template(item_data)

			if show then
				self:_spawn_attached_units(item_template.third_person_attached_units)
			else
				self:_spawn_attached_units(item_template.first_person_attached_units)
			end
		end
	end
end

SimpleInventoryExtension.is_showing_third_person_inventory = function (self)
	return self._show_third_person
end

SimpleInventoryExtension.hot_join_sync = function (self, sender)
	GearUtils.hot_join_sync(sender, self._unit, self._equipment)
end

SimpleInventoryExtension.destroy_slot = function (self, slot_name, allow_destroy_weapon)
	local equipment = self._equipment
	local slot_data = equipment.slots[slot_name]

	if slot_data == nil then
		return
	end

	local weapon_unit_1p = slot_data.right_unit_1p or slot_data.left_unit_1p

	if Managers.player.is_server and ScriptUnit.has_extension(weapon_unit_1p, "limited_item_track_system") then
		local weapon_limited_item_track_extension = ScriptUnit.extension(weapon_unit_1p, "limited_item_track_system")

		if not weapon_limited_item_track_extension.thrown then
			local spawner_unit = weapon_limited_item_track_extension.spawner_unit
			local spawner_limited_item_track_extension = ScriptUnit.extension(spawner_unit, "limited_item_track_system")
			local limited_item_id = weapon_limited_item_track_extension.id

			if spawner_limited_item_track_extension:is_transformed(limited_item_id) then
				local limited_item_track_system = Managers.state.entity:system("limited_item_track_system")

				limited_item_track_system:held_limited_item_destroyed(spawner_unit, limited_item_id)
			end
		end
	end

	local go_id = Managers.state.unit_storage:go_id(self._unit)
	local slot_id = NetworkLookup.equipment_slots[slot_name]
	local network_manager = Managers.state.network

	if Managers.state.network:game() and not LEVEL_EDITOR_TEST then
		if self.is_server then
			network_manager.network_transmit:send_rpc_clients("rpc_destroy_slot", go_id, slot_id)
		else
			network_manager.network_transmit:send_rpc_server("rpc_destroy_slot", go_id, slot_id)
		end
	end

	GearUtils.destroy_slot(self._world, self._unit, slot_data, equipment, allow_destroy_weapon)
end

SimpleInventoryExtension.current_ammo_status = function (self, slot_name)
	local slot_data = self._equipment.slots[slot_name]

	if not slot_data then
		return
	end

	local item_data = slot_data.item_data
	local item_template = slot_data.item_template or BackendUtils.get_item_template(item_data)
	local ammo_data = item_template.ammo_data

	if ammo_data then
		local right_unit = slot_data.right_unit_1p
		local left_unit = slot_data.left_unit_1p
		local ammo_extension = GearUtils.get_ammo_extension(right_unit, left_unit)

		if ammo_extension then
			local remaining_ammo = ammo_extension:total_remaining_ammo()
			local max_ammo = ammo_extension:max_ammo()

			return remaining_ammo, max_ammo
		end
	end
end

SimpleInventoryExtension.current_ammo_kind = function (self, slot_name)
	local slot_data = self._equipment.slots[slot_name]

	if not slot_data then
		return
	end

	local item_data = slot_data.item_data
	local item_template = slot_data.item_template or BackendUtils.get_item_template(item_data)
	local ammo_data = item_template.ammo_data

	if ammo_data then
		local right_unit = slot_data.right_unit_1p
		local left_unit = slot_data.left_unit_1p
		local ammo_extension = GearUtils.get_ammo_extension(right_unit, left_unit)

		if ammo_extension then
			local ammo_kind = ammo_extension:ammo_kind()

			return ammo_kind
		end
	end
end

SimpleInventoryExtension.add_ammo_from_pickup = function (self, pickup_settings)
	local equipment = self._equipment
	local slots = equipment.slots
	local refill_percentage = pickup_settings.refill_percentage
	local refill_amount = pickup_settings.refill_amount

	fassert(not refill_percentage or not refill_amount, "ammo pickups has to contain either refill_percentage or refill_amount, not both")

	for slot_name, slot_data in pairs(slots) do
		local item_data = slot_data.item_data
		local item_template = slot_data.item_template or BackendUtils.get_item_template(item_data)
		local ammo_data = item_template.ammo_data

		if ammo_data and not ammo_data.ignore_ammo_pickup then
			self:_add_ammo_to_slot(slot_name, slot_data, refill_percentage, refill_amount)
		end
	end
end

SimpleInventoryExtension._add_ammo_to_slot = function (self, slot_name, slot_data, refill_percentage, refill_amount)
	local left_hand_unit = slot_data.left_unit_1p
	local right_hand_unit = slot_data.right_unit_1p
	local ammo_extension = nil

	if left_hand_unit and ScriptUnit.has_extension(left_hand_unit, "ammo_system") then
		ammo_extension = ScriptUnit.extension(left_hand_unit, "ammo_system")
	end

	if right_hand_unit then
		if ScriptUnit.has_extension(right_hand_unit, "ammo_system") then
			ammo_extension = ScriptUnit.extension(right_hand_unit, "ammo_system")
		elseif not ammo_extension then
			return
		end
	elseif not ammo_extension then
		return
	end

	local max_ammo = ammo_extension:max_ammo()

	if refill_percentage then
		refill_amount = max_ammo * refill_percentage
	end

	ammo_extension:add_ammo(refill_amount)

	local should_reload_now = ammo_extension:reload_on_ammo_pickup() or ammo_extension:ammo_count() == 0

	if should_reload_now and self._equipment.wielded_slot == slot_name and ammo_extension:can_reload() then
		local play_reload_animation = true

		ammo_extension:start_reload(play_reload_animation)

		if ammo_extension:reload_on_ammo_pickup() then
			CharacterStateHelper.stop_weapon_actions(self, "reload")
		end
	end
end

SimpleInventoryExtension.get_item_template = function (self, slot_data)
	local item_data = slot_data.item_data
	local item_template = slot_data.item_template or BackendUtils.get_item_template(item_data)

	return item_template
end

SimpleInventoryExtension.get_wielded_slot_item_template = function (self)
	local slot_name = self:get_wielded_slot_name()
	local slot_data = self:get_slot_data(slot_name)

	if not slot_data then
		return nil
	end

	return self:get_item_template(slot_data)
end

SimpleInventoryExtension.get_wielded_slot_name = function (self)
	local equipment = self._equipment
	local wielded_slot = equipment.wielded_slot

	return wielded_slot
end

SimpleInventoryExtension.get_slot_data = function (self, slot_id)
	local equipment = self._equipment
	local slots = equipment.slots

	return slots[slot_id]
end

SimpleInventoryExtension.get_wielded_slot_data = function (self)
	local slot_name = self:get_wielded_slot_name()
	local slot_data = self:get_slot_data(slot_name)

	return slot_data
end

SimpleInventoryExtension.get_item_name = function (self, slot_name)
	local slot_data = self:get_slot_data(slot_name)
	local item_data = slot_data and slot_data.item_data
	local item_name = item_data and item_data.name

	return item_name
end

SimpleInventoryExtension.get_item_data = function (self, slot_name)
	local slot_data = self:get_slot_data(slot_name)
	local item_data = slot_data and slot_data.item_data

	return item_data
end

SimpleInventoryExtension._resync_loadout = function (self, equipment_to_spawn)
	if not equipment_to_spawn then
		return
	end

	local career_extension = self.career_extension
	local career_index = career_extension:career_index()
	local network_manager = Managers.state.network
	local resync_id = network_manager.profile_synchronizer:resync_loadout(self._profile_index, career_index, self.player)

	return resync_id
end

SimpleInventoryExtension.create_equipment_in_slot = function (self, slot_id, backend_id)
	local item_data = BackendUtils.get_item_from_masterlist(backend_id)
	local slot_data = self._equipment.slots[slot_id]
	local weapon_already_equiped = slot_data.item_data == item_data
	local item_units = BackendUtils.get_item_units(item_data)

	if weapon_already_equiped then
		return
	end

	self:destroy_slot(slot_id, true)

	self._items_to_spawn[#self._items_to_spawn + 1] = {
		slot_id = slot_id,
		item_data = item_data,
		skin = item_units.skin
	}
	local talent_extension = self.talent_extension
	local weapon_index = (talent_extension and talent_extension:get_talent_weapon_index()) or 1
	local career_skill_weapon_name = self.career_extension:career_skill_weapon_name(weapon_index)

	if career_skill_weapon_name then
		local career_item_data = rawget(ItemMasterList, career_skill_weapon_name)

		if career_item_data and career_item_data.slot_to_use == slot_id then
			self:destroy_slot("slot_career_skill_weapon", true)

			career_item_data.left_hand_unit = item_data.left_hand_unit
			career_item_data.right_hand_unit = item_data.right_hand_unit
			self._items_to_spawn[#self._items_to_spawn + 1] = {
				slot_id = "slot_career_skill_weapon",
				item_data = career_item_data,
				skin = item_units.skin
			}
		end
	end

	self.resync_loadout_needed = true
end

SimpleInventoryExtension._spawn_resynced_loadout = function (self, equipment_to_spawn)
	local item_data = equipment_to_spawn.item_data
	local slot_name = equipment_to_spawn.slot_id
	local network_manager = Managers.state.network
	local unit_go_id = Managers.state.unit_storage:go_id(self._unit)
	local slot_id = NetworkLookup.equipment_slots[slot_name]
	local item_id = NetworkLookup.item_names[item_data.name]
	local weapon_skin_id = NetworkLookup.weapon_skins[equipment_to_spawn.skin or "n/a"]
	local is_server = self.is_server

	if is_server then
		network_manager.network_transmit:send_rpc_clients("rpc_add_equipment", unit_go_id, slot_id, item_id, weapon_skin_id)
	else
		network_manager.network_transmit:send_rpc_server("rpc_add_equipment", unit_go_id, slot_id, item_id, weapon_skin_id)

		if slot_name == "slot_ranged" or slot_name == "slot_melee" then
			local backend_id = item_data.backend_id

			self:_send_rpc_add_equipment_buffs(unit_go_id, slot_id, item_id, backend_id)
		end
	end

	self:add_equipment(slot_name, item_data)

	if slot_name ~= "slot_career_skill_weapon" then
		self:wield(slot_name)
	end
end

SimpleInventoryExtension.all_clients_loaded_resource = function (self, resync_id)
	local profile_synchronizer = Managers.state.network.profile_synchronizer
	local all_clients_have_loaded_resources = profile_synchronizer:all_clients_have_loaded_sync_id(resync_id)

	return all_clients_have_loaded_resources
end

local slots_to_check = {
	slot_ranged = true,
	slot_melee = true
}

SimpleInventoryExtension.has_ammo_consuming_weapon_equipped = function (self, ammo_type)
	local equipment = self._equipment
	local inventory_slots = equipment.slots
	local has_ammo_weapon = false

	for slot_name, slot_data in pairs(inventory_slots) do
		if slots_to_check[slot_name] then
			local left_hand_unit = slot_data.left_unit_1p
			local left_hand_ammo_extension = left_hand_unit and ScriptUnit.has_extension(left_hand_unit, "ammo_system")

			if left_hand_ammo_extension then
				if ammo_type then
					has_ammo_weapon = left_hand_ammo_extension:ammo_type() == ammo_type
				else
					has_ammo_weapon = true
				end
			end

			local right_hand_unit = slot_data.right_unit_1p
			local right_hand_ammo_extension = right_hand_unit and ScriptUnit.has_extension(right_hand_unit, "ammo_system")

			if right_hand_ammo_extension then
				if ammo_type then
					has_ammo_weapon = right_hand_ammo_extension:ammo_type() == ammo_type
				else
					has_ammo_weapon = true
				end
			end
		end

		if has_ammo_weapon then
			return true
		end
	end

	return false
end

SimpleInventoryExtension.reset_ammo = function (self, slot_name)
	local slot_data = self._equipment.slots[slot_name]
	local right_hand_unit = slot_data.right_unit_1p
	local right_ammo_extension = ScriptUnit.has_extension(right_hand_unit, "ammo_system") and ScriptUnit.extension(right_hand_unit, "ammo_system")

	if right_ammo_extension then
		right_ammo_extension:reset()
	end

	local left_hand_unit = slot_data.left_unit_1p
	local left_ammo_extension = ScriptUnit.has_extension(left_hand_unit, "ammo_system") and ScriptUnit.extension(left_hand_unit, "ammo_system")

	if left_ammo_extension then
		left_ammo_extension:reset()
	end
end

SimpleInventoryExtension.has_full_ammo = function (self)
	local equipment = self._equipment
	local inventory_slots = equipment.slots
	local full_ammo = true

	for slot_name, slot_data in pairs(inventory_slots) do
		if slots_to_check[slot_name] then
			local left_hand_unit = slot_data.left_unit_1p
			local right_hand_unit = slot_data.right_unit_1p
			local ammo_extension = ScriptUnit.has_extension(right_hand_unit, "ammo_system") and ScriptUnit.extension(right_hand_unit, "ammo_system")
			ammo_extension = ammo_extension or (ScriptUnit.has_extension(left_hand_unit, "ammo_system") and ScriptUnit.extension(left_hand_unit, "ammo_system"))

			if ammo_extension and not ammo_extension:full_ammo() then
				full_ammo = false

				break
			end
		end
	end

	return full_ammo
end

SimpleInventoryExtension.apply_buffs_to_ammo = function (self)
	local equipment = self._equipment
	local inventory_slots = equipment.slots

	for slot_name, slot_data in pairs(inventory_slots) do
		if slots_to_check[slot_name] then
			local left_hand_unit = slot_data.left_unit_1p
			local right_hand_unit = slot_data.right_unit_1p
			local left_hand_ammo_extension = ScriptUnit.has_extension(left_hand_unit, "ammo_system")

			if left_hand_ammo_extension then
				left_hand_ammo_extension:apply_buffs()
			end

			local right_hand_ammo_extension = ScriptUnit.has_extension(right_hand_unit, "ammo_system")

			if right_hand_ammo_extension then
				right_hand_ammo_extension:apply_buffs()
			end
		end
	end
end

SimpleInventoryExtension.drop_level_event_item = function (self, slot_data)
	local item_template = self:get_item_template(slot_data)

	if item_template.no_drop then
		return
	end

	local weapon_unit = slot_data.right_unit_1p or slot_data.left_unit_1p
	local action = item_template.actions.action_dropped.default

	fassert(action, "Action template needs a action_dropped defined if it's supposed to be force-dropped")

	local projectile_info = action.projectile_info
	local unit = self._unit
	local position = Unit.world_position(unit, 0) + Vector3(0, 0, 2)

	if NetworkUtils.network_safe_position(position) then
		local proj_rotation = Quaternion.identity()
		local velocity = Vector3(math.random(), math.random(), math.random())
		local angular_velocity_transformed = Vector3(math.random(), math.random(), math.random())
		local item_data = slot_data.item_data
		local item_name = item_data.name
		local spawn_type = "dropped"

		ActionUtils.spawn_pickup_projectile(self._world, weapon_unit, projectile_info.projectile_unit_name, projectile_info.projectile_unit_template_name, action, unit, position, proj_rotation, velocity, angular_velocity_transformed, item_name, spawn_type)
	end

	self:destroy_slot("slot_level_event")
end

SimpleInventoryExtension.check_and_drop_pickups = function (self, drop_reason, override_pos, override_dir)
	local unit = self._unit
	local equipment = self._equipment
	local inventory_slots = equipment.slots
	local slot_settings = InventorySettings.slots_by_name
	local current_wielded_slot = self:get_wielded_slot_name()
	local i = 0

	for slot_name, slot_data in pairs(inventory_slots) do
		if slot_data then
			local item_data = slot_data.item_data
			local item_template = BackendUtils.get_item_template(item_data)
			local pickup_data = item_template.pickup_data
			local slot_drop_reasons = slot_settings[slot_name].drop_reasons
			local should_drop = slot_drop_reasons and slot_drop_reasons[drop_reason]

			if should_drop then
				if pickup_data and slot_name ~= "slot_level_event" then
					local random_vector = override_dir or Vector3(math.random(-1, 1) + 2 * i, math.random(-1, 1) + i, math.random(0, 1))
					local random_angle = math.random(-math.half_pi, math.half_pi)
					local random_direction = Vector3.normalize(random_vector)
					local position = (override_pos or POSITION_LOOKUP[unit]) + random_vector * 0.2

					if NetworkUtils.network_safe_position(position) then
						local rotation = Quaternion.axis_angle(random_direction, random_angle)
						local pickup_name = pickup_data.pickup_name
						local pickup_name_id = NetworkLookup.pickup_names[pickup_name]
						local pickup_spawn_type = "dropped"
						local pickup_spawn_type_id = NetworkLookup.pickup_spawn_types[pickup_spawn_type]
						local network_manager = Managers.state.network

						network_manager.network_transmit:send_rpc_server("rpc_spawn_pickup_with_physics", pickup_name_id, position, rotation, pickup_spawn_type_id)

						i = i + 1
					end
				elseif slot_name == "slot_level_event" then
					self:drop_level_event_item(slot_data)
				end

				self:destroy_slot(slot_name)

				if slot_name == current_wielded_slot then
					self:wield_previous_weapon()
				end
			end
		end
	end
end

SimpleInventoryExtension.set_loaded_projectile_override = function (self, settings)
	self._loaded_projectile_settings_override = settings
end

SimpleInventoryExtension._update_loaded_projectile_settings = function (self)
	local loaded_projectile_settings = nil
	local weapon_template = self:get_wielded_slot_item_template()
	local settings_override = self._loaded_projectile_settings_override

	if settings_override then
		if settings_override ~= "none" then
			loaded_projectile_settings = settings_override
		end
	elseif weapon_template then
		loaded_projectile_settings = weapon_template.default_loaded_projectile_settings
	end

	self._loaded_projectile_settings = loaded_projectile_settings
end

SimpleInventoryExtension.get_loaded_projectile_settings = function (self)
	return self._loaded_projectile_settings
end

SimpleInventoryExtension._update_selected_consumable_slot = function (self)
	local slots = self._equipment.slots

	if not slots[self._selected_consumable_slot] then
		self._selected_consumable_slot = nil
	end

	if not self._selected_consumable_slot then
		for i = 1, #consumable_slots, 1 do
			local slot_name = consumable_slots[i]
			local slot_data = slots[slot_name]

			if slot_data then
				self._selected_consumable_slot = slot_name

				break
			end
		end
	end

	if self._selected_consumable_slot then
		local input_extension = ScriptUnit.extension(self._unit, "input_system")

		for _, slot_input_data in pairs(InventorySettings.slots_by_wield_input) do
			if not slot_input_data.loadout_slot and input_extension:get(slot_input_data.wield_input) and slots[slot_input_data.name] then
				self._selected_consumable_slot = slot_input_data.name

				break
			end
		end
	end
end

SimpleInventoryExtension.get_selected_consumable_slot_template = function (self)
	local slot_name = self._selected_consumable_slot
	local slot_data = self._equipment.slots[slot_name]
	local item_template = nil

	if slot_data then
		local item_data = slot_data.item_data
		item_template = BackendUtils.get_item_template(item_data)
	end

	return item_template
end

SimpleInventoryExtension.get_selected_consumable_slot_name = function (self)
	return self._selected_consumable_slot
end

SimpleInventoryExtension.resyncing_loadout = function (self)
	return self._is_resyncing_loadout
end

SimpleInventoryExtension.get_item_slot_extension = function (self, slot_name, system_name)
	local slot_data = self:get_slot_data(slot_name)
	local right_unit_1p = slot_data.right_unit_1p
	local left_unit_1p = slot_data.left_unit_1p
	local right_hand_extension = ScriptUnit.has_extension(right_unit_1p, system_name) and ScriptUnit.extension(right_unit_1p, system_name)
	local left_hand_extension = ScriptUnit.has_extension(left_unit_1p, system_name) and ScriptUnit.extension(left_unit_1p, system_name)
	local extension = right_hand_extension

	if not extension and left_hand_extension then
		extension = left_hand_extension
	end

	return extension
end

SimpleInventoryExtension.get_num_grimoires = function (self)
	local buff_extension = ScriptUnit.extension(self._unit, "buff_system")
	local num_grimoires = buff_extension:num_buff_perk("skaven_grimoire")
	local num_twitch_grimoires = buff_extension:num_buff_perk("twitch_grimoire")

	return num_grimoires, num_twitch_grimoires
end

local buffs = {
	client = {},
	server = {},
	both = {}
}

SimpleInventoryExtension._get_property_and_trait_buffs = function (self, backend_id)
	local backend_items = self._backend_items

	table.clear(buffs.client)
	table.clear(buffs.server)
	table.clear(buffs.both)

	return GearUtils.get_property_and_trait_buffs(backend_items, backend_id, buffs)
end

SimpleInventoryExtension._wield_slot = function (self, equipment, slot_data, unit_1p, unit_3p, buff_extension)
	Unit.flow_event(unit_1p, "lua_unwield")

	if equipment.right_hand_wielded_unit then
		Unit.flow_event(equipment.right_hand_wielded_unit, "lua_unwield")
		Unit.set_unit_visibility(equipment.right_hand_wielded_unit, false)

		if ScriptUnit.has_extension(equipment.right_hand_wielded_unit, "ammo_system") then
			local ammo_extension = ScriptUnit.extension(equipment.right_hand_wielded_unit, "ammo_system")

			if ammo_extension:is_reloading() then
				ammo_extension:abort_reload()
			end
		end
	end

	if equipment.right_hand_ammo_unit_1p then
		Unit.set_unit_visibility(equipment.right_hand_ammo_unit_1p, false)
	end

	if equipment.left_hand_wielded_unit then
		Unit.flow_event(equipment.left_hand_wielded_unit, "lua_unwield")
		Unit.set_unit_visibility(equipment.left_hand_wielded_unit, false)

		if ScriptUnit.has_extension(equipment.left_hand_wielded_unit, "ammo_system") then
			local ammo_extension = ScriptUnit.extension(equipment.left_hand_wielded_unit, "ammo_system")

			if ammo_extension:is_reloading() then
				ammo_extension:abort_reload()
			end
		end
	end

	if equipment.left_hand_ammo_unit_1p then
		Unit.flow_event(equipment.left_hand_ammo_unit_1p, "lua_unwield")
		Unit.set_unit_visibility(equipment.left_hand_ammo_unit_1p, false)
	end

	if equipment.right_hand_wielded_unit_3p then
		Unit.flow_event(equipment.right_hand_wielded_unit_3p, "lua_unwield")
		Unit.set_unit_visibility(equipment.right_hand_wielded_unit_3p, false)
	end

	if equipment.right_hand_ammo_unit_3p then
		Unit.flow_event(equipment.right_hand_ammo_unit_3p, "lua_unwield")
		Unit.set_unit_visibility(equipment.right_hand_ammo_unit_3p, false)
	end

	if equipment.left_hand_wielded_unit_3p then
		Unit.flow_event(equipment.left_hand_wielded_unit_3p, "lua_unwield")
		Unit.set_unit_visibility(equipment.left_hand_wielded_unit_3p, false)
	end

	if equipment.left_hand_ammo_unit_3p then
		Unit.flow_event(equipment.left_hand_ammo_unit_3p, "lua_unwield")
		Unit.set_unit_visibility(equipment.left_hand_ammo_unit_3p, false)
	end

	local item_data = slot_data.item_data
	equipment.wielded = item_data
	equipment.wielded_slot = slot_data.id
	equipment.right_hand_wielded_unit_3p = slot_data.right_unit_3p
	equipment.right_hand_ammo_unit_3p = slot_data.right_ammo_unit_3p
	equipment.left_hand_wielded_unit_3p = slot_data.left_unit_3p
	equipment.left_hand_ammo_unit_3p = slot_data.left_ammo_unit_3p
	local career_extension = ScriptUnit.extension(unit_3p, "career_system")
	local career_index = career_extension:career_index()

	if Unit.animation_has_variable(unit_1p, "career_index") then
		local variable_index = Unit.animation_find_variable(unit_1p, "career_index")

		Unit.animation_set_variable(unit_1p, variable_index, career_index)
	end

	if Unit.animation_has_variable(unit_3p, "career_index") then
		local variable_index = Unit.animation_find_variable(unit_3p, "career_index")

		Unit.animation_set_variable(unit_3p, variable_index, career_index)
	end

	if Unit.animation_has_variable(unit_1p, "profile_index") then
		local variable_index = Unit.animation_find_variable(unit_1p, "profile_index")

		Unit.animation_set_variable(unit_1p, variable_index, career_index)
	end

	local item_template = BackendUtils.get_item_template(item_data)
	local wield_anim = item_template.wield_anim

	if not script_data.disable_third_person_weapon_animation_events then
		Unit.animation_event(unit_3p, wield_anim)
	end

	if slot_data.right_unit_1p or slot_data.left_unit_1p then
		equipment.right_hand_wielded_unit = slot_data.right_unit_1p
		equipment.right_hand_ammo_unit_1p = slot_data.right_ammo_unit_1p
		equipment.left_hand_wielded_unit = slot_data.left_unit_1p
		equipment.left_hand_ammo_unit_1p = slot_data.left_ammo_unit_1p
		local blackboard = BLACKBOARDS[self._unit]

		if blackboard then
			blackboard.weapon_unit = self:get_weapon_unit()
		end

		if equipment.right_hand_wielded_unit then
			Unit.flow_event(equipment.right_hand_wielded_unit, "lua_wield")
		end

		if equipment.right_hand_ammo_unit_1p then
			Unit.flow_event(equipment.right_hand_ammo_unit_1p, "lua_wield")
		end

		if equipment.left_hand_wielded_unit then
			Unit.flow_event(equipment.left_hand_wielded_unit, "lua_wield")
		end

		if equipment.left_hand_ammo_unit_1p then
			Unit.flow_event(equipment.left_hand_ammo_unit_1p, "lua_wield")
		end

		local play_wield_animation = true

		if ScriptUnit.has_extension(equipment.right_hand_wielded_unit, "ammo_system") then
			local ammo_extension = ScriptUnit.extension(equipment.right_hand_wielded_unit, "ammo_system")

			if ammo_extension:can_reload() and ammo_extension:ammo_count() == 0 then
				wield_anim = item_template.wield_anim_not_loaded or wield_anim
				local play_reload_animation = ammo_extension:play_reload_anim_on_wield_reload()
				local has_wield_reload_anim = ammo_extension:has_wield_reload_anim()
				local override_wield_anim = nil

				if has_wield_reload_anim then
					override_wield_anim = wield_anim
					play_wield_animation = not play_reload_animation
				end

				ammo_extension:start_reload(play_reload_animation, nil, override_wield_anim)
			elseif ammo_extension:total_remaining_ammo() == 0 then
				wield_anim = item_template.wield_anim_no_ammo or wield_anim
			end
		end

		if ScriptUnit.has_extension(equipment.left_hand_wielded_unit, "ammo_system") then
			local ammo_extension = ScriptUnit.extension(equipment.left_hand_wielded_unit, "ammo_system")

			if ammo_extension:can_reload() and ammo_extension:ammo_count() == 0 then
				wield_anim = item_template.wield_anim_not_loaded or wield_anim
				local play_reload_animation = ammo_extension:play_reload_anim_on_wield_reload()
				local has_wield_reload_anim = ammo_extension:has_wield_reload_anim()
				local override_wield_anim = nil

				if has_wield_reload_anim then
					override_wield_anim = wield_anim
					play_wield_animation = not play_reload_animation
				end

				ammo_extension:start_reload(play_reload_animation, nil, override_wield_anim)
			elseif ammo_extension:total_remaining_ammo() == 0 then
				wield_anim = item_template.wield_anim_no_ammo or wield_anim
			end
		end

		if play_wield_animation then
			Unit.animation_event(unit_1p, wield_anim)
		end

		if slot_data.right_unit_1p then
			if Unit.has_visibility_group(slot_data.right_unit_1p, "normal") then
				Unit.set_visibility(slot_data.right_unit_1p, "normal", true)
			else
				Unit.set_unit_visibility(slot_data.right_unit_1p, true)
			end

			if slot_data.right_ammo_unit_1p then
				Unit.set_unit_visibility(slot_data.right_ammo_unit_1p, true)
			end
		end

		if slot_data.left_unit_1p then
			if Unit.has_visibility_group(slot_data.left_unit_1p, "normal") then
				Unit.set_visibility(slot_data.left_unit_1p, "normal", true)
			else
				Unit.set_unit_visibility(slot_data.left_unit_1p, true)
			end

			if slot_data.left_ammo_unit_1p then
				Unit.set_unit_visibility(slot_data.left_ammo_unit_1p, true)
			end
		end
	else
		if equipment.right_hand_wielded_unit_3p then
			Unit.flow_event(equipment.right_hand_wielded_unit_3p, "lua_wield")
			Unit.set_unit_visibility(equipment.right_hand_wielded_unit_3p, true)

			if slot_data.right_ammo_unit_3p then
				Unit.set_unit_visibility(slot_data.right_ammo_unit_3p, true)
			end
		end

		if equipment.left_hand_wielded_unit_3p then
			Unit.flow_event(equipment.left_hand_wielded_unit_3p, "lua_wield")
			Unit.set_unit_visibility(equipment.left_hand_wielded_unit_3p, true)

			if slot_data.left_ammo_unit_3p then
				Unit.set_unit_visibility(slot_data.left_ammo_unit_3p, true)
			end
		end
	end

	Unit.flow_event(unit_1p, "lua_wield")

	return true
end

SimpleInventoryExtension.get_equipped_item_names = function (self)
	local equipped = {}

	for name, slot in pairs(self._equipment.slots) do
		equipped[#equipped + 1] = slot.item_data.name
	end

	return equipped
end

return
