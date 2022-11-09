TrailUrnAlignmentExtension = class(TrailUrnAlignmentExtension)
local STATE = {
	MOVE_TO_NODE = 2,
	WAITING_FOR_INTERACTION = 1,
	IS_ALIGNED = 3
}
local lerp_duration = 0.3

TrailUrnAlignmentExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self._interactable_type = Unit.get_data(unit, "interaction_data", "interaction_type")
	self._elapsed_time = 0
	self._start_time = 0
	self._start_position = nil
	self._start_offset = nil
	self._interaction_position = Vector3Box(Vector3.zero())
	self._position = Vector3Box(Unit.world_position(self._unit, 0))
	self._nav_world = Managers.state.entity:system("ai_system"):nav_world()
	self._interaction_distance = Unit.get_data(unit, "animation_distance")
	self._align_state = STATE.WAITING_FOR_INTERACTION
end

TrailUrnAlignmentExtension.update_interaction_position = function (self, interactor_unit)
	local player_pos = POSITION_LOOKUP[interactor_unit]
	local urn_pos = self._position:unbox()
	local offset_direction = Vector3.normalize(player_pos - urn_pos)
	local interaction_offset = offset_direction * self._interaction_distance
	local interaction_position = interaction_offset + urn_pos
	local success, z_pos = GwNavQueries.triangle_from_position(self._nav_world, interaction_position, 1, 1)

	if success then
		interaction_position.z = z_pos

		return interaction_position
	else
		local steps = 10
		local d = 1

		for i = 1, steps, 1 do
			local step = (2 * math.pi) / steps * i
			local pos = Vector3(math.sin(step) * self._interaction_distance * d, -math.cos(step) * self._interaction_distance * d, 0)
			d = d * -1
			local step_pos = urn_pos + pos
			local success, z_pos = GwNavQueries.triangle_from_position(self._nav_world, step_pos, 1, 1)

			if success then
				step_pos.z = z_pos

				return step_pos
			end
		end
	end
end

TrailUrnAlignmentExtension.can_interact = function (self)
	if self._align_state ~= STATE.WAITING_FOR_INTERACTION then
		return false
	end

	return true
end

TrailUrnAlignmentExtension.on_client_start_interaction = function (self, interactor_unit, t)
	self._elapsed_time = 0
	self._start_time = t
	self._start_position = Vector3Box(POSITION_LOOKUP[interactor_unit])
	local interaction_position = self:update_interaction_position(interactor_unit)

	self._interaction_position:store(interaction_position)

	self._align_state = STATE.MOVE_TO_NODE
end

local movement_threshold_sq = 1

TrailUrnAlignmentExtension.is_unit_pushed_out_off_range = function (self, interactor_unit, interactable_unit)
	local interactor_position = POSITION_LOOKUP[interactor_unit]
	local start_offset = self._start_offset:unbox()
	local current_offset = interactor_position - self._position:unbox()
	local pushed_distance_sqr = Vector3.distance_squared(start_offset, current_offset)

	if movement_threshold_sq < pushed_distance_sqr then
		self._align_state = STATE.WAITING_FOR_INTERACTION

		return true
	end

	return false
end

TrailUrnAlignmentExtension.on_client_move_to_node = function (self, interactor_unit, interactable_unit, is_husk, t)
	if self._align_state ~= STATE.MOVE_TO_NODE then
		return false
	end

	local interactable_position = self._position:unbox()
	local interactor_position = POSITION_LOOKUP[interactor_unit]
	local lerped_wanted_position = self:lerp_to_node(interactor_unit, lerp_duration, t)

	if not is_husk then
		local locomotion_extension = ScriptUnit.extension(interactor_unit, "locomotion_system")

		locomotion_extension:enable_wanted_position_movement()
		locomotion_extension:set_wanted_pos(lerped_wanted_position)

		local direction = interactable_position - interactor_position
		local rotation = Quaternion.look(Vector3.flat(direction), Vector3.up())

		Unit.set_local_rotation(interactor_unit, 0, rotation)
	end

	local sqr_interaction_distance = self._interaction_distance * self._interaction_distance
	local sqr_distance = Vector3.distance_squared(interactor_position, self._position:unbox())

	if sqr_distance <= sqr_interaction_distance or lerp_duration < self._elapsed_time then
		self._start_offset = Vector3Box(POSITION_LOOKUP[interactor_unit] - self._position:unbox())
		self._align_state = STATE.IS_ALIGNED
	end
end

TrailUrnAlignmentExtension.lerp_to_node = function (self, interactor_unit, duration, t)
	self._elapsed_time = t - self._start_time
	local lerp_t = self._elapsed_time / duration
	lerp_t = math.ease_out_quad(lerp_t)
	lerp_t = math.clamp(lerp_t, 0, 1)
	local new_position = Vector3.lerp(self._start_position:unbox(), self._interaction_position:unbox(), lerp_t)

	return new_position
end

TrailUrnAlignmentExtension.on_client_stop = function (self, interaction_result)
	if interaction_result == InteractionResult.SUCCESS then
		local flow_event = "lua_interaction_stopped_" .. self._interactable_type .. "_" .. interaction_result

		Unit.flow_event(self._unit, flow_event)

		self._align_state = STATE.DONE
	else
		self._align_state = STATE.WAITING_FOR_INTERACTION
	end
end

TrailUrnAlignmentExtension.is_state_move_to_node = function (self)
	if self._align_state == STATE.MOVE_TO_NODE then
		return true
	end

	return false
end

TrailUrnAlignmentExtension.set_state_waiting_for_interaction = function (self)
	self._align_state = STATE.WAITING_FOR_INTERACTION
end

TrailUrnAlignmentExtension.is_state_aligned = function (self)
	if self._align_state == STATE.IS_ALIGNED then
		return true
	end

	return false
end

return
