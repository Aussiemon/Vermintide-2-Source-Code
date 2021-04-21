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

			if talent_string then
				local career_talents = string.split(talent_string, ",")

				for i = 1, #career_talents, 1 do
					career_talents[i] = tonumber(career_talents[i])
				end

				talents[career_name] = career_talents
			end
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

BackendInterfaceTalentsPlayfab.get_talent_ids = function (self, career_name)
	local career_settings = CareerSettings[career_name]
	local profile_name = career_settings.profile_name
	local talent_tree_index = career_settings.talent_tree_index
	local talent_tree = talent_tree_index and TalentTrees[profile_name][talent_tree_index]
	local talent_ids = {}
	local talents = self:get_talents(career_name)

	if talents then
		for i = 1, #talents, 1 do
			local column = talents[i]

			if column ~= 0 then
				local talent_name = talent_tree[i][column]
				local talent_lookup = TalentIDLookup[talent_name]

				if talent_lookup and talent_lookup.talent_id then
					talent_ids[#talent_ids + 1] = talent_lookup.talent_id
				end
			end
		end
	end

	return talent_ids
end

BackendInterfaceTalentsPlayfab.get_talent_tree = function (self, career_name)
	local career_settings = CareerSettings[career_name]
	local profile_name = career_settings.profile_name
	local talent_tree_index = career_settings.talent_tree_index
	local talent_tree = talent_tree_index and TalentTrees[profile_name][talent_tree_index]

	return talent_tree
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
