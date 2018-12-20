ActionHammerLeap = class(ActionHammerLeap, ActionBase)

ActionHammerLeap.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionHammerLeap.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.target_position = nil
	self.attack_range = 14
	self.leap_z_offset = Vector3Box(0, 0, 3)
	self.pause_in_air_time = 0.3
	self.leap_speed = 15
	self.max_angle = 70
	self.min_angle = 50
	self.distance_before_leap = 2
	self.radius = 2.5
end

ActionHammerLeap.client_owner_start_action = function (self, new_action, t)
	self.current_action = new_action
	self.landed = false
	self.target_position = nil
	self.started_hammer_leap = false
end

ActionHammerLeap.client_owner_post_update = function (self, dt, t, world, can_damage)
	local physics_world = World.get_data(world, "physics_world")
	local owner_unit_1p = self.first_person_unit
	local player_position = POSITION_LOOKUP[owner_unit_1p]
	local player_rotation = Unit.world_rotation(owner_unit_1p, 0)
	local direction = Vector3.normalize(Quaternion.forward(player_rotation))
	local _, hit_position, _, normal, _ = PhysicsWorld.immediate_raycast(physics_world, player_position, direction, "closest", "collision_filter", "filter_hammer_leap_check")
	self.target_position = nil

	if hit_position then
		local dot = Vector3.dot(normal, Vector3.up())
		local color = Color(255, 255, 50, 50)

		if Vector3.distance(player_position, hit_position) <= self.attack_range and dot >= 0.8 then
			color = Color(255, 50, 255, 50)
			self.target_position = Vector3Box(hit_position)
		end

		QuickDrawer:sphere(hit_position, self.radius, color)
	end
end

ActionHammerLeap.update_is_finished = function (self, dt, t, world, reason)
	if reason == "weapon_wielded" or reason == "stunned" or reason == "knocked_down" or not self.target_position then
		return true, reason
	end

	if not self.started_hammer_leap then
		local owner_unit = self.owner_unit
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")
		local player_position = POSITION_LOOKUP[owner_unit]
		local target_position = self.target_position:unbox() + self.leap_z_offset:unbox()
		local target_vector = target_position - player_position
		local target_vector_flat = Vector3.normalize(Vector3.flat(target_vector))
		local angle = math.pi / 180 * (self.max_angle - Vector3.length(target_vector) / self.attack_range * (self.max_angle - self.min_angle))
		local speed = WeaponHelper:wanted_projectile_speed(target_vector, 9.82, angle)
		local direction = Quaternion.rotate(Quaternion.axis_angle(Vector3.cross(target_vector_flat, Vector3.up()), angle), target_vector_flat)
		local velocity = direction * speed

		status_extension:set_hammer_leaping(true, velocity)

		self.started_hammer_leap = true
	end

	if self.landed then
		return true, "action_complete"
	end

	return false
end

ActionHammerLeap.player_landed = function (self)
	self.landed = true
end

ActionHammerLeap.finish = function (self, reason)
	local owner_unit = self.owner_unit

	if reason == "action_complete" then
		local physics_world = World.get_data(self.world, "physics_world")
		local callback = callback(self, "landing_overlap_callback")
		local player_position = POSITION_LOOKUP[owner_unit]

		PhysicsWorld.overlap(physics_world, callback, "shape", "sphere", "position", player_position, "size", self.radius, "types", "both", "collision_filter", "filter_melee_sweep")
	end
end

local hit_units = {}

ActionHammerLeap.landing_overlap_callback = function (self, actors)
	local num_actors = #actors
	local network_manager = Managers.state.network
	local owner_unit = self.owner_unit
	local attacker_unit_id = network_manager:unit_game_object_id(owner_unit)

	for i = 1, num_actors, 1 do
		local hit_actor = actors[i]
		local hit_unit = Actor.unit(hit_actor)
		local breed = Unit.get_data(hit_unit, "breed")

		if breed and hit_units[hit_unit] == nil then
			hit_units[hit_unit] = true
			local node = Actor.node(hit_actor)
			local hit_zone = breed.hit_zones_lookup[node]
			local hit_zone_name = hit_zone.name
			local attack_direction = Vector3.normalize(Unit.world_position(hit_unit, 0) - POSITION_LOOKUP[owner_unit])
			local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
			local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
			local attack_template_id = 2
			local damage_source_id = NetworkLookup.damage_sources[self.item_name]
			local weapon_system = Managers.state.entity:system("weapon_system")

			weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, attack_template_id, hit_zone_id, attack_direction)
		end
	end

	table.clear(hit_units)
end

return
