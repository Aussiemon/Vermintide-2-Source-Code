local math = math
local string = string
local V2 = Vector2
local V3 = Vector3
local CC = Color
local FatUI = FatUI
local FL = FatUILayout
local align_box = FL.align_box
local _simple_width = 800
local _simple_height = 40
local _simple_circle_texture = "circular_texture"
local _simple_color_primary = {
	255,
	70,
	130,
	180
}
local _simple_color_secondary = {
	255,
	178,
	34,
	34
}
local _simple_rect_radius = 8
local _simple_font = "materials/fonts/arial"
local _simple_font_size = 22
local _simple_slider_dragger_width = 24
local _simple_layout_margin = 12
local _simple_text_input_max_length = 25
local tab2CC = FatUI.tab2CC

FatUI.handle_simple_layout = function (pos, width)
	local size = Vector2(width or _simple_width, _simple_height)

	if pos then
		return pos, size
	end

	local auto_layout_data = FatUI.get_data("FatUI.begin_simple_window")
	auto_layout_data.pos[2] = auto_layout_data.pos[2] - size[2] - _simple_layout_margin
	auto_layout_data.items = auto_layout_data.items + 1

	return auto_layout_data.pos:unbox(), size
end

local c00 = Vector3Box(0, 0, 0)
local c55 = Vector3Box(0.5, 0.5, 0)
local c50 = Vector3Box(0.5, 0, 0)
local c15 = Vector3Box(1, 0.5, 0)
local c11 = Vector3Box(1, 1, 0)
local c05 = Vector3Box(0, 0.5, 0)
local c51 = Vector3Box(0.5, 1, 0)
local Gui_rect = Gui.rect

FatUI.draw_simple_rounded_rect = function (radius, pos, size, color)
	local radius_size = V2(radius, radius)
	local sx = V2(size[1] - 2 * radius, size[2])
	local sy = V2(radius, size[2] - 2 * radius)

	FatUI.draw_rect(align_box(FL.CENTER, sx, pos, size), sx, color)
	FatUI.draw_rect(align_box(FL.WEST, sy, pos, size), sy, color)
	FatUI.draw_rect(align_box(FL.EAST, sy, pos, size), sy, color)
	FatUI.draw_bitmap_uv(_simple_circle_texture, c00:unbox(), c55:unbox(), align_box(FL.SOUTH_EAST, radius_size, pos, size), radius_size, color)
	FatUI.draw_bitmap_uv(_simple_circle_texture, c50:unbox(), c15:unbox(), align_box(FL.NORTH_EAST, radius_size, pos, size), radius_size, color)
	FatUI.draw_bitmap_uv(_simple_circle_texture, c55:unbox(), c11:unbox(), align_box(FL.NORTH_WEST, radius_size, pos, size), radius_size, color)
	FatUI.draw_bitmap_uv(_simple_circle_texture, c05:unbox(), c51:unbox(), pos, radius_size, color)
end

FatUI.draw_simple_label_multiline = function (text, align, pos, size)
	FatUI.draw_text_multiline(text, _simple_font, _simple_font_size, align, pos, size)
end

FatUI.draw_simple_label = function (text, pos, width)
	local pos, size = FatUI.handle_simple_layout(pos, width)

	FatUI.draw_simple_label_multiline(text, FL.WEST, pos, size)
end

FatUI.draw_simple_title_bar = function (label, pos, size, color)
	local radius = _simple_rect_radius
	local radius_size = V2(radius, radius)
	local sx = V2(size[1] - 2 * radius, size[2])
	local sy = V2(radius, size[2] - radius)

	FatUI.draw_rect(align_box(FL.CENTER, sx, pos, size), sx, color)
	FatUI.draw_rect(align_box(FL.SOUTH_WEST, sy, pos, size), sy, color)
	FatUI.draw_rect(align_box(FL.NORTH_WEST, sy, pos, size), sy, color)
	FatUI.draw_bitmap_uv(_simple_circle_texture, c00:unbox(), c55:unbox(), align_box(FL.SOUTH_EAST, radius_size, pos, size), radius_size, color)
	FatUI.draw_bitmap_uv(_simple_circle_texture, c50:unbox(), c15:unbox(), align_box(FL.NORTH_EAST, radius_size, pos, size), radius_size, color)
	FatUI.draw_simple_label_multiline(label, FL.CENTER, pos + V3(0, 0, 1), size)
end

