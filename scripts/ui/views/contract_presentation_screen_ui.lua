local definitions = local_require("scripts/ui/views/contract_presentation_screen_ui_definitions")
local animation_definitions = definitions.animation_definitions
local scenegraph_definition = definitions.scenegraph_definition
ContractPresentationScreenUI = class(ContractPresentationScreenUI)
local DO_RELOAD = false
local AUTO_CONTINUE_DURATION = 8

ContractPresentationScreenUI.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self.peer_id = ingame_ui_context.peer_id
	self.player_manager = ingame_ui_context.player_manager
	self.game_won = ingame_ui_context.game_won
	self.ui_animations = {}
	self.world_manager = ingame_ui_context.world_manager
	local world = self.world_manager:world("level_world")
	self.wwise_world = Managers.world:wwise_world(world)
	local quest_manager = Managers.state.quest
	self.quest_manager = quest_manager
	local input_manager = self.input_manager

	input_manager:create_input_service("contract_presentation_screen_ui", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service("contract_presentation_screen_ui", "keyboard")
	input_manager:map_device_to_service("contract_presentation_screen_ui", "mouse")
	input_manager:map_device_to_service("contract_presentation_screen_ui", "gamepad")
	self:_create_ui_elements()
	rawset(_G, "contract_log_ui", self)
end

ContractPresentationScreenUI.on_enter = function (self, ignore_input_blocking)
	local backend_settings = GameSettingsDevelopment.backend_settings

	if backend_settings.quests_enabled then
		local chat_focused = Managers.chat:chat_is_focused()
		local input_manager = self.input_manager

		if not ignore_input_blocking and not chat_focused then
			input_manager:block_device_except_service("contract_presentation_screen_ui", "keyboard")
			input_manager:block_device_except_service("contract_presentation_screen_ui", "mouse")
			input_manager:block_device_except_service("contract_presentation_screen_ui", "gamepad")
		end

		local missing_contracts = self:_initialize_active_contracts()

		if not self.game_won or missing_contracts or self.num_active_contract_widget == 0 then
			self.is_complete = true
		else
			self.started = true
			self.is_complete = nil
		end

		self.waiting_for_input = nil
		self.exit_anim_id = nil
	else
		self.is_complete = true
	end
end

ContractPresentationScreenUI.input_service = function (self)
	return self.input_manager:get_service("contract_presentation_screen_ui")
end

ContractPresentationScreenUI.destroy = function (self)
	self.ui_animator = nil

	rawset(_G, "contract_log_ui", nil)
end

ContractPresentationScreenUI.update = function (self, dt, t)
	if DO_RELOAD then
		self:_create_ui_elements()

		DO_RELOAD = false
	end

	if self.is_complete or not self.started then
		return
	end

	local ui_animator = self.ui_animator

	ui_animator:update(dt)

	local auto_continue = self:_update_continue_timer(dt)

	if not self.waiting_for_input then
		if self:_handle_animations() then
			self.waiting_for_input = true
			self.continue_timer = AUTO_CONTINUE_DURATION
		end
	elseif not self.exit_anim_id and (self.input_manager:any_input_pressed() or auto_continue) then
		self.exit_anim_id = self:_start_contract_animation(nil, "contracts_exit")
	end

	if self.exit_anim_id and ui_animator:is_animation_completed(self.exit_anim_id) then
		ui_animator:stop_animation(self.exit_anim_id)

		self.is_complete = true
	end

	self:_draw(dt)
end

ContractPresentationScreenUI._update_continue_timer = function (self, dt)
	local continue_timer = self.continue_timer

	if continue_timer then
		continue_timer = continue_timer - dt

		if continue_timer <= 0 then
			self.continue_timer = nil

			return true
		else
			self.continue_timer = continue_timer
		end
	end
end

ContractPresentationScreenUI._draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local input_service = input_manager:get_service("contract_presentation_screen_ui")
	local gamepad_active = input_manager:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)
	UIRenderer.draw_widget(ui_renderer, self.title_text)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	if self.waiting_for_input and not self.exit_anim_id then
		local input_widgets = self._input_widgets
		self.input_description_text.content.text = (gamepad_active and "press_any_button_to_continue") or "press_any_key_to_continue"

		UIRenderer.draw_widget(ui_renderer, self.input_description_text)
	end

	UIRenderer.end_pass(ui_renderer)
