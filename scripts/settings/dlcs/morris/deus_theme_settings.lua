-- chunkname: @scripts/settings/dlcs/morris/deus_theme_settings.lua

require("scripts/utils/colors")

DeusThemeSettings = DeusThemeSettings or {
	wastes = {
		journey_description = "deus_theme_description_wastes",
		journey_title = "deus_theme_title_wastes",
		light_probe_tint = {
			1,
			1,
			1,
		},
		color = Colors.get_color_table_with_alpha("white", 255),
	},
	khorne = {
		curse_title = "deus_curse_title_khorne",
		deity_name = "display_name_khorne",
		icon = "icon_khorne",
		journey_description = "deus_theme_description_khorne",
		journey_title = "deus_theme_title_khorne",
		text_icon = "icon_khorne_small",
		light_probe_tint = {
			1,
			0.86,
			0.87,
		},
		color = Colors.get_color_table_with_alpha("crimson", 255),
		curse_description_color = {
			255,
			238,
			64,
			60,
		},
		mutators = {
			"no_sorcerers",
		},
	},
	nurgle = {
		curse_title = "deus_curse_title_nurgle",
		deity_name = "display_name_nurgle",
		icon = "icon_nurgle",
		journey_description = "deus_theme_description_nurgle",
		journey_title = "deus_theme_title_nurgle",
		text_icon = "icon_nurgle_small",
		light_probe_tint = {
			0.75,
			1,
			0.8,
		},
		color = Colors.get_color_table_with_alpha("green_yellow", 255),
		curse_description_color = {
			255,
			160,
			241,
			73,
		},
	},
	tzeentch = {
		curse_title = "deus_curse_title_tzeentch",
		deity_name = "display_name_tzeentch",
		icon = "icon_tzeentch",
		journey_description = "deus_theme_description_tzeentch",
		journey_title = "deus_theme_title_tzeentch",
		text_icon = "icon_tzeentch_small",
		light_probe_tint = {
			0.75,
			0.73,
			1,
		},
		color = Colors.get_color_table_with_alpha("turquoise", 255),
		curse_description_color = {
			255,
			73,
			87,
			241,
		},
	},
	slaanesh = {
		curse_title = "deus_curse_title_slaanesh",
		deity_name = "display_name_slaanesh",
		icon = "icon_slaanesh",
		journey_description = "deus_theme_description_slaanesh",
		journey_title = "deus_theme_title_slaanesh",
		text_icon = "icon_slaanesh_small",
		light_probe_tint = {
			0.76,
			0.76,
			1,
		},
		color = Colors.get_color_table_with_alpha("deep_pink", 255),
		curse_description_color = {
			255,
			241,
			73,
			156,
		},
	},
	belakor = {
		curse_title = "deus_curse_title_belakor",
		deity_name = "display_name_belakor",
		icon = "deus_icon_belakor",
		journey_description = "deus_theme_description_belakor",
		journey_title = "deus_theme_title_belakor",
		text_icon = "deus_icon_belakor_small",
		light_probe_tint = {
			0.76,
			0.76,
			1,
		},
		color = Colors.get_color_table_with_alpha("belakor", 255),
		curse_description_color = {
			255,
			172,
			134,
			218,
		},
	},
}
DEUS_THEME_TYPES = DEUS_THEME_TYPES or {
	BELAKOR = "belakor",
	KHORNE = "khorne",
	NURGLE = "nurgle",
	SLAANESH = "slaanesh",
	TZEENTCH = "tzeentch",
	WASTES = "wastes",
}
DEUS_THEME_INDEX = DEUS_THEME_INDEX or {
	"wastes",
	"khorne",
	"nurgle",
	"tzeentch",
	"slaanesh",
	"belakor",
}
DEUS_GOD_TYPES = DEUS_GOD_TYPES or {
	BELAKOR = "belakor",
	KHORNE = "khorne",
	NURGLE = "nurgle",
	SLAANESH = "slaanesh",
	TZEENTCH = "tzeentch",
}
DEUS_GOD_INDEX = DEUS_GOD_INDEX or {
	"khorne",
	"nurgle",
	"tzeentch",
	"slaanesh",
	"belakor",
}
