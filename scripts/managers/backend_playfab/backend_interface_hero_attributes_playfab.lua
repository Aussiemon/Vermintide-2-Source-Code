local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
BackendInterfaceHeroAttributesPlayFab = class(BackendInterfaceHeroAttributesPlayFab)
local DEFAULT_ATTRIBUTES = {
	wood_elf_experience_pool = 0,
	bright_wizard_experience_pool = 0,
	empire_soldier_tutorial_career = 1,
	empire_soldier_experience = 0,
	wood_elf_experience = 0,
	empire_soldier_career = 1,
	dwarf_ranger_career = 1,
	dwarf_ranger_experience = 0,
	bright_wizard_prestige = 0,
	dwarf_ranger_prestige = 0,
	empire_soldier_prestige = 0,
	bright_wizard_experience = 0,
	witch_hunter_prestige = 0,
	empire_soldier_tutorial_experience_pool = 0,
	empire_soldier_tutorial_prestige = 0,
	witch_hunter_experience_pool = 0,
	wood_elf_career = 1,
	empire_soldier_experience_pool = 0,
	wood_elf_prestige = 0,
	witch_hunter_career = 1,
	bright_wizard_career = 1,
	witch_hunter_experience = 0,
	dwarf_ranger_experience_pool = 0,
	empire_soldier_tutorial_experience = 0
}

BackendInterfaceHeroAttributesPlayFab.init = function (self, backend_mirror)
	self._attributes = {}
	self._attributes_to_save = {}
	self._backend_mirror = backend_mirror

	self:_refresh()

	self._initialized = true
end

BackendInterfaceHeroAttributesPlayFab.make_dirty = function (self)
	self._dirty = true
end

BackendInterfaceHeroAttributesPlayFab._refresh = function (self)
	if Managers.mechanism:current_mechanism_name() == "versus" then
		self:_refresh_versus()
	else
		self:_refresh_adventure()
	end

	self._dirty = false
end

BackendInterfaceHeroAttributesPlayFab._refresh_versus = function (self)
	table.clear(self._attributes)

	local characters_data = self._backend_mirror._vs_characters_data_mirror
	local attribute_names = {
		"experience",
		"career",
		"prestige"
	}
	local attributes = self._attributes

	for character, data in pairs(characters_data) do
		for _, attribute_name in ipairs(attribute_names) do
			local key = string.format("%s_%s", character, attribute_name)
			attributes[key] = data[attribute_name]
		end
	end
end

BackendInterfaceHeroAttributesPlayFab._refresh_adventure = function (self)
	table.clear(self._attributes)

	local mirror = self._backend_mirror
	local read_only_data = mirror:get_read_only_data()

	if script_data.honduras_demo then
		for attribute_name, default_value in pairs(DEFAULT_DEMO_ATTRIBUTES) do
			self._attributes[attribute_name] = default_value
		end
	else
		for attribute_name, default_value in pairs(DEFAULT_ATTRIBUTES) do
			local backend_value = read_only_data[attribute_name]
			self._attributes[attribute_name] = backend_value or default_value
		end
	end
end

BackendInterfaceHeroAttributesPlayFab.ready = function (self)
	return self._initialized
end

BackendInterfaceHeroAttributesPlayFab.update = function (self, dt)
	return
end

BackendInterfaceHeroAttributesPlayFab.get = function (self, hero, attribute)
	if self._dirty then
		self:_refresh()
	end

	local key = hero .. "_" .. attribute

	return self._attributes[key]
end

BackendInterfaceHeroAttributesPlayFab.set = function (self, hero, attribute, value)
	fassert(value ~= nil, "Trying to set a hero attribute to nil, don't do this")

	local mirror = self._backend_mirror

	if Managers.mechanism:current_mechanism_name() == "versus" then
		mirror:set_career_read_only_data(hero, attribute, value, nil, false)
	else
		local key = hero .. "_" .. attribute

		mirror:set_read_only_data(key, value, false)
	end

	self._dirty = true
end

return
