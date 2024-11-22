-- chunkname: @scripts/unit_extensions/default_player_unit/inventory/simple_inventory_extension.lua

require("scripts/utils/strict_table")
require("scripts/unit_extensions/default_player_unit/inventory/gear_utils")
require("scripts/managers/backend/backend_utils")

SimpleInventoryExtension = class(SimpleInventoryExtension)
SwapFromStorageType = SwapFromStorageType or CreateStrictEnumTable("First", "Unique", "Same", "SameOrAny", "UnwieldPrio", "LowestUnwieldPrio")

local consumable_slots = {
	"slot_potion",
	"slot_grenade",
	"slot_healthkit",
}

SimpleInventoryExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._world = extension_init_context.world
	self._unit = unit
	self._profile = extension_init_data.profile
	self._profile_index = FindProfileIndex(self._profile.display_name)
	self._additional_items = {}
	self._attached_units = {}
	self._equipment = {
		slots = {},
		item_data = {},
	}

	local player = extension_init_data.player

	self.is_server = Managers.player.is_server
	self.is_bot = player.bot_player or false
	self.player = player

	local career_name = player:career_name()
	local career_data = career_name and CareerSettings[career_name]
	local additional_item_slots = career_data and career_data.additional_item_slots

	if additional_item_slots then
		for slot_name, slot_count in pairs(additional_item_slots) do
			self._additional_items[slot_name] = {
				max_slots = slot_count,
				items = {},
			}
		end
	end

	self._career_name = career_name
	self.initial_inventory = extension_init_data.initial_inventory
	self.initial_ammo_percent = extension_init_data.ammo_percent
	self._show_first_person = true
	self._show_third_person = false
	self._show_first_person_lights = true
	self.current_item_buffs = {
		wield = {},
		equip = {
			slot_melee = {},
			slot_ranged = {},
		},
	}
	self._blocked_wield_slots = {}
	self._weapon_fx = {}
	self._items_to_spawn = {}
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

SimpleInventoryExtension.get_weapon_unit_3p = function (self)
	local equipment = self._equipment
	local weapon_unit_3p = equipment.left_hand_wielded_unit_3p or equipment.right_hand_wielded_unit_3p

	return weapon_unit_3p
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

	local skill_index = talent_extension and talent_extension:get_talent_career_skill_index() or 1
	local weapon_index = talent_extension and talent_extension:get_talent_career_weapon_index()

	self.initial_inventory.slot_career_skill_weapon = career_extension:career_skill_weapon_name(skill_index, weapon_index)

	self:add_equipment_by_category("career_skill_weapon_slots")

	local additional_items = self.initial_inventory.additional_items

	if additional_items then
		for slot_name, slot_items in pairs(additional_items) do
			for i = 1, #slot_items.items do
				local item_data = slot_items.items[i]
				local slot_data = self:get_slot_data(slot_name)

				if slot_data then
					local skip_resync = true

					self:store_additional_item(slot_name, item_data, skip_resync)
				else
					self:add_equipment(slot_name, item_data)
				end
			end
		end
	end

	local career_settings = career_extension:career_settings()

	if career_settings.additional_inventory then
		for slot_name, slot_items in pairs(career_settings.additional_inventory) do
			for i = 1, #slot_items do
				local item_data = ItemMasterList[slot_items[i]]
				local slot_data = self:get_slot_data(slot_name)

				if slot_data then
					local skip_resync = true

					self:store_additional_item(slot_name, item_data, skip_resync)
				else
					self:add_equipment(slot_name, item_data)
				end
			end
		end
	end

	Unit.set_data(self._first_person_unit, "equipment", self._equipment)

	if profile.default_wielded_slot then
		local default_wielded_slot = profile.default_wielded_slot
		local slot_data = self._equipment.slots[default_wielded_slot]

		if not slot_data then
			table.dump(self._equipment.slots, "self._equipment.slots", 1)

			local career_name = career_extension:career_name()
			local career_loadout = Managers.backend:get_interface("items"):get_loadout_by_career_name(career_name, self.is_bot)

			table.dump(career_loadout, "career_loadout", 1)
			ferror("Tried to wield default slot %s for %s that contained no weapon.", default_wielded_slot, career_name)
		end

		self:_wield_slot(equipment, slot_data, unit_1p, unit_3p)

		local item_data = slot_data.item_data
		local item_template = BackendUtils.get_item_template(item_data)

		self:_spawn_attached_units(item_template.first_person_attached_units)

		local backend_id = item_data.backend_id
		local buffs = self:_get_property_and_trait_buffs(backend_id)

		if item_template.server_buffs then
			for buff_name, buff_data in pairs(item_template.server_buffs) do
				buffs.server[buff_name] = buff_data
			end
		end

		self:apply_buffs(buffs, "wield", item_data.name, default_wielded_slot)

		local equipment = self._equipment
		local left_weapon = ScriptUnit.has_extension(equipment.left_hand_wielded_unit, "weapon_system")

		if left_weapon then
			left_weapon:on_wield("left")
		end

		local right_weapon = ScriptUnit.has_extension(equipment.right_hand_wielded_unit, "weapon_system")

		if right_weapon then
			right_weapon:on_wield("right")
		end
	end

	self._equipment.wielded_slot = profile.default_wielded_slot
end

SimpleInventoryExtension._update_career_skill_weapon_slot = function (self)
	if not self._first_person_unit then
		local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

		self._first_person_unit = first_person_extension:get_first_person_unit()
	end

	local career_extension = self.career_extension
	local talent_extension = self.talent_extension
	local skill_index = talent_extension and talent_extension:get_talent_career_skill_index() or 1
	local weapon_index = talent_extension and talent_extension:get_talent_career_weapon_index()
	local career_skill_weapon_name = career_extension:career_skill_weapon_name(skill_index, weapon_index)

	if career_skill_weapon_name then
		local should_reload_career_weapon = career_extension:should_reload_career_weapon()

		if should_reload_career_weapon then
			local career_item_data = rawget(ItemMasterList, career_skill_weapon_name)

			if self._equipment.wielded_slot == "slot_career_skill_weapon" then
				self:wield_previous_weapon()
			end

			self:destroy_slot("slot_career_skill_weapon", true)
			self:_queue_item_spawn("slot_career_skill_weapon", career_item_data)
		else
			self.initial_inventory.slot_career_skill_weapon = career_skill_weapon_name

			self:add_equipment_by_category("career_skill_weapon_slots")
			Unit.set_data(self._first_person_unit, "equipment", self._equipment)
		end
	end
end

