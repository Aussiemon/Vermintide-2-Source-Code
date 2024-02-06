﻿-- chunkname: @scripts/ui/hud_ui/twitch_vote_ui.lua

local definitions = local_require("scripts/ui/hud_ui/twitch_vote_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local definition_settings = definitions.settings
local vote_texts_definition = definitions.vote_texts
local DEBUG_VOTE_UI = false
local RESULT_TIMER = 3
local INIT_AUDIO_COUNTDOWN_AT = 5

TwitchVoteUI = class(TwitchVoteUI)

TwitchVoteUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ingame_ui = ingame_ui_context.ingame_ui
	self._input_manager = ingame_ui_context.input_manager
	self._world_manager = ingame_ui_context.world_manager
	self.active = false
	self._active_vote = nil
	self._vote_activated = false
	self._votes = {}
	self._ui_animations = {}
	self._animation_callbacks = {}
	self._render_settings = {
		alpha_multiplier = 1,
	}
	self._last_played_countdown_sfx = INIT_AUDIO_COUNTDOWN_AT + 1

	local world = self._world_manager:world("level_world")

	self.wwise_world = Managers.world:wwise_world(world)

	self:_create_elements()
	Managers.state.event:register(self, "add_vote_ui", "event_add_vote_ui")
	Managers.state.event:register(self, "finish_vote_ui", "event_finish_vote_ui")
	Managers.state.event:register(self, "reset_vote_ui", "event_reset_vote_ui")
end

TwitchVoteUI.event_add_vote_ui = function (self, vote_key)
	local vote_data = Managers.twitch:get_vote_data(vote_key)

	if not vote_data then
		return
	end

	if vote_data.vote_type == "standard_vote" then
		self:start_standard_vote(vote_data.vote_templates[1], vote_data.vote_templates[2], vote_data.option_strings, vote_key)
	elseif vote_data.vote_type == "multiple_choice" then
		self:start_multiple_choice_vote(vote_data.vote_templates[1], vote_data.option_strings, vote_key)
	end
end

TwitchVoteUI.event_finish_vote_ui = function (self, vote_key, winning_index)
	local vote_data = Managers.twitch:get_vote_data(vote_key)

	if not vote_data then
		return
	end

	local winning_template_name = vote_data.vote_templates[winning_index]
	local vote_type = vote_data.vote_type
	local active_vote = self._active_vote
	local vote_template = TwitchVoteTemplates[winning_template_name]

	self._vote_result = {
		vote_key = vote_key,
		winning_index = winning_index,
		winning_template_name = winning_template_name,
		vote_template = vote_template,
	}

	if vote_type == "standard_vote" then
		self:show_ui("standard_vote_result")
	elseif vote_type == "multiple_choice" then
		self:show_ui("multiple_choice_result")
	end

	Application.error("[TwitchVoteUI] event_finish_vote_ui")
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
		self.active = false
		self._active_vote = nil
		self._vote_widget = nil

		print("RESET: Removed Active vote")
	end
end

TwitchVoteUI.start_standard_vote = function (self, vote_template_a_name, vote_template_b_name, vote_inputs, vote_key)
	local vote_template_a = TwitchVoteTemplates[vote_template_a_name]

	fassert(vote_template_a, "[TwitchVoteUI] Could not find any vote template for %s", vote_template_a_name)

	local vote_template_b = TwitchVoteTemplates[vote_template_b_name]

	fassert(vote_template_b, "[TwitchVoteUI] Could not find any vote template for %s", vote_template_b_name)

	local vote_data = Managers.twitch:get_vote_data(vote_key)
	local vote = {
		vote_type = "standard_vote",
		vote_template_a = table.clone(vote_template_a),
		vote_template_b = table.clone(vote_template_b),
		inputs = vote_inputs or {
			"#a",
			"#b",
		},
		vote_key = vote_key,
		timer = vote_data.timer,
	}

	self.active = true
	self._active_vote = vote

	self:show_ui("standard_vote")
end

TwitchVoteUI.start_multiple_choice_vote = function (self, vote_template_name, vote_inputs, vote_key)
	local vote_template = TwitchVoteTemplates[vote_template_name]

	fassert(vote_template, "[TwitchVoteUI] Could not find any vote template for %s", vote_template_name)
	print("added multiple choice vote")

	local vote_data = Managers.twitch:get_vote_data(vote_key)
	local vote = {
		vote_type = "multiple_choice",
		vote_template = table.clone(vote_template),
		inputs = vote_inputs or {
			"#a",
			"#b",
			"#c",
			"#d",
			"#e",
		},
		vote_key = vote_key,
		timer = vote_data.timer,
	}

	self.active = true
	self._active_vote = vote

	self:show_ui("multiple_choice_vote")
end

TwitchVoteUI.set_visible = function (self, visible)
	self._visible = visible
end

TwitchVoteUI._create_elements = function (self)
	local scenegraph_definition = definitions.scenegraph_definition

	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._widgets = {}
	self._vote_count = {
		0,
		0,
		0,
		0,
		0,
	}
	self._vote_icon_count = 0
	self._vote_widget = nil

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
end

local customizer_data = {
	drag_scenegraph_id = "pivot_dragger",
	label = "Twitch",
	registry_key = "twitch",
	root_scenegraph_id = "pivot",
}

TwitchVoteUI.update = function (self, dt, t)
	HudCustomizer.run(self._ui_renderer, self._ui_scenegraph, customizer_data)

	if not self.active then
		return
	end

	if DEBUG_VOTE_UI and self._active_vote then
		for i = 1, 5 do
			Debug.text("                               Vote Percentages: " .. self._active_vote.vote_percentages[i])
		end
	end

	self:_update_transition(dt)
	self:_draw(dt, t)
	self:_update_active_vote(dt, t)

	local ui = self._ui

	if ui == "multiple_choice_vote" then
		self:_update_multiple_votes_ui(dt)
	elseif ui == "standard_vote" then
		self:_update_standard_vote(dt)
	elseif ui == "multiple_choice_result" or ui == "standard_vote_result" then
		self:_update_result(dt)
	end
end

TwitchVoteUI._update_transition = function (self, dt)
	local fade_out = self._fade_out

	if fade_out then
		local fade_out_speed = 1
		local render_settings = self._render_settings
		local alpha_multiplier = math.clamp(render_settings.alpha_multiplier - dt * fade_out_speed, 0, 1)

		render_settings.alpha_multiplier = alpha_multiplier

		if alpha_multiplier == 0 then
			self._ui = nil
			self._fade_out = nil

			if self._next_ui then
				self:_show_next_ui()
			else
				self.active = false
			end
		end

		return
	end

	local fade_in = self._fade_in

	if fade_in then
		local fade_in_speed = 5
		local render_settings = self._render_settings
		local alpha_multiplier = math.clamp(render_settings.alpha_multiplier + dt * fade_in_speed, 0, 1)

		render_settings.alpha_multiplier = alpha_multiplier

		if alpha_multiplier == 1 then
			self._fade_in = nil
		end

		return
	end
end

TwitchVoteUI.show_ui = function (self, ui)
	self._next_ui = ui

	if self._ui then
		self._fade_out = true
	else
		self:_show_next_ui()
	end
end

TwitchVoteUI.hide_ui = function (self)
	self._fade_out = true
end

TwitchVoteUI._show_next_ui = function (self)
	local ui = self._next_ui

	if ui == "multiple_choice_vote" then
		self:_show_multiple_choice_vote()
	elseif ui == "multiple_choice_result" then
		self:_show_multiple_choice_result()
	elseif ui == "standard_vote" then
		self:_show_standard_vote()
	elseif ui == "standard_vote_result" then
		self:_show_standard_vote_result()
	end

	self._ui = ui
	self._fade_in = true
	self._next_ui = nil
end

TwitchVoteUI._create_vote_icon = function (self, vote_index)
	if self._ui_animations.animate_in or table.size(self._widgets) >= 50 or not self._vote_widget then
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
			0,
		},
	}
	self._widgets[base_name] = UIWidget.init(UIWidgets.create_simple_texture(icon, base_name))

	local widget = self._widgets[base_name]

	self._ui_animations[base_name .. "_offset_y"] = UIAnimation.init(UIAnimation.function_by_time_with_offset, widget.style.texture_id.offset, 2, 0, Math.random(100, 200), 3, math.random(0, 10), math.easeOutCubic)
	self._ui_animations[base_name .. "_offset_x"] = UIAnimation.init(UIAnimation.function_by_time_with_offset, widget.style.texture_id.offset, 1, 0, 1, 3, math.random(0, 10), altered_sin)
	self._ui_animations[base_name .. "_color"] = UIAnimation.init(UIAnimation.function_by_time_with_offset, widget.style.texture_id.color, 1, 255, 0, 3.2, math.random(0, 10), math.ease_exp)
	self._animation_callbacks[base_name .. "_color"] = callback(self, "cb_destroy_vote_icon", base_name)
	self._vote_icon_count = self._vote_icon_count + 1
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
end

