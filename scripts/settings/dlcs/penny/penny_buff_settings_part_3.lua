local settings = DLCSettings.penny_part_3
settings.buff_templates = {
	enemy_penny_curse_pulse = {
		buffs = {
			{
				update_func = "enemy_penny_curse_pulse",
				name = "penny_curse_pulse",
				radius = 3,
				tick_rate = 0.5
			}
		}
	},
	enemy_penny_curse = {
		buffs = {
			{
				icon = "troll_vomit_debuff",
				name = "penny_curse",
				duration = 5,
				debuff = true,
				max_stacks = 50,
				perk = "slayer_curse",
				refresh_durations = true
			}
		}
	}
}
settings.buff_function_templates = {
	enemy_penny_curse_pulse = function (unit, buff, params, world)
		local t = params.t

		if Managers.state.network.is_server and AiUtils.unit_alive(unit) and (buff.next_tick == nil or (buff.next_tick and buff.next_tick < t)) then
			local buff_system = Managers.state.entity:system("buff_system")
			local side_manager = Managers.state.side
			local template = buff.template
			local tick_rate = template.tick_rate
			local radius = template.radius
			local nearby_player_units = FrameTable.alloc_table()
			local proximity_extension = Managers.state.entity:system("proximity_system")
			local broadphase = proximity_extension.player_units_broadphase

			Broadphase.query(broadphase, POSITION_LOOKUP[unit], radius, nearby_player_units)

			buff.next_tick = t + tick_rate

			for _, player_unit in pairs(nearby_player_units) do
				local player = Managers.player:owner(player_unit)
				local is_bot = player and not player:is_player_controlled()

				if not is_bot and side_manager:is_enemy(unit, player_unit) then
					buff_system:add_buff(player_unit, "enemy_penny_curse", unit, false)
				end
			end
		end
	end
}

return
