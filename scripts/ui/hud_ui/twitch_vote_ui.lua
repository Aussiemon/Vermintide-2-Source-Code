local definitions = local_require("scripts/ui/hud_ui/twitch_vote_ui_definitions")
local DEBUG_VOTE_UI = false
TwitchVoteUI = class(TwitchVoteUI)
TwitchVoteUI.init = function (self, ingame_ui_context)
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ingame_ui = ingame_ui_context.ingame_ui
	self._input_manager = ingame_ui_context.input_manager
	self._active = false
	self._active_vote = nil
	self._vote_activated = false
	self._votes = {}
	self._ui_animations = {}
	self._animation_callbacks = {}

	self._create_elements(self)
	Managers.state.event:register(self, "add_vote_ui", "event_add_vote_ui")
	Managers.state.event:register(self, "finish_vote_ui", "event_finish_vote_ui")
	Managers.state.event:register(self, "reset_vote_ui", "event_reset_vote_ui")

	return 
end
TwitchVoteUI.event_add_vote_ui = function (self, vote_key)
	local vote_data = Managers.twitch:get_vote_data(vote_key)

	if vote_data.vote_type == "standard_vote" then
		self.add_vote_ui(self, vote_data.vote_templates[1], vote_data.vote_templates[2], vote_data.option_strings, vote_key)
	elseif vote_data.vote_type == "multiple_choice" then
		self.add_multiple_choice_vote_ui(self, vote_data.vote_templates[1], vote_data.option_strings, vote_key)
	end

	return 
end
TwitchVoteUI.event_finish_vote_ui = function (self, vote_key, winning_index)
	local vote_data = Managers.twitch:get_vote_data(vote_key)

	if not vote_data then
		return 
	end

	local winning_template_name = vote_data.vote_templates[winning_index]
	local vote_type = vote_data.vote_type

	if vote_type == "standard_vote" then
		self._finish_standard_vote_ui(self, vote_key, winning_index, winning_template_name)
	elseif vote_type == "multiple_choice" then
		self._start_multiple_choice_finish_animation(self, vote_key, winning_index, winning_template_name)
	end

	return 
