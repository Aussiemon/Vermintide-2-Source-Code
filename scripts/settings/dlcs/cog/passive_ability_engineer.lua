PassiveAbilityEngineer = class(PassiveAbilityEngineer)
local unit_alive = Unit.alive
local unit_set_flow_variable = Unit.set_flow_variable
local unit_flow_event = Unit.flow_event
local game_session_set_game_object_field = GameSession.set_game_object_field
local game_session_game_object_field = GameSession.game_object_field
local heat_pause_time = 1
local heat_particle_spawn_threshold = 0.05
local heat_particle_despawn_threshold = 0.01
local max_visual_heat_intensity = 0.2
local net_heat_lerp_speed = 5
local ability_charge_dial_lerp_speed = 10
local wind_down_pause_time = 0.3
local wind_down_speed_lerp_speed = 1

PassiveAbilityEngineer.init = function (self, extension_init_context, unit, extension_init_data, ability_init_data)
	self._owner_unit = unit
	self._player = extension_init_data.player
	self._is_server = extension_init_context.is_server
	self._player_unique_id = extension_init_data.player:unique_id()
	self._heat_cooldown_pause_t = 0
	self._weapon_visual_heat = 0
	self._prev_weapon_visual_heat = 0
	self._visual_heat_cooldown_speed = Weapons.bardin_engineer_career_skill_weapon.visual_heat_cooldown_speed
	self._heat_particles_spawned = false
	self._last_ability_charge = 0
	self._wind_down_progress = 0
	self._wind_down_cooldown_pause_t = 0
	self._is_local_player = self._player.local_player
	self._game = Managers.state.network:game()
end

PassiveAbilityEngineer.extensions_ready = function (self, world, unit)
	self._inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")
	self._career_extension = ScriptUnit.has_extension(unit, "career_system")
	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

	self:_register_events()
end

PassiveAbilityEngineer.destroy = function (self)
	self:_unregister_events()

	self._game_object_id = nil
end

PassiveAbilityEngineer._register_events = function (self)
	Managers.state.event:register(self, "on_engineer_weapon_fire", "on_engineer_weapon_fire")
	Managers.state.event:register(self, "on_engineer_weapon_spin_up", "on_engineer_weapon_spin_up")
	Managers.state.event:register(self, "level_start_local_player_spawned", "on_level_start_local_player_spawned")
end

PassiveAbilityEngineer._unregister_events = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		Managers.state.event:unregister("on_engineer_weapon_fire", self)
		Managers.state.event:unregister("on_engineer_weapon_spin_up", self)
		Managers.state.event:unregister("level_start_local_player_spawned", self)
	end
end

PassiveAbilityEngineer.update = function (self, dt, t)
	local game_object_id = self._game_object_id
	local game = self._game

	if game and game_object_id then
		if self._is_local_player then
			local visual_heat = self._weapon_visual_heat

			if self._heat_cooldown_pause_t < t then
				visual_heat = math.clamp(visual_heat - self._visual_heat_cooldown_speed * dt, 0, 1)
			end

			if self._wind_down_cooldown_pause_t < t then
				self._wind_down_progress = math.clamp(math.lerp(self._wind_down_progress, 0, wind_down_speed_lerp_speed * dt), 0, 1)
			end

			if self._prev_weapon_visual_heat ~= visual_heat then
				self._prev_weapon_visual_heat = visual_heat
				self._weapon_visual_heat = visual_heat

				game_session_set_game_object_field(game, game_object_id, "visual_heat", visual_heat)
			end
		elseif self._game_object_id then
			local synced_heat = game_session_game_object_field(game, game_object_id, "visual_heat")
			self._weapon_visual_heat = math.clamp(math.lerp(self._weapon_visual_heat, synced_heat, net_heat_lerp_speed * dt), 0, 1)
		end
	end

	local inventory_extension = self._inventory_extension
	local wielded_slot_data = inventory_extension:get_wielded_slot_data()

	if wielded_slot_data and wielded_slot_data.id == "slot_career_skill_weapon" then
		local equipment = inventory_extension:equipment()

		self:_update_career_weapon_particles(inventory_extension)
		self:_update_career_weapon(equipment.right_hand_wielded_unit)
		self:_update_career_weapon(equipment.right_hand_wielded_unit_3p)
		self:_update_weapon_anim_variables(dt)
	else
		self._heat_particles_spawned = false
		self._wind_down_progress = 0
	end
