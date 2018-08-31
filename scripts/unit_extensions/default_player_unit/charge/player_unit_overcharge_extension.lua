require("scripts/unit_extensions/default_player_unit/charge/overcharge_data")

PlayerUnitOverchargeExtension = class(PlayerUnitOverchargeExtension)
script_data.overcharge_debug = script_data.overcharge_debug or Development.parameter("overcharge_debug")
script_data.disable_overcharge = script_data.disable_overcharge or Development.parameter("disable_overcharge")

PlayerUnitOverchargeExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.world = extension_init_context.world
	self.unit = unit
	local overcharge_data = extension_init_data.overcharge_data
	self.max_value = overcharge_data.max_value or 40
	self.time_when_overcharge_start_decreasing = 0
	self.above_threshold = false
	self.overcharge_crit_time = 0
	self.overcharge_crit_interval = 1
	self.venting_overcharge = false
	self.vent_damage_pool = 0
	self.no_damage = global_is_inside_inn
	self.overcharge_threshold = overcharge_data.overcharge_threshold or 0
	self.overcharge_value_decrease_rate = overcharge_data.overcharge_value_decrease_rate or 0
	self.time_until_overcharge_decreases = overcharge_data.time_until_overcharge_decreases or 0
	self.hit_overcharge_threshold_sound = overcharge_data.hit_overcharge_threshold_sound or "ui_special_attack_ready"
	self.overcharge_warning_critical_sound_event = overcharge_data.overcharge_warning_critical_sound_event
	self.overcharge_warning_high_sound_event = overcharge_data.overcharge_warning_high_sound_event
	self.overcharge_warning_med_sound_event = overcharge_data.overcharge_warning_med_sound_event
	self.overcharge_warning_low_sound_event = overcharge_data.overcharge_warning_low_sound_event
	self.explosion_template = overcharge_data.explosion_template or "overcharge_explosion"
	self.has_overcharge = false
	self.network_manager = Managers.state.network
	self.venting_anim = nil
	local first_person_extension = ScriptUnit.extension(self.unit, "first_person_system")
	self.first_person_extension = first_person_extension
	self.first_person_unit = first_person_extension:get_first_person_unit()
	self.overcharge_blend_id = Unit.animation_find_variable(self.first_person_unit, "overcharge")
	self.update_overcharge_flow_timer = 0
	self.is_exploding = false
	local overcharge_opacity = Application.user_setting("overcharge_opacity") or 100

	self:set_screen_particle_opacity_modifier(overcharge_opacity)

	self._overcharge_rumble_effect_id = nil
	self._overcharge_rumble_critical_effect_id = nil
	self._overcharge_rumble_overcharged_effect_id = nil
end

PlayerUnitOverchargeExtension.extensions_ready = function (self, world, unit)
	self.buff_extension = ScriptUnit.extension(self.unit, "buff_system")
	self.overcharge_value = 0
	self.original_max_value = self.max_value

	self:_calculate_and_set_buffed_max_overcharge_values()
end

PlayerUnitOverchargeExtension._calculate_and_set_buffed_max_overcharge_values = function (self)
	local overcharge_fraction = self:overcharge_fraction()
	local max_value = self.buff_extension:apply_buffs_to_value(self.original_max_value, StatBuffIndex.MAX_OVERCHARGE)

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
	local buff_extension = self.buff_extension
	local has_buff_extension = ScriptUnit.has_extension(self.unit, "buff_system")
	local overcharged_critical_buff_id = self.overcharged_critical_buff_id
	local overcharged_buff_id = self.overcharged_buff_id

	if has_buff_extension and buff_extension:active_buffs() then
		if overcharged_critical_buff_id then
			buff_extension:remove_buff(overcharged_critical_buff_id)

			self.overcharged_critical_buff_id = nil
		end

		if overcharged_buff_id and self.overcharge_value < self.overcharge_limit then
			buff_extension:remove_buff(overcharged_buff_id)

			self.overcharged_buff_id = nil
		end
	end

	self.overcharge_value = 0
	self.played_hit_overcharge_threshold = false
	self.is_exploding = false

	StatusUtils.set_overcharge_exploding(self.unit, false)
	self:set_animation_variable()
end

