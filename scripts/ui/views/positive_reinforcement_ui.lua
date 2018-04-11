require("scripts/settings/ui_player_portrait_frame_settings")

local definitions = local_require("scripts/ui/views/positive_reinforcement_ui_definitions")
local MAX_NUMBER_OF_MESSAGES = definitions.MAX_NUMBER_OF_MESSAGES
local event_settings = local_require("scripts/ui/views/positive_reinforcement_ui_event_settings")
local event_colors = {
	fade_to = Colors.get_table("white"),
	default = Colors.get_table("cheeseburger"),
	kill = Colors.get_table("red"),
	personal = Colors.get_table("dodger_blue")
}
local breed_textures = UISettings.breed_textures
PositiveReinforcementUI = class(PositiveReinforcementUI)
PositiveReinforcementUI.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.player_manager = ingame_ui_context.player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.world = ingame_ui_context.world_manager:world("level_world")
	self.render_settings = {
		snap_pixel_positions = true
	}

	self.create_ui_elements(self)

	self._positive_enforcement_events = {}
	self._hash_order = {}
	self._hash_widget_lookup = {}
	self._animations = {}
	local event_manager = Managers.state.event

	event_manager.register(event_manager, self, "add_coop_feedback", "event_add_positive_enforcement")
	event_manager.register(event_manager, self, "add_coop_feedback_kill", "event_add_positive_enforcement_kill")

	return 
end
PositiveReinforcementUI.destroy = function (self)
	GarbageLeakDetector.register_object(self, "positive_reinforcement_ui")

	local event_manager = Managers.state.event

	event_manager.unregister(event_manager, "add_coop_feedback", self)
	event_manager.unregister(event_manager, "add_coop_feedback_kill", self)

	return 
