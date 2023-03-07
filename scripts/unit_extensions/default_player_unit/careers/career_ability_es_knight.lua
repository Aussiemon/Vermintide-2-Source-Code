CareerAbilityESKnight = class(CareerAbilityESKnight)

CareerAbilityESKnight.init = function (self, extension_init_context, unit, extension_init_data)
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
	self._decal_unit = nil
	self._decal_unit_name = "units/decals/decal_arrow"
	self._fov_lerp_time = 0
	self._lunge_events = {
		start = function (this)
			local first_person_extension = this.first_person_extension
			local unit_3p = this.unit

			first_person_extension:play_hud_sound_event("Play_career_ability_kruber_charge_enter")
			first_person_extension:play_hud_sound_event("Play_career_ability_kruber_charge_forward")
			first_person_extension:play_remote_unit_sound_event("Play_career_ability_kruber_charge_enter", unit_3p, 0)
			first_person_extension:play_remote_unit_sound_event("Play_career_ability_kruber_charge_forward", unit_3p, 0)
		end,
		impact = function (this)
			local first_person_extension = this.first_person_extension
			local unit_1p = this._first_person_unit
			local unit_3p = this.unit
			local wwise_world = this.wwise_world
			local num_impacts = this._num_impacts

			Unit.flow_event(unit_1p, "lua_es_knight_activated_impact")
			WwiseWorld.set_global_parameter(wwise_world, "knight_charge_num_impacts", num_impacts)
			first_person_extension:play_hud_sound_event("Play_career_ability_kruber_charge_hit_player")
			first_person_extension:play_remote_unit_sound_event("Play_career_ability_kruber_charge_hit_player", unit_3p, 0)
		end,
		finished = function (this)
			local first_person_extension = this.first_person_extension
			local unit_3p = this.unit

			first_person_extension:play_hud_sound_event("Stop_career_ability_kruber_charge_forward")
			first_person_extension:play_remote_unit_sound_event("Stop_career_ability_kruber_charge_forward", unit_3p, 0)
		end
	}
end

CareerAbilityESKnight.extensions_ready = function (self, world, unit)
	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self._status_extension = ScriptUnit.extension(unit, "status_system")
	self._career_extension = ScriptUnit.extension(unit, "career_system")
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")
	self._input_extension = ScriptUnit.has_extension(unit, "input_system")

	if self._first_person_extension then
		self._first_person_unit = self._first_person_extension:get_first_person_unit()
	end
end

CareerAbilityESKnight.destroy = function (self)
	return
end

CareerAbilityESKnight.update = function (self, unit, input, dt, context, t)
	if not self:_ability_available() then
		return
	end

	local input_extension = self._input_extension

	if not input_extension then
		return
	end

	if not self._is_priming then
		if input_extension:get("action_career") then
			self:_start_priming()
		end
	elseif self._is_priming then
		self:_update_priming(dt)

		if input_extension:get("action_two") then
			self:_stop_priming()

			return
		end

		if input_extension:get("weapon_reload") then
			self:_stop_priming()

			return
		end

		if input_extension:get("toggle_menu") then
			self:_stop_priming()

			return
		end

		if not input_extension:get("action_career_hold") then
			self:_run_ability()
		end
	end
end

CareerAbilityESKnight.stop = function (self, reason)
	if reason ~= "pushed" and reason ~= "stunned" and self._is_priming then
		self:_stop_priming()
	end
end

CareerAbilityESKnight._ability_available = function (self)
	local career_extension = self._career_extension
	local status_extension = self._status_extension

	return career_extension:can_use_activated_ability() and not status_extension:is_disabled()
end

CareerAbilityESKnight._start_priming = function (self)
	if self._local_player then
		local decal_unit_name = self._decal_unit_name
		local unit_spawner = Managers.state.unit_spawner
		self._decal_unit = unit_spawner:spawn_local_unit(decal_unit_name)
		local flow_event = "lua_es_knight_activated_start_priming"

		Unit.flow_event(self._owner_unit, flow_event)
		Unit.flow_event(self._first_person_unit, flow_event)
	end

	local buff_extension = self._buff_extension
	local buff_template_name = "planted_decrease_movement"
	local buff_params = {
		external_optional_multiplier = 0.3
	}
	self._buff_id = buff_extension:add_buff(buff_template_name, buff_params)
	self._is_priming = true
end

CareerAbilityESKnight._update_priming = function (self, dt)
	if self._decal_unit then
		local first_person_extension = self._first_person_extension
		local player_position = Unit.local_position(self._owner_unit, 0)
		local player_rotation = first_person_extension:current_rotation()
		local player_direction_flat = Vector3.flat(Vector3.normalize(Quaternion.forward(player_rotation)))
		local player_rotation_flat = Quaternion.look(player_direction_flat, Vector3.up())

		Unit.set_local_position(self._decal_unit, 0, player_position)
		Unit.set_local_rotation(self._decal_unit, 0, player_rotation_flat)
	end

	if self._local_player then
		local total_lerp_time = 2.5
		local lerp_value = self._fov_lerp_time / total_lerp_time
		local fov_multiplier = math.lerp(1, 0.95, lerp_value)
		self._fov_lerp_time = math.min(self._fov_lerp_time + dt, total_lerp_time)

		Managers.state.camera:set_additional_fov_multiplier(fov_multiplier)
	end
end

CareerAbilityESKnight._stop_priming = function (self)
	if self._decal_unit then
		local unit_spawner = Managers.state.unit_spawner

		unit_spawner:mark_for_deletion(self._decal_unit)
	end

	if self._buff_id then
		local buff_extension = self._buff_extension

		buff_extension:remove_buff(self._buff_id)

		self._buff_id = nil
	end

	if self._local_player then
		local flow_event = "lua_es_knight_activated_stop_priming"

		Unit.flow_event(self._owner_unit, flow_event)
		Unit.flow_event(self._first_person_unit, flow_event)

		self._fov_lerp_time = 0

		Managers.state.camera:set_additional_fov_multiplier(1)
	end

	self._is_priming = false