SimpleInventoryExtension.update_career_skill_weapon_slot_safe = function (self)
	self._queue_update_career_skill_weapon_slot = true
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

				self:_send_rpc_add_equipment_buffs(unit_go_id, slot_id, backend_id)
			end
		end

		self:swap_equipment_from_storage(slot_name, SwapFromStorageType.UnwieldPrio, slot_data.item_data)
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

	for slot_name, slot_items in pairs(self._additional_items) do
		self:_resync_stored_items(slot_name)
	end
end

SimpleInventoryExtension._send_rpc_add_equipment_buffs = function (self, unit_go_id, slot_id, backend_id)
	local function send_equipment_buffs(rpc_name, buffs)
		local server_buffs = {}

		server_buffs = table.merge(server_buffs, buffs.server)
		server_buffs = table.merge(server_buffs, buffs.both)

		local rpc_params = BuffUtils.buffs_to_rpc_params(server_buffs)
		local num_buffs, buff_ids, buff_value_type_ids, buff_values = unpack(rpc_params)

		if #buff_ids ~= #buff_value_type_ids or #buff_value_type_ids ~= #buff_values then
			fassert(false, "[SimpleInventoryExtension] Length of arrays buff_names(%d) and buff_value_types(%d) and buff_values(%d) are not equal!", #buff_ids, #buff_value_type_ids, #buff_values)
		end

		if num_buffs > 0 then
			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit

			network_transmit:send_rpc_server(rpc_name, unit_go_id, slot_id, num_buffs, buff_ids, buff_value_type_ids, buff_values)
		end
	end

	local property_and_trait_buffs = self:_get_property_and_trait_buffs(backend_id)
	local item_data = BackendUtils.get_item_from_masterlist(backend_id)
	local item_template = BackendUtils.get_item_template(item_data)

	if item_template.server_buffs then
		for buff_name, buff_data in pairs(item_template.server_buffs) do
			property_and_trait_buffs.server[buff_name] = buff_data
		end
	end

	send_equipment_buffs("rpc_add_equipment_buffs", property_and_trait_buffs)

	local no_wield_required_buffs = self:_get_no_wield_required_property_and_trait_buffs(backend_id)

	send_equipment_buffs("rpc_add_no_wield_required_equipment_buffs", no_wield_required_buffs)
end

SimpleInventoryExtension._override_career_skill_item_template = function (self, item_data)
	local override_item_template, override_item_units
	local slot_to_use = item_data.slot_to_use

	if slot_to_use then
		local equipment = self._equipment
		local slots = equipment.slots
		local override_slot_data = slots[slot_to_use]
		local slot_override_item_template, override_item_data

		if WeaponUtils.is_valid_weapon_override(override_slot_data, item_data) then
			slot_override_item_template = self:get_item_template(override_slot_data)
			override_item_data = override_slot_data.item_data
		else
			local default_item_name = item_data.default_item_to_replace

			override_item_data = ItemMasterList[default_item_name]
			slot_override_item_template = WeaponUtils.get_weapon_template(override_item_data.template)
		end

		local item_template = BackendUtils.get_item_template(item_data)

		item_template.left_hand_attachment_node_linking = slot_override_item_template.left_hand_attachment_node_linking
		item_template.right_hand_attachment_node_linking = slot_override_item_template.right_hand_attachment_node_linking
		item_template.wield_anim = slot_override_item_template.wield_anim
		item_template.wield_anim_no_ammo = slot_override_item_template.wield_anim_no_ammo
		item_template.wield_anim_career = slot_override_item_template.wield_anim_career
		item_template.wield_anim_no_ammo_career = slot_override_item_template.wield_anim_no_ammo_career
		override_item_units = BackendUtils.get_item_units(item_data)

		local other_slot_item_units = BackendUtils.get_item_units(override_item_data)

		for key, _ in pairs(item_data.item_units_to_replace) do
			override_item_units[key] = other_slot_item_units[key]
		end

		override_item_template = item_template
	end

	return override_item_template, override_item_units
end

SimpleInventoryExtension.add_equipment_by_category = function (self, category)
	local career_name = self.career_extension:career_name()
	local category_slots = InventorySettings[category]
	local num_slots = #category_slots

	for i = 1, num_slots do
		repeat
			local slot = category_slots[i]
			local slot_name = slot.name
			local item = BackendUtils.get_loadout_item(career_name, slot_name, self.is_bot)
			local item_data
			local item_name = self.initial_inventory[slot_name]
			local backend_id

			if item then
				item_data = table.clone(item.data)
				backend_id = item.backend_id
				item_data.backend_id = backend_id
			else
				item_data = rawget(ItemMasterList, item_name)

				if not item_data then
					if slot.stored_in_backend then
						backend_id = BackendUtils.get_loadout_item_id(career_name, slot_name, self.is_bot)

						local backend_id_string = backend_id and tostring(backend_id) or "No backend ID"
						local backend_items = Managers.backend:get_interface("items")
						local item_string = "No item"

						if backend_id then
							local item = backend_items:get_item_from_id(backend_id)

							item_string = item and item.name or "Item exists"
						end

						local loadout_interface_override = Managers.backend._current_loadout_interface_override
						local loadout_interface_override_string = loadout_interface_override or "No override"
						local career_loadout = backend_items:get_loadout_by_career_name(career_name, self.is_bot)

						printf("self.initial_inventory: \n%s", table.tostring(self.initial_inventory))
						printf("Tried add_equipment_by_category for category <%s> for career <%s> at slot <%s>.\n BackendUtils.get_loadout_item didnt return a item.\n backend_id_string: %s\n item_string: %s\n loadout_interface_override_string: %s\n", category, career_name, slot_name, backend_id_string, item_string, loadout_interface_override_string)
						table.dump(career_loadout, "career_loadout", 1)
					end

					break
				end
			end

			if item_data.slot_to_use then
				local override_slot_data = self._equipment.slots[item_data.slot_to_use]

				if not override_slot_data then
					break
				end

				local override_item_data

				if WeaponUtils.is_valid_weapon_override(override_slot_data, item_data) then
					override_item_data = override_slot_data.item_data
				else
					local default_item_name = item_data.default_item_to_replace

					override_item_data = ItemMasterList[default_item_name]
				end

				item_data.left_hand_unit = override_item_data.left_hand_unit
				item_data.right_hand_unit = override_item_data.right_hand_unit
			end

			self:add_equipment(slot_name, item_data, nil, nil, self.initial_ammo_percent[slot_name])
		until true
	end
end

SimpleInventoryExtension.destroy = function (self)
	local pickup_system = Managers.state.entity:system("pickup_system")
	local projectile_system = Managers.state.entity:system("projectile_system")
	local player_network_id = self.player:network_id()

	for slot_id, slot_data in pairs(self._equipment.slots) do
		if pickup_system then
			local linked_pickup_type = slot_data.link_pickup_template_name

			if linked_pickup_type then
				pickup_system:delete_limited_owned_pickup_type(player_network_id, linked_pickup_type)
			end
		end

		if slot_data.destroy_indexed_projectiles and projectile_system then
			projectile_system:delete_indexed_projectiles(self._unit)
		end

		GearUtils.destroy_slot(self._world, self._unit, slot_data, self._equipment, true)
	end

	self:_despawn_attached_units()
	self:_stop_all_weapon_fx()
end

SimpleInventoryExtension._unlink_unit = function (self, unit, reason, attachment_node_linking)
	World.unlink_unit(self._world, unit)

	local node_linking_data = attachment_node_linking.wielded or attachment_node_linking

	for i, attachment_nodes in ipairs(node_linking_data) do
		local target_node = attachment_nodes.target

		if target_node ~= 0 then
			local target_node_index = type(target_node) == "string" and Unit.node(unit, target_node) or target_node
			local parent = Unit.scene_graph_parent(unit, target_node_index)

			Unit.scene_graph_link(unit, target_node_index, 0)
		end
	end

	Unit.set_flow_variable(unit, "lua_drop_reason", reason)
	Unit.set_shader_pass_flag_for_meshes_in_unit_and_childs(unit, "outline_unit", false)
	Unit.flow_event(unit, "lua_dropped")

	local actor = Unit.create_actor(unit, "rp_dropped")

	Actor.add_angular_velocity(actor, Vector3(math.random(), math.random(), math.random()) * 5)
	Actor.add_velocity(actor, Vector3(2 * math.random() - 0.5, 2 * math.random() - 0.5, 4.5))
end

SimpleInventoryExtension.drop_equipped_weapons = function (self, reason, unit)
	return
end

SimpleInventoryExtension.equipment = function (self)
	return self._equipment
end

SimpleInventoryExtension.update = function (self, unit, input, dt, context, t)
	if self._queue_update_career_skill_weapon_slot then
		self:_update_career_skill_weapon_slot()

		self._queue_update_career_skill_weapon_slot = false
	end

	self:_update_selected_consumable_slot()
	self:_update_loaded_projectile_settings()
	self:_update_resync_loadout()

	local current_ammo, max_ammo = self:current_ammo_status("slot_ranged")
	local ammo_percentage = 1
	local network_manager = Managers.state.network
	local game = network_manager:game()
	local go_id = Managers.state.unit_storage:go_id(unit)

	if current_ammo and max_ammo then
		ammo_percentage = current_ammo / max_ammo

		GameSession.set_game_object_field(game, go_id, "current_ammo", current_ammo)
		GameSession.set_game_object_field(game, go_id, "max_ammo", max_ammo)
	end

	ammo_percentage = math.min(1, ammo_percentage)

	GameSession.set_game_object_field(game, go_id, "ammo_percentage", ammo_percentage)
end

SimpleInventoryExtension.recently_acquired = function (self, slot_name)
	local slot_data = self.recently_acquired_list[slot_name]

	self.recently_acquired_list[slot_name] = nil

	return slot_data
end

SimpleInventoryExtension._update_resync_loadout = function (self)
	local slot_name, equipment_to_spawn = next(self._items_to_spawn)

	if not equipment_to_spawn then
		return
	end

	local network_manager = Managers.state.network
	local profile_synchronizer = network_manager.profile_synchronizer
	local peer_id = self.player:network_id()
	local local_player_id = self.player:local_player_id()

	if self.resync_loadout_needed then
		profile_synchronizer:resync_loadout(peer_id, local_player_id, self.is_bot)

		self.resync_loadout_needed = false
	end

	if profile_synchronizer:all_ingame_synced_for_peer(peer_id, local_player_id) then
		self:_spawn_resynced_loadout(equipment_to_spawn)

		self._items_to_spawn[slot_name] = nil
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

SimpleInventoryExtension.wield_previous_slot = function (self)
	local slot_name = self._previously_wielded_slot
	local success = self:wield(slot_name)

	if not success then
		return self:wield_previous_non_level_slot()
	end

	return true
end

SimpleInventoryExtension.wield_previous_non_level_slot = function (self)
	local slot_name = self._previously_wielded_non_level_slot
	local success = self:wield(slot_name)

	if not success then
		return self:wield_previous_weapon()
	end

	return true
end

SimpleInventoryExtension.wield_previous_weapon = function (self)
	local slot_name = self._previously_wielded_weapon_slot
	local success = self:wield(slot_name)

	if not success then
		return self:rewield_wielded_slot()
	end

	return true
end

SimpleInventoryExtension.rewield_wielded_slot = function (self)
	local equipment = self._equipment
	local wielded_slot = equipment.wielded_slot

	return self:wield(wielded_slot)
end

SimpleInventoryExtension.wield = function (self, slot_name)
	local equipment = self._equipment
	local slot_data = equipment.slots[slot_name]

	if slot_data == nil then
		return false
	end

	if equipment.wielded_slot ~= slot_name then
		self.buff_extension:trigger_procs("on_unwield")

		local left_weapon = ScriptUnit.has_extension(equipment.left_hand_wielded_unit, "weapon_system")

		if left_weapon then
			left_weapon:on_unwield("left")
		end

		local right_weapon = ScriptUnit.has_extension(equipment.right_hand_wielded_unit, "weapon_system")

		if right_weapon then
			right_weapon:on_unwield("right")
		end

		local wielded_slot_data = equipment.slots[equipment.wielded_slot]

		if wielded_slot_data then
			self:swap_equipment_from_storage(equipment.wielded_slot, SwapFromStorageType.UnwieldPrio, wielded_slot_data.item_data)
		end
	end

	self:_stop_all_weapon_fx()
	self:_despawn_attached_units()

	local career_extension = self.career_extension

	CharacterStateHelper.stop_weapon_actions(self, "weapon_wielded")
	CharacterStateHelper.stop_career_abilities(career_extension, "weapon_wielded")

	local item_data = slot_data.item_data
	local item_template = BackendUtils.get_item_template(item_data)
	local wielded_weapon = self:_wield_slot(equipment, slot_data, self._first_person_unit, self._unit)

	equipment.wielded_slot = slot_name

	local backend_id = item_data.backend_id
	local buffs = self:_get_property_and_trait_buffs(backend_id)

	if item_template.buffs then
		for buff_name, buff_data in pairs(item_template.buffs) do
			buffs.client[buff_name] = buff_data
		end
	end

	if item_template.server_buffs then
		for buff_name, buff_data in pairs(item_template.server_buffs) do
			buffs.server[buff_name] = buff_data
		end
	end

	self:apply_buffs(buffs, "wield", item_data.name, slot_name)
	self.buff_extension:trigger_procs("on_inventory_post_apply_buffs", equipment)

	if wielded_weapon then
		self:show_first_person_inventory(self._show_first_person)
		self:show_first_person_inventory_lights(self._show_first_person_lights)
		self:show_third_person_inventory(self._show_third_person)

		if slot_name == "slot_packmaster_claw" then
			local status_extension = ScriptUnit.extension(self._unit, "status_system")
			local grabber_unit = status_extension:get_pack_master_grabber()
			local grabber_player = Managers.player:unit_owner(grabber_unit)
			local cosmetic_slot = CosmeticUtils.get_cosmetic_slot(grabber_player, "slot_skin")

			if cosmetic_slot then
				if cosmetic_slot.item_name ~= "skaven_pack_master_skin_1001" then
					Unit.flow_event(self._equipment.right_hand_wielded_unit_3p, "lua_wield_0000")
				else
					Unit.flow_event(self._equipment.right_hand_wielded_unit_3p, "lua_wield_1001")
				end
			end
		end
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

	self:start_weapon_fx("wield")

	local left_weapon = ScriptUnit.has_extension(equipment.left_hand_wielded_unit, "weapon_system")

	if left_weapon then
		left_weapon:on_wield("left")
	end

	local right_weapon = ScriptUnit.has_extension(equipment.right_hand_wielded_unit, "weapon_system")

	if right_weapon then
		right_weapon:on_wield("right")
	end

	self.buff_extension:trigger_procs("on_wield")

	return true
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
		for i = 1, #current_item_buffs do
			local buff_id = current_item_buffs[i]

			buff_extension:remove_buff(buff_id)
		end

		table.clear(current_item_buffs)
	elseif reason == "equip" then
		current_item_buffs = current_item_buffs[slot_name]

		if current_item_buffs then
			for i = 1, #current_item_buffs do
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
				local buff_data = BuffUtils.get_buff_template(buff_name)

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

		if item_name == name then
			return true
		end
	end

	local additional_items = self:get_additional_items(slot_name)

	if additional_items then
		for additional_item_idx = 1, #additional_items do
			local additional_item_data = additional_items[additional_item_idx]

			if item_name == additional_item_data.name then
				return true
			end
		end
	end

	return false
end

SimpleInventoryExtension.add_equipment = function (self, slot_name, item_name, unit_template, extra_extension_data, ammo_percent)
	local item_data

	if type(item_name) == "string" then
		item_data = ItemMasterList[item_name]
	else
		item_data = item_name
	end

	local world = self._world
	local equipment = self._equipment
	local unit_1p = self._first_person_unit
	local unit_3p = self._unit
	local is_bot = self.is_bot
	local career_name = self._career_name
	local override_item_template, override_item_units = self:_override_career_skill_item_template(item_data)
	local slot_equipment_data = GearUtils.create_equipment(world, slot_name, item_data, unit_1p, unit_3p, is_bot, unit_template, extra_extension_data, ammo_percent, override_item_template, override_item_units, career_name)

	slot_equipment_data.master_item = item_data
	equipment.slots[slot_name] = slot_equipment_data
	self.recently_acquired_list[slot_name] = slot_equipment_data

	CosmeticUtils.update_cosmetic_slot(self.player, slot_name, item_data.name, slot_equipment_data.skin)

	local backend_interface_items = Managers.backend:get_interface("items")
	local item = backend_interface_items:get_item_from_id(item_data.backend_id) or rawget(ItemMasterList, item_data.name)

	LoadoutUtils.sync_loadout_slot(self.player, slot_name, item)

	local item_name = item_data.name
	local buffs_by_buffer = self:_get_no_wield_required_property_and_trait_buffs(item_data.backend_id)

	self:apply_buffs(buffs_by_buffer, "equip", item_name, slot_name)
end

SimpleInventoryExtension.show_first_person_inventory_lights = function (self, show)
	self._show_first_person_lights = show

	local right_hand_wielded_unit = self._equipment.right_hand_wielded_unit

	if right_hand_wielded_unit and Unit.alive(right_hand_wielded_unit) and Unit.has_visibility_group(right_hand_wielded_unit, "normal") then
		local num_lights = Unit.num_lights(right_hand_wielded_unit)

		for i = 1, num_lights do
			Light.set_enabled(Unit.light(right_hand_wielded_unit, i - 1), show)
		end
	end

	local left_hand_wielded_unit = self._equipment.left_hand_wielded_unit

	if left_hand_wielded_unit and Unit.alive(left_hand_wielded_unit) and Unit.has_visibility_group(left_hand_wielded_unit, "normal") then
		local num_lights = Unit.num_lights(left_hand_wielded_unit)

		for i = 1, num_lights do
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

	if show then
		Unit.flow_event(self._unit, "lua_wield")
	else
		Unit.flow_event(self._unit, "lua_unwield")
	end
end

SimpleInventoryExtension.is_showing_third_person_inventory = function (self)
	return self._show_third_person
end

SimpleInventoryExtension.hot_join_sync = function (self, sender)
	GearUtils.hot_join_sync(sender, self._unit, self._equipment, self._additional_items)
end

SimpleInventoryExtension.destroy_item_by_name = function (self, slot_name, item_name, allow_destroy_weapon, try_requip_from_storage)
	local slot_data = self:get_slot_data(slot_name)

	if slot_data and slot_data.item_data.name == item_name then
		self:destroy_slot(slot_name, allow_destroy_weapon, try_requip_from_storage)
	else
		local additional_items = self:get_additional_items(slot_name)

		if additional_items then
			for i = #additional_items, 1, -1 do
				local item_data = additional_items[i]

				if item_data.name == item_name then
					self:remove_additional_item(slot_name, item_data)

					break
				end
			end
		end
	end
end

SimpleInventoryExtension.destroy_slot = function (self, slot_name, allow_destroy_weapon, try_requip_from_storage)
	local equipment = self._equipment
	local slot_data = equipment.slots[slot_name]

	if slot_data == nil then
		if try_requip_from_storage then
			self:swap_equipment_from_storage(slot_name)
		end

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

	local linked_pickup_type = slot_data.link_pickup_template_name
	local pickup_system = Managers.state.entity:system("pickup_system")

	if linked_pickup_type then
		pickup_system:delete_limited_owned_pickup_type(self.player:network_id(), linked_pickup_type)
	end

	if slot_data.destroy_indexed_projectiles then
		local projectile_system = Managers.state.entity:system("projectile_system")

		projectile_system:delete_indexed_projectiles(self._unit)
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

	if try_requip_from_storage then
		self:swap_equipment_from_storage(slot_name, SwapFromStorageType.SameOrAny, slot_data.item_data)
	end
end

SimpleInventoryExtension.current_ammo_status = function (self, slot_name)
	local slot_data = self._equipment.slots[slot_name]

	if not slot_data then
		return
	end

	local item_template = self:get_item_template(slot_data)
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

SimpleInventoryExtension.ammo_percentage = function (self)
	local current_ammo, max_ammo = self:current_ammo_status("slot_ranged")
	local ammo_percentage = 1

	if current_ammo and max_ammo then
		ammo_percentage = current_ammo / max_ammo
	end

	return ammo_percentage
end

SimpleInventoryExtension.ammo_status = function (self)
	local current_ammo, max_ammo = self:current_ammo_status("slot_ranged")

	return current_ammo, max_ammo
end

SimpleInventoryExtension.current_ammo_kind = function (self, slot_name)
	local slot_data = self._equipment.slots[slot_name]

	if not slot_data then
		return
	end

	local item_template = self:get_item_template(slot_data)
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
		local item_template = self:get_item_template(slot_data)
		local ammo_data = item_template.ammo_data

		if ammo_data and not ammo_data.ignore_ammo_pickup then
			self:_add_ammo_to_slot(slot_name, slot_data, refill_percentage, refill_amount)
		end
	end
end

SimpleInventoryExtension._add_ammo_to_slot = function (self, slot_name, slot_data, refill_percentage, refill_amount)
	local left_hand_unit = slot_data.left_unit_1p
	local right_hand_unit = slot_data.right_unit_1p
	local ammo_extension

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
	if slot_data then
		local item_data = slot_data.item_data
		local item_template = WeaponUtils.get_weapon_template(slot_data.item_template_name) or BackendUtils.get_item_template(item_data)

		return item_template
	end

	return nil
end

SimpleInventoryExtension.get_wielded_slot_item_template = function (self)
	local slot_name = self:get_wielded_slot_name()
	local slot_data = self:get_slot_data(slot_name)

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

SimpleInventoryExtension.create_equipment_in_slot = function (self, slot_id, backend_id, ammo_percent)
	local item_data = BackendUtils.get_item_from_masterlist(backend_id)

	if not item_data then
		Crashify.print_exception("SimpleInventoryExtension", "Tried create equip %q in slot %q but was unable to find item", backend_id, slot_id)

		return
	end

	local slot_data = self._equipment.slots[slot_id]
	local weapon_already_equiped

	if not slot_data then
		print("[SimpleInventoryExtension] create_equipment_in_slot called on " .. slot_id .. "that is empty")

		weapon_already_equiped = false
	else
		weapon_already_equiped = slot_data.item_data == item_data
	end

	local item_units = BackendUtils.get_item_units(item_data, nil, nil, self._career_name)

	if weapon_already_equiped then
		return
	end

	self:destroy_slot(slot_id, true)

	if slot_id == self._equipment.wielded_slot then
		local default_state_machine = self._profile.default_state_machine

		if default_state_machine then
			self.first_person_extension:set_state_machine(default_state_machine)
		end
	end

	self:_queue_item_spawn(slot_id, item_data, item_units.skin, ammo_percent)

	local talent_extension = self.talent_extension
	local skill_index = talent_extension and talent_extension:get_talent_career_skill_index() or 1
	local weapon_index = talent_extension and talent_extension:get_talent_career_weapon_index()
	local career_skill_weapon_name = self.career_extension:career_skill_weapon_name(skill_index, weapon_index)

	if career_skill_weapon_name then
		local career_item_data = rawget(ItemMasterList, career_skill_weapon_name)

		if career_item_data and career_item_data.slot_to_use == slot_id then
			self:destroy_slot("slot_career_skill_weapon", true)

			career_item_data.left_hand_unit = item_data.left_hand_unit
			career_item_data.right_hand_unit = item_data.right_hand_unit

			self:_queue_item_spawn("slot_career_skill_weapon", career_item_data, item_units.skin)
		end
	end
end

SimpleInventoryExtension._queue_item_spawn = function (self, slot_name, item_data, skin, ammo_percent)
	if not slot_name or not item_data then
		return
	end

	self._items_to_spawn[slot_name] = {
		slot_id = slot_name,
		item_data = item_data,
		skin = skin,
		ammo_percent = ammo_percent,
	}
	self.resync_loadout_needed = true
end

SimpleInventoryExtension._spawn_resynced_loadout = function (self, equipment_to_spawn, skip_wield)
	local item_data = equipment_to_spawn.item_data
	local slot_name = equipment_to_spawn.slot_id
	local ammo_percent = equipment_to_spawn.ammo_percent
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

			self:_send_rpc_add_equipment_buffs(unit_go_id, slot_id, backend_id)
		end
	end

	local unit_template, extra_extension_data

	self:add_equipment(slot_name, item_data, unit_template, extra_extension_data, ammo_percent)

	if not skip_wield and slot_name ~= "slot_career_skill_weapon" and slot_name ~= "slot_level_event" then
		self:wield(slot_name)
	end
end

local slots_to_check = {
	slot_melee = true,
	slot_ranged = true,
}

SimpleInventoryExtension.has_unique_ammo_type_weapon_equipped = function (self)
	local equipment = self._equipment
	local inventory_slots = equipment.slots

	for slot_name, slot_data in pairs(inventory_slots) do
		if slots_to_check[slot_name] then
			local item_template = self:get_item_template(slot_data)

			if item_template then
				local ammo_data = item_template.ammo_data

				if ammo_data and ammo_data.unique_ammo_type then
					return true
				end
			end
		end
	end

	return false
end

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

SimpleInventoryExtension.has_infinite_ammo = function (self)
	local equipment = self._equipment
	local inventory_slots = equipment.slots
	local has_ammo_weapon = false

	for slot_name, slot_data in pairs(inventory_slots) do
		if slots_to_check[slot_name] then
			local left_hand_unit = slot_data.left_unit_1p
			local left_hand_ammo_extension = left_hand_unit and ScriptUnit.has_extension(left_hand_unit, "ammo_system")

			if left_hand_ammo_extension and left_hand_ammo_extension:infinite_ammo() then
				return true
			end

			local right_hand_unit = slot_data.right_unit_1p
			local right_hand_ammo_extension = right_hand_unit and ScriptUnit.has_extension(right_hand_unit, "ammo_system")

			if right_hand_ammo_extension and right_hand_ammo_extension:infinite_ammo() then
				return true
			end
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

			ammo_extension = ammo_extension or ScriptUnit.has_extension(left_hand_unit, "ammo_system") and ScriptUnit.extension(left_hand_unit, "ammo_system")

			if ammo_extension and not ammo_extension:full_ammo() then
				full_ammo = false

				break
			end
		end
	end

	return full_ammo
end

SimpleInventoryExtension.is_ammo_blocked = function (self)
	local equipment = self._equipment
	local inventory_slots = equipment.slots
	local blocked_ammo = false

	for slot_name, slot_data in pairs(inventory_slots) do
		if slots_to_check[slot_name] then
			local left_hand_unit = slot_data.left_unit_1p
			local right_hand_unit = slot_data.right_unit_1p
			local ammo_extension = ScriptUnit.has_extension(right_hand_unit, "ammo_system") and ScriptUnit.extension(right_hand_unit, "ammo_system")

			ammo_extension = ammo_extension or ScriptUnit.has_extension(left_hand_unit, "ammo_system") and ScriptUnit.extension(left_hand_unit, "ammo_system")

			if ammo_extension and ammo_extension:ammo_blocked() then
				blocked_ammo = true

				break
			end
		end
	end

	return blocked_ammo
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

SimpleInventoryExtension.refresh_buffs_on_ammo = function (self)
	local equipment = self._equipment
	local inventory_slots = equipment.slots

	for slot_name, slot_data in pairs(inventory_slots) do
		if slots_to_check[slot_name] then
			local left_hand_unit = slot_data.left_unit_1p
			local right_hand_unit = slot_data.right_unit_1p
			local left_hand_ammo_extension = ScriptUnit.has_extension(left_hand_unit, "ammo_system")

			if left_hand_ammo_extension then
				left_hand_ammo_extension:refresh_buffs()
			end

			local right_hand_ammo_extension = ScriptUnit.has_extension(right_hand_unit, "ammo_system")

			if right_hand_ammo_extension then
				right_hand_ammo_extension:refresh_buffs()
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

local function get_pickup_drop_pos_dir(drop_position, override_dir, pickup_idx)
	local random_vector = override_dir or Vector3(math.random(-1, 1) * pickup_idx, math.random(-1, 1) * pickup_idx, 2)
	local random_direction = Vector3.normalize(random_vector)
	local position = drop_position + random_vector * 0.2

	return position, random_direction
end

local function drop_pickup(unit, pickup_data, position, direction)
	if NetworkUtils.network_safe_position(position) then
		local random_angle = math.random(-math.half_pi, math.half_pi) / 2
		local rotation = Quaternion.axis_angle(direction, random_angle)
		local pickup_name = pickup_data.pickup_name
		local pickup_name_id = NetworkLookup.pickup_names[pickup_name]
		local pickup_spawn_type = "dropped"
		local pickup_spawn_type_id = NetworkLookup.pickup_spawn_types[pickup_spawn_type]
		local network_manager = Managers.state.network

		network_manager.network_transmit:send_rpc_server("rpc_spawn_pickup_with_physics", pickup_name_id, position, rotation, pickup_spawn_type_id)
	end
end

SimpleInventoryExtension.check_and_drop_pickups = function (self, drop_reason, override_pos, override_dir)
	local unit = self._unit
	local equipment = self._equipment
	local inventory_slots = equipment.slots
	local slot_settings = InventorySettings.slots_by_name
	local current_wielded_slot = self:get_wielded_slot_name()
	local i = 0
	local drop_position = override_pos or POSITION_LOOKUP[unit]

	for slot_name, slot_data in pairs(inventory_slots) do
		if slot_data then
			local item_data = slot_data.item_data
			local item_template = BackendUtils.get_item_template(item_data)
			local pickup_data = item_template.pickup_data
			local slot_drop_reasons = slot_settings[slot_name].drop_reasons
			local should_drop = slot_drop_reasons and slot_drop_reasons[drop_reason]

			if should_drop then
				if pickup_data and slot_name ~= "slot_level_event" then
					local position, random_direction = get_pickup_drop_pos_dir(drop_position, override_dir, i)

					drop_pickup(unit, pickup_data, position, random_direction)

					i = i + 1
				elseif slot_name == "slot_level_event" then
					self:drop_level_event_item(slot_data)
				end

				local additional_items = self:get_additional_items(slot_name)

				if additional_items then
					for additional_item_idx = #additional_items, 1, -1 do
						local additional_item_data = additional_items[additional_item_idx]
						local additional_item_template = BackendUtils.get_item_template(additional_item_data)
						local additional_pickup_data = additional_item_template.pickup_data

						if additional_pickup_data then
							local position, random_direction = get_pickup_drop_pos_dir(drop_position, override_dir, i)

							drop_pickup(unit, additional_pickup_data, position, random_direction)

							i = i + 1
						end

						local skip_resync = additional_item_idx > 1

						self:remove_additional_item(slot_name, additional_item_data, skip_resync)
					end
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
	local loaded_projectile_settings
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
		for i = 1, #consumable_slots do
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
	local item_template

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
	local profile_synchronizer = Managers.state.network.profile_synchronizer
	local peer_id = self.player:network_id()
	local local_player_id = self.player:local_player_id()

	return not profile_synchronizer:all_ingame_synced_for_peer(peer_id, local_player_id)
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
	both = {},
}

