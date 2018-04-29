PlayerCharacterStateGrabbedByCorruptor = class(PlayerCharacterStateGrabbedByCorruptor, PlayerCharacterState)
local position_lookup = POSITION_LOOKUP
PlayerCharacterStateGrabbedByCorruptor.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "grabbed_by_corruptor")

	self.next_hanging_damage_time = 0

	return 
end
PlayerCharacterStateGrabbedByCorruptor.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	local inventory_extension = self.inventory_extension

	CharacterStateHelper.stop_weapon_actions(inventory_extension, "grabbed")
	inventory_extension.check_and_drop_pickups(inventory_extension, "grabbed_by_pack_master")
	CharacterStateHelper.change_camera_state(self.player, "follow_third_person")

	local first_person_extension = self.first_person_extension

	first_person_extension.set_first_person_mode(first_person_extension, false)

	if self.ai_extension == nil then
		local wwise_world = Managers.world:wwise_world(self.world)
		local wwise_playing_id, wwise_source_id = WwiseWorld.trigger_event(wwise_world, "start_strangled_state", first_person_extension.get_first_person_unit(first_person_extension))
		self.grabbed_by_corruptor_start_sound_event = "chaos_corruptor_corrupting"
		self.grabbed_by_corruptor_stop_sound_event = "chaos_corruptor_corrupting_stop"

		WwiseUtils.trigger_unit_event(self.world, self.grabbed_by_corruptor_start_sound_event, unit, 0)
	end

	local status_extension = self.status_extension
	self.corruptor_status = CharacterStateHelper.corruptor_status(status_extension)
	local states = PlayerCharacterStateGrabbedByCorruptor.states

	if states[self.corruptor_status].enter then
		states[self.corruptor_status].enter(self, unit)
	end

	local locomotion = ScriptUnit.extension(unit, "locomotion_system")

	locomotion.enable_rotation_towards_velocity(locomotion, false)
	CharacterStateHelper.show_inventory_3p(unit, false, true, Managers.player.is_server, self.inventory_extension)

	return 
end
PlayerCharacterStateGrabbedByCorruptor.on_exit = function (self, unit, input, dt, context, t, next_state)
	local first_person_extension = self.first_person_extension
	local status_extension = self.status_extension
	local locomotion_extension = self.locomotion_extension

	if not status_extension.is_knocked_down(status_extension) and not status_extension.is_dead(status_extension) then
		CharacterStateHelper.change_camera_state(self.player, "follow")
		first_person_extension.toggle_visibility(first_person_extension, CameraTransitionSettings.perspective_transition_time)
		locomotion_extension.enable_script_driven_movement(locomotion_extension)
	end

	locomotion_extension.enable_rotation_towards_velocity(locomotion_extension, true)

	if self.ai_extension == nil then
		local wwise_world = Managers.world:wwise_world(self.world)
		local wwise_playing_id, wwise_source_id = WwiseWorld.trigger_event(wwise_world, "stop_strangled_state", first_person_extension.get_first_person_unit(first_person_extension))

		WwiseUtils.trigger_unit_event(self.world, self.grabbed_by_corruptor_stop_sound_event, unit, 0)
	end

	local inventory_extension = self.inventory_extension

	inventory_extension.rewield_wielded_slot(inventory_extension)

	return 
end
PlayerCharacterStateGrabbedByCorruptor.states = {
	chaos_corruptor_grabbed = {
		enter = function (parent, unit)
			local locomotion = ScriptUnit.extension(unit, "locomotion_system")
			local corruptor_unit = parent.status_extension.corruptor_unit

			if Unit.alive(corruptor_unit) then
				local wanted_pos = position_lookup[corruptor_unit]
				local current_pos = position_lookup[unit]
				local to_corruptor = Vector3.normalize(wanted_pos - current_pos)

				locomotion.set_wanted_velocity(locomotion, Vector3.zero())
				Unit.set_local_rotation(unit, 0, Quaternion.look(to_corruptor))
				locomotion.enable_rotation_towards_velocity(locomotion, true, Quaternion.look(to_corruptor), 1)
			end

			return 
		end,
		run = function (parent, unit)
			local corruptor_unit = parent.status_extension.corruptor_unit

			if Unit.alive(corruptor_unit) then
				local locomotion = ScriptUnit.extension(unit, "locomotion_system")
				local wanted_pos = position_lookup[corruptor_unit]
				local current_pos = position_lookup[unit]
				local distance = Vector3.distance(wanted_pos, current_pos)
				local to_corruptor = wanted_pos - current_pos
				local velocity = Vector3.normalize(to_corruptor) * 2

				locomotion.set_maximum_upwards_velocity(locomotion, velocity.z)
				locomotion.set_forced_velocity(locomotion, velocity)
			end

			return 
		end
	},
	chaos_corruptor_dragging = {
		enter = function (parent, unit)
			return 
		end,
		run = function (parent, unit)
			local corruptor_unit = parent.status_extension.corruptor_unit

			if Unit.alive(corruptor_unit) then
				local locomotion = ScriptUnit.extension(unit, "locomotion_system")

				locomotion.set_disable_rotation_update(locomotion)

				local wanted_pos = position_lookup[corruptor_unit]
				local current_pos = position_lookup[unit]
				local distance = Vector3.distance(wanted_pos, current_pos)
				local velocity = Vector3.normalize(wanted_pos - current_pos) * 4

				if 1.5 < distance then
					locomotion.set_forced_velocity(locomotion, velocity)
				else
					locomotion.set_wanted_velocity(locomotion, Vector3.zero())
				end
			end

			return true
		end
	},
	chaos_corruptor_released = {
		run = function (parent, unit)
			return 
		end,
		enter = function (parent, unit)
			parent.locomotion_extension:enable_script_driven_movement()

			local status_extension = parent.status_extension
			local csm = parent.csm
			local status_extension = parent.status_extension

			if CharacterStateHelper.is_dead(status_extension) then
				csm.change_state(csm, "dead")
			elseif CharacterStateHelper.is_knocked_down(status_extension) then
				local inventory_extension = parent.inventory_extension

				inventory_extension.rewield_wielded_slot(inventory_extension)
				csm.change_state(csm, "knocked_down", parent.temp_params)
			else
				local inventory_extension = parent.inventory_extension

				inventory_extension.rewield_wielded_slot(inventory_extension)
				csm.change_state(csm, "standing")
			end

			CharacterStateHelper.show_inventory_3p(unit, true, true, Managers.player.is_server, parent.inventory_extension)

			return 
		end
	}
}
PlayerCharacterStateGrabbedByCorruptor.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local unit = self.unit
	local input_extension = self.input_extension
	local status_extension = self.status_extension
	local first_person_extension = self.first_person_extension
	local corruptor_status = CharacterStateHelper.corruptor_status(self.status_extension)
	local states = PlayerCharacterStateGrabbedByCorruptor.states
	local last_state = self.corruptor_status

	if corruptor_status ~= last_state then
		if states[last_state].leave then
			states[last_state].leave(self, unit)
		end

		if states[corruptor_status].enter then
			states[corruptor_status].enter(self, unit)
		end

		self.corruptor_status = corruptor_status
	end

	if not states[corruptor_status].run(self, unit) then
		return 
	end

	CharacterStateHelper.look(input_extension, self.player.viewport_name, self.first_person_extension, status_extension, self.inventory_extension)

	return 
end

return 
