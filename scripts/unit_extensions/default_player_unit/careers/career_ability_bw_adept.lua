-- chunkname: @scripts/unit_extensions/default_player_unit/careers/career_ability_bw_adept.lua

CareerAbilityBWAdept = class(CareerAbilityBWAdept)

local EPSILON = 0.01
local SEGMENT_LIST = {}

local function get_leap_data(physics_world, own_position, target_position)
	local flat_distance = Vector3.length(Vector3.flat(own_position - target_position))

	if flat_distance < EPSILON then
		return Vector3.zero(), 0, own_position
	end

	local gravity = PlayerUnitMovementSettings.gravity_acceleration
	local jump_angle = math.degrees_to_radians(45)
	local sections = 8
	local target_velocity = Vector3.zero()
	local acceptable_accuracy = 0.1
	local jump_speed, hit_pos = WeaponHelper.speed_to_hit_moving_target(own_position, target_position, jump_angle, target_velocity, gravity, acceptable_accuracy)
	local in_los, velocity, _ = WeaponHelper.test_angled_trajectory(physics_world, own_position, target_position, -gravity, jump_speed, jump_angle, SEGMENT_LIST, sections, nil, true)

	fassert(in_los, "no landing location for leap")

	local direction = Vector3.normalize(velocity)

	return direction, jump_speed, hit_pos
end

CareerAbilityBWAdept.init = function (self, extension_init_context, unit, extension_init_data)
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
	self._effect_name = "fx/wpnfx_staff_geiser_charge"
	self._effect_id = nil
	self._double_ability_buff_id = nil
end

CareerAbilityBWAdept.extensions_ready = function (self, world, unit)
	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self._status_extension = ScriptUnit.extension(unit, "status_system")
	self._career_extension = ScriptUnit.extension(unit, "career_system")
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")
	self._locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
	self._input_extension = ScriptUnit.has_extension(unit, "input_system")
	self._talent_extension = ScriptUnit.has_extension(unit, "talent_system")

	if self._first_person_extension then
		self.first_person_unit = self._first_person_extension:get_first_person_unit()
	end
end

CareerAbilityBWAdept.destroy = function (self)
	return
end

local PROFILER_NAME = "career_ability_bw_adept"

CareerAbilityBWAdept.update = function (self, unit, input, dt, context, t)
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
		local landing_position = self:_update_priming(dt, t)

		if input_extension:get("action_two") or input_extension:get("jump") or input_extension:get("jump_only") then
			self:_stop_priming()

			return
		end

		if input_extension:get("weapon_reload") then
			self:_stop_priming()

			return
		end

		if landing_position then
			if self._last_valid_landing_position then
				self._last_valid_landing_position:store(landing_position)
			else
				self._last_valid_landing_position = Vector3Box(landing_position)
			end
		end

		if not self._last_valid_landing_position then
			self:_stop_priming()

			return
		end

		if self._last_valid_landing_position and not input_extension:get("action_career_hold") then
			self:_run_ability()
		end
	end
end

CareerAbilityBWAdept.stop = function (self, reason)
	if reason ~= "pushed" and reason ~= "stunned" and self._is_priming then
		self:_stop_priming()
	end
end

CareerAbilityBWAdept._ability_available = function (self)
	local career_extension = self._career_extension
	local status_extension = self._status_extension
	local locomotion_extension = self._locomotion_extension
	local can_use = career_extension:can_use_activated_ability()
	local is_disabled = status_extension:is_disabled()
	local is_overcharge_exploding = status_extension:is_overcharge_exploding()
	local is_on_ground = locomotion_extension:is_on_ground()

	return can_use and not is_disabled and not is_overcharge_exploding and is_on_ground
end

CareerAbilityBWAdept._start_priming = function (self)
	if self._local_player then
		local world = self._world
		local effect_name = self._effect_name

		self._effect_id = World.create_particles(world, effect_name, Vector3.zero())
	end

	self._last_valid_landing_position = nil
	self._is_priming = true
end