end

PassiveAbilityEngineer._update_career_weapon_particles = function (self, inventory_extension)
	if not self._heat_particles_spawned and heat_particle_spawn_threshold <= self._weapon_visual_heat then
		inventory_extension:start_weapon_fx("heat_shimmer")

		self._heat_particles_spawned = true
	elseif self._heat_particles_spawned and self._weapon_visual_heat <= heat_particle_despawn_threshold then
		inventory_extension:stop_weapon_fx("heat_shimmer")

		self._heat_particles_spawned = false
	end
end

PassiveAbilityEngineer._update_career_weapon = function (self, weapon_unit)
	if not weapon_unit or not unit_alive(weapon_unit) then
		return
	end

	unit_set_flow_variable(weapon_unit, "visual_heat", self._weapon_visual_heat)
	unit_flow_event(weapon_unit, "lua_update_visual_heat")
end

PassiveAbilityEngineer._update_weapon_anim_variables = function (self, dt)
	local first_person_extension = self._first_person_extension

	if first_person_extension then
		local current_ability_charge = self._career_extension:current_ability_cooldown_percentage()
		local ability_charge = math.clamp(math.lerp(self._last_ability_charge, current_ability_charge, dt * ability_charge_dial_lerp_speed), 0, 1)
		self._last_ability_charge = ability_charge

		first_person_extension:animation_set_variable("ammo_count", ability_charge)
		first_person_extension:animation_set_variable("wind_down_progress", self._wind_down_progress)
	end
end

PassiveAbilityEngineer.on_engineer_weapon_fire = function (self, heat_to_add)
	local new_heat = self._weapon_visual_heat + (heat_to_add or 0)
	self._weapon_visual_heat = math.clamp(new_heat, 0, max_visual_heat_intensity)
	local t = Managers.time:time("game")
	self._heat_cooldown_pause_t = t + heat_pause_time
	self._wind_down_progress = 1
	self._wind_down_cooldown_pause_t = t + wind_down_pause_time
end

PassiveAbilityEngineer.on_engineer_weapon_spin_up = function (self, custom_progress, ignore_anim_fixup)
	local t = Managers.time:time("game")

	if not ignore_anim_fixup then
		custom_progress = (custom_progress or 0) / 2 + 0.5
	end

	self._wind_down_progress = math.max(custom_progress or 0, self._wind_down_progress)
	self._wind_down_cooldown_pause_t = t + wind_down_pause_time
end

PassiveAbilityEngineer.on_level_start_local_player_spawned = function (self, initial_spawn)
	if self._is_local_player and not self._game_object_id then
		self:create_game_object()
	end
end

PassiveAbilityEngineer.create_game_object = function (self)
	local network_manager = Managers.state.network
	local unit = self._owner_unit
	local game_object_id = network_manager:unit_game_object_id(unit)
	local game_object_data_table = {
		go_type = NetworkLookup.go_types.engineer_career_data,
		unit_game_object_id = game_object_id,
		visual_heat = self._weapon_visual_heat
	}
	local callback = callback(self, "cb_game_session_disconnect")
	self._game_object_id = network_manager:create_game_object("engineer_career_data", game_object_data_table, callback)
end

PassiveAbilityEngineer.set_career_game_object_id = function (self, go_id)
	self._game_object_id = go_id
end

PassiveAbilityEngineer.cb_game_session_disconnect = function (self)
	self._game_object_id = nil
end
