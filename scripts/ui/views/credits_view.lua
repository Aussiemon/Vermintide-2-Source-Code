local credits = {
	settings = {
		speed = 100
	},
	entries = {}
}
credits = require("scripts/settings/credits")
local credits_ui_element = {
	passes = {
		{
			style_id = "text",
			pass_type = "text",
			text_id = "text_field"
		}
	}
}
local credits_ui_content = {
	text_field = ""
}
local credits_ui_style = {
	text = {
		font_size = 30,
		dynamic_font = true,
		horizontal_alignment = "center",
		pixel_perfect = true,
		font_type = "hell_shark",
		text_color = Colors.color_definitions.white
	}
}
local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.credits_menu
		},
		size = {
			1920,
			1080
		}
	},
	text_position = {
		horizontal_alignment = "center",
		parent = "root"
	}
}
local colors = {
	header = Colors.color_definitions.credits_header,
	title = Colors.color_definitions.credits_title,
	normal = Colors.color_definitions.credits_normal
}
local font_sizes = {
	legal = 15,
	normal = 30
}
CreditsView = class(CreditsView)

CreditsView.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	local input_manager = ingame_ui_context.input_manager
	self.input_manager = input_manager

	input_manager:create_input_service("credits_view", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service("credits_view", "keyboard")
	input_manager:map_device_to_service("credits_view", "mouse")
	input_manager:map_device_to_service("credits_view", "gamepad")

	self.num_credits = #credits.entries
	self.current_offset = 0
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.ui_element = UIElement.init(credits_ui_element)
end

CreditsView.input_service = function (self)
	return self.input_manager:get_service("credits_view")
end

CreditsView.on_enter = function (self)
	self.input_manager:block_device_except_service("credits_view", "keyboard", 1)
	self.input_manager:block_device_except_service("credits_view", "mouse", 1)
	self.input_manager:block_device_except_service("credits_view", "gamepad", 1)

	self.current_offset = 0
	self.active = true
end

CreditsView.on_exit = function (self)
	self.input_manager:device_unblock_all_services("keyboard", 1)
	self.input_manager:device_unblock_all_services("mouse", 1)
	self.input_manager:device_unblock_all_services("gamepad", 1)

	self.active = nil
	self.exiting = nil

	if IS_WINDOWS then
		Managers.music:trigger_event("Play_hud_select")
	else
		Managers.music:trigger_event("Play_console_menu_select")
	end
end

CreditsView.exit = function (self, return_to_game)
	local exit_transition = (return_to_game and "exit_menu") or "ingame_menu"

	self.ingame_ui:handle_transition(exit_transition)

	self.exiting = nil
end

CreditsView.suspend = function (self)
	self.suspended = true

	self.input_manager:device_unblock_all_services("keyboard", 1)
	self.input_manager:device_unblock_all_services("mouse", 1)
	self.input_manager:device_unblock_all_services("gamepad", 1)
end

CreditsView.unsuspend = function (self)
	self.input_manager:block_device_except_service("credits_view", "keyboard", 1)
	self.input_manager:block_device_except_service("credits_view", "mouse", 1)
	self.input_manager:block_device_except_service("credits_view", "gamepad", 1)

	self.suspended = nil
end

CreditsView.update = function (self, dt)
	if self.suspended then
		return
	end

	local input_manager = self.input_manager
	local input_service = self.input_manager:get_service("credits_view")
	local gamepad_active = input_manager:is_device_active("gamepad")

	if input_service:get("toggle_menu", true) or (gamepad_active and input_service:get("back", true)) then
		self:exit()

		return
	end

	local input_axis = (gamepad_active and input_service:get("gamepad_left_axis")) or input_service:get("scroll_axis")
	local scroll_value = input_axis.y

	if not gamepad_active and IS_XB1 then
		scroll_value = math.sign(input_axis.x) * 5
	end

	local current_offset = math.max(0, (self.current_offset + dt * 50) - scroll_value * 30)
	self.current_offset = current_offset
	local ui_top_renderer = self.ui_top_renderer
	local scenegraph_id = "text_position"
	local offset = {
		0,
		current_offset,
		1
	}
	local ui_content = credits_ui_content
	local ui_style = credits_ui_style

	UIRenderer.begin_pass(ui_top_renderer, self.ui_scenegraph, input_service, dt)

	local w = RESOLUTION_LOOKUP.res_w
	local h = RESOLUTION_LOOKUP.res_h
	local inverse_scale = RESOLUTION_LOOKUP.inv_scale

	UIRenderer.draw_texture(ui_top_renderer, "gradient_credits_menu", Vector3(0, 0, UILayer.credits_gradient), Vector2(w * inverse_scale, h * inverse_scale))

	local credit_entries = credits.entries

	for i = 1, self.num_credits, 1 do
		local entry = credit_entries[i]
		ui_content.text_field = entry.localized_str or (entry.localized and Localize(entry.text)) or entry.text
		entry.localized_str = ui_content.text_field

		if entry.type == "header" then
			ui_style.text.text_color = colors.header
			ui_style.text.font_size = font_sizes.normal
			current_offset = current_offset - 84
		elseif entry.type == "title" then
			ui_style.text.text_color = colors.title
			ui_style.text.font_size = font_sizes.normal
			current_offset = current_offset - 64
		elseif entry.type == "legal" then
			ui_style.text.text_color = colors.normal
			ui_style.text.font_size = font_sizes.legal
			current_offset = current_offset - 15
		else
			ui_style.text.text_color = colors.normal
			ui_style.text.font_size = font_sizes.normal
			current_offset = current_offset - 30
		end

		if current_offset < -84 then
			break
		elseif current_offset < h then
			offset[2] = current_offset

			UIRenderer.draw_element(ui_top_renderer, self.ui_element, ui_style, nil, scenegraph_id, ui_content, nil, offset)
		end
	end

	if current_offset > 1200 then
		self.current_offset = 0
	end

	UIRenderer.end_pass(ui_top_renderer)
end

return
