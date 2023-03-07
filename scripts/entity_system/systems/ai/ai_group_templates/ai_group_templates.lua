AIGroupTemplates = AIGroupTemplates or {}
local ScriptUnit_extension = ScriptUnit.extension
local BLACKBOARDS = BLACKBOARDS
AIGroupTemplates.mini_patrol = {
	pre_unit_init = function (unit, group)
		local blackboard = BLACKBOARDS[unit]
		blackboard.sneaky = true
	end,
	init = function (world, nav_world, group, t)
		return
	end,
	update = function (world, nav_world, group, t)
		return
	end,
	destroy = function (world, nav_world, group)
		Managers.state.conflict:mini_patrol_killed(group.id)
	end
}
AIGroupTemplates.horde = {
	pre_unit_init = function (unit, group)
		if group.sneaky then
			local blackboard = BLACKBOARDS[unit]
			blackboard.sneaky = true
		end
	end,
	init = function (world, nav_world, group, t, unit)
		Managers.state.conflict.horde_spawner:set_horde_has_spawned(group.id)
	end,
	update = function (world, nav_world, group, t)
		local group_data = group and group.group_data

		if group_data then
			-- Nothing
		end
	end,
	destroy = function (world, nav_world, group)
		Managers.state.conflict:horde_killed(group.group_data and group.group_data.horde_wave or "?")
		Managers.state.conflict.horde_spawner:set_horde_is_done(group.id)
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
AIGroupTemplates.spawn_test = {
	pre_unit_init = function (unit, group)
		local blackboard = BLACKBOARDS[unit]
		blackboard.far_off_despawn_immunity = true
	end,
	init = function (world, nav_world, group, t)
		group.kill_after_time = t + 2
		group.check_size = group.num_spawned_members
	end,
	setup_group = function (world, nav_world, group, first_unit)
		return
	end,
	update = function (world, nav_world, group, t)
		if group.kill_after_time < t then
			for unit, extension in pairs(group.members) do
				local heath_extension = ScriptUnit.has_extension(unit, "health_system")

				if heath_extension and heath_extension:is_alive() then
					Managers.state.conflict:destroy_unit(unit, BLACKBOARDS[unit], "test")

					group.check_size = group.check_size - 1
				end
			end

			local spawner_system = Managers.state.entity:system("spawner_system")
			spawner_system.tests_running = spawner_system.tests_running - 1
		end
	end,
	destroy = function (world, nav_world, group)
		if group.check_size ~= 0 then
			local spawner_unit = group.group_data.spawner_unit

			print(string.format("### DESTROY Bad spawner: %s at %s", tostring(spawner_unit), tostring(Unit.local_position(spawner_unit, 0))))
		else
			print("spawner id ", group.id, "is ok!")
		end
	end
}

DLCUtils.merge("ai_group_templates", AIGroupTemplates)
