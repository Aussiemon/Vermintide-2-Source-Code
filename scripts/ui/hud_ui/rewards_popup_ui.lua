﻿-- chunkname: @scripts/ui/hud_ui/rewards_popup_ui.lua

RewardsPopupUI = class(RewardsPopupUI)

RewardsPopupUI.init = function (self, parent, in_game_ui_context)
	self._parent = parent
	self._ui_renderer = in_game_ui_context.ui_renderer
	self._ingame_ui = in_game_ui_context.ingame_ui
	self._input_manager = in_game_ui_context.input_manager
	self._world_manager = in_game_ui_context.world_manager
	self._wwise_world = in_game_ui_context.wwise_world
	self._ui_top_renderer = in_game_ui_context.ui_top_renderer
	self._reward_presentation_queue = {}
	self._reward_presentation_active = false

	local reward_params = {
		wwise_world = self._wwise_world,
		ui_renderer = self._ui_renderer,
		ui_top_renderer = self._ui_top_renderer,
		input_manager = self._input_manager,
	}

	self._reward_popup = RewardPopupUI:new(reward_params)

	Managers.state.event:register(self, "present_rewards", "present_rewards")
end

RewardsPopupUI.destroy = function (self)
	Managers.state.event:unregister("present_rewards", self)
end

RewardsPopupUI.update = function (self, dt, t)
	if self._reward_popup then
		self._reward_popup:update(dt)
		self:_handle_queued_presentations()
	end
end

