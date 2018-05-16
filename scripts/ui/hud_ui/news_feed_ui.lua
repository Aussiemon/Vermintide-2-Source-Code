require("scripts/settings/news_feed_templates")

local definitions = local_require("scripts/ui/hud_ui/news_feed_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local ALIGNMENT_DURATION_TIME = 0.8
local ENTER_DURATION_TIME = 0.6
local EXIT_DURATION_TIME = 0.6
local SYNC_WAIT_DURATION_TIME = 1.5
local SYNC_WAIT_DURATION_TIME_LONG = 10
local ANIM_STATE_EXIT = "exit"
local ANIM_STATE_ENTER = "enter"
local MAX_NUMBER_OF_NEWS = definitions.MAX_NUMBER_OF_NEWS
local WIDGET_SIZE = definitions.WIDGET_SIZE
local NEWS_SPACING = definitions.NEWS_SPACING
NewsFeedUI = class(NewsFeedUI)

NewsFeedUI.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self.peer_id = ingame_ui_context.peer_id
	self.player_manager = ingame_ui_context.player_manager
	self.ui_animations = {}
	self.is_in_inn = ingame_ui_context.is_in_inn

	self:_create_ui_elements()

	self.conditions_params = {}
	self.templates_on_cooldown = {}
	self.feed_sync_delay = SYNC_WAIT_DURATION_TIME

	rawset(_G, "news_feed_ui", self)
end

NewsFeedUI._create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local news_widgets = {}
	local unused_news_widgets = {}

	for i, definition in ipairs(definitions.buff_widget_definitions) do
		news_widgets[i] = UIWidget.init(definition)
		unused_news_widgets[i] = news_widgets[i]
	end

	self._news_widgets = news_widgets
	self._unused_news_widgets = unused_news_widgets
	self._active_news = {}

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)
	self:set_visible(true)
end

local widgets_to_remove = {}
local news_to_add = {}

