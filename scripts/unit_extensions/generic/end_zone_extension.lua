require("scripts/settings/end_zone_settings")

EndZoneExtension = class(EndZoneExtension)

EndZoneExtension.init = function (self, extension_init_context, unit)
	self._unit = unit
	self._world = extension_init_context.world
	self._extension_init_context = extension_init_context
	self._activated = false
	self._activation_allowed = false
	self._closest_player = math.huge
	self._state = "_idle"
	self._is_server = extension_init_context.is_server
	self._state_data = {}
	self._player_distances = {}
	self._current_volume_id = nil
	self._current_id_index = 0
	self._is_start_waystone = false
	self._current_end_zone_hidden_long_timer = self:end_zone_hidden_long_timer()
	self._current_end_zone_visible_long_timer = self:end_zone_visible_long_timer()
	self._end_zone_timer_started = false
	self._end_zone_time_since_notify = self:end_zone_long_timer_settings().notify_long_interval
	self._visible_from_start = Unit.get_data(unit, "visible_from_start") or true
	self._waystone_type = Unit.get_data(unit, "waystone_type")
	self.waystone_size = (self._waystone_type == 3 and 3.8) or EndZoneSettings.size
	self._always_activated = Unit.get_data(unit, "always_activated")
	self._activation_name = Unit.get_data(unit, "activation_name") or ""
	self._side = Managers.state.side:get_side_from_name("heroes")

	if Unit.get_data(self._unit, "game_start_waystone") then
		self._is_start_waystone = true
		self._game_start_time = Unit.get_data(self._unit, "game_start_time")
	end

	self._disable_complete_level = Unit.get_data(self._unit, "disable_complete_level")
	self._disable_check_joining_players = Unit.get_data(self._unit, "disable_check_joining_players")
	local node = Unit.node(self._unit, "ap_dome_scaler")

	Unit.set_local_scale(self._unit, node, Vector3(0, 0, 0))

	if Unit.has_visibility_group(self._unit, "dome") then
		Unit.set_visibility(self._unit, "dome", false)
	end

	self:_set_light_intensity(0)

	local network_event_delegate = Managers.state.network.network_transmit.network_event_delegate

	network_event_delegate:register(self, "rpc_activate_end_zone")

	local level_settings = LevelHelper:current_level_settings(self._world)
	self._nav_world_available = not level_settings.no_bots_allowed

	if not self._visible_from_start then
		Unit.set_unit_visibility(unit, false)
	end
end

EndZoneExtension.rpc_activate_end_zone = function (self, channel_id, waystone_type, activate, wind_name_id, activation_name)
	if waystone_type ~= self._waystone_type then
		return
	end

	if self._activation_name ~= activation_name then
		return
	end

	local game_mode_key = Managers.state.game_mode:game_mode_key()

	self:_trigger_vo(game_mode_key, "activate")

	local wind_name = NetworkLookup.weave_winds[wind_name_id]

	if wind_name ~= "none" then
		Unit.flow_event(self._unit, wind_name)
	end

	if self._activated and not activate then
		self:_deactivate_volume()
	elseif not self._activated and activate then
		self:_activate_volume()

		if not self._visible_from_start then
			Unit.set_unit_visibility(self._unit, true)
		end
	end

	self._activated = activate
end

