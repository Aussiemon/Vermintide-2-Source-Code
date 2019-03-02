KeepDecorationPaintingExtension = class(KeepDecorationPaintingExtension)

KeepDecorationPaintingExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	local level = LevelHelper:current_level(world)
	self.keep_decoration_system = nil
	self._decoration_settings_key = Unit.get_data(unit, "decoration_settings_key")
	self._unit = unit
	self._world = world
	self._level_unit_index = Level.unit_index(level, unit)
	self._is_leader = Managers.party:is_leader(Network.peer_id())
	self._paintings_lookup = NetworkLookup.keep_decoration_paintings or {}
	self._is_client_painting = Unit.get_data(unit, "painting_data", "is_client_painting")
	self._currently_set_painting = nil
	self._temporarily_set_frame = nil
	self._temporarily_set_orientation = nil
	self._is_hidden = nil
	self._painting_unit = nil
	self._start_hidden = Unit.get_data(unit, "painting_data", "start_hidden")
	self._slow_update_count = 0
	self._slot = nil
	self._loading_painting_material = nil
	local settings_key = Unit.get_data(unit, "decoration_settings_key")
	local settings = KeepDecorationSettings[settings_key]
	self._settings = settings
	self._backend_key = settings.backend_key
end

KeepDecorationPaintingExtension.interacted_with = function (self)
	return
end

KeepDecorationPaintingExtension.destroy = function (self)
	local unit = self._painting_unit

	if unit then
		World.destroy_unit(self._world, unit)
	end

	if self._current_package_name then
		self:_unload_painting_material(self._current_package_name)

		self._current_package_name = nil
	end

	if self._previous_package_name then
		self:_unload_painting_material(self._previous_package_name)

		self._previous_package_name = nil
	end

	self._unit = nil
	self._world = nil
	self._go_id = nil
end

KeepDecorationPaintingExtension.extensions_ready = function (self)
	if not DLCSettings.gecko then
		return
	end

	Unit.set_unit_visibility(self._unit, false)

	if not self._is_leader then
		return
	end

	local selected_painting = (self._is_client_painting and "hidden") or self:get_selected_painting()
	self._current_preview_painting = selected_painting

	local function on_material_loaded()
		if Managers.state.network:in_game_session() then
			self:_create_game_object(selected_painting)

			self._loading_painting_material = false
		else
			self._waiting_for_game_session = true
		end
	end

	self:_load_painting(selected_painting, on_material_loaded)
end

KeepDecorationPaintingExtension.get_settings = function (self)
	return self._paintings_lookup
end

KeepDecorationPaintingExtension.can_interact = function (self)
	if not DLCSettings.gecko then
		return false
	end

	return self._go_id
end

KeepDecorationPaintingExtension.painting_selected = function (self, current_painting)
	self:_load_painting(current_painting, nil)
end

KeepDecorationPaintingExtension.reset_selection = function (self)
	local current_preview_painting = self._current_preview_painting
	local selected_painting = self._currently_set_painting

	if selected_painting ~= current_preview_painting then
		self:_load_painting(selected_painting, nil)
	end

	self._current_preview_painting = nil
end

KeepDecorationPaintingExtension.unequip_painting = function (self, new_painting)
	local painting = new_painting or "hor_none"

	self:_load_painting(painting)
	self:sync_painting()
end

KeepDecorationPaintingExtension.confirm_selection = function (self)
	local current_preview_painting = self._current_preview_painting
	local keep_decoration_system = self.keep_decoration_system

	keep_decoration_system:painting_set(current_preview_painting, self)
	self:sync_painting()
end

KeepDecorationPaintingExtension.sync_painting = function (self)
	local current_preview_painting = self._current_preview_painting

	self:_set_selected_painting(current_preview_painting)

	local go_id = self._go_id

	if go_id then
		local game = Managers.state.network:game()

		GameSession.set_game_object_field(game, go_id, "painting_index", self._paintings_lookup[current_preview_painting])
	end
end

KeepDecorationPaintingExtension.hot_join_sync = function (self, sender)
	return
end

