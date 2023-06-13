require("scripts/unit_extensions/default_player_unit/charge/overcharge_data")

PlayerUnitOverchargeExtension = class(PlayerUnitOverchargeExtension)
local OVERCHARGE_LEVELS = table.enum("none", "low", "medium", "high", "critical", "exploding")

PlayerUnitOverchargeExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.world = extension_init_context.world
	self.unit = unit
	local overcharge_data = extension_init_data.overcharge_data
	self.max_value = overcharge_data.max_value or 40
	self.time_when_overcharge_start_decreasing = 0
	self.overcharge_crit_time = 0
	self.overcharge_crit_interval = 1
	self.venting_overcharge = false
	self.vent_damage_pool = 0
	self.no_damage = global_is_inside_inn
	self.lockout = false
	self.prev_lockout = false
	self.overcharge_threshold = overcharge_data.overcharge_threshold or 0
	self.overcharge_value_decrease_rate = overcharge_data.overcharge_value_decrease_rate or 0
	self.time_until_overcharge_decreases = overcharge_data.time_until_overcharge_decreases or 0
	self.hit_overcharge_threshold_sound = overcharge_data.hit_overcharge_threshold_sound or "ui_special_attack_ready"
	self.screen_space_particle = overcharge_data.onscreen_particles_id or "fx/screenspace_overheat_indicator"
	self.screen_space_particle_critical = overcharge_data.critical_onscreen_particles_id or "fx/screenspace_overheat_critical"
	self._overcharge_states = {
		[OVERCHARGE_LEVELS.none] = {},
		[OVERCHARGE_LEVELS.low] = {
			sound_event = overcharge_data.overcharge_warning_low_sound_event,
			controller_effect = {
				rumble_effect = "overcharge_rumble"
			}
		},
		[OVERCHARGE_LEVELS.medium] = {
			dialogue_event = "overcharge",
			sound_event = overcharge_data.overcharge_warning_med_sound_event,
			controller_effect = {
				rumble_effect = "overcharge_rumble_overcharged"
			}
		},
		[OVERCHARGE_LEVELS.high] = {
			dialogue_event = "overcharge_high",
			sound_event = overcharge_data.overcharge_warning_high_sound_event,
			controller_effect = {
				rumble_effect = "overcharge_rumble_crit"
			}
		},
		[OVERCHARGE_LEVELS.critical] = {
			dialogue_event = "overcharge_critical",
			sound_event = overcharge_data.overcharge_warning_critical_sound_event
		},
		[OVERCHARGE_LEVELS.exploding] = {
			dialogue_event = "overcharge_explode"
		}
	}
	self.explosion_template = overcharge_data.explosion_template or "overcharge_explosion"
	self.no_forced_movement = overcharge_data.no_forced_movement
	self.no_explosion = overcharge_data.no_explosion
	self.explode_vfx_name = overcharge_data.explode_vfx_name
	self.overcharge_explosion_time = overcharge_data.overcharge_explosion_time
	self.percent_health_lost = overcharge_data.percent_health_lost
	self.lockout_overcharge_decay_rate = overcharge_data.lockout_overcharge_decay_rate
	self._had_overcharge = false
	self.network_manager = Managers.state.network
	self.venting_anim = nil
	self.update_overcharge_flow_timer = 0
	self.is_exploding = false
	self._ignored_overcharge_types = {
		flamethrower = true,
		damage_to_overcharge = true,
		charging = true,
		drakegun_charging = true
	}
	local overcharge_opacity = Application.user_setting("overcharge_opacity") or 100

	self:set_screen_particle_opacity_modifier(overcharge_opacity)
end

PlayerUnitOverchargeExtension.extensions_ready = function (self, world, unit)
	local first_person_extension = ScriptUnit.extension(self.unit, "first_person_system")
	self.first_person_extension = first_person_extension
	self.first_person_unit = first_person_extension:get_first_person_unit()
	self.overcharge_blend_id = Unit.animation_find_variable(self.first_person_unit, "overcharge")
	self.overcharge_lockout_id = Unit.animation_find_variable(self.first_person_unit, "overcharge_locked_out")
	self._dialogue_input = ScriptUnit.extension_input(self.unit, "dialogue_system")
	self._buff_extension = ScriptUnit.extension(self.unit, "buff_system")
	self.overcharge_value = 0
	self.original_max_value = self.max_value

	self:_calculate_and_set_buffed_max_overcharge_values()
