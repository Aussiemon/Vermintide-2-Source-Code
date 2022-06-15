require("scripts/ui/dlc_upsell/common_popup")

UnlockReminderPopup = class(UnlockReminderPopup, CommonPopup)

UnlockReminderPopup.create_ui_elements = function (self)
	UnlockReminderPopup.super.create_ui_elements(self)

	local reminder_settings = self._common_settings
	self._widgets_by_name.window_background.content.texture_id = reminder_settings.background_texture
	self._widgets_by_name.body_text.content.text = reminder_settings.body_text
	self._widgets_by_name.ok_button.content.title_text = Localize(reminder_settings.button_text)

	if reminder_settings.top_detail_texture then
		self._widgets_by_name.window_top_detail.content.texture_id = reminder_settings.top_detail_texture.texture
		self._widgets_by_name.window_top_detail.style.texture_id.size = reminder_settings.top_detail_texture.size
		self._widgets_by_name.window_top_detail.style.texture_id.offset = reminder_settings.top_detail_texture.offset
	end
end

UnlockReminderPopup.update = function (self, dt)
	UnlockReminderPopup.super.update(self, dt)

	if self:should_show() and not self._has_widget_been_closed then
		self:show()
	end
end

UnlockReminderPopup._handle_input = function (self, dt)
	local input_service = self:_get_input_service()
	local widgets_by_name = self._widgets_by_name

	if UIUtils.is_button_pressed(widgets_by_name.ok_button) or input_service:get("back", true) or input_service:get("confirm_press", true) then
		self._has_widget_been_closed = true
		SaveData.new_dlcs_unlocks[self._dlc_name] = false

		Managers.save:auto_save(SaveFileName, SaveData)
		self:hide()

		return
	end
end

UnlockReminderPopup.show = function (self)
	UnlockReminderPopup.super.show(self)
	self:_start_transition_animation("on_enter")
end

UnlockReminderPopup.hide = function (self)
	self._exit_anim_id = self:_start_transition_animation("on_exit")
end

UnlockReminderPopup._start_transition_animation = function (self, animation_name)
	return self._ui_animator:start_animation(animation_name, nil, self._common_settings.definitions.scenegraph_definition, {
		wwise_world = self._wwise_world,
		render_settings = self._render_settings
	})
end

UnlockReminderPopup._update_animations = function (self, dt)
	UnlockReminderPopup.super._update_animations(self, dt)

	if self._exit_anim_id and self._ui_animator:is_animation_completed(self._exit_anim_id) then
		self._is_visible = false

		self:release_input()
	end

	local widgets_by_name = self._widgets_by_name

	UIWidgetUtils.animate_default_button(widgets_by_name.ok_button, dt)
end

UnlockReminderPopup.should_show = function (self)
	return self._ui_context.is_in_inn and Managers.popup:has_popup() == false and self._ui_context.ingame_ui.current_view == nil and self._ui_context.ingame_ui.has_left_menu and not self._is_visible
end

return
