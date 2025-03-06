-- chunkname: @foundation/scripts/util/math.lua

local math = math
local math_sqrt, math_cos, math_sin, math_random = math.sqrt, math.cos, math.sin, math.random
local math_max, math_abs, math_acos = math.max, math.abs, math.acos
local pi = math.pi

math.epsilon = 0.001
math.tau = 2 * pi
math.half_pi = 0.5 * pi
math.inverse_sqrt_2 = 1 / math_sqrt(2)
math.degrees_to_radians = math.rad
math.radians_to_degrees = math.deg

math.sign = function (x)
	if x > 0 then
		return 1
	elseif x < 0 then
		return -1
	else
		return 0
	end
end

math.clamp = function (value, min, max)
	if max < value then
		return max
	elseif value < min then
		return min
	else
		return value
	end
end

math.clamp01 = function (value)
	if value > 1 then
		return 1
	elseif value < 0 then
		return 0
	else
		return value
	end
end

local math_clamp = math.clamp

math.lerp = function (a, b, p)
	return a * (1 - p) + b * p
end

local math_lerp = math.lerp

math.lerp_clamped = function (a, b, v)
	return math_lerp(a, b, math.clamp01(v))
end

math.inv_lerp = function (a, b, v)
	return (v - a) / (b - a)
end

math.inv_lerp_clamped = function (a, b, v)
	v = math.clamp(v, a, b)

	return math.inv_lerp(a, b, v)
end

math.remap = function (imin, imax, omin, omax, v)
	return (v - imin) / (imax - imin) * (omax - omin) + omin
end

math.remap_clamped = function (imin, imax, omin, omax, v)
	return math.clamp01((v - imin) / (imax - imin)) * (omax - omin) + omin
end

math.radian_lerp = function (a, b, p)
	local two_pi = pi * 2

	return a + p * (((b - a) % two_pi + pi) % two_pi - pi)
end

math.angle_lerp = function (a, b, p)
	return a + (((b - a) % 360 + 540) % 360 - 180) * p
end

math.sirp = function (a, b, t)
	local p = 0.5 + 0.5 * math_cos((1 + t) * pi)

	return math_lerp(a, b, p)
end

math.auto_lerp = function (index_1, index_2, val_1, val_2, val)
	local t = (val - index_1) / (index_2 - index_1)

	return math.clamp(math_lerp(val_1, val_2, t), val_1, val_2)
end

math.round_with_precision = function (value, precision)
	local mul = 10^(precision or 0)

	return math.floor(value * mul + 0.5) / mul
end

math.round = function (value)
	return math.floor(value + 0.5)
end

math.round_to_closest_multiple = function (value, multiple)
	multiple = multiple or 1

	local modulo = value % multiple
	local middle_point = multiple / 2

	if modulo <= middle_point then
		return value - modulo
	end

	return value + multiple - modulo
end

math.smoothstep = function (value, min, max)
	fassert(min ~= max, "Division by zero.")

	local x = math_clamp((value - min) / (max - min), 0, 1)

	return x * x * x * (x * (x * 6 - 15) + 10)
end

Math.random_range = function (min, max)
	return min + math_random() * (max - min)
end

math.next_random_range = function (seed, min, max)
	local next_seed, value = Math.next_random(seed)

	return next_seed, min + value * (max - min)
end

math.point_is_inside_2d_box = function (pos, lower_left_corner, size)
	return pos[1] > lower_left_corner[1] and pos[1] < lower_left_corner[1] + size[1] and pos[2] > lower_left_corner[2] and pos[2] < lower_left_corner[2] + size[2]
end

math.box_overlap_box = function (a_pos, a_size, b_pos, b_size)
	return a_pos[1] + a_size[1] >= b_pos[1] and b_pos[1] + b_size[1] >= a_pos[1] and a_pos[2] + a_size[2] >= b_pos[2] and b_pos[2] + b_size[2] >= a_pos[2]