end

PlayerUnitOverchargeExtension._calculate_and_set_buffed_max_overcharge_values = function (self)
	local overcharge_fraction = self:overcharge_fraction()
	local max_value = self._buff_extension:apply_buffs_to_value(self.original_max_value, "max_overcharge")

	fassert(NetworkConstants.max_overcharge.min <= max_value and max_value <= NetworkConstants.max_overcharge.max, "Max overcharge outside value bounds allowed by network variable!")

	self.overcharge_value = overcharge_fraction * max_value
	self.max_value = max_value
	self.overcharge_limit = max_value * 0.65
	self.overcharge_critical_limit = max_value * 0.8
end

PlayerUnitOverchargeExtension.set_screen_particle_opacity_modifier = function (self, value)
	self._screen_particle_opacity_modifier = value / 100
end

PlayerUnitOverchargeExtension.reset = function (self)
	self:_destroy_all_screen_space_particles()

	local buff_extension = ScriptUnit.has_extension(self.unit, "buff_system")

	if buff_extension and buff_extension:active_buffs() then
		self:_add_overcharge_buff(nil)
	end

	self.lockout = false
	self.overcharge_value = 0
	self.played_hit_overcharge_threshold = false
	self.is_exploding = false

	StatusUtils.set_overcharge_exploding(self.unit, false)

	local world = self.world
	local wwise_world = Managers.world:wwise_world(world)

	WwiseWorld.set_global_parameter(wwise_world, "overcharge_status", 0)
	self:set_animation_variable()
end

PlayerUnitOverchargeExtension._destroy_all_screen_space_particles = function (self)
	self:_destroy_screen_space_particles(self.onscreen_particles_id)

	self.onscreen_particles_id = nil

	self:_destroy_screen_space_particles(self.critical_onscreen_particles_id)

	self.critical_onscreen_particles_id = nil
end

PlayerUnitOverchargeExtension._destroy_screen_space_particles = function (self, particle_id)
	if particle_id then
		World.destroy_particles(self.world, particle_id)
	end
end

PlayerUnitOverchargeExtension.destroy = function (self)
	self:_destroy_all_screen_space_particles()

	local buff_extension = ScriptUnit.has_extension(self.unit, "buff_system")

	if buff_extension and buff_extension:active_buffs() then
		self:_add_overcharge_buff(nil)
	end
end

PlayerUnitOverchargeExtension.set_animation_variable = function (self)
	local first_person_unit = self.first_person_unit
	local overcharge_blend_id = self.overcharge_blend_id
	local anim_blend_overcharge = self:get_anim_blend_overcharge()

	Unit.animation_set_variable(first_person_unit, overcharge_blend_id, anim_blend_overcharge)
end

PlayerUnitOverchargeExtension._update_game_object = function (self)
	local network_manager = self.network_manager
	local unit = self.unit
	local game = network_manager:game()
	local go_id = Managers.state.unit_storage:go_id(unit)

	if game and go_id then
		local current_value_percentage = self:overcharge_fraction()
		local threshold_percentage = self:threshold_fraction()
		local max_value = self:get_max_value()

		GameSession.set_game_object_field(game, go_id, "overcharge_percentage", current_value_percentage)
		GameSession.set_game_object_field(game, go_id, "overcharge_threshold_percentage", threshold_percentage)
		GameSession.set_game_object_field(game, go_id, "overcharge_max_value", max_value)
	end
end

