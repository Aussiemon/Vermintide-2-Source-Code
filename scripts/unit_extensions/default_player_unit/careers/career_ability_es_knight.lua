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

	return 
end
CareerAbilityESKnight.extensions_ready = function (self, world, unit)
	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self._status_extension = ScriptUnit.extension(unit, "status_system")
	self._career_extension = ScriptUnit.extension(unit, "career_system")
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")

	if self._first_person_extension then
		self._first_person_unit = self._first_person_extension:get_first_person_unit()
	end

	return 
end
CareerAbilityESKnight.destroy = function (self)
	return 
end
CareerAbilityESKnight.update = function (self, unit, input, dt, context, t)
	if not self._ability_available(self) then
		return 
	end

	local input_service = self._input_manager:get_service("Player")

	if not self._is_priming then
		if input_service.get(input_service, "function_career") then
			self._start_priming(self)
		end
	elseif self._is_priming then
		self._update_priming(self, dt)

		if input_service.get(input_service, "action_two") then
			self._stop_priming(self)

			return 
		end

		if input_service.get(input_service, "function_career_release") then
			self._run_ability(self)
		end
	end

	return 
end
CareerAbilityESKnight._ability_available = function (self)
	local career_extension = self._career_extension
	local status_extension = self._status_extension
	local activated_ability_data = career_extension.get_activated_ability_data(career_extension)

	return self._local_player and not self._bot_player and career_extension.can_use_activated_ability(career_extension) and not status_extension.is_disabled(status_extension)
end
CareerAbilityESKnight._start_priming = function (self)
	local decal_unit_name = self._decal_unit_name
	local unit_spawner = Managers.state.unit_spawner
	self._decal_unit = unit_spawner.spawn_local_unit(unit_spawner, decal_unit_name)
	local flow_event = "lua_es_knight_activated_start_priming"

	Unit.flow_event(self._owner_unit, flow_event)
	Unit.flow_event(self._first_person_unit, flow_event)

	local buff_extension = self._buff_extension
	local buff_template_name = "planted_decrease_movement"
	local buff_params = {
		external_optional_multiplier = 0.3
	}
	self._buff_id = buff_extension.add_buff(buff_extension, buff_template_name, buff_params)
	self._is_priming = true

	return 
end
CareerAbilityESKnight._update_priming = function (self, dt)
	local owner_unit = self._owner_unit
	local first_person_extension = self._first_person_extension
	local player_position = Unit.local_position(self._owner_unit, 0)
	local player_rotation = first_person_extension.current_rotation(first_person_extension)
	local player_direction_flat = Vector3.flat(Vector3.normalize(Quaternion.forward(player_rotation)))
	local player_rotation_flat = Quaternion.look(player_direction_flat, Vector3.up())

	Unit.set_local_position(self._decal_unit, 0, player_position)
	Unit.set_local_rotation(self._decal_unit, 0, player_rotation_flat)

	local total_lerp_time = 2.5
	local lerp_value = self._fov_lerp_time/total_lerp_time
	local fov_multiplier = math.lerp(1, 0.95, lerp_value)
	self._fov_lerp_time = math.min(self._fov_lerp_time + dt, total_lerp_time)

	Managers.state.camera:set_additional_fov_multiplier(fov_multiplier)

	return 
end
CareerAbilityESKnight._stop_priming = function (self)
	if self._decal_unit then
		local unit_spawner = Managers.state.unit_spawner

		unit_spawner.mark_for_deletion(unit_spawner, self._decal_unit)
	end

	local flow_event = "lua_es_knight_activated_stop_priming"

	Unit.flow_event(self._owner_unit, flow_event)
	Unit.flow_event(self._first_person_unit, flow_event)

	if self._buff_id then
		local buff_extension = self._buff_extension

		buff_extension.remove_buff(buff_extension, self._buff_id)

		self._buff_id = nil
	end

	self._fov_lerp_time = 0

	Managers.state.camera:set_additional_fov_multiplier(1)

	self._is_priming = false

	return 
