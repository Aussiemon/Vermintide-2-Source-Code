-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/enemy_character_state_standing.lua

EnemyCharacterStateStanding = class(EnemyCharacterStateStanding, EnemyCharacterState)

EnemyCharacterStateStanding.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "standing")

	self.wherabouts_extension = ScriptUnit.extension(self._unit, "whereabouts_system")
end

EnemyCharacterStateStanding.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	local unit = self._unit
	local input_extension = self._input_extension

	self._locomotion_extension:set_wanted_velocity(Vector3.zero())

	local inventory_extension = self._inventory_extension
	local first_person_extension = self._first_person_extension
	local status_extension = self._status_extension
	local toggle_crouch = input_extension.toggle_crouch

	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, status_extension, self._inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, self._health_extension)

	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)

	self.time_when_can_be_pushed = t + movement_settings_table.soft_collision.grace_time_pushed_entering_standing

	if previous_state == "dummy" then
		first_person_extension:set_first_person_mode(false)
		first_person_extension:toggle_visibility(CameraTransitionSettings.perspective_transition_time)
	end

	local player = Managers.player:owner(unit)

	CharacterStateHelper.change_camera_state(player, "follow")

	self.side = Managers.state.side.side_by_unit[unit]
	self.current_animation = "idle"

	if not status_extension:get_unarmed() then
		CharacterStateHelper.play_animation_event(unit, "to_combat")
	end

	CharacterStateHelper.play_animation_event(unit, "idle")
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "idle")
end

local pos1 = {}
local pos2 = {}
local results = {}

EnemyCharacterStateStanding.teleport = function (self, unit, t, dt)
	local viewport_name = self._player.viewport_name
	local viewport = ScriptWorld.viewport(self._world, viewport_name)
	local camera = ScriptViewport.camera(viewport)
	local camera_position = ScriptCamera.position(camera)
	local camera_rotation = ScriptCamera.rotation(camera)
	local camera_forward = Quaternion.forward(camera_rotation)
	local max_dist = 30
	local result, hit_position, hit_distance, normal, actor = PhysicsWorld.immediate_raycast(self._physics_world, camera_position, camera_forward, max_dist, "closest", "collision_filter", "filter_enemy_ray_projectile")

	if result then
		if World.umbra_available(self._world) then
			local endp = camera_position + camera_forward * max_dist

			pos1[1] = camera_position
			pos2[1] = endp
			pos1[2] = camera_position
			pos2[2] = endp + Vector3(0, 0, 0.1)
			pos1[3] = camera_position
			pos2[3] = endp - Vector3(0, 0, 0.1)

			local num_hit = World.umbra_has_line_of_sight_many(self._world, pos1, pos2, results)

			if num_hit > 0 then
				Debug.string("UMBRA HIT")
			end
		end

		local dot = Vector3.dot(normal, Vector3.up())

		if dot > 0.8 then
			QuickDrawer:sphere(hit_position, 0.25, Color(255, 100, 0))
		else
			QuickDrawer:sphere(hit_position, 0.25, Color(255, 255, 0))

			local infront_wall_pos = hit_position - camera_forward * 0.6
			local ground_in_front_of_wall, hit_position1, hit_distance1, normal, actor = PhysicsWorld.immediate_raycast(self._physics_world, infront_wall_pos, -Vector3.up(), 6, "closest", "collision_filter", "filter_enemy_ray_projectile")
			local step_xy_dist = 0.4

			for k = 1, 10 do
				local p = hit_position + k * Vector3(0, 0, 0.2)
				local step_hit, pos, hit_dist, normal, actor = PhysicsWorld.immediate_raycast(self._physics_world, p, camera_forward, step_xy_dist, "closest", "collision_filter", "filter_enemy_ray_projectile")

				if not step_hit then
					QuickDrawer:line(p, p + camera_forward * step_xy_dist)

					local down_dist = 0.3

					for j = 1, 4 do
						local find_ledge_p = p + j * camera_forward * 0.1
						local stand_hit, pos, dist, normal, actor = PhysicsWorld.immediate_raycast(self._physics_world, p, -Vector3.up(), down_dist, "closest", "collision_filter", "filter_enemy_ray_projectile")

						if stand_hit then
							QuickDrawer:sphere(pos, 0.75, Color(255, 255, 0))

							break
						end
					end

					break
				end
			end

			local ledge_check_dist = 0.2
			local look_up_dist = 3
			local behind_wall_pos = hit_position + camera_forward * ledge_check_dist + Vector3.up() * look_up_dist
			local ground_on_ledge, hit_position2, hit_distance2, normal, actor = PhysicsWorld.immediate_raycast(self._physics_world, behind_wall_pos, -Vector3.up(), look_up_dist, "closest", "collision_filter", "filter_enemy_ray_projectile")

			if ground_on_ledge then
				local outside_pos = hit_position2 - camera_forward * ledge_check_dist
				local wall_between, p1, hp1, normal, actor = PhysicsWorld.immediate_raycast(self._physics_world, outside_pos, camera_forward, ledge_check_dist, "closest", "collision_filter", "filter_enemy_ray_projectile")

				ground_on_ledge = not wall_between
			end

			if ground_in_front_of_wall and ground_on_ledge then
				if hit_distance1 < hit_distance2 then
					QuickDrawer:line(infront_wall_pos, hit_position1)
					QuickDrawer:sphere(hit_position1, 0.25, Color(0, 125, 0))
				else
					QuickDrawer:line(infront_wall_pos, hit_position2)
					QuickDrawer:sphere(hit_position2, 0.25, Color(0, 0, 125))
				end
			elseif ground_in_front_of_wall then
				QuickDrawer:sphere(hit_position1, 0.25, Color(0, 125, 0))
				QuickDrawer:line(hit_position1, infront_wall_pos, Color(0, 125, 0))
			elseif ground_on_ledge then
				QuickDrawer:sphere(hit_position2, 0.25, Color(0, 0, 125))
				QuickDrawer:line(hit_position2, behind_wall_pos, Color(0, 0, 125))
			end
		end
	else
		local end_pos = camera_position + camera_forward * max_dist
		local on_ground_pos, hit_position, hit_distance, normal, actor = PhysicsWorld.immediate_raycast(self._physics_world, end_pos, -Vector3.up(), 6, "closest", "collision_filter", "filter_enemy_ray_projectile")

		if on_ground_pos then
			QuickDrawer:sphere(hit_position, 0.25, Color(155, 225, 100))
		end
	end
