require("scripts/settings/player_movement_settings")

PlayerCharacterStateCatapulted = class(PlayerCharacterStateCatapulted, PlayerCharacterState)
local position_lookup = POSITION_LOOKUP
local DIRECTIONS = PlayerUnitMovementSettings.catapulted.directions

PlayerCharacterStateCatapulted.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "catapulted")
end

PlayerCharacterStateCatapulted.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	CharacterStateHelper.stop_weapon_actions(self.inventory_extension, "stunned")
	CharacterStateHelper.stop_career_abilities(self.career_extension, "stunned")

	local direction = params.direction

	if previous_state == "grabbed_by_chaos_spawn" then
		direction = "forward_thrown"
	end

	local status_extension = self.status_extension
	local velocity = status_extension.catapulted_velocity:unbox()
	local locomotion_extension = self.locomotion_extension

	locomotion_extension:set_maximum_upwards_velocity(velocity.z)
	locomotion_extension:set_forced_velocity(velocity)
	locomotion_extension:set_wanted_velocity(velocity)

	self._direction = direction
	local anim = DIRECTIONS[direction].start_animation
	local anim_1p = DIRECTIONS[direction].start_animation_1p

	CharacterStateHelper.play_animation_event(unit, anim)
	CharacterStateHelper.play_animation_event_first_person(self.first_person_extension, anim_1p or anim)

	local first_person_extension = self.first_person_extension

	first_person_extension:hide_weapons("catapulted")

	local include_local_player = false

	CharacterStateHelper.show_inventory_3p(unit, false, include_local_player, self.is_server, self.inventory_extension)

	local sound_event = params.sound_event

	if sound_event then
		first_person_extension:play_hud_sound_event(sound_event)
	end

	self.start_catapulted_height = position_lookup[unit].z
end

PlayerCharacterStateCatapulted.on_exit = function (self, unit, input, dt, context, t, next_state)
	self._direction = nil

	self.status_extension:set_catapulted(false)
	self.first_person_extension:unhide_weapons("catapulted")
	self.locomotion_extension:reset_maximum_upwards_velocity()

	if Managers.state.network:game() then
		local include_local_player = false

		CharacterStateHelper.show_inventory_3p(unit, true, include_local_player, self.is_server, self.inventory_extension)
		CharacterStateHelper.play_animation_event(unit, "airtime_end")
	end

	self.status_extension:set_falling_height(nil, self.start_catapulted_height)
end

PlayerCharacterStateCatapulted.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local unit = self.unit
	local world = self.world
	local input_extension = self.input_extension
	local status_extension = self.status_extension

	if position_lookup[unit].z < -240 then
		print("Player has fallen outside the world -- kill meeeee ", position_lookup[unit].z)

		if self.is_server then
			local health_system = Managers.state.entity:system("health_system")

			health_system:suicide(unit)
		else
			local go_id = self.unit_storage:go_id(unit)

			self.network_transmit:send_rpc_server("rpc_suicide", go_id)
		end
	end

	if CharacterStateHelper.is_ledge_hanging(world, unit, self.temp_params) then
		csm:change_state("ledge_hanging", self.temp_params)

		return
	end

	if CharacterStateHelper.is_dead(status_extension) then
		csm:change_state("dead")

		return
	end

	if CharacterStateHelper.is_pounced_down(status_extension) then
		csm:change_state("pounced_down")

		return
	end

	if CharacterStateHelper.is_in_vortex(status_extension) then
		csm:change_state("in_vortex")

		return
	end

	if CharacterStateHelper.is_block_broken(status_extension) then
		status_extension:set_block_broken(false)
	end

	if CharacterStateHelper.is_colliding_down(unit) and self.locomotion_extension:current_velocity().z < 0 then
		local anim = DIRECTIONS[self._direction].land_animation

		CharacterStateHelper.play_animation_event(unit, anim)

		if CharacterStateHelper.has_move_input(input_extension) then
			csm:change_state("walking")
		else
			csm:change_state("standing")
		end

		return
	end

	if CharacterStateHelper.is_colliding_down(unit) and self.locomotion_extension:is_on_ground() and self.locomotion_extension:current_velocity().z >= 0 then
		local anim = DIRECTIONS[self._direction].land_animation

		CharacterStateHelper.play_animation_event(unit, anim)

		if CharacterStateHelper.has_move_input(input_extension) then
			csm:change_state("walking")
		else
			csm:change_state("standing")
		end

		self.locomotion_extension:add_external_velocity(self.locomotion_extension:current_velocity() * 0.2)

		return
	end

	if CharacterStateHelper.is_colliding_sides(unit) then
		local anim = DIRECTIONS[self._direction].wall_collide_animation

		CharacterStateHelper.play_animation_event(unit, anim)
		csm:change_state("standing")

		return
	end

	local first_person_extension = self.first_person_extension

	CharacterStateHelper.look(input_extension, self.player.viewport_name, first_person_extension, status_extension, self.inventory_extension)
end

return
