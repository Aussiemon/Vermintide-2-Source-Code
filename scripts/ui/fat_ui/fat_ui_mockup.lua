local math = math
local string = string
local V2 = Vector2
local V3 = Vector3
local CC = Color
local FatUI = FatUI
local FL = FatUILayout
local align_box = FL.align_box
local _mockup_width = 350
local _mockup_height = 40
local _mockup_circle_texture = "circular_texture"
local _mockup_color_primary = {
	255,
	70,
	130,
	180
}
local _mockup_color_secondary = {
	255,
	178,
	34,
	34
}
local _mockup_rect_radius = 8
local _mockup_font = "materials/fonts/arial"
local _mockup_font_size = 22
local _mockup_slider_dragger_width = 24
local _mockup_layout_margin = 12
local tab2CC = FatUI.tab2CC

FatUI.handle_mockup_layout = function (pos, size)
	if type(size) ~= "userdata" then
		size = Vector2(size or _mockup_width, _mockup_height)
	end

	if pos then
		return pos, size
	end

	local auto_layout_data = FatUI.get_data("FatUI.begin_mockup_window")
	auto_layout_data.pos[2] = auto_layout_data.pos[2] - size[2] - _mockup_layout_margin
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

FatUI.draw_mockup_rounded_rect = function (radius, pos, size, color)
	local radius_size = V2(radius, radius)
	local sx = V2(size[1] - 2 * radius, size[2])
	local sy = V2(radius, size[2] - 2 * radius)

	FatUI.draw_rect(align_box(FL.CENTER, sx, pos, size), sx, color)
	FatUI.draw_rect(align_box(FL.WEST, sy, pos, size), sy, color)
	FatUI.draw_rect(align_box(FL.EAST, sy, pos, size), sy, color)
	FatUI.draw_bitmap_uv(_mockup_circle_texture, c00:unbox(), c55:unbox(), align_box(FL.NORTH_WEST, radius_size, pos, size), radius_size, color)
	FatUI.draw_bitmap_uv(_mockup_circle_texture, c50:unbox(), c15:unbox(), align_box(FL.NORTH_EAST, radius_size, pos, size), radius_size, color)
	FatUI.draw_bitmap_uv(_mockup_circle_texture, c55:unbox(), c11:unbox(), align_box(FL.SOUTH_EAST, radius_size, pos, size), radius_size, color)
	FatUI.draw_bitmap_uv(_mockup_circle_texture, c05:unbox(), c51:unbox(), pos, radius_size, color)
end

FatUI.draw_mockup_text_multiline = function (text, align, pos, size)
	FatUI.draw_text_multiline(text, _mockup_font, _mockup_font_size, align, pos, size)
end

FatUI.draw_mockup_label = function (text, pos, width)
	local pos, size = FatUI.handle_mockup_layout(pos, width)

	FatUI.draw_mockup_text_multiline(text, FL.WEST, pos, size)
end

FatUI.draw_mockup_title_bar = function (label, pos, size, color)
	local radius = _mockup_rect_radius
	local radius_size = V2(radius, radius)

	FatUI.draw_rect(pos, size - V2(0, radius), color)
	FatUI.draw_rect(pos + V2(radius, size[2] - radius), V2(size[1] - 2 * radius, radius), color)
	FatUI.draw_bitmap_uv(_mockup_circle_texture, c00:unbox(), c55:unbox(), align_box(FL.NORTH_WEST, radius_size, pos, size), radius_size, color)
	FatUI.draw_bitmap_uv(_mockup_circle_texture, c50:unbox(), c15:unbox(), align_box(FL.NORTH_EAST, radius_size, pos, size), radius_size, color)
	FatUI.draw_mockup_text_multiline(label, FL.CENTER, pos + V3(0, 0, 1), size)
end

FatUI.draw_mockup_widget_background = function (state, pos, size)
	local alpha = 0

	if state == "default" then
		alpha = 127
	elseif state == "hover" then
		alpha = 119
	elseif state == "hot" then
		alpha = 135
	end

	if state == "hot" or state == "warm" then
		FatUI.draw_mockup_rounded_rect(_mockup_rect_radius, pos - V2(1, 1), size + V2(2, 2), tab2CC(_mockup_color_secondary, 170))
	end

	FatUI.draw_mockup_rounded_rect(_mockup_rect_radius, pos, size, CC(alpha, 127, 127, 127))
end

local MOCKUP_BUTTON_COLOR_TABLE = {
	0,
	0,
	0,
	0
}

FatUI.draw_mockup_button = function (idx, label, pos, width)
	local pos, size = FatUI.handle_mockup_layout(pos, width)
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

	Colors.lerp_color_tables(_mockup_color_primary, _mockup_color_secondary, t, MOCKUP_BUTTON_COLOR_TABLE)

	MOCKUP_BUTTON_COLOR_TABLE[1] = alpha

	FatUI.draw_mockup_rounded_rect(_mockup_rect_radius, pos, size, tab2CC(MOCKUP_BUTTON_COLOR_TABLE))
	FatUI.draw_mockup_text_multiline(label, FL.CENTER, pos + V3(0, 0, 1), size)

	return is_clicked