end

EnemyCharacterStateStanding.common_state_changes = function (self)
	self:handle_disabled_ghost_mode()

	local csm = self._csm
	local unit = self._unit
	local locomotion_extension = self._locomotion_extension
	local status_extension = self._status_extension
	local first_person_extension = self._first_person_extension
	local CharacterStateHelper = CharacterStateHelper
	local career_data = self._career_extension:career_settings()
	local inventory_extension = self._inventory_extension

	if locomotion_extension:is_on_ground() then
		self.wherabouts_extension:set_is_onground()
	end

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		return true
	end

	if CharacterStateHelper.is_using_transport(status_extension) then
		csm:change_state("using_transport")

		return true
	end

	if not csm.state_next and status_extension.do_leap then
		csm:change_state("leaping")

		return true
	end

	local input_extension = self._input_extension

	if input_extension:get("character_inspecting") then
		local _, right_hand_weapon_extension, left_hand_weapon_extension = CharacterStateHelper.get_item_data_and_weapon_extensions(self._inventory_extension)
		local current_action_settings = CharacterStateHelper.get_current_action_data(left_hand_weapon_extension, right_hand_weapon_extension)

		if not current_action_settings then
			csm:change_state("inspecting")

			return true
		end
	end

	return false
end

EnemyCharacterStateStanding.common_movement = function (self, t)
	local csm = self._csm
	local unit = self._unit
	local first_person_extension = self._first_person_extension
	local ghost_mode_extension = self._ghost_mode_extension
	local input_extension = self._input_extension
	local locomotion_extension = self._locomotion_extension
	local status_extension = self._status_extension
	local CharacterStateHelper = CharacterStateHelper
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local is_crouching = status_extension:is_crouching()

	if (input_extension:get("jump") or input_extension:get("jump_only")) and not status_extension:is_crouching() and (not is_crouching or CharacterStateHelper.can_uncrouch(unit)) and locomotion_extension:jump_allowed() then
		if is_crouching then
			CharacterStateHelper.uncrouch(unit, t, first_person_extension, status_extension)
		end

		csm:change_state("jumping")
		first_person_extension:change_state("jumping")

		return
	end

	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)

	if CharacterStateHelper.is_pushed(status_extension) then
		status_extension:set_pushed(false)

		local params = movement_settings_table.stun_settings.pushed
		local hit_react_type = status_extension:hit_react_type()

		params.hit_react_type = hit_react_type .. "_push"

		csm:change_state("stunned", params)

		return true
	end

	if locomotion_extension:is_animation_driven() then
		csm:change_state("walking")

		return true
	end

	local interactor_extension = self._interactor_extension

	if CharacterStateHelper.is_starting_interaction(input_extension, interactor_extension) then
		local _, hold_input = InteractionHelper.interaction_action_names(unit)

		interactor_extension:start_interaction(hold_input)

		if interactor_extension:allow_movement_during_interaction() then
			return
		end

		local config = interactor_extension:interaction_config()
		local params = self._temp_params

		params.swap_to_3p = config.swap_to_3p
		params.show_weapons = config.show_weapons
		params.activate_block = config.activate_block
		params.allow_rotation_update = config.allow_rotation_update

		csm:change_state("interacting", params)

		return true
	end

	local is_moving = CharacterStateHelper.has_move_input(input_extension)

	if is_moving then
		local params = self._temp_params

		csm:change_state("walking", params)
		first_person_extension:change_state("walking")

		return true
	end

	if not locomotion_extension:is_on_ground() then
		csm:change_state("falling")
		first_person_extension:change_state("falling")

		return true
	end

	if input_extension:get("character_inspecting") then
		local _, right_hand_weapon_extension, left_hand_weapon_extension = CharacterStateHelper.get_item_data_and_weapon_extensions(self._inventory_extension)
		local current_action_settings = CharacterStateHelper.get_current_action_data(left_hand_weapon_extension, right_hand_weapon_extension)

		if not current_action_settings then
			csm:change_state("inspecting")

			return true
		end
	end

	local inventory_extension = self._inventory_extension
	local first_person_extension = self._first_person_extension
	local toggle_crouch = input_extension.toggle_crouch

	if t > self.time_when_can_be_pushed and self._player:is_player_controlled() then
		self.current_animation = CharacterStateHelper.update_soft_collision_movement(first_person_extension, status_extension, locomotion_extension, unit, self._world, self.current_animation, self.side)
	end

	CharacterStateHelper.ghost_mode(self._ghost_mode_extension, input_extension)
	CharacterStateHelper.look(input_extension, self._player.viewport_name, self._first_person_extension, status_extension, self._inventory_extension)

	return false
end

EnemyCharacterStateStanding.update = function (self, unit, input, dt, context, t)
	local handled = self:common_state_changes()

	if handled then
		return
	end

	self:_update_taunt_dialogue(t)

	handled = self:common_movement(t)
end
