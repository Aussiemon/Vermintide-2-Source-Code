require("scripts/utils/script_gui")

local SMALL_FONT_SIZE = 16
local MEDIUM_FONT_SIZE = 22
local FONT_SIZE = 26
local FONT = "arial"
local FONT_MTRL = "materials/fonts/" .. FONT
local TINY_FONT_SIZE = 16
local TINY_FONT = "arial"
local TINY_FONT_MTRL = "materials/fonts/" .. TINY_FONT
local LAYER = 100
local RES_X, RES_Y = Application.resolution()
local NODE_HEIGHT = 0.04
local MIN_NODE_WIDTH = 160 / RES_X
local NODE_SPACING = RES_X * 1e-05
local TEXT_SPACING = 2 / RES_X
local THIN_BORDER = 5 / RES_X
local THICK_BORDER = 15 / RES_X
local FADE_TIME = 3
local reuse_fill_lines = {}
local state_counter = 1
local draw_timers = {}
local nodes = {}
local row_heights = {
	NODE_HEIGHT
}
local ROW_SPACING = NODE_HEIGHT * 0.5
local BORDER_SPACING = NODE_HEIGHT
DrawAiBehaviour = {}
local DrawAiBehaviour = DrawAiBehaviour
DrawAiBehaviour.winning_utility_value = 0
DrawAiBehaviour.circle_array = {}
DrawAiBehaviour.circle_array_index = 0
DrawAiBehaviour.circle_max_size = 12

local function rshoot_action_debug(blackboard, fill_lines)
	local attack_pattern_data = blackboard.attack_pattern_data
	fill_lines[1] = "State:" .. tostring(attack_pattern_data and attack_pattern_data.state)

	return 1
end

local function tentacle_action_debug(blackboard, fill_lines)
	local tentacle_data = blackboard.tentacle_data

	if tentacle_data then
		fill_lines[1] = "state:" .. tostring(tentacle_data.state) .. "/" .. tostring(tentacle_data.sub_state)
		fill_lines[2] = "template: " .. tostring(tentacle_data.active_template_name)
		fill_lines[3] = "mount: " .. tostring(tentacle_data.portal_spawn_type)
		fill_lines[4] = "path: " .. tostring(tentacle_data.path_type)
	end

	return 4
end

