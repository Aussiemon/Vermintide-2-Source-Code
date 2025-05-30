﻿-- chunkname: @scripts/entity_system/systems/ping/ping_system.lua

require("scripts/unit_extensions/default_player_unit/ping/context_aware_ping_extension")
require("scripts/unit_extensions/default_player_unit/ping/ping_target_extension")
require("scripts/settings/ping_templates")

local PING_DURATION = 15
local SELF_PING_DURATION = 5
local MAX_PING_RESPONSE_UV_DISTANCE = 0.05
local VERSUS_ENEMY_PING_DURATION = 5
local REFRESH_PING_SOUND_COOLDOWN = 2
local UNIQUE_PING_SOUND_COOLDOWN = 0.7
local PLAY_SOUND_WHEN_PINGING_SAME_UNIT = true
local RPCS = {
	"rpc_ping_unit",
	"rpc_ping_world_position",
	"rpc_remove_ping",
	"rpc_social_message",
}
local extensions = {
	"ContextAwarePingExtension",
	"PingTargetExtension",
}
local WORLD_MARKER_CONTENT_LOOKUP = {
	"world_marker_response_1",
	"world_marker_response_2",
	"world_marker_response_3",
}
local WORLD_MARKER_ICON_LOOKUP = {
	"world_marker_icon_response_1",
	"world_marker_icon_response_2",
	"world_marker_icon_response_3",
}

PingSystem = class(PingSystem, ExtensionSystemBase)

PingSystem.init = function (self, context, system_name)
	PingSystem.super.init(self, context, system_name, extensions)

	local network_event_delegate = context.network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	self._network_event_delegate = network_event_delegate
	self._unit_storage = context.unit_storage
	self._world = context.world
	self._wwise_world = Managers.world:wwise_world(self._world)
	self._pinged_units = {}
	self._world_markers = {}
	self._last_ping_t = {}

	local settings = Managers.state.game_mode:settings()
	local ping_mode = settings.ping_mode

	if ping_mode then
		self._outlines_enabled = ping_mode.outlines
		self._world_markers_enabled = ping_mode.world_markers
	else
		self._outlines_enabled = {
			item = true,
			unit = true,
		}
		self._world_markers_enabled = false
	end

	self._pings_enabled = self._outlines_enabled.item or self._outlines_enabled.unit or self._world_markers_enabled
	self._current_mechanism_name = Managers.mechanism:current_mechanism_name()
end

PingSystem.destroy = function (self)
	self._network_event_delegate:unregister(self)
end

PingSystem.freeze = function (self, unit)
	local data = self._pinged_units[unit]

	if data then
		if data._pinged then
			local apply_outline = self:_is_outline_enabled(unit)

			data:set_pinged(false, nil, nil, apply_outline)
		end

		self._pinged_units[unit] = nil
	end
end

PingSystem.unfreeze = function (self, unit)
	return
end

PingSystem.update = function (self, context, t)
	PingSystem.super.update(self, context, t)

	if not self._pings_enabled then
		return
	end

	if self.is_server then
		self:_update_server(context, t)
	else
		self:_update_client(context, t)
	end
end

PingSystem._update_server = function (self, context, t)
	local pinged_units = self._pinged_units

	for pinger_unit, data in pairs(pinged_units) do
		local pinged_unit = data.pinged_unit

		if ALIVE[pinged_unit] then
			if ALIVE[pinger_unit] then
				local start_time = data.start_time

				if pinger_unit == pinged_unit and t >= start_time + SELF_PING_DURATION then
					self:_remove_ping(pinger_unit)
				end

				if self._current_mechanism_name == "versus" and data.ping_type == PingTypes.ENEMY_GENERIC then
					if t >= start_time + VERSUS_ENEMY_PING_DURATION then
						self:_remove_ping(pinger_unit)
					end
				elseif t >= start_time + PING_DURATION then
					self:_remove_ping(pinger_unit)
				end
			else
				self:_remove_ping(pinger_unit)
			end
		elseif data.position then
			local start_time = data.start_time

			if t >= start_time + PING_DURATION then
				self:_remove_ping(pinger_unit)
			end
		else
			self:_remove_ping(pinger_unit)
		end
	end
end

