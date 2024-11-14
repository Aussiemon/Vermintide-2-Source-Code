-- chunkname: @scripts/unit_extensions/weaves/weave_target_extension.lua

WeaveTargetExtension = class(WeaveTargetExtension, BaseObjectiveExtension)
WeaveTargetExtension.NAME = "WeaveTargetExtension"

WeaveTargetExtension.init = function (self, extension_init_context, unit, extension_init_data)
	WeaveTargetExtension.super.init(self, extension_init_context, unit, extension_init_data)

	self._on_start_func = extension_init_data.on_start_func
	self._on_progress_func = extension_init_data.on_progress_func
	self._on_complete_func = extension_init_data.on_complete_func
	self._audio_system = Managers.state.entity:system("audio_system")
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

WeaveTargetExtension.extensions_ready = function (self)
	self._health_extension = ScriptUnit.has_extension(self._unit, "health_system")

	if self._health_extension then
		self._max_health = self._health_extension:current_health()
		self._health = self._max_health
	end
end

WeaveTargetExtension.display_name = function (self)
	return "objective_targets_name_single"
end

WeaveTargetExtension.is_stacking_objective = function (self)
	return "target"
end

WeaveTargetExtension.initial_sync_data = function (self, game_object_data_table)
	game_object_data_table.value = self:get_percentage_done()
end

WeaveTargetExtension._set_objective_data = function (self, objective_data)
	return
end

WeaveTargetExtension._activate = function (self)
	local extension = ScriptUnit.has_extension(self._unit, "tutorial_system")

	if extension then
		extension:set_active(true)
	end
end

WeaveTargetExtension._deactivate = function (self)
	Unit.flow_event(self._unit, "target_destroyed")

	local tutorial_extension = ScriptUnit.extension(self._unit, "tutorial_system")

	tutorial_extension.active = false

	local position = Unit.local_position(self._unit, 0)

	for i = 1, 3 do
		local x_offset = math.random(-10, 10) / 10
		local y_offset = math.random(-10, 10) / 10
		local z_offset = math.random(-10, 10) / 10
		local objective_system = Managers.state.entity:system("objective_system")
		local weave_essence_handler = objective_system:weave_essence_handler()

		weave_essence_handler:spawn_essence_unit(position + Vector3(0, 0, 0.5) + Vector3(x_offset, y_offset, z_offset))
	end
end

WeaveTargetExtension._server_update = function (self, dt, t)
	local health = self._health_extension:current_health()

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

		self:server_set_value(self:get_percentage_done())
	end
end

WeaveTargetExtension._client_update = function (self, dt, t)
	return
end

WeaveTargetExtension.is_done = function (self)
	return self._health_extension:is_dead()
end

WeaveTargetExtension.attacks_allowed = function (self)
	return self._attacks_allowed
end

WeaveTargetExtension.get_percentage_done = function (self)
	return math.clamp(1 - self._health / self._max_health, 0, 1)
end