SimpleInventoryExtension._get_property_and_trait_buffs = function (self, backend_id)
	local backend_items = self._backend_items

	table.clear(buffs.client)
	table.clear(buffs.server)
	table.clear(buffs.both)

	return GearUtils.get_property_and_trait_buffs(backend_items, backend_id, buffs)
end

SimpleInventoryExtension._get_no_wield_required_property_and_trait_buffs = function (self, backend_id)
	local backend_items = self._backend_items

	table.clear(buffs.client)
	table.clear(buffs.server)
	table.clear(buffs.both)

	local only_permanent = true

	return GearUtils.get_property_and_trait_buffs(backend_items, backend_id, buffs, only_permanent)
end

local function get_wield_anim(default, optional_switch, career_name)
	return optional_switch and optional_switch[career_name] or default
end

SimpleInventoryExtension._wield_slot = function (self, equipment, slot_data, unit_1p, unit_3p, buff_extension)
	Unit.flow_event(unit_1p, "lua_unwield")
	self.first_person_extension:animation_event("unwield")

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

	if not slot_data then
		return
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

	if Unit.animation_has_variable(unit_3p, "career_index") then
		local variable_index = Unit.animation_find_variable(unit_3p, "career_index")

		Unit.animation_set_variable(unit_3p, variable_index, career_index)
	end

	local item_template = BackendUtils.get_item_template(item_data)
	local wield_anim = get_wield_anim(item_template.wield_anim, item_template.wield_anim_career, self._career_name)

	if not script_data.disable_third_person_weapon_animation_events then
		local wield_anim_3p = get_wield_anim(item_template.wield_anim_3p, item_template.wield_anim_career_3p, self._career_name) or wield_anim

		Unit.animation_event(unit_3p, wield_anim_3p)
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
				local wield_anim_not_loaded = get_wield_anim(item_template.wield_anim_not_loaded, item_template.wield_anim_not_loaded_career, self._career_name)

				wield_anim = wield_anim_not_loaded or wield_anim

				local play_reload_animation = ammo_extension:play_reload_anim_on_wield_reload()
				local has_wield_reload_anim = ammo_extension:has_wield_reload_anim()
				local override_wield_anim

				if has_wield_reload_anim then
					override_wield_anim = wield_anim
					play_wield_animation = not play_reload_animation
				end

				ammo_extension:start_reload(play_reload_animation, nil, override_wield_anim)
			elseif ammo_extension:total_remaining_ammo() == 0 then
				local wield_anim_no_ammo = get_wield_anim(item_template.wield_anim_no_ammo, item_template.wield_anim_no_ammo_career, self._career_name)

				wield_anim = wield_anim_no_ammo or wield_anim
			end
		end

		if ScriptUnit.has_extension(equipment.left_hand_wielded_unit, "ammo_system") then
			local ammo_extension = ScriptUnit.extension(equipment.left_hand_wielded_unit, "ammo_system")

			if ammo_extension:can_reload() and ammo_extension:ammo_count() == 0 then
				local wield_anim_not_loaded = get_wield_anim(item_template.wield_anim_not_loaded, item_template.wield_anim_not_loaded_career, self._career_name)

				wield_anim = wield_anim_not_loaded or wield_anim

				local play_reload_animation = ammo_extension:play_reload_anim_on_wield_reload()
				local has_wield_reload_anim = ammo_extension:has_wield_reload_anim()
				local override_wield_anim

				if has_wield_reload_anim then
					override_wield_anim = wield_anim
					play_wield_animation = not play_reload_animation
				end

				ammo_extension:start_reload(play_reload_animation, nil, override_wield_anim)
			elseif ammo_extension:total_remaining_ammo() == 0 then
				local wield_anim_no_ammo = get_wield_anim(item_template.wield_anim_no_ammo, item_template.wield_anim_no_ammo_career, self._career_name)

				wield_anim = wield_anim_no_ammo or wield_anim
			end
		end

		local state_machine = WeaponUtils.get_item_state_machine(item_template, self._career_name)

		state_machine = state_machine or self._profile.default_state_machine

		if state_machine then
			self.first_person_extension:set_state_machine(state_machine)
		end

		if play_wield_animation then
			if Unit.animation_has_variable(unit_1p, "animation_variation_id") then
				local weapon_skin_data = WeaponSkins.skins[slot_data.skin]
				local weapon_skin_anim_overrides = weapon_skin_data and weapon_skin_data.action_anim_overrides
				local animation_variation_id = weapon_skin_anim_overrides and weapon_skin_anim_overrides.animation_variation_id or 0

				self.first_person_extension:animation_set_variable("animation_variation_id", animation_variation_id, true)
			end

			self.first_person_extension:animation_event(wield_anim)
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
	Managers.state.event:trigger("on_weapon_wield", equipment)

	return true