NewsFeedUI._sync_news = function (self, dt, t)
	local feed_sync_delay = self.feed_sync_delay

	if feed_sync_delay then
		feed_sync_delay = math.max(0, feed_sync_delay - dt)

		if feed_sync_delay == 0 then
			self.feed_sync_delay = nil
		else
			self.feed_sync_delay = feed_sync_delay
		end

		return
	end

	local templates_on_cooldown = self.templates_on_cooldown

	for template_name, cooldown in pairs(templates_on_cooldown) do
		if cooldown > 0 then
			cooldown = math.max(0, cooldown - dt)

			if cooldown == 0 then
				templates_on_cooldown[template_name] = nil
			else
				templates_on_cooldown[template_name] = cooldown
			end
		end
	end

	local player = Managers.player:local_player(1)
	local player_unit = player.player_unit
	local conditions_params = self.conditions_params

	if player_unit then
		local hero_name = player:profile_display_name()
		local career_name = player:career_name()

		if conditions_params.hero_name ~= hero_name or conditions_params.career_name ~= career_name then
			while #self._active_news > 0 do
				self:_remove_entry(1)
			end
		end

		conditions_params.hero_name = hero_name
		conditions_params.career_name = career_name
	else
		return
	end

	local active_news = self._active_news
	local player = Managers.player:local_player(1)
	local player_unit = player.player_unit
	local news_templates = NewsFeedTemplates

	if player_unit then
		table.clear(news_to_add)

		for i = 1, #active_news, 1 do
			local data = active_news[i]
			data.verified = false
		end

		local template_added = false

		for i, template in ipairs(news_templates) do
			local template_name = template.name
			local condition_func = template.condition_func

			if not templates_on_cooldown[template_name] and condition_func(conditions_params) then
				local verified = false

				for j = 1, #active_news, 1 do
					local data = active_news[j]

					if data.name == template_name then
						data.verified = true
						verified = true

						break
					end
				end

				if not verified and not template_added then
					news_to_add[#news_to_add + 1] = template_name
					template_added = true
				end
			end
		end

		table.clear(widgets_to_remove)

		for i, data in ripairs(active_news) do
			if not data.verified then
				widgets_to_remove[#widgets_to_remove + 1] = i
			end
		end

		for i = 1, #widgets_to_remove, 1 do
			local index = widgets_to_remove[i]

			self:_mark_entry_for_removal(index)
		end

		local entries_added = false

		for i, template in ipairs(news_templates) do
			for _, template_name in ipairs(news_to_add) do
				if template_name == template.name then
					local added = self:_add_entry(template)

					if added then
						entries_added = true
					end
				end
			end
		end

		if entries_added then
			self:_update_alignment_duration()

			self.feed_sync_delay = SYNC_WAIT_DURATION_TIME
		else
			self.feed_sync_delay = SYNC_WAIT_DURATION_TIME_LONG
		end
	end
end

NewsFeedUI._add_entry = function (self, template)
	local template_name = template.name
	local duration = template.duration
	local cooldown = template.cooldown
	local infinite = template.infinite
	local unused_news_widgets = self._unused_news_widgets
	local num_news = #self._active_news

	if MAX_NUMBER_OF_NEWS <= num_news then
		return false
	end

	local widget = table.remove(unused_news_widgets, 1)
	local widget_content = widget.content
	local widget_style = widget.style
	local title = template.title
	local description = template.description
	widget_content.title_text = Localize(title)
	widget_content.text = Localize(description)
	widget_content.is_infinite = infinite
	local data = {
		state = "enter",
		name = template_name,
		widget = widget,
		duration = duration,
		cooldown = cooldown,
		infinite = infinite,
		anim_duration = ENTER_DURATION_TIME,
		removed_func = template.removed_func
	}
	local active_news = self._active_news
	active_news[#active_news + 1] = data
	num_news = #self._active_news
	local vertical_spacing = WIDGET_SIZE[2] + NEWS_SPACING
	local widget_offset = widget.offset

	if num_news > 1 then
		widget_offset[2] = active_news[num_news - 1].widget.offset[2] - vertical_spacing
	else
		widget_offset[2] = 0
	end

	return true
end

NewsFeedUI._update_alignment_duration = function (self)
	self._alignment_duration = ALIGNMENT_DURATION_TIME

	for _, data in ipairs(self._active_news) do
		local widget = data.widget
		local widget_offset = widget.offset
		local current_position = widget_offset[2]
		data.current_position = current_position
	end
end

NewsFeedUI._update_entries_expire_time = function (self, dt, t)
	for index, data in ipairs(self._active_news) do
		local widget = data.widget
		local duration = data.duration

		if duration then
			duration = math.max(0, duration - dt)

			if duration == 0 then
				data.duration = nil

				self:_mark_entry_for_removal(index)
			else
				data.duration = duration
			end
		end
	end
end

NewsFeedUI._mark_entry_for_removal = function (self, index)
	local active_news = self._active_news
	local data = active_news[index]

	if data.state ~= ANIM_STATE_EXIT then
		data.state = ANIM_STATE_EXIT
		data.anim_duration = EXIT_DURATION_TIME
	end
end

NewsFeedUI._remove_entry = function (self, index)
	local active_news = self._active_news
	local data = table.remove(active_news, index)
	local widget = data.widget
	local unused_news_widgets = self._unused_news_widgets

	table.insert(unused_news_widgets, #unused_news_widgets + 1, widget)
	self:_update_alignment_duration()

	local name = data.name
	local cooldown = data.cooldown
	self.templates_on_cooldown[name] = cooldown
	local removed_func = data.removed_func

	if removed_func then
		removed_func()
	end
end

NewsFeedUI._update_alignment = function (self, dt)
	local alignment_duration = self._alignment_duration

	if not alignment_duration then
		return
	end

	alignment_duration = math.max(alignment_duration - dt, 0)
	local progress = alignment_duration / ALIGNMENT_DURATION_TIME
	local anim_progress = math.easeCubic(progress)

	if progress == 1 then
		self._alignment_duration = nil
	else
		self._alignment_duration = alignment_duration
	end

	local vertical_spacing = WIDGET_SIZE[2] + NEWS_SPACING
	local widget_target_position = 0

	for _, data in ipairs(self._active_news) do
		local widget = data.widget
		local widget_offset = widget.offset
		local current_position = data.current_position
		local diff = current_position - widget_target_position
		widget_offset[2] = current_position - diff * (1 - anim_progress)
		widget_target_position = widget_target_position - vertical_spacing
	end
end

NewsFeedUI._update_state_animations = function (self, dt)
	local vertical_spacing = WIDGET_SIZE[2] + NEWS_SPACING
	local widget_target_position = 0
	local active_news = self._active_news

	for index, data in ipairs(active_news) do
		local delete = false
		local state = data.state
		local anim_duration = data.anim_duration

		if anim_duration then
			anim_duration = math.max(anim_duration - dt, 0)
			local progress = 0

			if state == ANIM_STATE_ENTER then
				progress = 1 - anim_duration / ENTER_DURATION_TIME

				if progress == 1 then
					data.anim_duration = nil
				else
					data.anim_duration = anim_duration
				end
			elseif state == ANIM_STATE_EXIT then
				progress = anim_duration / ENTER_DURATION_TIME

				if progress == 0 then
					data.anim_duration = nil
					delete = true
				else
					data.anim_duration = anim_duration
				end
			end

			if not delete then
				local widget = data.widget

				self:_animate_widget(widget, state, progress)
			else
				data.delete = delete
			end
		end
	end

	for index, data in ripairs(active_news) do
		if data.delete then
			self:_remove_entry(index)
		end
	end
end

NewsFeedUI._animate_widget = function (self, widget, state, progress)
	local offset = widget.offset
	local style = widget.style
	local anim_progress = 0

	if state == ANIM_STATE_ENTER then
		anim_progress = math.easeCubic(math.min(progress * 2, 1))
	else
		anim_progress = math.easeCubic(progress)
	end

	local horizontal_diztance = 100
	offset[1] = 100 - anim_progress * horizontal_diztance
	local alpha = anim_progress * 255
	style.text.text_color[1] = alpha
	style.text_shadow.text_color[1] = alpha
	style.title_text.text_color[1] = alpha
	style.title_text_shadow.text_color[1] = alpha
	style.background.color[1] = alpha
	local effect_style = style.effect
	local effect_color = effect_style.color

	if state == ANIM_STATE_ENTER then
		local effect_progress = math.ease_pulse(progress)
		effect_color[1] = effect_progress * 255
		effect_style.offset[1] = 120 - offset[1]
		local degrees = 75
		local rotation_progress = math.easeCubic(progress)
		effect_style.angle = math.degrees_to_radians(degrees * rotation_progress)
	elseif alpha < effect_color[1] then
		effect_color[1] = alpha
	end
end

NewsFeedUI.set_position = function (self, x, y)
	local position = self.ui_scenegraph.pivot.local_position
	position[1] = x
	position[2] = y
end

NewsFeedUI.destroy = function (self)
	self:set_visible(false)
	rawset(_G, "news_feed_ui", nil)
end

NewsFeedUI.set_visible = function (self, visible)
	self._is_visible = visible
	local ui_renderer = self.ui_renderer
end

NewsFeedUI.update = function (self, dt, t)
	if not self._is_visible then
		return
	end

	self:_sync_news(dt, t)
	self:_update_state_animations(dt)
	self:_update_alignment(dt)
	self:_handle_resolution_modified()
	self:_update_entries_expire_time(dt, t)
	self:draw(dt)
end

NewsFeedUI._handle_resolution_modified = function (self)
	if RESOLUTION_LOOKUP.modified then
		self:_on_resolution_modified()
	end
end

NewsFeedUI._on_resolution_modified = function (self)
	return
end

NewsFeedUI.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)

	for _, data in ipairs(self._active_news) do
		local widget = data.widget

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

return
