require("scripts/managers/camera/cameras/base_camera")

BlendCamera = class(BlendCamera, BaseCamera)
BlendCamera.init = function (self, root_node)
	BlendCamera.super.init(self, root_node)

	self._offset_position = Vector3(0, 0, 0)
	self._blend_setups = {}
	self._blend_functions = {
		match_2d = function (blend_definition, data)
			local blend_x = data[blend_definition.blend_parameter_x]
			local blend_y = data[blend_definition.blend_parameter_y]
			local match_x = blend_definition.match_value_x
			local match_y = blend_definition.match_value_y

			return (math.min(math.abs(blend_x - match_x), 1) - 1)*(math.min(math.abs(blend_y - match_y), 1) - 1)
		end,
		match = function (blend_definition, data)
			local blend = data[blend_definition.blend_parameter]
			local match = blend_definition.match_value

			return math.min(math.abs(blend - match), 1) - 1
		end
	}

	return 
end
BlendCamera.parse_parameters = function (self, camera_settings, parent_node)
	BlendCamera.super.parse_parameters(self, camera_settings, parent_node)

	self._child_node_definitions = camera_settings.child_node_blend_definitions

	return 
end
BlendCamera.add_child_node = function (self, node)
	BlendCamera.super.add_child_node(self, node)

	local child_index = #self._blend_setups + 1
	local def = self._child_node_definitions[child_index]
	self._blend_setups[child_index] = {
		node = node,
		weight_function = self._blend_functions[def.blend_function],
		definition = def
	}

	return 
end
BlendCamera.update = function (self, dt, position, rotation, data)
	if 0 < self._active_children then
		BlendCamera.super.update(self, dt, position, rotation, data)

		return 
	end

	local total_weight = 0
	local total_offset = Vector3(0, 0, 0)

	for child_index, blend_setup in ipairs(self._blend_setups) do
		local node = blend_setup.node

		node.update(node, dt, position, rotation, data)

		local offset = node.position(node) - position
		local weight = blend_setup.weight_function(blend_setup.definition, data)
		total_weight = total_weight + weight

		assert(0 <= weight, "[BlendCamera:update() individual weight lesser than 0, undefined.")

		total_offset = total_offset + offset*weight
	end

	assert(0 < total_weight, "[BlendCamera:update() total blend weights are lower than 0")

	local new_position = position + total_offset/total_weight

	BlendCamera.super.update(self, dt, new_position, rotation, data)

	return 
end

return 