end

math.point_is_inside_aabb = function (pos, aabb_pos, aabb_half_extents)
	return not (pos[1] < aabb_pos[1] - aabb_half_extents[1]) and not (pos[1] > aabb_pos[1] + aabb_half_extents[1]) and not (pos[2] < aabb_pos[2] - aabb_half_extents[2]) and not (pos[2] > aabb_pos[2] + aabb_half_extents[2]) and not (pos[3] < aabb_pos[3] - aabb_half_extents[3]) and not (pos[3] > aabb_pos[3] + aabb_half_extents[3])
end

math.point_is_inside_box = function (pos, box_pose, box_half_extents)
	local to_local_matrix = Matrix4x4.inverse(box_pose)
	local local_pos = Matrix4x4.transform(to_local_matrix, pos)

	return math.point_is_inside_aabb(local_pos, Vector3.zero(), box_half_extents)
end

math.point_is_inside_oobb = function (pos, oobb_pose, oobb_radius)
	local to_local_matrix = Matrix4x4.inverse(oobb_pose)
	local local_pos = Matrix4x4.transform(to_local_matrix, pos)

	if local_pos.x > -oobb_radius[1] and local_pos.x < oobb_radius[1] and local_pos.y > -oobb_radius[2] and local_pos.y < oobb_radius[2] and local_pos.z > -oobb_radius[3] and local_pos.z < oobb_radius[3] then
		return true
	else
		return false
	end
end

math.point_is_inside_2d_triangle = function (pos, p1, p2, p3)
	local pa = p1 - pos
	local pb = p2 - pos
	local pc = p3 - pos
	local pab_n = Vector3.cross(pa, pb)
	local pbc_n = Vector3.cross(pb, pc)

	if Vector3.dot(pab_n, pbc_n) < 0 then
		return false
	end

	local pca_n = Vector3.cross(pc, pa)
	local best_normal = Vector3.dot(pab_n, pab_n) > Vector3.dot(pbc_n, pbc_n) and pab_n or pbc_n
	local dot_product = Vector3.dot(best_normal, pca_n)

	if dot_product < 0 then
		return false
	elseif dot_product > 0 then
		return true
	else
		local min_p = Vector3.min(pa, Vector3.min(pb, pc))
		local max_p = Vector3.max(pa, Vector3.max(pb, pc))

		return min_p.x <= 0 and min_p.y <= 0 and max_p.x >= 0 and max_p.y >= 0
	end
end

math.point_is_inside_view = function (pos, view_position, view_rotation, vertical_fov_rad, horizontal_fov_rad)
	local camera_forward = Quaternion.forward(view_rotation)
	local to_pos_dir = Vector3.normalize(pos - view_position)
	local dot = Vector3.dot(to_pos_dir, camera_forward)
	local is_infront = dot > 0

	if is_infront then
		local camera_right = Quaternion.right(view_rotation)
		local camera_up = Quaternion.up(view_rotation)
		local c_x = Vector3.dot(to_pos_dir, camera_right)
		local c_y = dot
		local c_z = Vector3.dot(to_pos_dir, camera_up)
		local dot_xy = c_y
		local c_to_pos_dir_length_xy = math_sqrt(c_x * c_x + c_y * c_y)

		if c_to_pos_dir_length_xy == 0 then
			return false
		end

		local cos_xy = dot_xy / c_to_pos_dir_length_xy
		local yaw = math.acos(cos_xy)

		if yaw <= horizontal_fov_rad / 2 then
			local dot_uz = c_to_pos_dir_length_xy
			local to_pos_dir_length_uz = math_sqrt(c_to_pos_dir_length_xy * c_to_pos_dir_length_xy + c_z * c_z)
			local cos_uz = dot_uz / to_pos_dir_length_uz
			local pitch = math.acos(cos_uz)

			if pitch <= vertical_fov_rad / 2 then
				return true
			end

			return false
		end
	end

	return false