end

SimpleInventoryExtension.get_equipped_item_names = function (self)
	local equipped = {}

	for name, slot in pairs(self._equipment.slots) do
		equipped[#equipped + 1] = slot.item_data.name
	end

	return equipped
end

SimpleInventoryExtension.testify_wield_weapon = function (self, weapon)
	local backend_id = weapon.backend_id
	local career_extension = ScriptUnit.extension(self._unit, "career_system")
	local career_name = career_extension:career_name()
	local slot_type = "slot_" .. weapon.data.slot_type

	BackendUtils.set_loadout_item(backend_id, career_name, slot_type)
	self:create_equipment_in_slot(slot_type, backend_id)
end

SimpleInventoryExtension.start_weapon_fx = function (self, fx_name, network_sync)
	local equipment = self._equipment
	local slot_name = equipment.wielded_slot
	local slot_data = equipment.slots[slot_name]
	local item_template = self:get_item_template(slot_data)
	local item_particle_fx = item_template.particle_fx
	local particle_fx = item_particle_fx and item_particle_fx[fx_name]

	if particle_fx then
		self._weapon_fx[fx_name] = GearUtils.create_attached_particles(self._world, particle_fx, equipment, self._unit, self._first_person_unit, not self.is_bot)

		if network_sync then
			local item_data = slot_data.item_data
			local go_id = Managers.state.unit_storage:go_id(self._unit)
			local item_id = NetworkLookup.item_names[item_data.name]
			local fx_id = item_template.particle_fx_lookup[fx_name]

			if go_id and item_id and fx_id then
				local network_manager = Managers.state.network

				if self.is_server then
					network_manager.network_transmit:send_rpc_clients("rpc_start_weapon_fx", go_id, item_id, fx_id)
				else
					network_manager.network_transmit:send_rpc_server("rpc_start_weapon_fx", go_id, item_id, fx_id)
				end
			end
		end
	end
end

SimpleInventoryExtension.stop_weapon_fx = function (self, fx_name, network_sync)
	local active_fx = self._weapon_fx[fx_name]

	if active_fx then
		self._weapon_fx[fx_name] = GearUtils.destroy_attached_particles(self._world, active_fx)

		if network_sync then
			local equipment = self._equipment
			local slot_name = equipment.wielded_slot
			local slot_data = equipment.slots[slot_name]
			local item_template = self:get_item_template(slot_data)
			local item_particle_fx = item_template and item_template.particle_fx
			local particle_fx = item_particle_fx and item_particle_fx[fx_name]

			if particle_fx then
				local item_data = slot_data.item_data
				local go_id = Managers.state.unit_storage:go_id(self._unit)
				local item_id = NetworkLookup.item_names[item_data.name]
				local fx_id = item_template.particle_fx_lookup[fx_name]

				if go_id and item_id and fx_id then
					local network_manager = Managers.state.network

					if self.is_server then
						network_manager.network_transmit:send_rpc_clients("rpc_stop_weapon_fx", go_id, item_id, fx_id)
					else
						network_manager.network_transmit:send_rpc_server("rpc_stop_weapon_fx", go_id, item_id, fx_id)
					end
				end
			end
		end
	end
end

SimpleInventoryExtension._stop_all_weapon_fx = function (self)
	local world = self._world
	local weapon_fx = self._weapon_fx

	for name, fx_ids in pairs(weapon_fx) do
		GearUtils.destroy_attached_particles(world, fx_ids)

		weapon_fx[name] = nil
	end
end

SimpleInventoryExtension.has_additional_item_slots = function (self, slot_name)
	local additional_items_slot = self._additional_items[slot_name]

	return additional_items_slot ~= nil
end

SimpleInventoryExtension.can_store_additional_item = function (self, slot_name)
	local additional_items_slot = self._additional_items[slot_name]

	return additional_items_slot and #additional_items_slot.items < additional_items_slot.max_slots
end

SimpleInventoryExtension.has_additional_items = function (self, slot_name)
	local additional_items_slot = self._additional_items[slot_name]

	return additional_items_slot and #additional_items_slot.items > 0
end

SimpleInventoryExtension.get_additional_items = function (self, slot_name)
	local additional_items_slot = self._additional_items[slot_name]

	return additional_items_slot and additional_items_slot.items
end

SimpleInventoryExtension.get_additional_items_table = function (self)
	return self._additional_items
end

SimpleInventoryExtension.get_total_item_count = function (self, slot_name)
	local count = 0

	if self:get_item_data(slot_name) then
		count = 1
	end

	local stored_items = self:get_additional_items(slot_name)

	if stored_items then
		count = count + #stored_items
	end

	return count
end

SimpleInventoryExtension.store_additional_item = function (self, slot_name, item_data, skip_resync)
	if item_data and self:can_store_additional_item(slot_name) then
		local items = self:get_additional_items(slot_name)

		items[#items + 1] = item_data

		if not skip_resync then
			self:_resync_stored_items(slot_name)
		end

		return true
	end

	return false
end

SimpleInventoryExtension.remove_additional_item = function (self, slot_name, item_data, skip_resync)
	local stored_items = self:get_additional_items(slot_name)
	local item_id = self:get_additional_item_swap_id(stored_items, SwapFromStorageType.Same, item_data)

	table.remove(stored_items, item_id)

	if not skip_resync then
		self:_resync_stored_items(slot_name)
	end
end

SimpleInventoryExtension.has_droppable_item = function (self, slot_name, filter_func)
	local has_droppable, is_stored = false, false
	local current_item = self:get_item_data(slot_name)

	if current_item and not current_item.is_not_droppable and (not filter_func or filter_func(current_item)) then
		has_droppable = true
		is_stored = false

		return has_droppable, is_stored, current_item
	end

	local items = self:get_additional_items(slot_name)

	if items then
		for i = 1, #items do
			local item_data = items[i]

			if not item_data.is_not_droppable and (not filter_func or filter_func(item_data)) then
				has_droppable = true
				is_stored = true

				return has_droppable, is_stored, item_data
			end
		end
	end

	return has_droppable, is_stored, nil
end

SimpleInventoryExtension.get_additional_item_swap_id = function (self, stored_items, swap_type, current_item)
	local item_id

	if stored_items then
		if swap_type == SwapFromStorageType.First then
			item_id = 1
		elseif swap_type == SwapFromStorageType.Unique then
			for i = 1, #stored_items do
				if stored_items[i] ~= current_item then
					item_id = i

					break
				end
			end
		elseif swap_type == SwapFromStorageType.Same or swap_type == SwapFromStorageType.SameOrAny then
			if swap_type == SwapFromStorageType.SameOrAny then
				item_id = 1
			end

			for i = 1, #stored_items do
				if stored_items[i] == current_item then
					item_id = i

					break
				end
			end
		elseif swap_type == SwapFromStorageType.UnwieldPrio then
			local highest_prio = current_item and (current_item.unwield_prio or 0) or -1
			local highest_prio_id

			for i = 1, #stored_items do
				local prio = stored_items[i].unwield_prio or 0

				if highest_prio < prio then
					highest_prio = prio
					highest_prio_id = i
				end
			end

			return highest_prio_id
		elseif swap_type == SwapFromStorageType.LowestUnwieldPrio then
			local lowest_prio = current_item and (current_item.unwield_prio or 0) or math.huge
			local lowest_prio_id

			for i = 1, #stored_items do
				local prio = stored_items[i].unwield_prio or 0

				if prio < lowest_prio then
					lowest_prio = prio
					lowest_prio_id = i
				end
			end

			return lowest_prio_id
		end
	end

	return item_id
end

SimpleInventoryExtension.can_swap_from_storage = function (self, slot_name, swap_type, optional_compare_item)
	if self:has_additional_items(slot_name) then
		swap_type = swap_type or SwapFromStorageType.First
		optional_compare_item = optional_compare_item or self:get_item_data(slot_name)

		local stored_items = self:get_additional_items(slot_name)
		local item_id = self:get_additional_item_swap_id(stored_items, swap_type, optional_compare_item)

		return stored_items[item_id] ~= nil, item_id, stored_items
	end

	return false
end

SimpleInventoryExtension.swap_equipment_from_storage = function (self, slot_name, swap_type, optional_compare_item)
	local can_swap, item_id, stored_items = self:can_swap_from_storage(slot_name, swap_type, optional_compare_item)

	if can_swap then
		local stored_item = stored_items[item_id]

		table.remove(stored_items, item_id)

		local current_item = self:get_slot_data(slot_name)

		if current_item then
			self:store_additional_item(slot_name, current_item.item_data, true)
			self:destroy_slot(slot_name)
		end

		self:_resync_stored_items(slot_name)

		local resync_data = {
			slot_id = slot_name,
			item_data = stored_item,
		}

		self:_spawn_resynced_loadout(resync_data, true)

		return true
	end

	return false
end

local temp_table = {}

SimpleInventoryExtension._resync_stored_items = function (self, slot_name)
	local items = self:get_additional_items(slot_name)

	if items then
		local unit_go_id = Managers.state.unit_storage:go_id(self._unit)

		if unit_go_id then
			local network_manager = Managers.state.network
			local slot_id = NetworkLookup.equipment_slots[slot_name]

			table.clear(temp_table)

			for i = 1, #items do
				local item = items[i]

				temp_table[#temp_table + 1] = NetworkLookup.item_names[item.name]
			end

			if self.is_server then
				network_manager.network_transmit:send_rpc_clients("rpc_update_additional_slot", unit_go_id, slot_id, temp_table)
			else
				network_manager.network_transmit:send_rpc_server("rpc_update_additional_slot", unit_go_id, slot_id, temp_table)
			end
		end
	end
end
