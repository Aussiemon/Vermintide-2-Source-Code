-- chunkname: @scripts/ui/views/level_end/level_end_view_base.lua

require("scripts/ui/reward_popup/reward_popup_ui")
DLCUtils.require_list("end_view_state")

local definitions = local_require("scripts/ui/views/level_end/level_end_view_base_definitions")
local extra_portrait_materials = {}

for _, dlc in pairs(DLCSettings) do
	local portrait_materials = dlc.portrait_materials

	if portrait_materials then
		for _, path in ipairs(portrait_materials) do
			extra_portrait_materials[#extra_portrait_materials + 1] = path
		end
	end
end

local SPEED_UP_MULT_MAX = 3
local SPEED_UP_LERP_SPEED = 4

LevelEndViewBase = class(LevelEndViewBase)

LevelEndViewBase.init = function (self, context)
	self:setup_world(context)
	self:setup_transition_data()

	local game_won = context.game_won
	local rewards = context.rewards

	self.context = context
	self.game_won = game_won
	self.challenge_progression_status = context.challenge_progression_status
	self.game_mode_key = context.game_mode_key
	self.player_manager = context.player_manager
	self.input_manager = context.input_manager
	self.ingame_ui = context.ingame_ui
	self.profile_synchronizer = context.profile_synchronizer
	self.peer_id = context.peer_id
	self.local_player_id = context.local_player_id
	self.rewards = rewards
	self.render_settings = {
		alpha_multiplier = 0,
		snap_pixel_positions = true,
	}
	self._lobby = context.lobby
	self.is_server = context.is_server
	self._state_speed_mult = 1
	self._state_machine_complete = false
	self._skip_pressed = false

	if not self.is_server then
		local statistics_db = Managers.player:statistics_db()

		self.context.players_session_score = self._players_session_score or Managers.mechanism:get_players_session_score(statistics_db, self.profile_synchronizer)
		self._players_session_score = self.context.players_session_score
	end

	local is_untrusted = script_data["eac-untrusted"]

	self._is_untrusted = is_untrusted

	if not is_untrusted then
		self.level_up_rewards = self:_get_level_up_rewards()
		self.deed_rewards = self:_get_deed_rewards()
		self.deus_rewards = self:_get_deus_rewards()
		self.keep_decoration_rewards = self:_get_keep_decoration_rewards()
		self.event_rewards = self:_get_event_rewards()
		self.win_track_rewards = self:_get_win_track_rewards()
		self.versus_level_up_rewards = self:_get_versus_level_up_rewards()
	end

	self._reward_presentation_queue = {}
	self.reward_popup = RewardPopupUI:new(context)

	local index_by_state_name = self:setup_pages(game_won, rewards)
	local state_name_by_index = {}

	for state_name, index in pairs(index_by_state_name) do
		state_name_by_index[index] = state_name
	end

	self._index_by_state_name = index_by_state_name
	self._state_name_by_index = state_name_by_index
	self._state_machine_params = {
		parent = self,
		context = context,
		game_won = game_won,
		game_mode_key = self.game_mode_key,
	}

	self:setup_camera()
	self:create_ui_elements()

	self._done_peers = {}
	self._wants_reload = {}
	self.waiting_to_start = true
	self._wants_to_exit_to_game = nil
	self._started_exit = nil

	if self._lobby == nil then
		self:left_lobby()
	end
end

LevelEndViewBase.state_machine_completed = function (self)
	return self._state_machine_complete
end

LevelEndViewBase.setup_transition_data = function (self)
	self._transition_animations = {}
	self._transition_render_settings = {
		alpha_multiplier = 0,
		snap_pixel_positions = true,
	}
	self._transition_scenegraph_ui = UISceneGraph.init_scenegraph(definitions.transition_scenegraph_definition)
	self._transition_widgets, self._transition_widgets_by_name = UIUtils.create_widgets(definitions.transition_widget_definition)

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self._transition_ui_animator = UIAnimator:new(self._transition_scenegraph_ui, definitions.transition_animations)
end

LevelEndViewBase.trigger_transition = function (self, transition_data)
	self:_cleanup_transitions()

	local params = {
		parent = self,
		render_settings = self._transition_render_settings,
		transition_data = transition_data,
	}
	local widgets = self._transition_widgets
	local animation_name = transition_data.animation_name or "default"

	self._transition_animations[#self._transition_animations + 1] = self._transition_ui_animator:start_animation(animation_name, widgets, definitions.transition_scenegraph_definition, params)
end

LevelEndViewBase.transition_camera = function (self, transition_data)
	if not transition_data.camera_name then
		return
	end

	local camera_pose
	local level_name = transition_data.level_name or "levels/end_screen/world"
	local unit_indices = LevelResource.unit_indices(level_name, "units/hub_elements/cutscene_camera/cutscene_camera")

	for _, index in pairs(unit_indices) do
		local unit_data = LevelResource.unit_data(level_name, index)
		local name = DynamicData.get(unit_data, "name")

		if name and name == transition_data.camera_name then
			local position = LevelResource.unit_position(level_name, index)
			local rotation = LevelResource.unit_rotation(level_name, index)
			local pose = Matrix4x4.from_quaternion_position(rotation, position)

			camera_pose = Matrix4x4Box(pose)

			print("Found camera: " .. name)
		end
	end

	self._camera_pose = camera_pose

	self:position_camera()
end

LevelEndViewBase._cleanup_transitions = function (self)
	for _, anim_id in pairs(self._transition_animations) do
		self._transition_ui_animator:stop_animation(anim_id)
	end

	table.clear(self._transition_animations)
end

LevelEndViewBase._update_transition_fade = function (self, dt, t)
	if table.is_empty(self._transition_animations) then
		return
	end

	self:_update_transition_animations(dt, t)
	self:_draw_transition_widgets(dt, t)
end

LevelEndViewBase._draw_transition_widgets = function (self, dt, t)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self._transition_scenegraph_ui
	local input_manager = self.input_manager
	local render_settings = self._transition_render_settings
	local input_service = self:input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._transition_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

LevelEndViewBase._update_transition_animations = function (self, dt, t)
	local ui_animator = self._transition_ui_animator

	ui_animator:update(dt)

	local num_anims = #self._transition_animations

	for i = num_anims, 1, -1 do
		local anim_id = self._transition_animations[i]

		if ui_animator:is_animation_completed(anim_id) then
			self._transition_animations[i] = nil
		end
	end
end

LevelEndViewBase.enable_chat = function (self)
	return true
end

LevelEndViewBase.start = function (self)
	self:_activate_viewport()

	self.waiting_to_start = nil
	self.state_auto_change = true

	self:_proceed_to_next_auto_state(1, #self._state_name_by_index)
end

LevelEndViewBase.on_enter = function (self)
	self._state_speed_mult = 1
end

LevelEndViewBase.on_exit = function (self)
	if not self._is_untrusted then
		local difficulty_key = Managers.state.difficulty:get_difficulty()
		local chest_settings = LootChestData.chests_by_category[difficulty_key]
		local chests_package_name = chest_settings.package_name

		Managers.package:unload(chests_package_name, "global")
	end
end

LevelEndViewBase._vote_to_leave_game = function (self)
	local voting_manager = Managers.state.voting

	voting_manager:vote(1)

	self._voted = true
end

LevelEndViewBase.exit_to_game = function (self)
	self._exit_timer = 2
	self._started_exit = true
end

LevelEndViewBase.done = function (self)
	return self._wants_to_exit_to_game
end

LevelEndViewBase.setup_pages = function (self, game_won, rewards)
	local index_by_state_name = {}

	return index_by_state_name
end

LevelEndViewBase.create_ui_elements = function (self)
	return
end

LevelEndViewBase._activate_viewport = function (self)
	local world, viewport = self:get_viewport_world()

	ScriptWorld.activate_viewport(world, viewport)
end

LevelEndViewBase.get_world_link_unit = function (self)
	local level_name = "levels/end_screen/world"
	local world = self:get_viewport_world()
	local level = ScriptWorld.level(world, level_name)

	if level then
		local units = Level.units(level)

		for i, level_unit in ipairs(units) do
			local unit_name = Unit.get_data(level_unit, "name")

			if unit_name and unit_name == "loot_chest_spawn" then
				return level_unit
			end
		end
	end
end

LevelEndViewBase.get_viewport_world = function (self)
	return self._world, self._world_viewport
end

LevelEndViewBase.post_update = function (self)
	return
end

LevelEndViewBase.update = function (self, dt, t)
	if self.suspended or self.waiting_for_post_update_enter then
		return
	end

	local active_camera_shakes = self._active_camera_shakes

	if active_camera_shakes then
		for settings, _ in pairs(active_camera_shakes) do
			self:_apply_shake_event(settings, t)
		end
	end

	local input_service = self:input_service()

	if self._started_force_shutdown then
		self:update_force_shutdown(dt)
	end

	if self._started_exit then
		self:_update_exit(dt)
	end

	if self.reward_popup then
		self.reward_popup:update(dt)
	end

	self:_handle_queued_presentations()
	self:_update_transition_fade(dt, t)

	if self._machine then
		if self._state_can_speed_up then
			local speed_up_target = 1
			local input_service = self.input_manager:get_service("end_of_level")

			self._skip_pressed = input_service:get("skip_pressed") or input_service:get("confirm_press")

			if input_service:get("confirm_hold", true) or input_service:get("skip", true) then
				speed_up_target = SPEED_UP_MULT_MAX
			end

			local current_speed_mult = self._state_speed_mult

			current_speed_mult = math.lerp(current_speed_mult, speed_up_target, SPEED_UP_LERP_SPEED * dt)
			current_speed_mult = math.clamp(current_speed_mult, 1, SPEED_UP_MULT_MAX)
			dt = dt * current_speed_mult
			self._state_speed_mult = current_speed_mult
		end

		self._machine:update(dt, t)

		if self._new_state_name then
			self:_handle_state_exit()
		elseif self.state_auto_change then
			self:_handle_state_auto_change()
		elseif self._page_selector_widget then
			local index = self:_is_page_selector_pressed()

			if index then
				local state_name = self._state_name_by_index[index]

				self:_request_state_change(state_name)
			end
		end
	end
end

LevelEndViewBase.skip_pressed = function (self)
	return self._skip_pressed
end

LevelEndViewBase.transitioning = function (self)
	return self.exiting
end

LevelEndViewBase.left_lobby = function (self)
	self._left_lobby = true
	self._lobby = nil

	if self._done_peers[Network.peer_id()] then
		self:exit_to_game()
	end
end

LevelEndViewBase.destroy = function (self, keep_resources)
	self.ui_animator = nil

	self:_cleanup_transitions()

	if self._machine then
		self._machine:destroy()

		self._machine = nil
	end

	if self.reward_popup then
		self.reward_popup:destroy()

		self.reward_popup = nil
	end

	self:_pop_mouse_cursor()
	self:play_sound("play_gui_chestroom_stop")
	self:play_sound("unmute_all_world_sounds")
	self:destroy_world()

	if not keep_resources then
		Managers.mechanism:unload_end_screen_resources()
	end
end

LevelEndViewBase.play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)
end

LevelEndViewBase._is_button_pressed = function (self, widget)
	local button_hotspot = widget.content.button_hotspot

	if button_hotspot.on_release then
		button_hotspot.on_release = nil

		return true
	end
end

LevelEndViewBase._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

LevelEndViewBase._is_page_selector_pressed = function (self)
	local widget = self._page_selector_widget
	local content = widget.content
	local amount = content.amount

	for i = 1, amount do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot = content[hotspot_name]

		if hotspot.on_release and not hotspot.is_selected then
			return i
		end
	end
end

LevelEndViewBase._set_page_selector_selection = function (self, index)
	local widget = self._page_selector_widget
	local content = widget.content
	local amount = content.amount

	for i = 1, amount do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot = content[hotspot_name]

		hotspot.is_selected = index == i
	end
end

LevelEndViewBase._update_exit = function (self, dt)
	self._exit_timer = math.max(0, self._exit_timer - dt)

	if self._exit_timer == 0 then
		self._started_exit = false
		self._wants_to_exit_to_game = true
	end
end

LevelEndViewBase.do_retry = function (self)
	return false
end

LevelEndViewBase._get_level_up_rewards = function (self)
	local end_of_level_rewards = self.context.rewards.end_of_level_rewards
	local items_by_level = {}

	for reward_name, item in pairs(end_of_level_rewards) do
		if string.find(reward_name, "level_up_reward") == 1 then
			local data = string.split_deprecated(reward_name, ";")
			local level = tonumber(data[2])
			local index = tonumber(data[3])

			if not items_by_level[level] then
				items_by_level[level] = {}
			end

			items_by_level[level][index] = item
		end
	end

	return items_by_level
end

LevelEndViewBase._get_versus_level_up_rewards = function (self)
	local end_of_level_rewards = self.context.rewards.end_of_level_rewards
	local items_by_level = {}

	for reward_name, item in pairs(end_of_level_rewards) do
		if string.find(reward_name, "vs_level_up_reward") == 1 then
			local data = string.split_deprecated(reward_name, ";")
			local level = tonumber(data[2])
			local index = tonumber(data[3])

			if not items_by_level[level] then
				items_by_level[level] = {}
			end

			items_by_level[level][index] = item
		end
	end

	return items_by_level
end

LevelEndViewBase._get_win_track_rewards = function (self)
	local end_of_level_rewards = self.context.rewards.end_of_level_rewards
	local win_track_rewards = {
		start_experience = self.context.rewards.win_track_start_experience,
		item_rewards = {},
	}

	for reward_name, item in pairs(end_of_level_rewards) do
		if string.find(reward_name, "win_track_reward") == 1 then
			local data = string.split_deprecated(reward_name, ";")
			local level = tonumber(data[2])

			win_track_rewards.item_rewards[level] = item
		end
	end

	return win_track_rewards
end

LevelEndViewBase._get_deed_rewards = function (self)
	local end_of_level_rewards = self.context.rewards.end_of_level_rewards
	local deed_rewards = {}

	for reward_name, item in pairs(end_of_level_rewards) do
		if string.find(reward_name, "deed_reward") == 1 then
			deed_rewards[#deed_rewards + 1] = item
		end
	end

	return deed_rewards
end

LevelEndViewBase._get_event_rewards = function (self)
	local end_of_level_rewards = self.context.rewards.end_of_level_rewards
	local event_rewards = {}

	for reward_name, item in pairs(end_of_level_rewards) do
		if string.find(reward_name, "event_reward") then
			event_rewards[#event_rewards + 1] = item
		end
	end

	return event_rewards
end

LevelEndViewBase._get_deus_rewards = function (self)
	local end_of_level_rewards = self.context.rewards.end_of_level_rewards
	local deus_rewards = {}

	for reward_name, item in pairs(end_of_level_rewards) do
		if string.find(reward_name, "deus_reward") == 1 then
			deus_rewards[#deus_rewards + 1] = item
		end
	end

	return deus_rewards
end

LevelEndViewBase._get_keep_decoration_rewards = function (self)
	local end_of_level_rewards = self.context.rewards.end_of_level_rewards
	local keep_decoration_rewards = {}

	for reward_name, item in pairs(end_of_level_rewards) do
		if string.find(reward_name, "keep_decoration_painting") == 1 then
			keep_decoration_rewards[#keep_decoration_rewards + 1] = item
		end
	end

	return keep_decoration_rewards
end

LevelEndViewBase._present_reward = function (self, data)
	local reward_popup = self.reward_popup

	if self:displaying_reward_presentation() then
		local reward_presentation_queue = self._reward_presentation_queue

		reward_presentation_queue[#reward_presentation_queue + 1] = data
	else
		reward_popup:display_presentation(data)
	end
end

LevelEndViewBase._handle_queued_presentations = function (self)
	if self:_is_reward_presentation_complete() or #self._reward_presentation_queue == 0 and not self:displaying_reward_presentation() then
		local reward_presentation_queue = self._reward_presentation_queue
		local num_queued_rewards = #reward_presentation_queue

		if num_queued_rewards > 0 then
			local next_reward = table.remove(reward_presentation_queue, 1)

			self:_present_reward(next_reward)
		else
			self._reward_presentation_done = true
		end
	end
end

LevelEndViewBase.displaying_reward_presentation = function (self)
	return self.reward_popup:is_presentation_active()
end

LevelEndViewBase._is_reward_presentation_complete = function (self)
	return self.reward_popup:is_presentation_complete()
end

LevelEndViewBase.reward_presentation_done = function (self)
	return self._reward_presentation_done
end

LevelEndViewBase.present_level_up = function (self, hero_name, hero_level)
	local level_unlocks = ProgressionUnlocks.get_level_unlocks(hero_level, hero_name)
	local level_up_rewards = self.level_up_rewards[hero_level]
	local has_level_up_unlocks = level_unlocks and #level_unlocks > 0
	local has_level_up_rewards = level_up_rewards and #level_up_rewards > 0
	local presentation_data

	if has_level_up_rewards or has_level_up_unlocks then
		presentation_data = {}
	end

	if has_level_up_unlocks then
		for index, template in ipairs(level_unlocks) do
			local entry = {}
			local title = template.title
			local description = template.description

			if title and description then
				entry[#entry + 1] = {
					widget_type = "description",
					value = {
						Localize(title),
						Localize(description),
					},
				}
			elseif title then
				entry[#entry + 1] = {
					widget_type = "title",
					value = Localize(title),
				}
			elseif description then
				entry[#entry + 1] = {
					widget_type = "title",
					value = Localize(description),
				}
			end

			entry[#entry + 1] = {
				value = template.value,
				widget_type = template.unlock_type,
			}
			presentation_data[#presentation_data + 1] = entry
		end
	end

	if has_level_up_rewards then
		local item_interface = Managers.backend:get_interface("items")

		for index, item in ipairs(level_up_rewards) do
			local entry = {}
			local backend_id = item.backend_id
			local reward_item = item_interface:get_item_from_id(backend_id)
			local item_data = item_interface:get_item_masterlist_data(backend_id)
			local item_type = item_data.item_type
			local description = {}
			local _, display_name, _ = UIUtils.get_ui_information_from_item(reward_item)

			if item_type == "loot_chest" then
				description[1] = Localize(display_name)
				description[2] = Localize("end_screen_chest_received")
			else
				description[1] = Localize(item_type)
				description[2] = Localize("reward_weapon")
			end

			if description then
				entry[#entry + 1] = {
					widget_type = "description",
					value = description,
				}
			end

			entry[#entry + 1] = {
				widget_type = "item",
				value = item,
			}
			presentation_data[#presentation_data + 1] = entry
		end
	end

	if presentation_data then
		self:_present_reward(presentation_data)
	end
end

LevelEndViewBase.present_win_track_reward = function (self, idx)
	local item_interface = Managers.backend:get_interface("items")
	local win_track_rewards = self.win_track_rewards
	local item_rewards = win_track_rewards.item_rewards
	local win_track_reward_item = item_rewards[idx]
	local presentation_data = {}
	local entry = {}
	local backend_id = win_track_reward_item.backend_id
	local reward_item = item_interface:get_item_from_id(backend_id)
	local item_data = item_interface:get_item_masterlist_data(backend_id)
	local item_type = item_data.item_type
	local description = {}
	local _, display_name, _ = UIUtils.get_ui_information_from_item(reward_item)

	description[1] = Localize(item_type)
	description[2] = Localize(display_name)

	if description then
		entry[#entry + 1] = {
			widget_type = "description",
			value = description,
		}
	end

	entry[#entry + 1] = {
		widget_type = "item",
		value = win_track_reward_item,
	}
	presentation_data[#presentation_data + 1] = entry

	self:_present_reward(presentation_data)
end

LevelEndViewBase.present_additional_rewards = function (self)
	local deed_rewards = self.deed_rewards
	local num_deed_rewards = #deed_rewards
	local item_interface = Managers.backend:get_interface("items")

	if num_deed_rewards > 0 then
		local presentation_data = {
			{
				{
					widget_type = "title",
					value = Localize("deed_completed_title"),
				},
			},
		}

		for _, item in ipairs(deed_rewards) do
			local entry = {}
			local backend_id = item.backend_id
			local reward_item = item_interface:get_item_from_id(backend_id)
			local item_data = item_interface:get_item_masterlist_data(backend_id)
			local item_type = item_data.item_type
			local description = {}
			local _, display_name, _ = UIUtils.get_ui_information_from_item(reward_item)

			if item_type == "loot_chest" then
				description[1] = Localize(display_name)
				description[2] = Localize("end_screen_chest_received")
			else
				description[1] = Localize(item_type)
				description[2] = Localize("reward_weapon")
			end

			if description then
				entry[#entry + 1] = {
					widget_type = "description",
					value = description,
				}
			end

			entry[#entry + 1] = {
				widget_type = "item",
				value = item,
			}
			presentation_data[#presentation_data + 1] = entry
		end

		self:_present_reward(presentation_data)
	end

	local keep_decoration_rewards = self.keep_decoration_rewards
	local num_keep_decoration_rewards = #keep_decoration_rewards

	if num_keep_decoration_rewards > 0 then
		local presentation_data = {}

		for _, item in ipairs(keep_decoration_rewards) do
			local keep_decoration_name = item.keep_decoration_name
			local painting_data = Paintings[keep_decoration_name]
			local display_name = painting_data.display_name
			local icon = painting_data.icon
			local description = {
				Localize(display_name),
				Localize("end_screen_you_received"),
			}
			local entry = {
				{
					widget_type = "description",
					value = description,
				},
				{
					widget_type = "icon",
					value = icon,
				},
			}

			presentation_data[#presentation_data + 1] = entry
		end

		self:_present_reward(presentation_data)
	end

	local event_rewards = self.event_rewards
	local num_event_rewards = #event_rewards

	if num_event_rewards > 0 then
		local presentation_data = {}

		for _, item in ipairs(event_rewards) do
			local entry = {}
			local backend_id = item.backend_id
			local reward_item = item_interface:get_item_from_id(backend_id)
			local description = {}
			local _, display_name, _ = UIUtils.get_ui_information_from_item(reward_item)

			description[1] = Localize(display_name)
			description[2] = Localize("end_screen_you_received")

			if description then
				entry[#entry + 1] = {
					widget_type = "description",
					value = description,
				}
			end

			entry[#entry + 1] = {
				widget_type = "item",
				value = item,
			}
			presentation_data[#presentation_data + 1] = entry
		end

		self:_present_reward(presentation_data)
	end

	local deus_rewards = self.deus_rewards
	local num_deus_rewards = #deus_rewards

	if num_deus_rewards > 0 then
		local presentation_data = {
			{
				{
					widget_type = "title",
					value = Localize("deus_expedition_completed_title"),
				},
			},
		}

		for _, item in ipairs(deus_rewards) do
			local entry = {}
			local backend_id = item.backend_id
			local reward_item = item_interface:get_item_from_id(backend_id)
			local description = {}
			local _, display_name, _ = UIUtils.get_ui_information_from_item(reward_item)

			description[1] = Localize(display_name)
			description[2] = Localize("end_screen_you_received")

			if description then
				entry[#entry + 1] = {
					widget_type = "description",
					value = description,
				}
			end

			entry[#entry + 1] = {
				widget_type = "item",
				value = item,
			}
			presentation_data[#presentation_data + 1] = entry
		end

		self:_present_reward(presentation_data)
	end
end

LevelEndViewBase.present_chest_rewards = function (self)
	local end_of_level_rewards = self.context.rewards.end_of_level_rewards
	local item_interface = Managers.backend:get_interface("items")
	local chest = end_of_level_rewards.chest

	if chest then
		local backend_id = chest.backend_id
		local reward_item = item_interface:get_item_from_id(backend_id)
		local item_data = item_interface:get_item_masterlist_data(backend_id)
		local _, display_name, _ = UIUtils.get_ui_information_from_item(reward_item)
		local item_name = item_data.name
		local presentation_data = {
			{
				{
					widget_type = "description",
					value = {
						Localize(display_name),
						Localize("end_screen_chest_received"),
					},
				},
				{
					widget_type = "loot_chest",
					value = item_name,
				},
			},
		}

		self:_present_reward(presentation_data)
	end
end

LevelEndViewBase.wanted_menu_state = function (self)
	return self._wanted_menu_state
end

LevelEndViewBase.clear_wanted_menu_state = function (self)
	self._wanted_menu_state = nil
end

LevelEndViewBase._request_state_change = function (self, state_name)
	local state_machine = self._machine

	if not state_machine then
		return
	end

	local current_state = state_machine:state()
	local current_state_name = current_state.NAME
	local direction
	local new_state_index = self._index_by_state_name[state_name]
	local current_state_index = self._index_by_state_name[current_state_name]

	direction = current_state_index < new_state_index and "left" or "right"

	current_state:exit(direction)

	self._new_state_name = state_name
end

LevelEndViewBase._handle_state_exit = function (self)
	local state_machine = self._machine

	if not state_machine then
		return
	end

	local current_state = state_machine:state()

	if current_state:exit_done() then
		self:_setup_state_machine(self._new_state_name)

		self._new_state_name = nil
		self._state_speed_mult = 1
	end
end

LevelEndViewBase._setup_state_machine = function (self, optional_start_state_name, initial)
	if self._machine then
		self._machine:destroy()

		self._machine = nil
	end

	local state_name = optional_start_state_name or "EndViewStateSummary"
	local state_index = self._index_by_state_name[state_name]
	local start_state = rawget(_G, state_name)
	local profiling_debugging_enabled = false
	local state_machine_params = self._state_machine_params

	state_machine_params.initial_state = initial
	self._state_can_speed_up = start_state.CAN_SPEED_UP

	local direction

	if not initial then
		local previous_state_name = self._current_state_name
		local previous_state_index = self._index_by_state_name[previous_state_name]

		direction = previous_state_index < state_index and "left" or "right"
	end

	state_machine_params.direction = direction
	self._current_state_name = state_name
	self._machine = StateMachine:new(self, start_state, state_machine_params, profiling_debugging_enabled)

	self:_show_object_set(state_name)
end

LevelEndViewBase._handle_state_auto_change = function (self)
	local state_machine = self._machine

	if not state_machine then
		return
	end

	local current_state = state_machine:state()
	local state_name = current_state.NAME
	local state_name_by_index = self._state_name_by_index
	local index_by_state_name = self._index_by_state_name
	local current_state_index = index_by_state_name[state_name]
	local num_states = #state_name_by_index

	if self._next_auto_state_index then
		if current_state:exit_done() then
			if num_states < self._next_auto_state_index then
				if not self._started_exit then
					self:exit_to_game()
				end
			else
				self:_proceed_to_next_auto_state(self._next_auto_state_index, num_states)
			end
		end
	else
		local new_state_index
		local displaying_reward_presentation = self:displaying_reward_presentation()

		if not displaying_reward_presentation then
			if current_state:done() then
				new_state_index = current_state_index + 1
			end

			if new_state_index then
				current_state:exit()

				self._next_auto_state_index = new_state_index
			end
		end
	end
end

LevelEndViewBase._proceed_to_next_auto_state = function (self, index, num_states)
	local new_state = self._state_name_by_index[index]

	self:_setup_state_machine(new_state, true)

	if index == num_states then
		self:_push_mouse_cursor()

		self._state_machine_complete = true
	end

	self._next_auto_state_index = nil
end

LevelEndViewBase.rpc_signal_end_of_level_done = function (self, channel_id, peer_id, do_reload)
	if self.is_server then
		local lobby = self._lobby
		local members = lobby:members():get_members()
		local my_peer_id = Network.peer_id()

		for i, member_peer_id in ipairs(members) do
			if member_peer_id ~= peer_id and member_peer_id ~= my_peer_id then
				local channel_id = PEER_ID_TO_CHANNEL[member_peer_id]

				if channel_id then
					RPC.rpc_signal_end_of_level_done(channel_id, peer_id, do_reload)
				end
			end
		end
	end

	self:peer_signaled_done(peer_id, do_reload)
end

LevelEndViewBase.signal_done = function (self, do_reload)
	if self._signaled_done then
		return
	end

	if not self._left_lobby then
		if self.is_server then
			local lobby = self._lobby
			local lobby_members = lobby:members()

			if lobby_members then
				local members = lobby_members:get_members()
				local own_peer_id = Network.peer_id()

				for i, peer_id in ipairs(members) do
					if peer_id ~= own_peer_id then
						local channel_id = PEER_ID_TO_CHANNEL[peer_id]

						if channel_id then
							RPC.rpc_signal_end_of_level_done(channel_id, own_peer_id, do_reload)
						end
					end
				end
			end
		else
			local lobby = self._lobby
			local host = lobby:lobby_host()
			local my_peer_id = Network.peer_id()
			local channel_id = PEER_ID_TO_CHANNEL[host]

			if channel_id then
				RPC.rpc_signal_end_of_level_done(channel_id, my_peer_id, do_reload)
			end
		end
	end

	self:peer_signaled_done(Network.peer_id(), do_reload)
end

LevelEndViewBase.peer_signaled_done = function (self, peer_id, do_reload)
	if not self._started_force_shutdown then
		self:start_force_shutdown()
	end

	self._done_peers[peer_id] = true
	self._wants_reload[peer_id] = do_reload
end

LevelEndViewBase.rpc_notify_lobby_joined = function (self, channel_id)
	if self.is_server then
		local do_reload = false
		local lobby = self._lobby
		local members = lobby:members():get_members()
		local my_peer_id = Network.peer_id()
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		for i, member_peer_id in ipairs(members) do
			if member_peer_id ~= peer_id and member_peer_id ~= my_peer_id then
				local channel_id = PEER_ID_TO_CHANNEL[member_peer_id]

				RPC.rpc_signal_end_of_level_done(channel_id, peer_id, do_reload)
			end
		end

		self:peer_signaled_done(peer_id, do_reload)
	end
end

LevelEndViewBase.start_force_shutdown = function (self)
	self._started_force_shutdown = true
	self._force_shutdown_timer = 45
	self._force_shutdown_timer_start = self._force_shutdown_timer
end

LevelEndViewBase.get_force_shutdown_time = function (self)
	return self._force_shutdown_timer, self._force_shutdown_timer_start
end

LevelEndViewBase.is_force_shutdown_active = function (self)
	return self._started_force_shutdown
end

LevelEndViewBase.update_force_shutdown = function (self, dt)
	self._force_shutdown_timer = math.max(0, self._force_shutdown_timer - dt)

	if self._force_shutdown_timer == 0 and not self._signaled_done then
		self:signal_done(false)

		self._signaled_done = true
	elseif not self._left_lobby then
		local all_done = true
		local lobby_members = self._lobby:members()

		if lobby_members then
			local members = self._lobby:members():get_members()

			for i, peer_id in ipairs(members) do
				if not self._done_peers[peer_id] then
					all_done = false

					break
				end
			end
		end

		if all_done then
			self:exit_to_game()
		end
	end

	if self._started_exit then
		self._started_force_shutdown = false
	end
end

local cam_shake_settings = {
	amplitude = 0.9,
	duration = 0.5,
	fade_in = 0.1,
	fade_out = 0.5,
	octaves = 7,
	persistance = 1,
	seed = 0,
}

LevelEndViewBase.setup_camera = function (self)
	local camera_pose, camera_index
	local level_name = "levels/end_screen/world"
	local unit_indices = LevelResource.unit_indices(level_name, "units/hub_elements/cutscene_camera/cutscene_camera")

	for _, index in pairs(unit_indices) do
		local unit_data = LevelResource.unit_data(level_name, index)
		local name = DynamicData.get(unit_data, "name")

		if name and name == "end_screen_camera" then
			local position = LevelResource.unit_position(level_name, index)
			local rotation = LevelResource.unit_rotation(level_name, index)
			local pose = Matrix4x4.from_quaternion_position(rotation, position)

			camera_pose = Matrix4x4Box(pose)
			camera_index = index

			print("Found camera: " .. name)

			break
		end
	end

	self._camera_pose = camera_pose
	self._camera_index = camera_index

	self:position_camera()
end

LevelEndViewBase.add_camera_shake = function (self, settings, start_time, scale)
	local data = {}
	local current_rot = self:get_camera_rotation()
	local settings = settings or cam_shake_settings
	local duration = settings.duration
	local fade_in = settings.fade_in
	local fade_out = settings.fade_out

	duration = (duration or 0) + (fade_in or 0) + (fade_out or 0)
	data.shake_settings = settings
	data.start_time = start_time
	data.end_time = duration and start_time + duration
	data.fade_in_time = fade_in and start_time + fade_in
	data.fade_out_time = fade_out and data.end_time - fade_out
	data.seed = settings.seed or Math.random(1, 100)
	data.scale = scale or 1
	data.camera_rotation_boxed = QuaternionBox(current_rot)
	self._active_camera_shakes = {
		[data] = true,
	}
end

LevelEndViewBase._apply_shake_event = function (self, settings, t)
	local active_camera_shakes = self._active_camera_shakes
	local start_time = settings.start_time
	local end_time = settings.end_time
	local fade_in_time = settings.fade_in_time
	local fade_out_time = settings.fade_out_time

	if fade_in_time and t <= fade_in_time then
		settings.fade_progress = math.clamp((t - start_time) / (fade_in_time - start_time), 0, 1)
	elseif fade_out_time and fade_out_time <= t then
		settings.fade_progress = math.clamp((end_time - t) / (end_time - fade_out_time), 0, 1)
	end

	local pitch_noise_value = self:_calculate_perlin_value(t - settings.start_time, settings) * settings.scale
	local yaw_noise_value = self:_calculate_perlin_value(t - settings.start_time + 10, settings) * settings.scale
	local starting_rotation = settings.camera_rotation_boxed:unbox()
	local deg_to_rad = math.pi / 180
	local yaw_offset = Quaternion(Vector3.up(), yaw_noise_value * deg_to_rad)
	local pitch_offset = Quaternion(Vector3.right(), pitch_noise_value * deg_to_rad)
	local total_offset = Quaternion.multiply(yaw_offset, pitch_offset)
	local rotation = Quaternion.multiply(starting_rotation, total_offset)

	self:set_camera_rotation(rotation)

	if settings.end_time and t >= settings.end_time then
		active_camera_shakes[settings] = nil
	end
end

LevelEndViewBase._calculate_perlin_value = function (self, x, settings)
	local total = 0
	local shake_settings = settings.shake_settings
	local persistance = shake_settings.persistance
	local number_of_octaves = shake_settings.octaves

	for i = 0, number_of_octaves do
		local frequency = 2^i
		local amplitude = persistance^i

		total = total + self:_interpolated_noise(x * frequency, settings) * amplitude
	end

	local amplitude_multiplier = shake_settings.amplitude or 1
	local fade_multiplier = settings.fade_progress or 1

	total = total * amplitude_multiplier * fade_multiplier

	return total
end

LevelEndViewBase._interpolated_noise = function (self, x, settings)
	local x_floored = math.floor(x)
	local remainder = x - x_floored
	local v1 = self:_smoothed_noise(x_floored, settings)
	local v2 = self:_smoothed_noise(x_floored + 1, settings)

	return math.lerp(v1, v2, remainder)
end

LevelEndViewBase._smoothed_noise = function (self, x, settings)
	return self:_noise(x, settings) / 2 + self:_noise(x - 1, settings) / 4 + self:_noise(x + 1, settings) / 4
end

LevelEndViewBase._noise = function (self, x, settings)
	local next_seed, _ = Math.next_random(x + settings.seed)
	local _, value = Math.next_random(next_seed)

	return value * 2 - 1
end

LevelEndViewBase.set_camera_position = function (self, position)
	local _, viewport = self:get_viewport_world()
	local camera = ScriptViewport.camera(viewport)

	return ScriptCamera.set_local_position(camera, position)
end

LevelEndViewBase.set_camera_rotation = function (self, rotation)
	local _, viewport = self:get_viewport_world()
	local camera = ScriptViewport.camera(viewport)

	return ScriptCamera.set_local_rotation(camera, rotation)
end

LevelEndViewBase.get_camera_position = function (self)
	local _, viewport = self:get_viewport_world()
	local camera = ScriptViewport.camera(viewport)

	return ScriptCamera.position(camera)
end

LevelEndViewBase.get_camera_rotation = function (self)
	local _, viewport = self:get_viewport_world()
	local camera = ScriptViewport.camera(viewport)

	return ScriptCamera.rotation(camera)
end

LevelEndViewBase.position_camera = function (self, optional_pose, fov)
	local world, viewport = self:get_viewport_world()
	local camera = ScriptViewport.camera(viewport)
	local camera_pose = optional_pose or self._camera_pose:unbox()

	if camera_pose then
		local fov = fov or 65

		Camera.set_vertical_fov(camera, math.degrees_to_radians(fov))
		ScriptCamera.set_local_pose(camera, camera_pose)
		ScriptCamera.force_update(world, camera)
	end
end

LevelEndViewBase.set_camera_zoom = function (self, progress)
	local camera_pose = self._camera_pose:unbox()
	local translation = Matrix4x4.translation(camera_pose)
	local rotation = Matrix4x4.rotation(camera_pose)
	local max_distance = 0.5
	local distance = max_distance * progress
	local dir = Quaternion.forward(rotation)
	local position = translation + dir * distance

	self:set_camera_position(position)
end

LevelEndViewBase._setup_viewport_camera = function (self)
	local world, viewport = self:get_viewport_world()
	local level_camera_unit = World.unit_by_name(world, "camera")
	local level_camera_rot = Unit.world_rotation(level_camera_unit, 0)
	local level_camera_pos = Unit.world_position(level_camera_unit, 0)
	local level_camera_look = Quaternion.forward(level_camera_rot)

	level_camera_pos = level_camera_pos - level_camera_look * 3

	local viewport_camera = ScriptViewport.camera(viewport)

	ScriptCamera.set_local_rotation(viewport_camera, level_camera_rot)
	ScriptCamera.set_local_position(viewport_camera, level_camera_pos)
end

LevelEndViewBase._push_mouse_cursor = function (self)
	if not self._cursor_visible then
		ShowCursorStack.show("LevelEndViewBase")

		self._cursor_visible = true
	end
end

LevelEndViewBase._pop_mouse_cursor = function (self)
	if self._cursor_visible then
		ShowCursorStack.hide("LevelEndViewBase")

		self._cursor_visible = nil
	end
end

LevelEndViewBase.set_input_manager = function (self, input_manager)
	self.input_manager = input_manager

	if self.reward_popup then
		self.reward_popup:set_input_manager(input_manager)
	end

	local state = self._machine:state()

	state:set_input_manager(input_manager)
end

LevelEndViewBase.input_service = function (self)
	return (self:displaying_reward_presentation() or not table.is_empty(self._transition_animations)) and FAKE_INPUT_SERVICE or self.input_manager:get_service("end_of_level")
end

LevelEndViewBase.menu_input_service = function (self)
	return self.input_blocked and FAKE_INPUT_SERVICE or self:input_service()
end

LevelEndViewBase.set_input_blocked = function (self, blocked)
	self.input_blocked = blocked
end

LevelEndViewBase.input_enabled = function (self)
	return true
end

LevelEndViewBase.setup_world = function (self, context)
	local world, top_world = self:create_world(context)
	local level = self:spawn_level(context, world)
	local viewport = self:create_viewport(context, world)
	local ui_renderer, ui_top_renderer = self:create_ui_renderer(context, world, top_world)
	local wwise_world = Managers.world:wwise_world(world)

	self._world = world
	self._level = level
	self._top_world = top_world
	self._world_viewport = viewport
	self.ui_renderer = ui_renderer
	self.ui_top_renderer = ui_top_renderer
	self.wwise_world = wwise_world
	context.world = world
	context.top_world = top_world
	context.world_viewport = viewport
	context.ui_renderer = ui_renderer
	context.ui_top_renderer = ui_top_renderer
	context.wwise_world = wwise_world
end

LevelEndViewBase.destroy_world = function (self)
	UIRenderer.destroy(self.ui_renderer, self._world)

	self.ui_renderer = nil

	UIRenderer.destroy(self.ui_top_renderer, self._top_world)

	self.ui_top_renderer = nil

	Managers.world:destroy_world(self._world)

	self._world = nil
	self._top_world = nil
end

LevelEndViewBase.get_world_flags = function (self)
	local flags = {
		Application.DISABLE_SOUND,
		Application.DISABLE_ESRAM,
		Application.ENABLE_VOLUMETRICS,
	}

	if Application.user_setting("disable_apex_cloth") then
		table.insert(flags, Application.DISABLE_APEX_CLOTH)
	else
		table.insert(flags, Application.APEX_LOD_RESOURCE_BUDGET)
		table.insert(flags, Application.user_setting("apex_lod_resource_budget") or ApexClothQuality.high.apex_lod_resource_budget)
	end

	return flags
end

LevelEndViewBase.create_world = function (self, context)
	local world_name = "end_screen"
	local shading_environment = "environment/ui_end_screen"
	local layer = 2
	local flags = self:get_world_flags()
	local world = Managers.world:create_world(world_name, shading_environment, nil, layer, unpack(flags))
	local top_world = Managers.world:world("top_ingame_view")

	return world, top_world
end

LevelEndViewBase.create_viewport = function (self, context, world)
	local viewport_name = "end_screen_viewport"
	local viewport_type = "default"
	local layer = 2
	local viewport = ScriptWorld.create_viewport(world, viewport_name, viewport_type, layer)

	return viewport
end

LevelEndViewBase.spawn_level = function (self, context, world)
	local level_name = "levels/end_screen/world"
	local object_sets = {}
	local position, rotation, shading_callback, mood_setting
	local time_sliced_spawn = false
	local level = ScriptWorld.spawn_level(world, level_name, object_sets, position, rotation, shading_callback, mood_setting, time_sliced_spawn)

	Level.spawn_background(level)
	Level.trigger_level_loaded(level)
	self:_register_object_sets(level, level_name)

	return level
end

LevelEndViewBase._register_object_sets = function (self, level, level_name)
	local object_sets = {}
	local available_level_sets = LevelResource.object_set_names(level_name)

	for _, set_name in ipairs(available_level_sets) do
		object_sets[set_name] = {
			set_enabled = true,
			units = LevelResource.unit_indices_in_object_set(level_name, set_name),
		}
	end

	self._object_sets = object_sets

	self:_show_object_set(nil, level)
end

LevelEndViewBase._show_object_set = function (self, object_set_name, level)
	local level = level or self._level
	local object_sets = self._object_sets
	local exists = false

	for set_name, object_set_data in pairs(object_sets) do
		local set_enabled = object_set_data.set_enabled

		if set_enabled and set_name ~= object_set_name then
			local units = object_set_data.units

			for _, unit_index in ipairs(units) do
				local unit = Level.unit_by_index(level, unit_index)

				if Unit.alive(unit) then
					Unit.set_unit_visibility(unit, false)
				end
			end

			object_set_data.set_enabled = false
		elseif set_name == object_set_name and not set_enabled then
			local units = object_set_data.units

			for _, unit_index in ipairs(units) do
				local unit = Level.unit_by_index(level, unit_index)

				Unit.set_unit_visibility(unit, true)

				if Unit.has_data(unit, "LevelEditor", "is_gizmo_unit") then
					local is_gizmo = Unit.get_data(unit, "LevelEditor", "is_gizmo_unit")
					local is_reflection_probe = Unit.is_a(unit, "core/stingray_renderer/helper_units/reflection_probe/reflection_probe")

					if is_gizmo and not is_reflection_probe then
						Unit.flow_event(unit, "hide_helper_mesh")
						Unit.flow_event(unit, "unit_object_set_enabled")
					end
				end
			end

			object_set_data.set_enabled = true
		end

		exists = set_name == object_set_name or exists
	end

	if exists then
		print("Showing object set:", object_set_name)
	elseif object_set_name then
		print(string.format("Trying to show object set %q - But it didn't exist", object_set_name))
	end
end

LevelEndViewBase.create_ui_renderer = function (self, context, world, top_world)
	local materials = {
		"material",
		"materials/ui/ui_1080p_hud_atlas_textures",
		"material",
		"materials/ui/ui_1080p_hud_single_textures",
		"material",
		"materials/ui/ui_1080p_menu_atlas_textures",
		"material",
		"materials/ui/ui_1080p_menu_single_textures",
		"material",
		"materials/ui/ui_1080p_common",
		"material",
		"materials/ui/ui_1080p_versus_available_common",
		"material",
		"materials/ui/ui_1080p_versus_rewards_atlas",
		"material",
		"materials/fonts/gw_fonts",
	}
	local extra_materials = self.get_extra_materials

	if extra_materials then
		for _, extra_material in ipairs(extra_materials) do
			materials[#materials + 1] = extra_material
		end
	end

	for _, extra_portrait_material in ipairs(extra_portrait_materials) do
		materials[#materials + 1] = "material"
		materials[#materials + 1] = extra_portrait_material
	end

	local ui_renderer = UIRenderer.create(world, unpack(materials))
	local ui_top_renderer = UIRenderer.create(top_world, unpack(materials))

	return ui_renderer, ui_top_renderer
end

LevelEndViewBase.show_team = function (self)
	return
end

LevelEndViewBase.hide_team = function (self)
	return
end
