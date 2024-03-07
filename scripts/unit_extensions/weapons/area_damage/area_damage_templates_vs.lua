-- chunkname: @scripts/unit_extensions/weapons/area_damage/area_damage_templates_vs.lua

local settings = DLCSettings.carousel
local ai_units = {}

settings.area_damage_templates = {
	globadier_area_dot_damage_vs = {
		server = {
			update = function (damage_source, unit, radius, damage, life_time, life_timer, damage_interval, damage_timer, aoe_dot_player_take_damage, explosion_template_name, slow_modifier, side, custom_data_table)
				if life_time < life_timer then
					Managers.state.unit_spawner:mark_for_deletion(unit)

					return false
				end

				local area_damage_position = Unit.local_position(unit, 0)

				if custom_data_table and not custom_data_table.baked_timer then
					custom_data_table.baked_timer = damage_interval / 2
				end

				if custom_data_table and custom_data_table.baked_timer then
					if damage_timer >= 0 and damage_timer < custom_data_table.baked_timer then
						return false
					end
				elseif damage_timer >= 0 and damage_timer < damage_interval then
					return false
				end

				local damage_buffer = {}

				if aoe_dot_player_take_damage then
					for _, player in pairs(Managers.player:players()) do
						local player_unit = player.player_unit

						if player_unit ~= nil then
							local blackboard = BLACKBOARDS[player_unit]
							local breed = blackboard.breed

							if breed.poison_resistance < 100 then
								local unit_position = POSITION_LOOKUP[player_unit]
								local distance = Vector3.distance(unit_position, area_damage_position)
								local is_inside_radius = distance < radius

								if is_inside_radius then
									local damage_data = {
										area_damage_template = "globadier_area_dot_damage_vs",
										unit = player_unit,
										damage = damage,
										damage_source = damage_source,
									}

									damage_buffer[#damage_buffer + 1] = damage_data
								end
							end
						end
					end
				end

				return true, damage_buffer
			end,
			do_damage = function (data, extension_unit, source_attacker_unit, custom_data_table)
				local hit_unit = data.unit
				local damage = data.damage
				local damage_source = data.damage_source
				local hit_ragdoll_actor

				if not custom_data_table.ramping_area_damage then
					custom_data_table.ramping_area_damage = {}
				end

				local ramping_area_damage = custom_data_table.ramping_area_damage

				if not ramping_area_damage[hit_unit] then
					ramping_area_damage[hit_unit] = 0.2
				else
					ramping_area_damage[hit_unit] = ramping_area_damage[hit_unit] + 0.15
				end

				if ramping_area_damage[hit_unit] < 1 then
					damage = damage * ramping_area_damage[hit_unit]
				end

				DamageUtils.add_damage_network(hit_unit, extension_unit, damage, "torso", "gas", nil, Vector3(1, 0, 0), damage_source, hit_ragdoll_actor, source_attacker_unit, nil)
			end,
		},
		client = {
			update = function (world, radius, aoe_unit, player_screen_effect_name, player_unit_particles, aoe_dot_player_take_damage, explosion_template_name, slow_modifier)
				if Development.parameter("screen_space_player_camera_reactions") == false then
					return
				end

				for _, player in pairs(Managers.player:players()) do
					local player_unit = player.player_unit

					if player.local_player and Unit.alive(player_unit) and aoe_dot_player_take_damage and player_screen_effect_name ~= nil and not ScriptUnit.extension(player_unit, "buff_system"):has_buff_type("poison_screen_effect_immune") then
						local unit_position = POSITION_LOOKUP[player_unit]
						local area_damage_position = Unit.local_position(aoe_unit, 0)
						local distance_sq = Vector3.distance_squared(unit_position, area_damage_position)
						local is_inside_radius = distance_sq < radius * radius
						local t = Managers.time:time("game")

						if is_inside_radius and not player_unit_particles[player_unit] then
							local particle_id = World.create_particles(world, player_screen_effect_name, Vector3(0, 0, 0))

							player_unit_particles[player_unit] = {
								particle_id = particle_id,
								start_time = t,
							}

							local status_extension = ScriptUnit.has_extension(player_unit, "status_system")

							if status_extension then
								status_extension:hit_by_globadier_poison()
							end
						elseif is_inside_radius and t >= player_unit_particles[player_unit].start_time + 5 then
							local particle_id = player_unit_particles[player_unit].particle_id

							World.stop_spawning_particles(world, particle_id)

							player_unit_particles[player_unit] = nil
						elseif not is_inside_radius and player_unit_particles[player_unit] and not player_unit_particles[player_unit].fade_time then
							local particle_id = player_unit_particles[player_unit].particle_id

							World.stop_spawning_particles(world, particle_id)

							local new_particle_id = World.create_particles(world, player_screen_effect_name, Vector3(0, 0, 0))

							player_unit_particles[player_unit].fade_time = t + 1.5
							player_unit_particles[player_unit].particle_id = new_particle_id
						elseif not is_inside_radius and player_unit_particles[player_unit] and t >= player_unit_particles[player_unit].fade_time then
							local particle_id = player_unit_particles[player_unit].particle_id

							World.stop_spawning_particles(world, particle_id)

							player_unit_particles[player_unit] = nil
						end
					end
				end
			end,
			spawn_effect = function (world, unit, effect_name, particle_var_table)
				local position = Unit.local_position(unit, 0)
				local effect_id = World.create_particles(world, effect_name, position)

				if particle_var_table ~= nil then
					for _, element in pairs(particle_var_table) do
						local effect_variable_id = World.find_particles_variable(world, effect_name, element.particle_variable)

						World.set_particles_variable(world, effect_id, effect_variable_id, element.value)
					end
				end

				return effect_id
			end,
			destroy = function ()
				return
			end,
		},
	},
	sorcerer_area_dot_damage_vs = {
		server = {
			update = function (damage_source, unit, radius, damage, life_time, life_timer, damage_interval, damage_timer, aoe_dot_player_take_damage, explosion_template_name, slow_modifier)
				if life_time < life_timer then
					Managers.state.unit_spawner:mark_for_deletion(unit)

					return false
				end

				local area_damage_position = Unit.local_position(unit, 0)

				if damage_timer >= 0 and damage_timer < damage_interval then
					return false
				end

				local damage_buffer = {}

				if aoe_dot_player_take_damage then
					for _, player in pairs(Managers.player:players()) do
						local player_unit = player.player_unit

						if player_unit ~= nil then
							local blackboard = BLACKBOARDS[player_unit]
							local breed = blackboard.breed

							if breed.poison_resistance < 100 then
								local unit_position = POSITION_LOOKUP[player_unit]
								local distance = Vector3.distance(unit_position, area_damage_position)
								local is_inside_radius = distance < radius

								if is_inside_radius then
									local damage_data = {
										area_damage_template = "sorcerer_area_dot_damage",
										unit = player_unit,
										damage = damage,
										damage_source = damage_source,
									}

									damage_buffer[#damage_buffer + 1] = damage_data
								end
							end
						end
					end
				end

				return true, damage_buffer
			end,
			do_damage = function (data, extension_unit, source_attacker_unit)
				local hit_unit = data.unit
				local damage = data.damage
				local damage_source = data.damage_source
				local hit_ragdoll_actor

				DamageUtils.add_damage_network(hit_unit, extension_unit, damage, "torso", "damage_over_time", nil, Vector3(1, 0, 0), damage_source, hit_ragdoll_actor, source_attacker_unit)
			end,
		},
		client = {
			update = function (world, radius, aoe_unit, player_screen_effect_name, player_unit_particles, aoe_dot_player_take_damage, explosion_template_name, slow_modifier)
				if Development.parameter("screen_space_player_camera_reactions") == false then
					return
				end

				for _, player in pairs(Managers.player:players()) do
					local player_unit = player.player_unit

					if player.local_player and Unit.alive(player_unit) and aoe_dot_player_take_damage and player_screen_effect_name ~= nil and not ScriptUnit.extension(player_unit, "buff_system"):has_buff_type("poison_screen_effect_immune") then
						local unit_position = POSITION_LOOKUP[player_unit]
						local area_damage_position = Unit.local_position(aoe_unit, 0)
						local distance_sq = Vector3.distance_squared(unit_position, area_damage_position)
						local is_inside_radius = distance_sq < radius * radius
						local t = Managers.time:time("game")

						if is_inside_radius and not player_unit_particles[player_unit] then
							local particle_id = World.create_particles(world, player_screen_effect_name, Vector3(0, 0, 0))

							player_unit_particles[player_unit] = {
								particle_id = particle_id,
								start_time = t,
							}
						elseif is_inside_radius and t >= player_unit_particles[player_unit].start_time + 5 then
							local particle_id = player_unit_particles[player_unit].particle_id

							World.stop_spawning_particles(world, particle_id)

							player_unit_particles[player_unit] = nil
						elseif not is_inside_radius and player_unit_particles[player_unit] and not player_unit_particles[player_unit].fade_time then
							local particle_id = player_unit_particles[player_unit].particle_id

							World.stop_spawning_particles(world, particle_id)

							local new_particle_id = World.create_particles(world, player_screen_effect_name, Vector3(0, 0, 0))

							player_unit_particles[player_unit].fade_time = t + 1.5
							player_unit_particles[player_unit].particle_id = new_particle_id
						elseif not is_inside_radius and player_unit_particles[player_unit] and t >= player_unit_particles[player_unit].fade_time then
							local particle_id = player_unit_particles[player_unit].particle_id

							World.stop_spawning_particles(world, particle_id)

							player_unit_particles[player_unit] = nil
						end
					end
				end
			end,
			spawn_effect = function (world, unit, effect_name, particle_var_table)
				local position = Unit.local_position(unit, 0)
				local effect_id = World.create_particles(world, effect_name, position)

				if particle_var_table ~= nil then
					for _, element in pairs(particle_var_table) do
						local effect_variable_id = World.find_particles_variable(world, effect_name, element.particle_variable)

						World.set_particles_variable(world, effect_id, effect_variable_id, element.value)
					end
				end

				return effect_id
			end,
			destroy = function ()
				return
			end,
		},
	},
	explosion_template_aoe_vs = {
		server = {
			update = function (damage_source, unit, radius, damage, life_time, life_timer, damage_interval, damage_timer, aoe_dot_player_take_damage, explosion_template_name, slow_modifier, side)
				if life_time < life_timer then
					Managers.state.unit_spawner:mark_for_deletion(unit)

					return false
				end

				local area_damage_position = Unit.world_position(unit, 0)
				local explosion_template = ExplosionUtils.get_template(explosion_template_name)
				local aoe_data = explosion_template.aoe

				if explosion_template.friendly_fire ~= nil then
					friendly_fire_data = explosion_template.friendly_fire
				end

				local attack_template_name = aoe_data.attack_template
				local gravity_well = aoe_data.gravity_well
				local num_ai_units

				if (attack_template_name or gravity_well) and (damage_timer <= 0 or damage_interval <= damage_timer) then
					local broadphase_query_categories = side.enemy_broadphase_categories

					num_ai_units = AiUtils.broadphase_query(area_damage_position, radius, ai_units, broadphase_query_categories)
				end

				if gravity_well and num_ai_units then
					local t = Managers.time:time("game")
					local duration = damage_interval * 2
					local gravity_well_strength = gravity_well.strength
					local gravity_well_position = area_damage_position + Vector3(0, 0, gravity_well.z_offset)
					local BLACKBOARDS = BLACKBOARDS

					for i = 1, num_ai_units do
						local ai_unit = ai_units[i]
						local bb = BLACKBOARDS[ai_unit]

						if bb.gravity_well_position then
							bb.gravity_well_position:store(gravity_well_position)
						else
							bb.gravity_well_position = Vector3Box(gravity_well_position)
						end

						bb.gravity_well_strength = gravity_well_strength
						bb.gravity_well_time = t + duration
					end
				end

				if attack_template_name and num_ai_units then
					local damage_buffer = {}
					local hit_zone_name = "full"

					for i = 1, num_ai_units do
						local ai_unit = ai_units[i]
						local damage_data = {
							area_damage_template = "explosion_template_aoe",
							unit = ai_unit,
							damage_source = damage_source,
							hit_zone_name = hit_zone_name,
							aoe_data = aoe_data,
						}

						damage_buffer[#damage_buffer + 1] = damage_data
					end

					if aoe_dot_player_take_damage then
						local enemy_players = side.ENEMY_PLAYER_AND_BOT_UNITS

						for _, player_unit in ipairs(enemy_players) do
							local unit_position = POSITION_LOOKUP[player_unit]
							local distance = Vector3.distance(unit_position, area_damage_position)
							local is_inside_radius = distance < radius
							local ghost_ext = ScriptUnit.has_extension(player_unit, "ghost_mode_system")
							local is_in_ghost_mode = ghost_ext and ghost_ext:is_in_ghost_mode()

							if is_inside_radius and not is_in_ghost_mode then
								local damage_data = {
									area_damage_template = "explosion_template_aoe",
									unit = player_unit,
									damage_source = damage_source,
									hit_zone_name = hit_zone_name,
									aoe_data = aoe_data,
								}

								damage_buffer[#damage_buffer + 1] = damage_data
							end
						end
					end

					return true, damage_buffer
				end
			end,
			do_damage = function (data, extension_unit, source_attacker_unit)
				local target_unit = data.unit
				local attacker_unit = extension_unit
				local hit_zone_name = data.hit_zone_name
				local damage_source = data.damage_source
				local aoe_data = data.aoe_data
				local custom_dot = FrameTable.alloc_table()

				custom_dot.dot_template_name = aoe_data.dot_template_name
				custom_dot.dot_balefire_variant = aoe_data.dot_balefire_variant

				local damage_profile, target_index, power_level, boost_curve_multiplier, is_critical_strike

				DamageUtils.apply_dot(damage_profile, target_index, power_level, target_unit, attacker_unit, hit_zone_name, damage_source, boost_curve_multiplier, is_critical_strike, aoe_data, source_attacker_unit, custom_dot)
			end,
		},
		client = {
			update = function (world, radius, aoe_unit, player_screen_effect_name, player_unit_particles, damage_players, explosion_template_name, side)
				return
			end,
			spawn_effect = function (world, unit, effect_name, particle_var_table, override_position)
				local position = override_position or Unit.world_position(unit, 0)
				local effect_id = World.create_particles(world, effect_name, position)

				if particle_var_table ~= nil then
					for _, element in pairs(particle_var_table) do
						local effect_variable_id = World.find_particles_variable(world, effect_name, element.particle_variable)

						World.set_particles_variable(world, effect_id, effect_variable_id, element.value)
					end
				end

				return effect_id
			end,
		},
	},
	area_poison_ai_random_death_vs = {
		server = {
			update = function (damage_source, unit, radius, death_interval, damage_timer)
				if damage_timer > 0 and damage_timer < death_interval then
					return false
				end

				local area_damage_position = Unit.world_position(unit, 0)
				local damage_buffer = {}
				local ai_units_n = AiUtils.broadphase_query(area_damage_position, radius, ai_units)

				for i = 1, ai_units_n do
					local ai_unit = ai_units[i]

					if HEALTH_ALIVE[ai_unit] then
						local die_roll = math.random(1, 100)
						local breed = Unit.get_data(ai_unit, "breed")
						local chance_to_die = 100 - breed.poison_resistance

						if die_roll <= chance_to_die then
							local damage_data = {
								area_damage_template = "area_poison_ai_random_death",
								unit = ai_unit,
							}

							damage_buffer[#damage_buffer + 1] = damage_data
						end
					end
				end

				return true, damage_buffer
			end,
			do_damage = function (data, extension_unit, source_unit)
				local network_manager = Managers.state.network
				local unit = data.unit
				local power_level = MAX_POWER_LEVEL
				local area_damage_position = Unit.world_position(extension_unit, 0)
				local unit_position = POSITION_LOOKUP[unit]
				local damage_direction = Vector3.normalize(unit_position - area_damage_position)
				local damage_source = "skaven_poison_wind_globadier"
				local damage_source_id = NetworkLookup.damage_sources[damage_source]
				local damage_profile_name = "globadier_gas_cloud"
				local damage_profile_id = NetworkLookup.damage_profiles[damage_profile_name]
				local unit_id = network_manager:unit_game_object_id(unit)
				local hit_zone_name = "full"
				local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
				local weapon_system = Managers.state.entity:system("weapon_system")

				weapon_system:send_rpc_attack_hit(damage_source_id, unit_id, unit_id, hit_zone_id, area_damage_position, damage_direction, damage_profile_id, "power_level", power_level, "hit_target_index", nil, "blocking", false, "shield_break_procced", false, "boost_curve_multiplier", 0, "is_critical_strike", false)

				local is_ai_unit = DamageUtils.is_ai(unit)

				if is_ai_unit and not HEALTH_ALIVE[unit] then
					QuestSettings.check_num_enemies_killed_by_poison(unit, extension_unit)
				end
			end,
		},
	},
	mutator_life_poison_vs = {
		server = {
			update = function (damage_source, unit, radius, damage, life_time, life_timer, damage_interval, damage_timer, aoe_dot_player_take_damage, explosion_template_name, slow_modifier)
				if life_time < life_timer then
					Managers.state.unit_spawner:mark_for_deletion(unit)

					return false
				end

				local area_damage_position = Unit.local_position(unit, 0)

				if damage_timer >= 0 and damage_timer < damage_interval then
					return false
				end

				local damage_buffer = {}

				if aoe_dot_player_take_damage then
					for _, player in pairs(Managers.player:players()) do
						local player_unit = player.player_unit

						if player_unit ~= nil then
							local blackboard = BLACKBOARDS[player_unit]
							local breed = blackboard.breed

							if breed.poison_resistance < 100 then
								local unit_position = POSITION_LOOKUP[player_unit]
								local distance = Vector3.distance(unit_position, area_damage_position)
								local is_inside_radius = distance < radius

								if is_inside_radius then
									local damage_data = {
										area_damage_template = "mutator_life_poison",
										unit = player_unit,
										damage = damage,
										damage_source = damage_source,
									}

									damage_buffer[#damage_buffer + 1] = damage_data
								end
							end
						end
					end
				end

				return true, damage_buffer
			end,
			do_damage = function (data, extension_unit)
				local hit_unit = data.unit
				local damage = data.damage
				local damage_source = data.damage_source

				DamageUtils.add_damage_network(hit_unit, extension_unit, damage, "torso", "damage_over_time", nil, Vector3(1, 0, 0), damage_source)
			end,
		},
		client = {
			update = function (world, radius, aoe_unit, player_screen_effect_name, player_unit_particles, aoe_dot_player_take_damage, explosion_template_name, slow_modifier)
				if Development.parameter("screen_space_player_camera_reactions") == false then
					return
				end

				for _, player in pairs(Managers.player:players()) do
					local player_unit = player.player_unit

					if player.local_player and Unit.alive(player_unit) and aoe_dot_player_take_damage and player_screen_effect_name ~= nil and not ScriptUnit.extension(player_unit, "buff_system"):has_buff_type("poison_screen_effect_immune") then
						local unit_position = POSITION_LOOKUP[player_unit]
						local area_damage_position = Unit.local_position(aoe_unit, 0)
						local distance_sq = Vector3.distance_squared(unit_position, area_damage_position)
						local is_inside_radius = distance_sq < radius * radius
						local t = Managers.time:time("game")

						if ScorpionSeasonalSettings.current_season_id == 1 and is_inside_radius then
							local statistics_db = Managers.player:statistics_db()
							local player_stats_id = player:stats_id()
							local life_stat_id = "weave_life_stepped_in_bush"

							statistics_db:increment_stat(player_stats_id, "season_1", life_stat_id)
						end

						if is_inside_radius and not player_unit_particles[player_unit] then
							local particle_id = World.create_particles(world, player_screen_effect_name, Vector3(0, 0, 0))

							player_unit_particles[player_unit] = {
								particle_id = particle_id,
								start_time = t,
							}
						elseif is_inside_radius and t >= player_unit_particles[player_unit].start_time + 5 then
							local particle_id = player_unit_particles[player_unit].particle_id

							World.stop_spawning_particles(world, particle_id)

							player_unit_particles[player_unit] = nil
						elseif not is_inside_radius and player_unit_particles[player_unit] and not player_unit_particles[player_unit].fade_time then
							local particle_id = player_unit_particles[player_unit].particle_id

							World.stop_spawning_particles(world, particle_id)

							local new_particle_id = World.create_particles(world, player_screen_effect_name, Vector3(0, 0, 0))

							player_unit_particles[player_unit].fade_time = t + 1.5
							player_unit_particles[player_unit].particle_id = new_particle_id
						elseif not is_inside_radius and player_unit_particles[player_unit] and t >= player_unit_particles[player_unit].fade_time then
							local particle_id = player_unit_particles[player_unit].particle_id

							World.stop_spawning_particles(world, particle_id)

							player_unit_particles[player_unit] = nil
						end
					end
				end
			end,
			spawn_effect = function (world, unit, effect_name, particle_var_table)
				local position = Unit.local_position(unit, 0)
				local effect_id = World.create_particles(world, effect_name, position)

				if particle_var_table ~= nil then
					for _, element in pairs(particle_var_table) do
						local effect_variable_id = World.find_particles_variable(world, effect_name, element.particle_variable)

						World.set_particles_variable(world, effect_id, effect_variable_id, element.value)
					end
				end

				return effect_id
			end,
			destroy = function ()
				return
			end,
		},
	},
}
