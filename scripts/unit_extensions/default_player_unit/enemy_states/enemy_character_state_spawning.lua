-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/enemy_character_state_spawning.lua

EnemyCharacterStateSpawning = class(EnemyCharacterStateSpawning, EnemyCharacterState)

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

EnemyCharacterStateSpawning.init = function (self, character_state_init_context)
	EnemyCharacterStateSpawning.super.init(self, character_state_init_context, "spawning")
end

EnemyCharacterStateSpawning.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	local input_extension = self._input_extension
	local first_person_extension = self._first_person_extension
	local status_extension = self._status_extension
	local inventory_extension = self._inventory_extension
	local health_extension = self._health_extension
	local locomotion_extension = self._locomotion_extension
	local interactor_extension = self._interactor_extension
	local enter_unit = interactor_extension:interactable_unit()
	local enter_crawl_space_extension = ScriptUnit.extension(enter_unit, "door_system")

	self.enter_unit = enter_unit
	self.transition_manager = Managers.transition

	local enter_pos = enter_crawl_space_extension.enter_pos

	self.enter_pos = enter_pos
	self.enter_rot = enter_crawl_space_extension.enter_rot

	local exit_crawl_space_enter_rot = Vector3Box.unbox(self.enter_rot)

	self.exit_rot = QuaternionBox(Quaternion.look(-exit_crawl_space_enter_rot))
	self.wanted_rot = self.enter_rot

	local entrance_type = enter_crawl_space_extension.entrance_type

	self._player = Managers.player:owner(unit)
	self.exit_anim = exit_data[entrance_type][1]
	self.forward_offset = exit_data[entrance_type][2]
	self.height_offset = exit_data[entrance_type][3]

	local fade_time = 0.5

	self.fade_t = t + fade_time

	local fade_speed = 5

	self.transition_manager:fade_in(fade_speed)
	locomotion_extension:enable_animation_driven_movement_with_rotation_no_mover()

	local active = false
	local override
	local unarmed = false

	if status_extension:get_unarmed() then
		unarmed = true
	end

	first_person_extension:set_first_person_mode(active, override, unarmed)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, health_extension)
	status_extension:set_should_spawn(false)
	self:set_breed_action("spawning")
end

EnemyCharacterStateSpawning.update = function (self, unit, input, dt, context, t)
	local blackboard = BLACKBOARDS[unit]
	local input_extension = self._input_extension
	local status_extension = self._status_extension
	local first_person_extension = self._first_person_extension
	local inventory_extension = self._inventory_extension

	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, status_extension, inventory_extension)

	if self.fade_t and t > self.fade_t then
		local exit_rot = QuaternionBox.unbox(self.exit_rot)

		self._first_person_extension:force_look_rotation(exit_rot)

		local dir_vector = Quaternion.forward(exit_rot)

		self.wanted_rot = Vector3Box(dir_vector)

		local offset = dir_vector * self.forward_offset + Vector3.up() * self.height_offset
		local exit_pos = Unit.local_position(self.enter_unit, 0) + offset
		local mover = Unit.mover(unit)

		Mover.set_position(mover, exit_pos)
		Unit.set_local_position(unit, 0, exit_pos)
		CharacterStateHelper.change_camera_state(self._player, "follow_third_person_tunneling")

		local move_anim = self.exit_anim

		CharacterStateHelper.play_animation_event(unit, move_anim)
		CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, status_extension, inventory_extension, nil, Vector3(-2, 0, 0))

		local camera_system = Managers.state.entity:system("camera_system")

		dir_vector = -dir_vector + Vector3.up()

		local enter_pos = Vector3Box.unbox(self.enter_pos)
		local new_cam_pos = enter_pos + dir_vector * 2

		camera_system:update_tunnel_camera_position(self._player, new_cam_pos)

		local ghost_mode_extension = ScriptUnit.extension(unit, "ghost_mode_system")
		local force_leave = true

		ghost_mode_extension:request_leave_ghost_mode(force_leave)

		local fade_speed = 5

		self.transition_manager:fade_out(fade_speed)

		self.fade_t = nil
	end

	if blackboard.tunneling_finished then
		first_person_extension:force_look_rotation(QuaternionBox.unbox(self.exit_rot), 0.1)
		self:start_camera_transition()
		self:to_movement_state()

		blackboard.tunneling_finished = nil
	end

	Unit.set_local_rotation(unit, 0, Quaternion.look(Vector3Box.unbox(self.wanted_rot)))
end

EnemyCharacterStateSpawning.on_exit = function (self, unit, input, dt, context, t, next_state)
	local status_extension = self._status_extension

	if status_extension:get_unarmed() then
		CharacterStateHelper.play_animation_event(unit, "to_unarmed")
	end

	self:grant_control_to_player()
	self:set_breed_action("n/a")

	local hit_reaction_extension = ScriptUnit.extension(unit, "hit_reaction_system")

	hit_reaction_extension.force_ragdoll_on_death = nil
end

EnemyCharacterStateSpawning.grant_control_to_player = function (self)
	local locomotion_extension = self._locomotion_extension
	local wanted_pose = Unit.animation_wanted_root_pose(self._unit)

	locomotion_extension:teleport_to(Matrix4x4.translation(wanted_pose))
	locomotion_extension:set_wanted_velocity(Vector3.zero())
	locomotion_extension:enable_script_driven_movement()
	locomotion_extension:set_animation_translation_scale(Vector3(1, 1, 1))
	locomotion_extension:force_on_ground(true)
end

EnemyCharacterStateSpawning.start_camera_transition = function (self)
	local first_person_extension = self._first_person_extension

	CharacterStateHelper.change_camera_state(self._player, "follow")
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "idle")
	first_person_extension:toggle_visibility(0.4)
end
