PlayerCharacterStateGrabbedByTentacle = class(PlayerCharacterStateGrabbedByTentacle, PlayerCharacterState)
local position_lookup = POSITION_LOOKUP
local anim_event = CharacterStateHelper.play_animation_event
local switch_to_3p_dist_sq = 100
local switch_to_portal_cam_dist_sq = 9

PlayerCharacterStateGrabbedByTentacle.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "grabbed_by_tentacle")
end

PlayerCharacterStateGrabbedByTentacle.on_enter = function (self, unit, input, dt, context, t, previous_state)
	local inventory_extension = self.inventory_extension
	local career_extension = self.career_extension

	CharacterStateHelper.stop_weapon_actions(inventory_extension, "grabbed")
	CharacterStateHelper.stop_career_abilities(career_extension, "grabbed")
	inventory_extension:check_and_drop_pickups("grabbed_by_tentacle")

	local first_person_extension = self.first_person_extension

	first_person_extension:set_first_person_mode(false)
	first_person_extension:set_wanted_player_height("grabbed_by_tentacle", t)

	local status_extension = self.status_extension
	local tentacle_unit = status_extension.grabbed_by_tentacle_unit
	self.tentacle_unit = tentacle_unit
	local tentacle_spline_extension = ScriptUnit.has_extension(tentacle_unit, "ai_supplementary_system")
	local portal_unit = tentacle_spline_extension.portal_unit
	self.tentacle_template = tentacle_spline_extension.tentacle_template
	self.portal_unit = portal_unit
	self.tentacle_spline_extension = tentacle_spline_extension
	self.winding_dist = tentacle_spline_extension.lock_point_dist
	local tentacle_data = tentacle_spline_extension.tentacle_data
	local portal_forward = Quaternion.forward(Unit.local_rotation(tentacle_data.portal_unit, 0))
	self.portal_forward = Vector3Box(portal_forward)
	local breed = Unit.get_data(tentacle_unit, "breed")
	self.breed = breed
	self.drag_speed = breed.drag_speed
	self.camera_state = "first_person"
	self.hips_node = Unit.node(unit, "j_hips")

	if Unit.has_node(portal_unit, "a_player_attach") then
		self.hang_node = Unit.node(portal_unit, "a_player_attach")
	end

	self.physics_world = World.physics_world(self.world)
	self.nav_world = self.nav_world or Managers.state.entity:system("ai_system"):nav_world()
	local locomotion_extension = self.locomotion_extension

	locomotion_extension:enable_script_driven_no_mover_movement()
	locomotion_extension:enable_rotation_towards_velocity(false)

	local grabbed_by_tentacle_status = CharacterStateHelper.grabbed_by_tentacle_status(status_extension)
	local states = PlayerCharacterStateGrabbedByTentacle.states

	if states[grabbed_by_tentacle_status].enter then
		states[grabbed_by_tentacle_status].enter(self, unit, t)
	end

	self.grabbed_by_tentacle_status = grabbed_by_tentacle_status
end

local function get_navmesh_position(nav_world, current_pos)
	local navmesh_position = LocomotionUtils.pos_on_mesh(nav_world, current_pos, 1, 1)

	if navmesh_position then
		return navmesh_position
	end

	local above_limit = 1
	local below_limit = 2
	local horizontal_limit = 1
	local distance_from_nav_border = 0.05
	local border_position = GwNavQueries.inside_position_from_outside_position(nav_world, current_pos, above_limit, below_limit, horizontal_limit, distance_from_nav_border)

	if border_position then
		return border_position
	end
end

PlayerCharacterStateGrabbedByTentacle.on_exit = function (self, unit, input, dt, context, t, next_state)
	local status_extension = self.status_extension

	status_extension:set_grabbed_by_tentacle(false)

	local camera_state = self.camera_state
	local include_local_player = camera_state ~= "first_person" or false

	CharacterStateHelper.show_inventory_3p(unit, true, include_local_player, self.is_server, self.inventory_extension)

	local player = self.player
	local camera_system = Managers.state.entity:system("camera_system")

	camera_system:set_follow_unit(player)

	if self.grabbed_by_tentacle_status ~= "portal_consume" then
		local locomotion_extension = self.locomotion_extension

		if not CharacterStateHelper.is_knocked_down(status_extension) and not CharacterStateHelper.is_dead(status_extension) then
			local first_person_extension = self.first_person_extension
			local camera_state = self.camera_state

			CharacterStateHelper.change_camera_state(player, "follow")

			if camera_state == "first_person" then
				first_person_extension:set_first_person_mode(true)
			else
				first_person_extension:toggle_visibility(CameraTransitionSettings.perspective_transition_time)
			end

			locomotion_extension:reset_maximum_upwards_velocity()
			locomotion_extension:enable_script_driven_movement()
			locomotion_extension:enable_rotation_towards_velocity(true)
		end

		local nav_world = self.nav_world
		local current_pos = Unit.world_position(unit, self.hips_node)
		local navmesh_position = self.tentacle_spline_extension.tentacle_data.last_target_pos:unbox()

		if navmesh_position then
			locomotion_extension:teleport_to(navmesh_position)
		end
	end

	self.first_person_extension:set_wanted_player_height("stand", t)

	self.camera_state = nil
	self.grabbed_by_tentacle_status = nil