PlayerUnitOverchargeExtension.update = function (self, unit, input, dt, context, t)
	self:_calculate_and_set_buffed_max_overcharge_values()
	self:_update_game_object()

	local pre_amount = self.overcharge_value

	if not self.is_exploding and self.venting_overcharge and self.overcharge_value >= 0 then
		local buff_extension = self._buff_extension
		local wielder = self.unit
		local vent_speed = buff_extension:apply_buffs_to_value(dt, "vent_speed")
		local vent_amount = self.overcharge_value * self.original_max_value / 80 * vent_speed
		local current_overcharge_value = self.overcharge_value
		local new_overcharge_value = current_overcharge_value - vent_amount

		self:_update_overcharge_buff_state(current_overcharge_value, new_overcharge_value)

		self.overcharge_value = new_overcharge_value
		self.vent_damage_pool = self.vent_damage_pool + vent_amount * 2

		if self.vent_damage_pool >= 20 and not self.no_damage and self.overcharge_threshold < self.overcharge_value then
			local _, procced = buff_extension:apply_buffs_to_value(0, "overcharge_damage_immunity")

			if not procced then
				local damage_amount = 2 + self.overcharge_value / 12
				damage_amount = buff_extension:apply_buffs_to_value(damage_amount, "vent_damage")

				DamageUtils.add_damage_network(wielder, wielder, damage_amount, "torso", "overcharge", nil, Vector3(0, 1, 0), "overcharge", nil, nil, nil, nil, false, false, false, 0, 1)
			end

			self.vent_damage_pool = 0
		end
	else
		self.venting_overcharge = false
	end

	if self.overcharge_value >= 0 then
		self:set_animation_variable()
	end

	local first_person_unit = self.first_person_unit
	local unit_3p = self.unit

	if first_person_unit then
		if self.venting_anim then
			Unit.animation_event(first_person_unit, self.venting_anim)

			self.venting_anim = nil
		end

		local lockout = self.lockout

		if self.prev_lockout ~= lockout then
			self.prev_lockout = lockout
			local anim_lockout = lockout and 1 or 0

			Unit.animation_set_variable(first_person_unit, self.overcharge_lockout_id, anim_lockout)

			if not lockout then
				Unit.animation_event(first_person_unit, "overcharge_end")
				Managers.state.network:anim_event(unit_3p, "overcharge_end")
			end
		end
	end

	local buff_extension = self._buff_extension
	local owner_player = Managers.player:owner(self.unit)

	if self.overcharge_value > 0 or buff_extension:has_buff_type("sienna_unchained_activated_ability") then
		self._had_overcharge = true

		if self.update_overcharge_flow_timer < t and not self.venting_overcharge then
			self:set_animation_variable()

			self.update_overcharge_flow_timer = t + 0.3
		end

		if not self.is_exploding and self.time_when_overcharge_start_decreasing < t or self.lockout == true then
			local decay = 1

			if self.overcharge_threshold <= self.overcharge_value then
				decay = decay * 0.6
			elseif self.lockout == true then
				self.lockout = false
				self.is_exploding = false

				self:_trigger_hud_sound("weapon_life_staff_lockout_end", self.first_person_extension)
				self:_trigger_dialogue("overcharge_lockout_end")
			end

			if self.lockout then
				decay = decay * self.lockout_overcharge_decay_rate
			end

			local value = decay * self.overcharge_value_decrease_rate * dt
			value = self.overcharge_value - buff_extension:apply_buffs_to_value(value, "overcharge_regen")

			if buff_extension:has_buff_type("sienna_unchained_activated_ability") and self.max_value <= value then
				self:add_charge(1)
			end

			local new_overcharge_value = math.min(math.max(0, value), self.max_value)

			self:_update_overcharge_buff_state(self.overcharge_value, new_overcharge_value)

			self.overcharge_value = new_overcharge_value
		end

		if owner_player and not owner_player.bot_player then
			local overcharge_fraction = self:overcharge_fraction()

			if overcharge_fraction > 0 then
				local world = self.world
				local wwise_world = Managers.world:wwise_world(world)

				WwiseWorld.set_global_parameter(wwise_world, "overcharge_status", overcharge_fraction)
			end

			self:_update_screen_effect(overcharge_fraction)
		end
	elseif self._had_overcharge then
		self:_trigger_controller_effect(nil)
		self:_destroy_all_screen_space_particles()
		self:_update_overcharge_buff(OVERCHARGE_LEVELS.none)

		self._had_overcharge = false
	end

	local post_amount = self.overcharge_value

	if post_amount < pre_amount then
		self._buff_extension:trigger_procs("on_overcharge_lost", pre_amount - post_amount, self.max_value)
	end
