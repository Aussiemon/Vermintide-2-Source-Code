-- chunkname: @scripts/unit_extensions/default_player_unit/states/player_character_state_grabbed_by_pack_master.lua

PlayerCharacterStateGrabbedByPackMaster = class(PlayerCharacterStateGrabbedByPackMaster, PlayerCharacterState)

local position_lookup = POSITION_LOOKUP

PlayerCharacterStateGrabbedByPackMaster.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "grabbed_by_pack_master")

	self.move_target_index = 0
	self.desired_distance = 2
	self.last_valid_position = Vector3Box()
	self._drag_delta_move = Vector3Box()
	self.next_hanging_damage_time = 0
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
	local node = Unit.node(packmaster_unit, "j_rightweaponcomponent10")
	local start_pos = Unit.world_position(packmaster_unit, node)
	local target_pos = start_pos + Vector3(0, 2, 0)

	self._pole = {
		pole_length = 2,
		apos = Vector3Box(start_pos),
		bpos = Vector3Box(target_pos),
	}
	self.move_target_index = 1

	if self.ai_extension == nil then
		local wwise_world = Managers.world:wwise_world(self.world)
		local wwise_playing_id, wwise_source_id = WwiseWorld.trigger_event(wwise_world, "start_strangled_state", first_person_extension:get_first_person_unit())
	end

	self.last_valid_position:store(position)
	self.locomotion_extension:set_wanted_pos(position)

	self.packmaster_grab_state_initialized = false
	self.pack_master_status = CharacterStateHelper.pack_master_status(status_extension)

	local states = PlayerCharacterStateGrabbedByPackMaster.states

	if self.pack_master_status == "pack_master_pulling" then
		self._initial_pull_t = t + 0.75
	else
		self._initial_pull_t = t
	end

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
		local wwise_playing_id, wwise_source_id = WwiseWorld.trigger_event(wwise_world, "stop_strangled_state", first_person_extension:get_first_person_unit())
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

local function _init_packmaster_grab_state(parent, unit, state_name)
	if parent.packmaster_grab_state_initialized then
		return false
	end

	parent.packmaster_grab_state_initialized = true

	if state_name == "pack_master_hoisting" then
		parent.locomotion_extension:enable_wanted_position_movement()
	end

	local inventory_extension = parent.inventory_extension

	if inventory_extension:get_wielded_slot_name() ~= "slot_packmaster_claw" then
		inventory_extension:wield("slot_packmaster_claw", true)
	else
		CharacterStateHelper.show_inventory_3p(unit, true, true, Managers.player.is_server, parent.inventory_extension)
	end
end