end

PlayerCharacterStateGrabbedByTentacle.states = {
	grabbed = {
		enter = function (parent, unit, t)
			local include_local_player = parent.camera_state ~= "first_person" or false

			CharacterStateHelper.show_inventory_3p(unit, false, include_local_player, parent.is_server, parent.inventory_extension)
			anim_event(unit, "tentacle_grabbed_loop")
		end,
		run = function (parent, unit, t, dt)
			local current_pos = Unit.world_position(unit, parent.hips_node)
			local nav_world = parent.nav_world
			local wanted_velocity = parent:get_drag_velocity(current_pos, t, dt)
			local new_pos = current_pos + wanted_velocity
			local hit, hit_pos, distance, normal, actor = PhysicsWorld.immediate_raycast(parent.physics_world, current_pos, Vector3(0, 0, -1), 1, "all", "collision_filter", "filter_ledge_test")

			if hit then
				wanted_velocity.z = 0.5
			end

			parent.locomotion_extension:set_wanted_velocity(wanted_velocity)

			local rotation_direction = Vector3.normalize(wanted_velocity)
			local current_rotation = Unit.world_rotation(unit, 0)
			local spline_rotation = Quaternion.look(rotation_direction, Vector3.up())
			local lerped_rotation = Quaternion.lerp(current_rotation, spline_rotation, dt)

			Unit.set_local_rotation(unit, 0, lerped_rotation)

			local camera_state = parent.camera_state

			if camera_state == "first_person" or camera_state == "third_person" then
				local player = parent.player
				local portal_unit = parent.portal_unit
				local portal_pos = position_lookup[portal_unit]
				local to_portal = portal_pos - current_pos
				local portal_dist_sq = Vector3.length_squared(to_portal)
				local tentacle_template = parent.tentacle_template

				if camera_state == "first_person" and portal_dist_sq < tentacle_template.switch_to_3p_dist_sq then
					CharacterStateHelper.change_camera_state(player, "follow_third_person")
					parent.inventory_extension:show_third_person_inventory(false)

					parent.camera_state = "third_person"
				elseif camera_state == "third_person" and portal_dist_sq < tentacle_template.switch_to_portal_cam_dist_sq then
					local camera_system = Managers.state.entity:system("camera_system")
					local camera_attach_node = parent.tentacle_template.portal_camera_node

					camera_system:set_follow_unit(player, portal_unit, camera_attach_node)

					parent.camera_state = "portal"
				end
			end
		end,
		leave = function (parent, unit)
			return
		end
	},
	portal_hanging = {
		enter = function (parent, unit, t)
			anim_event(unit, "tentacle_portal_struggle_loop")

			local hang_rotation = Unit.world_rotation(parent.portal_unit, parent.hang_node)

			Unit.set_local_rotation(unit, 0, hang_rotation)
		end,
		run = function (parent, unit, t, dt)
			local current_pos = Unit.world_position(unit, 0)
			local portal_attachment_pos = Unit.world_position(parent.portal_unit, parent.hang_node)
			local to_portal = portal_attachment_pos - current_pos

			if Vector3.length_squared(to_portal) > 0.01 then
				local wanted_velocity = 5 * to_portal

				parent.locomotion_extension:set_wanted_velocity(wanted_velocity)
			else
				parent.locomotion_extension:set_wanted_velocity(Vector3.zero())
			end
		end,
		leave = function (parent, unit)
			return
		end
	},
	portal_consume = {
		enter = function (parent, unit, t)
			local portal_unit = parent.portal_unit
			local surface_node = Unit.node(portal_unit, "a_surface_center")
			local portal_position = Unit.world_position(portal_unit, surface_node)
			local portal_rotation = Unit.world_rotation(portal_unit, surface_node)
			local portal_forward = Quaternion.forward(portal_rotation)
			local breed = parent.breed
			local params = {
				animation = "tentacle_portal_struggle_dead",
				drop_items_delay = breed.time_before_consume_kill_player,
				override_item_drop_position = portal_position,
				override_item_drop_direction = portal_forward
			}
			local csm = parent.csm

			csm:change_state("dead", params)
		end,
		run = function (parent, unit, t, dt)
			return
		end,
		leave = function (parent, unit)
			return
		end
	},
	portal_release = {
		enter = function (parent, unit, t)
			anim_event(unit, "tentacle_portal_struggle_release")
			parent.locomotion_extension:set_wanted_velocity(Vector3.zero())

			local breed = parent.breed
			local portal_release_time = breed.portal_release_time
			parent.wait_for_release = t + portal_release_time
		end,
		run = function (parent, unit, t, dt)
			if parent.wait_for_release < t then
				local csm = parent.csm

				csm:change_state("standing")
			end
		end,
		leave = function (parent, unit)
			return
		end
	}
}

