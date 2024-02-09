-- chunkname: @scripts/settings/outline_settings_vs.lua

OutlineSettingsVS = OutlineSettingsVS or {}
OutlineSettingsVS.colors = {
	ally = {
		outline_multiplier = 7,
		outline_multiplier_variable = "outline_multiplier_alpha",
		pulsate = false,
		pulse_multiplier = 50,
		variable = "outline_color_alpha",
		channel = {
			255,
			0,
			0,
			0,
		},
		color = {
			255,
			255,
			255,
			255,
		},
	},
	hero_healthy = {
		outline_multiplier = 7,
		outline_multiplier_variable = "outline_multiplier_red",
		pulsate = false,
		pulse_multiplier = 50,
		variable = "outline_color_red",
		channel = {
			0,
			255,
			0,
			0,
		},
		color = {
			255,
			118,
			186,
			0,
		},
	},
	hero_hurt = {
		outline_multiplier = 4,
		outline_multiplier_variable = "outline_multiplier_green",
		pulsate = false,
		pulse_multiplier = 50,
		variable = "outline_color_green",
		channel = {
			0,
			0,
			255,
			0,
		},
		color = {
			255,
			253,
			253,
			4,
		},
	},
	hero_dying = {
		outline_multiplier = 6,
		outline_multiplier_variable = "outline_multiplier_blue",
		pulsate = true,
		pulse_multiplier = 15,
		variable = "outline_color_blue",
		channel = {
			0,
			0,
			0,
			255,
		},
		color = {
			255,
			227,
			4,
			4,
		},
	},
}

for name, settings in pairs(OutlineSettingsVS.colors) do
	settings.name = name
end
