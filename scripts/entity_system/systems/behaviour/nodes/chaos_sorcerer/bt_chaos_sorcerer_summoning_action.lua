require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTChaosSorcererSummoningAction = class(BTChaosSorcererSummoningAction, BTNode)

BTChaosSorcererSummoningAction.init = function (self, ...)
	BTChaosSorcererSummoningAction.super.init(self, ...)
end

BTChaosSorcererSummoningAction.name = "BTChaosSorcererSummoningAction"

BTChaosSorcererSummoningAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.attack_finished = false
	local vortex_data = blackboard.vortex_data

	if action.vortex_template_name then
		vortex_data.vortex_template = VortexTemplates[action.vortex_template_name]
	end

	local target_unit = blackboard.target_unit
	blackboard.target_position = (target_unit and Vector3Box(POSITION_LOOKUP[target_unit])) or Vector3Box()
	blackboard.spell_count = blackboard.spell_count or 0

	if not action.is_spawner then
		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension:set_wanted_velocity(Vector3.zero())

		local navigation_extension = blackboard.navigation_extension

		navigation_extension:set_enabled(false)

		local attack_animation = action.attack_anim

		Managers.state.network:anim_event(unit, attack_animation)

		local init_func_name = action.init_func_name

		if init_func_name then
			self[init_func_name](self, unit, blackboard, t)
		end

		blackboard.move_state = "attacking"
		blackboard.summon_target_unit = target_unit
		blackboard.summoning = true
	end

	if blackboard.breed.summon_sound_event then
		self:trigger_summon_sound(unit, blackboard, t)
	end
end

BTChaosSorcererSummoningAction.trigger_summon_sound = function (self, unit, blackboard, t)
	local breed = blackboard.breed
	local network_manager = Managers.state.network
	local summon_sound_event = breed.summon_sound_event
	local no_summon_sound_for_target = breed.no_summon_sound_for_target
	local player_manager = Managers.player
	local player_unit = blackboard.target_unit
	local player = player_manager:unit_owner(player_unit)
	local dialogue_input = ScriptUnit.has_extension_input(unit, "dialogue_system")
	local audio_system_extension = Managers.state.entity:system("audio_system")
	local unit_id = NetworkUnit.game_object_id(unit)
	local sound_event_id = NetworkLookup.sound_events[summon_sound_event]

	if no_summon_sound_for_target then
		if not player.local_player then
			dialogue_input:play_voice(summon_sound_event, true)
		end

		network_manager.network_transmit:send_rpc_clients_except("rpc_server_audio_unit_dialogue_event", player.peer_id, sound_event_id, unit_id, 0)
	else
		dialogue_input:play_voice(summon_sound_event, true)
		network_manager.network_transmit:send_rpc_clients("rpc_server_audio_unit_dialogue_event", sound_event_id, unit_id, 0)
	end
end

BTChaosSorcererSummoningAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local action = blackboard.action

	if not action.is_spawner then
		local navigation_extension = blackboard.navigation_extension

		navigation_extension:set_enabled(true)

		local cleanup_func_name = action.cleanup_func_name

		if cleanup_func_name then
			self[cleanup_func_name](self, unit, blackboard, t)
		end
	end

	blackboard.action = nil
	blackboard.attack_finished = false
	blackboard.summoning = nil
	blackboard.summoning_unit = nil
	blackboard.summon_target_unit = nil
	blackboard.ready_to_summon = false
	blackboard.summoning_finished = nil
end

BTChaosSorcererSummoningAction.run = function (self, unit, blackboard, t, dt)
	local action = blackboard.action
	local target_unit = blackboard.summon_target_unit

	if Unit.alive(target_unit) then
		local status_ext = ScriptUnit.has_extension(target_unit, "status_system")

		if status_ext and not status_ext:is_invisible() and not status_ext:get_is_dodging() then
			blackboard.target_position:store(POSITION_LOOKUP[target_unit])
		end

		if blackboard.face_target_while_summoning then
			local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, target_unit)
			local locomotion_extension = blackboard.locomotion_extension

			locomotion_extension:set_wanted_rotation(rotation)
		end
	end

	if not action.ignore_attack_finished then
		if blackboard.attack_finished then
			blackboard.ready_to_summon = false

			return "done"
		elseif blackboard.summoning_finished then
			local target_position = blackboard.target_position:unbox()
			local spawn_func_name = action.spawn_func_name
			local success = self[spawn_func_name](self, unit, blackboard, t, dt, target_position, blackboard.current_spell)
			blackboard.spell_count = blackboard.spell_count + 1
			blackboard.summoning_finished = nil

			if not success then
				return "done"
			end
		end
	end

	local update_func_name = action.update_func_name

	if update_func_name then
		local done = self[update_func_name](self, unit, blackboard, t, dt)

		if done then
			blackboard.summoning_finished = nil

			return "done"
		end
	end

	return "running"
