DamageBlobTemplates = {
	templates = {
		warpfire = {
			fx_separation_dist = 0.8,
			fx_max_height = 5,
			blob_separation_dist = 2,
			sfx_name_stop_remains = "Stop_enemy_stormfiend_fire_ground_loop",
			nav_cost_map_cost_type = "warpfire_thrower_warpfire",
			blob_life_time = 4,
			buff_template_name = "warpfire_thrower_ground_base",
			blob_radius = 1,
			fx_name_rim = "fx/wpnfx_warp_fire_remains_rim",
			apply_buff_to_player = true,
			sfx_name_start = "Play_enemy_warpfire_thrower_fire_hit_ground",
			init_function = "warpfire_thrower_fire_init",
			fx_name_filled = "fx/chr_warp_fire_flamethrower_remains_01",
			apply_buff_to_ai = true,
			time_of_life = 5,
			fx_size_variable = "warp_fire_flamethrower_remains_size",
			update_function = "warpfire_thrower_fire_update",
			use_nav_cost_map_volumes = true,
			buff_template_type = "stormfiend_warpfire_ground",
			sfx_name_stop = "Stop_enemy_warpfire_thrower_fire_hit_ground",
			fx_max_radius = 5,
			sfx_name_start_remains = "Play_enemy_stormfiend_fire_ground_loop",
			immune_breeds = {
				chaos_troll = true,
				chaos_spawn = true,
				skaven_warpfire_thrower = true,
				skaven_rat_ogre = true,
				chaos_plague_wave_spawner = true,
				skaven_stormfiend = true
			}
		}
	},
	warpfire_thrower_fire_init = function (self, t)
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
	end,
	warpfire_thrower_fire_update = function (self, t, dt, target_unit)
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
}

return
