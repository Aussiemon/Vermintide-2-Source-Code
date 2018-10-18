require("scripts/unit_extensions/default_player_unit/charge/overcharge_data")

PlayerHuskOverchargeExtension = class(PlayerHuskOverchargeExtension)

PlayerHuskOverchargeExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.network_manager = Managers.state.network
	self.unit = unit
	local overcharge_data = extension_init_data.overcharge_data
	self.overcharge_value = 0
	self.overcharge_threshold = 0
	self.max_value = extension_init_data.overcharge_max_value
	self.original_max_value = overcharge_data.max_value or 40
	self.overcharge_limit = self.max_value * 0.65
	self.overcharge_critical_limit = self.max_value * 0.8
end

PlayerHuskOverchargeExtension.extensions_ready = function (self, world, unit)
	self.status_extension = ScriptUnit.extension(unit, "status_system")
end

PlayerHuskOverchargeExtension.set_screen_particle_opacity_modifier = function (self)
	return
end

PlayerHuskOverchargeExtension.reset = function (self)
	return
end

PlayerHuskOverchargeExtension.destroy = function (self)
	return
end

PlayerHuskOverchargeExtension.set_animation_variable = function (self)
	return
end

PlayerHuskOverchargeExtension._update_game_object = function (self)
	local network_manager = self.network_manager
	local unit = self.unit
	local game = network_manager:game()
	local go_id = Managers.state.unit_storage:go_id(unit)

	if game and go_id then
		local current_value_percentage = GameSession.game_object_field(game, go_id, "overcharge_percentage")
		local threshold_percentage = GameSession.game_object_field(game, go_id, "overcharge_threshold_percentage")
		local max_value = GameSession.game_object_field(game, go_id, "overcharge_max_value")
		local value = current_value_percentage * max_value
		local threshold = threshold_percentage * max_value
		self.overcharge_value = value
		self.overcharge_threshold = threshold
		self.max_value = max_value
		self.overcharge_limit = max_value * 0.65
		self.overcharge_critical_limit = max_value * 0.8
	end
end

PlayerHuskOverchargeExtension.update = function (self, unit, input, dt, context, t)
	self:_update_game_object()

	if script_data.overcharge_debug then
		local player_manager = Managers.player
		local player = player_manager:owner(unit)
		local profile_index = player and player:profile_index()
		local profile_abbreviation = SPProfilesAbbreviation[profile_index] or ""

		Debug.text("%s : Overcharge: %.2f/%.2f ( %.2f | %.2f)", profile_abbreviation, self.overcharge_value, self.max_value, self.overcharge_limit, self.overcharge_critical_limit)
	end
end

PlayerHuskOverchargeExtension.add_charge = function (self)
	return
end

PlayerHuskOverchargeExtension.remove_charge = function (self)
	return
end

PlayerHuskOverchargeExtension.hud_sound = function (self)
	return
end

PlayerHuskOverchargeExtension.get_overcharge_value = function (self)
	return self.overcharge_value
end

PlayerHuskOverchargeExtension.is_above_critical_limit = function (self)
	return self.overcharge_critical_limit <= self.overcharge_value
end

PlayerHuskOverchargeExtension.get_max_value = function (self)
	return self.max_value
end

PlayerHuskOverchargeExtension.get_original_max_value = function (self)
	return self.original_max_value
end

PlayerHuskOverchargeExtension.get_overcharge_threshold = function (self)
	return self.overcharge_threshold
end

PlayerHuskOverchargeExtension.above_overcharge_threshold = function (self)
	return self.overcharge_threshold <= self.overcharge_value
end

PlayerHuskOverchargeExtension.overcharge_fraction = function (self)
	return self.overcharge_value / self.max_value
end

PlayerHuskOverchargeExtension.threshold_fraction = function (self)
	return self.overcharge_threshold / self.max_value
end

PlayerHuskOverchargeExtension.current_overcharge_status = function (self)
	local value = self:get_overcharge_value()
	local threshold = self:get_overcharge_threshold()
	local max_value = self:get_max_value()

	return value, threshold, max_value
end

PlayerHuskOverchargeExtension.vent_overcharge = function (self)
	return
end

PlayerHuskOverchargeExtension.vent_overcharge_done = function (self)
	return
end

PlayerHuskOverchargeExtension.get_anim_blend_overcharge = function (self)
	local overcharge_value = self.overcharge_value
	local overcharge_threshold = self.overcharge_threshold
	local max_value = self.max_value
	local anim_blend_value = math.clamp((overcharge_value - overcharge_threshold) / (max_value - overcharge_threshold), 0, 1)

	return anim_blend_value
end

return
