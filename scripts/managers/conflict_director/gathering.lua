-- chunkname: @scripts/managers/conflict_director/gathering.lua

Gathering = class(Gathering)

Gathering.init = function (self, nav_world, traverse_logic, start_pos)
	start_pos = start_pos or Vector3(0, 0, 0)
	self.traverse_logic = traverse_logic
	self.balls = {}
	self.static_units = {}
	self.num_balls = 0
	self.dogpiled_attackers_on_unit = {}
	self.selected_ball = nil
	self.debug_draw = false
	self.nav_world = nav_world
	self.ball_broadphase = Broadphase(1, 128)
	self.lookup_broadphase_id = {}
	self.target_unit_to_ball_lookup = {}
	self.version = "fast"
	self.last_index = 1
end

local DEBUG_SIDE_COLORS = {
	"red",
	"blue",
	"green",
	"yellow",
}

Gathering.write_dogpiled_attackers = function (self, dogpiled_attackers_on_unit)
	local t = ""
	local sides = Managers.state.side:sides()

	for i = 1, #sides do
		local side = sides[i]
		local units = side._units
		local side_id = side.side_id

		for i = 1, #units do
			local unit = units[i]
			local color_name = DEBUG_SIDE_COLORS[side_id] or "white"
			local c = Colors.get(color_name)
			local pos = POSITION_LOOKUP[unit]
			local bb = BLACKBOARDS[unit]
			local breed = bb and bb.breed

			if breed and not breed.is_player then
				local attacker_list = dogpiled_attackers_on_unit[unit]

				if attacker_list and next(attacker_list) then
					t = t .. " | ("

					local first = true

					for attacker_unit, b in pairs(attacker_list) do
						t = t .. (first and "" or ", ") .. tostring(Unit.get_data(attacker_unit, "unique_id"))
						first = false
					end

					t = t .. ") -> u" .. tostring(Unit.get_data(unit, "unique_id"))
				end

				if false then
					-- Nothing
				end
			end
		end
	end

	Debug.text("Dogpiled: %s", t)
end

Gathering.draw = function (self)
	if script_data.debug_gathering then
		Debug.text("balls=%d, bchecks=%d, uchecks=%d", self.num_balls, self.num_boid_checks or 0, self.num_unit_checks or 0)
	end

	local dogpiled_attackers_on_unit = self.dogpiled_attackers_on_unit
	local balls = self.balls
	local col = Color(0, 200, 200)
	local static_col = Color(70, 200, 0)
	local s = ""

	for i = 1, self.num_balls do
		local ball = balls[i]
		local pos = ball.pos
		local color_name = DEBUG_SIDE_COLORS[ball.side_id] or "white"
		local c = Colors.get(color_name)
		local ball_pos = Vector3(pos[1], pos[2], pos[3] + 0.01)

		QuickDrawer:circle(ball_pos, ball.rad, Vector3.up(), c)

		if ball.target_unit and ball.owner_unit then
			local owner_pos = POSITION_LOOKUP[ball.owner_unit]

			QuickDrawer:line(ball_pos, owner_pos, c)
		end

		local attacker_list = dogpiled_attackers_on_unit[ball.owner_unit]
		local num_dogpiled = attacker_list and table.size(attacker_list) or 0

		s = s .. " | " .. ball.id .. "(" .. num_dogpiled .. ")"
	end

	if script_data.debug_gathering then
		Debug.text("Balls: %s", s)
	end

	if self.version == "fast" and script_data.debug_gathering then
		self:write_dogpiled_attackers(dogpiled_attackers_on_unit)
	end
end

Gathering.respawn_balls = function (self, pos, target_unit)
	for i = 1, 100 do
		self:add_ball(pos + Vector3(math.random() * 10 - 5, math.random() * 10 - 5, 0), math.random() + 0.25, nil, target_unit)
	end
end

Gathering.add_static_ball = function (self, pos, rad, unit)
	local ball = self:add_ball(pos, rad, unit, nil, true)

	self.static_units[unit] = ball
end

Gathering.remove_static_ball = function (self, unit)
	local id = self.static_units[unit].id

	self:remove_ball(id)

	self.static_units[unit] = nil
end

Gathering.add_ball = function (self, pos, rad, owner_unit, target_unit, is_static)
	fassert(owner_unit ~= target_unit, "Wut?!? can't have yourself as your target")

	local balls = self.balls
	local id = self.num_balls + 1
	local side = Managers.state.side.side_by_unit[owner_unit] or Managers.state.side:sides(1)
	local broadphase_id = self.version == "fast" and Broadphase.add(self.ball_broadphase, nil, pos, rad) or nil
	local ball = {
		id = id,
		pos = {
			pos.x,
			pos.y,
			pos.z,
		},
		last_pos = {
			pos.x,
			pos.y,
			pos.z,
		},
		rad = rad,
		owner_unit = owner_unit,
		target_unit = target_unit,
		side_id = side.side_id,
		is_static = is_static,
		broadphase_id = broadphase_id,
	}

	balls[id] = ball
	self.num_balls = id
	self.target_unit_to_ball_lookup[target_unit] = ball
	self.lookup_broadphase_id[broadphase_id] = ball

	local dogpiled_attackers = self.dogpiled_attackers_on_unit[target_unit]

	if not dogpiled_attackers then
		self.dogpiled_attackers_on_unit[target_unit] = {
			[owner_unit] = ball,
		}

		return ball
	end

	dogpiled_attackers[owner_unit] = ball

	return ball
