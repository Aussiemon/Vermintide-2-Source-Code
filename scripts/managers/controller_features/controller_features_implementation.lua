ControllerFeaturesImplementation = class(ControllerFeaturesImplementation)
ControllerFeaturesImplementation.init = function (self, is_in_inn)
	self._reset(self)

	self._is_in_inn = is_in_inn

	if Managers.state.event then
		Managers.state.event:register(self, "gm_event_end_conditions_met", "event_end_conditions_met")
	end

	return 
end
ControllerFeaturesImplementation._reset = function (self)
	self._effects = {}
	self._current_effect_id = 1
	self._game_mode_ended = false
	self._state_data = {}

	return 
end
ControllerFeaturesImplementation.event_end_conditions_met = function (self)
	self._game_mode_ended = true

	return 
end
local EFFECTS_TO_REMOVE = {}
ControllerFeaturesImplementation.update = function (self, dt, t)
	return 

	for user, effects in pairs(self._effects) do
		table.clear(EFFECTS_TO_REMOVE)

		for id, effect_data in pairs(effects) do
			if self._game_mode_ended or effect_data.effect.update(effect_data.state_data, dt, t) then
				effect_data.effect.destroy(effect_data.state_data)

				EFFECTS_TO_REMOVE[#EFFECTS_TO_REMOVE + 1] = id
			end
		end

		for _, id in ipairs(EFFECTS_TO_REMOVE) do
			effects[id] = nil
		end
	end

	return 
end
ControllerFeaturesImplementation.add_effect = function (self, effect_name, params, user_id)
	if self._game_mode_ended or not Application.user_setting("gamepad_rumble_enabled") or (effect_name == "camera_shake" and self._is_in_inn) then
		return 
	end

	local user_id = user_id or Managers.account:user_id()

	if not user_id then
		return 
	end

	local controller = Managers.account:active_controller(user_id)

	if not controller then
		return 
	end

	local state_data = {}

	if ControllerFeaturesSettings[effect_name] then
		local effect = ControllerFeaturesSettings[effect_name]
		state_data.controller = controller

		effect.init(state_data, params)

		state_data.effect_id = self._current_effect_id
		self._effects[user_id] = self._effects[user_id] or {}
		self._effects[user_id][self._current_effect_id] = {
			state_data = state_data,
			effect = effect
		}
		self._current_effect_id = self._current_effect_id + 1

		return self._current_effect_id - 1
	end

	return 
end
ControllerFeaturesImplementation.stop_effect = function (self, effect_id)
	local user_id = Managers.account:user_id()

	if not user_id then
		return 
	end

	local effect_data = self._effects[user_id][effect_id]

	if effect_data then
		effect_data.effect.destroy(effect_data.state_data)

		self._effects[user_id][effect_id] = nil
	end

	return 
end
ControllerFeaturesImplementation.destroy = function (self)
	for user, effects in pairs(self._effects) do
		for id, effect_data in pairs(effects) do
			effect_data.effect.destroy(effect_data.state_data)
		end
	end

	self._reset(self)

	return 
end

return 
