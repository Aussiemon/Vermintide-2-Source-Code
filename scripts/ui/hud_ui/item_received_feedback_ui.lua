require("scripts/settings/ui_player_portrait_frame_settings")

local definitions = local_require("scripts/ui/hud_ui/item_received_feedback_ui_definitions")
local MAX_NUMBER_OF_MESSAGES = definitions.MAX_NUMBER_OF_MESSAGES
local event_settings = {
	give_item = {
		text_function = function (amount, player_1_name, player_2_name)
			if 1 < amount then
				return string.format(Localize("positive_reinforcement_player_gave_item_player_multiple"), player_1_name, player_2_name, amount)
			else
				return string.format(Localize("positive_reinforcement_player_gave_item_player"), player_1_name, player_2_name)
			end

			return 
		end,
		sound_function = function ()
			return script_data.reinforcement_ui_local_sound or "hud_achievement_unlock_02" or (script_data.enable_reinforcement_ui_remote_sound and "hud_info")
		end,
		icon_function = function (hero_portrait_texture, item_icon)
			return hero_portrait_texture, item_icon
		end
	}
}
local event_colors = {
	fade_to = Colors.get_table("white"),
	default = Colors.get_table("cheeseburger"),
	kill = Colors.get_table("red"),
	personal = Colors.get_table("dodger_blue")
}
local item_icons = {
	potion_speed_boost_01 = "killfeed_icon_04",
	grenade_fire_02 = "killfeed_icon_09",
	potion_healing_draught_01 = "killfeed_icon_06",
	grenade_frag_02 = "killfeed_icon_05",
	grenade_fire_01 = "killfeed_icon_09",
	grenade_frag_01 = "killfeed_icon_05",
	potion_cooldown_reduction_01 = "killfeed_icon_13",
	potion_damage_boost_01 = "killfeed_icon_10",
	healthkit_first_aid_kit_01 = "reinforcement_heal"
}
ItemReceivedFeedbackUI = class(ItemReceivedFeedbackUI)
ItemReceivedFeedbackUI.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.player_manager = ingame_ui_context.player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.world = ingame_ui_context.world_manager:world("level_world")
	self.render_settings = {
		snap_pixel_positions = true
	}

	self.create_ui_elements(self)

	self._received_events = {}
	self._hash_order = {}
	self._hash_widget_lookup = {}
	self._animations = {}
	local event_manager = Managers.state.event

	event_manager.register(event_manager, self, "give_item_feedback", "event_give_item_feedback")

	return 
end
ItemReceivedFeedbackUI.destroy = function (self)
	GarbageLeakDetector.register_object(self, "item_received_feedback_ui")

	local event_manager = Managers.state.event

	event_manager.unregister(event_manager, "give_item_feedback", self)

	return 
