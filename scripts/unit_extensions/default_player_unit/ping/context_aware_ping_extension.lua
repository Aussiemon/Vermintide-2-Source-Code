local MAX_FREE_EVENTS = 5
local EVENT_REFRESH_RATE = 4
local PING_COOLDOWN = 2
local PING_RANGE = 50
ContextAwarePingExtension = class(ContextAwarePingExtension)

ContextAwarePingExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._world = extension_init_context.world
	self._physics_world = World.get_data(self._world, "physics_world")
	self._unit = unit
	self._player = extension_init_data.player
	self._ping_context = nil
	self._social_wheel_context = nil
	self._ping_position = Vector3Box()
	self._ping_timer = 0
	self._num_free_events = MAX_FREE_EVENTS
	self._last_update_t = 0
	local settings = Managers.state.game_mode:settings()
	local ping_mode = settings.ping_mode

	if ping_mode then
		self._world_markers_enabled = ping_mode.world_markers
	else
		self._world_markers_enabled = false
	end
end

ContextAwarePingExtension.extensions_ready = function (self, world, unit)
	self._input_extension = ScriptUnit.extension(unit, "input_system")
	self._first_person_extension = ScriptUnit.extension(unit, "first_person_system")
	self._status_extension = ScriptUnit.extension(unit, "status_system")
end

ContextAwarePingExtension.ping_context = function (self)
	return self._ping_context
end

ContextAwarePingExtension.social_wheel_context = function (self)
	return self._social_wheel_context
end

ContextAwarePingExtension.destroy = function (self)
	return
end

ContextAwarePingExtension.update = function (self, unit, input, dt, context, t)
	if self._num_free_events < MAX_FREE_EVENTS then
		local free_events_to_add = (t - self._last_update_t) / EVENT_REFRESH_RATE
		self._num_free_events = math.min(self._num_free_events + free_events_to_add, MAX_FREE_EVENTS)
	end

	if self._ping_context then
		local ping_context = self._ping_context
		local ping_released = self._input_extension:get("ping_release")
		local ping_held = self._input_extension:get("ping_hold")
		local unit_to_ping = ping_context.unit
		local ping_type = ping_context.ping_type

		if ping_released or not ping_held then
			if t <= ping_context.max_t then
				if ALIVE[unit_to_ping] then
					self:ping_attempt(unit, unit_to_ping, t, ping_type)
				elseif ping_context.position then
					self:ping_world_position_attempt(unit, ping_context.position:unbox(), t)
				end
			end

			self._ping_context = nil
			self._social_wheel_context = nil
		end
	elseif self._social_wheel_context then
		local social_wheel_only_released = self._input_extension:get("social_wheel_only_release")
		local social_wheel_only_held = self._input_extension:get("social_wheel_only_hold")
		local photomode_only_released = self._input_extension:get("photomode_only_released")
		local photomode_only_held = self._input_extension:get("photomode_only_hold")

		if (social_wheel_only_released or not social_wheel_only_held) and (photomode_only_released or not photomode_only_held) then
			self._social_wheel_context = nil
		end
	else
		local input_extension = self._input_extension
		local ping = input_extension:get("ping")
		local ping_only = input_extension:get("ping_only")
		local ping_only_enemy = input_extension:get("ping_only_enemy")
		local ping_only_movement = input_extension:get("ping_only_movement")
		local ping_only_item = input_extension:get("ping_only_item")
		local social_wheel_only = input_extension:get("social_wheel_only")
		local photomode_only = input_extension:get("photomode_only")
		local is_ping_only = ping_only or ping_only_enemy or ping_only_movement or ping_only_item

		if ping or is_ping_only or social_wheel_only or photomode_only then
			local ping_unit, social_wheel_unit, ping_unit_distance, social_wheel_unit_distance, position = self:_check_raycast(unit)
			local stored_ping_position = nil

			if position then
				self._ping_position:store(position)

				stored_ping_position = self._ping_position
			end

			local ping_type = nil

			if not ping_only and is_ping_only then
				if ping_only_enemy then
					ping_type = PingTypes.ENEMY_GENERIC
				elseif ping_only_movement then
					ping_type = PingTypes.MOVEMENT_GENERIC
				elseif ping_only_item then
					ping_type = PingTypes.PLAYER_PICK_UP
				end
			elseif not ping and self._status_extension:is_ready_for_assisted_respawn() then
				local input_service = Managers.input:get_service("Player")

				if input_service then
					social_wheel_only = input_service:get("ping")
				end
			elseif ping_unit then
				local status_ext = ScriptUnit.has_extension(ping_unit, "status_system")

				if status_ext and status_ext:is_knocked_down() then
					ping_type = PingTypes.UNIT_DOWNED
				end
			end

			if is_ping_only then
				if ping_unit then
					self:ping_attempt(unit, ping_unit, t, ping_type)
				elseif position then
					self:ping_world_position_attempt(unit, position, t, ping_type)
				end
			elseif social_wheel_only then
				self._social_wheel_context = {
					min_t = 0,
					unit = social_wheel_unit,
					distance = social_wheel_unit_distance,
					position = stored_ping_position
				}
			elseif ping then
				local social_wheel_delay = Application.user_setting("social_wheel_delay") or DefaultUserSettings.get("user_settings", "social_wheel_delay")
				self._ping_context = {
					unit = ping_unit,
					max_t = t + social_wheel_delay,
					distance = ping_unit_distance,
					position = stored_ping_position,
					ping_type = ping_type
				}
				self._social_wheel_context = {
					unit = social_wheel_unit,
					ping_context_unit = ping_unit,
					min_t = t + social_wheel_delay,
					distance = social_wheel_unit_distance,
					position = stored_ping_position
				}
			elseif photomode_only then
				self._social_wheel_context = {
					min_t = 0,
					show_emotes = true,
					unit = social_wheel_unit,
					distance = social_wheel_unit_distance,
					position = stored_ping_position
				}
			end
		end
	end

	self._last_update_t = t
