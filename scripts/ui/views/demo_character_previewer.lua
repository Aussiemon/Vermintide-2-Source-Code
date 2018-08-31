DemoCharacterPreviewer = class(DemoCharacterPreviewer)

DemoCharacterPreviewer.init = function (self, world, profile_name, career_index, position, rotation, zoom_offset)
	self._world = world
	self._profile_name = profile_name
	self._career_index = career_index
	self._position = position or Vector3Box(0, 0, 0)
	self._rotation = rotation or QuaternionBox(Quaternion.identity())
	self._zoom_offset = zoom_offset or Vector3Box(Vector3.identity())
	self.item_spawn_data = {}
	self.item_names = {}
	self._packages_to_load = {}
	self._loaded_packages = {}
	self._equipment_units = {
		[InventorySettings.slots_by_name.slot_melee.slot_index] = {},
		[InventorySettings.slots_by_name.slot_ranged.slot_index] = {}
	}

	if BUILD == "dev" or BUILD == "debug" then
		self._line_object = World.create_line_object(self._world)
	end

	self:_spawn_character()
end

DemoCharacterPreviewer.reset_state = function (self)
	self._is_hover = nil
	self._is_pressed = nil

	self:outline_unit(false)
end

DemoCharacterPreviewer._spawn_character = function (self, position)
	self._position = position or self._position

	self:_reset_hero()

	local profile_name = self._profile_name
	local career_index = self._career_index

	self:_spawn_hero_unit(profile_name, career_index)
end

DemoCharacterPreviewer._color_from_table = function (self, color_table)
	return Color(color_table[1], color_table[2], color_table[3], color_table[4])
end

DemoCharacterPreviewer.outline_unit = function (self, enable_outline, outline_settings, extra_time)
	if self._outlined == enable_outline then
		return
	end

	if Unit.alive(self._character_unit) then
		local shader_pass_flag = "outline_unit"
		local unit = self._character_unit

		Unit.set_shader_pass_flag_for_meshes_in_unit_and_childs(unit, shader_pass_flag, enable_outline)

		if enable_outline then
			local channel = self:_color_from_table(outline_settings.channel)
			local extra_time = extra_time or 0

			Unit.set_color_for_materials_in_unit_and_childs(unit, "outline_color", channel)
			Unit.set_scalar_for_materials_in_unit_and_childs(unit, "outline_time", World.time(self._world) + extra_time)
		end

		self._outlined = enable_outline
	end
end

DemoCharacterPreviewer.is_outlined = function (self)
	return self._outlined
end

DemoCharacterPreviewer._reset_hero = function (self)
	if self._character_unit then
		World.destroy_unit(self._world, self._character_unit)

		self._character_unit = nil
	end

	local equipment_units = table.clone(self._equipment_units)

	for slot_index, slot_data in pairs(equipment_units) do
		if type(slot_data) == "table" then
			if slot_data.left then
				World.destroy_unit(self._world, slot_data.left)

				self._equipment_units[slot_index].left = nil
			end

			if slot_data.right then
				World.destroy_unit(self._world, slot_data.right)

				self._equipment_units[slot_index].right = nil
			end
		else
			World.destroy_unit(self._world, slot_data)

			self._equipment_units[slot_index] = nil
		end
	end

	for package_name, _ in pairs(self._packages_to_load) do
		Managers.package:unload(package_name, "DemoCharacterPreviewer")
	end

	self._packages_to_load = {}

	for package_name, _ in pairs(self._loaded_packages) do
		Managers.package:unload(package_name, "DemoCharacterPreviewer")
	end

	self._loaded_packages = {}

	if self._line_object then
		LineObject.reset(self._line_object)
		LineObject.dispatch(self._world, self._line_object)
	end
end

