DebugDrawer = class(DebugDrawer)

DebugDrawer.init = function (self, line_object, mode)
	self._line_object = line_object
	self._mode = mode
end

DebugDrawer.reset = function (self)
	LineObject.reset(self._line_object)
end

DebugDrawer.line_object = function (self)
	return self._line_object
end

DebugDrawer.line = function (self, from, to, color)
	color = color or Color(255, 255, 255)

	LineObject.add_line(self._line_object, color, from, to)
end

DebugDrawer.sphere = function (self, center, radius, color, segments, parts)
	color = color or Color(255, 255, 255)

	LineObject.add_sphere(self._line_object, color, center, radius, segments or 20, parts or 2)
end

DebugDrawer.capsule_overlap = function (self, position, size, rotation, color)
	fassert(size.x == size.z, "Passing diffent x and y size doesn't do anything, capsules overlaps are always sphere swept, not spheroid shaped.")

	local radius = (size.x + size.z) * 0.5
	local forward = Quaternion.forward(rotation)
	local offset_y = forward * (size.y - radius)
	local from = position - offset_y
	local to = position + offset_y

	self:capsule(from, to, radius, color)
end

DebugDrawer.oobb_overlap = function (self, position, size, rotation, color)
	local pose = Matrix4x4.from_quaternion_position(rotation, position)

	self:box(pose, size, color)
end

DebugDrawer.box_sweep = function (self, pose, extents, movement_vector, color1, color2)
	color1 = color1 or Color(255, 255, 255)
	color2 = color2 or Color(255, 0, 0)
	local rot = Matrix4x4.rotation(pose)
	local pos = Matrix4x4.translation(pose)
	local box2_pose = Matrix4x4.from_quaternion_position(rot, pos + movement_vector)

	self:box(pose, extents, color1)
	self:box(box2_pose, extents, color1)

	local x_vect = Matrix4x4.right(pose)
	local y_vect = Matrix4x4.forward(pose)
	local z_vect = Matrix4x4.up(pose)
	local x_positive = x_vect * extents.x
	local x_negative = -x_vect * extents.x
	local y_positive = y_vect * extents.y
	local y_negative = -y_vect * extents.y
	local z_positive = z_vect * extents.z
	local z_negative = -z_vect * extents.z
	local box1corner1 = pos + x_positive + y_positive + z_positive
	local box1corner2 = pos + x_negative + y_positive + z_positive
	local box1corner3 = pos + x_negative + y_negative + z_positive
	local box1corner4 = pos + x_positive + y_negative + z_positive
	local box1corner5 = pos + x_positive + y_positive + z_negative
	local box1corner6 = pos + x_negative + y_positive + z_negative
	local box1corner7 = pos + x_negative + y_negative + z_negative
	local box1corner8 = pos + x_positive + y_negative + z_negative

	self:line(box1corner1, box1corner1 + movement_vector, color2)
	self:line(box1corner2, box1corner2 + movement_vector, color2)
	self:line(box1corner3, box1corner3 + movement_vector, color2)
	self:line(box1corner4, box1corner4 + movement_vector, color2)
	self:line(box1corner5, box1corner5 + movement_vector, color2)
	self:line(box1corner6, box1corner6 + movement_vector, color2)
	self:line(box1corner7, box1corner7 + movement_vector, color2)
	self:line(box1corner8, box1corner8 + movement_vector, color2)
end

DebugDrawer.capsule = function (self, from, to, radius, color)
	color = color or Color(255, 255, 255)

	LineObject.add_capsule(self._line_object, color, from, to, radius)
end

DebugDrawer.actor = function (self, actor, color, camera_pose)
	color = color or Color(255, 255, 255)

	Actor.debug_draw(actor, self._line_object, color, camera_pose)
end

DebugDrawer.box = function (self, pose, extents, color)
	color = color or Color(255, 255, 255)

	LineObject.add_box(self._line_object, color, pose, extents)
end

DebugDrawer.cone = function (self, from, to, radius, color, segements, bars)
	color = color or Color(255, 255, 255)

	LineObject.add_cone(self._line_object, color, from, to, radius, segements, bars)
end

DebugDrawer.circle = function (self, center, radius, normal, color, segments)
	color = color or Color(255, 255, 255)

	LineObject.add_circle(self._line_object, color, center, radius, normal, segments or 20)
end

DebugDrawer.arrow_2d = function (self, from, to, color)
	self:line(from, to, color)

	local vector = to - from
	local length = Vector3.length(vector)
	local base_axis = Vector3.cross(Vector3.normalize(vector), Vector3.up())

	self:line(to, to - 0.2 * vector + base_axis * length * 0.2, color)
	self:line(to, to - 0.2 * vector - base_axis * length * 0.2, color)
end

DebugDrawer.cylinder = function (self, pos1, pos2, radius, color, segments)
	color = color or Color(255, 255, 255)
	segments = segments or 5
	local step = (pos2 - pos1) / segments
	local pos = pos1
	local normal = Vector3.normalize(step)

	LineObject.add_circle(self._line_object, color, pos1, radius, normal, 20)

	for i = 1, segments - 1, 1 do
		pos = pos + step

		LineObject.add_circle(self._line_object, color, pos, radius, normal, 20)
	end
end

DebugDrawer.vector = function (self, position, vector, color)
	color = color or Color(255, 255, 255)
	local length = Vector3.length(vector)
	local normalized = Vector3.normalize(vector)
	local tip_scale = 0.2
	local tip_length = length * tip_scale
	local tip_width = (length * tip_scale) / 2
	local tip = position + vector
	local x, y = Vector3.make_axes(normalized)
	local aux = tip - normalized * tip_length

	self:line(position, tip, color)
	self:line(tip, aux - x * tip_width, color)
	self:line(tip, aux + x * tip_width, color)
	self:line(tip, aux - y * tip_width, color)
	self:line(tip, aux + y * tip_width, color)
end

DebugDrawer.quaternion = function (self, position, quaternion, scale)
	scale = scale or 1

	self:vector(position, scale * Quaternion.right(quaternion), Color(255, 0, 0))
	self:vector(position, scale * Quaternion.forward(quaternion), Color(0, 255, 0))
	self:vector(position, scale * Quaternion.up(quaternion), Color(0, 0, 255))
end

DebugDrawer.matrix4x4 = function (self, matrix, scale)
	scale = scale or 1
	local position = Matrix4x4.translation(matrix)

	self:sphere(position, scale * 0.25)

	local rotation = Matrix4x4.rotation(matrix)

	self:quaternion(position, rotation, scale)
end

DebugDrawer.unit = function (self, unit, color)
	color = color or Color(255, 255, 255)
	local box_pose, box_extents = Unit.box(unit)

	self:box(box_pose, box_extents, color)

	local position = Unit.world_position(unit, 0)
	position.z = position.z + box_extents.z
	local rotation = Unit.world_rotation(unit, 0)

	self:quaternion(position, rotation)
end

DebugDrawer.navigation_mesh_search = function (self, mesh)
	NavigationMesh.visualize_last_search(mesh, self._line_object)
end

DebugDrawer.update = function (self, world)
	if script_data and script_data.disable_debug_draw then
		self:reset()

		return
	end

	LineObject.dispatch(world, self._line_object)

	if self._mode == "immediate" then
		self:reset()
	end
end

return
