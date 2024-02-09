-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/enemy_character_state_tunneling.lua

EnemyCharacterStateTunneling = class(EnemyCharacterStateTunneling, EnemyCharacterState)

local entrance_data = {
	chimney = {
		"enter_teleporter_1m",
		false,
	},
	window = {
		"enter_teleporter_1m",
		true,
	},
	well = {
		"enter_teleporter_1m",
		false,
	},
	pipe = {
		"enter_teleporter_1m",
		true,
	},
	manhole = {
		"enter_teleporter_1m",
		false,
	},
}
local exit_data = {
	chimney = {
		"exit_teleporter_chimney",
		0,
		-0.5,
	},
	window = {
		"exit_teleporter_window",
		-0.5,
		-0.5,
	},
	well = {
		"exit_teleporter_well",
		0,
		-2.5,
	},
	pipe = {
		"exit_teleporter_pipe_run",
		0,
		-0.5,
	},
	manhole = {
		"exit_teleporter_manhole",
		0,
		-1.5,
	},
}

EnemyCharacterStateTunneling.init = function (self, character_state_init_context)
	EnemyCharacterStateTunneling.super.init(self, character_state_init_context, "tunneling")
end

EnemyCharacterStateTunneling.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	local input_extension = self._input_extension
	local first_person_extension = self._first_person_extension
	local status_extension = self._status_extension
	local inventory_extension = self._inventory_extension
	local health_extension = self._health_extension
	local locomotion_extension = self._locomotion_extension
	local interactor_extension = self._interactor_extension
	local game_mode = Managers.state.game_mode:game_mode()

	self.pactsworn_video_transition_view = game_mode.pactsworn_video_transition_view
	self.transition_manager = Managers.transition

	local enter_unit = interactor_extension:interactable_unit()
	local enter_crawl_space_extension = ScriptUnit.extension(enter_unit, "door_system")
	local exit_unit = enter_crawl_space_extension.partner_unit

	self.id = enter_crawl_space_extension.id

	assert(exit_unit, "Crawl Space is missing a partner unit. Either it has no partner, or the id is wrong.")

	local exit_crawl_space_extension = ScriptUnit.extension(exit_unit, "door_system")

	self.exit_unit = exit_unit
	self.enter_pos = enter_crawl_space_extension.enter_pos

	local enter_rot = enter_crawl_space_extension.enter_rot

	self.enter_rot = enter_rot

	local exit_rot = -Vector3Box.unbox(exit_crawl_space_extension.enter_rot)

	self.exit_rot = QuaternionBox(Quaternion.look(exit_rot))
	self.wanted_rot = self.enter_rot

	local entrance_type = enter_crawl_space_extension.entrance_type
	local exit_type = exit_crawl_space_extension.entrance_type

	self._player = Managers.player:owner(unit)
	self.exit_anim = exit_data[exit_type][1]
	self.forward_offset = exit_data[exit_type][2]
	self.height_offset = exit_data[exit_type][3]

	local fixed_start_position = entrance_data[entrance_type][2]
	local wanted_pos

	if fixed_start_position then
		wanted_pos = self.enter_pos:unbox()
	else
		local enter_unit_pos = Unit.local_position(enter_unit, 0)
		local enter_unit_center_pos = enter_unit_pos + Vector3.normalize(enter_rot:unbox()) * 0.5

		enter_unit_center_pos.z = self.enter_pos.z + (entrance_type == "manhole" and 1 or 0)

		local direction = POSITION_LOOKUP[unit] - enter_unit_center_pos

		direction.z = 0

		local distance_from_center = 1.5

		wanted_pos = enter_unit_center_pos + Vector3.normalize(direction) * distance_from_center
		self.wanted_rot = Vector3Box(-direction)
	end

	self.alignment_vector = Vector3Box(wanted_pos - POSITION_LOOKUP[unit])
	self.alignment_total_t = 0.25
	self.alignment_time_t = self.alignment_total_t

	locomotion_extension:enable_animation_driven_movement_with_rotation_no_mover()

	local entrance_anim = entrance_data[entrance_type][1]

	CharacterStateHelper.play_animation_event(unit, entrance_anim)
	CharacterStateHelper.change_camera_state(self._player, "follow_third_person_tunneling")

	local active = false
	local override
	local unarmed = false

	if status_extension:get_unarmed() then
		unarmed = true
	end

	first_person_extension:set_first_person_mode(active, override, unarmed)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, health_extension)
	status_extension:set_should_tunnel(false)
	self:set_breed_action("tunneling")

	self.state = "init"
end

