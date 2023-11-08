ProjectileTemplates = {}
local check_for_afro_hit = nil
ProjectileTemplates.trajectory_templates = {
	straight_target_traversal = {
		unit = {
			update = function (speed, radians, gravity, initial_position, target_vector, time_lived, dt, traversal_data)
				local target_position = traversal_data.current_target
				local position = traversal_data.position
				local direction = Vector3.normalize(target_position - position)
				local move_delta = direction * speed * dt
				local new_position = move_delta + position

				return new_position
			end
		},
		husk = {
			update = function (speed, radians, gravity, initial_position, target_vector, time_lived, dt, traversal_data)
				local target_position = traversal_data.current_target
				local position = traversal_data.position
				local direction = Vector3.normalize(target_position - position)
				local move_delta = direction * speed * dt
				local new_position = move_delta + position

				return new_position
			end
		}
	},
	right_spinning_target_traversal = {
		unit = {
			update = function (speed, radians, gravity, initial_position, target_vector, time_lived, dt, target_data)
				local max_t = 0.1
				local target_position = target_data.current_target
				local position = target_data.position
				local direction = Vector3.normalize(target_position - initial_position)
				local point_on_line = Geometry.closest_point_on_line(position, initial_position, target_position)
				local dist_to_target = Vector3.distance(point_on_line, target_position)
				local dist_from_init = Vector3.distance(initial_position, target_position)
				local current_lerp_t = 1 - dist_to_target / dist_from_init
				local wanted_pos = Vector3.lerp(initial_position, target_position, current_lerp_t)
				local lerp_t = current_lerp_t
				local offset = nil
				local spin_speed = speed * 2
				local curve_lerp_t = nil

				if lerp_t < max_t then
					curve_lerp_t = math.clamp(lerp_t / max_t, 0, 1)
					offset = math.easeInCubic(curve_lerp_t)
				elseif lerp_t < 1 then
					speed = speed / 5
					lerp_t = lerp_t / 1
					curve_lerp_t = math.clamp((lerp_t - max_t) / (1 - max_t), 0, 1)
					offset = 1 - math.easeOutCubic(curve_lerp_t)
					local offset_speed = offset

					if offset < 0.3 then
						offset_speed = 0.3
					end

					speed = speed * (1 + math.ease_out_quad(curve_lerp_t)) / offset_speed
					spin_speed = spin_speed * offset
				else
					offset = 0
				end

				local offset_pos = Vector3(math.cos(time_lived * spin_speed), 0, -math.sin(time_lived * spin_speed))
				offset_pos = Quaternion.rotate(Quaternion.look(direction, Vector3.up()), offset_pos) * offset
				speed = speed * (1 + math.easeInCubic(lerp_t))
				local max_move_distance = Vector3.distance(target_position, position)
				local delta_move_distance = math.clamp(speed * dt, 0, max_move_distance)
				local new_position = wanted_pos + direction * delta_move_distance + offset_pos

				return new_position
			end
		}
	},
	left_spinning_target_traversal = {
		unit = {
			update = function (speed, radians, gravity, initial_position, target_vector, time_lived, dt, target_data)
				local max_t = 0.1
				local target_position = target_data.current_target
				local position = target_data.position
				local direction = Vector3.normalize(target_position - initial_position)
				local point_on_line = Geometry.closest_point_on_line(position, initial_position, target_position)
				local dist_to_target = Vector3.distance(point_on_line, target_position)
				local dist_from_init = Vector3.distance(initial_position, target_position)
				local current_lerp_t = 1 - dist_to_target / dist_from_init
				local wanted_pos = Vector3.lerp(initial_position, target_position, current_lerp_t)
				local lerp_t = current_lerp_t
				local offset = nil
				local spin_speed = speed * 2
				local curve_lerp_t = nil

				if lerp_t < max_t then
					curve_lerp_t = math.clamp(lerp_t / max_t, 0, 1)
					offset = math.easeInCubic(curve_lerp_t)
				elseif lerp_t < 1 then
					speed = speed / 5
					lerp_t = lerp_t / 1
					curve_lerp_t = math.clamp((lerp_t - max_t) / (1 - max_t), 0, 1)
					offset = 1 - math.easeOutCubic(curve_lerp_t)
					local offset_speed = offset

					if offset < 0.3 then
						offset_speed = 0.3
					end

					speed = speed * (1 + math.ease_out_quad(curve_lerp_t)) / offset_speed
					spin_speed = spin_speed * offset
				else
					offset = 0
				end

				local offset_pos = Vector3(math.sin(time_lived * spin_speed), 0, -math.cos(time_lived * spin_speed))
				offset_pos = Quaternion.rotate(Quaternion.look(direction, Vector3.up()), offset_pos) * offset
				speed = speed * (1 + math.easeInCubic(lerp_t))
				local max_move_distance = Vector3.distance(target_position, position)
				local delta_move_distance = math.clamp(speed * dt, 0, max_move_distance)
				local new_position = wanted_pos + direction * delta_move_distance + offset_pos

				return new_position
			end
		}
	},
	random_spinning_target_traversal = {
		unit = {
			update = function (speed, radians, gravity, initial_position, target_vector, time_lived, dt, target_data)
				local max_t = 0.1
				local target_position = target_data.current_target
				local position = target_data.position
				local direction = Vector3.normalize(target_position - initial_position)
				local point_on_line = Geometry.closest_point_on_line(position, initial_position, target_position)
				local dist_to_target = Vector3.distance(point_on_line, target_position)
				local dist_from_init = Vector3.distance(initial_position, target_position)
				local current_lerp_t = 1 - dist_to_target / dist_from_init
				local wanted_pos = Vector3.lerp(initial_position, target_position, current_lerp_t)
				local lerp_t = current_lerp_t
				local offset = nil
				local spin_speed = speed * 2
				local curve_lerp_t = nil

				if lerp_t < max_t then
					curve_lerp_t = math.clamp(lerp_t / max_t, 0, 1)
					offset = math.easeInCubic(curve_lerp_t)
				elseif lerp_t < 1 then
					speed = speed / 5
					lerp_t = lerp_t / 1
					curve_lerp_t = math.clamp((lerp_t - max_t) / (1 - max_t), 0, 1)
					offset = 1 - math.easeOutCubic(curve_lerp_t)
					local offset_speed = offset

					if offset < 0.3 then
						offset_speed = 0.3
					end

					speed = speed * (1 + math.ease_out_quad(curve_lerp_t)) / offset_speed
					spin_speed = spin_speed * offset
				else
					offset = 0
				end

				local random_spin_dir = target_data.random_spin_dir
				local offset_pos = nil

				if random_spin_dir == 1 then
					offset_pos = Vector3(-math.cos(time_lived * spin_speed), 0, math.sin(time_lived * spin_speed))
				else
					offset_pos = Vector3(math.sin(time_lived * spin_speed), 0, -math.cos(time_lived * spin_speed))
				end

				offset_pos = Quaternion.rotate(Quaternion.look(direction, Vector3.up()), offset_pos) * offset
				speed = speed * (1 + math.easeInCubic(lerp_t))
				local max_move_distance = Vector3.distance(target_position, position)
				local delta_move_distance = math.clamp(speed * dt, 0, max_move_distance)
				local new_position = wanted_pos + direction * delta_move_distance + offset_pos

				QuickDrawer:sphere(new_position, 0.1, Color(255, 0, 0))

				return new_position
			end
		}
	},
	magic_missile_traversal = {
		unit = {
			update = function (speed, radians, gravity, initial_position, target_vector, time_lived, dt, traversal_data)
				local max_t = 0.075
				local target_position = traversal_data.current_target
				local position = traversal_data.position
				local direction = Vector3.normalize(target_position - initial_position)
				local wanted_position = Geometry.closest_point_on_line(position + direction * speed * dt, initial_position, target_position)
				local random_x_axis = traversal_data.random_x_axis
				local random_y_axis = traversal_data.random_y_axis
				local dist_to_wanted = Vector3.distance(initial_position, wanted_position)
				local dist_to_target = Vector3.distance(initial_position, target_position)
				local lerp_t = math.clamp(math.inv_lerp(0, dist_to_target, dist_to_wanted), 0, 1)
				local offset = nil

				if lerp_t < max_t then
					local curve_lerp_t = math.clamp(lerp_t / max_t, 0, 1)
					offset = math.easeInCubic(curve_lerp_t) * 0.75
					speed = speed * (1 + math.easeInCubic(curve_lerp_t) / 2) * 0.75
				elseif lerp_t < 1 then
					local curve_lerp_t = math.clamp((lerp_t - max_t) / (1 - max_t), 0, 1)
					offset = 1 - math.easeOutCubic(curve_lerp_t)
					speed = speed * (1 + math.easeOutCubic(curve_lerp_t))
				else
					offset = 0
				end

				local local_x_offset_dir = Vector3.right() * random_x_axis
				local local_y_offset_dir = Vector3.up() * random_y_axis
				local local_offset_dir = Vector3.normalize(local_x_offset_dir + local_y_offset_dir)
				local offset_dir = Quaternion.rotate(Quaternion.look(direction), local_offset_dir)
				local max_move_distance = Vector3.distance(target_position, position)
				local delta_move_distance = math.clamp(speed * dt, 0, max_move_distance)
				wanted_position = wanted_position + offset_dir * offset
				local move = Vector3.normalize(wanted_position - position) * delta_move_distance
				local new_position = position + move

				return new_position
			end
		}
	},
	straight_direction_traversal = {
		unit = {
			update = function (speed, radians, gravity, initial_position, target_vector, time_lived, dt, optional_data)
				local move_delta = target_vector * speed * dt
				local new_position = move_delta + optional_data.position

				return new_position
			end
		},
		husk = {
			update = function (speed, radians, gravity, initial_position, target_vector, time_lived, dt, optional_data)
				local move_delta = target_vector * speed * dt
				local new_position = move_delta + optional_data.position

				return new_position
			end
		}
	},
	throw_trajectory = {
		prediction_function = function (speed, gravity, initial_position, target_position, target_velocity)
			local t = 0
			local angle = nil
			local EPSILON = 0.01
			local ITERATIONS = 10

			assert(gravity > 0, "Can't solve for <=0 gravity, use different projectile template")

			local estimated_target_position = target_position

			for i = 1, ITERATIONS do
				estimated_target_position = target_position + t * target_velocity
				local height = estimated_target_position.z - initial_position.z
				local speed_squared = speed^2
				local flat_distance = Vector3.length(Vector3.flat(estimated_target_position - initial_position))

				if flat_distance < EPSILON then
					return 0, estimated_target_position
				end

				local sqrt_val = speed_squared^2 - gravity * (gravity * flat_distance^2 + 2 * height * speed_squared)

				if sqrt_val <= 0 then
					return nil, estimated_target_position
				end

				local second_degree_component = math.sqrt(sqrt_val)
				local angle1 = math.atan((speed_squared + second_degree_component) / (gravity * flat_distance))
				local angle2 = math.atan((speed_squared - second_degree_component) / (gravity * flat_distance))
				angle = math.min(angle1, angle2)
				local flat_distance = Vector3.length(Vector3.flat(estimated_target_position - initial_position))
				t = flat_distance / (speed * math.cos(angle))
			end

			return angle, estimated_target_position
		end,
		unit = {
			update = function (speed, radians, gravity, initial_position, target_vector, time_lived, dt, optional_data)
				local position = WeaponHelper:position_on_trajectory(initial_position, target_vector, speed, radians, gravity, time_lived, dt)

				return position
			end
		},
		husk = {
			update = function (speed, radians, gravity, initial_position, target_vector, time_lived, dt, optional_data)
				local position = WeaponHelper:position_on_trajectory(initial_position, target_vector, speed, radians, gravity, time_lived, dt)

				return position
			end
		}
	}
}
ProjectileTemplates.impact_templates = {
	explosion_impact = {
		server = {
			execute = function (world, damage_source, unit, recent_impacts, num_impacts, owner_unit)
				local first_hit_position = Vector3Box.unbox(recent_impacts[ProjectileImpactDataIndex.POSITION])
				local unit_id = Managers.state.unit_storage:go_id(unit)

				Managers.state.network.network_transmit:send_rpc_all("rpc_area_damage", unit_id, first_hit_position)

				if not Unit.alive(owner_unit) then
					return true
				end

				Unit.set_local_position(unit, 0, first_hit_position)

				local ai_base_extension = ScriptUnit.has_extension(owner_unit, "ai_system")

				if ai_base_extension then
					local blackboard = ai_base_extension:blackboard()
					blackboard.explosion_impact = true
				end

				if HEALTH_ALIVE[owner_unit] then
					local players_inside = 0
					local area_damage_position = POSITION_LOOKUP[unit]

					for _, player in pairs(Managers.player:human_players()) do
						local player_unit = player.player_unit

						if player_unit ~= nil then
							local unit_position = POSITION_LOOKUP[player_unit]
							local distance_sq = Vector3.distance_squared(unit_position, area_damage_position)
							local is_inside_radius = distance_sq < 9

							if is_inside_radius then
								players_inside = players_inside + 1
							end
						end
					end

					local dialogue_extension = ScriptUnit.has_extension(owner_unit, "dialogue_system")

					if dialogue_extension then
						local dialogue_input = dialogue_extension.input
						local event_data = FrameTable.alloc_table()
						event_data.num_units = players_inside

						dialogue_input:trigger_dialogue_event("pwg_projectile_hit", event_data)
					end
				end

				return true
			end
		},
		client = {
			execute = function (world, damage_source, unit, recent_impacts, num_impacts, owner_unit)
				Unit.set_unit_visibility(unit, false)
				Unit.flow_event(unit, "lua_projectile_impact")

				return true
			end
		}
	},
	vs_globadier_impact = {
		server = {
			execute = function (world, damage_source, unit, recent_impacts, num_impacts, owner_unit)
				local first_hit_position = Vector3Box.unbox(recent_impacts[ProjectileImpactDataIndex.POSITION])
				local unit_id = Managers.state.unit_storage:go_id(unit)

				Managers.state.network.network_transmit:send_rpc_all("rpc_area_damage", unit_id, first_hit_position)

				if not Unit.alive(owner_unit) then
					return true
				end

				Unit.set_local_position(unit, 0, first_hit_position)

				local ai_base_extension = ScriptUnit.has_extension(owner_unit, "ai_system")

				if ai_base_extension then
					local blackboard = ai_base_extension:blackboard()
					blackboard.explosion_impact = true
				end

				if HEALTH_ALIVE[owner_unit] then
					local players_inside = 0
					local area_damage_position = POSITION_LOOKUP[unit]

					for _, player in pairs(Managers.player:human_players()) do
						local player_unit = player.player_unit

						if player_unit ~= nil then
							local unit_position = POSITION_LOOKUP[player_unit]
							local distance_sq = Vector3.distance_squared(unit_position, area_damage_position)
							local is_inside_radius = distance_sq < 9

							if is_inside_radius then
								players_inside = players_inside + 1
							end
						end
					end

					local dialogue_extension = ScriptUnit.has_extension(owner_unit, "dialogue_system")

					if dialogue_extension then
						local dialogue_input = dialogue_extension.input
						local event_data = FrameTable.alloc_table()
						event_data.num_units = players_inside

						dialogue_input:trigger_dialogue_event("pwg_projectile_hit", event_data)
					end
				end

				return true
			end
		},
		client = {
			execute = function (world, damage_source, unit, recent_impacts, num_impacts, owner_unit)
				local is_player_unit = DamageUtils.is_player_unit(owner_unit)

				if is_player_unit then
					local owner_player = Managers.player:owner(owner_unit)
					local owner_is_local = owner_player and owner_player.local_player

					if owner_is_local then
						local wwise_world = Managers.world:wwise_world(world)

						WwiseWorld.trigger_event(wwise_world, "player_versus_globadier_fps_globe_impact")
					end
				end

				Unit.set_unit_visibility(unit, false)
				Unit.flow_event(unit, "lua_projectile_impact")

				return true
			end
		}
	},
	direct_impact = {
		server = {
			execute = function (world, damage_source, projectile_unit, recent_impacts, num_impacts, owner_unit, explosion_template)
				if not Unit.alive(owner_unit) then
					Managers.state.unit_spawner:mark_for_deletion(projectile_unit)

					return true
				end

				if explosion_template then
					if explosion_template.explosion then
						local blackboard = BLACKBOARDS[owner_unit]

						AiUtils.ai_explosion(projectile_unit, owner_unit, blackboard, damage_source, explosion_template)
					end

					local first_hit_position = nil

					if explosion_template.aoe then
						first_hit_position = Vector3Box.unbox(recent_impacts[ProjectileImpactDataIndex.POSITION])

						DamageUtils.create_aoe(world, owner_unit, first_hit_position, damage_source, explosion_template)
					end

					if explosion_template.server_hit_func then
						first_hit_position = first_hit_position or Vector3Box.unbox(recent_impacts[ProjectileImpactDataIndex.POSITION])

						explosion_template.server_hit_func(projectile_unit, damage_source, owner_unit, first_hit_position, recent_impacts, explosion_template)
					end
				end

				return true
			end
		},
		client = {
			execute = function (world, damage_source, unit, recent_impacts, num_impacts, owner_unit)
				Unit.set_unit_visibility(unit, false)
				Unit.flow_event(unit, "lua_projectile_impact")

				return true
			end
		}
	},
	no_owner_direct_impact = {
		server = {
			execute = function (world, damage_source, projectile_unit, recent_impacts, num_impacts, owner_unit, explosion_template)
				if explosion_template then
					if explosion_template.explosion then
						local blackboard = BLACKBOARDS[owner_unit]

						AiUtils.ai_explosion(projectile_unit, owner_unit, blackboard, damage_source, explosion_template)
					end

					local first_hit_position = nil

					if explosion_template.aoe then
						first_hit_position = Vector3Box.unbox(recent_impacts[ProjectileImpactDataIndex.POSITION])

						DamageUtils.create_aoe(world, owner_unit, first_hit_position, damage_source, explosion_template)
					end

					if explosion_template.server_hit_func then
						first_hit_position = first_hit_position or Vector3Box.unbox(recent_impacts[ProjectileImpactDataIndex.POSITION])

						explosion_template.server_hit_func(projectile_unit, damage_source, owner_unit, first_hit_position, recent_impacts, explosion_template)
					end
				end

				return true
			end
		},
		client = {
			execute = function (world, damage_source, unit, recent_impacts, num_impacts, owner_unit)
				Unit.set_unit_visibility(unit, false)
				Unit.flow_event(unit, "lua_projectile_impact")

				return true
			end
		}
	},
	vfx_impact = {
		server = {
			execute = function (world, damage_source, unit, recent_impacts, num_impacts, owner_unit)
				Unit.set_unit_visibility(unit, false)
				Unit.flow_event(unit, "lua_projectile_impact")

				return true
			end
		},
		client = {
			execute = function (world, damage_source, unit, recent_impacts, num_impacts, owner_unit)
				Unit.set_unit_visibility(unit, false)
				Unit.flow_event(unit, "lua_projectile_impact")

				return true
			end
		}
	},
	necromancer_trapped_soul = {
		owner_heal_amount = 2,
		owner_heal_type = "heal_from_proc",
		server = {
			execute = function (world, damage_source, unit, recent_impacts, num_impacts, owner_unit)
				local hit_unit = recent_impacts[ProjectileImpactDataIndex.UNIT]

				if not HEALTH_ALIVE[hit_unit] then
					return true
				end

				local network_manager = Managers.state.network
				local hit_unit_id = network_manager:unit_game_object_id(hit_unit)

				if hit_unit_id then
					local hit_position = recent_impacts[ProjectileImpactDataIndex.POSITION]:unbox()
					local hit_direction = recent_impacts[ProjectileImpactDataIndex.DIRECTION]:unbox()
					local weapon_system = Managers.state.entity:system("weapon_system")
					local damage_source_id = NetworkLookup.damage_sources.buff
					local attacker_unit_id = network_manager:unit_game_object_id(owner_unit)
					local hit_zone_name = "full"
					local breed = Breeds[hit_unit]

					if breed then
						local actor_index = recent_impacts[ProjectileImpactDataIndex.ACTOR_INDEX]
						local actor = Unit.actor(hit_unit, actor_index)
						local node = Actor.node(actor)
						hit_zone_name = breed.hit_zones_lookup[node] or hit_zone_name
					end

					local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
					local damage_profile_id = NetworkLookup.damage_profiles.trapped_soul
					local power_level = DefaultPowerLevel
					local career_extension = ScriptUnit.has_extension(owner_unit, "career_system")

					if career_extension then
						power_level = career_extension:get_career_power_level()
					end

					local health_extension = ScriptUnit.has_extension(owner_unit, "health_system")

					if health_extension then
						local impact_template = ProjectileTemplates.impact_templates.necromancer_trapped_soul

						health_extension:add_heal(owner_unit, impact_template.owner_heal_amount, nil, impact_template.owner_heal_type)
					end

					weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, hit_direction, damage_profile_id, "power_level", power_level)
				end

				return true
			end
		},
		client = {
			execute = function (world, damage_source, unit, recent_impacts, num_impacts, owner_unit)
				local hit_position = recent_impacts[ProjectileImpactDataIndex.POSITION]:unbox()

				World.create_particles(world, "fx/necromancer_skeleton_hit", hit_position)
				Unit.flow_event(unit, "lua_projectile_impact")

				return true
			end
		}
	}
}

