OrbSystem = class(OrbSystem, ExtensionSystemBase)
local RPCS = {
	"rpc_spawn_orb"
}
local ORB_START_RADIUS = 1
local ORB_END_RADIUS = 3

local function spawn_orb(nav_world, orb_name, owner_peer_id, orb_starting_position, cake_slice_dir, cake_slice_angle_radians)
	local slice_angle = math.atan2(cake_slice_dir.x, cake_slice_dir.y)
	local half_slice_angle = cake_slice_angle_radians * 0.5
	local angle1 = slice_angle - half_slice_angle
	local angle2 = slice_angle + half_slice_angle
	local start_radius = ORB_START_RADIUS
	local end_radius = ORB_END_RADIUS
	local orb_flight_target_position = nil

	for i = 1, 5 do
		local x, y = math.get_uniformly_random_point_inside_sector(start_radius, end_radius, angle1, angle2)
		local position_found = Vector3(orb_starting_position.x + x, orb_starting_position.y + y, orb_starting_position.z)
		local success, z = GwNavQueries.triangle_from_position(nav_world, position_found, 5, 5)

		if success then
			Vector3.set_z(position_found, z)

			orb_flight_target_position = Vector3Box(position_found)

			break
		end
	end

	if not orb_flight_target_position then
		local success, z = GwNavQueries.triangle_from_position(nav_world, orb_starting_position, 5, 5)

		if success then
			local pos = Vector3(orb_starting_position[1], orb_starting_position[2], z)
			orb_flight_target_position = Vector3Box(pos)
		else
			local pos = GwNavQueries.inside_position_from_outside_position(nav_world, orb_starting_position, 4, 4, 5)

			if pos then
				orb_flight_target_position = Vector3Box(pos)
			end
		end
	end

	if not orb_flight_target_position then
		return
	end

	local pickup_settings = AllPickups[orb_name]
	local projectile_unit_name = pickup_settings.unit_name
	local projectile_unit_template_name = pickup_settings.unit_template_name
	local spawn_type = "buff"
	local extension_init_data = {
		pickup_system = {
			has_physics = false,
			spawn_limit = 1,
			flight_enabled = true,
			pickup_name = orb_name,
			spawn_type = spawn_type,
			owner_peer_id = owner_peer_id,
			orb_flight_target_position = orb_flight_target_position
		}
	}

	return Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, projectile_unit_template_name, extension_init_data, orb_starting_position)
end

OrbSystem.init = function (self, entity_system_creation_context, ...)
	OrbSystem.super.init(self, entity_system_creation_context, ...)

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))
end

OrbSystem.rpc_spawn_orb = function (self, channel_id, orb_name, owner_peer_id, orb_starting_position, cake_slice_dir, cake_slice_angle_radians)
	local nav_world = Managers.state.entity:system("ai_system"):nav_world()

	if not nav_world then
		return
	end

	orb_name = NetworkLookup.pickup_names[orb_name]
	local start_pos = Vector3Box(orb_starting_position)
	local slice_dir = Vector3Box(cake_slice_dir)

	local function nav_callback()
		spawn_orb(nav_world, orb_name, owner_peer_id, start_pos:unbox(), slice_dir:unbox(), cake_slice_angle_radians)
	end

	local ai_navigation_system = Managers.state.entity:system("ai_navigation_system")

	ai_navigation_system:add_safe_navigation_callback(nav_callback)
end

OrbSystem.spawn_orb = function (self, orb_name, owner_peer_id, orb_starting_position, cake_slice_dir, cake_slice_angle_radians)
	local nav_world = Managers.state.entity:system("ai_system"):nav_world()

	if not nav_world then
		return
	end

	local start_pos = Vector3Box(orb_starting_position)
	local slice_dir = Vector3Box(cake_slice_dir)

	local function nav_callback()
		spawn_orb(nav_world, orb_name, owner_peer_id, start_pos:unbox(), slice_dir:unbox(), cake_slice_angle_radians)
	end

	local ai_navigation_system = Managers.state.entity:system("ai_navigation_system")

	ai_navigation_system:add_safe_navigation_callback(nav_callback)
end

OrbSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)
end