PingSystem._update_client = function (self, context, t)
	local pinged_units = self._pinged_units

	for pinger_unit, data in pairs(pinged_units) do
		local valid_ping = ALIVE[pinger_unit] and (data.position or ALIVE[data.pinged_unit])

		if not valid_ping then
			self:_remove_ping(pinger_unit)
		end
	end
end

PingSystem.hot_join_sync = function (self, sender)
	local pinged_units = self._pinged_units
	local network_manager = Managers.state.network
	local channel_id = PEER_ID_TO_CHANNEL[sender]

	for pinger_unit, data in pairs(pinged_units) do
		repeat
			local pinged_unit = data.pinged_unit

			if not ALIVE[pinger_unit] or pinged_unit and not ALIVE[pinged_unit] then
				break
			end

			local pinger_unit_id = network_manager:unit_game_object_id(pinger_unit)
			local pinged_unit_id, is_level_unit

			if pinged_unit then
				pinged_unit_id, is_level_unit = network_manager:game_object_or_level_id(pinged_unit)
			end

			local position = data.position

			if pinger_unit_id then
				if pinged_unit_id then
					RPC.rpc_ping_unit(channel_id, pinger_unit_id, pinged_unit_id, is_level_unit, data.flash, data.ping_type, data.social_wheel_event_id)

					break
				end

				if position then
					local is_double_press = false

					RPC.rpc_ping_world_position(channel_id, pinger_unit_id, Vector3(unpack(position)), data.ping_type, data.social_wheel_event_id, is_double_press)
				end
			end
		until true
	end
end

PingSystem._handle_ping = function (self, ping_type, social_wheel_event_id, sender_player, pinger_unit, pinged_unit, position, flash)
	if pinged_unit and not Unit.alive(pinged_unit) then
		return
	end

	if pinged_unit then
		local buff_ext = ScriptUnit.has_extension(pinged_unit, "buff_system")

		if buff_ext and buff_ext:has_buff_type("mutator_shadow_damage_reduction") then
			return
		end
	end

	if ping_type == PingTypes.CANCEL then
		self:_remove_ping(pinger_unit)

		return
	end

	if not ping_type or ping_type == PingTypes.CHAT_ONLY then
		return
	end

	local party = sender_player:get_party()

	if not party then
		return
	end

	local pinging_same_unit = false

	if self._pinged_units[pinger_unit] then
		pinging_same_unit = pinged_unit and pinged_unit == self._pinged_units[pinger_unit].pinged_unit

		self:_remove_ping(pinger_unit, true)
	end

	local t = Managers.time:time("game")
	local network_manager = Managers.state.network
	local pinger_unit_id = network_manager:unit_game_object_id(pinger_unit)
	local pinged_unit_id, is_level_unit

	if pinged_unit then
		pinged_unit_id, is_level_unit = network_manager:game_object_or_level_id(pinged_unit)
	end

	self._pinged_units[pinger_unit] = {
		start_time = t,
		pinged_unit = pinged_unit,
		flash = flash,
		party_id = party.party_id,
		pinger_unique_id = sender_player:unique_id(),
		pinger_unit_id = pinger_unit_id,
		pinged_unit_id = pinged_unit_id,
		ping_type = ping_type,
		position = position and {
			Vector3.to_elements(position),
		},
		social_wheel_event_id = social_wheel_event_id,
	}

	Managers.telemetry_events:ping_used(sender_player, PingTypes[ping_type], pinged_unit, POSITION_LOOKUP[pinger_unit])

	if self.is_server then
		if pinged_unit then
			self.network_transmit:send_rpc_party_clients("rpc_ping_unit", party, true, pinger_unit_id, pinged_unit_id, is_level_unit, flash, ping_type, social_wheel_event_id)
			self:_play_ping_vo(pinger_unit, pinged_unit, ping_type, social_wheel_event_id)
		elseif position then
			local is_double_press = false

			self.network_transmit:send_rpc_party_clients("rpc_ping_world_position", party, true, pinger_unit_id, position, ping_type, social_wheel_event_id, is_double_press)
			self:_play_ping_vo(pinger_unit, nil, ping_type, social_wheel_event_id)
		end
	end

	if DEDICATED_SERVER then
		return
	end

	local local_player = Managers.player:local_player()
	local unique_player_id = local_player:unique_id()

	if not Managers.party:is_player_in_party(unique_player_id, party.party_id) then
		return
	end

	if pinged_unit then
		self:_add_unit_ping(pinger_unit, pinged_unit, flash, ping_type)
	end

	if self._world_markers_enabled and ping_type ~= PingTypes.VO_ONLY then
		self:_add_world_marker(pinger_unit, pinged_unit, position, ping_type, social_wheel_event_id)
	end

	local skip_sound = false
	local last_ping_t = self._last_ping_t[pinger_unit] or 0

	if pinging_same_unit and (not PLAY_SOUND_WHEN_PINGING_SAME_UNIT or t < last_ping_t + REFRESH_PING_SOUND_COOLDOWN) then
		skip_sound = true
	elseif not pinged_unit and t < last_ping_t + REFRESH_PING_SOUND_COOLDOWN then
		skip_sound = true
	elseif pinged_unit and not pinging_same_unit and t < last_ping_t + UNIQUE_PING_SOUND_COOLDOWN then
		skip_sound = true
	else
		self._last_ping_t[pinger_unit] = t
	end

	if not skip_sound then
		local social_wheel_event_name = NetworkLookup.social_wheel_events[social_wheel_event_id]
		local social_wheel_settings = SocialWheelSettingsLookup[social_wheel_event_name]
		local ping_sound_effect = social_wheel_settings and social_wheel_settings.ping_sound_effect

		if ping_sound_effect then
			self:_play_sound(ping_sound_effect)
		else
			local event = pinged_unit and Unit.get_data(pinged_unit, "breed") and "hud_ping_enemy" or "hud_ping"

			self:_play_sound(event)
		end
	end