EndZoneExtension._trigger_vo = function (self, category, event)
	local ingame_vo = EndZoneSettings.ingame_vo
	local category_vo = ingame_vo[category]

	if category_vo then
		local event_vo = category_vo[event]

		if event_vo then
			if type(event_vo) == "table" then
				local level_seed = Managers.mechanism:get_level_seed()
				local _, seeded_random_value = Math.next_random(level_seed, #event_vo)
				local randomized_event_vo = event_vo[seeded_random_value]

				Managers.music:trigger_event(randomized_event_vo)
			else
				Managers.music:trigger_event(event_vo)
			end
		end
	end
end

EndZoneExtension.activated = function (self)
	return self._activated
end

EndZoneExtension._set_light_intensity = function (self, intensity)
	local num_lights = Unit.num_lights(self._unit)

	for i = 0, num_lights - 1, 1 do
		local light = Unit.light(self._unit, i)

		Light.set_intensity(light, intensity)
	end
end

EndZoneExtension.end_time = function (self)
	return self._game_start_time or EndZoneSettings.end_zone_timer
end

EndZoneExtension.end_time_left = function (self)
	return self._state_data.end_zone_timer or self:end_time()
end

EndZoneExtension.end_zone_long_timer_settings = function (self)
	return EndZoneSettings.end_zone_long_timer_settings
end

EndZoneExtension.end_zone_hidden_long_timer = function (self)
	return EndZoneSettings.end_zone_long_timer_settings.hidden_timer
end

EndZoneExtension.end_zone_visible_long_timer = function (self)
	return EndZoneSettings.end_zone_long_timer_settings.visible_timer
end

EndZoneExtension.end_long_time_left = function (self)
	return self._state_data.end_zone_long_timer or self:end_long_time()
end

EndZoneExtension.update = function (self, unit, input, dt, context, t)
	self:_reset_distances()
	self:_check_proximity()
	self:_update_state(dt, t)
	self:_poll_testify_requests()
end

EndZoneExtension.activation_allowed = function (self, allowed)
	self._activation_allowed = allowed
end

EndZoneExtension._activate = function (self, activate)
	if not self._is_server then
		return
	end

	if not self._activated and activate then
		self:_activate_volume()

		if not self._visible_from_start then
			Unit.set_unit_visibility(self._unit, true)
		end

		local wind = self:_get_wind_name() or "none"
		local wind_name_id = NetworkLookup.weave_winds[wind]

		if wind ~= "none" then
			Unit.flow_event(self._unit, wind)
		end

		local game_mode_key = Managers.state.game_mode:game_mode_key()

		self:_trigger_vo(game_mode_key, "activate")
		Managers.state.network.network_transmit:send_rpc_clients("rpc_activate_end_zone", self._waystone_type, true, wind_name_id, self._activation_name)
	elseif self._activated and not activate then
		self:_deactivate_volume()
		Managers.state.network.network_transmit:send_rpc_clients("rpc_activate_end_zone", self._waystone_type, false, 1, self._activation_name)

		local player_distances = self._player_distances

		for unit, _ in pairs(player_distances) do
			if Unit.alive(unit) then
				local status_ext = ScriptUnit.extension(unit, "status_system")

				status_ext:set_in_end_zone(false)
			end
		end
	end

	self._activated = activate
end

EndZoneExtension._get_wind_name = function (self)
	local return_value = nil
	local next_weave = Managers.weave:get_next_weave()

	if next_weave then
		local template = WeaveSettings.templates[next_weave]
		local wind = template.wind
		return_value = wind
	end

	return return_value
end

EndZoneExtension._activate_volume = function (self)
	self:_deactivate_volume(self._current_volume_id)

	local shading_environment = Unit.get_data(self._unit, "shading_environment")
	local volume_name = Unit.get_data(self._unit, "volume_name")
	self._current_id_index = self._current_id_index + 1
	self._current_volume_id = "end_zone_id_" .. self._current_id_index

	Managers.state.event:trigger("register_environment_volume", volume_name, shading_environment, 999, 0.1, false, 1, Unit.local_position(self._unit, 0), self.waystone_size, self._current_volume_id)

	if self._is_server and self._nav_world_available then
		local volume_system = Managers.state.entity:system("volume_system")

		fassert(volume_system.nav_tag_volume_handler ~= nil, "Cannot activate end_zone at Level Load (before nav_tag_volume_handler has been set)! LD, please use the coop_round_started event or activate it at a later point!")

		local nav_tag_volume_layer = "end_zone"
		local position = Unit.local_position(self._unit, 0)
		self._nav_tag_volume_id = volume_system:create_nav_tag_volume_from_data(position, self.waystone_size, nav_tag_volume_layer)
	end
end

EndZoneExtension._deactivate_volume = function (self)
	if self._current_volume_id then
		Managers.state.event:trigger("unregister_environment_volume", self._current_volume_id)

		self._current_volume_id = nil
	end

	if self._nav_tag_volume_id then
		local volume_system = Managers.state.entity:system("volume_system")

		volume_system:destroy_nav_tag_volume(self._nav_tag_volume_id)

		self._nav_tag_volume_id = nil
	end
end

EndZoneExtension._reset_distances = function (self)
	self._closest_player = math.huge

	table.clear(self._player_distances)
end

EndZoneExtension._check_proximity = function (self)
	local end_zone_pos = Unit.local_position(self._unit, 0)
	local player_units, player_and_bot_units = nil
	local side = self._side

	if global_is_inside_inn then
		player_units = side.PLAYER_UNITS
		player_and_bot_units = side.PLAYER_AND_BOT_UNITS
	else
		player_units = side.PLAYER_UNITS
		player_and_bot_units = side.PLAYER_AND_BOT_UNITS
	end

	for _, player_unit in pairs(player_and_bot_units) do
		local player_pos = POSITION_LOOKUP[player_unit]

		if player_pos then
			local distance_squared = Vector3.distance_squared(end_zone_pos, player_pos)
			self._closest_player = (distance_squared < self._closest_player and distance_squared) or self._closest_player

			if table.contains(player_units, player_unit) then
				self._player_distances[player_unit] = distance_squared
			end
		end
	end
end

EndZoneExtension._update_state = function (self, dt, t)
	if self._is_server then
		if self._activation_allowed then
			local game_mode_manager = Managers.state.game_mode
			local conditions_fulfilled = game_mode_manager:evaluate_end_zone_activation_conditions()

			if conditions_fulfilled and not self._activated then
				self:_activate(true)
			elseif not conditions_fulfilled and self._activated then
				self:_activate(false)
			end
		elseif self._activated then
			self:_activate(false)
		end
	else
		slot3 = true
	end

	self[self._state](self, dt, t, self._state_data)
end

EndZoneExtension.hot_join_sync = function (self, sender)
	if self._activated then
		local wind = self:_get_wind_name() or "none"
		local wind_name_id = NetworkLookup.weave_winds[wind]
		local channel_id = PEER_ID_TO_CHANNEL[sender]

		RPC.rpc_activate_end_zone(channel_id, self._waystone_type, true, wind_name_id, self._activation_name)
	end
end

EndZoneExtension.destroy = function (self)
	local network_event_delegate = Managers.state.network.network_transmit.network_event_delegate

	network_event_delegate:unregister(self)

	if self._nav_tag_volume_id then
		local volume_system = Managers.state.entity:system("volume_system")

		volume_system:destroy_nav_tag_volume(self._nav_tag_volume_id)
	end
end

EndZoneExtension._idle = function (self, dt, t)
	if not self._activated then
		return
	end

	if self._always_activated or self._closest_player <= EndZoneSettings.activate_size^2 then
		self._state_data = {
			timer = 0
		}
		self._state = "_open"

		Unit.flow_event(self._unit, "opening_end_zone")

		if Unit.has_visibility_group(self._unit, "dome") then
			Unit.set_visibility(self._unit, "dome", true)
		end
	end
end

EndZoneExtension._open = function (self, dt, t)
	if self._activated and (self._always_activated or self._closest_player <= EndZoneSettings.activate_size^2) then
		local animation_time = EndZoneSettings.animation_time or 0.5
		self._state_data.timer = math.clamp(self._state_data.timer + dt, 0, animation_time)
		local scale = math.smoothstep(self._state_data.timer / animation_time, 0, 1)
		local node = Unit.node(self._unit, "ap_dome_scaler")

		Unit.set_local_scale(self._unit, node, Vector3(scale, scale, scale))
		self:_set_light_intensity(scale^3)

		if scale == 1 then
			self._state_data.end_zone_timer = self:end_time()
			self._state_data.end_zone_hidden_long_timer = self:end_zone_hidden_long_timer()
			self._state_data.end_zone_visible_long_timer = self:end_zone_visible_long_timer()
			self._state = "_end_mission_check"
		end
	else
		self._state = "_close"

		Unit.flow_event(self._unit, "closing_end_zone")
	end
end

EndZoneExtension._close = function (self, dt, t)
	if self._activated and (self._always_activated or self._closest_player <= EndZoneSettings.activate_size^2) then
		self._state = "_open"

		Unit.flow_event(self._unit, "opening_end_zone")
	else
		local animation_time = EndZoneSettings.animation_time or 0.5
		self._state_data.timer = math.clamp(self._state_data.timer - dt, 0, animation_time)
		local scale = math.smoothstep(self._state_data.timer / animation_time, 0, 1)
		local node = Unit.node(self._unit, "ap_dome_scaler")

		Unit.set_local_scale(self._unit, node, Vector3(scale, scale, scale))
		self:_set_light_intensity(scale^3)

		if scale == 0 then
			self._state = "_idle"

			if Unit.has_visibility_group(self._unit, "dome") then
				Unit.set_visibility(self._unit, "dome", false)
			end
		end
	end
end

EndZoneExtension._check_end_mission_all_inside = function (self, dt, all_inside)
	if self._is_start_waystone and not self:_all_players_joined() then
		self._state_data.end_zone_timer = self:end_time()

		return
	end

	if all_inside then
		self._state_data.end_zone_timer = math.clamp(self:end_time_left() - dt, 0, self:end_time())

		if self:end_time_left() <= 0 and not self._disable_complete_level then
			Managers.state.game_mode:complete_level()
		end
	else
		self._state_data.end_zone_timer = self:end_time()
	end
end

EndZoneExtension._check_end_mission_any_inside = function (self, dt, all_inside, any_inside, players_outside_portal)
	local game_mode_key = Managers.state.game_mode:game_mode_key()

	if game_mode_key == "weave" or all_inside or self._is_start_waystone then
		return
	end

	local end_zone_long_timer_settings = self:end_zone_long_timer_settings()

	if not any_inside then
		if self._end_zone_timer_started then
			self._state_data.end_zone_hidden_long_timer = end_zone_long_timer_settings.hidden_timer
			self._state_data.end_zone_visible_long_timer = end_zone_long_timer_settings.visible_timer
			self._end_zone_timer_started = false
			self._end_zone_time_since_notify = 5
		end

		return
	end

	self._end_zone_timer_started = true
	local end_zone_hidden_long_timer = self._state_data.end_zone_hidden_long_timer
	local end_zone_visible_long_timer = self._state_data.end_zone_visible_long_timer

	if end_zone_hidden_long_timer > 0 then
		self._state_data.end_zone_hidden_long_timer = end_zone_hidden_long_timer - dt
	elseif end_zone_visible_long_timer > 0 then
		self._end_zone_time_since_notify = self._end_zone_time_since_notify + dt
		end_zone_visible_long_timer = end_zone_visible_long_timer - dt

		if end_zone_long_timer_settings.notify_interval_threshold < end_zone_visible_long_timer then
			if end_zone_long_timer_settings.notify_long_interval <= self._end_zone_time_since_notify then
				local message_timer = math.round_to_closest_multiple(end_zone_visible_long_timer, 5)

				Managers.chat:send_system_chat_message(1, "end_game_timer_system_message", message_timer, false, true)

				self._end_zone_time_since_notify = 0
			end
		elseif end_zone_long_timer_settings.notify_short_interval <= self._end_zone_time_since_notify then
			local message_timer = math.round_to_closest_multiple(end_zone_visible_long_timer, 1)

			Managers.chat:send_system_chat_message(1, "end_game_timer_system_message", message_timer, false, true)

			self._end_zone_time_since_notify = 0
		end

		self._state_data.end_zone_visible_long_timer = end_zone_visible_long_timer
	elseif not self._disable_complete_level then
		local mission_system = Managers.state.entity:system("mission_system")

		for _, player_unit in pairs(players_outside_portal) do
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")

			if inventory_extension:has_inventory_item("slot_potion", "wpn_grimoire_01") then
				mission_system:update_mission("grimoire_hidden_mission", false, dt, true)
			end

			if inventory_extension:has_inventory_item("slot_healthkit", "wpn_side_objective_tome_01") then
				mission_system:update_mission("tome_bonus_mission", false, dt, true)
			end
		end

		Managers.state.game_mode:complete_level()

		self._disable_complete_level = true
	end
end

EndZoneExtension._end_mission_check = function (self, dt, t)
	if self._activated and (self._always_activated or self._closest_player <= EndZoneSettings.activate_size^2) then
		local all_inside = nil
		local any_inside = false
		local players_outside_portal = {}

		if self._is_server then
			local buff_system = Managers.state.entity:system("buff_system")

			for player_unit, distance_squared in pairs(self._player_distances) do
				if Unit.alive(player_unit) then
					local status_extension = ScriptUnit.extension(player_unit, "status_system")

					if distance_squared > self.waystone_size^2 then
						if not status_extension:is_disabled_non_temporarily() then
							all_inside = false
							players_outside_portal[#players_outside_portal] = player_unit
						end

						status_extension:set_in_end_zone(false)
					else
						any_inside = true

						if all_inside == nil then
							all_inside = true
						end

						local buff_name = "end_zone_invincibility"
						local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
						local has_buff = buff_extension and buff_extension:has_buff_type(buff_name)

						if buff_extension and not has_buff then
							buff_system:add_buff(player_unit, buff_name, player_unit, false)
						end

						status_extension:set_in_end_zone(true)
					end
				end
			end

			self:_check_end_mission_all_inside(dt, all_inside)
			self:_check_end_mission_any_inside(dt, all_inside, any_inside, players_outside_portal)
		else
			all_inside = nil

			for player_unit, _ in pairs(self._player_distances) do
				if Unit.alive(player_unit) then
					local status_extension = ScriptUnit.extension(player_unit, "status_system")

					if not status_extension:is_disabled() and not status_extension:is_in_end_zone() then
						all_inside = false
					elseif all_inside == nil then
						all_inside = true
					end
				end
			end

			if self._is_start_waystone then
				if all_inside and self:_all_players_joined() then
					self._state_data.end_zone_timer = math.clamp(self:end_time_left() - dt, 0, self:end_time())
				else
					self._state_data.end_zone_timer = self:end_time()
				end
			elseif all_inside then
				self._state_data.end_zone_timer = math.clamp(self:end_time_left() - dt, 0, self:end_time())
			else
				self._state_data.end_zone_timer = self:end_time()
			end
		end
	else
		self._state = "_close"

		Unit.flow_event(self._unit, "closing_end_zone")
	end
end

EndZoneExtension._all_players_joined = function (self)
	if self._disable_check_joining_players then
		return true
	end

	local all_players_spawned = Managers.matchmaking:are_all_players_spawned()

	if not all_players_spawned then
		return false
	end

	return true
end

EndZoneExtension._poll_testify_requests = function (self)
	local end_zone_name = Testify:poll_request("end_zone_activated")

	if end_zone_name and end_zone_name == self._activation_name then
		Testify:respond_to_request("end_zone_activated", self._activated == true)
	end

	local end_zone_name = Testify:poll_request("teleport_player_to_end_zone_position")

	if end_zone_name and end_zone_name == self._activation_name then
		local end_zone_position = Unit.local_position(self._unit, 0)
		local player_unit = Managers.player:local_player().player_unit
		local player_mover = Unit.mover(player_unit)
		end_zone_position.z = end_zone_position.z + 1

		Mover.set_position(player_mover, end_zone_position)
		Testify:respond_to_request("teleport_player_to_end_zone_position")
	end
end

return
