require("scripts/unit_extensions/default_player_unit/ping/context_aware_ping_extension")
require("scripts/unit_extensions/default_player_unit/ping/ping_target_extension")
require("scripts/settings/ping_templates")

local PING_DURATION = 15
local SELF_PING_DURATION = 5
local MAX_PING_RESPONSE_DISTANCE = 2
local DEBUG = false
local RPCS = {
	"rpc_ping_unit",
	"rpc_ping_world_position",
	"rpc_remove_ping",
	"rpc_social_message"
}
local extensions = {
	"ContextAwarePingExtension",
	"PingTargetExtension"
}
local WORLD_MARKER_CONTENT_LOOKUP = {
	"world_marker_response_1",
	"world_marker_response_2",
	"world_marker_response_3"
}
local WORLD_MARKER_ICON_LOOKUP = {
	"world_marker_icon_response_1",
	"world_marker_icon_response_2",
	"world_marker_icon_response_3"
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
	local settings = Managers.state.game_mode:settings()
	local ping_mode = settings.ping_mode

	if ping_mode then
		self._outlines_enabled = ping_mode.outlines
		self._world_markers_enabled = ping_mode.world_markers
	else
		self._outlines_enabled = {
			item = true,
			unit = true
		}
		self._world_markers_enabled = false
	end

	self._pings_enabled = self._outlines_enabled.item or self._outlines_enabled.unit or self._world_markers_enabled
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

				if t >= start_time + PING_DURATION then
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
		if not ALIVE[pinger_unit] then
			self:_remove_ping(pinger_unit)
		end
	end
end

PingSystem.hot_join_sync = function (self, sender)
	local pinged_units = self._pinged_units
	local network_manager = Managers.state.network
	local channel_id = PEER_ID_TO_CHANNEL[sender]

	for pinger_unit, data in pairs(pinged_units) do
		local pinged_unit = data.pinged_unit
		local pinger_unit_id = network_manager:unit_game_object_id(pinger_unit)
		local pinged_unit_id = pinged_unit and network_manager:unit_game_object_id(data.pinged_unit)
		local position = data.position

		if pinger_unit_id then
			if pinged_unit_id then
				RPC.rpc_ping_unit(channel_id, pinger_unit_id, pinged_unit_id, data.flash, data.ping_type, data.social_wheel_event_id)
			elseif position then
				RPC.rpc_ping_world_position(channel_id, pinger_unit_id, Vector3(unpack(position)), data.ping_type, data.social_wheel_event_id)
			end
		end
	end
end

PingSystem._handle_ping = function (self, ping_type, social_wheel_event_id, sender_player, pinger_unit, pinged_unit, position, flash, parent_pinger_unit)
	if self._pinged_units[pinger_unit] then
		self:_remove_ping(pinger_unit)
	end

	if pinged_unit and not ALIVE[pinged_unit] then
		return
	end

	if pinged_unit then
		local buff_ext = ScriptUnit.has_extension(pinged_unit, "buff_system")

		if buff_ext and buff_ext:has_buff_type("mutator_shadow_damage_reduction") then
			return
		end
	end

	if not ping_type or ping_type == PingTypes.CANCEL or ping_type == PingTypes.CHAT_ONLY then
		return
	end

	local world_marker_response_index = nil

	if parent_pinger_unit then
		local parent_data = self._pinged_units[parent_pinger_unit]

		if parent_data then
			local child_pings = parent_data.child_pings or {}
			child_pings[#child_pings + 1] = pinger_unit
			self._pinged_units[parent_pinger_unit].child_pings = child_pings
			local profile_index = sender_player:profile_index()
			local career_index = sender_player:career_index()
			local career = SPProfiles[profile_index].careers[career_index]
			local color = Colors.get_color_table_with_alpha(career.display_name, 255)
			local world_marker = self._world_markers[parent_pinger_unit]

			if world_marker then
				local widget = world_marker.widget
				local content = widget.content

				for i = 1, 3, 1 do
					local id = WORLD_MARKER_CONTENT_LOOKUP[i]

					if not content[id].show then
						world_marker_response_index = i

						break
					end
				end

				local icon_id = WORLD_MARKER_ICON_LOOKUP[world_marker_response_index]
				local style = widget.style[icon_id]
				style.color = table.clone(color)
				style.default_color = widget.style.icon.color
				local id = WORLD_MARKER_CONTENT_LOOKUP[world_marker_response_index]
				content[id] = {
					show = true,
					timer = 0
				}
			end
		end
	end

	local t = Managers.time:time("game")
	local party = sender_player:get_party()
	local network_manager = Managers.state.network
	local pinger_unit_id = network_manager:unit_game_object_id(pinger_unit)
	local pinged_unit_id = pinged_unit and network_manager:unit_game_object_id(pinged_unit)
	self._pinged_units[pinger_unit] = {
		start_time = t,
		pinged_unit = pinged_unit,
		flash = flash,
		party_id = party.party_id,
		pinger_unique_id = sender_player:unique_id(),
		pinger_unit_id = pinger_unit_id,
		pinged_unit_id = pinged_unit_id,
		ping_type = ping_type,
		parent_pinger_unit = parent_pinger_unit,
		world_marker_response_index = world_marker_response_index,
		position = position and {
			Vector3.to_elements(position)
		},
		social_wheel_event_id = social_wheel_event_id
	}

	Managers.telemetry.events:ping_used(sender_player, parent_pinger_unit == nil, table.find(PingTypes, ping_type), pinged_unit, POSITION_LOOKUP[pinger_unit])

	if self.is_server then
		if pinged_unit then
			self.network_transmit:send_rpc_party_clients("rpc_ping_unit", party, true, pinger_unit_id, pinged_unit_id, flash, ping_type, social_wheel_event_id)
		elseif position then
			self.network_transmit:send_rpc_party_clients("rpc_ping_world_position", party, true, pinger_unit_id, position, ping_type, social_wheel_event_id)
		end
	end

	if not DEDICATED_SERVER then
		local local_player = Managers.player:local_player()
		local unique_player_id = local_player:unique_id()

		if Managers.party:is_player_in_party(unique_player_id, party.party_id) then
			if pinged_unit then
				self:_add_unit_ping(pinger_unit, pinged_unit, flash, ping_type)
			end

			if self._world_markers_enabled then
				self:_add_world_marker(pinger_unit, pinged_unit, position, ping_type, social_wheel_event_id)
			end

			local event = (pinged_unit and Unit.get_data(pinged_unit, "breed") and "hud_ping_enemy") or "hud_ping"

			self:_play_sound(event)
		end
	end
end

PingSystem._handle_chat = function (self, ping_type, social_wheel_event_id, sender_player, pinger_unit, pinged_unit, chat_messages)
	if ping_type == PingTypes.PING_ONLY then
		return
	end

	local event_text, localization_parameters, social_wheel_event_settings = nil
	local valid_social_wheel_id = social_wheel_event_id and social_wheel_event_id ~= NetworkLookup.social_wheel_events["n/a"]

	if valid_social_wheel_id then
		local social_wheel_event_name = NetworkLookup.social_wheel_events[social_wheel_event_id]
		social_wheel_event_settings = SocialWheelSettingsLookup[social_wheel_event_name]

		if PLATFORM ~= "win32" then
			local party = sender_player:get_party()
			local pinged_unit_id = (pinged_unit and Managers.state.network:unit_game_object_id(pinged_unit)) or 0
			local include_spectators = true

			self.network_transmit:send_rpc_party("rpc_social_wheel_event", party, include_spectators, sender_player.peer_id, social_wheel_event_id, pinged_unit_id)
		else
			local text_func = social_wheel_event_settings.event_text_func
			local text = social_wheel_event_settings.event_text
			localization_parameters = nil
			event_text = text

			if text_func and pinged_unit then
				event_text, localization_parameters = text_func(pinged_unit, social_wheel_event_settings)
			end

			if not event_text and chat_messages then
				event_text = chat_messages[math.random(1, #chat_messages)]
			end
		end
	elseif chat_messages then
		event_text = chat_messages[math.random(1, #chat_messages)]
	end

	if event_text then
		local localize = true
		local localize_parameters = true
		local channel_id = 1
		local message_target = nil
		local mechanism = Managers.mechanism:game_mechanism()

		if mechanism.get_chat_channel then
			channel_id, message_target = mechanism:get_chat_channel(sender_player, false)
		end

		Managers.chat:send_chat_message(channel_id, sender_player:local_player_id(), event_text, localize, localization_parameters, localize_parameters, nil, message_target, nil, nil, sender_player.peer_id)
	end

	if valid_social_wheel_id then
		local execute_func = social_wheel_event_settings.execute_func

		if execute_func then
			local social_wheel_category = SocialWheelSettings[social_wheel_event_settings.category_name]

			execute_func(social_wheel_event_settings.data, pinged_unit, sender_player, social_wheel_category)
		end
	end

	if self.is_server and self._world_markers_enabled then
		self:_play_ping_vo(pinger_unit, ping_type, social_wheel_event_id)
	end
end

PingSystem.is_ping_response = function (self, pinged_unit, sender_unique_id, position, sent_ping_type)
	if not self._world_markers_enabled then
		return
	end

	local sent_ping_is_context = not sent_ping_type or sent_ping_type == PingTypes.CONTEXT

	if pinged_unit then
		for pinger_unit, data in pairs(self._pinged_units) do
			local ping_type = data.ping_type
			local pinger_unique_id = data.pinger_unique_id

			if pinged_unit == data.pinged_unit then
				if sender_unique_id == data.pinger_unique_id then
					return (sent_ping_is_context and PingTypes.CANCEL) or sent_ping_type, nil, pinger_unit
				elseif data.parent_pinger_unit == nil then
					local return_ping_type = nil

					if sent_ping_is_context then
						return_ping_type = (data.ping_type == PingTypes.PLAYER_PICK_UP and PingTypes.PLAYER_PICK_UP_ACKNOWLEDGE) or PingTypes.ACKNOWLEDGE
					else
						return_ping_type = sent_ping_type
					end

					return return_ping_type, nil, pinger_unit
				end
			end
		end
	end

	if position then
		local return_ping_type, existing_position, return_pinger_unit = nil

		for pinger_unit, data in pairs(self._pinged_units) do
			existing_position = (data.position and Vector3(unpack(data.position))) or POSITION_LOOKUP[data.pinged_unit]
			local distance = Vector3.distance_squared(existing_position, position)

			if distance <= MAX_PING_RESPONSE_DISTANCE then
				if sender_unique_id == data.pinger_unique_id then
					return (sent_ping_is_context and PingTypes.CANCEL) or sent_ping_type, existing_position, nil
				elseif data.parent_pinger_unit == nil then
					return_ping_type = (sent_ping_is_context and PingTypes.ACKNOWLEDGE) or sent_ping_type
					return_pinger_unit = pinger_unit
				end
			end
		end

		return return_ping_type, position, return_pinger_unit
	end
end

PingSystem._get_unit_ping_type = function (self, pinged_unit, sender_unique_id, sent_ping_type)
	if not self._world_markers_enabled then
		return sent_ping_type
	end

	local ping_type, _, pinger_unit = self:is_ping_response(pinged_unit, sender_unique_id, nil, sent_ping_type)

	if ping_type then
		return ping_type, pinger_unit
	end

	if sent_ping_type == PingTypes.ACKNOWLEDGE or sent_ping_type == PingTypes.DENY then
		return nil, nil, nil
	end

	if sent_ping_type == PingTypes.CONTEXT then
		if not pinged_unit or not ALIVE[pinged_unit] then
			return PingTypes.MOVEMENT_GENERIC, nil
		end

		if ScriptUnit.has_extension(pinged_unit, "pickup_system") then
			return PingTypes.PLAYER_PICK_UP, nil
		end

		local sender_party = Managers.party:get_party_from_unique_id(sender_unique_id)
		local side_manager = Managers.state.side
		local sender_side = side_manager.side_by_party[sender_party]
		local pinged_side = side_manager.side_by_unit[pinged_unit]

		if side_manager:is_enemy_by_side(sender_side, pinged_side) then
			return PingTypes.ENEMY_GENERIC, nil
		end

		return PingTypes.PLAYER_HELP, nil
	end

	return sent_ping_type, nil
end

PingSystem._get_world_position_ping_type = function (self, position, sender_unique_id, sent_ping_type)
	local ping_type, new_position, pinger_unit = self:is_ping_response(nil, sender_unique_id, position, sent_ping_type)

	if ping_type then
		return ping_type, new_position, pinger_unit
	end

	if sent_ping_type == PingTypes.ACKNOWLEDGE or sent_ping_type == PingTypes.DENY then
		return sent_ping_type, nil, nil
	end

	if sent_ping_type == PingTypes.CONTEXT then
		return PingTypes.MOVEMENT_GENERIC, nil, nil
	end

	return sent_ping_type, nil, nil
end

PingSystem._add_unit_ping = function (self, pinger_unit, pinged_unit, flash, ping_type)
	local do_ping, chat_messages, ping_icon = nil

	for _, data in pairs(PingTemplates) do
		if data:check_func(pinger_unit, pinged_unit) then
			do_ping, chat_messages, ping_icon = data:exec_func(self, pinger_unit, pinged_unit, ping_type)

			break
		end
	end

	if not do_ping then
		return
	end

	local ping_extension = ScriptUnit.extension(pinged_unit, "ping_system")

	if ping_extension.set_pinged then
		local apply_outline = self:_is_outline_enabled(pinged_unit)

		ping_extension:set_pinged(true, flash, pinger_unit, apply_outline)
	end

	local breed = Unit.get_data(pinged_unit, "breed")

	if breed and breed.boss then
		Managers.state.event:trigger("show_boss_health_bar", pinged_unit)
	end
end

PingSystem._add_world_marker = function (self, pinger_unit, pinged_unit, position, ping_type, social_wheel_event_id)
	local do_ping, chat_messages, chat_message, ping_icon = nil

	for _, data in pairs(PingTemplates) do
		if data:check_func(pinger_unit, pinged_unit) then
			do_ping, chat_messages, ping_icon = data:exec_func(self, pinger_unit, pinged_unit, ping_type)

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
			chat_message = string.format(Localize(event_text), localization_parameters and unpack(localization_parameters))
		else
			chat_message = Localize(social_wheel_event_settings.event_text)
		end
	end

	if not ping_icon then
		print("[PingSystem] Missing world marker icon")

		return
	end

	local function cb(id, widget)
		widget.content.icon = ping_icon
		widget.content.icon_pulse = ping_icon
		widget.content.text = chat_message or (chat_messages and chat_messages[1])
		local player = Managers.player:owner(pinger_unit)
		local profile_index = player:profile_index()
		local career_index = player:career_index()
		local career = SPProfiles[profile_index].careers[career_index]
		local color = Colors.get_color_table_with_alpha(career.display_name, 255)
		widget.style.icon.color = table.clone(color)
		widget.style.icon_spawn_pulse.color = table.clone(color)
		widget.style.icon_spawn_pulse.default_color = widget.style.icon.color
		self._world_markers[pinger_unit] = {
			id = id,
			widget = widget
		}
	end

	position = (position and position) or POSITION_LOOKUP[pinged_unit]

	Managers.state.event:trigger("add_world_marker_position", "ping", position, cb)
end

PingSystem.remove_ping_from_unit = function (self, target_unit)
	if not self._pings_enabled then
		return
	end

	for pinger_unit, target in pairs(self._pinged_units) do
		if target_unit == target.pinged_unit then
			self:_remove_ping(pinger_unit)

			return
		end
	end
end

PingSystem._remove_ping = function (self, pinger_unit)
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

	if self.is_server then
		local party = Managers.party:get_party(data.party_id)
		local pinger_unit_id = data.pinger_unit_id

		self.network_transmit:send_rpc_party_clients("rpc_remove_ping", party, true, pinger_unit_id)
	end

	local pinged_unit = data.pinged_unit

	if ALIVE[pinged_unit] then
		local ping_extension = ScriptUnit.extension(pinged_unit, "ping_system")

		if ping_extension.set_pinged and ping_extension:pinged() then
			local apply_outline = self:_is_outline_enabled(pinged_unit)

			ping_extension:set_pinged(false, nil, nil, apply_outline)
		end
	end

	if self._world_markers_enabled and world_marker_id then
		Managers.state.event:trigger("remove_world_marker", world_marker_id)
	end

	local child_pings = data.child_pings

	if child_pings then
		for i = 1, #child_pings, 1 do
			local child_pinger_unit = child_pings[i]

			self:_remove_ping(child_pinger_unit)
		end
	elseif data.parent_pinger_unit then
		local world_marker = self._world_markers[data.parent_pinger_unit]

		if world_marker then
			local widget = world_marker.widget
			local world_marker_response_index = data.world_marker_response_index
			local id = WORLD_MARKER_CONTENT_LOOKUP[world_marker_response_index]
			widget.content[id].show = false
		end
	end
end

PingSystem._is_outline_enabled = function (self, unit)
	if self._outlines_enabled.item and ScriptUnit.has_extension(unit, "pickup_system") and ScriptUnit.has_extension(unit, "interactable_system") then
		return true
	end

	return self._outlines_enabled.unit
end

PingSystem._play_ping_vo = function (self, pinger_unit, ping_type, social_wheel_event_id)
	local vo_event_name = nil

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
		local event_data = FrameTable.alloc_table()
		event_data.is_ping = true
		local dialogue_input = ScriptUnit.extension_input(pinger_unit, "dialogue_system")

		dialogue_input:trigger_networked_dialogue_event(vo_event_name, event_data)
	end
end

PingSystem.rpc_ping_unit = function (self, channel_id, pinger_unit_id, pinged_unit_id, flash, ping_type, social_wheel_event_id)
	local pinger_unit = self._unit_storage:unit(pinger_unit_id)
	local pinged_unit = self._unit_storage:unit(pinged_unit_id)
	local sender_player = Managers.player:unit_owner(pinger_unit)
	local sender_unique_id = sender_player:unique_id()

	if self.is_server then
		local parent_pinger_unit = nil
		ping_type, parent_pinger_unit = self:_get_unit_ping_type(pinged_unit, sender_unique_id, ping_type)
		local do_ping, chat_messages, ping_icon = nil

		for _, data in pairs(PingTemplates) do
			if data:check_func(pinger_unit, pinged_unit) then
				do_ping, chat_messages, ping_icon = data:exec_func(self, pinger_unit, pinged_unit, ping_type)

				break
			end
		end

		if not do_ping then
			return
		end

		self:_handle_ping(ping_type, social_wheel_event_id, sender_player, pinger_unit, pinged_unit, nil, flash, parent_pinger_unit)
		self:_handle_chat(ping_type, social_wheel_event_id, sender_player, pinger_unit, pinged_unit, chat_messages)
	else
		if Managers.chat:ignoring_peer_id(sender_player.peer_id) then
			return
		end

		local _, _, parent_pinger_unit = self:is_ping_response(pinged_unit, sender_unique_id, nil, ping_type)

		self:_handle_ping(ping_type, social_wheel_event_id, sender_player, pinger_unit, pinged_unit, nil, flash, parent_pinger_unit)
	end
end

PingSystem.rpc_ping_world_position = function (self, channel_id, pinger_unit_id, position, ping_type, social_wheel_event_id)
	local pinger_unit = self._unit_storage:unit(pinger_unit_id)
	local sender_player = Managers.player:unit_owner(pinger_unit)
	local sender_unique_id = sender_player:unique_id()

	if self.is_server then
		local parent_pinger_unit, new_position = nil
		ping_type, new_position, parent_pinger_unit = self:_get_world_position_ping_type(position, sender_unique_id, ping_type)

		if new_position then
			position = new_position or position
		end

		local chat_messages = nil

		for _, data in pairs(PingTemplates) do
			if data:check_func(pinger_unit, nil) then
				_, chat_messages, _ = data:exec_func(self, pinger_unit, nil, ping_type)

				break
			end
		end

		self:_handle_ping(ping_type, social_wheel_event_id, sender_player, pinger_unit, nil, position, nil, parent_pinger_unit)
		self:_handle_chat(ping_type, social_wheel_event_id, sender_player, pinger_unit, nil, chat_messages)
	else
		if Managers.chat:ignoring_peer_id(sender_player.peer_id) then
			return
		end

		local _, _, parent_pinger_unit = self:is_ping_response(nil, sender_unique_id, position, ping_type)

		self:_handle_ping(ping_type, social_wheel_event_id, sender_player, pinger_unit, nil, position, nil, parent_pinger_unit)
	end
end

PingSystem.rpc_social_message = function (self, channel_id, pinger_unit_id, social_wheel_event_id)
	fassert(self.is_server, "Only server should get this")

	local pinger_unit = self._unit_storage:unit(pinger_unit_id)
	local sender_player = Managers.player:unit_owner(pinger_unit)

	self:_handle_chat(nil, social_wheel_event_id, sender_player, pinger_unit)
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

return
