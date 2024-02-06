﻿-- chunkname: @scripts/ui/hud_ui/scrollbar_ui.lua

local definitions = local_require("scripts/ui/hud_ui/scrollbar_ui_definitions")

ScrollbarUI = class(ScrollbarUI)
ScrollbarUI.NAME = "ScrollbarUI"

local WAIT_TIME = 2
local AUTO_SCROLL_SPEED = 0.25
local RESET_TIME = 5
local SCROLL_LENGTH = 150
local SCROLL_LENGTH_HORIZONTAL = 300

ScrollbarUI.init = function (self, ui_scenegraph, scroll_area_scenegraph_id, scroll_area_anchor_scenegraph_id, excess_area, enable_auto_scroll, optional_scroll_area_hotspot_widget, horizontal_scrollbar)
	self._scroll_area_scenegraph_id = scroll_area_scenegraph_id
	self._scroll_area_anchor_scenegraph_id = scroll_area_anchor_scenegraph_id
	self._scroll_area_hotspot_widget = optional_scroll_area_hotspot_widget
	self._excess_area = excess_area
	self._ui_scenegraph = ui_scenegraph
	self._auto_scroll_enabled = enable_auto_scroll
	self._auto_scroll_enabled_at_start = enable_auto_scroll
	self._horizontal_scrollbar = horizontal_scrollbar

	self:_create_ui_elements()
end

ScrollbarUI._create_ui_elements = function (self)
	self._scrollbar_wait_timer = 0
	self._scrollbar_timer = 0
	self._auto_scroll_enabled = self._auto_scroll_enabled_at_start
	self._progress = 0
	self._ui_animations = {}

	local setup_func = definitions.setup_func

	self._widgets, self._widgets_by_name = setup_func(self._ui_scenegraph, self._scroll_area_anchor_scenegraph_id, self._excess_area, self._horizontal_scrollbar)

	if not self._scroll_area_hotspot_widget then
		local widget_definition = UIWidgets.create_simple_hotspot(self._scroll_area_anchor_scenegraph_id)
		local widget = UIWidget.init(widget_definition)

		self._scroll_area_hotspot_widget = widget
		self._internal_hotspot_widget = widget
	end
end

ScrollbarUI.update = function (self, dt, t, ui_renderer, input_service, render_settings)
	self:_auto_scroll(dt, t)
	self:_update_input(dt, t, input_service, ui_renderer)
	self:_update_scroller_progress()
	self:_update_scrollbar_hover_animations()
	self:_update_animations(dt, t)
	self:_draw(dt, t, ui_renderer, input_service, render_settings)
end

ScrollbarUI.force_update_progress = function (self)
	local offset = self._ui_scenegraph[self._scroll_area_scenegraph_id].local_position[1]

	self._progress = math.inv_lerp(0, self._excess_area, math.abs(offset))
end

ScrollbarUI._auto_scroll = function (self, dt, t)
	if not self._auto_scroll_enabled then
		return
	end

	if UIUtils.is_button_hover(self._scroll_area_hotspot_widget) then
		self._scrollbar_wait_timer = 0
	elseif self._scrollbar_wait_timer > WAIT_TIME then
		local scroll_value = AUTO_SCROLL_SPEED * dt

		self._progress = math.clamp(self._progress + scroll_value * SCROLL_LENGTH / self._excess_area, 0, 1)
		self._scrollbar_timer = self._progress == 1 and self._scrollbar_timer + dt or 0

		if self._scrollbar_timer >= RESET_TIME then
			self._scrollbar_timer = 0
			self._scrollbar_wait_timer = 0
			self._progress = 0
		end
	else
		self._scrollbar_wait_timer = self._scrollbar_wait_timer + dt
	end
end

ScrollbarUI.disable_input = function (self, disable)
	self._input_disabled = disable
end

ScrollbarUI._update_input = function (self, dt, t, input_service, ui_renderer)
	if self._input_disabled then
		return
	end

	local widget = self._widgets_by_name.scrollbar
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local ui_scenegraph = self._ui_scenegraph

	if input_service:get("left_press") then
		if UIUtils.is_button_hover(widget, "scroller_hotspot") then
			self:_calculate_input_offset(input_service, ui_scenegraph)
		elseif UIUtils.is_button_hover(widget, "scrollbar_hotspot") then
			self:_update_scroller_position(input_service, ui_scenegraph)
		end
	elseif input_service:get("left_hold") and self._progress_diff then
		self:_update_scroller_position(input_service, ui_scenegraph)
	else
		self._progress_diff = nil
	end

	local scroll_value = 0

	if self._horizontal_scrollbar then
		if gamepad_active then
			local scroll_axis = input_service:get("gamepad_right_axis")

			scroll_value = scroll_axis and -scroll_axis[1] or 0
		elseif UIUtils.is_button_hover(self._scroll_area_hotspot_widget) then
			local scroll_axis = input_service:get("scroll_axis")

			scroll_value = scroll_axis and scroll_axis[2] or 0
		end
	elseif gamepad_active then
		local scroll_axis = input_service:get("gamepad_right_axis")

		scroll_value = scroll_axis and scroll_axis[2] or 0
	elseif UIUtils.is_button_hover(self._scroll_area_hotspot_widget) then
		local scroll_axis = input_service:get("scroll_axis")

		scroll_value = scroll_axis and scroll_axis[2] or 0
	end

	if math.abs(scroll_value) == 0 then
		return
	end

	local scroll_length = self._horizontal_scrollbar and SCROLL_LENGTH_HORIZONTAL or SCROLL_LENGTH
	local progress = self._progress - scroll_value * scroll_length / self._excess_area

	self._ui_animations.scroll = UIAnimation.init(UIAnimation.function_by_time, self, "_progress", self._progress, math.clamp(progress, 0, 1), 0.5, math.easeOutCubic)
	self._auto_scroll_enabled = false
