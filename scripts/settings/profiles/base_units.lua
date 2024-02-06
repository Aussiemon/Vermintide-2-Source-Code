﻿-- chunkname: @scripts/settings/profiles/base_units.lua

local first_person_base_units = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
}
local third_person_base_units = {
	witch_hunter = {
		third_person = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
		third_person_bot = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
		third_person_husk = "units/beings/player/third_person_base/witch_hunter/chr_third_person_husk_base",
	},
	bright_wizard = {
		third_person = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
		third_person_bot = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
		third_person_husk = "units/beings/player/third_person_base/bright_wizard/chr_third_person_husk_base",
	},
	dwarf_ranger = {
		third_person = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
		third_person_bot = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
		third_person_husk = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_husk_base",
	},
	wood_elf = {
		third_person = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
		third_person_bot = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
		third_person_husk = "units/beings/player/third_person_base/way_watcher/chr_third_person_husk_base",
	},
	empire_soldier = {
		third_person = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
		third_person_bot = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
		third_person_husk = "units/beings/player/third_person_base/empire_soldier/chr_third_person_husk_base",
	},
}

BaseUnits = {}

for profile_name, third_person_units in pairs(third_person_base_units) do
	if not BaseUnits[profile_name] then
		BaseUnits[profile_name] = {}
	end

	for unit_name, unit_path in pairs(first_person_base_units) do
		BaseUnits[profile_name][unit_name] = unit_path
	end

	for unit_name, unit_path in pairs(third_person_units) do
		BaseUnits[profile_name][unit_name] = unit_path
	end
end
