BotNavTransitionExtension = class(BotNavTransitionExtension)
BotNavTransitionExtension.init = function (self, extension_init_context, unit)
	self._unit = unit
	self._is_server = Managers.state.network.is_server

	if self._is_server then
		local from = Unit.world_position(unit, 0)
		local via = Unit.world_position(unit, Unit.node(unit, "waypoint"))
		local to = Unit.world_position(unit, Unit.node(unit, "destination"))
		local jump_transition = Unit.get_data(unit, "jump")

		if jump_transition and 0.5 < Vector3.distance_squared(from, via) then
			local debug_text1 = string.format("LD Warning! Handplaced bot nav jump transition at (%.2f, %.2f, %.2f) failed", from.x, from.y, from.z)
			local debug_text2 = string.format("from point is too far away from waypoint (need to be within 0.5m for jumps)")

			Debug.sticky_text("%s - %s", debug_text1, debug_text2, "delay", 7)
			Application.warning(string.format("[BotNavTransitionExtension] %s - %s", debug_text1, debug_text2))

			local between_position = Vector3.lerp(from, via, 0.5)

			QuickDrawerStay:sphere(from, 0.25, Colors.get("red"))
			QuickDrawerStay:sphere(via, 0.25, Colors.get("red"))
			QuickDrawerStay:line(from, via, Colors.get("red"))
			QuickDrawerStay:line(between_position, between_position + Vector3(0, 0, 1.5), Colors.get("red"))
			Debug.world_sticky_text(between_position + Vector3(0, 0, 2), debug_text1, "red")
			Debug.world_sticky_text(between_position + Vector3(0, 0, 1.5), debug_text2, "red")
		else
			local success, transition_unit = Managers.state.bot_nav_transition:create_transition(from, via, to, jump_transition, true)

			fassert(success, "Hand placed bot nav transition from %s to %s does not result in valid transition", from, to)

			self._transition_unit = transition_unit
		end
	end

	return 
end
BotNavTransitionExtension.destroy = function (self)
	if self._is_server and self._transition_unit then
		Managers.state.bot_nav_transition:unregister_transition(self._transition_unit)
	end

	return 
end

return 
