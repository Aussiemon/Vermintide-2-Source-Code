return {
	description = "description_mutator_slayer_curse",
	display_name = "display_name_mutator_slayer_curse",
	decay_tick = 1,
	icon = "mutator_icon_slayer_curse",
	decay_start = 5,
	add_buff = function (buffs, buff_system, player_unit)
		local is_server_controlled = true
		local server_buff_id = buff_system:add_buff(player_unit, "slayer_curse_debuff", player_unit, is_server_controlled)
		buffs[#buffs + 1] = server_buff_id
	end,
	remove_buff = function (buffs, buff_system, player_unit)
		local num_buffs = #buffs
		local server_buff_id = buffs[num_buffs]

		buff_system:remove_server_controlled_buff(player_unit, server_buff_id)

		buffs[num_buffs] = nil
	end,
	server_start_function = function (context, data)
		data.player_units = {}
		data.buff_system = Managers.state.entity:system("buff_system")
		data.player_manager = Managers.player
	end,
	server_update_function = function (context, data)
		local t = Managers.time:time("game")
		local template = data.template
		local player_units = data.player_units

		for unit, unit_data in pairs(player_units) do
			if not Unit.alive(unit) then
				player_units[unit] = nil
			elseif AiUtils.unit_knocked_down(unit) then
				local buffs = unit_data.buffs
				local num_buffs = #buffs

				for i = 1, num_buffs, 1 do
					template.remove_buff(buffs, data.buff_system, unit)
				end

				player_units[unit] = nil
			elseif unit_data.next_decay <= t then
				local buffs = unit_data.buffs

				template.remove_buff(buffs, data.buff_system, unit)

				if #buffs > 0 then
					unit_data.next_decay = t + template.decay_tick
				else
					player_units[unit] = nil
				end
			end
		end
	end,
	server_ai_killed_function = function (context, data, killed_unit, killer_unit)
		if not data.player_manager:is_player_unit(killer_unit) then
			return
		end

		local player_units = data.player_units

		if not player_units[killer_unit] then
			player_units[killer_unit] = {
				next_decay = 0,
				buffs = {}
			}
		end

		local unit_data = player_units[killer_unit]

		data.template.add_buff(unit_data.buffs, data.buff_system, killer_unit)

		unit_data.next_decay = Managers.time:time("game") + data.template.decay_start
	end
}
