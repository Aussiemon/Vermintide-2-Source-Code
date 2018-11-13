require("scripts/unit_extensions/generic/generic_state_machine")

PlayerBotInput = class(PlayerBotInput)
local POSITION_LOOKUP = POSITION_LOOKUP

PlayerBotInput.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self.move = {
		x = 0,
		y = 0
	}
	self.look = {
		x = 0,
		y = 0
	}
	self._aim_target = Vector3Box(0, 0, 0)
	self._aim_rotation = QuaternionBox(0, 0, 0)
	self._aiming = false
	self._soft_aiming = false
	self._charge_shot = false
	self._charge_shot_held = false
	self._fire_hold = false
	self._fire = false
	self._fire_held = false
	self._defend = false
	self._defend_held = false
	self._melee_push = false
	self._hold_attack = false
	self._tap_attack = false
	self._tap_attack_released = true
	self._interact = false
	self._interact_held = false
	self._activate_ability = false
	self._activate_ability_held = false
	self._weapon_reload = false
	self._dodge = false
	self._bot_in_attract_mode_focus = false
	self._avoiding_aoe_threat = false
	self.double_tap_dodge = false
	self.minimum_dodge_input = 0
	self._input = {}
	self._look_at_player = nil
	self._look_at_player_rotation_allowed = false
	self._world = extension_init_context.world
	self._nav_world = Managers.state.entity:system("ai_system"):nav_world()
	self._game = Managers.state.network:game()
end

PlayerBotInput.extensions_ready = function (self, world, unit)
	local ext = ScriptUnit.extension
	self._navigation_extension = ext(unit, "ai_navigation_system")
	self._status_extension = ext(unit, "status_system")
	self._first_person_extension = ext(unit, "first_person_system")
	self._ai_bot_group_extension = ext(unit, "ai_bot_group_system")
	self._locomotion_extension = ext(unit, "locomotion_system")
end

PlayerBotInput.destroy = function (self)
	return
end

PlayerBotInput.reset = function (self)
	return
end

PlayerBotInput.pre_update = function (self, unit, input, dt, context, t)
	local position = POSITION_LOOKUP[unit]
	local success, altitude = GwNavQueries.triangle_from_position(self._nav_world, position, 1.1, 0.5)
	self._position_on_navmesh = (success and Vector3(position.x, position.y, altitude)) or position
end

PlayerBotInput.update = function (self, unit, input, dt, context, t)
	table.clear(self._input)
	self:_update_movement(dt, t)
	self:_update_actions()
end

PlayerBotInput._update_actions = function (self)
	local input = self._input

	if self._fire_hold then
		self._fire_hold = false
		input.action_one_hold = true

		if not self._fire_held then
			input.action_one = true
			self._fire_held = true
		end
	elseif self._fire_held then
		self._fire_held = false
		input.action_one_release = true
	elseif self._fire then
		self._fire = false
		input.action_one = true
	end

	if self._melee_push then
		self._melee_push = false
		self._defend = false

		if self._defend_held then
			input.action_one = true
		else
			self._defend_held = true
			input.action_two = true
		end

		input.action_two_hold = true
	elseif self._defend then
		self._defend = false

		if not self._defend_held then
			self._defend_held = true
			input.action_two = true
		end

		input.action_two_hold = true
	elseif self._defend_held then
		self._defend_held = false
		input.action_two_release = true
	end

	if self._activate_ability then
		self._activate_ability = false

		if not self._activate_ability_held then
			self._activate_ability_held = true
			input.action_career = true
		end

		input.action_career_hold = true
	elseif self._activate_ability_held then
		self._activate_ability_held = false
		input.action_career_release = true
	end

	if self._weapon_reload then
		self._weapon_reload = false
		input.weapon_reload = true
		input.weapon_reload_hold = true
	end

	if self._hold_attack then
		input.action_one = true
		input.action_one_hold = true
		self._hold_attack = false
		self._attack_held = true
	elseif self._attack_held then
		self._attack_held = false
		input.action_one_release = true
	elseif not self._tap_attack_released then
		self._tap_attack_released = true
		input.action_one_release = true
	elseif self._tap_attack then
		self._tap_attack_released = false
		self._tap_attack = false
		input.action_one = true
	end

	if self._charge_shot then
		self._charge_shot = false
		input.action_two_hold = true

		if not self._charge_shot_held then
			input.action_two = true
			self._charge_shot_held = true
		end
	elseif self._charge_shot_held then
		self._charge_shot_held = false
		input.action_two_release = true
	end

	if self._interact then
		self._interact = false

		if not self._interact_held then
			self._interact_held = true
			input.interact = true
		end

		input.interacting = true
	elseif self._interact_held then
		self._interact_held = false
	end

	local slot_to_wield = self._slot_to_wield

	if slot_to_wield then
		self._slot_to_wield = nil
		local slots = InventorySettings.slots
		local num_slots = #slots
		local wield_input = nil

		for i = 1, num_slots, 1 do
			local slot_data = slots[i]

			if slot_data.name == slot_to_wield then
				wield_input = slot_data.wield_input
			end
		end

		input[wield_input] = true
	end

	if self._dodge then
		input.dodge = true
		input.dodge_hold = true
		self._dodge = false
	end
