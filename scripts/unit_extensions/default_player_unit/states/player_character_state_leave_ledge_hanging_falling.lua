PlayerCharacterStateLeaveLedgeHangingFalling = class(PlayerCharacterStateLeaveLedgeHangingFalling, PlayerCharacterState)
script_data.ledge_hanging_fall_and_die_turned_off = script_data.ledge_hanging_fall_and_die_turned_off or Development.parameter("ledge_hanging_fall_and_die_turned_off")

PlayerCharacterStateLeaveLedgeHangingFalling.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "leave_ledge_hanging_falling")

	local context = character_state_init_context
	self.is_server = Managers.player.is_server
end

PlayerCharacterStateLeaveLedgeHangingFalling.on_enter_animation = function (self)
	CharacterStateHelper.play_animation_event(self.unit, "jump_idle")
end

PlayerCharacterStateLeaveLedgeHangingFalling.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	local unit = self.unit
	local ledge_unit = params.ledge_unit
	self.ledge_unit = ledge_unit
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	self.finish_time = t + movement_settings_table.ledge_hanging.falling_kill_timer
	local node = Unit.node(ledge_unit, "g_gameplay_ledge_finger_box")
	local ledge_rotation = Unit.world_rotation(ledge_unit, node)
	local ledge_forward = Quaternion.forward(ledge_rotation)
	local position = Unit.local_position(unit, 0)
	position = position - ledge_forward * movement_settings_table.ledge_hanging.leaving_falling_forward_push_constant

	self.locomotion_extension:enable_script_driven_movement()
	self.locomotion_extension:teleport_to(position)
	self:on_enter_animation()
end

PlayerCharacterStateLeaveLedgeHangingFalling.on_exit = function (self, unit, input, dt, context, t, next_state)
	if next_state and next_state ~= "falling" and Managers.state.network:game() then
		CharacterStateHelper.play_animation_event(unit, "land_still")
		CharacterStateHelper.play_animation_event(unit, "to_onground")
	end
end

PlayerCharacterStateLeaveLedgeHangingFalling.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local unit = self.unit
	local input_extension = self.input_extension
	local status_extension = self.status_extension
	local locomotion_extension = self.locomotion_extension
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)

	if CharacterStateHelper.is_dead(status_extension) then
		csm:change_state("dead")

		return
	end

	if CharacterStateHelper.is_pounced_down(status_extension) then
		csm:change_state("pounced_down")

		return
	end

	local is_catapulted, direction = CharacterStateHelper.is_catapulted(status_extension)

	if is_catapulted then
		local params = {
			sound_event = "Play_hit_by_ratogre",
			direction = direction
		}

		csm:change_state("catapulted", params)

		return
	end

	if self.finish_time <= t then
		if script_data.ledge_hanging_fall_and_die_turned_off then
			csm:change_state("falling")
		else
			local go_id = self.unit_storage:go_id(unit)

			if self.is_server or LEVEL_EDITOR_TEST then
				local health_system = Managers.state.entity:system("health_system")

				health_system:suicide(unit)
				csm:change_state("dead")
			else
				self.network_transmit:send_rpc_server("rpc_suicide", go_id)
			end
		end

		return
	end

	if self.locomotion_extension:is_colliding_down() then
		csm:change_state("walking")

		return
	end

	self.locomotion_extension:set_forced_velocity(Vector3(0, 0, -3))
	self.locomotion_extension:set_disable_rotation_update()
	CharacterStateHelper.look(input_extension, self.player.viewport_name, self.first_person_extension, status_extension, self.inventory_extension)
end

return