end
CareerAbilityESKnight._run_ability = function (self)
	self._stop_priming(self)

	local world = self._world
	local owner_unit = self._owner_unit
	local is_server = self._is_server
	local local_player = self._local_player
	local network_manager = self._network_manager
	local network_transmit = network_manager.network_transmit
	local status_extension = self._status_extension
	local career_extension = self._career_extension
	local buff_extension = self._buff_extension
	local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	local buff_name = "markus_knight_activated_ability"

	buff_extension.add_buff(buff_extension, buff_name, {
		attacker_unit = owner_unit
	})

	if talent_extension.has_talent(talent_extension, "markus_knight_activated_ability_damage_buff", "empire_soldier", true) then
		buff_extension.add_buff(buff_extension, "markus_knight_activated_ability_damage_buff", {
			attacker_unit = owner_unit
		})
	end

	if talent_extension.has_talent(talent_extension, "markus_knight_activated_ability_infinite_block", "empire_soldier", true) then
		buff_extension.add_buff(buff_extension, "markus_knight_activated_ability_infinite_block", {
			attacker_unit = owner_unit
		})
	end

	if local_player then
		local first_person_extension = self._first_person_extension

		first_person_extension.play_hud_sound_event(first_person_extension, "Play_career_ability_kruber_charge_enter")
		first_person_extension.play_hud_sound_event(first_person_extension, "Play_career_ability_kruber_charge_forward")
	end

	status_extension.set_noclip(status_extension, true)

	local hold_duration = 0.03
	local windup_duration = 0.15
	status_extension.do_lunge = {
		animation_end_event = "foot_knight_ability_charge_hit",
		allow_rotation = false,
		falloff_to_speed = 5,
		first_person_animation_end_event = "foot_knight_ability_charge_hit",
		first_person_hit_animation_event = "charge_react",
		first_person_animation_event = "foot_knight_ability_charge_start",
		first_person_animation_end_event_hit = "foot_knight_ability_charge_hit",
		damage_start_time = 0.3,
		duration = 1.75,
		initial_speed = 20,
		animation_event = "foot_knight_ability_charge_start",
		flow_events = {
			impact = "lua_es_knight_activated_impact",
			start = "lua_es_knight_activated_start_move",
			finished = "lua_es_knight_activated_finished"
		},
		speed_function = function (lunge_time, duration)
			local end_duration = 0.25
			local rush_time = lunge_time - hold_duration - windup_duration
			local windup_time = lunge_time - windup_duration
			local rush_duration = duration - hold_duration - windup_duration - end_duration
			local start_speed = 0
			local windup_speed = -3
			local end_speed = 20
			local rush_speed = 15
			local normal_move_speed = 2

			if rush_time <= 0 and 0 < hold_duration then
				local t = -rush_time/(hold_duration + windup_duration)

				return math.lerp(0, -1, t)
			elseif rush_time < windup_duration then
				local t_value = rush_time/windup_duration
				local interpolation_value = math.cos((t_value + 1)*math.pi*0.5)

				return math.min(math.lerp(windup_speed, start_speed, interpolation_value), rush_speed)
			elseif rush_time < rush_duration then
				local t_value = rush_time/rush_duration
				local acceleration = math.min(rush_time/rush_duration/3, 1)
				local interpolation_value = math.cos(t_value*math.pi*0.5)
				local offset_bajs = nil
				local step_time = 0.25

				if step_time*8 < rush_time then
					offset_bajs = 0
				elseif step_time*7 < rush_time then
					offset_bajs = (rush_time - 1.4)/step_time
				elseif step_time*6 < rush_time then
					offset_bajs = (rush_time - step_time*6)/step_time
				elseif step_time*5 < rush_time then
					offset_bajs = (rush_time - step_time*5)/step_time
				elseif step_time*4 < rush_time then
					offset_bajs = (rush_time - step_time*4)/step_time
				elseif step_time*3 < rush_time then
					offset_bajs = (rush_time - step_time*3)/step_time
				elseif step_time*2 < rush_time then
					offset_bajs = (rush_time - step_time*2)/step_time
				elseif step_time < rush_time then
					offset_bajs = (rush_time - step_time)/step_time
				else
					offset_bajs = rush_time/step_time
				end

				local offset_multiplier = offset_bajs*0.4 - 1
				local bajs = offset_multiplier*acceleration*acceleration*math.lerp(end_speed, rush_speed, interpolation_value)

				return bajs
			else
				local t_value = (rush_time - rush_duration)/end_duration
				local interpolation_value = math.cos((t_value + 1)*math.pi*0.5) + 1

				return math.lerp(normal_move_speed, end_speed, interpolation_value)
			end

			return 
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

	career_extension.start_activated_ability_cooldown(career_extension)
	self._play_vo(self)

	return 
end
CareerAbilityESKnight._play_vo = function (self)
	local owner_unit = self._owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input.trigger_networked_dialogue_event(dialogue_input, "activate_ability", event_data)

	return 
end

return 
