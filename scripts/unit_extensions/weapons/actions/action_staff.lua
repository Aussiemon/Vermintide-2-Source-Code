ActionStaff = class(ActionStaff)

ActionStaff.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	self.owner_unit = owner_unit
	self.weapon_unit = weapon_unit
	self.is_server = is_server
	self.item_name = item_name
	self.wwise_world = Managers.world:wwise_world(world)
	self.world = world

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end

	if ScriptUnit.has_extension(weapon_unit, "spread_system") then
		self.spread_extension = ScriptUnit.extension(weapon_unit, "spread_system")
	end

	self.overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
	self._is_critical_strike = false
end

ActionStaff.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	self.current_action = new_action
	local weapon_unit = self.weapon_unit
	local owner_unit = self.owner_unit
	local first_person_unit = self.first_person_unit
	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, new_action, t)
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self.state = "waiting_to_shoot"
	self.time_to_shoot = t + (new_action.fire_time or 0)
	self.power_level = power_level

	if is_critical_strike then
		Unit.flow_event(owner_unit, "vfx_critical_strike")
		Unit.flow_event(first_person_unit, "vfx_critical_strike")

		local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

		if hud_extension then
			hud_extension.show_critical_indication = true
		end
	end

	self._is_critical_strike = is_critical_strike
end

ActionStaff.client_owner_post_update = function (self, dt, t, world, can_damage)
	local current_action = self.current_action

	if self.state == "waiting_to_shoot" and self.time_to_shoot <= t then
		self.state = "shooting"
	end

	if self.state == "shooting" then
		self:fire()

		self.state = "shot"
	end
end

ActionStaff.finish = function (self, reason)
	local hud_extension = ScriptUnit.has_extension(self.owner_unit, "hud_system")

	if hud_extension then
		hud_extension.show_critical_indication = false
	end
end

ActionStaff.fire = function (self, reason)
	local current_action = self.current_action
	local owner_unit = self.owner_unit
	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	local rotation = first_person_extension:current_rotation()
	local spread_extension = self.spread_extension

	if spread_extension then
		rotation = spread_extension:get_randomised_spread(rotation)

		spread_extension:set_shooting()
	end

	local angle = ActionUtils.pitch_from_rotation(rotation)
	local speed = current_action.speed
	local position = first_person_extension:current_position()
	local target_vector = Vector3.normalize(Vector3.flat(Quaternion.forward(rotation)))
	local projectile_info = current_action.projectile_info
	local lookup_data = current_action.lookup_data

	ActionUtils.spawn_player_projectile(owner_unit, position, rotation, 0, angle, target_vector, speed, self.item_name, lookup_data.item_template_name, lookup_data.action_name, lookup_data.sub_action_name, self._is_critical_strike, self.power_level)

	if self.ammo_extension then
		local ammo_usage = current_action.ammo_usage

		self.ammo_extension:use_ammo(ammo_usage)
	end

	local overcharge_type = current_action.overcharge_type

	if overcharge_type then
		local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[overcharge_type]

		self.overcharge_extension:add_charge(overcharge_amount)
	end

	if self.ammo_extension and self.ammo_extension:can_reload() then
		local play_reload_animation = true

		self.ammo_extension:start_reload(play_reload_animation)
	end

	local fire_sound_event = current_action.fire_sound_event

	if fire_sound_event then
		WwiseUtils.trigger_unit_event(self.world, fire_sound_event, self.weapon_unit)
	end
end

return
