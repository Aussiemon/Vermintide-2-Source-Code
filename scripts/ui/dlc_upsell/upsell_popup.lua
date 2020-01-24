UpsellPopup = class(UpsellPopup)

UpsellPopup.init = function (self, ui_context, dlc_name)
	self.ui_renderer = ui_context.ui_renderer
	self.ui_top_renderer = ui_context.ui_top_renderer
	self.input_manager = ui_context.input_manager
	self.world = ui_context.world
	self.ui_context = ui_context
	self.wwise_world = Managers.world:wwise_world(self.world)
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.input_acquired = false
	self._dlc_name = dlc_name
	self._animations = {}

	self:create_ui_elements()

	self._input_service_name = "upsell_popup"

	self:_setup_input()
	self:_setup_input_description()
end

UpsellPopup.get_definitions = function (self)
	return nil
end

UpsellPopup._setup_input_description = function (self)
	local definitions = self:get_definitions()

	if definitions.generic_input_actions then
		self._menu_input_description = MenuInputDescriptionUI:new(nil, self.ui_top_renderer, Managers.input:get_service(self._input_service_name), 3, 900, definitions.generic_input_actions.default)

		self._menu_input_description:set_input_description(nil)
	end
end

UpsellPopup.create_ui_elements = function (self)
	local definitions = self:get_definitions()
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	local widget_definitions = definitions.widget_definitions
	self.widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		self.widgets[#self.widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self.widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, definitions.animation_definitions)
end

UpsellPopup.show = function (self)
	if self.is_visible then
		print("UpsellPopup is already visible")

		return false
	end

	self.is_visible = true

	self:_acquire_input()

	return true
end

UpsellPopup.hide = function (self)
	if not self.is_visible then
		return
	end

	self.is_visible = false

	self:_release_input()
end

UpsellPopup.exit_done = function (self)
	return not self.is_visible
end

UpsellPopup.destroy = function (self)
	self:hide()

	self.widgets = nil
	self.widgets_by_name = nil
	self.ui_animator = nil
end

UpsellPopup.update = function (self, dt)
	if not self.is_visible then
		return
	end

	if Managers.state and Managers.state.voting:vote_in_progress() then
		if self.input_acquired then
			self:_release_input()
		end

		return
	elseif not self.input_acquired then
		self:_acquire_input()
	end

	self:handle_input(dt)
	self:update_animations(dt)
	self:draw(dt)
end

UpsellPopup.handle_input = function (self, dt)
	local input_service = self.input_manager:get_service(self._input_service_name)

	if input_service:get("toggle_menu", true) or input_service:get("back", true) then
		self:hide()

		return
	end
end

UpsellPopup.draw = function (self, dt)
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service(self._input_service_name)
	local render_settings = self.render_settings
	local gamepad_active = Managers.input:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self.widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)

	if gamepad_active and self._menu_input_description then
		self._menu_input_description:draw(ui_top_renderer, dt)
	end
end

UpsellPopup.show_store = function (self, dlc_name_override)
	local dlc_name = dlc_name_override or self._dlc_name

	if PLATFORM == "win32" and rawget(_G, "Steam") then
		local unlock_area = AreaSettings[dlc_name]
		local url = unlock_area and unlock_area.store_page_url

		if url then
			Steam.open_url(url)
		end
	elseif PLATFORM == "xb1" then
		local unlock_settings = UnlockSettings[1].unlocks
		local dlc_settings = unlock_settings[dlc_name]
		local product_id = dlc_settings.id
		local user_id = Managers.account:user_id()

		XboxLive.show_product_details(user_id, product_id)
	elseif PLATFORM == "ps4" then
		local user_id = Managers.account:user_id()
		local product_label = ProductLabels[dlc_name]

		Managers.system_dialog:open_commerce_dialog(NpCommerceDialog.MODE_PRODUCT, user_id, {
			product_label
		})
	end
end

UpsellPopup.start_transition_animation = function (self, key, animation_name)
	local definitions = self:get_definitions()
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, definitions.scenegraph_definition, params)
	self._animations[key] = anim_id
end

UpsellPopup.update_animations = function (self, dt)
	self.ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

UpsellPopup.input_service = function (self)
	return self.input_manager:get_service(self._input_service_name)
end

UpsellPopup._setup_input = function (self)
	self.input_manager:create_input_service(self._input_service_name, "IngameMenuKeymaps", "IngameMenuFilters")
	self.input_manager:map_device_to_service(self._input_service_name, "keyboard")
	self.input_manager:map_device_to_service(self._input_service_name, "mouse")
	self.input_manager:map_device_to_service(self._input_service_name, "gamepad")
end

UpsellPopup._acquire_input = function (self)
	local input_manager = self.input_manager

	input_manager:capture_input({
		"keyboard",
		"gamepad",
		"mouse"
	}, 1, self._input_service_name, "UpsellPopup")
	ShowCursorStack.push()

	self.input_acquired = true
end

UpsellPopup._release_input = function (self)
	local input_manager = self.input_manager

	input_manager:release_input({
		"keyboard",
		"gamepad",
		"mouse"
	}, 1, self._input_service_name, "UpsellPopup")
	ShowCursorStack.pop()

	self.input_acquired = false
end

return
