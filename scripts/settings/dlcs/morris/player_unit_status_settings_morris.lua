local player_unit_status_settings = {
	overcharge_values = {
		magma_charged_2 = 8,
		magma_basic = 7,
		magma_charged = 6
	}
}

table.merge_recursive(PlayerUnitStatusSettings, player_unit_status_settings)
