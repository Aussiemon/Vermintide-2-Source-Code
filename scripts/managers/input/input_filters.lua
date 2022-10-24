InputFilters = InputFilters or {}

local function input_threshold(input_axis, threshold)
	local length = Vector3.length(input_axis)

	if length < threshold then
		input_axis.x = 0
		input_axis.y = 0
		input_axis.z = 0
	end
end

InputFilters.virtual_axis = {
	init = function (filter_data)
		return table.clone(filter_data)
	end,
	update = function (filter_data, input_service)
		local input_mappings = filter_data.input_mappings
		local right = input_service:get(input_mappings.right)
		local left = input_service:get(input_mappings.left)
		local forward = input_service:get(input_mappings.forward)
		local back = input_service:get(input_mappings.back)
		local up_key = input_mappings.up
		local up = (up_key and input_service:get(up_key)) or 0
		local down_key = input_mappings.down
		local down = (down_key and input_service:get(down_key)) or 0
		local result = Vector3(right - left, forward - back, up - down)

		return result
	end,
	edit_types = {
		{
			"up",
			"keymap",
			"soft_button",
			"input_mappings"
		},
		{
			"down",
			"keymap",
			"soft_button",
			"input_mappings"
		},
		{
			"left",
			"keymap",
			"soft_button",
			"input_mappings"
		},
		{
			"right",
			"keymap",
			"soft_button",
			"input_mappings"
		},
		{
			"forward",
			"keymap",
			"soft_button",
			"input_mappings"
		},
		{
			"back",
			"keymap",
			"soft_button",
			"input_mappings"
		}
	}
}
InputFilters.scale_vector3 = {
	init = function (filter_data)
		return table.clone(filter_data)
	end,
	update = function (filter_data, input_service)
		local val = input_service:get(filter_data.input_mapping)

		input_threshold(val, filter_data.input_threshold or 0)

		return val * filter_data.multiplier
	end,
	edit_types = {
		{
			"multiplier",
			"number"
		}
	}
}
InputFilters.scale_vector3_xy = {
	init = function (filter_data)
		return table.clone(filter_data)
	end,
	update = function (filter_data, input_service)
		local val = input_service:get(filter_data.input_mapping)

		input_threshold(val, filter_data.input_threshold or 0)

		local x = val.x * filter_data.multiplier_x
		local y = val.y * filter_data.multiplier_y
		local z = val.z

		return Vector3(x, y, z)
	end,
	edit_types = {
		{
			"multiplier_x",
			"number"
		},
		{
			"multiplier_y",
			"number"
		}
	}
}
InputFilters.scale_vector3_xy_accelerated_x = {
	init = function (filter_data)
		local internal_filter_data = table.clone(filter_data)
		internal_filter_data.input_x = 0
		internal_filter_data.input_x_t = 0
		internal_filter_data.input_x_turnaround_t = 0
		internal_filter_data.min_multiplier_x = internal_filter_data.min_multiplier_x or internal_filter_data.multiplier_x * 0.25

		return internal_filter_data
	end,
	update = function (filter_data, input_service)
		local val = input_service:get(filter_data.input_mapping)

		input_threshold(val, filter_data.input_threshold or 0)

		local time = Application.time_since_launch()

		if filter_data.turnaround_threshold and filter_data.turnaround_threshold <= math.abs(val.x) and math.sign(val.x) ~= filter_data.input_x_turnaround then
			filter_data.input_x_turnaround = math.sign(val.x)
			filter_data.input_x_turnaround_t = time
		elseif filter_data.threshold <= math.abs(val.x) and math.sign(val.x) ~= filter_data.input_x then
			filter_data.input_x = math.sign(val.x)
			filter_data.input_x_t = time
		elseif math.abs(val.x) < filter_data.threshold and Vector3.length(val) < filter_data.threshold then
			filter_data.input_x_t = time
		end

		if math.abs(val.x) < 0.1 then
			filter_data.input_x = 0
		end

		if filter_data.turnaround_threshold and math.abs(val.x) < filter_data.turnaround_threshold then
			filter_data.input_x_turnaround = 0
		end

		local x = nil
		local elapsed_time = time - filter_data.input_x_t
		local turnaround_elapsed_time = time - filter_data.input_x_turnaround_t

		if math.abs(val.x) > 0.75 then
			val.y = val.y * (1 - (math.abs(val.x) - 0.75) / 0.25)
		end

		if not Application.user_setting("enable_gamepad_acceleration") then
			x = val.x * filter_data.min_multiplier_x * Managers.time._mean_dt
		elseif filter_data.turnaround_threshold and turnaround_elapsed_time >= filter_data.acceleration_delay + filter_data.turnaround_delay and filter_data.turnaround_threshold <= math.abs(val.x) then
			local value = math.clamp(elapsed_time - (filter_data.acceleration_delay + filter_data.turnaround_delay) / filter_data.turnaround_time_ref, 0, 1)
			x = val.x * math.lerp(filter_data.min_multiplier_x, filter_data.turnaround_multiplier_x, math.pow(value, filter_data.turnaround_power_of)) * Managers.time._mean_dt
		elseif filter_data.acceleration_delay <= elapsed_time then
			local value = math.clamp((elapsed_time - filter_data.acceleration_delay) / filter_data.accelerate_time_ref, 0, 1)
			x = val.x * math.lerp(filter_data.min_multiplier_x, filter_data.multiplier_x, math.pow(value, filter_data.power_of)) * Managers.time._mean_dt
		else
			x = val.x * filter_data.min_multiplier_x * Managers.time._mean_dt
		end

		local multiplier_y = filter_data.multiplier_y

		if val.y ~= 0 and filter_data.multiplier_return_y and filter_data.angle_to_slow_down_inside then
			Profiler.start("InputFilters.scale_vector3_xy_accelerated_x_get_y_component")

			local player = Managers.player:local_player()
			local viewport_name = player.viewport_name
			local world = Managers.world:world("level_world")
			local viewport = ScriptWorld.viewport(world, viewport_name)
			local camera = ScriptViewport.camera(viewport)
			local camera_rotation = ScriptCamera.rotation(camera)
			local camera_forward = Quaternion.forward(camera_rotation)
			local camera_horizon = Vector3.flat(camera_forward)
			local dot = Vector3.dot(camera_forward, camera_horizon)
			local acos = math.acos(math.clamp(dot, -1, 1))
			local atan2 = math.atan2(camera_forward.z - camera_horizon.z, camera_forward.y - camera_horizon.y)
			local above_horizont = atan2 > 0
			local moving_down = val.y < 0
			local moving_towards_horizont = (above_horizont and moving_down) or (not above_horizont and not moving_down)

			if moving_towards_horizont then
				local slow_down_angle = filter_data.angle_to_slow_down_inside
				local lerp_value = math.clamp(acos / slow_down_angle, 0, 1)
				multiplier_y = math.lerp(filter_data.multiplier_y, filter_data.multiplier_return_y, lerp_value)
			end

			Profiler.stop("InputFilters.scale_vector3_xy_accelerated_x_get_y_component")
		end

		local y = val.y * multiplier_y * Managers.time._mean_dt
		local z = val.z

		return Vector3(x, y, z)
	end,
	edit_types = {
		{
			"multiplier_x",
			"number"
		},
		{
			"multiplier_y",
			"number"
		}
	}
}
InputFilters.scale_vector3_xy_accelerated_x_inverted = {
	init = function (filter_data)
		local internal_filter_data = table.clone(filter_data)
		internal_filter_data.input_x = 0
		internal_filter_data.input_x_t = 0
		internal_filter_data.min_multiplier_x = internal_filter_data.min_multiplier_x or internal_filter_data.multiplier_x * 0.25
		internal_filter_data.input_x_turnaround_t = 0

		return internal_filter_data
	end,
	update = function (filter_data, input_service)
		local val = input_service:get(filter_data.input_mapping)

		input_threshold(val, filter_data.input_threshold or 0)

		local time = Application.time_since_launch()

		if filter_data.turnaround_threshold and filter_data.turnaround_threshold <= math.abs(val.x) and math.sign(val.x) ~= filter_data.input_x_turnaround then
			filter_data.input_x_turnaround = math.sign(val.x)
			filter_data.input_x_turnaround_t = time
		elseif filter_data.threshold <= math.abs(val.x) and math.sign(val.x) ~= filter_data.input_x then
			filter_data.input_x = math.sign(val.x)
			filter_data.input_x_t = time
		elseif math.abs(val.x) < filter_data.threshold and Vector3.length(val) < filter_data.threshold then
			filter_data.input_x_t = time
		end

		if math.abs(val.x) < 0.1 then
			filter_data.input_x = 0
		end

		if filter_data.turnaround_threshold and math.abs(val.x) < filter_data.turnaround_threshold then
			filter_data.input_x_turnaround = 0
		end

		local x = nil
		local elapsed_time = time - filter_data.input_x_t
		local turnaround_elapsed_time = time - filter_data.input_x_turnaround_t

		if not Application.user_setting("enable_gamepad_acceleration") then
			x = val.x * filter_data.min_multiplier_x * Managers.time._mean_dt
		elseif filter_data.turnaround_threshold and turnaround_elapsed_time >= filter_data.acceleration_delay + filter_data.turnaround_delay and filter_data.turnaround_threshold <= math.abs(val.x) then
			local value = math.clamp(elapsed_time - (filter_data.acceleration_delay + filter_data.turnaround_delay) / filter_data.turnaround_time_ref, 0, 1)
			x = val.x * math.lerp(filter_data.min_multiplier_x, filter_data.turnaround_multiplier_x, math.pow(value, filter_data.turnaround_power_of)) * Managers.time._mean_dt
		elseif filter_data.acceleration_delay <= elapsed_time then
			local value = math.clamp((elapsed_time - filter_data.acceleration_delay) / filter_data.accelerate_time_ref, 0, 1)
			x = val.x * math.lerp(filter_data.min_multiplier_x, filter_data.multiplier_x, math.pow(value, filter_data.power_of)) * Managers.time._mean_dt
		else
			x = val.x * filter_data.min_multiplier_x * Managers.time._mean_dt
		end

		local y = -val.y * filter_data.multiplier_y * Managers.time._mean_dt
		local z = val.z

		return Vector3(x, y, z)
	end,
	edit_types = {
		{
			"multiplier_x",
			"number"
		},
		{
			"multiplier_y",
			"number"
		}
	}
}
InputFilters.scale_vector3_invert_y = {
	init = function (filter_data)
		return table.clone(filter_data)
	end,
	update = function (filter_data, input_service)
		local val = Vector3(Vector3.to_elements(input_service:get(filter_data.input_mapping)))

		input_threshold(val, filter_data.input_threshold or 0)

		val.y = -val.y

		return val * filter_data.multiplier
	end,
	edit_types = {
		{
			"multiplier",
			"number"
		}
	}
}
InputFilters.gamepad_cursor = {
	init = function (filter_data)
		local internal_filter_data = table.clone(filter_data)
		local res_x = RESOLUTION_LOOKUP.res_w
		local res_y = RESOLUTION_LOOKUP.res_h
		local inv_scale = RESOLUTION_LOOKUP.inv_scale
		res_x = res_x * inv_scale
		res_y = res_y * inv_scale
		internal_filter_data.pos_x = res_x * 0.5
		internal_filter_data.pos_y = res_y * 0.5
		internal_filter_data.frame_index = GLOBAL_FRAME_INDEX
		internal_filter_data.input_x = 0
		internal_filter_data.input_x_t = 0
		internal_filter_data.input_x_turnaround_t = 0
		internal_filter_data.min_multiplier_x = internal_filter_data.min_multiplier_x or internal_filter_data.multiplier_x * 0.25
		internal_filter_data.input_y = 0
		internal_filter_data.input_y_t = 0
		internal_filter_data.input_y_turnaround_t = 0
		internal_filter_data.min_multiplier_y = internal_filter_data.min_multiplier_y or internal_filter_data.multiplier_y * 0.25
		internal_filter_data.hover_multiplier = internal_filter_data.hover_multiplier

		return internal_filter_data
	end,
	update = function (filter_data, input_service)
		if filter_data.frame_index < GLOBAL_FRAME_INDEX and not input_service:is_blocked() then
			local input_manager = Managers.input

			if not input_manager:gamepad_cursor_active() then
				return nil
			end

			local val = Vector3(Vector3.to_elements(input_service:get(filter_data.input_mapping)))

			input_threshold(val, filter_data.input_threshold or 0)

			local mean_dt = Managers.time._mean_dt
			local time = Application.time_since_launch()
			local x, y = nil
			local is_hovering = input_manager:is_hovering()

			if is_hovering then
				x = val.x * filter_data.multiplier_x * mean_dt * filter_data.hover_multiplier
				y = val.y * filter_data.multiplier_y * mean_dt * filter_data.hover_multiplier
				filter_data.input_start_time = nil
			else
				local elapsed_time = 0
				local input_strength = (math.abs(val.x) + math.abs(val.y)) * 0.5

				if input_strength < filter_data.acceleration_threshold then
					filter_data.input_start_time = nil
				elseif filter_data.input_start_time then
					elapsed_time = time - filter_data.input_start_time
				else
					filter_data.input_start_time = time
				end

				local speed_lerp_value = math.clamp((elapsed_time - filter_data.acceleration_delay) / filter_data.accelerate_time_ref, 0, 1)
				local speed_x = math.lerp(filter_data.min_multiplier_x, filter_data.multiplier_x, speed_lerp_value)
				x = val.x * speed_x * mean_dt
				local speed_y = math.lerp(filter_data.min_multiplier_y, filter_data.multiplier_y, speed_lerp_value)
				y = val.y * speed_y * mean_dt
			end

			local x_pos, y_pos = input_manager:get_gamepad_cursor_pos()
			filter_data.pos_x = x_pos or filter_data.pos_x
			filter_data.pos_y = y_pos or filter_data.pos_y
			local res_x = RESOLUTION_LOOKUP.res_w
			local res_y = RESOLUTION_LOOKUP.res_h
			local inv_scale = RESOLUTION_LOOKUP.inv_scale
			res_x = res_x * inv_scale
			res_y = res_y * inv_scale
			local dt = 0.03333333333333333
			local new_x = filter_data.pos_x + x * dt * filter_data.multiplier
			local new_y = filter_data.pos_y + y * dt * filter_data.multiplier
			filter_data.pos_x = (res_x < new_x and res_x) or (new_x < 0 and 0) or new_x
			filter_data.pos_y = (res_y < new_y and res_y) or (new_y < 0 and 0) or new_y
			filter_data.frame_index = GLOBAL_FRAME_INDEX
		end

		return Vector3(filter_data.pos_x, filter_data.pos_y, 0)
	end,
	edit_types = {
		{
			"multiplier",
			"number"
		}
	}
}
InputFilters.threshhold = {
	init = function (filter_data)
		return table.clone(filter_data)
	end,
	update = function (filter_data, input_service)
		local val = input_service:get(filter_data.input_mapping)

		if filter_data.threshhold <= val then
			return false
		else
			return true
		end
	end
}
InputFilters.move_filter = {
	init = function (filter_data)
		local new_filter_data = table.clone(filter_data)
		local axis = Vector3(unpack(filter_data.axis))
		axis = Vector3.normalize(axis)
		new_filter_data.axis = Vector3Box(axis)

		return new_filter_data
	end,
	update = function (filter_data, input_service)
		for _, input_mapping in pairs(filter_data.input_mappings) do
			if input_service:get(input_mapping) then
				return true
			end
		end

		local axis = filter_data.axis:unbox()

		for _, axis_mapping in pairs(filter_data.axis_mappings) do
			local axis_state = input_service:get(axis_mapping)

			if axis_state and filter_data.threshold <= Vector3.dot(axis_state, axis) then
				if filter_data.axis_pressed then
					return false
				else
					filter_data.axis_pressed = not filter_data.hold

					return true
				end
			else
				filter_data.axis_pressed = false
			end
		end

		return false
	end
}
InputFilters.move_filter_continuous = {
	init = function (filter_data)
		local new_filter_data = table.clone(filter_data)
		local axis = Vector3(unpack(filter_data.axis))
		axis = Vector3.normalize(axis)
		new_filter_data.axis = Vector3Box(axis)
		new_filter_data.cooldown = 0
		new_filter_data.cooldown_speed_multiplier = 1

		return new_filter_data
	end,
	update = function (filter_data, input_service)
		local dt = Managers.time:mean_dt()
		filter_data.cooldown = math.max(filter_data.cooldown - dt, 0)
		local disabled = filter_data.cooldown > 0
		local input_mapping_found = false

		for _, input_mapping in pairs(filter_data.input_mappings) do
			if input_service:get(input_mapping) then
				input_mapping_found = true
			end
		end

		local axis_mapping_found = false
		local axis = filter_data.axis:unbox()

		for _, axis_mapping in pairs(filter_data.axis_mappings) do
			local axis_state = input_service:get(axis_mapping)

			if axis_state and filter_data.threshold <= Vector3.dot(axis_state, axis) then
				axis_mapping_found = true
			end
		end

		if disabled and (input_mapping_found or axis_mapping_found) then
			local min_multiplier = GamepadSettings.menu_min_speed_multiplier
			local menu_speed_multiplier_decrease = GamepadSettings.menu_speed_multiplier_decrease
			filter_data.cooldown_speed_multiplier = math.max(filter_data.cooldown_speed_multiplier - menu_speed_multiplier_decrease * dt, min_multiplier)
		end

		if not input_mapping_found and not axis_mapping_found then
			filter_data.cooldown_speed_multiplier = 1
			filter_data.cooldown = 0
		end

		if not disabled and (input_mapping_found or axis_mapping_found) then
			filter_data.cooldown = GamepadSettings.menu_cooldown * filter_data.cooldown_speed_multiplier

			return true
		end

		return false
	end
}
InputFilters.or = {
	init = function (filter_data)
		return table.clone(filter_data)
	end,
	update = function (filter_data, input_service)
		for _, input_mapping in pairs(filter_data.input_mappings) do
			if input_service:get(input_mapping) then
				return true
			end
		end
	end
}
InputFilters.and = {
	init = function (filter_data)
		return table.clone(filter_data)
	end,
	update = function (filter_data, input_service)
		local value = nil

		for _, input_mapping in pairs(filter_data.input_mappings) do
			if not input_service:get(input_mapping) then
				value = false
			elseif value == nil then
				value = true
			end
		end

		return value
	end
}
InputFilters.multiple_and = {
	init = function (filter_data)
		return table.clone(filter_data)
	end,
	update = function (filter_data, input_service)
		for _, input_mapping_table in ipairs(filter_data.input_mappings) do
			local value = nil

			for _, input_mapping in pairs(input_mapping_table) do
				if not input_service:get(input_mapping) then
					value = false
				elseif value == nil then
					value = true
				end
			end

			if value then
				return value
			end
		end

		return false
	end
}
InputFilters.sub = {
	init = function (filter_data)
		return table.clone(filter_data)
	end,
	update = function (filter_data, input_service)
		local value = 0
		local prev_input_value = nil

		for _, input_mapping in pairs(filter_data.input_mappings) do
			local input_value = input_service:get(input_mapping)

			if prev_input_value then
				value = prev_input_value - input_value
				prev_input_value = value
			else
				prev_input_value = input_value
			end
		end

		return value
	end
}
InputFilters.delayed_and = {
	init = function (filter_data)
		local internal_filter_data = table.clone(filter_data)
		internal_filter_data.timer = 0
		internal_filter_data.pressed = {}

		return internal_filter_data
	end,
	update = function (filter_data, input_service)
		local value, any_pressed = nil

		for _, input_mapping in pairs(filter_data.input_mappings) do
			if not input_service:get(input_mapping) then
				value = false
			elseif value == nil then
				value = true
				filter_data.pressed[input_mapping] = true
				any_pressed = true
			else
				filter_data.pressed[input_mapping] = true
				any_pressed = true
			end
		end

		if value then
			return value
		end

		local time = Application.time_since_launch()

		if any_pressed then
			filter_data.timer = time + filter_data.max_delay
		end

		if time < filter_data.timer then
			value = nil

			for _, input_mapping in pairs(filter_data.input_mappings) do
				if not filter_data.pressed[input_mapping] then
					value = false
				elseif value == nil then
					value = true
				end
			end
		else
			table.clear(filter_data.pressed)
		end

		return value
	end
}
InputFilters.exclusive_and = {
	init = function (filter_data)
		return table.clone(filter_data)
	end,
	update = function (filter_data, input_service)
		local value = nil

		for _, input_mapping in pairs(filter_data.input_mappings) do
			if not input_service:get(input_mapping) then
				value = false
			elseif value == nil then
				value = true
			end
		end

		for _, input_mapping in pairs(filter_data.exclusive_input_mappings) do
			if input_service:get(input_mapping) then
				value = false

				break
			end
		end

		return value
	end
}
InputFilters.axis_check = {
	init = function (filter_data)
		local my_filter_data = table.clone(filter_data)
		local axis = my_filter_data.axis
		my_filter_data.axis = Vector3Box(Vector3(axis[1], axis[2], axis[3]))

		return my_filter_data
	end,
	update = function (filter_data, input_service)
		local axis_requirement = filter_data.axis_requirement
		local input = input_service:get(filter_data.input_mapping)

		if not input then
			return false
		end

		return axis_requirement <= Vector3.dot(filter_data.axis:unbox(), input)
	end
}
InputFilters.not = {
	init = function (filter_data)
		return table.clone(filter_data)
	end,
	update = function (filter_data, input_service)
		for _, input_mapping in pairs(filter_data.input_mappings) do
			if not input_service:get(input_mapping) then
				return true
			end
		end
	end
}

return