end

BTChaosSorcererSummoningAction.spawn_exalted_spell = function (self, unit, blackboard, t, dt, target_position)
	local spell = blackboard.current_spell

	spell.spawn_function(self, blackboard, t, dt, target_position, spell)
end

local VORTEX_MIN_DUMMY_MISSILE_HEIGHT = 0.25

BTChaosSorcererSummoningAction._start_vortex_summoning = function (self, unit, blackboard, t)
	local world = blackboard.world
	local action = blackboard.action
	local vortex_data = blackboard.vortex_data
	local vortex_template = vortex_data.vortex_template
	local summon_position = vortex_data.vortex_spawn_pos:unbox()
	local max_height = vortex_template.max_height
	local spawn_radius = vortex_data.vortex_spawn_radius
	local inner_radius_p = math.min(spawn_radius / vortex_template.full_inner_radius, 1)

	if Managers.player.is_server then
		local inner_decal_unit_name = action.inner_decal_unit_name

		if inner_decal_unit_name then
			local inner_spawn_pose = Matrix4x4.from_quaternion_position(Quaternion.identity(), summon_position)
			local inner_radius = math.max(vortex_template.min_inner_radius, inner_radius_p * vortex_template.full_inner_radius)

			Matrix4x4.set_scale(inner_spawn_pose, Vector3(inner_radius, inner_radius, inner_radius))

			vortex_data.inner_decal_unit = Managers.state.unit_spawner:spawn_network_unit(inner_decal_unit_name, "network_synched_dummy_unit", nil, inner_spawn_pose)
		end

		local outer_decal_unit_name = action.outer_decal_unit_name

		if outer_decal_unit_name then
			local outer_spawn_pose = Matrix4x4.from_quaternion_position(Quaternion.identity(), summon_position)
			local outer_radius = math.max(vortex_template.min_outer_radius, inner_radius_p * vortex_template.full_outer_radius)

			Matrix4x4.set_scale(outer_spawn_pose, Vector3(outer_radius, outer_radius, outer_radius))

			vortex_data.outer_decal_unit = Managers.state.unit_spawner:spawn_network_unit(outer_decal_unit_name, "network_synched_dummy_unit", nil, outer_spawn_pose)
		end
	end

	vortex_data.next_missile_cast_t = t
	vortex_data.num_dummy_missiles = 0
	local physics_world = vortex_data.physics_world
	local start_check_position = summon_position + Vector3.up() * VORTEX_MIN_DUMMY_MISSILE_HEIGHT
	local hit, hit_position, hit_distance, _, _ = PhysicsWorld.immediate_raycast(physics_world, start_check_position, Vector3.up(), max_height - VORTEX_MIN_DUMMY_MISSILE_HEIGHT, "closest", "collision_filter", "filter_ai_mover")
	local max_height = (hit and VORTEX_MIN_DUMMY_MISSILE_HEIGHT + hit_distance) or max_height
	vortex_data.max_height = max_height
	local unit_position = POSITION_LOOKUP[unit]
	local distance = Vector3.distance(unit_position, summon_position)
	local extra_time = distance * action.extra_time_per_distance
	vortex_data.summoning_done_t = t + action.summoning_time + extra_time
	vortex_data.extra_time = extra_time
	local breed = blackboard.breed

	if not breed.boss then
		local target_unit = blackboard.target_unit

		Managers.state.entity:system("ai_bot_group_system"):ranged_attack_started(unit, target_unit, "chaos_vortex")
	end
end