end

Gathering.remove_ball = function (self, ball)
	if ball.destroyed then
		return
	end

	local attacker_list = self.dogpiled_attackers_on_unit[ball.target_unit]

	attacker_list[ball.owner_unit] = nil

	local balls = self.balls
	local id = ball.id

	self.target_unit_to_ball_lookup[ball.target_unit] = nil

	local b_id = ball.broadphase_id

	if self.version == "fast" then
		Broadphase.remove(self.ball_broadphase, b_id)
	end

	self.lookup_broadphase_id[b_id] = nil

	local num_balls = self.num_balls

	ball.destroyed = true

	local replace_ball = balls[num_balls]

	balls[id] = replace_ball
	replace_ball.id = id
	balls[num_balls] = nil
	self.num_balls = num_balls - 1
end

Gathering.release_attacking_balls = function (self, unit)
	return
end

Gathering.notify_attackers = function (self, unit)
	notify_attackers(unit, self.dogpiled_attackers_on_unit)
end

function notify_attackers(unit, dogpiled_attackers_on_unit)
	local dogpiled_attackers = dogpiled_attackers_on_unit[unit]

	if not dogpiled_attackers then
		return
	end

	for attacker_unit, ball in pairs(dogpiled_attackers) do
		fassert(attacker_unit ~= unit, "Waat, unit is enemy of itself?")

		local ai_slot_extension = ScriptUnit.has_extension(attacker_unit, "ai_slot_system")

		if ai_slot_extension then
			ai_slot_extension:_detach_from_ai_slot("notify_attackers")
		end
	end

	table.clear(dogpiled_attackers)
end

local function do_circles_overlap(x1, y1, r1, x2, y2, r2)
	return (x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2) <= (r1 + r2) * (r1 + r2)
end

local result_table = {}

Gathering.overlap_update = function (self, t, dt)
	local broadphase_query = AiUtils.broadphase_query

	for i = 1, self.num_balls do
		local num_ai_units = broadphase_query(position, 3, result_table)
	end
end

Gathering.slot_vs_slot_overlap = function (self, pos, rad, pos2, rad2, ball1, ball2)
	local dist = Vector3.distance(Vector3(pos[1], pos[2], 0), Vector3(pos2[1], pos2[2], 0))

	if dist < 0.001 then
		pos[1] = pos[1] - rad * 0.1
		pos2[2] = pos2[2] - rad * 0.1

		return
	end

	local overlap = (dist - rad - rad2) * 0.5

	if overlap < 0 then
		pos[1] = pos[1] - overlap * (pos[1] - pos2[1]) / dist
		pos[2] = pos[2] - overlap * (pos[2] - pos2[2]) / dist
		pos2[1] = pos2[1] + overlap * (pos[1] - pos2[1]) / dist
		pos2[2] = pos2[2] + overlap * (pos[2] - pos2[2]) / dist
	end
end

Gathering.slot_vs_breed_overlap = function (self, pos, rad, pos2, rad2, ball1)
	local dist = Vector3.distance(Vector3(pos[1], pos[2], 0), Vector3(pos2[1], pos2[2], 0))

	if dist < 0.001 then
		pos[1] = pos[1] - rad * 0.1

		return
	end

	local overlap = dist - rad - rad2

	if overlap < 0 then
		pos[1] = pos[1] - overlap * (pos[1] - pos2[1]) / dist
		pos[2] = pos[2] - overlap * (pos[2] - pos2[2]) / dist
	end
end

