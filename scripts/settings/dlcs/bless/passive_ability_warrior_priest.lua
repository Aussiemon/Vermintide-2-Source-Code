PassiveAbilityWarriorPriest = class(PassiveAbilityWarriorPriest)
local resouce_degen_rate = 6
local unit_animation_set_variable = Unit.animation_set_variable
local game_session_set_game_object_field = GameSession.set_game_object_field
local game_session_game_object_field = GameSession.game_object_field

PassiveAbilityWarriorPriest.init = function (self, extension_init_context, unit, extension_init_data, ability_init_data)
	self._owner_unit = unit
	self._player = extension_init_data.player
	self._ability_init_data = ability_init_data
	self._is_active = false
	self._not_in_combat = true
	self._current_resource = 0
	self._max_resource = 100
	self._time_to_ooc = 5
	self._activation_time = 0
	self.uses_resource = true
	self._is_local_human = self._player.local_player
	self._is_local_player = self._is_local_human or self._player.bot_player
	self._game = Managers.state.network:game()
end

PassiveAbilityWarriorPriest.extensions_ready = function (self, world, unit)
	self._buff_system = Managers.state.entity:system("buff_system")
	self._talent_extension = ScriptUnit.has_extension(unit, "talent_system")
	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self._inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")

	if self._first_person_extension then
		local fp_unit = self._first_person_extension:get_first_person_unit()
		self._fp_unit = fp_unit
		self._anim_var_id = Unit.animation_find_variable(fp_unit, "talent_anim_type")
		self._anim_var_3p_id = Unit.animation_find_variable(unit, "talent_anim_type")

		self:on_talents_changed(unit, self._talent_extension)
	end

	self:_register_events()
end

PassiveAbilityWarriorPriest.destroy = function (self)
	self:_unregister_events()
end

PassiveAbilityWarriorPriest._register_events = function (self)
	Managers.state.event:register(self, "on_player_killed_enemy", "on_player_killed_enemy")
	Managers.state.event:register(self, "on_hit", "on_hit")
	Managers.state.event:register(self, "on_weapon_wield", "on_weapon_wield")
	Managers.state.event:register(self, "level_start_local_player_spawned", "on_level_start_local_player_spawned")
	Managers.state.event:register(self, "on_talents_changed", "on_talents_changed")
end

PassiveAbilityWarriorPriest._unregister_events = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		Managers.state.event:unregister("on_player_killed_enemy", self)
		Managers.state.event:unregister("on_hit", self)
		Managers.state.event:unregister("on_weapon_wield", self)
		Managers.state.event:unregister("level_start_local_player_spawned", self)
		Managers.state.event:unregister("on_talents_changed", self)
	end
end

PassiveAbilityWarriorPriest.update = function (self, dt, t)
	local game_object_id = self._game_object_id
	local game = self._game

	if game and game_object_id then
		if self._is_local_player then
			local is_active = self._is_active

			if self._prev_is_active ~= is_active then
				self._prev_is_active = is_active

				game_session_set_game_object_field(game, game_object_id, "fury_active", is_active)
			end
		else
			local prev_is_active = self._is_active
			local is_active = game_session_game_object_field(game, game_object_id, "fury_active")

			if prev_is_active ~= is_active then
				self._is_active = is_active

				self:_set_fury_glow_enabled(is_active)
			end
		end
	end

	if self._is_local_player then
		if self._is_active or self._not_in_combat then
			local current_resource = self:degenerate_resource(dt)

			if current_resource <= 0 then
				self:deactivate_buff()
			end
		end

		self:combat_timer_update(t)
	end
end

PassiveAbilityWarriorPriest.on_player_killed_enemy = function (self, killing_blow, breed_killed, ai_unit)
	if not self._is_local_player then
		return
	end

	local owner_unit = self._owner_unit
	local position = POSITION_LOOKUP[owner_unit]
	local killed_unit_position = POSITION_LOOKUP[ai_unit]
	local distance_squared = Vector3.distance_squared(position, killed_unit_position)
	local range = 6
	local range_squared = range * range

	if distance_squared > range_squared then
		return
	end

	local resource_table = self._ability_init_data.resource_per_breed
	local resource_to_add = resource_table.on_normal

	if breed_killed and breed_killed.elite then
		resource_to_add = resource_table.on_elite
	elseif breed_killed and breed_killed.special then
		resource_to_add = resource_table.on_special
	elseif breed_killed and breed_killed.boss then
		resource_to_add = resource_table.on_boss
	end

	if self._is_local_human then
		Managers.state.event:trigger("glow_feedback")
	end

	self:modify_resource(resource_to_add)
end

PassiveAbilityWarriorPriest.on_hit = function (self, hit_unit, attack_type, hit_zone_name, target_number, buff_type, is_critical, unmodified, unit)
	if self._is_local_player then
		self:set_in_combat()
	end
end

PassiveAbilityWarriorPriest.modify_resource = function (self, amount)
	local has_changed = self._current_resource ~= self._max_resource

	if amount > 0 then
		self:set_in_combat()

		local difficulty = Managers.state.difficulty:get_difficulty()

		if difficulty then
			self._difficulty_rank = DifficultySettings[difficulty].rank
			local difficulty_tweak = {
				1,
				1.5,
				1.2,
				1,
				1,
				1,
				1,
				0.7
			}
			amount = amount * difficulty_tweak[self._difficulty_rank]
		end
	end

	self._current_resource = math.clamp(self._current_resource + amount, 0, self._max_resource)

	if self._max_resource <= self._current_resource and has_changed then
		self:activate_buff()
	end

	return self._current_resource
