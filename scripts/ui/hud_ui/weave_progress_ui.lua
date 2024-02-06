﻿-- chunkname: @scripts/ui/hud_ui/weave_progress_ui.lua

local definitions = local_require("scripts/ui/hud_ui/weave_progress_ui_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition

WeaveProgressUI = class(WeaveProgressUI)

WeaveProgressUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ingame_ui_context = ingame_ui_context
	self._render_settings = {}
	self._progress = 0
	self._animations = {}
	self._animation_callbacks = {}

	self:_create_ui_elements()
end

WeaveProgressUI.destroy = function (self)
	return
end

WeaveProgressUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._render_settings = self._render_settings or {}
	self._bonus_objective_widgets = {}
	self._bonus_objective_stack_widgets = {}
	self._bonus_objective_lookup = {}
	self._widgets = {}

	for name, widget_def in pairs(widget_definitions) do
		self._widgets[name] = UIWidget.init(widget_def)
	end

	self._bonus_header_widget = UIWidget.init(definitions.create_bonus_objective_header_func())

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._progress = 0
end

WeaveProgressUI._sync_weave_objectives = function (self)
	local objective_template = Managers.weave:get_active_objective_template()

	if not objective_template then
		return
	end

	local bar_cutoff = objective_template.bar_cutoff

	if not bar_cutoff or bar_cutoff == 100 then
		local prior_objective_index = math.max(Managers.weave:get_active_objective() - 1, 1)
		local weave_template = Managers.weave:get_active_weave_template()
		local objectives = weave_template.objectives

		for i = prior_objective_index, 1, -1 do
			bar_cutoff = objectives[i].bar_cutoff

			if bar_cutoff and bar_cutoff < 100 then
				break
			end
		end
	end

	bar_cutoff = bar_cutoff or 100

	local widget = self._widgets.progress_ui
	local content = widget.content

	content.bar_cutoff = bar_cutoff

	local bar_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name("weaves_essence_bar_fill")
	local bubble_icon_style = widget.style.bubble_icon
	local base_offset_x = bubble_icon_style.base_offset_x

	bubble_icon_style.offset[1] = base_offset_x + bar_texture_settings.size[1] * (bar_cutoff * 0.01)

	local bonus_time_text = ""
	local bonus_time = objective_template.bonus_time_on_complete

	if bonus_time then
		local seconds = math.max(bonus_time, 0)

		bonus_time_text = string.format("+ %d:%02d", math.floor(seconds / 60), seconds % 60)
	end

	content.bonus_time = bonus_time_text
	self._initiated = true
end

WeaveProgressUI.update = function (self, dt, t)
	if not self._initiated then
		self:_sync_weave_objectives()
	end

	self:_update_bonus_objectives(dt, t)
	self:_update_animations(dt, t)
	self:_update_bar(dt, t)
	self:_draw(dt, t)
end

local function objective_sort_func(a, b)
	return a.sort_index < b.sort_index
end

local TEMP_TABLE = {}
local OBJECTIVES_TO_ADD = {}
local STACKS_ADDED = {}

WeaveProgressUI._update_bonus_objectives = function (self, dt, t)
	table.clear(TEMP_TABLE)
	table.clear(OBJECTIVES_TO_ADD)
	table.clear(STACKS_ADDED)

	local bonus_objective_lookup = self._bonus_objective_lookup
	local bonus_objective_widgets = self._bonus_objective_widgets
	local bonus_objective_stack_widgets = self._bonus_objective_stack_widgets
	local weave_template = Managers.weave:get_active_weave_template()

	if not weave_template then
		return
	end

	local entity_system = Managers.state and Managers.state.entity
	local weave_objective_system = entity_system and entity_system:system("weave_objective_system")
	local current_objective_index = Managers.weave:get_active_objective()
	local objectives_ordered = weave_template.objectives_ordered
	local current_objective_ordered = objectives_ordered[current_objective_index]

	if weave_objective_system then
		local current_objectives = weave_objective_system:current_main_objectives()

		for _, objective in pairs(current_objectives) do
			local objective_name = objective:objective_name()

			TEMP_TABLE[objective_name] = true

			if not bonus_objective_lookup[objective_name] then
				local objective_settings = objective:get_objective_settings()

				if objective_settings then
					local sort_index = table.find(current_objective_ordered, objective_name)

					OBJECTIVES_TO_ADD[#OBJECTIVES_TO_ADD + 1] = {
						sort_index = sort_index,
						objective = objective,
					}
				end
			end
		end

		table.sort(OBJECTIVES_TO_ADD, objective_sort_func)

		for _, objective_data in ipairs(OBJECTIVES_TO_ADD) do
			local objective_name = objective_data.objective:objective_name()
			local objective_settings = objective_data.objective:get_objective_settings()
			local score = objective_data.objective:score()
			local display_name = objective_settings.display_name

			if objective_settings.stack then
				if not STACKS_ADDED[objective_settings.stack] then
					local widget_definition = definitions.create_bonus_objective_func(display_name, score, table.size(bonus_objective_widgets) + table.size(bonus_objective_stack_widgets), objective_settings.stack, objective_name)
					local stack = bonus_objective_stack_widgets[objective_settings.stack] or {}

					stack[#stack + 1] = UIWidget.init(widget_definition)
					bonus_objective_stack_widgets[objective_settings.stack] = stack
					bonus_objective_lookup[objective_name] = stack[#stack]
					STACKS_ADDED[objective_settings.stack] = true
				else
					local bonus_objective = bonus_objective_stack_widgets[objective_settings.stack][#bonus_objective_stack_widgets[objective_settings.stack]]

					bonus_objective.content.stack[#bonus_objective.content.stack + 1] = objective_name
					bonus_objective_lookup[objective_name] = bonus_objective
				end
			else
				local widget_definition = definitions.create_bonus_objective_func(display_name, score, table.size(bonus_objective_widgets) + table.size(bonus_objective_stack_widgets))

				bonus_objective_widgets[objective_name] = UIWidget.init(widget_definition)
				bonus_objective_lookup[objective_name] = bonus_objective_widgets[objective_name]
			end
		end

		for objective_name, widget in pairs(bonus_objective_lookup) do
			if not TEMP_TABLE[objective_name] and not widget.content:is_done_func(objective_name) and self:_handle_stacks(widget, objective_name) then
				widget.content.is_done = true

				local text = widget.content.objective_name_id
				local objective_style = widget.style.objective_name
				local score_style = widget.style.score
				local font, scaled_font_size = UIFontByResolution(objective_style)
				local text_width = UIRenderer.text_size(self._ui_renderer, text, font[1], scaled_font_size)
				local texture_size = table.clone(widget.style.checkmark.texture_size)

				self._animations["checkmark_x_" .. objective_name] = UIAnimation.init(UIAnimation.function_by_time, widget.style.checkmark.texture_size, 1, texture_size[1] * 3, texture_size[1], 0.4, math.easeOutCubic)
				self._animations["checkmark_y_" .. objective_name] = UIAnimation.init(UIAnimation.function_by_time, widget.style.checkmark.texture_size, 2, texture_size[2] * 3, texture_size[2], 0.4, math.easeOutCubic)
				self._animations["checkmark_shadow_x_" .. objective_name] = UIAnimation.init(UIAnimation.function_by_time, widget.style.checkmark_shadow.texture_size, 1, texture_size[1] * 3, texture_size[1], 0.4, math.easeOutCubic)
				self._animations["checkmark_shadow_y_" .. objective_name] = UIAnimation.init(UIAnimation.function_by_time, widget.style.checkmark_shadow.texture_size, 2, texture_size[2] * 3, texture_size[2], 0.4, math.easeOutCubic)
				self._animations["checkmark_color_r_" .. objective_name] = UIAnimation.init(UIAnimation.function_by_time, widget.style.checkmark.color, 2, 255, 192, 0.4, math.easeOutCubic)
				self._animations["checkmark_color_g_" .. objective_name] = UIAnimation.init(UIAnimation.function_by_time, widget.style.checkmark.color, 3, 255, 192, 0.4, math.easeOutCubic)
				self._animations["checkmark_color_b_" .. objective_name] = UIAnimation.init(UIAnimation.function_by_time, widget.style.checkmark.color, 4, 255, 192, 0.4, math.easeOutCubic)
				self._animation_callbacks["checkmark_x_" .. objective_name] = function ()
					self._animations["stroke_" .. objective_name] = UIAnimation.init(UIAnimation.function_by_time, widget.style.stroke.texture_size, 1, 0, text_width, 0.25, math.easeInCubic)
					self._animations["essence_icon_r_" .. objective_name] = UIAnimation.init(UIAnimation.function_by_time, widget.style.essence_icon.color, 2, 255, 60, 0.4, math.easeOutCubic)
					self._animations["essence_icon_g_" .. objective_name] = UIAnimation.init(UIAnimation.function_by_time, widget.style.essence_icon.color, 3, 255, 60, 0.4, math.easeOutCubic)
					self._animations["essence_icon_b_" .. objective_name] = UIAnimation.init(UIAnimation.function_by_time, widget.style.essence_icon.color, 4, 255, 60, 0.4, math.easeOutCubic)
					self._animation_callbacks["stroke_" .. objective_name] = function ()
						self._animations["objective_color_r_" .. objective_name] = UIAnimation.init(UIAnimation.function_by_time, objective_style.text_color, 2, 255, 192, 0.5, math.easeInCubic)
						self._animations["objective_color_g_" .. objective_name] = UIAnimation.init(UIAnimation.function_by_time, objective_style.text_color, 3, 255, 192, 0.5, math.easeInCubic)
						self._animations["objective_color_b_" .. objective_name] = UIAnimation.init(UIAnimation.function_by_time, objective_style.text_color, 4, 255, 192, 0.5, math.easeInCubic)
						self._animations["score_color_r_" .. objective_name] = UIAnimation.init(UIAnimation.function_by_time, score_style.text_color, 2, 255, 192, 0.5, math.easeInCubic)
						self._animations["score_color_g_" .. objective_name] = UIAnimation.init(UIAnimation.function_by_time, score_style.text_color, 3, 255, 192, 0.5, math.easeInCubic)
						self._animations["score_color_b_" .. objective_name] = UIAnimation.init(UIAnimation.function_by_time, score_style.text_color, 4, 255, 192, 0.5, math.easeInCubic)
					end
				end
			end
		end
	end
end

WeaveProgressUI._handle_stacks = function (self, widget, objective_name)
	local widget_content = widget.content

	if not widget_content.stack then
		return true
	end

	local stack = widget_content.stack
	local done_stack = widget_content.done_stack

	done_stack[#done_stack + 1] = objective_name

	return table.size(done_stack) == table.size(stack)
end

WeaveProgressUI._update_animations = function (self, dt)
	local animations = self._animations
	local animation_callbacks = self._animation_callbacks

	for animation_name, anmation in pairs(animations) do
		UIAnimation.update(anmation, dt)

		if UIAnimation.completed(anmation) then
			animations[animation_name] = nil

			local cb = animation_callbacks[animation_name]

			if cb then
				cb()

				animation_callbacks[animation_name] = nil
			end
		end
	end
end

WeaveProgressUI._update_bar = function (self, dt, t)
	local weave_manager = Managers.weave
	local weave_name = weave_manager:get_active_weave()

	if weave_name then
		local score = weave_manager:current_bar_score()
		local old_progress = self._old_progress

		self._progress = score / 100

		if not old_progress or old_progress < self._progress then
			local widget = self._widgets.progress_ui
			local widget_content = widget.content
			local widget_style = widget.style

			self._animations.update_bar_glow = UIAnimation.init(UIAnimation.function_by_time, widget_style.bar_glow.color, 1, 255, 0, 0.5, math.easeInCubic)

			self._animation_callbacks.update_bar_glow = function ()
				self._animations.update_bar = UIAnimation.init(UIAnimation.function_by_time, widget_content, "bar_progress", widget_content.bar_progress, self._progress, 0.5, math.easeOutCubic)
			end

			self._animations.update_effect = UIAnimation.init(UIAnimation.function_by_time, widget_style.background_filled.color, 1, 255, 0, 2, math.easeOutCubic)
		end

		local widget = self._widgets.progress_ui
		local widget_content = widget.content

		widget_content.progress = self._progress
		self._old_progress = self._progress

		if score >= widget_content.bar_cutoff then
			widget_content.bonus_time = ""
		end
	end
end

WeaveProgressUI._draw = function (self, dt, t)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings
	local input_service = Managers.input:get_service("ingame_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in pairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	local bonus_objective_widgets = self._bonus_objective_widgets

	if table.size(bonus_objective_widgets) > 0 then
		UIRenderer.draw_widget(ui_renderer, self._bonus_header_widget)

		for _, widget in pairs(bonus_objective_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	local bonus_objective_stack_widgets = self._bonus_objective_stack_widgets

	if table.size(bonus_objective_stack_widgets) > 0 then
		for stack_name, stack in pairs(bonus_objective_stack_widgets) do
			for _, widget in pairs(stack) do
				UIRenderer.draw_widget(ui_renderer, widget)
			end
		end
	end

	if table.size(bonus_objective_widgets) > 0 or table.size(bonus_objective_stack_widgets) > 0 then
		UIRenderer.draw_widget(ui_renderer, self._bonus_header_widget)
	end

	UIRenderer.end_pass(ui_renderer)
end
