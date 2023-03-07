require("scripts/settings/quest_settings")

local definitions = local_require("scripts/ui/hud_ui/contract_log_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local MAX_NUM_CONTRACT_ENTRIES = 3
local ENTRY_LENGTH = definitions.ENTRY_LENGTH
local QuestSettings = QuestSettings
local default_color = {
	170,
	255,
	255,
	255
}
local progress_color = Colors.get_color_table_with_alpha("sky_blue", 220)
local complete_color = Colors.get_color_table_with_alpha("pale_green", 220)
ContractLogUI = class(ContractLogUI)

ContractLogUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self.peer_id = ingame_ui_context.peer_id
	self.player_manager = ingame_ui_context.player_manager
	self.ui_animations = {}
	local world = ingame_ui_context.world_manager:world("level_world")
	self.wwise_world = Managers.world:wwise_world(world)
	self.num_added_contracts = 0

	self:_create_ui_elements()

	local _, title_text_width = self:_get_text_size(self.title_widget.style.title_text, self.title_widget.content.title_text)
	self.min_log_width = math.floor(title_text_width)
	local quest_manager = Managers.state.quest
	self.quest_manager = quest_manager

	self:_align_widgets()
	rawset(_G, "contract_log_ui", self)
end

ContractLogUI._create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widgets = {}
	local unused_widgets = {}

	for i, definition in ipairs(definitions.entry_widget_definitions) do
		widgets[i] = UIWidget.init(definition)
		unused_widgets[i] = widgets[i]
	end

	self._widgets = widgets
	self._unused_widgets = unused_widgets
	self._used_widgets = {}
	self._log_entries = {}
	self._log_entries_by_contract_id = {}
	self.title_widget = UIWidget.init(definitions.widget_definitions.title_text)

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)
	self:set_visible(true)
end

ContractLogUI._align_widgets = function (self)
	local start_position = 5
	local longest_width = 0
	local spacing = 10

	for index, widget in ipairs(self._used_widgets) do
		local offset = widget.offset
		offset[2] = -math.floor(start_position)
		local text_width = widget.content.text_width
		local total_height = widget.content.total_height
		widget.style.texture_fade_bg.size[2] = total_height
		start_position = start_position + total_height + spacing

		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
end

ContractLogUI.destroy = function (self)
	self:set_visible(false)
	rawset(_G, "contract_log_ui", nil)
end

ContractLogUI.set_visible = function (self, visible)
	self._is_visible = visible
	local ui_renderer = self.ui_renderer

	for _, widget in ipairs(self._widgets) do
		UIRenderer.set_element_visible(ui_renderer, widget.element, visible)
	end

	UIRenderer.set_element_visible(ui_renderer, self.title_widget.element, visible)
	self:set_dirty()
end

ContractLogUI._sync_active_contracts = function (self)
	local dirty = false
	local active_contract_ids = self.quest_manager:get_active_contract_ids()

	if active_contract_ids then
		local log_entries_by_contract_id = self._log_entries_by_contract_id
		local num_added_contracts = self.num_added_contracts

		if num_added_contracts and num_added_contracts > 0 then
			local log_entries = self._log_entries

			for i = 1, num_added_contracts do
				local entry_data = log_entries[i]

				if entry_data then
					local added_contract_id = entry_data.contract_id
					local is_contract_able_to_progress = self.quest_manager:is_contract_able_to_progress(added_contract_id)

					if not table.contains(active_contract_ids, added_contract_id) or not is_contract_able_to_progress then
						self:_remove_contract(added_contract_id)

						dirty = true
					end
				end
			end
		end

		for _, contract_id in pairs(active_contract_ids) do
			if not log_entries_by_contract_id[contract_id] and self.quest_manager:is_contract_able_to_progress(contract_id) then
				self:_add_contract(contract_id)

				dirty = true
			end
		end
	end

	return dirty
end

ContractLogUI._sync_contract_progression = function (self)
	local log_entries = self._log_entries
	local dirty = false
	local any_task_completed = false

	for _, entry_data in ipairs(log_entries) do
		local contract_id = entry_data.contract_id

		if self.quest_manager:has_contract_session_changes(contract_id) then
			local changed, task_completed = self:_update_contract_goal(entry_data)

			if changed then
				local widget = entry_data.widget

				self:_set_widget_dirty(widget)
			end

			if task_completed then
				any_task_completed = true
			end

			if changed or task_completed then
				dirty = true
			end
		end
	end

	if any_task_completed then
		self:play_sound("Play_hud_quest_menu_finish_quest_during_gameplay")
	end

	return dirty