Gathering.update_efficient = function (self, t, dt)
	local nav_world = self.nav_world
	local balls = self.balls
	local broadphase_query = AiUtils.broadphase_query
	local ball_broadphase = self.ball_broadphase
	local lookup_broadphase_id = self.lookup_broadphase_id
	local num_boid_checks = 0
	local num_unit_checks = 0
	local max_checks = 10
	local start_index = self.last_index
	local end_index = self.last_index + max_checks

	if end_index >= self.num_balls then
		self.last_index = 1
		end_index = self.num_balls
	else
		self.last_index = end_index + 1
	end

	for i = start_index, end_index do
		repeat
			local ball = balls[i]
			local side_id = ball.side_id
			local pos = ball.pos
			local rad = ball.rad
			local ppos = POSITION_LOOKUP[ball.target_unit]

			if not ppos then
				break
			end

			pos[1] = pos[1] - (pos[1] - ppos[1]) * dt
			pos[2] = pos[2] - (pos[2] - ppos[2]) * dt
			pos[3] = ppos[3]

			local broadphase_p = Vector3(pos[1], pos[2], 0)
			local num_boids = Broadphase.query(ball_broadphase, broadphase_p, 1, result_table)

			for j = 1, num_boids do
				local id = result_table[j]
				local other_ball = lookup_broadphase_id[id]

				if other_ball ~= ball then
					self:slot_vs_slot_overlap(pos, rad, other_ball.pos, other_ball.rad, ball, other_ball)

					num_boid_checks = num_boid_checks + 1
				end
			end

			local static_p = Vector3(pos[1], pos[2], pos[3])
			local crad = 2.2 + rad
			local num_units = broadphase_query(static_p, crad, result_table)

			for j = 1, num_units do
				local unit = result_table[j]
				local other_blackboard = BLACKBOARDS[unit]

				if side_id ~= other_blackboard.side.side_id then
					local other_unit = result_table[j]
					local other_pos = POSITION_LOOKUP[other_unit]
					local other_rad = 2.2

					self:slot_vs_breed_overlap(pos, rad, other_pos, other_rad, ball)

					num_unit_checks = num_unit_checks + 1
				end
			end
		until true
	end

	local traverse_logic = self.traverse_logic

	for i = 1, self.num_balls do
		local ball = balls[i]
		local pos = ball.pos
		local last_pos = ball.last_pos
		local dist_sq = Vector3.distance_squared(Vector3(pos[1], pos[2], pos[3]), Vector3(last_pos[1], last_pos[2], last_pos[3]))
		local dirty = dist_sq > 0.0001

		if dirty then
			local position = Vector3(pos[1], pos[2], pos[3])
			local target_pos = POSITION_LOOKUP[ball.target_unit]

			if target_pos then
				local _, end_pos = GwNavQueries.raycast(nav_world, target_pos, position, traverse_logic)

				position = end_pos
			end

			local broadphase_pos = Vector3(position[1], position[2], 0)

			Broadphase.move(ball_broadphase, ball.broadphase_id, broadphase_pos)

			pos[1], pos[2], pos[3] = position[1], position[2], position[3]
			last_pos[1], last_pos[2], last_pos[3] = position[1], position[2], position[3]
		end
	end

	self.num_boid_checks = num_boid_checks
	self.num_unit_checks = num_unit_checks
end

Gathering.update_brute_force = function (self, t, dt)
	local nav_world = self.nav_world
	local balls = self.balls

	for i = 1, self.num_balls do
		local ball = balls[i]
		local pos = ball.pos
		local rad = ball.rad
		local target_unit = ball.target_unit

		if target_unit then
			local ppos = POSITION_LOOKUP[target_unit]

			ppos = GwNavQueries.inside_position_from_outside_position(nav_world, ppos, 2, 2) or ppos
			pos[1] = pos[1] - (pos[1] - ppos[1]) * dt
			pos[2] = pos[2] - (pos[2] - ppos[2]) * dt
		elseif ball.is_static then
			local new_pos = POSITION_LOOKUP[ball.owner_unit]

			pos[1] = new_pos.x
			pos[2] = new_pos.y
		end

		local static_a = ball.is_static
		local boid_a = not static_a
		local side_a = ball.side_id
		local broadphase_query = AiUtils.broadphase_query

		for j = 1, self.num_balls do
			local other_ball = balls[j]
			local static_b = other_ball.is_static
			local boid_b = not static_b
			local enemy = other_ball.side_id ~= side_a
			local allied = not enemy
			local ok1 = static_a and boid_b and enemy
			local ok2 = static_b and boid_a and enemy
			local ok3 = boid_a and boid_b and allied

			if ball ~= other_ball and (ok1 or ok2 or ok3) then
				local pos2 = other_ball.pos
				local rad2 = other_ball.rad

				if do_circles_overlap(pos[1], pos[2], rad, pos2[1], pos2[2], rad2) then
					local dist = Vector3.distance(Vector3(pos[1], pos[2], 0), Vector3(pos2[1], pos2[2], 0))
					local overlap = (dist - rad - rad2) * 0.5

					pos[1] = pos[1] - overlap * (pos[1] - pos2[1]) / dist
					pos[2] = pos[2] - overlap * (pos[2] - pos2[2]) / dist
					pos2[1] = pos2[1] + overlap * (pos[1] - pos2[1]) / dist
					pos2[2] = pos2[2] + overlap * (pos[2] - pos2[2]) / dist
				end
			end
		end
	end
end

Gathering.update = function (self, t, dt)
	self:update_efficient(t, dt)

	if self.debug_draw then
		self:draw()
	end
end
