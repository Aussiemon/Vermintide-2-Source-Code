PlayerCharacterStateGrabbedByChaosSpawn = class(PlayerCharacterStateGrabbedByChaosSpawn, PlayerCharacterState)
local position_lookup = POSITION_LOOKUP
local anim_event = CharacterStateHelper.play_animation_event

PlayerCharacterStateGrabbedByChaosSpawn.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "grabbed_by_chaos_spawn")
end

PlayerCharacterStateGrabbedByChaosSpawn.on_enter = function (self, unit, input, dt, context, t, previous_state)
	local inventory_extension = self.inventory_extension
	local career_extension = self.career_extension

	CharacterStateHelper.stop_weapon_actions(inventory_extension, "grabbed")
	CharacterStateHelper.stop_career_abilities(career_extension, "grabbed")
	inventory_extension:check_and_drop_pickups("grabbed_by_chaos_spawn")

	local first_person_extension = self.first_person_extension

	first_person_extension:set_first_person_mode(false)

	local status_extension = self.status_extension
	local chaos_spawn_unit = status_extension.grabbed_by_chaos_spawn_unit
	self.chaos_spawn_unit = chaos_spawn_unit
	local breed = Unit.get_data(chaos_spawn_unit, "breed")
	self.breed = breed
	self.is_bot = self.player and self.player.bot_player

	CharacterStateHelper.change_camera_state(self.player, "chaos_spawn_grabbed")
	self.inventory_extension:show_third_person_inventory(false)

	self.camera_state = "third_person"
	local locomotion_extension = self.locomotion_extension

	locomotion_extension:enable_script_driven_no_mover_movement()
	locomotion_extension:enable_rotation_towards_velocity(false)

	local grabbed_by_chaos_spawn_status, status_count = CharacterStateHelper.grabbed_by_chaos_spawn_status(status_extension)
	local states = PlayerCharacterStateGrabbedByChaosSpawn.states

	if states[grabbed_by_chaos_spawn_status].enter then
		states[grabbed_by_chaos_spawn_status].enter(self, unit, t)
	end

	self.grabbed_by_chaos_spawn_status = grabbed_by_chaos_spawn_status
	self.status_count = status_count

	LocomotionUtils.enable_linked_movement(self.world, unit, self.chaos_spawn_unit, 0, Vector3.zero())

	local include_local_player = self.camera_state ~= "first_person" or false

	CharacterStateHelper.show_inventory_3p(unit, false, include_local_player, self.is_server, self.inventory_extension)

	self.grabbed_screen_space_particle_1 = self.first_person_extension:create_screen_particles("fx/screenspace_chaos_spawn_tentacles_02")

	if not self.is_bot then
		Wwise.set_state("spawn_catch_player", "true")
	end
end

PlayerCharacterStateGrabbedByChaosSpawn.on_exit = function (self, unit, input, dt, context, t, next_state)
	local status_extension = self.status_extension
	local chaos_spawn_alive = ALIVE[self.chaos_spawn_unit]
	local pos = nil

	if chaos_spawn_alive and status_extension:is_catapulted() then
		local node1 = Unit.node(unit, "j_leftfoot")
		local node2 = Unit.node(unit, "j_rightfoot")
		local pos1 = Unit.world_position(unit, node1)
		local pos2 = Unit.world_position(unit, node2)
		pos = (pos1 + pos2) / 2
	else
		pos = Unit.world_position(unit, Unit.node(unit, "root_point"))
	end

	LocomotionUtils.disable_linked_movement(unit)

	local locomotion_extension = self.locomotion_extension
	local current_rotation = locomotion_extension:current_rotation()

	locomotion_extension:teleport_to(pos, current_rotation)

	if self.is_server and chaos_spawn_alive then
		StatusUtils.set_grabbed_by_chaos_spawn_network(unit, false, self.chaos_spawn_unit)
	else
		status_extension:set_grabbed_by_chaos_spawn(false)
	end

	local camera_state = self.camera_state
	local include_local_player = camera_state ~= "first_person" or false

	CharacterStateHelper.show_inventory_3p(unit, true, include_local_player, self.is_server, self.inventory_extension)
	CharacterStateHelper.change_camera_state(self.player, "follow")
	self.first_person_extension:toggle_visibility(CameraTransitionSettings.perspective_transition_time)

	local player = self.player
	local camera_system = Managers.state.entity:system("camera_system")

	camera_system:set_follow_unit(player)

	self.camera_state = nil
	self.grabbed_by_chaos_spawn_status = nil
	self.status_count = nil
	local inventory_extension = self.inventory_extension

	if inventory_extension and inventory_extension:get_wielded_slot_name() == "slot_career_skill_weapon" then
		inventory_extension:wield_previous_weapon()
	else
		inventory_extension:rewield_wielded_slot()
	end

	locomotion_extension:reset_maximum_upwards_velocity()
	locomotion_extension:enable_script_driven_movement()
	locomotion_extension:enable_rotation_towards_velocity(true)

	if not self.is_bot then
		Wwise.set_state("spawn_catch_player", "false")
	end
