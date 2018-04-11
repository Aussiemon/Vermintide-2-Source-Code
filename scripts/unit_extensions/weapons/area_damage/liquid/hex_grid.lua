require("scripts/managers/debug/debug_manager")

HexGrid = class(HexGrid)
HexGrid.init = function (self, center, xy_extents, z_extents, x_cell_size, z_cell_size)
	local x_vector = Vector3.right()
	local y_vector = Vector3.forward()
	local z_vector = Vector3.up()
	local y_cell_size = math.tan(math.pi / 3) * 0.5 * x_cell_size
	local pi_div_3 = math.pi / 3
	local two_pi = math.pi * 2
	self._directions = {
		{
			1,
			0,
			angle = 0
		},
		{
			1,
			-1,
			angle = two_pi - pi_div_3
		},
		{
			0,
			-1,
			angle = two_pi - pi_div_3 * 2
		},
		{
			-1,
			0,
			angle = two_pi - pi_div_3 * 3
		},
		{
			-1,
			1,
			angle = two_pi - pi_div_3 * 4
		},
		{
			0,
			1,
			angle = two_pi - pi_div_3 * 5
		}
	}
	local root = center - x_vector * (xy_extents + 1 + xy_extents * 0.5) * x_cell_size - y_vector * (xy_extents + 1) * y_cell_size - z_vector * (z_extents + 1) * z_cell_size
	self._root_position = Vector3Box(root)
	self._x_cell_size = x_cell_size
	self._y_cell_size = y_cell_size
	self._z_cell_size = z_cell_size
	self._xy_extents = xy_extents
	self._z_extents = z_extents
	self._check_player_units = true

	return 
end
HexGrid.directions = function (self)
	return self._directions
end
HexGrid.find_index = function (self, position)
	local root = self._root_position:unbox()
	local relative_position = position - root
	local x_cell_size = self._x_cell_size
	local y_cell_size = self._y_cell_size
	local z_cell_size = self._z_cell_size
	local j = math.floor(relative_position.y / y_cell_size + 0.5)
	local i = math.floor((relative_position.x - (j - 1) * 0.5 * x_cell_size) / x_cell_size + 0.5)
	local k = math.floor(relative_position.z / z_cell_size + 0.5)

	return i, j, k
end
HexGrid.real_index = function (self, i, j, k)
	local xy_extents = self._xy_extents
	local row_size = xy_extents * 2 + 1
	local layer_size = row_size * row_size

	return i + (j - 1) * row_size + (k - 1) * layer_size
end
HexGrid.ijk = function (self, real_index)
	local xy_extents = self._xy_extents
	local row_size = xy_extents * 2 + 1
	local i = real_index % row_size
	local left = (real_index - i) / row_size
	local j = left % row_size
	left = left - j
	local k = left / row_size

	return i, j + 1, k + 1
end
HexGrid.is_out_of_bounds = function (self, i, j, k)
	local xy_extents = self._xy_extents
	local row_size = xy_extents * 2 + 1

	return i < 0 or row_size <= i or j < 0 or row_size <= j or k < 0
end
HexGrid.find_position = function (self, i, j, k)
	local root = self._root_position:unbox()
	local z = k * self._z_cell_size
	local y = j * self._y_cell_size
	local x = (0.5 * (j - 1) + i) * self._x_cell_size

	return root + Vector3(x, y, z)
end
HexGrid.sample_grid = function (self, samples, z, multiplier)
	local drawer = QuickDrawerStay

	drawer.reset(drawer)

	local xy_extents = self._xy_extents
	local min_i = 1
	local min_j = 1
	local max_i = xy_extents * 2 + 1
	local max_j = xy_extents * 2 + 1
	local root = self._root_position:unbox()
	local min_x = root.x + xy_extents * self._x_cell_size * (1 - multiplier)
	local max_x = root.x + (xy_extents * (1 + 1 * multiplier) + 1) * self._x_cell_size
	local min_y = root.y + xy_extents * self._x_cell_size * (1 - multiplier)
	local max_y = root.y + (xy_extents * (1 + 1 * multiplier) + 1) * self._y_cell_size
	local mth_rnd = Math.random

	local function rnd(min, max)
		return min + mth_rnd() * (max - min)
	end

	local black = Color(0, 0, 0)
	local i_span = max_i - min_i
	local j_span = max_j - min_j
	local render_outside = true

	for index = 1, samples, 1 do
		local point = Vector3(rnd(min_x, max_x), rnd(min_y, max_y), z)
		local i, j, k = self.find_index(self, point)
		local color = nil

		if i < min_i or max_i < i or j < min_j or max_j < j then
			color = render_outside and black
		else
			local i_val = i - min_i
			local j_val = j - min_j
			local r = (i_val % 2 == 0 and (125 * i_val) / i_span) or 125 + (125 * i_val) / i_span
			local g = (j_val % 2 == 0 and (125 * j_val) / j_span) or 125 + (125 * j_val) / j_span
			local b = 0
			color = Color(r, g, b)
		end

		if color then
			drawer.sphere(drawer, point, 0.05, color)
		end
	end

	return 
end

return 
