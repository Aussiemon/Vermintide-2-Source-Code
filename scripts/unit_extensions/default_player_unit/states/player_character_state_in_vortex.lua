PlayerCharacterStateInVortex = class(PlayerCharacterStateInVortex, PlayerCharacterState)
PlayerCharacterStateInVortex.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "in_vortex")

	return 
end
PlayerCharacterStateInVortex.on_enter = function (self, unit, input, dt, context, t, previous_state)
	local game = Managers.state.network:game()
	self.game = game
	local unit_storage = self.unit_storage
	local status_extension = self.status_extension
	local vortex_unit = status_extension.in_vortex_unit
	local vortex_go_id = unit_storage.go_id(unit_storage, vortex_unit)
	local vortex_extension = ScriptUnit.extension(vortex_unit, "ai_supplementary_system")
	local vortex_template = vortex_extension.vortex_template
	self.vortex_unit = vortex_unit
	self.vortex_unit_go_id = vortex_go_id
	local player_actions_allowed = vortex_template.player_actions_allowed
	self.vortex_full_inner_radius = vortex_template.full_inner_radius
	self.ascend_speed = vortex_template.player_ascend_speed
	self.rotation_speed = vortex_template.player_rotation_speed
	self.radius_change_speed = vortex_template.player_radius_change_speed
	self.force_player_look_dir_to_spinn_dir = vortex_template.force_player_look_dir_to_spinn_dir
	self.player_actions_allowed = player_actions_allowed
	self.vortex_max_height = vortex_template.max_height
	local interactor_extension = self.interactor_extension

	interactor_extension.abort_interaction(interactor_extension)

	local locomotion_extension = self.locomotion_extension

	locomotion_extension.set_maximum_upwards_velocity(locomotion_extension, 10)
	locomotion_extension.enable_drag(locomotion_extension, false)

	local first_person_extension = self.first_person_extension
	self.screenspace_effect_particle_id = first_person_extension.create_screen_particles(first_person_extension, "fx/screenspace_inside_plague_vortex")

	first_person_extension.play_hud_sound_event(first_person_extension, "sfx_player_in_vortex_true")

	local animation_event = nil

	if player_actions_allowed then
		animation_event = "idle"
	else
		local inventory_extension = self.inventory_extension

		CharacterStateHelper.stop_weapon_actions(inventory_extension, "stunned")

		local direction = "backward"
		local directions = PlayerUnitMovementSettings.catapulted.directions
		animation_event = directions[direction].start_animation

		first_person_extension.hide_weapons(first_person_extension, "in_vortex")

		local include_local_player = false

		CharacterStateHelper.show_inventory_3p(unit, false, include_local_player, self.is_server, inventory_extension)
	end

	CharacterStateHelper.play_animation_event(unit, animation_event)
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, animation_event)

	return 
end
PlayerCharacterStateInVortex.on_exit = function (self, unit, input, dt, context, t, next_state)
	self.vortex_unit_go_id = nil
	self.vortex_full_inner_radius = nil

	if next_state then
		local locomotion_extension = self.locomotion_extension

		locomotion_extension.reset_maximum_upwards_velocity(locomotion_extension)
		locomotion_extension.enable_drag(locomotion_extension, true)

		local first_person_extension = self.first_person_extension

		first_person_extension.stop_spawning_screen_particles(first_person_extension, self.screenspace_effect_particle_id)
		first_person_extension.play_hud_sound_event(first_person_extension, "sfx_player_in_vortex_false")

		self.screenspace_effect_particle_id = nil
		local buff_system = Managers.state.entity:system("buff_system")

		buff_system.add_buff(buff_system, unit, "vortex_base", unit)

		if not self.player_actions_allowed then
			first_person_extension.unhide_weapons(first_person_extension, "in_vortex")

			if Managers.state.network:game() then
				local include_local_player = false

				CharacterStateHelper.show_inventory_3p(unit, true, include_local_player, self.is_server, self.inventory_extension)
				CharacterStateHelper.play_animation_event(unit, "airtime_end")
			end
		end
	end

	return 
end
PlayerCharacterStateInVortex.update_spin_velocity = function (self, unit, vortex_unit, vortex_unit_go_id, dt)
	local game = self.game
	local radius_percentage = GameSession.game_object_field(game, vortex_unit_go_id, "inner_radius_percentage")
	local wanted_inner_radius = self.vortex_full_inner_radius*radius_percentage*0.75
	local ascend_speed = self.ascend_speed
	local rotation_speed = self.rotation_speed
	local radius_change_speed = self.radius_change_speed
	local unit_position = POSITION_LOOKUP[unit]
	local vortex_position = POSITION_LOOKUP[vortex_unit]
	local velocity, new_radius, new_height, spinn_dir = LocomotionUtils.get_vortex_spin_velocity(unit_position, vortex_position, wanted_inner_radius, Vector3.up(), rotation_speed, radius_change_speed, ascend_speed, dt)
	local height_percentage = GameSession.game_object_field(game, vortex_unit_go_id, "height_percentage")
	local vortex_height = self.vortex_max_height*height_percentage

	if vortex_height < new_height then
		velocity.z = 0
	end

	local locomotion_extension = self.locomotion_extension

	locomotion_extension.set_forced_velocity(locomotion_extension, velocity)
	locomotion_extension.set_wanted_velocity(locomotion_extension, velocity)

	return spinn_dir
end
PlayerCharacterStateInVortex.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local status_extension = self.status_extension
	local first_person_extension = self.first_person_extension
	local is_catapulted, direction = CharacterStateHelper.is_catapulted(status_extension)

	if is_catapulted then
		local params = {
			sound_event = "Play_enemy_sorcerer_vortex_throw_player",
			direction = direction
		}

		csm.change_state(csm, "catapulted", params)

		return 
	end

	if not status_extension.is_valid_vortex_target(status_extension) then
		CharacterStateHelper.do_common_state_transitions(status_extension, csm)

		return 
	end

	if not CharacterStateHelper.is_in_vortex(status_extension) then
		if CharacterStateHelper.is_colliding_down(unit) then
			csm.change_state(csm, "standing")
		else
			csm.change_state(csm, "falling")
		end

		return 
	end

	local input_extension = self.input_extension
	local interactor_extension = self.interactor_extension
	local player_actions_allowed = self.player_actions_allowed

	if player_actions_allowed and CharacterStateHelper.is_starting_interaction(input_extension, interactor_extension) then
		local config = interactor_extension.interaction_config(interactor_extension)

		if config.allow_movement then
			interactor_extension.start_interaction(interactor_extension, "interacting")
		end
	end

	slot14 = Unit.alive(self.vortex_unit) and self.update_spin_velocity(self, unit, self.vortex_unit, self.vortex_unit_go_id, dt)
	local player = self.player
	local viewport_name = player.viewport_name
	local inventory_extension = self.inventory_extension

	CharacterStateHelper.look(input_extension, viewport_name, first_person_extension, status_extension, inventory_extension)

	if player_actions_allowed then
		local health_extension = self.health_extension

		CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, health_extension)
		CharacterStateHelper.reload(input_extension, inventory_extension, status_extension)
	end

	if self.force_player_look_dir_to_spinn_dir and rot then
		local rot = Quaternion.look(-spin_direction, Vector3.up())

		first_person_extension.force_look_rotation(first_person_extension, rot)
	end

	return 
end

return 