end
TwitchVoteUI._finish_standard_vote_ui = function (self, vote_key, winning_index, winning_template_name)
	if not self._active_vote or not self._vote_widget then
		return 
	end

	if self._active_vote.vote_type ~= "standard_vote" then
		print("Wrong vote type - Resetting")

		self._active_vote = nil
		self._vote_widget = nil
		self._vote_count = {
			0,
			0,
			0,
			0,
			0
		}

		table.remove(self._votes, 1)

		self._widgets = {}
		self._vote_icon_count = 0

		return 
	end

	local template = TwitchVoteTemplates[winning_template_name]
	self._active_vote.completed = true
	self._vote_widget.content.vote_data.timer = 0
	self._vote_widget.content.complete_text = (template and (template.text or string.format("Missing Text for template: %s", winning_template_name))) or TwitchSettings.default_draw_vote
	self._ui_animations.inner_timer_rect_size = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.inner_timer_rect.texture_size, 1, 100, 400, 0.5, math.easeOutCubic)
	self._ui_animations.outer_timer_rect_offset = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.outer_timer_rect.offset, 1, -3, -153, 0.5, math.easeOutCubic)
	self._ui_animations.outer_timer_rect_size = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.outer_timer_rect.size, 1, 106, 406, 0.5, math.easeOutCubic)
	self._ui_animations.fade_text = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.complete_text.text_color, 1, 0, 255, 0.5, math.easeInCubic)

	if winning_index == 1 then
		self._ui_animations.pulse_red = UIAnimation.init(UIAnimation.pulse_animation3, self._vote_widget.style.vote_a.color, 2, 255, 128, 7, 2)
		self._ui_animations.pulse_green = UIAnimation.init(UIAnimation.pulse_animation3, self._vote_widget.style.vote_a.color, 3, 255, 128, 7, 2)
		self._ui_animations.pulse_blue = UIAnimation.init(UIAnimation.pulse_animation3, self._vote_widget.style.vote_a.color, 4, 255, 128, 7, 2)
		self._ui_animations.fade = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.vote_b.color, 1, 255, 0, 1, math.easeOutCubic)
		self._ui_animations.bar_a = UIAnimation.init(UIAnimation.function_by_time, self._active_vote.vote_percentages, 1, self._active_vote.vote_percentages[1], 1, 0.5, math.easeOutCubic)
		self._ui_animations.bar_b = UIAnimation.init(UIAnimation.function_by_time, self._active_vote.vote_percentages, 2, self._active_vote.vote_percentages[2], 0, 0.5, math.easeOutCubic)
		self._ui_animations.inner_vote_area_rect_size = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.inner_vote_area_rect.size, 1, self._vote_widget.style.inner_vote_area_rect.size[1], 480, 0.5, math.easeOutCubic)
		self._ui_animations.outer_vote_area_rect_size = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.outer_vote_area_rect.size, 1, self._vote_widget.style.outer_vote_area_rect.size[1], 480, 0.5, math.easeOutCubic)
		self._ui_animations.inner_vote_area_glass_rect_size = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.inner_vote_area_glass.texture_size, 1, self._vote_widget.style.inner_vote_area_glass.texture_size[1], 480, 0.5, math.easeOutCubic)
	elseif winning_index == 2 then
		self._ui_animations.pulse_red = UIAnimation.init(UIAnimation.pulse_animation3, self._vote_widget.style.vote_b.color, 2, 255, 128, 7, 2)
		self._ui_animations.pulse_green = UIAnimation.init(UIAnimation.pulse_animation3, self._vote_widget.style.vote_b.color, 3, 255, 128, 7, 2)
		self._ui_animations.pulse_blue = UIAnimation.init(UIAnimation.pulse_animation3, self._vote_widget.style.vote_b.color, 4, 255, 128, 7, 2)
		self._ui_animations.fade = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.vote_a.color, 1, 255, 0, 1, math.easeOutCubic)
		self._ui_animations.bar_a = UIAnimation.init(UIAnimation.function_by_time, self._active_vote.vote_percentages, 1, self._active_vote.vote_percentages[1], 0, 0.5, math.easeOutCubic)
		self._ui_animations.bar_b = UIAnimation.init(UIAnimation.function_by_time, self._active_vote.vote_percentages, 2, self._active_vote.vote_percentages[2], 1, 0.5, math.easeOutCubic)
		self._ui_animations.inner_vote_area_rect_size = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.inner_vote_area_rect.size, 1, self._vote_widget.style.inner_vote_area_rect.size[1], 500, 0.5, math.easeOutCubic)
		self._ui_animations.outer_vote_area_rect_size = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.outer_vote_area_rect.size, 1, self._vote_widget.style.outer_vote_area_rect.size[1], 506, 0.5, math.easeOutCubic)
		self._ui_animations.inner_vote_area_glass_rect_size = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.inner_vote_area_glass.texture_size, 1, self._vote_widget.style.inner_vote_area_glass.texture_size[1], 500, 0.5, math.easeOutCubic)
		self._ui_animations.inner_vote_area_rect_offset = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.inner_vote_area_rect.offset, 1, self._vote_widget.style.inner_vote_area_rect.offset[1], 100, 0.5, math.easeOutCubic)
		self._ui_animations.outer_vote_area_rect_offset = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.outer_vote_area_rect.offset, 1, self._vote_widget.style.outer_vote_area_rect.offset[1], 97, 0.5, math.easeOutCubic)
		self._ui_animations.inner_vote_area_glass_rect_offset = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.inner_vote_area_glass.offset, 1, self._vote_widget.style.inner_vote_area_glass.offset[1], 100, 0.5, math.easeOutCubic)
	else
		self._active_vote.vote_percentages[1] = 0
		self._active_vote.vote_percentages[2] = 0
		self._ui_animations.fade_a = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.vote_a.color, 1, 255, 0, 1, math.easeOutCubic)
		self._ui_animations.fade_b = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.vote_b.color, 1, 255, 0, 1, math.easeOutCubic)
		self._ui_animations.inner_vote_area_rect_size = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.inner_vote_area_rect.size, 1, self._vote_widget.style.inner_vote_area_rect.size[1], 400, 0.5, math.easeOutCubic)
		self._ui_animations.outer_vote_area_rect_size = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.outer_vote_area_rect.size, 1, self._vote_widget.style.outer_vote_area_rect.size[1], 406, 0.5, math.easeOutCubic)
		self._ui_animations.inner_vote_area_glass_rect_size = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.inner_vote_area_glass.texture_size, 1, self._vote_widget.style.inner_vote_area_glass.texture_size[1], 400, 0.5, math.easeOutCubic)
		self._ui_animations.inner_vote_area_rect_offset = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.inner_vote_area_rect.offset, 1, self._vote_widget.style.inner_vote_area_rect.offset[1], 100, 0.5, math.easeOutCubic)
		self._ui_animations.outer_vote_area_rect_offset = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.outer_vote_area_rect.offset, 1, self._vote_widget.style.outer_vote_area_rect.offset[1], 97, 0.5, math.easeOutCubic)
		self._ui_animations.inner_vote_area_glass_rect_offset = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.inner_vote_area_glass.offset, 1, self._vote_widget.style.inner_vote_area_glass.offset[1], 100, 0.5, math.easeOutCubic)
	end

	self._ui_animations.placeholder = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.inner_timer_rect.offset, 2, self._vote_widget.style.inner_timer_rect.offset[2], self._vote_widget.style.inner_timer_rect.offset[2], 2, math.easeOutCubic)
	self._animation_callbacks.placeholder = {
		name = "animate_out",
		animation = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.base_area.position, 2, 150, -300, 0.5, math.easeOutCubic)
	}

	return 
