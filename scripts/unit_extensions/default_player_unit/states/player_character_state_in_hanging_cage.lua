-- chunkname: @scripts/unit_extensions/default_player_unit/states/player_character_state_in_hanging_cage.lua

PlayerCharacterStateInHangingCage = class(PlayerCharacterStateInHangingCage, PlayerCharacterState)

PlayerCharacterStateInHangingCage.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "in_hanging_cage")
end

PlayerCharacterStateInHangingCage.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	CharacterStateHelper.stop_weapon_actions(self.inventory_extension, "in_hanging_cage")
	CharacterStateHelper.stop_career_abilities(self.career_extension, "in_hanging_cage")

	local cage_unit = params.cage_unit

	self.cage_unit = cage_unit

	LocomotionUtils.enable_linked_movement(self.world, unit, cage_unit, 0, Vector3.zero())

	local include_local_player = true

	CharacterStateHelper.show_inventory_3p(unit, false, include_local_player, self.is_server, self.inventory_extension)

	local animations = params.animations
	local idle_animation = animations.idle

	CharacterStateHelper.play_animation_event(unit, idle_animation)

	self.falling_animation = animations.falling
	self.landing_animation = animations.landing
	self.state = "hanging"
end

PlayerCharacterStateInHangingCage.on_exit = function (self, unit, input, dt, context, t, next_state)
	local status_extension = self.status_extension

	status_extension:set_in_hanging_cage(false)
end

PlayerCharacterStateInHangingCage.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local status_extension = self.status_extension
	local current_state = self.state
	local new_state = status_extension.in_hanging_cage_state
	local cage_unit = self.cage_unit
	local cage_rotation = Unit.local_rotation(cage_unit, 0)

	Unit.set_local_rotation(unit, 0, cage_rotation)

	if current_state ~= new_state then
		if new_state == "falling" then
			local falling_animation = self.falling_animation

			if falling_animation then
				CharacterStateHelper.play_animation_event(unit, falling_animation)
			end
		elseif new_state == "landed" then
			local landing_animation = self.landing_animation

			CharacterStateHelper.play_animation_event(unit, landing_animation)
			LocomotionUtils.disable_linked_movement(unit)

			local current_position = POSITION_LOOKUP[unit]
			local locomotion_extension = self.locomotion_extension

			locomotion_extension:teleport_to(current_position)
			locomotion_extension:enable_script_driven_movement()
			self.health_extension:knock_down(unit)
			csm:change_state("knocked_down", {
				already_in_ko_anim = true,
			})
		end

		self.state = new_state
	end
end