CareerAbilityBWAdept._update_priming = function (self, dt, t)
	local effect_id = self._effect_id
	local world = self._world
	local physics_world = World.get_data(world, "physics_world")
	local first_person_extension = self._first_person_extension
	local player_position = first_person_extension:current_position()
	local player_rotation = first_person_extension:current_rotation()
	local collision_filter = "filter_adept_teleport"
	local min_pitch = math.degrees_to_radians(45)
	local max_pitch = math.degrees_to_radians(12.5)
	local yaw = Quaternion.yaw(player_rotation)
	local pitch = math.clamp(Quaternion.pitch(player_rotation), -min_pitch, max_pitch)
	local yaw_rotation = Quaternion(Vector3.up(), yaw)
	local pitch_rotation = Quaternion(Vector3.right(), pitch)
	local raycast_rotation = Quaternion.multiply(yaw_rotation, pitch_rotation)
	local raycast_direction = Quaternion.forward(raycast_rotation)
	local talent_extension = ScriptUnit.has_extension(self._owner_unit, "talent_system")
	local speed = 11

	if talent_extension:has_talent("sienna_adept_activated_ability_distance") then
		speed = 17
	end

	local velocity = raycast_direction * speed
	local gravity = Vector3(0, 0, -11)
	local good_landing_position, landing_position = WeaponHelper:ground_target(physics_world, self._owner_unit, player_position, velocity, gravity, collision_filter)

	if not good_landing_position then
		landing_position = nil
	end

	if effect_id and landing_position then
		World.move_particles(world, effect_id, landing_position)
	end

	return landing_position
end

CareerAbilityBWAdept._stop_priming = function (self)
	if self._effect_id then
		World.destroy_particles(self._world, self._effect_id)

		self._effect_id = nil
	end

	self._is_priming = false
	self._last_valid_landing_position = nil
end