DemoCharacterPreviewer._spawn_hero_unit = function (self, profile_name, career_index)
	local profile_index = FindProfileIndex(profile_name)
	local profile = SPProfiles[profile_index]
	local career = profile.careers[career_index]
	local skin_name = career.base_skin
	local skin_data = Cosmetics[skin_name]
	local unit_name = skin_data.third_person

	if Managers.package:has_loaded(unit_name) then
		self:cb_spawn_hero_unit(profile, career, skin_data)
	else
		Managers.package:load(unit_name, "DemoCharacterPreviewer", callback(self, "cb_spawn_hero_unit", profile, career, skin_data), true, true)
	end
end

DemoCharacterPreviewer.cb_spawn_hero_unit = function (self, profile, career, skin_data)
	local world = self._world
	local unit_name = skin_data.third_person
	local tint_data = skin_data.color_tint
	local character_unit = World.spawn_unit(world, unit_name, self._position:unbox(), self._rotation:unbox())

	if tint_data then
		local gradient_variation = tint_data.gradient_variation
		local gradient_value = tint_data.gradient_value

		CosmeticUtils.color_tint_unit(character_unit, self._profile_name, gradient_variation, gradient_value)
	end

	self._character_unit = character_unit

	if Unit.has_lod_object(character_unit, "lod") then
		local lod_object = Unit.lod_object(character_unit, "lod")

		LODObject.set_static_select(lod_object, 0)
	end

	local unit_box, box_dimension = Unit.box(character_unit)

	if box_dimension then
		local default_unit_height_dimension = 1.7
		local default_diff = box_dimension.z - default_unit_height_dimension
		self.unit_max_look_height = (default_unit_height_dimension < box_dimension.z and 1.5) or 0.9
	else
		self.unit_max_look_height = 0.9
	end

	Unit.flow_event(character_unit, "lua_spawn_attachments")
	self:_spawn_inventory(career)
end

DemoCharacterPreviewer.update = function (self, activated, dt, t)
	self:_update_aim_constraint(dt, t)

	if activated then
		self:_update_hover(dt, t)
		self:_update_pressed(dt, t)
	end
end

DemoCharacterPreviewer._update_hover = function (self)
	local input_service = Managers.input:get_service("main_menu")
	local cursor = input_service:get("cursor")

	if not cursor then
		return
	else
		local scale = RESOLUTION_LOOKUP.scale
		cursor.x = cursor.x * scale
		cursor.y = cursor.y * scale
	end

	if not Unit.alive(self._character_unit) then
		return
	end

	local viewport = ScriptWorld.viewport(self._world, "title_screen_viewport")
	local camera = ScriptViewport.camera(viewport)
	local from = Camera.screen_to_world(camera, Vector3(cursor.x, cursor.y, 0), 0)
	local to = Camera.screen_to_world(camera, Vector3(cursor.x, cursor.y, 0), 1)
	local direction = to - from
	local physics_world = World.physics_world(self._world)
	local unit_box, box_dimension = Unit.box(self._character_unit)
	box_dimension[1] = box_dimension[1] * 0.25
	box_dimension[2] = box_dimension[2] * 0.25
	local hit = Intersect.ray_box(from, direction, unit_box, box_dimension)

	if hit then
		if not self._is_hover then
			Managers.music:trigger_event("Play_demo_hud_character_hover")
			self:outline_unit(true, OutlineSettings.colors.interactable)

			self._is_hover = true
		end
	else
		if not self._is_pressed then
			self:outline_unit(false, OutlineSettings.colors.interactable)
		end

		self._is_hover = false
	end
end

DemoCharacterPreviewer._update_pressed = function (self, dt, t)
	self._was_pressed_this_frame = nil
	local input_service = Managers.input:get_service("main_menu")

	if input_service:get("start") then
		if self._is_hover then
			if not self._is_pressed then
				self._is_pressed = true
				self._was_pressed_this_frame = true
				self._outlined = false

				self:outline_unit(true, OutlineSettings.colors.ally)
				Managers.music:trigger_event("Play_demo_hud_character_select")
			end
		else
			self._is_pressed = false

			self:outline_unit(false, OutlineSettings.colors.ally)
		end
	end