end

PlayerBotInput._update_debug_text = function (self, unit, input)
	if script_data.debug_unit ~= unit or not script_data.ai_bots_input_debug then
		return
	end

	table.dump(input, nil, nil, Debug.text)
end

PlayerBotInput._debug_aim_target_sine_curve = function (self, dt, t)
	local pos = Vector3(-70.1625, -90.9497, -7.42347)
	local z = 6 - 3 * math.sin(t)
	local x = 10 - 5 * math.sin(t * 0.3)
	local y = 10 - 5 * math.sin(t * 2)
	pos = pos + Vector3(x, y, z)

	self._aim_target:store(pos)

	local drawer = Managers.state.debug:drawer({
		mode = "immediate",
		name = "playerbotinput"
	})

	drawer:sphere(pos, 0.5, Color(255, 0, 0))
end

PlayerBotInput.set_aim_position = function (self, position)
	self._aim_target:store(position)
end

PlayerBotInput.set_aim_rotation = function (self, rotation)
	self._aim_rotation:store(rotation)
end

PlayerBotInput.set_aiming = function (self, aiming, soft, use_rotation)
	self._aiming = aiming
	self._aim_with_rotation = (use_rotation and aiming) or false

	if aiming and soft then
		self._soft_aiming = true
	else
		self._soft_aiming = false
	end
end

PlayerBotInput.set_look_at_player = function (self, player_unit, rotation_allowed)
	self._look_at_player = player_unit
	self._look_at_player_rotation_allowed = not not rotation_allowed
end

PlayerBotInput.defend = function (self)
	self._defend = true
end

PlayerBotInput.activate_ability = function (self)
	self._activate_ability = true
end

PlayerBotInput.melee_push = function (self)
	self._melee_push = true
end

PlayerBotInput.hold_attack = function (self)
	self._hold_attack = true
end

PlayerBotInput.tap_attack = function (self)
	self._tap_attack = true
end

PlayerBotInput.charge_shot = function (self)
	self._charge_shot = true
end

PlayerBotInput.fire = function (self)
	self._fire = true
end

PlayerBotInput.fire_hold = function (self)
	self._fire_hold = true
end

PlayerBotInput.interact = function (self)
	self._interact = true
end

PlayerBotInput.weapon_reload = function (self)
	self._weapon_reload = true
end

PlayerBotInput.dodge = function (self)
	self._dodge = true
end

PlayerBotInput.wield = function (self, slot)
	self._slot_to_wield = slot
end

local Quaternion_look = Quaternion.look
local Quaternion_multiply = Quaternion.multiply
local MOVE_SCALE_START_DIST_SQ = 0.010000000000000002
local MOVE_SCALE_FACTOR = 99.995
local MOVE_SCALE_MIN = 5e-05

