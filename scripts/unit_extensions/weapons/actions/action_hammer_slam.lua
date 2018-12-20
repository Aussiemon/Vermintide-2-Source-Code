ActionHammerSlam = class(ActionHammerSlam, ActionBase)
local TOTAL_RADIUS = 4
local MEDIUM_RADIUS = 2
local SHORT_RADIUS = 1
local MIN_CHARGE_TIME = 2
local SLAM_TIME = 1
local SLAM_HIT_TIME = 0.4
local FORWARD_OFFSET = 0.5

ActionHammerSlam.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionHammerSlam.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
end

ActionHammerSlam.client_owner_start_action = function (self, new_action, t)
	self.current_action = new_action
	self.minimum_charge_time = t + MIN_CHARGE_TIME
	self.slam_time = 0
	self.slam_hit_time = 0
	self.dealt_damage = false
	self.started_hammer_slam = false
	self.targeting_decal = World.spawn_unit(self.world, "units/decals/decal_special_slam")
end

ActionHammerSlam.client_owner_post_update = function (self, dt, t, world, can_damage)
	self:_draw_targeting_decal(world)
end

ActionHammerSlam.update_is_finished = function (self, dt, t, world, reason)
	local owner_unit = self.owner_unit

	if reason == "weapon_wielded" or reason == "stunned" or reason == "knocked_down" then
		return true, reason
	end

	if t < self.minimum_charge_time then
		self:_draw_targeting_decal(world)

		return false
	end

	if not self.started_hammer_slam then
		self:_play_slamming_animation(self.current_action)

		self.slam_time = t + SLAM_TIME
		self.slam_hit_time = t + SLAM_HIT_TIME
		self.started_hammer_slam = true
	else
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
		local rot = first_person_extension:current_rotation()
		local direction = Quaternion.forward(rot)
		local flat_direction = Vector3.flat(direction)
		local new_rot = Quaternion.look(flat_direction)

		first_person_extension:force_look_rotation(new_rot)
	end

	if self.slam_hit_time <= t then
		local locomotion_extension = ScriptUnit.extension(owner_unit, "locomotion_system")

		locomotion_extension:set_forced_velocity(Vector3.zero())
		locomotion_extension:set_wanted_velocity(Vector3.zero())

		if not self.dealt_damage then
			World.destroy_unit(self.world, self.targeting_decal)

			self.targeting_decal = nil
			local physics_world = World.get_data(self.world, "physics_world")
			local player_position = POSITION_LOOKUP[owner_unit]
			local player_rotation = Unit.world_rotation(self.first_person_unit, 0)
			local direction = Vector3.normalize(Vector3.flat(Quaternion.forward(player_rotation)))
			local hit_position = player_position + direction * (TOTAL_RADIUS + FORWARD_OFFSET)
			local callback = callback(self, "slam_overlap_callback")

			PhysicsWorld.overlap(physics_world, callback, "shape", "sphere", "position", hit_position, "size", TOTAL_RADIUS, "types", "both", "collision_filter", "filter_melee_sweep")

			self.dealt_damage = true
		end
	else
		self:_draw_targeting_decal(world)
	end

	if self.slam_time <= t then
		return true, "action_complete"
	end

	return false
end

ActionHammerSlam.finish = function (self, reason)
	return
end

local hit_units = {}

ActionHammerSlam.slam_overlap_callback = function (self, actors)
	local num_actors = #actors

	for i = 1, num_actors, 1 do
		local hit_actor = actors[i]
		local hit_unit = Actor.unit(hit_actor)
		local breed = Unit.get_data(hit_unit, "breed")

		if breed and hit_units[hit_unit] == nil then
			hit_units[hit_unit] = true
			local node = Actor.node(hit_actor)
			local hit_zone = breed.hit_zones_lookup[node]
			local hit_zone_name = hit_zone.name
			local player_position = POSITION_LOOKUP[self.owner_unit]
			local attack_direction = Vector3.normalize(Unit.world_position(hit_unit, 0) - player_position)
			local network_manager = Managers.state.network
			local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
			local attacker_unit_id = network_manager:unit_game_object_id(self.owner_unit)
			local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
			local player_rotation = Unit.world_rotation(self.first_person_unit, 0)
			local direction = Vector3.normalize(Vector3.flat(Quaternion.forward(player_rotation)))
			local kill_circle_pos = player_position + direction * (MEDIUM_RADIUS + FORWARD_OFFSET)
			local destroy_circle_pos = player_position + direction * (SHORT_RADIUS + FORWARD_OFFSET)
			local distance_to_kill = Vector3.distance(Vector3.flat(POSITION_LOOKUP[hit_unit]), Vector3.flat(kill_circle_pos))
			local distance_to_destroy = Vector3.distance(Vector3.flat(POSITION_LOOKUP[hit_unit]), Vector3.flat(destroy_circle_pos))
			local in_medium_range = distance_to_kill <= MEDIUM_RADIUS
			local in_short_range = distance_to_destroy <= SHORT_RADIUS
			local attack_template_id = (in_short_range and AttackTemplates.hammer_slam_short.lookup_id) or (in_medium_range and AttackTemplates.hammer_slam_medium.lookup_id) or AttackTemplates.hammer_slam_long.lookup_id
			local weapon_system = Managers.state.entity:system("weapon_system")
			local damage_source_id = NetworkLookup.damage_sources[self.item_name]

			weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, attack_template_id, hit_zone_id, attack_direction)
		end
	end

	table.clear(hit_units)
end

ActionHammerSlam._draw_targeting_decal = function (self, world)
	local player_position = POSITION_LOOKUP[self.owner_unit]
	local player_rotation = Unit.world_rotation(self.first_person_unit, 0)
	local direction = Vector3.normalize(Vector3.flat(Quaternion.forward(player_rotation)))
	local flat_rotation = Quaternion.look(direction)
	local push_circle_pos = player_position + direction * (TOTAL_RADIUS + FORWARD_OFFSET)
	local kill_circle_pos = player_position + direction * (MEDIUM_RADIUS + FORWARD_OFFSET)
	local destroy_circle_pos = player_position + direction * (SHORT_RADIUS + FORWARD_OFFSET)

	QuickDrawer:sphere(push_circle_pos, TOTAL_RADIUS, Color(255, 50, 255, 50))
	QuickDrawer:sphere(kill_circle_pos, MEDIUM_RADIUS, Color(255, 255, 50, 50))
	QuickDrawer:sphere(destroy_circle_pos, SHORT_RADIUS, Color(255, 50, 50, 255))

	local targeting_decal = self.targeting_decal
	local scale = TOTAL_RADIUS * 2

	Unit.set_local_position(targeting_decal, 0, push_circle_pos)
	Unit.set_local_rotation(targeting_decal, 0, flat_rotation)
	Unit.set_local_scale(targeting_decal, 0, Vector3(scale, scale, 1))
end

ActionHammerSlam._play_slamming_animation = function (self, current_action)
	local event = current_action.slam_anim
	local go_id = Managers.state.unit_storage:go_id(self.owner_unit)
	local event_id = NetworkLookup.anims[event]

	if not LEVEL_EDITOR_TEST then
		if self.is_server then
			Managers.state.network.network_transmit:send_rpc_clients("rpc_anim_event", event_id, go_id)
		else
			Managers.state.network.network_transmit:send_rpc_server("rpc_anim_event", event_id, go_id)
		end
	end

	Unit.animation_event(self.first_person_unit, event)
	Unit.animation_event(self.owner_unit, event)
end

return
