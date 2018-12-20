ActionCharge = class(ActionCharge, ActionBase)

ActionCharge.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCharge.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	if ScriptUnit.has_extension(owner_unit, "inventory_system") then
		local inventory_extension = ScriptUnit.extension(self.owner_unit, "inventory_system")
		local slot_name = inventory_extension:get_wielded_slot_name()
		local slot_data = inventory_extension:get_slot_data(slot_name)
		self.left_unit = slot_data.left_unit_1p
	end

	if ScriptUnit.has_extension(owner_unit, "status_system") then
		self.status_extension = ScriptUnit.extension(owner_unit, "status_system")
	end

	if ScriptUnit.has_extension(weapon_unit, "spread_system") then
		self.spread_extension = ScriptUnit.extension(weapon_unit, "spread_system")
	end

	self.overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
	self.first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	self._rumble_effect_id = nil
end

ActionCharge.client_owner_start_action = function (self, new_action, t)
	local owner_unit = self.owner_unit
	self.current_action = new_action
	self.charge_ready_sound_event = self.current_action.charge_ready_sound_event
	self.venting_overcharge = nil
	self._max_charge = false
	local overcharge_extension = self.overcharge_extension

	if new_action.vent_overcharge and overcharge_extension and overcharge_extension:get_overcharge_value() > 0 then
		overcharge_extension:vent_overcharge()

		self.venting_overcharge = true
	end

	self.total_overcharge_added = 0
	self.remove_overcharge_on_interrupt = new_action.remove_overcharge_on_interrupt
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self.charge_level = 0
	self.charge_time = buff_extension:apply_buffs_to_value(new_action.charge_time, StatBuffIndex.REDUCED_RANGED_CHARGE_TIME)
	self.charge_complete_time = self.charge_time + t
	self.overcharge_timer = 0

	if not new_action.vent_overcharge then
		Unit.flow_event(self.first_person_unit, "lua_charge_start")
	end

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

	self:_start_charge_sound()

	local spread_template_override = new_action.spread_template_override

	if spread_template_override then
		self.spread_extension:override_spread_template(spread_template_override)
	end

	if new_action.zoom then
		local status_extension = ScriptUnit.extension(self.owner_unit, "status_system")

		if not status_extension:is_zooming() then
			status_extension:set_zooming(true)
		end
	end

	local loaded_projectile_settings = new_action.loaded_projectile_settings

	if loaded_projectile_settings then
		local inventory_extension = ScriptUnit.extension(self.owner_unit, "inventory_system")

		inventory_extension:set_loaded_projectile_override(loaded_projectile_settings)
	end
end

ActionCharge._start_charge_sound = function (self)
	local current_action = self.current_action
	local owner_unit = self.owner_unit
	local owner_player = self.owner_player
	local is_bot = owner_player and owner_player.bot_player
	local is_local = owner_player and not owner_player.remote
	local wwise_world = self.wwise_world

	if is_local and not is_bot then
		local wwise_playing_id, wwise_source_id = ActionUtils.start_charge_sound(wwise_world, self.weapon_unit, owner_unit, current_action)
		self.charging_sound_id = wwise_playing_id
		self.wwise_source_id = wwise_source_id
	end

	ActionUtils.play_husk_sound_event(wwise_world, current_action.charge_sound_husk_name, owner_unit, is_bot)
end

ActionCharge._stop_charge_sound = function (self)
	local current_action = self.current_action
	local owner_unit = self.owner_unit
	local owner_player = self.owner_player
	local is_bot = owner_player and owner_player.bot_player
	local is_local = owner_player and not owner_player.remote
	local wwise_world = self.wwise_world

	if is_local and not is_bot then
		ActionUtils.stop_charge_sound(wwise_world, self.charging_sound_id, self.wwise_source_id, current_action)

		self.charging_sound_id = nil
		self.wwise_source_id = nil
	end

	ActionUtils.play_husk_sound_event(wwise_world, current_action.charge_sound_husk_stop_event, owner_unit, is_bot)
end