end

DemoCharacterPreviewer.cb_on_select_animation_complete = function (self)
	local node = "j_neck"
	local unit = self._character_unit

	if Unit.alive(unit) then
		local node_index = Unit.has_node(unit, node) and Unit.node(unit, node)
		local pos = Unit.world_position(unit, node_index)
		local wwise_world = Managers.world:wwise_world(self._world)
		local wwise_source_id = WwiseWorld.make_auto_source(wwise_world, pos)

		WwiseWorld.trigger_event(wwise_world, DemoSettings.play_on_select[self._profile_name], wwise_source_id)
	end
end

DemoCharacterPreviewer.pressed_pose = function (self)
	local viewport = ScriptWorld.viewport(self._world, "title_screen_viewport")
	local camera = ScriptViewport.camera(viewport)
	local current_camera_rot = ScriptCamera.rotation(camera)
	local camera_forward_flat = Vector3.flat(Quaternion.forward(current_camera_rot))
	local camera_right_flat = Vector3.flat(Quaternion.right(current_camera_rot))
	local camera_rot = Quaternion.look(camera_forward_flat, Vector3.up())
	local node = "j_neck"
	local unit = self._character_unit
	local node_index = Unit.has_node(unit, node) and Unit.node(unit, node)
	local pos = Unit.world_position(unit, node_index)
	local zoom_offset = self._zoom_offset:unbox()
	local camera_pos = pos + camera_right_flat * zoom_offset[1] + camera_forward_flat * zoom_offset[2] + Vector3.up() * zoom_offset[3]

	return Matrix4x4Box(Matrix4x4.from_quaternion_position(current_camera_rot, camera_pos))
end

DemoCharacterPreviewer._update_aim_constraint = function (self, dt, t)
	if not Unit.alive(self._character_unit) then
		return
	end

	local viewport = ScriptWorld.viewport(self._world, "title_screen_viewport")
	local camera = ScriptViewport.camera(viewport)
	local position = ScriptCamera.position(camera)
	local character_unit = self._character_unit
	local aim_constraint_anim_var = Unit.animation_find_constraint_target(character_unit, "aim_constraint_target")

	Unit.animation_set_constraint_target(character_unit, aim_constraint_anim_var, position)
end

DemoCharacterPreviewer.is_hover = function (self)
	return self._is_hover
end

DemoCharacterPreviewer.is_pressed = function (self)
	return self._is_pressed
end

DemoCharacterPreviewer.was_pressed_this_frame = function (self)
	local was_pressed_this_frame = self._was_pressed_this_frame
	self._was_pressed_this_frame = nil

	return was_pressed_this_frame
end

DemoCharacterPreviewer.profile_information = function (self)
	return self._profile_name, self._career_index
end

DemoCharacterPreviewer._spawn_inventory = function (self, career)
	local preview_animation = career.preview_animation
	local preview_wield_slot = career.preview_wield_slot
	local preview_items = career.preview_items

	if preview_items then
		for _, item_name in ipairs(preview_items) do
			local item_template = ItemMasterList[item_name]
			local slot_type = item_template.slot_type
			local slot_names = InventorySettings.slot_names_by_type[slot_type]
			local slot_name = slot_names[1]
			local slot = InventorySettings.slots_by_name[slot_name]

			self:_equip_item(item_name, slot)
		end

		if preview_wield_slot then
			self:wield_weapon_slot(preview_wield_slot)
		end
	end

	if preview_animation then
		self:play_character_animation(preview_animation)
	end

	self._character_spawned = true
end

DemoCharacterPreviewer.character_spawned = function (self)
	return self._character_spawned
end

