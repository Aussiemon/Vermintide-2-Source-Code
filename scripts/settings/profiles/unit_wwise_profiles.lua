UnitWwiseProfiles = {
	first_person_units = {
		first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
		first_person = "units/beings/player/first_person_base/chr_first_person_base"
	},
	third_person_units = {
		witch_hunter = {
			third_person_husk = "units/beings/player/witch_hunter/third_person_base/chr_third_person_husk_base",
			third_person_bot = "units/beings/player/witch_hunter/third_person_base/chr_third_person_base",
			third_person = "units/beings/player/witch_hunter/third_person_base/chr_third_person_base"
		},
		bright_wizard = {
			third_person_husk = "units/beings/player/bright_wizard/third_person_base/chr_third_person_husk_base",
			third_person_bot = "units/beings/player/bright_wizard/third_person_base/chr_third_person_base",
			third_person = "units/beings/player/bright_wizard/third_person_base/chr_third_person_base"
		},
		dwarf_ranger = {
			third_person_husk = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_husk_base",
			third_person_bot = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_base",
			third_person = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_base"
		},
		wood_elf = {
			third_person_husk = "units/beings/player/way_watcher/third_person_base/chr_third_person_husk_base",
			third_person_bot = "units/beings/player/way_watcher/third_person_base/chr_third_person_base",
			third_person = "units/beings/player/way_watcher/third_person_base/chr_third_person_base"
		},
		empire_soldier = {
			third_person_husk = "units/beings/player/empire_soldier/third_person_base/chr_third_person_husk_base",
			third_person_bot = "units/beings/player/empire_soldier/third_person_base/chr_third_person_base",
			third_person = "units/beings/player/empire_soldier/third_person_base/chr_third_person_base"
		}
	},
	wwise_dep = {
		witch_hunter = {
			"wwise/player_foley_witch_hunter",
			"wwise/player_witch_hunter_vo"
		},
		bright_wizard = {
			"wwise/player_foley_bright_wizard",
			"wwise/player_wizard_vo"
		},
		dwarf_ranger = {
			"wwise/player_foley_dwarf",
			"wwise/player_dwarf_vo"
		},
		wood_elf = {
			"wwise/player_foley_way_watcher",
			"wwise/player_wood_elf_vo"
		},
		empire_soldier = {
			"wwise/player_foley_imperial",
			"wwise/player_mercenary_vo"
		}
	},
	base_units = {}
}

for profile_name, profile_third_person_units in pairs(UnitWwiseProfiles.third_person_units) do
	if not UnitWwiseProfiles.base_units[profile_name] then
		UnitWwiseProfiles.base_units[profile_name] = {}
	end

	for unit_name, unit_path in pairs(UnitWwiseProfiles.first_person_units) do
		UnitWwiseProfiles.base_units[profile_name][unit_name] = unit_path
	end

	for unit_name, unit_path in pairs(profile_third_person_units) do
		UnitWwiseProfiles.base_units[profile_name][unit_name] = unit_path
	end
end

return 