end

ContractPresentationScreenUI._create_ui_elements = function (self)
	self.num_active_contract_widget = 0
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.input_description_text = UIWidget.init(definitions.widget_definitions.input_description_text)
	self.title_text = UIWidget.init(definitions.widget_definitions.title_text)
	local widgets = {}

	for i, definition in ipairs(definitions.entry_widget_definitions) do
		widgets[i] = UIWidget.init(definition)
	end

	self._widgets = widgets

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
end

ContractPresentationScreenUI._initialize_active_contracts = function (self)
	local all_contracts = self.quest_manager:get_contracts()
	local active_contract_ids = {}

	for contract_id, contract_data in pairs(all_contracts) do
		if self.quest_manager:get_session_progress_by_contract_id(contract_id) and contract_data.active and not contract_data.turned_in then
			active_contract_ids[#active_contract_ids + 1] = contract_id
		end
	end

	local contract_entries = {}
	local contract_entries_by_index = {}
	local widget_index = 0

	if #active_contract_ids > 0 then
		local widgets = self._widgets

		for _, contract_id in ipairs(active_contract_ids) do
			widget_index = widget_index + 1
			local widget = widgets[widget_index]

			if widget then
				local task_data, contract_start_progress, contract_session_progress = self:_set_contract_start_info_by_contract_id(widget, contract_id)
				contract_entries[contract_id] = {
					contract_start_progress = contract_start_progress,
					contract_session_progress = contract_session_progress,
					widget_index = widget_index,
					contract_id = contract_id,
					task_data = task_data,
					widget = widget
				}
				contract_entries_by_index[widget_index] = contract_entries[contract_id]
			end
		end
	else
		local missing_contracts = true

		return missing_contracts
	end

	self.num_active_contract_widget = widget_index
	self.contract_entries_by_index = contract_entries_by_index
	self.contract_entries = contract_entries
end

ContractPresentationScreenUI._set_contract_start_info_by_contract_id = function (self, widget, contract_id)
	local quest_manager = self.quest_manager
	local contract_template = quest_manager:get_contract_by_id(contract_id)
	local task = contract_template.requirements.task
	local contract_name = quest_manager:get_title_for_contract_id(contract_id)
	widget.content.title_text = contract_name
	local contract_progress = quest_manager:get_contract_progress(contract_id)
	local contract_session_progress = quest_manager:get_session_progress_by_contract_id(contract_id)
	local index_count = 0
	local task_data = {}
	local tasks_total_end_values = 0
	local tasks_total_start_values = 0
	local tasks_total_session_values = 0

	if task then
		local task_list_start_progress = contract_progress or 0
		local session_task_list_start_progress = contract_session_progress or 0
		local session_task_start_progress = session_task_list_start_progress
		local task_start_progress = math.max(task_list_start_progress - session_task_start_progress, 0)
		local task_required = task.amount.required
		local value_text = tostring(task_start_progress) .. "/" .. tostring(task_required)
		index_count = index_count + 1

		self:_set_widget_task_info(widget, index_count, task.type, value_text)

		task_data[index_count] = {
			end_value = task_required,
			value = task_start_progress,
			session_value = session_task_start_progress,
			has_changed = session_task_start_progress > 0
		}
		tasks_total_start_values = tasks_total_start_values + task_start_progress
		tasks_total_session_values = tasks_total_session_values + session_task_start_progress
		tasks_total_end_values = tasks_total_end_values + task_required
	end

	local tasks_total_progress = (tasks_total_end_values > 0 and tasks_total_start_values / tasks_total_end_values) or 0
	tasks_total_progress = math.max(math.min(tasks_total_progress, 1), 0)
	local tasks_total_session_progress = (tasks_total_end_values > 0 and tasks_total_session_values / tasks_total_end_values) or 0
	tasks_total_session_progress = math.max(math.min(tasks_total_session_progress, 1), 0)

	self:_set_widget_task_amount(widget, index_count)
	self:_set_widget_contract_progress(widget, tasks_total_progress)

	return task_data, tasks_total_progress, tasks_total_session_progress
end

ContractPresentationScreenUI._set_widget_task_amount = function (self, widget, amount)
	widget.content.task_amount = amount
	local widget_style = widget.style
	widget_style.texture_divider.texture_amount = amount - 1
	local task_bg_size = widget.style.task_bg_size
	local task_start_offset = widget.style.task_start_offset
	local width_per_task = task_bg_size[1] / amount

	for i = 1, amount, 1 do
		local task_text_style = widget_style["task_text_" .. i]
		local task_value_style = widget_style["task_value_" .. i]
		local texture_task_marker_style = widget_style["texture_task_marker_" .. i]
		local texture_task_glow_style = widget_style["texture_task_glow_" .. i]
		local texture_task_icon_style = widget_style["texture_task_icon_" .. i]
		task_text_style.size[1] = width_per_task
		task_value_style.size[1] = width_per_task
		local text_start_position = task_start_offset + width_per_task * (i - 1)
		task_text_style.offset[1] = text_start_position
		task_value_style.offset[1] = text_start_position
		local marker_size = texture_task_marker_style.size
		texture_task_marker_style.offset[1] = 20 + task_start_offset + width_per_task * (i - 1) + width_per_task * 0.5 - marker_size[1] * 0.5
		local glow_size = texture_task_glow_style.size
		texture_task_glow_style.offset[1] = task_start_offset + width_per_task * (i - 1) + width_per_task * 0.5 - glow_size[1] * 0.5
		local icon_size = texture_task_icon_style.size
		texture_task_icon_style.offset[1] = task_start_offset + width_per_task * (i - 1) + width_per_task * 0.5 - icon_size[1] * 0.5
	end
end

ContractPresentationScreenUI._sync_contracts_task_progress = function (self)
	local widgets = self._widgets
	local contract_entries = self.contract_entries

	if contract_entries then
		for contract_id, entry_data in pairs(contract_entries) do
			self:_sync_contract_task_progress(contract_id)
		end
	end
end

ContractPresentationScreenUI._sync_contract_task_progress = function (self, contract_id)
	local entry = self.contract_entries[contract_id]
	local widget = entry.widget
	local task_data = entry.task_data
	local contract_session_progress = quest_manager:get_session_progress_by_contract_id(contract_id)
	local index_count = 0
	index_count = index_count + 1
	local task_data = task_data[index_count]
	local value_text = tostring(task_value) .. "/" .. tostring(task_data.end_value)

	self:_set_widget_task_info(widget, index_count, nil, value_text)
end

ContractPresentationScreenUI._set_widget_contract_progress = function (self, widget, progress)
	local widget_content = widget.content
	local widget_style = widget.style
	local progress_bar_style = widget_style.progress_bar
	local progress_bar_content = widget_content.progress_bar
	progress_bar_style.size[1] = progress_bar_style.uv_scale_pixels * progress
	progress_bar_content.uvs[2][progress_bar_style.scale_axis] = progress
	progress = math.floor(progress * 100, 1)
	local progress_text = tostring(progress) .. "%"
	local text = Localize("dlc1_3_1_contract_presentation_progress_prefix")
	widget_content.bar_text = text .. ": " .. progress_text
end

ContractPresentationScreenUI._set_widget_task_info = function (self, widget, index, text, value_text)
	local widget_content = widget.content
	local widget_style = widget.style

	if text then
		local icons = QuestSettings.task_type_to_icon_lookup
		local task_icon = icons[text]

		if task_icon then
			widget_content["texture_task_icon_" .. index] = task_icon
		else
			widget_content["task_text_" .. index] = text
		end
	end

	if value_text then
		widget_content["task_value_" .. index] = value_text
	end
end

ContractPresentationScreenUI._get_text_size = function (self, text_style, text)
	local ui_renderer = self.ui_renderer
	local size = text_style.size
	local font, size_of_font = UIFontByResolution(text_style, nil)
	local font_material = font[1]
	local _ = font[2]
	local font_name = font[3]
	local font_size = size_of_font
	local font_height, font_min, font_max = UIGetFontHeight(ui_renderer.gui, font_name, font_size)
	local texts = UIRenderer.word_wrap(ui_renderer, text, font_material, font_size, size[1])
	local num_texts = #texts
	local inv_scale = RESOLUTION_LOOKUP.inv_scale
	local full_font_height = (font_max + math.abs(font_min)) * inv_scale
	local longest_width = 0

	for i = 1, num_texts, 1 do
		local text_line = texts[i]
		local width, height, min = UIRenderer.text_size(ui_renderer, text_line, font_material, font_size, full_font_height)

		if longest_width < width then
			longest_width = width
		end
	end

	return num_texts * full_font_height, longest_width
end

ContractPresentationScreenUI._handle_animations = function (self)
	local num_active_contract_widget = self.num_active_contract_widget
	local ui_animator = self.ui_animator

	if num_active_contract_widget > 0 then
		local contract_entries_by_index = self.contract_entries_by_index
		local all_entries_completed = true

		for index, entry in pairs(contract_entries_by_index) do
			local contract_id = entry.contract_id

			if not entry.animations_done then
				all_entries_completed = true

				if not entry.intro_started then
					local anim_id = self:_start_contract_animation(contract_id, "contract_entry")
					entry.widget.content.visible = true
					entry.intro_started = true
					entry.intro_anim_id = anim_id

					return
				elseif entry.intro_anim_id and ui_animator:is_animation_completed(entry.intro_anim_id) then
					ui_animator:stop_animation(entry.intro_anim_id)

					entry.intro_anim_id = nil

					return
				end

				if entry.intro_started and not entry.intro_anim_id then
					if not entry.task_anims_done then
						if not entry.animating_task_index then
							local task_data = entry.task_data

							if #task_data > 0 then
								for i = 1, #task_data, 1 do
									local data = task_data[i]

									if data.has_changed then
										local animating_task_index = i
										local anim_id = self:_start_contract_animation(contract_id, "contract_task_progress", animating_task_index)
										entry.task_anim_id = anim_id
										entry.animating_task_index = animating_task_index

										return
									end
								end
							end

							entry.task_anims_done = true

							return
						elseif entry.task_anim_id and ui_animator:is_animation_completed(entry.task_anim_id) then
							ui_animator:stop_animation(entry.task_anim_id)

							entry.task_anim_id = nil
							local task_data = entry.task_data
							local animating_task_index = entry.animating_task_index

							if animating_task_index < #task_data then
								for i = animating_task_index + 1, #task_data, 1 do
									local data = task_data[i]

									if data.has_changed then
										animating_task_index = i
										local anim_id = self:_start_contract_animation(contract_id, "contract_task_progress", animating_task_index)
										entry.task_anim_id = anim_id
										entry.animating_task_index = animating_task_index

										return
									end
								end
							end

							entry.task_anims_done = true

							return
						else
							return
						end
					elseif not entry.summary_anim_done then
						if not entry.summary_started then
							local animation_name = (entry.contract_session_progress > 0 and "contract_summary") or "no_progress"
							local anim_id = self:_start_contract_animation(contract_id, animation_name)
							entry.summary_anim_id = anim_id
							entry.summary_started = true

							return
						elseif entry.summary_anim_id and ui_animator:is_animation_completed(entry.summary_anim_id) then
							ui_animator:stop_animation(entry.summary_anim_id)

							entry.summary_anim_id = nil
							entry.summary_anim_done = true

							return
						else
							return
						end
					elseif not entry.end_started then
						if index < num_active_contract_widget then
							local anim_id = self:_start_contract_animation(contract_id, "contract_move")
							entry.end_started = true
							entry.end_anim_id = anim_id

							return
						else
							entry.animations_done = true
						end
					elseif entry.end_anim_id and ui_animator:is_animation_completed(entry.end_anim_id) then
						ui_animator:stop_animation(entry.end_anim_id)

						entry.end_anim_id = nil
						entry.animations_done = true
					else
						return
					end
				else
					return
				end
			end
		end

		return all_entries_completed
	else
		return true
	end
end

ContractPresentationScreenUI._start_contract_animation = function (self, contract_id, animation_name, task_index)
	local entry = contract_id and self.contract_entries[contract_id]
	local widget_index = entry and entry.widget_index
	local task_data = entry and entry.task_data
	local params = {
		wwise_world = self.wwise_world,
		widget_index = widget_index,
		task_data = task_data,
		task_index = task_index,
		num_widgets = self.num_active_contract_widget,
		contract_session_progress = entry and entry.contract_session_progress,
		contract_start_progress = entry and entry.contract_start_progress
	}

	return self.ui_animator:start_animation(animation_name, self._widgets, scenegraph_definition, params)
end

return
