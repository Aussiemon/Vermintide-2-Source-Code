PackSpawnerUtils = {}

local function euler_to_quaternion(pitch, roll, yaw)
	local pitch_rot = Quaternion(Vector3.right(), pitch)
	local roll_rot = Quaternion(Vector3.forward(), roll)
	local yaw_rot = Quaternion(Vector3.up(), yaw)
	local final_rot = Quaternion.multiply(pitch_rot, roll_rot)
	final_rot = Quaternion.multiply(final_rot, yaw_rot)

	return final_rot
end

local spawn_pack = {}

PackSpawnerUtils.spawn_predefined_pack = function (breed_pack, pos, mesh)
	local size = 0

	for _, pack in pairs(breed_pack) do
		if type(pack) == "table" then
			for i, unit_data in ipairs(pack) do
				local unit_position = PackSpawnerUtils.modify_spawn_position(Vector2(unit_data.pos[1], unit_data.pos[2]), pos, mesh)

				if unit_position then
					local breed = unit_data.breed
					local rot = unit_data.rot
					rot = euler_to_quaternion(math.degrees_to_radians(rot[1]), math.degrees_to_radians(rot[2]), math.degrees_to_radians(rot[3]))
					local animation = unit_data.animation[math.random(1, #unit_data.animation)]
					size = size + 1
					local inventory_template = unit_data.inventory_template or "default"
					spawn_pack[size] = {
						breed,
						unit_position,
						rot,
						animation,
						inventory_template
					}
				else
					print("Pack outside mesh, try fallback...")

					local pack_size = #pack

					return PackSpawnerUtils.spawn_in_circle(BackupBreedPack, #pack, pos)
				end
			end
		end
	end

	return size, spawn_pack
end

PackSpawnerUtils.spawn_in_circle = function (breed_pack, pack_size, pos)
	local point_cap = 5
	local total_points = pack_size
	local points_found = 0
	local angle_step = 60
	local angle = 0
	local start_angle = 0

	for i = 3, 100, 2 do
		start_angle = start_angle + 45

		if start_angle == 90 then
			start_angle = 0
		end

		angle = start_angle
		local radius = i / 2
		local start_point = Vector3(radius, 0, 5)
		local points_left = total_points - points_found

		for j = 1, point_cap do
			if points_found == total_points then
				print("Fallback pack spawning moved inside:", total_points, " units.")

				return total_points, spawn_pack
			end

			local offset_x = math.random(-1, 1) / 10
			local offset_y = math.random(-radius, radius) / 10
			start_point = start_point + Vector3(offset_x, offset_y, 0)
			local pos_offset = Quaternion.rotate(Quaternion(Vector3.up(), math.degrees_to_radians(angle)), start_point)
			local unit_position = PackSpawnerUtils.modify_spawn_position(pos_offset, pos)

			if unit_position then
				local unit_data = breed_pack.members[1]
				local breed = unit_data.breed
				local animation = unit_data.animation[math.random(1, #unit_data.animation)]
				local rot = pos - unit_position
				rot.z = 0
				rot = Quaternion.look(rot)
				points_found = points_found + 1
				local inventory_template = unit_data.inventory_template or "default"
				spawn_pack[points_found] = {
					breed,
					unit_position,
					rot,
					animation,
					inventory_template
				}
			end

			angle = angle + angle_step

			if angle >= 360 then
				angle = 0
			end
		end
	end

	print("=== backup pack somehow failed!? at position", pos, " ===")

	return 0, spawn_pack
end

PackSpawnerUtils.spawn_random_pack = function (breed_pack, pos, mesh)
	local pack = breed_pack
	local unit = pack[1]
	local random_amount = Math.random(pack.amount[1], pack.amount[2])

	for i = 1, random_amount do
		local rot = Quaternion(Vector3.up(), math.degrees_to_radians(Math.random(1, 360)))
		local spawn_range = pack.spawn_range[2]
		local attempts = 0

		while attempts < 10 do
			local offset_x = (math.random() - 0.5) * spawn_range * 2
			local offset_y = (math.random() - 0.5) * spawn_range * 2
			local unit_position = PackSpawnerUtils.modify_spawn_position(Vector2(offset_x, offset_y), pos)

			if not PackSpawnerUtils.check_unit_overlap(unit_position, spawn_pack, i) then
				local idle_animation = unit.animation[math.random(1, #unit.animation)]
				spawn_pack[i] = {
					breed,
					unit_position,
					rot,
					idle_animation
				}

				break
			end

			attempts = attempts + 1
		end
	end

	return #spawn_pack, spawn_pack
end

PackSpawnerUtils.modify_spawn_position = function (unit_pos, pos)
	local x = pos[1] + unit_pos[1]
	local y = pos[2] + unit_pos[2]
	local pos = Vector3(x, y, pos[3])
	local entity_manager = Managers.state.entity
	local ai_system = entity_manager:system("ai_system")
	local poly, altitude = ai_system:get_tri_on_navmesh(pos)

	if poly then
		pos.z = altitude

		return pos
	end

	return false
end

PackSpawnerUtils.check_unit_overlap = function (pos, other_units, units_count)
	if not next(other_units) then
		return false
	else
		for i = 1, units_count do
			local unit = other_units[i]
			local distance = Vector3.distance(pos, unit[1])

			if distance < 1 then
				return true
			end
		end
	end

	return false
end

PackSpawnerUtils.random_predefined_pack_index = function ()
	local index = 1
	local current_spawn_weight = math.random(0, BreedPacks[index].spawn_weight)

	for i, pack in ipairs(BreedPacks) do
		local new_spawn_weight = math.random(0, pack.spawn_weight)

		if current_spawn_weight < new_spawn_weight then
			index = i
			current_spawn_weight = new_spawn_weight
		end
	end

	return index
end
