local definitions = local_require("scripts/ui/views/tutorial_intro_ui_definitions")
local template_settings = {
	template_1 = {
		{
			fade_out_duration = 0.2,
			font_upper_case = false,
			localize = false,
			delay = 0,
			font_size = 40,
			sound_event = "hud_area_indicator",
			text = "cash",
			fade_in_duration = 0.2,
			duration = 2,
			font_type = "hell_shark_header",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				200,
				0,
				0
			}
		},
		{
			fade_out_duration = 0.3,
			font_upper_case = false,
			localize = false,
			delay = 1,
			font_size = 60,
			sound_event = "hud_area_indicator",
			text = "me",
			fade_in_duration = 0.2,
			duration = 2,
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				-200,
				0
			}
		},
		{
			fade_out_duration = 0.3,
			font_upper_case = true,
			localize = false,
			delay = 1,
			font_size = 80,
			sound_event = "hud_area_indicator",
			text = "ousside",
			fade_in_duration = 0.1,
			duration = 4,
			font_type = "hell_shark_header",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				0,
				0
			}
		},
		{
			fade_out_duration = 0.5,
			image = "hero_view_home_logo",
			delay = 3,
			sound_event = "hud_area_indicator",
			fade_in_duration = 0.5,
			duration = 2,
			image_size = {
				280,
				200
			},
			offset = {
				0,
				0,
				0
			}
		},
		{
			fade_out_duration = 1.5,
			font_upper_case = true,
			localize = false,
			delay = 0,
			font_size = 180,
			sound_event = "hud_area_indicator",
			text = "howbow_dah",
			fade_in_duration = 0.2,
			duration = 3,
			font_type = "hell_shark_header",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				0,
				0
			}
		}
	},
	template_2 = {
		{
			fade_out_duration = 0.2,
			font_upper_case = false,
			localize = false,
			delay = 0,
			font_size = 40,
			sound_event = "hud_area_indicator",
			text = "cash",
			fade_in_duration = 0.2,
			duration = 2,
			font_type = "hell_shark_header",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				0,
				0
			}
		},
		{
			fade_out_duration = 0.3,
			font_upper_case = false,
			localize = false,
			delay = 1,
			font_size = 60,
			sound_event = "hud_area_indicator",
			text = "me",
			fade_in_duration = 0.2,
			duration = 2,
			font_type = "hell_shark",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				0,
				0
			}
		},
		{
			fade_out_duration = 0.3,
			font_upper_case = true,
			localize = false,
			delay = 1,
			font_size = 80,
			sound_event = "hud_area_indicator",
			text = "ousside",
			fade_in_duration = 0.1,
			duration = 4,
			font_type = "hell_shark_header",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				0,
				0
			}
		},
		{
			fade_out_duration = 0.5,
			image = "hero_view_home_logo",
			delay = 3,
			sound_event = "hud_area_indicator",
			fade_in_duration = 0.5,
			duration = 2,
			image_size = {
				280,
				200
			},
			offset = {
				0,
				0,
				0
			}
		},
		{
			fade_out_duration = 1.5,
			font_upper_case = true,
			localize = false,
			delay = 0,
			font_size = 180,
			sound_event = "hud_area_indicator",
			text = "howbow_dah",
			fade_in_duration = 0.2,
			duration = 3,
			font_type = "hell_shark_header",
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				0,
				0
			}
		}
	}
}
local DO_RELOAD = false
TutorialIntroUI = class(TutorialIntroUI)
TutorialIntroUI.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	local world = ingame_ui_context.world_manager:world("level_world")
	self.wwise_world = Managers.world:wwise_world(world)

	Managers.state.event:register(self, "event_start_tutorial_intro_text", "event_start_tutorial_intro_text")
	self.create_ui_elements(self)

	return 
end
TutorialIntroUI.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self.active_template_lists = {}
	local widgets_by_template = {}

	for template_list_name, _ in pairs(template_settings) do
		local widgets = {
			text_widget = UIWidget.init(definitions.widget_definitions.text),
			image_widget = UIWidget.init(definitions.widget_definitions.image)
		}
		widgets_by_template[template_list_name] = widgets
	end

	self.widgets_by_template = widgets_by_template

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	DO_RELOAD = false

	return 
end
TutorialIntroUI.destroy = function (self)
	if Managers.state.event then
		Managers.state.event:unregister("event_start_tutorial_intro_text", self)
	end

	return 
end
TutorialIntroUI.event_start_tutorial_intro_text = function (self)
	self.start_template_by_index(self, "template_1", 1)
	self.start_template_by_index(self, "template_2", 1)

	return 
