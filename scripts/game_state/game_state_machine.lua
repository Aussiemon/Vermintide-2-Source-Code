require("foundation/scripts/util/state_machine")

GameStateMachine = class(GameStateMachine, StateMachine)

GameStateMachine.init = function (self, parent, start_state, params, profiling_debugging_enabled)
	self._notify_mod_manager = params.notify_mod_manager

	self.super.init(self, parent, start_state, params, profiling_debugging_enabled)
end

GameStateMachine._change_state = function (self, new_state, ...)
	local notify = self._notify_mod_manager
	local old_state = self._state

	if notify and old_state then
		Managers.mod:on_game_state_changed("exit", old_state.NAME, old_state)
	end

	self.super._change_state(self, new_state, ...)

	local new_state = self._state

	if notify then
		Managers.mod:on_game_state_changed("enter", new_state.NAME, new_state)
	end
end

GameStateMachine.pre_update = function (self, dt, t)
	if self._state and self._state.pre_update then
		self._state:pre_update(dt, t)
	end
end

GameStateMachine.post_update = function (self, dt, t)
	if self._state and self._state.post_update then
		self._state:post_update(dt, t)
	end
end

GameStateMachine.pre_render = function (self)
	if self._state and self._state.pre_render then
		self._state:pre_render()
	end
end

GameStateMachine.render = function (self)
	if self._state and self._state.render then
		self._state:render()
	end
end

GameStateMachine.post_render = function (self)
	if self._state and self._state.post_render then
		self._state:post_render()
	end
end

GameStateMachine.destroy = function (self, ...)
	local old_state = self._state

	if self._notify_mod_manager and old_state then
		Managers.mod:on_game_state_changed("exit", old_state.NAME)
	end

	self.super.destroy(self, ...)
end
