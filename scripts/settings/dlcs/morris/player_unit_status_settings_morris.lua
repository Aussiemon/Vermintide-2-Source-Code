-- chunkname: @scripts/settings/dlcs/morris/player_unit_status_settings_morris.lua

local player_unit_status_settings = {}

player_unit_status_settings.overcharge_values = {
	magma_basic = 7,
	magma_charged = 6,
	magma_charged_2 = 8,
}

table.merge_recursive(PlayerUnitStatusSettings, player_unit_status_settings)
