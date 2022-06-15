FormationUtils = {
	make_formation = function (formation_template, spacing)
		local formation = {
			arrangement = {},
			formation_template = formation_template,
			x = formation_template.x,
			y = formation_template.y
		}
		local num_units_x = formation_template.size[1]
		local num_units_y = formation_template.size[2]
		local half_spacing = spacing / 2
		local half_width = num_units_x / 2 - half_spacing
		local half_height = num_units_y / 2 - half_spacing
		local arrangement = formation.arrangement
		local k = 0

		for j = 0, num_units_y - 1, 1 do
			for i = 0, num_units_x - 1, 1 do
				k = k + 1
				arrangement[k] = {
					i * spacing - half_width,
					j * spacing - half_height
				}
			end
		end

		return formation, k
	end
}

FormationUtils.make_encampment = function (encampment_template)
	local encampment = {
		army_size = 0,
		encampment_template = encampment_template
	}
	local army_size = 0
	local size = nil

	for i = 1, #encampment_template, 1 do
		local formation_template = encampment_template[i]
		local spacing = 1
		encampment[i], size = FormationUtils.make_formation(formation_template, spacing)
		army_size = army_size + size
	end

	encampment.army_size = army_size

	return encampment
end

local FORMATION_COLORS = {
	light = {
		222,
		88,
		0
	},
	heavy = {
		0,
		128,
		240
	},
	special = {
		240,
		240,
		0
	},
	boss = {
		40,
		200,
		40
	}
}

FormationUtils.draw_encampment = function (encampment, pos, rot, drawer)
	drawer = drawer or QuickDrawer

	drawer:sphere(pos, 0.25, Color(0, 180, 0))

	for i = 1, #encampment, 1 do
		local formation = encampment[i]
		local fc = FORMATION_COLORS[formation.formation_template.category]
		local color = Color(fc[1], fc[2], fc[3])
		local frot = rot
		local fpos = pos + Quaternion.rotate(rot, Vector2(formation.x, formation.y))

		FormationUtils.draw_formation(formation, fpos, frot, color, drawer)
	end
end

FormationUtils.draw_formation = function (formation, pos, rot, color, drawer)
	drawer:line(pos, pos + Vector3(0, 0, 3), color)

	local dir = formation.formation_template.dir
	local formation_rot = (dir and Quaternion.look(Vector3(dir[1], dir[2], 0))) or Quaternion.look(Vector3(0, 1, 0))
	formation_rot = Quaternion.multiply(rot, formation_rot)
	local arrangement = formation.arrangement

	for i = 1, #arrangement, 1 do
		local arr = arrangement[i]
		local spawn_pos = pos + Quaternion.rotate(formation_rot, Vector3(arr[1], arr[2], 0))

		drawer:sphere(spawn_pos, 0.5, color)
	end
end

FormationUtils.spawn_formation = function (formation, pos, rot, breed_name, group_template, side_id)
	local conflict_director = Managers.state.conflict
	local nav_world = conflict_director.nav_world
	local arrangement = formation.arrangement
	local dir = formation.formation_template.dir
	local formation_rot = (dir and Quaternion.look(Vector3(dir[1], dir[2], 0))) or Quaternion.look(Vector3(0, 1, 0))
	formation_rot = Quaternion.multiply(rot, formation_rot)

	for i = 1, #arrangement, 1 do
		local arr = arrangement[i]
		local spawn_pos = pos + Quaternion.rotate(formation_rot, Vector3(arr[1], arr[2], 0))
		local on_mesh, z = GwNavQueries.triangle_from_position(nav_world, spawn_pos, 2, 2)

		if on_mesh then
			Vector3.set_z(spawn_pos, z)

			local spawn_type = "roam"
			local spawn_category = "encampment"
			local breed = Breeds[breed_name]
			local optional_data = nil
			optional_data = {
				side_id = side_id
			}

			conflict_director:spawn_queued_unit(breed, Vector3Box(spawn_pos), QuaternionBox(formation_rot), spawn_category, nil, spawn_type, optional_data, group_template)
		end
	end
end

FormationUtils.spawn_encampment = function (encampment, pos, rot, unit_composition, side_id)
	local group_template = {
		template = "encampment",
		id = Managers.state.entity:system("ai_group_system"):generate_group_id(),
		size = encampment.army_size,
		group_data = {
			sneaky = true,
			idle = true,
			encampment = encampment,
			spawn_time = Managers.time:time("game"),
			side_id = side_id
		},
		side_id = side_id
	}
	encampment.pos = Vector3Box(pos)

	for i = 1, #encampment, 1 do
		local formation = encampment[i]
		local breed_name = unit_composition[formation.formation_template.category]
		local fpos = pos + Quaternion.rotate(rot, Vector2(formation.x, formation.y))

		FormationUtils.spawn_formation(formation, fpos, rot, breed_name, group_template, side_id)
	end
end

return