end

PlayerUnitOverchargeExtension.add_charge = function (self, overcharge_amount, charge_level, overcharge_type)
	local buff_extension = self._buff_extension
	local max_value = self.max_value
	local current_overcharge_value = self.overcharge_value
	local new_overcharge_value = nil

	if charge_level then
		overcharge_amount = 0.4 * overcharge_amount + 0.6 * overcharge_amount * charge_level
	end

	overcharge_amount = self._buff_extension:apply_buffs_to_value(overcharge_amount, "reduced_overcharge")

	if buff_extension and not self._ignored_overcharge_types[overcharge_type] then
		buff_extension:trigger_procs("on_ammo_used", self, 0)
		buff_extension:trigger_procs("on_overcharge_used", overcharge_amount)
		Managers.state.achievement:trigger_event("ammo_used", self.owner_unit)

		if not LEVEL_EDITOR_TEST and not self._is_server then
			local player_manager = Managers.player
			local owner_player = Managers.player:owner(self.unit)
			local peer_id = owner_player:network_id()
			local local_player_id = owner_player:local_player_id()
			local event_id = NetworkLookup.proc_events.on_ammo_used

			Managers.state.network.network_transmit:send_rpc_server("rpc_proc_event", peer_id, local_player_id, event_id)
		end
	end

	if buff_extension:has_buff_type("twitch_no_overcharge_no_ammo_reloads") then
		return
	end

	if current_overcharge_value <= max_value * 0.97 and max_value < current_overcharge_value + overcharge_amount then
		local state_settings = self._overcharge_states[OVERCHARGE_LEVELS.critical]

		self:_trigger_hud_sound(state_settings.sound_event, self.first_person_extension)
		self:_trigger_dialogue(state_settings.dialogue_event)

		new_overcharge_value = max_value - 0.1
	else
		new_overcharge_value = math.min(current_overcharge_value + overcharge_amount, max_value)
	end

	self:_check_overcharge_level_thresholds(new_overcharge_value)

	self.time_when_overcharge_start_decreasing = Managers.time:time("game") + self.time_until_overcharge_decreases
	self.overcharge_value = new_overcharge_value
end

PlayerUnitOverchargeExtension.remove_charge = function (self, overcharge_amount)
	if self.is_exploding then
		return
	end

	local current_overcharge_value = self.overcharge_value
	local new_overcharge_value = math.max(current_overcharge_value - overcharge_amount, 0)

	self:_check_overcharge_level_thresholds(new_overcharge_value)

	local overcharge_lost = math.max(current_overcharge_value - new_overcharge_value, 0)

	self._buff_extension:trigger_procs("on_overcharge_lost", overcharge_lost, self.max_value)

	self.overcharge_value = new_overcharge_value
end

PlayerUnitOverchargeExtension._check_overcharge_level_thresholds = function (self, new_overcharge_value)
	local buff_extension = self._buff_extension
	local max_value = self.max_value

	if max_value <= new_overcharge_value then
		if buff_extension:has_buff_perk("no_overcharge_explosion") then
			local wielder = self.unit
			local vent_amount = new_overcharge_value - max_value + 1
			local damage_amount = 2 + max_value / 12
			damage_amount = buff_extension:apply_buffs_to_value(damage_amount, "vent_damage")

			self:remove_charge(vent_amount)
		else
			local unit = self.unit

			StatusUtils.set_overcharge_exploding(unit, true)

			self.is_exploding = true

			self:_add_overcharge_buff(nil)

			local state_settings = self._overcharge_states[OVERCHARGE_LEVELS.exploding]

			self:_trigger_hud_sound(state_settings.sound_event, self.first_person_extension)
			self:_trigger_dialogue(state_settings.dialogue_event)
			self:_trigger_controller_effect("rumble", state_settings.controller_effect)
		end
	else
		local charge_fraction = new_overcharge_value / max_value
		local overcharge_threshold = self.overcharge_threshold
		local old_state = self:_overcharge_value_state(self.overcharge_value)
		local new_state = self:_overcharge_value_state(new_overcharge_value)
		local entered_new_state = old_state ~= new_state
		local state_settings = self._overcharge_states[new_state]

		if state_settings then
			if entered_new_state then
				if new_state == OVERCHARGE_LEVELS.low then
					local wwise_world = Managers.world:wwise_world(self.world)

					WwiseWorld.trigger_event(wwise_world, self.hit_overcharge_threshold_sound)
				end

				self:_trigger_hud_sound(state_settings.sound_event, self.first_person_extension)
				self:_update_overcharge_buff(new_state)
			end

			self:_trigger_dialogue(state_settings.dialogue_event)
			self:_trigger_controller_effect("rumble", state_settings.controller_effect)
		end
	end