PlayerUnitOverchargeExtension.destroy = function (self)
	if self.onscreen_particles_id then
		World.destroy_particles(self.world, self.onscreen_particles_id)
		World.destroy_particles(self.world, self.critical_onscreen_particles_id)
	end

	local buff_extension = self.buff_extension
	local overcharged_critical_buff_id = self.overcharged_critical_buff_id
	local overcharged_buff_id = self.overcharged_buff_id
	local has_buff_extension = ScriptUnit.has_extension(self.unit, "buff_system")

	if has_buff_extension and buff_extension:active_buffs() then
		if overcharged_critical_buff_id then
			buff_extension:remove_buff(overcharged_critical_buff_id)

			self.overcharged_critical_buff_id = nil
		end

		if overcharged_buff_id and self.overcharge_value < self.overcharge_limit then
			buff_extension:remove_buff(overcharged_buff_id)

			self.overcharged_buff_id = nil
		end
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

	if not self.is_exploding and self.venting_overcharge and self.overcharge_value >= 0 then
		local buff_extension = self.buff_extension
		local wielder = self.unit
		local vent_speed = buff_extension:apply_buffs_to_value(dt, StatBuffIndex.VENT_SPEED)
		local vent_amount = self.overcharge_value * self.original_max_value / 80 * vent_speed
		self.vent_damage_pool = self.vent_damage_pool + vent_amount * 2
		self.overcharge_value = self.overcharge_value - vent_amount

		if self.vent_damage_pool >= 20 and not self.no_damage and self.overcharge_threshold < self.overcharge_value then
			local damage_amount = 2 + self.overcharge_value / 12
			damage_amount = buff_extension:apply_buffs_to_value(damage_amount, StatBuffIndex.VENT_DAMAGE)

			DamageUtils.add_damage_network(wielder, wielder, damage_amount, "torso", "overcharge", nil, Vector3(0, 1, 0), "overcharge")

			self.vent_damage_pool = 0
		end
	else
		self.venting_overcharge = false
	end

	if self.overcharge_value >= 0 then
		self:set_animation_variable()
	end

	if self.venting_anim then
		Unit.animation_event(self.first_person_unit, self.venting_anim)

		self.venting_anim = nil
	end

	local buff_extension = self.buff_extension

	if self.overcharge_value > 0 or buff_extension:has_buff_type("sienna_unchained_activated_ability") then
		if self.update_overcharge_flow_timer < t and not self.venting_overcharge then
			self:set_animation_variable()

			self.update_overcharge_flow_timer = t + 0.3
		end

		self.has_overcharge = true

		if not self.is_exploding and self.time_when_overcharge_start_decreasing < t then
			local decay = 1

			if self.above_threshold then
				decay = decay * 0.6
			end

			local value = decay * self.overcharge_value_decrease_rate * dt
			value = self.overcharge_value - buff_extension:apply_buffs_to_value(value, StatBuffIndex.OVERCHARGE_REGEN)

			if buff_extension:has_buff_type("sienna_unchained_activated_ability") and self.max_value <= value then
				self:add_charge(1)
			end

			self.overcharge_value = math.min(math.max(0, value), self.max_value)
			local overcharged_critical_buff_id = self.overcharged_critical_buff_id
			local overcharged_buff_id = self.overcharged_buff_id

			if overcharged_critical_buff_id and self.overcharge_value < self.overcharge_critical_limit then
				buff_extension:remove_buff(overcharged_critical_buff_id)

				self.overcharged_critical_buff_id = nil
			elseif overcharged_buff_id and self.overcharge_value < self.overcharge_limit then
				buff_extension:remove_buff(overcharged_buff_id)

				self.overcharged_buff_id = nil
			end

			local overcharge_rumble_critical_effect_id = self._overcharge_rumble_critical_effect_id
			local overcharge_rumble_overcharged_effect_id = self._overcharge_rumble_overcharged_effect_id
			local overcharge_rumble_effect_id = self._overcharge_rumble_effect_id

			if overcharge_rumble_critical_effect_id and self.overcharge_value < self.overcharge_critical_limit then
				Managers.state.controller_features:stop_effect(overcharge_rumble_critical_effect_id)

				self._overcharge_rumble_critical_effect_id = nil
				self._overcharge_rumble_overcharged_effect_id = Managers.state.controller_features:add_effect("rumble", {
					rumble_effect = "overcharge_rumble_overcharged"
				})
			elseif overcharge_rumble_overcharged_effect_id and self.overcharge_value < self.overcharge_limit then
				Managers.state.controller_features:stop_effect(overcharge_rumble_overcharged_effect_id)

				self._overcharge_rumble_overcharged_effect_id = nil
				self._overcharge_rumble_effect_id = Managers.state.controller_features:add_effect("rumble", {
					rumble_effect = "overcharge_rumble"
				})
			elseif not self.above_threshold and overcharge_rumble_effect_id then
				Managers.state.controller_features:stop_effect(overcharge_rumble_effect_id)
			end
		end
	elseif self.has_overcharge then
		if self._overcharge_rumble_critical_effect_id then
			Managers.state.controller_features:stop_effect(self._overcharge_rumble_critical_effect_id)

			self._overcharge_rumble_critical_effect_id = nil
		end

		if self._overcharge_rumble_overcharged_effect_id then
			Managers.state.controller_features:stop_effect(self._overcharge_rumble_overcharged_effect_id)

			self._overcharge_rumble_overcharged_effect_id = nil
		end

		if self._overcharge_rumble_effect_id then
			Managers.state.controller_features:stop_effect(self._overcharge_rumble_effect_id)

			self._overcharge_rumble_effect_id = nil
		end

		self.has_overcharge = false
	end

	local owner_player = Managers.player:owner(self.unit)
	local is_bot = owner_player and owner_player.bot_player

	if not is_bot then
		local world = self.world
		local wwise_world = Managers.world:wwise_world(world)
		local overcharge_fraction = self:overcharge_fraction()

		WwiseWorld.set_global_parameter(wwise_world, "overcharge_status", overcharge_fraction)

		if not self.onscreen_particles_id and Development.parameter("screen_space_player_camera_reactions") ~= false then
			local first_person_extension = self.first_person_extension
			self.onscreen_particles_id = first_person_extension:create_screen_particles("fx/screenspace_overheat_indicator")
			self.critical_onscreen_particles_id = first_person_extension:create_screen_particles("fx/screenspace_overheat_critical")
		end

		local onscreen_particles_id = self.onscreen_particles_id

		if onscreen_particles_id then
			local charge_effect_material_name = "overlay"
			local charge_effect_material_variable_name = "intensity"

			World.set_particles_material_scalar(world, onscreen_particles_id, charge_effect_material_name, charge_effect_material_variable_name, overcharge_fraction * self._screen_particle_opacity_modifier)

			local critical_onscreen_particles_id = self.critical_onscreen_particles_id

			if self:is_above_critical_limit() then
				local critical_scalar = math.min(1, (self.overcharge_value - self.overcharge_critical_limit) / (self.max_value - self.overcharge_critical_limit) * 2)

				World.set_particles_material_scalar(world, critical_onscreen_particles_id, charge_effect_material_name, charge_effect_material_variable_name, critical_scalar * self._screen_particle_opacity_modifier)
			else
				World.set_particles_material_scalar(world, critical_onscreen_particles_id, charge_effect_material_name, charge_effect_material_variable_name, 0)
			end
		end
	end