end

math.cartesian_to_polar = function (x, y)
	fassert(x ~= 0 and y ~= 0, "Can't convert a zero vector to polar coordinates")

	local radius = math_sqrt(x * x + y * y)
	local theta = math.atan(y / x) * (180 / math.pi)

	if x < 0 then
		theta = theta + 180
	elseif y < 0 then
		theta = theta + 360
	end

	return radius, theta
end

math.circular_to_square_coordinates = function (pos)
	local x, y = pos.x, pos.y
	local w = x * x - y * y
	local k = 4 * math.inverse_sqrt_2
	local u, v = x * k, y * k

	return Vector2(0.5 * (math_sqrt(math_max(2 + u + w, 0)) - math_sqrt(math_max(2 - u + w, 0))), 0.5 * (math_sqrt(math_max(2 + v - w, 0)) - math_sqrt(math_max(2 - v - w, 0))))
end

math.polar_to_cartesian = function (radius, theta_degrees)
	local theta = theta_degrees * (pi / 180)

	return radius * math_cos(theta), radius * math_sin(theta)
end

math.catmullrom = function (t, p0, p1, p2, p3)
	return 0.5 * (2 * p1 + (-p0 + p2) * t + (2 * p0 - 5 * p1 + 4 * p2 - p3) * t * t + (-p0 + 3 * p1 - 3 * p2 + p3) * t * t * t)
end

math.closest_position = function (p0, p1, p2)
	local p0_p1_dist_sq = Vector3.distance_squared(p0, p1)
	local p0_p2_dist_sq = Vector3.distance_squared(p0, p2)

	if p0_p1_dist_sq <= p0_p2_dist_sq then
		return p1
	else
		return p2
	end
end

math.dot2D = function (v1, v2)
	return v1.x * v2.x + v1.y * v2.y
end

Geometry = Geometry or {}

Geometry.ccw = function (a, b, c)
	return (b.x - a.x) * (c.y - a.y) > (b.y - a.y) * (c.x - a.x)
end

local function left_to_right(left, right)
	return left.x < right.x
end

local ccw = Geometry.ccw
local dot2D = math.dot2D

Geometry.convex_hull = function (points, hull)
	local num_points = #points

	if num_points == 0 then
		return hull, 0
	end

	table.sort(points, left_to_right)

	local num = 0

	for i = 1, num_points do
		local pt = points[i]

		while num >= 2 and not ccw(hull[num - 1], hull[num], pt) do
			num = num - 1
		end

		num = num + 1
		hull[num] = pt
	end

	local t = num + 1

	for i = num_points, 1, -1 do
		local pt = points[i]

		while t <= num and not ccw(hull[num - 1], hull[num], pt) do
			num = num - 1
		end

		num = num + 1
		hull[num] = pt
	end

	num = num - 1

	return hull, num
end

Geometry.convex_hull_tracking = function (points, hull, hull_indexes)
	local num_points = #points

	if num_points == 0 then
		return hull, 0
	end

	table.sort(points, left_to_right)

	local num = 0

	for i = 1, num_points do
		local pt = points[i]

		while num >= 2 and not ccw(hull[num - 1], hull[num], pt) do
			num = num - 1
		end

		num = num + 1
		hull[num] = pt
		hull_indexes[num] = i
	end

	local t = num + 1

	for i = num_points, 1, -1 do
		local pt = points[i]

		while t <= num and not ccw(hull[num - 1], hull[num], pt) do
			num = num - 1
		end

		num = num + 1
		hull[num] = pt
		hull_indexes[num] = i
	end

	num = num - 1

	return hull, num, hull_indexes
end

