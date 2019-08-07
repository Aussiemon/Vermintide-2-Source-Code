PlayerCharacterStateGrabbedByPackMaster = class(PlayerCharacterStateGrabbedByPackMaster, PlayerCharacterState)
local position_lookup = POSITION_LOOKUP

PlayerCharacterStateGrabbedByPackMaster.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "grabbed_by_pack_master")

	self.bread_crumb_trail = {}
	self.bread_crumb_trail_n = 10
	self.move_target_index = 0
	self.store_index = 0
	self.desired_distance = 2
	self.last_valid_position = Vector3Box()
	self.next_hanging_damage_time = 0

	for i = 1, self.bread_crumb_trail_n, 1 do
		self.bread_crumb_trail[i] = Vector3Box()
	end
end

PlayerCharacterStateGrabbedByPackMaster.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	local inventory_extension = self.inventory_extension
	local career_extension = self.career_extension

	CharacterStateHelper.stop_weapon_actions(inventory_extension, "grabbed")
	CharacterStateHelper.stop_career_abilities(career_extension, "grabbed")
	inventory_extension:check_and_drop_pickups("grabbed_by_pack_master")
	CharacterStateHelper.change_camera_state(self.player, "follow_third_person")

	local first_person_extension = self.first_person_extension

	first_person_extension:set_first_person_mode(false)
	self.locomotion_extension:enable_rotation_towards_velocity(false)

	local status_extension = self.status_extension
	local packmaster_unit = status_extension:get_pack_master_grabber()
	local packmaster_unit_position = position_lookup[packmaster_unit]
	local position = position_lookup[unit]
	local num_initial_crumbs = self.bread_crumb_trail_n / 2

	for i = 1, num_initial_crumbs, 1 do
		self.bread_crumb_trail[i]:store(Vector3.lerp(position, packmaster_unit_position, i / num_initial_crumbs))
	end

	self.move_target_index = 1
	self.store_index = num_initial_crumbs + 1
	self.bread_crumb_trail_timer = t + 0.25

	if self.ai_extension == nil then
		local wwise_world = Managers.world:wwise_world(self.world)
		slot17, slot18 = WwiseWorld.trigger_event(wwise_world, "start_strangled_state", first_person_extension:get_first_person_unit())
	end

	self.last_valid_position:store(position)

	self.pack_master_status = CharacterStateHelper.pack_master_status(status_extension)
	local states = PlayerCharacterStateGrabbedByPackMaster.states

	if states[self.pack_master_status].enter then
		states[self.pack_master_status].enter(self, unit)
	end
end

PlayerCharacterStateGrabbedByPackMaster.on_exit = function (self, unit, input, dt, context, t, next_state)
	local first_person_extension = self.first_person_extension
	local status_extension = self.status_extension

	if not status_extension:is_knocked_down() and not status_extension:is_dead() then
		CharacterStateHelper.change_camera_state(self.player, "follow")
		first_person_extension:toggle_visibility(CameraTransitionSettings.perspective_transition_time)

		local locomotion_extension = self.locomotion_extension

		locomotion_extension:enable_script_driven_movement()
		locomotion_extension:enable_rotation_towards_velocity(true)
	end

	local inventory_extension = self.inventory_extension

	if inventory_extension:get_wielded_slot_name() == "slot_packmaster_claw" and Managers.state.network:game() then
		inventory_extension:wield_previous_weapon()
	end

	if self.ai_extension == nil then
		local wwise_world = Managers.world:wwise_world(self.world)
		slot11, slot12 = WwiseWorld.trigger_event(wwise_world, "stop_strangled_state", first_person_extension:get_first_person_unit())
	end

	if status_extension:is_blocking() then
		if not LEVEL_EDITOR_TEST and Managers.state.network:game() then
			local game_object_id = Managers.state.unit_storage:go_id(unit)

			if self.is_server then
				Managers.state.network.network_transmit:send_rpc_clients("rpc_set_blocking", game_object_id, false)
			else
				Managers.state.network.network_transmit:send_rpc_server("rpc_set_blocking", game_object_id, false)
			end
		end

		status_extension:set_blocking(false)
	end
end

function fix_mover(parent, unit)
	local mover = Unit.mover(unit)
	local pos = POSITION_LOOKUP[unit]

	Mover.set_position(mover, pos + Vector3(0, 0, 1.5))
	Mover.move(mover, Vector3(0, 0, -1.5), 0.03333333333333333)

	if script_data.debug_ai_movement then
		local new_pos = Mover.position(mover)

		QuickDrawerStay:sphere(pos, 0.3, Color(245, 0, 0))
		QuickDrawerStay:line(pos, new_pos, Color(245, 0, 0))
		QuickDrawerStay:sphere(new_pos, 0.3, Color(245, 245, 0))
	end
end

function update_mover(parent, unit)
	local mover = Unit.mover(unit)

	Mover.move(mover, Vector3(0, 0, -1.5), 0.03333333333333333)