PlayerBotInput._update_wanted_rotation_for_attract_mode = function (self, dt, rotation, current_goal, on_ladder, ladder_unit, camera_position)
	local transition_jump = nil
	local player_bot_navigation = self._navigation_extension
	local position = self._position_on_navmesh
	local up = Vector3.up()
	local wanted_rotation = nil

	if current_goal and on_ladder then
		local dir = current_goal - POSITION_LOOKUP[self.unit]
		local ladder_up = Quaternion.up(Unit.local_rotation(ladder_unit, 0))
		local z = dir.z

		if math.abs(z) < 0.05 then
			wanted_rotation = rotation
		elseif z < 0 then
			wanted_rotation = Quaternion_look(-ladder_up, up)
		else
			wanted_rotation = Quaternion_look(ladder_up, up)
		end
	elseif self._aiming and self._aim_with_rotation then
		wanted_rotation = Quaternion.lerp(rotation, self._aim_rotation:unbox(), math.min(dt * 2, 1))

		Debug.text("AIMING W ROT")
	elseif self._aiming and self._soft_aiming then
		local direction = self._aim_target:unbox() - camera_position
		wanted_rotation = Quaternion.lerp(rotation, Quaternion_look(direction, up), math.min(dt * 2, 1))

		Debug.text("SOFT AIMING")
	elseif self._aiming then
		wanted_rotation = Quaternion_look(self._aim_target:unbox() - camera_position, up)
		wanted_rotation = Quaternion.lerp(rotation, wanted_rotation, math.min(dt * 2, 1))

		Debug.text("AIMING")
	elseif current_goal then
		Debug.text("CURRENT GOAL")

		local dir = current_goal - position

		if player_bot_navigation:is_in_transition() then
			transition_jump = player_bot_navigation:transition_requires_jump(position, Vector3.normalize(dir))
			wanted_rotation = Quaternion_look(dir, up)
		else
			wanted_rotation = Quaternion.lerp(rotation, Quaternion_look(dir, up), math.min(dt * 2, 1))
		end
	else
		Debug.text("DEFAULT")

		wanted_rotation = Quaternion.lerp(rotation, Unit.local_rotation(self.unit, 0), math.min(dt * 1, 1))
	end

	return wanted_rotation, transition_jump
end

PlayerBotInput.set_bot_in_attract_mode_focus = function (self, is_in_focus)
	self._bot_in_attract_mode_focus = is_in_focus
end

local STUCK_JUMP_SPEED_THRESHOLD = 0.2
local STUCK_CROUCH_SPEED_THRESHOLD = STUCK_JUMP_SPEED_THRESHOLD + 0.3
local STUCK_JUMP_SPEED_THRESHOLD_SQ = STUCK_JUMP_SPEED_THRESHOLD^2
local STUCK_CROUCH_SPEED_THRESHOLD_SQ = STUCK_CROUCH_SPEED_THRESHOLD^2

PlayerBotInput._obstacle_check = function (self, position, current_speed_sq, goal_vector, goal_direction, up)
	local physics_world = World.get_data(self._world, "physics_world")
	local collision_filter = "filter_ai_line_of_sight_check"
	local forward_offset = 0.25
	local jump_range_check_epsilon = 0.05
	local width = 0.4
	local depth = math.min(0.5, Vector3.length(goal_vector) - jump_range_check_epsilon)
	local height, half_extra_upper_depth, half_extra_upper_height = nil

	if STUCK_JUMP_SPEED_THRESHOLD_SQ < current_speed_sq then
		height = 0.4
		half_extra_upper_depth = 0.55
		half_extra_upper_height = (0.8 - height) * 0.5
	else
		height = 0.8
		half_extra_upper_depth = 0.1
		half_extra_upper_height = 0
	end

	local half_width = width * 0.5
	local half_depth = depth * 0.5
	local half_height = height * 0.5
	local half_upper_height = 0.25 + half_extra_upper_height
	local half_upper_depth = half_depth + half_extra_upper_depth
	local lower_check_pos = position + goal_direction * (half_depth + forward_offset) + Vector3(0, 0, 0.4 + half_height)
	local upper_check_pos = lower_check_pos + goal_direction * (half_upper_depth - half_depth) + Vector3(0, 0, half_upper_height + half_height)
	local lower_extents = Vector3(half_width, half_depth, half_height)
	local upper_extents = Vector3(half_width, half_upper_depth, half_upper_height)
	local rotation = Quaternion_look(goal_direction, up)
	local _, num_low_hit_actors = PhysicsWorld.immediate_overlap(physics_world, "shape", "oobb", "position", lower_check_pos, "rotation", rotation, "size", lower_extents, "types", "statics", "collision_filter", collision_filter, "use_global_table")
	local lower_hit = num_low_hit_actors > 0
	local _, num_high_hit_actors = PhysicsWorld.immediate_overlap(physics_world, "shape", "oobb", "position", upper_check_pos, "rotation", rotation, "size", upper_extents, "types", "statics", "collision_filter", collision_filter, "use_global_table")
	local upper_hit = num_high_hit_actors > 0

	return lower_hit, upper_hit
end