FatUI.draw_simple_widget_background = function (state, pos, size)
	local alpha = 0

	if state == "default" then
		alpha = 127
	elseif state == "hover" then
		alpha = 119
	elseif state == "hot" then
		alpha = 135
	end

	if state == "hot" or state == "warm" then
		FatUI.draw_simple_rounded_rect(_simple_rect_radius, pos - V2(1, 1), size + V2(2, 2), tab2CC(_simple_color_secondary, 170))
	end

	FatUI.draw_simple_rounded_rect(_simple_rect_radius, pos, size, CC(alpha, 127, 127, 127))
end

local SIMPLE_BUTTON_COLOR = {
	0,
	0,
	0,
	0
}

FatUI.draw_simple_button = function (idx, label, pos, width)
	local pos, size = FatUI.handle_simple_layout(pos, width)
	local data, is_clicked = FatUI.use_behaviour(idx, "behaviour_button", pos, size)
	local state = data.state
	local alpha, t = nil

	if state == "default" then
		t = 0
		alpha = 230
	elseif state == "hover" then
		t = 0.2
		alpha = 245
	elseif state == "hot" then
		t = 0.45
		alpha = 245
	elseif state == "warm" then
		t = 0.35
		alpha = 230
	end

	Colors.lerp_color_tables(_simple_color_primary, _simple_color_secondary, t, SIMPLE_BUTTON_COLOR)

	SIMPLE_BUTTON_COLOR[1] = alpha

	FatUI.draw_simple_rounded_rect(_simple_rect_radius, pos, size, tab2CC(SIMPLE_BUTTON_COLOR))
	FatUI.draw_simple_label_multiline(label, FL.CENTER, pos + V3(0, 0, 1), size)

	return is_clicked
end

FatUI.draw_simple_text_input = function (idx, text, pos, width)
	local pos, size = FatUI.handle_simple_layout(pos, width, width)
	local data, text, did_blur = FatUI.use_behaviour(idx, "behaviour_text_input", text, pos, size, _simple_text_input_max_length)
	local state = data.state
	local font_size = _simple_font_size
	local text_offset = V3(font_size, 0, 1)

	FatUI.draw_simple_widget_background(data.state, pos, size)

	if state == "hot" then
		local dt = FatUI.t - (data.last_stroke + 0.5)
		local caret_alpha = ((dt < 0 or (0.6666666666666666 * dt) % 0.6666666666666666 < 0.3333333333333333) and 1) or 0
		local caret_offset = FatUI.calc_text_extents_caret(string.sub(text, 1, data.caret), _simple_font, font_size)
		caret_offset[1] = caret_offset[1] - 1
		local caret_size = V2(math.max(1.5, 0.01 * font_size), 1.1 * font_size)
		local caret_pos = text_offset + caret_offset + align_box(FL.WEST, caret_size, pos, size)

		FatUI.draw_rect(caret_pos, caret_size, CC(caret_alpha * 200, 255, 255, 255))

		if data.selection then
			local a = data.caret
			local b = data.selection
			local dir = 1

			if b < a then
				dir = -1
				b = a
				a = b
			end

			local selection_size = FatUI.calc_text_extents_caret(string.sub(text, a + 1, b), _simple_font, font_size)
			selection_size[1] = selection_size[1] * dir
			selection_size[2] = FatUI.calc_font_line_height(_simple_font, font_size)

			FatUI.draw_rect(caret_pos, selection_size, CC(127, 127, 127, 255))
		end
	end

	FatUI.draw_text_multiline(text, _simple_font, font_size, FL.WEST, pos + text_offset + V3(0, 0, 1), size - text_offset)

	return text, did_blur
end

FatUI.draw_simple_checkbox = function (idx, label, value, pos, width)
	local pos, size = FatUI.handle_simple_layout(pos, width)
	local data, value = FatUI.use_behaviour(idx, "behaviour_checkbox", value, pos, size)
	local checkbox_color = (value and tab2CC(_simple_color_primary)) or Color(64, 64, 64)
	local label_offset = V3(_simple_rect_radius * 5 + 0.5 * _simple_font_size, 0, 1)

	FatUI.draw_simple_widget_background(data.state, pos, size)
	FatUI.draw_rect(pos + V3(12, 8, 1), V2(_simple_rect_radius * 5 - 16, size[2] - 16), checkbox_color)
	FatUI.draw_simple_label_multiline(label, FL.WEST, pos + label_offset, size - label_offset)

	return value