TwitchVoteUI.cb_destroy_vote_icon = function (self, vote_icon_name)
	self._widgets[vote_icon_name] = nil
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
		0,
	}

	local a_diff = options[1] - self._vote_count[1]
	local b_diff = options[2] - self._vote_count[2]
	local c_diff = options[3] - self._vote_count[3]
	local d_diff = options[4] - self._vote_count[4]
	local e_diff = options[5] - self._vote_count[5]

	if a_diff > 0 then
		for i = 1, a_diff do
			self:_create_vote_icon(1)
		end
	end

	if b_diff > 0 then
		for i = 1, b_diff do
			self:_create_vote_icon(2)
		end
	end

	if c_diff > 0 then
		for i = 1, c_diff do
			self:_create_vote_icon(3)
		end
	end

	if d_diff > 0 then
		for i = 1, d_diff do
			self:_create_vote_icon(4)
		end
	end

	if e_diff > 0 then
		for i = 1, e_diff do
			self:_create_vote_icon(5)
		end
	end

	local total_amount = 0

	for i = 1, 5 do
		self._vote_count[i] = options[i]
		total_amount = total_amount + options[i]
	end

	local percentages = {}

	for i = 1, 5 do
		percentages[i] = total_amount > 0 and options[i] / total_amount or 0
	end

	self._active_vote.vote_percentages = self._active_vote.vote_percentages or {
		0,
		0,
		0,
		0,
		0,
	}

	for i = 1, 5 do
		self._active_vote.vote_percentages[i] = math.lerp(self._active_vote.vote_percentages[i] or 0, percentages[i], dt * 2)
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
end