end

PlayerUnitOverchargeExtension.add_charge = function (self, overcharge_amount, charge_level)
	local buff_extension = self.buff_extension

	if buff_extension:has_buff_type("twitch_no_overcharge_no_ammo_reloads") then
		return
	end

	local max_value = self.max_value
	local current_overcharge_value = self.overcharge_value
	local new_overcharge_value = nil

	if charge_level then
		overcharge_amount = 0.4 * overcharge_amount + 0.6 * overcharge_amount * charge_level
	end

	overcharge_amount = self.buff_extension:apply_buffs_to_value(overcharge_amount, StatBuffIndex.REDUCED_OVERCHARGE)

	if current_overcharge_value <= max_value * 0.97 and max_value < current_overcharge_value + overcharge_amount then
		self:hud_sound(self.overcharge_warning_critical_sound_event or "staff_overcharge_warning_critical", self.first_person_extension)

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

	self.overcharge_value = new_overcharge_value
end

PlayerUnitOverchargeExtension._check_overcharge_level_thresholds = function (self, new_overcharge_value)
	local buff_extension = self.buff_extension
	local max_value = self.max_value
	local overcharge_threshold = self.overcharge_threshold

	if max_value <= new_overcharge_value then
		local unit = self.unit

		StatusUtils.set_overcharge_exploding(unit, true)

		self.is_exploding = true
		local overcharged_critical_buff_id = self.overcharged_critical_buff_id

		if overcharged_critical_buff_id then
			buff_extension:remove_buff(overcharged_critical_buff_id)

			self.overcharged_critical_buff_id = nil
		end

		local overcharged_buff_id = self.overcharged_buff_id

		if overcharged_buff_id and self.overcharge_value < self.overcharge_limit then
			buff_extension:remove_buff(overcharged_buff_id)

			self.overcharged_buff_id = nil
		end
	elseif overcharge_threshold <= new_overcharge_value then
		if not self.above_threshold then
			self.above_threshold = true
			local wwise_world = Managers.world:wwise_world(self.world)

			WwiseWorld.trigger_event(wwise_world, self.hit_overcharge_threshold_sound)
			self:hud_sound(self.overcharge_warning_low_sound_event or "staff_overcharge_warning_low", self.first_person_extension)
		end

		local overcharge_limit = self.overcharge_limit
		local overcharge_critical_limit = self.overcharge_critical_limit

		if overcharge_critical_limit <= new_overcharge_value then
			if not self.overcharged_critical_buff_id then
				local overcharged_buff_id = self.overcharged_buff_id

				if overcharged_buff_id then
					buff_extension:remove_buff(overcharged_buff_id)

					self.overcharged_buff_id = false

					self:hud_sound(self.overcharge_warning_high_sound_event or "staff_overcharge_warning_high", self.first_person_extension)
				end

				if buff_extension:has_buff_type("sienna_unchained_passive") then
					self.overcharged_critical_buff_id = buff_extension:add_buff("overcharged_critical_no_attack_penalty")
				else
					self.overcharged_critical_buff_id = buff_extension:add_buff("overcharged_critical")
				end
			end

			local overcharge_rumble_overcharged_effect_id = self._overcharge_rumble_overcharged_effect_id

			if overcharge_rumble_overcharged_effect_id then
				Managers.state.controller_features:stop_effect(overcharge_rumble_overcharged_effect_id)

				self._overcharge_rumble_overcharged_effect_id = false
			end

			local overcharge_rumble_critical_effect_id = self._overcharge_rumble_critical_effect_id

			if overcharge_rumble_critical_effect_id then
				Managers.state.controller_features:stop_effect(overcharge_rumble_critical_effect_id)

				self._overcharge_rumble_critical_effect_id = false
			end

			self._overcharge_rumble_critical_effect_id = Managers.state.controller_features:add_effect("rumble", {
				rumble_effect = "overcharge_rumble_crit"
			})
		elseif overcharge_limit <= new_overcharge_value then
			local dialogue_input = ScriptUnit.extension_input(self.unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()
			local event_name = "overcharge"

			dialogue_input:trigger_dialogue_event(event_name, event_data)

			if not self.overcharged_buff_id and not self.overcharged_critical_buff_id then
				self:hud_sound(self.overcharge_warning_med_sound_event or "staff_overcharge_warning_med", self.first_person_extension)

				if buff_extension:has_buff_type("sienna_unchained_passive") then
					self.overcharged_buff_id = buff_extension:add_buff("overcharged_no_attack_penalty")
				else
					self.overcharged_buff_id = buff_extension:add_buff("overcharged")
				end
			end

			local overcharge_rumble_effect_id = self._overcharge_rumble_effect_id

			if overcharge_rumble_effect_id then
				Managers.state.controller_features:stop_effect(overcharge_rumble_effect_id)

				self._overcharge_rumble_effect_id = false
			end

			local overcharge_rumble_overcharged_effect_id = self._overcharge_rumble_overcharged_effect_id

			if overcharge_rumble_overcharged_effect_id then
				Managers.state.controller_features:stop_effect(overcharge_rumble_overcharged_effect_id)

				self._overcharge_rumble_overcharged_effect_id = false
			end

			self._overcharge_rumble_overcharged_effect_id = Managers.state.controller_features:add_effect("rumble", {
				rumble_effect = "overcharge_rumble_overcharged"
			})
		else
			local overcharge_rumble_effect_id = self._overcharge_rumble_effect_id

			if overcharge_rumble_effect_id then
				Managers.state.controller_features:stop_effect(overcharge_rumble_effect_id)

				self._overcharge_rumble_effect_id = false
			end

			self._overcharge_rumble_effect_id = Managers.state.controller_features:add_effect("rumble", {
				rumble_effect = "overcharge_rumble"
			})
		end
	end
end

PlayerUnitOverchargeExtension.hud_sound = function (self, event, fp_extension)
	fp_extension:play_hud_sound_event(event)
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

PlayerUnitOverchargeExtension.overcharge_fraction = function (self)
	return self.overcharge_value / self.max_value
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

return