end

FatUI.draw_mockup_text_input = function (idx, text, pos, width)
	local pos, size = FatUI.handle_mockup_layout(pos, width, width)
	local data, text, did_blur = FatUI.use_behaviour(idx, "behaviour_text_input", text, pos, size)
	local state = data.state
	local font_size = _mockup_font_size
	local text_offset = V3(font_size, 0, 1)

	FatUI.draw_mockup_widget_background(data.state, pos, size)

	if state == "hot" then
		local dt = FatUI.t - (data.last_stroke + 0.5)
		local caret_alpha = ((dt < 0 or (0.6666666666666666 * dt) % 0.6666666666666666 < 0.3333333333333333) and 1) or 0
		local caret_offset = FatUI.calc_text_extents_caret(string.sub(text, 1, data.caret), _mockup_font, font_size)
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

			local selection_size = FatUI.calc_text_extents_caret(string.sub(text, a + 1, b), _mockup_font, font_size)
			selection_size[1] = selection_size[1] * dir
			selection_size[2] = FatUI.calc_font_line_height(_mockup_font, font_size)

			FatUI.draw_rect(caret_pos, selection_size, CC(127, 127, 127, 255))
		end
	end

	FatUI.draw_text_multiline(text, _mockup_font, font_size, FL.WEST, pos + text_offset + V3(0, 0, 1), size - text_offset)

	return text, did_blur
end

FatUI.draw_mockup_checkbox = function (idx, label, value, pos, width)
	local pos, size = FatUI.handle_mockup_layout(pos, width)
	local data, value = FatUI.use_behaviour(idx, "behaviour_checkbox", value, pos, size)
	local checkbox_color = (value and tab2CC(_mockup_color_primary)) or Color(64, 64, 64)
	local label_offset = V3(_mockup_rect_radius * 5 + 0.5 * _mockup_font_size, 0, 1)

	FatUI.draw_mockup_widget_background(data.state, pos, size)
	FatUI.draw_rect(pos + V3(12, 8, 1), V2(_mockup_rect_radius * 5 - 16, size[2] - 16), checkbox_color)
	FatUI.draw_mockup_text_multiline(label, FL.WEST, pos + label_offset, size - label_offset)

	return value
end

FatUI.draw_mockup_slider = function (idx, value, pos, width)
	local pos, size = FatUI.handle_mockup_layout(pos, width)
	local dragger_size = V2(_mockup_slider_dragger_width, size[2])
	local dragger_pos = align_box(V2(value, 0), dragger_size, pos, size)
	local data, dragger_pos, drag_end = FatUI.use_behaviour(idx, "behaviour_draggable_seekable", dragger_pos, dragger_size, pos, size)

	FatUI.draw_mockup_widget_background(data.state, pos, size)
	FatUI.draw_mockup_rounded_rect(_mockup_rect_radius, dragger_pos, dragger_size, tab2CC(_mockup_color_primary))

	return math.clamp((dragger_pos[1] - pos[1]) / (size[1] - dragger_size[1]), 0, 1), drag_end
end

FatUI.draw_mockup_scrollbar = function (idx, value, pos, width)
	local pos, size = FatUI.handle_mockup_layout(pos, width)
	local dragger_size = V2(size[1], _mockup_slider_dragger_width)
	local dragger_pos = align_box(V2(0, value), dragger_size, pos, size)
	local data, dragger_pos, drag_end = FatUI.use_behaviour(idx, "behaviour_draggable_seekable", dragger_pos, dragger_size, pos, size)

	FatUI.draw_mockup_widget_background(data.state, pos, size)
	FatUI.draw_mockup_rounded_rect(_mockup_rect_radius, dragger_pos, dragger_size, tab2CC(_mockup_color_primary))

	return math.clamp((dragger_pos[2] - pos[2]) / (size[2] - dragger_size[2]), 0, 1), drag_end
end

FatUI.draw_mockup_stepper = function (idx, i, options, pos, width)
	local pos, size = FatUI.handle_mockup_layout(pos, width)

	FatUI.begin_group(idx)

	local but_size = V2(_mockup_rect_radius * 4, _mockup_height)

	FatUI.draw_mockup_widget_background("default", pos, size)

	if FatUI.draw_mockup_button("stepper_r", "<", FL.align_box(FL.WEST, but_size, pos, size), but_size[1]) then
		if i > 1 then
			i = i - 1
		else
			i = #options
		end
	end

	if FatUI.draw_mockup_button("stepper_l", ">", FL.align_box(FL.EAST, but_size, pos, size), but_size[1]) then
		if i < #options then
			i = i + 1
		else
			i = 1
		end
	end

	FatUI.draw_mockup_text_multiline(options[i] or "<invalid>", FL.CENTER, pos + V3(0, 0, 1), size)
	FatUI.close_group()

	return i
end

local function MOMCKUP_WINDOW_init_layout(pos)
	return {
		pos0 = Vector3Box(pos),
		pos = Vector3Box()
	}
