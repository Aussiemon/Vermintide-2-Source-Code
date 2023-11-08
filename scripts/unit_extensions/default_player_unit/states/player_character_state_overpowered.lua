PlayerCharacterStateOverpowered = class(PlayerCharacterStateOverpowered, PlayerCharacterState)

PlayerCharacterStateOverpowered.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "overpowered")
end

PlayerCharacterStateOverpowered.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	CharacterStateHelper.stop_weapon_actions(self.inventory_extension, "overpowered")
	CharacterStateHelper.stop_career_abilities(self.career_extension, "overpowered")

	local player = Managers.player:owner(unit)
	local is_bot = player and not player:is_player_controlled()

	if params.start_sound_event and not is_bot then
		local wwise_world = Managers.world:wwise_world(self.world)

		WwiseWorld.trigger_event(wwise_world, params.start_sound_event)
	end

	local anim = "to_cloud_of_flies"

	self.inventory_extension:check_and_drop_pickups("overpowererd")
	CharacterStateHelper.play_animation_event(unit, anim)

	local input_extension = self.input_extension
	local status_extension = self.status_extension

	self.locomotion_extension:set_wanted_velocity(Vector3.zero())

	self.params = params

	CharacterStateHelper.change_camera_state(self.player, "follow_third_person")
	self.first_person_extension:set_first_person_mode(false)
	CharacterStateHelper.show_inventory_3p(unit, false, true, Managers.player.is_server, self.inventory_extension)
end

PlayerCharacterStateOverpowered.on_exit = function (self, unit, input, dt, context, t, next_state)
	local player = Managers.player:owner(unit)
	local is_bot = player and not player:is_player_controlled()

	if self.params.end_sound_event and not is_bot then
		local wwise_world = Managers.world:wwise_world(self.world)

		WwiseWorld.trigger_event(wwise_world, self.params.end_sound_event)
	end

	local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

	if first_person_extension and self.onscreen_particle_id then
		first_person_extension:stop_spawning_screen_particles(self.onscreen_particle_id)
	end

	if next_state ~= "knocked_down" then
		CharacterStateHelper.change_camera_state(self.player, "follow")
		self.first_person_extension:toggle_visibility(CameraTransitionSettings.perspective_transition_time)

		local include_local_player = false

		CharacterStateHelper.show_inventory_3p(unit, true, include_local_player, self.is_server, self.inventory_extension)
	end

	local inventory_extension = self.inventory_extension

	inventory_extension:rewield_wielded_slot()
	self.status_extension:set_overpowered(false)
end

PlayerCharacterStateOverpowered.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local unit = self.unit
	local input_extension = self.input_extension
	local inventory_extension = self.inventory_extension
	local status_extension = self.status_extension
	local locomotion_extension = self.locomotion_extension
	local world = self.world
	local attacking_unit = status_extension.overpowered_attacking_unit
	local is_free = not HEALTH_ALIVE[attacking_unit]

	if is_free then
		if CharacterStateHelper.is_waiting_for_assisted_respawn(status_extension) then
			csm:change_state("waiting_for_assisted_respawn")
		elseif CharacterStateHelper.is_knocked_down(status_extension) then
			csm:change_state("knocked_down")
		elseif CharacterStateHelper.is_dead(status_extension) then
			csm:change_state("dead")
		else
			csm:change_state("standing")
		end

		return
	end

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm, "overpowered") then
		return
	end

	if CharacterStateHelper.is_ledge_hanging(world, unit, self.temp_params) then
		csm:change_state("ledge_hanging", self.temp_params)

		return
	end

	if not csm.state_next and not locomotion_extension:is_on_ground() then
		csm:change_state("falling")

		return
	end

	locomotion_extension:set_disable_rotation_update()
	CharacterStateHelper.look(input_extension, self.player.viewport_name, self.first_person_extension, status_extension, inventory_extension)
end
