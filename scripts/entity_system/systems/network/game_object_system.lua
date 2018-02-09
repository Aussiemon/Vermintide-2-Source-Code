local extensions = {
	"GameObjectExtension"
}
GameObjectSystem = class(GameObjectSystem, ExtensionSystemBase)
GameObjectSystem.init = function (self, entity_system_creation_context, system_name)
	local entity_manager = entity_system_creation_context.entity_manager

	entity_manager.register_system(entity_manager, self, system_name, extensions)

	self.is_server = entity_system_creation_context.is_server
	self.unit_storage = entity_system_creation_context.unit_storage
	self.world = entity_system_creation_context.world
	self.name = system_name
	self.own_peer_id = Network.peer_id()
	self.unit_extension_data = {}
	self.units_to_sync = {}

	return 
end
GameObjectSystem.destroy = function (self)
	return 
end
local dummy_input = {}
GameObjectSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = {}

	if extension_name == "GameObjectExtension" then
		local level = LevelHelper:current_level(self.world)
		local level_index = Level.unit_index(level, unit)
		local ignored = level_index ~= nil
		extension.ignored = ignored

		if not ignored then
			local sync_name = extension_init_data.sync_name or Unit.get_data(unit, "sync_name")
			local go_type = extension_init_data.go_type or Unit.get_data(unit, "go_type")

			fassert(sync_name, "Game object extension couldn't find sync_name for unit %s", unit)
			fassert(go_type, "Game object extension couldn't find go_type for unit %s", unit)
			fassert(NetworkLookup.sync_names[sync_name], "Sync name %s on unit %s didn't exist in NetworkLookup", sync_name, unit)

			extension.sync_name = sync_name
			extension.go_type = go_type

			if not self.is_server then
				fassert(self.units_to_sync[sync_name] == nil, "Tried to register unit %s with sync_name %s but it was already set by %s", unit, sync_name, self.units_to_sync[sync_name])

				self.units_to_sync[sync_name] = unit
			end
		end
	end

	ScriptUnit.set_extension(unit, "game_object_system", extension, dummy_input)

	self.unit_extension_data[unit] = extension

	return extension
end
GameObjectSystem.extensions_ready = function (self, world, unit, extension_name)
	if extension_name == "GameObjectExtension" then
		local extension = self.unit_extension_data[unit]

		if self.is_server and not extension.ignored then
			Profiler.start("make unit networked")
			NetworkUnit.add_unit(unit)
			NetworkUnit.set_is_husk_unit(unit, false)

			local unit_name, unit_template, gameobject_functor_context = nil
			local game_session = Managers.state.network:game()
			local go_type = extension.go_type
			local unit_spawner = Managers.state.unit_spawner
			local go_initializer_function = unit_spawner.gameobject_initializers[go_type]

			fassert(go_initializer_function, "Couldn't find initializer function for go_type %s on unit %s", go_type, unit)

			local go_init_data = go_initializer_function(unit, unit_name, unit_template, gameobject_functor_context)
			local game_object_id = GameSession.create_game_object(game_session, go_type, go_init_data)
			extension.game_object_id = game_object_id

			self.unit_storage:add_unit_info(unit, game_object_id, go_type, self.own_peer_id)
			Profiler.stop("make unit networked")
		end
	end

	return 
end
GameObjectSystem.on_remove_extension = function (self, unit, extension_name)
	local extension = self.unit_extension_data[unit]

	if not extension.ignored then
		local game_session = Managers.state.network:game()
		local game_object_id = extension.game_object_id

		if game_session and self.is_server then
			GameSession.destroy_game_object(game_session, game_object_id)
		end

		if game_object_id then
			self.unit_storage:remove(game_object_id)
		end

		if NetworkUnit.is_network_unit(unit) then
			NetworkUnit.remove_unit(unit)
		end
	end

	self.unit_extension_data[unit] = nil

	ScriptUnit.remove_extension(unit, self.NAME)

	return 
end
GameObjectSystem.game_object_created = function (self, game_object_id, owner_id, go_template)
	local game_session = Managers.state.network:game()
	local sync_name_id = GameSession.game_object_field(game_session, game_object_id, "sync_name")
	local sync_name = NetworkLookup.sync_names[sync_name_id]
	local unit = self.units_to_sync[sync_name]

	fassert(unit, "Couldn't find unit with sync name %s and game_object_id %s", sync_name, game_object_id)
	NetworkUnit.add_unit(unit)
	NetworkUnit.set_is_husk_unit(unit, true)

	local go_type = go_template.go_type

	self.unit_storage:add_unit_info(unit, game_object_id, go_type, owner_id)

	local extension = self.unit_extension_data[unit]
	extension.game_object_id = game_object_id

	fassert(not extension.ignored, "Client got game_object_created for unit %s with sync_name %s that should be ignored...", unit, sync_name)

	return 
end
GameObjectSystem.update = function (self, context, t)
	return 
end
GameObjectSystem.hot_join_sync = function (self, peer_id)
	return 
end

return 