end
TwitchVoteUI._start_multiple_choice_finish_animation = function (self, vote_key, winning_index, winning_template_name)
	if not self._active_vote or not self._vote_widget then
		return 
	end

	if self._active_vote.vote_type ~= "multiple_choice" then
		print("Wrong vote type - Resetting")

		self._active_vote = nil
		self._vote_widget = nil
		self._vote_count = {
			0,
			0,
			0,
			0,
			0
		}

		table.remove(self._votes, 1)

		self._widgets = {}
		self._vote_icon_count = 0

		return 
	end

	self._active_vote.completed = true
	local timer_multiplier = 1
	local content = self._vote_widget.content
	local portraits = {}

	for i = 1, 5, 1 do
		local id = "icon_" .. i

		if content[id] then
			portraits[i] = id
		end
	end

	local winning_name = portraits[winning_index]
	local win_text = (TwitchVoteTemplates[winning_template_name] and TwitchVoteTemplates[winning_template_name].text) or "It was a Draw!"
	content.win_text = win_text

	if winning_name then
		self._vote_widget.style[winning_name].offset[3] = self._vote_widget.style[winning_name].offset[3] + 5
		self._vote_widget.style[winning_name .. "_frame"].offset[3] = self._vote_widget.style[winning_name .. "_frame"].offset[3] + 5
		self._vote_widget.style[winning_name .. "_masked"].offset[3] = self._vote_widget.style[winning_name .. "_masked"].offset[3] + 5
		self._ui_animations.portrait_offset_mask_size = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[winning_name .. "_mask"].texture_size, 2, self._vote_widget.style[winning_name .. "_mask"].texture_size[2], 130, 0, math.easeOutCubic)
		self._ui_animations.pulse_red = UIAnimation.init(UIAnimation.pulse_animation3, self._vote_widget.style[winning_name .. "_masked"].color, 2, 255, 128, 8, 0.9)
		self._ui_animations.pulse_green = UIAnimation.init(UIAnimation.pulse_animation3, self._vote_widget.style[winning_name .. "_masked"].color, 3, 255, 128, 8, 0.9)
		self._ui_animations.pulse_blue = UIAnimation.init(UIAnimation.pulse_animation3, self._vote_widget.style[winning_name .. "_masked"].color, 4, 255, 128, 8, 0.9)
		content.name_tag = content[winning_name .. "_name_full"]
		portraits[winning_index] = nil
	end

	for _, portrait_name in pairs(portraits) do
		self._ui_animations[portrait_name .. "_mask_size"] = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[portrait_name .. "_mask"].texture_size, 2, self._vote_widget.style[portrait_name .. "_mask"].texture_size[2], 0, timer_multiplier*0.5, math.easeOutCubic)
		self._vote_widget.style[portrait_name].offset[3] = self._vote_widget.style[portrait_name].offset[3] - 5
		self._vote_widget.style[portrait_name .. "_frame"].offset[3] = self._vote_widget.style[portrait_name .. "_frame"].offset[3] - 5
		self._vote_widget.style[portrait_name .. "_masked"].offset[3] = self._vote_widget.style[portrait_name .. "_masked"].offset[3] - 5
		self._ui_animations[portrait_name .. "_name"] = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[portrait_name .. "_name"].text_color, 1, 255, 60, timer_multiplier*0.25, math.easeOutCubic)
		self._ui_animations[portrait_name .. "_vote_text"] = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[portrait_name .. "_vote_text"].text_color, 1, 255, 60, timer_multiplier*0.25, math.easeOutCubic)
	end

	self._vote_widget.content.vote_data.timer = 0
	self._ui_animations.fade_timer_text = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.timer.text_color, 1, 255, 0, timer_multiplier*0.5, math.easeOutCubic)
	self._ui_animations.placeholder = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.icon_1_outer_rect.color, 2, self._vote_widget.style.icon_1_outer_rect.color[2], self._vote_widget.style.icon_1_outer_rect.color[2], timer_multiplier*1, math.easeOutCubic)
	self._animation_callbacks.placeholder = callback(self, "_continue_multiple_choice_animation", winning_name, winning_index, timer_multiplier)

	return 
