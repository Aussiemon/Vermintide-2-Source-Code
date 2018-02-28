ActionCharge = class(ActionCharge)
ActionCharge.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	self.world = world
	self.owner_unit = owner_unit
	self.weapon_unit = weapon_unit
	self.first_person_unit = first_person_unit
	self.weapon_system = weapon_system
	self.item_name = item_name
	self.wwise_world = Managers.world:wwise_world(world)
	self._rumble_effect_id = nil

	if ScriptUnit.has_extension(owner_unit, "inventory_system") then
		local inventory_extension = ScriptUnit.extension(self.owner_unit, "inventory_system")
		local slot_name = inventory_extension.get_wielded_slot_name(inventory_extension)
		local slot_data = inventory_extension.get_slot_data(inventory_extension, slot_name)
		self.left_unit = slot_data.left_unit_1p
	end

	self.first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	self.is_server = is_server
	self.overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")

	if ScriptUnit.has_extension(owner_unit, "status_system") then
		self.status_extension = ScriptUnit.extension(owner_unit, "status_system")
	end

	if ScriptUnit.has_extension(weapon_unit, "spread_system") then
		self.spread_extension = ScriptUnit.extension(weapon_unit, "spread_system")
	end

	return 
end
ActionCharge.client_owner_start_action = function (self, new_action, t)
	local owner_unit = self.owner_unit
	self.current_action = new_action
	self.charge_ready_sound_event = self.current_action.charge_ready_sound_event
	self.venting_overcharge = nil
	local overcharge_extension = self.overcharge_extension

	if new_action.vent_overcharge and overcharge_extension and 0 < overcharge_extension.get_overcharge_value(overcharge_extension) then
		overcharge_extension.vent_overcharge(overcharge_extension)

		self.venting_overcharge = true
	end

	self.total_overcharge_added = 0
	self.remove_overcharge_on_interrupt = new_action.remove_overcharge_on_interrupt
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self.charge_level = 0
	self.charge_time = buff_extension.apply_buffs_to_value(buff_extension, new_action.charge_time, StatBuffIndex.REDUCED_RANGED_CHARGE_TIME)
	self.charge_complete_time = self.charge_time + t
	self.overcharge_timer = 0
	local charge_effect_name = new_action.charge_effect_name

	if charge_effect_name then
		local unit = self.weapon_unit
		local node = Unit.node(unit, "fx_muzzle")
		self.particle_id = ScriptWorld.create_particles_linked(self.world, charge_effect_name, unit, node, "destroy")

		if self.left_unit then
			local left_node = Unit.node(self.left_unit, "fx_muzzle")
			self.left_particle_id = ScriptWorld.create_particles_linked(self.world, charge_effect_name, self.left_unit, left_node, "destroy")
		end
	end

	local owner_player = Managers.player:owner(owner_unit)
	local is_bot = owner_player and owner_player.bot_player

	if not is_bot then
		local charge_sound_name = new_action.charge_sound_name

		if charge_sound_name then
			local wwise_playing_id, wwise_source_id = ActionUtils.start_charge_sound(self.wwise_world, self.weapon_unit, owner_unit, new_action)
			self.charging_sound_id = wwise_playing_id
			self.wwise_source_id = wwise_source_id
		end
	end

	local charge_sound_husk_name = self.current_action.charge_sound_husk_name

	if charge_sound_husk_name then
		ActionUtils.play_husk_sound_event(charge_sound_husk_name, owner_unit)
	end

	local spread_template_override = new_action.spread_template_override

	if spread_template_override then
		self.spread_extension:override_spread_template(spread_template_override)
	end

	if new_action.zoom then
		local status_extension = ScriptUnit.extension(self.owner_unit, "status_system")

		if not status_extension.is_zooming(status_extension) then
			status_extension.set_zooming(status_extension, true)
		end
	end

	local loaded_projectile_settings = new_action.loaded_projectile_settings

	if loaded_projectile_settings then
		local inventory_extension = ScriptUnit.extension(self.owner_unit, "inventory_system")

		inventory_extension.set_loaded_projectile_override(inventory_extension, loaded_projectile_settings)
	end

	return 