end

PassiveAbilityWarriorPriest.get_resource_fraction = function (self)
	local current_resource = self._current_resource
	local max_resource = self._max_resource

	return current_resource / max_resource
end

PassiveAbilityWarriorPriest.is_active = function (self)
	return self._is_active
end

PassiveAbilityWarriorPriest.degenerate_resource = function (self, dt)
	return self:modify_resource(-resouce_degen_rate * dt)
end

PassiveAbilityWarriorPriest.set_in_combat = function (self)
	self._not_in_combat = false
	local t = Managers.time:time("game")
	self._combat_timer = t + self._time_to_ooc
end

PassiveAbilityWarriorPriest.combat_timer_update = function (self, t)
	if not self._combat_timer then
		self._combat_timer = t + self._time_to_ooc
	end

	if self._combat_timer < t then
		self._not_in_combat = true
	end
end

PassiveAbilityWarriorPriest.activate_buff = function (self)
	if not self._is_active then
		self._is_active = true
		local t = Managers.time:time("game")
		self._activation_time = t
		local buff_system = self._buff_system
		local owner_unit = self._owner_unit
		self._buff_id = buff_system:add_buff_synced(owner_unit, "victor_priest_passive_aftershock", BuffSyncType.LocalAndServer)

		Unit.flow_event(owner_unit, "lua_enable_eye_glow")
		self:_set_fury_glow_enabled(true)

		if self._is_local_human then
			self:_play_vo()
			Managers.state.event:trigger("active_passive_feedback", true)
			Managers.state.achievement:trigger_event("righteous_fury_start", self._owner_unit, self._is_local_human)
		end
	end
end

PassiveAbilityWarriorPriest.deactivate_buff = function (self)
	if self._is_active then
		self._is_active = false
		local buff_system = self._buff_system
		local buff_id = self._buff_id
		local owner_unit = self._owner_unit

		buff_system:remove_buff_synced(owner_unit, buff_id)
		Unit.flow_event(owner_unit, "lua_disable_eye_glow")
		self:_set_fury_glow_enabled(false)

		if self._is_local_human then
			Managers.state.event:trigger("active_passive_feedback", false)
			Managers.state.achievement:trigger_event("righteous_fury_end", self._owner_unit, self._is_local_human)
		end
	end
end

PassiveAbilityWarriorPriest._play_vo = function (self)
	local owner_unit = self._owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("activate_fury", event_data)
end

PassiveAbilityWarriorPriest._set_fury_glow_enabled = function (self, enabled)
	local flow_event = enabled and "lua_enable_eye_glow" or "lua_disable_eye_glow"
	local inventory_extension = self._inventory_extension

	if self._is_local_human then
		local left_weapon, right_weapon = inventory_extension:get_all_weapon_unit()

		if left_weapon then
			Unit.flow_event(left_weapon, flow_event)
		end

		if right_weapon then
			Unit.flow_event(right_weapon, flow_event)
		end
	end

	local equipment = inventory_extension:equipment()

	if equipment then
		local left_weapon_3p = equipment.left_hand_wielded_unit_3p
		local right_weapon_3p = equipment.right_hand_wielded_unit_3p

		if left_weapon_3p then
			Unit.flow_event(left_weapon_3p, flow_event)
		end

		if right_weapon_3p then
			Unit.flow_event(right_weapon_3p, flow_event)
		end
	end

	Unit.flow_event(self._owner_unit, flow_event)
end

PassiveAbilityWarriorPriest.on_weapon_wield = function (self, equipment)
	self:_set_fury_glow_enabled(self._is_active)
end

PassiveAbilityWarriorPriest.on_level_start_local_player_spawned = function (self, initial_spawn)
	if self._is_local_player and not self._game_object_id then
		self:create_game_object()
	end
end

PassiveAbilityWarriorPriest.on_talents_changed = function (self, unit, talent_extension)
	if unit ~= self._owner_unit then
		return
	end

	local talent_selection = 0

	if talent_extension then
		if talent_extension:has_talent("victor_priest_6_1") then
			talent_selection = 0
		elseif talent_extension:has_talent("victor_priest_6_2") then
			talent_selection = 1
		elseif talent_extension:has_talent("victor_priest_6_3") then
			talent_selection = 2
		end
	end

	local fp_unit = self._fp_unit

	if ALIVE[fp_unit] and self._anim_var_id then
		unit_animation_set_variable(fp_unit, self._anim_var_id, talent_selection)
	end

	local tp_unit = unit

	if ALIVE[tp_unit] and self._anim_var_3p_id then
		unit_animation_set_variable(tp_unit, self._anim_var_3p_id, talent_selection)
	end
end

PassiveAbilityWarriorPriest.create_game_object = function (self)
	local network_manager = Managers.state.network
	local owner_unit = self._owner_unit
	local game_object_id = network_manager:unit_game_object_id(owner_unit)
	local game_object_data_table = {
		go_type = NetworkLookup.go_types.priest_career_data,
		unit_game_object_id = game_object_id,
		fury_active = self._is_active
	}
	local callback = callback(self, "cb_game_session_disconnect")
	self._game_object_id = network_manager:create_game_object("priest_career_data", game_object_data_table, callback)
end

PassiveAbilityWarriorPriest.set_career_game_object_id = function (self, go_id)
	self._game_object_id = go_id
end

PassiveAbilityWarriorPriest.cb_game_session_disconnect = function (self)
	self._game_object_id = nil
end
