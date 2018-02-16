require("scripts/settings/keep_decoration_settings")
require("scripts/settings/paintings")

KeepDecorationPaintingExtension = class(KeepDecorationPaintingExtension)
KeepDecorationPaintingExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	local level = LevelHelper:current_level(world)
	self._unit = unit
	self._world = world
	self._level_unit_index = Level.unit_index(level, unit)
	self._is_leader = Managers.party:is_leader(Network.peer_id())

	return 
end
KeepDecorationPaintingExtension.setup = function (self, settings)
	self._settings = settings
	local orientation = settings.data.orientation
	local level = settings.data.level
	self._material_list = Paintings[orientation][level]

	if self._is_leader then
		local material_index = self._get_backend_material(self)
		material_index = tonumber(material_index)
		material_index = material_index or 1

		local function on_material_loaded()
			if Managers.state.network:in_game_session() then
				self:_create_game_object(material_index)
			else
				self._waiting_for_game_session = true
			end

			return 
		end

		self._load_material(self, material_index, on_material_loaded)
	end

	return 
end
KeepDecorationPaintingExtension.destroy = function (self)
	self._unit = nil
	self._world = nil
	self._material_list = nil
	self._go_id = nil

	return 
end
KeepDecorationPaintingExtension.extensions_ready = function (self)
	return 
end
KeepDecorationPaintingExtension.can_interact = function (self)
	return self._is_leader and self._go_id
end
KeepDecorationPaintingExtension.interacted_with = function (self)
	local material_list = self._material_list
	local current_material_index = self._get_backend_material(self) or 1
	local next_material_index = current_material_index + 1

	if #material_list < next_material_index then
		next_material_index = 1
	end

	local function on_material_loaded()
		self:_set_backend_material(next_material_index)

		local game = Managers.state.network:game()
		local go_id = self._go_id

		GameSession.set_game_object_field(game, go_id, "material_index", next_material_index)

		return 
	end

	self._load_material(self, next_material_index, on_material_loaded)

	return 
end
KeepDecorationPaintingExtension.hot_join_sync = function (self, sender)
	return 
end
KeepDecorationPaintingExtension.distributed_update = function (self)
	if self._is_leader then
		if self._waiting_for_game_session and Managers.state.network:in_game_session() then
			local material_index = self._get_backend_material(self)
			material_index = tonumber(material_index) or 1

			self._create_game_object(self, material_index)

			self._waiting_for_game_session = false
		end
	else
		local go_id = self._go_id

		if go_id then
			local game = Managers.state.network:game()
			local material_index = GameSession.game_object_field(game, go_id, "material_index")

			if material_index ~= self._go_material_index then
				self._go_material_index = material_index

				self._load_material(self, material_index, nil)
			end
		end
	end

	return 
end
KeepDecorationPaintingExtension._get_backend_material = function (self)
	local backend_key = self._settings.backend_key
	local backend_interface = Managers.backend:get_interface("keep_decorations")
	local value = backend_interface.get(backend_interface, backend_key)

	return value
end
KeepDecorationPaintingExtension._set_backend_material = function (self, value)
	local backend_key = self._settings.backend_key
	local backend_manager = Managers.backend
	local backend_interface = backend_manager.get_interface(backend_manager, "keep_decorations")

	backend_interface.set(backend_interface, backend_key, value)
	backend_manager.commit(backend_manager)

	return 
end
KeepDecorationPaintingExtension._load_material = function (self, material_index, cb_done)
	local material_list = self._material_list
	local material_name = material_list[material_index]
	local subpath = "keep_painting_" .. material_name

	local function cb_package_loaded()
		local material_path = "units/gameplay/keep_paintings/materials/" .. subpath .. "/" .. subpath
		local slot = "canvas"
		local unit = self._unit

		Unit.set_material(unit, slot, material_path)

		if cb_done then
			cb_done()
		end

		return 
	end

	if string.find(material_name, "_none") ~= nil then
		cb_package_loaded()
	else
		local package_name = "resource_packages/keep_paintings/" .. subpath
		local reference_name = package_name

		Managers.package:load(package_name, reference_name, cb_package_loaded, true)
	end

	return 
end
KeepDecorationPaintingExtension._create_game_object = function (self, material_index)
	local go_data_table = {
		go_type = NetworkLookup.go_types.keep_decoration_painting,
		level_unit_index = self._level_unit_index,
		material_index = material_index
	}
	local callback = callback(self, "cb_game_session_disconnect")
	self._go_id = Managers.state.network:create_game_object("keep_decoration_painting", go_data_table, callback)

	return 
end
KeepDecorationPaintingExtension.cb_game_session_disconnect = function (self)
	self._go_id = nil

	return 
end
KeepDecorationPaintingExtension.on_game_object_created = function (self, go_id)
	local game = Managers.state.network:game()
	local material_index = GameSession.game_object_field(game, go_id, "material_index")

	self._load_material(self, material_index, nil)

	self._go_material_index = material_index
	self._go_id = go_id

	return 
end
KeepDecorationPaintingExtension.on_game_object_destroyed = function (self)
	self._go_id = nil

	return 
end

return 
