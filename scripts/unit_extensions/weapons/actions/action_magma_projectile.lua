ActionMagmaProjectile = class(ActionMagmaProjectile, ActionShotgun)

ActionMagmaProjectile.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	ActionMagmaProjectile.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level)

	local is_spell = new_action.is_spell
	local buff_extension = self.owner_buff_extension

	if self.charge_level and self.charge_level >= 1 and is_spell then
		buff_extension:trigger_procs("on_full_charge_action", new_action, t, chain_action_data)
	end
end

ActionMagmaProjectile._start_shooting = function (self)
	local owner_unit = self.owner_unit
	local current_action = self.current_action
	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	local current_position, current_rotation = first_person_extension:get_projectile_start_position_rotation()

	if current_action.fire_at_gaze_setting and ScriptUnit.has_extension(owner_unit, "eyetracking_system") then
		local eyetracking_extension = ScriptUnit.extension(owner_unit, "eyetracking_system")

		if eyetracking_extension:get_is_feature_enabled("tobii_fire_at_gaze") then
			current_rotation = self.start_gaze_rotation:unbox()
		end
	end

	self._fire_position:store(current_position)
	self._fire_rotation:store(current_rotation)

	if not Managers.player:owner(self.owner_unit).bot_player then
		Managers.state.controller_features:add_effect("rumble", {
			rumble_effect = "handgun_fire"
		})
	end

	self:_use_ammo()
	self:_add_overcharge()
	self:_proc_spell_used(self.owner_buff_extension)

	if current_action.alert_sound_range_fire then
		Managers.state.entity:system("ai_system"):alert_enemies_within_range(owner_unit, POSITION_LOOKUP[owner_unit], current_action.alert_sound_range_fire)
	end

	local fire_sound_event = self.current_action.fire_sound_event

	if fire_sound_event then
		local play_on_husk = self.current_action.fire_sound_on_husk

		first_person_extension:play_hud_sound_event(fire_sound_event, nil, play_on_husk)
	end

	self.state = "shooting"
end