PlayerBotInput._update_movement = function (self, dt, t)
	local unit = self.unit
	local player_bot_navigation = self._navigation_extension
	local current_goal = player_bot_navigation:current_goal()
	local position = POSITION_LOOKUP[unit]
	local position_on_navmesh = self._position_on_navmesh
	local first_person_extension = self._first_person_extension
	local rotation = first_person_extension:current_rotation()
	local camera_position = first_person_extension:current_camera_position()
	local wanted_rotation = nil
	local status_extension = self._status_extension
	local on_ladder, ladder_unit = status_extension:get_is_on_ladder()
	local transition_jump = nil
	local look_at_player_unit = self._look_at_player
	local look_at_player_has_moved = look_at_player_unit and ScriptUnit.extension(look_at_player_unit, "locomotion_system").has_moved_from_start_position
	local cutscene_system = Managers.state.entity:system("cutscene_system")
	local has_intro_cutscene_finished = cutscene_system:has_intro_cutscene_finished_playing()
	local up = Vector3.up()

	if self._bot_in_attract_mode_focus then
		wanted_rotation, transition_jump = self:_update_wanted_rotation_for_attract_mode(dt, rotation, current_goal, on_ladder, ladder_unit, camera_position)
	elseif current_goal and on_ladder then
		local dir = current_goal - position
		local ladder_up = Quaternion.up(Unit.local_rotation(ladder_unit, 0))
		local z = dir.z

		if math.abs(z) < 0.05 then
			wanted_rotation = rotation
		elseif z < 0 then
			wanted_rotation = Quaternion_look(-ladder_up, up)
		else
			wanted_rotation = Quaternion_look(ladder_up, up)
		end
	elseif self._aiming and self._aim_with_rotation then
		wanted_rotation = self._aim_rotation:unbox()
	elseif self._aiming and self._soft_aiming then
		local direction = self._aim_target:unbox() - camera_position
		wanted_rotation = Quaternion.lerp(rotation, Quaternion_look(direction, up), math.min(dt * 5, 1))
	elseif self._aiming then
		wanted_rotation = Quaternion_look(self._aim_target:unbox() - camera_position, up)
	elseif look_at_player_unit and self._game and (has_intro_cutscene_finished or look_at_player_has_moved) and (not current_goal or not player_bot_navigation:is_in_transition()) then
		local unit_id = Managers.state.network:unit_game_object_id(look_at_player_unit)
		local player_camera_position = GameSession.game_object_field(self._game, unit_id, "aim_position")
		local direction = player_camera_position - camera_position
		local look_rotation = Quaternion_look(direction, up)

		if not self._look_at_player_rotation_allowed then
			local unit_rotation = Unit.local_rotation(unit, 0)
			local delta_rotation = Quaternion.multiply(Quaternion.inverse(unit_rotation), look_rotation)
			local max_yaw = math.half_pi - 0.001
			local yaw = math.clamp(Quaternion.yaw(delta_rotation), -max_yaw, max_yaw)
			local pitch = Quaternion.pitch(delta_rotation)
			local yaw_rotation = Quaternion(Vector3.up(), yaw)
			local pitch_rotation = Quaternion(Vector3.right(), pitch)
			look_rotation = Quaternion.multiply(unit_rotation, Quaternion.multiply(yaw_rotation, pitch_rotation))
		end

		wanted_rotation = Quaternion.lerp(rotation, look_rotation, math.min(dt * 5, 1))
	elseif current_goal then
		local dir = current_goal - position_on_navmesh

		if player_bot_navigation:is_in_transition() then
			transition_jump = player_bot_navigation:transition_requires_jump(position_on_navmesh, Vector3.normalize(dir))
			wanted_rotation = Quaternion_look(dir, up)
		else
			wanted_rotation = Quaternion.lerp(rotation, Quaternion_look(dir, up), math.min(dt * 2, 1))
		end
	else
		wanted_rotation = Quaternion.lerp(rotation, Unit.local_rotation(unit, 0), math.min(dt * 2, 1))
	end

	local needed_delta_rotation = Quaternion.multiply(Quaternion.inverse(rotation), wanted_rotation)
	local needed_delta_rotation_forward = Quaternion.forward(needed_delta_rotation)
	local look = self.look
	look.x = math.half_pi - math.atan2(needed_delta_rotation_forward.y, needed_delta_rotation_forward.x)
	look.y = math.asin(math.clamp(needed_delta_rotation_forward.z, -1, 1))
	local goal_vector, flat_goal_vector, goal_direction = nil

	if current_goal then
		goal_vector = current_goal - position_on_navmesh
		flat_goal_vector = Vector3.flat(goal_vector)
		goal_direction = Vector3.normalize(flat_goal_vector)

		if Vector3.length_squared(goal_direction) > 0 and not on_ladder then
			local locomotion_extension = self._locomotion_extension
			local current_velocity = locomotion_extension:current_velocity()
			local current_speed_sq = Vector3.length_squared(current_velocity)
			local is_crouching = status_extension:is_crouching()
			local lower_hit, upper_hit = self:_obstacle_check(position, current_speed_sq, goal_vector, goal_direction, up)

			if (lower_hit and not upper_hit) or transition_jump then
				self._input.jump_only = true
			elseif not lower_hit and upper_hit and (is_crouching or current_speed_sq <= STUCK_CROUCH_SPEED_THRESHOLD_SQ) then
				self._input.crouching = true
			end
		end
	end

	local ai_bot_group_extension = self._ai_bot_group_extension
	local threat_data = ai_bot_group_extension.data.aoe_threat
	local move = self.move

	if on_ladder then
		if current_goal then
			move.x = 0
			move.y = 1
		else
			self._input.jump_only = true
			move.x = 0
			move.y = 0
		end
	elseif t < threat_data.expires then
		local dir = threat_data.escape_direction:unbox()

		self:dodge()

		self._avoiding_aoe_threat = true
		move.x = Vector3.dot(Quaternion.right(wanted_rotation), dir)
		move.y = Vector3.dot(Quaternion.forward(wanted_rotation), dir)
	elseif not current_goal then
		move.x = 0
		move.y = 0
	else
		local is_last_goal = player_bot_navigation:is_following_last_goal()
		local move_scale = 1

		if is_last_goal then
			local goal_dist_sq = Vector3.length_squared(flat_goal_vector)

			if goal_dist_sq < MOVE_SCALE_START_DIST_SQ then
				move_scale = MOVE_SCALE_FACTOR * goal_dist_sq + MOVE_SCALE_MIN
			end
		end

		local flat_right = Vector3.flat(Quaternion.right(wanted_rotation))
		local flat_forward = Vector3.flat(Quaternion.forward(wanted_rotation))
		move.x = move_scale * Vector3.dot(flat_right, goal_direction)
		move.y = move_scale * Vector3.dot(flat_forward, goal_direction)
	end

	if self._avoiding_aoe_threat and threat_data.expires <= t then
		if player_bot_navigation:destination_reached() then
			player_bot_navigation:stop()
		end

		self._avoiding_aoe_threat = false
	end
