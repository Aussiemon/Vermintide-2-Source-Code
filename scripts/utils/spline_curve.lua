require("scripts/utils/bezier")
require("scripts/utils/hermite")

SplineCurve = class(SplineCurve)
SplineCurve.init = function (self, points, class_name, movement_class, name, ...)
	self._t = 0
	self._name = name
	local splines = {}
	local spline_class = rawget(_G, class_name)
	self._spline_class = spline_class

	self._build_splines(self, splines, points, spline_class)

	self._splines = splines
	self._movement = rawget(_G, movement_class):new(self, splines, spline_class, ...)

	return 
end
SplineCurve.splines = function (self)
	return self._splines
end
SplineCurve.name = function (self)
	return self._name
end
SplineCurve._build_splines = function (self, splines, points, spline_class)
	local index = 1

	while index do
		local spline_points = {
			spline_class.spline_points(points, index)
		}

		for index, point in ipairs(spline_points) do
			spline_points[index] = Vector3Box(point)
		end

		splines[#splines + 1] = {
			points = spline_points
		}
		index = spline_class.next_index(points, index)
	end

	return 
end

function unpack_unbox(t, k)
	k = k or 1
	local var = t[k]

	if not var then
		return nil
	end

	return var.unbox(var), unpack_unbox(t, k + 1)
end

SplineCurve.draw = function (self, segments_per_spline, drawer, tangent_scale, color)
	local spline_class = self._spline_class

	for _, spline in ipairs(self._splines) do
		local points = spline.points

		spline_class.draw(segments_per_spline, drawer, tangent_scale, color, unpack_unbox(points))
	end

	return 
end
SplineCurve.length = function (self, segments_per_spline)
	local spline_class = self._spline_class

	for _, spline in ipairs(self._splines) do
		local points = spline.points
		length = spline_class.length(segments_per_spline, unpack_unbox(points))
	end

	return length
end
SplineCurve.movement = function (self)
	return self._movement
end
SplineCurve.update = function (self, dt)
	self._movement:update(dt)

	return 
end
SplineMovementMetered = class(SplineMovementMetered)
SplineMovementMetered.init = function (self, spline_curve, splines, spline_class)
	self._splines = splines
	self._spline_curve = spline_curve
	self._spline_class = spline_class
	self._speed = 0
	self._current_spline_index = 1
	self._t = 0

	self._set_spline_lengths(self, splines, spline_class, 10)

	return 
end
SplineMovementMetered._set_spline_lengths = function (self, splines, spline_class, segments_per_spline)
	for index, spline in ipairs(splines) do
		local points = spline.points
		spline.length = spline_class.length(segments_per_spline, unpack_unbox(points))

		fassert(0 < spline.length, "[SplineMovementMetered] Spline %n in curve %s has length 0.", index, self._spline_curve:name())
	end

	return 
end
SplineMovementMetered.draw = function (self, script_drawer, radius, color)
	local pos = self.current_position(self)

	script_drawer.sphere(script_drawer, pos, radius or 1, color)

	return 
end
SplineMovementMetered.current_position = function (self)
	return self._spline_class.calc_point(self._t, unpack_unbox(self._current_spline(self).points))
end
SplineMovementMetered._current_spline = function (self)
	return self._splines[self._current_spline_index]
end
SplineMovementMetered.update = function (self, dt)
	Profiler.start("SplineMovementMetered:update(dt)")
	self.move(self, dt * self._speed)
	Profiler.stop("SplineMovementMetered:update(dt)")

	return 
end
SplineMovementMetered.move = function (self, delta)
	local current_spline = self._current_spline(self)
	local current_spline_length = current_spline.length
	local new_t = self._t + delta / current_spline_length

	if 1 < new_t and self._current_spline_index == #self._splines then
		self._t = 1

		return 
	elseif 1 < new_t then
		self._current_spline_index = self._current_spline_index + 1
		self._t = 0
		local remainder = delta - (new_t - 1) * current_spline_length

		return self.move(self, remainder)
	elseif new_t < 0 and self._current_spline_index == 1 then
		self._t = 0

		return 
	elseif new_t < 0 then
		self._current_spline_index = self._current_spline_index - 1
		self._t = 1
		local remainder = delta - new_t * current_spline_length

		return self.move(self, remainder)
	else
		self._t = new_t

		return 
	end

	return 