TwitchVoteUI._draw = function (self, dt, t)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_manager:get_service("ingame_menu")
	local render_settings = self._render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local ui = self._ui

	if ui then
		for _, widget in pairs(self._widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_renderer)
end

TwitchVoteUI.destroy = function (self)
	Managers.state.event:unregister("add_vote_ui", self)
	Managers.state.event:unregister("finish_vote_ui", self)
	Managers.state.event:unregister("reset_vote_ui", self)
end

TwitchVoteUI._show_multiple_choice_vote = function (self)
	local active_vote = self._active_vote

	if not active_vote then
		return
	end

	self._widgets = {}

	local widgets = definitions.widgets.multiple_choice

	for widget_name, widget_data in pairs(widgets) do
		self._widgets[widget_name] = UIWidget.init(widget_data)
	end

	local players = self:_sorted_player_list()
	local option_strings = active_vote.inputs

	for index, player in pairs(players) do
		repeat
			local profile_index = player:profile_index()
			local player_profile = SPProfiles[profile_index]

			if player_profile and index <= PlayerManager.MAX_PLAYERS then
				local widget_index = "hero_" .. index
				local widget = self._widgets[widget_index]

				if widget then
					local career_index = player:career_index()
					local career_settings = player_profile.careers[career_index]
					local base_portrait = career_settings.portrait_image .. "_twitch"
					local masked_portrait = career_settings.portrait_image .. "_masked"
					local content = widget.content

					content.portrait = base_portrait
					content.masked_portrait = masked_portrait
					content.profile_index = profile_index

					local vote_widget_index = "hero_vote_" .. index
					local vote_widget = self._widgets[vote_widget_index]

					vote_widget.content.text = option_strings[profile_index]
				end
			end
		until true
	end

	local vote_icon_widget = self._widgets.vote_icon
	local vote_template = active_vote.vote_template
	local texture_id = vote_template.texture_id

	vote_icon_widget.content.texture_id = texture_id

	local vote_text_widget = self._widgets.vote_text
	local text = vote_template.text

	vote_text_widget.content.text = text

	self:_play_multiple_vote_start()