end

PlayerCharacterStateGrabbedByChaosSpawn.states = {
	grabbed = {
		enter = function (parent, unit, t)
			anim_event(unit, "attack_grab_player")
		end,
		run = function (parent, unit, t, dt)
			return
		end,
		leave = function (parent, unit)
			return
		end
	},
	beating_with = {
		enter = function (parent, unit, t)
			anim_event(unit, "attack_grabbed_smash")
		end,
		run = function (parent, unit, t, dt)
			return
		end,
		leave = function (parent, unit)
			return
		end
	},
	thrown_away = {
		enter = function (parent, unit, t)
			anim_event(unit, "attack_grabbed_throw")
		end,
		run = function (parent, unit, t, dt)
			return
		end,
		leave = function (parent, unit)
			return
		end
	},
	chewed_on = {
		enter = function (parent, unit, t)
			anim_event(unit, "attack_grabbed_eat_start")

			parent.roar_screen_space_particle_timer = t + 1.1
		end,
		run = function (parent, unit, t, dt)
			if not parent.roar_screen_space_particle_1 and parent.roar_screen_space_particle_timer < t then
				parent.roar_screen_space_particle_1 = parent.first_person_extension:create_screen_particles("fx/screenspace_chaos_spawn_tentacles_01")
			end
		end,
		leave = function (parent, unit)
			if parent.roar_screen_space_particle_1 then
				parent.first_person_extension:stop_spawning_screen_particles(parent.roar_screen_space_particle_1)

				parent.roar_screen_space_particle_1 = nil
			end
		end
	},
	idle = {
		enter = function (parent, unit, t)
			anim_event(unit, "idle_grabbed")
		end,
		run = function (parent, unit, t, dt)
			return
		end,
		leave = function (parent, unit)
			return
		end
	}
}

PlayerCharacterStateGrabbedByChaosSpawn.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local input_extension = self.input_extension
	local status_extension = self.status_extension
	local chaos_spawn_unit = self.chaos_spawn_unit
	local is_catapulted, direction = CharacterStateHelper.is_catapulted(status_extension)

	if is_catapulted then
		local params = {
			sound_event = "Play_enemy_sorcerer_vortex_throw_player",
			direction = direction
		}

		csm:change_state("catapulted", params)

		return
	end

	if not status_extension.grabbed_by_chaos_spawn or not AiUtils.unit_alive(chaos_spawn_unit) then
		if CharacterStateHelper.is_waiting_for_assisted_respawn(status_extension) then
			csm:change_state("waiting_for_assisted_respawn")
		else
			csm:change_state("standing")
		end

		return
	end

	local grabbed_by_chaos_spawn_status, status_count = CharacterStateHelper.grabbed_by_chaos_spawn_status(status_extension)
	local states = PlayerCharacterStateGrabbedByChaosSpawn.states

	if status_count ~= self.status_count then
		local last_state = self.grabbed_by_chaos_spawn_status

		if states[last_state].leave then
			states[last_state].leave(self, unit)
		end

		if states[grabbed_by_chaos_spawn_status].enter then
			states[grabbed_by_chaos_spawn_status].enter(self, unit, t)
		end

		self.grabbed_by_chaos_spawn_status = grabbed_by_chaos_spawn_status
		self.status_count = status_count
	end

	if CharacterStateHelper.is_knocked_down(status_extension) then
		csm:change_state("knocked_down")

		return
	elseif CharacterStateHelper.is_dead(status_extension) then
		csm:change_state("dead")

		return
	end

	states[grabbed_by_chaos_spawn_status].run(self, unit, t, dt)

	local rot = Unit.local_rotation(chaos_spawn_unit, 0)

	Unit.set_local_rotation(unit, 0, rot)

	local player = self.player

	CharacterStateHelper.look(input_extension, player.viewport_name, self.first_person_extension, status_extension, self.inventory_extension)
end