end
TwitchVoteUI._continue_multiple_choice_animation = function (self, winning_name, winning_index, timer_multiplier)
	if winning_name then
		self._ui_animations.portrait_offset = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[winning_name].offset, 2, 0, 25, timer_multiplier*0.5, math.easeOutCubic)
		self._ui_animations.portrait_offset_frame = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[winning_name .. "_frame"].offset, 2, 0, 25, timer_multiplier*0.5, math.easeOutCubic)
		self._ui_animations.portrait_offset_masked = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[winning_name .. "_masked"].offset, 2, 0, 25, timer_multiplier*0.5, math.easeOutCubic)
		self._ui_animations.portrait_offset_mask = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[winning_name .. "_mask"].offset, 2, 0, 25, timer_multiplier*0.5, math.easeOutCubic)
		local size = self._vote_widget.style[winning_name].texture_size
		self._ui_animations.portrait_size_x = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[winning_name].texture_size, 1, size[1], size[1]*1.2, timer_multiplier*0.5, math.easeOutCubic)
		self._ui_animations.portrait_size_y = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[winning_name].texture_size, 2, size[2], size[2]*1.2, timer_multiplier*0.5, math.easeOutCubic)
		local size = self._vote_widget.style[winning_name .. "_frame"].texture_size
		self._ui_animations.portrait_frame_size_x = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[winning_name .. "_frame"].texture_size, 1, size[1], size[1]*1.2, timer_multiplier*0.5, math.easeOutCubic)
		self._ui_animations.portrait_frame_size_y = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[winning_name .. "_frame"].texture_size, 2, size[2], size[2]*1.2, timer_multiplier*0.5, math.easeOutCubic)
		local size = self._vote_widget.style[winning_name .. "_masked"].texture_size
		self._ui_animations.portrait_masked_size_x = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[winning_name .. "_masked"].texture_size, 1, size[1], size[1]*1.2, timer_multiplier*0.5, math.easeOutCubic)
		self._ui_animations.portrait_masked_size_y = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[winning_name .. "_masked"].texture_size, 2, size[2], size[2]*1.2, timer_multiplier*0.5, math.easeOutCubic)
		local size = self._vote_widget.style[winning_name .. "_mask"].texture_size
		self._ui_animations.portrait_mask_size_x = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[winning_name .. "_mask"].texture_size, 1, size[1], size[1]*1.2, timer_multiplier*0.5, math.easeOutCubic)
		self._ui_animations.portrait_mask_size_y = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[winning_name .. "_mask"].texture_size, 2, size[2], size[2]*1.2, timer_multiplier*0.5, math.easeOutCubic)
		self._ui_animations[winning_name .. "_name"] = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[winning_name .. "_name"].text_color, 1, 255, 0, timer_multiplier*0.25, math.easeOutCubic)
		self._ui_animations[winning_name .. "_vote_text"] = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[winning_name .. "_vote_text"].text_color, 1, 255, 0, timer_multiplier*0.25, math.easeOutCubic)
		self._ui_animations[winning_name .. "_name_inner_rect"] = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[winning_name .. "_name_inner_rect"].color, 1, 255, 0, timer_multiplier*0.25, math.easeOutCubic)
		self._ui_animations[winning_name .. "_name_outer_rect"] = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[winning_name .. "_name_outer_rect"].color, 1, 255, 0, timer_multiplier*0.25, math.easeOutCubic)
		self._ui_animations[winning_name .. "_inner_rect"] = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[winning_name .. "_inner_rect"].color, 1, 255, 0, timer_multiplier*0.25, math.easeOutCubic)
		self._ui_animations[winning_name .. "_outer_rect"] = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[winning_name .. "_outer_rect"].color, 1, 255, 0, timer_multiplier*0.25, math.easeOutCubic)
	end

	local extra_offset = self._vote_widget.style.inner_timer_rect.offset[1] - 315
	self._ui_animations.inner_timer_rect_offset_x = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.inner_timer_rect.extra_offset, 1, 0, extra_offset, timer_multiplier*0.5, math.easeOutCubic)
	self._ui_animations.outer_timer_rect_offset_x = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.outer_timer_rect.extra_offset, 1, 0, extra_offset, timer_multiplier*0.5, math.easeOutCubic)
	local offset = self._vote_widget.style.inner_timer_rect.offset[2]
	self._ui_animations.inner_timer_rect_offset_y = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.inner_timer_rect.offset, 2, offset, offset + 90, timer_multiplier*0.5, math.easeOutCubic)
	local offset = self._vote_widget.style.outer_timer_rect.offset[2]
	self._ui_animations.outer_timer_rect_offset_y = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.outer_timer_rect.offset, 2, offset, offset + 90, timer_multiplier*0.5, math.easeOutCubic)
	local name = self._vote_widget.content.name_tag
	local style = self._vote_widget.style.name_tag
	local font, scaled_font_size = UIFontByResolution(style)
	local text_width = UIRenderer.text_size(self._ui_renderer, name, font[1], scaled_font_size)
	local extra_size = text_width + 50
	local size = self._vote_widget.style.inner_timer_rect.rect_size[1]
	self._ui_animations.inner_timer_rect_size_x = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.inner_timer_rect.rect_size, 1, size, extra_size, timer_multiplier*0.5, math.easeOutCubic)
	local size = self._vote_widget.style.outer_timer_rect.area_size[1]
	self._ui_animations.outer_timer_rect_size_x = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.outer_timer_rect.area_size, 1, size, extra_size, timer_multiplier*0.5, math.easeOutCubic)
	local size = self._vote_widget.style.inner_timer_rect.rect_size[1]
	self._ui_animations.inner_timer_rect_size_y = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.inner_timer_rect.rect_size, 2, size, size - 80, timer_multiplier*0.5, math.easeOutCubic)
	local size = self._vote_widget.style.outer_timer_rect.area_size[1]
	self._ui_animations.outer_timer_rect_size_y = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.outer_timer_rect.area_size, 2, size, size - 80, timer_multiplier*0.5, math.easeOutCubic)
	local extra_offset = self._vote_widget.style.vote.offset[1] - -350 + self._vote_widget.style.vote.texture_size[1]*0.5
	self._ui_animations.vote_offset = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.vote.extra_offset, 1, 0, extra_offset, timer_multiplier*0.5, math.easeOutCubic)
	local extra_size = self._vote_widget.style.inner_rect.texture_size[1] - 700
	self._ui_animations.inner_rect_size_x = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.inner_rect.extra_texture_size, 1, 0, extra_size, timer_multiplier*0.5, math.easeOutCubic)
	self._ui_animations.outer_rect_size_x = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.outer_rect.extra_area_size, 1, 0, extra_size + 4, timer_multiplier*0.5, math.easeOutCubic)
	local size = self._vote_widget.style.inner_rect.texture_size[2]
	self._ui_animations.inner_rect_size_y = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.inner_rect.texture_size, 2, size, size*2, timer_multiplier*0.5, math.easeOutCubic)
	local size = self._vote_widget.style.outer_rect.area_size[2]
	self._ui_animations.outer_rect_size_y = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.outer_rect.area_size, 2, size, size*2 - 4, timer_multiplier*0.5, math.easeOutCubic)
	self._ui_animations.name_tag_alpha = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.name_tag.text_color, 1, 0, 255, timer_multiplier*0.25, math.easeOutCubic)
	self._ui_animations.win_text_alpha = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.win_text.text_color, 1, 0, 255, timer_multiplier*0.25, math.easeOutCubic)
	local content = self._vote_widget.content
	local portraits = {}

	for i = 1, 5, 1 do
		local id = "icon_" .. i

		if content[id] then
			portraits[i] = id
		end
	end

	if winning_index then
		portraits[winning_index] = nil
	end

	for _, portrait_name in pairs(portraits) do
		self._ui_animations[portrait_name .. "_name"] = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[portrait_name .. "_name"].text_color, 1, 60, 0, timer_multiplier*0.25, math.easeOutCubic)
		self._ui_animations[portrait_name .. "_vote_text"] = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[portrait_name .. "_vote_text"].text_color, 1, 60, 0, timer_multiplier*0.25, math.easeOutCubic)
		self._ui_animations[portrait_name .. "_name_inner_rect"] = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[portrait_name .. "_name_inner_rect"].color, 1, 128, 0, timer_multiplier*0.25, math.easeOutCubic)
		self._ui_animations[portrait_name .. "_name_outer_rect"] = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[portrait_name .. "_name_outer_rect"].color, 1, 128, 0, timer_multiplier*0.25, math.easeOutCubic)
		self._ui_animations[portrait_name .. "_inner_rect"] = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[portrait_name .. "_inner_rect"].color, 1, 128, 0, timer_multiplier*0.25, math.easeOutCubic)
		self._ui_animations[portrait_name .. "_outer_rect"] = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style[portrait_name .. "_outer_rect"].color, 1, 128, 0, timer_multiplier*0.25, math.easeOutCubic)
	end

	self._ui_animations.placeholder_two = UIAnimation.init(UIAnimation.function_by_time, self._vote_widget.style.icon_1_outer_rect.color, 2, self._vote_widget.style.icon_1_outer_rect.color[2], self._vote_widget.style.icon_1_outer_rect.color[2], timer_multiplier*2, math.easeOutCubic)
	self._animation_callbacks.placeholder_two = callback(self, "_finish_multiple_choice_animation")

	return 
