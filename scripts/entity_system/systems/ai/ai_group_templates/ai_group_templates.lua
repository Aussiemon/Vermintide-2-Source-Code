AIGroupTemplates = {}
local ScriptUnit_extension = ScriptUnit.extension
local BLACKBOARDS = BLACKBOARDS
AIGroupTemplates.mini_patrol = {
	pre_unit_init = function (unit, group)
		local blackboard = BLACKBOARDS[unit]
		blackboard.sneaky = true

		return 
	end,
	init = function (world, nav_world, group, t)
		return 
	end,
	update = function (world, nav_world, group, t)
		return 
	end,
	destroy = function (world, nav_world, group)
		Managers.state.conflict:mini_patrol_killed(group.id)

		return 
	end
}
AIGroupTemplates.horde = {
	pre_unit_init = function (unit, group)
		if group.sneaky then
			local blackboard = BLACKBOARDS[unit]
			blackboard.sneaky = true
		end

		return 
	end,
	init = function (world, nav_world, group, t, unit)
		return 
	end,
	update = function (world, nav_world, group, t)
		if group and group.group_data then
			Debug.text(string.format("Horde size: %d/%d %s", group.members_n, group.size, group.group_data.horde_wave))
		end

		return 
	end,
	destroy = function (world, nav_world, group)
		Managers.state.conflict:horde_killed((group.group_data and group.group_data.horde_wave) or "?")

		return 
	end
}
AIGroupTemplates.boss_door_closers = {
	pre_unit_init = function (unit, group)
		return 
	end,
	init = function (world, nav_world, group, t, unit)
		return 
	end,
	update = function (world, nav_world, group, t)
		return 
	end,
	destroy = function (world, nav_world, group)
		return 
	end
}
AIGroupTemplates.encampment = {
	pre_unit_init = function (unit, group)
		local ai_simple = ScriptUnit.extension(unit, "ai_system")

		ai_simple.set_perception(ai_simple, "perception_regular", "pick_encampment_target_idle")

		local blackboard = BLACKBOARDS[unit]
		blackboard.ignore_interest_points = true

		return 
	end,
	setup_group = function (world, nav_world, group, first_unit)
		group.idle = true

		return 
	end,
	init = function (world, nav_world, group, t, unit)
		return 
	end,
	update = function (world, nav_world, group, t)
		local group_data = group.group_data
		local awake = group_data.spawn_time + 10 < t

		Debug.text(string.format("Encampment size: %d/%d awake %s", group.members_n, group.size, tostring(awake)))

		if group.idle and awake then
			local encampment_pos = group_data.encampment.pos:unbox()

			for i = 1, #PLAYER_POSITIONS, 1 do
				local player_pos = PLAYER_POSITIONS[i]

				if Vector3.distance(encampment_pos, player_pos) < 15 then
					AIGroupTemplates.encampment.wake_up_encampment(group, PLAYER_UNITS[i])

					break
				end
			end
		end

		return 
	end,
	destroy = function (world, nav_world, group)
		print("Encampment killed")

		return 
	end,
	wake_up_encampment = function (group, prime_target_unit)
		Managers.state.entity:system("ai_group_system"):run_func_on_all_members(group, AIGroupTemplates.encampment.wake_up_unit, prime_target_unit)

		group.idle = false

		return 
	end,
	wake_up_unit = function (unit, group, prime_target_unit)
		local ai_simple = ScriptUnit_extension(unit, "ai_system")

		ai_simple.enemy_aggro(ai_simple, nil, prime_target_unit)

		local breed = ai_simple._breed

		ai_simple.set_perception(ai_simple, breed.perception, breed.target_selection)

		return 
	end
}

return 
