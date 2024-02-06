-- chunkname: @scripts/settings/dlcs/morris/player_unit_status_settings_morris.lua

local player_unit_status_settings = {}

player_unit_status_settings.overcharge_values = {
	magma_basic = 6,
	magma_charged = 9,
	magma_charged_2 = 11,
}

table.merge_recursive(PlayerUnitStatusSettings, player_unit_status_settings)
