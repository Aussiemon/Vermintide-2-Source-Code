CrosshairKillConfirmSettingsGroups = table.enum("off", "all", "elites_above", "bosses_specials", "elites_specials", "specials_only")
local kill_confirm_enemy_types = table.enum("infantry", "elite", "special", "boss")
local kill_confirm_group_settings = {
	[CrosshairKillConfirmSettingsGroups.off] = {},
	[CrosshairKillConfirmSettingsGroups.all] = {
		[kill_confirm_enemy_types.infantry] = true,
		[kill_confirm_enemy_types.elite] = true,
		[kill_confirm_enemy_types.boss] = true,
		[kill_confirm_enemy_types.special] = true
	},
	[CrosshairKillConfirmSettingsGroups.elites_above] = {
		[kill_confirm_enemy_types.elite] = true,
		[kill_confirm_enemy_types.boss] = true,
		[kill_confirm_enemy_types.special] = true
	},
	[CrosshairKillConfirmSettingsGroups.bosses_specials] = {
		[kill_confirm_enemy_types.boss] = true,
		[kill_confirm_enemy_types.special] = true
	},
	[CrosshairKillConfirmSettingsGroups.elites_specials] = {
		[kill_confirm_enemy_types.elite] = true,
		[kill_confirm_enemy_types.special] = true
	},
	[CrosshairKillConfirmSettingsGroups.specials_only] = {
		[kill_confirm_enemy_types.special] = true
	}
}
local kill_confirm_types = table.enum("kill", "kill_dot", "kill_weakpoint", "assist")
local kill_confirm_type_colors = {
	[kill_confirm_types.kill] = {
		255,
		243,
		21,
		21
	},
	[kill_confirm_types.kill_dot] = {
		255,
		228,
		139,
		255
	},
	[kill_confirm_types.kill_weakpoint] = {
		255,
		230,
		168,
		0
	},
	[kill_confirm_types.assist] = {
		255,
		0,
		162,
		255
	}
}
local kill_confirm_enemy_prio = table.mirror_array_inplace({
	kill_confirm_enemy_types.infantry,
	kill_confirm_enemy_types.elite,
	kill_confirm_enemy_types.boss,
	kill_confirm_enemy_types.special
})
local kill_confirm_weakspot_zones = {
	head = true,
	weakspot = true
}
local kill_confirm_enemy_type_widget_map = {
	[kill_confirm_enemy_types.infantry] = "style_4",
	[kill_confirm_enemy_types.elite] = "style_3",
	[kill_confirm_enemy_types.special] = "style_2",
	[kill_confirm_enemy_types.boss] = "style_5"
}
local kill_confirm_styles = {
	style_1 = "kill_confirm_01",
	style_2 = "kill_confirm_02",
	style_5 = "kill_confirm_05",
	style_3 = "kill_confirm_03",
	style_4 = "kill_confirm_04"
}

return {
	kill_confirm_enemy_types = kill_confirm_enemy_types,
	kill_confirm_group_settings = kill_confirm_group_settings,
	kill_confirm_types = kill_confirm_types,
	kill_confirm_type_colors = kill_confirm_type_colors,
	kill_confirm_enemy_prio = kill_confirm_enemy_prio,
	kill_confirm_weakspot_zones = kill_confirm_weakspot_zones,
	kill_confirm_enemy_type_widget_map = kill_confirm_enemy_type_widget_map,
	kill_confirm_styles = kill_confirm_styles
}