BTChaosSorcererSummoningAction._clean_up_vortex_summoning = function (self, unit, blackboard, t)
	local vortex_data = blackboard.vortex_data
	local unit_spawner = Managers.state.unit_spawner
	local inner_decal_unit = vortex_data.inner_decal_unit

	if Unit.alive(inner_decal_unit) then
		unit_spawner:mark_for_deletion(inner_decal_unit)
	end

	local outer_decal_unit = vortex_data.outer_decal_unit

	if Unit.alive(outer_decal_unit) then
		unit_spawner:mark_for_deletion(outer_decal_unit)
	end

	vortex_data.inner_decal_unit = nil
	vortex_data.outer_decal_unit = nil
	vortex_data.num_dummy_missiles = 0
	local breed = blackboard.breed

	if not breed.boss then
		local target_unit = blackboard.target_unit

		Managers.state.entity:system("ai_bot_group_system"):ranged_attack_ended(unit, target_unit, "chaos_vortex")
	end
end

BTChaosSorcererSummoningAction._update_vortex_summoning = function (self, unit, blackboard, t, dt)
	local vortex_data = blackboard.vortex_data
	local summon_position = vortex_data.vortex_spawn_pos:unbox()
	local rotation = LocomotionUtils.look_at_position_flat(unit, summon_position)
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_wanted_rotation(rotation)

	if blackboard.attack_finished then
		return
	end

	local action = blackboard.action

	if vortex_data.num_dummy_missiles < action.num_missiles and vortex_data.next_missile_cast_t < t then
		local unit_position = POSITION_LOOKUP[unit]
		local to_summon = summon_position - unit_position
		local summon_direction = Vector3.normalize(to_summon)
		local hand_node = Unit.node(unit, "j_lefthand")
		local hand_position = Unit.world_position(unit, hand_node)

		self:_launch_vortex_dummy_missile(unit, action, vortex_data, hand_position, summon_position, summon_direction)

		vortex_data.next_missile_cast_t = vortex_data.next_missile_cast_t + action.missile_cast_interval
	end

	if vortex_data.summoning_done_t < t then
		blackboard.summoning_finished = true
	end
end

BTChaosSorcererSummoningAction._launch_vortex_dummy_missile = function (self, owner_unit, action, vortex_data, spawn_position, target_position, target_dir)
	local angle = action.missile_launch_angle
	local speed = action.missile_speed
	local life_time = action.missile_life_time + vortex_data.extra_time
	local true_flight_template_name = "sorcerer_vortex_dummy_missile"
	local max_height = math.max(vortex_data.max_height / 2, VORTEX_MIN_DUMMY_MISSILE_HEIGHT + 0.5)
	local height_offset = VORTEX_MIN_DUMMY_MISSILE_HEIGHT + (max_height - VORTEX_MIN_DUMMY_MISSILE_HEIGHT) * math.random()
	target_position = target_position + Vector3.up() * height_offset
	local extension_init_data = {
		projectile_locomotion_system = {
			trajectory_template_name = "throw_trajectory",
			gravity_settings = "default",
			angle = angle,
			initial_position = spawn_position,
			height_offset = height_offset,
			life_time = life_time,
			owner_unit = owner_unit,
			position_target = target_position,
			speed = speed,
			target_vector = target_dir,
			true_flight_template_name = true_flight_template_name
		},
		projectile_system = {
			impact_template_name = "direct_impact",
			explosion_template_name = "chaos_vortex_dummy_missile",
			owner_unit = owner_unit
		}
	}
	local rotation = Quaternion.look(target_dir)
	local projectile_unit_name = action.missile_effect_unit_name
	local projectile_unit = Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, "ai_true_flight_projectile_unit_without_raycast", extension_init_data, spawn_position, rotation)
	vortex_data.num_dummy_missiles = vortex_data.num_dummy_missiles + 1
end