end
TwitchVoteUI._finish_multiple_choice_animation = function (self)
	self._ui_animations.animate_out = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.base_area.position, 2, 150, -300, 0.5, math.easeOutCubic)

	return 
end
TwitchVoteUI.event_reset_vote_ui = function (self, vote_key)
	if vote_key then
		if self._active_vote and self._active_vote.vote_key == vote_key then
			self._active_vote = nil
			self._vote_widget = nil
		end

		for idx, vote_data in ipairs(self._votes) do
			if vote_data.vote_key == vote_key then
				table.remove(self._votes, idx)

				break
			end
		end

		print("RESET: Removed Active vote with key")
	else
		self._votes = {}
		self._active = false
		self._active_vote = nil
		self._vote_widget = nil

		print("RESET: Removed Active vote")
	end

	return 
end
TwitchVoteUI.add_vote_ui = function (self, vote_template_a_name, vote_template_b_name, vote_inputs, vote_key)
	local vote_template_a = TwitchVoteTemplates[vote_template_a_name]

	fassert(vote_template_a, "[TwitchVoteUI] Could not find any vote template for %s", vote_template_a_name)

	local vote_template_b = TwitchVoteTemplates[vote_template_b_name]

	fassert(vote_template_b, "[TwitchVoteUI] Could not find any vote template for %s", vote_template_b_name)
	print("added vote")

	self._votes[#self._votes + 1] = {
		vote_type = "standard_vote",
		vote_template_a = table.clone(vote_template_a),
		vote_template_b = table.clone(vote_template_b),
		inputs = vote_inputs or {
			"#a",
			"#b"
		},
		vote_key = vote_key
	}
	self._active = true

	return 
