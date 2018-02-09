local PING_COOLDOWN = 2
local PING_RANGE = 50
ContextAwarePingExtension = class(ContextAwarePingExtension)
ContextAwarePingExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._world = extension_init_context.world
	self._physics_world = World.get_data(self._world, "physics_world")
	self._unit = unit
	self._player = extension_init_data.player
	self.ping_timer = 0

	return 
end
ContextAwarePingExtension.extensions_ready = function (self, world, unit)
	self.input_extension = ScriptUnit.extension(unit, "input_system")
	self.first_person_extension = ScriptUnit.extension(unit, "first_person_system")
	self.status_extension = ScriptUnit.extension(unit, "status_system")

	return 
end
ContextAwarePingExtension.destroy = function (self)
	return 
end
local INDEX_POSITION = 1
local INDEX_DISTANCE = 2
local INDEX_NORMAL = 3
local INDEX_ACTOR = 4
ContextAwarePingExtension.update = function (self, unit, input, dt, context, t)
	local ping = self.input_extension:get("ping")

	if ping and self.ping_timer <= t then
		local pinged_unit = nil
		local darkness_system = Managers.state.entity:system("darkness_system")

		if self.status_extension:is_disabled() then
			pinged_unit = unit
		else
			local first_person_extension = self.first_person_extension
			local camera_position = first_person_extension.current_position(first_person_extension)
			local camera_rotation = first_person_extension.current_rotation(first_person_extension)
			local camera_forward = Quaternion.forward(camera_rotation)
			local hits, hits_n = self._physics_world:immediate_raycast(camera_position, camera_forward, PING_RANGE, "all", "collision_filter", "filter_ray_ping")

			for i = 1, hits_n, 1 do
				local hit = hits[i]
				local actor = hit[INDEX_ACTOR]

				if actor then
					local hit_unit = Actor.unit(actor)

					if hit_unit ~= unit then
						if ScriptUnit.has_extension(hit_unit, "ping_system") then
							local health_ext = ScriptUnit.has_extension(hit_unit, "health_system")
							local status_ext = ScriptUnit.has_extension(hit_unit, "status_system")
							local is_pickup = ScriptUnit.has_extension(hit_unit, "pickup_system")
							local is_alive = health_ext and health_ext.is_alive(health_ext)
							local is_skaven = Unit.get_data(hit_unit, "breed") ~= nil
							local is_incapacitated_player = status_ext and status_ext.is_disabled(status_ext)

							if (is_pickup or (is_alive and is_skaven) or (is_alive and is_incapacitated_player)) and not darkness_system.is_in_darkness(darkness_system, hit[INDEX_POSITION]) then
								pinged_unit = hit_unit

								break
							end
						elseif Unit.get_data(hit_unit, "breed") then
						else
							break
						end
					end
				end
			end
		end

		if pinged_unit and not LEVEL_EDITOR_TEST then
			local network_manager = Managers.state.network
			local pinger_unit_id = network_manager.unit_game_object_id(network_manager, unit)
			local pinged_unit_id = network_manager.unit_game_object_id(network_manager, pinged_unit)

			network_manager.network_transmit:send_rpc_server("rpc_ping_unit", pinger_unit_id, pinged_unit_id)
		end

		if pinged_unit then
			self.ping_timer = t + PING_COOLDOWN
		end
	end

	return 
end

return 
