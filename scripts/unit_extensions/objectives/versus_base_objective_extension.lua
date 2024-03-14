-- chunkname: @scripts/unit_extensions/objectives/versus_base_objective_extension.lua

VersusBaseObjectiveExtension = class(VersusBaseObjectiveExtension)
VersusBaseObjectiveExtension.NAME = "VersusBaseObjectiveExtension"

VersusBaseObjectiveExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._is_server = extension_init_context.is_server
	self._unit = unit
	self._world = extension_init_context.world
	self._objective_name = extension_init_data.objective_name or Unit.get_data(self._unit, "versus_objective_id")
	self._audio_system = Managers.state.entity:system("audio_system")
	self._wwise_world = Managers.world:wwise_world(self._world)
	self._scale = extension_init_data.scale or Vector3(1, 1, 1)
	self._num_sections = 1
	self._current_section = 0

	Unit.set_local_scale(self._unit, 0, self._scale)
end

VersusBaseObjectiveExtension.activate = function (self, game_object_id, objective_data)
	self._description = objective_data.description
	self._objective_type = objective_data.objective_type
	self._objective_icon = objective_data.objective_type
	self._on_complete_func = objective_data.on_complete_func
	self._optional = objective_data.optional or false
	self._parent_objective_name = objective_data.parent_objective_name or "n/a"

	self:_activate(game_object_id, objective_data)
	self:_store_position()
	self:_store_local_player()

	if self._is_server then
		self:_activate_server(objective_data)
	else
		self:_activate_client(game_object_id)
	end

	self._activated = true
end

VersusBaseObjectiveExtension._store_local_player = function (self)
	if not DEDICATED_SERVER then
		local local_player = Managers.player:local_player()
		local peer_id = local_player:network_id()
		local local_player_id = local_player:local_player_id()
		local party = Managers.party:get_party_from_player_id(peer_id, local_player_id)
		local side = Managers.state.side.side_by_party[party]

		self._local_side = side
	end
end

VersusBaseObjectiveExtension._activate_server = function (self, objective_data)
	local game_object_data_table = {
		value = 0,
		go_type = NetworkLookup.go_types.versus_objective,
		objective_name = NetworkLookup.versus_objective_names[self._objective_name],
		parent_objective_name = NetworkLookup.versus_objective_names[self._parent_objective_name],
	}

	self._game_object_id = Managers.state.network:create_game_object("versus_objective", game_object_data_table, callback(self, "cb_game_session_disconnect"))
end

VersusBaseObjectiveExtension._activate_client = function (self, game_object_id)
	self._game_object_id = self._game_object_id or game_object_id
	self._percentage = 0
end

VersusBaseObjectiveExtension.set_game_object_id = function (self, game_object_id)
	self._game_object_id = game_object_id
end

VersusBaseObjectiveExtension.cb_game_session_disconnect = function (self)
	return
end

VersusBaseObjectiveExtension.complete = function (self)
	if self._is_server and self._on_complete_func then
		self._on_complete_func(self._unit)
	end

	self:deactivate()
end

VersusBaseObjectiveExtension.deactivate = function (self)
	self:_deactivate()

	if self._is_server then
		local game_session = Network.game_session()

		if game_session then
			GameSession.destroy_game_object(game_session, self._game_object_id)
		end
	else
		self._percentage = 1
	end

	self._game_object_id = nil
	self._activated = false
end

VersusBaseObjectiveExtension.play_local_sound = function (self, event)
	WwiseWorld.trigger_event(self._wwise_world, event)
end

VersusBaseObjectiveExtension.play_local_unit_sound = function (self, event)
	WwiseUtils.trigger_unit_event(self._world, event, self._unit, 0)
end

VersusBaseObjectiveExtension.play_unit_sound = function (self, event)
	self._audio_system:play_audio_unit_event(event, self._unit)
end

VersusBaseObjectiveExtension.update = function (self, dt, t)
	if script_data.testify and self.update_testify then
		self:update_testify(dt, t)
	end

	if not self._activated then
		return
	end

	if self._is_server then
		self:_server_update(dt, t)
	else
		self:_client_update(dt, t)
	end
end

VersusBaseObjectiveExtension.on_section_completed = function (self)
	self._current_section = self._current_section + 1

	Managers.state.event:trigger("obj_objective_section_completed", self)
end

VersusBaseObjectiveExtension.set_game_object_field = function (self, field, value)
	local game_session = Network.game_session()

	if game_session then
		GameSession.set_game_object_field(game_session, self._game_object_id, field, value)
	end
end

VersusBaseObjectiveExtension._activate = function (self, game_object_id, objective_data)
	fassert(false, "This function needs to be overwritten")
end

VersusBaseObjectiveExtension._deactivate = function (self)
	fassert(false, "This function needs to be overwritten")
end

VersusBaseObjectiveExtension._store_position = function (self)
	local position = Unit.local_position(self._unit, 0)

	self._position = Vector3Box(position)
end

VersusBaseObjectiveExtension._server_update = function (self, dt, t)
	fassert(false, "This function needs to be overwritten")
end

VersusBaseObjectiveExtension._client_update = function (self, dt, t)
	fassert(false, "This function needs to be overwritten")
end

VersusBaseObjectiveExtension.get_percentage_done = function (self)
	fassert(false, "This function needs to be overwritten")
end

VersusBaseObjectiveExtension.objective_name = function (self)
	return self._objective_name
end

VersusBaseObjectiveExtension.get_current_section = function (self)
	return self._current_section
end

VersusBaseObjectiveExtension.get_total_sections = function (self)
	return self._num_sections
end

VersusBaseObjectiveExtension.get_time_per_section = function (self)
	return self._time_per_section
end

VersusBaseObjectiveExtension.get_score_per_section = function (self)
	return self._score_per_section
end

VersusBaseObjectiveExtension.get_time_for_completion = function (self)
	return self._time_for_completion
end

VersusBaseObjectiveExtension.get_score_for_completion = function (self)
	return self._score_for_completion
end

VersusBaseObjectiveExtension.get_position = function (self)
	if self._position then
		return self._position:unbox()
	else
		return Unit.world_position(self._unit, 0)
	end
end

VersusBaseObjectiveExtension.is_optional = function (self)
	return self._optional
end

VersusBaseObjectiveExtension.description = function (self)
	return self._description
end

VersusBaseObjectiveExtension.objective_icon = function (self)
	return self._objective_icon
end

VersusBaseObjectiveExtension.objective_type = function (self)
	return self._objective_type
end

VersusBaseObjectiveExtension.is_done = function (self)
	return self:get_percentage_done() >= 1
end

VersusBaseObjectiveExtension.is_active = function (self)
	return self._activated
end

VersusBaseObjectiveExtension.get_parent_name = function (self)
	return self._parent_objective_name
end