end

PlayerCharacterStateGrabbedByPackMaster.states = {
	pack_master_pulling = {
		enter = function (parent, unit)
			parent.locomotion_extension:enable_animation_driven_movement()

			local inventory_extension = parent.inventory_extension

			if inventory_extension:get_wielded_slot_name() ~= "slot_packmaster_claw" then
				inventory_extension:wield("slot_packmaster_claw", true)
			else
				CharacterStateHelper.show_inventory_3p(unit, true, true, Managers.player.is_server, parent.inventory_extension)
			end

			Managers.state.network:anim_event(unit, "packmaster_hooked")
		end,
		run = function (parent, unit)
			parent.last_valid_position:store(position_lookup[unit])
		end
	},
	pack_master_dragging = {
		enter = function (parent, unit)
			parent.locomotion_extension:enable_script_driven_no_mover_movement()

			local inventory_extension = parent.inventory_extension

			if inventory_extension:get_wielded_slot_name() ~= "slot_packmaster_claw" then
				inventory_extension:wield("slot_packmaster_claw", true)
			else
				CharacterStateHelper.show_inventory_3p(unit, true, true, Managers.player.is_server, parent.inventory_extension)
			end

			CharacterStateHelper.play_animation_event_first_person(parent.first_person_extension, "move_bwd")
		end,
		run = function (parent, unit)
			return true
		end
	},
	pack_master_unhooked = {
		run = function (parent, unit)
			parent.last_valid_position:store(position_lookup[unit])
		end,
		enter = function (parent, unit)
			CharacterStateHelper.show_inventory_3p(unit, false, true, Managers.player.is_server, parent.inventory_extension)

			local status_extension = parent.status_extension

			if CharacterStateHelper.is_dead(status_extension) then
				CharacterStateHelper.play_animation_event(unit, "packmaster_release_death")
			elseif CharacterStateHelper.is_knocked_down(status_extension) then
				local params = parent.temp_params
				params.already_in_ko_anim = true

				CharacterStateHelper.play_animation_event(unit, "packmaster_release_ko")
			else
				if not LEVEL_EDITOR_TEST and Managers.state.network:game() then
					local game_object_id = Managers.state.unit_storage:go_id(unit)

					if parent.is_server then
						Managers.state.network.network_transmit:send_rpc_clients("rpc_set_blocking", game_object_id, true)
					else
						Managers.state.network.network_transmit:send_rpc_server("rpc_set_blocking", game_object_id, true)
					end
				end

				status_extension:set_blocking(true)
				CharacterStateHelper.play_animation_event(unit, "packmaster_release")
			end

			parent.locomotion_extension:enable_animation_driven_movement()
		end
	},
	pack_master_hoisting = {
		enter = function (parent, unit)
			fix_mover(parent, unit)
		end,
		run = function (parent, unit)
			return
		end
	},
	pack_master_hanging = {
		enter = function (parent, unit)
			return
		end,
		run = function (parent, unit)
			return
		end
	},
	pack_master_dropping = {
		enter = function (parent, unit)
			CharacterStateHelper.show_inventory_3p(unit, false, true, Managers.player.is_server, parent.inventory_extension)

			local status_extension = parent.status_extension

			if CharacterStateHelper.is_dead(status_extension) then
				CharacterStateHelper.play_animation_event(unit, "packmaster_hang_release_death")
			elseif CharacterStateHelper.is_knocked_down(status_extension) then
				local params = parent.temp_params
				params.already_in_ko_anim = true

				CharacterStateHelper.play_animation_event(unit, "packmaster_hang_release_ko")
			else
				if not LEVEL_EDITOR_TEST and Managers.state.network:game() then
					local game_object_id = Managers.state.unit_storage:go_id(unit)

					if parent.is_server then
						Managers.state.network.network_transmit:send_rpc_clients("rpc_set_blocking", game_object_id, true)
					else
						Managers.state.network.network_transmit:send_rpc_server("rpc_set_blocking", game_object_id, true)
					end
				end

				status_extension:set_blocking(true)
				CharacterStateHelper.play_animation_event(unit, "packmaster_hang_release")
			end

			parent.locomotion_extension:enable_animation_driven_movement()
		end,
		run = function (parent, unit)
			return
		end
	},
	pack_master_released = {
		run = function (parent, unit)
			return
		end,
		enter = function (parent, unit)
			parent.locomotion_extension:enable_script_driven_movement()
			CharacterStateHelper.show_inventory_3p(unit, true, true, Managers.player.is_server, parent.inventory_extension)

			local status_extension = parent.status_extension
			local csm = parent.csm

			if CharacterStateHelper.is_dead(status_extension) then
				csm:change_state("dead")
			elseif CharacterStateHelper.is_knocked_down(status_extension) then
				if parent.inventory_extension:get_wielded_slot_name() == "slot_packmaster_claw" then
					parent.inventory_extension:wield_previous_weapon()
				end

				csm:change_state("knocked_down", parent.temp_params)
			else
				if parent.inventory_extension:get_wielded_slot_name() == "slot_packmaster_claw" then
					parent.inventory_extension:wield_previous_weapon()
				end

				csm:change_state("standing")
			end
		end
	}
}

