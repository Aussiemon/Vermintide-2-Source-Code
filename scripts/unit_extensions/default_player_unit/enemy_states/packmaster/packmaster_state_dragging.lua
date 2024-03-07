-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/packmaster/packmaster_state_dragging.lua

PackmasterStateDragging = class(PackmasterStateDragging, EnemyCharacterState)

local drag_in_third_person = true
local max_pole_length = 6

PackmasterStateDragging.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "packmaster_dragging")

	local context = character_state_init_context

	self.current_movement_speed_scale = 0
	self.latest_valid_navmesh_position = Vector3Box(math.huge, math.huge, math.huge)
	self.last_input_direction = Vector3Box(0, 0, 0)
	self._hoist_ability_id = self._career_extension:ability_id("hoist")
end

PackmasterStateDragging.on_enter = function (self, unit, input, dt, context, t, previous_state, dragged_unit)
	local unit = self._unit
	local input_extension = self._input_extension
	local first_person_extension = self._first_person_extension
	local status_extension = self._status_extension
	local inventory_extension = self._inventory_extension
	local health_extension = self._health_extension
	local locomotion_extension = self._locomotion_extension
	local current_velocity = locomotion_extension:current_velocity()

	self._enter_time = t
	self._move_input_direction = Vector3Box()

	StatusUtils.set_grabbed_by_pack_master_network("pack_master_pulling", dragged_unit, true, unit)
	status_extension:set_is_packmaster_dragging(dragged_unit)

	self._dragged_unit = dragged_unit

	if drag_in_third_person then
		CharacterStateHelper.change_camera_state(self._player, "follow_third_person")
		self._first_person_extension:set_first_person_mode(false)
	end

	first_person_extension:hide_weapons("catapulted")
	CharacterStateHelper.show_inventory_3p(unit, false, true, Managers.player.is_server, inventory_extension)
	StatusUtils.set_grabbed_by_pack_master_network("pack_master_dragging", dragged_unit, true, unit)

	local player = Managers.player:owner(unit)
	local is_bot = player and player.bot_player

	self.blackboard = BLACKBOARDS[unit]
	self.breed = self.blackboard.breed

	self:set_breed_action("drag")

	if previous_state == "standing" then
		self.current_movement_speed_scale = 0
	elseif not script_data.disable_nice_movement then
		local current_speed = Vector3.length(current_velocity)
		local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)

		self.current_movement_speed_scale = math.min(current_speed / movement_settings_table.move_speed, 1)
	else
		self.current_movement_speed_scale = 1
	end

	if not is_bot then
		local dir = Vector3.normalize(Vector3.flat(current_velocity))
		local look_rot = first_person_extension:current_rotation()
		local x = Vector3.dot(Quaternion.right(look_rot), dir)
		local y = Vector3.dot(Vector3.normalize(Vector3.flat(Quaternion.forward(look_rot))), dir)
		local local_move_vector = Vector3(x, y, 0)

		self.last_input_direction:store(local_move_vector)
	end

	local move_anim_3p, move_anim_1p = self:_get_packmaster_drag_animation()

	self.move_anim_3p = move_anim_3p
	self.move_anim_1p = move_anim_1p

	CharacterStateHelper.play_animation_event(unit, "drag_walk")
	CharacterStateHelper.play_animation_event(unit, move_anim_3p)
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, move_anim_1p)
	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, status_extension, inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, health_extension)
	self._locomotion_extension:enable_rotation_towards_velocity(false)

	self.is_bot = is_bot
	self._next_damage_pulse_time = 0
	self._unhook_on_exit = true
end