end
TwitchVoteUI.add_multiple_choice_vote_ui = function (self, vote_template_name, vote_inputs, vote_key)
	local vote_template = TwitchVoteTemplates[vote_template_name]

	fassert(vote_template, "[TwitchVoteUI] Could not find any vote template for %s", vote_template_name)
	print("added multiple choice vote")

	self._votes[#self._votes + 1] = {
		vote_type = "multiple_choice",
		vote_template = table.clone(vote_template),
		inputs = vote_inputs or {
			"#a",
			"#b",
			"#c",
			"#d",
			"#e"
		},
		vote_key = vote_key
	}
	self._active = true

	return 
end
TwitchVoteUI.set_visible = function (self, visible)
	self._visible = visible

	return 
end
TwitchVoteUI._create_elements = function (self)
	local scenegraph_definition = definitions.scenegraph_definition
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widgets = definitions.widgets
	self._widgets = {}

	for widget_name, widget_data in pairs(widgets) do
		self._widgets[widget_name] = UIWidget.init(widget_data)
	end

	self._vote_count = {
		0,
		0,
		0,
		0,
		0
	}
	self._vote_icon_count = 0
	self._vote_widget = nil

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	return 
end
local DO_RELOAD = true
TwitchVoteUI.update = function (self, dt, t)
	script_data.vote_ui = self

	if DO_RELOAD then
		DO_RELOAD = false

		self._create_elements(self)

		self._ui_animations = {}
		self._animation_callbacks = {}
	end

	if not self._active then
		return 
	end

	if DEBUG_VOTE_UI and self._active_vote then
		for i = 1, 5, 1 do
			Debug.text("                               Vote Percentages: " .. self._active_vote.vote_percentages[i])
		end
	end

	self._draw(self, dt, t)
	self._update_animations(self, dt, t)
	self._update_vote_data(self, dt, t)
	self._update_active_vote(self, dt, t)

	return 