DemoCharacterPreviewer.wield_weapon_slot = function (self, slot_type)
	self._wielded_slot_type = slot_type

	if self.item_names.melee then
		self:_equip_item(self.item_names.melee, InventorySettings.slots_by_name.slot_melee)
	end

	if self.item_names.ranged then
		self:_equip_item(self.item_names.ranged, InventorySettings.slots_by_name.slot_ranged)
	end
end

DemoCharacterPreviewer.play_character_animation = function (self, animation_event)
	local character_unit = self._character_unit

	if character_unit == nil then
		return
	end

	Unit.animation_event(character_unit, animation_event)
end

DemoCharacterPreviewer._equip_item = function (self, item_name, slot)
	self.items_loaded = nil
	local item_slot_type = slot.type
	local slot_index = slot.slot_index
	local item_data = ItemMasterList[item_name]
	local item_units = BackendUtils.get_item_units(item_data)
	local item_template = ItemHelper.get_template_by_item_name(item_name)
	local units_to_spawn_data = {}
	local package_names = {}

	if item_slot_type == "melee" or item_slot_type == "ranged" then
		local left_hand_unit = item_units.left_hand_unit
		local right_hand_unit = item_units.right_hand_unit
		local material_settings = item_units.material_settings
		local despawn_both_hands_units = right_hand_unit == nil or left_hand_unit == nil

		if left_hand_unit then
			local left_unit = left_hand_unit .. "_3p"
			units_to_spawn_data[#units_to_spawn_data + 1] = {
				left_hand = true,
				despawn_both_hands_units = despawn_both_hands_units,
				unit_name = left_unit,
				item_slot_type = item_slot_type,
				slot_index = slot_index,
				unit_attachment_node_linking = item_template.left_hand_attachment_node_linking.third_person,
				material_settings = material_settings
			}
			package_names[#package_names + 1] = left_unit
		end

		if right_hand_unit then
			local right_unit = right_hand_unit .. "_3p"
			units_to_spawn_data[#units_to_spawn_data + 1] = {
				right_hand = true,
				despawn_both_hands_units = despawn_both_hands_units,
				unit_name = right_unit,
				item_slot_type = item_slot_type,
				slot_index = slot_index,
				unit_attachment_node_linking = item_template.right_hand_attachment_node_linking.third_person,
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
			units_to_spawn_data[#units_to_spawn_data + 1] = {
				unit_name = unit,
				item_slot_type = item_slot_type,
				slot_index = slot_index,
				unit_attachment_node_linking = item_template.attachment_node_linking[attachment_slot_name]
			}
			package_names[#package_names + 1] = unit
		end
	end

	if #package_names > 0 then
		self.item_spawn_data[item_name] = units_to_spawn_data
		self.item_names[item_slot_type] = item_name

		self:load_package(package_names, item_name)
	end
end

DemoCharacterPreviewer.load_package = function (self, package_names, item_name)
	local package_names_to_load = {}

	for index, package_name in ipairs(package_names) do
		if not self._packages_to_load[package_name] then
			self._packages_to_load[package_name] = true
			package_names_to_load[#package_names_to_load + 1] = package_name
		end
	end

	for index, package_name in ipairs(package_names_to_load) do
		local package_manager = Managers.package
		local cb = callback(self, "on_load_complete", package_name, item_name)

		package_manager:load(package_name, "DemoCharacterPreviewer", cb, true, true)
	end
end

DemoCharacterPreviewer.on_load_complete = function (self, package_name, item_name)
	local loaded_packages = self._loaded_packages
	loaded_packages[package_name] = true
	self._packages_to_load[package_name] = nil
	local item_names = self.item_names
	local spawn_data = self.item_spawn_data[item_name]

	for _, unit_spawn_data in ipairs(spawn_data) do
		local item_slot_type = unit_spawn_data.item_slot_type

		if item_names[item_slot_type] ~= item_name then
			return
		end

		local unit_name = unit_spawn_data.unit_name

		if not loaded_packages[unit_name] then
			return
		end
	end

	self:_spawn_item(item_name)
end

DemoCharacterPreviewer._spawn_item = function (self, item_name)
	local world = self._world
	local character_unit = self._character_unit
	local scene_graph_links = {}
	local item_data = ItemMasterList[item_name]
	local item_units = BackendUtils.get_item_units(item_data)
	local item_template = ItemHelper.get_template_by_item_name(item_name)
	local item_spawn_data = self.item_spawn_data
	local spawn_data = item_spawn_data[item_name]

	if spawn_data then
		for _, unit_spawn_data in ipairs(spawn_data) do
			local unit_name = unit_spawn_data.unit_name
			local item_slot_type = unit_spawn_data.item_slot_type
			local slot_index = unit_spawn_data.slot_index
			local unit_attachment_node_linking = unit_spawn_data.unit_attachment_node_linking
			local material_settings = unit_spawn_data.material_settings

			if item_slot_type == "melee" or item_slot_type == "ranged" then
				if unit_spawn_data.right_hand or unit_spawn_data.despawn_both_hands_units then
					local old_unit_right = self._equipment_units[slot_index].right

					if old_unit_right ~= nil then
						World.destroy_unit(world, old_unit_right)

						self._equipment_units[slot_index].right = nil
					end
				end

				if unit_spawn_data.left_hand or unit_spawn_data.despawn_both_hands_units then
					local old_unit_left = self._equipment_units[slot_index].left

					if old_unit_left ~= nil then
						World.destroy_unit(world, old_unit_left)

						self._equipment_units[slot_index].left = nil
					end
				end

				local unit = World.spawn_unit(world, unit_name)

				self:equip_item_unit(unit, item_slot_type, item_template, unit_attachment_node_linking, scene_graph_links, material_settings)

				if unit_spawn_data.right_hand then
					self._equipment_units[slot_index].right = unit
				elseif unit_spawn_data.left_hand then
					self._equipment_units[slot_index].left = unit
				end
			else
				local old_unit = self._equipment_units[slot_index]

				if old_unit ~= nil then
					World.destroy_unit(world, old_unit)

					self._equipment_units[slot_index] = nil
				end

				local unit = World.spawn_unit(world, unit_name)
				self._equipment_units[slot_index] = unit

				self:equip_item_unit(unit, item_slot_type, item_template, unit_attachment_node_linking, scene_graph_links)
			end

			local show_attachments_event = item_template.show_attachments_event

			if show_attachments_event then
				Unit.flow_event(character_unit, show_attachments_event)
			end
		end
	end
end

DemoCharacterPreviewer.equip_item_unit = function (self, unit, item_slot_type, item_template, unit_attachment_node_linking, scene_graph_links, material_settings)
	local world = self._world
	local character_unit = self._character_unit

	if item_slot_type == "melee" or item_slot_type == "ranged" then
		if self._wielded_slot_type == item_slot_type then
			unit_attachment_node_linking = unit_attachment_node_linking.wielded

			Unit.flow_event(unit, "lua_wield")

			if item_template.wield_anim then
				Unit.animation_event(character_unit, item_template.wield_anim)
			end
		else
			unit_attachment_node_linking = unit_attachment_node_linking.unwielded

			Unit.flow_event(unit, "lua_unwield")
		end
	end

	if Unit.has_lod_object(unit, "lod") then
		local lod_object = Unit.lod_object(unit, "lod")

		LODObject.set_static_select(lod_object, 0)
	end

	GearUtils.link(world, unit_attachment_node_linking, scene_graph_links, character_unit, unit)

	if material_settings then
		GearUtils.apply_material_settings(unit, material_settings)
	end
end

DemoCharacterPreviewer.destroy = function (self)
	self:_reset_hero()

	if self._line_object then
		World.destroy_line_object(self._world, self._line_object)

		self._line_object = nil
	end
end

return
