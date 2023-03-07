local definitions = local_require("scripts/ui/views/store_login_rewards_popup_definitions")
StoreLoginRewardsPopup = class(StoreLoginRewardsPopup)
local STATE = table.enum("refresh", "default", "claiming", "wait_for_backend", "presenting", "exiting", "exited")

StoreLoginRewardsPopup.init = function (self, parent, params)
	self._parent = parent
	self._ui_renderer = params.ui_top_renderer
	self._render_settings = {
		alpha_multiplier = 1
	}
	self._state = STATE.refresh
	self._has_claimed_rewards = false
	self._gamepad_active = false
	self._cursor_x = nil
	self._cursor_y = nil
	self._selected_widget = nil
	self._refresh_cooldown = 0

	self:_create_ui_elements()

	local backend_store = Managers.backend:get_interface("peddler")
	self._backend_store = backend_store
	self._rewards_claimable = nil
	self._reward_popup = RewardPopupUI:new(params)
	self._show_gamepad_tooltips = false
end

StoreLoginRewardsPopup.destroy = function (self)
	if self._reward_popup then
		self._reward_popup:destroy()

		self._reward_popup = nil
	end
end

StoreLoginRewardsPopup._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self._widgets, self._widgets_by_name = UIUtils.create_widgets(definitions.widget_definitions)
	self._overlay_widgets, self._overlay_widgets_by_name = UIUtils.create_widgets(definitions.overlay_widgets_definitions)
	self._loading_widgets, self._loading_widgets_by_name = UIUtils.create_widgets(definitions.loading_widgets_definitions)
	self._day_widgets = UIUtils.create_widgets(definitions.day_widget_definitions)
	self._reward_widgets = {}

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	local input_service = self._parent:input_service()
	self._menu_input_description = MenuInputDescriptionUI:new(nil, self._ui_renderer, input_service, 5, 900, definitions.generic_input_actions.default)

	self._menu_input_description:set_input_description(nil)

	self._widgets_by_name.claim_button.content.button_hotspot.disable_button = script_data["eac-untrusted"]
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, definitions.animation_definitions)
	self._animations = {}
end

StoreLoginRewardsPopup._has_claimed_reward = function (self, claimed_rewards, day_index)
	for _, claimed_reward_idx in ipairs(claimed_rewards) do
		if day_index == claimed_reward_idx then
			return true
		end
	end

	return false
end

