PingTargetExtension = class(PingTargetExtension)

PingTargetExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._world = extension_init_context.world
	self._unit = unit
	self._pinged = 0
	self._outline_ids = {}

	if extension_init_data.always_pingable == nil then
		self.always_pingable = Unit.get_data(unit, "ping_data", "always_pingable")
	else
		self.always_pingable = extension_init_data.always_pingable
	end
end

PingTargetExtension.extensions_ready = function (self, world, unit)
	self._outline_extension = ScriptUnit.has_extension(unit, "outline_system")
	self._buff_extension = ScriptUnit.has_extension(unit, "buff_system")
	self._locomotion_extension = ScriptUnit.has_extension(unit, "locomotion_system")
end

PingTargetExtension.set_pinged = function (self, pinged, flash, pinger_unit, show_outline)
	local owner_unit = self._unit

	if show_outline == nil then
		show_outline = true
	end

	if pinged then
		self._pinged = self._pinged + 1
	else
		self._pinged = self._pinged - 1
	end

	if self._outline_extension then
		if show_outline then
			if pinged then
				local ping_outline_template = table.shallow_copy(OutlineSettings.templates.ping_unit, true)
				ping_outline_template.method = self._outline_extension.pinged_method
				local outline_id = self._outline_extension:add_outline(ping_outline_template)
				self._outline_ids[pinger_unit] = outline_id
			else
				local outline_id = self._outline_ids[pinger_unit]

				self._outline_extension:remove_outline(outline_id)

				self._outline_ids[pinger_unit] = nil
			end
		end

		if pinged then
			self:_add_witch_hunter_buff(pinger_unit)
		end
	end

	if Unit.alive(owner_unit) then
		local breed = Unit.get_data(owner_unit, "breed")

		if breed then
			local pinger_buff_extension = ScriptUnit.has_extension(pinger_unit, "buff_system")

			if pinger_buff_extension then
				pinger_buff_extension:trigger_procs("on_enemy_pinged", owner_unit, pinger_unit)
			end

			local proximity_extension = ScriptUnit.has_extension(owner_unit, "proximity_system")

			if proximity_extension then
				proximity_extension.has_been_seen = true
			end
		end
	end

	if self._locomotion_extension and self._locomotion_extension.bone_lod_extension_id then
		local bone_lod_extension_id = self._locomotion_extension.bone_lod_extension_id

		EngineOptimized.bone_lod_set_ignore_umbra(bone_lod_extension_id, pinged)
	end
end

PingTargetExtension.pinged = function (self)
	return self._pinged > 0
end

PingTargetExtension.update = function (self, unit, input, dt, context, t)
	return
end

PingTargetExtension.destroy = function (self)
	return
end

PingTargetExtension._add_witch_hunter_buff = function (self, pinger_unit)
	if not Managers.state.network.is_server then
		return
	end

	local buff_extension = self._buff_extension

	if buff_extension then
		local wh_buff_name = "defence_debuff_enemies"
		local side = Managers.state.side.side_by_unit[pinger_unit]

		if not side then
			return
		end

		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units

		for i = 1, num_units do
			local player_unit = player_and_bot_units[i]
			local career_extension = ScriptUnit.has_extension(player_unit, "career_system")
			local talent_extension = ScriptUnit.has_extension(player_unit, "talent_system")
			local career_name = career_extension and career_extension:career_name()

			if career_name == "wh_captain" then
				buff_extension:add_buff(wh_buff_name)

				if talent_extension:has_talent("victor_witchhunter_improved_damage_taken_ping") then
					buff_extension:add_buff("victor_witchhunter_improved_damage_taken_ping")
				end
			end
		end
	end
end
