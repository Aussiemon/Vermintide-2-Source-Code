require("foundation/scripts/util/bezier")
require("foundation/scripts/util/hermite")

SplineCurve = class(SplineCurve)

SplineCurve.init = function (self, points, class_name, movement_class, name, ...)
	self._t = 0
	self._name = name
	local splines = {}
	local spline_class = rawget(_G, class_name)
	self._spline_class = spline_class

	self:_build_splines(splines, points, spline_class)

	self._splines = splines
	self._movement = rawget(_G, movement_class):new(self, splines, spline_class, ...)
end

SplineCurve.splines = function (self)
	return self._splines
end

SplineCurve.name = function (self)
	return self._name
end

SplineCurve.recalc_splines = function (self, points)
	self:_build_splines(self._splines, points, self._spline_class, 1)
end

SplineCurve._build_splines = function (self, splines, points, spline_class)
	local index = 1
	local spline_index = 1

	while index do
		local spline_points = {
			spline_class.spline_points(points, index)
		}

		for index, point in ipairs(spline_points) do
			spline_points[index] = Vector3Box(point)
		end

		splines[spline_index] = {
			points = spline_points
		}
		index = spline_class.next_index(points, index)
		spline_index = spline_index + 1
	end
end

function unpack_unbox(t, k)
	k = k or 1
	local var = t[k]

	if not var then
		return nil
	end

	return var:unbox(), unpack_unbox(t, k + 1)
end

SplineCurve.draw = function (self, segments_per_spline, drawer, tangent_scale, color)
	local spline_class = self._spline_class

	for _, spline in ipairs(self._splines) do
		local points = spline.points

		spline_class.draw(segments_per_spline, drawer, tangent_scale, color, unpack_unbox(points))
	end
end

SplineCurve.length = function (self, segments_per_spline)
	local spline_class = self._spline_class

	for _, spline in ipairs(self._splines) do
		local points = spline.points
		length = spline_class.length(segments_per_spline, unpack_unbox(points))
	end

	return length
end

SplineCurve.get_travel_dist_to_spline_point = function (self, point_index)
	local spline_points = self._splines
	local spline_class = self._spline_class
	local travel_dist = 0

	for i = 1, point_index, 1 do
		local data = spline_points[i]
		local segment_length = data.length
		travel_dist = travel_dist + segment_length
	end

	return travel_dist
end