Geometry.concave_hull = function (points, hull)
	local num_points = #points

	if num_points == 0 then
		return hull, 0
	end

	table.sort(points, left_to_right)

	local num = 0

	for i = 1, num_points do
		local pt = points[i]

		while num >= 2 and not ccw(hull[num - 1], hull[num], pt) and not (dot2D(hull[num] - hull[num - 1], pt - hull[num]) > 0.1) do
			num = num - 1
		end

		num = num + 1
		hull[num] = pt
	end

	local upper_starts_num = num
	local t = num + 1

	for i = num_points, 1, -1 do
		local pt = points[i]

		while t <= num and not ccw(hull[num - 1], hull[num], pt) and not (dot2D(hull[num] - hull[num - 1], pt - hull[num]) > 0.1) do
			num = num - 1
		end

		num = num + 1
		hull[num] = pt
	end

	num = num - 1

	return hull, num, upper_starts_num
end

Geometry.is_point_inside_triangle = function (point_on_plane, tri_a, tri_b, tri_c)
	local pa = tri_a - point_on_plane
	local pb = tri_b - point_on_plane
	local pc = tri_c - point_on_plane
	local pab_n = Vector3.cross(pa, pb)
	local pbc_n = Vector3.cross(pb, pc)

	if Vector3.dot(pab_n, pbc_n) < 0 then
		return false
	end

	local pca_n = Vector3.cross(pc, pa)
	local best_normal = Vector3.dot(pab_n, pab_n) > Vector3.dot(pbc_n, pbc_n) and pab_n or pbc_n
	local dot_product = Vector3.dot(best_normal, pca_n)

	if dot_product < 0 then
		return false
	elseif dot_product > 0 then
		return true
	else
		local min_p = Vector3.min(pa, Vector3.min(pb, pc))
		local max_p = Vector3.max(pa, Vector3.max(pb, pc))

		return min_p.x <= 0 and min_p.y <= 0 and min_p.z <= 0 and max_p.x >= 0 and max_p.y >= 0 and max_p.z >= 0
	end
end

local Vector3_dot = Vector3 and Vector3.dot

Geometry.closest_point_on_line = function (p, p1, p2)
	local diff = p - p1
	local dir = p2 - p1
	local dot1 = Vector3_dot(diff, dir)

	if dot1 <= 0 then
		return p1
	end

	local dot2 = Vector3_dot(dir, dir)

	if dot2 <= dot1 then
		return p2
	end

	local t = dot1 / dot2

	return p1 + t * dir
end

Geometry.closest_point_on_line = EngineOptimized.closest_point_on_line

Geometry.closest_point_on_polyline = function (point, points, start_index, end_index)
	local vector3_distance_squared = Vector3.distance_squared
	local closest_point_on_line = Geometry.closest_point_on_line

	start_index = start_index or 1
	end_index = end_index or #points

	local shortest_distance = math.huge
	local result_position, result_index

	for i = start_index, end_index - 1 do
		local p1 = points[i]
		local p2 = points[i + 1]
		local projected_point = closest_point_on_line(point, p1, p2)
		local distance = vector3_distance_squared(projected_point, point)

		if distance < shortest_distance then
			shortest_distance = distance
			result_position = projected_point
			result_index = i
		end
	end

	return result_position, result_index
end

Intersect = Intersect or {}

Intersect.ray_line = function (ray_from, ray_direction, line_point_a, line_point_b)
	local distance_along_ray, normalized_distance_along_line = Intersect.line_line(ray_from, ray_from + ray_direction, line_point_a, line_point_b)

	if distance_along_ray == nil then
		return nil, nil
	elseif distance_along_ray < 0 then
		return nil, nil
	else
		return distance_along_ray, normalized_distance_along_line
	end
end

Intersect.ray_box = function (from, direction, pose, radius)
	local is_ray_origin_inside_box = Math.point_in_box(from, pose, radius)

	if is_ray_origin_inside_box then
		return 0
	end

	local distance_along_ray = Math.ray_box_intersection(from, direction, pose, radius)
	local is_box_missed_by_ray = distance_along_ray < 0

	if is_box_missed_by_ray then
		return nil
	end

	return distance_along_ray