end

PlayerBotInput.get = function (self, input_key)
	if input_key == "look" then
		return Vector3(self.look.x, self.look.y, 0)
	elseif input_key == "move_controller" then
		return Vector3(self.move.x, self.move.y, 0)
	elseif self._input[input_key] ~= nil then
		return self._input[input_key]
	end
end

PlayerBotInput.set_enabled = function (self, enabled)
	return
end

PlayerBotInput.get_buffer = function (self, input_key)
	return
end

PlayerBotInput.add_buffer = function (self, input_key)
	return
end

PlayerBotInput.reset_input_buffer = function (self, input_key)
	return
end

PlayerBotInput.clear_input_buffer = function (self, input_key)
	return
end

PlayerBotInput.reset_wield_switch_buffer = function (self)
	return
end

PlayerBotInput.set_last_scroll_value = function (self)
	return
end

PlayerBotInput.get_last_scroll_value = function (self)
	return
end

PlayerBotInput.set_input_key_scale = function (self, input_key, scale, lerp_time)
	return
end

PlayerBotInput.move = function (self, vector)
	self.move.x = vector.x
	self.move.y = vector.y
end

PlayerBotInput.look = function (self, vector)
	self.look.x = vector.x
	self.look.y = vector.y
end

PlayerBotInput.move_forward = function (self)
	self.move.x = 0
	self.move.y = 1
end

PlayerBotInput.rotate_right = function (self)
	self.look.x = 0.1
	self.look.y = 0
end

PlayerBotInput.not_moving = function (self)
	return self.move.x == 0 and self.move.y == 0
end

PlayerBotInput.move_towards = function (self, target_position)
	self.target_position = (target_position and Vector3Box(target_position)) or nil
end

PlayerBotInput.get_wield_cooldown = function (self)
	return false
end

PlayerBotInput.add_wield_cooldown = function (self, cooldown_time)
	return
end

PlayerBotInput.released_input = function (self, input)
	return not self._input[input]
end

PlayerBotInput.add_stun_buffer = function (self, input_key)
	return
end

PlayerBotInput.reset_release_input = function (self)
	return true
end

return
