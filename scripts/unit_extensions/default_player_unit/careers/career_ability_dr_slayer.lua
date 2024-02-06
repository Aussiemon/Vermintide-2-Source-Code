-- chunkname: @scripts/unit_extensions/default_player_unit/careers/career_ability_dr_slayer.lua

CareerAbilityDRSlayer = class(CareerAbilityDRSlayer)

local MIN_DISTANCE_FOR_LEAP = 2
local segment_list = {}

local function get_leap_data(physics_world, own_position, target_position)
	local gravity = -PlayerUnitMovementSettings.gravity_acceleration
	local jump_angle = math.degrees_to_radians(45)
	local sections = 8
	local target_velocity = Vector3.zero()
	local acceptable_accuracy = 0.1
	local jump_speed, hit_pos = WeaponHelper.speed_to_hit_moving_target(own_position, target_position, jump_angle, target_velocity, gravity, acceptable_accuracy)
	local in_los, velocity, _ = WeaponHelper.test_angled_trajectory(physics_world, own_position, target_position, -gravity, jump_speed, jump_angle, segment_list, sections, nil, true)

	fassert(in_los, "no landing location for leap")

	local direction = Vector3.normalize(velocity)

	return direction, jump_speed, hit_pos
end

CareerAbilityDRSlayer.init = function (self, extension_init_context, unit, extension_init_data)
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
	self._effect_name = "fx/chr_slayer_jump"
	self._effect_id = nil
	self._is_priming = false
	self._last_valid_landing_position = nil
end

CareerAbilityDRSlayer.extensions_ready = function (self, world, unit)
	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self._status_extension = ScriptUnit.extension(unit, "status_system")
	self._career_extension = ScriptUnit.extension(unit, "career_system")
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")
	self._locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
	self._input_extension = ScriptUnit.has_extension(unit, "input_system")
	self._talent_extension = ScriptUnit.has_extension(unit, "talent_system")

	if self._first_person_extension then
		self._first_person_unit = self._first_person_extension:get_first_person_unit()
	end
end

CareerAbilityDRSlayer.destroy = function (self)
	return
end

CareerAbilityDRSlayer.update = function (self, unit, input, dt, context, t)
	local input_extension = self._input_extension

	if not input_extension then
		return
	end

	if not self._is_priming then
		if not self:_ability_available() then
			return
		end

		if input_extension:get("action_career") then
			self:_start_priming()
		end
	elseif self._is_priming then
		local result, new_landing_position, leap_distance = self:_update_priming()

		if input_extension:get("action_two") or input_extension:get("jump") or input_extension:get("jump_only") then
			self:_stop_priming()

			return
		end

		if input_extension:get("weapon_reload") then
			self:_stop_priming()

			return
		end

		if result and new_landing_position then
			if self._last_valid_landing_position then
				self._last_valid_landing_position:store(new_landing_position)
			else
				self._last_valid_landing_position = Vector3Box(new_landing_position)
			end
		end

		if not self._last_valid_landing_position then
			self:_stop_priming()

			return
		end

		local released_input = not input_extension:get("action_career_hold")

		if released_input then
			if result and self._last_valid_landing_position then
				if leap_distance <= MIN_DISTANCE_FOR_LEAP then
					self:_do_stomp(t)
				else
					self:_do_leap()
				end
			else
				self:_stop_priming()
			end
		end
	end
end

CareerAbilityDRSlayer.stop = function (self, reason)
	if reason ~= "pushed" and reason ~= "stunned" and self._is_priming then
		self:_stop_priming()
	end
end

CareerAbilityDRSlayer._ability_available = function (self)
	local career_extension = self._career_extension
	local status_extension = self._status_extension
	local locomotion_extension = self._locomotion_extension

	return career_extension:can_use_activated_ability() and not status_extension:is_disabled() and locomotion_extension:is_on_ground()
end

CareerAbilityDRSlayer._start_priming = function (self)
	if self._local_player then
		local world = self._world
		local effect_name = self._effect_name

		self._effect_id = World.create_particles(world, effect_name, Vector3.zero())
	end

	self._last_valid_landing_position = nil
	self._is_priming = true
end