CareerAbilityBWAdept._run_ability = function (self)
	local landing_position = self._last_valid_landing_position:unbox()

	self:_stop_priming()

	if not self._locomotion_extension:is_on_ground() then
		return
	end

	local world = self._world
	local owner_unit = self._owner_unit
	local is_server = self._is_server
	local local_player = self._local_player
	local bot_player = self._bot_player
	local network_transmit = self._network_manager.network_transmit
	local career_extension = self._career_extension
	local status_extension = self._status_extension
	local talent_extension = self._talent_extension
	local locomotion_extension = self._locomotion_extension
	local physics_world = World.get_data(world, "physics_world")
	local direction, speed, hit_pos = get_leap_data(physics_world, POSITION_LOOKUP[owner_unit], landing_position)

	if (local_player or is_server and bot_player) and not talent_extension:has_talent("sienna_adept_activated_ability_explosion") then
		local nav_world = Managers.state.entity:system("ai_system"):nav_world()
		local unit_pos = POSITION_LOOKUP[owner_unit]
		local above = 2
		local below = 30
		local projected_start_pos = LocomotionUtils.pos_on_mesh(nav_world, unit_pos, above, below)

		projected_start_pos = projected_start_pos or GwNavQueries.inside_position_from_outside_position(nav_world, unit_pos, above, below, 2, 0.5)

		if projected_start_pos then
			local damage_wave_template_name = "sienna_adept_ability_trail"
			local damage_wave_template_id = NetworkLookup.damage_wave_templates[damage_wave_template_name]
			local network_manager = self._network_manager
			local source_unit_id = network_manager:unit_game_object_id(owner_unit)

			network_manager.network_transmit:send_rpc_server("rpc_create_damage_wave", source_unit_id, projected_start_pos, hit_pos, damage_wave_template_id)
		end
	end

	if local_player then
		local first_person_extension = self._first_person_extension

		first_person_extension:animation_event("battle_wizard_active_ability_blink")
		career_extension:set_state("sienna_activate_adept")

		MOOD_BLACKBOARD.skill_adept = true
	end

	locomotion_extension:set_external_velocity_enabled(false)
	status_extension:reset_move_speed_multiplier()
	status_extension:set_noclip(true, "skill_adept")

	if Managers.state.network:game() then
		status_extension:set_is_dodging(true)

		local unit_id = Managers.state.network:unit_game_object_id(owner_unit)

		network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.dodging, true, unit_id, 0)
	end

	status_extension.do_leap = {
		move_function = "teleleap",
		direction = Vector3Box(direction),
		speed = speed,
		initial_vertical_speed = PlayerUnitMovementSettings.teleleap.jump_speed,
		projected_hit_pos = Vector3Box(hit_pos),
		sfx_event_jump = local_player and "Play_career_ability_bardin_slayer_jump",
		sfx_event_land = local_player and "Play_career_ability_bardin_slayer_impact",
		leap_events = {
			{
				distance_percentage = 0.1,
				event_function = function (this)
					local unit_3p = this.unit
					local status_ext = ScriptUnit.extension(unit_3p, "status_system")

					status_ext:set_invisible(true, nil, "skill_adept")
				end,
			},
			{
				distance_percentage = 0.2,
				event_function = function (this)
					local unit_3p = this.unit
					local career_ext = ScriptUnit.extension(unit_3p, "career_system")
					local position = POSITION_LOOKUP[unit_3p] or Unit.world_position(unit_3p, 0)
					local rotation = Unit.local_rotation(unit_3p, 0)
					local explosion_template = "sienna_adept_activated_ability_step_stagger"
					local scale = 1
					local career_power_level = career_ext:get_career_power_level()
					local area_damage_system = Managers.state.entity:system("area_damage_system")

					area_damage_system:create_explosion(unit_3p, position, rotation, explosion_template, scale, "career_ability", career_power_level, false)
				end,
			},
			start = function (this)
				local unit_3p = this.unit
				local career_ext = ScriptUnit.extension(unit_3p, "career_system")
				local position = POSITION_LOOKUP[unit_3p] or Unit.world_position(unit_3p, 0)
				local rotation = Unit.local_rotation(unit_3p, 0)
				local explosion_template = "sienna_adept_activated_ability_start_stagger"
				local scale = 1
				local career_power_level = career_ext:get_career_power_level()
				local area_damage_system = Managers.state.entity:system("area_damage_system")

				area_damage_system:create_explosion(unit_3p, position, rotation, explosion_template, scale, "career_ability", career_power_level, false)
			end,
			finished = function (this, aborted, final_position)
				local unit_3p = this.unit
				local status_ext = ScriptUnit.extension(unit_3p, "status_system")
				local talent_ext = ScriptUnit.extension(unit_3p, "talent_system")
				local career_ext = ScriptUnit.extension(unit_3p, "career_system")

				if not aborted then
					local rotation = Unit.local_rotation(unit_3p, 0)
					local explosion_template = "sienna_adept_activated_ability_end_stagger"

					if talent_ext:has_talent("sienna_adept_activated_ability_explosion") then
						explosion_template = "sienna_adept_activated_ability_end_stagger_improved"
					end

					local scale = 1
					local career_power_level = career_ext:get_career_power_level()
					local area_damage_system = Managers.state.entity:system("area_damage_system")

					area_damage_system:create_explosion(unit_3p, final_position, rotation, explosion_template, scale, "career_ability", career_power_level, false)
				end

				status_ext:set_invisible(false, nil, "skill_adept")
				status_ext:set_noclip(false, "skill_adept")

				if Managers.state.network:game() then
					status_ext:set_is_dodging(false)

					local unit_id = Managers.state.network:unit_game_object_id(unit_3p)

					network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.dodging, false, unit_id, 0)
				end
			end,
		},
	}

	if talent_extension:has_talent("sienna_adept_ability_trail_double") then
		if local_player or is_server and bot_player then
			local buff_extension = self._buff_extension

			if buff_extension then
				local buff = buff_extension:get_buff_type("sienna_adept_ability_trail_double")

				if buff then
					buff.aborted = true

					buff_extension:remove_buff(buff.id)
					career_extension:start_activated_ability_cooldown()
					career_extension:set_abilities_always_usable(false, "sienna_adept_ability_trail_double")
				else
					buff_extension:add_buff("sienna_adept_ability_trail_double")
					career_extension:set_abilities_always_usable(true, "sienna_adept_ability_trail_double")
				end
			end
		end
	else
		career_extension:start_activated_ability_cooldown()
	end

	self:_play_vo()
end

CareerAbilityBWAdept._play_vo = function (self)
	local owner_unit = self._owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)
end
