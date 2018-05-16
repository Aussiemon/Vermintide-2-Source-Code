PlayerProjectileImpactUnitExtension = class(PlayerProjectileImpactUnitExtension, ProjectileBaseImpactUnitExtension)

PlayerProjectileImpactUnitExtension.init = function (self, extension_init_context, unit, extension_init_data)
	PlayerProjectileImpactUnitExtension.super.init(self, extension_init_context, unit, extension_init_data)

	self.network_manager = Managers.state.network
	self.is_server = Managers.player.is_server
	local owner_unit = extension_init_data.owner_unit
	self.owner_unit = owner_unit
	local owner_player = Managers.player:owner(owner_unit)
	local item_name = extension_init_data.item_name
	local item_data = ItemMasterList[item_name]
	local item_template = BackendUtils.get_item_template(item_data)
	local item_template_name = extension_init_data.item_template_name
	local action_name = extension_init_data.action_name
	local sub_action_name = extension_init_data.sub_action_name
	self.action_lookup_data = {
		item_template_name = item_template_name,
		action_name = action_name,
		sub_action_name = sub_action_name
	}
	local projectile_info = item_template.actions[action_name][sub_action_name].projectile_info
	self.impact_type = projectile_info.impact_type
	self.static_impact_type = projectile_info.static_impact_type
	local enemy_collision_filter = "filter_player_ray_projectile_dynamic_only"
	local collision_filter = "filter_player_ray_projectile_no_player"
	local static_collision_filter = "filter_player_ray_projectile_no_player"
	local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()

	if DamageUtils.allow_friendly_fire_ranged(difficulty_settings, owner_player) then
		enemy_collision_filter = "filter_player_ray_projectile_dynamic_only"
		collision_filter = "filter_player_ray_projectile"
	end

	local static_collision_filter = "filter_player_ray_projectile_static_only"
	self.enemy_collision_filter = extension_init_data.collision_filter or enemy_collision_filter
	self.static_collision_filter = extension_init_data.collision_filter or static_collision_filter
	self.collision_filter = extension_init_data.collision_filter or collision_filter
	self.radius = extension_init_data.radius
	self.scene_query_height_offset = projectile_info.scene_query_height_offset or 0
	self.last_position = nil
end

PlayerProjectileImpactUnitExtension.extensions_ready = function (self, world, unit)
	self.locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
end

PlayerProjectileImpactUnitExtension.update = function (self, unit, input, dt, context, t)
	PlayerProjectileImpactUnitExtension.super.update(self, unit, input, dt, context, t)

	local impact_type = self.impact_type
	local static_impact_type = self.static_impact_type

	if impact_type == "raycast" then
		self:update_raycast(unit, input, dt, context, t)
	elseif impact_type == "sphere_sweep" then
		if static_impact_type == "sphere_sweep" then
			self:update_sphere_sweep(unit, input, dt, context, t, self.radius, self.enemy_collision_filter)
			self:update_sphere_sweep(unit, input, dt, context, t, self.radius * 0.25, self.static_collision_filter)
		elseif static_impact_type == "raycast" then
			self:update_sphere_sweep(unit, input, dt, context, t, self.radius, self.enemy_collision_filter)
			self:update_raycast(unit, input, dt, context, t, self.static_collision_filter)
		else
			self:update_sphere_sweep(unit, input, dt, context, t, self.radius, self.collision_filter)
		end
	else
		local action_lookup_data = self.action_lookup_data
		local item_template_name = action_lookup_data.item_template_name
		local action_name = action_lookup_data.action_name
		local sub_action_name = action_lookup_data.sub_action_name

		fassert(false, "Unsupported impact type %q in projectile spawned by %q - %q - %q", impact_type, item_template_name, action_name, sub_action_name)
	end
end

local INDEX_POSITION = 1
local INDEX_DISTANCE = 2
local INDEX_NORMAL = 3
local INDEX_ACTOR = 4

