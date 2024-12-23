-- chunkname: @scripts/unit_extensions/default_player_unit/careers/career_ability_rat_ogre_vs.lua

CareerAbilityRatOgreJump = class(CareerAbilityRatOgreJump)

local JUMP_ANGLE = math.degrees_to_radians(75)
local SECTIONS = 8
local ACCEPTABLE_ACCURACY = 0.1
local segment_list = {}

local function get_leap_data(physics_world, own_position, target_position)
	local gravity = -PlayerUnitMovementSettings.gravity_acceleration
	local target_velocity = Vector3.zero()
	local jump_speed, hit_pos = WeaponHelper.speed_to_hit_moving_target(own_position, target_position, JUMP_ANGLE, target_velocity, gravity, ACCEPTABLE_ACCURACY)
	local in_los, velocity, _ = WeaponHelper.test_angled_trajectory(physics_world, own_position, target_position, -gravity, jump_speed, JUMP_ANGLE, segment_list, SECTIONS, nil, true)

	fassert(in_los, "no landing location for leap")

	local direction = Vector3.normalize(velocity)

	return direction, jump_speed, hit_pos
end

CareerAbilityRatOgreJump.init = function (self, extension_init_context, unit, extension_init_data)
	self._owner_unit = unit
	self._world = extension_init_context.world
	self._wwise_world = Managers.world:wwise_world(self._world)

	local player = extension_init_data.player

	self._player = player
	self._is_server = player.is_server
	self._local_player = player.local_player
	self._bot_player = player.bot_player
	self._network_manager = Managers.state.network
	self._input_manager = Managers.input
	self._indicator_fx_unit_name = "fx/units/aoe_globadier"
	self._indicator_unit = nil
	self._is_priming = false
	self._last_valid_landing_position = nil
	self.stored_valid_pos = false
	self._buff_data = {}
end

CareerAbilityRatOgreJump.extensions_ready = function (self, world, unit)
	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self._status_extension = ScriptUnit.extension(unit, "status_system")
	self._career_extension = ScriptUnit.extension(unit, "career_system")
	self._ability_id = self._career_extension:ability_id("ogre_jump")
	self._ability_data = self._career_extension:get_activated_ability_data(self._ability_id)
	self._passive_ability_extension = self._career_extension:get_passive_ability()
	self._ability_input = self._ability_data.input_action
	self._jump_data = self._ability_data.jump_ability_data
	self._prime_time = self._ability_data.prime_time
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")
	self._locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
	self._input_extension = ScriptUnit.has_extension(unit, "input_system")
	self._inventory_extension = ScriptUnit.extension(unit, "inventory_system")
	self._ghost_mode_extension = ScriptUnit.extension(unit, "ghost_mode_system")
	self._breed = Unit.get_data(unit, "breed")

	if self._first_person_extension then
		self._first_person_unit = self._first_person_extension:get_first_person_unit()
	end
end

CareerAbilityRatOgreJump.was_triggered = function (self)
	local input_extension = self._input_extension

	if not input_extension then
		return false
	end

	if not self._is_priming then
		if not self:_ability_available() then
			return false
		end

		if input_extension:get(self._ability_input) and not self._ghost_mode_extension:is_in_ghost_mode() then
			self:_start()

			return true
		end
	end

	return false
end

CareerAbilityRatOgreJump._ability_available = function (self)
	local ghost_mode_extenstion = ScriptUnit.has_extension(self._owner_unit, "ghost_mode_system")
	local is_in_ghost_mode = ghost_mode_extenstion:is_in_ghost_mode()
	local career_extension = self._career_extension
	local status_extension = self._status_extension
	local locomotion_extension = self._locomotion_extension
	local can_use_ability = career_extension:can_use_activated_ability()
	local is_disabled = status_extension:is_disabled()
	local is_grounded = locomotion_extension:is_on_ground()
	local ability_available = not is_in_ghost_mode and can_use_ability and not is_disabled and is_grounded

	return ability_available
end

CareerAbilityRatOgreJump.destroy = function (self)
	if self._local_player then
		self._first_person_extension:play_hud_sound_event("Stop_vs_rat_ogre_jump_charge_vce_1p")
		self._first_person_extension:play_remote_unit_sound_event("Stop_vs_rat_ogre_jump_charge_vce_3p", self._owner_unit, 0)
	end
end