end
ItemReceivedFeedbackUI.create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self.message_widgets = {}

	for _, widget in pairs(definitions.message_widgets) do
		self.message_widgets[#self.message_widgets + 1] = UIWidget.init(widget)
	end

	self._unused_widgets = table.clone(self.message_widgets)

	return 
end
ItemReceivedFeedbackUI.remove_event = function (self, index)
	local events = self._received_events
	local event = table.remove(events, index)
	local widget = event.widget
	local unused_widgets = self._unused_widgets
	unused_widgets[#unused_widgets + 1] = widget

	return 
end
ItemReceivedFeedbackUI.add_event = function (self, hash, color_from, event_type, ...)
	if not script_data.disable_reinforcement_ui then
		local events = self._received_events
		local full_hash = hash .. event_type
		local hash_order = self._hash_order
		local t = Managers.time:time("game")
		local increment_duration = UISettings.positive_reinforcement.increment_duration
		local message_widgets = self.message_widgets
		local unused_widgets = self._unused_widgets

		if #unused_widgets == 0 then
			self.remove_event(self, #events)
		end

		local settings = event_settings[event_type]
		local widget = table.remove(unused_widgets, 1)
		local offset = widget.offset
		local event = {
			text = "",
			shown_amount = 0,
			amount = 0,
			widget = widget,
			event_type = event_type,
			next_increment = t - increment_duration,
			data = {
				...
			}
		}
		local event_index = #events + 1

		table.insert(events, 1, event)

		local content = widget.content
		local style = widget.style
		local hero_portrait_texture, item_icon = settings.icon_function(...)

		self._assign_portrait_texture(self, widget, "portrait_1", hero_portrait_texture)

		content.icon = item_icon
		offset[2] = 0
		offset[1] = 0
		local text_style_ids = content.text_style_ids

		for _, style_id in ipairs(text_style_ids) do
			style[style_id].color[1] = 255
		end

		local sound_event = settings.sound_function()

		if sound_event then
			local world = self.world
			local wwise_world = Managers.world:wwise_world(world)

			WwiseWorld.trigger_event(wwise_world, sound_event)
		end
	end

	return 
end
local temp_portrait_size = {
	96,
	112
}
ItemReceivedFeedbackUI._assign_portrait_texture = function (self, widget, pass_name, texture)
	widget.content[pass_name].texture_id = texture
	local portrait_size = table.clone(temp_portrait_size)

	if UIAtlasHelper.has_atlas_settings_by_texture_name(texture) then
		local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture)
		portrait_size[1] = texture_settings.size[1]
		portrait_size[2] = texture_settings.size[2]
	end

	local style = widget.style[pass_name]
	local portrait_offset = style.portrait_offset
	local offset = style.offset
	offset[1] = portrait_offset[1] - portrait_size[1] / 2
	offset[2] = portrait_offset[2] - portrait_size[2] / 2
	style.size = portrait_size

	return 
end
ItemReceivedFeedbackUI.event_give_item_feedback = function (self, hash, giver_player, item_name)
	local player_1_name = (giver_player and giver_player.name(giver_player)) or nil
	local player_1_profile_index = (giver_player and giver_player.profile_index(giver_player)) or nil
	local player_1_career_index = (giver_player and giver_player.career_index(giver_player)) or nil
	local player_1_profile_image = player_1_profile_index and player_1_career_index and self._get_hero_portrait(self, player_1_profile_index, player_1_career_index)
	local item_icon = item_icons[item_name] or "icons_placeholder"

	self.add_event(self, hash, event_colors.default, "give_item", player_1_profile_image, item_icon)

	return 
end
ItemReceivedFeedbackUI._get_hero_portrait = function (self, profile_index, career_index)
	local scale = RESOLUTION_LOOKUP.scale
	local profile_data = SPProfiles[profile_index]
	local careers = profile_data.careers
	local career_data = careers[career_index]
	local display_name = profile_data.display_name
	local character_portrait = career_data.portrait_image

	return "small_" .. character_portrait
end
ItemReceivedFeedbackUI.update = function (self, dt, t)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("Player")
	local render_settings = self.render_settings

	for name, animation in pairs(self._animations) do
		if self._animations[name] then
			if not UIAnimation.completed(animation) then
				UIAnimation.update(animation, dt)
			else
				self._animations[name] = nil
			end
		end
	end

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local events = self._received_events
	local move_duration = 2
	local show_duration = 2.5

	for index, event in ipairs(events) do
		local snap_pixel_positions = render_settings.snap_pixel_positions
		local widget = event.widget
		local content = widget.content
		local style = widget.style
		local offset = widget.offset
		local event_type = event.event_type
		local settings = event_settings[event_type]
		local removed = false

		if not event.remove_time then
			event.remove_time = t + show_duration
		elseif event.remove_time < t then
			self.remove_event(self, index)

			removed = true
		end

		if not removed then
			local step_size = 70
			local new_height_offset = (index - 1) * step_size
			local diff = math.abs(math.abs(offset[2]) - math.abs(new_height_offset))
			local time_left = event.remove_time - t
			local fade_duration = 0.3
			local fade_out_progress = 0

			if fade_duration < time_left then
				fade_out_progress = math.clamp((show_duration - time_left) / fade_duration, 0, 1)
			else
				fade_out_progress = math.clamp(time_left / fade_duration, 0, 1)
			end

			local move_time_left = math.max(time_left - show_duration - move_duration, 0)
			local offset_progress = 1 - math.clamp(move_time_left / move_duration, 0, 1)
			offset[1] = 50 * math.easeOutCubic(offset_progress)
			style.arrow.offset[1] = 35 * math.easeOutCubic(offset_progress)
			style.icon.offset[1] = 80 * math.easeOutCubic(offset_progress)
			local anim_progress = math.easeOutCubic(fade_out_progress)
			local alpha = 255 * anim_progress
			local text_style_ids = content.text_style_ids

			for _, style_id in ipairs(text_style_ids) do
				style[style_id].color[1] = alpha
			end

			render_settings.snap_pixel_positions = move_time_left == 0

			UIRenderer.draw_widget(ui_renderer, widget)
		end

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	UIRenderer.end_pass(ui_renderer)

	return 
end

return 
