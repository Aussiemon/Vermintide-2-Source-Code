require("scripts/unit_extensions/default_player_unit/charge/overcharge_data")

PlayerUnitOverchargeExtension = class(PlayerUnitOverchargeExtension)
script_data.overcharge_debug = script_data.overcharge_debug or Development.parameter("overcharge_debug")
script_data.disable_overcharge = script_data.disable_overcharge or Development.parameter("disable_overcharge")
PlayerUnitOverchargeExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.world = extension_init_context.world
	self.unit = unit
	local overcharge_data = extension_init_data.overcharge_data
	local ammo_percent = extension_init_data.ammo_percent or 1
	self.ammo_percent = ammo_percent
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
	self.first_person_unit = first_person_extension.get_first_person_unit(first_person_extension)
	self.overcharge_blend_id = Unit.animation_find_variable(self.first_person_unit, "overcharge")
	self.inventory_extension = ScriptUnit.extension(self.unit, "inventory_system")
	self.update_overcharge_flow_timer = 0
	self.is_exploding = false

	self.set_screen_particle_opacity_modifier(self, Application.user_setting("overcharge_opacity"))

	self._overcharge_rumble_effect_id = nil
	self._overcharge_rumble_critical_effect_id = nil
	self._overcharge_rumble_overcharged_effect_id = nil

	return 
end
PlayerUnitOverchargeExtension.extensions_ready = function (self, world, unit)
	local buff_extension = ScriptUnit.extension(self.unit, "buff_system")
	self.buff_extension = buff_extension
	self.original_max_value = self.max_value
	local max_value = buff_extension.apply_buffs_to_value(buff_extension, self.max_value, StatBuffIndex.MAX_OVERCHARGE)
	local ammo_percent = self.ammo_percent
	self.max_value = max_value
	self.overcharge_value = (ammo_percent and (1 - ammo_percent) * max_value) or 0
	self.overcharge_limit = max_value * 0.65
	self.overcharge_critical_limit = max_value * 0.8

	return 
end
PlayerUnitOverchargeExtension.set_screen_particle_opacity_modifier = function (self, value)
	self._screen_particle_opacity_modifier = value / 100

	return 
end
PlayerUnitOverchargeExtension.reset = function (self)
	local buff_extension = self.buff_extension
	local has_buff_extension = ScriptUnit.has_extension(self.unit, "buff_system")
	local overcharged_critical_buff_id = self.overcharged_critical_buff_id
	local overcharged_buff_id = self.overcharged_buff_id

	if has_buff_extension and buff_extension.active_buffs(buff_extension) then
		if overcharged_critical_buff_id then
			buff_extension.remove_buff(buff_extension, overcharged_critical_buff_id)

			self.overcharged_critical_buff_id = nil
		end

		if overcharged_buff_id and self.overcharge_value < self.overcharge_limit then
			buff_extension.remove_buff(buff_extension, overcharged_buff_id)

			self.overcharged_buff_id = nil
		end
	end

	self.overcharge_value = 0
	self.played_hit_overcharge_threshold = false
	self.is_exploding = false

	StatusUtils.set_overcharge_exploding(self.unit, false)
	self.set_animation_variable(self)

	return 
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

	if has_buff_extension and buff_extension.active_buffs(buff_extension) then
		if overcharged_critical_buff_id then
			buff_extension.remove_buff(buff_extension, overcharged_critical_buff_id)

			self.overcharged_critical_buff_id = nil
		end

		if overcharged_buff_id and self.overcharge_value < self.overcharge_limit then
			buff_extension.remove_buff(buff_extension, overcharged_buff_id)

			self.overcharged_buff_id = nil
		end
	end

	return 
end
PlayerUnitOverchargeExtension.set_animation_variable = function (self)
	local first_person_unit = self.first_person_unit
	local overcharge_blend_id = self.overcharge_blend_id
	local anim_blend_overcharge = self.get_anim_blend_overcharge(self)

	Unit.animation_set_variable(first_person_unit, overcharge_blend_id, anim_blend_overcharge)

	return 