BTChaosSorcererSummoningAction._spawn_boss_vortex = function (self, unit, blackboard, t, dt, target_position)
	local action = blackboard.action
	local vortex_template_name = action.vortex_template_name
	local vortex_template = VortexTemplates[vortex_template_name]
	local boss_vortex_data = blackboard.boss_vortex_data
	local spawn_radius = 6
	local spawn_pos = POSITION_LOOKUP[unit]

	boss_vortex_data.vortex_spawn_pos:store(spawn_pos)

	boss_vortex_data.vortex_spawn_radius = spawn_radius
	local inner_radius_p = math.min(spawn_radius / vortex_template.full_inner_radius, 1)
	local inner_decal_unit_name = action.inner_decal_unit_name

	if inner_decal_unit_name then
		local inner_spawn_pose = Matrix4x4.from_quaternion_position(Quaternion.identity(), spawn_pos)
		local inner_radius = math.max(vortex_template.min_inner_radius, inner_radius_p * vortex_template.full_inner_radius)

		Matrix4x4.set_scale(inner_spawn_pose, Vector3(inner_radius, inner_radius, inner_radius))

		boss_vortex_data.inner_decal_unit = Managers.state.unit_spawner:spawn_network_unit(inner_decal_unit_name, "network_synched_dummy_unit", nil, inner_spawn_pose)
	end

	local outer_decal_unit_name = action.outer_decal_unit_name

	if outer_decal_unit_name then
		local outer_spawn_pose = Matrix4x4.from_quaternion_position(Quaternion.identity(), spawn_pos)
		local outer_radius = math.max(vortex_template.min_outer_radius, inner_radius_p * vortex_template.full_outer_radius)

		Matrix4x4.set_scale(outer_spawn_pose, Vector3(outer_radius, outer_radius, outer_radius))

		boss_vortex_data.outer_decal_unit = Managers.state.unit_spawner:spawn_network_unit(outer_decal_unit_name, "network_synched_dummy_unit", nil, outer_spawn_pose)
	end

	self:_spawn_vortex(unit, blackboard, t, dt, target_position, boss_vortex_data)
end

