-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/enemy_character_state_in_vortex.lua

EnemyCharacterStateInVortex = class(EnemyCharacterStateInVortex, EnemyCharacterState)

EnemyCharacterStateInVortex.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "in_vortex")
end

EnemyCharacterStateInVortex.on_enter = function (self, unit, input, dt, context, t, previous_state)
	local game = Managers.state.network:game()

	self.game = game

	local unit_storage = self._unit_storage
	local status_extension = self._status_extension
	local vortex_unit = status_extension.in_vortex_unit
	local vortex_go_id = unit_storage:go_id(vortex_unit)
	local chaos_vortex_extension = ScriptUnit.has_extension(vortex_unit, "ai_supplementary_system")
	local summoned_vortex_extension = ScriptUnit.has_extension(vortex_unit, "area_damage_system")
	local vortex_template

	if chaos_vortex_extension then
		vortex_template = chaos_vortex_extension.vortex_template
	elseif summoned_vortex_extension then
		vortex_template = summoned_vortex_extension.vortex_template
	else
		error("[EnemyCharacterStateInVortex] Could not deduce vortex template.")
	end

	self.vortex_unit = vortex_unit
	self.vortex_unit_go_id = vortex_go_id

	local player_actions_allowed = vortex_template.player_actions_allowed

	self.vortex_full_inner_radius = vortex_template.full_inner_radius
	self.keep_enemies_within_radius = vortex_template.keep_enemies_within_radius
	self.ascend_speed = vortex_template.player_ascend_speed
	self.rotation_speed = vortex_template.player_rotation_speed
	self.radius_change_speed = vortex_template.player_radius_change_speed
	self.player_actions_allowed = player_actions_allowed
	self.vortex_max_height = vortex_template.max_height_player_target or vortex_template.max_height
	self.post_vortex_buff = vortex_template.post_vortex_buff

	local interactor_extension = self._interactor_extension

	interactor_extension:abort_interaction()

	local locomotion_extension = self._locomotion_extension

	locomotion_extension:set_maximum_upwards_velocity(10)
	locomotion_extension:enable_drag(false)

	local first_person_extension = self._first_person_extension

	self.screenspace_effect_particle_id = first_person_extension:create_screen_particles("fx/screenspace_inside_plague_vortex")

	first_person_extension:play_hud_sound_event("sfx_player_in_vortex_true")

	local animation_event

	if player_actions_allowed then
		animation_event = "idle"
	else
		local inventory_extension = self._inventory_extension
		local career_extension = self._career_extension

		CharacterStateHelper.stop_weapon_actions(inventory_extension, "stunned")
		CharacterStateHelper.stop_career_abilities(career_extension, "stunned")

		animation_event = "idle"

		first_person_extension:hide_weapons("in_vortex")

		local include_local_player = false

		CharacterStateHelper.show_inventory_3p(unit, false, include_local_player, self._is_server, inventory_extension)
	end

	CharacterStateHelper.play_animation_event(unit, animation_event)
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, animation_event)
end

EnemyCharacterStateInVortex.on_exit = function (self, unit, input, dt, context, t, next_state)
	self.vortex_unit_go_id = nil
	self.vortex_full_inner_radius = nil

	if next_state then
		local locomotion_extension = self._locomotion_extension

		locomotion_extension:reset_maximum_upwards_velocity()
		locomotion_extension:enable_drag(true)

		local first_person_extension = self._first_person_extension

		first_person_extension:stop_spawning_screen_particles(self.screenspace_effect_particle_id)
		first_person_extension:play_hud_sound_event("sfx_player_in_vortex_false")

		self.screenspace_effect_particle_id = nil

		if self.post_vortex_buff then
			local buff_system = Managers.state.entity:system("buff_system")

			buff_system:add_buff(unit, self.post_vortex_buff, unit)
		end

		if not self.player_actions_allowed then
			first_person_extension:unhide_weapons("in_vortex")

			if Managers.state.network:game() then
				local include_local_player = false

				CharacterStateHelper.show_inventory_3p(unit, true, include_local_player, self._is_server, self._inventory_extension)
				CharacterStateHelper.play_animation_event(unit, "idle")
			end
		end
	end
end

EnemyCharacterStateInVortex.update_spin_velocity = function (self, unit, vortex_unit, vortex_unit_go_id, dt)
	local game = self.game
	local radius_percentage = GameSession.game_object_field(game, vortex_unit_go_id, "inner_radius_percentage")
	local wanted_inner_radius = (self.keep_enemies_within_radius or self.vortex_full_inner_radius * 0.75) * radius_percentage
	local ascend_speed = self.ascend_speed
	local rotation_speed = self.rotation_speed
	local radius_change_speed = self.radius_change_speed
	local unit_position = POSITION_LOOKUP[unit]
	local vortex_position = POSITION_LOOKUP[vortex_unit]
	local velocity, _, new_height = LocomotionUtils.get_vortex_spin_velocity(unit_position, vortex_position, wanted_inner_radius, Vector3.up(), rotation_speed, radius_change_speed, ascend_speed, dt)
	local height_percentage = GameSession.game_object_field(game, vortex_unit_go_id, "height_percentage")
	local vortex_height = self.vortex_max_height * height_percentage

	if vortex_height < new_height then
		velocity.z = 0
	end

	local locomotion_extension = self._locomotion_extension

	locomotion_extension:set_forced_velocity(velocity)
	locomotion_extension:set_wanted_velocity(velocity)
end

EnemyCharacterStateInVortex.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local status_extension = self._status_extension
	local first_person_extension = self._first_person_extension
	local is_catapulted, direction = CharacterStateHelper.is_catapulted(status_extension)

	if is_catapulted then
		local params = {
			sound_event = "Play_enemy_sorcerer_vortex_throw_player",
			direction = direction,
		}

		csm:change_state("catapulted", params)

		return
	end

	if not status_extension:is_valid_vortex_target() then
		CharacterStateHelper.do_common_state_transitions(status_extension, csm)

		return
	end

	if not CharacterStateHelper.is_in_vortex(status_extension) then
		if CharacterStateHelper.is_colliding_down(unit) then
			csm:change_state("standing")
		else
			csm:change_state("falling")
		end

		return
	end

	local input_extension = self._input_extension
	local interactor_extension = self._interactor_extension
	local player_actions_allowed = self.player_actions_allowed

	if player_actions_allowed and CharacterStateHelper.is_starting_interaction(input_extension, interactor_extension) and interactor_extension:allow_movement_during_interaction() then
		interactor_extension:start_interaction("interacting")
	end

	if Unit.alive(self.vortex_unit) then
		self:update_spin_velocity(unit, self.vortex_unit, self.vortex_unit_go_id, dt)
	end

	local player = self._player
	local viewport_name = player.viewport_name
	local inventory_extension = self._inventory_extension

	CharacterStateHelper.look(input_extension, viewport_name, first_person_extension, status_extension, inventory_extension)
end
