local definitions = local_require("scripts/ui/dlc_upsell/upsell_popup_definitions")
UpsellPopup = class(UpsellPopup)

UpsellPopup.init = function (self, ui_context, dlc_name, upsell_settings)
	self._ui_renderer = ui_context.ui_renderer
	self._ui_top_renderer = ui_context.ui_top_renderer
	self._input_manager = ui_context.input_manager
	self._wwise_world = ui_context.wwise_world
	self._render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true
	}
	self._dlc_name = dlc_name
	self._upsell_settings = upsell_settings
	self._animations = {}

	self:create_ui_elements()

	self._input_service_name = "upsell_popup"

	self:setup_input()
	self:setup_input_description()
end

UpsellPopup.create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	local widgets_by_name = nil
	self._widgets, widgets_by_name = UIUtils.create_widgets(definitions.widget_definitions)
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, definitions.animation_definitions)
	local upsell_settings = self._upsell_settings
	widgets_by_name.window_background.content.texture_id = upsell_settings.background_texture
	widgets_by_name.title_text.content.text = Localize(upsell_settings.title_text)
	widgets_by_name.body_text.content.text = Localize(upsell_settings.body_text)
	widgets_by_name.store_button.content.title_text = Localize(upsell_settings.button_text)
end

UpsellPopup.setup_input_description = function (self)
	local generic_input_actions = definitions.generic_input_actions

	if not generic_input_actions then
		return
	end

	local menu_desc = MenuInputDescriptionUI:new(nil, self._ui_top_renderer, Managers.input:get_service(self._input_service_name), 3, 900, definitions.generic_input_actions.default)

	menu_desc:set_input_description(self._upsell_settings.input_desc)

	self._menu_input_description = menu_desc
end

UpsellPopup.destroy = function (self)
	if self._is_visible then
		self:hide()
	end
end

UpsellPopup.show = function (self)
	assert(not self._is_visible)

	self._is_visible = true

	self:acquire_input()
	self:start_transition_animation("on_show", "transition_enter")
end

UpsellPopup.hide = function (self)
	if self._is_visible then
		self._is_visible = false

		self:release_input()
	end
end

UpsellPopup.exit_done = function (self)
	return not self._is_visible
end

UpsellPopup.update = function (self, dt)
	if not self._is_visible then
		return
	end

	self:handle_input(dt)
	self:update_animations(dt)
	self:draw(dt)
end

UpsellPopup.handle_input = function (self, dt)
	local input_service = self._input_manager:get_service(self._input_service_name)

	if input_service:get("toggle_menu", true) or input_service:get("back", true) then
		self:hide()

		return
	end

	local widgets_by_name = self._widgets_by_name

	if UIUtils.is_button_pressed(widgets_by_name.ok_button) or input_service:get("back", true) then
		self:hide()

		return
	end

	if UIUtils.is_button_pressed(widgets_by_name.store_button) or input_service:get("confirm_press", true) then
		Managers.unlock:open_dlc_page(self._dlc_name)

		return
	end
end

UpsellPopup.draw = function (self, dt)
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_manager:get_service(self._input_service_name)
	local render_settings = self._render_settings
	local gamepad_active = Managers.input:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)
	UIRenderer.draw_all_widgets(ui_top_renderer, self._widgets)
	UIRenderer.end_pass(ui_top_renderer)

	if gamepad_active and self._menu_input_description then
		self._menu_input_description:draw(ui_top_renderer, dt)
	end
end

UpsellPopup.start_transition_animation = function (self, key, animation_name)
	return self._ui_animator:start_animation(animation_name, nil, definitions.scenegraph_definition, {
		wwise_world = self._wwise_world,
		render_settings = self._render_settings
	})
end

UpsellPopup.update_animations = function (self, dt)
	self._ui_animator:update(dt)

	local widgets_by_name = self._widgets_by_name

	UIWidgetUtils.animate_default_button(widgets_by_name.ok_button, dt)
	UIWidgetUtils.animate_default_button(widgets_by_name.store_button, dt)
end

UpsellPopup.setup_input = function (self)
	local input_manager = self._input_manager
	local service_name = self._input_service_name

	input_manager:create_input_service(service_name, "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service(service_name, "keyboard")
	input_manager:map_device_to_service(service_name, "mouse")
	input_manager:map_device_to_service(service_name, "gamepad")
end

UpsellPopup.input_service = function (self)
	return self._input_manager:get_service(self._input_service_name)
end

UpsellPopup.acquire_input = function (self)
	self._input_manager:capture_input(ALL_INPUT_METHODS, 1, self._input_service_name, "UpsellPopup")
	ShowCursorStack.push()
end

UpsellPopup.release_input = function (self)
	self._input_manager:release_input(ALL_INPUT_METHODS, 1, self._input_service_name, "UpsellPopup")
	ShowCursorStack.pop()
end

return
