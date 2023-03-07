require("scripts/managers/ui/popup_settings")

UIManager = class(UIManager)

UIManager.init = function (self)
	self._ui_enabled = true
end

UIManager.destroy = function (self)
	if self._ingame_ui then
		print("[UIManager] Warning: destroy_ingame_ui was not called before destroy")
	end
end

UIManager.create_ingame_ui = function (self, ingame_ui_context, loading_subtitle_gui)
	self._ingame_ui_context = ingame_ui_context
	self._loading_subtitle_gui = loading_subtitle_gui

	if self._ingame_ui then
		print("[UIManager] Warning: destroy_ingame_ui was not called before create_ingame_ui")
		self._ingame_ui:destroy()
	end

	self._ingame_ui = IngameUI:new(ingame_ui_context)
	self._ui_enabled = true
end

UIManager.destroy_ingame_ui = function (self)
	local ingame_ui = self._ingame_ui

	if ingame_ui then
		ingame_ui:destroy()

		self._ingame_ui = nil
	end
end

UIManager.reload_ingame_ui = function (self, reload_sources)
	local ingame_ui = self._ingame_ui

	if not ingame_ui then
		print("[UIManager] Warning: reloading the UI when it wasn't loaded.")

		return
	end

	local current_transition = ingame_ui.last_transition_name
	local current_params = ingame_ui.last_transition_params

	if reload_sources then
		for script_path in pairs(package.loaded) do
			if string.find(script_path, "^scripts/ui") then
				package.loaded[script_path] = nil

				require(script_path)
			end
		end
	end

	self:destroy_ingame_ui()
	self:create_ingame_ui(self._ingame_ui_context)

	if current_transition then
		self._ingame_ui:handle_transition(current_transition, current_params)
	end
end

UIManager.temporary_get_ingame_ui_called_from_state_ingame_running = function (self)
	return self._ingame_ui
end

UIManager.set_ingame_ui_enabled = function (self, bool)
	if self._ui_enabled ~= bool then
		self._ui_enabled = bool

		if not bool then
			local ingame_ui = self._ingame_ui

			if ingame_ui then
				ingame_ui:suspend_active_view()
			end
		end
	end
end

UIManager.update = function (self)
	if not self._ui_enabled then
		return
	end

	if not self._ui_update_initialized then
		self._ui_update_initialized = true

		return
	end

	local ingame_ui = self._ingame_ui

	if not ingame_ui then
		return
	end

	local t, dt = Managers.time:time_and_delta("ui")
	local disable_ingame_ui = (script_data.disable_ui or DebugScreen.active) and Managers.state.network:game_session_host() ~= nil
	local level_end_view_wrapper = self._level_end_view_wrapper
	local level_end_view = level_end_view_wrapper and level_end_view_wrapper:level_end_view()

	ingame_ui:update(dt, t, disable_ingame_ui, level_end_view)

	local loading_subtitle_gui = self._loading_subtitle_gui

	if loading_subtitle_gui then
		ingame_ui:update_loading_subtitle_gui(loading_subtitle_gui, dt)

		if loading_subtitle_gui:is_complete() then
			self._loading_subtitle_gui = nil
		end
	end

	if ingame_ui:end_screen_active() and ingame_ui:end_screen_completed() then
		Managers.state.event:trigger("end_screen_ui_complete")
	end
end

UIManager.end_screen_active = function (self)
	return self._ingame_ui:end_screen_active()
end

UIManager.end_screen_completed = function (self)
	return self._ingame_ui:end_screen_completed()
end

UIManager.post_update = function (self, dt, t, disable_ingame_ui)
	local ingame_ui = self._ingame_ui

	if ingame_ui then
		ingame_ui:post_update(dt, t, disable_ingame_ui)
	end
end

UIManager.post_render = function (self)
	local ingame_ui = self._ingame_ui

	if ingame_ui then
		ingame_ui:post_render()
	end
end

UIManager.get_transition = function (self)
	local ingame_ui = self._ingame_ui

	if ingame_ui then
		return ingame_ui:get_transition()
	end
end

UIManager.restart_game = function (self)
	local ingame_ui = self._ingame_ui
	ingame_ui.restart_game = true
end

UIManager.is_in_view_state = function (self, state_name)
	local ingame_ui = self._ingame_ui

	if ingame_ui then
		return ingame_ui:is_in_view_state(state_name)
	end
end

UIManager.get_hud_component = function (self, component_name)
	local ingame_ui = self._ingame_ui

	return ingame_ui:get_hud_component(component_name)
end

UIManager.open_popup = function (self, popup_name, ...)
	local ingame_ui = self._ingame_ui

	return ingame_ui:open_popup(popup_name, ...)
end

UIManager.close_popup = function (self, popup_name)
	local ingame_ui = self._ingame_ui

	return ingame_ui:close_popup(popup_name)
end

UIManager.get_active_popup = function (self, popup_name)
	local ingame_ui = self._ingame_ui

	if ingame_ui then
		return ingame_ui:get_active_popup(popup_name)
	end
end

UIManager.handle_new_ui_disclaimer = function (self, disclaimer_states, state)
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if gamepad_active or IS_CONSOLE then
		return
	end

	local use_gamepad_layout = Application.user_setting("use_gamepad_menu_layout")
	local use_pc_menu_layout = Application.user_setting("use_pc_menu_layout")

	if use_gamepad_layout == false and use_pc_menu_layout == false and (disclaimer_states[state] or disclaimer_states[state] == nil) then
		local ingame_ui = self._ingame_ui

		ingame_ui.weave_onboarding:try_show_tutorial(WeaveUITutorials.new_ui_disclaimer)
		Application.set_user_setting("use_gamepad_menu_layout", nil)
		Application.save_user_settings()
	end
end

UIManager.handle_transition = function (self, new_transition, params)
	fassert(params, "params are a required argument")

	local ingame_ui = self._ingame_ui

	if ingame_ui then
		if params.use_fade then
			return ingame_ui:transition_with_fade(new_transition, params, params.fade_in_speed, params.fade_out_speed)
		else
			return ingame_ui:handle_transition(new_transition, params)
		end
	end
end
