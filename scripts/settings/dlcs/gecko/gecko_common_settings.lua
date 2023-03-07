local settings = DLCSettings.gecko
settings.network_lookups = {
	keep_decoration_paintings = "Paintings"
}
settings.keep_decoration_file_names = {
	"scripts/settings/paintings_01"
}
local extra_sound_package = "resource_packages/keep_paintings/keep_paintings_inn_level_sounds_01"
settings.extra_level_packages = {
	inn_level = {
		extra_sound_package
	},
	inn_level_celebrate = {
		extra_sound_package
	},
	inn_level_halloween = {
		extra_sound_package
	},
	inn_level_skulls = {
		extra_sound_package
	},
	inn_level_sonnstill = {
		extra_sound_package
	},
	keep_base = {
		extra_sound_package
	}
}
