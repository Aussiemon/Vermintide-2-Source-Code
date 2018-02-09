PlayerCharacterStateStanding = class(PlayerCharacterStateStanding, PlayerCharacterState)
PlayerCharacterStateStanding.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "standing")

	local context = character_state_init_context

	return 
end
PlayerCharacterStateStanding.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	local unit = self.unit
	local input_extension = self.input_extension

	self.locomotion_extension:set_wanted_velocity(Vector3.zero())

	self.wherabouts_extension = ScriptUnit.extension(unit, "whereabouts_system")
	local inventory_extension = self.inventory_extension
	local first_person_extension = self.first_person_extension
	local status_extension = self.status_extension
	local toggle_crouch = input_extension.toggle_crouch

	CharacterStateHelper.check_crouch(unit, input_extension, status_extension, toggle_crouch, first_person_extension, t)
	CharacterStateHelper.look(input_extension, self.player.viewport_name, first_person_extension, status_extension, self.inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, self.health_extension)

	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	self.time_when_can_be_pushed = t + movement_settings_table.soft_collision.grace_time_pushed_entering_standing

	if CharacterStateHelper.is_interacting(self.interactor_extension) or CharacterStateHelper.is_starting_interaction(self.input_extension, self.interactor_extension) then
		return 
	end

	self.current_animation = "idle"

	CharacterStateHelper.play_animation_event(unit, "idle")
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "idle")

	return 
end
PlayerCharacterStateStanding.on_exit = function (self, unit, input, dt, context, t, next_state)
	return 
end
PlayerCharacterStateStanding.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local world = self.world
	local unit = self.unit
	local input_extension = self.input_extension
	local locomotion_extension = self.locomotion_extension
	local status_extension = self.status_extension
	local first_person_extension = self.first_person_extension
	local CharacterStateHelper = CharacterStateHelper

	if locomotion_extension.is_on_ground(locomotion_extension) then
		self.wherabouts_extension:set_is_onground()
	end

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		return 
	end

	if CharacterStateHelper.is_waiting_for_assisted_respawn(status_extension) then
		csm.change_state(csm, "waiting_for_assisted_respawn")

		return 
	end

	if CharacterStateHelper.is_using_transport(status_extension) then
		csm.change_state(csm, "using_transport")

		return 
	end

	if CharacterStateHelper.is_ledge_hanging(world, unit, self.temp_params) then
		csm.change_state(csm, "ledge_hanging", self.temp_params)

		return 
	end

	if CharacterStateHelper.is_overcharge_exploding(status_extension) then
		csm.change_state(csm, "overcharge_exploding")

		return 
	end

	CharacterStateHelper.update_dodge_lock(unit, input_extension, status_extension)

	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)

	if CharacterStateHelper.is_pushed(status_extension) then
		status_extension.set_pushed(status_extension, false)

		local params = movement_settings_table.stun_settings.pushed
		local hit_react_type = status_extension.hit_react_type(status_extension)
		params.hit_react_type = hit_react_type .. "_push"

		csm.change_state(csm, "stunned", params)

		return 
	end

	if CharacterStateHelper.is_block_broken(status_extension) then
		status_extension.set_block_broken(status_extension, false)

		local params = movement_settings_table.stun_settings.parry_broken
		params.hit_react_type = "medium_push"

		csm.change_state(csm, "stunned", params)

		return 
	end

	local start_dodge, dodge_direction = CharacterStateHelper.check_to_start_dodge(unit, input_extension, status_extension, t)

	if start_dodge then
		local params = self.temp_params
		params.dodge_direction = dodge_direction

		csm.change_state(csm, "dodging", params)

		return 
	end

	if locomotion_extension.is_animation_driven(locomotion_extension) then
		csm.change_state(csm, "walking")

		return 
	end

	local interactor_extension = self.interactor_extension

	if CharacterStateHelper.is_starting_interaction(input_extension, interactor_extension) then
		local config = interactor_extension.interaction_config(interactor_extension)

		interactor_extension.start_interaction(interactor_extension, "interacting")

		if not config.allow_movement then
			local params = self.temp_params
			params.swap_to_3p = config.swap_to_3p
			params.show_weapons = config.show_weapons

			csm.change_state(csm, "interacting", params)
		end

		return 
	end

	if CharacterStateHelper.is_interacting(interactor_extension) then
		local config = interactor_extension.interaction_config(interactor_extension)

		if not config.allow_movement then
			local params = self.temp_params
			params.swap_to_3p = config.swap_to_3p
			params.show_weapons = config.show_weapons

			csm.change_state(csm, "interacting", params)
		end

		return 
	end

	local is_crouching = status_extension.is_crouching(status_extension)

	if (input_extension.get(input_extension, "jump") or input_extension.get(input_extension, "jump_only")) and not status_extension.is_crouching(status_extension) and (not is_crouching or CharacterStateHelper.can_uncrouch(unit)) and locomotion_extension.jump_allowed(locomotion_extension) then
		if is_crouching then
			CharacterStateHelper.uncrouch(unit, t, first_person_extension, status_extension)
		end

		csm.change_state(csm, "jumping")
		first_person_extension.change_state(first_person_extension, "jumping")

		return 
	end

	local is_moving = CharacterStateHelper.has_move_input(input_extension)

	if is_moving then
		local params = self.temp_params

		csm.change_state(csm, "walking", params)
		first_person_extension.change_state(first_person_extension, "walking")

		return 
	end

	if not locomotion_extension.is_on_ground(locomotion_extension) then
		csm.change_state(csm, "falling")
		first_person_extension.change_state(first_person_extension, "falling")

		return 
	end

	if input_extension.get(input_extension, "character_inspecting") then
		local _, right_hand_weapon_extension, left_hand_weapon_extension = CharacterStateHelper._get_item_data_and_weapon_extensions(self.inventory_extension)
		local current_action_settings = CharacterStateHelper._get_current_action_data(left_hand_weapon_extension, right_hand_weapon_extension)

		if not current_action_settings then
			if Managers.input:is_device_active("gamepad") then
				if Managers.state.game_mode:level_key() == "inn_level" then
					csm.change_state(csm, "inspecting")

					return 
				end
			else
				csm.change_state(csm, "inspecting")

				return 
			end
		end
	end

	local inventory_extension = self.inventory_extension
	local first_person_extension = self.first_person_extension
	local toggle_crouch = input_extension.toggle_crouch

	if self.time_when_can_be_pushed < t and self.player:is_player_controlled() then
		self.current_animation = CharacterStateHelper.update_soft_collision_movement(first_person_extension, status_extension, locomotion_extension, unit, self.world, self.current_animation)
	end

	CharacterStateHelper.check_crouch(unit, input_extension, status_extension, toggle_crouch, first_person_extension, t)
	CharacterStateHelper.look(input_extension, self.player.viewport_name, self.first_person_extension, status_extension, self.inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, self.health_extension)
	CharacterStateHelper.reload(input_extension, inventory_extension, status_extension)

	return 
end

return 
