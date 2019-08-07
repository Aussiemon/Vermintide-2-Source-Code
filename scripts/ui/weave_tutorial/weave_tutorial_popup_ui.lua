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
		snap_pixel_positions = true
	}
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
	self.ok_button = widgets_by_name.ok_button
	self.title_text = widgets_by_name.title_text
	self.sub_title_text = widgets_by_name.sub_title_text
	self.body_text = UIWidget.init(body_definitions.body_text)
	self.body_text_divider = UIWidget.init(body_definitions.paragraph_divider)
	local ui_scenegraph = self.ui_scenegraph
	self.title_start_y = UISceneGraph.get_world_position(ui_scenegraph, "title")[2]
	self.sub_title_start_y = UISceneGraph.get_world_position(ui_scenegraph, "sub_title")[2]
	self.body_start_y = UISceneGraph.get_world_position(ui_scenegraph, "body")[2]
	self.button_height = scenegraph_definition.ok_button.position[2] + scenegraph_definition.ok_button.size[2]

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
end

WeaveTutorialPopupUI.show = function (self, title, sub_title, body)
	if self.is_visible then
		print("WeaveTutorialPopupUI is already visible")

		return
	end

	self:start_transition_animation("on_show", "transition_enter")
	self:populate_message(title, sub_title, body)

	self.is_visible = true

	self:_acquire_input()
end

WeaveTutorialPopupUI.hide = function (self)
	if not self.is_visible then
		return
	end

	self.is_visible = false

	self:_release_input()
end

WeaveTutorialPopupUI.destroy = function (self)
	self:hide()

	self.widgets = nil
	self.widgets_by_name = nil
	self.ok_button = nil
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

	if UIUtils.is_button_pressed(self.ok_button) or input_service:get("toggle_menu", true) or input_service:get("confirm_press", true) then
		self:hide()

		return
	end

	self:_update_animations(dt)
	self:_draw(dt, input_service)
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

	UIWidgetUtils.animate_default_button(self.ok_button, dt)
end

WeaveTutorialPopupUI._draw = function (self, dt, input_service)
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

WeaveTutorialPopupUI.populate_message = function (self, title_text, sub_title_text, body_text)
	local title = self.title_text.content
	title.text = title_text or ""
	title.visible = title_text ~= nil
	local sub_title = self.sub_title_text.content
	sub_title.text = sub_title_text or ""
	sub_title.visible = sub_title_text ~= nil
	self.body_paragraphs = self:break_paragraphs(Localize(body_text))

	self:resize_to_fit()

	local widgets = self.widgets

	for i = 1, #widgets, 1 do
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

	for i = 1, num_paragraphs, 1 do
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
	sub_title_text_def.position[2] = (title_visible and original_subtitle_pos[2]) or 0
	local sub_title_visible = self.sub_title_text.content.visible
	local original_body_pos = scenegraph_definition.body.position
	body_text_def.position[2] = (sub_title_visible and original_body_pos[2]) or original_subtitle_pos[2]
	local base_window_height = self:calculate_base_window_height()
	window_def.size[2] = body_height + base_window_height
end

WeaveTutorialPopupUI.calculate_base_window_height = function (self)
	local title_size = self.title_start_y - self.sub_title_start_y
	local title_offset = (self.title_text.content.visible and 0) or title_size
	local sub_title_size = self.sub_title_start_y - self.body_start_y
	local sub_title_offset = (self.sub_title_text.content.visible and 0) or sub_title_size
	local window_height = self.button_height - self.body_start_y - title_offset + 50

	return window_height
end

WeaveTutorialPopupUI.break_paragraphs = function (self, text)
	local paragraphs = {}
	local i = 1

	for line in text:gmatch("[^\r\n]+") do
		paragraphs[i] = line
		i = i + 1
	end

	return paragraphs
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

	for i = 1, num_paragraphs, 1 do
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
		text_highlight_widget = self.widgets_by_name.result_text_bg
	}
	local widgets = {
		self.widgets_by_name.screen_background
	}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[key] = anim_id
end

WeaveTutorialPopupUI._acquire_input = function (self)
	local input_manager = self.input_manager

	input_manager:capture_input({
		"keyboard",
		"gamepad",
		"mouse"
	}, 1, "weave_tutorial", "WeaveTutorialPopupUI")
	ShowCursorStack.push()
end

WeaveTutorialPopupUI._release_input = function (self)
	local input_manager = self.input_manager

	input_manager:release_input({
		"keyboard",
		"gamepad",
		"mouse"
	}, 1, "weave_tutorial", "WeaveTutorialPopupUI")
	ShowCursorStack.pop()
end

return
