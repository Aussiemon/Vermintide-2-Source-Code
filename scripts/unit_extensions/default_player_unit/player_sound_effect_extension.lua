PlayerSoundEffectExtension = class(PlayerSoundEffectExtension)
local HIT_COOLDOWN = 1.8
local KILL_COOLDOWN = 3.5
local MAX_HITS = 100
local MAX_KILLS = 10
local aggro_breed_ranges = {
	skaven_storm_vermin_champion = 10,
	chaos_exalted_champion_warcamp = 10,
	chaos_exalted_sorcerer = 10,
	chaos_warrior = 10,
	skaven_storm_vermin_warlord = 10,
	skaven_rat_ogre = 10,
	chaos_exalted_champion_norsca = 10,
	chaos_troll = 10,
	chaos_spawn = 10,
	skaven_stormfiend_boss = 10,
	chaos_spawn_exalted_champion_norsca = 10,
	skaven_stormfiend = 10
}

PlayerSoundEffectExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self._world = extension_init_context.world
	self._wwise_world = Managers.world:wwise_world(self._world)
	self._player = Managers.player
	self._is_server = Managers.player.is_server
	self._local_player = Managers.player.local_player
	self._num_recent_hits = 0
	self._num_recent_kills = 0
	self._recent_hit_cooldown = 0
	self._recent_kill_cooldown = 0
	self._aggro_unit = nil
	self._aggro_breed = nil
	self._current_aggro_value = 0
end

PlayerSoundEffectExtension.extensions_ready = function (self, world, unit)
	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

	if self._first_person_extension then
		self._first_person_unit = self._first_person_extension:get_first_person_unit()
	end
end

PlayerSoundEffectExtension.update = function (self, unit, input, dt, context, t)
	if not self._local_player then
		return
	end

	self:_update_recent_hits(dt)
	self:_update_recent_kills(dt)
	self:_update_aggro_ranges(dt)
end

PlayerSoundEffectExtension.destroy = function (self)
	return
end

PlayerSoundEffectExtension._update_recent_hits = function (self, dt)
	if self._recent_hit_cooldown <= 0 then
		return
	end

	self._recent_hit_cooldown = math.max(self._recent_hit_cooldown - dt, 0)

	if self._recent_hit_cooldown == 0 then
		self:_set_hit_count(0)
	end
end

PlayerSoundEffectExtension._update_recent_kills = function (self, dt)
	if self._recent_kill_cooldown <= 0 then
		return
	end

	self._recent_kill_cooldown = math.max(self._recent_kill_cooldown - dt, 0)

	if self._recent_kill_cooldown == 0 then
		self:_set_kill_count(0)
	end
end

PlayerSoundEffectExtension._update_aggro_ranges = function (self, dt)
	if not self._aggro_unit then
		local wwise_world = self._wwise_world

		WwiseWorld.set_global_parameter(wwise_world, "combat_combo_has_aggro", 0)
	end

	if self._aggro_unit and not AiUtils.unit_alive(self._aggro_unit) then
		self._aggro_unit = nil
		local wwise_world = self._wwise_world

		WwiseWorld.set_global_parameter(wwise_world, "combat_combo_has_aggro", 0)
		WwiseWorld.trigger_event(wwise_world, "Play_boss_aggro_exit")
	end

	if self._waiting_aggro_unit and not AiUtils.unit_alive(self._waiting_aggro_unit) then
		self._waiting_aggro_unit = nil
	end

	if self._waiting_aggro_unit then
		local breed = Unit.get_data(self._waiting_aggro_unit, "breed")
		local breed_name = breed.name
		local max_distance = aggro_breed_ranges[breed_name]

		if not max_distance then
			return
		end

		local unit_pos = POSITION_LOOKUP[self._unit]
		local enemy_pos = POSITION_LOOKUP[self._waiting_aggro_unit]
		local distance = Vector3.length(unit_pos - enemy_pos)
		local wwise_world = self._wwise_world

		if distance <= max_distance then
			local wwise_world = self._wwise_world

			WwiseWorld.set_global_parameter(wwise_world, "combat_combo_has_aggro", 1)
			WwiseWorld.trigger_event(wwise_world, "Play_boss_aggro_enter")

			self._aggro_unit = self._waiting_aggro_unit
			self._waiting_aggro_unit = nil
		end
	end
end

PlayerSoundEffectExtension._set_hit_count = function (self, num_hits)
	self._num_recent_hits = num_hits
	local wwise_world = self._wwise_world

	WwiseWorld.set_global_parameter(wwise_world, "combat_combo_hits", num_hits)
end

PlayerSoundEffectExtension._set_kill_count = function (self, num_kills)
	self._num_recent_kills = num_kills
	local wwise_world = self._wwise_world

	WwiseWorld.set_global_parameter(wwise_world, "combat_combo_kills", num_kills)
end

PlayerSoundEffectExtension.add_hit = function (self)
	self._recent_hit_cooldown = HIT_COOLDOWN
	local num_hits = math.min(self._num_recent_hits + 1, MAX_HITS)

	self:_set_hit_count(num_hits)
end

PlayerSoundEffectExtension.add_kill = function (self)
	self._recent_kill_cooldown = KILL_COOLDOWN
	local num_kills = math.min(self._num_recent_kills + 1, MAX_KILLS)

	self:_set_kill_count(num_kills)
end

PlayerSoundEffectExtension.dodge = function (self)
	if self._first_person_unit then
		Unit.flow_event(self._first_person_unit, "lua_dodge")
	end
end

PlayerSoundEffectExtension.dodged_attack = function (self)
	if self._first_person_unit then
		Unit.flow_event(self._first_person_unit, "lua_dodged_attack")
	end
end

PlayerSoundEffectExtension.melee_kill = function (self)
	if self._first_person_unit then
		Unit.flow_event(self._first_person_unit, "lua_melee_kill")
	end
end

PlayerSoundEffectExtension.aggro_unit_changed = function (self, enemy_unit, has_aggro)
	local breed = Unit.get_data(enemy_unit, "breed")

	if not breed then
		return
	end

	local breed_name = breed.name
	local max_distance = aggro_breed_ranges[breed_name]

	if not max_distance then
		return
	end

	if has_aggro then
		self._aggro_unit = enemy_unit
		local unit_pos = POSITION_LOOKUP[self._unit]
		local enemy_pos = POSITION_LOOKUP[enemy_unit]
		local distance = Vector3.length(unit_pos - enemy_pos)
		local wwise_world = self._wwise_world

		if distance <= max_distance then
			local wwise_world = self._wwise_world

			WwiseWorld.set_global_parameter(wwise_world, "combat_combo_has_aggro", 1)
			WwiseWorld.trigger_event(wwise_world, "Play_boss_aggro_enter")
		else
			self._aggro_unit = nil
			self._waiting_aggro_unit = enemy_unit
		end
	else
		self._aggro_unit = nil
		self._waiting_aggro_unit = nil
		local wwise_world = self._wwise_world

		WwiseWorld.set_global_parameter(wwise_world, "combat_combo_has_aggro", 0)
		WwiseWorld.trigger_event(wwise_world, "Play_boss_aggro_exit")
	end
end

PlayerSoundEffectExtension.get_music_aggro_state = function (self)
	if self._aggro_unit then
		return "player"
	end

	return "husk"
end

return