end

FatUI.draw_simple_slider = function (idx, value, pos, width)
	local pos, size = FatUI.handle_simple_layout(pos, width)
	local dragger_size = V2(_simple_slider_dragger_width, size[2])
	local dragger_pos = align_box(V2(value, 0), dragger_size, pos, size)
	local data, dragger_pos, drag_end = FatUI.use_behaviour(idx, "behaviour_draggable_seekable", dragger_pos, dragger_size, pos, size)

	FatUI.draw_simple_widget_background(data.state, pos, size)
	FatUI.draw_simple_rounded_rect(_simple_rect_radius, dragger_pos, dragger_size, tab2CC(_simple_color_primary))

	return math.clamp((dragger_pos[1] - pos[1]) / (size[1] - dragger_size[1]), 0, 1), drag_end
end

FatUI.draw_simple_scrollbar = function (idx, value, pos, width)
	local pos, size = FatUI.handle_simple_layout(pos, width)
	local dragger_size = V2(size[1], _simple_slider_dragger_width)
	local dragger_pos = align_box(V2(0, value), dragger_size, pos, size)
	local data, dragger_pos, drag_end = FatUI.use_behaviour(idx, "behaviour_draggable_seekable", dragger_pos, dragger_size, pos, size)

	FatUI.draw_simple_widget_background(data.state, pos, size)
	FatUI.draw_simple_rounded_rect(_simple_rect_radius, dragger_pos, dragger_size, tab2CC(_simple_color_primary))

	return math.clamp((dragger_pos[2] - pos[2]) / (size[2] - dragger_size[2]), 0, 1), drag_end
end

FatUI.draw_simple_stepper = function (idx, i, options, pos, width)
	local pos, size = FatUI.handle_simple_layout(pos, width)

	FatUI.begin_group(idx)

	local but_size = V2(_simple_rect_radius * 4, _simple_height)

	FatUI.draw_simple_widget_background("default", pos, size)

	if FatUI.draw_simple_button("stepper_r", "<", FL.align_box(FL.WEST, but_size, pos, size), but_size[1]) then
		if i > 1 then
			i = i - 1
		else
			i = #options
		end
	end

	if FatUI.draw_simple_button("stepper_l", ">", FL.align_box(FL.EAST, but_size, pos, size), but_size[1]) then
		if i < #options then
			i = i + 1
		else
			i = 1
		end
	end

	FatUI.draw_simple_label_multiline(options[i] or "<invalid>", FL.CENTER, pos + V3(0, 0, 1), size)
	FatUI.close_group()

	return i
end

local function SIMPLE_WINDOW_init_layout(pos)
	return {
		pos0 = Vector3Box(pos),
		pos = Vector3Box()
	}
end

FatUI.begin_simple_window = function (idx, label, pos)
	FatUI.begin_group(idx)

	local data = FatUI.use_data("FatUI.begin_simple_window", pos, SIMPLE_WINDOW_init_layout)

	data.pos:store(data.pos0:unbox())

	data.label = label
	data.items = 0
end

FatUI.close_simple_window = function ()
	local data = FatUI.get_data("FatUI.begin_simple_window")
	local pos = data.pos:unbox()
	local pos0 = data.pos0:unbox()
	local head_pos, head_size = FL.apply_margins(V2(-20, 0), pos0, V2(_simple_width, _simple_height))

	FatUI.draw_simple_title_bar(data.label, head_pos, head_size, tab2CC(_simple_color_primary))

	local head_data, head_pos_new = FatUI.use_behaviour("FatUI.begin_simple_window_TITLE_BAR", "behaviour_draggable", head_pos, head_size, -FatUI.offset - FatUI.screen_size, 3 * FatUI.screen_size)
	local bg_pos, bg_size = FL.apply_margins(V2(-20, -20), pos, V2(_simple_width, data.pos0[2] - pos[2]))

	FatUI.draw_simple_rounded_rect(_simple_rect_radius, bg_pos + V3(0, 0, -1), bg_size, Color(245, 32, 32, 32))

	if head_data.state == "hot" then
		FatUI.draw_simple_rounded_rect(_simple_rect_radius, bg_pos + V3(10, -10, -2), bg_size, Color(200, 0, 0, 0))
	end

	data.pos0:store(head_pos_new + V2(20, 0))
	FatUI.close_group()
end

return