StoreLoginRewardsPopup._setup_rewards_data = function (self, login_rewards)
	local rewards = login_rewards.rewards
	local reward_index = login_rewards.reward_index
	local day_widgets = self._day_widgets
	local reward_widgets = self._reward_widgets

	table.clear(reward_widgets)

	local widgets_by_name = self._widgets_by_name
	local gamepad_active = Managers.input:is_device_active("gamepad")
	self._gamepad_active = gamepad_active
	local cursor_x = self._cursor_x or math.clamp(reward_index + 1, 1, #rewards)
	local cursor_y = self._cursor_y or 1
	self._cursor_x = cursor_x
	self._cursor_y = cursor_y
	local calendar_type = login_rewards.type and login_rewards.type or "personal_time_strike"
	local claimed_rewards = login_rewards.claimed_rewards and login_rewards.claimed_rewards or {}
	local cooldown = login_rewards.next_claim_timestamp - os.time()
	local is_loop = reward_index == #day_widgets and cooldown <= 0

	for day_index = 1, #day_widgets do
		local day_widget_content = day_widgets[day_index].content
		day_widget_content.is_today = not is_loop and day_index == reward_index
		local is_claimed = nil

		if calendar_type == "calendar" then
			is_claimed = self:_has_claimed_reward(claimed_rewards, day_index) and not is_loop
		else
			is_claimed = not is_loop and day_index <= reward_index
		end

		day_widget_content.is_claimed = is_claimed
		local reward_item_list = rewards[day_index]
		day_widget_content.reward_count = #reward_item_list
		day_widget_content.selection_index = self._cursor_x
		day_widget_content.calendar_type = calendar_type
		day_widget_content.current_day = reward_index
		day_widget_content.is_loop = is_loop

		for item_index = 1, #reward_item_list do
			local widget_def = definitions.create_reward_item_widget(day_index, item_index)
			local widget = UIWidget.init(widget_def)
			reward_widgets[#reward_widgets + 1] = widget
			local reward_item = reward_item_list[item_index]
			local item = table.merge({
				backend_id = math.uuid(),
				data = ItemMasterList[reward_item.item_id]
			}, reward_item)

			fassert(item.data, "Reward item %s not found in ItemMasterList", reward_item.item_id)

			local rarity = item.rarity or item.data and item.data.rarity or "plentiful"
			local content = widget.content
			content.item = item
			content.item_icon = UIUtils.get_ui_information_from_item(item) or "icons_placeholder"
			content.item_rarity = UISettings.item_rarity_textures[rarity] or "icons_placeholder"
			content.is_illusion = item.item_type == "weapon_skin"
			content.day_index = day_index
			content.item_index = item_index
			local has_cursor = cursor_x == day_index and cursor_y == item_index
			content.is_selected = has_cursor

			if has_cursor then
				self._selected_widget = widget
			end
		end
	end

	local next_reward_index = 1 + reward_index % #day_widgets
	local day_offset = day_widgets[next_reward_index].offset
	self._ui_scenegraph.claim_button.position[1] = day_offset[1]
	self._next_reward_index = next_reward_index
	self._will_loop = reward_index == #day_widgets
end

StoreLoginRewardsPopup._claim_rewards = function (self)
	if self._waiting_for_claim then
		return
	end

	self._state = STATE.claiming
	self._widgets_by_name.claim_button.content.visible = false
	self._widgets_by_name.claim_button_glow.content.visible = false

	self._backend_store:claim_login_rewards()

	self._has_claimed_rewards = true
	local selected_widget = self._selected_widget

	if selected_widget then
		selected_widget.content.is_selected = false
		self._selected_widget = nil
	end

	self._parent:play_sound("Play_hud_daily_reward_claim")

	local next_reward_index = self._next_reward_index
	local day_widgets = self._day_widgets

	for i = 1, #day_widgets do
		day_widgets[i].content.is_today = false
	end

	local today_widget = day_widgets[next_reward_index]
	local content = today_widget.content
	content.is_claimed = true
	content.is_today = true

	self:_play_animation("on_claim", today_widget)
end

StoreLoginRewardsPopup._refresh_login_rewards_cb = function (self)
	self._waiting_for_refresh = false
end

StoreLoginRewardsPopup.update = function (self, input_service, dt, t)
	local backend_store = self._backend_store
	local login_rewards = backend_store:get_login_rewards()
	local cooldown = login_rewards.next_claim_timestamp - os.time()
	local expiry = login_rewards.end_of_claim_timestamp - os.time()
	local state = self._state
	local ui_animator = self._ui_animator
	local animations = self._animations

	if state == STATE.refresh then
		if backend_store:done_claiming_login_rewards() and not self._waiting_for_refresh and self._refresh_cooldown < t then
			self:_play_animation("on_enter")
			self._parent:play_sound("Play_hud_daily_reward_open")

			self._state = STATE.default

			self:_setup_rewards_data(login_rewards)
			self:_update_timer(cooldown, expiry)

			self._refresh_cooldown = t + 3
		end
	elseif state == STATE.default then
		if expiry <= -1 or login_rewards.reward_index >= 8 and cooldown <= -1 then
			local cb = callback(self, "_refresh_login_rewards_cb")

			backend_store:refresh_login_rewards(cb)

			self._waiting_for_refresh = true
			self._state = STATE.refresh

			return
		end

		self:_update_timer(cooldown, expiry)
		self:_handle_input(input_service, dt, t)
		self:_handle_gamepad_input(input_service)
	elseif state == STATE.claiming then
		if not animations.on_claim then
			self._state = STATE.wait_for_backend
			local overlay_widgets_by_name = self._overlay_widgets_by_name
			overlay_widgets_by_name.loading_glow.content.visible = true
			overlay_widgets_by_name.loading_frame.content.visible = true
		end
	elseif state == STATE.wait_for_backend then
		if backend_store:done_claiming_login_rewards() then
			local overlay_widgets_by_name = self._overlay_widgets_by_name
			overlay_widgets_by_name.loading_glow.content.visible = false
			overlay_widgets_by_name.loading_frame.content.visible = false

			self:_setup_rewards_data(login_rewards)

			local rewards = login_rewards.rewards
			local reward_index = login_rewards.reward_index

			self:_present_rewards(rewards[reward_index])

			self._state = STATE.presenting
		end
	elseif state == STATE.presenting then
		if not self._reward_popup:is_presentation_active() then
			self._state = STATE.default
		end
	elseif state == STATE.exiting and not animations.on_exit then
		self._state = STATE.exited
	end

	self._reward_popup:update(dt)
	self:_update_animations(dt)
	self:_draw(state, input_service, dt, t)
end

StoreLoginRewardsPopup._present_rewards = function (self, rewards)
	local num_rewards = #rewards

	if num_rewards == 0 then
		return
	end

	local item_interface = Managers.backend:get_interface("items")
	local presentation_data = {}

	for i = 1, num_rewards do
		local data = rewards[i]
		local reward_type = data.reward_type

		if reward_type == "item" then
			local item_id = data.item_id
			local item_template = ItemMasterList[item_id]
			presentation_data[#presentation_data + 1] = {
				{
					widget_type = "description",
					value = {
						Localize(item_template.display_name),
						Localize("achv_menu_reward_claimed_title")
					}
				},
				{
					widget_type = "loot_chest",
					value = item_id
				}
			}
		elseif reward_type == "chips" then
			local item_id = data.item_id
			local item_template = ItemMasterList[item_id]
			local amount = data.amount or item_template.bundle.BundledVirtualCurrencies.SM or 0
			presentation_data[#presentation_data + 1] = {
				{
					widget_type = "description",
					value = {
						Localize(item_template.display_name),
						string.format(Localize("achv_menu_curreny_reward_claimed"), amount)
					}
				},
				{
					widget_type = "icon",
					value = item_template.inventory_icon
				}
			}
		end
	end

	if #presentation_data == 0 then
		return
	end

	self._reward_popup:display_presentation(presentation_data)

	self._reward_presentation_active = true
end

StoreLoginRewardsPopup._update_timer = function (self, cooldown, expiry)
	local widgets_by_name = self._widgets_by_name
	local timer_widget = widgets_by_name.timer

	if cooldown <= 0 then
		if self._rewards_claimable ~= true then
			self._rewards_claimable = true

			self:_play_sound("Play_gui_achivements_menu_claim_reward")

			widgets_by_name.claim_button.content.visible = true
			widgets_by_name.claim_button_glow.content.visible = true

			if self._will_loop then
				local day_widgets = self._day_widgets

				for i = 1, #day_widgets do
					local content = day_widgets[i].content
					content.is_today = false
					content.is_claimed = false
				end
			end

			timer_widget.style.text.horizontal_alignment = "right"
			timer_widget.style.text_shadow.horizontal_alignment = "right"
		end

		local expiry_str = UIUtils.format_duration(expiry)
		timer_widget.content.text = Localize("menu_store_expire_timer_expires_in") .. ": " .. expiry_str
	else
		if self._rewards_claimable ~= false then
			self._rewards_claimable = false
			widgets_by_name.claim_button.content.visible = false
			widgets_by_name.claim_button_glow.content.visible = false
			timer_widget.style.text.horizontal_alignment = "left"
			timer_widget.style.text_shadow.horizontal_alignment = "left"
		end

		local cooldown_str = UIUtils.format_duration(cooldown)
		timer_widget.content.text = Localize("store_login_rewards_next_available_in") .. cooldown_str
	end
end

StoreLoginRewardsPopup._play_animation = function (self, name, widgets)
	local anim_id = self._ui_animator:start_animation(name, widgets or self._widgets_by_name, self._scenegraph_definition, self._render_settings)
	self._animations[name] = anim_id
end

StoreLoginRewardsPopup._update_animations = function (self, dt)
	UIWidgetUtils.animate_default_button(self._widgets_by_name.claim_button, dt)
	UIWidgetUtils.animate_default_button(self._widgets_by_name.close_button, dt)

	local ui_animator = self._ui_animator
	local animations = self._animations

	ui_animator:update(dt)

	for name, id in pairs(animations) do
		if ui_animator:is_animation_completed(id) then
			animations[name] = nil
		end
	end
end

StoreLoginRewardsPopup._handle_input = function (self, input_service, dt, t)
	local widgets_by_name = self._widgets_by_name
	local close_button = widgets_by_name.close_button
	local claim_button = widgets_by_name.claim_button

	if UIUtils.is_button_hover_enter(close_button) or UIUtils.is_button_hover_enter(claim_button) then
		self:_play_sound("Play_hud_hover")
	end

	if UIUtils.is_button_pressed(close_button) or input_service:get("toggle_menu", true) then
		self:_play_sound("Play_hud_select")
		self:_play_animation("on_exit")

		self._state = STATE.exiting
	elseif UIUtils.is_button_pressed(claim_button) then
		self:_claim_rewards()
	end
end

StoreLoginRewardsPopup._handle_gamepad_input = function (self, input_service)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	self._gamepad_active = gamepad_active

	if not gamepad_active then
		return
	end

	local day_widgets = self._day_widgets
	local cursor_x = self._cursor_x
	local modified = false

	if cursor_x < #day_widgets and input_service:get("move_right") then
		cursor_x = cursor_x + 1
		modified = true
	elseif cursor_x > 1 and input_service:get("move_left") then
		cursor_x = cursor_x - 1
		modified = true
	end

	local reward_count = day_widgets[cursor_x].content.reward_count
	local cursor_y = math.min(self._cursor_y, reward_count)

	if cursor_y > 1 and input_service:get("move_up") then
		cursor_y = cursor_y - 1
		modified = true
	elseif cursor_y < reward_count and input_service:get("move_down") then
		cursor_y = cursor_y + 1
		modified = true
	end

	if modified then
		self._cursor_x = cursor_x
		self._cursor_y = cursor_y
		local reward_widgets = self._reward_widgets

		for i = 1, #reward_widgets do
			local widget = reward_widgets[i]
			local content = widget.content
			local is_selected = content.day_index == cursor_x and content.item_index == cursor_y
			content.is_selected = is_selected

			if is_selected then
				self._selected_widget = widget
			end
		end
	elseif input_service:get("right_stick_press") then
		self._show_gamepad_tooltips = not self._show_gamepad_tooltips
		local reward_widgets = self._reward_widgets

		for i = 1, #reward_widgets do
			local widget = reward_widgets[i]
			local content = widget.content
			content.show_tooltips = self._show_gamepad_tooltips
		end
	elseif self._rewards_claimable and input_service:get("confirm_press") and self._next_reward_index == self._cursor_x then
		self:_claim_rewards()

		return
	elseif input_service:get("back") then
		self:_play_animation("on_exit")

		self._state = STATE.exiting

		return
	end

	local day_widgets = self._day_widgets

	for day_index = 1, #day_widgets do
		local content = day_widgets[day_index].content
		content.selection_index = self._cursor_x
	end

	local input_description = "default"

	if self._rewards_claimable and self._next_reward_index == self._cursor_x then
		input_description = "claim_available"
	end

	if input_description ~= self._input_description then
		self._menu_input_description:change_generic_actions(definitions.generic_input_actions[input_description])
	end
end

StoreLoginRewardsPopup._draw = function (self, state, input_service, dt, t)
	if state == STATE.exited then
		return
	end

	local ui_renderer = self._ui_renderer

	UIRenderer.begin_pass(ui_renderer, self._ui_scenegraph, input_service, dt, nil, self._render_settings)

	if state == STATE.refresh then
		UIRenderer.draw_all_widgets(ui_renderer, self._loading_widgets)
	else
		UIRenderer.draw_all_widgets(ui_renderer, self._widgets)
		UIRenderer.draw_all_widgets(ui_renderer, self._day_widgets)
		UIRenderer.draw_all_widgets(ui_renderer, self._reward_widgets)

		if state == STATE.wait_for_backend or state == STATE.presenting then
			UIRenderer.draw_all_widgets(ui_renderer, self._overlay_widgets)
		end
	end

	UIRenderer.end_pass(ui_renderer)

	if self._gamepad_active then
		self._menu_input_description:draw(ui_renderer, dt)
	end
end

StoreLoginRewardsPopup.is_complete = function (self)
	return self._state == STATE.exited
end

StoreLoginRewardsPopup._play_sound = function (self, event)
	return self._parent:play_sound(event)
end

StoreLoginRewardsPopup.has_claimed_rewards = function (self)
	return self._has_claimed_rewards
end