end

TwitchVoteUI._update_multiple_votes_ui = function (self, dt)
	local active_vote = self._active_vote

	if not active_vote then
		return
	end

	local highest_percentage = 0
	local glow_index = 0

	for index = 1, 4 do
		local widget_name = "hero_" .. index
		local widget = self._widgets[widget_name]
		local content = widget.content
		local profile_index = content.profile_index
		local percentage = active_vote.vote_percentages[profile_index] or 0
		local style = widget.style
		local height = style.mask.base_size[2] * percentage

		style.mask.texture_size[2] = height

		if highest_percentage < percentage then
			glow_index = index
			highest_percentage = percentage
		end
	end

	for index = 1, 4 do
		local widget_name = "hero_glow_" .. index
		local widget = self._widgets[widget_name]
		local glow = index == glow_index
		local content = widget.content

		content.visible = glow
	end

	local timer = active_vote.timer
	local time_left = math.abs(math.ceil(timer))
	local timer_widget = self._widgets.timer

	timer_widget.content.text = time_left

	self:_play_timer_sfx(time_left)
end

TwitchVoteUI._show_multiple_choice_result = function (self)
	self._fade_out = false

	local vote_result = self._vote_result

	assert(vote_result)
	WwiseWorld.trigger_event(self.wwise_world, "Play_twitch_vote_end")

	self._widgets = {}

	local widgets = definitions.widgets.multiple_choice_result

	for widget_name, widget_data in pairs(widgets) do
		self._widgets[widget_name] = UIWidget.init(widget_data)
	end

	local winner_text_widget = self._widgets.winner_text
	local winner_portrait_widget = self._widgets.winner_portrait
	local winning_index = vote_result.winning_index

	print("winning_index", winning_index)
	assert(winning_index > 0 and winning_index <= 5)

	local human_and_bot_players = Managers.player:human_and_bot_players()

	for peer_id, player in pairs(human_and_bot_players) do
		local profile_index = player:profile_index()

		if profile_index == winning_index then
			local name = player:name()

			winner_text_widget.content.text = name

			local player_profile = SPProfiles[profile_index]
			local career_index = player:career_index()
			local career_settings = player_profile.careers[career_index]
			local base_portrait = career_settings.portrait_image

			winner_portrait_widget.content.portrait = base_portrait
			winner_portrait_widget.content.visible = true
		end
	end

	local vote_template = vote_result.vote_template

	if vote_template then
		local result_icon_widget = self._widgets.result_icon
		local texture_id = vote_template.texture_id

		result_icon_widget.content.texture_id = texture_id

		local result_text_widget = self._widgets.result_text
		local text = vote_template.text

		result_text_widget.content.text = text
	end

	self._result_timer = RESULT_TIMER
end

TwitchVoteUI._update_result = function (self, dt)
	self._result_timer = self._result_timer - dt

	if self._result_timer > 0 then
		return
	end

	self:hide_ui()
end

TwitchVoteUI._show_standard_vote = function (self)
	local active_vote = self._active_vote

	if not active_vote then
		return
	end

	self._widgets = {}

	local widgets = definitions.widgets.standard_vote

	for widget_name, widget_data in pairs(widgets) do
		self._widgets[widget_name] = UIWidget.init(widget_data)
	end

	local vote_template_a = active_vote.vote_template_a
	local vote_template_b = active_vote.vote_template_b
	local vote_icon_a_widget = self._widgets.vote_icon_a
	local texture_a = vote_template_a.texture_id
	local use_frame_texture_a = true

	vote_icon_a_widget.content.texture_id = texture_a

	local vote_icon_b_widget = self._widgets.vote_icon_b
	local texture_b = vote_template_b.texture_id
	local use_frame_texture_b = true

	vote_icon_b_widget.content.texture_id = texture_b
	self._widgets.vote_icon_rect_a.content.visible = use_frame_texture_a
	self._widgets.vote_icon_rect_b.content.visible = use_frame_texture_b

	local vote_text_a_widget = self._widgets.vote_text_a

	vote_text_a_widget.content.text = vote_template_a.text

	local vote_text_b_widget = self._widgets.vote_text_b

	vote_text_b_widget.content.text = vote_template_b.text

	self:_play_standard_vote_start()
end

