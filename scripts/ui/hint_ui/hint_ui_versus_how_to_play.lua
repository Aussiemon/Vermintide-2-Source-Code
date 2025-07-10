-- chunkname: @scripts/ui/hint_ui/hint_ui_versus_how_to_play.lua

require("scripts/ui/hint_ui/hint_ui")

HintUIVersusHowToPlay = class(HintUIVersusHowToPlay, HintUI)

HintUIVersusHowToPlay.init = function (self, ui_context, hint_name, hint_settings)
	HintUIVersusHowToPlay.super.init(self, ui_context, hint_name, hint_settings)

	self._shown = false
	self._duration = self._hint_data.duration
	self._gamepad_active = Managers.input:is_device_active("gamepad")
end

HintUIVersusHowToPlay.create_ui_elements = function (self)
	local data = self._hint_settings.data
	local widget_definitions = data.definitions.widget_definitions
	local hint_widget_def = UIWidgets.create_versus_gameplay_hint_widget("hint_anchor", data)

	widget_definitions.hint_widgets = hint_widget_def

	HintUIVersusHowToPlay.super.create_ui_elements(self)
end

HintUIVersusHowToPlay.update = function (self, dt, t)
	if self._shown then
		return
	end

	if self._duration and not self._shown and not self._start_t then
		self._start_t = t

		self:start_animation("enter", self._widgets_by_name.hint_widgets)
	end

	if self._duration and t <= self._start_t + self._duration then
		local widgets_by_name = self._widgets_by_name
		local widget = widgets_by_name.hint_widgets
		local content = widget.content

		if content.duration_bar then
			local duration_bar_content = content.duration_bar
			local uvs = duration_bar_content.uvs
			local hint_duration = self._duration
			local hint_duration_progress = 1 - (self._start_t + self._duration - t) / hint_duration

			uvs[2][1] = hint_duration_progress
			widget.style.duration_bar.texture_size[1] = 400 * hint_duration_progress
		end
	end

	if self._hint_data.input_data then
		self:_update_input(dt, t, self._hint_data.input_data)
	end

	HintUIVersusHowToPlay.super.update(self, dt, t)

	if self._start_t then
		if t > self._start_t + self._duration and not self._is_exiting then
			local animation_params = {
				wwise_world = self._wwise_world,
				render_settings = self._render_settings,
				self = self,
			}

			self:start_animation("exit", self._widgets_by_name.hint_widgets, animation_params)

			self._is_exiting = true
		end

		if self:should_show() and not self._has_widget_been_closed then
			self:show()
		end
	end
end

HintUIVersusHowToPlay.show = function (self)
	HintUIVersusHowToPlay.super.show(self)
	self:_set_hint_widget_size()
end

HintUIVersusHowToPlay._set_hint_widget_size = function (self)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.hint_widgets
	local content = widget.content
	local style = widget.style
	local title_style = style.title_text
	local body_style = style.body_text
	local title_text_height = UIUtils.get_text_height(self._ui_top_renderer, title_style.size, title_style, content.title_text)
	local body_text_height, body_num_lines = UIUtils.get_text_height(self._ui_top_renderer, body_style.size, body_style, content.body_text)
	local widget_height = title_text_height + body_text_height + body_num_lines * 2 + 10

	if self._duration then
		widget_height = widget_height + 8
	end

	if self._hint_data.foot_text then
		local foot_text_style = style.foot_text
		local foot_text_height, foot_text_num_lines = UIUtils.get_text_height(self._ui_top_renderer, foot_text_style.size, foot_text_style, content.foot_text)

		widget_height = widget_height + foot_text_height + foot_text_num_lines * 2
	end

	if self._hint_data.icon then
		widget_height = widget_height + style.foot_icon.texture_size[2] / 2 - 5
	end

	content.size[2] = widget_height
	widget.offset[2] = -(widget_height / 2)
end

HintUIVersusHowToPlay._update_input = function (self, dt, t, input_data)
	if not input_data.input_action then
		return
	end

	local gamepad_active = Managers.input:is_device_active("gamepad")

	if self._gamepad_active ~= gamepad_active then
		self._gamepad_active = gamepad_active

		local input_action = input_data.input_action

		input_action = input_action and (gamepad_active and input_data.gamepad_action or input_action)

		local input_text = "$KEY;" .. input_data.input_service_name .. "__" .. input_action .. ":"
		local input_string = string.format(Localize(self._hint_data.foot_text), input_text)
		local widget = self._widgets_by_name.hint_widgets

		widget.content.foot_text = input_string
	end
end

HintUIVersusHowToPlay.hide = function (self)
	self._shown = true
	self._has_widget_been_closed = true
	self._exit_anim_id = nil

	HintUIVersusHowToPlay.super.hide(self)
end