end
PlayerUnitOverchargeExtension.update = function (self, unit, input, dt, context, t)
	local world = self.world

	if not self.is_exploding and self.venting_overcharge and 0 <= self.overcharge_value then
		local buff_extension = self.buff_extension
		local wielder = self.unit
		local vent_speed = buff_extension.apply_buffs_to_value(buff_extension, dt, StatBuffIndex.VENT_SPEED)
		local vent_amount = self.overcharge_value * self.original_max_value / 80 * vent_speed
		self.vent_damage_pool = self.vent_damage_pool + vent_amount * 2
		self.overcharge_value = self.overcharge_value - vent_amount

		if 20 <= self.vent_damage_pool and not self.no_damage and self.overcharge_threshold < self.overcharge_value then
			local damage_amount = 2 + self.overcharge_value / 12
			damage_amount = buff_extension.apply_buffs_to_value(buff_extension, damage_amount, StatBuffIndex.VENT_DAMAGE)

			DamageUtils.add_damage_network(wielder, wielder, damage_amount, "torso", "overcharge", Vector3(0, 1, 0), "overcharge")

			self.vent_damage_pool = 0
		end
	else
		self.venting_overcharge = false
	end

	if 0 <= self.overcharge_value then
		self.set_animation_variable(self)
	end

	if self.venting_anim then
		Unit.animation_event(self.first_person_unit, self.venting_anim)

		self.venting_anim = nil
	end

	if script_data.overcharge_debug then
		if DebugKeyHandler.key_pressed("v", "fill overcharge", "player", "left shift") then
			local amount = PlayerUnitStatusSettings.overcharge_values.overcharge_debug_value

			self.add_charge(self, amount)
		end

		Debug.text("overCharge level: " .. tostring(self.overcharge_value))
	end

	local buff_extension = self.buff_extension

	if 0 < self.overcharge_value or buff_extension.has_buff_type(buff_extension, "sienna_unchained_activated_ability") then
		if self.update_overcharge_flow_timer < t and not self.venting_overcharge then
			self.set_animation_variable(self)

			self.update_overcharge_flow_timer = t + 0.3
		end

		self.has_overcharge = true

		if not self.is_exploding and self.time_when_overcharge_start_decreasing < t then
			local decay = 1

			if self.above_threshold then
				decay = decay * 0.6
			end

			local value = decay * self.overcharge_value_decrease_rate * dt
			value = self.overcharge_value - buff_extension.apply_buffs_to_value(buff_extension, value, StatBuffIndex.OVERCHARGE_REGEN)

			if buff_extension.has_buff_type(buff_extension, "sienna_unchained_activated_ability") and self.max_value <= value then
				self.add_charge(self, 1)
			end

			self.overcharge_value = math.min(math.max(0, value), self.max_value)
			local overcharged_critical_buff_id = self.overcharged_critical_buff_id
			local overcharged_buff_id = self.overcharged_buff_id

			if overcharged_critical_buff_id and self.overcharge_value < self.overcharge_critical_limit then
				buff_extension.remove_buff(buff_extension, overcharged_critical_buff_id)

				self.overcharged_critical_buff_id = nil
			elseif overcharged_buff_id and self.overcharge_value < self.overcharge_limit then
				buff_extension.remove_buff(buff_extension, overcharged_buff_id)

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
	local overcharge_scalar = self.overcharge_value / self.max_value

	if not is_bot then
		local wwise_world = Managers.world:wwise_world(world)

		WwiseWorld.set_global_parameter(wwise_world, "overcharge_status", overcharge_scalar)
	end

	if script_data.overcharge_debug then
		print(overcharge_scalar)
	end

	if not self.onscreen_particles_id and not is_bot and Development.parameter("screen_space_player_camera_reactions") ~= false then
		local first_person_extension = self.first_person_extension
		self.onscreen_particles_id = first_person_extension.create_screen_particles(first_person_extension, "fx/screenspace_overheat_indicator")
		self.critical_onscreen_particles_id = first_person_extension.create_screen_particles(first_person_extension, "fx/screenspace_overheat_critical")
	end

	local onscreen_particles_id = self.onscreen_particles_id

	if onscreen_particles_id then
		local charge_effect_material_name = "overlay"
		local charge_effect_material_variable_name = "intensity"

		World.set_particles_material_scalar(world, onscreen_particles_id, charge_effect_material_name, charge_effect_material_variable_name, overcharge_scalar * self._screen_particle_opacity_modifier)

		local critical_onscreen_particles_id = self.critical_onscreen_particles_id

		if self.is_above_critical_limit(self) then
			local critical_scalar = math.min(1, (self.overcharge_value - self.overcharge_critical_limit) / (self.max_value - self.overcharge_critical_limit) * 2)

			World.set_particles_material_scalar(world, critical_onscreen_particles_id, charge_effect_material_name, charge_effect_material_variable_name, critical_scalar * self._screen_particle_opacity_modifier)
		else
			World.set_particles_material_scalar(world, critical_onscreen_particles_id, charge_effect_material_name, charge_effect_material_variable_name, 0)
		end
	end

	return 
