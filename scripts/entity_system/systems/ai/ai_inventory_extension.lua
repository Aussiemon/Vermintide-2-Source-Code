AIInventoryExtension = class(AIInventoryExtension)

local function link_unit(attachment_node_linking, world, target, source)
	for i, attachment_nodes in ipairs(attachment_node_linking) do
		local source_node = attachment_nodes.source
		local target_node = attachment_nodes.target
		local source_node_index = (type(source_node) == "string" and Unit.node(source, source_node)) or source_node
		local target_node_index = (type(target_node) == "string" and Unit.node(target, target_node)) or target_node

		World.link_unit(world, target, target_node_index, source, source_node_index)
	end
end

local function unlink_unit(attachment_node_linking, world, target)
	World.unlink_unit(world, target)

	local node_linking_data = attachment_node_linking.wielded or attachment_node_linking

	for _, attachment_nodes in ipairs(node_linking_data) do
		local target_node = attachment_nodes.target
		local target_node_index = (type(target_node) == "string" and Unit.node(target, target_node)) or target_node

		if target_node_index > 0 then
			Unit.scene_graph_link(target, target_node_index, 0)
		end
	end
end

AIInventoryExtension._setup_configuration = function (self, unit, start_n, inventory_configuration, item_extension_init_data)
	local items = inventory_configuration.items
	local items_n = inventory_configuration.items_n
	local inventory_item_units = self.inventory_item_units
	local inventory_item_units_by_category = self.inventory_item_units_by_category
	local inventory_item_definitions = self.inventory_item_definitions
	local unit_spawner = Managers.state.unit_spawner
	local index = start_n

	for i = 1, items_n, 1 do
		index = index + 1
		local item_category = items[i]
		local item_category_n = item_category.count
		local item_category_name = item_category.name
		local item_index = math.random(1, item_category_n)
		local item = item_category[item_index]
		local item_unit_name = item.unit_name
		local item_unit_template_name = item.unit_extension_template or "ai_inventory_item"

		if item.extension_init_data then
			for data, value in pairs(item.extension_init_data) do
				item_extension_init_data[data] = value

				if data == "weapon_system" then
					item_extension_init_data[data].owner_unit = unit
				end
			end
		end

		local attachment_node_linking = item.attachment_node_linking
		local node_linking_data = attachment_node_linking.unwielded or attachment_node_linking
		local item_position, item_rotation = nil

		for _, data in ipairs(node_linking_data) do
			if data.target == 0 then
				local source_node = data.source
				local source_node_index = (type(source_node) == "string" and Unit.node(unit, source_node)) or source_node
				item_position = Unit.world_position(unit, source_node_index)
				item_rotation = Unit.world_rotation(unit, source_node_index)

				break
			end
		end

		local item_unit = unit_spawner:spawn_local_unit_with_extensions(item_unit_name, item_unit_template_name, item_extension_init_data, item_position, item_rotation)

		link_unit(node_linking_data, self.world, item_unit, unit)

		inventory_item_units[index] = item_unit
		inventory_item_units_by_category[item_category_name] = item_unit
		inventory_item_definitions[index] = item

		if item_unit_template_name == "ai_shield_unit" then
			Unit.set_data(item_unit, "shield_owner_unit", unit)

			self.inventory_item_shield_unit = item_unit
		elseif item_unit_template_name == "ai_helmet_unit" then
			self.inventory_item_helmet_unit = item_unit
		end

		if item.weak_spot and self.is_server then
			self.inventory_weak_spot = item.weak_spot
		end
	end

	return index
end

