WeaveInteractionExtension = class(WeaveInteractionExtension)
WeaveInteractionExtension.NAME = "WeaveInteractionExtension"

WeaveInteractionExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._extension_init_context = extension_init_context
	self._extension_init_data = extension_init_data
	self._is_server = extension_init_context.is_server
	self._objective_name = extension_init_data.objective_name
	self._score = extension_init_data.score or 0
	self._game_object_id = nil
	self._unit = unit
	self._interactable_state = nil
	self._on_start_func = extension_init_data.on_start_func
	self._on_interact_start_func = extension_init_data.on_interact_start_func
	self._on_interact_interupt_func = extension_init_data.on_interact_interupt_func
	self._on_interact_complete_func = extension_init_data.on_interact_complete_func
	self._on_progress_func = extension_init_data.on_progress_func
	self._on_complete_func = extension_init_data.on_complete_func
	self._num_times_to_complete = extension_init_data.num_times_to_complete or 1
	self._interactable_system = ScriptUnit.has_extension(self._unit, "interactable_system")
	self._duration = extension_init_data.duration or 5
	self._audio_system = Managers.state.entity:system("audio_system")
	self._weave_objective_system = Managers.state.entity:system("weave_objective_system")
	self._value = 0
	local terror_event_spawner_id = extension_init_data.terror_event_spawner_id

	Unit.set_data(unit, "terror_event_spawner_id", terror_event_spawner_id)
	Unit.set_data(unit, "interaction_data", "interaction_length", self._duration)

	self._max_value = self._duration * self._num_times_to_complete
end

WeaveInteractionExtension.get_objective_settings = function (self)
	return WeaveObjectiveSettings[WeaveInteractionExtension.NAME]
end

WeaveInteractionExtension.score = function (self)
	return self._score
end

WeaveInteractionExtension.activate = function (self, game_object_id, objective_data)
	local extension = ScriptUnit.has_extension(self._unit, "tutorial_system")

	if extension then
		extension:set_active(true)
	end

	if self._is_server then
		local game_object_data_table = {
			go_type = NetworkLookup.go_types.weave_objective,
			objective_name = NetworkLookup.weave_objective_names[self._objective_name],
			value = self:get_percentage_done() * 100
		}
		local callback = callback(self, "cb_game_session_disconnect")
		self._game_object_id = Managers.state.network:create_game_object("weave_objective", game_object_data_table, callback)
	else
		self._game_object_id = game_object_id
	end
end

WeaveInteractionExtension.complete = function (self)
	if self._on_complete_func then
		self._on_complete_func(self._unit)
	end

	self:deactivate()
end

WeaveInteractionExtension.deactivate = function (self)
	if self._is_server then
		local game_session = Network.game_session()

		if game_session then
			GameSession.destroy_game_object(game_session, self._game_object_id)
		end
	end

	local position = Unit.local_position(self._unit, 0)

	for i = 1, 3, 1 do
		local x_offset = math.random(-10, 10) / 10
		local y_offset = math.random(-10, 10) / 10
		local z_offset = math.random(-10, 10) / 10

		self._weave_objective_system:spawn_essence_unit(position + Vector3(0, 0, 0.5) + Vector3(x_offset, y_offset, z_offset))
	end

	self._game_object_id = nil
end

WeaveInteractionExtension.objective_name = function (self)
	return self._objective_name
end

WeaveInteractionExtension.cb_game_session_disconnect = function (self)
	return
end

WeaveInteractionExtension.update = function (self, dt, t)
	if not self._game_object_id then
		return
	end

	if self._is_server then
		return self:_server_update(dt, t)
	else
		return self:_client_update(dt, t)
	end
end

WeaveInteractionExtension._server_update = function (self, dt, t)
	local interaction_result = self._interactable_system.interaction_result
	local value_changed = false

	if self._interactable_system:is_being_interacted_with() then
		if interaction_result ~= self._interactable_state then
			if self._on_start_func then
				self._on_start_func(self._unit)

				self._on_start_func = nil
			end

			if self._on_interact_start_func then
				self._on_interact_start_func(self._unit)
			end
		else
			self._value = self._value + dt
			value_changed = true

			if self._on_progress_func then
				self._on_progress_func(self._unit, self._value, self._max_value)
			end
		end

		self._interactable_state = interaction_result
	elseif interaction_result ~= self._interactable_state and self._interactable_state ~= 0 then
		local num_times_completed = self._interactable_system.num_times_successfully_completed
		self._value = num_times_completed * self._duration
		value_changed = true

		if interaction_result == InteractionResult.SUCCESS then
			self._audio_system:play_audio_unit_event("emitter_rune_activate", self._unit)

			if self._on_interact_complete_func then
				self._on_interact_complete_func(self._unit)
			end
		elseif (interaction_result == InteractionResult.FAILURE or interaction_result == InteractionResult.USER_ENDED) and self._on_interact_interupt_func then
			self._on_interact_interupt_func(self._unit)
		end

		self._interactable_state = interaction_result
	elseif self._interactable_state ~= 0 then
		self._interactable_state = 0
	end

	local game_session = Network.game_session()

	if value_changed and game_session and self._game_object_id then
		GameSession.set_game_object_field(game_session, self._game_object_id, "value", self:get_percentage_done() * 100)
	end
end

WeaveInteractionExtension._client_update = function (self, dt, t)
	return
end

WeaveInteractionExtension.is_done = function (self)
	return self._num_times_to_complete <= self._interactable_system.num_times_successfully_completed
end

WeaveInteractionExtension.get_percentage_done = function (self)
	return math.clamp(self._value / self._max_value, 0, 1)
end

WeaveInteractionExtension.get_score = function (self)
	return self._score
end

return