KeepDecorationPaintingExtension.distributed_update = function (self)
	if self._is_leader then
		if self._waiting_for_game_session and Managers.state.network:in_game_session() then
			local selected_painting = self:get_selected_painting()

			self:_create_game_object(selected_painting)

			self._waiting_for_game_session = false
		end
	else
		local go_id = self._go_id

		if go_id then
			local game = Managers.state.network:game()
			local painting_index = GameSession.game_object_field(game, go_id, "painting_index")

			if painting_index ~= self._go_painting_index then
				self._go_painting_index = painting_index
				local painting = self._paintings_lookup[painting_index]
				self._currently_set_painting = painting

				self:_load_painting(painting)
			end
		end
	end

	local slow_update_count = self._slow_update_count

	if slow_update_count > 25 then
		slow_update_count = 0

		if self._start_hidden then
			local start_hidden = Unit.get_data(self._unit, "painting_data", "start_hidden")

			if not start_hidden then
				self._start_hidden = false
				local painting = self._currently_set_painting

				Unit.set_unit_visibility(self._unit, false)
				self:_load_painting(painting, nil)
				self:_show_painting()
			end
		end
	end

	self._slow_update_count = slow_update_count + 1
end

KeepDecorationPaintingExtension.set_client_painting = function (self, painting)
	self:_load_painting(painting)
	self:_set_selected_painting(painting)

	local go_id = self._go_id

	if go_id then
		local game = Managers.state.network:game()

		GameSession.set_game_object_field(game, go_id, "painting_index", self._paintings_lookup[painting])
	end
end

KeepDecorationPaintingExtension.is_client_painting = function (self)
	return self._is_client_painting
end

KeepDecorationPaintingExtension._hide_painting = function (self)
	self._is_hidden = true

	Unit.set_data(self._unit, "painting_data", "not_interactable", true)
	Unit.set_unit_visibility(self._painting_unit, false)
end

KeepDecorationPaintingExtension._show_painting = function (self)
	self._is_hidden = false

	Unit.set_data(self._unit, "painting_data", "not_interactable", false)
	Unit.set_unit_visibility(self._painting_unit, true)
end

KeepDecorationPaintingExtension.get_selected_painting = function (self)
	if self._is_leader then
		local backend_key = self._backend_key
		local backend_interface = Managers.backend:get_interface("keep_decorations")
		local selected_painting = backend_interface:get_decoration(backend_key)

		if not selected_painting or not Paintings[selected_painting] then
			selected_painting = DefaultPaintings[1]
		end

		self._currently_set_painting = selected_painting

		return selected_painting
	else
		return self._currently_set_painting
	end
end

KeepDecorationPaintingExtension._set_selected_painting = function (self, painting)
	local backend_key = self._backend_key
	local backend_manager = Managers.backend
	local backend_interface = backend_manager:get_interface("keep_decorations")
	self._currently_set_painting = painting

	backend_interface:set_decoration(backend_key, painting)
	backend_manager:commit()
end

KeepDecorationPaintingExtension._load_painting = function (self, painting, callback)
	local painting_data = Paintings[painting]
	local painting_orientation = painting_data.orientation
	local painting_frame = painting_data.frame
	self._current_preview_painting = painting

	if painting_orientation == "vertical" then
		self._slot = "keep_painting_ver_none"
	elseif painting_orientation == "horizontal" then
		self._slot = "keep_painting_hor_none"
	end

	if self._temporarily_set_frame ~= painting_frame or self._temporarily_set_orientation ~= painting_orientation then
		self:_load_painting_frame(painting_data)
	end

	if painting ~= "hidden" then
		self:_load_painting_material(painting, callback, self._slot)

		if self._is_hidden then
			self:_show_painting()
		end
	else
		self:_load_painting_material("hor_none", callback, self._slot)
		self:_hide_painting()
	end

	if self._start_hidden then
		self:_hide_painting()
	end
end

