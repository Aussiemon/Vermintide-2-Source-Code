-- chunkname: @scripts/game_state/title_screen_substates/win32/state_title_screen_load_save.lua

require("scripts/game_state/state_loading")

StateTitleScreenLoadSave = class(StateTitleScreenLoadSave)
StateTitleScreenLoadSave.NAME = "StateTitleScreenLoadSave"

StateTitleScreenLoadSave.on_enter = function (self, params)
	print("[Gamestate] Enter Substate StateTitleScreenLoadSave")

	self._params = params
	self._world = self._params.world
	self._viewport = self._params.viewport
	self._title_start_ui = params.ui

	self:_handle_tutorial_auto_start()
	self:_setup_init_network_view()

	local loading_context = self.parent.parent.loading_context
	local loading_view = loading_context.loading_view

	if loading_view then
		loading_view:destroy()

		loading_context.loading_view = nil
	end
end

StateTitleScreenLoadSave._handle_tutorial_auto_start = function (self)
	local loading_context = self.parent.parent.loading_context
	local force_run_tutorial = loading_context.force_run_tutorial

	loading_context.force_run_tutorial = nil

	if IS_WINDOWS and rawget(_G, "Steam") then
		local app_id = Steam.app_id()

		if app_id == 1085780 then
			return
		end
	end

	local has_completed_tutorial = Managers.backend:get_user_data("has_completed_tutorial") or SaveData.has_completed_tutorial or false
	local run_tutorial, tutorial_state = Managers.mechanism:should_run_tutorial()

	if not force_run_tutorial and (has_completed_tutorial or script_data.disable_tutorial_at_start or not run_tutorial) then
		return
	end

	Managers.level_transition_handler:set_next_level("prologue", 0)

	self.parent.parent.loading_context.switch_to_tutorial_backend = run_tutorial
	self.parent.parent.loading_context.wanted_tutorial_state = tutorial_state
	self.parent.parent.loading_context.first_time = true

	Managers.backend:set_user_data("has_completed_tutorial", true)
	Managers.backend:commit()
end

StateTitleScreenLoadSave._setup_init_network_view = function (self)
	if Development.parameter("goto_endoflevel") and false then
		local async = false

		Managers.package:load("resource_packages/levels/dicegame", "StateTitleScreenLoadSave", nil, async)

		self.parent.parent.loading_context.play_end_of_level_game = true
	end

	self.wanted_state = StateLoading
end

StateTitleScreenLoadSave.update = function (self, dt, t)
	if self._title_start_ui then
		self._title_start_ui:update(dt, t)
	end

	return self:_next_state()
end

StateTitleScreenLoadSave._next_state = function (self)
	if Managers.backend:profiles_loaded() and not Managers.backend:is_waiting_for_user_input() and self.wanted_state then
		Managers.transition:fade_in(GameSettings.transition_fade_out_speed, callback(self, "cb_fade_in_done", self.wanted_state))

		self.wanted_state = nil
	end
end

StateTitleScreenLoadSave.cb_fade_in_done = function (self, wanted_state)
	self.parent.state = wanted_state
end

StateTitleScreenLoadSave.on_exit = function (self, application_shutdown)
	return
end