end

ContractLogUI._update_contract_goal = function (self, entry_data)
	local contract_id = entry_data.contract_id
	local contract_session_progress = self.quest_manager:get_session_progress_by_contract_id(contract_id)
	local widget = entry_data.widget
	local widget_content = widget.content
	local widget_style = widget.style
	local title_text_width = widget_content.title_text_width
	local text_color = default_color
	local task = entry_data.contract_goal
	local contract_progress = entry_data.contract_goal_start_progress
	local current_session_progress = entry_data.contract_goal_session_progress
	local task_text = ""
	local add_unspecified_task_entry = nil
	widget_style.task_text.text_color = text_color

	if task then
		local task_start_progress = contract_progress
		local task_session_progress = contract_session_progress
		local task_progress = task_start_progress + task_session_progress
		local required = task.amount.required
		local tasks_complete = required <= task_progress
		local task_progress_made = task_progress ~= task_start_progress

		if tasks_complete then
			text_color = complete_color
		elseif task_progress_made then
			text_color = progress_color
		end

		local make_dirty = task_progress ~= widget_content.task_progress
		widget_content.task_progress = task_progress
		widget_style.task_text.text_color = text_color
		local text = Localize(QuestSettings.task_type_to_name_lookup[task.type]) .. ": " .. tostring(task_progress) .. "/" .. tostring(required)
		task_text = task_text .. text
		local task_current_session_progress = current_session_progress
		local new_value = task_current_session_progress ~= task_session_progress
		local progress_increased = task_progress ~= task_start_progress

		if new_value then
			current_session_progress = task_session_progress
		end

		if add_unspecified_task_entry then
			task_text = task_text .. "..."
		end

		local _, text_width = self:_get_text_size(widget_style.task_text, task_text)

		if text_width < title_text_width then
			text_width = title_text_width
		end

		widget_content.task_text = task_text
		widget_content.text_width = text_width

		if not widget_content.tasks_complete and tasks_complete then
			widget_content.tasks_complete = tasks_complete

			return make_dirty, tasks_complete
		else
			widget_content.tasks_complete = tasks_complete
		end

		return make_dirty
	end
end

