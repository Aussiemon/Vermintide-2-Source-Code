require("scripts/unit_extensions/limited_item_track/limited_item_track_spawner_templates")

WeaveLimitedItemSpawnerExtension = class(WeaveLimitedItemSpawnerExtension)
WeaveLimitedItemSpawnerExtension.NAME = "WeaveLimitedItemSpawnerExtension"

WeaveLimitedItemSpawnerExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._extension_init_context = extension_init_context
	self._world = extension_init_context.world
	self._is_server = extension_init_context.is_server
	self._unit = unit
	self._objective_name = Unit.get_data(unit, "weave_objective_id")
	self._extension_init_data = extension_init_data
	self._score = extension_init_data.score or 0
	self._limited_item_track_extension = nil
	self._interacting_with_spawned_items = false
	self._items_spawned = false
	self._value = 0
	self._from_spawner = true
	self._deactivated = false
	self._on_first_pickup_func = nil
	self._on_pickup_func = nil
	self._on_throw_func = nil
	self._on_destroy_func = nil
	self._on_spawn_func = nil
	self._on_complete_func = nil
	local limited_item_template_name = Unit.get_data(unit, "template_name")
	local template = LimitedItemTrackSpawnerTemplates[limited_item_template_name]
	local pickup_system = Managers.state.entity:system("pickup_system")

	if template then
		pickup_system:disable_spawners(template.types or {})
	end
end

WeaveLimitedItemSpawnerExtension.score = function (self)
	return self._score
end

WeaveLimitedItemSpawnerExtension.get_objective_settings = function (self)
	return WeaveObjectiveSettings[WeaveLimitedItemSpawnerExtension.NAME]
end

WeaveLimitedItemSpawnerExtension.activate = function (self, game_object_id, objective_data)
	if self._is_server then
		local game_object_data_table = {
			go_type = NetworkLookup.go_types.weave_objective,
			objective_name = NetworkLookup.weave_objective_names[self._objective_name],
			value = self._value
		}
		local callback = callback(self, "cb_game_session_disconnect")
		self._game_object_id = Managers.state.network:create_game_object("weave_objective", game_object_data_table, callback)
		self._limited_item_track_extension = ScriptUnit.extension(self._unit, "limited_item_track_system")

		if objective_data then
			self:set_weave_settings(objective_data)
		end
	else
		self._game_object_id = game_object_id
	end

	local mission_system = Managers.state.entity:system("mission_system")
	local active_missions = mission_system:get_missions()

	if not active_missions or not active_missions.weave_collect_limited_item_objective then
		mission_system:start_mission("weave_collect_limited_item_objective")
	end

	Managers.state.entity:system("limited_item_track_system"):weave_activate_spawner(self._unit, self._objective_name)
end

WeaveLimitedItemSpawnerExtension.destroy = function (self)
	return
end

WeaveLimitedItemSpawnerExtension.set_weave_settings = function (self, objective_data)
	self._on_first_pickup_func = objective_data.on_first_pickup_func
	self._on_pickup_func = objective_data.on_pickup_func
	self._on_throw_func = objective_data.on_throw_func
	self._on_destroy_func = objective_data.on_destroy_func
	self._on_spawn_func = objective_data.on_spawn_func
	self._on_complete_func = objective_data.on_complete_func
	local template_name = objective_data.template_name or Unit.get_data(self._unit, "template_name")
	local pickup_name = template_name == "gargoyle_head_spawner" and "magic_crystal" or "magic_barrel"

	Unit.set_data(self._unit, "template_name", template_name)
	Unit.set_data(self._unit, "pickup_name", pickup_name)

	self._limited_item_track_extension.template_name = template_name
end

WeaveLimitedItemSpawnerExtension.complete = function (self)
	if self._is_server and self._on_complete_func then
		self._on_complete_func(self._unit)
	end

	self:deactivate()
end

WeaveLimitedItemSpawnerExtension.deactivate = function (self)
	local limited_item_track_system = Managers.state.entity:system("limited_item_track_system")

	limited_item_track_system:deactivate_group(self._objective_name)

	self._deactivated = true

	if self._is_server then
		local items = self._limited_item_track_extension.items

		for _, unit in ipairs(items) do
			if type(unit) ~= "boolean" then
				Managers.state.unit_spawner:mark_for_deletion(unit)
			end
		end

		local game_session = Network.game_session()

		if game_session then
			GameSession.destroy_game_object(game_session, self._game_object_id)
		end
	end

	self._game_object_id = nil
end

WeaveLimitedItemSpawnerExtension.objective_name = function (self)
	return self._objective_name
end

WeaveLimitedItemSpawnerExtension.game_object_id = function (self)
	return self._game_object_id
end

WeaveLimitedItemSpawnerExtension.update = function (self, dt, t)
	if not self._game_object_id then
		return
	end

	if self._is_server then
		self:_server_update(dt, t)
	else
		self:_client_update(dt, t)
	end
end

WeaveLimitedItemSpawnerExtension.cb_game_session_disconnect = function (self)
	return
end

WeaveLimitedItemSpawnerExtension.is_done = function (self)
	return self._value >= 100
end

WeaveLimitedItemSpawnerExtension.get_percentage_done = function (self)
	return self._value / 100
end

WeaveLimitedItemSpawnerExtension.get_score = function (self)
	return self._score
end

WeaveLimitedItemSpawnerExtension._server_update = function (self, dt, t)
	local limited_item_track_extension = self._limited_item_track_extension

	if limited_item_track_extension.num_socketed_items == limited_item_track_extension.pool then
		self._value = 100
		local limited_item_track_system = Managers.state.entity:system("limited_item_track_system")

		limited_item_track_system:decrease_group_pool_size(self._objective_name)
	end

	local is_any_transformed = limited_item_track_extension:is_any_transformed()
	local is_any_spawned = limited_item_track_extension:is_any_item_spawned()

	if not self._interacting_with_spawned_item and is_any_transformed then
		if self._on_first_pickup_func then
			self._on_first_pickup_func(self._unit)

			self._on_first_pickup_func = nil
		end

		if self._on_pickup_func then
			self._on_pickup_func(self._unit, self._from_spawner)
		end

		self._interacting_with_spawned_item = true
		self._from_spawner = false
	elseif self._interacting_with_spawned_item and not is_any_transformed then
		if is_any_spawned and self._on_throw_func then
			self._on_throw_func(self._unit)
		end

		self._interacting_with_spawned_item = false
	end

	if not self._items_spawned and is_any_spawned then
		self._from_spawner = true

		if self._on_spawn_func then
			self._on_spawn_func(self._unit)
		end

		self._items_spawned = true
	elseif self._items_spawned and not is_any_spawned then
		self._from_spawner = false

		if self._on_destroy_func then
			self._on_destroy_func(self._unit)
		end

		self._items_spawned = false
	end

	local game_session = Network.game_session()

	if game_session and self._game_object_id then
		GameSession.set_game_object_field(game_session, self._game_object_id, "value", self._value)
	end
end

WeaveLimitedItemSpawnerExtension._client_update = function (self, dt, t)
	local game_session = Network.game_session()

	if game_session then
		self._value = GameSession.game_object_field(game_session, self._game_object_id, "value")
	end
end
