-- chunkname: @scripts/ui/weave_tutorial/custom_popups/new_ui_popup.lua

local definitions = local_require("scripts/ui/weave_tutorial/custom_popups/new_ui_popup_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local generic_input_actions = definitions.generic_input_actions
local page_data_definitions = definitions.page_data
local VIDEO_REFERENCE_NAME = "new_ui_popup"

NewUIPopup = class(NewUIPopup)

NewUIPopup.init = function (self, ui_context, parent)
	self._ui_top_renderer = ui_context.ui_top_renderer
	self._input_manager = ui_context.input_manager
	self._world = ui_context.world
	self._wwise_world = Managers.world:wwise_world(self.world)
	self._render_settings = {
		snap_pixel_positions = true,
	}
	self._parent = parent
	self._animations = {}

	self:_create_ui_elements()

	local input_service = Managers.input:get_service("weave_tutorial")

	self._menu_input_description = MenuInputDescriptionUI:new(nil, self._ui_top_renderer, input_service, 3, 900, generic_input_actions.default)

	self._menu_input_description:set_input_description(nil)
end

NewUIPopup.destroy = function (self)
	self:_destroy_video()
end

NewUIPopup._create_ui_elements = function (self)
	self:_destroy_video()

	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	local base_widgets = {}
	local button_widgets = {}
	local page_widgets = {}
	local widgets_by_name = {}
	local base_widget_definitions = definitions.base_widget_definitions

	for name, widget_definition in pairs(base_widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		base_widgets[#base_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	local page_widget_definitions = definitions.page_widget_definitions

	for name, widget_definition in pairs(page_widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		page_widgets[#page_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._base_widgets = base_widgets
	self._page_widgets = page_widgets
	self._widgets_by_name = widgets_by_name
	self._pages_seen = 0

	UIRenderer.clear_scenegraph_queue(self._ui_top_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	self:_change_page(1)
end

NewUIPopup._clear_page_data = function (self)
	self:_destroy_video()

	self._current_page_widgets = {}
end

NewUIPopup._change_page = function (self, index)
	self:_clear_page_data()

	local page_data = page_data_definitions[index]
	local page_widgets = page_data.widgets
	local widgets_by_name = self._widgets_by_name

	for _, widget_name in pairs(page_widgets) do
		self._current_page_widgets[#self._current_page_widgets + 1] = widgets_by_name[widget_name]
	end

	self:_create_video(page_data.video)

	local max_page_num = #page_data_definitions

	if index < max_page_num then
		self._current_page_widgets[#self._current_page_widgets + 1] = self._widgets_by_name.next_button
	else
		self._current_page_widgets[#self._current_page_widgets + 1] = self._widgets_by_name.ok_button
	end

	if index > 1 then
		self._current_page_widgets[#self._current_page_widgets + 1] = self._widgets_by_name.prev_button
	end

	self._page_index = index
	self._button_index = nil

	if index > self._pages_seen then
		self:start_transition_animation("page_enter", "page_" .. index)

		self._pages_seen = index
	end
end

NewUIPopup._create_video = function (self, video_data)
	if not video_data then
		return
	end

	self._video_data = video_data
	self._video_widget = UIWidget.init(UIWidgets.create_video("video", self._video_data.material_name, VIDEO_REFERENCE_NAME))
end

NewUIPopup._destroy_video = function (self)
	local ui_top_renderer = self._ui_top_renderer

	self._video_data = nil

	if self._video_widget then
		UIWidget.destroy(ui_top_renderer, self._video_widget)

		self._video_widget = nil
	end

	if ui_top_renderer.video_players[VIDEO_REFERENCE_NAME] then
		UIRenderer.destroy_video_player(ui_top_renderer, VIDEO_REFERENCE_NAME, self._world)
	end
end

NewUIPopup.update = function (self, dt, input_service)
	self:_update_animations(dt)
	self:_handle_input(dt, input_service)
	self:_draw(dt, input_service)
end

NewUIPopup._update_animations = function (self, dt)
	self._ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self._ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local max_page_num = #page_data_definitions

	if max_page_num > self._page_index then
		UIWidgetUtils.animate_default_button(self._widgets_by_name.next_button, dt)
	else
		UIWidgetUtils.animate_default_button(self._widgets_by_name.ok_button, dt)
	end

	if self._page_index > 1 then
		UIWidgetUtils.animate_default_button(self._widgets_by_name.prev_button, dt)
	end
end

NewUIPopup._handle_input = function (self, dt, input_service)
	if not self._video_exanded then
		self:_handle_keyboard_input(dt, input_service)

		local confirm_pressed = input_service:get("confirm", true)
		local page_index = self._page_index
		local max_page_num = #page_data_definitions

		if max_page_num > self._page_index then
			local widget = self._widgets_by_name.next_button

			if widget.content.visible and UIUtils.is_button_pressed(self._widgets_by_name.next_button, nil, confirm_pressed) then
				page_index = math.min(page_index + 1, max_page_num)
			end
		else
			local widget = self._widgets_by_name.ok_button

			if widget.content.visible and UIUtils.is_button_pressed(self._widgets_by_name.ok_button, nil, confirm_pressed) then
				self._parent:hide()
			end
		end

		if self._page_index > 1 then
			local widget = self._widgets_by_name.prev_button

			if widget.content.visible and UIUtils.is_button_pressed(self._widgets_by_name.prev_button, nil, confirm_pressed) then
				page_index = math.max(page_index - 1, 1)
			end
		end

		if page_index ~= self._page_index then
			self:_change_page(page_index)
		end
	end

	self:_handle_expand_video(input_service)
end

NewUIPopup._handle_keyboard_input = function (self, dt, input_service)
	local button_widgets = {}
	local widgets_by_name = self._widgets_by_name
	local page_index = self._page_index
	local max_page_num = #page_data_definitions

	if self._page_index > 1 then
		button_widgets[#button_widgets + 1] = widgets_by_name.prev_button
	end

	if max_page_num > self._page_index then
		button_widgets[#button_widgets + 1] = widgets_by_name.next_button
	else
		button_widgets[#button_widgets + 1] = widgets_by_name.ok_button
	end

	local mouse_active = Managers.input:is_device_active("mouse")

	if mouse_active then
		for _, button_data in pairs(button_widgets) do
			local button_widget = button_data

			button_widget.content.button_hotspot.is_selected = false
		end

		self._button_index = nil

		return
	end

	local num_buttons = #button_widgets
	local index = self._button_index or num_buttons
	local input_service = Managers.input:get_service("popup")

	if input_service:get("move_right_hold_continuous") then
		index = math.clamp(index + 1, 1, num_buttons)
	elseif input_service:get("move_left_hold_continuous") then
		index = math.clamp(index - 1, 1, num_buttons)
	end

	if index ~= self._button_index then
		for idx, button_data in ipairs(button_widgets) do
			local button_widget = button_data

			button_widget.content.button_hotspot.is_selected = index == idx
		end

		self._button_index = index

		self:_play_sound("Play_hud_hover")
	end
end

NewUIPopup._draw = function (self, dt, input_service)
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings
	local gamepad_active = Managers.input:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._base_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	for _, widget in ipairs(self._current_page_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	self:_draw_video(ui_top_renderer)
	UIRenderer.end_pass(ui_top_renderer)

	if gamepad_active then
		self._menu_input_description:draw(ui_top_renderer, dt)
	end
end

NewUIPopup._draw_video = function (self, renderer)
	if not self._video_data then
		return
	end

	if not renderer.video_players[VIDEO_REFERENCE_NAME] then
		UIRenderer.create_video_player(renderer, VIDEO_REFERENCE_NAME, self._world, self._video_data.video_name, self._video_data.loop)
	else
		local video_complete = self._video_widget.content.video_content.video_completed

		if video_complete and not self._video_data.loop then
			UIRenderer.destroy_video_player(renderer, VIDEO_REFERENCE_NAME)

			self._video_data.sound_started = false

			if self._video_data.sound_stop then
				Managers.music:trigger_event(self._video_data.sound_stop)
			end

			if not Managers.transition:loading_icon_active() then
				Managers.transition:show_loading_icon()
			end
		else
			if not self._video_data.sound_started then
				if self._video_data.sound_start then
					Managers.music:trigger_event(self._video_data.sound_start)
				end

				self._video_data.sound_started = true
			end

			UIRenderer.draw_widget(renderer, self._video_widget)
		end
	end
end

NewUIPopup._handle_expand_video = function (self, input_service)
	if not self._video_exanded then
		if UIUtils.is_button_pressed(self._widgets_by_name.video_hover) then
			self._video_widget.scenegraph_id = "expanded_video"
			self._video_exanded = true
		end
	elseif input_service:get("left_release", true) or input_service:get("confirm", true) or input_service:get("toggle_menu", true) then
		self._video_widget.scenegraph_id = "video"
		self._video_exanded = false
	end
end

NewUIPopup.start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self._wwise_world,
		render_settings = self._render_settings,
		page_data = page_data_definitions[self._page_index],
		video_widget = self._video_widget,
	}
	local widgets = self._widgets_by_name
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[key] = anim_id
end

NewUIPopup._play_sound = function (self, event_name)
	Managers.music:trigger_event(event_name)
end