end

ContextAwarePingExtension._have_free_events = function (self)
	return self._num_free_events > 0
end

ContextAwarePingExtension._consume_ping_event = function (self)
	self._num_free_events = self._num_free_events - 1
end

ContextAwarePingExtension.ping_attempt = function (self, unit, unit_to_ping, t, ping_type, social_wheel_event_id)
	if t < self._ping_timer and not IgnoreCooldownPingTypes[ping_type] then
		return
	end

	if not self:_have_free_events() then
		if ping_type ~= nil then
			local error_message = Localize("social_wheel_too_many_messages_warning")

			Managers.chat:add_local_system_message(1, error_message, true)
		end

		return false
	end

	if not ALIVE[unit_to_ping] or LEVEL_EDITOR_TEST then
		return false
	end

	social_wheel_event_id = social_wheel_event_id or NetworkLookup.social_wheel_events["n/a"]
	local network_manager = Managers.state.network
	local pinger_unit_id = network_manager:unit_game_object_id(unit)
	local pinged_unit_id = network_manager:unit_game_object_id(unit_to_ping)
	ping_type = ping_type or (self._world_markers_enabled and PingTypes.CONTEXT) or PingTypes.PING_ONLY

	network_manager.network_transmit:send_rpc_server("rpc_ping_unit", pinger_unit_id, pinged_unit_id, false, ping_type, social_wheel_event_id)

	self._ping_timer = t + PING_COOLDOWN

	self:_consume_ping_event()

	return true
end

ContextAwarePingExtension.ping_world_position_attempt = function (self, unit, position, t, ping_type, social_wheel_event_id)
	if t < self._ping_timer and not IgnoreCooldownPingTypes[ping_type] then
		return
	end

	if not ping_type and not self._world_markers_enabled then
		return
	end

	if not self:_have_free_events() then
		local error_message = Localize("social_wheel_too_many_messages_warning")

		Managers.chat:add_local_system_message(1, error_message, true)

		return false
	end

	if LEVEL_EDITOR_TEST then
		return false
	end

	social_wheel_event_id = social_wheel_event_id or NetworkLookup.social_wheel_events["n/a"]
	local network_manager = Managers.state.network
	local pinger_unit_id = network_manager:unit_game_object_id(unit)
	ping_type = ping_type or PingTypes.CONTEXT

	network_manager.network_transmit:send_rpc_server("rpc_ping_world_position", pinger_unit_id, position, ping_type, social_wheel_event_id)

	self._ping_timer = t + PING_COOLDOWN

	self:_consume_ping_event()

	return true
end

ContextAwarePingExtension.social_message_attempt = function (self, unit, social_wheel_event_id, target_unit)
	if not self:_have_free_events() then
		local error_message = Localize("social_wheel_too_many_messages_warning")

		Managers.chat:add_local_system_message(1, error_message, true)

		return false
	end

	if LEVEL_EDITOR_TEST then
		return false
	end

	social_wheel_event_id = social_wheel_event_id or NetworkLookup.social_wheel_events["n/a"]
	local network_manager = Managers.state.network
	local pinger_unit_id = network_manager:unit_game_object_id(unit)
	local pinged_unit_id = (target_unit and Unit.alive(target_unit) and network_manager:unit_game_object_id(target_unit)) or 0

	network_manager.network_transmit:send_rpc_server("rpc_social_message", pinger_unit_id, social_wheel_event_id, pinged_unit_id)
	self:_consume_ping_event()

	return true
end

local INDEX_POSITION = 1
local INDEX_DISTANCE = 2
local INDEX_ACTOR = 4

