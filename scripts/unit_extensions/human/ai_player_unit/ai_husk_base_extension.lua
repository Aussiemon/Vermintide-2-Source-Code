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

	if breed.combat_spawn_stinger then
		Managers.music:music_trigger("combat_music", breed.combat_spawn_stinger)
	end

	local run_on_husk_spawn = breed.run_on_husk_spawn

	if run_on_husk_spawn then
		run_on_husk_spawn(unit)
	end

	return 
end
AiHuskBaseExtension.extensions_ready = function (self, world, unit)
	local health_extension = ScriptUnit.has_extension(unit, "health_system")

	if health_extension then
		local ai_system = Managers.state.entity:system("ai_system")
		local broadphase = ai_system.broadphase
		self.broadphase_id = Broadphase.add(broadphase, unit, Unit.local_position(unit, 0), 1)
		self.broadphase = broadphase
	end

	return 
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
	if self.broadphase_id then
		local health_extension = ScriptUnit.has_extension(unit, "health_system")
		local is_alive = health_extension and health_extension.is_alive(health_extension)

		if is_alive then
			Broadphase.move(self.broadphase, self.broadphase_id, POSITION_LOOKUP[unit])
		end
	end

	return 
end
AiHuskBaseExtension.destroy = function (self, unit, input)
	if self.broadphase_id then
		Broadphase.remove(self.broadphase, self.broadphase_id)
	end

	return 
end

return 
