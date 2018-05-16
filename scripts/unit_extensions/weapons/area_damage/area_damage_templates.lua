AreaDamageTemplates = {}
local ai_units = {}
AreaDamageTemplates.templates = {
	area_dot_damage = {
		server = {
			update = function (damage_source, unit, radius, damage, life_time, life_timer, damage_interval, damage_timer, aoe_dot_player_take_damage)
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
							local unit_position = POSITION_LOOKUP[player_unit]
							local distance = Vector3.distance(unit_position, area_damage_position)
							local is_inside_radius = distance < radius

							if is_inside_radius then
								local damage_data = {
									area_damage_template = "area_dot_damage",
									unit = player_unit,
									damage = damage,
									damage_source = damage_source
								}
								damage_buffer[#damage_buffer + 1] = damage_data
							end
						end
					end
				end

				return true, damage_buffer
			end,
			do_damage = function (data, extension_unit)
				local unit = data.unit
				local damage = data.damage
				local damage_source = data.damage_source

				DamageUtils.add_damage_network(unit, extension_unit, damage, "torso", "damage_over_time", Vector3(1, 0, 0), damage_source)
			end
		},
		client = {
			update = function (world, radius, aoe_unit, player_screen_effect_name, player_unit_particles, aoe_dot_player_take_damage)
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
								start_time = t
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
						elseif not is_inside_radius and player_unit_particles[player_unit] and player_unit_particles[player_unit].fade_time <= t then
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
				local effect_variable_id = nil

				if particle_var_table ~= nil then
					for index, element in pairs(particle_var_table) do
						effect_variable_id = World.find_particles_variable(world, effect_name, element.particle_variable)

						World.set_particles_variable(world, effect_id, effect_variable_id, element.value)
					end
				end

				return effect_id
			end,
			destroy = function ()
				return
			end
		}
	},
	area_dot_damage_courtyard_well_hack = {
		server = {
			update = function (damage_source, unit, radius, damage, life_time, life_timer, damage_interval, damage_timer, aoe_dot_player_take_damage)
				local area_damage_position = Unit.local_position(unit, 0)

				if life_time < life_timer then
					return false
				end

				if damage_timer > 0 and damage_timer < damage_interval then
					return false
				end

				local damage_buffer = {}

				if aoe_dot_player_take_damage then
					for _, player in pairs(Managers.player:players()) do
						local player_unit = player.player_unit

						if player_unit ~= nil then
							local unit_position = POSITION_LOOKUP[player_unit]
							local distance = Vector3.distance(unit_position, area_damage_position)
							local is_inside_radius = distance < radius

							if is_inside_radius then
								local damage_data = {
									area_damage_template = "area_dot_damage_courtyard_well_hack",
									unit = player_unit,
									damage = damage,
									damage_source = damage_source
								}
								damage_buffer[#damage_buffer + 1] = damage_data
							end
						end
					end
				end

				return true, damage_buffer
			end,
			do_damage = function (data, extension_unit)
				local unit = data.unit
				local damage = data.damage
				local damage_source = data.damage_source

				DamageUtils.add_damage_network(unit, unit, damage, "torso", "damage_over_time", Vector3(1, 0, 0), damage_source)
			end
		},
		client = {
			update = function (world, radius, aoe_unit, player_screen_effect_name, player_unit_particles, aoe_dot_player_take_damage)
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
								start_time = t
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
						elseif not is_inside_radius and player_unit_particles[player_unit] and player_unit_particles[player_unit].fade_time <= t then
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
				local effect_variable_id = nil

				if particle_var_table ~= nil then
					for index, element in pairs(particle_var_table) do
						effect_variable_id = World.find_particles_variable(world, effect_name, element.particle_variable)

						World.set_particles_variable(world, effect_id, effect_variable_id, element.value)
					end
				end

				return effect_id
			end,
			destroy = function ()
				return
			end
		}
	},
	explosion_template_aoe = {
		server = {
			update = function (damage_source, unit, radius, damage, life_time, life_timer, damage_interval, damage_timer, aoe_dot_player_take_damage, explosion_template_name)
				if life_time < life_timer then
					Managers.state.unit_spawner:mark_for_deletion(unit)

					return false
				end

				local area_damage_position = Unit.world_position(unit, 0)
				local explosion_template = ExplosionTemplates[explosion_template_name]
				local aoe_data = explosion_template.aoe
				local friendly_fire_data = true

				if explosion_template.friendly_fire ~= nil then
					friendly_fire_data = explosion_template.friendly_fire
				end

				local attack_template_name = aoe_data.attack_template
				local gravity_well = aoe_data.gravity_well
				local num_ai_units = nil

				if (attack_template_name or gravity_well) and (damage_timer <= 0 or damage_interval <= damage_timer) then
					num_ai_units = AiUtils.broadphase_query(area_damage_position, radius, ai_units)
				end

				if gravity_well and num_ai_units then
					local t = Managers.time:time("game")
					local duration = damage_interval * 2
					local gravity_well_strength = gravity_well.strength
					local gravity_well_position = area_damage_position + Vector3(0, 0, gravity_well.z_offset)
					local BLACKBOARDS = BLACKBOARDS

					for i = 1, num_ai_units, 1 do
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
					local dot_template_name = aoe_data.dot_template_name
					local hit_zone_name = "full"
					local dot_damage = aoe_data.dot_damage

					for i = 1, num_ai_units, 1 do
						local ai_unit = ai_units[i]
						local damage_data = {
							area_damage_template = "explosion_template_aoe",
							unit = ai_unit,
							damage_source = damage_source,
							hit_zone_name = hit_zone_name,
							dot_template_name = dot_template_name
						}
						damage_buffer[#damage_buffer + 1] = damage_data
					end

					local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()

					if aoe_dot_player_take_damage and difficulty_settings.friendly_fire_ranged and friendly_fire_data then
						for _, player in pairs(Managers.player:players()) do
							local player_unit = player.player_unit

							if player_unit ~= nil then
								local unit_position = POSITION_LOOKUP[player_unit]
								local distance = Vector3.distance(unit_position, area_damage_position)
								local is_inside_radius = distance < radius
								local backstab_multiplier = 1

								if is_inside_radius then
									local damage_data = {
										area_damage_template = "explosion_template_aoe",
										unit = player_unit,
										damage_source = damage_source,
										hit_zone_name = hit_zone_name
									}
									damage_buffer[#damage_buffer + 1] = damage_data
								end
							end
						end
					end

					return true, damage_buffer
				end
			end,
			do_damage = function (data, extension_unit)
				local dot_template_name = data.dot_template_name

				if dot_template_name then
					local attacker_unit = extension_unit
					local target_unit = data.unit
					local hit_zone_name = data.hit_zone_name
					local damage_source = data.damage_source
					local dot_type = DotTypeLookup[dot_template_name]

					if dot_type then
						local dot_func = Dots[dot_type]

						dot_func(dot_template_name, nil, nil, nil, target_unit, attacker_unit, hit_zone_name, damage_source, nil, nil)
					end
				end
			end
		},
		client = {
			update = function (world, radius, aoe_unit, player_screen_effect_name, player_unit_particles, damage_players, explosion_template_name)
				return
			end,
			spawn_effect = function (world, unit, effect_name, particle_var_table, override_position)
				local position = override_position or Unit.world_position(unit, 0)
				local effect_id = World.create_particles(world, effect_name, position)
				local effect_variable_id = nil

				if particle_var_table ~= nil then
					for index, element in pairs(particle_var_table) do
						effect_variable_id = World.find_particles_variable(world, effect_name, element.particle_variable)

						World.set_particles_variable(world, effect_id, effect_variable_id, element.value)
					end
				end

				return effect_id
			end
		}
	},
	area_poison_ai_random_death = {
		server = {
			update = function (damage_source, unit, radius, death_interval, damage_timer)
				if damage_timer > 0 and damage_timer < death_interval then
					return false
				end

				local area_damage_position = Unit.world_position(unit, 0)
				local damage_buffer = {}
				local ai_units_n = AiUtils.broadphase_query(area_damage_position, radius, ai_units)

				for i = 1, ai_units_n, 1 do
					local ai_unit = ai_units[i]
					local breed = Unit.get_data(ai_unit, "breed")
					local chance_to_die = 100 - breed.poison_resistance
					local health_extension = ScriptUnit.extension(ai_unit, "health_system")

					assert(health_extension)

					local is_alive = health_extension:is_alive()

					if is_alive then
						local die_roll = math.random(1, 100)

						if die_roll < chance_to_die then
							local damage_data = {
								area_damage_template = "area_poison_ai_random_death",
								unit = ai_unit
							}
							damage_buffer[#damage_buffer + 1] = damage_data
						end
					end
				end

				return true, damage_buffer
			end,
			do_damage = function (data, extension_unit)
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

				weapon_system:send_rpc_attack_hit(damage_source_id, unit_id, unit_id, hit_zone_id, damage_direction, damage_profile_id, "power_level", power_level, "hit_target_index", nil, "blocking", false, "shield_break_procced", false, "boost_curve_multiplier", 0, "is_critical_strike", false)
			end
		}
	}
}

AreaDamageTemplates.get_template = function (area_damage_template, is_husk)
	local templates = AreaDamageTemplates.templates
	local husk_key = (is_husk == true and "husk") or (is_husk == false and "unit") or nil
	local template = (husk_key and templates[area_damage_template][husk_key]) or templates[area_damage_template]

	fassert(template, "no area_damage_template called %s", area_damage_template)

	return template
end

return
