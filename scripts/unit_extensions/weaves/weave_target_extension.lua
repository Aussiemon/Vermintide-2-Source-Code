-- chunkname: @scripts/unit_extensions/weaves/weave_target_extension.lua

WeaveTargetExtension = class(WeaveTargetExtension)
WeaveTargetExtension.NAME = "WeaveTargetExtension"

WeaveTargetExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._extension_init_context = extension_init_context
	self._extension_init_data = extension_init_data
	self._is_server = extension_init_context.is_server
	self._objective_name = extension_init_data.objective_name
	self._score = extension_init_data.score or 0
	self._game_object_id = nil
	self._unit = unit
	self._on_start_func = extension_init_data.on_start_func
	self._on_progress_func = extension_init_data.on_progress_func
	self._on_complete_func = extension_init_data.on_complete_func
	self._health_system = ScriptUnit.has_extension(self._unit, "health_system")
	self._max_health = self._health_system:current_health()
	self._health = self._max_health
	self._audio_system = Managers.state.entity:system("audio_system")
	self._weave_objective_system = Managers.state.entity:system("weave_objective_system")
	self.keep_alive = true

	local terror_event_spawner_id = extension_init_data.terror_event_spawner_id

	Unit.set_data(unit, "terror_event_spawner_id", terror_event_spawner_id)

	self._attacks_allowed = extension_init_data.attacks_allowed or {
		melee = true,
		ranged = true,
	}

	Unit.set_data(unit, "allow_melee_damage", self._attacks_allowed.melee)
	Unit.set_data(unit, "allow_ranged_damage", self._attacks_allowed.ranged)
end

WeaveTargetExtension.get_objective_settings = function (self)
	return WeaveObjectiveSettings[WeaveTargetExtension.NAME]
end

WeaveTargetExtension.score = function (self)
	return self._score
end

WeaveTargetExtension.activate = function (self, game_object_id, objective_data)
	local extension = ScriptUnit.has_extension(self._unit, "tutorial_system")

	if extension then
		extension:set_active(true)
	end

	if self._is_server then
		local game_object_data_table = {
			go_type = NetworkLookup.go_types.weave_objective,
			objective_name = NetworkLookup.weave_objective_names[self._objective_name],
			value = self:get_percentage_done() * 100,
		}
		local callback = callback(self, "cb_game_session_disconnect")

		self._game_object_id = Managers.state.network:create_game_object("weave_objective", game_object_data_table, callback)
	else
		self._game_object_id = game_object_id
	end
end

WeaveTargetExtension.complete = function (self)
	if self._is_server and self._on_complete_func then
		self._on_complete_func(self._unit)
	end

	self:deactivate()
end

WeaveTargetExtension.deactivate = function (self)
	if self._is_server then
		local game_session = Network.game_session()

		if game_session then
			GameSession.destroy_game_object(game_session, self._game_object_id)
		end
	end

	Unit.flow_event(self._unit, "target_destroyed")

	local tutorial_system = ScriptUnit.extension(self._unit, "tutorial_system")

	tutorial_system.active = false

	local position = Unit.local_position(self._unit, 0)

	for i = 1, 3 do
		local x_offset = math.random(-10, 10) / 10
		local y_offset = math.random(-10, 10) / 10
		local z_offset = math.random(-10, 10) / 10

		self._weave_objective_system:spawn_essence_unit(position + Vector3(0, 0, 0.5) + Vector3(x_offset, y_offset, z_offset))
	end

	self._game_object_id = nil
end

WeaveTargetExtension.objective_name = function (self)
	return self._objective_name
end

WeaveTargetExtension.cb_game_session_disconnect = function (self)
	return
end

WeaveTargetExtension.update = function (self, dt, t)
	if not self._game_object_id then
		return
	end

	if self._is_server then
		return self:_server_update(dt, t)
	else
		return self:_client_update(dt, t)
	end
end

WeaveTargetExtension._server_update = function (self, dt, t)
	local health = self._health_system:current_health()

	if health ~= self._health then
		if self._on_start_func then
			self._on_start_func(self._unit)

			self._on_start_func = nil
		end

		self._audio_system:play_2d_audio_event("hud_text_reveal")

		if health < self._health and self._on_progress_func then
			self._on_progress_func(self._unit, health, self._max_health)
		end

		self._health = health

		local game_session = Network.game_session()

		if game_session and self._game_object_id then
			GameSession.set_game_object_field(game_session, self._game_object_id, "value", self:get_percentage_done() * 100)
		end
	end
end

WeaveTargetExtension._client_update = function (self, dt, t)
	return
end

WeaveTargetExtension.is_done = function (self)
	return self._health_system:is_dead()
end

WeaveTargetExtension.attacks_allowed = function (self)
	return self._attacks_allowed
end

WeaveTargetExtension.get_percentage_done = function (self)
	return math.clamp(1 - self._health / self._max_health, 0, 1)
end

WeaveTargetExtension.get_score = function (self)
	return self._score
end
