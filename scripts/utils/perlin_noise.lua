PerlinNoise = class(PerlinNoise)
PerlinNoise.init = function (self, world)
	self._n = 256
	self._permutations = {}
	self._gradients = {}
	self.world = world
	self.world_gui = World.create_world_gui(world, Matrix4x4.identity(), 1, 1, "material", "materials/fonts/gw_fonts")
	self._line_object = World.create_line_object(world, false)

	self.setup(self)

	return 
end
local colors = {
	{
		30,
		30,
		30
	},
	{
		45,
		45,
		45
	},
	{
		60,
		60,
		60
	},
	{
		85,
		85,
		85
	},
	{
		100,
		100,
		100
	},
	{
		115,
		115,
		115
	},
	{
		130,
		130,
		130
	},
	{
		145,
		145,
		145
	},
	{
		160,
		160,
		160
	},
	{
		175,
		175,
		175
	},
	{
		190,
		190,
		190
	},
	{
		205,
		205,
		205
	},
	{
		220,
		220,
		220
	},
	{
		235,
		235,
		235
	},
	{
		255,
		255,
		255
	}
}
PerlinNoise.draw_height = function (self, height, x, y, z, rad)
	local drawer = Managers.state.debug:drawer({
		mode = "lel",
		name = "perlin noise"
	})
	local index = math.clamp(height * 100, -15, 15)
	index = (index + 15) / 2
	index = math.floor(index)

	if index == 0 then
		index = 1
	end

	local color = colors[index]

	drawer.sphere(drawer, Vector3(x, y, z + 0.5), rad or 0.35, Color(color[1], color[2], color[3]))

	return 
end
PerlinNoise.filter_list_using_noise = function (self, list, height_threshold)
	local a, b, c = Script.temp_count()
	local lowest = 0
	local highest = 0

	for i = #list, 1, -1 do
		local pos = list[i]:unbox()
		local x = pos.x
		local y = pos.y
		local height = self.get_height(self, x, y)
		local radius = nil

		if height < height_threshold then
			list[i] = list[#list]
			list[#list] = nil
		else
			radius = 0.8
		end

		if script_data.debug_perlin_noise_spawning then
			self.draw_height(self, height, x, y, pos.z, radius)
		end

		if height < lowest then
			lowest = height
		elseif highest <= height then
			highest = height
		end

		Script.set_temp_count(a, b, c)
	end

	print("Lowest and highest heights are", lowest, highest)

	return list
end
PerlinNoise.normalize = function (self, gradient_x, gradient_y)
	local s = nil
	s = math.sqrt(gradient_x * gradient_x + gradient_y * gradient_y)

	assert(s ~= 0, "dividing by zero is not recommended")

	gradient_x = gradient_x / s
	gradient_y = gradient_y / s

	return gradient_x, gradient_y
end
PerlinNoise.setup = function (self)
	for i = 1, self._n, 1 do
		self._permutations[i] = i
		self._gradients[i] = {
			false,
			false
		}
		local check = true

		repeat
			for j = 1, 2, 1 do
				self._gradients[i][j] = Math.random(-10, 10) * 0.1
				check = check and self._gradients[i][j] == 0
			end
		until not check

		self._gradients[i][1], self._gradients[i][2] = self.normalize(self, self._gradients[i][1], self._gradients[i][2])
	end

	local k, j = nil

	for i = self._n, 1, -1 do
		k = self._permutations[i]
		j = Math.random(self._n)
		self._permutations[i] = self._permutations[j]
		self._permutations[j] = k
	end

	for i = 1, self._n + 2, 1 do
		self._permutations[self._n + i] = self._permutations[i]
		self._gradients[self._n + i] = {
			false,
			false
		}

		for j = 1, 2, 1 do
			self._gradients[self._n + i][j] = self._gradients[i][j]
		end
	end

	return 
end
PerlinNoise.get_height = function (self, x, y)
	local point_x = x
	local point_y = y
	local tx = x + 4096
	local ty = y + 4096
	local p0_x = math.floor(tx) % self._n
	local p1_x = (p0_x + 1) % self._n
	local p0_y = math.floor(ty) % self._n
	local p1_y = (p0_y + 1) % self._n

	if p0_x == 0 then
		p0_x = 1
	end

	if p0_y == 0 then
		p0_y = 1
	end

	if p1_x == 0 then
		p1_x = 1
	end

	if p1_y == 0 then
		p1_y = 1
	end

	local rx0 = tx - math.floor(tx)
	local rx1 = rx0 - 1
	local ry0 = ty - math.floor(ty)
	local ry1 = ry0 - 1
	local i = self._permutations[p0_x]
	local j = self._permutations[p1_x]
	local p00 = self._permutations[i + p0_y]
	local p10 = self._permutations[j + p0_y]
	local p01 = self._permutations[i + p1_y]
	local p11 = self._permutations[j + p1_y]
	local s_curve_x = self.getSCurve(self, rx0)
	local s_curve_y = self.getSCurve(self, ry0)
	local gradient, s, t, u, v = nil
	gradient = self._gradients[p00]
	s = self.at2(self, gradient, rx0, ry0)
	gradient = self._gradients[p10]
	t = self.at2(self, gradient, rx1, ry0)
	gradient = self._gradients[p01]
	u = self.at2(self, gradient, rx0, ry1)
	gradient = self._gradients[p11]
	v = self.at2(self, gradient, rx1, ry1)
	local a = math.lerp(s, t, s_curve_x)
	local b = math.lerp(u, v, s_curve_x)
	local z = math.lerp(a, b, s_curve_y)

	return z
end
PerlinNoise.at2 = function (self, gradient, vec_x, vec_y)
	local arctang = gradient[1] * vec_x + gradient[2] * vec_y

	return arctang
end
PerlinNoise.getSCurve = function (self, p)
	local s_curve = 6 * p^5 - 15 * p^4 + 10 * p^3

	return s_curve
end
PerlinNoise.simulate_points = function (self)
	local drawer = Managers.state.debug:drawer({
		mode = "lel",
		name = "perlin noise"
	})
	local world_gui = self.world_gui
	local m = Matrix4x4.identity()
	local font_size = 0.1
	local font = "gw_arial_16"
	local font_material = "materials/fonts/" .. font
	local lowest = 0
	local highest = 0

	for i = self._lowest_point.x, self._highest_point.x, 1 do
		local lal = i
		i = i + Math.random(-1, 1) / 10

		for j = self._lowest_point.y, self._highest_point.y, 1 do
			local lalal = j
			j = j + Math.random(-1, 1) / 10
			local height = self.get_height(self, i, j)

			if height < lowest then
				lowest = height
			elseif highest < height then
				highest = height
			end

			local index = math.clamp(height * 100, -15, 15)
			local asd = (index + 15) / 2
			index = asd
			index = math.floor(index)

			if index == 0 then
				index = 1
			end

			print(index)

			local color = colors[index]
			j = lalal

			drawer.sphere(drawer, Vector3(lal, lalal, 100), 0.5, Color(color[1], color[2], color[3]))
		end

		i = lal
	end

	print("lowest and highest", lowest, highest)

	return 
end

return 