end

Intersect.line_line = function (line_a_pt1, line_a_pt2, line_b_pt1, line_b_pt2)
	local line_a_vector = line_a_pt2 - line_a_pt1
	local line_b_vector = line_b_pt2 - line_b_pt1
	local a = Vector3.dot(line_a_vector, line_a_vector)
	local e = Vector3.dot(line_b_vector, line_b_vector)
	local b = Vector3.dot(line_a_vector, line_b_vector)
	local d = a * e - b * b

	if d < 0.001 then
		return nil, nil
	end

	local r = line_a_pt1 - line_b_pt1
	local c = Vector3.dot(line_a_vector, r)
	local f = Vector3.dot(line_b_vector, r)
	local normalized_distance_along_line_a = (b * f - c * e) / d
	local normalized_distance_along_line_b = (a * f - b * c) / d

	return normalized_distance_along_line_a, normalized_distance_along_line_b
end

Intersect.ray_segment = function (ray_from, ray_direction, segment_start, segment_end)
	local distance_along_ray, normalized_distance_along_line = Intersect.ray_line(ray_from, ray_direction, segment_start, segment_end)
	local is_line_parallel_to_or_behind_ray = distance_along_ray == nil

	if is_line_parallel_to_or_behind_ray then
		return nil
	end

	local is_intersection_inside_segment = normalized_distance_along_line >= 0 and normalized_distance_along_line <= 1

	if is_intersection_inside_segment then
		return distance_along_ray, normalized_distance_along_line
	else
		return nil, nil
	end
end

Intersect.ray_circle = function (ray_from, ray_direction, circle_position, circle_radius)
	local ray_coord = ray_from - circle_position
	local rx, ry = Vector3.to_elements(ray_coord)
	local dx, dy = Vector3.to_elements(ray_direction)
	local a = dx * dx + dy * dy
	local a2 = a * 2
	local b = 2 * (dx * rx + dy * ry)
	local c = rx * rx + ry * ry - circle_radius * circle_radius
	local discriminant = b * b - 2 * a2 * c

	if discriminant < 0 then
		return nil
	end

	local sqrt_discriminant = math.sqrt(discriminant)
	local t1 = (-b + sqrt_discriminant) / a2
	local pos1 = ray_from + Vector3(dx * t1, dy * t1, 0)

	if sqrt_discriminant < math.epsilon then
		return pos1, pos1
	end

	local t2 = (-b - sqrt_discriminant) / a2
	local pos2 = ray_from + Vector3(dx * t2, dy * t2, 0)

	return pos1, pos2
end

math.ease_exp = function (t)
	if t < 0.5 then
		return 0.5 * 2^(20 * (t - 0.5))
	end

	return 1 - 0.5 * 2^(20 * (0.5 - t))
end

math.ease_in_exp = function (t)
	return 2^(10 * (t - 1))
end

math.ease_out_exp = function (t)
	return 1 - 2^(-10 * t)
end

math.ease_out_sine = function (t)
	return math.sin(t * math.half_pi)
end

math.easeCubic = function (t)
	t = t * 2

	if t < 1 then
		return 0.5 * t * t * t
	end

	t = t - 2

	return 0.5 * t * t * t + 1
end

math.linear = function (t)
	return t
end

math.linear_inv = function (t)
	return t
end

math.easeInCubic = function (t)
	return t * t * t
end

math.easeOutCubic = function (t)
	t = t - 1

	return t * t * t + 1
end

math.easeOutCubicInv = function (t)
	return 1 - math.pow(1 - t, 0.3333333333333333)
end

math.ease_out_quad = function (t)
	return -1 * t * (t - 2)
end

math.ease_in_quart = function (t)
	return t * t * t * t
end

math.ease_out_quart = function (t)
	return 1 - math.pow(1 - t, 4)
end

math.ease_out_quart_inv = function (t)
	return math.pow(-t + 1, 0.25) + 1