ContextAwarePingExtension._check_raycast = function (self, unit)
	local ping_unit, social_wheel_unit, ping_unit_distance, social_wheel_unit_distance, position = nil

	if self._status_extension:is_disabled() and Managers.mechanism:current_mechanism_name() == "versus" then
		ping_unit = unit
	else
		local darkness_system = Managers.state.entity:system("darkness_system")
		local first_person_extension = self._first_person_extension
		local camera_position = first_person_extension:current_position()
		local camera_rotation = first_person_extension:current_rotation()
		local camera_forward = Quaternion.forward(camera_rotation)
		local camera_right = Quaternion.right(camera_rotation)
		local camera_up = Quaternion.up(camera_rotation)
		local hits, hits_n = self._physics_world:immediate_raycast(camera_position, camera_forward, PING_RANGE, "all", "collision_filter", "filter_ray_ping")
		local best_ping_utility = -math.huge
		local best_social_utility = 2000

		for i = 1, hits_n, 1 do
			local hit = hits[i]
			local actor = hit[INDEX_ACTOR]
			local hit_position = hit[INDEX_POSITION]
			local distance = hit[INDEX_DISTANCE]

			if actor then
				local hit_unit = Actor.unit(actor)

				if hit_unit ~= unit then
					local ping_ext = ScriptUnit.has_extension(hit_unit, "ping_system")

					if ping_ext then
						local health_ext = ScriptUnit.has_extension(hit_unit, "health_system")
						local status_ext = ScriptUnit.has_extension(hit_unit, "status_system")
						local is_pickup = ScriptUnit.has_extension(hit_unit, "pickup_system")
						local is_alive = health_ext and health_ext:is_alive()
						local breed = Unit.get_data(hit_unit, "breed")
						local has_breed = breed ~= nil

						if distance > 0.05 then
							local half_width, half_height = nil

							if is_pickup then
								local _, half_extents = Unit.box(hit_unit, true)
								half_width = half_extents.x * 0.75
								half_height = half_extents.z * 0.75
							elseif has_breed then
								half_height = (breed.aoe_height or DEFAULT_BREED_AOE_HEIGHT) * 0.5
								half_width = breed.aoe_radius or DEFAULT_BREED_AOE_RADIUS
							elseif status_ext then
								local _, half_extents = Unit.box(hit_unit, true)
								half_width = half_extents.x * 0.75
								half_height = half_extents.z
							else
								half_width = 0.25
								half_height = 0.25
							end

							local hit_unit_center_pos = POSITION_LOOKUP[hit_unit] + Vector3(0, 0, half_height)
							local hit_offset = hit_position - hit_unit_center_pos
							local x_diff = math.abs(Vector3.dot(hit_offset, camera_right))
							local y_diff = math.abs(Vector3.dot(hit_offset, camera_up))
							local epsilon = 0.01
							local direct_hit = x_diff <= half_width + epsilon and y_diff <= half_height + epsilon
							local utility = nil

							if direct_hit then
								utility = math.huge
							else
								local angle_width = math.atan(half_width / distance)
								local angle_height = math.atan(half_height / distance)
								local angle_x_diff = math.atan(x_diff / distance)
								local angle_y_diff = math.atan(y_diff / distance)
								local x_offset = math.max(angle_x_diff - angle_width, epsilon) / math.log(angle_width)
								local y_offset = math.max(angle_y_diff - angle_height, epsilon) / math.log(angle_width)
								utility = 1 / (x_offset * y_offset)
							end

							local is_enemy = has_breed and Managers.state.side:is_enemy(self._unit, hit_unit)
							local is_incapacitated_player = status_ext and status_ext:is_disabled()

							if (ping_ext.always_pingable or is_pickup or (is_alive and (is_enemy or is_incapacitated_player))) and not darkness_system:is_in_darkness(hit_position) and best_ping_utility < utility then
								ping_unit = hit_unit
								ping_unit_distance = distance
								best_ping_utility = utility
								position = hit_position
							end

							local is_valid_social_wheel_pickup = false

							if is_pickup then
								local pickup_settings = is_pickup:get_pickup_settings()
								is_valid_social_wheel_pickup = pickup_settings.slot_name or pickup_settings.type == "ammo"
							end

							if ((is_valid_social_wheel_pickup and distance <= INTERACT_RAY_DISTANCE) or (is_alive and status_ext)) and best_social_utility < utility then
								social_wheel_unit = hit_unit
								social_wheel_unit_distance = distance
								best_social_utility = utility
							end
						end
					elseif Unit.get_data(hit_unit, "breed") then
					else
						position = hit_position

						break
					end
				end
			end
		end
	end

	return ping_unit, social_wheel_unit, ping_unit_distance, social_wheel_unit_distance, position
end

return
