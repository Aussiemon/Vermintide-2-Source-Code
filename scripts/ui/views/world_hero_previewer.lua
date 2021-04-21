HeroPreviewer = class(HeroPreviewer)

HeroPreviewer.init = function (self, ingame_ui_context, unique_id)
	self.profile_synchronizer = ingame_ui_context.profile_synchronizer
	self.character_unit = nil
	self.world = nil
	self._item_info_by_slot = {}
	self._equipment_units = {}
	self._hidden_units = {}
	self.character_location = {
		0,
		0,
		0
	}
	self.character_look_target = {
		0,
		3,
		1
	}
	self.character_rotation = 0
	self.unique_id = unique_id
	self._session_id = 0
	self._equipment_units[InventorySettings.slots_by_name.slot_melee.slot_index] = {}
	self._equipment_units[InventorySettings.slots_by_name.slot_ranged.slot_index] = {}
end

HeroPreviewer.destroy = function (self)
	self._session_id = self._session_id + 1

	GarbageLeakDetector.register_object(self, "HeroPreviewer")
end

HeroPreviewer.on_enter = function (self, world)
	table.clear(self._hidden_units)

	self.world = world

	Application.set_render_setting("max_shadow_casting_lights", 16)

	self._session_id = self._session_id or 0
end

HeroPreviewer.prepare_exit = function (self)
	self:clear_units()
end

HeroPreviewer.on_exit = function (self)
	self:_unload_all_packages()

	self._hero_loading_package_data = nil
	local max_shadow_casting_lights = Application.user_setting("render_settings", "max_shadow_casting_lights")

	Application.set_render_setting("max_shadow_casting_lights", max_shadow_casting_lights)

	self._session_id = self._session_id + 1
end

HeroPreviewer.update = function (self, dt, t)
	return
end

HeroPreviewer.post_update = function (self, dt)
	self:_update_units_visibility(dt)
	self:_handle_hero_spawn_request()
	self:_poll_hero_package_loading()
	self:_poll_item_package_loading()
end

HeroPreviewer._update_units_visibility = function (self, dt)
	local items_loaded = self:_is_all_items_loaded()

	if not items_loaded then
		return
	end

	local character_unit = self.character_unit

	if not Unit.alive(character_unit) then
		return
	end

	if self._stored_character_animation then
		local force_play_animation = true

		self:play_character_animation(self._stored_character_animation, force_play_animation)

		self._stored_character_animation = nil

		return
	end

	if self.character_unit_hidden_after_spawn then
		self.character_unit_hidden_after_spawn = false

		Unit.flow_event(character_unit, "lua_spawn_attachments")

		if self._draw_character == false then
			self:_set_character_visibility(false)
		else
			self:_set_character_visibility(true)
		end
	end

	for unit, _ in pairs(self._hidden_units) do
		if Unit.alive(unit) then
			Unit.set_unit_visibility(unit, true)
		end

		self._hidden_units[unit] = nil
	end
end

