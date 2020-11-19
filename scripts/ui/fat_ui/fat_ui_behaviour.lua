FatUI = FatUI or {}
local FatUI = FatUI

FatUI.behaviour_button = function (data, pos, size)
	data = data or {
		state = "default"
	}
	local is_clicked = false
	local state = data.state

	if state == "default" then
		if FatUI.mouse_is_inside(pos, size) then
			data.state = "hover"
		end
	elseif state == "hover" then
		if not FatUI.mouse_is_inside(pos, size) then
			data.state = "default"
		elseif FatUI.mouse_is_pressed("left") then
			data.state = "hot"
		end
	elseif state == "hot" then
		if FatUI.mouse_is_released("left") then
			data.state = "hover"
			is_clicked = true
		elseif not FatUI.mouse_is_inside(pos, size) then
			data.state = "warm"
		end
	elseif state == "warm" then
		if FatUI.mouse_is_inside(pos, size) then
			data.state = "hot"
		elseif FatUI.mouse_is_released("left") then
			data.state = "default"
		end
	end

	return data, is_clicked
end

local function TEXT_INPUT_handle_move(data, offset, mod_shift)
	if not mod_shift then
		data.selection = nil
	elseif not data.selection then
		data.selection = data.caret
	end

	data.caret = math.clamp(data.caret + offset, 0, #data)
end

local function TEXT_INPUT_delete_selection(data)
	if data.selection then
		local a = data.caret
		local b = data.selection

		if b < a then
			b = a
			a = b
		end

		local d = b - a

		for i = a + 1, #data, 1 do
			data[i] = data[i + d]
		end

		data.caret = a
	end

	data.caret = math.clamp(data.caret, 0, #data)
	data.selection = nil
end

FatUI.behaviour_text_input = function (data, text, pos, size, max_length)
	data = data or {
		caret = 0,
		state = "default",
		last_stroke = -math.huge
	}
	local state = data.state
	local did_blur = false

	if state == "default" then
		if FatUI.mouse_is_inside(pos, size) then
			data.state = "hover"
		end
	elseif state == "hover" then
		if not FatUI.mouse_is_inside(pos, size) then
			data.state = "default"
		elseif FatUI.mouse_is_pressed("left") then
			data.state = "hot"
			data.last_stroke = FatUI.t
			data.caret = #text
		end
	elseif state == "hot" then
		if FatUI.mouse_is_pressed("left") and not FatUI.mouse_is_inside(pos, size) then
			did_blur = true
			data.state = "default"
		end

		local keystrokes = FatUI.keyboard_keystrokes()
		local n = #keystrokes

		if n > 0 then
			data.last_stroke = FatUI.t

			if text ~= data.text then
				for i = 1, #text, 1 do
					data[i] = string.sub(text, i, i)
				end

				for i = #text + 1, #data, 1 do
					data[i] = nil
				end

				if data.caret > #text then
					data.caret = #text
				end
			end

			local mod_ctrl = FatUI.keyboard_is_down("left ctrl") or FatUI.keyboard_is_down("right ctrl")
			local mod_shift = FatUI.keyboard_is_down("left shift") or FatUI.keyboard_is_down("right shift")

			for i = 1, n, 1 do
				local stroke = keystrokes[i]

				if type(stroke) == "string" then
					if not max_length or max_length > #data or (data.selection and data.selection ~= data.caret) then
						TEXT_INPUT_delete_selection(data)

						data.caret = data.caret + 1

						table.insert(data, data.caret, stroke)
					end
				elseif mod_ctrl then
					if stroke == Keyboard.LEFT then
						data.selection = 0
						data.caret = #data
					elseif stroke == Keyboard.F11 then
						TEXT_INPUT_delete_selection(data)
					elseif stroke == Keyboard.UP then
					elseif stroke == Keyboard.F9 then
						TEXT_INPUT_delete_selection(data)
					end
				elseif stroke == Keyboard.BACKSPACE then
					if data.selection and data.caret ~= data.selection then
						TEXT_INPUT_delete_selection(data)
					elseif data.caret > 0 then
						table.remove(data, data.caret)

						data.caret = math.max(data.caret - 1, 0)
						data.selection = nil
					end
				elseif stroke == Keyboard.DELETE then
					if data.selection and data.caret ~= data.selection then
						TEXT_INPUT_delete_selection(data)
					else
						table.remove(data, data.caret + 1)

						data.selection = nil
					end
				elseif stroke == Keyboard.ENTER then
					did_blur = true
				elseif stroke == Keyboard.ESCAPE then
					did_blur = true
				elseif stroke == Keyboard.LEFT then
					TEXT_INPUT_handle_move(data, -1, mod_shift)
				elseif stroke == Keyboard.RIGHT then
					TEXT_INPUT_handle_move(data, 1, mod_shift)
				elseif stroke == Keyboard.UP or stroke == Keyboard.HOME then
					TEXT_INPUT_handle_move(data, -9e+99, mod_shift)
				elseif stroke == Keyboard.DOWN or stroke == Keyboard.END then
					TEXT_INPUT_handle_move(data, 9e+99, mod_shift)
				end
			end

			text = table.concat(data)
			data.text = text
		end
	end

	if did_blur then
		data.state = "default"
		data.selection = nil
	end

	return data, text, did_blur
end

FatUI.behaviour_checkbox = function (data, value, pos, size)
	local data, is_clicked = FatUI.behaviour_button(data, pos, size)

	if is_clicked then
		value = not value
	end

	return data, not not value
end

FatUI.behaviour_draggable = function (data, sub_pos, sub_size, pos, size)
	data = data or {
		state = "default"
	}
	local drag_ended = false
	local state = data.state

	if state == "default" then
		if FatUI.mouse_is_inside(sub_pos, sub_size) then
			data.state = "hover"
		end
	elseif state == "hover" then
		if not FatUI.mouse_is_inside(sub_pos, sub_size) then
			data.state = "default"
		elseif FatUI.mouse_is_pressed("left") then
			data.state = "hot"
			data.drag_offset_x = FatUI.mouse_cursor[1] - sub_pos[1]
			data.drag_offset_y = FatUI.mouse_cursor[2] - sub_pos[2]
		end
	elseif state == "hot" then
		if FatUI.mouse_is_released("left") then
			drag_ended = true
			data.state = "hover"
		end

		sub_pos[1] = math.clamp(FatUI.mouse_cursor[1] - data.drag_offset_x, pos[1], (pos[1] + size[1]) - sub_size[1])
		sub_pos[2] = math.clamp(FatUI.mouse_cursor[2] - data.drag_offset_y, pos[2], (pos[2] + size[2]) - sub_size[2])
	end

	return data, sub_pos, drag_ended
end

FatUI.behaviour_draggable_seekable = function (data, sub_pos, sub_size, pos, size)
	local data, sub_pos, drag_ended = FatUI.behaviour_draggable(data, sub_pos, sub_size, pos, size)

	if data.state == "default" and FatUI.mouse_is_pressed("left") and FatUI.mouse_is_inside(pos, size) then
		data.drag_offset_x = 0.5 * sub_size[1]
		data.drag_offset_y = 0.5 * sub_size[2]
		data.state = "hot"
	end

	return data, sub_pos, drag_ended
end

return