end
TwitchVoteUI._update_animations = function (self, dt, t)
	if not self._active_vote or not self._vote_activated then
		return 
	end

	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
			local animation_callback_data = self._animation_callbacks[name]

			if animation_callback_data then
				if type(animation_callback_data) == "table" then
					self._ui_animations[animation_callback_data.name] = animation_callback_data.animation
				else
					animation_callback_data()
				end

				self._animation_callbacks[name] = nil
			end
		end
	end

	if not next(self._ui_animations) and self._active_vote and self._active_vote.completed then
		print("ANIMATION FINISHED: Removed Active vote")

		self._active_vote = nil
		self._vote_widget = nil
		self._vote_count = {
			0,
			0,
			0,
			0,
			0
		}

		table.remove(self._votes, 1)

		self._widgets = {}
		self._vote_icon_count = 0
	end

	return 
end
TwitchVoteUI._update_vote_data = function (self, dt, t)
	if self._active_vote then
		return 
	end

	if #self._votes < 1 then
		self._active = false

		return 
	end

	self._active_vote = self._votes[1]
	local vote_type = self._active_vote.vote_type
	local create_vote_function = nil

	if vote_type == "standard_vote" then
		create_vote_function = definitions.create_vote_function
		local vote_widget = create_vote_function(self._active_vote)
		self._vote_widget = UIWidget.init(vote_widget)
		self._vote_widget.content.vote_data = self._active_vote
	elseif vote_type == "multiple_choice" then
		create_vote_function = definitions.create_multiple_vote_function
		local vote_widget = create_vote_function(self._active_vote, self._ui_renderer.gui)
		self._vote_widget = UIWidget.init(vote_widget)
		self._vote_widget.content.vote_data = self._active_vote
	end

	self._ui_animations.animate_in = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.base_area.position, 2, -300, 150, 0.5, math.easeOutCubic)

	return 
end

local function altered_sin(value, offset)
	local new_value = value*12
	local acceleration = math.ease_exp(value - 1)

	return math.sin((new_value + offset)*math.easeOutCubic(value - 1))*20*math.ease_exp(value - 1)
end