PlayerCharacterStateGrabbedByPackMaster.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local unit = self.unit
	local input_extension = self.input_extension
	local status_extension = self.status_extension
	local first_person_extension = self.first_person_extension
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local pack_master_status = CharacterStateHelper.pack_master_status(self.status_extension)

	CharacterStateHelper.look(input_extension, self.player.viewport_name, self.first_person_extension, status_extension, self.inventory_extension)

	local states = PlayerCharacterStateGrabbedByPackMaster.states
	local last_state = self.pack_master_status

	if pack_master_status ~= last_state then
		if states[last_state].leave then
			states[last_state].leave(self, unit)
		end

		if states[pack_master_status].enter then
			states[pack_master_status].enter(self, unit)
		end

		self.pack_master_status = pack_master_status
	end

	if not states[pack_master_status].run(self, unit) then
		return
	end

	local packmaster_unit = status_extension:get_pack_master_grabber()
	local packmaster_unit_position = position_lookup[packmaster_unit]

	if self.bread_crumb_trail_timer < t then
		self.bread_crumb_trail_timer = t + 0.4

		if self.store_index == self.move_target_index then
			self.move_target_index = (self.store_index + self.bread_crumb_trail_n / 2) % self.bread_crumb_trail_n + 1

			self.locomotion_extension:teleport_to(self.bread_crumb_trail[self.move_target_index]:unbox())
		end

		self.bread_crumb_trail[self.store_index]:store(packmaster_unit_position)

		self.store_index = self.store_index % self.bread_crumb_trail_n + 1
	end

	local position = position_lookup[unit]
	local wanted_distance = self.desired_distance
	local wanted_distance_sq = wanted_distance * wanted_distance
	local best_crumb_position = nil
	local best_crumb_distance_sq = math.huge

	for i = 1, self.bread_crumb_trail_n, 1 do
		local bread_crumb_position = self.bread_crumb_trail[i]:unbox()
		local distance_sq = Vector3.distance_squared(bread_crumb_position, packmaster_unit_position)
		local distance_to_wanted_sq = math.abs(distance_sq - wanted_distance_sq)

		if distance_to_wanted_sq < best_crumb_distance_sq then
			best_crumb_position = bread_crumb_position
			best_crumb_distance_sq = distance_to_wanted_sq
		end
	end

	local direction = Vector3.normalize(best_crumb_position - packmaster_unit_position)
	local wanted_position = packmaster_unit_position + direction * wanted_distance
	local packmaster_speed = nil
	local breed = Unit.get_data(packmaster_unit, "breed")

	if not breed then
		local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(packmaster_unit)
		packmaster_speed = movement_settings_table.move_speed
	else
		packmaster_speed = breed.walk_speed
	end

	local distance_sq = Vector3.distance_squared(position, packmaster_unit_position)
	local distance_sq_from_desired = distance_sq - wanted_distance_sq
	local speed_factor_from_distance = packmaster_speed * 0.9 + distance_sq_from_desired * 0.4
	local to_bread_crumb_vector = wanted_position - position
	local to_bread_crumb_direction = Vector3.normalize(to_bread_crumb_vector)

	self.locomotion_extension:set_wanted_velocity(to_bread_crumb_direction * speed_factor_from_distance)
	Vector3.set_z(to_bread_crumb_direction, 0)

	local rotation_wanted = Quaternion.look(-to_bread_crumb_direction)
	local rotation_current = Unit.local_rotation(unit, 0)
	local rotation = Quaternion.lerp(rotation_current, rotation_wanted, 0.1)

	Unit.set_local_rotation(unit, 0, rotation)

	local physics_world = World.get_data(self.world, "physics_world")
	local actors, num_actors = PhysicsWorld.immediate_overlap(physics_world, "shape", "capsule", "position", position + Vector3(0, 0, 0.9), "size", Vector3(0.6, 0.6, 0.9), "collision_filter", "filter_player_mover", "use_global_table")

	if num_actors == 0 then
		self.last_valid_position:store(position)
	end

	if script_data.debug_ai_movement then
		QuickDrawer:line(position, wanted_position)
		QuickDrawer:sphere(position, 0.2, Colors.get("magenta"))
		QuickDrawer:sphere(wanted_position + Vector3.up() * 0.4, 0.2, Colors.get("magenta"))

		for i = 1, self.bread_crumb_trail_n, 1 do
			local bread_crumb_position = self.bread_crumb_trail[i]:unbox()

			QuickDrawer:sphere(bread_crumb_position, 0.1, Colors.get("blue"))
		end
	end
end

return