CareerAbilityRatOgreJump._start = function (self)
	local _, right_hand_weapon_extension, _ = CharacterStateHelper.get_item_data_and_weapon_extensions(self._inventory_extension)

	if right_hand_weapon_extension then
		right_hand_weapon_extension:stop_action("interrupted")
	end

	self._jump_data = self._career_extension:get_activated_ability_data(self._ability_id).jump_ability_data

	self:_start_calculate_leap_position()

	self._priming_charged = Managers.time:time("game") + self._prime_time

	if self._jump_data.priming_buffs then
		self:_add_ability_buffs(self._jump_data.priming_buffs)
	end

	if self._local_player then
		self._first_person_extension:play_hud_sound_event("Play_vs_rat_ogre_jump_charge_vce_1p")
		self._first_person_extension:play_remote_unit_sound_event("Play_vs_rat_ogre_jump_charge_vce_3p", self._owner_unit, 0)
	end

	self._first_person_extension:play_animation_event("attack_jump")
	CharacterStateHelper.play_animation_event(self._owner_unit, "attack_jump")
end

CareerAbilityRatOgreJump._add_ability_buffs = function (self, priming_buffs)
	for i = 1, #priming_buffs do
		local buff = priming_buffs[i]
		local buff_template = buff and buff.buff_template

		assert(buff_template, "need a buff_template to add a buff")

		local params = {}

		params.external_optional_multiplier = buff and buff.external_optional_multiplier

		local id, sub_buffs_added, first_buff = self._buff_extension:add_buff(buff_template, params)

		self._buff_data[#self._buff_data + 1] = {
			id,
			sub_buffs_added,
			first_buff,
		}
	end
end

CareerAbilityRatOgreJump._remove_ability_buffs = function (self)
	if not self._buff_data then
		return
	end

	for i = #self._buff_data, 1, -1 do
		local id = self._buff_data[i][1]

		self._buff_extension:remove_buff(id, true)
		table.swap_delete(self._buff_data, i)
	end
end

CareerAbilityRatOgreJump._update_priming = function (self, unit, input, dt, context, t)
	if t > self._priming_charged and not self._done_priming then
		self._done_priming = true

		local player = Managers.player:owner(unit)

		if player.local_player then
			self._first_person_extension:play_hud_sound_event("Play_vs_rat_ogre_jump_charge_complete")
		end
	else
		local time_past = math.min(self._prime_time - (self._priming_charged - t), self._prime_time)
		local time_fraction = time_past / self._prime_time

		self:_set_priming_progress(time_fraction)
	end
end

CareerAbilityRatOgreJump.update = function (self, unit, input, dt, context, t)
	local input_extension = self._input_extension

	if not input_extension then
		return
	end

	local was_triggered = self:was_triggered()
	local is_staggered = CharacterStateHelper.is_staggered(self._status_extension)

	if is_staggered and self._is_priming then
		self._career_extension:stop_ability("staggered")

		return
	end

	if self._is_priming then
		local cancel_input = input_extension:get("action_one") or input_extension:get("jump") or input_extension:get("jump_only") or input_extension:get("weapon_reload") or input_extension:get("action_two_release") and not self._done_priming or not input_extension:get("action_two_hold") and not self._done_priming or self._status_extension:is_climbing()

		if cancel_input then
			self._career_extension:stop_ability("aborted")
			self._career_extension:start_activated_ability_cooldown(self._ability_id, 1)
			self._network_manager:anim_event(unit, "interrupt")
			CharacterStateHelper.play_animation_event_first_person(self._first_person_extension, "interrupt")

			return
		end

		self:_update_priming(unit, input, dt, context, t)

		local result, new_landing_position, leap_distance = self:_calculate_leap_position()

		if result and new_landing_position then
			local current_position = POSITION_LOOKUP[unit]
			local min_jump_dist = self._jump_data.min_jump_dist
			local initial_priming = not self._last_valid_landing_position

			if not self.stored_valid_pos and min_jump_dist <= leap_distance then
				self.stored_valid_pos = true
			end

			local initial_min_dist_not_fulfilled = self._last_valid_landing_position and not self.stored_valid_pos
			local requirement_fullfilled = self._last_valid_landing_position and min_jump_dist <= leap_distance

			if initial_priming then
				self._last_valid_landing_position = Vector3Box(new_landing_position)

				self:_handel_hit_indicator(new_landing_position)
			elseif requirement_fullfilled then
				self._last_valid_landing_position:store(new_landing_position)
				self:_handel_hit_indicator(new_landing_position)
			elseif not self.stored_valid_pos and initial_min_dist_not_fulfilled then
				self._last_valid_landing_position:store(new_landing_position)
				self:_handel_hit_indicator(new_landing_position)
			end
		end

		if not self._last_valid_landing_position then
			self._career_extension:stop_ability("aborted")

			return
		end

		local released_input = input_extension:get("action_two_release")

		if released_input and self._done_priming then
			if result and self._last_valid_landing_position then
				self:_set_priming_progress(0)
				self:_do_leap()
			else
				self:_stop_priming()
			end
		end
	end