end

math.ease_in_out_quart = function (t)
	return t < 0.5 and 8 * t * t * t * t or 1 - (-2 * t + 2)^4 / 2
end

local math_ease_cubic = math.easeCubic

math.ease_pulse = function (t)
	if t < 0.5 then
		return math_ease_cubic(2 * t)
	else
		return math_ease_cubic(2 - 2 * t)
	end
end

math.ease_in_circ = function (t)
	return 1 - math.sqrt(1 - t^2)
end

math.ease_out_circ = function (t)
	return math.sqrt(1 - (t - 1)^2)
end

math.ease_in_back = function (t)
	local c1 = 1.70158
	local c3 = c1 + 1

	return c3 * t * t * t - c1 * t * t
end

math.ease_out_back = function (t)
	c1 = 1.70158
	c3 = c1 + 1

	return 1 + c3 * (t - 1)^3 + c1 * (t - 1)^2
end

math.ease_in_out_back = function (t)
	local c1 = 1.70158
	local c2 = c1 * 1.525

	return t < 0.5 and (2 * t)^2 * ((c2 + 1) * 2 * t - c2) / 2 or ((2 * t - 2)^2 * ((c2 + 1) * (t * 2 - 2) + c2) + 2) / 2
end

math.easeOutQuint = function (t)
	return 1 - (1 - t)^5
end

math.easeInQuint = function (t)
	return t * t * t * t * t
end

math.bounce = function (t)
	return math.abs(math_sin(6.28 * (t + 1) * (t + 1)) * (1 - t))
end

math.ease_out_elastic = function (t)
	local p = 0
	local a = 1

	if t == 0 then
		return 0
	end

	if t == 1 then
		return 1
	end

	if p == 0 then
		p = 0.3
	end

	local s

	if a < 1 then
		a = 1
		s = p / 4
	else
		s = p / (2 * math.pi) * math.asin(1 / a)
	end

	return a * 2^(-10 * t) * math_sin((t * 1 - s) * (2 * math.pi) / p) + 1
end

math.easeInOutCubic = function (t)
	return t < 0.5 and 4 * t * t * t or 1 - math.pow(-2 * t + 2, 3) / 2
end

math.rand_utf8_string = function (string_length, ignore_chars)
	fassert(string_length > 0, "String length passed to math.rand_string has to be greater than 0")

	ignore_chars = ignore_chars or {
		"\"",
		"'",
		"\\",
		" ",
	}

	local array = {}

	for i = 1, string_length do
		local char

		while not char or table.contains(ignore_chars, char) do
			char = string.char(math_random(32, 126))
		end

		array[i] = char
	end

	return table.concat(array)
end

math.uuid = function ()
	local random = math_random

	return string.format("%08x-%04x-4%03x-%x%03x-%012x", random(0, 4294967295), random(0, 65535), random(0, 4095), random(0, 11), random(0, 4095), random(0, 281474976710655))
end

math.get_uniformly_random_point_inside_sector = function (radius1, radius2, angle1, angle2)
	local radius1_squared = radius1 * radius1
	local radius2_squared = radius2 * radius2
	local angle = angle1 + (angle2 - angle1) * math_random()
	local r = math_sqrt(radius1_squared + (radius2_squared - radius1_squared) * math_random())

	return r * math_sin(angle), r * math_cos(angle)
end

math.get_uniformly_random_point_inside_sector_seeded = function (seed, radius1, radius2, angle1, angle2)
	local radius1_squared = radius1 * radius1
	local radius2_squared = radius2 * radius2
	local rnd1, rnd2

	seed, rnd1 = Math.next_random(seed)
	seed, rnd2 = Math.next_random(seed)

	local angle = angle1 + (angle2 - angle1) * rnd1
	local r = math.sqrt(radius1_squared + (radius2_squared - radius1_squared) * rnd2)
	local dx = r * math.sin(angle)
	local dy = r * math.cos(angle)

	return seed, dx, dy
