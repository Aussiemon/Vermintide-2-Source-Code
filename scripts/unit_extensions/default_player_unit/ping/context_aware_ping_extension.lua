local PING_COOLDOWN = 2
local PING_RANGE = 50
local debug = false
ContextAwarePingExtension = class(ContextAwarePingExtension)

ContextAwarePingExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._world = extension_init_context.world
	self._physics_world = World.get_data(self._world, "physics_world")
	self._unit = unit
	self._player = extension_init_data.player
	self._ping_context = nil
	self._social_wheel_context = nil
	self.ping_timer = 0
end

ContextAwarePingExtension.extensions_ready = function (self, world, unit)
	self.input_extension = ScriptUnit.extension(unit, "input_system")
	self.first_person_extension = ScriptUnit.extension(unit, "first_person_system")
	self.status_extension = ScriptUnit.extension(unit, "status_system")
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
	if self._ping_context or self._social_wheel_context then
		if self._ping_context then
			local ping_context = self._ping_context
			local ping_released = self.input_extension:get("ping_release")
			local ping_held = self.input_extension:get("ping_hold")
			local unit_to_ping = ping_context.unit

			if ping_released or not ping_held then
				if Unit.alive(unit_to_ping) and t <= ping_context.max_t then
					self:ping_attempt(unit, unit_to_ping, t)
				end

				self._ping_context = nil
				self._social_wheel_context = nil
			end
		elseif self._social_wheel_context then
			local social_wheel_only_released = self.input_extension:get("social_wheel_only_release")
			local social_wheel_only_held = self.input_extension:get("social_wheel_only_hold")

			if social_wheel_only_released or not social_wheel_only_held then
				self._social_wheel_context = nil
			end
		end
	else
		local ping = self.input_extension:get("ping")
		local social_wheel_delay = Application.user_setting("social_wheel_delay") or DefaultUserSettings.get("user_settings", "social_wheel_delay")
		local ping_only = (script_data.enable_social_wheel ~= true and ping) or self.input_extension:get("ping_only")
		local social_wheel_only = self.input_extension:get("social_wheel_only")

		if ping or ping_only or social_wheel_only then
			local ping_unit, social_wheel_unit, ping_unit_distance, social_wheel_unit_distance = self:_check_raycast(unit)

			if ping_only then
				self:ping_attempt(unit, ping_unit, t)
			elseif social_wheel_only then
				self._social_wheel_context = {
					min_t = 0,
					unit = social_wheel_unit,
					distance = social_wheel_unit_distance
				}
			elseif ping then
				self._ping_context = {
					unit = ping_unit,
					max_t = t + social_wheel_delay,
					distance = ping_unit_distance
				}
				self._social_wheel_context = {
					unit = social_wheel_unit,
					ping_context_unit = ping_unit,
					min_t = t + social_wheel_delay,
					distance = social_wheel_unit_distance
				}
			end
		end
	end
end

ContextAwarePingExtension.ping_attempt = function (self, unit, unit_to_ping, t)
	if unit_to_ping and self.ping_timer <= t and not LEVEL_EDITOR_TEST then
		local network_manager = Managers.state.network
		local pinger_unit_id = network_manager:unit_game_object_id(unit)
		local pinged_unit_id = network_manager:unit_game_object_id(unit_to_ping)

		network_manager.network_transmit:send_rpc_server("rpc_ping_unit", pinger_unit_id, pinged_unit_id, false)

		self.ping_timer = t + PING_COOLDOWN

		return true
	end

	return false
end

local INDEX_POSITION = 1
local INDEX_DISTANCE = 2
local INDEX_ACTOR = 4

ContextAwarePingExtension._check_raycast = function (self, unit)
	local ping_unit, social_wheel_unit, ping_unit_distance, social_wheel_unit_distance = nil

	if self.status_extension:is_disabled() then
		ping_unit = unit
	else
		local darkness_system = Managers.state.entity:system("darkness_system")
		local first_person_extension = self.first_person_extension
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
					if ScriptUnit.has_extension(hit_unit, "ping_system") then
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

							local is_incapacitated_player = status_ext and status_ext:is_disabled()

							if (is_pickup or (is_alive and (has_breed or is_incapacitated_player))) and not darkness_system:is_in_darkness(hit_position) and best_ping_utility < utility then
								ping_unit = hit_unit
								ping_unit_distance = distance
								best_ping_utility = utility
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

							if debug then
								QuickDrawerStay:box(Matrix4x4.from_quaternion_position(camera_rotation, hit_unit_center_pos), Vector3(half_width, half_width, half_height))
							end
						end
					elseif Unit.get_data(hit_unit, "breed") then
					else
						break
					end
				end
			end
		end
	end

	return ping_unit, social_wheel_unit, ping_unit_distance, social_wheel_unit_distance
end

return
