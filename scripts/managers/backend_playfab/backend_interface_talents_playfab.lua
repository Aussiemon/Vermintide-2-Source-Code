BackendInterfaceTalentsPlayfab = class(BackendInterfaceTalentsPlayfab)

BackendInterfaceTalentsPlayfab.init = function (self, backend_mirror)
	self._backend_mirror = backend_mirror
	self._talents = {}

	self:_refresh()
end

BackendInterfaceTalentsPlayfab._refresh = function (self)
	local talents = self._talents
	local backend_mirror = self._backend_mirror

	for career_name, settings in pairs(CareerSettings) do
		if settings.playfab_name then
			local talent_string = backend_mirror:get_character_data(career_name, "talents")
			local career_talents = string.split(talent_string, ",")

			for i = 1, #career_talents, 1 do
				career_talents[i] = tonumber(career_talents[i])
			end

			talents[career_name] = career_talents
		end
	end

	self._dirty = false
end

BackendInterfaceTalentsPlayfab.ready = function (self)
	return true
end

BackendInterfaceTalentsPlayfab.update = function (self, dt)
	return
end

BackendInterfaceTalentsPlayfab.make_dirty = function (self)
	self._dirty = true
end

BackendInterfaceTalentsPlayfab.set_talents = function (self, career_name, talents)
	local talent_string = ""

	for i = 1, #talents, 1 do
		local value = talents[i]

		if i == #talents then
			talent_string = talent_string .. value
		else
			talent_string = talent_string .. value .. ","
		end
	end

	self._backend_mirror:set_character_data(career_name, "talents", talent_string)

	self._dirty = true
end

BackendInterfaceTalentsPlayfab.get_talents = function (self, career_name)
	if self._dirty then
		self:_refresh()
	end

	local talents = self._talents[career_name]

	return talents
end

return