end

math.get_random_point_inside_box_seeded = function (seed, box_pose, bounds)
	local rnd_x, rnd_y, rnd_z, x, y, z

	seed, rnd_x = Math.next_random(seed)
	seed, rnd_y = Math.next_random(seed)
	seed, rnd_z = Math.next_random(seed)
	x = math.lerp(-bounds[1], bounds[1], rnd_x)
	y = math.lerp(-bounds[2], bounds[2], rnd_y)
	z = math.lerp(-bounds[3], bounds[3], rnd_z)

	local local_pos = Matrix4x4.transform(box_pose, Vector3(x, y, z))

	return seed, local_pos
end

math.random_seed = function ()
	return Math.random(2147483647)
end

math.distance_2d = function (x1, y1, x2, y2)
	return ((x2 - x1)^2 + (y2 - y1)^2)^0.5
end

math.diststance_3d = function (x1, y1, z1, x2, y2, z2)
	return ((x2 - x1)^2 + (y2 - y1)^2 + (z2 - z1)^2)^0.5
end

math.angle = function (x1, y1, x2, y2)
	return math.atan2(y2 - y1, x2 - x1)
end

math.index_wrapper = function (index, max_index)
	return (index - 1) % max_index + 1
end

math.wrap_index_between = function (index, from, to)
	if to < from then
		from, to = to, from
	end

	local d_max = to - from
	local d_idx = index - from

	return from + d_idx % (d_max + 1)
end

math.stride_index = function (index, stride, optional_in_stride_offset)
	optional_in_stride_offset = optional_in_stride_offset or 1

	return (index - 1) * stride + 1 + (optional_in_stride_offset - 1)
end

math.value_inside_range = function (value, min, max)
	return min <= value and value <= max
end

math.quat_angle = function (from, to)
	local dot = math_abs(Quaternion.dot(from, to))
	local target_angle = 0

	if dot < 1 then
		target_angle = 2 * math_acos(dot)
	end

	return target_angle
end