HeroPreviewer._set_character_visibility = function (self, visible)
	self._draw_character = visible

	if self.character_unit_hidden_after_spawn then
		return
	end

	local character_unit = self.character_unit

	if Unit.alive(character_unit) then
		Unit.set_unit_visibility(character_unit, visible)

		local flow_unit_attachments = Unit.get_data(character_unit, "flow_unit_attachments") or {}

		for _, unit in pairs(flow_unit_attachments) do
			Unit.set_unit_visibility(unit, visible)
		end

		local slots_by_slot_index = InventorySettings.slots_by_slot_index
		local attachment_lua_event = (visible and "lua_attachment_unhidden") or "lua_attachment_hidden"

		Unit.flow_event(character_unit, attachment_lua_event)

		local vfx_lua_event = (visible and "lua_ui_vfx_unhidden") or "lua_ui_vfx_hidden"

		Unit.flow_event(character_unit, vfx_lua_event)

		local equipment_units = self._equipment_units

		for slot_index, data in pairs(equipment_units) do
			local slot = slots_by_slot_index[slot_index]
			local category = slot.category
			local slot_type = slot.type
			local is_weapon = category == "weapon"
			local show_unit = nil

			if is_weapon then
				show_unit = visible and slot_type == self._wielded_slot_type
			else
				show_unit = visible
			end

			local weapon_lua_event = (show_unit and "lua_wield") or "lua_unwield"

			if type(data) == "table" then
				local left_unit = data.left
				local right_unit = data.right

				if Unit.alive(left_unit) then
					Unit.flow_event(left_unit, weapon_lua_event)
					Unit.set_unit_visibility(left_unit, show_unit)

					self._hidden_units[left_unit] = nil
				end

				if Unit.alive(right_unit) then
					Unit.flow_event(right_unit, weapon_lua_event)
					Unit.set_unit_visibility(right_unit, show_unit)

					self._hidden_units[right_unit] = nil
				end
			elseif Unit.alive(data) then
				if not is_weapon then
					local non_weapon_attachment_lua_event = (show_unit and "lua_attachment_unhidden") or "lua_attachment_hidden"

					Unit.flow_event(data, non_weapon_attachment_lua_event)
				end

				Unit.flow_event(data, weapon_lua_event)
				Unit.set_unit_visibility(data, show_unit)

				self._hidden_units[data] = nil
			end
		end

		if visible then
			local skin_data = self.character_unit_skin_data
			local material_changes = skin_data.material_changes

			if material_changes then
				local third_person_changes = material_changes.third_person

				for slot_name, material_name in pairs(third_person_changes) do
					for _, unit in pairs(flow_unit_attachments) do
						Unit.set_material(unit, slot_name, material_name)
					end
				end
			end

			for slot_name, data in pairs(self._item_info_by_slot) do
				if data.loaded then
					local item_name = data.name
					local item_template = ItemHelper.get_template_by_item_name(item_name)
					local show_attachments_event = item_template.show_attachments_event

					if show_attachments_event then
						Unit.flow_event(character_unit, show_attachments_event)
					end
				end
			end
		end

		self.character_unit_visible = visible
	end
end

HeroPreviewer.character_visible = function (self)
	return self.character_unit_visible and Unit.alive(self.character_unit)
end

HeroPreviewer.play_character_animation = function (self, animation_event, force_play_animation)
	local character_unit = self.character_unit

	if character_unit == nil then
		return
	end

	if not self.character_unit_visible and not force_play_animation then
		self._stored_character_animation = animation_event
	else
		Unit.animation_event(character_unit, animation_event)
	end
end

HeroPreviewer.request_spawn_hero_unit = function (self, profile_name, career_index, callback, optional_skin)
	self._requested_hero_spawn_data = {
		frame_delay = 1,
		profile_name = profile_name,
		career_index = career_index,
		callback = callback,
		optional_skin = optional_skin
	}

	self:clear_units()
end

HeroPreviewer._handle_hero_spawn_request = function (self)
	if self._requested_hero_spawn_data then
		local requested_hero_spawn_data = self._requested_hero_spawn_data
		local frame_delay = requested_hero_spawn_data.frame_delay

		if frame_delay == 0 then
			local profile_name = requested_hero_spawn_data.profile_name
			local career_index = requested_hero_spawn_data.career_index
			local callback = requested_hero_spawn_data.callback
			local optional_skin = requested_hero_spawn_data.optional_skin

			self:_load_hero_unit(profile_name, career_index, callback, optional_skin)

			self._requested_hero_spawn_data = nil
		else
			requested_hero_spawn_data.frame_delay = frame_delay - 1
		end
	end
end

