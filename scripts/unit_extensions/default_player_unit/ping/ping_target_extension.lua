PingTargetExtension = class(PingTargetExtension)

PingTargetExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._world = extension_init_context.world
	self._unit = unit
	self._pinged = false
end

PingTargetExtension.extensions_ready = function (self, world, unit)
	if ScriptUnit.has_extension(unit, "outline_system") then
		self.outline_extension = ScriptUnit.extension(unit, "outline_system")
	end

	self._buff_extension = ScriptUnit.has_extension(unit, "buff_system")
end

PingTargetExtension.set_pinged = function (self, pinged, pinger_unit)
	self._pinged = pinged
	local unit = self._unit

	if self.outline_extension then
		self.outline_extension.set_pinged(pinged)
		self:_add_witch_hunter_buff(unit, pinger_unit)
	end
end

PingTargetExtension.pinged = function (self)
	return self._pinged
end

PingTargetExtension.update = function (self, unit, input, dt, context, t)
	if self._pinged and self.outline_extension then
	end
end

PingTargetExtension.destroy = function (self)
	return
end

PingTargetExtension._add_witch_hunter_buff = function (self, unit, pinger_unit)
	if not Managers.state.network.is_server then
		return
	end

	local buff_extension = self._buff_extension

	if buff_extension then
		local wh_buff_name = "defence_debuff_enemies"
		local has_buff = buff_extension:has_buff_type(wh_buff_name)

		if not has_buff then
			local player_and_bot_units = PLAYER_AND_BOT_UNITS
			local num_units = #player_and_bot_units

			for i = 1, num_units, 1 do
				local player_unit = player_and_bot_units[i]
				local career_extension = ScriptUnit.has_extension(player_unit, "career_system")
				local career_name = career_extension and career_extension:career_name()

				if career_name and career_name == "wh_captain" then
					buff_extension:add_buff(wh_buff_name)
				end
			end
		end
	end
end

return