end
TutorialIntroUI.start_template_by_index = function (self, template_list_name, index)
	local template_list_data = self.active_template_lists[template_list_name] or {}
	self.active_template_lists[template_list_name] = template_list_data
	local template_list = template_settings[template_list_name]
	local template = template_list[index]
	local text = template.text
	local image = template.image
	local duration = template.duration
	local delay = template.delay
	local fade_in_duration = template.fade_in_duration
	local fade_out_duration = template.fade_out_duration
	local widgets = self.widgets_by_template[template_list_name]
	local widget = nil

	if text then
		widget = widgets.text_widget
		local localize = template.localize
		widget.content.text = (localize and Localize(text)) or text
		local font_size = template.font_size
		local font_type = template.font_type
		local font_upper_case = template.font_upper_case
		local color = template.color or Colors.get_color_table_with_alpha("white", 255)
		local offset = template.offset
		local style = widget.style
		local text_style = style.text
		local text_shadow_style = style.text_shadow
		local text_color = text_style.text_color
		text_color[2] = color[2]
		text_color[3] = color[3]
		text_color[4] = color[4]
		text_style.font_size = font_size
		text_shadow_style.font_size = font_size
		text_style.font_type = font_type
		text_shadow_style.font_type = font_type
		text_style.upper_case = font_upper_case
		text_shadow_style.upper_case = font_upper_case
		local text_offset = text_style.offset
		local text_shadow_offset = text_shadow_style.offset
		text_offset[1] = offset[1]
		text_offset[2] = offset[2]
		text_offset[3] = offset[3]
		text_shadow_offset[1] = offset[1] + 2
		text_shadow_offset[2] = offset[2] - 2
		text_shadow_offset[3] = offset[3] - 1
	elseif image then
		widget = widgets.image_widget
		widget.content.texture_id = image
		local texture_style = widget.style.texture_id
		local texture_offset = texture_style.offset
		local offset = template.offset
		texture_offset[1] = offset[1]
		texture_offset[2] = offset[2]
		texture_offset[3] = offset[3]
		local image_size = template.image_size
		local texture_size = texture_style.texture_size
		texture_size[1] = image_size[1]
		texture_size[2] = image_size[2]
	end

	template_list_data.active_entry = {
		initialized = false,
		text = text,
		image = image,
		duration = duration,
		delay = delay,
		widget = widget,
		fade_in_duration = fade_in_duration,
		default_fade_in_duration = fade_in_duration,
		fade_out_duration = fade_out_duration,
		default_fade_out_duration = fade_out_duration
	}
	template_list_data.next_entry_index = (index < #template_list and index + 1) or nil

	return 
end
TutorialIntroUI.update = function (self, dt)
	if DO_RELOAD then
		self.create_ui_elements(self)
		self.event_start_tutorial_intro_text(self)
	end

	for name, template_list_data in pairs(self.active_template_lists) do
		local active_entry = template_list_data.active_entry

		if active_entry then
			local widget = active_entry.widget
			local delay = active_entry.delay
			local duration = active_entry.duration
			local fade_out_duration = active_entry.fade_out_duration
			local fade_in_duration = active_entry.fade_in_duration

			if delay then
				delay = math.max(0, delay - dt)

				if delay == 0 then
					active_entry.delay = nil
				else
					active_entry.delay = delay
				end
			elseif fade_in_duration then
				if not active_entry.initialized then
					active_entry.initialized = true
					local sound_event = active_entry.sound_event

					if sound_event then
						WwiseWorld.trigger_event(self.wwise_world, sound_event)
					end
				end

				fade_in_duration = math.max(0, fade_in_duration - dt)
				local default_fade_in_duration = active_entry.default_fade_in_duration
				local progress = fade_in_duration/default_fade_in_duration - 1

				self.fade(self, widget, progress)

				if fade_in_duration == 0 then
					active_entry.fade_in_duration = nil
				else
					active_entry.fade_in_duration = fade_in_duration
				end
			elseif duration then
				local duration = active_entry.duration
				duration = math.max(0, duration - dt)

				if duration == 0 then
					active_entry.duration = nil
				else
					active_entry.duration = duration
				end
			elseif fade_out_duration then
				fade_out_duration = math.max(0, fade_out_duration - dt)
				local default_fade_out_duration = active_entry.default_fade_out_duration
				local progress = fade_out_duration/default_fade_out_duration

				self.fade(self, widget, progress)

				if fade_out_duration == 0 then
					if template_list_data.next_entry_index then
						self.start_template_by_index(self, name, template_list_data.next_entry_index)
					else
						template_list_data.active_entry = nil
					end
				else
					active_entry.fade_out_duration = fade_out_duration
				end
			end

			self.draw(self, widget, dt)
		end
	end

	return 
end
TutorialIntroUI.fade = function (self, widget, progress)
	local alpha = progress*255
	local style = widget.style

	if style.text then
		local color = style.text.text_color
		local shadow_color = style.text_shadow.text_color
		color[1] = alpha
		shadow_color[1] = alpha
	else
		local color = style.texture_id.color
		color[1] = alpha
	end

	return 
end
TutorialIntroUI.draw = function (self, widget, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)
	UIRenderer.draw_widget(ui_renderer, widget)
	UIRenderer.end_pass(ui_renderer)

	return 
end

return 
