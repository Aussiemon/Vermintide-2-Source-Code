-- chunkname: @scripts/tests/testify_input.lua

local TestifyInput = {}

TestifyInput.send = function (inputs)
	Testify:make_request_to_runner("inputs", inputs)
end

TestifyInput.send_mouse_click = function (button, position, position_unit, speed, context, num_clicks, duration)
	TestifyInput.send({
		TestifyInput.mouse_click(button, position, position_unit, speed, context, num_clicks, duration),
	})
end

TestifyInput.send_mouse_move = function (position, position_unit, speed, context)
	TestifyInput.send({
		TestifyInput.mouse_move(position, position_unit, speed, context),
	})
end

TestifyInput.send_keyboard_press_key = function (key, duration)
	TestifyInput.send({
		TestifyInput.keyboard_press_key(key, duration),
	})
end

TestifyInput.send_keyboard_hold_key = function (key)
	TestifyInput.send({
		TestifyInput.keyboard_hold_key(key),
	})
end

TestifyInput.send_keyboard_release_key = function (key)
	TestifyInput.send({
		TestifyInput.keyboard_release_key(key),
	})
end

TestifyInput.send_keyboard_write_text = function (text)
	TestifyInput.send({
		TestifyInput.keyboard_write_text(text),
	})
end

TestifyInput.mouse_click = function (button, position, position_unit, speed, context, num_clicks, duration)
	return {
		action = "click",
		type = "mouse",
		button = button,
		position = position,
		position_unit = position_unit,
		speed = speed,
		context = context,
		num_clicks = num_clicks,
		duration = duration,
	}
end

TestifyInput.mouse_move = function (position, position_unit, speed, context)
	return {
		action = "move",
		type = "mouse",
		position = position,
		position_unit = position_unit,
		speed = speed,
		context = context,
	}
end

TestifyInput.keyboard_press_key = function (key, duration)
	return {
		action = "press",
		type = "keyboard",
		key = key,
		duration = duration,
	}
end

TestifyInput.keyboard_hold_key = function (key)
	return {
		action = "hold",
		type = "keyboard",
		key = key,
	}
end

TestifyInput.keyboard_release_key = function (key)
	return {
		action = "release",
		type = "keyboard",
		key = key,
	}
end

TestifyInput.keyboard_write_text = function (text)
	return {
		action = "write_text",
		type = "keyboard",
		text = text,
	}
end

return TestifyInput