end
SplineMovementHermiteInterpolatedMetered = class(SplineMovementHermiteInterpolatedMetered)
SplineMovementHermiteInterpolatedMetered.init = function (self, spline_curve, splines, spline_class, subdivisions)
	self._splines = splines
	self._spline_curve = spline_curve
	self._spline_class = spline_class
	self._speed = 0
	self._current_spline_index = 1
	self._t = 0
	self._current_subdivision_index = 1

	self._build_subdivisions(self, subdivisions, splines, spline_class)

	return 
end
SplineMovementHermiteInterpolatedMetered._build_subdivisions = function (self, subdivisions, splines, spline_class)
	local first_point = spline_class.calc_point(0, unpack_unbox(splines[1].points))
	local points = {
		[0] = first_point
	}

	for index, spline in ipairs(splines) do
		for sub_index = 1, subdivisions, 1 do
			local point = spline_class.calc_point(sub_index / subdivisions, unpack_unbox(spline.points))
			points[#points + 1] = point
		end
	end

	points[-1] = first_point
	points[#points + 1] = points[#points]

	for index, spline in ipairs(splines) do
		local subs = {}
		local point_index = (index - 1) * subdivisions
		spline.length = 0

		for sub_index = 1, subdivisions, 1 do
			local sub = {}
			local p0 = points[point_index - 1]
			local p1 = points[point_index]
			local p2 = points[point_index + 1]
			local p3 = points[point_index + 2]
			sub.points = {
				Vector3Box(p0),
				Vector3Box(p1),
				Vector3Box(p2),
				Vector3Box(p3)
			}
			local vectors, quaternions, matrices = Script.temp_count()
			sub.length = Hermite.length(10, p0, p1, p2, p3)

			Script.set_temp_count(vectors, quaternions, matrices)

			point_index = point_index + 1
			subs[#subs + 1] = sub
			spline.length = spline.length + sub.length
		end

		spline.subdivisions = subs
	end

	return 
end
SplineMovementHermiteInterpolatedMetered._set_spline_lengths = function (self, splines, spline_class, segments_per_spline)
	for index, spline in ipairs(splines) do
		local points = spline.points
		spline.length = spline_class.length(segments_per_spline, unpack_unbox(points))

		fassert(0 < spline.length, "[SplineMovementHermiteInterpolatedMetered] Spline %n in curve %s has length 0.", index, self._spline_curve:name())
	end

	return 
end
SplineMovementHermiteInterpolatedMetered.draw = function (self, script_drawer, radius, color)
	local pos = self.current_position(self)

	script_drawer.sphere(script_drawer, pos, radius or 1, color)

	return 
end
SplineMovementHermiteInterpolatedMetered.draw_subdivisions = function (self, script_drawer, color)
	for _, spline in ipairs(self._splines) do
		for _, subdivision in ipairs(spline.subdivisions) do
			Hermite.draw(10, script_drawer, Color(255, 0, 0), nil, unpack_unbox(subdivision.points))
		end
	end

	return 
end
SplineMovementHermiteInterpolatedMetered.current_position = function (self)
	local current_subdivision = self._current_spline_subdivision(self)

	return Hermite.calc_point(self._t, unpack_unbox(current_subdivision.points))
end
SplineMovementHermiteInterpolatedMetered.current_tangent_direction = function (self)
	local current_subdivision = self._current_spline_subdivision(self)

	return Hermite.calc_tangent(self._t, unpack_unbox(current_subdivision.points))
end
SplineMovementHermiteInterpolatedMetered._current_spline = function (self)
	return self._splines[self._current_spline_index]
end
SplineMovementHermiteInterpolatedMetered.update = function (self, dt)
	local state = self.move(self, dt * self._speed)

	return state
end
SplineMovementHermiteInterpolatedMetered.distance = function (self, from_index, from_subdiv, from_spline_t, to_index, to_subdiv, to_spline_t)
	local distance = 0
	local splines = self._splines
	local len1, len2, len3, len4, len5 = nil

	if to_index < from_index then
		local from_spline = splines[from_index]
		distance = distance - from_spline_t * from_spline.subdivisions[from_subdiv].length
		local from_subdivs = from_spline.subdivisions

		for i = 1, from_subdiv - 1, 1 do
			distance = distance - from_subdivs[i].length
		end

		for i = to_index + 1, from_index - 1, 1 do
			distance = distance - splines[i].length
		end

		local to_spline = splines[to_index]
		local to_subdivs = to_spline.subdivisions

		for i = to_subdiv + 1, #to_subdivs, 1 do
			distance = distance - to_subdivs[i].length
		end

		distance = distance - (1 - to_spline_t) * to_subdivs[to_subdiv].length
	elseif from_index < to_index then
		local from_spline = splines[from_index]
		local from_subdivs = from_spline.subdivisions
		distance = distance + (1 - from_spline_t) * from_subdivs[from_subdiv].length

		for i = from_subdiv + 1, #from_subdivs, 1 do
			distance = distance + from_subdivs[i].length
		end

		for i = from_index + 1, to_index - 1, 1 do
			distance = distance + splines[i].length
		end

		local to_spline = splines[to_index]
		local to_subdivs = to_spline.subdivisions

		for i = 1, to_subdiv - 1, 1 do
			distance = distance + to_subdivs[i].length
		end

		distance = distance + to_spline_t * to_subdivs[to_subdiv].length
	elseif from_index == to_index and from_subdiv < to_subdiv then
		local subdivs = splines[from_index].subdivisions
		distance = distance + (1 - from_spline_t) * subdivs[from_subdiv].length

		for i = from_subdiv + 1, to_subdiv - 1, 1 do
			distance = distance + subdivs[i].length
		end

		distance = distance + to_spline_t * subdivs[to_subdiv].length
	elseif from_index == to_index and to_subdiv < from_subdiv then
		local subdivs = splines[from_index].subdivisions
		distance = distance - from_spline_t * subdivs[from_subdiv].length

		for i = to_subdiv + 1, from_subdiv - 1, 1 do
			distance = distance - subdivs[i].length
		end

		distance = distance - (1 - to_spline_t) * subdivs[to_subdiv].length
	else
		distance = (to_spline_t - from_spline_t) * splines[from_index].subdivisions[from_subdiv].length
	end

	return distance
end
SplineMovementHermiteInterpolatedMetered.set_speed = function (self, speed)
	self._speed = speed

	return 
end
SplineMovementHermiteInterpolatedMetered.speed = function (self)
	return self._speed
end
SplineMovementHermiteInterpolatedMetered._current_spline_subdivision = function (self)
	return self._current_spline(self).subdivisions[self._current_subdivision_index]
end
SplineMovementHermiteInterpolatedMetered.move = function (self, delta)
	local current_spline = self._current_spline(self)
	local current_subdivision = self._current_spline_subdivision(self)
	local current_subdivision_length = current_subdivision.length
	local new_t = self._t + delta / current_subdivision_length

	if 1 < new_t and self._current_spline_index == #self._splines and self._current_subdivision_index == #current_spline.subdivisions then
		self._t = 1

		return "end"
	elseif 1 < new_t then
		self._current_subdivision_index = self._current_subdivision_index + 1

		if #current_spline.subdivisions < self._current_subdivision_index then
			self._current_subdivision_index = 1
			self._current_spline_index = self._current_spline_index + 1
		end

		self._t = 0
		local remainder = delta - (new_t - 1) * current_subdivision_length

		return self.move(self, remainder)
	elseif new_t <= 0 and self._current_spline_index == 1 and self._current_subdivision_index == 1 then
		self._t = 0

		return "start"
	elseif new_t < 0 then
		self._current_subdivision_index = self._current_subdivision_index - 1

		if self._current_subdivision_index == 0 then
			self._current_spline_index = self._current_spline_index - 1
			self._current_subdivision_index = #self._current_spline(self).subdivisions
		end

		self._t = 1
		local remainder = delta - new_t * current_subdivision_length

		return self.move(self, remainder)
	else
		self._t = new_t

		return "moving"
	end

	return 
end
SplineMovementHermiteInterpolatedMetered.reset_to_start = function (self)
	self._current_spline_index = 1
	self._current_subdivision_index = 1
	self._t = 0

	return 
end
SplineMovementHermiteInterpolatedMetered.reset_to_end = function (self)
	local current_spline = self._current_spline(self)
	self._current_spline_index = #self._splines
	self._current_subdivision_index = #current_spline.subdivisions
	self._t = 1

	return 
end
SplineMovementHermiteInterpolatedMetered.set_current_spline_index = function (self, index)
	self._current_spline_index = index

	return 
end
SplineMovementHermiteInterpolatedMetered.set_spline_index = function (self, spline_index, subdivision_index, t)
	self._current_spline_index = spline_index
	self._current_subdivision_index = subdivision_index
	self._t = t

	return 
end
SplineMovementHermiteInterpolatedMetered.current_spline_index = function (self)
	return self._current_spline_index
end
SplineMovementHermiteInterpolatedMetered.current_subdivision_index = function (self)
	return self._current_subdivision_index
end
SplineMovementHermiteInterpolatedMetered.current_t = function (self)
	return self._t
end

return 