end

PingSystem._handle_chat = function (self, ping_type, social_wheel_event_id, sender_player, pinger_unit, pinged_unit, chat_messages)
	if pinged_unit and ping_type == PingTypes.ENEMY_GENERIC then
		local breed = Unit.get_data(pinged_unit, "breed")

		if not breed or breed.is_ai then
			return
		end
	end

	local valid_social_wheel_id = social_wheel_event_id and social_wheel_event_id ~= NetworkLookup.social_wheel_events["n/a"]
	local social_wheel_event_settings = valid_social_wheel_id and SocialWheelSettingsLookup[NetworkLookup.social_wheel_events[social_wheel_event_id]]
	local event_text, localization_parameters

	if not MechanismOverrides.get(IgnoreChatPings)[ping_type] then
		if valid_social_wheel_id then
			if IS_CONSOLE and ping_type ~= PingTypes.LOCAL_ONLY then
				local party = sender_player:get_party()
				local pinged_unit_id = pinged_unit and Managers.state.network:unit_game_object_id(pinged_unit) or 0
				local include_spectators = true

				self.network_transmit:send_rpc_party("rpc_social_wheel_event", party, include_spectators, sender_player.peer_id, social_wheel_event_id, pinged_unit_id)
			end

			local text_func = social_wheel_event_settings.event_text_func
			local text = social_wheel_event_settings.event_text

			event_text, localization_parameters = text

			if text_func and pinged_unit then
				local do_localize = false

				event_text, localization_parameters = text_func(pinged_unit, social_wheel_event_settings, do_localize)
			end

			if not event_text and chat_messages then
				event_text = chat_messages[math.random(1, #chat_messages)]
			end
		elseif chat_messages then
			event_text = chat_messages[math.random(1, #chat_messages)]
		end

		if event_text then
			local localize, localize_parameters = true, true
			local sended_peer_id = sender_player:network_id()
			local channel_id, message_target = 1
			local mechanism = Managers.mechanism:game_mechanism()

			if mechanism.get_chat_channel then
				channel_id, message_target = mechanism:get_chat_channel(sended_peer_id, false)
			end

			Managers.chat:send_chat_message(channel_id, sender_player:local_player_id(), event_text, localize, localization_parameters, localize_parameters, nil, message_target, nil, nil, sended_peer_id)
		end
	end

	if valid_social_wheel_id then
		local execute_func = social_wheel_event_settings.execute_func

		if execute_func then
			local social_wheel_category = SocialWheelSettings[social_wheel_event_settings.category_name]

			execute_func(social_wheel_event_settings.data, pinged_unit, sender_player, social_wheel_category)
		end
	end
end

PingSystem.handle_local_ping = function (self, ping_type, social_wheel_event_id, sender_player, pinger_unit, pinged_unit, chat_messages)
	self:_handle_chat(ping_type, social_wheel_event_id, sender_player, pinger_unit, pinged_unit, chat_messages)
end

PingSystem.is_ping_cancel = function (self, sender_unique_id, position)
	if not self._world_markers_enabled then
		return
	end

	if position then
		local world = self._world
		local viewport = ScriptWorld.viewport(world, "player_1")
		local camera = viewport and ScriptViewport.camera(viewport)

		if camera and Camera.inside_frustum(camera, position) then
			local ping_offset = Vector3Aux.unbox(WorldMarkerTemplates.ping.position_offset)
			local ping_screen_uv = ScriptCamera.world_to_screen_uv(camera, position)
			local max_dist_sq = MAX_PING_RESPONSE_UV_DISTANCE * MAX_PING_RESPONSE_UV_DISTANCE

			for pinger_unit, data in pairs(self._pinged_units) do
				local existing_position = data.position and Vector3(unpack(data.position)) or POSITION_LOOKUP[data.pinged_unit]

				if existing_position then
					existing_position = existing_position + ping_offset

					if Camera.inside_frustum(camera, existing_position) then
						local existing_screen_uv = ScriptCamera.world_to_screen_uv(camera, existing_position)
						local distance_sq = Vector3.distance_squared(existing_screen_uv, ping_screen_uv)

						if distance_sq <= max_dist_sq and sender_unique_id == data.pinger_unique_id then
							return PingTypes.CANCEL, existing_position
						end
					end
				end
			end
		end
	end
end

PingSystem._get_unit_ping_type = function (self, pinged_unit, sender_unique_id, sent_ping_type)
	if not self._world_markers_enabled then
		return sent_ping_type
	end

	if sent_ping_type == PingTypes.ACKNOWLEDGE or sent_ping_type == PingTypes.DENY then
		return nil
	end

	if sent_ping_type == PingTypes.CONTEXT then
		if not pinged_unit or not ALIVE[pinged_unit] then
			return PingTypes.MOVEMENT_GENERIC
		end

		if ScriptUnit.has_extension(pinged_unit, "pickup_system") then
			return PingTypes.PLAYER_PICK_UP
		end

		local sender_party = Managers.party:get_party_from_unique_id(sender_unique_id)
		local side_manager = Managers.state.side
		local sender_side = side_manager.side_by_party[sender_party]
		local pinged_side = side_manager.side_by_unit[pinged_unit]

		if side_manager:is_enemy_by_side(sender_side, pinged_side) then
			return PingTypes.ENEMY_GENERIC
		end

		return PingTypes.PLAYER_HELP
	end

	return sent_ping_type
end

PingSystem._get_world_position_ping_type = function (self, sent_ping_type, is_double_press)
	if is_double_press then
		return PingTypes.ENEMY_POSITION
	end

	if sent_ping_type == PingTypes.ACKNOWLEDGE or sent_ping_type == PingTypes.DENY then
		return sent_ping_type, nil
	end

	if sent_ping_type == PingTypes.CONTEXT then
		return PingTypes.MOVEMENT_GENERIC, nil
	end

	return sent_ping_type, nil
end

PingSystem._add_unit_ping = function (self, pinger_unit, pinged_unit, flash, ping_type)
	local ping_extension = ScriptUnit.has_extension(pinged_unit, "ping_system")

	if not ping_extension then
		return
	end

	local do_ping, chat_messages, ping_icon
	local ping_templates = MechanismOverrides.get(PingTemplates, self._current_mechanism_name)

	for _, data in pairs(ping_templates) do
		if data:check_func(pinger_unit, pinged_unit) then
			do_ping, chat_messages, ping_icon = data:exec_func(self, pinger_unit, pinged_unit, ping_type, self._current_mechanism_name)

			break
		end
	end

	if not do_ping then
		return
	end

	if ping_extension.set_pinged then
		local apply_outline = self:_is_outline_enabled(pinged_unit)

		ping_extension:set_pinged(true, flash, pinger_unit, apply_outline)
	end

	local sender_player = Managers.player:unit_owner(pinger_unit)

	if sender_player and sender_player.local_player then
		local ai_system = Managers.state.entity:system("ai_system")
		local attributes = ai_system:get_attributes(pinged_unit)
		local breed = Unit.get_data(pinged_unit, "breed")

		if breed and breed.show_health_bar or attributes.grudge_marked then
			Managers.state.event:trigger("boss_health_bar_set_prioritized_unit", pinged_unit, "ping")
		end
	end
end

PingSystem._add_world_marker = function (self, pinger_unit, pinged_unit, position, ping_type, social_wheel_event_id)
	if not pinged_unit and not position then
		return
	end

	if ping_type == PingTypes.LOCAL_ONLY then
		return
	end

	local do_ping, chat_messages, chat_message, ping_icon
	local ping_templates = MechanismOverrides.get(PingTemplates, self._current_mechanism_name)

	for _, data in pairs(ping_templates) do
		if data:check_func(pinger_unit, pinged_unit) then
			do_ping, chat_messages, ping_icon = data:exec_func(self, pinger_unit, pinged_unit, ping_type, social_wheel_event_id, self._current_mechanism_name)

			break
		end
	end

	if not do_ping then
		return
	end

	if not ping_icon and social_wheel_event_id and social_wheel_event_id ~= NetworkLookup.social_wheel_events["n/a"] then
		local social_wheel_event_name = NetworkLookup.social_wheel_events[social_wheel_event_id]
		local social_wheel_event_settings = SocialWheelSettingsLookup[social_wheel_event_name]

		ping_icon = social_wheel_event_settings.icon

		if social_wheel_event_settings.event_text_func and pinged_unit then
			local event_text, localization_parameters = social_wheel_event_settings.event_text_func(pinged_unit, social_wheel_event_settings)

			localization_parameters = localization_parameters and LocalizeArray(localization_parameters)

			if localization_parameters then
				chat_message = string.format(Localize(event_text), unpack(localization_parameters))
			else
				chat_message = Localize(event_text)
			end
		else
			chat_message = Localize(social_wheel_event_settings.event_text)
		end
	end

	if not ping_icon then
		return
	end

	local function cb(id, widget)
		widget.content.icon = ping_icon
		widget.content.icon_pulse = ping_icon
		widget.content.text = chat_message or chat_messages and chat_messages[1]

		local player = Managers.player:owner(pinger_unit)
		local profile_index = player:profile_index()
		local career_index = player:career_index()
		local career = SPProfiles[profile_index].careers[career_index]
		local mechanism_name = Managers.mechanism:current_mechanism_name()
		local color

		if mechanism_name == "versus" then
			color = widget.content and widget.content.text == "MOVEMENT_GENERIC" and Colors.get_color_table_with_alpha("local_player_picking", 200) or Colors.get_color_table_with_alpha("opponent_team", 200)
		else
			color = Colors.get_color_table_with_alpha(career.display_name, 255) or Colors.color_definitions.white
		end

		widget.style.icon.color = table.clone(color)
		widget.style.icon_spawn_pulse.color = table.clone(color)
		widget.style.icon_spawn_pulse.default_color = widget.style.icon.color
		self._world_markers[pinger_unit] = {
			id = id,
			widget = widget,
		}
	end

	position = position or Unit.local_position(pinged_unit, 0)

	Managers.state.event:trigger("add_world_marker_position", "ping", position, cb)
end

PingSystem.remove_ping_from_unit = function (self, target_unit)
	if not self._pings_enabled then
		return
	end

	for pinger_unit, target in pairs(self._pinged_units) do
		if target_unit == target.pinged_unit then
			self:_remove_ping(pinger_unit)
		end
	end
end

PingSystem._remove_ping = function (self, pinger_unit, skip_sync)
	if not pinger_unit then
		return
	end

	local data = self._pinged_units[pinger_unit]
	local world_marker = self._world_markers[pinger_unit]
	local world_marker_id = world_marker and world_marker.id

	self._pinged_units[pinger_unit] = nil
	self._world_markers[pinger_unit] = nil

	if not data then
		return
	end

	if self.is_server and not skip_sync then
		local party = Managers.party:get_party(data.party_id)
		local pinger_unit_id = data.pinger_unit_id

		self.network_transmit:send_rpc_party_clients("rpc_remove_ping", party, true, pinger_unit_id)
	end

	local pinged_unit = data.pinged_unit

	if ALIVE[pinged_unit] then
		local ping_extension = ScriptUnit.has_extension(pinged_unit, "ping_system")

		if ping_extension and ping_extension.set_pinged and ping_extension:pinged() then
			local apply_outline = self:_is_outline_enabled(pinged_unit)

			ping_extension:set_pinged(false, nil, pinger_unit, apply_outline)
		end
	end

	local sender_player = Managers.player:unit_owner(pinger_unit)

	if sender_player and sender_player.local_player then
		Managers.state.event:trigger("boss_health_bar_clear_prioritized_unit", "ping")
	end

	if self._world_markers_enabled and world_marker_id then
		Managers.state.event:trigger("remove_world_marker", world_marker_id)
	end

	local child_pings = data.child_pings

	if child_pings then
		for i = 1, #child_pings do
			local child_pinger_unit = child_pings[i]

			self:_remove_ping(child_pinger_unit, skip_sync)
		end
	end
end

PingSystem.get_pinged_unit = function (self, owner_unit)
	local ping_data = self._pinged_units[owner_unit]

	return ping_data and Unit.alive(ping_data.pinged_unit) and ping_data.pinged_unit
end

PingSystem._is_outline_enabled = function (self, unit)
	if self._outlines_enabled.item and ScriptUnit.has_extension(unit, "pickup_system") and ScriptUnit.has_extension(unit, "interactable_system") then
		return true
	end

	return self._outlines_enabled.unit
end

PingSystem._play_ping_vo = function (self, pinger_unit, pinged_unit, ping_type, social_wheel_event_id)
	local event_data = FrameTable.alloc_table()
	local dialogue_input = ScriptUnit.extension_input(pinger_unit, "dialogue_system")

	event_data.is_ping = true

	if pinged_unit and Unit.alive(pinged_unit) then
		local vo_event_name
		local is_enemy = Managers.state.side:is_enemy(pinger_unit, pinged_unit)

		if is_enemy then
			local bb = BLACKBOARDS[pinged_unit]

			if bb then
				local breed = bb.breed
				local breed_name = breed.name
				local pinged_unit_pos = POSITION_LOOKUP[pinged_unit] or Unit.world_position(pinged_unit, 0)
				local pinged_unit_pos_flat = Vector3.flat(pinged_unit_pos)
				local pinger_unit_pos = POSITION_LOOKUP[pinger_unit]
				local pinger_unit_pos_flat = Vector3.flat(pinger_unit_pos)

				event_data.enemy_tag = breed_name
				event_data.enemy_unit = pinged_unit
				event_data.distance = Vector3.distance(pinged_unit_pos_flat, pinger_unit_pos_flat)

				dialogue_input:trigger_networked_dialogue_event("seen_enemy", event_data)
			end

			return
		end

		local status_extension = ScriptUnit.has_extension(pinged_unit, "status_system")

		if status_extension then
			local event = status_extension:disabled_vo_reason()

			if event then
				event_data.source_name = ScriptUnit.extension(pinger_unit, "dialogue_system").context.player_profile
				event_data.target_name = ScriptUnit.extension(pinged_unit, "dialogue_system").context.player_profile

				dialogue_input:trigger_networked_dialogue_event(event, event_data)
			end

			return
		end

		local lookat_tag = Unit.get_data(pinged_unit, "lookat_tag")

		if lookat_tag then
			event_data.item_tag = lookat_tag or Unit.debug_name(pinged_unit)

			dialogue_input:trigger_networked_dialogue_event("seen_item", event_data)

			return
		end
	else
		local vo_event_name

		if social_wheel_event_id and social_wheel_event_id ~= NetworkLookup.social_wheel_events["n/a"] then
			local social_wheel_event_name = NetworkLookup.social_wheel_events[social_wheel_event_id]
			local social_wheel_event_settings = SocialWheelSettingsLookup[social_wheel_event_name]

			vo_event_name = social_wheel_event_settings.vo_event_name
		end

		if not vo_event_name then
			if ping_type == PingTypes.ACKNOWLEDGE then
				vo_event_name = "vw_affirmative"
			elseif ping_type == PingTypes.CANCEL then
				vo_event_name = "vw_cancel"
			elseif ping_type == PingTypes.DENY then
				vo_event_name = "vw_negation"
			elseif ping_type == PingTypes.ENEMY_GENERIC then
				vo_event_name = "vw_attack_now"
			elseif ping_type == PingTypes.MOVEMENT_GENERIC then
				vo_event_name = "vw_go_here"
			elseif ping_type == PingTypes.PLAYER_PICK_UP_ACKNOWLEDGE then
				vo_event_name = "vw_answer_ping"
			else
				return
			end
		end

		if vo_event_name then
			dialogue_input:trigger_networked_dialogue_event(vo_event_name, event_data)
		end
	end
end

PingSystem.rpc_ping_unit = function (self, channel_id, pinger_unit_id, pinged_unit_id, is_level_unit, flash, ping_type, social_wheel_event_id)
	local pinger_unit = self._unit_storage:unit(pinger_unit_id)
	local pinged_unit = Managers.state.network:game_object_or_level_unit(pinged_unit_id, is_level_unit)
	local sender_player = Managers.player:unit_owner(pinger_unit)

	if not sender_player then
		return
	end

	local sender_unique_id = sender_player:unique_id()

	if self.is_server then
		ping_type = self:_get_unit_ping_type(pinged_unit, sender_unique_id, ping_type)

		local do_ping, chat_messages
		local ping_templates = MechanismOverrides.get(PingTemplates, self._current_mechanism_name)

		for _, data in pairs(ping_templates) do
			if data:check_func(pinger_unit, pinged_unit) then
				do_ping, chat_messages = data:exec_func(self, pinger_unit, pinged_unit, ping_type, social_wheel_event_id, self._current_mechanism_name)

				break
			end
		end

		if not do_ping then
			return
		end

		self:_handle_ping(ping_type, social_wheel_event_id, sender_player, pinger_unit, pinged_unit, nil, flash)
		self:_handle_chat(ping_type, social_wheel_event_id, sender_player, pinger_unit, pinged_unit, chat_messages)
	else
		if Managers.chat:ignoring_peer_id(sender_player.peer_id) then
			return
		end

		self:_handle_ping(ping_type, social_wheel_event_id, sender_player, pinger_unit, pinged_unit, nil, flash)
	end
end

PingSystem.rpc_ping_world_position = function (self, channel_id, pinger_unit_id, position, ping_type, social_wheel_event_id, is_double_press)
	local pinger_unit = self._unit_storage:unit(pinger_unit_id)
	local sender_player = Managers.player:unit_owner(pinger_unit)

	if not sender_player then
		return
	end

	if self.is_server then
		local new_position

		ping_type, new_position = self:_get_world_position_ping_type(ping_type, is_double_press)
		position = new_position and new_position or position

		local chat_messages
		local ping_templates = MechanismOverrides.get(PingTemplates, self._current_mechanism_name)

		for _, data in pairs(ping_templates) do
			if data:check_func(pinger_unit, nil) then
				_, chat_messages, _ = data:exec_func(self, pinger_unit, nil, ping_type, social_wheel_event_id, self._current_mechanism_name)

				break
			end
		end

		self:_handle_ping(ping_type, social_wheel_event_id, sender_player, pinger_unit, nil, position, nil)
		self:_handle_chat(ping_type, social_wheel_event_id, sender_player, pinger_unit, nil, chat_messages)
	else
		if Managers.chat:ignoring_peer_id(sender_player.peer_id) then
			return
		end

		self:_handle_ping(ping_type, social_wheel_event_id, sender_player, pinger_unit, nil, position, nil)
	end
end

PingSystem.rpc_social_message = function (self, channel_id, pinger_unit_id, social_wheel_event_id, pinged_unit_id)
	fassert(self.is_server, "Only server should get this")

	local pinger_unit = self._unit_storage:unit(pinger_unit_id)
	local pinged_unit = self._unit_storage:unit(pinged_unit_id)
	local sender_player = Managers.player:unit_owner(pinger_unit)

	self:_handle_chat(nil, social_wheel_event_id, sender_player, pinger_unit, pinged_unit)
end

PingSystem.rpc_remove_ping = function (self, channel_id, pinger_unit_id)
	if not self._pings_enabled then
		return
	end

	local pinger_unit = self._unit_storage:unit(pinger_unit_id)

	self:_remove_ping(pinger_unit)
end

PingSystem._play_sound = function (self, event)
	WwiseWorld.trigger_event(self._wwise_world, event)
end