end

CareerAbilityRatOgreJump.stop = function (self, reason)
	if self._is_priming then
		self:_stop_priming()
	end

	if reason == "aborted" then
		self._network_manager:anim_event(self._owner_unit, "cancel_priming")
	end

	if reason == "staggered" then
		self._career_extension:start_activated_ability_cooldown(self._ability_id, 1)
	end

	self:stop_passive_ability()

	local _, right_hand_weapon_extension, _ = CharacterStateHelper.get_item_data_and_weapon_extensions(self._inventory_extension)

	if right_hand_weapon_extension then
		right_hand_weapon_extension:stop_action("interrupted")
	end
end

CareerAbilityRatOgreJump._start_calculate_leap_position = function (self)
	self._last_valid_landing_position = nil
	self._done_priming = false
	self._is_priming = true
	self._ability_data.is_priming = true
end

CareerAbilityRatOgreJump._destroy_indicator_unit = function (self)
	if Unit.alive(self._indicator_unit) then
		World.destroy_unit(self._world, self._indicator_unit)

		self._indicator_unit = nil
	end
end

CareerAbilityRatOgreJump._handel_hit_indicator = function (self, new_landing_position)
	local unit_name = self._indicator_fx_unit_name

	if new_landing_position then
		if self._indicator_unit then
			Unit.set_local_position(self._indicator_unit, 0, new_landing_position)
		else
			self._indicator_unit = World.spawn_unit(self._world, unit_name, new_landing_position)

			local radius = self._jump_data.hit_indicator_raidus

			Unit.set_local_scale(self._indicator_unit, 0, Vector3(radius, radius, radius))
		end
	else
		self:_destroy_indicator_unit()
	end
end

CareerAbilityRatOgreJump._calculate_leap_position = function (self)
	local world = self._world
	local physics_world = World.get_data(world, "physics_world")
	local first_person_extension = self._first_person_extension
	local player_position = first_person_extension:current_position()
	local player_rotation = first_person_extension:current_rotation()
	local min_pitch = math.degrees_to_radians(self._jump_data.min_pitch)
	local max_pitch = math.degrees_to_radians(self._jump_data.max_pitch)
	local yaw = Quaternion.yaw(player_rotation)
	local pitch = math.clamp(Quaternion.pitch(player_rotation), -min_pitch, max_pitch)
	local yaw_rotation = Quaternion(Vector3.up(), yaw)
	local pitch_rotation = Quaternion(Vector3.right(), pitch)
	local raycast_rotation = Quaternion.multiply(yaw_rotation, pitch_rotation)
	local raycast_direction = Quaternion.forward(raycast_rotation)
	local speed = self._jump_data.movement_settings.jump_speed
	local initial_jump_vector = Vector3.up() * 0.3
	local velocity = (initial_jump_vector + raycast_direction) * speed
	local gravity = Vector3(0, 0, -11)
	local collision_filter = "filter_slayer_leap"
	local result, new_landing_position = self:get_landing_position(physics_world, self._owner_unit, player_position, velocity, gravity, collision_filter)
	local leap_distance

	if result then
		leap_distance = Vector3.length(new_landing_position - player_position)
	end

	return result, new_landing_position, leap_distance
end

CareerAbilityRatOgreJump._stop_priming = function (self)
	self:_destroy_indicator_unit()
	self:_set_priming_progress(0)

	if self._local_player then
		self._first_person_extension:play_hud_sound_event("Stop_vs_rat_ogre_jump_charge_vce_1p")
		self._first_person_extension:play_remote_unit_sound_event("Stop_vs_rat_ogre_jump_charge_vce_3p", self._owner_unit, 0)
	end

	self._is_priming = false
	self._ability_data.is_priming = false
	self._last_valid_landing_position = nil

	self:_remove_ability_buffs()

	self.stored_valid_pos = false
