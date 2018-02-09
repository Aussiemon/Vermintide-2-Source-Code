local definitions = local_require("scripts/ui/views/cutscene_ui_definitions")
local ui_settings = UISettings.cutscene_ui
local math_ease_cubic = math.easeCubic
local array = pdArray
CutsceneUI = class(CutsceneUI)
CutsceneUI.init = function (self, ingame_ui_context, cutscene_system)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.cutscene_system = cutscene_system
	local input_manager = ingame_ui_context.input_manager
	self.input_manager = input_manager

	input_manager.create_input_service(input_manager, "cutscene", "CutsceneKeymaps", "CutsceneFilters")
	input_manager.map_device_to_service(input_manager, "cutscene", "keyboard")
	input_manager.map_device_to_service(input_manager, "cutscene", "mouse")
	input_manager.map_device_to_service(input_manager, "cutscene", "gamepad")

	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph)
	self.letterbox_widget = UIWidget.init(definitions.widgets.letterbox)
	self.transparent_game_logo_widget = UIWidget.init(definitions.widgets.transparent_game_logo)
	self.ui_animations = {}
	self.fx_fade_widgets = {}
	self.fx_fade_widgets_pool = {}
	self.fx_text_popup_widgets = {}
	self.fx_text_popup_widgets_pool = {}
	self.letterbox_enabled = false

	return 
end
CutsceneUI.destroy = function (self)
	self.ui_renderer = nil
	self.ingame_ui = nil
	self.cutscene_system = nil
	self.input_manager = nil
	self.ui_scenegraph = nil
	self.letterbox_widget = nil
	self.fx_fade_widgets = nil
	self.fx_fade_widgets_pool = nil
	self.fx_text_popup_widgets = nil
	self.fx_text_popup_widgets_pool = nil

	return 
end
CutsceneUI.update = function (self, dt)
	self.check_for_fade(self)

	for name, ui_animation in pairs(self.ui_animations) do
		UIAnimation.update(ui_animation, dt)

		if UIAnimation.completed(ui_animation) then
			self.ui_animations[name] = nil

			if name == "logo_fade_out" then
				self.on_fade_out_complete(self)
			end
		end
	end

	local cutscene_system = self.cutscene_system
	local queue = cutscene_system.ui_event_queue

	if not array.empty(queue) then
		self.handle_event_queue(self, queue)
		array.set_empty(queue)
	end

	if cutscene_system.active_camera then
		local input_service = self.input_manager:get_service("cutscene")

		if input_service.get(input_service, "skip_cutscene") or LEVEL_EDITOR_TEST then
			cutscene_system.skip_pressed(cutscene_system)
		end
	end

	if self.do_draw(self) then
		self.prepare_draw(self)
		self.draw(self, dt)
	end

	self.draw_game_logo_widget(self, dt)

	return 
end
CutsceneUI.do_draw = function (self)
	return self.letterbox_enabled or 0 < #self.fx_fade_widgets or 0 < #self.fx_text_popup_widgets
end
CutsceneUI.prepare_draw = function (self)
	local widgets = self.fx_fade_widgets
	local pool = self.fx_fade_widgets_pool

	for i = #widgets, 1, -1 do
		local widget = widgets[i]
		local anim = next(widgets[i].animations)

		if not anim then
			pool[#pool + 1] = table.remove(widgets, i)
		end
	end

	widgets = self.fx_text_popup_widgets
	pool = self.fx_text_popup_widgets_pool

	for i = #widgets, 1, -1 do
		local widget = widgets[i]
		local anim = next(widgets[i].animations)

		if not anim then
			pool[#pool + 1] = table.remove(widgets, i)
		end
	end

	return 
end
CutsceneUI.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("cutscene")
	local size = UISceneGraph.get_size_scaled(ui_scenegraph, "screen")
	ui_scenegraph.letterbox_top_bar.size[1] = size[1]
	ui_scenegraph.letterbox_bottom_bar.size[1] = size[1]

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)

	if self.letterbox_enabled then
		UIRenderer.draw_widget(ui_renderer, self.letterbox_widget)
	end

	local fx_fade_widgets = self.fx_fade_widgets

	for i = 1, #fx_fade_widgets, 1 do
		local widget = fx_fade_widgets[i]

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	local fx_text_popup_widgets = self.fx_text_popup_widgets

	for i = 1, #fx_text_popup_widgets, 1 do
		local widget = fx_text_popup_widgets[i]

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)

	return 
end
CutsceneUI.draw_game_logo_widget = function (self, dt)
	if self.draw_game_logo then
		local ui_renderer = self.ui_renderer
		local ui_scenegraph = self.ui_scenegraph
		local input_service = self.input_manager:get_service("cutscene")

		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)
		UIRenderer.draw_widget(ui_renderer, self.transparent_game_logo_widget)
		UIRenderer.end_pass(ui_renderer)
	end

	return 
end
CutsceneUI.handle_event_queue = function (self, queue)
	local at, an = array.data(queue)
	local i = 1

	while i <= an do
		local event_name = at[i]
		local event_func = self[event_name]

		fassert(event_func, "[CutsceneUI] Function not found for event %q", event_name)

		local args = at[i + 1]

		if type(args) == "table" then
			event_func(self, unpack(args))
		else
			event_func(self, args)
		end

		i = i + 2
	end

	return 
end
CutsceneUI.set_letterbox_enabled = function (self, enabled)
	self.letterbox_enabled = enabled

	return 