local function _calculate_distributed_point_ranks(positions, n, forward, right, center, out_ranks, out_rank_lookup, out_forward_distance_lookup)
	local rank_precision = 0.8

	for i = 1, n do
		local position = positions[i]
		local delta_pos = Vector3.flat(position - center)
		local projected_right_distance = Vector3.dot(delta_pos, right)
		local rank_key = math.floor(projected_right_distance / rank_precision + 0.5) * rank_precision
		local rank = out_ranks[rank_key]

		if not rank then
			rank = FrameTable.alloc_table()
			out_ranks[rank_key] = rank
			out_rank_lookup[#out_rank_lookup + 1] = rank_key
		end

		out_forward_distance_lookup[i] = Vector3.dot(delta_pos, forward)
		rank[#rank + 1] = i
	end
end

local function _match_rank_counts(left_rank_array, left_rank_lookup, left_sort_lookup, right_rank_array, right_rank_lookup, right_sort_lookup)
	local left_rank_n = #left_rank_lookup
	local right_rank_n = #right_rank_lookup
	local min_rank_n = left_rank_n <= right_rank_n and left_rank_n or right_rank_n

	for rank_i = 1, min_rank_n do
		local left_rank = left_rank_array[left_rank_lookup[rank_i]]
		local right_rank = right_rank_array[right_rank_lookup[rank_i]]

		if not left_rank or not right_rank then
			local rank_array = left_rank and left_rank_array or right_rank_array
			local rank_lookup = left_rank and left_rank_lookup or right_rank_lookup
			local sort_lookup = left_rank and left_sort_lookup or right_sort_lookup

			for remaining_i = rank_i, #rank_lookup do
				local other_rank = rank_array[rank_lookup[remaining_i]]

				table.sort(other_rank, function (a, b)
					return sort_lookup[a] > sort_lookup[b]
				end)
			end

			break
		end

		local left_n = #left_rank
		local right_n = #right_rank
		local smaller_n, larger_n = left_n, right_n
		local smaller_rank, smaller_rank_array, smaller_rank_lookup, smaller_sort_lookup

		if left_n <= right_n then
			smaller_rank = left_rank
			smaller_rank_array = left_rank_array
			smaller_rank_lookup = left_rank_lookup
			smaller_sort_lookup = left_sort_lookup
		else
			smaller_n, larger_n = larger_n, smaller_n
			smaller_rank = right_rank
			smaller_rank_array = right_rank_array
			smaller_rank_lookup = right_rank_lookup
			smaller_sort_lookup = right_sort_lookup
		end

		while smaller_n < larger_n do
			local next_rank = smaller_rank_array[smaller_rank_lookup[rank_i + 1]]
			local next_rank_n = #next_rank

			if larger_n >= smaller_n + next_rank_n then
				for i = 1, next_rank_n do
					smaller_n = smaller_n + 1
					smaller_rank[smaller_n] = next_rank[i]
				end

				table.remove(smaller_rank_lookup, rank_i + 1)
			else
				table.sort(next_rank, function (a, b)
					return smaller_sort_lookup[a] > smaller_sort_lookup[b]
				end)

				for i = next_rank_n, next_rank_n - (larger_n - smaller_n) + 1, -1 do
					smaller_n = smaller_n + 1
					smaller_rank[smaller_n] = next_rank[i]
					next_rank[i] = nil
				end
			end
		end

		table.sort(left_rank, function (a, b)
			return left_sort_lookup[a] > left_sort_lookup[b]
		end)
		table.sort(right_rank, function (a, b)
			return right_sort_lookup[a] > right_sort_lookup[b]
		end)
	end
end

math.distributed_point_matching = function (source_positions, target_positions, out_indices, use_rows)
	local num_points = math.min(#source_positions, #target_positions)

	if num_points <= 0 then
		return
	end

	local source_center = Vector3.zero()
	local target_center = Vector3.zero()

	for i = 1, num_points do
		source_center = source_center + source_positions[i]
		target_center = target_center + target_positions[i]
	end

	source_center = source_center / num_points
	target_center = target_center / num_points

	local forward = Vector3.normalize(Vector3.flat(target_center - source_center))
	local right = Vector3.cross(forward, Vector3.up())

	if use_rows then
		forward, right = right, forward
	end

	local out_source_ranks = FrameTable.alloc_table()
	local out_source_rank_lookup = FrameTable.alloc_table()
	local out_source_forward_distance_lookup = FrameTable.alloc_table()

	_calculate_distributed_point_ranks(source_positions, num_points, forward, right, source_center, out_source_ranks, out_source_rank_lookup, out_source_forward_distance_lookup)
	table.sort(out_source_rank_lookup)

	local out_target_ranks = FrameTable.alloc_table()
	local out_target_rank_lookup = FrameTable.alloc_table()
	local out_target_forward_distance_lookup = FrameTable.alloc_table()

	_calculate_distributed_point_ranks(target_positions, num_points, forward, right, target_center, out_target_ranks, out_target_rank_lookup, out_target_forward_distance_lookup)
	table.sort(out_target_rank_lookup)
	_match_rank_counts(out_source_ranks, out_source_rank_lookup, out_source_forward_distance_lookup, out_target_ranks, out_target_rank_lookup, out_target_forward_distance_lookup)

	local num_ranks = #out_source_rank_lookup

	for rank_i = 1, num_ranks do
		local source_rank = out_source_ranks[out_source_rank_lookup[rank_i]]
		local target_rank = out_target_ranks[out_target_rank_lookup[rank_i]]
		local rank_n = #source_rank

		for inline_i = 1, rank_n do
			local source_index = source_rank[inline_i]
			local target_index = target_rank[inline_i]

			out_indices[source_index] = target_index
		end
	end

	return num_points
end