end

CareerAbilityRatOgreJump._do_common_stuff = function (self)
	local owner_unit = self._owner_unit
	local is_server = self._is_server
	local local_player = self._local_player
	local bot_player = self._bot_player
	local career_extension = self._career_extension

	if is_server and bot_player or local_player then
		local first_person_extension = self._first_person_extension

		first_person_extension:play_hud_sound_event("Play_vs_rat_ogre_jump_1p")
		first_person_extension:play_remote_unit_sound_event("Play_vs_rat_ogre_jump_3p", owner_unit, 0)
	end

	career_extension:start_activated_ability_cooldown(self._ability_id)
end

CareerAbilityRatOgreJump._do_leap = function (self)
	local landing_position = self._last_valid_landing_position:unbox()

	self:_stop_priming()

	if not self._locomotion_extension:is_on_ground() then
		return
	end

	self:_do_common_stuff()

	local world = self._world
	local owner_unit = self._owner_unit
	local status_extension = self._status_extension
	local locomotion_extension = self._locomotion_extension

	locomotion_extension:set_external_velocity_enabled(false)
	status_extension:reset_move_speed_multiplier()

	local physics_world = World.get_data(world, "physics_world")
	local current_position = POSITION_LOOKUP[owner_unit]
	local direction, speed, hit_pos = get_leap_data(physics_world, current_position, landing_position)
	local distance = Vector3.distance(current_position, landing_position)
	local ability_lerp_data = self._jump_data.lerp_data
	local movement_settings = self._jump_data.movement_settings
	local zero_dist = ability_lerp_data and ability_lerp_data.zero_distance
	local start_accel_dist = ability_lerp_data and ability_lerp_data.start_accel_distance
	local end_accel_dist = ability_lerp_data and ability_lerp_data.end_accel_distance
	local glide_dist = ability_lerp_data and ability_lerp_data.glide_distance
	local slow_dist = ability_lerp_data and ability_lerp_data.slow_distance
	local full_dist = ability_lerp_data and ability_lerp_data.full_distance
	local jump_speed = movement_settings and movement_settings.jump_speed

	speed = jump_speed
	status_extension.do_leap = {
		camera_effect_sequence_land = "landed_leap",
		camera_effect_sequence_start = "jump",
		move_function = "leap",
		direction = Vector3Box(direction),
		speed = speed,
		projected_hit_pos = Vector3Box(hit_pos),
		lerp_data = {
			zero_distance = zero_dist or 0,
			start_accel_distance = start_accel_dist or 0.1,
			end_accel_distance = end_accel_dist or 0.2,
			glide_distance = glide_dist or 0.5,
			slow_distance = slow_dist or 0.7,
			full_distance = full_dist or 1,
		},
		movement_settings = movement_settings,
		leap_events = {
			start = function (parent, unit)
				local buff_system = Managers.state.entity:system("buff_system")

				parent._start_leap_buff_id = buff_system:add_buff_synced(unit, "vs_rat_ogre_start_leap_stagger_immune", BuffSyncType.ClientAndServer, nil, Network.peer_id())

				if not parent._screenspace_effect_id then
					local jump_distance = parent._leap_data.total_distance
					local max_value_distance = 50
					local t_value = math.inv_lerp_clamped(0, max_value_distance, jump_distance)
					local vfx = "fx/speedlines_01_1p"

					parent._screenspace_effect_id = parent._first_person_extension:create_screen_particles(vfx)

					ScriptWorld.set_material_variable_for_particles(world, parent._screenspace_effect_id, "distort_burst", "distortion_strength", t_value)
					ScriptWorld.set_material_variable_for_particles(world, parent._screenspace_effect_id, "distort_loop", "distortion_strength", t_value)
				end
			end,
			finished = function (parent, unit, aborted, final_position)
				local buff_system = Managers.state.entity:system("buff_system")

				buff_system:remove_buff_synced(unit, parent._start_leap_buff_id)
				buff_system:add_buff_synced(unit, "vs_rat_ogre_finish_leap_stagger_immune", BuffSyncType.ClientAndServer, nil, Network.peer_id())

				if parent._screenspace_effect_id then
					World.destroy_particles(parent._world, parent._screenspace_effect_id)

					parent._screenspace_effect_id = nil
				end

				if not aborted then
					if parent._leap_data.anim_finish_event_1p then
						CharacterStateHelper.play_animation_event_first_person(parent._first_person_extension, parent._leap_data.anim_finish_event_1p)
					end

					if parent._leap_data.anim_finish_event_3p then
						CharacterStateHelper.play_animation_event(unit, parent._leap_data.anim_finish_event_3p)
					end

					local rotation = Quaternion.identity()
					local explosion_template = "vs_rat_ogre_leap_landing"
					local scale = 1
					local career_power_level = 50
					local area_damage_system = Managers.state.entity:system("area_damage_system")

					area_damage_system:create_explosion(unit, final_position, rotation, explosion_template, scale, "vs_rat_ogre_hands", career_power_level, false)
				end

				local _, right_hand_weapon_extension, _ = CharacterStateHelper.get_item_data_and_weapon_extensions(parent._inventory_extension)

				right_hand_weapon_extension:stop_action("interrupted")
				self._career_extension:stop_ability()
			end,
		},
	}

	self._passive_ability_extension:start_leap(current_position, landing_position, distance)
