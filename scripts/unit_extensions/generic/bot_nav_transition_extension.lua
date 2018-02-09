BotNavTransitionExtension = class(BotNavTransitionExtension)
BotNavTransitionExtension.init = function (self, extension_init_context, unit)
	self._unit = unit
	self._is_server = Managers.state.network.is_server

	if self._is_server then
		local from = Unit.world_position(unit, 0)
		local via = Unit.world_position(unit, Unit.node(unit, "waypoint"))
		local to = Unit.world_position(unit, Unit.node(unit, "destination"))
		local success, transition_unit = Managers.state.bot_nav_transition:create_transition(from, via, to, Unit.get_data(unit, "jump"), true)

		fassert(success, "Hand placed bot nav transition from %s to %s does not result in valid transition", from, to)

		self._transition_unit = transition_unit
	end

	return 
end
BotNavTransitionExtension.destroy = function (self)
	if self._is_server then
		Managers.state.bot_nav_transition:unregister_transition(self._transition_unit)
	end

	return 
end

return 
