require("scripts/settings/dlcs/morris/deus_blessing_settings")

return {
	display_name = DeusBlessingSettings.blessing_of_ranald.display_name,
	description = DeusBlessingSettings.blessing_of_ranald.description,
	icon = DeusBlessingSettings.blessing_of_ranald.icon,
	server_update_function = function (context, data, dt, t)
		MutatorUtils.apply_buff_to_alive_player_units(context, data, "blessing_of_ranald_damage_taken")
	end,
	client_update_function = function (context, data, dt, t)
		local local_player = Managers.player:local_player()
		local player_unit = local_player and local_player.player_unit

		if local_player and ALIVE[player_unit] then
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")

			if buff_extension and not buff_extension:has_buff_type("blessing_of_ranald_coins_greed") then
				buff_extension:add_buff("blessing_of_ranald_coins_greed")
			end
		end
	end
}