end

PlayerUnitOverchargeExtension.set_lockout = function (self, new_state)
	self.lockout = new_state
end

PlayerUnitOverchargeExtension.get_overcharge_value = function (self)
	return self.overcharge_value
end

PlayerUnitOverchargeExtension.is_above_critical_limit = function (self)
	return self.overcharge_critical_limit <= self.overcharge_value
end

PlayerUnitOverchargeExtension.get_original_max_value = function (self)
	return self.original_max_value
end

PlayerUnitOverchargeExtension.get_max_value = function (self)
	return self.max_value
end

PlayerUnitOverchargeExtension.get_overcharge_threshold = function (self)
	return self.overcharge_threshold
end

PlayerUnitOverchargeExtension.above_overcharge_threshold = function (self)
	return self.overcharge_threshold <= self.overcharge_value
end

PlayerUnitOverchargeExtension.are_you_exploding = function (self)
	return self.is_exploding
end

PlayerUnitOverchargeExtension.are_you_locked_out = function (self)
	return self.lockout
end

PlayerUnitOverchargeExtension.overcharge_fraction = function (self)
	return math.clamp(self.overcharge_value / self.max_value, 0, 1)
end

PlayerUnitOverchargeExtension.threshold_fraction = function (self)
	return self.overcharge_threshold / self.max_value
end

PlayerUnitOverchargeExtension.current_overcharge_status = function (self)
	local value = self:get_overcharge_value()
	local threshold = self:get_overcharge_threshold()
	local max_value = self:get_max_value()

	return value, threshold, max_value
end

PlayerUnitOverchargeExtension.vent_overcharge = function (self)
	self.venting_overcharge = true

	if self.overcharge_value > 0 then
		self.vent_damage_pool = 20
	else
		self.vent_damage_pool = 0
	end

	self.venting_anim = "cooldown_start"
end

PlayerUnitOverchargeExtension.vent_overcharge_done = function (self)
	self.venting_overcharge = false
	self.venting_anim = "cooldown_end"
end

PlayerUnitOverchargeExtension.get_anim_blend_overcharge = function (self)
	local overcharge_value = self.overcharge_value
	local overcharge_threshold = self.overcharge_threshold
	local max_value = self.max_value
	local anim_blend_value = math.clamp((overcharge_value - overcharge_threshold) / (max_value - overcharge_threshold), 0, 1)

	return anim_blend_value
end

PlayerUnitOverchargeExtension._trigger_hud_sound = function (self, event, fp_extension)
	if not event or not fp_extension then
		return
	end

	fp_extension:play_hud_sound_event(event)
end

PlayerUnitOverchargeExtension._trigger_dialogue = function (self, event_name)
	if not event_name then
		return
	end

	local dialogue_input = self._dialogue_input
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_dialogue_event(event_name, event_data)
end

PlayerUnitOverchargeExtension._trigger_controller_effect = function (self, type, effect)
	local controller_features = Managers.state.controller_features
	local _rumble_effect_id = self._rumble_effect_id

	if _rumble_effect_id then
		controller_features:stop_effect(_rumble_effect_id)

		self._rumble_effect_id = nil
	end

	if type and effect then
		self._rumble_effect_id = controller_features:add_effect(type, effect)
	end