HeroPreviewer._load_hero_unit = function (self, profile_name, career_index, callback, optional_skin, optional_scale)
	self:_unload_all_packages()

	self._current_profile_name = profile_name
	local profile_index = FindProfileIndex(profile_name)
	local profile = SPProfiles[profile_index]
	local career = profile.careers[career_index]
	local career_name = career.name
	local skin_item = BackendUtils.get_loadout_item(career_name, "slot_skin")
	local item_data = skin_item and skin_item.data
	local skin_name = optional_skin or (item_data and item_data.name) or career.base_skin
	self._current_career_name = career_name
	self.character_unit_skin_data = nil
	local package_names = {}
	local skin_data = Cosmetics[skin_name]
	local unit_name = skin_data.third_person
	local material_changes = skin_data.material_changes
	package_names[#package_names + 1] = unit_name

	if material_changes then
		local material_package = material_changes.package_name
		package_names[#package_names + 1] = material_package
	end

	local data = {
		num_loaded_packages = 0,
		career_name = career_name,
		skin_data = skin_data,
		career_index = career_index,
		optional_scale = optional_scale,
		package_names = package_names,
		num_packages = #package_names,
		callback = callback
	}

	self:_load_packages(package_names)

	self._hero_loading_package_data = data
end

HeroPreviewer._poll_hero_package_loading = function (self)
	local data = self._hero_loading_package_data

	if not data or data.loaded then
		return
	end

	local requested_hero_spawn_data = self._requested_hero_spawn_data

	if requested_hero_spawn_data then
		return
	end

	local reference_name = self:_reference_name()
	local package_manager = Managers.package
	local package_names = data.package_names
	local all_packages_loaded = true

	for i = 1, #package_names, 1 do
		local package_name = package_names[i]

		if not package_manager:has_loaded(package_name, reference_name) then
			all_packages_loaded = false

			break
		end
	end

	if all_packages_loaded then
		local skin_data = data.skin_data
		local optional_scale = data.optional_scale
		local career_index = data.career_index

		self:_spawn_hero_unit(skin_data, optional_scale, career_index)

		local callback = data.callback

		if callback then
			callback()
		end

		data.loaded = true
	end
end

HeroPreviewer._spawn_hero_unit = function (self, skin_data, optional_scale, career_index)
	local world = self.world
	local unit_name = skin_data.third_person
	local tint_data = skin_data.color_tint
	local character_unit = World.spawn_unit(world, unit_name, Vector3Aux.unbox(self.character_location), Quaternion.axis_angle(Vector3.up(), self.character_rotation))
	local material_changes = skin_data.material_changes

	if material_changes then
		local third_person_changes = material_changes.third_person

		for slot_name, material_name in pairs(third_person_changes) do
			Unit.set_material(character_unit, slot_name, material_name)
		end
	end

	if tint_data then
		local gradient_variation = tint_data.gradient_variation
		local gradient_value = tint_data.gradient_value

		CosmeticUtils.color_tint_unit(character_unit, self._current_profile_name, gradient_variation, gradient_value)
	end

	Unit.set_unit_visibility(character_unit, false)

	self.character_unit = character_unit
	self.character_unit_hidden_after_spawn = true
	self.character_unit_visible = false
	self.character_unit_skin_data = skin_data
	self._stored_character_animation = nil

	if Unit.has_lod_object(character_unit, "lod") then
		local lod_object = Unit.lod_object(character_unit, "lod")

		LODObject.set_static_height(lod_object, 1)
	end

	local look_target = Vector3Aux.unbox(self.character_look_target)
	local aim_constraint_anim_var = Unit.animation_find_constraint_target(character_unit, "aim_constraint_target")

	Unit.animation_set_constraint_target(character_unit, aim_constraint_anim_var, look_target)

	local _, box_dimension = Unit.box(character_unit)

	if box_dimension then
		local default_unit_height_dimension = 1.7
		self.unit_max_look_height = (default_unit_height_dimension < box_dimension.z and 1.5) or 0.9
	else
		self.unit_max_look_height = 0.9
	end

	if optional_scale then
		local scale = Vector3(optional_scale, optional_scale, optional_scale)

		Unit.set_local_scale(character_unit, 0, scale)
	end

	if Unit.animation_has_variable(character_unit, "career_index") then
		local variable_index = Unit.animation_find_variable(character_unit, "career_index")

		Unit.animation_set_variable(character_unit, variable_index, career_index)
	end
end

HeroPreviewer.respawn_hero_unit = function (self, profile_name, career_index, callback)
	self:request_spawn_hero_unit(profile_name, career_index, callback, nil, nil)
end

HeroPreviewer.get_equipped_item_info = function (self, slot)
	local item_slot_type = slot.type
	local item_info_by_slot = self._item_info_by_slot

	return item_info_by_slot[item_slot_type]
end

HeroPreviewer.equip_item = function (self, item_name, slot, backend_id, skin)
	local skin_data = self.character_unit_skin_data

	if skin_data and skin_data.always_hide_attachment_slots then
		local hide_slot = false

		for _, slot_name in ipairs(skin_data.always_hide_attachment_slots) do
			if slot.name == slot_name then
				printf("[HeroPreviewer]:equip_item() - Skipping equipping of item(%s), because equipped skin(%s) wants to hide it", item_name, skin_data.name)

				hide_slot = true

				break
			end
		end

		if hide_slot then
			return
		end
	end

	local item_slot_type = slot.type
	local slot_index = slot.slot_index
	local item_data = ItemMasterList[item_name]
	local item_units = BackendUtils.get_item_units(item_data, backend_id, skin)
	local item_template = ItemHelper.get_template_by_item_name(item_name)
	local spawn_data = {}
	local package_names = {}

	if item_slot_type == "melee" or item_slot_type == "ranged" then
		local left_hand_unit = item_units.left_hand_unit
		local right_hand_unit = item_units.right_hand_unit
		local material_settings = item_units.material_settings
		local despawn_both_hands_units = right_hand_unit == nil or left_hand_unit == nil

		if left_hand_unit then
			local unit_attachment_node_linking = item_template.left_hand_attachment_node_linking.third_person

			if item_units.is_ammo_weapon then
				left_hand_unit = item_units.ammo_unit
				local ammo_data = item_template.ammo_data
				unit_attachment_node_linking = ammo_data.ammo_unit_attachment_node_linking.third_person
			end

			local left_unit = left_hand_unit .. "_3p"
			spawn_data[#spawn_data + 1] = {
				left_hand = true,
				despawn_both_hands_units = despawn_both_hands_units,
				unit_name = left_unit,
				item_slot_type = item_slot_type,
				slot_index = slot_index,
				unit_attachment_node_linking = unit_attachment_node_linking,
				material_settings = material_settings
			}
			package_names[#package_names + 1] = left_unit
		end

		if right_hand_unit then
			local unit_attachment_node_linking = item_template.right_hand_attachment_node_linking.third_person

			if item_units.is_ammo_weapon then
				right_hand_unit = item_units.ammo_unit
				unit_attachment_node_linking = item_template.right_hand_attachment_node_linking.third_person
			end

			local right_unit = right_hand_unit .. "_3p"
			spawn_data[#spawn_data + 1] = {
				right_hand = true,
				despawn_both_hands_units = despawn_both_hands_units,
				unit_name = right_unit,
				item_slot_type = item_slot_type,
				slot_index = slot_index,
				unit_attachment_node_linking = unit_attachment_node_linking,
				material_settings = material_settings
			}

			if right_hand_unit ~= left_hand_unit then
				package_names[#package_names + 1] = right_unit
			end
		end
	elseif item_slot_type == "hat" then
		local unit = item_units.unit

		if unit then
			local attachment_slot_lookup_index = 3

			if item_slot_type == "hat" then
				attachment_slot_lookup_index = 1
			end

			local attachment_slot_name = item_template.slots[attachment_slot_lookup_index]
			local character_material_changes = item_template.character_material_changes
			spawn_data[#spawn_data + 1] = {
				unit_name = unit,
				item_slot_type = item_slot_type,
				slot_index = slot_index,
				unit_attachment_node_linking = item_template.attachment_node_linking[attachment_slot_name],
				character_material_changes = character_material_changes
			}
			package_names[#package_names + 1] = unit

			if character_material_changes then
				package_names[#package_names + 1] = character_material_changes.package_name
			end
		end
	end

	if #package_names > 0 then
		local item_info_by_slot = self._item_info_by_slot
		local previous_slot_data = item_info_by_slot[item_slot_type]

		if previous_slot_data then
			self:_destroy_item_units_by_slot(item_slot_type)
			self:_unload_item_packages_by_slot(item_slot_type)
		end

		item_info_by_slot[item_slot_type] = {
			name = item_name,
			backend_id = backend_id,
			skin_name = skin,
			package_names = package_names,
			spawn_data = spawn_data
		}

		self:_load_packages(package_names)
	end
end

HeroPreviewer._poll_item_package_loading = function (self)
	local character_unit = self.character_unit

	if not Unit.alive(character_unit) then
		return
	end

	local requested_hero_spawn_data = self._requested_hero_spawn_data

	if requested_hero_spawn_data then
		return
	end

	local reference_name = self:_reference_name()
	local package_manager = Managers.package
	local item_info_by_slot = self._item_info_by_slot

	for slot_name, data in pairs(item_info_by_slot) do
		if not data.loaded then
			local package_names = data.package_names
			local all_packages_loaded = true

			for i = 1, #package_names, 1 do
				local package_name = package_names[i]

				if not package_manager:has_loaded(package_name, reference_name) then
					all_packages_loaded = false

					break
				end
			end

			if all_packages_loaded then
				data.loaded = true
				local item_name = data.name
				local spawn_data = data.spawn_data

				self:_spawn_item(item_name, spawn_data)
			end
		end
	end
end

HeroPreviewer._is_all_items_loaded = function (self)
	local item_info_by_slot = self._item_info_by_slot
	local all_loaded = true

	for slot_name, data in pairs(item_info_by_slot) do
		if not data.loaded then
			all_loaded = false

			break
		end
	end

	return all_loaded
end

HeroPreviewer._spawn_item = function (self, item_name, spawn_data)
	local world = self.world
	local character_unit = self.character_unit
	local scene_graph_links = {}
	local item_template = ItemHelper.get_template_by_item_name(item_name)
	local hero_material_changed = false

	for _, unit_spawn_data in ipairs(spawn_data) do
		local unit_name = unit_spawn_data.unit_name
		local item_slot_type = unit_spawn_data.item_slot_type
		local slot_index = unit_spawn_data.slot_index
		local unit_attachment_node_linking = unit_spawn_data.unit_attachment_node_linking
		local character_material_changes = unit_spawn_data.character_material_changes
		local material_settings = unit_spawn_data.material_settings

		if item_slot_type == "melee" or item_slot_type == "ranged" then
			local unit = World.spawn_unit(world, unit_name)

			self:_spawn_item_unit(unit, item_slot_type, item_template, unit_attachment_node_linking, scene_graph_links, material_settings)

			if unit_spawn_data.right_hand then
				self._equipment_units[slot_index].right = unit
			elseif unit_spawn_data.left_hand then
				self._equipment_units[slot_index].left = unit
			end
		else
			local unit = World.spawn_unit(world, unit_name)
			self._equipment_units[slot_index] = unit

			self:_spawn_item_unit(unit, item_slot_type, item_template, unit_attachment_node_linking, scene_graph_links)
		end

		local show_attachments_event = item_template.show_attachments_event

		if show_attachments_event and self.character_unit_visible then
			Unit.flow_event(character_unit, show_attachments_event)
		end

		if character_material_changes then
			local third_person_changes = character_material_changes.third_person
			local flow_unit_attachments = Unit.get_data(character_unit, "flow_unit_attachments") or {}

			for slot_name, material_name in pairs(third_person_changes) do
				for _, unit in pairs(flow_unit_attachments) do
					Unit.set_material(unit, slot_name, material_name)
				end

				Unit.set_material(character_unit, slot_name, material_name)

				hero_material_changed = true
			end
		end
	end

	return hero_material_changed
end

HeroPreviewer._spawn_item_unit = function (self, unit, item_slot_type, item_template, unit_attachment_node_linking, scene_graph_links, material_settings)
	local world = self.world
	local character_unit = self.character_unit
	local character_visible = self:character_visible()

	if item_slot_type == "melee" or item_slot_type == "ranged" then
		if self._wielded_slot_type == item_slot_type then
			unit_attachment_node_linking = unit_attachment_node_linking.wielded

			if not script_data.disable_third_person_weapon_animation_events and item_template.wield_anim then
				Unit.animation_event(character_unit, item_template.wield_anim)
			end

			self._hidden_units[unit] = true
			local flow_event = (character_visible and "lua_wield") or "lua_unwield"

			Unit.flow_event(unit, flow_event)
		else
			unit_attachment_node_linking = unit_attachment_node_linking.unwielded

			Unit.flow_event(unit, "lua_unwield")
		end
	else
		local attachment_lua_event = (character_visible and "lua_attachment_unhidden") or "lua_attachment_hidden"

		Unit.flow_event(unit, attachment_lua_event)

		self._hidden_units[unit] = true
	end

	Unit.set_unit_visibility(unit, false)

	if Unit.has_lod_object(unit, "lod") then
		local lod_object = Unit.lod_object(unit, "lod")

		LODObject.set_static_height(lod_object, 1)
	end

	GearUtils.link(world, unit_attachment_node_linking, scene_graph_links, character_unit, unit)

	if material_settings then
		GearUtils.apply_material_settings(unit, material_settings)
	end
end

HeroPreviewer._destroy_item_units_by_slot = function (self, slot_type)
	local world = self.world
	local hidden_units = self._hidden_units
	local item_info_by_slot = self._item_info_by_slot
	local data = item_info_by_slot[slot_type]
	local spawn_data = data.spawn_data

	if spawn_data then
		for _, unit_spawn_data in ipairs(spawn_data) do
			local item_slot_type = unit_spawn_data.item_slot_type
			local slot_index = unit_spawn_data.slot_index

			if item_slot_type == "melee" or item_slot_type == "ranged" then
				if unit_spawn_data.right_hand or unit_spawn_data.despawn_both_hands_units then
					local old_unit_right = self._equipment_units[slot_index].right

					if old_unit_right ~= nil then
						hidden_units[old_unit_right] = nil

						World.destroy_unit(world, old_unit_right)

						self._equipment_units[slot_index].right = nil
					end
				end

				if unit_spawn_data.left_hand or unit_spawn_data.despawn_both_hands_units then
					local old_unit_left = self._equipment_units[slot_index].left

					if old_unit_left ~= nil then
						hidden_units[old_unit_left] = nil

						World.destroy_unit(world, old_unit_left)

						self._equipment_units[slot_index].left = nil
					end
				end
			else
				local old_unit = self._equipment_units[slot_index]

				if old_unit ~= nil then
					hidden_units[old_unit] = nil

					World.destroy_unit(world, old_unit)

					self._equipment_units[slot_index] = nil
				end
			end
		end
	end
end

HeroPreviewer.wield_weapon_slot = function (self, slot_type)
	self._wielded_slot_type = slot_type
	local melee_slot_info = self._item_info_by_slot.melee

	if melee_slot_info then
		local item_name = melee_slot_info.name
		local backend_id = melee_slot_info.backend_id
		local skin_name = melee_slot_info.skin_name

		self:equip_item(item_name, InventorySettings.slots_by_name.slot_melee, backend_id, skin_name)
	end

	local ranged_slot_info = self._item_info_by_slot.ranged

	if ranged_slot_info then
		local item_name = ranged_slot_info.name
		local backend_id = ranged_slot_info.backend_id
		local skin_name = ranged_slot_info.skin_name

		self:equip_item(item_name, InventorySettings.slots_by_name.slot_ranged, backend_id, skin_name)
	end
end

HeroPreviewer.item_name_by_slot_type = function (self, item_slot_type)
	local item_info = self._item_info_by_slot[item_slot_type]

	return item_info and item_info.name
end

HeroPreviewer.wielded_slot_type = function (self)
	return self._wielded_slot_type
end

HeroPreviewer._reference_name = function (self)
	local reference_name = "HeroPreviewer"

	if self.unique_id then
		reference_name = reference_name .. tostring(self.unique_id)
	end

	return reference_name
end

HeroPreviewer._load_packages = function (self, package_names)
	local reference_name = self:_reference_name()
	local package_manager = Managers.package

	for index, package_name in ipairs(package_names) do
		package_manager:load(package_name, reference_name, nil, true, true)
	end
end

HeroPreviewer._unload_all_packages = function (self)
	self:_unload_hero_packages()
	self:_unload_all_items()
end

HeroPreviewer._unload_hero_packages = function (self)
	local data = self._hero_loading_package_data

	if not data then
		return
	end

	local package_names = data.package_names
	local package_manager = Managers.package
	local reference_name = self:_reference_name()

	for _, package_name in pairs(package_names) do
		package_manager:unload(package_name, reference_name)
	end

	self._hero_loading_package_data = nil
end

HeroPreviewer._unload_all_items = function (self)
	local item_info_by_slot = self._item_info_by_slot

	for slot_type, data in pairs(item_info_by_slot) do
		self:_unload_item_packages_by_slot(slot_type)
	end
end

HeroPreviewer._unload_item_packages_by_slot = function (self, slot_type)
	local item_info_by_slot = self._item_info_by_slot

	if item_info_by_slot[slot_type] then
		local slot_type_data = item_info_by_slot[slot_type]
		local package_names = slot_type_data.package_names
		local package_manager = Managers.package
		local reference_name = self:_reference_name()

		for _, package_name in ipairs(package_names) do
			package_manager:unload(package_name, reference_name)
		end

		item_info_by_slot[slot_type] = nil
	end
end

HeroPreviewer.clear_units = function (self)
	local world = self.world

	for i = 1, 6, 1 do
		if type(self._equipment_units[i]) == "table" then
			if self._equipment_units[i].left then
				World.destroy_unit(world, self._equipment_units[i].left)

				self._equipment_units[i].left = nil
			end

			if self._equipment_units[i].right then
				World.destroy_unit(world, self._equipment_units[i].right)

				self._equipment_units[i].right = nil
			end
		elseif self._equipment_units[i] then
			World.destroy_unit(world, self._equipment_units[i])

			self._equipment_units[i] = nil
		end
	end

	if self.character_unit then
		World.destroy_unit(world, self.character_unit)

		self.character_unit = nil
	end
end

HeroPreviewer.set_hero_location = function (self, location)
	if location then
		self.character_location = location
		local character_unit = self.character_unit

		if character_unit and Unit.alive(character_unit) then
			Unit.set_local_position(character_unit, 0, Vector3Aux.unbox(location))
		end
	end
end

HeroPreviewer.set_hero_rotation = function (self, angle)
	if angle then
		self.character_rotation = angle
		local character_unit = self.character_unit

		if character_unit and Unit.alive(character_unit) then
			local rotation_quat = Quaternion.axis_angle(Vector3.up(), angle)

			Unit.set_local_rotation(character_unit, 0, rotation_quat)
		end
	end
end

HeroPreviewer.set_hero_look_target = function (self, look_target)
	if look_target then
		self.character_look_target = look_target
	end
end

return
