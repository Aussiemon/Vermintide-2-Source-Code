-- chunkname: @scripts/managers/flow_helper/flow_helper_manager.lua

FlowHelperManager = class(FlowHelperManager)

FlowHelperManager.init = function (self, world)
	self._line_of_sight_checks = {}
	self._physics_world = World.physics_world(world)
end

FlowHelperManager.update = function (self, t)
	self:_update_line_of_sight_checks(t)
end

local INDEX_POSITION = 1
local INDEX_ACTOR = 4

FlowHelperManager._update_line_of_sight_checks = function (self, t)
	for owner_unit, check_units in pairs(self._line_of_sight_checks) do
		for check_unit, data in pairs(check_units) do
			local source_unit = data.source_unit
			local should_update = t > data.last_t + data.time_between_checks

			if should_update then
				data.last_t = t

				if not Unit.alive(source_unit) or not Unit.alive(check_unit) then
					self:unregister_line_of_sight_check(source_unit, check_unit)
				else
					local from = Unit.local_position(source_unit, 0)
					local to = Unit.world_position(check_unit, data.node)
					local direction = to - from
					local length = Vector3.length(direction)

					direction = Vector3.normalize(direction)

					local is_in_los = data.is_in_los
					local hits = PhysicsWorld.immediate_raycast(self._physics_world, from, direction, length, "all", "collision_filter", data.collision_filter)
					local hit_pos = to
					local result = true

					if hits then
						for i = 1, #hits do
							local hit = hits[i]
							local hit_actor = hit[INDEX_ACTOR]
							local hit_unit = Actor.unit(hit_actor)

							if hit_unit ~= source_unit then
								result = hit_unit == check_unit
								hit_pos = hit[INDEX_POSITION]

								break
							end
						end
					end

					if is_in_los ~= result then
						data.is_in_los = result

						Unit.flow_event(owner_unit, result and data.flow_cb_enter or data.flow_cb_leave)
					end
				end
			end
		end
	end
end

FlowHelperManager.register_line_of_sight_check = function (self, owner_unit, source_unit, unit_to_check, flow_cb_enter, flow_cb_leave, collision_filter, debug_draw)
	local los_checks = self._line_of_sight_checks
	local source_checks = los_checks[owner_unit] or {}

	los_checks[owner_unit] = source_checks

	assert(not source_checks[unit_to_check], "[FlowHelperManager] Registering line of sight check between unit '%s' and '%s' without unregistering the previous one.")

	source_checks[unit_to_check] = {
		is_in_los = false,
		last_t = 0,
		time_between_checks = 0.3,
		flow_cb_enter = flow_cb_enter,
		flow_cb_leave = flow_cb_leave,
		source_unit = source_unit,
		collision_filter = collision_filter,
		node = Unit.has_node(unit_to_check, "j_spine") and Unit.node(unit_to_check, "j_spine") or 0,
		debug_draw = debug_draw and {
			from = Vector3Box(),
			to = Vector3Box(),
		},
	}
end

FlowHelperManager.unregister_line_of_sight_check = function (self, owner_unit, unit_to_check)
	local los_checks = self._line_of_sight_checks
	local source_checks = los_checks[owner_unit]

	if source_checks then
		source_checks[unit_to_check] = nil

		if table.is_empty(source_checks) then
			los_checks[owner_unit] = nil
		end
	end
end
