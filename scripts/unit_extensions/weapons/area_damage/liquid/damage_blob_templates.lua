-- chunkname: @scripts/unit_extensions/weapons/area_damage/liquid/damage_blob_templates.lua

DamageBlobTemplates = {}
DamageBlobTemplates.templates = {
	warpfire = {
		apply_buff_to_ai = true,
		apply_buff_to_player = true,
		blob_life_time = 4,
		blob_radius = 1,
		blob_separation_dist = 2,
		buff_template_name = "warpfire_thrower_ground_base",
		buff_template_type = "stormfiend_warpfire_ground",
		create_blobs = true,
		fx_max_height = 5,
		fx_max_radius = 5,
		fx_name_filled = "fx/chr_warp_fire_flamethrower_remains_01",
		fx_name_rim = "fx/wpnfx_warp_fire_remains_rim",
		fx_separation_dist = 0.8,
		fx_size_variable = "warp_fire_flamethrower_remains_size",
		init_function = "warpfire_thrower_fire_init",
		nav_cost_map_cost_type = "warpfire_thrower_warpfire",
		sfx_name_start = "Play_enemy_warpfire_thrower_fire_hit_ground",
		sfx_name_start_remains = "Play_enemy_stormfiend_fire_ground_loop",
		sfx_name_stop = "Stop_enemy_warpfire_thrower_fire_hit_ground",
		sfx_name_stop_remains = "Stop_enemy_stormfiend_fire_ground_loop",
		time_of_life = 5,
		update_function = "warpfire_thrower_fire_update",
		use_nav_cost_map_volumes = true,
		immune_breeds = {
			chaos_plague_wave_spawner = true,
			chaos_spawn = true,
			chaos_troll = true,
			skaven_rat_ogre = true,
			skaven_stormfiend = true,
			skaven_warpfire_thrower = true,
		},
	},
	warpfire_vs = {
		apply_buff_to_ai = true,
		apply_buff_to_player = true,
		blob_life_time = 4,
		blob_radius = 1,
		blob_separation_dist = 2,
		buff_template_name = "warpfire_thrower_ground_base",
		buff_template_type = "stormfiend_warpfire_ground",
		create_blobs = false,
		fx_max_height = 5,
		fx_max_radius = 5,
		fx_name_filled = "fx/chr_warp_fire_flamethrower_remains_01",
		fx_name_rim = "fx/wpnfx_warp_fire_remains_rim",
		fx_separation_dist = 0.8,
		fx_size_variable = "warp_fire_flamethrower_remains_size",
		init_function = "warpfire_thrower_fire_init_vs",
		nav_cost_map_cost_type = "warpfire_thrower_warpfire",
		sfx_name_start = "Play_enemy_warpfire_thrower_fire_hit_ground",
		sfx_name_start_remains = "Play_enemy_stormfiend_fire_ground_loop",
		sfx_name_stop = "Stop_enemy_warpfire_thrower_fire_hit_ground",
		sfx_name_stop_remains = "Stop_enemy_stormfiend_fire_ground_loop",
		time_of_life = 5,
		update_function = "warpfire_thrower_fire_update_vs",
		use_nav_cost_map_volumes = true,
		immune_breeds = {
			chaos_plague_wave_spawner = true,
			chaos_spawn = true,
			chaos_troll = true,
			skaven_rat_ogre = true,
			skaven_stormfiend = true,
			skaven_warpfire_thrower = true,
		},
	},
}

DamageBlobTemplates.warpfire_thrower_fire_init = function (self, t)
	local warpfire_thrower_unit = self._source_unit

	if Unit.alive(warpfire_thrower_unit) then
		local inventory_extension = ScriptUnit.extension(warpfire_thrower_unit, "ai_inventory_system")
		local inventory_template = Breeds.skaven_warpfire_thrower.default_inventory_template
		local warpfire_gun_unit = inventory_extension:get_unit(inventory_template)

		self._warpfire_gun_unit = warpfire_gun_unit

		local action = BreedActions.skaven_warpfire_thrower.shoot_warpfire_thrower
		local node_name = action.muzzle_node
		local muzzle_node = Unit.node(warpfire_gun_unit, node_name)

		self._muzzle_node = muzzle_node

		local world = self.world
		local particle_name = "fx/chr_warp_fire_flamethrower_01"
		local particle_id = World.create_particles(world, particle_name, Vector3.zero(), Quaternion.identity())

		World.link_particles(world, particle_id, warpfire_gun_unit, muzzle_node, Matrix4x4.identity(), "stop")

		self._warpfire_particle_id = particle_id

		local firing_time = action.firing_time

		self._firing_time_deadline = t + firing_time
		self._particle_life_time = Vector3Box(1, 0, 0)
	end
end

