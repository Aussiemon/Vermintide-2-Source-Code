-- chunkname: @scripts/ui/weave_tutorial/weave_tutorial_popup_ui.lua

local definitions = local_require("scripts/ui/weave_tutorial/weave_tutorial_popup_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local body_definitions = definitions.body_definitions
local animation_definitions = definitions.animation_definitions
local generic_input_actions = definitions.generic_input_actions

WeaveTutorialPopupUI = class(WeaveTutorialPopupUI)

local paragraph_divider_height = 40

WeaveTutorialPopupUI.init = function (self, ui_context)
	self.ui_renderer = ui_context.ui_renderer
	self.ui_top_renderer = ui_context.ui_top_renderer
	self.input_manager = ui_context.input_manager
	self.world = ui_context.world
	self.wwise_world = Managers.world:wwise_world(self.world)
	self.render_settings = {
		snap_pixel_positions = true,
	}
	self.ui_context = ui_context
	self.body_paragraphs = {}
	self.body_paragraph_heights = {}
	self._animations = {}

	self:_create_ui_elements()
	self:_setup_input()

	self._menu_input_description = MenuInputDescriptionUI:new(nil, self.ui_top_renderer, Managers.input:get_service("weave_tutorial"), 3, 900, generic_input_actions.default)

	self._menu_input_description:set_input_description(nil)
end

WeaveTutorialPopupUI._setup_input = function (self)
	self.input_manager:create_input_service("weave_tutorial", "IngameMenuKeymaps", "IngameMenuFilters")
	self.input_manager:map_device_to_service("weave_tutorial", "keyboard")
	self.input_manager:map_device_to_service("weave_tutorial", "mouse")
	self.input_manager:map_device_to_service("weave_tutorial", "gamepad")
end

WeaveTutorialPopupUI._create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	local widget_definitions = definitions.widget_definitions

	self.widgets = {}

	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		self.widgets[#self.widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self.widgets_by_name = widgets_by_name
	self.button_1 = widgets_by_name.button_1
	self.button_2 = widgets_by_name.button_2
	self.title_text = widgets_by_name.title_text
	self.sub_title_text = widgets_by_name.sub_title_text
	self.body_text = UIWidget.init(body_definitions.body_text)
	self.body_text_divider = UIWidget.init(body_definitions.paragraph_divider)

	local ui_scenegraph = self.ui_scenegraph

	self.title_start_y = UISceneGraph.get_world_position(ui_scenegraph, "title")[2]
	self.sub_title_start_y = UISceneGraph.get_world_position(ui_scenegraph, "sub_title")[2]
	self.body_start_y = UISceneGraph.get_world_position(ui_scenegraph, "body")[2]
	self.button_height = scenegraph_definition.button_1.position[2] + scenegraph_definition.button_1.size[2]

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
end

WeaveTutorialPopupUI.show = function (self, title, sub_title, body, optional_button_2, optional_button_2_func, optional_button_2_input_actions, disable_body_localization, data)
	if self.is_visible then
		print("WeaveTutorialPopupUI is already visible")

		return
	end

	self._optional_button_2_func = optional_button_2_func

	self._menu_input_description:set_input_description(optional_button_2_input_actions)
	self:start_transition_animation("on_show", "transition_enter")
	self:populate_message(title, sub_title, body, optional_button_2, disable_body_localization, data)

	self.is_visible = true

	self:_acquire_input()
end

WeaveTutorialPopupUI.show_custom_popup = function (self, popup_data)
	local popup_class_name = popup_data.custom_popup
	local klass = rawget(_G, popup_class_name)

	self._custom_popup = klass:new(self.ui_context, self)
	self.is_visible = true

	self:_acquire_input()
end

WeaveTutorialPopupUI.hide = function (self)
	if not self.is_visible then
		return
	end

	self.is_visible = false

	self:_release_input()
	self:_destroy_custom_popup()
end

WeaveTutorialPopupUI._destroy_custom_popup = function (self)
	if self._custom_popup then
		self._custom_popup:destroy()

		self._custom_popup = nil
	end
end

WeaveTutorialPopupUI.destroy = function (self)
	self:hide()

	self.widgets = nil
	self.widgets_by_name = nil
	self.button_1 = nil
	self.button_2 = nil
	self.title_text = nil
	self.sub_title_text = nil
	self.body_text = nil
	self.ui_animator = nil
end

WeaveTutorialPopupUI.update = function (self, dt)
	if not self.is_visible then
		return
	end

	local input_service = self.input_manager:get_service("weave_tutorial")

	if self._custom_popup then
		self._custom_popup:update(dt, input_service)
	else
		if UIUtils.is_button_pressed(self.button_1) or input_service:get("toggle_menu", true) or input_service:get("confirm_press", true) then
			self:hide()

			return
		end

		if self._optional_button_2_func and (UIUtils.is_button_pressed(self.button_2) or input_service:get("special_1_press", true)) then
			self._optional_button_2_func(self)
			self:hide()

			return
		end

		self:_update_animations(dt)
		self:_draw(dt, input_service)
	end
end

WeaveTutorialPopupUI._update_animations = function (self, dt)
	self.ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	UIWidgetUtils.animate_default_button(self.button_1, dt)
	UIWidgetUtils.animate_default_button(self.button_2, dt)
end

WeaveTutorialPopupUI._draw = function (self, dt, input_service)
	if self._custom_popup then
		return
	end

	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local render_settings = self.render_settings
	local gamepad_active = Managers.input:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self.widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	self:draw_body(ui_top_renderer)
	UIRenderer.end_pass(ui_top_renderer)

	if gamepad_active then
		self._menu_input_description:draw(ui_top_renderer, dt)
	end
end

WeaveTutorialPopupUI.populate_message = function (self, title_text, sub_title_text, body_text, optional_button_2, disable_body_localization)
	local title = self.title_text.content

	title.text = title_text or ""
	title.visible = title_text ~= nil

	local sub_title = self.sub_title_text.content

	sub_title.text = sub_title_text or ""
	sub_title.visible = sub_title_text ~= nil

	local button_2 = self.button_2

	if optional_button_2 then
		button_2.content.visible = true
		button_2.content.title_text = Localize(optional_button_2)
	else
		button_2.content.visible = false
	end

	local localized_body_text = disable_body_localization and body_text or Localize(body_text)

	self.body_paragraphs = UIRenderer.break_paragraphs(localized_body_text, {})

	self:resize_to_fit()

	local widgets = self.widgets

	for i = 1, #widgets do
		widgets[i].element.dirty = true
	end
end

WeaveTutorialPopupUI.resize_to_fit = function (self)
	local ui_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local sub_title_text_def = ui_scenegraph.sub_title
	local body_text_def = ui_scenegraph.body
	local window_def = ui_scenegraph.window
	local body_widget_size = body_text_def.size
	local body_text = self.body_text
	local style = body_text.style.text
	local body_height = 0

	self.body_paragraph_heights = {}

	local paragraphs = self.body_paragraphs
	local num_paragraphs = #paragraphs

	for i = 1, num_paragraphs do
		local height = UIUtils.get_text_height(ui_renderer, body_widget_size, style, paragraphs[i])

		self.body_paragraph_heights[i] = height
		body_height = body_height + height

		if i < num_paragraphs then
			body_height = body_height + paragraph_divider_height
		end
	end

	body_text_def.size[2] = body_height

	local title_visible = self.title_text.content.visible
	local original_subtitle_pos = scenegraph_definition.sub_title.position

	sub_title_text_def.position[2] = title_visible and original_subtitle_pos[2] or 0

	local sub_title_visible = self.sub_title_text.content.visible
	local original_body_pos = scenegraph_definition.body.position

	body_text_def.position[2] = sub_title_visible and original_body_pos[2] or original_subtitle_pos[2]

	local base_window_height = self:calculate_base_window_height()

	window_def.size[2] = body_height + base_window_height

	local button_1 = self.button_1
	local button_2 = self.button_2

	if button_2.content.visible then
		local spacing = 20
		local button_size = scenegraph_definition.button_1.size

		button_1.offset[1] = button_size[1] * 0.5 + spacing
		button_2.offset[1] = -button_size[1] * 0.5 - spacing
	else
		button_1.offset[1] = 0
	end
end

WeaveTutorialPopupUI.calculate_base_window_height = function (self)
	local title_size = self.title_start_y - self.sub_title_start_y
	local title_offset = self.title_text.content.visible and 0 or title_size
	local sub_title_size = self.sub_title_start_y - self.body_start_y
	local sub_title_offset = self.sub_title_text.content.visible and 0 or sub_title_size
	local window_height = self.button_height - self.body_start_y - title_offset + 50

	return window_height
end

WeaveTutorialPopupUI.draw_body = function (self, renderer)
	local body_text_widget = self.body_text
	local divider_widget = self.body_text_divider
	local text_offset = body_text_widget.offset
	local divider_offset = divider_widget.offset
	local y_offset = 0
	local paragraphs = self.body_paragraphs
	local paragraph_heights = self.body_paragraph_heights
	local num_paragraphs = #paragraphs

	for i = 1, num_paragraphs do
		text_offset[2] = -y_offset
		body_text_widget.content.text = paragraphs[i]

		UIRenderer.draw_widget(renderer, body_text_widget)

		y_offset = y_offset + paragraph_heights[i]

		if i < num_paragraphs then
			divider_offset[2] = -(y_offset + paragraph_divider_height / 2)

			UIRenderer.draw_widget(renderer, divider_widget)

			y_offset = y_offset + paragraph_divider_height
		end
	end
end

WeaveTutorialPopupUI.start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings,
		text_highlight_widget = self.widgets_by_name.result_text_bg,
	}
	local widgets = {
		self.widgets_by_name.screen_background,
	}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[key] = anim_id
end

WeaveTutorialPopupUI._acquire_input = function (self)
	local input_manager = self.input_manager

	input_manager:capture_input({
		"keyboard",
		"gamepad",
		"mouse",
	}, 1, "weave_tutorial", "WeaveTutorialPopupUI")
	ShowCursorStack.show("WeaveTutorialPopupUI")
end

WeaveTutorialPopupUI._release_input = function (self)
	local input_manager = self.input_manager

	input_manager:release_input({
		"keyboard",
		"gamepad",
		"mouse",
	}, 1, "weave_tutorial", "WeaveTutorialPopupUI")
	ShowCursorStack.hide("WeaveTutorialPopupUI")
end
