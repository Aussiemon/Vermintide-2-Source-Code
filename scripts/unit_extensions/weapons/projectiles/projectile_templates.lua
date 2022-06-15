ProjectileTemplates = {}
local check_for_afro_hit = nil
ProjectileTemplates.trajectory_templates = {
	throw_trajectory = {
		prediction_function = function (speed, gravity, initial_position, target_position, target_velocity)
			local t = 0
			local angle = nil
			local EPSILON = 0.01
			local ITERATIONS = 10

			assert(gravity > 0, "Can't solve for <=0 gravity, use different projectile template")

			local estimated_target_position = target_position

			for i = 1, ITERATIONS, 1 do
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
			update = function (speed, radians, gravity, initial_position, target_vector, dt)
				local position = WeaponHelper:position_on_trajectory(initial_position, target_vector, speed, radians, gravity, dt)

				return position
			end
		},
		husk = {
			update = function (speed, radians, gravity, initial_position, target_vector, dt)
				local position = WeaponHelper:position_on_trajectory(initial_position, target_vector, speed, radians, gravity, dt)

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

				if AiUtils.unit_alive(owner_unit) then
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

				if AiUtils.unit_alive(owner_unit) then
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
	}
}

ProjectileTemplates.get_trajectory_template = function (trajectory_template_name, is_husk)
	local templates = ProjectileTemplates.trajectory_templates
	local husk_key = (is_husk == true and "husk") or (is_husk == false and "unit")
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

	for i = 1, num_impacts / ProjectileImpactDataIndex.STRIDE, 1 do
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

return
