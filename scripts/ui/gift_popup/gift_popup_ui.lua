require("scripts/ui/reward_popup/reward_popup_ui")

local POLL_REWARDS_COOLDOWN = 1.5
local fake_input_service = {
	get = function ()
		return
	end,
	has = function ()
		return
	end
}
GiftPopupUI = class(GiftPopupUI)

GiftPopupUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	local ingame_ui_context = ingame_ui_context
	local ui_renderer = ingame_ui_context.ui_renderer
	local ui_top_renderer = ingame_ui_context.ui_top_renderer
	local input_manager = ingame_ui_context.input_manager
	local world_manager = ingame_ui_context.world_manager
	self._is_in_inn = ingame_ui_context.is_in_inn
	local level_world = world_manager:world("level_world")
	local wwise_world = Managers.world:wwise_world(level_world)
	local reward_params = {
		wwise_world = wwise_world,
		ui_renderer = ui_renderer,
		ui_top_renderer = ui_top_renderer,
		input_manager = input_manager
	}
	local reward_popup = RewardPopupUI:new(reward_params)
	self._reward_popup = reward_popup

	reward_popup:set_input_manager(input_manager)

	self._next_poll_time = 0
	self._presentation_queue = {}
	local event_manager = Managers.state.event

	event_manager:register(self, "level_start_local_player_spawned", "event_initialize_poll")
	rawset(_G, "gift_popup_ui", self)
end

GiftPopupUI.event_initialize_poll = function (self)
	self._poll_initialized = true
end

GiftPopupUI.update = function (self, dt, t)
	return
end

GiftPopupUI._block_all_input_services = function (self)
	local input_manager = Managers.input

	input_manager:block_device_except_service(nil, "gamepad", 1)
	input_manager:block_device_except_service(nil, "keyboard", 1)
	input_manager:block_device_except_service(nil, "mouse", 1)

	self._input_blocked = true
end

GiftPopupUI._unblock_all_input_services = function (self)
	local input_manager = Managers.input

	input_manager:device_unblock_all_services("gamepad", 1)
	input_manager:device_unblock_all_services("keyboard", 1)
	input_manager:device_unblock_all_services("mouse", 1)

	self._input_blocked = false
end

GiftPopupUI.post_update = function (self, dt, t)
	local reward_popup = self._reward_popup
	local presentation_queue = self._presentation_queue

	if self._poll_initialized and self._is_in_inn then
		local next_poll_time = self._next_poll_time

		if self._next_poll_time <= t then
			self._next_poll_time = t + POLL_REWARDS_COOLDOWN
			local reward_data = Managers.unlock:poll_rewards()

			if reward_data then
				local presentation_data = self:_generate_presentation_data(reward_data)
				presentation_queue[#presentation_queue + 1] = presentation_data
			end
		end

		if #presentation_queue > 0 and self:_can_present_reward() then
			self:_block_all_input_services()

			local presentation_data = table.remove(presentation_queue, 1)

			reward_popup:display_presentation(presentation_data)
		end

		reward_popup:update(dt)
	end

	if self._input_blocked and #presentation_queue == 0 and not reward_popup:is_presentation_active() then
		self:_unblock_all_input_services()
	end
end

GiftPopupUI._can_present_reward = function (self)
	if self._reward_popup:is_presentation_active() then
		return false
	end

	local popup_manager = Managers.popup

	if popup_manager and popup_manager:has_popup() then
		return false
	end

	if not Managers.transition:fade_out_completed() then
		return false
	end

	return true
end

GiftPopupUI._generate_presentation_data = function (self, reward_data)
	local rewarded_items = reward_data.items
	local presentation_text = reward_data.presentation_text
	local presentation_data = {}

	for _, item in ipairs(rewarded_items) do
		local item_data = item.data
		local item_display_name = item_data.display_name
		local item_type = item_data.item_type
		local entry = {
			[#entry + 1] = {
				widget_type = "description",
				value = {
					Localize(item_display_name),
					Localize(presentation_text)
				}
			},
			[#entry + 1] = {
				widget_type = "item",
				value = item
			}
		}
		presentation_data[#presentation_data + 1] = entry
	end

	return presentation_data
end

GiftPopupUI.active = function (self)
	return self._reward_popup:is_presentation_active()
end

GiftPopupUI.active_input_service = function (self)
	return fake_input_service
end

GiftPopupUI.destroy = function (self)
	self._reward_popup:destroy()

	self._reward_popup = nil
	self._presentation_queue = nil
end

return
