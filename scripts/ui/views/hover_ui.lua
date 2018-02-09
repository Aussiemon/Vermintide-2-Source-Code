local scenegraph_definition = {
	root = {
		is_root = true,
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.hover
		}
	},
	hover_root = {
		vertical_alignment = "bottom",
		parent = "root",
		horizontal_alignment = "left",
		size = {
			1,
			1
		},
		position = {
			0,
			0,
			1
		}
	},
	default_hover_widget = {
		vertical_alignment = "center",
		parent = "hover_root",
		horizontal_alignment = "center",
		size = {
			1,
			1
		},
		position = {
			10,
			10,
			1
		}
	}
}
local widget_definitions = {
	default_hover_widget = {
		scenegraph_id = "default_hover_widget",
		element = {
			passes = {
				{
					texture_id = "background",
					style_id = "background",
					pass_type = "rounded_background"
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				}
			}
		},
		content = {
			text = "description"
		},
		style = {
			text = {
				font_size = 28,
				word_wrap = true,
				pixel_perfect = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					1
				}
			},
			background = {
				corner_radius = 2,
				color = Colors.get_color_table_with_alpha("black", 200)
			}
		}
	}
}
HoverUI = class(HoverUI)
local TEXT_SIZE_MULTIPLIER = 1.1
local fake_input_service = {
	get = function ()
		return 
	end,
	has = function ()
		return 
	end
}
HoverUI.init = function (self, ingame_ui_context, input_service)
	self.ui_renderer = ingame_ui_context.ui_top_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_service = input_service
	self.ui_animations = {}

	self.create_ui_elements(self)

	return 
end
HoverUI.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.default_widget = UIWidget.init(widget_definitions.default_hover_widget)

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	return 
end
HoverUI.update_animations = function (self, dt)
	local ui_scenegraph = self.ui_scenegraph

	for name, ui_animation in pairs(self.ui_animations) do
		UIAnimation.update(ui_animation, dt)

		if UIAnimation.completed(ui_animation) then
			self.ui_animations[name] = nil
		end
	end

	return 
end
HoverUI.update = function (self, dt)
	if not self.show_ui then
		return 
	end

	local input_service = self.input_service or fake_input_service
	local ui_scenegraph = self.ui_scenegraph

	self.update_widget_pivot_position(self, ui_scenegraph, input_service)
	self.draw(self, dt, ui_scenegraph, input_service)

	return 
end
HoverUI.draw = function (self, dt, ui_scenegraph, input_service)
	local ui_renderer = self.ui_renderer

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)

	local active_widget = self.active_tooltip_widget

	if active_widget then
		UIRenderer.draw_widget(ui_renderer, active_widget)
	end

	UIRenderer.end_pass(ui_renderer)

	return 
end
HoverUI.update_objects = function (self)
	for index, data in ipairs(self._registered_hover_object) do
		local hover_content = data.hover_content

		if hover_content then
			if hover_content.disabled then
				return 
			end

			if hover_content.is_hover then
				local tooltip_name = data.name
				local tooltip_type = data.type
				local content = data.content
				local style = data.style

				self.display_object(self, tooltip_name, tooltip_type, content, style)
			end
		end
	end

	return 
end
HoverUI.display_object = function (self, name, type, content, style)
	if self.display_object_name == name then
		return 
	end

	self.display_object_name = name
	self.active_tooltip_widget = self.default_widget

	return 
end
HoverUI.stop_display_object = function (self)
	return 
end
HoverUI.destroy = function (self, dt)
	return 
end
HoverUI.register_widget = function (self, name, tooltip_type, hover_content, content, style)
	local hover_object_data = {
		name = name,
		type = tooltip_type,
		style = style,
		content = display_data,
		hover_content = hover_content
	}
	local index = #self._registered_hover_object + 1
	self._registered_hover_index_by_name[name] = index
	self._registered_hover_object[index] = hover_object_data

	return 
end
HoverUI.unregister_widget = function (self, name)
	local index = self._registered_hover_index_by_name[name]

	if index then
		self._registered_hover_object[index] = nil
		self._registered_hover_index_by_name[name] = nil
	end

	return 
end
HoverUI.get_text_size = function (self, localized_text, text_style)
	local font_size = text_style.font_size
	local font, scaled_font_size = UIFontByResolution(text_style)
	local text_width, text_height, min = UIRenderer.text_size(self.ui_renderer, localized_text, font[1], scaled_font_size)

	return text_width, text_height
end
HoverUI.animate_default_widget = function (self)
	return 
end
HoverUI.set_default_widget_text = function (self, text)
	local ui_scenegraph = self.ui_scenegraph
	local default_widget = self.default_widget
	local text_style = default_widget.style.text
	text = Localize(text)
	self.default_widget.content.text = text

	return 
end
HoverUI.update_widget_pivot_position = function (self, ui_scenegraph, input_service)
	local active_widget = self.active_tooltip_widget

	if active_widget then
		local hover_position = ui_scenegraph.hover_root.position
		local cursor_position = UIRenderer.scaled_cursor_position_by_scenegraph(input_service, ui_scenegraph, "root")
		hover_position[1] = cursor_position.x
		hover_position[2] = cursor_position.y
		local text_style = active_widget.style.text
		local text = active_widget.content.text
		local text_width, text_height = self.get_text_size(self, text, text_style)
		local widget_scenegraph_definition = ui_scenegraph.default_hover_widget
		widget_scenegraph_definition.size[1] = text_width*TEXT_SIZE_MULTIPLIER
		widget_scenegraph_definition.size[2] = text_height*TEXT_SIZE_MULTIPLIER
	end

	return 
end

return 