end
CutsceneUI.set_player_input_enabled = function (self, enabled)
	local input_manager = self.input_manager

	if enabled then
		if Managers.chat:chat_is_focused() then
			input_manager.block_device_except_service(input_manager, "chat_input", "keyboard")
			input_manager.block_device_except_service(input_manager, "chat_input", "mouse")
			input_manager.block_device_except_service(input_manager, "chat_input", "gamepad")
		else
			input_manager.device_unblock_all_services(input_manager, "keyboard")
			input_manager.device_unblock_all_services(input_manager, "mouse")
			input_manager.device_unblock_all_services(input_manager, "gamepad")
		end
	else
		self.ingame_ui:handle_transition("close_active")

		if Managers.chat:chat_is_focused() then
			input_manager.block_device_except_service(input_manager, "chat_input", "keyboard")
			input_manager.block_device_except_service(input_manager, "chat_input", "mouse")
			input_manager.block_device_except_service(input_manager, "chat_input", "gamepad")
		else
			input_manager.block_device_except_service(input_manager, "cutscene", "keyboard")
			input_manager.block_device_except_service(input_manager, "cutscene", "mouse")
			input_manager.block_device_except_service(input_manager, "cutscene", "gamepad")
		end
	end

	return 
end
CutsceneUI.input_service = function (self)
	return self.input_manager:get_service("cutscene")
end
CutsceneUI.fx_fade = function (self, fade_in_time, hold_time, fade_out_time, color)
	local settings = ui_settings.fx_fade
	fade_in_time = fade_in_time or settings.fade_in_time
	hold_time = hold_time or settings.hold_time
	fade_out_time = fade_out_time or settings.fade_out_time
	color = color or settings.color
	local widget = table.remove(self.fx_fade_widgets_pool) or UIWidget.init(definitions.widgets.fx_fade)
	local target = widget.content
	local target_index = "fx_fade_alpha"
	local start_alpha = 0
	local target_alpha = 1
	local anim_time = fade_in_time + hold_time + fade_out_time
	fade_in_time = fade_in_time/anim_time
	fade_out_time = fade_out_time/anim_time
	hold_time = fade_out_time - 1

	local function anim_func(t)
		if t < fade_in_time then
			return math_ease_cubic(t/fade_in_time)
		elseif t < hold_time then
			return 1
		elseif 0 < fade_out_time then
			return math_ease_cubic((t - 1)/fade_out_time)
		else
			return 0
		end

		return 
	end

	UIWidget.animate(widget, UIAnimation.init(UIAnimation.function_by_time, target, target_index, start_alpha, target_alpha, anim_time, anim_func))

	self.fx_fade_widgets[#self.fx_fade_widgets + 1] = widget

	return 
end
CutsceneUI.fx_text_popup = function (self, fade_in_time, hold_time, fade_out_time, text)
	local settings = ui_settings.fx_text_popup
	fade_in_time = fade_in_time or settings.fade_in_time
	hold_time = hold_time or settings.hold_time
	fade_out_time = fade_out_time or settings.fade_out_time
	text = text or "no text set"
	local widget = table.remove(self.fx_text_popup_widgets_pool) or UIWidget.init(definitions.widgets.fx_text_popup)
	local target = widget.content
	local target_index = "fx_text_popup_alpha"
	local start_alpha = 0
	local target_alpha = 1
	local anim_time = fade_in_time + hold_time + fade_out_time
	fade_in_time = fade_in_time/anim_time
	fade_out_time = fade_out_time/anim_time
	hold_time = fade_out_time - 1

	local function anim_func(t)
		if t < fade_in_time then
			return math_ease_cubic(t/fade_in_time)
		elseif t < hold_time then
			return 1
		elseif 0 < fade_out_time then
			return math_ease_cubic((t - 1)/fade_out_time)
		else
			return 0
		end

		return 
	end

	UIWidget.animate(widget, UIAnimation.init(UIAnimation.function_by_time, target, target_index, start_alpha, target_alpha, anim_time, anim_func))

	widget.content.text = text
	self.fx_text_popup_widgets[#self.fx_text_popup_widgets + 1] = widget

	return 
end
CutsceneUI.check_for_fade = function (self)
	local cutscene_system = self.cutscene_system

	if cutscene_system then
		if cutscene_system.fade_in_game_logo then
			local fade_time = cutscene_system.fade_in_game_logo_time
			cutscene_system.fade_in_game_logo = nil
			cutscene_system.fade_in_game_logo_time = nil

			self.fade_in_logo(self, fade_time)
		elseif cutscene_system.fade_out_game_logo_time then
			local fade_time = cutscene_system.fade_out_game_logo_time
			cutscene_system.fade_out_game_logo = nil
			cutscene_system.fade_out_game_logo_time = nil

			self.fade_out_logo(self, fade_time)
		end
	end

	return 
end
CutsceneUI.fade_in_logo = function (self, fade_time)
	local ui_animations = self.ui_animations
	self.draw_game_logo = true
	local texture_style = self.transparent_game_logo_widget.style.texture_id
	ui_animations.logo_fade_out = nil
	ui_animations.logo_fade_in = UIAnimation.init(UIAnimation.function_by_time, texture_style.color, 1, 0, 255, fade_time, math.easeOutCubic)

	return 
end
CutsceneUI.fade_out_logo = function (self, fade_time)
	local ui_animations = self.ui_animations
	self.draw_game_logo = true
	local texture_style = self.transparent_game_logo_widget.style.texture_id
	ui_animations.logo_fade_in = nil
	ui_animations.logo_fade_out = UIAnimation.init(UIAnimation.function_by_time, texture_style.color, 1, 255, 0, fade_time, math.easeInCubic)

	return 
end
CutsceneUI.on_fade_out_complete = function (self)
	self.draw_game_logo = nil

	return 
end

return 
