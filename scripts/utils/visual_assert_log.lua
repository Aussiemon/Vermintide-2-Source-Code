script_data.visual_assert_log_enabled = script_data.visual_assert_log_enabled or Development.parameter("visual_assert_log_enabled")
VisualAssertLog = VisualAssertLog or {}

VisualAssertLog.setup = function (world)
	local VAL = VisualAssertLog
	VAL.world = world
	VAL.console_page_up_key = Keyboard.button_index("page up")
	VAL.console_page_down_key = Keyboard.button_index("page down")
	VAL.console_end_key = Keyboard.button_index("insert")

	if world then
		VAL.gui = World.create_screen_gui(world, "material", "materials/fonts/gw_fonts", "immediate")
	end

	VAL.asserts = VisualAssertLog.asserts or {}
	VAL.n_asserts = VisualAssertLog.n_asserts or 0
	VAL.current_visualized_assert = 1
	VAL.display_asserts = false
end

VisualAssertLog.cleanup = function ()
	local VAL = VisualAssertLog

	if VisualAssertLog.world and VisualAssertLog.gui then
		World.destroy_gui(VisualAssertLog.world, VisualAssertLog.gui)

		VisualAssertLog.world = nil
		VisualAssertLog.gui = nil
	end
end

local font_size = 16
local font = "arial"
local font_mtrl = "materials/fonts/" .. font

VisualAssertLog.update = function ()
	if not script_data.visual_assert_log_enabled then
		return
	end

	if VisualAssertLog.n_asserts > 0 then
		local gui = VisualAssertLog.gui
		local screen_width = RESOLUTION_LOOKUP.res_w
		local screen_height = RESOLUTION_LOOKUP.res_h
		local text_color = Color(255, 204, 0)

		if Keyboard.pressed(VisualAssertLog.console_end_key) then
			VisualAssertLog.display_asserts = not VisualAssertLog.display_asserts
		end

		if VisualAssertLog.display_asserts then
			if DEDICATED_SERVER then
				print("[VisualAssertLog] Dumping VisualAssertLog.asserts")

				for _, assert_data in ipairs(VisualAssertLog.asserts) do
					local assert_message = assert_data.message

					print(assert_message)

					local traceback = assert_data.traceback

					for _, line in ipairs(traceback) do
						print(line)
					end

					print("=========================================================")
				end

				VisualAssertLog.display_asserts = false
			else
				Gui.text(gui, "VAsrt:" .. tostring(VisualAssertLog.n_asserts), font_mtrl, font_size, font, Vector3(screen_width - 50, screen_height - 20, 999), text_color)

				local n_asserts = VisualAssertLog.n_asserts
				local current_visualized_assert = VisualAssertLog.current_visualized_assert

				if Keyboard.pressed(VisualAssertLog.console_page_up_key) then
					current_visualized_assert = current_visualized_assert + 1

					if n_asserts < current_visualized_assert then
						current_visualized_assert = 1
					end
				end

				if Keyboard.pressed(VisualAssertLog.console_page_down_key) then
					current_visualized_assert = current_visualized_assert - 1

					if current_visualized_assert <= 0 then
						current_visualized_assert = n_asserts or current_visualized_assert
					end
				end

				VisualAssertLog.current_visualized_assert = current_visualized_assert
				local assert_data = VisualAssertLog.asserts[current_visualized_assert]
				local y_pos = screen_height - 50 - font_size
				local min, max = Gui.text_extents(gui, tostring(assert_data.message), font_mtrl, font_size)
				local width = max.x - min.x

				Gui.text(gui, tostring(assert_data.message), font_mtrl, font_size, font, Vector3(screen_width / 2 - width / 2, y_pos, 999), text_color)

				for i, text in ipairs(assert_data.traceback) do
					min, max = Gui.text_extents(gui, tostring(text), font_mtrl, font_size)
					width = max.x - min.x

					Gui.text(gui, tostring(text), font_mtrl, font_size, font, Vector3(50, y_pos - i * font_size, 999), text_color)
				end
			end
		end
	end
end

local function fixup_callstack(callstack_table)
	local callstack_size = #callstack_table

	table.remove(callstack_table, (callstack_size + 1) / 2 + 2)
	table.remove(callstack_table, 3)
	table.remove(callstack_table, 2)

	local found_traceback = nil
	local trace_index = 1

	for i, line in ipairs(callstack_table) do
		if found_traceback then
			if string.find(line, "^local_variables%:$") then
				trace_index = 1
			else
				local pre_str = string.gsub(line, "^[ ]*%[(%d+)%] ([a-zA-Z0-9 :=,./%[%]]+)", "%2")
				callstack_table[i] = string.format("[%d] %s", trace_index, pre_str)
				trace_index = trace_index + 1
			end
		elseif string.find(line, "^stack traceback%:$") then
			found_traceback = true
		end
	end

	return callstack_table
end

function visual_assert(condition, message, ...)
	if not condition then
		local n_asserts = VisualAssertLog.n_asserts + 1

		if n_asserts <= 50 then
			VisualAssertLog.n_asserts = n_asserts
			local assert_data = {
				message = string.format(message, ...),
				traceback = fixup_callstack(string.split(Script.callstack(), "\n"))
			}
			VisualAssertLog.asserts[n_asserts] = assert_data

			if DEDICATED_SERVER then
				message = string.format(message, ...)

				Application.error("Visual Assert: " .. message)
			end
		end
	end

	return condition
end

return
