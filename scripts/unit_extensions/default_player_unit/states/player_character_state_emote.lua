PlayerCharacterStateEmote = class(PlayerCharacterStateEmote, PlayerCharacterState)
local zoom_sensitivity = 0.05
local zoom_sensitivity_gamepad = 0.03
local zoom_lerp_speed = 5

PlayerCharacterStateEmote.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "emote")

	local context = character_state_init_context
end

PlayerCharacterStateEmote.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	self.locomotion_extension:set_wanted_velocity(Vector3.zero())

	local camera_settings = {
		override_node_name = "camera_attach",
		camera_node = "emotes",
		force_state_change = true,
		allow_camera_movement = true,
		override_follow_unit = unit
	}

	CharacterStateHelper.change_camera_state(self.player, "follow_third_person", camera_settings)
	self.first_person_extension:set_first_person_mode(false)
	CharacterStateHelper.stop_weapon_actions(self.inventory_extension, "emote")
	CharacterStateHelper.stop_career_abilities(self.career_extension, "emote")
	CharacterStateHelper.play_animation_event(unit, "idle")
	CharacterStateHelper.play_animation_event_first_person(self.first_person_extension, "idle")
	self.status_extension:set_inspecting(true)
	self:_update_emote()

	self._current_zoom = 0
	self._current_zoom_target = 0.7

	Managers.state.camera:set_variable(self.player.viewport_name, "emote_zoom", 1)

	local emote_ui = Managers.ui:get_hud_component("EmotePhotomodeUI")

	emote_ui:set_enabled(true)

	self._emote_ui = emote_ui
end

PlayerCharacterStateEmote.on_exit = function (self, unit, input, dt, context, t, next_state)
	CharacterStateHelper.change_camera_state(self.player, "follow")
	self.first_person_extension:toggle_visibility(CameraTransitionSettings.perspective_transition_time)
	self.status_extension:set_inspecting(false)

	local game = Managers.state.network:game()

	if game then
		local unit_id = self.unit_storage:go_id(self.unit)

		self.network_transmit:send_rpc_server("rpc_server_cancel_emote", unit_id)
	end

	local game_mode = Managers.state.game_mode:game_mode()

	game_mode:set_photomode_enabled(false)
	self._emote_ui:set_enabled(false)

	self._emote_ui = nil
end

PlayerCharacterStateEmote.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local input_extension = self.input_extension
	local camera_manager = Managers.state.camera
	local status_extension = self.status_extension
	local first_person_extension = self.first_person_extension
	local locomotion_extension = self.locomotion_extension

	input_extension:get("action_career", true)

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		return
	end

	local world = self.world

	if CharacterStateHelper.is_ledge_hanging(world, unit, self.temp_params) then
		csm:change_state("ledge_hanging", self.temp_params)

		return
	end

	if CharacterStateHelper.is_overcharge_exploding(status_extension) then
		csm:change_state("overcharge_exploding")

		return
	end

	local input_service = Managers.input:get_service("Player")
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if gamepad_active then
		if input_service:get("crouch", true) then
			csm:change_state("standing", self.temp_params)

			return
		end
	else
		local is_crouching = status_extension:is_crouching()

		if (input_extension:get("jump") or input_extension:get("jump_only")) and not status_extension:is_crouching() and (not is_crouching or CharacterStateHelper.can_uncrouch(unit)) and locomotion_extension:jump_allowed() then
			if is_crouching then
				CharacterStateHelper.uncrouch(unit, t, first_person_extension, status_extension)
			end

			csm:change_state("jumping")
			first_person_extension:change_state("jumping")

			return
		end

		local is_moving = CharacterStateHelper.has_move_input(input_extension)

		if is_moving then
			local params = self.temp_params

			csm:change_state("walking", params)
			first_person_extension:change_state("walking")

			return
		end
	end

	local zoom_input = 0

	if gamepad_active then
		zoom_input = input_service:get("emote_camera_zoom_in") - input_service:get("emote_camera_zoom_out")
		zoom_input = zoom_input * zoom_sensitivity_gamepad
	else
		zoom_input = input_service:get("emote_camera_zoom").y * zoom_sensitivity
	end

	local social_wheel = Managers.ui:get_hud_component("SocialWheelUI")
	local is_social_wheel_active = social_wheel and social_wheel:is_active()

	if not is_social_wheel_active and input_service:get("emote_toggle_hud_visibility") then
		local game_mode = Managers.state.game_mode:game_mode()

		game_mode:set_photomode_enabled(not game_mode:photomode_enabled())
	end

	self._current_zoom_target = math.clamp(self._current_zoom_target + zoom_input, 0, 1)

	if self._current_zoom ~= self._current_zoom_target then
		local current_zoom = self._current_zoom
		local lerp_t = math.min(dt * zoom_lerp_speed, 1)
		current_zoom = math.lerp(current_zoom, self._current_zoom_target, lerp_t)
		self._current_zoom = current_zoom

		camera_manager:set_variable(self.player.viewport_name, "emote_zoom", 1 - current_zoom)
	end

	self:_update_emote()
	self.locomotion_extension:set_disable_rotation_update()
	CharacterStateHelper.look(input_extension, self.player.viewport_name, first_person_extension, status_extension, self.inventory_extension)
end

PlayerCharacterStateEmote._update_emote = function (self)
	local emote_anim_event, hide_weapons = self.cosmetic_extension:get_queued_3p_emote()

	if emote_anim_event then
		local unit_id = self.unit_storage:go_id(self.unit)
		local anim_event_id = NetworkLookup.anims[emote_anim_event]

		self.network_transmit:send_rpc_server("rpc_server_request_emote", unit_id, anim_event_id, hide_weapons)
		self.cosmetic_extension:consume_queued_3p_emote()
	end
end
