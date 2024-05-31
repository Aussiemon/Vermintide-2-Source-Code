-- chunkname: @scripts/unit_extensions/weapons/actions/action_minigun_spin.lua

ActionMinigunSpin = class(ActionMinigunSpin, ActionBase)

ActionMinigunSpin.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionMinigunSpin.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")
	self.first_person_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")
end

ActionMinigunSpin.client_owner_start_action = function (self, new_action, t)
	ActionMinigunSpin.super.client_owner_start_action(self, new_action, t)

	self._initial_windup = new_action.initial_windup
	self._windup_max = new_action.windup_max
	self._windup_speed = new_action.windup_speed

	if new_action.windup_start_on_zero then
		self._current_windup = 0
	else
		self._current_windup = self.weapon_extension:get_custom_data("windup")
	end

	self._last_update_t = t
	self._audio_loop_id = new_action.audio_loop_id
	self._fp_speed_anim_variable = new_action.fp_speed_anim_variable

	self:start_audio_loop()
end

ActionMinigunSpin.client_owner_post_update = function (self, dt, t, world, can_damage)
	local weapon_extension = self.weapon_extension
	local current_windup = self._current_windup

	current_windup = math.clamp(current_windup + self._windup_speed * dt, self._initial_windup, 1)

	weapon_extension:set_custom_data("windup", current_windup)

	self._current_windup = current_windup
	self._last_update_t = t

	self:_update_animation_speed(current_windup)
end

ActionMinigunSpin.start_audio_loop = function (self)
	local audio_loop_id = self._audio_loop_id

	if not audio_loop_id then
		return
	end

	local current_action = self.current_action
	local start_charge_id = current_action.charge_sound_name
	local stop_charge_id = current_action.charge_sound_stop_event

	if not start_charge_id or not stop_charge_id then
		return
	end

	local weapon_extension = self.weapon_extension
	local start_charge_husk_id = current_action.charge_sound_husk_name
	local stop_charge_husk_id = current_action.charge_sound_husk_stop_event

	weapon_extension:add_looping_audio(audio_loop_id, start_charge_id, stop_charge_id, start_charge_husk_id, stop_charge_husk_id)
	weapon_extension:start_looping_audio(audio_loop_id)
end

ActionMinigunSpin._update_animation_speed = function (self, windup)
	if self._fp_speed_anim_variable then
		local anim_time_scale = windup / 3 + 0.67

		anim_time_scale = math.clamp(anim_time_scale, NetworkConstants.animation_variable_float.min, NetworkConstants.animation_variable_float.max)

		self.first_person_extension:animation_set_variable(self._fp_speed_anim_variable, anim_time_scale)
	end
end

ActionMinigunSpin.finish = function (self, ...)
	print(self.action_start_t - Managers.time:time("game"))
	ActionMinigunSpin.super.finish(self, ...)
end