DamageBlobTemplates.warpfire_thrower_fire_update = function (self, t, dt, target_unit)
	local warpfire_gun_unit = self._warpfire_gun_unit
	local particle_id = self._warpfire_particle_id
	local source_unit_is_alive = Unit.alive(warpfire_gun_unit)
	local firing_time_deadline = self._firing_time_deadline
	local aborted = self.aborted
	local world = self.world

	if source_unit_is_alive and t < firing_time_deadline and not aborted then
		local muzzle_node = self._muzzle_node
		local muzzle_pos = Unit.world_position(warpfire_gun_unit, muzzle_node)
		local target_unit_pos = POSITION_LOOKUP[target_unit]
		local muzzle_to_target = target_unit_pos - muzzle_pos
		local length = Vector3.length(muzzle_to_target)
		local firepoint_1_pos = Vector3(muzzle_pos.x, muzzle_pos.y, muzzle_pos.z + 0.1)
		local dir_norm = Vector3.normalize(muzzle_to_target)
		local particle_name = "fx/chr_warp_fire_flamethrower_01"
		local effect_variable_id = World.find_particles_variable(world, particle_name, "firepoint_1")

		World.set_particles_variable(world, particle_id, effect_variable_id, firepoint_1_pos + dir_norm * 0.1)

		effect_variable_id = World.find_particles_variable(world, particle_name, "firepoint_2")

		World.set_particles_variable(world, particle_id, effect_variable_id, target_unit_pos - Vector3.up())

		effect_variable_id = World.find_particles_variable(world, particle_name, "firelife_1")

		local lifetime = length / 4
		local particle_life_time_vector = self._particle_life_time:unbox()

		particle_life_time_vector.x = lifetime

		World.set_particles_variable(world, particle_id, effect_variable_id, particle_life_time_vector)

		return true
	else
		if particle_id then
			World.stop_spawning_particles(world, particle_id)

			self._warpfire_particle_id = nil
		end

		return false
	end
end

DamageBlobTemplates.warpfire_thrower_fire_init_vs = function (self, t)
	local warpfire_thrower_unit = self._source_unit

	if Unit.alive(warpfire_thrower_unit) then
		local owner_blackboard = BLACKBOARDS[warpfire_thrower_unit]
		local warpfire_gun_unit = owner_blackboard.weapon_unit

		self._warpfire_gun_unit = warpfire_gun_unit

		local source_unit_is_alive = Unit.alive(warpfire_gun_unit)
		local breed = Unit.get_data(self._source_unit, "breed")

		self._attack_range = breed.shoot_warpfire_attack_range

		if source_unit_is_alive then
			local particle_name = "fx/chr_warp_fire_flamethrower_01"
			local fp_extension = ScriptUnit.has_extension(warpfire_thrower_unit, "first_person_system")

			if fp_extension and fp_extension:first_person_mode_active() then
				particle_name = "fx/chr_warp_fire_flamethrower_01_1p"
			end

			local node_name = "p_fx"
			local muzzle_node = Unit.node(warpfire_gun_unit, node_name)

			self._muzzle_node = muzzle_node

			local world = self.world
			local particle_id = World.create_particles(world, particle_name, Vector3.zero(), Quaternion.identity())

			World.link_particles(world, particle_id, warpfire_gun_unit, muzzle_node, Matrix4x4.identity(), "stop")

			self._warpfire_particle_id = particle_id
			self._particle_life_time = Vector3Box(1, 0, 0)
		end
	end
end

local INDEX_DISTANCE = 2
local INDEX_ACTOR = 4

DamageBlobTemplates.warpfire_thrower_fire_update_vs = function (self, t, dt, target_unit, physics_world)
	local warpfire_gun_unit = self._warpfire_gun_unit
	local particle_id = self._warpfire_particle_id
	local source_unit_is_alive = Unit.alive(warpfire_gun_unit)
	local aborted = self.aborted
	local world = self.world

	if source_unit_is_alive and not aborted then
		local muzzle_node = self._muzzle_node
		local muzzle_pos = Unit.world_position(warpfire_gun_unit, muzzle_node)
		local target_unit_pos = POSITION_LOOKUP[target_unit]
		local firepoint_1_pos = Vector3(muzzle_pos.x, muzzle_pos.y, muzzle_pos.z + 0.1)
		local go_id = Managers.state.unit_storage:go_id(self._source_unit)
		local network_manager = Managers.state.network
		local game = network_manager:game()
		local aim_direction = GameSession.game_object_field(game, go_id, "aim_direction")
		local raycast_filter = "filter_bot_ranged_line_of_sight_no_allies"
		local ray_length = self._attack_range * 2
		local hit_results = PhysicsWorld.raycast(physics_world, muzzle_pos, aim_direction, ray_length, "all", "types", "both", "all", "collision_filter", raycast_filter)
		local length = self._attack_range

		if hit_results then
			for i = 1, #hit_results do
				local actor = hit_results[i][INDEX_ACTOR]
				local hit_unit = Actor.unit(actor)
				local breed = hit_unit and Unit.get_data(hit_unit, "breed")
				local is_boss_or_los = not breed or breed.boss

				if is_boss_or_los and length > hit_results[i][INDEX_DISTANCE] then
					length = hit_results[i][INDEX_DISTANCE]

					break
				end
			end
		end

		local particle_name = "fx/chr_warp_fire_flamethrower_01"
		local effect_variable_id = World.find_particles_variable(world, particle_name, "firepoint_1")

		World.set_particles_variable(world, particle_id, effect_variable_id, firepoint_1_pos + aim_direction * 0.1)

		effect_variable_id = World.find_particles_variable(world, particle_name, "firepoint_2")

		World.set_particles_variable(world, particle_id, effect_variable_id, target_unit_pos - Vector3.up())

		effect_variable_id = World.find_particles_variable(world, particle_name, "firelife_1")

		local lifetime = length * 0.5
		local particle_life_time_vector = self._particle_life_time:unbox()

		particle_life_time_vector.x = lifetime

		World.set_particles_variable(world, particle_id, effect_variable_id, particle_life_time_vector)

		return true
	else
		if particle_id then
			World.stop_spawning_particles(world, particle_id)

			self._warpfire_particle_id = nil
		end

		return false
	end
end