EnemyCharacterStateTunneling.update = function (self, unit, input, dt, context, t)
	local blackboard = BLACKBOARDS[unit]
	local csm = self._csm
	local input_extension = self._input_extension
	local status_extension = self._status_extension
	local first_person_extension = self._first_person_extension
	local locomotion_extension = self._locomotion_extension
	local inventory_extension = self._inventory_extension

	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, status_extension, inventory_extension)

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		return
	end

	if self.alignment_time_t > 0 then
		local alignment_vector = Vector3Box.unbox(self.alignment_vector)
		local alignment = alignment_vector * dt / self.alignment_total_t
		local pos = POSITION_LOOKUP[unit]
		local mover = Unit.mover(unit)

		Mover.set_position(mover, pos + alignment)
		Unit.set_local_position(unit, 0, pos + alignment)

		self.alignment_time_t = self.alignment_time_t - dt
	end

	if self.state == "init" and blackboard.tunneling_begin then
		local fade_time = 0.5

		self.fade_t = t + fade_time

		local fade_speed = 5

		self.transition_manager:fade_in(fade_speed)

		self.state = "fade_in"
	end

	if self.state == "fade_in" and t > self.fade_t then
		local exit_rot = QuaternionBox.unbox(self.exit_rot)

		self._first_person_extension:force_look_rotation(exit_rot)

		local dir_vector = Quaternion.forward(exit_rot)

		self.wanted_rot = Vector3Box(dir_vector)

		local offset = dir_vector * self.forward_offset + Vector3.up() * self.height_offset
		local exit_pos = Unit.local_position(self.exit_unit, 0) + offset
		local mover = Unit.mover(unit)

		Mover.set_position(mover, exit_pos)
		Unit.set_local_position(unit, 0, exit_pos)
		status_extension:set_invisible(true, true, "tunneling")
		locomotion_extension:set_mover_filter_property("dark_pact_noclip", true)

		self.state = "transition_video"
		self.sub_state = "start_video"
	end

	if self.state == "transition_video" then
		if self.sub_state == "start_video" then
			local fade_speed = 5
			local index = self.id % 4 + 1

			self.transition_manager:fade_out(fade_speed)
			self.pactsworn_video_transition_view:play_video(index)
			self.pactsworn_video_transition_view:enable_video(true)

			self.sub_state = "playing_video"
			self.end_video_t = t + 3
		elseif self.sub_state == "playing_video" then
			if self.end_video_t - t < 0.25 then
				local fade_speed = 10

				self.transition_manager:fade_in(fade_speed)

				self.sub_state = "end_video"
			end
		elseif self.sub_state == "end_video" and t > self.end_video_t then
			local fade_time = 0.25

			self.fade_t = t + fade_time

			local fade_speed = 5

			self.transition_manager:fade_out(fade_speed)
			self.pactsworn_video_transition_view:enable_video(false)

			local camera_system = Managers.state.entity:system("camera_system")
			local exit_rotation = QuaternionBox.unbox(self.exit_rot)
			local dir_vector = Quaternion.forward(exit_rotation) + Quaternion.right(exit_rotation) + Vector3.up() * 0.5
			local exit_pos = Unit.local_position(self.exit_unit, 0)
			local new_cam_pos = exit_pos + dir_vector * 2

			camera_system:update_tunnel_camera_position(self._player, new_cam_pos)

			local move_anim = self.exit_anim

			CharacterStateHelper.play_animation_event(unit, move_anim)
			CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, status_extension, inventory_extension, nil, Vector3(-2, 0, 0))

			self.end_video_t = nil
			self.state = "fade_out"
		end
	end

	if self.state == "fade_out" and t > self.fade_t then
		status_extension:set_invisible(false, true, "tunneling")

		self.state = "end"
	end

	if self.state == "end" and blackboard.tunneling_finished then
		locomotion_extension:set_mover_filter_property("dark_pact_noclip", false)
		first_person_extension:force_look_rotation(QuaternionBox.unbox(self.exit_rot), 0.1)
		self:start_camera_transition()
		self:to_movement_state()
	end

	local wanted_rot = self.wanted_rot:unbox()

	Unit.set_local_rotation(unit, 0, Quaternion.look(wanted_rot))
end

EnemyCharacterStateTunneling.on_exit = function (self, unit, input, dt, context, t, next_state)
	local blackboard = BLACKBOARDS[unit]

	if blackboard then
		blackboard.tunneling_begin = nil
		blackboard.tunneling_finished = nil
	end

	local status_extension = self._status_extension

	if status_extension:get_unarmed() then
		CharacterStateHelper.play_animation_event(unit, "to_unarmed")
	end

	self:grant_control_to_player()
	self:set_breed_action("n/a")

	local hit_reaction_extension = ScriptUnit.extension(unit, "hit_reaction_system")

	hit_reaction_extension.force_ragdoll_on_death = nil
end

EnemyCharacterStateTunneling.grant_control_to_player = function (self)
	local locomotion_extension = self._locomotion_extension
	local wanted_pose = Unit.animation_wanted_root_pose(self._unit)

	locomotion_extension:teleport_to(Matrix4x4.translation(wanted_pose))
	locomotion_extension:set_wanted_velocity(Vector3.zero())
	locomotion_extension:enable_script_driven_movement()
	locomotion_extension:set_animation_translation_scale(Vector3(1, 1, 1))
	locomotion_extension:force_on_ground(true)
end

EnemyCharacterStateTunneling.start_camera_transition = function (self)
	local first_person_extension = self._first_person_extension

	CharacterStateHelper.change_camera_state(self._player, "follow")
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "idle")
	first_person_extension:toggle_visibility(0.4)
end
