-- chunkname: @scripts/settings/outline_settings_vs.lua

OutlineSettingsVS = OutlineSettingsVS or {}
OutlineSettingsVS.colors = {
	ally = {
		pulsate = false,
		pulse_multiplier = 50,
		color = {
			255,
			72,
			95,
			143,
		},
	},
	hero_healthy = {
		pulsate = false,
		pulse_multiplier = 50,
		color = {
			255,
			33,
			106,
			34,
		},
	},
	hero_hurt = {
		pulsate = false,
		pulse_multiplier = 50,
		color = {
			255,
			177,
			144,
			31,
		},
	},
	hero_dying = {
		pulsate = false,
		pulse_multiplier = 15,
		color = {
			255,
			139,
			0,
			0,
		},
	},
}
OutlineSettingsVS.templates = {
	horde_ability = {
		method = "ai_alive",
		priority = 15,
		outline_color = OutlineSettingsVS.colors.ally,
		flag = OutlineSettings.flags.non_wall_occluded,
	},
}

for name, settings in pairs(OutlineSettingsVS.colors) do
	settings.name = name
end
