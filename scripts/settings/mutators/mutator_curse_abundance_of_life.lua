-- chunkname: @scripts/settings/mutators/mutator_curse_abundance_of_life.lua

return {
	description = "curse_abundance_of_life_desc",
	display_name = "curse_abundance_of_life_name",
	icon = "deus_curse_slaanesh_01",
	pickup_system_multipliers = {
		deus_potions = 3,
		healing = 0,
		potions = 3,
	},
	client_start_function = function (context, data, dt, t)
		data.only_affect_players = true
	end,
	client_update_function = function (context, data, dt, t)
		MutatorUtils.apply_buff_to_alive_player_units(context, data, "curse_abundance_of_life")
	end,
}
