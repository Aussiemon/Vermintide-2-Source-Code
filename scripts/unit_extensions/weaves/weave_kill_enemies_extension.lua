WeaveKillEnemiesExtension = class(WeaveKillEnemiesExtension)
WeaveKillEnemiesExtension.NAME = "WeaveKillEnemiesExtension"
local BASE_SCORE_MULTIPLIER = {
	hardest = 0.7,
	hard = 0.9,
	harder = 0.8,
	cataclysm_2 = 0.5,
	cataclysm = 0.6,
	cataclysm_3 = 0.4,
	normal = 1
}

WeaveKillEnemiesExtension.init = function (self, extension_init_context, unit, extension_init_data)
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
	self._num_killed = 0
	self._kills_required = extension_init_data.amount or 0
	self._base_score_per_kill = extension_init_data.base_score_per_kill or WeaveSettings.base_score_per_kill
	self._breed_score_multipliers = extension_init_data.breed_score_multipliers or {}
	local score_multiplier = extension_init_data.score_multiplier or 1
	local difficulty_manager = Managers.state.difficulty
	local difficulty = difficulty_manager:get_difficulty()

	if type(score_multiplier) == "table" then
		score_multiplier = score_multiplier[difficulty] or BASE_SCORE_MULTIPLIER[difficulty] or 1
	end

	self._weave_manager = Managers.weave
	self._score_multiplier = score_multiplier
	self._breeds_allowed = extension_init_data.breeds_allowed
	self._races_allowed = extension_init_data.races_allowed
	self._hit_zones_allowed = extension_init_data.hit_zones_allowed
	self._attacks_allowed = extension_init_data.attacks_allowed
	self._damage_types_allowed = extension_init_data.damage_types_allowed
	self._weave_objective_system = Managers.state.entity:system("weave_objective_system")

	if not extension_init_context.is_server then
		return
	end

	if self._kills_required > 0 then
		self._method = "num_kills"
	else
		self._method = "score"

		if type(self._breed_score_multipliers) == "number" then
			self._breed_score_multipliers = {
				default = self._breed_score_multipliers
			}
		else
			local default_score_multiplier = WeaveSettings.enemies_score_multipliers
			local score_multipliers = self._breed_score_multipliers

			for breed_name, multiplier in pairs(default_score_multiplier) do
				if not score_multipliers[breed_name] then
					score_multipliers[breed_name] = multiplier
				end
			end
		end
	end

	if self._breeds_allowed and #self._breeds_allowed == 0 then
		self._breeds_allowed = nil
	end

	if self._races_allowed and #self._races_allowed == 0 then
		self._races_allowed = nil
	end

	if self._hit_zones_allowed and #self._hit_zones_allowed == 0 then
		self._hit_zones_allowed = nil
	end

	if self._attacks_allowed and #self._attacks_allowed == 0 then
		self._attacks_allowed = nil
	end

	if self._damage_types_allowed and #self._damage_types_allowed == 0 then
		self._damage_types_allowed = nil
	end
end

WeaveKillEnemiesExtension.get_objective_settings = function (self)
	return WeaveObjectiveSettings[WeaveKillEnemiesExtension.NAME]
end

WeaveKillEnemiesExtension.score = function (self)
	return self._score
end

WeaveKillEnemiesExtension.activate = function (self, game_object_id, objective_data)
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

WeaveKillEnemiesExtension.complete = function (self)
	if self._is_server and self._on_complete_func then
		self._on_complete_func(self._unit)
	end

	self:deactivate()
end

WeaveKillEnemiesExtension.deactivate = function (self)
	if self._is_server then
		local game_session = Network.game_session()

		if game_session then
			GameSession.destroy_game_object(game_session, self._game_object_id)
		end
	end

	self._game_object_id = nil
end

WeaveKillEnemiesExtension.objective_name = function (self)
	return self._objective_name
end