ActionCharge.client_owner_post_update = function (self, dt, t, world, can_damage)
	local current_action = self.current_action
	local charge_time = self.charge_time
	local charge_complete_time = self.charge_complete_time
	local full_charge_time = charge_complete_time - t
	local overcharge_type = current_action.overcharge_type
	local current_charge_time = nil

	if full_charge_time > 0 and charge_time > 0 then
		current_charge_time = 1 - full_charge_time / charge_time
	elseif (full_charge_time > 0 and charge_time <= 0) or (full_charge_time <= 0 and charge_time > 0) or (full_charge_time <= 0 and charge_time <= 0) then
		current_charge_time = 1
	end

	local charge_level = math.max(math.min(current_charge_time, 1), 0)

	if not current_action.vent_overcharge and charge_level >= 1 and not self._max_charge then
		self._max_charge = true

		Unit.flow_event(self.first_person_unit, "lua_max_charge")
	end

	local overcharge_extension = self.overcharge_extension
	local inventory_extension = ScriptUnit.extension(self.owner_unit, "inventory_system")
	local career_extension = ScriptUnit.extension(self.owner_unit, "career_system")

	if overcharge_type and overcharge_extension:get_overcharge_value() == 0 and self.venting_overcharge then
		CharacterStateHelper.stop_weapon_actions(inventory_extension, "no_more_overcharge")
		CharacterStateHelper.stop_career_abilities(career_extension, "no_more_overcharge")
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

	if charge_effect_material_name and charge_effect_material_variable_name and particle_id and World.has_particles_material(world, particle_id, charge_effect_material_name) then
		World.set_particles_material_scalar(world, particle_id, charge_effect_material_name, charge_effect_material_variable_name, charge_level)
	end

	local left_particle_id = self.left_particle_id
	local left_charge_effect_material_name = current_action.charge_effect_material_name
	local left_charge_effect_material_variable_name = current_action.charge_effect_material_variable_name

	if left_charge_effect_material_name and left_charge_effect_material_variable_name and left_particle_id and World.has_particles_material(world, left_particle_id, left_charge_effect_material_name) then
		World.set_particles_material_scalar(world, left_particle_id, left_charge_effect_material_name, left_charge_effect_material_variable_name, charge_level)
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

		if self.charge_ready_sound_event and charge_level >= 1 then
			self.first_person_extension:play_hud_sound_event(self.charge_ready_sound_event)

			self.charge_ready_sound_event = nil
		end
	end

	if charge_level >= 1 and not Managers.player:owner(self.owner_unit).bot_player and not self._rumble_effect_id then
		self._rumble_effect_id = Managers.state.controller_features:add_effect("persistent_rumble", {
			rumble_effect = "reload_start"
		})
	end

	self.charge_level = charge_level
end

ActionCharge._clean_up = function (self)
	if self.particle_id then
		World.destroy_particles(self.world, self.particle_id)

		self.particle_id = nil
	end

	if self.left_particle_id then
		World.destroy_particles(self.world, self.left_particle_id)

		self.left_particle_id = nil
	end

	if self._rumble_effect_id then
		Managers.state.controller_features:stop_effect(self._rumble_effect_id)

		self._rumble_effect_id = nil
	end

	self:_stop_charge_sound()
end

ActionCharge.finish = function (self, reason)
	local owner_unit = self.owner_unit
	local first_person_unit = self.first_person_unit
	local current_action = self.current_action

	self:_clean_up()

	local overcharge_extension = self.overcharge_extension

	if current_action.vent_overcharge and overcharge_extension then
		overcharge_extension:vent_overcharge_done()
	end

	if self.remove_overcharge_on_interrupt then
		if reason == "interrupted" then
			overcharge_extension:remove_charge(self.total_overcharge_added * 0.75)
		elseif reason == "hold_input_released" then
			overcharge_extension:remove_charge(self.total_overcharge_added * 0.5)
		end
	end

	if reason == "hold_input_released" or reason == "weapon_wielded" then
		Unit.flow_event(first_person_unit, "lua_charge_cancel")
	end

	Unit.flow_event(first_person_unit, "lua_charge_stop")

	if self.spread_extension then
		self.spread_extension:reset_spread_template()
	end

	if current_action.zoom then
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")

		status_extension:set_zooming(false)
	end

	local inventory_extension = ScriptUnit.extension(self.owner_unit, "inventory_system")

	inventory_extension:set_loaded_projectile_override(nil)

	return {
		charge_level = self.charge_level
	}
end

ActionCharge.destroy = function (self)
	self:_clean_up()
end

return
