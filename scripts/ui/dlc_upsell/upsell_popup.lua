require("scripts/ui/dlc_upsell/common_popup")

UpsellPopup = class(UpsellPopup, CommonPopup)

UpsellPopup.create_ui_elements = function (self)
	UpsellPopup.super.create_ui_elements(self)

	local upsell_settings = self._common_settings
	self._widgets_by_name.window_background.content.texture_id = upsell_settings.background_texture
	self._widgets_by_name.title_text.content.text = Localize(upsell_settings.title_text)
	self._widgets_by_name.body_text.content.text = Localize(upsell_settings.body_text)
	self._widgets_by_name.store_button.content.title_text = Localize(upsell_settings.button_text)
end

UpsellPopup.update = function (self, dt)
	UpsellPopup.super.update(self, dt)

	if self:should_show() and not self._has_widget_been_closed then
		self:show()
	end
end

UpsellPopup._handle_input = function (self, dt)
	local input_service = self:_get_input_service()

	if input_service:get("toggle_menu", true) or input_service:get("back", true) then
		self._has_widget_been_closed = true

		self:hide()

		return
	end

	local widgets_by_name = self._widgets_by_name

	if UIUtils.is_button_pressed(widgets_by_name.ok_button) or input_service:get("back", true) then
		self._has_widget_been_closed = true

		self:hide()

		return
	end

	if UIUtils.is_button_pressed(widgets_by_name.store_button) or input_service:get("confirm_press", true) then
		Managers.unlock:open_dlc_page(self._dlc_name)

		return
	end
end

UpsellPopup._start_transition_animation = function (self, animation_name)
	return self._ui_animator:start_animation(animation_name, nil, self._common_settings.definitions.scenegraph_definition, {
		wwise_world = self._wwise_world,
		render_settings = self._render_settings
	})
end

UpsellPopup._update_animations = function (self, dt)
	UpsellPopup.super._update_animations(self, dt)

	local widgets_by_name = self._widgets_by_name

	UIWidgetUtils.animate_default_button(widgets_by_name.ok_button, dt)
	UIWidgetUtils.animate_default_button(widgets_by_name.store_button, dt)
end

return
