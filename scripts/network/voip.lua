-- chunkname: @scripts/network/voip.lua

local function voip_info_print(...)
	local always_print = true

	if script_data.debug_voip or always_print then
		printf(...)
	end
end

local function voip_warning_print(...)
	Application.warning(...)
end

Voip = class(Voip)

local TALKING_THRESHOLD = -65
local has_steam = rawget(_G, "Steam") and rawget(_G, "Steam").connected() and not Development.parameter("use_lan_backend")
local disable_voip = Development.parameter("disable_voip")

if has_steam and not disable_voip or DEDICATED_SERVER then
	require("scripts/ui/views/voice_chat_ui")

	Voip.init = function (self, is_server, _unused_network_lobby_)
		self._own_peer_id = Network.peer_id()

		self:_ensure_voip_set_up()
		voip_info_print("[Voip] Initializing Steam Voip")

		self._is_server = is_server

		local world_name = "voip_world"
		local shading_callback, layer
		local world = Managers.world:create_world(world_name, GameSettingsDevelopment.default_environment, shading_callback, layer, Application.DISABLE_PHYSICS, Application.DISABLE_APEX_CLOTH, Application.DISABLE_RENDERING)

		self._world = world
		self._wwise_world = Wwise.wwise_world(world)
		self._member_buffer = {}
		self._voip_rooms = {}
		self._voip_room_by_peer = {}
		self._added_members = {}
		self._muted_peers = {}
		self._peer_playing_id = {}
		self._push_to_talk = Application.user_setting("voip_push_to_talk")
		self._push_to_talk_active = false
		self._enabled = Application.user_setting("voip_is_enabled")

		self:_create_gui()
		Managers.persistent_event:register(self, "on_player_joined_party", "peer_joined_party")
	end

	Voip.set_input_manager = function (self, input_manager)
		self._input_manager = input_manager

		if self._voice_chat_ui then
			self._voice_chat_ui:set_input_manager(input_manager)
		end
	end

	Voip._create_gui = function (self, own_peer_id)
		local top_world = Managers.world:world("top_ingame_view")

		self._ui_top_renderer = UIRenderer.create(top_world, "material", "materials/ui/ui_1080p_voice_chat", "material", "materials/fonts/gw_fonts")

		local context = {
			player_manager = Managers.player,
			ui_top_renderer = self._ui_top_renderer,
			voip = self,
		}

		self._voice_chat_ui = VoiceChatUI:new(context)

		self._voice_chat_ui:set_input_manager(Managers.input)
	end

	local members_in_own_room = {}

	Voip.members_in_own_room = function (self)
		table.clear(members_in_own_room)

		local peer_room = self._own_voip_room_id

		if not peer_room then
			return members_in_own_room
		end

		SteamVoipClient.members(self._own_voip_client, members_in_own_room)

		return members_in_own_room
	end

	Voip.register_rpcs = function (self, network_event_delegate, network_transmit)
		self._network_transmit = network_transmit
		self._network_event_delegate = network_event_delegate

		network_event_delegate:register(self, "rpc_voip_room_to_join", "rpc_voip_room_request", "room_member_removed")
		network_event_delegate:register_with_return(self, "room_member_added")
	end

	Voip.unregister_rpcs = function (self)
		self._network_event_delegate:unregister(self)

		self._network_event_delegate = nil
		self._network_transmit = nil
	end

	Voip.room_member_removed = function (self, callback_object, room_id, peer_id)
		if not peer_id then
			voip_warning_print("[Voip] Got engine callback to remove peer in room %s but peer was nil", room_id)

			return
		end

		self._added_members[peer_id] = nil

		local playing_id = self._peer_playing_id[peer_id]

		if playing_id ~= nil then
			WwiseWorld.stop_voip_output(self._wwise_world, playing_id)

			self._peer_playing_id[peer_id] = nil
		end
	end

	Voip.room_member_added = function (self, room_id, peer_id)
		voip_info_print("[Voip] Peer %s joined room %s (my room id %q)", peer_id, room_id, self._own_voip_room_id)

		self._added_members[peer_id] = true

		local playing_id = WwiseWorld.start_voip_output(self._wwise_world, "Play_voip")

		self._peer_playing_id[peer_id] = playing_id

		return playing_id
	end

	Voip.rpc_voip_room_request = function (self, channel_id, enter)
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		assert(self._is_server, "[Voip] Got request from %s to %s but is not server", peer_id, enter and "enter" or "leave")

		local party = Managers.party:get_party_from_player_id(peer_id, 1)

		if not party or party.party_id == 0 then
			return
		end

		local party_id = party.party_id

		if self:_is_peer_in_party_room(peer_id, party_id) then
			return
		end

		self:_remove_peer_from_room(peer_id)
		self:_ensure_voip_room_set_up(party_id)

		if enter then
			self:_add_peer_to_room(peer_id, party_id)
		end
	end

	Voip.rpc_voip_room_to_join = function (self, channel_id, room_id)
		local host_peer_id = CHANNEL_TO_PEER_ID[channel_id]

		if self:_is_in_room() then
			voip_warning_print("[Voip] Received rpc 'rpc_voip_room_to_join' from host %s but we're already in a room.", host_peer_id)

			return
		end

		voip_info_print("[Voip] Joining room %s (host %q) as %s.", room_id, host_peer_id, host_peer_id == self._own_peer_id and "host" or "client")

		self._room_host = host_peer_id
		self._own_voip_room_id = room_id

		local voip_client = SteamVoip.join_room(host_peer_id, room_id)

		self._voip_room_by_peer[self._own_peer_id] = room_id
		self._own_voip_client = voip_client

		SteamVoipClient.select_out(voip_client, true)
		SteamVoipClient.select_in(voip_client, true)
		self:_update_push_to_talk(true)
	end

	Voip.destroy = function (self)
		voip_info_print("[Voip] Destroying VOIP.")
		self:_tear_down()

		self.room_member_removed = nil
		self.room_member_added = nil

		if self._world then
			Managers.world:destroy_world(self._world)
		end

		self:_destroy_voice_chat_ui()
		Managers.persistent_event:unregister("on_player_joined_party", self)
	end

	Voip._destroy_voice_chat_ui = function (self)
		self._voice_chat_ui:destroy()

		self._voice_chat_ui = nil

		local top_world = Managers.world:world("top_ingame_view")

		UIRenderer.destroy(self._ui_top_renderer, top_world)

		self._ui_top_renderer = nil
	end

	Voip.update = function (self, dt, t)
		self:_debug_voip(t)

		if not self._voip_set_up then
			return
		end

		if self._own_voip_client then
			if SteamVoipClient.broken_host(self._own_voip_client) then
				voip_warning_print("[STEAM VOIP]: Connection to host %q broken. Leaving room.", tostring(self._room_host))
				self:_ensure_left_voip_room()
			else
				for peer_id, _ in pairs(self._added_members) do
					if not self._muted_peers[peer_id] then
						self:unmute_member(peer_id)
					end

					local mute_out = self._push_to_talk and not self._push_to_talk_active

					if mute_out then
						voip_info_print("[Voip] Muting voip out for %q due to push_to_talk", peer_id)
						SteamVoipClient.select_out(self._own_voip_client, false, peer_id)
					end

					self._added_members[peer_id] = nil
				end

				self:_update_push_to_talk(false)
			end
		end

		if self._is_server then
			for party_id, room_id in pairs(self._voip_rooms) do
				local broken_members = SteamVoipRoom.broken_members(room_id)

				if broken_members then
					for _, peer_id in pairs(broken_members) do
						voip_info_print("[Voip] Removing broken voip member: %q", tostring(peer_id))
						self:_remove_peer_from_room(peer_id)

						if self._own_voip_room_id == room_id then
							SteamVoipClient.select_out(self._own_voip_client, false, peer_id)
							SteamVoipClient.select_in(self._own_voip_client, false, peer_id)
						end
					end
				end
			end

			if self:_is_in_room() then
				local member_buffer, member_count = SteamVoipRoom.members(self._own_voip_room_id, self._member_buffer)

				for i = 1, member_count do
					local peer_id = member_buffer[i]

					if peer_id ~= self._own_peer_id and PEER_ID_TO_CHANNEL[peer_id] == nil then
						voip_info_print("[Voip] Removing voip member due to not having a connection to it: %q", tostring(peer_id))
						self:_remove_peer_from_room(peer_id)
						SteamVoipClient.select_out(self._own_voip_client, false, peer_id)
						SteamVoipClient.select_in(self._own_voip_client, false, peer_id)
					end
				end
			end
		end

		if not DEDICATED_SERVER then
			self._voice_chat_ui:update(dt)
		end
	end

	Voip._debug_voip = function (self, t)
		if script_data.debug_voip and not DEDICATED_SERVER then
			if self._own_voip_client then
				Debug.text("VoIP")
				Debug.text("VoIP - PushToTalk %s (%s)", self._push_to_talk and "on" or "off", self._push_to_talk_active and "pushing" or "-")
				Debug.text("VoIP - Client members")

				for peer_index, peer_id in pairs(SteamVoipClient.members(self._own_voip_client)) do
					local level = SteamVoipClient.audio_level(self._own_voip_client, peer_id)

					Debug.text("%s [%s] %s", tostring(peer_index), tostring(peer_id), level)
				end

				if self._is_server then
					for party_id, room_id in pairs(self._voip_rooms) do
						Debug.text("VoIP - Room members %s", room_id)

						for peer_index, peer_id in pairs(SteamVoipRoom.members(room_id)) do
							if room_id == self._own_voip_room_id then
								local speaking = self:is_talking(peer_id)

								self._debug_talking_delay = self._debug_talking_delay or {}

								if speaking then
									self._debug_talking_delay[peer_id] = t + 0.3
								elseif t > (self._debug_talking_delay[peer_id] or math.huge) then
									self._debug_talking_delay[peer_id] = nil
								end

								speaking = (not self._push_to_talk or self._push_to_talk_active) and not not self._debug_talking_delay[peer_id]

								Debug.text("[%s] Speaking: %s", peer_id, speaking and "Yes" or "No")
							else
								Debug.text("[%s] In another room", peer_id)
							end
						end
					end
				end
			else
				Debug.text("VoIP - disabled")
			end
		end
	end

	Voip._update_push_to_talk = function (self, force_update)
		local input_service = Managers.input:get_service("chat_input")
		local push_to_talk_active = self._push_to_talk and not not input_service and not not input_service:get("voip_push_to_talk")

		push_to_talk_active = push_to_talk_active and not Managers.chat:chat_is_focused()

		if push_to_talk_active ~= self._push_to_talk_active or force_update then
			self._push_to_talk_active = push_to_talk_active

			local should_be_heard = not self._push_to_talk or push_to_talk_active

			for index, member_peer_id in pairs(SteamVoipClient.members(self._own_voip_client)) do
				if not self._muted_peers[member_peer_id] then
					SteamVoipClient.select_out(self._own_voip_client, should_be_heard, member_peer_id)
					voip_info_print("[Voip] %s voip out for %s due to %s", should_be_heard and "unmuting" or "muting", member_peer_id, self._push_to_talk and "push_to_talk" or "push_to_talk not being active")
				end
			end
		end
	end

	Voip.mute_member = function (self, member)
		if self._own_voip_client == nil then
			return
		end

		self._muted_peers[member] = true

		local members = SteamVoipClient.members(self._own_voip_client)

		if table.contains(members, member) then
			voip_info_print("[Voip] Muting voip member: %q", tostring(member))
			SteamVoipClient.select_out(self._own_voip_client, false, member)
			SteamVoipClient.select_in(self._own_voip_client, false, member)
		end
	end

	Voip.unmute_member = function (self, member)
		if self._own_voip_client == nil then
			return
		end

		self._muted_peers[member] = nil

		local members = SteamVoipClient.members(self._own_voip_client)

		if table.contains(members, member) then
			voip_info_print("[Voip] Unmuting voip member: %q", tostring(member))
			SteamVoipClient.select_out(self._own_voip_client, true, member)
			SteamVoipClient.select_in(self._own_voip_client, true, member)
		end

		self:_update_push_to_talk(true)
	end

	Voip.peer_muted = function (self, peer_id)
		return self._muted_peers[peer_id]
	end

	Voip._ensure_left_voip_room = function (self, is_destroy)
		if not self:_is_in_room() then
			return
		end

		voip_info_print("[Voip] Leaving VOIP room %s", self._own_voip_room_id)

		for peer_id, playing_id in pairs(self._peer_playing_id) do
			WwiseWorld.stop_voip_output(self._wwise_world, playing_id)
		end

		table.clear(self._peer_playing_id)
		SteamVoip.leave_room(self._own_voip_client)

		self._room_host = nil
		self._own_voip_room_id = nil
		self._own_voip_client = nil
		self._voip_room_by_peer[self._own_peer_id] = nil

		if self._is_server then
			self:rpc_voip_room_request(PEER_ID_TO_CHANNEL[self._own_peer_id], false)
		elseif self._network_transmit then
			self._network_transmit:send_rpc_server("rpc_voip_room_request", false)
		end
	end

	Voip._join_voip_room = function (self)
		if self:_is_in_room() then
			return
		end

		if self._is_server then
			self:rpc_voip_room_request(PEER_ID_TO_CHANNEL[self._own_peer_id], true)
		elseif self._network_transmit then
			voip_info_print("[Voip] Asking server to join a voip room")
			self._network_transmit:send_rpc_server("rpc_voip_room_request", true)
		end
	end

	Voip.set_volume = function (self, voip_bus_volume)
		assert(voip_bus_volume >= 0 and voip_bus_volume <= 100)
		WwiseWorld.set_global_parameter(self._wwise_world, "voip_bus_volume", voip_bus_volume)
	end

	Voip.set_enabled = function (self, enabled)
		if not self._own_peer_id then
			return
		end

		self._enabled = enabled

		if enabled then
			self:_join_voip_room()
		else
			self:_ensure_left_voip_room()
		end
	end

	Voip.set_push_to_talk = function (self, push_to_talk)
		self._push_to_talk = push_to_talk

		if self._own_voip_client then
			for index, member_peer_id in pairs(SteamVoipClient.members(self._own_voip_client)) do
				SteamVoipClient.select_out(self._own_voip_client, not push_to_talk, member_peer_id)
			end
		end
	end

	Voip.is_talking = function (self, peer_id)
		if not self._own_voip_client then
			return false
		end

		if peer_id == self._own_peer_id then
			local audio_recording = SteamVoipClient.audio_recording(self._own_voip_client)

			return audio_recording
		else
			local audio_level = SteamVoipClient.audio_level(self._own_voip_client, peer_id)

			return audio_level > TALKING_THRESHOLD
		end
	end

	Voip.is_push_to_talk_active = function (self)
		return self._push_to_talk and self._push_to_talk_active
	end

	Voip.push_to_talk_enabled = function (self)
		return self._push_to_talk
	end

	Voip.audio_level = function (self, peer_id)
		local audio_level = SteamVoipClient.audio_level(self._own_voip_client, peer_id)

		return audio_level
	end

	Voip._tear_down = function (self)
		if not self._voip_set_up then
			return
		end

		voip_info_print("[Voip] Resetting Voip")
		self:_ensure_left_voip_room()

		local voip_rooms = self._voip_rooms

		if voip_rooms then
			for party_id, voip_room in pairs(voip_rooms) do
				SteamVoip.destroy_room(voip_room)
			end

			table.clear(voip_rooms)
		end

		self._voip_set_up = false

		SteamVoip.shutdown()
	end

	Voip._ensure_voip_set_up = function (self)
		if self._voip_set_up then
			return
		end

		self._voip_set_up = true

		SteamVoip.setup()

		self._voip_rooms = {}
		self._voip_room_by_peer = {}
	end

	Voip._ensure_voip_room_set_up = function (self, party_id)
		if not self._is_server or self._voip_rooms[party_id] then
			return
		end

		local voip_room = SteamVoip.create_room()

		self._voip_rooms[party_id] = voip_room
	end

	Voip._is_in_room = function (self)
		return self._own_voip_room_id
	end

	local voip_room_members = {}

	Voip._remove_peer_from_room = function (self, peer_id)
		local current_room = self._voip_room_by_peer[peer_id]

		if current_room then
			voip_info_print("[Voip] Removing voip member %s from room %s", peer_id, current_room)
			table.clear(voip_room_members)
			SteamVoipRoom.members(current_room, voip_room_members)

			local member_is_in_room = table.find(voip_room_members, peer_id)

			if member_is_in_room then
				SteamVoipRoom.remove_member(current_room, peer_id)

				self._voip_room_by_peer[peer_id] = nil
			end

			SteamVoipRoom.members(current_room, voip_room_members)

			if table.is_empty(voip_room_members) then
				SteamVoip.destroy_room(current_room)

				local party_id = table.find(self._voip_rooms, current_room)

				self._voip_rooms[party_id] = nil
			end

			if table.is_empty(self._voip_rooms) then
				-- Nothing
			end
		end
	end

	Voip._add_peer_to_room = function (self, peer_id, party_id)
		assert(self._is_server, "[Voip] '_add_peer_to_room' is a server only function")

		local room_id = self._voip_rooms[party_id]

		voip_info_print("[Voip] Adding voip member %s to to room %s", peer_id, room_id)

		if peer_id == self._own_peer_id then
			self:rpc_voip_room_to_join(PEER_ID_TO_CHANNEL[peer_id], room_id)
		else
			local room_members = SteamVoipRoom.members(room_id)
			local member_is_in_room = table.find(room_members, peer_id)

			if not member_is_in_room then
				self._voip_room_by_peer[peer_id] = room_id

				SteamVoipRoom.add_member(room_id, peer_id)
			end

			self._network_transmit:send_rpc("rpc_voip_room_to_join", peer_id, tostring(room_id))
		end
	end

	Voip.peer_joined_party = function (self, peer_id, local_player_id, party_id, slot_id, is_bot)
		if party_id == 0 or is_bot then
			return
		end

		if self:_is_peer_in_party_room(peer_id, party_id) then
			return
		end

		if self._is_server then
			self:_remove_peer_from_room(peer_id)
		end

		local is_local = peer_id == self._own_peer_id

		if is_local then
			self:_ensure_left_voip_room(peer_id)

			if self._enabled then
				self:_join_voip_room()
			end
		end
	end

	Voip._is_peer_in_party_room = function (self, peer_id, party_id)
		local peer_room = self._voip_room_by_peer[peer_id]

		return peer_room ~= nil and peer_room == self._voip_rooms[party_id]
	end

	Voip.peer_disconnected = function (self, peer_id)
		if self._is_server then
			self:_remove_peer_from_room(peer_id)
		end
	end
else
	Voip.init = function (self)
		return
	end

	Voip.set_input_manager = function (self, input_manager)
		return
	end

	Voip.destroy = function (self)
		return
	end

	Voip.register_rpcs = function (self)
		return
	end

	Voip.unregister_rpcs = function (self)
		return
	end

	Voip.mute_member = function (self)
		return
	end

	Voip.unmute_member = function (self)
		return
	end

	Voip.update = function (self)
		return
	end

	Voip.peer_muted = function (self)
		return
	end

	Voip.set_volume = function (self)
		return
	end

	Voip.set_enabled = function (self)
		return
	end

	Voip.set_push_to_talk = function (self)
		return
	end

	Voip.is_talking = function (self)
		return
	end

	Voip.audio_level = function (self)
		return -96
	end

	Voip.push_to_talk_enabled = function (self)
		return
	end

	Voip.is_push_to_talk_active = function (self)
		return
	end

	Voip.peer_joined_party = function (self)
		return
	end

	local empty_table = {}

	Voip.members_in_own_room = function (self)
		return empty_table
	end

	Voip._tear_down = function (self)
		return
	end

	Voip.peer_disconnected = function (self)
		return
	end
end
