-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/enemy_character_state_dead.lua

EnemyCharacterStateDead = class(EnemyCharacterStateDead, EnemyCharacterState)

EnemyCharacterStateDead.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "dead")
end

EnemyCharacterStateDead.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	self.despawn_time_start = t
	self.despawned = false
	self.switched_to_observer_camera = false

	local breed = Unit.get_data(unit, "breed")

	self._locomotion_extension:set_wanted_velocity(Vector3.zero())

	local first_person_extension = self._first_person_extension

	first_person_extension:set_wanted_player_height("knocked_down", t)
	first_person_extension:set_first_person_mode(false)

	local death_sound_event = breed.death_sound_event

	if death_sound_event then
		first_person_extension:play_hud_sound_event(death_sound_event)
	end

	local include_local_player = true
	local fast_respawns = Development.parameter("fast_respawns")
	local profile_id = self._player:profile_index()
	local profile = SPProfiles[profile_id]
	local affiliation = profile.affiliation
	local health_extension = ScriptUnit.extension(unit, "health_system")
	local last_damage = health_extension.last_damage_data
	local last_attacker = Managers.state.network.unit_storage:unit(last_damage.attacker_unit_id)

	if last_attacker and DamageUtils.is_player_unit(last_attacker) then
		self._override_follow_unit = last_attacker
		self._override_node_name = "camera_attach"
	else
		self._override_follow_unit = self._player.player_unit
		self._override_node_name = "j_hips"
	end

	local spawn_times = GameModeSettings.versus.side_settings.dark_pact.spawn_times

	self._linger_time = spawn_times.delayed_death_time
	self.dead_player_destroy_time = fast_respawns and 1 or self._linger_time

	local drop_items_delay = not fast_respawns and params and params.drop_items_delay or 0

	if profile.dead_player_destroy_time then
		self.dead_player_destroy_time = profile.dead_player_destroy_time
		drop_items_delay = self.dead_player_destroy_time - 0.001
	end

	local camera_params = {
		allow_camera_movement = true,
		follow_unit_rotation = false,
		override_node_name = "j_hips",
		override_follow_unit = self._player.player_unit,
		camera_offset = Vector3.up(),
		min_leave_t = math.huge,
	}

	CharacterStateHelper.change_camera_state(self._player, "follow_third_person", camera_params)
	fassert(drop_items_delay < self.dead_player_destroy_time, "Drop items delay too large - this will cause a drop attempt when the player is already despawned!")

	self.drop_items_time = t + drop_items_delay

	local override_item_drop_position = params and params.override_item_drop_position or nil
	local override_item_drop_direction = params and params.override_item_drop_direction or nil

	self.override_item_drop_position = override_item_drop_position and Vector3Box(override_item_drop_position) or nil
	self.override_item_drop_direction = override_item_drop_direction and Vector3Box(override_item_drop_direction) or nil

	if breed.name == "vs_packmaster" then
		local status_extension = ScriptUnit.extension(unit, "status_system")
		local packmaster_dragging = status_extension:get_is_packmaster_dragging()

		if packmaster_dragging then
			local dragged_unit = status_extension:get_packmaster_dragged_unit()

			StatusUtils.set_grabbed_by_pack_master_network("pack_master_unhooked", dragged_unit, false, unit)
			status_extension:set_packmaster_released()
		end
	end
end

EnemyCharacterStateDead.on_exit = function (self, unit, input, dt, context, t, next_state)
	self.override_item_drop_position = nil
	self.override_item_drop_direction = nil

	local game_mode = Managers.state.game_mode:game_mode()

	if game_mode then
		local about_to_end_game_early = game_mode:is_about_to_end_game_early()

		if not about_to_end_game_early then
			local camera_params = {
				allow_camera_movement = true,
				follow_unit_rotation = false,
				input_service_name = "dark_pact_selection",
				override_follow_unit = self._override_follow_unit,
				override_node_name = self._override_node_name,
			}
			local time_since_death = t - self.despawn_time_start

			if time_since_death < self._linger_time then
				local move_to_follow_t = t + (self._linger_time - time_since_death)

				CharacterStateHelper.change_camera_state_delayed(self._player, "observer", camera_params, move_to_follow_t)
			else
				CharacterStateHelper.change_camera_state(self._player, "observer", camera_params)
			end
		end
	end
end

EnemyCharacterStateDead.update = function (self, unit, input, dt, context, t)
	local time_since_death = t - self.despawn_time_start

	if not self.despawned and time_since_death > self.dead_player_destroy_time then
		local player = Managers.player:unit_owner(unit)

		Managers.state.spawn:delayed_despawn(player)

		self.despawned = true

		if player.local_player then
			Managers.state.camera:clear_mood("knocked_down")
			Managers.state.camera:clear_mood("wounded")
			Managers.state.camera:clear_mood("bleeding_out")
		end
	end
end
