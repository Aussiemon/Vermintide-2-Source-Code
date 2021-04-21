-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
FatUI = FatUI or {}
local FatUI = FatUI

require("scripts/ui/fat_ui/fat_ui_layout")
require("scripts/ui/fat_ui/fat_ui_vector")
require("scripts/ui/fat_ui/fat_ui_behaviour")
require("scripts/ui/fat_ui/fat_ui_mockup")
require("scripts/ui/fat_ui/fat_ui_honduras")

local math = math
local string = string
local table = table
local Gui = Gui
local V2 = Vector2
local V3 = Vector3
local V3Box = Vector3Box
local CC = Color
local FatUILayout = FatUILayout
local tab2V2 = FatUI.tab2V2
local tab2V3 = FatUI.tab2V3
local tab2CC = FatUI.tab2CC

FatUI.debug_hook = function (key, func)
	local orig = FatUI[key]

	if not orig then
		error(string.format("debug_hook: Hooking into an undefined function: %s", key), 2)
	end

	FatUI[key] = function (...)
		return func(orig, ...)
	end
end

FatUI._INTERNAL_reset_data_tree = function ()
	local root = {}
	FatUI.data_node = root
	FatUI.data_parent = setmetatable({
		[root] = false
	}, {
		__mode = "kv"
	})
	FatUI.data_root = root
end

if not FatUI.data_root then
	FatUI._INTERNAL_reset_data_tree()
end

local function ID(x)
	return x
end

local function TNEW()
	return {}
end

FatUI.use_data = function (idx, default, factory)
	local val = FatUI.data_node[idx]

	if val then
		return val
	end

	val = 
	-- Decompilation error in this vicinity:
	factory or (default and ID) or TNEW(default)
	FatUI.data_node[idx] = val

	return val, true
end

FatUI.get_data = function (idx)
	return FatUI.data_node[idx]
end

FatUI.set_data = function (idx, value)
	FatUI.data_node[idx] = value
end

FatUI.get_data_absolute = function (idx, ...)
	local node = FatUI.data_root

	for i = 1, select("#", ...), 1 do
		node = node[select(i, ...)]

		if node == nil then
			return nil
		end
	end

	return mod
end

FatUI.begin_group = function (idx)
	local val = FatUI.data_node[idx]

	if not val then
		val = {}
		FatUI.data_parent[val] = FatUI.data_node
		FatUI.data_node[idx] = val
	end

	FatUI.data_node = val

	return val
end

FatUI.close_group = function ()
	local parent = FatUI.data_parent[FatUI.data_node]

	assert(parent, "group_close: No group was currently open")

	FatUI.data_node = parent
end

local function USE_BEHAVIOUR_continuation(tab, key, new_value, ...)
	tab[key] = new_value

	return new_value, ...
end

FatUI.use_behaviour = function (idx, behaviour, ...)
	local data_node = FatUI.data_node

	return USE_BEHAVIOUR_continuation(data_node, idx, FatUI[behaviour](data_node[idx], ...))
end

FatUI.finalizer_flag = false
FatUI.finalizers = FatUI.finalizers or {}

FatUI.register_finalizer = function (thunk)
	FatUI.finalizers[thunk] = FatUI.finalizer_flag
end

FatUI.unregister_finalizer = function (thunk)
	FatUI.finalizers[thunk] = nil
end

FatUI.run_finalizers = function ()
	local current_flag = FatUI.finalizer_flag

	for thunk, flag in pairs(FatUI.finalizers) do
		if flag ~= current_flag then
			FatUI.finalizers[thunk] = nil

			thunk()
		end
	end

	FatUI.finalizer_flag = not current_flag
end

FatUI.t = FatUI.t or 0

FatUI.begin_frame = function (gui, wwise_world, dt, t)
	FatUI.gui = gui
	FatUI.wwise_world = wwise_world
	local w, h = Gui.resolution()
	local canvas = V2(1920, 1080)
	local scale = math.min(w / canvas[1], h / canvas[2])
	local offset = V2(0.5 * (w - canvas[1] * scale), 0.5 * (h - canvas[2] * scale))
	FatUI.resolution = V2(w, h)
	FatUI.canvas = canvas
	FatUI.scale = scale
	FatUI.offset = offset
	FatUI.screen_pos = -offset / scale
	FatUI.screen_size = V2(w / scale, h / scale)

	if IS_WINDOWS or GameSettingsDevelopment.allow_keyboard_mouse then
		FatUI.mouse_cursor = (Mouse.axis(Mouse.axis_id("cursor")) - offset) / scale
	end

	FatUI.input_service = FatUI.get_input_service()
	local gamepad_type = nil

	if Managers.input:is_device_active("gamepad") then
		local platform = PLATFORM

		if IS_WINDOWS then
			if UISettings.use_ps4_input_icons then
				gamepad_type = "win32_ps4"
			else
				gamepad_type = "xb1"
			end
		else
			gamepad_type = platform
		end
	end

	FatUI.gamepad_type = gamepad_type
	FatUI.dt = dt
	FatUI.t = FatUI.t + dt