PlayerProjectileImpactUnitExtension.update_raycast = function (self, unit, input, dt, context, t, override_collision_filter)
	local locomotion_extension = self.locomotion_extension

	if not locomotion_extension:moved_this_frame() then
		return
	end

	local velocity = locomotion_extension:current_velocity()
	local cached_position = POSITION_LOOKUP[unit]
	local moved_position = cached_position + velocity
	local physics_world = self.physics_world
	local collision_filter = override_collision_filter or self.collision_filter
	local last_position = self.last_position

	if last_position then
		self:_do_raycast(unit, last_position:unbox(), cached_position, physics_world, collision_filter)
	else
		last_position = Vector3Box()
		self.last_position = last_position
	end

	last_position:store(cached_position)
	self:_do_raycast(unit, cached_position, moved_position, physics_world, collision_filter)
end

PlayerProjectileImpactUnitExtension._do_raycast = function (self, unit, from, to, physics_world, collision_filter)
	local direction = to - from
	local length = Vector3.length(direction)
	direction = Vector3.normalize(direction)
	local offset = Vector3(0, 0, self.scene_query_height_offset)

	PhysicsWorld.prepare_actors_for_raycast(physics_world, from, direction, 0, 1, length * length)

	local result = PhysicsWorld.immediate_raycast(physics_world, from + offset, direction, length, "all", "collision_filter", collision_filter)

	if not result then
		return
	end

	local num_hits = #result

	for i = 1, num_hits, 1 do
		local hit = result[i]
		local hit_position = hit[INDEX_POSITION]
		local hit_distance = hit[INDEX_DISTANCE]
		local hit_normal = hit[INDEX_NORMAL]
		local hit_actor = hit[INDEX_ACTOR]
		local hit_unit = Actor.unit(hit_actor)
		local hit_self = hit_unit == unit

		if not hit_self then
			local num_actors = Unit.num_actors(hit_unit)
			local actor_index = nil

			for j = 0, num_actors - 1, 1 do
				local actor = Unit.actor(hit_unit, j)

				if hit_actor == actor then
					actor_index = j

					break
				end
			end

			assert(actor_index, "No actor index")
			self:impact(hit_unit, hit_position, direction, hit_normal, actor_index)
		end
	end
end

PlayerProjectileImpactUnitExtension.update_sphere_sweep = function (self, unit, input, dt, context, t, radius, collision_filter)
	local locomotion_extension = self.locomotion_extension

	if not locomotion_extension:moved_this_frame() then
		return
	end

	local offset = Vector3(0, 0, self.scene_query_height_offset)
	local velocity = locomotion_extension:current_velocity()
	local cached_position = POSITION_LOOKUP[unit] + offset
	local moved_position = cached_position + velocity + offset
	local physics_world = self.physics_world

	PhysicsWorld.prepare_actors_for_raycast(physics_world, cached_position, Vector3.normalize(moved_position - cached_position), 0, 1, Vector3.length_squared(moved_position - cached_position))

	local result = PhysicsWorld.linear_sphere_sweep(physics_world, cached_position, moved_position, radius, 100, "collision_filter", collision_filter, "report_initial_overlap")
	local unit = self.unit

	if result then
		local direction = Vector3.normalize(moved_position - cached_position)
		local num_hits = #result

		for i = 1, num_hits, 1 do
			local hit = result[i]
			local hit_actor = hit.actor
			local hit_position = hit.position
			local hit_normal = hit.normal
			local hit_distance = hit.distance
			local hit_unit = Actor.unit(hit_actor)
			local hit_self = hit_unit == unit

			if not hit_self then
				local num_actors = Unit.num_actors(hit_unit)
				local actor_index = nil

				for j = 0, num_actors - 1, 1 do
					local actor = Unit.actor(hit_unit, j)

					if hit_actor == actor then
						actor_index = j

						break
					end
				end

				assert(actor_index, "No actor index")
				self:impact(hit_unit, hit_position, direction, hit_normal, actor_index)
			end
		end
	end

	if script_data.debug_projectiles then
		QuickDrawerStay:sphere(cached_position, radius, Color(255, 255, 0, 0))
		QuickDrawerStay:sphere(moved_position, radius, Color(255, 0, 255, 0))
		QuickDrawerStay:line(moved_position, cached_position, Color(255, 0, 255, 255))
	end
end

return