AIInventoryExtension.init = function (self, unit, extension_init_data)
	self.world = extension_init_data.world
	self.unit = unit
	self.is_server = extension_init_data.is_server
	self.current_item_set_index = 1
	self.inventory_item_units_by_category = {}
	self.inventory_item_units = {}
	self.inventory_item_definitions = {}
	self.dropped_items = {}
	self.gib_items = {}
	self.stump_items = {}
	self.gibbed_nodes = {}
	local inventory_configuration_name = extension_init_data.inventory_configuration_name

	if extension_init_data.is_server and not inventory_configuration_name then
		local template_name = extension_init_data.inventory_template or "default"
		local template_function = AIInventoryTemplates[template_name]
		inventory_configuration_name = template_function()
		extension_init_data.optional_spawn_data.inventory_configuration_name = inventory_configuration_name
	end

	local item_extension_init_data = {
		ai_inventory_item_system = {
			wielding_unit = unit
		}
	}
	local inventory_configuration = InventoryConfigurations[inventory_configuration_name]
	local items_n = 0
	local multiple_configurations = inventory_configuration.multiple_configurations

	if multiple_configurations then
		self.item_sets = {}

		for i = 1, #multiple_configurations, 1 do
			local item_set = {
				start_index = items_n + 1
			}
			self.item_sets[#self.item_sets + 1] = item_set
			inventory_configuration = InventoryConfigurations[multiple_configurations[i]]
			items_n = self:_setup_configuration(unit, items_n, inventory_configuration, item_extension_init_data)
			item_set.end_index = items_n
			item_set.inventory_configuration = inventory_configuration
			item_set.equip_anim = inventory_configuration.equip_anim
		end

		inventory_configuration = InventoryConfigurations[multiple_configurations[1]]
	else
		items_n = self:_setup_configuration(unit, 0, inventory_configuration, item_extension_init_data)
	end

	self.inventory_items_n = items_n
	self.inventory_configuration_name = inventory_configuration_name
	local anim_state_event = inventory_configuration.anim_state_event

	if anim_state_event then
		Unit.animation_event(unit, anim_state_event)
	end
end

AIInventoryExtension.destroy = function (self)
	local unit_spawner = Managers.state.unit_spawner
	local inventory_items_n = self.inventory_items_n

	for i = 1, inventory_items_n, 1 do
		unit_spawner:mark_for_deletion(self.inventory_item_units[i])
		self:destroy_dropped_items(i)
	end

	for i = 1, #self.gib_items, 1 do
		unit_spawner:mark_for_deletion(self.gib_items[i])
	end

	for i = 1, #self.stump_items, 1 do
		unit_spawner:mark_for_deletion(self.stump_items[i])
	end
end

AIInventoryExtension.destroy_dropped_items = function (self, inventory_item_index)
	local dropped_item = self.dropped_items[inventory_item_index]
	local world = self.world

	if not dropped_item then
		return
	end

	if type(dropped_item) == "table" then
		for _, dropped_unit in pairs(dropped_item) do
			World.destroy_unit(world, dropped_unit)
		end

		table.clear(dropped_item)
	else
		World.destroy_unit(world, dropped_item)
	end
end

AIInventoryExtension.freeze = function (self)
	local unit_spawner = Managers.state.unit_spawner
	local world = self.world
	local inventory_items_n = self.inventory_items_n
	local inventory_item_units = self.inventory_item_units
	local gibbed_nodes = self.gibbed_nodes
	local unit = self.unit
	local one_scale = Vector3(1, 1, 1)

	for i = 1, #gibbed_nodes, 1 do
		local node_index = gibbed_nodes[i]

		Unit.set_local_scale(unit, node_index, one_scale)

		gibbed_nodes[i] = nil
	end

	for i = 1, inventory_items_n, 1 do
		local item_unit = inventory_item_units[i]

		unit_spawner:mark_for_deletion(item_unit)
		self:destroy_dropped_items(i)
	end

	self.inventory_items_n = 0
	local gib_items = self.gib_items
	local stump_items = self.stump_items

	for i = 1, #gib_items, 1 do
		unit_spawner:mark_for_deletion(self.gib_items[i])

		gib_items[i] = nil
	end

	for i = 1, #stump_items, 1 do
		unit_spawner:mark_for_deletion(self.stump_items[i])

		stump_items[i] = nil
	end
end

AIInventoryExtension.unfreeze = function (self)
	local unit = self.unit
	self.dropped = false
	self.wielded = false
	local item_extension_init_data = {
		ai_inventory_item_system = {
			wielding_unit = unit
		}
	}
	local inventory_configuration = InventoryConfigurations[self.inventory_configuration_name]
	local items_n = self:_setup_configuration(unit, 0, inventory_configuration, item_extension_init_data)
	self.inventory_items_n = items_n
	local anim_state_event = inventory_configuration.anim_state_event

	if anim_state_event then
		Unit.animation_event(unit, anim_state_event)
	end
end

AIInventoryExtension.show_single_item = function (self, item_inventory_index, show)
	if script_data.ai_debug_inventory then
		printf("[AIInventorySystem] showing[%s] item_inventory_index[%d]", tostring(show), item_inventory_index)
	end

	local item_unit = self.inventory_item_units[item_inventory_index]
	self.hidden_item_index = (not show and item_inventory_index) or nil

	Unit.set_unit_visibility(item_unit, show)
end

AIInventoryExtension.get_unit = function (self, category)
	return self.inventory_item_units_by_category[category]
end

AIInventoryExtension.get_item_inventory_index = function (self, item_unit)
	for i = 1, self.inventory_items_n, 1 do
		if self.inventory_item_units[i] == item_unit then
			return i
		end
	end

	assert(false, "item_unit not found in ai inventory")
end

AIInventoryExtension.drop_single_item = function (self, item_inventory_index, reason, optional_drop_direction)
	if script_data.ai_debug_inventory then
		printf("[AIInventorySystem] dropping item_inventory_index[%d] with [%d] total items in inventory", item_inventory_index, self.inventory_items_n)
	end

	assert(self.inventory_item_units[item_inventory_index], "item inventory index out of bounds")

	if self.dropped_items[item_inventory_index] ~= nil then
		return false
	end

	local item_unit = self.inventory_item_units[item_inventory_index]
	local item_extension = ScriptUnit.has_extension(item_unit, "ai_inventory_item_system")
	local item = self.inventory_item_definitions[item_inventory_index]
	local item_unit_template_name = item.unit_extension_template or "ai_inventory_item"

	if item_extension and not item_extension.dropped and item.drop_reasons[reason] and item_unit_template_name ~= "ai_helmet_unit" then
		if item.drop_unit_name ~= nil then
			self:_drop_unit(item.drop_unit_name, item_unit, item, item_inventory_index, reason, false, optional_drop_direction)
			self:disable_inventory_item(item, item_unit)
		elseif item.drop_unit_names ~= nil and reason == "shield_break" then
			local drop_units = item.drop_unit_names

			for i = 1, #drop_units, 1 do
				local unit_name_to_drop = drop_units[i]

				self:_drop_unit(unit_name_to_drop, item_unit, item, item_inventory_index, reason, true, optional_drop_direction)
			end

			self:disable_inventory_item(item, item_unit)
		else
			unlink_unit(item.attachment_node_linking, self.world, item_unit)
			Unit.set_flow_variable(item_unit, "lua_drop_reason", reason)
			Unit.set_shader_pass_flag_for_meshes_in_unit_and_childs(item_unit, "outline_unit", false)
			Unit.flow_event(item_unit, "lua_dropped")

			local actor = Unit.create_actor(item_unit, "rp_dropped")

			Actor.add_angular_velocity(actor, Vector3(math.random(), math.random(), math.random()) * 40)
			Actor.add_velocity(actor, optional_drop_direction or Vector3(2 * math.random() - 0.5, 2 * math.random() - 0.5, 4.5))

			item_extension.wielding_unit = nil
			item_extension.dropped = true
			item.dropped = true
		end

		return true, item_unit
	else
		return false
	end
end

AIInventoryExtension.disable_inventory_item = function (self, item, item_unit)
	local item_system = ScriptUnit.has_extension(item_unit, "ai_inventory_item_system")
	local num_actors = Unit.num_actors(item_unit)

	for i = 1, num_actors, 1 do
		local actor = Unit.actor(item_unit, i)

		if actor then
			Actor.set_collision_enabled(actor, false)
			Actor.set_scene_query_enabled(actor, false)
		end
	end

	World.unlink_unit(self.world, item_unit)
	Unit.set_unit_visibility(item_unit, false)

	item_system.wielding_unit = nil
	item_system.dropped = true
	item.dropped = true
end

AIInventoryExtension._drop_unit = function (self, drop_unit_name, item_unit, item, item_inventory_index, reason, drop_multiple, optional_drop_direction)
	local position = Unit.world_position(item_unit, 0)
	local rotation = Unit.world_rotation(item_unit, 0)
	local new_item_unit = World.spawn_unit(self.world, drop_unit_name, position, rotation, nil)

	Unit.set_flow_variable(new_item_unit, "lua_drop_reason", reason)
	Unit.flow_event(new_item_unit, "lua_dropped")

	local actor = Unit.create_actor(new_item_unit, "rp_dropped")

	Actor.add_angular_velocity(actor, Vector3(math.random(), math.random(), math.random()) * 40)
	Actor.add_velocity(actor, optional_drop_direction or Vector3(2 * math.random() - 0.5, 2 * math.random() - 0.5, 4.5))

	if drop_multiple then
		self.dropped_items[item_inventory_index] = self.dropped_items[item_inventory_index] or {}
		local dropped_items = self.dropped_items[item_inventory_index]
		self.dropped_items[item_inventory_index][#dropped_items + 1] = new_item_unit
	else
		self.dropped_items[item_inventory_index] = new_item_unit
	end
end

AIInventoryExtension.wield_item_set = function (self, item_set_index)
	local unit = self.unit
	local network_manager = Managers.state.network
	local unit_id = network_manager:unit_game_object_id(unit)

	network_manager.network_transmit:send_rpc_all("rpc_ai_inventory_wield", unit_id, item_set_index)

	local item_set = self.item_sets[item_set_index]
	local anim_state_event = item_set.inventory_configuration.anim_state_event

	if anim_state_event then
		Managers.state.network:anim_event(unit, anim_state_event)
	end

	local equip_anim = item_set.equip_anim

	if equip_anim then
		Managers.state.network:anim_event(unit, equip_anim)
	end
end

AIInventoryExtension.unwield_set = function (self, item_set_index)
	local item_set = self.item_sets[item_set_index]

	for j = item_set.start_index, item_set.end_index, 1 do
		local item = self.inventory_item_definitions[j]
		local attachment_node_linking = item.attachment_node_linking
		local unwielded = attachment_node_linking.unwielded

		if unwielded then
			local item_unit = self.inventory_item_units[j]

			link_unit(unwielded, self.world, item_unit, self.unit)
		end
	end
end

AIInventoryExtension.play_hit_sound = function (self, victim_unit, damage_type)
	local inventory_configuration_name = self.inventory_configuration_name
	local inventory_configuration = InventoryConfigurations[inventory_configuration_name]
	local enemy_hit_sound = inventory_configuration.enemy_hit_sound

	if damage_type == "blunt" then
		enemy_hit_sound = "melee"
	end

	if enemy_hit_sound == nil then
		return
	end

	local owner = Managers.player:owner(victim_unit)
	local is_husk = owner.remote or owner.bot_player or false

	EffectHelper.play_melee_hit_effects_enemy("enemy_hit", enemy_hit_sound, self.world, victim_unit, damage_type, is_husk)
end

AIInventoryExtension.hot_join_sync = function (self, sender)
	if self.hidden_item_index and ALIVE[self.unit] then
		local go_id = Managers.state.unit_storage:go_id(self.unit)

		RPC.rpc_ai_show_single_item(sender, go_id, self.hidden_item_index, false)
	end

	if self.dropped then
	elseif self.wielded then
		local go_id = Managers.state.unit_storage:go_id(self.unit)

		if go_id then
			RPC.rpc_ai_inventory_wield(sender, go_id, self.current_item_set_index)
		end
	end
end

return