CareerAbilityDRSlayer._update_priming = function (self)
	local effect_id = self._effect_id
	local world = self._world
	local physics_world = World.get_data(world, "physics_world")
	local first_person_extension = self._first_person_extension
	local talent_extension = self._talent_extension
	local player_position = first_person_extension:current_position()
	local player_rotation = first_person_extension:current_rotation()
	local collision_filter = "filter_slayer_leap"
	local min_pitch = math.degrees_to_radians(45)
	local max_pitch = math.degrees_to_radians(12.5)
	local yaw = Quaternion.yaw(player_rotation)
	local pitch = math.clamp(Quaternion.pitch(player_rotation), -min_pitch, max_pitch)
	local yaw_rotation = Quaternion(Vector3.up(), yaw)
	local pitch_rotation = Quaternion(Vector3.right(), pitch)
	local raycast_rotation = Quaternion.multiply(yaw_rotation, pitch_rotation)
	local raycast_direction = Quaternion.forward(raycast_rotation)
	local speed = 11

	if talent_extension:has_talent("bardin_slayer_activated_ability_leap_range") then
		speed = 17
	end

	local velocity = raycast_direction * speed
	local gravity = Vector3(0, 0, -11)
	local result, new_landing_position = WeaponHelper:ground_target(physics_world, self._owner_unit, player_position, velocity, gravity, collision_filter)
	local leap_distance

	if result then
		leap_distance = Vector3.length(new_landing_position - player_position)

		if effect_id and new_landing_position then
			World.move_particles(world, effect_id, new_landing_position)
		end
	else
		new_landing_position = nil
	end

	return result, new_landing_position, leap_distance
end

CareerAbilityDRSlayer._stop_priming = function (self)
	if self._effect_id then
		World.destroy_particles(self._world, self._effect_id)

		self._effect_id = nil
	end

	self._is_priming = false
	self._last_valid_landing_position = nil
end

