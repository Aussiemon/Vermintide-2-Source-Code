DebugGutterRunner = DebugGutterRunner or {}
DebugGutterRunner.update = function (unit, blackboard, t)
	local breed = blackboard.breed
	local target_unit = (blackboard.target_unit and Unit.get_data(blackboard.target_unit, "unit_name")) or "nil"
	local jump_target = (blackboard.jump_data and blackboard.jump_data.target_unit) or "-"
	local jump_range = string.format("%.1f / %.1f, close range: 8.0 ", blackboard.target_dist or 0, tostring(breed.jump_range))
	local ai_node = blackboard.action and blackboard.action.name
	local skulk = nil
	local skulk_time = blackboard.target_skulk_time and t - blackboard.target_skulk_time

	if not skulk_time then
		skulk = "not skulking"
	elseif 0 < skulk_time then
		skulk = "engage"
	else
		skulk = string.format("%.1f", skulk_time)
	end

	local growing_aggro = nil

	if blackboard.skulk_jump_tries then
		growing_aggro = string.format("%.1f%% tries: %d", blackboard.skulk_jump_tries/10*100, blackboard.skulk_jump_tries)
	else
		growing_aggro = "n/a"
	end

	local special_targets_text = (target_unit and blackboard.group_blackboard.special_targets[target_unit] == unit and "YES") or "NO"
	local next_smart_object_data = (blackboard.next_smart_object_data.next_smart_object_id ~= nil and "YES") or "NO"
	local in_smartobj_range = (blackboard.is_in_smartobject_range and "YES") or "NO"

	DebugGlobadier.debug_hud_print("Gutter runner:", nil, 1)
	DebugGlobadier.debug_hud_print("behavior:", ai_node, 2)
	DebugGlobadier.debug_hud_print("target_unit:", tostring(target_unit), 5)
	DebugGlobadier.debug_hud_print("jump_data target:", tostring(jump_target), 6)
	DebugGlobadier.debug_hud_print("jump_range:", jump_range, 7)
	DebugGlobadier.debug_hud_print("urgency to engage:", blackboard.urgency_to_engage, 8)
	DebugGlobadier.debug_hud_print("skulk time:", skulk, 9)
	DebugGlobadier.debug_hud_print("growing_aggro:", growing_aggro, 10)
	DebugGlobadier.debug_hud_print("special_targets:", special_targets_text, 11)
	DebugGlobadier.debug_hud_print("nxt smartobj:", next_smart_object_data, 12)
	DebugGlobadier.debug_hud_print("in smartobj range:", in_smartobj_range, 13)
	DebugGlobadier.debug_hud_background(11)

	return 
end
local font_size = 16
local font = "gw_arial_16"
local font_mtrl = "materials/fonts/" .. font
local row_height = 17
DebugGutterRunner.debug_hud_print = function (caption, value, index, valid)
	local gui = Debug.gui
	local y = index*row_height - 220
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
DebugGutterRunner.debug_hud_background = function (max_index)
	local gui = Debug.gui
	local width = 300
	local height = max_index*row_height + 30
	local y = max_index*row_height - 200
	local pos = Vector3(10, y, 90)
	local size = Vector3(width, height, 0)
	local color = Colors.get_color_with_alpha("black", 150)

	Gui.rect(gui, pos, size, color)

	return 
end

return 
