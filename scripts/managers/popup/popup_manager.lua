require("scripts/ui/views/popup_handler")

PopupManager = class(PopupManager)

PopupManager.init = function (self)
	local top_world = Managers.world:world("top_ingame_view")
	self._ui_top_renderer = UIRenderer.create(top_world, "material", "materials/ui/ui_1080p_popup", "material", "materials/fonts/gw_fonts")
	local popup_context = {
		ui_renderer = self._ui_top_renderer,
		world = top_world
	}

	self:create_own_handler(popup_context)

	local poll_data = {
		num_updates = 0
	}
	self._poll_data = poll_data
end

PopupManager.create_own_handler = function (self, popup_context)
	self._handler = PopupHandler:new(popup_context, true)
end

PopupManager.update = function (self, dt)
	if self._handler then
		self._handler:update(dt, true)

		local popup_id, popup = self._handler:active_popup()

		if not popup_id then
			return
		end

		local poll_data = self._poll_data

		if poll_data.current_popup_id == popup_id then
			poll_data.num_updates = poll_data.num_updates + 1

			fassert(poll_data.num_updates <= 1, "Not polling current popup %q: %q", popup.topic or "nil", popup.text or "nil")
		else
			poll_data.current_popup_id = popup_id
			poll_data.num_updates = 1
		end
	end
end

PopupManager.destroy = function (self)
	local top_world = Managers.world:world("top_ingame_view")
	local ui_top_renderer = self._ui_top_renderer

	UIRenderer.destroy(ui_top_renderer, top_world)

	self._ui_top_renderer = nil
end

PopupManager.set_button_enabled = function (self, popup_id, button_index, enabled)
	return self._handler:set_button_enabled(popup_id, button_index, enabled)
end

PopupManager.queue_popup = function (self, text, topic, ...)
	print("PopupManager:queue_default_popup: ", text, topic, ...)

	local popup_type = "default"

	return self._handler:queue_popup(popup_type, text, topic, ...)
end

PopupManager.queue_password_popup = function (self, text, topic, ...)
	print("PopupManager:queue_password_popup: ", text, topic, ...)

	local popup_type = "password"

	return self._handler:queue_popup(popup_type, text, topic, ...)
end

PopupManager.activate_timer = function (self, popup_id, time, default_result, timer_alignment, blink, optional_timer_format_func, optional_font_size)
	return self._handler:activate_timer(popup_id, time, default_result, timer_alignment, blink, optional_timer_format_func, optional_font_size)
end

PopupManager.has_popup = function (self)
	return self._handler:has_popup()
end

PopupManager.has_popup_with_id = function (self, popup_id)
	return self._handler:has_popup_with_id(popup_id)
end

PopupManager.cancel_popup = function (self, popup_id)
	return self._handler:cancel_popup(popup_id)
end

PopupManager.cancel_all_popups = function (self)
	return self._handler:cancel_all_popups()
end

PopupManager.query_result = function (self, popup_id)
	local poll_data = self._poll_data

	if poll_data.current_popup_id == popup_id then
		poll_data.num_updates = 0
	end

	local result, params = self._handler:query_result(popup_id)

	if result then
		print("PopupManager:query_result returned result:", result)
	end

	return result, params
end

PopupManager.set_input_manager = function (self, input_manager)
	self._handler:set_input_manager(input_manager)
end

PopupManager.remove_input_manager = function (self, application_shutdown)
	self._handler:remove_input_manager(application_shutdown)
end

PopupManager.fit_text_width_to_popup = function (self, text)
	return self._handler:fit_text_width_to_popup(text)
end

PopupManager.set_popup_verifying_password = function (self, popup_id, is_verifying, status_message, error_message)
	return self._handler:set_popup_verifying_password(popup_id, is_verifying, status_message, error_message)
end

return
