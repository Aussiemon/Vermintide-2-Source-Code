BotNavTransitionExtension = class(BotNavTransitionExtension)

BotNavTransitionExtension.init = function (self, extension_init_context, unit)
	self._unit = unit
	self._is_server = Managers.state.network.is_server

	if self._is_server then
		self._transition_unit = BotNavTransitionExtension.try_create_transition(unit, 0, Managers.state.bot_nav_transition, QuickDrawerStay)
	end
end

BotNavTransitionExtension.try_create_transition = function (unit, index_offset, bot_nav_transition_manager, drawer, called_from_editor)
	local index_offset = index_offset or 0
	local from = Unit.world_position(unit, index_offset)
	local via = Unit.world_position(unit, Unit.node(unit, "waypoint"))
	local to = Unit.world_position(unit, Unit.node(unit, "destination"))
	local jump_transition = Unit.get_data(unit, "jump")
	local error_message = nil

	if jump_transition and Vector3.distance_squared(from, via) > 0.25 then
		return nil, error_message
	else
		local success, transition_unit = bot_nav_transition_manager:create_transition(from, via, to, jump_transition, true, drawer)

		if called_from_editor and not success then
			error_message = string.format("Hand placed bot nav transition from %s to %s does not result in valid transition", tostring(from), tostring(to))

			Application.error(error_message)
			drawer:line(from, from + Vector3.up() * 15, Colors.get("red"))
		else
			fassert(success, "Hand placed bot nav transition from %s to %s does not result in valid transition", from, to)
		end

		return transition_unit, error_message
	end
end

BotNavTransitionExtension.destroy = function (self)
	if self._is_server and self._transition_unit then
		Managers.state.bot_nav_transition:unregister_transition(self._transition_unit)
	end
end

return