PlayerCharacterStateGrabbedByTentacle.get_drag_velocity = function (self, player_pos, t, dt)
	self.winding_dist = self.winding_dist - self.drag_speed * dt
	local spline = self.tentacle_spline_extension.spline
	local tentacle_data = self.tentacle_spline_extension.tentacle_data
	local out_dist = (tentacle_data.portal_spawn_type == "floor" and 3.3) or 2.5
	local spline_pos = spline:get_point_at_distance(self.winding_dist - out_dist)
	local travel_to_node_index = self.tentacle_spline_extension.tentacle_data.travel_to_node_index
	local to_portal_along_spline, swing_vec = nil

	if travel_to_node_index then
		local glider_node_pos = self.tentacle_spline_extension.tentacle_data.astar_node_list[travel_to_node_index + 1]:unbox()
		local travel_node_pos = self.tentacle_spline_extension.tentacle_data.astar_node_list[travel_to_node_index]:unbox()
		local travel_dir = Vector3.normalize(travel_node_pos - glider_node_pos)
		to_portal_along_spline = travel_dir

		QuickDrawer:line(travel_node_pos, player_pos, Color(200, 0, 255))
	else
		local p, ds = nil
		local portal_forward = self.portal_forward:unbox()
		local root_pos = tentacle_data.root_pos:unbox()
		local wall_pos = tentacle_data.wall_pos:unbox()

		if tentacle_data.portal_spawn_type == "floor" then
			local root_to_align_dist = 4
			local horiz_influence_dist = 3
			p, ds = self.tentacle_spline_extension:funnel_one_point(spline_pos, wall_pos, root_pos, portal_forward, root_to_align_dist, horiz_influence_dist)
		else
			local root_to_align_dist = 2.5
			p, ds = self.tentacle_spline_extension:funnel_one_point(spline_pos, wall_pos, root_pos, portal_forward, root_to_align_dist)
		end

		if ds > 1 then
			spline_pos = wall_pos + portal_forward * 2
		end

		to_portal_along_spline = Vector3.normalize(spline_pos - player_pos)
	end

	local look_dir = nil
	local velocity = to_portal_along_spline * self.drag_speed

	return velocity, look_dir
end

PlayerCharacterStateGrabbedByTentacle.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local input_extension = self.input_extension
	local status_extension = self.status_extension
	local tentacle_unit = self.tentacle_unit

	if not status_extension.grabbed_by_tentacle or not Unit.alive(tentacle_unit) then
		if CharacterStateHelper.is_waiting_for_assisted_respawn(status_extension) then
			csm:change_state("waiting_for_assisted_respawn")
		elseif CharacterStateHelper.is_knocked_down(status_extension) then
			csm:change_state("knocked_down")
		elseif CharacterStateHelper.is_dead(status_extension) then
			csm:change_state("dead")
		else
			csm:change_state("standing")
		end

		return
	end

	local grabbed_by_tentacle_status = CharacterStateHelper.grabbed_by_tentacle_status(status_extension)
	local last_state = self.grabbed_by_tentacle_status
	local states = PlayerCharacterStateGrabbedByTentacle.states

	if grabbed_by_tentacle_status ~= last_state then
		if states[last_state].leave then
			states[last_state].leave(self, unit)
		end

		if states[grabbed_by_tentacle_status].enter then
			states[grabbed_by_tentacle_status].enter(self, unit, t)
		end

		self.grabbed_by_tentacle_status = grabbed_by_tentacle_status
	end

	states[grabbed_by_tentacle_status].run(self, unit, t, dt)

	local player = self.player

	CharacterStateHelper.look(input_extension, player.viewport_name, self.first_person_extension, status_extension, self.inventory_extension)
end

return