BTChaosSorcererSummoningAction._spawn_vortex = function (self, unit, blackboard, t, dt, target_position, vortex_data)
	vortex_data = vortex_data or blackboard.vortex_data
	local action = blackboard.action
	local vortex_pos = vortex_data.vortex_spawn_pos:unbox()
	local vortex_template_name = blackboard.breed.vortex_template_name or action.vortex_template_name
	local vortex_template = VortexTemplates[vortex_template_name]
	local breed_name = vortex_template.breed_name
	local breed = Breeds[breed_name]
	local vortex_units = vortex_data.vortex_units
	local queued_vortex = vortex_data.queued_vortex
	local spawn_category = "vortex"
	local link_decal_units = action.link_decal_units_to_vortex
	local inner_decal_unit = vortex_data.inner_decal_unit
	local outer_decal_unit = vortex_data.outer_decal_unit
	local optional_data = {
		prepare_func = function (breed, extension_init_data)
			extension_init_data.ai_supplementary_system = {
				vortex_template_name = vortex_template_name or "standard",
				inner_decal_unit = link_decal_units and inner_decal_unit,
				outer_decal_unit = link_decal_units and outer_decal_unit,
				owner_unit = unit
			}
		end,
		spawned_func = function (vortex_unit, breed, optional_data)
			local spawn_queue_index = optional_data.spawn_queue_index
			queued_vortex[spawn_queue_index] = nil
			vortex_units[#vortex_units + 1] = vortex_unit
			local vortex_blackboard = BLACKBOARDS[vortex_unit]
			vortex_blackboard.master_unit = unit

			Managers.state.entity:system("surrounding_aware_system"):add_system_event(vortex_unit, "enemy_attack", DialogueSettings.see_vortex_distance, "attack_tag", "chaos_vortex_spawned")
		end
	}
	local vortex_queue_id = Managers.state.conflict:spawn_queued_unit(breed, Vector3Box(vortex_pos), QuaternionBox(Quaternion.identity()), spawn_category, nil, nil, optional_data)
	vortex_data.queued_vortex[vortex_queue_id] = {
		inner_decal_unit = link_decal_units and inner_decal_unit,
		outer_decal_unit = link_decal_units and outer_decal_unit
	}

	if link_decal_units then
		vortex_data.inner_decal_unit = nil
		vortex_data.outer_decal_unit = nil
	end

	blackboard.attack_finished = true

	return true
end

BTChaosSorcererSummoningAction.spawn_portal = function (self, unit, blackboard, t, dt, target_position, portal_data)
	portal_data = portal_data or blackboard.portal_data
	local portal_pos = portal_data.portal_spawn_pos:unbox()
	local portal_rot = portal_data.portal_spawn_rot:unbox()
	local portal_type = portal_data.portal_spawn_type
	local breed = Breeds.chaos_tentacle
	local inside_wall_spawn_distance = breed.inside_wall_spawn_distance
	local tentacle_pos = nil

	if inside_wall_spawn_distance then
		local normal = Quaternion.forward(portal_rot)
		tentacle_pos = portal_pos - normal * inside_wall_spawn_distance

		QuickDrawerStay:line(tentacle_pos, tentacle_pos + normal * 5, Colors.get("light_green"))
		QuickDrawerStay:sphere(tentacle_pos, 0.1, Colors.get("light_green"))
	end

	local tentacle_template_name = blackboard.action.tentacle_template_name or "portal"
	local optional_data = {
		prepare_func = function (breed, extension_init_data)
			extension_init_data.ai_supplementary_system = {
				tentacle_template_name = tentacle_template_name
			}
		end,
		spawned_func = function (portal_unit, breed, optional_data)
			optional_data.sorcerer_blackboard.portal_unit = portal_unit
		end,
		sorcerer_blackboard = blackboard
	}
	local spawn_category = "portal"

	if portal_type == "wall" then
		Managers.state.conflict:spawn_queued_unit(breed, Vector3Box(tentacle_pos), QuaternionBox(portal_rot), spawn_category, nil, nil, optional_data)
	elseif portal_type == "floor" then
		Managers.state.conflict:spawn_queued_unit(breed, Vector3Box(tentacle_pos), QuaternionBox(portal_rot), spawn_category, nil, nil, optional_data)
	end

	blackboard.portal_search_active = false
	blackboard.ready_to_summon = false

	return true
end

BTChaosSorcererSummoningAction.boss_sorcerer_spawn_tentacle_in_arena = function (self, unit, blackboard, t)
	local breed = Breeds.chaos_tentacle
	local level_analysis = Managers.state.conflict.level_analysis
	local center_node_units = level_analysis.generic_ai_node_units.sorcerer_boss_wall
	local wall_unit = center_node_units[math.random(1, #center_node_units)]
	local portal_pos = Unit.local_position(wall_unit, 0)
	local portal_rot = Unit.local_rotation(wall_unit, 0)
	local normal = Quaternion.forward(portal_rot)
	local inside_wall_spawn_distance = breed.inside_wall_spawn_distance
	local spawn_category = "portal"
	local tentacle_pos = portal_pos - normal * inside_wall_spawn_distance
	local optional_data = {
		spawned_func = function (portal_unit, breed, optional_data)
			blackboard.tentacle_portal_units[portal_unit] = true
			local tentacle_blackboard = BLACKBOARDS[portal_unit]
			tentacle_blackboard.boss_master_unit = unit
			blackboard.num_portals_alive = blackboard.num_portals_alive + 1
			blackboard.portal_unit = portal_unit
		end
	}

	Managers.state.conflict:spawn_queued_unit(breed, Vector3Box(tentacle_pos), QuaternionBox(portal_rot), spawn_category, nil, nil, optional_data)
end

BTChaosSorcererSummoningAction.init_boss_sorcerer_tentacle = function (self, unit, blackboard, t)
	blackboard.summon_plague_wave_timer = t + 0.5
end

BTChaosSorcererSummoningAction.init_summon_plague_wave = function (self, unit, blackboard, t)
	blackboard.summon_plague_wave_timer = t + 0.1
	local breed = blackboard.breed

	if not breed.boss then
		local target_unit = blackboard.target_unit

		Managers.state.entity:system("ai_bot_group_system"):ranged_attack_started(unit, target_unit, "plague_wave")
	end
end

BTChaosSorcererSummoningAction.init_summon_vermintide = function (self, unit, blackboard, t)
	blackboard.summon_plague_wave_timer = t + 0.1
	blackboard.damage_wave_template_name = "vermintide"
end

BTChaosSorcererSummoningAction.update_summon_plague_wave = function (self, unit, blackboard, t, dt)
	if blackboard.summon_plague_wave_timer < t then
		if not blackboard.summoning_unit then
			local unit_name = DamageWaveTemplates.templates[blackboard.damage_wave_template_name or "plague_wave"].fx_unit
			local extension_init_data = {
				area_damage_system = {
					damage_wave_template_name = blackboard.damage_wave_template_name or "plague_wave",
					source_unit = unit
				}
			}
			local pos = POSITION_LOOKUP[unit]
			local rot = Unit.local_rotation(unit, 0)
			local damage_wave_unit = Managers.state.unit_spawner:spawn_network_unit(unit_name, "damage_wave_unit", extension_init_data, pos, rot)
			blackboard.summoning_unit = damage_wave_unit
			blackboard.damage_wave_extension = ScriptUnit.extension(damage_wave_unit, "area_damage_system")
		elseif blackboard.summoning_unit then
			local summoning_unit = blackboard.summoning_unit
			local go_id = Managers.state.unit_storage:go_id(summoning_unit)
			local damage_wave_extension = blackboard.damage_wave_extension
			local source_unit = damage_wave_extension.source_unit
			local source_unit_rot = Unit.local_rotation(source_unit, 0)

			Unit.set_local_rotation(summoning_unit, 0, source_unit_rot)

			local current_pos = POSITION_LOOKUP[summoning_unit]
			local source_unit_pos = POSITION_LOOKUP[source_unit]
			local source_unit_dir = Quaternion.forward(source_unit_rot)
			local wanted_pos = source_unit_pos + source_unit_dir * 2
			local lerp_value = math.min(dt * 2, 1)
			local pos = Vector3.lerp(current_pos, wanted_pos, lerp_value)
			local success, altitude, p1, p2, p3 = GwNavQueries.triangle_from_position(blackboard.nav_world, pos, 1.5, 1.5)

			if success then
				pos = Vector3(pos.x, pos.y, altitude)
			end

			Unit.set_local_position(summoning_unit, 0, pos)
			GameSession.set_game_object_field(damage_wave_extension.game, go_id, "rotation", source_unit_rot)
			GameSession.set_game_object_field(damage_wave_extension.game, go_id, "position", pos)
		end
	end
end

BTChaosSorcererSummoningAction.spawn_plague_wave = function (self, unit, blackboard, t, dt, target_position)
	local plague_wave_data = blackboard.plague_wave_data
	local target_starting_pos = plague_wave_data.target_starting_pos:unbox()
	local plague_wave_pos = POSITION_LOOKUP[unit]
	local plague_wave_rot = Quaternion.look(target_position - plague_wave_pos)
	local target_dist = plague_wave_data.target_dist
	local nav_world = blackboard.nav_world
	local projected_start_pos = LocomotionUtils.pos_on_mesh(nav_world, plague_wave_pos, 1, 1)
	local projected_end_pos = LocomotionUtils.pos_on_mesh(nav_world, target_position, 1, 1)
	local damage_wave_extension = blackboard.damage_wave_extension

	if not projected_end_pos then
		local p = GwNavQueries.inside_position_from_outside_position(nav_world, target_position, 6, 6, 4, 0.5)

		if p then
			projected_end_pos = p
		else
			blackboard.ready_to_summon = false

			damage_wave_extension:abort()

			return false
		end
	end

	if not projected_start_pos then
		local p = GwNavQueries.inside_position_from_outside_position(nav_world, plague_wave_pos, 6, 6, 4, 0.5)

		if p then
			projected_start_pos = p
		else
			blackboard.ready_to_summon = false

			damage_wave_extension:abort()

			return false
		end
	end

	local success = GwNavQueries.raycango(nav_world, projected_start_pos, projected_end_pos)
	local optional_target_pos = nil

	if success then
		optional_target_pos = projected_end_pos
	else
		local found_new_target_pos = false
		local tries = 5
		local target_to_start = target_starting_pos - target_position
		local target_to_start_normalized = Vector3.normalize(target_to_start)
		local target_to_start_dist = Vector3.distance(target_position, target_starting_pos)
		local ray_check_offset = 2.5

		for i = 1, tries, 1 do
			local ray_check_position = target_position + target_to_start_normalized * ray_check_offset * i
			local success = GwNavQueries.raycango(nav_world, projected_start_pos, ray_check_position)

			if success then
				found_new_target_pos = true
				optional_target_pos = ray_check_position
				plague_wave_rot = Quaternion.look(ray_check_position - plague_wave_pos)

				break
			end
		end

		if not found_new_target_pos then
			blackboard.ready_to_summon = false

			damage_wave_extension:abort()

			return false
		end
	end

	local action = blackboard.action
	local dist_sq = Vector3.distance_squared(optional_target_pos, target_position)
	local max_dist_sq = action.max_wave_to_target_dist^2

	if dist_sq > max_dist_sq then
		blackboard.ready_to_summon = false

		damage_wave_extension:abort()

		return false
	end

	damage_wave_extension:launch_wave(blackboard.summon_target_unit, optional_target_pos)

	return true
end

BTChaosSorcererSummoningAction.spawn_plague_wave_from_spawner = function (self, unit, blackboard, t, dt, target_position)
	local plague_wave_pos = POSITION_LOOKUP[unit]
	local nav_world = blackboard.nav_world
	local target_unit = blackboard.target_unit
	local spawn_pos = LocomotionUtils.pos_on_mesh(nav_world, plague_wave_pos)

	if not spawn_pos then
		return false
	end

	local to_target = target_position - spawn_pos
	local spawn_rot = Quaternion.look(to_target, Vector3.up())
	local unit_name = "units/beings/enemies/chaos_sorcerer_fx/chr_chaos_sorcerer_fx"
	local extension_init_data = {
		area_damage_system = {
			damage_wave_template_name = "plague_wave",
			source_unit = unit
		}
	}
	local damage_wave_unit = Managers.state.unit_spawner:spawn_network_unit(unit_name, "damage_wave_unit", extension_init_data, spawn_pos, spawn_rot)
	local wave_extension = ScriptUnit.extension(damage_wave_unit, "area_damage_system")

	wave_extension:launch_wave(target_unit)

	blackboard.attack_finished = true

	return true
end

BTChaosSorcererSummoningAction.spawn_plague_waves_in_patterns = function (self, unit, blackboard, t, dt, target_position)
	local nav_world = blackboard.nav_world
	local action = blackboard.action
	local spawner_set, reps = nil

	if action.spawner_set_id then
		spawner_set = blackboard.spawners[action.spawner_set_id]
	else
		spawner_set = {
			unit
		}
	end

	reps = action.pattern_repetitions or 1
	local range = action.range or 20

	for j = 1, reps, 1 do
		for i = 1, #spawner_set, 1 do
			local spawner_unit = spawner_set[i]
			local spawn_pos = Unit.local_position(spawner_unit, 0)
			spawn_pos = LocomotionUtils.pos_on_mesh(nav_world, spawn_pos)

			if not spawn_pos then
				return false
			end

			local spawn_rot, spawn_dir = nil

			if action.spawn_rot_func then
				spawn_rot = action.spawn_rot_func(unit, blackboard, spawner_unit, j)
			else
				spawn_rot = Unit.local_rotation(spawner_unit, 0)
			end

			spawn_dir = Quaternion.forward(spawn_rot)
			local target_pos = spawn_pos + spawn_dir * range

			if action.goal_pos_func then
				target_pos = action.goal_pos_func(unit, blackboard, spawner_unit, j, spawn_pos, target_pos, spawn_dir)
			end

			if target_pos then
				local unit_name = "units/beings/enemies/chaos_sorcerer_fx/chr_chaos_sorcerer_fx"
				local extension_init_data = {
					area_damage_system = {
						damage_wave_template_name = action.damage_wave_template,
						source_unit = unit
					}
				}
				local damage_wave_unit = Managers.state.unit_spawner:spawn_network_unit(unit_name, "damage_wave_unit", extension_init_data, spawn_pos, spawn_rot)
				local wave_extension = ScriptUnit.extension(damage_wave_unit, "area_damage_system")

				if action.damage_wave_update_func then
					wave_extension:set_update_func(action.damage_wave_update_func, action.damage_wave_init_func, t)
				end

				local target_unit = nil

				wave_extension:launch_wave(target_unit, target_pos)

				blackboard.attack_finished = true
			end
		end
	end

	return true
end

BTChaosSorcererSummoningAction.init_summon_plague_wave_sequence = function (self, unit, blackboard, t)
	blackboard.summon_plague_wave_timer = t + 0.5
	blackboard.next_wave_time = 0
	blackboard.wave_counter = 0
	local sequence_init_func = blackboard.action.sequence_init_func

	if sequence_init_func then
		sequence_init_func(unit, blackboard)
	end
end

BTChaosSorcererSummoningAction.update_sequenced_plague_wave_spawning = function (self, unit, blackboard, t, dt)
	local action = blackboard.action
	local target_position = nil

	if blackboard.next_wave_time < t then
		blackboard.next_wave_time = t + action.duration_between_waves
		local spawn_func_name = action.spawn_func_name
		local success = self[spawn_func_name](self, unit, blackboard, t, dt, target_position)
		blackboard.wave_counter = blackboard.wave_counter + 1

		if action.num_waves < blackboard.wave_counter then
			return true
		end
	end
end

BTChaosSorcererSummoningAction.clean_up_plague_wave = function (self, unit, blackboard, t)
	local target_unit = blackboard.target_unit

	Managers.state.entity:system("ai_bot_group_system"):ranged_attack_ended(unit, target_unit, "plague_wave")
end

return
