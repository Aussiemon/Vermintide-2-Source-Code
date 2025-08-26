-- chunkname: @scripts/unit_extensions/human/ai_player_unit/ai_husk_base_extension.lua

AiHuskBaseExtension = class(AiHuskBaseExtension)

AiHuskBaseExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.is_husk = true
	self.unit = unit
	self.game = extension_init_data.game
	self.go_id = extension_init_data.go_id

	local breed = Unit.get_data(unit, "breed")

	self._breed = breed

	if not breed.hit_zones_lookup then
		DamageUtils.create_hit_zone_lookup(unit, breed)
	end

	local blackboard_init_data = breed.blackboard_init_data

	if blackboard_init_data and blackboard_init_data.player_locomotion_constrain_radius ~= nil then
		self.player_locomotion_constrain_radius = blackboard_init_data.player_locomotion_constrain_radius or nil
	else
		self.player_locomotion_constrain_radius = breed.player_locomotion_constrain_radius or nil
	end

	local run_on_husk_spawn = breed.run_on_husk_spawn

	if run_on_husk_spawn then
		run_on_husk_spawn(unit)
	end

	if breed.special_on_spawn_stinger then
		WwiseUtils.trigger_unit_event(extension_init_context.world, breed.special_on_spawn_stinger, unit, 0)
	end

	local side_id = extension_init_data.side_id

	self._side_id = side_id
	self.attributes = nil
end

AiHuskBaseExtension.extensions_ready = function (self, world, unit)
	local side_id = self._side_id
	local side_manager = Managers.state.side

	side_manager:add_unit_to_side(unit, side_id)

	local health_extension = ScriptUnit.has_extension(unit, "health_system")

	if health_extension then
		local ai_system = Managers.state.entity:system("ai_system")
		local broadphase = ai_system.broadphase
		local side = side_manager:get_side(side_id)

		self.broadphase_id = Broadphase.add(broadphase, unit, Unit.local_position(unit, 0), 1, side.broadphase_category)
		self.broadphase = broadphase
		self._health_extension = health_extension
	end

	Unit.flow_event(unit, "lua_trigger_variation")

	local level_settings = LevelSettings[Managers.state.game_mode:level_key()]
	local climate_type = level_settings.climate_type or "default"

	Unit.set_flow_variable(unit, "climate_type", climate_type)
	Unit.flow_event(unit, "climate_type_set")
end

AiHuskBaseExtension.freeze = function (self)
	self._side_id = nil
end

AiHuskBaseExtension.unfreeze = function (self, unit, data)
	local optional_data = data[7]
	local side_id = optional_data.side_id

	self._side_id = side_id

	Managers.state.side:add_unit_to_side(unit, side_id)

	if self.attributes then
		table.clear(self.attributes)
	end

	local run_on_husk_spawn = self._breed.run_on_husk_spawn

	if run_on_husk_spawn then
		run_on_husk_spawn(self.unit)
	end
end

AiHuskBaseExtension.current_action_name = function (self)
	local game = self.game
	local game_object_id = self.go_id

	return NetworkLookup.bt_action_names[GameSession.game_object_field(game, game_object_id, "bt_action_name")]
end

AiHuskBaseExtension.breed = function (self)
	return self._breed
end

AiHuskBaseExtension.update = function (self, unit, input, dt, context)
	if self.broadphase_id and HEALTH_ALIVE[unit] then
		Broadphase.move(self.broadphase, self.broadphase_id, POSITION_LOOKUP[unit])
	end
end

AiHuskBaseExtension.unit_removed_from_game = function (self)
	Managers.state.side:remove_unit_from_side(self.unit)

	self._side_id = nil
end

AiHuskBaseExtension.destroy = function (self, unit, input)
	return
end