end

CareerAbilityESKnight._run_ability = function (self)
	self:_stop_priming()

	local owner_unit = self._owner_unit
	local is_server = self._is_server
	local status_extension = self._status_extension
	local career_extension = self._career_extension
	local buff_extension = self._buff_extension
	local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	local network_manager = self._network_manager
	local network_transmit = network_manager.network_transmit
	local owner_unit_id = network_manager:unit_game_object_id(owner_unit)
	local buff_name = "markus_knight_activated_ability"

	buff_extension:add_buff(buff_name, {
		attacker_unit = owner_unit
	})

	if talent_extension:has_talent("markus_knight_ability_invulnerability", "empire_soldier", true) then
		buff_name = "markus_knight_ability_invulnerability_buff"

		buff_extension:add_buff(buff_name, {
			attacker_unit = owner_unit
		})

		local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

		if is_server then
			network_transmit:send_rpc_clients("rpc_add_buff", owner_unit_id, buff_template_name_id, owner_unit_id, 0, false)
		else
			network_transmit:send_rpc_server("rpc_add_buff", owner_unit_id, buff_template_name_id, owner_unit_id, 0, false)
		end
	end

	status_extension:add_noclip_stacking()

	local hold_duration = 0.03
	local windup_duration = 0.15
	status_extension.do_lunge = {
		animation_end_event = "foot_knight_ability_charge_hit",
		allow_rotation = false,
		falloff_to_speed = 5,
		ledge_falloff_immunity = 0.5,
		dodge = true,
		first_person_animation_event = "foot_knight_ability_charge_start",
		first_person_animation_end_event = "foot_knight_ability_charge_hit",
		first_person_hit_animation_event = "charge_react",
		damage_start_time = 0.3,
		duration = 1.5,
		initial_speed = 20,
		animation_event = "foot_knight_ability_charge_start",
		lunge_events = self._lunge_events,
		speed_function = function (lunge_time, duration)
			local end_duration = 0.25
			local rush_time = lunge_time - hold_duration - windup_duration
			local rush_duration = duration - hold_duration - windup_duration - end_duration
			local start_speed = 0
			local windup_speed = -3
			local end_speed = 20
			local rush_speed = 15
			local normal_move_speed = 2

			if rush_time <= 0 and hold_duration > 0 then
				local t = -rush_time / (hold_duration + windup_duration)

				return math.lerp(0, -1, t)
			elseif rush_time < windup_duration then
				local t_value = rush_time / windup_duration
				local interpolation_value = math.cos((t_value + 1) * math.pi * 0.5)

				return math.min(math.lerp(windup_speed, start_speed, interpolation_value), rush_speed)
			elseif rush_time < rush_duration then
				local t_value = rush_time / rush_duration
				local acceleration = math.min(rush_time / (rush_duration / 3), 1)
				local interpolation_value = math.cos(t_value * math.pi * 0.5)
				local offset = nil
				local step_time = 0.25

				if rush_time > 8 * step_time then
					offset = 0
				elseif rush_time > 7 * step_time then
					offset = (rush_time - 1.4) / step_time
				elseif rush_time > 6 * step_time then
					offset = (rush_time - 6 * step_time) / step_time
				elseif rush_time > 5 * step_time then
					offset = (rush_time - 5 * step_time) / step_time
				elseif rush_time > 4 * step_time then
					offset = (rush_time - 4 * step_time) / step_time
				elseif rush_time > 3 * step_time then
					offset = (rush_time - 3 * step_time) / step_time
				elseif rush_time > 2 * step_time then
					offset = (rush_time - 2 * step_time) / step_time
				elseif step_time < rush_time then
					offset = (rush_time - step_time) / step_time
				else
					offset = rush_time / step_time
				end

				local offset_multiplier = 1 - offset * 0.4
				local speed = offset_multiplier * acceleration * acceleration * math.lerp(end_speed, rush_speed, interpolation_value)

				return speed
			else
				local t_value = (rush_time - rush_duration) / end_duration
				local interpolation_value = 1 + math.cos((t_value + 1) * math.pi * 0.5)

				return math.lerp(normal_move_speed, end_speed, interpolation_value)
			end
		end,
		damage = {
			offset_forward = 2.4,
			height = 1.8,
			depth_padding = 0.6,
			hit_zone_hit_name = "full",
			ignore_shield = false,
			collision_filter = "filter_explosion_overlap_no_player",
			interrupt_on_max_hit_mass = true,
			power_level_multiplier = 1,
			interrupt_on_first_hit = false,
			damage_profile = "markus_knight_charge",
			width = 2,
			allow_backstab = false,
			stagger_angles = {
				max = 80,
				min = 25
			},
			on_interrupt_blast = {
				allow_backstab = false,
				radius = 3,
				power_level_multiplier = 1,
				hit_zone_hit_name = "full",
				damage_profile = "markus_knight_charge_blast",
				ignore_shield = false,
				collision_filter = "filter_explosion_overlap_no_player"
			}
		}
	}

	if talent_extension:has_talent("markus_knight_wide_charge", "empire_soldier", true) then
		status_extension.do_lunge.damage.width = 5
		status_extension.do_lunge.damage.interrupt_on_max_hit_mass = false
	end

	career_extension:start_activated_ability_cooldown()
	self:_play_vo()
end

CareerAbilityESKnight._play_vo = function (self)
	local owner_unit = self._owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)
end
