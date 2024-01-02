local player_unit_status_settings = {
	overcharge_values = {
		magma_charged_2 = 11,
		magma_basic = 6,
		magma_charged = 9
	}
}

table.merge_recursive(PlayerUnitStatusSettings, player_unit_status_settings)
