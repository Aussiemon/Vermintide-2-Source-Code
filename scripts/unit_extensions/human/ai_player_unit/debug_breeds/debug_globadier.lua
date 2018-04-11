DebugGlobadier = DebugGlobadier or {}
DebugGlobadier.update = function (unit, blackboard, t)
	local target_unit = blackboard.target_unit

	if not target_unit then
		return 
	end

	local target_position = POSITION_LOOKUP[target_unit]
	local offset = Vector3.up() * 0.2
	local breed = blackboard.breed
	local skulk_approach_action = BreedActions.skaven_poison_wind_globadier.skulk_approach
	local advance_towards_players_action = BreedActions.skaven_poison_wind_globadier.advance_towards_players
	local lurk_radius = skulk_approach_action.skulk_init_distance
	local commit_radius = BreedActions.skaven_poison_wind_globadier.skulk_approach.commit_distance
	local current_lurk_radius = blackboard.skulk_data and blackboard.skulk_data.radius

	QuickDrawer:circle(target_position + offset, lurk_radius, Vector3.up(), Colors.get("light_green"))
	QuickDrawer:circle(target_position + offset, commit_radius, Vector3.up(), Colors.get("medium_orchid"))

	if current_lurk_radius then
		QuickDrawer:circle(target_position + offset, lurk_radius, Vector3.up(), Colors.get("light_green"))
	end

	local target_distance = (blackboard.target_dist and math.round_with_precision(blackboard.target_dist, 2)) or "-"
	local wanted_distance = (blackboard.wanted_distance and math.round_with_precision(blackboard.wanted_distance, 2)) or "-"
	local slot_count = blackboard.total_slots_count
	local ai_node = blackboard.action and blackboard.action.name
	local time_until_first_throw_string = "-"
	local time_until_first_throw = nil
	local distance_until_throw = "-"
	local throw_at_distance = "-"
	local advance_data = blackboard.advance_towards_players

	if advance_data then
		local slot_count_time_modifier = advance_towards_players_action.slot_count_time_modifier
		local slot_count_distance_modifier = advance_towards_players_action.slot_count_distance_modifier
		local time_unit_first_throw_raw = math.round_with_precision(math.max(advance_data.time_until_first_throw - advance_data.timer, 0), 2)
		time_until_first_throw = advance_data.time_until_first_throw + slot_count_time_modifier * slot_count
		time_until_first_throw = math.max(time_until_first_throw - advance_data.timer, 0)
		time_until_first_throw = math.round_with_precision(time_until_first_throw, 2)
		time_until_first_throw_string = time_until_first_throw or "-"

		if time_unit_first_throw_raw ~= time_until_first_throw then
			time_until_first_throw_string = time_until_first_throw .. " [" .. time_unit_first_throw_raw .. "]"
		end

		throw_at_distance = advance_data.throw_at_distance

		if throw_at_distance then
			local time_in_approach_distance_modifier = advance_towards_players_action.time_before_throw_distance_modifier * advance_data.time_before_throw_timer
			throw_at_distance = throw_at_distance + advance_towards_players_action.slot_count_distance_modifier * slot_count + time_in_approach_distance_modifier
			local target_dist = blackboard.target_dist
			distance_until_throw = math.max(target_dist - throw_at_distance, 0)
			distance_until_throw = math.round_with_precision(distance_until_throw, 2)
			throw_at_distance = math.round_with_precision(throw_at_distance, 2)
			local throw_at_distance_raw = math.round_with_precision(advance_data.throw_at_distance, 2)

			if throw_at_distance_raw ~= throw_at_distance then
				throw_at_distance = throw_at_distance .. " [" .. throw_at_distance_raw .. "]"
			end
		end
	end

	local time_until_next_throw = "-"
	local throw_globe_data = blackboard.throw_globe_data

	if throw_globe_data then
		local next_throw_at = throw_globe_data.next_throw_at

		if next_throw_at then
			time_until_next_throw = math.max(next_throw_at - t, 0)
			time_until_next_throw = math.round_with_precision(time_until_next_throw, 2)
		end
	end

	local state = nil

	if ai_node == "skulk_approach" then
		state = "lurking"
	elseif ai_node == "advance_towards_players" and 0 < time_until_first_throw then
		state = "approach"
	elseif ai_node == "advance_towards_players" or ai_node == "throw_poison_globe" or ai_node == "observe_poison_wind" or ai_node == "suicide_run" then
		state = "combat"
	end

	DebugGlobadier.debug_hud_print("poison wind globadier:", nil, 1)
	DebugGlobadier.debug_hud_print("in_state:", state, 3)
	DebugGlobadier.debug_hud_print("ai_node:", ai_node, 4)
	DebugGlobadier.debug_hud_print("target_distance:", target_distance, 5)
	DebugGlobadier.debug_hud_print("wanted_distance:", wanted_distance, 6)
	DebugGlobadier.debug_hud_print("throw_at_distance:", throw_at_distance, 7)
	DebugGlobadier.debug_hud_print("slot_count:", slot_count, 8, true)
	DebugGlobadier.debug_hud_print("time_until_first_throw:", time_until_first_throw_string, 9, time_until_first_throw == 0)
	DebugGlobadier.debug_hud_print("time_until_next_throw:", time_until_next_throw, 10, time_until_next_throw == 0 or time_until_next_throw == "-")
	DebugGlobadier.debug_hud_print("distance_until_throw:", distance_until_throw, 11, distance_until_throw == 0 or distance_until_throw == "-")
	DebugGlobadier.debug_hud_background(11)

	return 
end
local font_size = 16
local font = "gw_arial_16"
local font_mtrl = "materials/fonts/" .. font
local row_height = 17
DebugGlobadier.debug_hud_print = function (caption, value, index, valid)
	local gui = Debug.gui
	local y = 220 - index * row_height
	local caption_pos = Vector3(20, y, 100)
	local caption_color = Colors.get("steel_blue")

	Gui.text(gui, caption, font_mtrl, font_size, font, caption_pos, caption_color)

	if not value then
		return 
	end

	local text_color = Colors.get("light_green")

	if valid == false then
		text_color = Colors.get("crimson")
	elseif valid == nil then
		text_color = Colors.get("steel_blue")
	end

	local caption_x = 100
	local pos = Vector3(160, y, 100)

	Gui.text(gui, value, font_mtrl, font_size, font, pos, text_color)

	return 
end
DebugGlobadier.debug_hud_background = function (max_index)
	local gui = Debug.gui
	local width = 300
	local height = max_index * row_height + 30
	local y = 200 - max_index * row_height
	local pos = Vector3(10, y, 90)
	local size = Vector3(width, height, 0)
	local color = Colors.get_color_with_alpha("black", 150)

	Gui.rect(gui, pos, size, color)

	return 
end

return 