SplineCurve.get_point_at_distance = function (self, dist)
	local spline_points = self._splines
	local spline_class = self._spline_class
	local travel_dist = 0

	for i = 1, #spline_points, 1 do
		local data = spline_points[i]
		local segment_length = data.length

		if dist < travel_dist + segment_length then
			local t = (dist - travel_dist) / segment_length
			local s = data.points
			local p0 = s[1]:unbox()
			local p1 = s[2]:unbox()
			local p2 = s[3]:unbox()
			local p3 = s[4]:unbox()
			local position = spline_class.calc_point(t, p0, p1, p2, p3)
			local tangent = spline_class.calc_tangent(t, p0, p1, p2, p3)

			return position, tangent
		end

		travel_dist = travel_dist + segment_length
	end

	local s = spline_points[#spline_points].points

	return s[3]:unbox(), spline_class.calc_tangent(1, s[1]:unbox(), s[2]:unbox(), s[3]:unbox(), s[4]:unbox()), true
end

SplineCurve.movement = function (self)
	return self._movement
end

SplineCurve.update = function (self, dt)
	self._movement:update(dt)
end

SplineMovementMetered = class(SplineMovementMetered)

SplineMovementMetered.init = function (self, spline_curve, splines, spline_class)
	self._splines = splines
	self._spline_curve = spline_curve
	self._spline_class = spline_class
	self._speed = 0
	self._current_spline_index = 1
	self._t = 0

	self:_set_spline_lengths(splines, spline_class, 10)
end

SplineMovementMetered._set_spline_lengths = function (self, splines, spline_class, segments_per_spline)
	for index, spline in ipairs(splines) do
		local points = spline.points
		spline.length = spline_class.length(segments_per_spline, unpack_unbox(points))

		fassert(spline.length > 0, "[SplineMovementMetered] Spline %n in curve %s has length 0.", index, self._spline_curve:name())
	end
end

SplineMovementMetered.draw = function (self, script_drawer, radius, color)
	local pos = self:current_position()

	script_drawer:sphere(pos, radius or 1, color)
end

SplineMovementMetered.current_position = function (self)
	return self._spline_class.calc_point(self._t, unpack_unbox(self:_current_spline().points))
end

SplineMovementMetered._current_spline = function (self)
	return self._splines[self._current_spline_index]
end

SplineMovementMetered.update = function (self, dt)
	Profiler.start("SplineMovementMetered:update(dt)")
	self:move(dt * self._speed)
	Profiler.stop("SplineMovementMetered:update(dt)")
end

SplineMovementMetered.move = function (self, delta)
	local current_spline = self:_current_spline()
	local current_spline_length = current_spline.length
	local new_t = self._t + delta / current_spline_length

	if new_t > 1 and self._current_spline_index == #self._splines then
		self._t = 1

		return
	elseif new_t > 1 then
		self._current_spline_index = self._current_spline_index + 1
		self._t = 0
		local remainder = delta - (new_t - 1) * current_spline_length

		return self:move(remainder)
	elseif new_t < 0 and self._current_spline_index == 1 then
		self._t = 0

		return
	elseif new_t < 0 then
		self._current_spline_index = self._current_spline_index - 1
		self._t = 1
		local remainder = delta - new_t * current_spline_length

		return self:move(remainder)
	else
		self._t = new_t

		return
	end
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
	self._current_spline_curve_distance = 0

	self:_build_subdivisions(subdivisions, splines, spline_class)
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
end

SplineMovementHermiteInterpolatedMetered._set_spline_lengths = function (self, splines, spline_class, segments_per_spline)
	for index, spline in ipairs(splines) do
		local points = spline.points
		spline.length = spline_class.length(segments_per_spline, unpack_unbox(points))

		fassert(spline.length > 0, "[SplineMovementHermiteInterpolatedMetered] Spline %n in curve %s has length 0.", index, self._spline_curve:name())
	end
end

SplineMovementHermiteInterpolatedMetered.draw = function (self, script_drawer, radius, color)
	local pos = self:current_position()

	script_drawer:sphere(pos, radius or 1, color)
end

SplineMovementHermiteInterpolatedMetered.draw_subdivisions = function (self, script_drawer, color)
	for _, spline in ipairs(self._splines) do
		for _, subdivision in ipairs(spline.subdivisions) do
			Hermite.draw(10, script_drawer, Color(255, 0, 0), nil, unpack_unbox(subdivision.points))
		end
	end
end

SplineMovementHermiteInterpolatedMetered.current_position = function (self)
	local current_subdivision = self:_current_spline_subdivision()

	return Hermite.calc_point(self._t, unpack_unbox(current_subdivision.points))
end

SplineMovementHermiteInterpolatedMetered.current_tangent_direction = function (self)
	local current_subdivision = self:_current_spline_subdivision()

	return Hermite.calc_tangent(self._t, unpack_unbox(current_subdivision.points))
end

SplineMovementHermiteInterpolatedMetered._current_spline = function (self)
	return self._splines[self._current_spline_index]
end

SplineMovementHermiteInterpolatedMetered.update = function (self, dt)
	local state = self:move(dt * self._speed)

	return state
end

SplineMovementHermiteInterpolatedMetered.distance = function (self, from_index, from_subdiv, from_spline_t, to_index, to_subdiv, to_spline_t)
	local distance = 0
	local splines = self._splines

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
end

SplineMovementHermiteInterpolatedMetered.speed = function (self)
	return self._speed
end

SplineMovementHermiteInterpolatedMetered._current_spline_subdivision = function (self)
	return self:_current_spline().subdivisions[self._current_subdivision_index]
end

SplineMovementHermiteInterpolatedMetered.move = function (self, delta)
	local current_spline = self:_current_spline()
	local current_subdivision = self:_current_spline_subdivision()
	local current_subdivision_length = current_subdivision.length
	local new_t = self._t + delta / current_subdivision_length

	if new_t > 1 and self._current_spline_index == #self._splines and self._current_subdivision_index == #current_spline.subdivisions then
		self._t = 1
		local remainder = (new_t - 1) * current_subdivision_length
		local moved_distance = delta - remainder
		self._current_spline_curve_distance = self._current_spline_curve_distance + moved_distance

		return "end"
	elseif new_t > 1 then
		self._current_subdivision_index = self._current_subdivision_index + 1

		if self._current_subdivision_index > #current_spline.subdivisions then
			self._current_subdivision_index = 1
			self._current_spline_index = self._current_spline_index + 1
		end

		self._t = 0
		local remainder = (new_t - 1) * current_subdivision_length
		local moved_distance = delta - remainder
		self._current_spline_curve_distance = self._current_spline_curve_distance + moved_distance

		return self:move(remainder)
	elseif new_t <= 0 and self._current_spline_index == 1 and self._current_subdivision_index == 1 then
		self._t = 0
		self._current_spline_curve_distance = 0

		return "start"
	elseif new_t < 0 then
		self._current_subdivision_index = self._current_subdivision_index - 1

		if self._current_subdivision_index == 0 then
			self._current_spline_index = self._current_spline_index - 1
			self._current_subdivision_index = #self:_current_spline().subdivisions
		end

		self._t = 1
		local remainder = new_t * current_subdivision_length
		local moved_distance = delta - remainder
		self._current_spline_curve_distance = self._current_spline_curve_distance + moved_distance

		return self:move(remainder)
	else
		self._t = new_t
		self._current_spline_curve_distance = self._current_spline_curve_distance + delta

		return "moving"
	end
end

SplineMovementHermiteInterpolatedMetered.reset_to_start = function (self)
	self._current_spline_index = 1
	self._current_subdivision_index = 1
	self._t = 0
	self._current_spline_curve_distance = 0
end

SplineMovementHermiteInterpolatedMetered.reset_to_end = function (self)
	local current_spline = self:_current_spline()
	self._current_spline_index = #self._splines
	self._current_subdivision_index = #current_spline.subdivisions
	self._t = 1
	local from_spline_index = 1
	local from_subdivision_index = 1
	local from_t = 0
	local to_spline_index = self._current_spline_index
	local to_subdivision_index = self._current_subdivision_index
	local to_t = self._t
	self._current_spline_curve_distance = self:distance(from_spline_index, from_subdivision_index, from_t, to_spline_index, to_subdivision_index, to_t)
end

SplineMovementHermiteInterpolatedMetered.set_spline_index = function (self, spline_index, subdivision_index, t)
	self._current_spline_index = spline_index
	self._current_subdivision_index = subdivision_index
	self._t = t
	local from_spline_index = 1
	local from_subdivision_index = 1
	local from_t = 0
	self._current_spline_curve_distance = self:distance(from_spline_index, from_subdivision_index, from_t, spline_index, subdivision_index, t)
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

SplineMovementHermiteInterpolatedMetered.current_spline_curve_distance = function (self)
	return self._current_spline_curve_distance
end

return