CareerAbilityDRSlayer._do_common_stuff = function (self)
	local owner_unit = self._owner_unit
	local is_server = self._is_server
	local local_player = self._local_player
	local bot_player = self._bot_player
	local network_manager = self._network_manager
	local network_transmit = network_manager.network_transmit
	local career_extension = self._career_extension
	local talent_extension = self._talent_extension
	local buffs = {
		"bardin_slayer_activated_ability",
	}

	if talent_extension:has_talent("bardin_slayer_activated_ability_movement") then
		buffs[#buffs + 1] = "bardin_slayer_activated_ability_movement"
	end

	local unit_object_id = network_manager:unit_game_object_id(owner_unit)

	if is_server then
		local buff_extension = self._buff_extension

		for i = 1, #buffs do
			local buff_name = buffs[i]
			local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

			buff_extension:add_buff(buff_name, {
				attacker_unit = owner_unit,
			})
			network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
		end
	else
		for i = 1, #buffs do
			local buff_name = buffs[i]
			local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

			network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
		end
	end

	if is_server and bot_player or local_player then
		local first_person_extension = self._first_person_extension

		first_person_extension:play_hud_sound_event("Play_career_ability_bardin_slayer_enter")
		first_person_extension:play_remote_unit_sound_event("Play_career_ability_bardin_slayer_enter", owner_unit, 0)
		first_person_extension:play_hud_sound_event("Play_career_ability_bardin_slayer_loop")

		if local_player then
			career_extension:set_state("bardin_activate_slayer")

			MOOD_BLACKBOARD.skill_slayer = true
		end
	end

	career_extension:start_activated_ability_cooldown()
	self:_play_vo()
end

CareerAbilityDRSlayer._do_stomp = function (self, t)
	self:_stop_priming()

	if not self._locomotion_extension:is_on_ground() then
		return
	end

	self:_do_common_stuff()

	local owner_unit = self._owner_unit
	local local_player = self._local_player
	local career_extension = self._career_extension
	local talent_extension = self._talent_extension
	local has_impact_damage_buff = talent_extension:has_talent("bardin_slayer_activated_ability_impact_damage")
	local position = POSITION_LOOKUP[owner_unit]
	local rotation = Quaternion.identity()
	local explosion_template = has_impact_damage_buff and "bardin_slayer_activated_ability_landing_stagger_impact" or "bardin_slayer_activated_ability_landing_stagger"
	local scale = 1
	local career_power_level = career_extension:get_career_power_level() * (has_impact_damage_buff and 2 or 1)
	local area_damage_system = Managers.state.entity:system("area_damage_system")

	area_damage_system:create_explosion(owner_unit, position, rotation, explosion_template, scale, "career_ability", career_power_level, false)

	if local_player then
		local first_person_extension = self._first_person_extension

		first_person_extension:play_unit_sound_event("Play_career_ability_bardin_slayer_impact", owner_unit, 0, true)
		first_person_extension:play_camera_effect_sequence("leap_stomp", t)
	end
end

CareerAbilityDRSlayer._do_leap = function (self)
	local landing_position = self._last_valid_landing_position:unbox()

	self:_stop_priming()

	if not self._locomotion_extension:is_on_ground() then
		return
	end

	self:_do_common_stuff()

	local world = self._world
	local owner_unit = self._owner_unit
	local local_player = self._local_player
	local network_manager = self._network_manager
	local network_transmit = network_manager.network_transmit
	local status_extension = self._status_extension
	local career_extension = self._career_extension
	local talent_extension = self._talent_extension
	local locomotion_extension = self._locomotion_extension

	locomotion_extension:set_external_velocity_enabled(false)
	status_extension:reset_move_speed_multiplier()
	status_extension:set_noclip(true, "skill_slayer")

	if Managers.state.network:game() then
		status_extension:set_is_dodging(true)

		local unit_id = network_manager:unit_game_object_id(owner_unit)

		network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.dodging, true, unit_id, 0)
	end

	local physics_world = World.get_data(world, "physics_world")
	local direction, speed, hit_pos = get_leap_data(physics_world, POSITION_LOOKUP[owner_unit], landing_position)
	local distance = Vector3.distance(POSITION_LOOKUP[owner_unit], landing_position)
	local vertical_speed_modifier = math.clamp(distance / 10, 0, 1)
	local has_impact_damage_buff = talent_extension:has_talent("bardin_slayer_activated_ability_impact_damage")

	status_extension.do_leap = {
		anim_start_event_1p = "slayer_jump_ability",
		anim_start_event_3p = "jump_fwd",
		camera_effect_sequence_land = "landed_leap",
		camera_effect_sequence_start = "jump",
		move_function = "leap",
		direction = Vector3Box(direction),
		speed = speed,
		initial_vertical_speed = PlayerUnitMovementSettings.leap.jump_speed * vertical_speed_modifier,
		projected_hit_pos = Vector3Box(hit_pos),
		sfx_event_jump = local_player and "Play_career_ability_bardin_slayer_jump",
		sfx_event_land = local_player and "Play_career_ability_bardin_slayer_impact",
		leap_events = {
			start = function (this)
				local unit_3p = this.unit
				local buff_extension = ScriptUnit.has_extension(unit_3p, "buff_system")

				self._uninterruptible_buff_id = buff_extension:add_buff("bardin_slayer_passive_uninterruptible_leap")
			end,
			finished = function (this, aborted, final_position)
				local unit_3p = this.unit
				local player = this.player

				if not aborted then
					local rotation = Quaternion.identity()
					local explosion_template = has_impact_damage_buff and "bardin_slayer_activated_ability_landing_stagger_impact" or "bardin_slayer_activated_ability_landing_stagger"
					local scale = 1
					local career_power_level = career_extension:get_career_power_level() * (has_impact_damage_buff and 2 or 1)
					local area_damage_system = Managers.state.entity:system("area_damage_system")

					area_damage_system:create_explosion(unit_3p, final_position, rotation, explosion_template, scale, "career_ability", career_power_level, false)
				end

				ScriptUnit.extension(unit_3p, "status_system"):set_noclip(false, "skill_slayer")

				local game = Managers.state.network:game()

				if player and not player.remote and game then
					local status_ext = ScriptUnit.extension(unit_3p, "status_system")

					status_ext:set_is_dodging(false)

					local unit_id = network_manager:unit_game_object_id(unit_3p)

					network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.dodging, false, unit_id, 0)
				end

				local buff_extension = ScriptUnit.has_extension(unit_3p, "buff_system")

				if self._uninterruptible_buff_id then
					buff_extension:remove_buff(self._uninterruptible_buff_id)

					self._uninterruptible_buff_id = nil
				end
			end,
		},
	}
end

CareerAbilityDRSlayer._play_vo = function (self)
	local owner_unit = self._owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)
end
