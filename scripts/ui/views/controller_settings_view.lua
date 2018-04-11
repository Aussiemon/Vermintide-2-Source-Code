ControllerSettingsView = class(ControllerSettingsView)
ControllerSettingsView.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.ingame_ui = ingame_ui_context.ingame_ui

	return 
end
local controller_settings_to_add = {
	{
		"Player",
		PlayerControllerKeymaps
	},
	{
		"ingame_menu",
		IngameMenuKeymaps
	},
	{
		"chat_input",
		ChatControllerSettings
	}
}
local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.default
		},
		size = {
			1920,
			1080
		}
	},
	widget_start = {
		vertical_alignment = "top",
		parent = "root"
	}
}
UIElements.KeyBindElement = {
	passes = {
		{
			pass_type = "hover",
			content_id = "button_hotspot"
		},
		{
			pass_type = "click",
			content_id = "button_hotspot"
		},
		{
			style_id = "text",
			pass_type = "text",
			text_id = "text_field",
			content_check_function = function (content)
				return content.button_hotspot.is_hover
			end
		},
		{
			style_id = "hover_text",
			pass_type = "text",
			text_id = "text_field",
			content_check_function = function (content)
				return content.button_hotspot.is_hover
			end
		}
	}
}
local widget_definition = {
	scenegraph_id = "",
	element = UIElements.KeyBindElement,
	content = {
		text_field = "TEST",
		button_hotspot = {}
	},
	style = {
		text = {
			font_size = 14,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			text_color = Colors.color_definitions.white
		},
		hover_text = {
			font_size = 14,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			text_color = Colors.color_definitions.green
		}
	}
}

local function get_button_name(input_service, keymap)
	local device_type = keymap[1]
	local device_list = input_service.mapped_devices[device_type]
	local input_device = device_list[1]
	local button_type = keymap[3]
	local button_index = keymap[2]
	local text = nil

	if button_type == "axis" then
		text = input_device.axis_name(button_index)
	else
		text = input_device.button_name(button_index)
	end

	return text
end

ControllerSettingsView.create_ui_elements = function (self)
	local ui_widgets = {}
	local n_widgets = 0
	local scenegraph_definition = scenegraph_definition
	local widget_definition = widget_definition
	local input_manager = self.input_manager

	for _, settings_data in ipairs(controller_settings_to_add) do
		local service_name = settings_data[1]
		n_widgets = n_widgets + 1
		widget_definition.content[service_name] = service_name
		UIElements.KeyBindElement.passes[3].text_id = service_name
		UIElements.KeyBindElement.passes[4].text_id = service_name
		widget_definition.scenegraph_id = service_name
		scenegraph_definition[service_name] = {
			parent = "widget_start",
			offset = {
				0,
				-n_widgets * 16,
				1
			},
			size = {
				1920,
				16
			}
		}
		ui_widgets[n_widgets] = UIWidget.init(widget_definition)
		local input_service = input_manager.get_service(input_manager, service_name)

		for map_name, _ in pairs(settings_data[2]) do
			n_widgets = n_widgets + 1
			local keymapping = input_service.get_keymapping(input_service, map_name)
			local keymap_1 = keymapping.input_mappings[1]
			local keymap_2 = keymapping.input_mappings[2]
			local keymap_1_text = "-"
			local keymap_2_text = "-"

			if keymap_1 then
				keymap_1_text = get_button_name(input_service, keymap_1)
			end

			if keymap_2 then
				keymap_2_text = get_button_name(input_service, keymap_2)
			end

			local index_name = "index_" .. tostring(n_widgets)
			local total_text = string.format("%s: %20s | %-20s", map_name, keymap_1_text, keymap_2_text)
			widget_definition.content[index_name] = total_text
			UIElements.KeyBindElement.passes[3].text_id = index_name
			UIElements.KeyBindElement.passes[4].text_id = index_name
			widget_definition.scenegraph_id = index_name
			scenegraph_definition[index_name] = {
				parent = "widget_start",
				offset = {
					0,
					-n_widgets * 16,
					1
				},
				size = {
					1920,
					16
				}
			}
			ui_widgets[n_widgets] = UIWidget.init(widget_definition)
		end
	end

	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.ui_widgets = ui_widgets

	return 
end
ControllerSettingsView.on_enter = function (self)
	self.create_ui_elements(self)

	return 
end
ControllerSettingsView.destroy = function (self)
	return 
end
ControllerSettingsView.update = function (self, dt)
	local ui_renderer = self.ui_renderer
	local input_service = self.input_manager:get_service("ingame_menu")

	UIRenderer.begin_pass(ui_renderer, self.ui_scenegraph, input_service, dt)

	for i, ui_widget in ipairs(self.ui_widgets) do
		UIRenderer.draw_widget(ui_renderer, ui_widget)
	end

	UIRenderer.end_pass(ui_renderer)

	if input_service.get(input_service, "toggle_menu") or input_service.get(input_service, "back") then
		self.ingame_ui:handle_transition("ingame_menu", "OptionsMenu")
	end

	return 
end

return 