end
ActionCharge.client_owner_post_update = function (self, dt, t, world, can_damage)
	local current_action = self.current_action
	local charge_time = self.charge_time
	local charge_complete_time = self.charge_complete_time
	local full_charge_time = charge_complete_time - t
	local overcharge_type = current_action.overcharge_type
	local current_charge_time = nil

	if 0 < full_charge_time and 0 < charge_time then
		current_charge_time = full_charge_time/charge_time - 1
	elseif (0 < full_charge_time and charge_time <= 0) or (full_charge_time <= 0 and 0 < charge_time) or (full_charge_time <= 0 and charge_time <= 0) then
		current_charge_time = 1
	end

	local charge_level = math.max(math.min(current_charge_time, 1), 0)
	local overcharge_extension = self.overcharge_extension
	local inventory_extension = ScriptUnit.extension(self.owner_unit, "inventory_system")

	if overcharge_type and overcharge_extension.get_overcharge_value(overcharge_extension) == 0 and self.venting_overcharge then
		CharacterStateHelper.stop_weapon_actions(inventory_extension, "no_more_overcharge")
	end

	if current_action.overcharge_interval then
		self.overcharge_timer = self.overcharge_timer + dt

		if current_action.overcharge_interval <= self.overcharge_timer then
			if overcharge_type then
				local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[overcharge_type]

				if self.remove_overcharge_on_interrupt and current_charge_time == 1 then
					overcharge_amount = PlayerUnitStatusSettings.overcharge_values.drakegun_charging
				end

				self.overcharge_extension:add_charge(overcharge_amount)

				self.total_overcharge_added = self.total_overcharge_added + overcharge_amount
			end

			self.overcharge_timer = 0
		end
	end

	local charge_anim_variable = current_action.charge_anim_variable

	if charge_anim_variable then
		self.first_person_extension:animation_set_variable(current_action.charge_anim_variable, charge_level)
	end

	local particle_id = self.particle_id
	local charge_effect_material_name = current_action.charge_effect_material_name
	local charge_effect_material_variable_name = current_action.charge_effect_material_variable_name

	if charge_effect_material_name and charge_effect_material_variable_name and particle_id then
		local world = self.world

		if World.has_particles_material(world, particle_id, charge_effect_material_name) then
			World.set_particles_material_scalar(world, particle_id, charge_effect_material_name, charge_effect_material_variable_name, charge_level)
		end
	end

	local left_particle_id = self.left_particle_id
	local left_charge_effect_material_name = current_action.charge_effect_material_name
	local left_charge_effect_material_variable_name = current_action.charge_effect_material_variable_name

	if left_charge_effect_material_name and left_charge_effect_material_variable_name and left_particle_id then
		local world = self.world

		if World.has_particles_material(world, left_particle_id, left_charge_effect_material_name) then
			World.set_particles_material_scalar(world, left_particle_id, left_charge_effect_material_name, left_charge_effect_material_variable_name, charge_level)
		end
	end

	local owner_unit = self.owner_unit
	local owner_player = Managers.player:owner(owner_unit)
	local is_bot = owner_player and owner_player.bot_player

	if not is_bot then
		local charge_sound_parameter_name = current_action.charge_sound_parameter_name

		if charge_sound_parameter_name then
			local wwise_world = self.wwise_world
			local wwise_source_id = self.wwise_source_id

			WwiseWorld.set_source_parameter(wwise_world, wwise_source_id, charge_sound_parameter_name, charge_level)
		end

		if self.charge_ready_sound_event and 1 <= charge_level then
			self.first_person_extension:play_hud_sound_event(self.charge_ready_sound_event)

			self.charge_ready_sound_event = nil
		end
	end

	if 1 <= charge_level and not Managers.player:owner(self.owner_unit).bot_player and not self._rumble_effect_id then
		self._rumble_effect_id = Managers.state.controller_features:add_effect("persistent_rumble", {
			rumble_effect = "reload_start"
		})
	end

	self.charge_level = charge_level

	return 
end
ActionCharge.finish = function (self, reason)
	local owner_unit = self.owner_unit
	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	local first_person_unit = self.first_person_unit
	local current_action = self.current_action

	if self.particle_id then
		World.destroy_particles(self.world, self.particle_id)

		self.particle_id = nil
	end

	if self.left_particle_id then
		World.destroy_particles(self.world, self.left_particle_id)

		self.left_particle_id = nil
	end

	local overcharge_extension = self.overcharge_extension

	if current_action.vent_overcharge and overcharge_extension then
		overcharge_extension.vent_overcharge_done(overcharge_extension)
	end

	if self.remove_overcharge_on_interrupt then
		if reason == "interrupted" then
			overcharge_extension.remove_charge(overcharge_extension, self.total_overcharge_added*0.75)
		elseif reason == "hold_input_released" then
			overcharge_extension.remove_charge(overcharge_extension, self.total_overcharge_added*0.5)
		end
	end

	if reason == "hold_input_released" or reason == "weapon_wielded" then
		Unit.flow_event(first_person_unit, "lua_charge_cancel")
	end

	if self._rumble_effect_id then
		Managers.state.controller_features:stop_effect(self._rumble_effect_id)

		self._rumble_effect_id = nil
	end

	local charging_sound_id = self.charging_sound_id

	if charging_sound_id then
		ActionUtils.stop_charge_sound(self.wwise_world, charging_sound_id, self.wwise_source_id, self.current_action)

		self.wwise_source_id = nil
		self.charging_sound_id = nil
	end

	if self.spread_extension then
		self.spread_extension:reset_spread_template()
	end

	if current_action.zoom then
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")

		status_extension.set_zooming(status_extension, false)
	end

	local inventory_extension = ScriptUnit.extension(self.owner_unit, "inventory_system")

	inventory_extension.set_loaded_projectile_override(inventory_extension, nil)

	local charge_sound_husk_stop_event = current_action.charge_sound_husk_stop_event

	if charge_sound_husk_stop_event then
		ActionUtils.play_husk_sound_event(charge_sound_husk_stop_event, owner_unit)
	end

	return {
		charge_level = self.charge_level
	}
end
ActionCharge.destroy = function (self)
	if self.particle_id then
		World.destroy_particles(self.world, self.particle_id)

		self.particle_id = nil
	end

	if self.left_particle_id then
		World.destroy_particles(self.world, self.left_particle_id)

		self.left_particle_id = nil
	end

	local charging_sound_id = self.charging_sound_id

	if charging_sound_id then
		ActionUtils.stop_charge_sound(self.wwise_world, charging_sound_id, self.wwise_source_id, self.current_action)

		self.wwise_source_id = nil
		self.charging_sound_id = nil
	end

	if self._rumble_effect_id then
		Managers.state.controller_features:stop_effect(self._rumble_effect_id)

		self._rumble_effect_id = nil
	end

	return 
end

return 
