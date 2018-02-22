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
	self._paintings_lookup = NetworkLookup.keep_decoration_paintings

	return 
end
KeepDecorationPaintingExtension.setup = function (self, settings, owned_paintings)
	if self._is_leader then
		self._backend_key = settings.backend_key
		local orientation = settings.data.orientation
		local level = settings.data.level
		local paintings = table.clone(Paintings[orientation][level])

		if not script_data.debug_keep_decorations then
			for i = #paintings, 2, -1 do
				local painting = paintings[i]

				if not owned_paintings[painting] then
					table.remove(paintings, i)
				end
			end
		end

		self._paintings = paintings
		local selected_painting = self._get_selected_painting(self)

		local function on_material_loaded()
			if Managers.state.network:in_game_session() then
				self:_create_game_object(selected_painting)
			else
				self._waiting_for_game_session = true
			end

			return 
		end

		self._load_painting_material(self, selected_painting, on_material_loaded)
	end

	return 
end
KeepDecorationPaintingExtension.destroy = function (self)
	self._unit = nil
	self._world = nil
	self._paintings = nil
	self._go_id = nil

	return 
end
KeepDecorationPaintingExtension.extensions_ready = function (self)
	return 
end
KeepDecorationPaintingExtension.can_interact = function (self)
	return self._is_leader and self._go_id and 1 < #self._paintings
end
KeepDecorationPaintingExtension.interacted_with = function (self)
	local paintings = self._paintings
	local current_painting = self._get_selected_painting(self)
	local current_painting_index = table.find(paintings, current_painting)
	local next_painting_index = current_painting_index + 1

	if #paintings < next_painting_index then
		next_painting_index = 1
	end

	local next_painting = paintings[next_painting_index]

	local function on_material_loaded()
		self:_set_selected_painting(next_painting)

		local game = Managers.state.network:game()
		local go_id = self._go_id

		GameSession.set_game_object_field(game, go_id, "painting_index", self._paintings_lookup[next_painting])

		return 
	end

	self._load_painting_material(self, next_painting, on_material_loaded)

	return 
end
KeepDecorationPaintingExtension.hot_join_sync = function (self, sender)
	return 
end
KeepDecorationPaintingExtension.distributed_update = function (self)
	if self._is_leader then
		if self._waiting_for_game_session and Managers.state.network:in_game_session() then
			local selected_painting = self._get_selected_painting(self)

			self._create_game_object(self, selected_painting)

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

				self._load_painting_material(self, painting, nil)
			end
		end
	end

	return 
end
KeepDecorationPaintingExtension._get_selected_painting = function (self)
	local backend_key = self._backend_key
	local backend_interface = Managers.backend:get_interface("keep_decorations")
	local selected_painting = backend_interface.get(backend_interface, backend_key)
	local paintings = self._paintings

	if not selected_painting or not table.find(paintings, selected_painting) then
		selected_painting = paintings[1]
	end

	return selected_painting
end
KeepDecorationPaintingExtension._set_selected_painting = function (self, painting)
	local backend_key = self._backend_key
	local backend_manager = Managers.backend
	local backend_interface = backend_manager.get_interface(backend_manager, "keep_decorations")

	backend_interface.set(backend_interface, backend_key, painting)
	backend_manager.commit(backend_manager)

	return 
end
KeepDecorationPaintingExtension._load_painting_material = function (self, name, cb_done)
	local subpath = "keep_painting_" .. name

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

	if string.find(name, "_none") ~= nil then
		cb_package_loaded()
	else
		local package_name = "resource_packages/keep_paintings/" .. subpath
		local reference_name = package_name

		Managers.package:load(package_name, reference_name, cb_package_loaded, true)
	end

	return 
end
KeepDecorationPaintingExtension._create_game_object = function (self, painting)
	local go_data_table = {
		go_type = NetworkLookup.go_types.keep_decoration_painting,
		level_unit_index = self._level_unit_index,
		painting_index = self._paintings_lookup[painting]
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
	local painting_index = GameSession.game_object_field(game, go_id, "painting_index")
	local painting = self._paintings_lookup[painting_index]

	self._load_painting_material(self, painting, nil)

	self._go_painting_index = painting_index
	self._go_id = go_id

	return 
end
KeepDecorationPaintingExtension.on_game_object_destroyed = function (self)
	self._go_id = nil

	return 
end

return 