PackmasterStateDragging.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local world = self._world
	local unit = self._unit
	local target_unit = self._dragged_unit

	if not HEALTH_ALIVE[target_unit] then
		local params = self._temp_params

		csm:change_state("walking", params)

		return
	end

	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local dragged_unit_inventory_extension = ScriptUnit.extension(target_unit, "inventory_system")
	local equipment = dragged_unit_inventory_extension:equipment()
	local weapon_unit = equipment.right_hand_wielded_unit_3p
	local slot_name = dragged_unit_inventory_extension:get_wielded_slot_name()
	local input_extension = self._input_extension
	local status_extension = self._status_extension
	local first_person_extension = self._first_person_extension
	local locomotion_extension = self._locomotion_extension
	local inventory_extension = self._inventory_extension
	local career_extension = self._career_extension

	if CharacterStateHelper.is_dead(status_extension) then
		csm:change_state("dead")

		return
	end

	local current_movement_speed_scale = self.current_movement_speed_scale
	local CharacterStateHelper = CharacterStateHelper

	if locomotion_extension:is_on_ground() then
		ScriptUnit.extension(unit, "whereabouts_system"):set_is_onground()
	end

	if CharacterStateHelper.is_using_transport(status_extension) then
		csm:change_state("using_transport")

		return
	end

	if CharacterStateHelper.is_pushed(status_extension) then
		status_extension:set_pushed(false)

		local params = movement_settings_table.stun_settings.pushed
		local hit_react_type = status_extension:hit_react_type()

		params.hit_react_type = hit_react_type .. "_push"

		csm:change_state("stunned", params)

		return
	end

	if CharacterStateHelper.is_staggered(status_extension) then
		csm:change_state("staggered")

		return true
	end

	if CharacterStateHelper.is_block_broken(status_extension) then
		status_extension:set_block_broken(false)

		local params = movement_settings_table.stun_settings.parry_broken

		params.hit_react_type = "medium_push"

		csm:change_state("stunned", params)

		return
	end

	if locomotion_extension:is_animation_driven() then
		return
	end

	local gamepad_active = Managers.input:is_device_active("gamepad")
	local is_crouching = status_extension:is_crouching()
	local player = Managers.player:owner(unit)
	local move_input = CharacterStateHelper.get_movement_input(input_extension)
	local is_moving = CharacterStateHelper.has_move_input(input_extension)

	if not self.is_bot then
		local move_acceleration_up_dt = movement_settings_table.move_acceleration_up * dt
		local move_acceleration_down_dt = movement_settings_table.move_acceleration_down * dt

		if is_moving then
			current_movement_speed_scale = math.min(1, current_movement_speed_scale + move_acceleration_up_dt)

			if gamepad_active then
				current_movement_speed_scale = Vector3.length(move_input) * current_movement_speed_scale
			end
		else
			current_movement_speed_scale = math.max(0, current_movement_speed_scale - move_acceleration_down_dt)
		end
	else
		current_movement_speed_scale = is_moving and 1 or 0
	end

	local current_max_move_speed = self:_get_current_drag_speed(t)
	local final_move_speed = current_max_move_speed * current_movement_speed_scale * movement_settings_table.player_speed_scale
	local move_input_direction = Vector3.normalize(move_input)

	if Vector3.length_squared(move_input) == 0 then
		move_input_direction = self.last_input_direction:unbox()
	else
		self.last_input_direction:store(move_input_direction)
	end

	local dragged_unit_pos = POSITION_LOOKUP[target_unit]
	local forward_direction = dragged_unit_pos - POSITION_LOOKUP[unit]

	Vector3.set_z(forward_direction, 0)

	forward_direction = Vector3.normalize(forward_direction)

	local flat_rotation = Quaternion.look(forward_direction, Vector3(0, 0, 1))

	Unit.set_local_rotation(unit, 0, flat_rotation)

	local idle_anim_played = self.move_anim_1p == "idle"

	CharacterStateHelper.packmaster_move_on_ground(t, first_person_extension, input_extension, locomotion_extension, move_input_direction, final_move_speed, unit, self._player, forward_direction, target_unit, idle_anim_played)
	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, status_extension, inventory_extension)

	local move_anim_3p, move_anim_1p = self:_get_packmaster_drag_animation()
	local distance_to_target = Vector3.distance(dragged_unit_pos, POSITION_LOOKUP[unit])
	local network_safe_dist = math.clamp(distance_to_target - 2, -11.9, 11.9)

	Managers.state.network:anim_set_variable_float(unit, "distance_to_target", network_safe_dist)

	if move_anim_3p ~= self.move_anim_3p or move_anim_1p ~= self.move_anim_1p then
		local dragged_unit_inventory_extension = ScriptUnit.extension(target_unit, "inventory_system")
		local slot_name = dragged_unit_inventory_extension:get_wielded_slot_name()
		local equipment = dragged_unit_inventory_extension:equipment()
		local weapon_unit = equipment.right_hand_wielded_unit_3p
		local claw_equipped = weapon_unit and slot_name == "slot_packmaster_claw"

		if move_anim_1p == "idle" and claw_equipped then
			local inventory_system = Managers.state.entity:system("inventory_system")

			inventory_system:weapon_anim_event(target_unit, "attack_grab_idle")
		end

		self.move_anim_3p = move_anim_3p
		self.move_anim_1p = move_anim_1p

		CharacterStateHelper.play_animation_event(unit, "drag_walk")
		CharacterStateHelper.play_animation_event(unit, move_anim_3p)
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, move_anim_1p)
	end

	local current_velocity = locomotion_extension:current_relative_velocity_3p()

	Managers.state.network:anim_set_variable_float(unit, "drag_move_forward", current_velocity.y)
	Managers.state.network:anim_set_variable_float(unit, "drag_move_right", current_velocity.x)

	self.current_movement_speed_scale = current_movement_speed_scale

	local target_unit_status_extension = ScriptUnit.extension(target_unit, "status_system")
	local target_got_pounced = target_unit_status_extension:is_pounced_down()

	if target_got_pounced then
		local params = self._temp_params

		csm:change_state("walking", params)

		return
	end

	if distance_to_target > max_pole_length then
		local params = self._temp_params

		csm:change_state("walking", params)

		return
	end

	if career_extension:ability_was_triggered(self._hoist_ability_id) then
		self._unhook_on_exit = false

		csm:change_state("packmaster_hoisting", target_unit)

		return
	end

	self:update_damage(unit, target_unit, t)
