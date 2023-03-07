BackendInterfaceHeroAttributesTutorial = class(BackendInterfaceHeroAttributesTutorial)
local DEFAULT_ATTRIBUTES = {
	dwarf_ranger_career = 1,
	empire_soldier_tutorial_career = 1,
	wood_elf_experience = 0,
	dwarf_ranger_experience = 0,
	bright_wizard_prestige = 0,
	dwarf_ranger_prestige = 0,
	empire_soldier_prestige = 0,
	bright_wizard_experience = 0,
	witch_hunter_prestige = 0,
	empire_soldier_tutorial_prestige = 0,
	wood_elf_career = 1,
	empire_soldier_career = 1,
	wood_elf_prestige = 0,
	witch_hunter_career = 1,
	bright_wizard_career = 1,
	witch_hunter_experience = 0,
	empire_soldier_experience = 0,
	empire_soldier_tutorial_experience = 0
}

BackendInterfaceHeroAttributesTutorial.init = function (self, backend_mirror)
	self._attributes = table.clone(DEFAULT_ATTRIBUTES)
	self._initialized = true
end

BackendInterfaceHeroAttributesTutorial.ready = function (self)
	return self._initialized
end

BackendInterfaceHeroAttributesTutorial.update = function (self, dt)
	return
end

BackendInterfaceHeroAttributesTutorial.get = function (self, hero, attribute)
	local key = hero .. "_" .. attribute

	return self._attributes[key] or DEFAULT_ATTRIBUTES[key]
end

BackendInterfaceHeroAttributesTutorial.set = function (self, hero, attribute, value)
	return
end

BackendInterfaceHeroAttributesTutorial.prestige = function (self, hero_name, callback_function)
	return
end

BackendInterfaceHeroAttributesTutorial.prestige_request_cb = function (self, hero_name, callback_function, result)
	return
end

BackendInterfaceHeroAttributesTutorial.save = function (self, save_hero_attributes_cb)
	return false
end
