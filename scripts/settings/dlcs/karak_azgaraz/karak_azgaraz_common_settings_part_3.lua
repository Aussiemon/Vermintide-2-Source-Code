-- chunkname: @scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_common_settings_part_3.lua

local settings = DLCSettings.karak_azgaraz_part_3

settings.statistics_definitions = {
	"scripts/managers/backend/statistics_definitions_karak_azgaraz_part_3",
}
settings.unlock_settings = {
	karak_azgaraz_part_3 = {
		class = "AlwaysUnlocked",
	},
}
settings.unlock_settings_xb1 = {
	karak_azgaraz_part_3 = {
		class = "AlwaysUnlocked",
	},
}
settings.unlock_settings_ps4 = {
	CUSA13595_00 = {
		karak_azgaraz_part_3 = {
			class = "AlwaysUnlocked",
		},
	},
	CUSA13645_00 = {
		karak_azgaraz_part_3 = {
			class = "AlwaysUnlocked",
		},
	},
}
settings.item_master_list_file_names = {
	"scripts/settings/equipment/item_master_list_karak",
}
settings.statistics_lookup = {
	"dwarf_pressure_pad",
	"dwarf_big_jump",
	"dwarf_crows",
	"dwarf_speedrun",
}
