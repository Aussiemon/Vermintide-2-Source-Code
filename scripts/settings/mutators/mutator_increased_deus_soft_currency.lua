-- chunkname: @scripts/settings/mutators/mutator_increased_deus_soft_currency.lua

return {
	description = "mutator_increased_deus_soft_currency_desc",
	display_name = "mutator_increased_deus_soft_currency_name",
	hide_from_player_ui = true,
	icon = "mutator_icon_increased_deus_soft_currency",
	pickup_system_multipliers = {
		deus_soft_currency = 1.5,
	},
}