local function chaos_sorc_skulk_action_debug(blackboard, fill_lines)
	local portal_data = blackboard.portal_data

	if portal_data then
		local sa = (portal_data.portal_search_active and "searching") or "no search"
		local portal_out = (blackboard.portal_unit and "1") or "0"
		local count = portal_data.search_counter
		local wall_index = tostring(portal_data.cover_point_index)
		fill_lines[1] = sa .. " ,P:" .. portal_out .. ",SC:" .. count .. " ,Wi:" .. wall_index
		fill_lines[2] = "type=" .. tostring(portal_data.placement)

		return 2
	end

	local vortex_data = blackboard.vortex_data

	if vortex_data then
		local t = Managers.time:time("game")
		local next_cast_attempt = string.format("spawn_timer: %.2f | %.2f", vortex_data.spawn_timer, t)
		local vortex_count = string.format("num_vortex_units: %d", #vortex_data.vortex_units)
		fill_lines[1] = next_cast_attempt
		fill_lines[2] = vortex_count

		return 2
	end

	return 0
end

local function chaos_sorc_exalt_skulk_action_debug(blackboard, fill_lines)
	fill_lines[1] = "phase=" .. tostring(blackboard.phase)
	fill_lines[2] = "current_spell=" .. tostring((blackboard.current_spell and blackboard.current_spell.name) or "nil")
	fill_lines[3] = "spell count=" .. tostring(blackboard.spell_count)
	fill_lines[4] = "freeze spell casting=" .. tostring(blackboard.freeze_spell_casting)

	return 4
end

local function rat_ogre_jump_slam_action_debug(blackboard, fill_lines)
	local jump_data = blackboard.jump_slam_data
	local landing_time = jump_data and jump_data.landing_time

	if landing_time then
		local t = Managers.time:time("game")
		fill_lines[1] = string.format("landing_time= %.2f | %.2f", landing_time, t)

		return 1
	else
		return 0
	end
end

local show_blackboard_data = {
	BTFallAction = {
		"is_falling",
		"fall_done",
		"fall_state"
	},
	BTMoveToGoalAction = {
		"is_passive"
	},
	BTBossFollowAction = {
		"move_state"
	},
	BTMeleeSlamAction = {
		"move_state",
		"attack_anim",
		"attack_anim_driven"
	},
	BTTargetUnreachableAction = {
		"move_state",
		"target_dist"
	},
	BTCrazyJumpAction = {
		"jump_data"
	},
	BTSkulkAroundAction = {
		"in_los",
		"skulk_pos",
		"debug_state"
	},
	BTCirclePreyAction = {
		"move_state"
	},
	BTAttackAction = {
		"attacks_done",
		"target_dist",
		"slot_layer"
	},
	BTClanRatFollowAction = {
		"move_state",
		"using_smart_object"
	},
	BTCombatShoutAction = {
		"nav_target_dist_sq",
		"slot_layer"
	},
	BTClimbAction = {
		"is_in_smartobject_range",
		"is_climbing",
		"climb_state"
	},
	BTSkulkAroundAction = {
		"skulk_jump_tries"
	},
	BTPackMasterSkulkAroundAction = {
		"skulk_in_los",
		"skulk_dogpile",
		"skulk_time_left",
		"skulk_debug_state"
	},
	BTPackMasterDragAction = {
		"drag_check_index",
		"drag_check_time_debug"
	},
	BTSkulkApproachAction = {
		"target_dist"
	},
	BTSkulkIdleAction = {
		"skulk_data"
	},
	BTNinjaApproachAction = {
		"skulk_pos_is_jump_off_point"
	},
	BTTrollDownedAction = {
		"downed_state"
	},
	BTRatlingGunnerShootAction = {
		rshoot_action_debug
	},
	BTTentacleAttackAction = {
		tentacle_action_debug
	},
	BTChaosSorcererSkulkApproachAction = {
		chaos_sorc_skulk_action_debug
	},
	BTVortexWanderAction = {
		"vortex_data"
	},
	BTInVortexAction = {
		"in_vortex_state"
	},
	BTChaosExaltedSorcererSkulkAction = {
		chaos_sorc_exalt_skulk_action_debug
	},
	BTJumpSlamAction = {
		rat_ogre_jump_slam_action_debug
	}
}

local function reset_circle_array()
	DrawAiBehaviour.circle_array_index = 0

	table.clear(DrawAiBehaviour.circle_array)

	state_counter = 1
end

local function add_item_to_circle_array(item)
	DrawAiBehaviour.circle_array_index = DrawAiBehaviour.circle_array_index % DrawAiBehaviour.circle_max_size + 1
	DrawAiBehaviour.circle_array[DrawAiBehaviour.circle_array_index] = item
end

local function present_circle_array(gui, x, y)
	local a = DrawAiBehaviour.circle_array
	local index = DrawAiBehaviour.circle_array_index
	local max_items = DrawAiBehaviour.circle_max_size
	local num_items = #a
	local x1 = x
	local y1 = y

	ScriptGUI.icrect(gui, RES_X, RES_Y, x1 - 5, y1 - 5, x1 + 300, y1 + num_items * 20 + 10, LAYER, Color(100, 100, 100, 150))

	for i = 1, num_items, 1 do
		local text = a[index]

		ScriptGUI.ictext(gui, RES_X, RES_Y, text, FONT_MTRL, FONT_SIZE, FONT, x1, y1 + 20 * i, 400, Color(255, 220, 120))

		index = (index - 2) % max_items + 1
	end
end

local function present_perception(gui, x, y, blackboard)
	local x1 = x
	local y1 = y
	local y2 = y
	local i = 1
	local unit = blackboard.unit

	if Unit.alive(unit) then
		local ai_system = Managers.state.entity:system("ai_system")
		local col1 = Color(200, 200, 200)
		local colh = Color(240, 240, 140)
		local extension = ai_system.ai_units_perception[blackboard.unit]

		if extension then
			y2 = y2 + 10

			ScriptGUI.ictext(gui, RES_X, RES_Y, "normal:", FONT_MTRL, SMALL_FONT_SIZE, FONT, x1, y2, 400, colh)

			y2 = y2 + 17
			local p = "p: " .. extension._perception_func_name
			local t = "t: " .. extension._target_selection_func_name

			ScriptGUI.ictext(gui, RES_X, RES_Y, p, FONT_MTRL, MEDIUM_FONT_SIZE, FONT, x1, y2, 400, col1)

			y2 = y2 + 20

			ScriptGUI.ictext(gui, RES_X, RES_Y, t, FONT_MTRL, MEDIUM_FONT_SIZE, FONT, x1, y2, 400, col1)

			y2 = y2 + 18
		end

		local extension = ai_system.ai_units_perception_continuous[blackboard.unit]

		if extension then
			ScriptGUI.ictext(gui, RES_X, RES_Y, "continious:", FONT_MTRL, SMALL_FONT_SIZE, FONT, x1, y2, 400, colh)

			local y2 = y2 + 17
			local t = blackboard.breed.perception_continuous

			ScriptGUI.ictext(gui, RES_X, RES_Y, t, FONT_MTRL, MEDIUM_FONT_SIZE, FONT, x1, y2, 400, col1)

			y2 = y2 + 20
		end

		local extension = ai_system.ai_units_perception_prioritized[blackboard.unit]

		if extension then
			y2 = y2 + 10

			ScriptGUI.ictext(gui, RES_X, RES_Y, "prioritized:", FONT_MTRL, SMALL_FONT_SIZE, FONT, x1, y2, 400, colh)

			local p = "p: " .. extension._perception_func_name
			local t = "t: " .. extension._target_selection_func_name
			y2 = y2 + 20

			ScriptGUI.ictext(gui, RES_X, RES_Y, p, FONT_MTRL, MEDIUM_FONT_SIZE, FONT, x1, y2, 400, col1)

			y2 = y2 + 20

			ScriptGUI.ictext(gui, RES_X, RES_Y, t, FONT_MTRL, MEDIUM_FONT_SIZE, FONT, x1, y2, 400, col1)
		end

		y2 = y2 + 25

		ScriptGUI.icrect(gui, RES_X, RES_Y, x1 - 5, y1 - 5, x1 + 380, y2, LAYER, Color(25, 70, 70, 100))
	end
end

local function update_node_history(blackboard, node_children, current_identifier)
	if DrawAiBehaviour.last_blackboard ~= blackboard or blackboard.reset_node_history then
		DrawAiBehaviour.last_blackboard = blackboard
		DrawAiBehaviour.last_running_node = nil
		DrawAiBehaviour.running_node_switch = true
		blackboard.reset_node_history = nil

		reset_circle_array()
	end

	local running_nodes = blackboard.running_nodes

	for node_id, running_data in pairs(running_nodes) do
		if running_data._identifier == current_identifier then
			if not node_children then
				if DrawAiBehaviour.running_node ~= current_identifier then
					DrawAiBehaviour.last_running_node = DrawAiBehaviour.running_node
					DrawAiBehaviour.running_node_switch = true

					add_item_to_circle_array(state_counter .. " " .. current_identifier)

					state_counter = state_counter + 1
				else
					DrawAiBehaviour.running_node_switch = false
				end

				DrawAiBehaviour.running_node = current_identifier
			end

			return current_identifier
		end
	end
end

local function longest_text_length_check(text, longest_text, longest_text_length)
	local text_length = UTF8Utils.string_length(text)

	if longest_text_length < text_length then
		return text, text_length
	else
		return longest_text, longest_text_length
	end
end

local v3box_meta = getmetatable(Vector3Box(0, 0, 0))

local function draw_blackboard(gui, node, blackboard, x1, y1, extra_info, node_width, extra_height, tcolor)
	local pos_x = x1 + TEXT_SPACING
	local pos_y = y1 + NODE_HEIGHT * 0.8
	local text_height = SMALL_FONT_SIZE / RES_Y
	local text_layer = LAYER + 1
	local node_type = node.name
	local bb_color = Color(255, 0, 0, 0)
	local bb_items = show_blackboard_data[node_type]
	local bb_text, text_length, longest_text = nil
	local longest_text_length = 0
	local enter_hook = node._tree_node.enter_hook

	if enter_hook then
		longest_text, longest_text_length = longest_text_length_check(enter_hook, longest_text, longest_text_length)
	end

	local leave_hook = node._tree_node.leave_hook

	if leave_hook then
		longest_text, longest_text_length = longest_text_length_check(leave_hook, longest_text, longest_text_length)
	end

	if bb_items then
		for _, key in ipairs(bb_items) do
			if type(blackboard[key]) == "table" then
				extra_height = extra_height + text_height
				bb_text = string.format("[%s]", key)

				ScriptGUI.itext(gui, RES_X, RES_Y, bb_text, FONT_MTRL, SMALL_FONT_SIZE, FONT, pos_x, pos_y + extra_height, text_layer, bb_color)

				longest_text, longest_text_length = longest_text_length_check(bb_text, longest_text, longest_text_length)
				local sub_table = blackboard[key]

				for sub_key, sub_value in pairs(sub_table) do
					extra_height = extra_height + text_height

					if type(sub_value) == "number" then
						bb_text = string.format("  > %s = %.2f", sub_key, sub_value)
					elseif getmetatable(sub_value) == v3box_meta then
						bb_text = string.format("  > %s = Vector3Box(%.2f, %.2f, %.2f)", sub_key, sub_value.x, sub_value.y, sub_value.z)
					elseif type(sub_value) ~= "userdata" then
						bb_text = string.format("  > %s = %s", sub_key, tostring(sub_value))
					else
						bb_text = string.format("  > %s = %s", sub_key, type(sub_value))
					end

					ScriptGUI.itext(gui, RES_X, RES_Y, bb_text, FONT_MTRL, SMALL_FONT_SIZE, FONT, pos_x, pos_y + extra_height, text_layer, bb_color)

					longest_text, longest_text_length = longest_text_length_check(bb_text, longest_text, longest_text_length)
				end
			elseif type(key) == "function" then
				local num_lines = key(blackboard, reuse_fill_lines)

				for i = 1, num_lines, 1 do
					extra_height = extra_height + text_height
					bb_text = reuse_fill_lines[i]

					ScriptGUI.itext(gui, RES_X, RES_Y, bb_text, FONT_MTRL, SMALL_FONT_SIZE, FONT, pos_x, pos_y + extra_height, text_layer, bb_color)

					longest_text, longest_text_length = longest_text_length_check(bb_text, longest_text, longest_text_length)
				end
			else
				extra_height = extra_height + text_height
				local data = blackboard[key]

				if type(data) == "number" then
					bb_text = string.format("%s = %.2f", key, data)
				else
					bb_text = string.format("%s = %s", key, tostring(data))
				end

				ScriptGUI.itext(gui, RES_X, RES_Y, bb_text, FONT_MTRL, SMALL_FONT_SIZE, FONT, pos_x, pos_y + extra_height, text_layer, bb_color)

				longest_text, longest_text_length = longest_text_length_check(bb_text, longest_text, longest_text_length)
			end
		end
	elseif extra_info then
		extra_height = extra_height + 5 / RES_Y
		local ecolor = Color(240, 255, 55, 100)

		for k, string in ipairs(extra_info) do
			extra_height = extra_height + text_height

			ScriptGUI.itext(gui, RES_X, RES_Y, string, FONT_MTRL, SMALL_FONT_SIZE, FONT, pos_x, pos_y + extra_height, text_layer, ecolor)

			longest_text, longest_text_length = longest_text_length_check(string, longest_text, longest_text_length)
		end
	end

	if longest_text_length > 0 then
		local min_pos, max_pos = Gui.text_extents(gui, longest_text, FONT_MTRL, SMALL_FONT_SIZE)
		local text_width = (max_pos.x - min_pos.x) / RES_X
		node_width = math.max(node_width, text_width + TEXT_SPACING)
	end

	return node_width, extra_height
end

local function draw_utility_nodes(gui, blackboard, running, action_data, text, considerations, x1, y1, extra_height, t)
	local yellow = Color(255, 240, 200, 10)
	local size = Vector2(160, 100)
	local step_y = size.y + 40
	local pos_y = -215
	local pos = Vector3(x1 * RES_X, ((1 - y1 + NODE_HEIGHT) - extra_height) * RES_Y, LAYER + 10)
	local num = 0

	for name, consideration_data in pairs(considerations) do
		if type(consideration_data) == "table" then
			local npos = pos + Vector3(0, pos_y, 0)

			EditAiUtility.draw_utility_info(gui, consideration_data, nil, name, npos, size, 1, "tiny")

			if consideration_data.is_condition then
				EditAiUtility.draw_utility_condition(gui, text, consideration_data, npos, size, blackboard, Color(92, 28, 128, 44))
			else
				EditAiUtility.draw_utility_spline(gui, t, consideration_data, nil, name, npos, size, Color(92, 28, 128, 44), 1, 2)
				EditAiUtility.draw_realtime_utility(gui, text, consideration_data, npos, size, blackboard)
			end

			pos_y = pos_y - step_y
			num = num + 1
		end
	end

	local utility = Utility.get_action_utility(action_data, text, blackboard, t)

	if running and DrawAiBehaviour.running_node_switch then
		DrawAiBehaviour.winning_utility_value = utility
	end

	local sum_text = nil

	if running then
		sum_text = string.format("sum: %.1f, (%.1f)", utility, DrawAiBehaviour.winning_utility_value)
	else
		sum_text = string.format("sum: %.1f", utility)
	end

	ScriptGUI.text(gui, sum_text, TINY_FONT_MTRL, TINY_FONT_SIZE, TINY_FONT, pos + Vector3(3, -102, 0), yellow)

	local extra_utility_height = num * 0.1

	return extra_utility_height
end

local function draw_hook_box(gui, node, node_width, extra_height, header_text, hook_id, x1, bottom_y, box_color)
	local text_height = SMALL_FONT_SIZE / RES_Y
	local start_y = bottom_y
	local pos_x = x1
	bottom_y = start_y + text_height

	ScriptGUI.itext(gui, RES_X, RES_Y, header_text, FONT_MTRL, SMALL_FONT_SIZE, FONT, pos_x, bottom_y, LAYER + 11, Color(255, 255, 255, 255))

	bottom_y = bottom_y + text_height

	ScriptGUI.itext(gui, RES_X, RES_Y, hook_id, FONT_MTRL, SMALL_FONT_SIZE, FONT, pos_x, bottom_y, LAYER + 11, Color(255, 255, 255, 255))

	bottom_y = bottom_y + THICK_BORDER

	ScriptGUI.irect(gui, RES_X, RES_Y, pos_x, start_y, pos_x + node_width, bottom_y, LAYER + 10, box_color)

	local box_height = bottom_y - start_y

	return bottom_y, box_height
end

local function draw_node(gui, node, text, running, x1, y1, node_width, extra_height, dt, tcolor)
	local color = nil

	if running then
		color = Color(200, 242, 152, 7)

		if draw_timers[node] ~= FADE_TIME then
			for id, timer in pairs(draw_timers) do
				draw_timers[id] = timer * 0.9
			end

			draw_timers[node] = FADE_TIME
		end
	else
		local green = 60
		local timer = draw_timers[node]

		if timer then
			timer = timer - dt

			if timer <= 0 then
				draw_timers[node] = nil
			else
				green = math.lerp(60, 255, timer / FADE_TIME)
				draw_timers[node] = timer
			end
		end

		if node._children then
			color = Color(200, 130, 170, green)
		else
			color = Color(200, 30, 170, green)
		end
	end

	local identifier = node._identifier
	local last_identifier = DrawAiBehaviour.last_running_node

	if identifier == last_identifier then
		ScriptGUI.irect(gui, RES_X, RES_Y, x1 - THIN_BORDER, y1 - THIN_BORDER, x1 + node_width + THIN_BORDER, y1 + NODE_HEIGHT + extra_height + THIN_BORDER, LAYER - 1, Color(255, 242, 152, 7))
	end

	ScriptGUI.itext(gui, RES_X, RES_Y, node.name, FONT_MTRL, SMALL_FONT_SIZE, FONT, x1 + TEXT_SPACING, y1 + NODE_HEIGHT * 0.28, LAYER + 1, tcolor)

	local bottom_y = y1 + NODE_HEIGHT + extra_height
	local box_height = nil

	ScriptGUI.irect(gui, RES_X, RES_Y, x1, y1, x1 + node_width, bottom_y, LAYER, color)
	ScriptGUI.itext(gui, RES_X, RES_Y, text, FONT_MTRL, FONT_SIZE, FONT, x1 + TEXT_SPACING, y1 + NODE_HEIGHT * 0.7, LAYER + 1, tcolor)

	local enter_hook = node._tree_node.enter_hook

	if enter_hook then
		bottom_y, box_height = draw_hook_box(gui, node, node_width, extra_height, "ENTER_HOOK:", enter_hook, x1, bottom_y, Color(200, 100, 100, 150))
		extra_height = extra_height + box_height
	end

	local leave_hook = node._tree_node.leave_hook

	if leave_hook then
		bottom_y, box_height = draw_hook_box(gui, node, node_width, extra_height, "LEAVE_HOOK:", leave_hook, x1, bottom_y, Color(200, 150, 100, 150))
		extra_height = extra_height + box_height
	end

	return extra_height
end

local function draw_node_children(bt, gui, node, node_children, blackboard, row, x1, y1, node_width, extra_node_height, total_width, extra_utility_height, t, dt)
	local row_height = row_heights[row] or 0
	local child_y = y1 + row_height + ROW_SPACING
	local start_x, start_y = nil

	if node.name == "BTSequence" then
		start_x = x1
		start_y = child_y + extra_utility_height
	else
		start_x = x1 - total_width * 0.5 + node_width * 0.5
		start_y = child_y
	end

	local cx = start_x
	local cy = start_y
	local next_row = row + 1
	local draw_utility = node.name == "BTUtilityNode"
	local line_color_normal = Color(150, 100, 255, 100)
	local line_color_sequence = Color(150, 100, 50, 200)
	local line_layer = LAYER - 1
	local line_x = x1 + node_width * 0.5
	local line_y1 = y1 + NODE_HEIGHT
	local line_width_sequence = 6
	local line_width_normal = 2
	local max_child_extra_total_width = 0
	local max_child_width = 0
	local max_child_extra_height = 0
	local max_child_extra_total_height = 0

	for k, child in pairs(node_children) do
		local child_identifier = child._identifier
		local child_default_width = nodes[child_identifier].w
		local child_default_total_width = nodes[child_identifier].total_w or 0

		if node.name ~= "BTSequence" then
			cx = cx + child_default_total_width * 0.5
		end

		local child_extra_total_width, child_extra_total_height, child_extra_height, child_width = DrawAiBehaviour.draw_tree(bt, gui, child, blackboard, next_row, t, dt, cx, cy, draw_utility)
		max_child_extra_total_width = math.max(max_child_extra_total_width, child_extra_total_width)
		max_child_extra_height = math.max(max_child_extra_height, child_extra_height)
		max_child_width = math.max(max_child_width, child_width)
		max_child_extra_total_height = math.max(max_child_extra_total_height, child_extra_total_height)

		if node.name == "BTSequence" then
			local line_y2 = cy
			local p1 = Vector2(line_x, line_y1)
			local p2 = Vector2(line_x, line_y2)

			ScriptGUI.hud_iline(gui, RES_X, RES_Y, p1, p2, line_layer, line_width_sequence, line_color_sequence)

			line_y1 = line_y2 + NODE_HEIGHT + child_extra_height
			cy = cy + NODE_HEIGHT * 1.5 + child_extra_height + child_extra_total_height
			line_width_sequence = line_width_normal
		else
			local p1 = Vector2(x1 + node_width * 0.5, y1 + NODE_HEIGHT)
			local p2 = Vector2(cx + child_default_width * 0.5, child_y)

			ScriptGUI.hud_iline(gui, RES_X, RES_Y, p1, p2, line_layer, line_width_normal, line_color_normal)

			cx = cx + child_default_total_width * 0.5 + child_extra_total_width
			cx = cx + child_default_width + NODE_SPACING
		end
	end

	row_heights[next_row] = NODE_HEIGHT + max_child_extra_height
	local xb = 5 / RES_X
	local yb = 5 / RES_Y
	local ocolor = Color(70, 55, 155, 200)
	local bounding_box_x1 = start_x - xb
	local bounding_box_y1 = child_y - yb
	local bounding_box_x2, bounding_box_y2 = nil

	if node.name == "BTSequence" then
		bounding_box_x2 = start_x + max_child_width + xb
		bounding_box_y2 = (cy + yb) - NODE_HEIGHT * 0.5
		ocolor = Color(70, 150, 50, 200)
	else
		bounding_box_x2 = (cx + xb) - NODE_SPACING
		bounding_box_y2 = cy + NODE_HEIGHT + max_child_extra_height + yb
	end

	ScriptGUI.irect(gui, RES_X, RES_Y, bounding_box_x1, bounding_box_y1, bounding_box_x2, bounding_box_y2, line_layer, ocolor)

	local total_extra_height = 0

	if node.name == "BTSequence" then
		total_extra_height = cy - child_y
	else
		total_extra_height = cy - line_y1 + max_child_extra_total_height + NODE_HEIGHT
	end

	return max_child_extra_total_width, total_extra_height
end

DrawAiBehaviour.tree_width = function (gui, node)
	local id = node._identifier
	local name = node.name
	local id_min, id_max = Gui.text_extents(gui, id, FONT_MTRL, FONT_SIZE)
	local name_min, name_max = Gui.text_extents(gui, name, FONT_MTRL, SMALL_FONT_SIZE)
	local id_width = (id_max.x - id_min.x) / RES_X + TEXT_SPACING
	local name_width = (name_max.x - name_min.x) / RES_X + TEXT_SPACING
	local text_width = math.max(MIN_NODE_WIDTH, id_width, name_width)
	nodes[id] = {
		w = text_width
	}
	local node_children = node._children

	if node_children then
		local n = 0
		local w = 0

		for _, child in pairs(node_children) do
			local amount, width = DrawAiBehaviour.tree_width(gui, child)
			n = n + amount

			if node.name ~= "BTSequence" then
				w = w + width
			end
		end

		nodes[id].total_w = w

		return n, w
	else
		return 1, text_width
	end
end

DrawAiBehaviour.draw_tree = function (bt, gui, node, blackboard, row, t, dt, x, y, draw_utility, extra_info)
	local identifier = node._identifier
	local node_children = node._children
	local running = update_node_history(blackboard, node_children, identifier)

	if not script_data.hide_behavior_tree_node_history then
		present_circle_array(gui, 20, 400)
		present_perception(gui, 20, 300, blackboard)
	end

	local nodes = nodes
	local node_width = nodes[identifier].w
	local total_width = nodes[identifier].total_w
	local x1 = x
	local y1 = y

	if row == 1 then
		y1 = y1 + BORDER_SPACING
	end

	local text = identifier
	local tcolor = Color(240, 255, 255, 255)
	local extra_height = 0
	node_width, extra_height = draw_blackboard(gui, node, blackboard, x1, y1, extra_info, node_width, extra_height, tcolor)
	local extra_utility_height = 0
	local tree_node = node._tree_node
	local action_data = tree_node and tree_node.action_data
	local considerations = action_data and action_data.considerations

	if draw_utility and tree_node and action_data and considerations then
		extra_utility_height = draw_utility_nodes(gui, blackboard, running, action_data, text, considerations, x1, y1, extra_height, t)
	end

	extra_height = draw_node(gui, node, text, running, x1, y1, node_width, extra_height, dt, tcolor)
	local max_child_extra_width = 0
	local max_child_extra_height = 0

	if node_children then
		max_child_extra_width, max_child_extra_height = draw_node_children(bt, gui, node, node_children, blackboard, row, x1, y1, node_width, extra_height, total_width, extra_utility_height, t, dt)
	end

	local current_node_extra_width = node_width - nodes[identifier].w
	local extra_width = math.max(current_node_extra_width, max_child_extra_width)

	return extra_width, max_child_extra_height, extra_height, node_width
end

return