KeepDecorationPaintingExtension._load_painting_frame = function (self, data)
	local painting_orientation = data.orientation
	local painting_frame = data.frame
	local painting_unit = nil
	local unit = self._unit
	local position = Unit.local_position(unit, 0)
	local rotation = Unit.local_rotation(unit, 0)
	local scale = Unit.local_scale(unit, 0)

	if painting_orientation == "horizontal" then
		if painting_frame == "wood" then
			painting_unit = World.spawn_unit(self._world, "units/gameplay/paintings/keep_painting_wood_long", position, rotation)
		elseif painting_frame == "painted" then
			painting_unit = World.spawn_unit(self._world, "units/gameplay/paintings/keep_painting_painted_long", position, rotation)
		elseif painting_frame == "gold" then
			painting_unit = World.spawn_unit(self._world, "units/gameplay/paintings/keep_painting_gold_long", position, rotation)
		end
	elseif painting_orientation == "vertical" then
		if painting_frame == "wood" then
			painting_unit = World.spawn_unit(self._world, "units/gameplay/paintings/keep_painting_wood_high", position, rotation)
		elseif painting_frame == "painted" then
			painting_unit = World.spawn_unit(self._world, "units/gameplay/paintings/keep_painting_painted_high", position, rotation)
		elseif painting_frame == "gold" then
			painting_unit = World.spawn_unit(self._world, "units/gameplay/paintings/keep_painting_gold_high", position, rotation)
		end
	end

	Unit.set_local_scale(painting_unit, 0, scale)

	self._temporarily_set_frame = painting_frame
	self._temporarily_set_orientation = painting_orientation
	local current_unit = self._painting_unit

	if current_unit then
		World.destroy_unit(self._world, current_unit)
	end

	self._painting_unit = painting_unit
end

KeepDecorationPaintingExtension._load_painting_material = function (self, name, cb_done)
	local subpath = "keep_painting_" .. name
	local no_package_required = string.find(name, "_none") ~= nil
	local package_name = nil
	local reference_name = self._decoration_settings_key

	if not no_package_required then
		package_name = "resource_packages/keep_paintings/" .. subpath
	end

	local function cb_package_loaded()
		self:_apply_material_by_sub_path(subpath)

		if cb_done then
			cb_done()
		end

		self._loading_painting_material = false

		if self._previous_package_name then
			self:_unload_painting_material(self._previous_package_name)

			self._previous_package_name = nil
		end
	end

	if not self._loading_painting_material or self._is_client_painting then
		self._loading_painting_material = true
		self._previous_package_name = self._current_package_name
		self._current_package_name = package_name

		if no_package_required then
			cb_package_loaded()
		else
			Managers.package:load(package_name, reference_name, cb_package_loaded, true)
		end
	end
end

KeepDecorationPaintingExtension._apply_material_by_sub_path = function (self, subpath)
	local material_path = "units/gameplay/keep_paintings/materials/" .. subpath .. "/" .. subpath
	local painting_unit = self._painting_unit
	local slot = self._slot

	Unit.set_material(painting_unit, slot, material_path)
end

KeepDecorationPaintingExtension._unload_painting_material = function (self, package_name)
	local reference_name = self._decoration_settings_key

	Managers.package:unload(package_name, reference_name)
end

KeepDecorationPaintingExtension._create_game_object = function (self, painting)
	local go_data_table = {
		go_type = NetworkLookup.go_types.keep_decoration_painting,
		level_unit_index = self._level_unit_index,
		painting_index = self._paintings_lookup[painting]
	}
	local callback = callback(self, "cb_game_session_disconnect")
	self._go_id = Managers.state.network:create_game_object("keep_decoration_painting", go_data_table, callback)
end

KeepDecorationPaintingExtension.cb_game_session_disconnect = function (self)
	self._go_id = nil
end

KeepDecorationPaintingExtension.on_game_object_created = function (self, go_id)
	local game = Managers.state.network:game()
	local painting_index = GameSession.game_object_field(game, go_id, "painting_index")
	local painting = self._paintings_lookup[painting_index]

	self:_load_painting(painting, nil)

	self._currently_set_painting = painting
	self._go_painting_index = painting_index
	self._go_id = go_id
end

KeepDecorationPaintingExtension.on_game_object_destroyed = function (self)
	self._go_id = nil
end

return