ProjectileTemplates.get_trajectory_template = function (trajectory_template_name, is_husk)
	local templates = ProjectileTemplates.trajectory_templates
	local husk_key = is_husk == true and "husk" or is_husk == false and "unit"
	local template = templates[trajectory_template_name][husk_key]

	return template
end

ProjectileTemplates.get_impact_template = function (impact_template_name)
	local templates = ProjectileTemplates.impact_templates
	local template = templates[impact_template_name]

	return template
end

function check_for_afro_hit(recent_impacts, num_impacts)
	local hit_unit, actor_index, hit_actor, node_index = nil
	local only_hit_afro = true
	local non_afro_hit_index = nil

	for i = 1, num_impacts / ProjectileImpactDataIndex.STRIDE do
		local j = (i - 1) * ProjectileImpactDataIndex.STRIDE
		hit_unit = recent_impacts[j + ProjectileImpactDataIndex.UNIT]
		actor_index = recent_impacts[j + ProjectileImpactDataIndex.ACTOR_INDEX]
		hit_actor = Unit.actor(hit_unit, actor_index)
		node_index = Actor.node(hit_actor)
		local breed = Unit.get_data(hit_unit, "breed")

		if breed then
			local hit_zone = breed.hit_zones_lookup[node_index]
			local hit_zone_name = hit_zone.name

			if hit_zone_name ~= "afro" then
				only_hit_afro = false
				non_afro_hit_index = j

				break
			end
		else
			only_hit_afro = false
			non_afro_hit_index = j

			break
		end
	end

	return hit_unit, actor_index, hit_actor, node_index, only_hit_afro, non_afro_hit_index
end
