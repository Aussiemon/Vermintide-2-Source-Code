return {
	description = "description_mutator_ticking_bomb",
	display_name = "display_name_mutator_ticking_bomb",
	icon = "mutator_icon_ticking_bomb",
	server_start_function = function (context, data)
		data.buff_name = "mutator_ticking_bomb"
		data.movement_debuff_name = "ticking_bomb_decrease_movement"
		data.buff_system = Managers.state.entity:system("buff_system")
		data.applied_buff_at_t = 0
		data.apply_aoe_threat_after_t = 4
		data.apply_movement_debuff_after_t = 5
		data.player_bomb_data = {}
	end,
	server_players_left_safe_zone = function (context, data)
		data.has_left_safe_zone = true
		local t = Managers.time:time("game")
		data.apply_bomb_buff_at_t = t + 5
	end,
	server_update_function = function (context, data, dt, t)
		if not data.has_left_safe_zone then
			return
		end

		local player_bomb_data = data.player_bomb_data
		local buff_system = data.buff_system

		if data.apply_bomb_buff_at_t < t then
			table.clear(player_bomb_data)

			local current_player_units = PLAYER_AND_BOT_UNITS
			local num_current_player_units = #current_player_units
			local random_num_affected_players = math.random(1, #current_player_units)

			for i = 1, random_num_affected_players, 1 do
				local random_player_unit = current_player_units[math.random(1, num_current_player_units)]
				local is_alive = AiUtils.unit_alive(random_player_unit)

				if is_alive then
					buff_system:add_buff(random_player_unit, data.buff_name, random_player_unit)

					data.applied_buff_at_t = t
					local bomb_data = {
						player_unit = random_player_unit
					}
					data.applied_bot_threat = nil
					data.should_add_movement_debuff = true
					player_bomb_data[#player_bomb_data + 1] = bomb_data
				end
			end

			local random_bomb_delay = math.random(12, 20) + random_num_affected_players
			data.apply_bomb_buff_at_t = t + random_bomb_delay
		end

		for i = 1, #player_bomb_data, 1 do
			local bomb_data = player_bomb_data[i]
			local player_unit = bomb_data.player_unit

			if not Unit.alive(player_unit) then
				table.remove(player_bomb_data, i)

				break
			end

			if t > data.applied_buff_at_t + data.apply_aoe_threat_after_t and not bomb_data.applied_bot_threat then
				local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
				local position = POSITION_LOOKUP[player_unit]
				local size = 4
				local duration = 5

				ai_bot_group_system:aoe_threat_created(position, "sphere", size, nil, duration)

				bomb_data.applied_bot_threat = true
			end

			if t > data.applied_buff_at_t + data.apply_movement_debuff_after_t and not bomb_data.applied_movement_debuff then
				buff_system:add_buff(player_unit, data.movement_debuff_name, player_unit)

				bomb_data.applied_movement_debuff = true
			end
		end
	end
}
