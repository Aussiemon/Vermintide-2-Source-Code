-- chunkname: @scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_common_settings_part_4.lua

local settings = DLCSettings.karak_azgaraz_part_4

settings.statistics_definitions = {
	"scripts/managers/backend/statistics_definitions_karak_azgaraz_part_4",
}
settings.unlock_settings = {
	karak_azgaraz_part_4 = {
		class = "AlwaysUnlocked",
	},
}
settings.unlock_settings_xb1 = {
	karak_azgaraz_part_4 = {
		class = "AlwaysUnlocked",
	},
}
settings.unlock_settings_ps4 = {
	CUSA13595_00 = {
		karak_azgaraz_part_4 = {
			class = "AlwaysUnlocked",
		},
	},
	CUSA13645_00 = {
		karak_azgaraz_part_4 = {
			class = "AlwaysUnlocked",
		},
	},
}
settings.item_master_list_file_names = {
	"scripts/settings/equipment/item_master_list_karak",
}
settings.dialogue_event_data_lookup = {
	"village_bonus_fish_barrel_a",
	"village_bonus_whale_guts_a",
	"village_bonus_buboes_a",
	"village_15_tainted_light_a",
}
settings.statistics_lookup = {}