RewardsPopupUI.present_rewards = function (self, rewards)
	local num_rewards = #rewards

	if num_rewards > 0 then
		local presentation_data = {}
		local backend_manager = Managers.backend
		local item_interface = backend_manager:get_interface("items")

		for _, data in ipairs(rewards) do
			local reward_type = data.type
			local sounds = data.sounds

			if reward_type == "item" or CosmeticUtils.is_cosmetic_item(reward_type) then
				local backend_id = data.backend_id
				local entry = {}
				local reward_item = item_interface:get_item_from_id(backend_id)
				local description = {}
				local _, display_name, _ = UIUtils.get_ui_information_from_item(reward_item)

				description[1] = Localize(display_name)
				description[2] = Localize("gift_popup_sub_title_halloween")
				entry[#entry + 1] = {
					widget_type = "description",
					value = description,
				}
				entry[#entry + 1] = {
					widget_type = "item",
					value = reward_item,
				}
				presentation_data[#presentation_data + 1] = entry
				presentation_data.sounds = sounds
			elseif reward_type == "item_tooltip" then
				local backend_id = data.backend_id
				local reward_item = item_interface:get_item_from_id(backend_id)
				local entry = {}

				entry[#entry + 1] = {
					widget_type = "item_tooltip",
					value = reward_item,
				}
				entry[#entry + 1] = {
					widget_type = "item",
					value = reward_item,
				}
				presentation_data[#presentation_data + 1] = entry
				presentation_data.sounds = sounds
			elseif reward_type == "deus_item_tooltip" then
				local backend_id = data.backend_id
				local reward_item = item_interface:get_item_from_id(backend_id)
				local entry = {}

				entry[#entry + 1] = {
					widget_type = "deus_item_tooltip",
					value = reward_item,
				}
				entry[#entry + 1] = {
					widget_type = "deus_item",
					value = reward_item,
				}

				local animation_data = {
					end_animation = "deus_close",
					start_animation = "deus_open",
				}

				presentation_data[#presentation_data + 1] = entry
				presentation_data.animation_data = animation_data
				presentation_data.keep_input = true
				presentation_data.skip_blur = true
				presentation_data.sounds = sounds
			elseif reward_type == "deus_power_up" then
				local deus_power_up = data.power_up
				local entry = {}

				entry[#entry + 1] = {
					widget_type = "deus_power_up",
					value = deus_power_up,
				}
				entry[#entry + 1] = {
					widget_type = "deus_icon",
					value = deus_power_up,
				}

				local animation_data = {
					end_animation = "deus_close",
					start_animation = "deus_open",
				}

				presentation_data[#presentation_data + 1] = entry
				presentation_data.animation_data = animation_data
				presentation_data.keep_input = true
				presentation_data.skip_blur = true
				presentation_data.sounds = sounds
			elseif reward_type == "deus_power_up_end_of_level" then
				local deus_power_up = data.power_up
				local entry = {}

				entry[#entry + 1] = {
					widget_type = "deus_power_up",
					value = deus_power_up,
				}
				entry[#entry + 1] = {
					widget_type = "deus_icon",
					value = deus_power_up,
				}

				local animation_data = {
					animation_wait_time = 6,
					end_animation = "deus_close",
					start_animation = "deus_open",
				}

				presentation_data[#presentation_data + 1] = entry
				presentation_data.animation_data = animation_data
				presentation_data.keep_input = true
				presentation_data.skip_blur = true
				presentation_data.sounds = sounds
			elseif reward_type == "keep_decoration_painting" then
				local keep_decoration_name = data.keep_decoration_name
				local painting_data = Paintings[keep_decoration_name]
				local display_name = painting_data.display_name
				local icon = painting_data.icon
				local description = {}
				local entry = {}

				description[1] = Localize(display_name)
				description[2] = Localize("gift_popup_sub_title_halloween")
				entry[#entry + 1] = {
					widget_type = "description",
					value = description,
				}
				entry[#entry + 1] = {
					widget_type = "icon",
					value = icon,
				}
				presentation_data[#presentation_data + 1] = entry
				presentation_data.sounds = sounds
			elseif reward_type == "weapon_skin" then
				local weapon_skin_name = data.weapon_skin_name
				local weapon_skin_data = WeaponSkins.skins[weapon_skin_name]
				local display_name = weapon_skin_data.display_name
				local icon = weapon_skin_data.inventory_icon
				local description = {}
				local entry = {}

				description[1] = Localize(display_name)
				description[2] = Localize("gift_popup_sub_title_halloween")
				entry[#entry + 1] = {
					widget_type = "description",
					value = description,
				}
				entry[#entry + 1] = {
					widget_type = "icon",
					value = icon,
				}
				presentation_data[#presentation_data + 1] = entry
				presentation_data.sounds = sounds
			end
		end

		self:_present_reward(presentation_data)
	end
end

RewardsPopupUI._displaying_reward_presentation = function (self)
	return self._reward_popup:is_presentation_active()
end

RewardsPopupUI._is_reward_presentation_complete = function (self)
	return self._reward_popup:is_presentation_complete()
end

RewardsPopupUI.all_presentations_done = function (self)
	local reward_presentation_complete = not self:_displaying_reward_presentation()
	local reward_queue_length = #self._reward_presentation_queue

	return reward_presentation_complete and reward_queue_length == 0
end

RewardsPopupUI._handle_queued_presentations = function (self)
	if self:_is_reward_presentation_complete() or #self._reward_presentation_queue == 0 and not self:_displaying_reward_presentation() then
		local reward_presentation_queue = self._reward_presentation_queue
		local num_queued_rewards = #reward_presentation_queue

		if num_queued_rewards > 0 then
			local next_reward = table.remove(reward_presentation_queue, 1)

			self:_present_reward(next_reward)
		elseif self._reward_presentation_active then
			self._reward_presentation_active = false
		end
	end
end

RewardsPopupUI._play_sounds = function (self, sounds)
	if not sounds then
		return
	end

	for i = 1, #sounds do
		local event_name = sounds[i]

		Managers.music:trigger_event(event_name)
	end
end

RewardsPopupUI._present_reward = function (self, data)
	local reward_popup = self._reward_popup

	if self:_displaying_reward_presentation() then
		local reward_presentation_queue = self._reward_presentation_queue

		reward_presentation_queue[#reward_presentation_queue + 1] = data
	else
		self:_play_sounds(data.sounds)
		reward_popup:display_presentation(data)

		self._reward_presentation_active = true
	end
end