end

FatUI.close_frame = function ()
	FatUI.run_finalizers()

	FatUI.gui = nil
	FatUI.wwise_world = nil
	FatUI.mouse_cursor = nil
	FatUI.keystrokes = nil
	FatUI.input_service = nil
end

FatUI.get_keystrokes = function ()
	local keystrokes = FatUI.keystrokes

	if keystrokes then
		return keystrokes
	end

	keystrokes = Keyboard.keystrokes()
	FatUI.keystrokes = keystrokes

	return keystrokes
end

FatUI.get_input_service = function ()
	local input_manager = Managers.input
	local input_service = input_manager:get_service("FatUI")

	if input_service and input_service ~= FAKE_INPUT_SERVICE then
		return input_service
	end

	input_manager:create_input_service("FatUI", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service("FatUI", "keyboard")
	input_manager:map_device_to_service("FatUI", "mouse")
	input_manager:map_device_to_service("FatUI", "gamepad")

	return input_manager:get_service("FatUI")
end

local Keyboard = Keyboard
FatUI.keyboard_button_cache = setmetatable({}, {
	__index = function (self, name)
		local id = Keyboard.button_id(name)
		self[name] = id

		return id
	end
})
local keyboard_button_cache = FatUI.keyboard_button_cache

FatUI.keyboard_keystrokes = function ()
	return FatUI.keystrokes
end

FatUI.keyboard_is_down = function (button_name)
	return Keyboard.button(keyboard_button_cache[button_name]) > 0.5
end

FatUI.keyboard_is_pressed = function (button_name)
	return Keyboard.pressed(keyboard_button_cache[button_name])
end

FatUI.keyboard_is_released = function (button_name)
	return Keyboard.released(keyboard_button_cache[button_name])
end

local Mouse = Mouse
FatUI.mouse_button_cache = setmetatable({}, {
	__index = function (self, name)
		local id = Mouse.button_id(name) or Mouse.axis_id(id)
		self[name] = id

		return id
	end
})
local mouse_button_cache = FatUI.mouse_button_cache

FatUI.mouse_is_inside = function (pos, size)
	local cursor = FatUI.mouse_cursor
	local dx = cursor[1] - pos[1]
	local dy = cursor[2] - pos[2]

	return dx >= 0 and dx <= size[1] and dy >= 0 and dy <= size[2]
end

FatUI.mouse_wheel = function ()
	return Mouse.axis(mouse_button_cache.wheel)
end

FatUI.mouse_is_down = function (button_name)
	return Mouse.button(mouse_button_cache[button_name]) > 0.5
end

FatUI.mouse_is_pressed = function (button_name)
	return Mouse.pressed(mouse_button_cache[button_name])
end

FatUI.mouse_is_released = function (button_name)
	return Mouse.released(mouse_button_cache[button_name])
end

local Pad1 = Pad1
FatUI.mouse_button_cache = setmetatable({}, {
	__index = function (self, name)
		local id = Pad1.button_id(name) or Pad1.axis_id(id)
		self[name] = id

		return id
	end
})
local gamepad_button_cache = FatUI.gamepad_button_cache

FatUI.gamepad_axis = function (axis_name)
	return Pad1.axis(gamepad_button_cache[axis_name])
end

FatUI.gamepad_is_down = function (button_name, threshold)
	return Pad1.button(gamepad_button_cache[button_name]) > (threshold or 0.5)
end

FatUI.gamepad_is_pressed = function (button_name)
	return Pad1.pressed(gamepad_button_cache[button_name])
end

FatUI.gamepad_is_released = function (button_name)
	return Pad1.released(gamepad_button_cache[button_name])
end

FatUI.gamepad_input_texture_data = function (button_name)
	local gamepad_type = FatUI.gamepad_type

	if gamepad_type then
		return UISettings.gamepad_button_texture_data[gamepad_type][button_name]
	end
end

FatUI.play_sound = function (wwise_event_name)
	return WwiseWorld.trigger_event(FatUI.wwise_world, wwise_event_name)
end

local function S2C_pos(pos)
	return FatUILayout.apply_transform(FatUI.offset, FatUI.scale, pos)
end

local function S2C_size(size)
	return FatUI.scale * size
end

local function S2C_font(font_size)
	return math.max(4, FatUI.scale * font_size)
end

local Gui_rect = Gui.rect
local Gui_text = Gui.text
local Gui_bitmap = Gui.bitmap
local Gui_bitmap_uv = Gui.bitmap_uv

FatUI.draw_rect = function (pos, size, color)
	return Gui_rect(FatUI.gui, S2C_pos(pos), S2C_size(size), color)
end

FatUI.draw_bitmap = function (material, pos, size, color)
	return Gui_bitmap(FatUI.gui, material, S2C_pos(pos), S2C_size(size), color)
end

FatUI.draw_bitmap_uv = function (material, uv00, uv11, pos, size, color)
	return Gui_bitmap_uv(FatUI.gui, material, uv00, uv11, S2C_pos(pos), S2C_size(size), color)
end

FatUI.draw_text = function (text, font, font_size, pos, color)
	return Gui_text(FatUI.gui, text, font, S2C_font(font_size), nil, S2C_pos(pos), color, "shadow", CC(127, 0, 0, 0))
end

local Gui_word_wrap = Gui.word_wrap
local Gui_text_extents = Gui.text_extents

FatUI.calc_word_wrap = function (text, font, font_size, width)
	return Gui_word_wrap(FatUI.gui, text, font, font_size, width, " \u3002\uff0c", " -+&/*", "\n", true)
end

FatUI.calc_text_extents = function (text, font, font_size)
	return Gui_text_extents(FatUI.gui, text, font, font_size)
end

FatUI.calc_text_extents_size = function (text, font, font_size)
	local min, max = Gui_text_extents(FatUI.gui, text, font, font_size)
	max.x = max.x - min.x
	max.y = max.y - min.y
	max.z = 0
	min.z = 0

	return max, min
end

FatUI.calc_text_extents_caret = function (text, font, font_size)
	local _, _, caret = Gui_text_extents(FatUI.gui, text, font, font_size)

	return caret
end

FatUI.calc_text_size = function (text, font, font_size, width)
	local line_data = FatUI.calc_word_wrap(text, font, font_size, width)
	local n = #line_data
	local text_size = V2(0, 0)
	local calc_text_extents_size = FatUI.calc_text_extents_size
	local line_height = FatUI.calc_font_line_height(font, font_size)

	for i = 1, n, 1 do
		local line = line_data[i]
		local line_size = calc_text_extents_size(line, font, font_size)
		line_data[n + i] = line_size
		text_size[1] = math.max(text_size[1], line_size[1])
		text_size[2] = text_size[2] + line_height
	end

	return line_data, n, text_size
end

FatUI.calc_font_line_height = function (font, font_size)
	return font_size * 1.1
end

local cache = {}
local make_hash = Application.make_hash

FatUI.draw_text_multiline = function (text, font, font_size, align, pos, size, color)
	local hash = make_hash(text, font, font_size, align[1], align[2], size[1], size[2])
	local data = cache[hash]

	if data then
		local draw_text = FatUI.draw_text

		for i = 1, data[0], 2 do
			local data_pos = data[1 + i]

			draw_text(data[i], font, font_size, V3(pos[1] + data_pos[1], pos[2] + data_pos[2], pos[3]), color)
		end

		return hash
	end

	local line_data, n, text_size = FatUI.calc_text_size(text, font, font_size, size[1])
	local cursor = FatUILayout.align_box(align, text_size, V3(0, 0, 0), size)
	local cursor_x = cursor[1]
	local cursor_y = cursor[2] + 0.15 * font_size
	local align_x = align[1]
	local text_size_x = text_size[1]
	local line_height = FatUI.calc_font_line_height(font, font_size)
	data = {
		[0] = 2 * n
	}

	for i = 1, n, 1 do
		local line_size = line_data[n + i]
		data[2 * i - 1] = line_data[i]
		data[2 * i] = {
			cursor_x + align_x * (text_size_x - line_size[1]),
			cursor_y + (n - i) * line_height
		}
	end

	cache[hash] = data

	return FatUI.draw_text_multiline(text, font, font_size, align, pos, size, color)
end

FatUI.draw_text_multiline_color = function (text, font, font_size, align, pos, size, ...)
	local line_data, n, text_size = FatUI.compute_text_sizes(text, font, font_size, size.x)
	local cursor = FatUILayout.align_box(align, text_size, pos, size)
	local current_pos = 1
	local style_index = 1
	local color = nil

	for i = 1, n, 1 do
		local line = line_data[i]
		local ox = cursor[1]
		local oy = cursor[2] - line_height * i

		repeat
			local next_pos, next_col = nil

			while true do
				next_pos, next_col = select(style_index, ...)
				next_pos = next_pos or math.huge

				if next_pos <= current_pos then
					color = next_col
					style_index = style_index + 2
				else
					break
				end
			end

			local len = math.min(next_pos - current_pos, #line)
			local prefix = string.sub(line, 1, len)
			local span = FatUI.calc_text_extents_caret(prefix, font, font_size)

			FatUI.draw_text(prefix, font, font_size, V3(ox, oy, pos.z), color)

			current_pos = current_pos + len
			line = string.sub(line, len + 1)
			ox = ox + span.x
		until line == ""
	end

	return n
end

return