end

FatUI.begin_mockup_window = function (idx, label, pos)
	FatUI.begin_group(idx)

	local data = FatUI.use_data("FatUI.begin_mockup_window", pos, MOMCKUP_WINDOW_init_layout)

	data.pos:store(data.pos0:unbox())

	data.label = label
	data.items = 0
end

FatUI.close_mockup_window = function ()
	local data = FatUI.get_data("FatUI.begin_mockup_window")
	local pos = data.pos:unbox()
	local pos0 = data.pos0:unbox()
	local head_pos, head_size = FL.apply_margins(V2(-20, 0), pos0, V2(_mockup_width, _mockup_height))

	FatUI.draw_mockup_title_bar(data.label, head_pos, head_size, tab2CC(_mockup_color_primary))

	local head_data, head_pos_new = FatUI.use_behaviour("FatUI.begin_mockup_window_TITLE_BAR", "behaviour_draggable", head_pos, head_size, -FatUI.offset - FatUI.screen_size, 3 * FatUI.screen_size)
	local bg_pos, bg_size = FL.apply_margins(V2(-20, -20), pos, V2(_mockup_width, data.pos0[2] - pos[2]))

	FatUI.draw_mockup_rounded_rect(_mockup_rect_radius, bg_pos + V3(0, 0, -1), bg_size, Color(245, 32, 32, 32))

	if head_data.state == "hot" then
		FatUI.draw_mockup_rounded_rect(_mockup_rect_radius, bg_pos + V3(10, -10, -2), bg_size, Color(200, 0, 0, 0))
	end

	data.pos0:store(head_pos_new + V2(20, 0))
	FatUI.close_group()
end

local function try_parse_tag(dst, t_name, t_type, t_desc_i)
	if t_type then
		dst[#dst + 1] = {
			name = t_name,
			type = sub(t_type, 2, -2),
			desc = sub(content, t_desc_i)
		}
	end

	return t_type
end

local function init_documentation()
	local match = string.match
	local sub = string.sub
	local index = {}

	for _, filename in ipairs({
		"fat_ui",
		"fat_ui_behaviour",
		"fat_ui_layout"
	}) do
		local state, entry = nil

		for line in io.lines(script_data.source_dir .. "/scripts/ui/fat_ui/" .. filename .. ".lua") do
			local brief_start = match(line, "^%-%-%-%s*()")

			if brief_start then
				state = "capturing"
				entry = {
					desc = "",
					brief = sub(line, brief_start),
					arg = {},
					ret = {}
				}
			elseif state == "capturing" then
				local content_start = match(line, "^%-%-%s*()")

				if content_start then
					local content = sub(line, content_start)

					if not try_parse_tag(entry.arg, match(content, "^%-%-%s*@param%s+([%w_]+)%s+(%b{})%s+()")) and not try_parse_tag(entry.ret, nil, match(content, "^%-%-%s*@returns%s+(%b{})%s+()")) then
						entry.desc = entry.desc .. "\n" .. content
					end
				else
					entry.proto, entry.obj, entry.method = match(line, "^function%s+(([%w_]+)[.:]([%w_]+))")

					assert(entry.proto)

					if entry.desc == "" then
						entry.desc = nil
					end

					index[#index + 1] = entry
					state, entry = nil
				end
			end
		end
	end

	return {
		search = "",
		index = index,
		results = {}
	}
end

local DO_RELOAD = true

FatUI.draw_mockup_documentation = function ()
	if not script_data.source_dir then
		return
	end

	local v = FatUI.begin_group("FatUI.documentation")

	if DO_RELOAD then
		v.self = nil
		DO_RELOAD = false
	end

	local self = FatUI.use_data("self", nil, init_documentation)

	FatUI.begin_mockup_window("main_window", "Documentation", Vector3(800, 500, 900))

	local search = FatUI.draw_mockup_text_input("search_bar", self.search)
	local results = self.results

	if search ~= "" and search ~= self.search then
		table.clear(results)

		for _, entry in ipairs(self.index) do
			if string.find(entry.proto, self.search) then
				results[#results + 1] = entry
			end
		end
	end

	self.search = search

	for i, entry in ipairs(results) do
		FatUI.draw_mockup_label(entry.proto .. " " .. entry.brief:sub(1, 128))
	end

	FatUI.close_mockup_window()
	FatUI.close_group()
end

FatUI.gui7_temperature_converter = function ()
	FatUI.begin_mockup_window("win", "Counter")

	local temp_c = FatUI.use_data("temp_c", 0)
	local temp_c_str = FatUI.use_data("temp_c_str", "")

	FatUI.draw_mockup_label("Celcius")
	FatUI.draw_mockup_label(temp_c)
	FatUI.draw_mockup_label("Farenheit")
	FatUI.draw_mockup_label(i)

	if FatUI.draw_mockup_button("btn", "Count") then
		FatUI.set_data("counter", i + 1)
	end

	FatUI.close_mockup_window("win", "Counter")
end

return