TwitchVoteUI._create_vote_icon = function (self, vote_index)
	if self._ui_animations.animate_in or 50 <= table.size(self._widgets) or not self._vote_widget then
		return 
	end

	local scenegraph_definition = definitions.scenegraph_definition
	local base_name = "vote_icon_" .. self._vote_icon_count
	local content = self._vote_widget.content
	local style = self._vote_widget.style
	local icon = content.icon_texture_func(content, style, vote_index)
	local offset = content.icon_offset_func(content, style, vote_index)
	scenegraph_definition[base_name] = {
		parent = "vote_icon",
		position = {
			offset,
			0,
			0
		}
	}
	self._widgets[base_name] = UIWidget.init(UIWidgets.create_simple_texture(icon, base_name))
	local widget = self._widgets[base_name]
	self._ui_animations[base_name .. "_offset_y"] = UIAnimation.init(UIAnimation.function_by_time_with_offset, widget.style.texture_id.offset, 2, 0, Math.random(100, 200), 3, math.random(0, 10), math.easeOutCubic)
	self._ui_animations[base_name .. "_offset_x"] = UIAnimation.init(UIAnimation.function_by_time_with_offset, widget.style.texture_id.offset, 1, 0, 1, 3, math.random(0, 10), altered_sin)
	self._ui_animations[base_name .. "_color"] = UIAnimation.init(UIAnimation.function_by_time_with_offset, widget.style.texture_id.color, 1, 255, 0, 3.2, math.random(0, 10), math.ease_exp)
	self._animation_callbacks[base_name .. "_color"] = callback(self, "cb_destroy_vote_icon", base_name)
	self._vote_icon_count = self._vote_icon_count + 1
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	return 
end
TwitchVoteUI.cb_destroy_vote_icon = function (self, vote_icon_name)
	self._widgets[vote_icon_name] = nil

	return 
end
TwitchVoteUI._update_active_vote = function (self, dt, t)
	if not self._active_vote or self._active_vote.completed then
		return 
	end

	local vote_key = self._active_vote.vote_key
	local vote_data = Managers.twitch:get_vote_data(vote_key)

	if not vote_data then
		Application.error("[TwitchVoteUI] There is no vote data for key (" .. vote_key .. ")")

		self._active_vote = nil
		self._vote_widget = nil

		table.remove(self._votes, 1)

		return 
	end

	local options = vote_data.options
	self._vote_count = self._vote_count or {
		0,
		0,
		0,
		0,
		0
	}
	local a_diff = options[1] - self._vote_count[1]
	local b_diff = options[2] - self._vote_count[2]
	local c_diff = options[3] - self._vote_count[3]
	local d_diff = options[4] - self._vote_count[4]
	local e_diff = options[5] - self._vote_count[5]

	if 0 < a_diff then
		for i = 1, a_diff, 1 do
			self._create_vote_icon(self, 1)
		end
	end

	if 0 < b_diff then
		for i = 1, b_diff, 1 do
			self._create_vote_icon(self, 2)
		end
	end

	if 0 < c_diff then
		for i = 1, c_diff, 1 do
			self._create_vote_icon(self, 3)
		end
	end

	if 0 < d_diff then
		for i = 1, d_diff, 1 do
			self._create_vote_icon(self, 4)
		end
	end

	if 0 < e_diff then
		for i = 1, e_diff, 1 do
			self._create_vote_icon(self, 5)
		end
	end

	local total_amount = 0

	for i = 1, 5, 1 do
		self._vote_count[i] = options[i]
		total_amount = total_amount + options[i]
	end

	local percentages = {}

	for i = 1, 5, 1 do
		percentages[i] = (0 < total_amount and options[i]/total_amount) or 0
	end

	self._active_vote.vote_percentages = self._active_vote.vote_percentages or {
		0,
		0,
		0,
		0,
		0
	}

	for i = 1, 5, 1 do
		self._active_vote.vote_percentages[i] = math.lerp(self._active_vote.vote_percentages[i] or 0, percentages[i], dt*2)
	end

	if DEBUG_VOTE_UI then
		Debug.text("                                " .. self._vote_count[1])
		Debug.text("                                " .. self._vote_count[2])
		Debug.text("                                " .. self._vote_count[3])
		Debug.text("                                " .. self._vote_count[4])
		Debug.text("                                " .. self._vote_count[5])
	end

	self._active_vote.timer = vote_data.timer
	self._active_vote.options = options
	self._vote_activated = vote_data.activated

	return 
end
TwitchVoteUI._draw = function (self, dt, t)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_manager:get_service("ingame_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, {
		snap_pixel_positions = false
	})

	for _, widget in pairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	if self._vote_widget and self._vote_activated then
		UIRenderer.draw_widget(ui_renderer, self._vote_widget)
	end

	UIRenderer.end_pass(ui_renderer)

	return 
end
TwitchVoteUI.destroy = function (self)
	Managers.state.event:unregister("add_vote_ui", self)

	return 
end

return 