PlayerCharacterStateGrabbedByPackMaster.states = {
	pack_master_pulling = {
		enter = function (parent, unit)
			parent.locomotion_extension:enable_animation_driven_movement()
			_init_packmaster_grab_state(parent, unit, "pack_master_pulling")
			Managers.state.network:anim_event(unit, "packmaster_hooked")
		end,
		run = function (parent, unit)
			parent.last_valid_position:store(position_lookup[unit])
		end,
	},
	pack_master_dragging = {
		enter = function (parent, unit)
			parent.locomotion_extension:enable_wanted_position_movement()
			_init_packmaster_grab_state(parent, unit, "pack_master_dragging")

			parent.dragged_move_anim = "move_bwd"

			CharacterStateHelper.play_animation_event_first_person(parent.first_person_extension, "move_bwd")
		end,
		run = function (parent, unit)
			local drag_delta_move = parent._drag_delta_move:unbox()
			local delta_move_length = Vector3.length(drag_delta_move)

			if delta_move_length == 0 and parent.dragged_move_anim == "move_bwd" then
				Managers.state.network:anim_event(unit, "packmaster_hooked_idle")

				parent.dragged_move_anim = "packmaster_hooked_idle"
			elseif delta_move_length > 0 and parent.dragged_move_anim == "packmaster_hooked_idle" then
				Managers.state.network:anim_event(unit, "move_bwd")

				parent.dragged_move_anim = "move_bwd"
			end

			return true
		end,
		leave = function (parent, unit)
			local position = unit and position_lookup[unit]

			if position then
				parent.locomotion_extension:teleport_to(position)
			end
		end,
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
		end,
	},
	pack_master_hoisting = {
		enter = function (parent, unit)
			_init_packmaster_grab_state(parent, unit, "pack_master_hoisting")

			local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
			local equipment = inventory_extension:equipment()
			local weapon_unit = equipment.right_hand_wielded_unit_3p
			local slot_name = inventory_extension:get_wielded_slot_name()
			local is_wielding_packmaster_claw = slot_name == "slot_packmaster_claw" and weapon_unit

			if not is_wielding_packmaster_claw then
				inventory_extension:wield("slot_packmaster_claw")
			end

			local dragged_unit_profile_id = Managers.player:owner(unit):profile_index()
			local target_unit_name = SPProfiles[dragged_unit_profile_id].unit_name
			local grab_hang_name = "attack_grab_hang_" .. target_unit_name

			Managers.state.entity:system("inventory_system"):weapon_anim_event(unit, grab_hang_name)
			Managers.state.network:anim_event(unit, "packmaster_hang_start")

			local packmaster_unit = parent.status_extension:get_pack_master_grabber()

			if ALIVE[packmaster_unit] then
				Managers.state.network:anim_event(packmaster_unit, grab_hang_name)
			end

			local function safe_navigation_callback()
				if ALIVE[unit] and ALIVE[packmaster_unit] then
					local new_pos = PactswornUtils.get_hoist_position(unit, packmaster_unit)

					parent.locomotion_extension:teleport_to(new_pos, nil)
				end
			end

			local ai_navigation_system = Managers.state.entity:system("ai_navigation_system")

			ai_navigation_system:add_safe_navigation_callback(safe_navigation_callback)
		end,
		run = function (parent, unit)
			return
		end,
	},
	pack_master_hanging = {
		enter = function (parent, unit)
			return
		end,
		run = function (parent, unit)
			return
		end,
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
		end,
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
		end,
	},
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

	local packmaster_unit = status_extension:get_pack_master_grabber()

	if not states[pack_master_status].run(self, unit) or not Unit.alive(packmaster_unit) then
		if pack_master_status == "pack_master_pulling" then
			if t > self._initial_pull_t and not self._pull_lerp then
				self.locomotion_extension:enable_wanted_position_movement()

				self._pull_lerp = true
				self._pull_lerp_dif = math.huge
			end

			if self._pull_lerp then
				local pole = self._pole
				local neck_node = Unit.node(unit, "j_neck")
				local neck_pos = Unit.world_position(unit, neck_node)
				local position = position_lookup[unit]
				local neck_to_feet_vec = position - neck_pos
				local hand_node = Unit.node(packmaster_unit, "j_rightweaponcomponent10")
				local hand_pos = Unit.world_position(packmaster_unit, hand_node)
				local hand_to_neck_vec = Vector3.normalize(neck_pos - hand_pos) * pole.pole_length
				local new_neck_pos = hand_pos + hand_to_neck_vec
				local wanted_position = new_neck_pos + neck_to_feet_vec

				if self._pull_lerp then
					local current_pos = Unit.world_position(unit, 0)
					local dif = wanted_position - current_pos
					local delta_move = Vector3.normalize(dif) * dt * 0.5
					local delta_move_length = Vector3.length_squared(dif)

					if delta_move_length < self._pull_lerp_dif then
						self._pull_lerp_dif = Vector3.length_squared(dif)
						wanted_position = current_pos + delta_move
					else
						self._pull_lerp = nil
					end
				end

				self.locomotion_extension:set_wanted_pos(wanted_position)
			end
		end

		return
	end

	local packmaster_unit_position = position_lookup[packmaster_unit]
	local position = position_lookup[unit]
	local wanted_position
	local pole = self._pole
	local neck_node = Unit.node(unit, "j_neck")
	local neck_pos = Unit.world_position(unit, neck_node)
	local neck_to_feet_vec = position - neck_pos
	local hand_node = Unit.node(packmaster_unit, "j_rightweaponcomponent10")
	local hand_pos = Unit.world_position(packmaster_unit, hand_node)
	local hand_to_neck_vec = Vector3.normalize(neck_pos - hand_pos) * pole.pole_length
	local new_neck_pos = hand_pos + hand_to_neck_vec

	wanted_position = new_neck_pos + neck_to_feet_vec
	wanted_position = wanted_position or position

	local wanted_change = wanted_position - position

	wanted_change.z = 0

	self._drag_delta_move:store(wanted_change)

	local to_packmaster = Vector3.flat(packmaster_unit_position - position)
	local rotation_wanted = Quaternion.look(-to_packmaster)
	local rotation_current = Unit.local_rotation(unit, 0)
	local rotation = Quaternion.lerp(rotation_current, rotation_wanted, 0.1)

	Unit.set_local_rotation(unit, 0, rotation)
	self.locomotion_extension:set_wanted_pos(wanted_position)

	local physics_world = World.get_data(self.world, "physics_world")
	local radius = 0.9
	local half_height = 0.6
	local size = Vector3(radius, half_height, radius)
	local shape = half_height - radius > 0 and "capsule" or "sphere"
	local actors, num_actors = PhysicsWorld.immediate_overlap(physics_world, "shape", shape, "position", position + Vector3(0, 0, 0.9), "size", size, "collision_filter", "filter_player_mover")

	if num_actors == 0 then
		self.last_valid_position:store(position)
	end
end