end
PlayerUnitOverchargeExtension.add_charge = function (self, overcharge_amount, charge_level)
	if script_data.disable_overcharge then
		return 
	end

	local buff_extension = self.buff_extension

	if buff_extension.has_buff_type(buff_extension, "twitch_no_overcharge_no_ammo_reloads") then
		return 
	end

	local threshold = self.overcharge_threshold
	local current_overcharge_value = self.overcharge_value

	if charge_level then
		overcharge_amount = 0.4 * overcharge_amount + 0.6 * overcharge_amount * charge_level
	end

	overcharge_amount = self.buff_extension:apply_buffs_to_value(overcharge_amount, StatBuffIndex.REDUCED_OVERCHARGE)

	if current_overcharge_value <= self.max_value * 0.97 and self.max_value < current_overcharge_value + overcharge_amount then
		PlayerUnitOverchargeExtension:hud_sound(self.overcharge_warning_critical_sound_event or "staff_overcharge_warning_critical", self.first_person_extension)

		current_overcharge_value = self.max_value - 0.1
	else
		current_overcharge_value = math.min(current_overcharge_value + overcharge_amount, self.max_value)
	end

	if self.max_value <= current_overcharge_value then
		local unit = self.unit

		StatusUtils.set_overcharge_exploding(unit, true)

		self.is_exploding = true
		local overcharged_critical_buff_id = self.overcharged_critical_buff_id
		local overcharged_buff_id = self.overcharged_buff_id

		if overcharged_critical_buff_id then
			buff_extension.remove_buff(buff_extension, overcharged_critical_buff_id)

			self.overcharged_critical_buff_id = nil
		end

		if overcharged_buff_id and self.overcharge_value < self.overcharge_limit then
			buff_extension.remove_buff(buff_extension, overcharged_buff_id)

			self.overcharged_buff_id = nil
		end
	elseif threshold <= current_overcharge_value then
		if not self.above_threshold then
			self.above_threshold = true
			local wwise_world = Managers.world:wwise_world(self.world)

			WwiseWorld.trigger_event(wwise_world, self.hit_overcharge_threshold_sound)
			PlayerUnitOverchargeExtension:hud_sound(self.overcharge_warning_low_sound_event or "staff_overcharge_warning_low", self.first_person_extension)
		end

		if self.overcharge_critical_limit <= current_overcharge_value then
			if not self.overcharged_critical_buff_id then
				local overcharged_buff_id = self.overcharged_buff_id

				if overcharged_buff_id then
					buff_extension.remove_buff(buff_extension, overcharged_buff_id)

					self.overcharged_buff_id = false

					PlayerUnitOverchargeExtension:hud_sound(self.overcharge_warning_high_sound_event or "staff_overcharge_warning_high", self.first_person_extension)
				end

				if buff_extension.has_buff_type(buff_extension, "sienna_unchained_passive") then
					self.overcharged_critical_buff_id = buff_extension.add_buff(buff_extension, "overcharged_critical_no_attack_penalty")
				else
					self.overcharged_critical_buff_id = buff_extension.add_buff(buff_extension, "overcharged_critical")
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
		elseif self.overcharge_limit <= current_overcharge_value then
			local dialogue_input = ScriptUnit.extension_input(self.unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()
			local event_name = "overcharge"

			dialogue_input.trigger_dialogue_event(dialogue_input, event_name, event_data)

			if not self.overcharged_buff_id and not self.overcharged_critical_buff_id then
				PlayerUnitOverchargeExtension:hud_sound(self.overcharge_warning_med_sound_event or "staff_overcharge_warning_med", self.first_person_extension)

				if buff_extension.has_buff_type(buff_extension, "sienna_unchained_passive") then
					self.overcharged_buff_id = buff_extension.add_buff(buff_extension, "overcharged_no_attack_penalty")
				else
					self.overcharged_buff_id = buff_extension.add_buff(buff_extension, "overcharged")
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

	self.time_when_overcharge_start_decreasing = Managers.time:time("game") + self.time_until_overcharge_decreases
	self.overcharge_value = current_overcharge_value

	return 
end
PlayerUnitOverchargeExtension.remove_charge = function (self, amount)
	self.overcharge_value = math.max(self.overcharge_value - amount, 0)

	return 
end
PlayerUnitOverchargeExtension.hud_sound = function (self, event, fp_extension)
	fp_extension.play_hud_sound_event(fp_extension, event)

	return 
end
PlayerUnitOverchargeExtension.get_overcharge_value = function (self)
	return self.overcharge_value
end
PlayerUnitOverchargeExtension.is_above_critical_limit = function (self)
	return self.overcharge_critical_limit <= self.overcharge_value
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
	local value = self.get_overcharge_value(self)
	local threshold = self.get_overcharge_threshold(self)
	local max_value = self.get_max_value(self)

	return value, threshold, max_value
end
PlayerUnitOverchargeExtension.vent_overcharge = function (self)
	self.venting_overcharge = true

	if 0 < self.overcharge_value then
		self.vent_damage_pool = 20
	else
		self.vent_damage_pool = 0
	end

	self.venting_anim = "cooldown_start"

	return 
end
PlayerUnitOverchargeExtension.vent_overcharge_done = function (self)
	self.venting_overcharge = false
	self.venting_anim = "cooldown_end"

	return 
end
PlayerUnitOverchargeExtension.get_anim_blend_overcharge = function (self)
	local overcharge_value = self.overcharge_value
	local overcharge_threshold = self.overcharge_threshold
	local max_value = self.max_value
	local anim_blend_value = math.clamp((overcharge_value - overcharge_threshold) / (max_value - overcharge_threshold), 0, 1)

	return anim_blend_value
end

return 
