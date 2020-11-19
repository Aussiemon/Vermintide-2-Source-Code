ActionCareerDREngineerSpin = class(ActionCareerDREngineerSpin, ActionBase)
local unit_animation_set_variable = Unit.animation_set_variable

ActionCareerDREngineerSpin.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerDREngineerSpin.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")
	self.talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	self.audio_loop_id = "engineer_weapon_spin"
	self.first_person_unit = first_person_unit
	self._barrel_spin_anim_var_1p = Unit.animation_find_variable(first_person_unit, "barrel_spin_speed")
end

ActionCareerDREngineerSpin.client_owner_start_action = function (self, new_action, t)
	ActionCareerDREngineerSpin.super.client_owner_start_action(self, new_action, t)
	self:start_audio_loop()

	self._initial_windup = new_action.initial_windup
	self._windup_max = new_action.windup_max
	self._windup_speed = new_action.windup_speed
	self._current_windup = self.weapon_extension:get_custom_data("windup")
	self._override_visual_spinup = new_action.override_visual_spinup
	self._visual_spinup_min = new_action.visual_spinup_min
	self._visual_spinup_max = new_action.visual_spinup_max
	self._visual_spinup_time = new_action.visual_spinup_time
	self._action_start_t = t
	self._last_update_t = t

	if self.talent_extension:has_talent("bardin_engineer_reduced_ability_fire_slowdown") then
		self._current_windup = 1
	end
end

ActionCareerDREngineerSpin.client_owner_post_update = function (self, dt, t, world, can_damage)
	local weapon_extension = self.weapon_extension
	local current_windup = self._current_windup
	current_windup = math.clamp(current_windup + self._windup_speed * dt, self._initial_windup, 1)

	weapon_extension:set_custom_data("windup", current_windup)

	self._current_windup = current_windup
	self._last_update_t = t

	self:_update_animation_speed(current_windup)
end

ActionCareerDREngineerSpin.finish = function (self, reason)
	local visual_spinup = self._current_windup

	if self._override_visual_spinup then
		local time_spent = self._last_update_t - self._action_start_t
		local lerp_t = time_spent / self._visual_spinup_time
		visual_spinup = math.lerp(self._visual_spinup_min, self._visual_spinup_max, lerp_t)
	end

	Managers.state.event:trigger("on_engineer_weapon_spin_up", visual_spinup, self._override_visual_spinup)
end

ActionCareerDREngineerSpin.start_audio_loop = function (self)
	local current_action = self.current_action
	local start_charge_id = current_action.charge_sound_name
	local stop_charge_id = current_action.charge_sound_stop_event

	if not start_charge_id or not stop_charge_id then
		return
	end

	local weapon_extension = self.weapon_extension
	local start_charge_husk_id = current_action.charge_sound_husk_name
	local stop_charge_husk_id = current_action.charge_sound_husk_stop_event

	weapon_extension:add_looping_audio(self.audio_loop_id, start_charge_id, stop_charge_id, start_charge_husk_id, stop_charge_husk_id)
	weapon_extension:start_looping_audio(self.audio_loop_id)
end

ActionCareerDREngineerSpin._update_animation_speed = function (self, windup)
	local anim_time_scale = windup / 3 + 0.67
	anim_time_scale = math.clamp(anim_time_scale, NetworkConstants.animation_variable_float.min, NetworkConstants.animation_variable_float.max)

	unit_animation_set_variable(self.first_person_unit, self._barrel_spin_anim_var_1p, anim_time_scale)
end

return
