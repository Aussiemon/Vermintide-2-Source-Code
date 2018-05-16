DebugDrawerRelease = class(DebugDrawerRelease)

DebugDrawerRelease.init = function (self, line_object, mode)
	self._line_object = line_object
	self._mode = mode
end

DebugDrawerRelease.reset = function (self)
	return
end

DebugDrawerRelease.line_object = function (self)
	return self._line_object
end

DebugDrawerRelease.line = function (self, from, to, color)
	return
end

DebugDrawerRelease.sphere = function (self, center, radius, color, segments, parts)
	return
end

DebugDrawerRelease.capsule_overlap = function (self, position, size, rotation, color)
	return
end

DebugDrawerRelease.box_sweep = function (self, pose, extents, movement_vector, color1, color2)
	return
end

DebugDrawerRelease.capsule = function (self, from, to, radius, color)
	return
end

DebugDrawerRelease.actor = function (self, actor, color, camera_pose)
	return
end

DebugDrawerRelease.box = function (self, pose, extents, color)
	return
end

DebugDrawerRelease.cone = function (self, from, to, radius, color, segements, bars)
	return
end

DebugDrawerRelease.circle = function (self, center, radius, normal, color, segments)
	return
end

DebugDrawerRelease.arrow_2d = function (self, from, to, color)
	return
end

DebugDrawerRelease.cylinder = function (self, pos1, pos2, radius, color, segments)
	return
end

DebugDrawerRelease.vector = function (self, position, vector, color)
	return
end

DebugDrawerRelease.quaternion = function (self, position, quaternion, scale)
	return
end

DebugDrawerRelease.matrix4x4 = function (self, matrix, scale)
	return
end

DebugDrawerRelease.unit = function (self, unit, color)
	return
end

DebugDrawerRelease.navigation_mesh_search = function (self, mesh)
	return
end

DebugDrawerRelease.update = function (self, world)
	return
end

return
