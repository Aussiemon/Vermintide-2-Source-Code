PingTargetExtension = class(PingTargetExtension)

PingTargetExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._world = extension_init_context.world
	self._unit = unit
	self._pinged = false
end

PingTargetExtension.extensions_ready = function (self, world, unit)
	self._outline_extension = ScriptUnit.has_extension(unit, "outline_system")
	self._buff_extension = ScriptUnit.has_extension(unit, "buff_system")
	self._locomotion_extension = ScriptUnit.has_extension(unit, "locomotion_system")
end

PingTargetExtension.set_pinged = function (self, pinged, flash)
	self._pinged = pinged

	if self._outline_extension then
		self._outline_extension.set_pinged(pinged, flash)

		if pinged then
			self:_add_witch_hunter_buff()
		end
	end

	if self._locomotion_extension and self._locomotion_extension.bone_lod_extension_id then
		local bone_lod_extension_id = self._locomotion_extension.bone_lod_extension_id

		EngineOptimized.bone_lod_set_ignore_umbra(bone_lod_extension_id, pinged)
	end
end

PingTargetExtension.pinged = function (self)
	return self._pinged
end

PingTargetExtension.update = function (self, unit, input, dt, context, t)
	return
end

PingTargetExtension.destroy = function (self)
	return
end

PingTargetExtension._add_witch_hunter_buff = function (self)
	if not Managers.state.network.is_server then
		return
	end

	local buff_extension = self._buff_extension

	if buff_extension then
		local wh_buff_name = "defence_debuff_enemies"
		local player_and_bot_units = PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units

		for i = 1, num_units, 1 do
			local player_unit = player_and_bot_units[i]
			local career_extension = ScriptUnit.has_extension(player_unit, "career_system")
			local career_name = career_extension and career_extension:career_name()

			if career_name == "wh_captain" then
				buff_extension:add_buff(wh_buff_name)
			end
		end
	end
end

return
