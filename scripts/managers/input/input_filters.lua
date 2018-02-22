InputFilters = InputFilters or {}

local function input_threshold(input_axis, threshold)
	local length = Vector3.length(input_axis)

	if length < threshold then
		input_axis.x = 0
		input_axis.y = 0
		input_axis.z = 0
	end

	return 
end

InputFilters.virtual_axis = {
	init = function (filter_data)
		return table.clone(filter_data)
	end,
	update = function (filter_data, input_service)
		local input_mappings = filter_data.input_mappings
		local right = input_service.get(input_service, input_mappings.right)
		local left = input_service.get(input_service, input_mappings.left)
		local forward = input_service.get(input_service, input_mappings.forward)
		local back = input_service.get(input_service, input_mappings.back)
		local up_key = input_mappings.up
		local up = (up_key and input_service.get(input_service, up_key)) or 0
		local down_key = input_mappings.down
		local down = (down_key and input_service.get(input_service, down_key)) or 0
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
		local val = input_service.get(input_service, filter_data.input_mapping)

		input_threshold(val, filter_data.input_threshold or 0)

		return val*filter_data.multiplier
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
		local val = input_service.get(input_service, filter_data.input_mapping)

		input_threshold(val, filter_data.input_threshold or 0)

		local x = val.x*filter_data.multiplier_x
		local y = val.y*filter_data.multiplier_y
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
		internal_filter_data.min_multiplier_x = internal_filter_data.min_multiplier_x or internal_filter_data.multiplier_x*0.25

		return internal_filter_data
	end,
	update = function (filter_data, input_service)
		local val = input_service.get(input_service, filter_data.input_mapping)

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

		if filter_data.turnaround_threshold and filter_data.acceleration_delay + filter_data.turnaround_delay <= turnaround_elapsed_time and filter_data.turnaround_threshold <= math.abs(val.x) then
			local value = math.clamp(elapsed_time - (filter_data.acceleration_delay + filter_data.turnaround_delay)/filter_data.turnaround_time_ref, 0, 1)
			x = val.x*math.lerp(filter_data.min_multiplier_x, filter_data.turnaround_multiplier_x, math.pow(value, filter_data.turnaround_power_of))*Managers.time._mean_dt
		elseif filter_data.acceleration_delay <= elapsed_time then
			local value = math.clamp((elapsed_time - filter_data.acceleration_delay)/filter_data.accelerate_time_ref, 0, 1)
			x = val.x*math.lerp(filter_data.min_multiplier_x, filter_data.multiplier_x, math.pow(value, filter_data.power_of))*Managers.time._mean_dt
		else
			x = val.x*filter_data.min_multiplier_x*Managers.time._mean_dt
		end

		local y = val.y*filter_data.multiplier_y*Managers.time._mean_dt
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
		internal_filter_data.min_multiplier_x = internal_filter_data.min_multiplier_x or internal_filter_data.multiplier_x*0.25
		internal_filter_data.input_x_turnaround_t = 0

		return internal_filter_data
	end,
	update = function (filter_data, input_service)
		local val = input_service.get(input_service, filter_data.input_mapping)

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

		if filter_data.turnaround_threshold and filter_data.acceleration_delay + filter_data.turnaround_delay <= turnaround_elapsed_time and filter_data.turnaround_threshold <= math.abs(val.x) then
			local value = math.clamp(elapsed_time - (filter_data.acceleration_delay + filter_data.turnaround_delay)/filter_data.turnaround_time_ref, 0, 1)
			x = val.x*math.lerp(filter_data.min_multiplier_x, filter_data.turnaround_multiplier_x, math.pow(value, filter_data.turnaround_power_of))*Managers.time._mean_dt
		elseif filter_data.acceleration_delay <= elapsed_time then
			local value = math.clamp((elapsed_time - filter_data.acceleration_delay)/filter_data.accelerate_time_ref, 0, 1)
			x = val.x*math.lerp(filter_data.min_multiplier_x, filter_data.multiplier_x, math.pow(value, filter_data.power_of))*Managers.time._mean_dt
		else
			x = val.x*filter_data.min_multiplier_x*Managers.time._mean_dt
		end

		local y = -val.y*filter_data.multiplier_y*Managers.time._mean_dt
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
		local val = Vector3(Vector3.to_elements(input_service.get(input_service, filter_data.input_mapping)))

		input_threshold(val, filter_data.input_threshold or 0)

		val.y = -val.y

		return val*filter_data.multiplier
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
		local res_x, res_y = UIResolution()
		local inv_scale = RESOLUTION_LOOKUP.inv_scale
		res_x = res_x*inv_scale
		res_y = res_y*inv_scale
		internal_filter_data.pos_x = res_x*0.5
		internal_filter_data.pos_y = res_y*0.5
		internal_filter_data.frame_index = GLOBAL_FRAME_INDEX
		internal_filter_data.input_x = 0
		internal_filter_data.input_x_t = 0
		internal_filter_data.input_x_turnaround_t = 0
		internal_filter_data.min_multiplier_x = internal_filter_data.min_multiplier_x or internal_filter_data.multiplier_x*0.25
		internal_filter_data.input_y = 0
		internal_filter_data.input_y_t = 0
		internal_filter_data.input_y_turnaround_t = 0
		internal_filter_data.min_multiplier_y = internal_filter_data.min_multiplier_y or internal_filter_data.multiplier_y*0.25
		internal_filter_data.hover_multiplier = internal_filter_data.hover_multiplier

		return internal_filter_data
	end,
	update = function (filter_data, input_service)
		if filter_data.frame_index < GLOBAL_FRAME_INDEX then
			local val = Vector3(Vector3.to_elements(input_service.get(input_service, filter_data.input_mapping)))

			input_threshold(val, filter_data.input_threshold or 0)

			local mean_dt = Managers.time._mean_dt
			local time = Application.time_since_launch()
			local x, y = nil
			local is_hovering = Managers.input:is_hovering()

			if is_hovering then
				x = val.x*filter_data.multiplier_x*mean_dt*filter_data.hover_multiplier
				y = val.y*filter_data.multiplier_y*mean_dt*filter_data.hover_multiplier
				filter_data.input_start_time = nil
			else
				local elapsed_time = 0
				local input_strength = (math.abs(val.x) + math.abs(val.y))*0.5

				if input_strength < filter_data.acceleration_threshold then
					filter_data.input_start_time = nil
				elseif filter_data.input_start_time then
					elapsed_time = time - filter_data.input_start_time
				else
					filter_data.input_start_time = time
				end

				local speed_lerp_value = math.clamp((elapsed_time - filter_data.acceleration_delay)/filter_data.accelerate_time_ref, 0, 1)
				local speed_x = math.lerp(filter_data.min_multiplier_x, filter_data.multiplier_x, speed_lerp_value)
				x = val.x*speed_x*mean_dt
				local speed_y = math.lerp(filter_data.min_multiplier_y, filter_data.multiplier_y, speed_lerp_value)
				y = val.y*speed_y*mean_dt
			end

			local res_x, res_y = UIResolution()
			local inv_scale = RESOLUTION_LOOKUP.inv_scale
			res_x = res_x*inv_scale
			res_y = res_y*inv_scale
			local dt = 0.03333333333333333
			local new_x = filter_data.pos_x + x*dt*filter_data.multiplier
			local new_y = filter_data.pos_y + y*dt*filter_data.multiplier
			filter_data.pos_x = (res_x < new_x and res_x) or ((new_x >= 0 or 0) and new_x)
			filter_data.pos_y = (res_y < new_y and res_y) or ((new_y >= 0 or 0) and new_y)
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
		local val = input_service.get(input_service, filter_data.input_mapping)

		if filter_data.threshhold <= val then
			return false
		else
			return true
		end

		return 
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
			if input_service.get(input_service, input_mapping) then
				return true
			end
		end

		local axis = filter_data.axis:unbox()

		for _, axis_mapping in pairs(filter_data.axis_mappings) do
			local axis_state = input_service.get(input_service, axis_mapping)

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
InputFilters.or = {
	init = function (filter_data)
		return table.clone(filter_data)
	end,
	update = function (filter_data, input_service)
		for _, input_mapping in pairs(filter_data.input_mappings) do
			if input_service.get(input_service, input_mapping) then
				return true
			end
		end

		return 
	end
}
InputFilters.and = {
	init = function (filter_data)
		return table.clone(filter_data)
	end,
	update = function (filter_data, input_service)
		local value = nil

		for _, input_mapping in pairs(filter_data.input_mappings) do
			if not input_service.get(input_service, input_mapping) then
				value = false
			elseif value == nil then
				value = true
			end
		end

		return value
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
			local input_value = input_service.get(input_service, input_mapping)

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

return 
