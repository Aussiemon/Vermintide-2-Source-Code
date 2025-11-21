-- chunkname: @scripts/settings/dlcs/divine/dlc_reikwald_river_common_settings.lua

local settings = DLCSettings.divine

settings.unlock_settings = {
	divine = {
		class = "AlwaysUnlocked",
	},
}
settings.unlock_settings_xb1 = {
	divine = {
		class = "AlwaysUnlocked",
	},
}
settings.unlock_settings_ps4 = {
	CUSA13595_00 = {
		divine = {
			class = "AlwaysUnlocked",
		},
	},
	CUSA13645_00 = {
		divine = {
			class = "AlwaysUnlocked",
		},
	},
}
settings.statistics_definitions = {
	"scripts/managers/backend/statistics_definitions_divine",
}
settings.statistics_lookup = {
	"divine_nautical_miles_challenge",
	"divine_anchor_challenge",
	"divine_sink_ships_challenge",
	"divine_cannon_challenge",
	"divine_chaos_warrior_challenge",
}
settings.item_master_list_file_names = {
	"scripts/settings/dlcs/divine/item_master_list_divine",
}
settings.ui_portrait_frame_settings = {
	frame_divine = {
		{
			layer = 10,
			texture = "portrait_frame_divine",
			color = {
				255,
				255,
				255,
				255,
			},
		},
	},
	frame_tyot_creator = {
		{
			layer = 10,
			texture = "portrait_frame_tyot_creator",
			color = {
				255,
				255,
				255,
				255,
			},
		},
	},
}