WeaveKillEnemiesExtension.cb_game_session_disconnect = function (self)
	return
end

WeaveKillEnemiesExtension.update = function (self, dt, t)
	if not self._game_object_id then
		return
	end

	if self._is_server then
		return self:_server_update(dt, t)
	else
		return self:_client_update(dt, t)
	end
end

WeaveKillEnemiesExtension._server_update = function (self, dt, t)
	return
end

WeaveKillEnemiesExtension._client_update = function (self, dt, t)
	return
end

WeaveKillEnemiesExtension.is_done = function (self)
	if self._method == "score" then
		return false
	end

	return self._kills_required <= self._num_killed
end

WeaveKillEnemiesExtension.get_percentage_done = function (self)
	if self._method == "score" then
		return 0
	end

	return math.clamp(self._num_killed / self._kills_required, 0, 1)
end

WeaveKillEnemiesExtension.get_score = function (self)
	return self._score
end

WeaveKillEnemiesExtension.on_ai_killed = function (self, killed_unit, killer_unit, death_data, killing_blow)
	local hit_zones_allowed = self._hit_zones_allowed

	if hit_zones_allowed and killing_blow then
		local death_hit_zone = killing_blow[DamageDataIndex.HIT_ZONE]

		if not table.contains(hit_zones_allowed, death_hit_zone) then
			return
		end
	end

	local damage_types_allowed = self._damage_types_allowed

	if damage_types_allowed and killing_blow then
		local damage_type = killing_blow[DamageDataIndex.DAMAGE_TYPE]

		if not table.contains(damage_types_allowed, damage_type) then
			return
		end
	end

	local attacks_allowed = self._attacks_allowed

	if attacks_allowed and killing_blow then
		local weapon_name = killing_blow[DamageDataIndex.DAMAGE_SOURCE_NAME]
		local master_list_item = rawget(ItemMasterList, weapon_name)

		if master_list_item then
			local slot_type = master_list_item.slot_type

			if not table.contains(attacks_allowed, slot_type) then
				return
			end
		else
			return
		end
	end

	local breeds_allowed = self._breeds_allowed
	local enemy_found = false
	local breed_name = death_data.breed.name

	if breeds_allowed and table.contains(breeds_allowed, breed_name) then
		enemy_found = true
	end

	local races_allowed = self._races_allowed

	if not enemy_found and races_allowed then
		local race_name = death_data.breed.race

		if table.contains(races_allowed, race_name) then
			enemy_found = true
		end
	end

	if (breeds_allowed or races_allowed) and not enemy_found then
		return
	end

	self._num_killed = self._num_killed + 1

	if self._num_killed == 1 and self._on_start_func then
		self._on_start_func(self._unit)

		self._on_start_func = nil
	end

	if self._on_progress_func then
		self._on_progress_func(self._unit, self._num_killed, self._kills_required)
	end

	if self._method == "score" then
		local roaming_multiplier = WeaveSettings.roaming_multiplier[PLATFORM]
		local spawn_type = Unit.get_data(killed_unit, "spawn_type") or "unknown"
		local score_multiplier_per_breed = self._breed_score_multipliers
		local breed_score_multiplier = score_multiplier_per_breed[breed_name] or score_multiplier_per_breed.default
		local score_multiplier = (spawn_type == "roam" and self._score_multiplier * roaming_multiplier) or self._score_multiplier
		local score = score_multiplier * breed_score_multiplier
		local despawned = death_data.despawned

		if not despawned then
			self._weave_objective_system:add_score(score)
			print("Spawn type: " .. spawn_type, "Score: " .. score, "Score Multiplier: ", score_multiplier)
		end

		Unit.set_data(killed_unit, "spawn_type", nil)
	end

	local game_session = Network.game_session()

	if self._is_server and game_session and self._game_object_id then
		GameSession.set_game_object_field(game_session, self._game_object_id, "value", self:get_percentage_done() * 100)
	end
end

return