end

ScrollbarUI._calculate_input_offset = function (self, input_service, ui_scenegraph)
	local widget = self._widgets_by_name.scrollbar
	local style = widget.style
	local cursor_pos = input_service:get("cursor")
	local scenegraph_node = ui_scenegraph[self._scroll_area_anchor_scenegraph_id]
	local world_pos = scenegraph_node.world_position
	local size = scenegraph_node.size

	if self._horizontal_scrollbar then
		local start_point = world_pos[1]
		local end_point = world_pos[1] + size[1]
		local scroller_height = style.scroller.rect_size[1]
		local input_pos = UIInverseScaleVectorToResolution(cursor_pos)[1]
		local progress = 1 - math.clamp(1 - math.inv_lerp(start_point + scroller_height * 0.5, end_point - scroller_height * 0.5, input_pos), 0, 1)

		self._progress_diff = self._progress - progress
	else
		local start_point = world_pos[2]
		local end_point = world_pos[2] + size[2]
		local scroller_height = style.scroller.rect_size[2]
		local input_pos = UIInverseScaleVectorToResolution(cursor_pos)[2]
		local progress = 1 - math.inv_lerp(start_point + scroller_height * 0.5, end_point - scroller_height * 0.5, input_pos)

		self._progress_diff = self._progress - progress
	end
end

ScrollbarUI._update_scroller_position = function (self, input_service, ui_scenegraph)
	local widget = self._widgets_by_name.scrollbar
	local style = widget.style
	local cursor_pos = input_service:get("cursor")
	local scenegraph_node = ui_scenegraph[self._scroll_area_anchor_scenegraph_id]
	local world_pos = scenegraph_node.world_position
	local size = scenegraph_node.size

	if self._horizontal_scrollbar then
		local start_point = world_pos[1]
		local end_point = world_pos[1] + size[1]
		local scroller_height = style.scroller.rect_size[1]
		local input_pos = UIInverseScaleVectorToResolution(cursor_pos)[1]

		self._progress = 1 - (1 - math.inv_lerp(start_point + scroller_height * 0.5, end_point - scroller_height * 0.5, input_pos))

		local progress_diff = self._progress_diff or 0

		self._progress = math.clamp(self._progress + progress_diff, 0, 1)
	else
		local start_point = world_pos[2]
		local end_point = world_pos[2] + size[2]
		local scroller_height = style.scroller.rect_size[2]
		local input_pos = UIInverseScaleVectorToResolution(cursor_pos)[2]

		self._progress = 1 - math.inv_lerp(start_point + scroller_height * 0.5, end_point - scroller_height * 0.5, input_pos)

		local progress_diff = self._progress_diff or 0

		self._progress = math.clamp(self._progress + progress_diff, 0, 1)
	end
end

ScrollbarUI._update_scroller_progress = function (self)
	local widget = self._widgets_by_name.scrollbar
	local widget_content = widget.content

	widget_content.progress = self._progress

	if self._horizontal_scrollbar then
		self._ui_scenegraph[self._scroll_area_scenegraph_id].local_position[1] = -self._excess_area * self._progress
	else
		self._ui_scenegraph[self._scroll_area_scenegraph_id].local_position[2] = self._excess_area * self._progress
	end
end

ScrollbarUI._update_scrollbar_hover_animations = function (self)
	local widget = self._widgets_by_name.scrollbar
	local widget_content = widget.content
	local widget_style = widget.style

	if UIUtils.is_button_hover(widget, "scroller_hotspot") then
		self._ui_animations.scroller_hotspot_anim = UIAnimation.init(UIAnimation.function_by_time, widget_style.scroller.color, 1, widget_style.scroller.color[1], 255, 0.25, math.easeOutCubic)
	else
		self._ui_animations.scroller_hotspot_anim = UIAnimation.init(UIAnimation.function_by_time, widget_style.scroller.color, 1, widget_style.scroller.color[1], 128, 0.25, math.easeOutCubic)
	end

	if UIUtils.is_button_hover(widget, "scrollbar_hotspot") then
		self._ui_animations.scrollbar_hotspot_anim = UIAnimation.init(UIAnimation.function_by_time, widget_style.scrollbar_bg_bg.color, 1, widget_style.scrollbar_bg_bg.color[1], 255, 0.25, math.easeOutCubic)
	else
		self._ui_animations.scrollbar_hotspot_anim = UIAnimation.init(UIAnimation.function_by_time, widget_style.scrollbar_bg_bg.color, 1, widget_style.scrollbar_bg_bg.color[1], 128, 0.25, math.easeOutCubic)
	end
end

ScrollbarUI._update_animations = function (self, dt, t)
	local ui_animations = self._ui_animations

	for animation_name, ui_animation in pairs(ui_animations) do
		UIAnimation.update(ui_animation, dt)

		if UIAnimation.completed(ui_animation) then
			ui_animation[animation_name] = nil
		end
	end
end

ScrollbarUI._draw = function (self, dt, t, ui_renderer, input_service, render_settings)
	local ui_scenegraph = self._ui_scenegraph

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	if self._internal_hotspot_widget then
		UIRenderer.draw_widget(ui_renderer, self._internal_hotspot_widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

ScrollbarUI.destroy = function (self, ui_scenegraph)
	ui_scenegraph[self._scroll_area_scenegraph_id].local_position[2] = 0
	self._scroll_area_scenegraph_id = nil
	self._scroll_area_anchor_scenegraph_id = nil
	self._excess_area = nil
	self._scrollbar_wait_timer = nil
	self._scrollbar_timer = nil
end
