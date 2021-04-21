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

PositiveReinforcementUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.player_manager = ingame_ui_context.player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.world = ingame_ui_context.world_manager:world("level_world")
	self.render_settings = {
		snap_pixel_positions = true
	}

	self:create_ui_elements()

	self._positive_enforcement_events = {}
	self._positive_enforcement_lookup = {}
	self._hash_order = {}
	self._hash_widget_lookup = {}
	self._animations = {}
	local event_manager = Managers.state.event

	event_manager:register(self, "add_coop_feedback", "event_add_positive_enforcement")
	event_manager:register(self, "add_coop_feedback_kill", "event_add_positive_enforcement_kill")
end

PositiveReinforcementUI.destroy = function (self)
	GarbageLeakDetector.register_object(self, "positive_reinforcement_ui")

	local event_manager = Managers.state.event

	event_manager:unregister("add_coop_feedback", self)
	event_manager:unregister("add_coop_feedback_kill", self)
end

PositiveReinforcementUI.create_ui_elements = function (self)
	local game_mode_key = Managers.state.game_mode:game_mode_key()
	local game_mode_setting = GameModeSettings[game_mode_key].hud_ui_settings
	local scenegraph_definition = definitions.scenegraph_definition

	if game_mode_setting and game_mode_setting.killfeed_offset then
		scenegraph_definition.message_animated = table.clone(scenegraph_definition.message_animated_offset)
	else
		scenegraph_definition.message_animated = table.clone(scenegraph_definition.message_animated_base)
	end

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.message_widgets = {}

	for _, widget in pairs(definitions.message_widgets) do
		self.message_widgets[#self.message_widgets + 1] = UIWidget.init(widget)
	end

	self._unused_widgets = table.clone(self.message_widgets)
end

PositiveReinforcementUI.remove_event = function (self, index)
	local events = self._positive_enforcement_events
	local event = table.remove(events, index)
	local widget = event.widget
	self._positive_enforcement_lookup[event.full_hash] = nil
	local unused_widgets = self._unused_widgets
	unused_widgets[#unused_widgets + 1] = widget
end

local function trigger_assist_buffs(savior_unit, saved_unit)
	local buff_ext = ScriptUnit.extension(savior_unit, "buff_system")
	local saved_unit_health_extension = ScriptUnit.extension(saved_unit, "health_system")
	local shield_amount, procced = buff_ext:apply_buffs_to_value(0, "shielding_player_by_assist")

	if procced then
		if Managers.player.is_server then
			DamageUtils.heal_network(saved_unit, savior_unit, shield_amount, "buff")
			DamageUtils.heal_network(savior_unit, savior_unit, shield_amount, "buff")
		else
			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local saved_unit_id = network_manager:unit_game_object_id(saved_unit)
			local savior_unit_id = network_manager:unit_game_object_id(savior_unit)
			local heal_type_id = NetworkLookup.heal_types.buff

			network_transmit:send_rpc_server("rpc_request_heal", saved_unit_id, shield_amount, heal_type_id)
			network_transmit:send_rpc_server("rpc_request_heal", savior_unit_id, shield_amount, heal_type_id)
		end
	end
end

PositiveReinforcementUI.add_event = function (self, hash, is_local_player, color_from, event_type, ...)
	if not script_data.disable_reinforcement_ui then
		local events = self._positive_enforcement_events
		local full_hash = hash .. event_type
		local hash_order = self._hash_order
		local settings_positive_reinforcement = UISettings.positive_reinforcement
		local t = Managers.time:time("ui")
		local increment_duration = settings_positive_reinforcement.increment_duration
		local settings = event_settings[event_type]
		local old_event = self._positive_enforcement_lookup[full_hash]

		if old_event and settings_positive_reinforcement.folding_enabled then
			local widget_content = old_event.widget.content
			local count = widget_content.count + 1
			widget_content.count_text = count .. "x"
			widget_content.count = count
			old_event.remove_time = nil
		else
			local message_widgets = self.message_widgets
			local unused_widgets = self._unused_widgets

			if #unused_widgets == 0 then
				self:remove_event(#events)
			end

			local widget = table.remove(unused_widgets, 1)
			local offset = widget.offset
			local event = {
				text = "",
				shown_amount = 0,
				amount = 0,
				full_hash = full_hash,
				widget = widget,
				event_type = event_type,
				is_local_player = is_local_player,
				data = {
					...
				}
			}
			local event_index = #events + 1

			table.insert(events, 1, event)

			self._positive_enforcement_lookup[full_hash] = event
			local content = widget.content
			local style = widget.style
			content.count = 1
			content.count_text = nil
			local texture_1, texture_2, texture_3 = settings.icon_function(...)

			self:_assign_portrait_texture(widget, "portrait_1", texture_1)
			self:_assign_portrait_texture(widget, "portrait_2", texture_3)

			content.icon = texture_2
			offset[2] = 0
			local texte_style_ids = content.texte_style_ids

			for _, style_id in ipairs(texte_style_ids) do
				style[style_id].color[1] = 255
			end
		end

		if is_local_player then
			local sound_event = settings.sound_function()

			if sound_event then
				local world = self.world
				local wwise_world = Managers.world:wwise_world(world)

				WwiseWorld.trigger_event(wwise_world, sound_event)
			end
		end
	end
end

local temp_portrait_size = {
	96,
	112
}

PositiveReinforcementUI._assign_portrait_texture = function (self, widget, pass_name, texture)
	local style = widget.style[pass_name]

	if not texture then
		style.size = {
			0,
			0
		}

		return
	end

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
end

PositiveReinforcementUI.event_add_positive_enforcement = function (self, hash, is_local_player, event_type, player1, player2)
	if not event_settings[event_type] then
		return
	end

	local player_1_name = (player1 and player1:name()) or nil
	local player_2_name = (player2 and player2:name()) or nil
	local player_1_unit = player1 and player1.player_unit
	local player_2_unit = player2 and player2.player_unit
	local player_1_career_extension = Unit.alive(player_1_unit) and ScriptUnit.extension(player_1_unit, "career_system")
	local player_2_career_extension = Unit.alive(player_2_unit) and ScriptUnit.extension(player_2_unit, "career_system")
	local player_1_profile_index = (player1 and player1:profile_index()) or nil
	local player_2_profile_index = (player2 and player2:profile_index()) or nil
	local player_1_career_index = (player_1_career_extension and player_1_career_extension:career_index()) or (player1 and player1:career_index())
	local player_2_career_index = (player_2_career_extension and player_2_career_extension:career_index()) or (player2 and player2:career_index())
	local player_1_profile_image = player_1_profile_index and player_1_career_index and self:_get_hero_portrait(player_1_profile_index, player_1_career_index)
	local player_2_profile_image = player_2_profile_index and player_2_career_index and self:_get_hero_portrait(player_2_profile_index, player_2_career_index)

	if not player_1_profile_image or not player_2_profile_image then
		return
	end

	self:add_event(hash, is_local_player, event_colors.default, event_type, player_1_profile_image, player_2_profile_image)
end

PositiveReinforcementUI.event_add_positive_enforcement_kill = function (self, hash, is_local_player, event_type, breed_name_attacker, breed_name_killed)
	local breed_texture_attacker = breed_textures[breed_name_attacker]
	local breed_texture_killed = breed_textures[breed_name_killed]

	if not event_settings[event_type] or not breed_texture_attacker or not breed_texture_killed then
		return
	end

	self:add_event(hash, is_local_player, event_colors.kill, event_type, breed_texture_attacker, breed_texture_killed)
end

PositiveReinforcementUI.event_add_positive_enforcement_player_knocked_down_or_killed = function (self, hash, is_local_player, event_type, profile_index, breed_name)
	local breed_texture = breed_textures[breed_name]

	if not event_settings[event_type] or not breed_texture then
		return
	end

	if not profile_index then
		return
	end

	local player_texture = self:_get_hero_portrait(profile_index)

	self:add_event(hash, is_local_player, event_colors.kill, event_type, breed_texture, player_texture)
end

PositiveReinforcementUI.event_add_lorebook_page_pickup = function (self, hash, is_local_player, event_type, page_id)
	self:add_event(hash, is_local_player, event_colors.personal, event_type, page_id)
end

PositiveReinforcementUI.event_add_interaction_warning = function (self, hash, message)
	self:add_event(hash, true, event_colors.kill, "interaction_warning", Localize(message))
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

local customizer_data = {
	root_scenegraph_id = "pivot",
	label = "Kill feed",
	registry_key = "kill_feed",
	drag_scenegraph_id = "pivot_dragger"
}
local DO_RELOAD = false

PositiveReinforcementUI.update = function (self, dt, t)
	if DO_RELOAD then
		self:create_ui_elements()

		DO_RELOAD = false
	end

	HudCustomizer.run(self.ui_renderer, self.ui_scenegraph, customizer_data)

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
			self:remove_event(index)

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
end

return