end

PackmasterStateDragging._get_current_drag_speed = function (self, t)
	local initial_speed_boost = self.breed.initial_drag_movement_speed
	local initial_speed_boost_duration = self.breed.initial_drag_movement_speed_duration
	local normal_drag_movement_speed = self.breed.drag_movement_speed
	local time_in_state = t - self._enter_time
	local current_max_move_speed

	if time_in_state < initial_speed_boost_duration then
		current_max_move_speed = initial_speed_boost
	else
		current_max_move_speed = normal_drag_movement_speed
	end

	return current_max_move_speed
end

PackmasterStateDragging.on_exit = function (self, unit, input, dt, context, t, next_state)
	if self._unhook_on_exit then
		self:_release_dragged_target()
	end

	self._locomotion_extension:enable_rotation_towards_velocity(true)
	self:set_breed_action("n/a")
end

PackmasterStateDragging._release_dragged_target = function (self)
	local status_extension = self._status_extension
	local first_person_extension = self._first_person_extension

	if drag_in_third_person then
		CharacterStateHelper.change_camera_state(self._player, "follow")
		first_person_extension:toggle_visibility(CameraTransitionSettings.perspective_transition_time)
	end

	first_person_extension:unhide_weapons("catapulted")
	CharacterStateHelper.show_inventory_3p(self._unit, true, true, Managers.player.is_server, self._inventory_extension)
	status_extension:set_packmaster_released()

	local target_unit = self._dragged_unit

	if target_unit and Unit.alive(target_unit) then
		StatusUtils.set_grabbed_by_pack_master_network("pack_master_unhooked", target_unit, false, self._unit)
	end
end

PackmasterStateDragging.update_damage = function (self, unit, target_unit, t)
	if t > self._next_damage_pulse_time then
		local breed = self.breed
		local damage_amount = breed.dragging_damage_amount
		local hit_zone_name = breed.dragging_hit_zone_name
		local damage_type = breed.dragging_damage_type
		local hit_react_type

		DamageUtils.add_damage_network(target_unit, unit, damage_amount, hit_zone_name, damage_type, nil, Vector3.up(), breed.name, nil, nil, nil, hit_react_type)

		self._next_damage_pulse_time = t + breed.dragging_time_to_damage
	end
end

local EPSILON_MOVEMENT_SPEED_TO_IDLE_ANIM = 0.05

PackmasterStateDragging._get_packmaster_drag_animation = function (self)
	local locomotion_extension = self._locomotion_extension
	local speed = Vector3.length(locomotion_extension:current_velocity())

	if speed < EPSILON_MOVEMENT_SPEED_TO_IDLE_ANIM then
		return "attack_grab_idle", "idle"
	end

	local move_direction = CharacterStateHelper.get_movement_input(self._input_extension)
	local unit = self._unit
	local breed = Unit.get_data(unit, "breed")
	local slowed

	if breed and breed.run_threshold then
		slowed = Vector3.length(Vector3.flat(locomotion_extension:current_velocity())) < breed.run_threshold
	end

	if move_direction.y < 0 then
		return "move_bwd", slowed and "walk_bwd" or "move_bwd"
	end

	return "move_fwd", slowed and "walk_fwd" or "move_fwd"
end