TwitchVoteUI._update_standard_vote = function (self)
	local active_vote = self._active_vote

	if not active_vote then
		return
	end

	local timer = active_vote.timer
	local time_left = math.abs(math.ceil(timer))
	local timer_widget = self._widgets.timer

	if not timer_widget then
		table.dump(self._widgets, "### TWITCH VOTE UI CRASH INFO ###", 3)

		return
	end

	timer_widget.content.text = time_left

	self:_play_timer_sfx(time_left)

	local vote_percentages = active_vote.vote_percentages
	local vote_percentage_a = vote_percentages[1]
	local vote_percentage_b = vote_percentages[2]
	local result_a_bar_default_size = scenegraph_definition.result_a_bar.size
	local result_a_bar_size = self._ui_scenegraph.result_a_bar.size

	result_a_bar_size[1] = math.ceil(result_a_bar_default_size[1] * vote_percentage_a)

	local result_b_bar_default_size = scenegraph_definition.result_b_bar.size
	local result_b_bar_size = self._ui_scenegraph.result_b_bar.size

	result_b_bar_size[1] = math.ceil(result_b_bar_default_size[1] * vote_percentage_b)
	self._widgets.result_bar_a_eyes.content.visible = vote_percentage_b <= vote_percentage_a
	self._widgets.result_bar_b_eyes.content.visible = vote_percentage_a <= vote_percentage_b
end

TwitchVoteUI._show_standard_vote_result = function (self)
	self._fade_out = false

	local vote_result = self._vote_result

	assert(vote_result)

	self._widgets = {}

	local widgets = definitions.widgets.standard_vote_result

	for widget_name, widget_data in pairs(widgets) do
		self._widgets[widget_name] = UIWidget.init(widget_data)
	end

	self._result_timer = RESULT_TIMER

	local winning_template_name = vote_result.winning_template_name

	assert(winning_template_name)

	local winning_template = TwitchVoteTemplates[winning_template_name]
	local texture_id = winning_template.texture_id
	local result_icon_widget = self._widgets.result_icon

	result_icon_widget.content.texture_id = texture_id

	local cost = winning_template.cost

	self:_play_winning_sfx(cost)

	local result_icon_widget = self._widgets.result_icon
	local texture = winning_template.texture_id

	result_icon_widget.content.texture_id = texture

	local use_frame_texture = true

	self._widgets.result_icon_rect.content.visible = use_frame_texture

	local result_text_widget = self._widgets.result_text
	local text = winning_template.text

	result_text_widget.content.text = text

	local result_description_text_widget = self._widgets.result_description_text

	if winning_template.description then
		local description_text = winning_template.description

		result_description_text_widget.content.text = description_text
	else
		result_description_text_widget.content.visible = false
	end
end

TwitchVoteUI._sorted_player_list = function (self)
	local human_and_bot_players = Managers.player:human_and_bot_players()
	local players = {}

	for peer_id, player in pairs(human_and_bot_players) do
		if player:profile_index() then
			table.insert(players, player)
		end
	end

	local function sort_by_profile_index(player_a, player_b)
		local profile_index_a = player_a:profile_index()
		local profile_index_b = player_b:profile_index()

		return profile_index_a < profile_index_b
	end

	table.sort(players, sort_by_profile_index)

	return players
end

TwitchVoteUI._play_winning_sfx = function (self, cost)
	if cost == nil then
		return
	end

	if cost <= 0 then
		WwiseWorld.trigger_event(self.wwise_world, "Play_twitch_vote_end")
	else
		WwiseWorld.trigger_event(self.wwise_world, "Play_twitch_vote_evil_won")
	end
end

TwitchVoteUI._play_timer_sfx = function (self, time_left)
	if time_left <= INIT_AUDIO_COUNTDOWN_AT and time_left ~= self._last_played_countdown_sfx then
		WwiseWorld.trigger_event(self.wwise_world, "Play_twitch_count")

		self._last_played_countdown_sfx = time_left
	end
end

TwitchVoteUI._play_multiple_vote_start = function (self)
	WwiseWorld.trigger_event(self.wwise_world, "Play_twitch_vote_multiple_start")
end

TwitchVoteUI._play_standard_vote_start = function (self)
	WwiseWorld.trigger_event(self.wwise_world, "Play_twitch_vote_standard_buff_start")
end
