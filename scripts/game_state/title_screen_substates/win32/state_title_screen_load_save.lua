require("scripts/game_state/state_loading")

StateTitleScreenLoadSave = class(StateTitleScreenLoadSave)
StateTitleScreenLoadSave.NAME = "StateTitleScreenLoadSave"
StateTitleScreenLoadSave.on_enter = function (self, params)
	print("[Gamestate] Enter Substate StateTitleScreenLoadSave")

	self._params = params
	self._world = self._params.world
	self._viewport = self._params.viewport
	self._title_start_ui = params.ui
	self._save_data_loaded = false

	self._load_save_data(self)

	local loading_context = self.parent.parent.loading_context
	local loading_view = loading_context.loading_view

	if loading_view then
		loading_view.destroy(loading_view)

		loading_context.loading_view = nil
	end

	return 
end
StateTitleScreenLoadSave._load_save_data = function (self)
	print("[StateTitleScreenLoadSave] SaveFileName", SaveFileName)
	Managers.save:auto_load(SaveFileName, callback(self, "cb_save_data_loaded"))

	return 
end
StateTitleScreenLoadSave.cb_save_data_loaded = function (self, info)
	if info.error then
		Application.warning("Load error %q", info.error)
	else
		populate_save_data(info.data)
	end

	self._save_data_loaded = true
	GameSettingsDevelopment.trunk_path = Development.parameter("trunk_path")
	self.parent.parent.loading_context.restart_network = true

	self._setup_init_network_view(self)

	return 
end
StateTitleScreenLoadSave._setup_init_network_view = function (self)
	if Development.parameter("goto_endoflevel") then
		if false then
			local async = false

			Managers.package:load("resource_packages/levels/dicegame", "StateTitleScreenLoadSave", nil, async)

			self.parent.parent.loading_context.play_end_of_level_game = true
		end
	end

	self.wanted_state = StateLoading

	return 
end
StateTitleScreenLoadSave.update = function (self, dt, t)
	if self._title_start_ui then
		self._title_start_ui:update(dt, t)
	end

	if not self._save_data_loaded then
		return 
	end

	return self._next_state(self)
end
StateTitleScreenLoadSave._next_state = function (self)
	if self._save_data_loaded and Managers.backend:profiles_loaded() and not Managers.backend:is_waiting_for_user_input() and self.wanted_state then
		Managers.transition:fade_in(GameSettings.transition_fade_out_speed, callback(self, "cb_fade_in_done", self.wanted_state))

		self.wanted_state = nil
	end

	return 
end
StateTitleScreenLoadSave.cb_fade_in_done = function (self, wanted_state)
	self.parent.state = wanted_state

	return 
end
StateTitleScreenLoadSave.on_exit = function (self, application_shutdown)
	return 
end

return 
