KeepDecorationTrophyExtension = class(KeepDecorationTrophyExtension)

KeepDecorationTrophyExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	local level = LevelHelper:current_level(world)
	self.keep_decoration_system = nil
	self._decoration_settings_key = Unit.get_data(unit, "decoration_settings_key")
	self._unit = unit
	self._current_preview_trophy_unit = unit
	self._world = world
	self._level_unit_index = Level.unit_index(level, unit)
	self._is_leader = Managers.party:is_leader(Network.peer_id())
	self._trophies_lookup = NetworkLookup.keep_decoration_trophies or {}
	self._currently_set_trophy = nil
	self._is_hidden = nil
	self._next_trophy = {}
	local settings_key = Unit.get_data(unit, "decoration_settings_key")
	local settings = KeepDecorationSettings[settings_key]
	self._settings = settings
	self._backend_key = settings.backend_key
end

KeepDecorationTrophyExtension.interacted_with = function (self)
	return
end

KeepDecorationTrophyExtension.destroy = function (self)
	self._unit = nil
	self._world = nil
	self._go_id = nil
end

KeepDecorationTrophyExtension.extensions_ready = function (self)
	if not self._is_leader then
		return
	end

	local selected_trophy = self:get_selected_decoration()
	self._current_preview_trophy = selected_trophy

	self:_create_game_object(selected_trophy)

	self._currently_set_trophy = selected_trophy

	self:_load_trophy(selected_trophy)
end

KeepDecorationTrophyExtension.get_settings = function (self)
	return self._trophies_lookup
end

KeepDecorationTrophyExtension.can_interact = function (self)
	return self._go_id
end

KeepDecorationTrophyExtension.decoration_selected = function (self, current_trophy)
	self:_load_trophy(current_trophy)
end

KeepDecorationTrophyExtension.reset_selection = function (self)
	local current_preview_trophy = self._current_preview_trophy
	local selected_trophy = self._currently_set_trophy or "hub_trophy_empty"

	if selected_trophy ~= current_preview_trophy then
		self:_load_trophy(selected_trophy)
	end

	self._current_preview_trophy = nil
end

KeepDecorationTrophyExtension.unequip_decoration = function (self, new_trophy)
	local trophy = new_trophy or "hub_trophy_empty"

	self:_load_trophy(trophy)
	self:sync_decoration()
end

KeepDecorationTrophyExtension.confirm_selection = function (self)
	local current_preview_trophy = self._current_preview_trophy
	local keep_decoration_system = self.keep_decoration_system

	keep_decoration_system:on_decoration_set(current_preview_trophy, self)
	self:sync_decoration()
end

KeepDecorationTrophyExtension.sync_decoration = function (self)
	local current_preview_trophy = self._current_preview_trophy

	self:_set_selected_decoration(current_preview_trophy)

	local go_id = self._go_id
	local game_session = Network.game_session()

	if game_session and go_id then
		local game = Managers.state.network:game()

		GameSession.set_game_object_field(game, go_id, "trophy_index", self._trophies_lookup[current_preview_trophy])
	end
end

KeepDecorationTrophyExtension.hot_join_sync = function (self, sender)
	return
end

KeepDecorationTrophyExtension.distributed_update = function (self)
	if self._is_leader then
		if self._waiting_for_game_session and Managers.state.network:in_game_session() then
			local selected_trophy = self:get_selected_decoration()

			self:_create_game_object(selected_trophy)

			self._waiting_for_game_session = false
		end
	else
		local go_id = self._go_id
		local game_session = Network.game_session()

		if go_id and game_session then
			local game = Managers.state.network:game()
			local trophy_index = GameSession.game_object_field(game, go_id, "trophy_index")

			if trophy_index ~= self._go_trophy_index then
				self._go_trophy_index = trophy_index
				local trophy = self._trophies_lookup[trophy_index]
				self._currently_set_trophy = trophy

				self:_load_trophy(trophy)
			end
		end
	end
end

KeepDecorationTrophyExtension.get_selected_decoration = function (self)
	if self._is_leader then
		local backend_key = self._backend_key
		local backend_interface = Managers.backend:get_interface("keep_decorations")
		local selected_trophy = backend_interface:get_decoration(backend_key)
		selected_trophy = selected_trophy or DefaultTrophies[1]

		return selected_trophy
	else
		return self._currently_set_trophy
	end
end

KeepDecorationTrophyExtension._set_selected_decoration = function (self, trophy)
	local backend_key = self._backend_key
	local backend_manager = Managers.backend
	local backend_interface = backend_manager:get_interface("keep_decorations")
	self._currently_set_trophy = trophy

	Unit.set_data(self._current_preview_trophy_unit, "decoration_settings_key", self._decoration_settings_key)
	backend_interface:set_decoration(backend_key, trophy)
	backend_manager:commit()
end

KeepDecorationTrophyExtension._load_trophy = function (self, trophy, callback)
	local unit = self._unit
	local current_preview_trophy_unit = self._current_preview_trophy_unit
	local position = Unit.local_position(current_preview_trophy_unit, 0)
	local rotation = Unit.local_rotation(current_preview_trophy_unit, 0)

	if current_preview_trophy_unit == unit then
		Unit.set_unit_visibility(current_preview_trophy_unit, false)
	else
		World.destroy_unit(self._world, current_preview_trophy_unit)
	end

	local unit_name = Trophies[trophy].unit_name

	if Unit.is_a(unit, unit_name) then
		Unit.set_unit_visibility(unit, true)

		self._current_preview_trophy_unit = unit
	else
		local new_unit = World.spawn_unit(self._world, unit_name, position, rotation)
		self._current_preview_trophy_unit = new_unit
	end

	self._current_preview_trophy = trophy
end

KeepDecorationTrophyExtension._create_game_object = function (self, trophy)
	local go_data_table = {
		go_type = NetworkLookup.go_types.keep_decoration_trophy,
		level_unit_index = self._level_unit_index,
		trophy_index = self._trophies_lookup[trophy]
	}
	local callback = callback(self, "cb_game_session_disconnect")
	self._go_id = Managers.state.network:create_game_object("keep_decoration_trophy", go_data_table, callback)
end

KeepDecorationTrophyExtension.cb_game_session_disconnect = function (self)
	self._go_id = nil
end

KeepDecorationTrophyExtension.on_game_object_created = function (self, go_id)
	local game = Managers.state.network:game()
	local trophy_index = GameSession.game_object_field(game, go_id, "trophy_index")
	local trophy = self._trophies_lookup[trophy_index]

	self:_load_trophy(trophy, nil)

	self._currently_set_trophy = trophy
	self._go_trophy_index = trophy_index
	self._go_id = go_id
end

KeepDecorationTrophyExtension.on_game_object_destroyed = function (self)
	self._go_id = nil
end

return