end
PositiveReinforcementUI.create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self.message_widgets = {}

	for _, widget in pairs(definitions.message_widgets) do
		self.message_widgets[#self.message_widgets + 1] = UIWidget.init(widget)
	end

	self._unused_widgets = table.clone(self.message_widgets)

	return 
end
PositiveReinforcementUI.remove_event = function (self, index)
	local events = self._positive_enforcement_events
	local event = table.remove(events, index)
	local widget = event.widget
	local unused_widgets = self._unused_widgets
	unused_widgets[#unused_widgets + 1] = widget

	return 
end

local function trigger_assist_buffs(savior_unit, saved_unit)
	local buff_ext = ScriptUnit.extension(savior_unit, "buff_system")
	local saved_unit_health_extension = ScriptUnit.extension(saved_unit, "health_system")
	local shield_amount, procced = buff_ext.apply_buffs_to_value(buff_ext, 0, StatBuffIndex.SHIELDING_PLAYER_BY_ASSIST)

	if procced then
		if Managers.player.is_server then
			DamageUtils.heal_network(saved_unit, savior_unit, shield_amount, "buff")
			DamageUtils.heal_network(savior_unit, savior_unit, shield_amount, "buff")
		else
			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local saved_unit_id = network_manager.unit_game_object_id(network_manager, saved_unit)
			local savior_unit_id = network_manager.unit_game_object_id(network_manager, savior_unit)
			local heal_type_id = NetworkLookup.heal_types.buff

			network_transmit.send_rpc_server(network_transmit, "rpc_request_heal", saved_unit_id, shield_amount, heal_type_id)
			network_transmit.send_rpc_server(network_transmit, "rpc_request_heal", savior_unit_id, shield_amount, heal_type_id)
		end
	end

	return 
end

PositiveReinforcementUI.add_event = function (self, hash, is_local_player, color_from, event_type, ...)
	if not script_data.disable_reinforcement_ui then
		local events = self._positive_enforcement_events
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
			is_local_player = is_local_player,
			data = {
				...
			}
		}
		local event_index = #events + 1

		table.insert(events, 1, event)

		local content = widget.content
		local style = widget.style
		local texture_1, texture_2, texture_3 = settings.icon_function(...)

		self._assign_portrait_texture(self, widget, "portrait_1", texture_1)
		self._assign_portrait_texture(self, widget, "portrait_2", texture_3)

		content.icon = texture_2
		offset[2] = 0
		local texte_style_ids = content.texte_style_ids

		for _, style_id in ipairs(texte_style_ids) do
			style[style_id].color[1] = 255
		end

		local sound_event = nil

		if is_local_player then
			sound_event = settings.sound_function()
		end

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
PositiveReinforcementUI._assign_portrait_texture = function (self, widget, pass_name, texture)
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
PositiveReinforcementUI.event_add_positive_enforcement = function (self, hash, is_local_player, event_type, player1, player2)
	if not event_settings[event_type] then
		return 
	end

	local player_1_name = (player1 and player1.name(player1)) or nil
	local player_2_name = (player2 and player2.name(player2)) or nil
	local player_1_unit = player1 and player1.player_unit
	local player_2_unit = player2 and player2.player_unit
	local player_1_career_extension = Unit.alive(player_1_unit) and ScriptUnit.extension(player_1_unit, "career_system")
	local player_2_career_extension = Unit.alive(player_2_unit) and ScriptUnit.extension(player_2_unit, "career_system")
	local player_1_profile_index = (player1 and player1.profile_index(player1)) or nil
	local player_2_profile_index = (player2 and player2.profile_index(player2)) or nil
	local player_1_career_index = (player_1_career_extension and player_1_career_extension.career_index(player_1_career_extension)) or (player1 and player1.profile_index(player1))
	local player_2_career_index = (player_2_career_extension and player_2_career_extension.career_index(player_2_career_extension)) or (player2 and player2.profile_index(player2))
	local player_1_profile_image = player_1_profile_index and player_1_career_index and self._get_hero_portrait(self, player_1_profile_index, player_1_career_index)
	local player_2_profile_image = player_2_profile_index and player_2_career_index and self._get_hero_portrait(self, player_2_profile_index, player_2_career_index)

	if event_type == "aid" then
		if is_local_player and Unit.alive(player_1_unit) and Unit.alive(player_2_unit) then
			trigger_assist_buffs(player_1_unit, player_2_unit)
		end

		return 
	end

	self.add_event(self, hash, is_local_player, event_colors.default, event_type, player_1_profile_image, player_2_profile_image)

	return 
end
PositiveReinforcementUI.event_add_positive_enforcement_kill = function (self, hash, is_local_player, event_type, profile_index, career_index, breed_name)
	local breed_texture = breed_textures[breed_name]

	if not event_settings[event_type] or not breed_texture then
		return 
	end

	local attacker_texture = self._get_hero_portrait(self, profile_index, career_index)

	self.add_event(self, hash, is_local_player, event_colors.kill, event_type, attacker_texture, breed_texture)

	return 
end
PositiveReinforcementUI.event_add_positive_enforcement_player_knocked_down_or_killed = function (self, hash, is_local_player, event_type, profile_index, breed_name)
	local breed_texture = breed_textures[breed_name]

	if not event_settings[event_type] or not breed_texture then
		return 
	end

	local player_texture = self._get_hero_portrait(self, profile_index)

	self.add_event(self, hash, is_local_player, event_colors.kill, event_type, breed_texture, player_texture)

	return 
end
PositiveReinforcementUI.event_add_lorebook_page_pickup = function (self, hash, is_local_player, event_type, page_id)
	self.add_event(self, hash, is_local_player, event_colors.personal, event_type, page_id)

	return 
end
PositiveReinforcementUI.event_add_interaction_warning = function (self, hash, message)
	self.add_event(self, hash, true, event_colors.kill, "interaction_warning", Localize(message))

	return 
end
PositiveReinforcementUI._get_hero_portrait = function (self, profile_index, career_index)
	local scale = RESOLUTION_LOOKUP.scale
	local profile_data = SPProfiles[profile_index]
	local careers = profile_data.careers
	local career_data = careers[career_index]
	local display_name = profile_data.display_name
	local character_portrait = career_data.portrait_image

	return "small_" .. character_portrait
end
PositiveReinforcementUI.update = function (self, dt, t)
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

	local events = self._positive_enforcement_events
	local show_duration = UISettings.positive_reinforcement.show_duration
	local snap_pixel_positions = render_settings.snap_pixel_positions

	for index, event in ipairs(events) do
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
			local step_size = 80
			local new_height_offset = -((index - 1) * step_size)
			local diff = math.abs(math.abs(offset[2]) - math.abs(new_height_offset))

			if new_height_offset < offset[2] then
				local speed = 400
				offset[2] = math.max(offset[2] - dt * speed, new_height_offset)
			else
				offset[2] = new_height_offset
			end

			local time_left = event.remove_time - t
			local fade_duration = UISettings.positive_reinforcement.fade_duration
			local fade_out_progress = 0

			if fade_duration < time_left then
				fade_out_progress = math.clamp((show_duration - time_left) / fade_duration, 0, 1)
				offset[1] = -(math.easeInCubic(1 - fade_out_progress) * 35)
			else
				fade_out_progress = math.clamp(time_left / fade_duration, 0, 1)
			end

			local anim_progress = math.easeOutCubic(fade_out_progress)
			local alpha = 255 * anim_progress
			local texte_style_ids = content.texte_style_ids

			for _, style_id in ipairs(texte_style_ids) do
				style[style_id].color[1] = alpha
			end

			render_settings.snap_pixel_positions = time_left <= fade_duration

			UIRenderer.draw_widget(ui_renderer, widget)

			render_settings.snap_pixel_positions = snap_pixel_positions
		end
	end

	UIRenderer.end_pass(ui_renderer)

	return 
end

return 