end

PlayerUnitOverchargeExtension._add_overcharge_buff = function (self, buff_name)
	local buff_extension = self._buff_extension
	local overcharged_buff_id = self._overcharged_buff_id

	if overcharged_buff_id then
		buff_extension:remove_buff(overcharged_buff_id)

		self.overcharged_buff_id = nil
	end

	if buff_name then
		self._overcharged_buff_id = buff_extension:add_buff(buff_name)
	end
end

PlayerUnitOverchargeExtension._update_overcharge_buff = function (self, state)
	local buff_extension = self._buff_extension

	if state == OVERCHARGE_LEVELS.high then
		if buff_extension:has_buff_type("sienna_unchained_passive") or buff_extension:has_buff_perk("overcharge_no_slow") then
			self:_add_overcharge_buff("overcharged_critical_no_attack_penalty")
		else
			self:_add_overcharge_buff("overcharged_critical")
		end
	elseif state == OVERCHARGE_LEVELS.medium then
		if buff_extension:has_buff_type("sienna_unchained_passive") or buff_extension:has_buff_perk("overcharge_no_slow") then
			self:_add_overcharge_buff("overcharged_no_attack_penalty")
		else
			self:_add_overcharge_buff("overcharged")
		end
	else
		self:_add_overcharge_buff(nil)
	end
end

PlayerUnitOverchargeExtension._update_screen_effect = function (self, overcharge_fraction)
	if Development.parameter("screen_space_player_camera_reactions") == false then
		self:_destroy_all_screen_space_particles()

		return
	end

	local world = self.world
	local first_person_extension = self.first_person_extension
	local material_name = "overlay"
	local material_variable_name = "intensity"
	local modifier = self._screen_particle_opacity_modifier

	if overcharge_fraction > 0 then
		if not self.onscreen_particles_id then
			self.onscreen_particles_id = first_person_extension:create_screen_particles(self.screen_space_particle)
		end

		World.set_particles_material_scalar(world, self.onscreen_particles_id, material_name, material_variable_name, overcharge_fraction * modifier)
	elseif self.onscreen_particles_id then
		self:_destroy_screen_space_particles(self.onscreen_particles_id)

		self.onscreen_particles_id = nil
	end

	if self:is_above_critical_limit() then
		if not self.critical_onscreen_particles_id then
			self.critical_onscreen_particles_id = first_person_extension:create_screen_particles(self.screen_space_particle_critical)
		end

		local critical_fraction = math.min(1, (self.overcharge_value - self.overcharge_critical_limit) / (self.max_value - self.overcharge_critical_limit) * 2)

		World.set_particles_material_scalar(world, self.critical_onscreen_particles_id, material_name, material_variable_name, critical_fraction * modifier)
	elseif self.critical_onscreen_particles_id then
		self:_destroy_screen_space_particles(self.critical_onscreen_particles_id)

		self.critical_onscreen_particles_id = nil
	end
end

PlayerUnitOverchargeExtension._update_overcharge_buff_state = function (self, old_overcharge_value, new_overcharge_value)
	local old_state = self:_overcharge_value_state(old_overcharge_value)
	local new_state = self:_overcharge_value_state(new_overcharge_value)
	local entered_new_state = old_state ~= new_state

	if entered_new_state then
		self:_update_overcharge_buff(new_state)

		local state_settings = self._overcharge_states[new_state]

		if state_settings then
			self:_trigger_controller_effect("rumble", state_settings.controller_effect)
		end
	end
end

PlayerUnitOverchargeExtension._overcharge_value_state = function (self, value)
	if self.overcharge_critical_limit <= value then
		return OVERCHARGE_LEVELS.high
	elseif self.overcharge_limit <= value then
		return OVERCHARGE_LEVELS.medium
	elseif self.overcharge_threshold <= value then
		return OVERCHARGE_LEVELS.low
	else
		return OVERCHARGE_LEVELS.none
	end
end