end

CareerAbilityRatOgreJump.stop_passive_ability = function (self)
	self._passive_ability_extension:stop_leap()
end

CareerAbilityRatOgreJump._play_vo = function (self)
	local owner_unit = self._owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)
end

local GROUND_TARGET_MAX_STEPS = 30
local GROUND_TARGET_MAX_TIME = 3
local EPSILON = 0.0001
local MAX_HITS = 10

CareerAbilityRatOgreJump.get_landing_position = function (self, physics_world, fitting_unit, origin, velocity, gravity, collision_filter)
	local time_step = GROUND_TARGET_MAX_TIME / GROUND_TARGET_MAX_STEPS
	local position = origin
	local mover = Unit.mover(fitting_unit)
	local mover_raidus = Mover.radius(mover)
	local unit_fit_offset_vector = Vector3(0, 0, 0.1)

	for i = 1, GROUND_TARGET_MAX_STEPS do
		local new_position = position + velocity * time_step
		local delta = new_position - position
		local direction = Vector3.normalize(delta)
		local distance = Vector3.length(delta)
		local result = PhysicsWorld.linear_sphere_sweep(physics_world, position, new_position, mover_raidus, MAX_HITS, "collision_filter", collision_filter)

		if result then
			local hit = result[1]
			local hit_position = hit.position
			local hit_normal = hit.normal
			local good_landing = true
			local hit_wall = Vector3.dot(hit_normal, Vector3.up()) < 0.95

			if not hit_wall then
				local fits_at_landing_pos, fitted_position = Unit.mover_fits_at(fitting_unit, "standing", hit_position + unit_fit_offset_vector, 1)

				if fits_at_landing_pos then
					hit_position = fitted_position
				else
					good_landing = false
				end
			end

			if hit_wall or not good_landing then
				local flat_velocity = Vector3.length(Vector3.flat(velocity))

				for j = 1, GROUND_TARGET_MAX_STEPS do
					local step_back_distance = j == 1 and 0.5 or 1
					local step_back_t = flat_velocity <= EPSILON and 0 or step_back_distance / flat_velocity
					local step_back_position

					if step_back_t > 0 then
						step_back_position = hit_position - velocity * step_back_t - gravity * (step_back_t * step_back_t * 0.5)
					else
						step_back_position = origin
					end

					local new_result, new_hit_position, _, _, _ = PhysicsWorld.immediate_raycast(physics_world, step_back_position, Vector3.down(), 10, "closest", "collision_filter", collision_filter)

					if new_result then
						local fits_at_landing_pos, fitted_position = Unit.mover_fits_at(fitting_unit, "standing", new_hit_position + unit_fit_offset_vector, 1)

						if fits_at_landing_pos then
							new_hit_position = fitted_position

							return true, new_hit_position
						else
							hit_position = step_back_position
						end
					end
				end
			end

			return true, hit_position
		end

		velocity = velocity + gravity * time_step
		position = new_position
	end

	return false, position
end

CareerAbilityRatOgreJump._set_priming_progress = function (self, time_fraction)
	local ability_data = self._career_extension:get_activated_ability_data(self._ability_id)

	ability_data.priming_progress = time_fraction
end
