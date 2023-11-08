ImguiFlamegraph = class(ImguiFlamegraph)
local Gui_rect = Gui.rect
local Gui_text = Gui.text
local V2 = Vector2
local V3 = Vector3
local Color = Color
local Mouse = Mouse
local profile = require("jit.profile")
local dumpstack = profile.dumpstack
local gmatch = string.gmatch
local find = string.find
local byte = string.byte
local sub = string.sub
local floor = math.floor
local point_is_inside_2d_box = math.point_is_inside_2d_box
local hsl2rgb = Colors.hsl2rgb
local tonumber = tonumber
local pairs = pairs
local make_hash = Application.make_hash
local DONT_PROFILE = false

ImguiFlamegraph.init = function (self)
	self._recording = false
	self._rendering = false
	self._invert = false
	self._search = ""

	self:clear_data()
	self:reset_zoom()
end

ImguiFlamegraph.do_cell = function (self, gui, cursor, name, record, s, w, h, x, y)
	local color = Color(hsl2rgb(tonumber(sub(make_hash(name), 1, 2), 16) / 256, 0.4, 0.5))
	local search = self._search
	local border_color = search ~= "" and find(name, search) and Color(255, 255, 255) or Color(64, 64, 64)
	local box_pos = V3(x, y, 999)
	local box_size = V2(w, math.max(2, h))

	Gui_rect(gui, box_pos, box_size, border_color)
	Gui_rect(gui, box_pos + V3(1, 1, 1), box_size - V2(2, 2), color)

	local wf = w / s
	local cx = x
	local cy = y - h
	local selected = point_is_inside_2d_box(cursor, box_pos, box_size)

	if selected and Mouse.pressed(Mouse.button_id("left")) then
		self._draw_name = name
		self._draw_node = record
	end

	for name, child in pairs(record) do
		if name then
			local cs = child[false]
			local cw = wf * cs
			selected = self:do_cell(gui, cursor, name, child, cs, cw, h, cx, cy) or selected
			cx = cx + cw
		end
	end

	if selected then
		Gui_text(gui, name .. " (" .. s .. ")", "materials/fonts/arial", h, nil, V3(x, y + 3, 1000))

		return true
	end
end

ImguiFlamegraph.update = function (self)
	if self._rendering then
		DONT_PROFILE = true

		if Mouse.pressed(Mouse.button_id("right")) then
			self:reset_zoom()
		end

		local draw = self._draw_node
		local samples = draw[false]

		if samples > 0 then
			local w, h = Gui.resolution()
			local gui = Debug.gui
			local cursor = Mouse.axis(Mouse.axis_id("cursor"))

			self:do_cell(gui, cursor, self._draw_name, draw, samples, w - 50, 12, 25, h - 50)
		end

		DONT_PROFILE = false
	end
end

ImguiFlamegraph.is_persistent = function (self)
	return false
end

ImguiFlamegraph.clear_data = function (self)
	ImguiFlamegraph._root = {
		[false] = 0
	}

	self:reset_zoom()
end

ImguiFlamegraph.reset_zoom = function (self)
	self._draw_name = "@root"
	self._draw_node = ImguiFlamegraph._root
end

ImguiFlamegraph.profile_cb = function (self, thread, samples, vmmode)
	if DONT_PROFILE then
		return
	end

	local depth = self._invert and 100 or -100
	local stk = dumpstack(thread, "pFZ;", depth)

	if find(stk, "^scripts/boot.lua:%d+$") then
		return
	end

	local record = ImguiFlamegraph._root
	record[false] = record[false] + samples

	for row in gmatch(stk, "[^;]+") do
		local child = record[row]

		if child then
			child[false] = child[false] + samples
		else
			child = {
				[false] = samples
			}
			record[row] = child
		end

		record = child
	end
end

ImguiFlamegraph.toggle_recording = function (self, bool)
	if bool == nil then
		bool = not self._recording
	end

	if self._recording ~= bool then
		if bool then
			profile.start("fi33", callback(self, "profile_cb"))
		else
			profile.stop()
		end

		self._recording = bool
	end
end

ImguiFlamegraph.toggle_rendering = function (self, bool)
	if bool == nil then
		bool = not self._rendering
	end

	self._rendering = bool
end

local HELP_TEXT = [[
Flamegraph help
---------------
Uses LuaJIT's in-built statistical profiler.
It needs to run for a while to capture nested calls.
Flamegraph rendering is excluded from samples.
It's still recommendable to disable it while recording.

Left-click on a segment to focus on it.
Right-click anywhere to reset the view.
]]

ImguiFlamegraph.draw = function (self)
	local do_close = Imgui.begin_window("Flamegraph")
	local recording = Imgui.checkbox("Recording", self._recording)

	if recording ~= self._recording then
		self:toggle_recording(recording)
	end

	local rendering = Imgui.checkbox("Draw flamegraph", self._rendering)

	if rendering ~= self._rendering then
		self:toggle_rendering(rendering)
	end

	local invert = Imgui.checkbox("Invert", self._invert)

	if not recording and not next(ImguiFlamegraph._root, false) then
		self._invert = invert
	end

	Imgui.text("Total samples: " .. tostring(self._root[false]))

	if Imgui.button("Reset") then
		self:clear_data()
	end

	self._search = Imgui.input_text("Search", self._search)

	Imgui.dummy(1, 20)
	Imgui.text(HELP_TEXT)
	Imgui.end_window()

	return do_close
end