ContractLogUI._add_contract = function (self, contract_id)
	local num_added_contracts = self.num_added_contracts or 0

	if MAX_NUM_CONTRACT_ENTRIES <= num_added_contracts then
		return
	end

	local entry_data = {}
	local index = num_added_contracts + 1
	local widget = table.remove(self._unused_widgets, 1)
	local widget_content = widget.content
	local widget_style = widget.style
	widget_style.task_text.text_color = default_color

	UIRenderer.set_element_visible(self.ui_renderer, widget.element, true)
	self:_set_widget_dirty(widget)

	local contract_template = self.quest_manager:get_contract_by_id(contract_id)
	local task = contract_template.requirements.task
	local contract_name = self.quest_manager:get_title_for_contract_id(contract_id)
	local rewards = contract_template.rewards
	local quest_reward = rewards.quest
	local contract_color = quest_reward and QuestSettings.contract_ui_dlc_colors[quest_reward.quest_type] or Colors.get_table("white")
	local icon_color = widget_style.texture_icon_bg.color
	icon_color[2] = contract_color[2]
	icon_color[3] = contract_color[3]
	icon_color[4] = contract_color[4]
	local contract_progress = self.quest_manager:get_contract_progress(contract_id)
	local contract_session_progress = nil
	local task_text = ""

	if task then
		contract_session_progress = 0
		local task_start_progress = contract_progress
		local required = task.amount.required
		local acquired = task.amount.acquired

		if task_start_progress < required then
			local text = Localize(QuestSettings.task_type_to_name_lookup[task.type]) .. ":  " .. tostring(task_start_progress) .. "/" .. tostring(required)
			task_text = task_text .. text .. "\n"
		end
	end

	local _, title_text_width = self:_get_text_size(widget_style.title_text, contract_name)
	local text_height, text_width = self:_get_text_size(widget_style.task_text, task_text)

	if text_width < title_text_width then
		text_width = title_text_width
	end

	widget_content.title_text = contract_name
	widget_content.task_text = task_text
	widget_content.total_height = widget_style.texture_icon.size[2] + text_height
	widget_content.text_width = text_width
	widget_content.title_text_width = title_text_width
	widget_content.tasks_complete = false
	widget_content.task_progress = 0
	entry_data.widget = widget
	entry_data.contract_goal = task
	entry_data.contract_goal_start_progress = contract_progress
	entry_data.contract_goal_session_progress = contract_session_progress
	entry_data.contract_id = contract_id
	local used_widgets = self._used_widgets

	table.insert(used_widgets, #used_widgets + 1, widget)

	local log_entries = self._log_entries

	table.insert(log_entries, #log_entries + 1, entry_data)

	self._log_entries_by_contract_id[contract_id] = entry_data
	self.num_added_contracts = index
end

ContractLogUI._remove_contract = function (self, contract_id)
	local num_added_contracts = self.num_added_contracts or 0

	if num_added_contracts <= 0 then
		return
	end

	local contract_data, index = nil
	local log_entries = self._log_entries

	for i = 1, #log_entries do
		local entry_data = log_entries[i]
		local entry_contract_id = entry_data.contract_id

		if entry_contract_id == contract_id then
			contract_data = entry_data
			index = i

			break
		end
	end

	if not contract_data then
		return
	end

	local widget = table.remove(self._used_widgets, index)

	UIRenderer.set_element_visible(self.ui_renderer, widget.element, false)
	self:_set_widget_dirty(widget)
	table.remove(log_entries, index)

	local unused_widgets = self._unused_widgets

	table.insert(unused_widgets, #unused_widgets + 1, widget)

	self.num_added_contracts = num_added_contracts - 1
	self._log_entries_by_contract_id[contract_id] = nil

	self:_align_widgets()
end

ContractLogUI._get_text_size = function (self, text_style, text)
	local ui_renderer = self.ui_renderer
	local size = text_style.size
	local text_height = UIUtils.get_text_height(ui_renderer, size, text_style, text)
	local longest_width = 0

	for i = 1, num_texts do
		local text_line = texts[i]
		local width = UIUtils.get_text_width(ui_renderer, text_style, text_line)

		if longest_width < width then
			longest_width = width
		end
	end

	return text_height, longest_width
end

ContractLogUI.update = function (self, dt, t)
	local dirty = false
	local realign = false

	if self:_sync_active_contracts() then
		realign = true
		dirty = true
	end

	if self:_sync_contract_progression() then
		realign = true
		dirty = true
	end

	if self._is_visible and (self.num_added_contracts and self.num_added_contracts <= 0 or not self.num_added_contracts) then
		self:set_visible(false)
	elseif not self._is_visible and self.num_added_contracts and self.num_added_contracts > 0 then
		self:set_visible(true)
	end

	if self:_handle_resolution_modified() then
		realign = true
	end

	if realign then
		self:_align_widgets()
	end

	if dirty then
		self:set_dirty()
	end

	self:draw(dt)
end

ContractLogUI._handle_resolution_modified = function (self)
	if RESOLUTION_LOOKUP.modified then
		self:_on_resolution_modified()

		return true
	end
end

ContractLogUI._on_resolution_modified = function (self)
	for _, entry_data in ipairs(self._log_entries) do
		self:_update_contract_goal(entry_data)

		local widget = entry_data.widget

		self:_set_widget_dirty(widget)
	end

	local _, title_text_width = self:_get_text_size(self.title_widget.style.title_text, self.title_widget.content.title_text)
	self.min_log_width = math.floor(title_text_width)

	self:_set_widget_dirty(self.title_widget)
	self:set_dirty()
end

ContractLogUI.draw = function (self, dt)
	if not self._is_visible then
		return
	end

	if not self._dirty then
		return
	end

	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)

	for _, widget in ipairs(self._used_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.draw_widget(ui_renderer, self.title_widget)
	UIRenderer.end_pass(ui_renderer)

	self._dirty = false
end

ContractLogUI.set_dirty = function (self)
	self._dirty = true
end

ContractLogUI._set_widget_dirty = function (self, widget)
	widget.element.dirty = true
end

ContractLogUI.play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)
end
