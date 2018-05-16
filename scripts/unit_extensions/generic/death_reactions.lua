DeathReactions = {
	IS_NOT_DONE = "not_done",
	IS_DONE = "done"
}
local DeathReactions = DeathReactions
local BLACKBOARDS = BLACKBOARDS
local SCREENSPACE_DEATH_EFFECTS = {
	heavy = "fx/screenspace_blood_drops_heavy",
	blunt = "fx/screenspace_blood_drops"
}

local function is_hot_join_sync(killing_blow)
	local damage_type = killing_blow[DamageDataIndex.DAMAGE_TYPE]

	return damage_type == "sync_health"
end

local function play_screen_space_blood(world, unit, attacker_unit, killing_blow, damage_type)
	if Development.parameter("screen_space_player_camera_reactions") == false then
		return
	end

	local pos = POSITION_LOOKUP[unit] + Vector3(0, 0, 1)
	local player_manager = Managers.player
	local camera_manager = Managers.state.camera

	for _, player in pairs(player_manager:human_players()) do
		if not player.remote and (not script_data.disable_remote_blood_splatter or (Unit.alive(attacker_unit) and player == player_manager:owner(attacker_unit))) then
			local vp_name = player.viewport_name
			local cam_pos = camera_manager:camera_position(vp_name)

			if Vector3.distance_squared(cam_pos, pos) < 9 and (not script_data.disable_behind_blood_splatter or camera_manager:is_in_view(vp_name, pos)) then
				local particle_name = SCREENSPACE_DEATH_EFFECTS[damage_type] or "fx/screenspace_blood_drops"

				World.create_particles(world, particle_name, Vector3.zero())
			end
		end
	end
end

local function handle_boss_difficulty_kill_achievement_tracking(breed, statistics_db)
	local difficulty_kill_achievement = breed.difficulty_kill_achievement

	if difficulty_kill_achievement then
		local current_rank = Managers.state.difficulty:get_difficulty_rank()
		local player_manager = Managers.player
		local local_player_id = 1

		while player_manager:local_player(local_player_id) ~= nil do
			if local_player_id > 4 then
				ferror("Sanity check, how did we get above 4 here?")

				break
			end

			local player = player_manager:local_player(local_player_id)

			if not player.bot_player then
				local saved_rank = statistics_db:get_persistent_stat(player:stats_id(), difficulty_kill_achievement)

				if saved_rank < current_rank then
					statistics_db:set_stat(player:stats_id(), difficulty_kill_achievement, current_rank)
				end
			end

			local_player_id = local_player_id + 1
		end
	end
end

local function handle_military_event_achievement(damage_type, breed_name, statistics_db)
	if damage_type == "military_finish" and breed_name == "chaos_warrior" then
		local allowed_difficulties = QuestSettings.allowed_difficulties.military_statue_kill_chaos_warriors
		local difficulty = Managers.state.difficulty:get_difficulty()

		if allowed_difficulties[difficulty] then
			local local_player = Managers.player:local_player()

			if local_player then
				local stats_id = local_player:stats_id()

				statistics_db:increment_stat(stats_id, "military_statue_kill_chaos_warriors_session")

				local num_chaos_warriors_killed = statistics_db:get_stat(stats_id, "military_statue_kill_chaos_warriors_session")

				if num_chaos_warriors_killed >= 3 then
					statistics_db:increment_stat(stats_id, "military_statue_kill_chaos_warriors")
					Managers.state.network.network_transmit:send_rpc_clients("rpc_increment_stat", NetworkLookup.statistics.military_statue_kill_chaos_warriors)
				end
			end
		end
	end
end

local function ai_default_unit_start(unit, context, t, killing_blow, is_server)
	local killer_unit = killing_blow[DamageDataIndex.ATTACKER]
	local death_hit_zone = killing_blow[DamageDataIndex.HIT_ZONE]
	local damage_type = killing_blow[DamageDataIndex.DAMAGE_TYPE]
	local weapon_name = killing_blow[DamageDataIndex.DAMAGE_SOURCE_NAME]
	local hit_ragdoll_actor = killing_blow[DamageDataIndex.HIT_RAGDOLL_ACTOR_NAME]
	local damaged_by_other = unit ~= killer_unit
	local ai_extension = ScriptUnit.extension(unit, "ai_system")

	if damaged_by_other then
		AiUtils.alert_nearby_friends_of_enemy(unit, ai_extension:blackboard().group_blackboard.broadphase, killer_unit)
	end

	ai_extension:die(killer_unit, killing_blow)

	local locomotion = ScriptUnit.has_extension(unit, "locomotion_system")

	if locomotion then
		locomotion.death_velocity_boxed = (locomotion.movement_type == "script_driven" and Vector3Box(locomotion:current_velocity())) or nil

		locomotion:set_affected_by_gravity(false)
		locomotion:set_movement_type("script_driven")
		locomotion:set_wanted_velocity(Vector3.zero())
		Managers.state.entity:system("ai_navigation_system"):add_navbot_to_release(unit)
		locomotion:set_collision_disabled("death_reaction", true)
		locomotion:set_movement_type("disabled")
	end

	local breed = Unit.get_data(unit, "breed")

	if ScriptUnit.has_extension(unit, "ai_inventory_system") and not breed.keep_weapon_on_death then
		local inventory_system = Managers.state.entity:system("ai_inventory_system")

		inventory_system:drop_item(unit)
	end

	local achievements_enabled = Development.parameter("v2_achievements")

	if achievements_enabled then
		local statistics_db = context.statistics_db

		handle_boss_difficulty_kill_achievement_tracking(breed, statistics_db)
		handle_military_event_achievement(damage_type, breed.name, statistics_db)
	end

	local owner_unit = AiUtils.get_actual_attacker_unit(killer_unit)

	play_screen_space_blood(context.world, unit, owner_unit, killing_blow, damage_type)

	if breed.death_sound_event then
		local wwise_source, wwise_world = WwiseUtils.make_unit_auto_source(context.world, unit, Unit.node(unit, "c_head"))
		local dialogue_extension = ScriptUnit.extension(unit, "dialogue_system")
		local switch_group = dialogue_extension.wwise_voice_switch_group

		if switch_group then
			local switch_value = dialogue_extension.wwise_voice_switch_value

			WwiseWorld.set_switch(wwise_world, switch_group, switch_value, wwise_source)
		end

		local playing_id = WwiseWorld.trigger_event(wwise_world, breed.death_sound_event, wwise_source)
		local hit_reaction_extension = ScriptUnit.has_extension(unit, "hit_reaction_system")

		if hit_reaction_extension then
			hit_reaction_extension:set_death_sound_event_id(playing_id)
		end
	end

	local player = Managers.player:owner(owner_unit)

	if player then
		local breed_name = breed.name

		DeathReactions._add_ai_killed_by_player_telemetry(unit, breed_name, owner_unit, player, damage_type, weapon_name, death_hit_zone)
	end

	local death_extension = ScriptUnit.extension(unit, "death_system")
	local data = {
		breed = breed,
		finish_time = t + (breed.time_to_unspawn_after_death or 10),
		wall_nail_data = death_extension.wall_nail_data
	}

	if breed.force_despawn then
		Managers.state.unit_spawner:mark_for_deletion(unit)
	elseif not breed.ignore_death_watch_timer then
		data.push_to_death_watch_timer = 0
	end

	return data, DeathReactions.IS_NOT_DONE
end

local function ai_chaos_tentacle_start(unit, context, t, killing_blow, is_server)
	local data, result = ai_default_unit_start(unit, context, t, killing_blow, is_server)
	local blackboard = BLACKBOARDS[unit]
	data.blackboard = blackboard
	local tentacle_data = blackboard.tentacle_data
	local boss_master_unit = blackboard.boss_master_unit

	if boss_master_unit and Unit.alive(boss_master_unit) then
		local boss_blackboard = BLACKBOARDS[boss_master_unit]
		boss_blackboard.num_portals_alive = boss_blackboard.num_portals_alive - 1
		boss_blackboard.tentacle_portal_units[unit] = nil
	end

	local breed = data.breed
	local head_node = Unit.node(unit, breed.sound_head_node)

	WwiseUtils.trigger_unit_event(context.world, "Play_enemy_sorcerer_tentacle_death_vce", unit, head_node)
	WwiseUtils.trigger_unit_event(context.world, "Stop_tentacle_movement", unit, head_node)

	local target_unit = blackboard.current_target

	if Unit.alive(target_unit) then
		blackboard.tentacle_spline_extension:set_target("attack", target_unit, tentacle_data.current_length)

		local new_pos = POSITION_LOOKUP[target_unit]

		tentacle_data.last_target_pos:store(new_pos)

		if tentacle_data.sub_state == "portal_hanging" then
			StatusUtils.set_grabbed_by_tentacle_status_network(target_unit, "portal_release")

			tentacle_data.wait_for_release = t + breed.portal_release_time
			tentacle_data.sub_state = "portal_release"
		else
			tentacle_data.wait_for_release = t

			StatusUtils.set_grabbed_by_tentacle_network(target_unit, false, unit)
		end

		local template_name = "attack"
		local network_manager = Managers.state.network
		local unit_id = network_manager:unit_game_object_id(unit)
		local target_unit_id = network_manager:unit_game_object_id(blackboard.current_target)
		local template_id = NetworkLookup.tentacle_template[template_name]
		local reach_dist = math.clamp(tentacle_data.current_length, 0, 31)

		network_manager.network_transmit:send_rpc_clients("rpc_change_tentacle_state", unit_id, target_unit_id, template_id, reach_dist, t)
	end

	return data, result
end

local function ai_chaos_tentacle_update(unit, dt, context, t, data, is_server)
	local blackboard = data.blackboard
	local target_unit = blackboard.current_target

	if Unit.alive(target_unit) then
		local tentacle_data = blackboard.tentacle_data

		if tentacle_data.unit then
			local current_length = tentacle_data.current_length - 7 * dt
			tentacle_data.current_length = math.max(current_length, 0)
			local tentacle_extension = blackboard.tentacle_spline_extension

			tentacle_extension:set_target("attack", target_unit, current_length)

			if current_length > 0 or t < tentacle_data.wait_for_release then
				return DeathReactions.IS_NOT_DONE
			else
				local portal_unit = tentacle_data.portal_unit

				AiUtils.kill_unit(portal_unit)
			end
		end

		if tentacle_data.sub_state == "portal_release" then
			StatusUtils.set_grabbed_by_tentacle_network(target_unit, false, unit)
		end
	end

	Managers.state.unit_spawner:mark_for_deletion(unit)

	return DeathReactions.IS_DONE
end

local function update_wall_nail(unit, dt, t, data)
	for hit_ragdoll_actor, nail_data in pairs(data.wall_nail_data) do
		local actor = Unit.actor(unit, hit_ragdoll_actor)

		if actor and Actor.is_physical(actor) then
			local world = Unit.world(unit)
			local position = Actor.position(actor)

			fassert(Vector3.is_valid(position), "Position from actor is not valid.")

			nail_data.position = Vector3Box(position)
			local dir = nail_data.attack_direction:unbox()
			local fly_time = 0.3
			local ray_dist = nail_data.hit_speed * fly_time

			fassert(ray_dist > 0, "Ray distance is not greater than 0")

			local collision_filter = "filter_weapon_nailing"
			local hit, hit_position, hit_distance, hit_normal, hit_actor = PhysicsWorld.immediate_raycast(World.get_data(world, "physics_world"), position, dir, (data.nailed and math.min(ray_dist, 0.4)) or ray_dist, "closest", "collision_filter", collision_filter)

			if hit then
				Unit.disable_animation_state_machine(unit)
				Actor.set_kinematic(actor, true)
				Actor.set_collision_enabled(actor, false)

				local thickness = Unit.get_data(unit, "breed").ragdoll_actor_thickness[hit_ragdoll_actor]
				local node = Actor.node(actor)

				Unit.scene_graph_link(unit, node, nil)

				nail_data.node = node

				fassert(Vector3.is_valid(hit_position), "Position from raycast is valid")

				nail_data.target_position = Vector3Box(hit_position - dir * thickness)
				nail_data.start_t = t
				nail_data.end_t = t + math.max(hit_distance / ray_dist * fly_time, 0.01)
				data.finish_time = math.max(data.finish_time, t + 30)
				data.nailed = true
			else
				data.wall_nail_data[hit_ragdoll_actor] = nil
			end
		elseif actor and data.nailed then
			local node = nail_data.node
			local lerp_t = math.min(math.auto_lerp(nail_data.start_t, nail_data.end_t, 0, 1, t), 1)

			Unit.set_local_position(unit, node, Vector3.lerp(nail_data.position:unbox(), nail_data.target_position:unbox(), lerp_t))
		end
	end
end

local function ai_default_unit_update(unit, dt, context, t, data, is_server)
	if not data.remove then
		if data.push_to_death_watch_timer and data.push_to_death_watch_timer < t then
			Managers.state.unit_spawner:push_unit_to_death_watch_list(unit, t, data)

			data.push_to_death_watch_timer = nil
		end

		if next(data.wall_nail_data) then
			update_wall_nail(unit, dt, t, data)
		end

		return DeathReactions.IS_NOT_DONE
	end

	Managers.state.unit_spawner:mark_for_deletion(unit)

	return DeathReactions.IS_DONE
end

local function ai_default_husk_start(unit, context, t, killing_blow, is_server)
	local killer_unit = killing_blow[DamageDataIndex.ATTACKER]
	local death_hit_zone = killing_blow[DamageDataIndex.HIT_ZONE]
	local damage_type = killing_blow[DamageDataIndex.DAMAGE_TYPE]
	local weapon_name = killing_blow[DamageDataIndex.DAMAGE_SOURCE_NAME]
	local locomotion = ScriptUnit.has_extension(unit, "locomotion_system")

	if locomotion then
		locomotion:set_mover_disable_reason("husk_death_reaction", true)
		locomotion:set_collision_disabled("husk_death_reaction", true)
		locomotion:destroy()
	end

	local owner_unit = AiUtils.get_actual_attacker_unit(killer_unit)

	play_screen_space_blood(context.world, unit, owner_unit, killing_blow, damage_type)

	if ScriptUnit.has_extension(unit, "ai_inventory_system") then
		local inventory_system = Managers.state.entity:system("ai_inventory_system")

		inventory_system:drop_item(unit)
	end

	local breed = Unit.get_data(unit, "breed")

	if breed.death_sound_event and not is_hot_join_sync(killing_blow) then
		local wwise_source, wwise_world = WwiseUtils.make_unit_auto_source(context.world, unit, Unit.node(unit, "c_head"))
		local dialogue_extension = ScriptUnit.extension(unit, "dialogue_system")
		local switch_group = dialogue_extension.wwise_voice_switch_group

		if switch_group then
			local switch_value = dialogue_extension.wwise_voice_switch_value

			WwiseWorld.set_switch(wwise_world, switch_group, switch_value, wwise_source)
		end

		local playing_id = WwiseWorld.trigger_event(wwise_world, breed.death_sound_event, wwise_source)
		local hit_reaction_extension = ScriptUnit.has_extension(unit, "hit_reaction_system")

		if hit_reaction_extension then
			hit_reaction_extension:set_death_sound_event_id(playing_id)
		end
	end

	local achievements_enabled = Development.parameter("v2_achievements")

	if achievements_enabled then
		handle_boss_difficulty_kill_achievement_tracking(breed, context.statistics_db)
	end

	local player = Managers.player:owner(owner_unit)

	if player then
		local breed_name = breed.name

		DeathReactions._add_ai_killed_by_player_telemetry(unit, breed_name, owner_unit, player, damage_type, weapon_name, death_hit_zone)
	end

	local death_extension = ScriptUnit.extension(unit, "death_system")
	local data = {
		breed = breed,
		finish_time = t + 10,
		wall_nail_data = death_extension.wall_nail_data
	}

	Managers.state.unit_spawner:freeze_unit_extensions(unit, t, data)

	return data, DeathReactions.IS_NOT_DONE
end

local function ai_chaos_tentacle_husk_start(unit, context, t, killing_blow, is_server)
	local data, result = ai_default_husk_start(unit, context, t, killing_blow, is_server)

	if not is_hot_join_sync(killing_blow) then
		local breed = data.breed
		local head_node = Unit.node(unit, breed.sound_head_node)

		WwiseUtils.trigger_unit_event(context.world, "Play_enemy_sorcerer_tentacle_death_vce", unit, head_node)
		WwiseUtils.trigger_unit_event(context.world, "Stop_tentacle_movement", unit, head_node)
	end

	return data, result
end

local function ai_default_husk_update(unit, dt, context, t, data)
	if next(data.wall_nail_data) then
		update_wall_nail(unit, dt, t, data)

		return DeathReactions.IS_NOT_DONE
	elseif not data.player_collided and not data.nailed then
		return DeathReactions.IS_NOT_DONE
	end

	return DeathReactions.IS_DONE
end

local function play_unit_audio(unit, blackboard, sound_name)
	Managers.state.entity:system("audio_system"):play_audio_unit_event(sound_name, unit)
end

local function trigger_unit_dialogue_death_event(killed_unit, killer_unit, hit_zone, damage_type)
	if not Unit.alive(killed_unit) or not Unit.alive(killer_unit) then
		return
	end

	if Unit.has_data(killed_unit, "enemy_dialogue_face_anim") and Unit.has_animation_state_machine(killed_unit) then
		Unit.animation_event(killed_unit, "talk_end")
	end

	if Unit.has_data(killed_unit, "enemy_dialogue_body_anim") and Unit.has_animation_state_machine(killed_unit) then
		Unit.animation_event(killed_unit, "talk_body_end")
	end

	if ScriptUnit.has_extension(killer_unit, "dialogue_system") then
		local dialogue_input = ScriptUnit.extension_input(killer_unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()
		local killed_unit_name = "UNKNOWN"
		local breed_data = Unit.get_data(killed_unit, "breed")

		if breed_data then
			killed_unit_name = breed_data.name
		elseif ScriptUnit.has_extension(killed_unit, "dialogue_system") then
			killed_unit_name = ScriptUnit.extension(killed_unit, "dialogue_system").context.player_profile
		end

		local player = Managers.player:owner(killer_unit)

		if player ~= nil then
			local inventory_extension = ScriptUnit.extension(killer_unit, "inventory_system")
			local weapon_slot = inventory_extension:get_wielded_slot_name()
			local weapon_data = inventory_extension:get_slot_data(weapon_slot)
			local attack_template = AttackTemplates[damage_type]

			if weapon_slot == "slot_melee" or weapon_slot == "slot_ranged" then
				local dot_type = false
				event_data.killed_type = killed_unit_name
				event_data.hit_zone = hit_zone
				event_data.weapon_slot = weapon_slot

				if weapon_data then
					event_data.weapon_type = weapon_data.item_data.item_type

					if attack_template and attack_template.dot_type then
						dot_type = attack_template.dot_type
					end
				end

				if killed_unit_name == "skaven_rat_ogre" then
					local times_killed_rat_ogre = ScriptUnit.extension(killer_unit, "dialogue_system").user_memory.times_killed_rat_ogre

					if times_killed_rat_ogre then
						ScriptUnit.extension(killer_unit, "dialogue_system").user_memory.times_killed_rat_ogre = times_killed_rat_ogre + 1
					else
						ScriptUnit.extension(killer_unit, "dialogue_system").user_memory.times_killed_rat_ogre = 1
					end
				end

				local killer_name = ScriptUnit.extension(killer_unit, "dialogue_system").context.player_profile

				SurroundingAwareSystem.add_event(killer_unit, "killed_enemy", DialogueSettings.default_view_distance, "killer_name", killer_name, "hit_zone", hit_zone, "enemy_tag", killed_unit_name, "weapon_slot", weapon_slot, "dot_type", dot_type)

				local event_name = "enemy_kill"

				dialogue_input:trigger_dialogue_event(event_name, event_data)
			end
		end
	end
end

local buff_params = {}

local function trigger_player_killing_blow_ai_buffs(ai_unit, killing_blow, is_server)
	local attacker_unit = killing_blow[DamageDataIndex.ATTACKER]

	if Unit.alive(attacker_unit) and ScriptUnit.has_extension(attacker_unit, "buff_system") then
		local buff_extension = ScriptUnit.extension(attacker_unit, "buff_system")

		buff_extension:trigger_procs("on_kill", killing_blow, breed_data)
	end

	local breed_data = Unit.get_data(ai_unit, "breed")

	if breed_data.boss then
		local player_and_bot_units = PLAYER_AND_BOT_UNITS

		for i = 1, #player_and_bot_units, 1 do
			local unit = player_and_bot_units[i]
			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

			if buff_extension then
				buff_extension:trigger_procs("on_boss_killed", killing_blow, breed_data)
			end
		end
	end

	if breed_data.special then
		local player_and_bot_units = PLAYER_AND_BOT_UNITS

		for i = 1, #player_and_bot_units, 1 do
			local unit = player_and_bot_units[i]
			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

			if buff_extension then
				buff_extension:trigger_procs("on_special_killed", killing_blow, breed_data, ai_unit)
			end
		end
	end

	local ping_extension = ScriptUnit.has_extension(ai_unit, "ping_system")

	if ping_extension then
		local player_and_bot_units = PLAYER_AND_BOT_UNITS

		for i = 1, #player_and_bot_units, 1 do
			local unit = player_and_bot_units[i]
			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

			if buff_extension then
				buff_extension:trigger_procs("on_ping_target_killed", killing_blow, breed_data)
			end
		end
	end
end

local function trigger_headshot_dialogue_event(unit, killing_blow)
	if killing_blow[DamageDataIndex.HIT_ZONE] == "head" then
		local source = killing_blow[DamageDataIndex.ATTACKER]

		if ScriptUnit.has_extension(source, "surrounding_aware_system") then
			local speaker_name = "UNKNOWN"
			local breed_data = Unit.get_data(source, "breed")

			if breed_data then
				speaker_name = breed_data.name
			elseif ScriptUnit.has_extension(source, "dialogue_system") then
				speaker_name = ScriptUnit.extension(source, "dialogue_system").context.player_profile
			end

			SurroundingAwareSystem.add_event(source, "heard_speak", last_query.validated_rule.sound_distance, "heard_event", last_query.result, "speaker", source, "speaker_name", speaker_name, "sound_event", extension.last_query_sound_event or "unknown")
		end
	end
end

local pickup_params = {}
DeathReactions.templates = {
	ai_default = {
		unit = {
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_unit_start(unit, context, t, killing_blow, is_server)

				StatisticsUtil.register_kill(unit, killing_blow, context.statistics_db, true)
				trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
				trigger_player_killing_blow_ai_buffs(unit, killing_blow, true)
				Managers.state.entity:system("play_go_tutorial_system"):register_killing_blow(killing_blow[DamageDataIndex.DAMAGE_TYPE], killing_blow[DamageDataIndex.ATTACKER])

				if unit ~= killing_blow[DamageDataIndex.ATTACKER] and ScriptUnit.has_extension(unit, "ai_system") then
					ScriptUnit.extension(unit, "ai_system"):attacked(killing_blow[DamageDataIndex.ATTACKER], t, killing_blow)
				end

				return data, result
			end,
			update = function (unit, dt, context, t, data)
				local result = ai_default_unit_update(unit, dt, context, t, data)

				return result
			end
		},
		husk = {
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_husk_start(unit, context, t, killing_blow, is_server)

				if not is_hot_join_sync(killing_blow) then
					StatisticsUtil.register_kill(unit, killing_blow, context.statistics_db)
					trigger_player_killing_blow_ai_buffs(unit, killing_blow, false)
				end

				return data, result
			end,
			update = function (unit, dt, context, t, data)
				local result = ai_default_husk_update(unit, dt, context, t, data)

				return result
			end
		}
	},
	chaos_tentacle = {
		unit = {
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_chaos_tentacle_start(unit, context, t, killing_blow, is_server)

				StatisticsUtil.register_kill(unit, killing_blow, context.statistics_db, true)
				trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
				trigger_player_killing_blow_ai_buffs(unit, killing_blow, true)

				return data, result
			end,
			update = function (unit, dt, context, t, data)
				local result = ai_chaos_tentacle_update(unit, dt, context, t, data)

				return result
			end
		},
		husk = {
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_chaos_tentacle_husk_start(unit, context, t, killing_blow, is_server)

				if not is_hot_join_sync(killing_blow) then
					StatisticsUtil.register_kill(unit, killing_blow, context.statistics_db)
					trigger_player_killing_blow_ai_buffs(unit, killing_blow, false)
				end

				return data, result
			end,
			update = function (unit, dt, context, t, data)
				return DeathReactions.IS_DONE
			end
		}
	},
	chaos_tentacle_portal = {
		unit = {
			start = function (unit, context, t, killing_blow, is_server)
				Unit.flow_event(unit, "kill_portal")

				local surface_node = Unit.node(unit, "a_surface_center")

				WwiseUtils.trigger_unit_event(context.world, "Play_enemy_sorcerer_portal_explode", unit, surface_node)

				local data = {
					despawn_after_time = t + 4.2
				}

				return data, DeathReactions.IS_NOT_DONE
			end,
			update = function (unit, dt, context, t, data)
				if data.despawn_after_time < t then
					Managers.state.unit_spawner:mark_for_deletion(unit)

					return DeathReactions.IS_DONE
				end

				return DeathReactions.IS_NOT_DONE
			end
		},
		husk = {
			start = function (unit, context, t, killing_blow, is_server)
				if not is_hot_join_sync(killing_blow) then
					Unit.flow_event(unit, "kill_portal")

					local surface_node = Unit.node(unit, "a_surface_center")

					WwiseUtils.trigger_unit_event(context.world, "Play_enemy_sorcerer_portal_explode", unit, surface_node)
				end

				return nil, DeathReactions.IS_DONE
			end,
			update = function (unit, dt, context, t, data)
				return DeathReactions.IS_DONE
			end
		}
	},
	storm_vermin_champion = {
		unit = {
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_unit_start(unit, context, t, killing_blow, is_server)

				StatisticsUtil.register_kill(unit, killing_blow, context.statistics_db, true)
				trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
				trigger_player_killing_blow_ai_buffs(unit, killing_blow, true)

				if unit ~= killing_blow[DamageDataIndex.ATTACKER] and ScriptUnit.has_extension(unit, "ai_system") then
					ScriptUnit.extension(unit, "ai_system"):attacked(killing_blow[DamageDataIndex.ATTACKER], t, killing_blow)
				end

				local blackboard = BLACKBOARDS[unit]

				if blackboard.ward_active then
					AiUtils.stormvermin_champion_set_ward_state(unit, false, true)

					blackboard.ward_active = false
				end

				return data, result
			end,
			update = function (unit, dt, context, t, data)
				local result = ai_default_unit_update(unit, dt, context, t, data)

				return result
			end
		},
		husk = {
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_husk_start(unit, context, t, killing_blow, is_server)

				if not is_hot_join_sync(killing_blow) then
					StatisticsUtil.register_kill(unit, killing_blow, context.statistics_db)
					trigger_player_killing_blow_ai_buffs(unit, killing_blow, false)
				end

				return data, result
			end,
			update = function (unit, dt, context, t, data)
				local result = ai_default_husk_update(unit, dt, context, t, data)

				return result
			end
		}
	},
	gutter_runner = {
		unit = {
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_unit_start(unit, context, t, killing_blow, is_server)
				data.despawn_after_time = t + 2

				StatisticsUtil.register_kill(unit, killing_blow, context.statistics_db, true)
				trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
				trigger_player_killing_blow_ai_buffs(unit, killing_blow, true)

				return data, result
			end,
			update = function (unit, dt, context, t, data)
				if data.despawn_after_time and data.despawn_after_time < t then
					Managers.state.unit_spawner:mark_for_deletion(unit)

					return DeathReactions.IS_DONE
				end

				return DeathReactions.IS_NOT_DONE
			end
		},
		husk = {
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_husk_start(unit, context, t, killing_blow, is_server)

				if not is_hot_join_sync(killing_blow) then
					StatisticsUtil.register_kill(unit, killing_blow, context.statistics_db)
					trigger_player_killing_blow_ai_buffs(unit, killing_blow, false)
				end

				return nil, DeathReactions.IS_DONE
			end,
			update = function (unit, dt, context, t, data)
				return DeathReactions.IS_DONE
			end
		}
	},
	poison_globadier = {
		unit = {
			start = function (unit, context, t, killing_blow, is_server)
				local blackboard = BLACKBOARDS[unit]

				play_unit_audio(unit, blackboard, "Stop_enemy_foley_globadier_boiling_loop")
				StatisticsUtil.register_kill(unit, killing_blow, context.statistics_db, true)

				if unit ~= killing_blow[DamageDataIndex.ATTACKER] and ScriptUnit.has_extension(unit, "ai_system") then
					ScriptUnit.extension(unit, "ai_system"):attacked(killing_blow[DamageDataIndex.ATTACKER], t, killing_blow)
				end

				if blackboard.suicide_run ~= nil and blackboard.suicide_run.explosion_started then
					ai_default_unit_start(unit, context, t, killing_blow, is_server)

					local sound_name = "Play_enemy_combat_globadier_suicide_explosion"

					play_unit_audio(unit, blackboard, sound_name)

					local action = blackboard.suicide_run.action

					assert(action)
					AiUtils.poison_explode_unit(unit, action, blackboard)
					trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
					trigger_player_killing_blow_ai_buffs(unit, killing_blow, true)

					return nil, DeathReactions.IS_DONE
				else
					local data, result = ai_default_unit_start(unit, context, t, killing_blow, is_server)
					data.blackboard = blackboard

					trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
					trigger_player_killing_blow_ai_buffs(unit, killing_blow, true)

					return data, result
				end
			end,
			update = function (unit, dt, context, t, data)
				local blackboard = data.blackboard
				local result = nil

				if blackboard.suicide_run ~= nil and blackboard.suicide_run.explosion_started then
					result = DeathReactions.IS_DONE
				else
					result = ai_default_unit_update(unit, dt, context, t, data)
				end

				return result
			end
		},
		husk = {
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_husk_start(unit, context, t, killing_blow)

				if not is_hot_join_sync(killing_blow) then
					StatisticsUtil.register_kill(unit, killing_blow, context.statistics_db)
					trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
					trigger_player_killing_blow_ai_buffs(unit, killing_blow, false)
				end

				return data, result
			end,
			update = function (unit, dt, context, t, data)
				local result = ai_default_husk_update(unit, dt, context, t, data)

				return result
			end
		}
	},
	chaos_zombie = {
		unit = {
			start = function (unit, context, t, killing_blow, is_server)
				local blackboard = BLACKBOARDS[unit]

				StatisticsUtil.register_kill(unit, killing_blow, context.statistics_db, true)

				if unit ~= killing_blow[DamageDataIndex.ATTACKER] and ScriptUnit.has_extension(unit, "ai_system") then
					ScriptUnit.extension(unit, "ai_system"):attacked(killing_blow[DamageDataIndex.ATTACKER], t, killing_blow)
				end

				ai_default_unit_start(unit, context, t, killing_blow, is_server)

				local inventory_extension = ScriptUnit.extension(unit, "ai_inventory_system")

				if killing_blow[DamageDataIndex.HIT_ZONE] == inventory_extension.inventory_weak_spot or blackboard.explosion_finished then
					local action = BreedActions.chaos_zombie.explosion_attack

					AiUtils.chaos_zombie_explosion(unit, action, blackboard, true)

					return nil, DeathReactions.IS_DONE
				else
					local network_manager = Managers.state.network

					network_manager:anim_event(unit, "death_backward")

					local action = blackboard.action
					local pos = POSITION_LOOKUP[unit]
					local size = Vector3(4, 4, 1)
					local bot_threat_duration = 1

					Managers.state.entity:system("ai_bot_group_system"):aoe_threat_created(pos, "cylinder", size, nil, bot_threat_duration)

					return nil, DeathReactions.IS_NOT_DONE
				end
			end,
			update = function (unit, dt, context, t, data)
				local blackboard = BLACKBOARDS[unit]
				local result = nil

				if blackboard.anim_cb_death_finished then
					local action = BreedActions.chaos_zombie.explosion_attack

					AiUtils.chaos_zombie_explosion(unit, action, blackboard, true)

					result = DeathReactions.IS_DONE
				elseif blackboard.explosion_finished then
					result = DeathReactions.IS_DONE
				end

				return result
			end
		},
		husk = {
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_husk_start(unit, context, t, killing_blow)

				if not is_hot_join_sync(killing_blow) then
					StatisticsUtil.register_kill(unit, killing_blow, context.statistics_db)
				end

				return data, result
			end,
			update = function (unit, dt, context, t, data)
				local result = ai_default_husk_update(unit, dt, context, t, data)

				return result
			end
		}
	},
	warpfire_thrower = {
		unit = {
			start = function (unit, context, t, killing_blow, is_server)
				local blackboard = BLACKBOARDS[unit]

				StatisticsUtil.register_kill(unit, killing_blow, context.statistics_db, true)

				if unit ~= killing_blow[DamageDataIndex.ATTACKER] and ScriptUnit.has_extension(unit, "ai_system") then
					ScriptUnit.extension(unit, "ai_system"):attacked(killing_blow[DamageDataIndex.ATTACKER], t, killing_blow)
				end

				local data, result = ai_default_unit_start(unit, context, t, killing_blow, is_server)

				trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
				trigger_player_killing_blow_ai_buffs(unit, killing_blow, true)
				WwiseUtils.trigger_unit_event(Managers.world:world("level_world"), "Stop_enemy_vo_warpfire", unit, Unit.node(unit, "a_voice"))

				if killing_blow[DamageDataIndex.HIT_ZONE] == "aux" then
					local hit_ragdoll_actor = killing_blow[DamageDataIndex.HIT_RAGDOLL_ACTOR_NAME]

					AiUtils.warpfire_explode_unit(unit, blackboard)

					blackboard.explode_on_death = true

					return data, DeathReactions.IS_NOT_DONE
				else
					data.blackboard = blackboard

					return data, result
				end
			end,
			update = function (unit, dt, context, t, data)
				local blackboard = BLACKBOARDS[unit]
				local result = nil

				if blackboard.explode_on_death then
					local backpack_actor = Unit.actor(unit, "j_backpack")

					if backpack_actor then
						result = DeathReactions.IS_DONE

						Actor.set_collision_enabled(backpack_actor, false)
						Actor.set_scene_query_enabled(backpack_actor, false)
					else
						result = DeathReactions.IS_NOT_DONE
					end

					ai_default_unit_update(unit, dt, context, t, data)
				else
					result = ai_default_unit_update(unit, dt, context, t, data)
				end

				return result
			end
		},
		husk = {
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_husk_start(unit, context, t, killing_blow)
				local death_hit_zone = killing_blow[DamageDataIndex.HIT_ZONE]

				if death_hit_zone == "aux" then
					Unit.flow_event(unit, "lua_hide_backpack")

					local death_extension = ScriptUnit.extension(unit, "death_system")
					death_extension.actor_to_disable_on_death = "j_backpack"
				end

				if not is_hot_join_sync(killing_blow) then
					StatisticsUtil.register_kill(unit, killing_blow, context.statistics_db)
					trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
					trigger_player_killing_blow_ai_buffs(unit, killing_blow, false)
				end

				WwiseUtils.trigger_unit_event(Managers.world:world("level_world"), "Stop_enemy_vo_warpfire", unit, Unit.node(unit, "a_voice"))

				return data, result
			end,
			update = function (unit, dt, context, t, data)
				ai_default_husk_update(unit, dt, context, t, data)

				local death_extension = ScriptUnit.extension(unit, "death_system")
				local result = nil

				if death_extension.actor_to_disable_on_death then
					local backpack_actor = Unit.actor(unit, death_extension.actor_to_disable_on_death)

					if backpack_actor then
						result = DeathReactions.IS_DONE

						Actor.set_collision_enabled(backpack_actor, false)
						Actor.set_scene_query_enabled(backpack_actor, false)
					else
						result = DeathReactions.IS_NOT_DONE
					end
				else
					result = DeathReactions.IS_DONE
				end

				return result
			end
		}
	},
	loot_rat = {
		unit = {
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_unit_start(unit, context, t, killing_blow, is_server)

				StatisticsUtil.register_kill(unit, killing_blow, context.statistics_db, true)
				trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
				trigger_player_killing_blow_ai_buffs(unit, killing_blow, true)

				local amount_of_loot_drops = math.random(2, 4)

				for i = 1, amount_of_loot_drops, 1 do
					local spawn_value = math.random()
					local pickups = LootRatPickups
					local spawn_weighting_total = 0

					for pickup_name, spawn_weighting in pairs(pickups) do
						table.clear(pickup_params)

						local dice_keeper = context.dice_keeper
						local can_spawn_pickup_type = true
						local pickup_settings = AllPickups[pickup_name]
						local can_spawn_func = pickup_settings.can_spawn_func
						pickup_params.dice_keeper = dice_keeper

						if can_spawn_func and not can_spawn_func(pickup_params) then
							can_spawn_pickup_type = false
						end

						spawn_weighting_total = spawn_weighting_total + spawn_weighting

						if spawn_value <= spawn_weighting_total and can_spawn_pickup_type then
							local extension_init_data = {
								pickup_system = {
									has_physics = true,
									spawn_type = "loot",
									pickup_name = pickup_name
								}
							}
							local unit_name = pickup_settings.unit_name
							local unit_template_name = pickup_settings.unit_template_name or "pickup_unit"
							local position = POSITION_LOOKUP[unit] + Vector3(math.random() - 0.5, math.random() - 0.5, 1)
							local rotation = Quaternion(Vector3.right(), math.random() * 2 * math.pi)

							Managers.state.unit_spawner:spawn_network_unit(unit_name, unit_template_name, extension_init_data, position, rotation)

							if pickup_name == "loot_die" then
								dice_keeper:bonus_dice_spawned()
							end

							break
						end
					end
				end

				if unit ~= killing_blow[DamageDataIndex.ATTACKER] and ScriptUnit.has_extension(unit, "ai_system") then
					ScriptUnit.extension(unit, "ai_system"):attacked(killing_blow[DamageDataIndex.ATTACKER], t, killing_blow)
				end

				return data, result
			end,
			update = function (unit, dt, context, t, data)
				local result = ai_default_unit_update(unit, dt, context, t, data)

				return result
			end
		},
		husk = {
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_husk_start(unit, context, t, killing_blow, is_server)

				if not is_hot_join_sync(killing_blow) then
					StatisticsUtil.register_kill(unit, killing_blow, context.statistics_db)
					trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
					trigger_player_killing_blow_ai_buffs(unit, killing_blow, false)
				end

				return data, result
			end,
			update = function (unit, dt, context, t, data)
				local result = ai_default_husk_update(unit, dt, context, t, data)

				return result
			end
		}
	},
	player = {
		unit = {
			start = function (unit, context, t, killing_blow, is_server)
				local player = Managers.player:owner(unit)
				local damage_type = killing_blow[DamageDataIndex.DAMAGE_TYPE]
				local damage_source = killing_blow[DamageDataIndex.DAMAGE_SOURCE_NAME]
				local position = Unit.local_position(unit, 0)

				Managers.telemetry.events:player_died(player, damage_type, damage_source, position)

				return nil, DeathReactions.IS_DONE
			end
		},
		husk = {
			start = function (unit, context, t, killing_blow, is_server)
				if not is_hot_join_sync(killing_blow) then
					SurroundingAwareSystem.add_event(unit, "player_death", DialogueSettings.death_discover_distance, "target", unit, "target_name", ScriptUnit.extension(unit, "dialogue_system").context.player_profile)
				end

				return nil, DeathReactions.IS_DONE
			end
		}
	},
	level_object = {
		unit = {
			start = function (unit, context, t, killing_blow, is_server)
				Unit.set_flow_variable(unit, "current_health", 0)
				Unit.flow_event(unit, "lua_on_death")
			end,
			update = function (unit, dt, context, t, data)
				return
			end
		},
		husk = {
			start = function (unit, context, t, killing_blow, is_server)
				Unit.flow_event(unit, "lua_on_death")
			end,
			update = function (unit, dt, context, t, data)
				return
			end
		}
	},
	killable_projectile = {
		unit = {
			start = function (unit, context, t, killing_blow, is_server)
				local projectile_extension = ScriptUnit.extension(unit, "projectile_system")

				projectile_extension:force_impact(unit, Unit.local_position(unit, 0))

				local network_manager = Managers.state.network
				local unit_id = network_manager:unit_game_object_id(unit)
				local pos = Unit.local_position(unit, 0)

				network_manager.network_transmit:send_rpc_clients("rpc_generic_impact_projectile_force_impact", unit_id, pos)
				Unit.flow_event(unit, "lua_projectile_end")

				return nil, DeathReactions.IS_DONE
			end,
			update = function (unit, dt, context, t, data)
				return
			end
		},
		husk = {
			start = function (unit, context, t, killing_blow, is_server)
				Unit.flow_event(unit, "lua_on_death")
			end,
			update = function (unit, dt, context, t, data)
				return
			end
		}
	},
	explosive_barrel = {
		unit = {
			start = function (unit, context, t, killing_blow, is_server)
				local network_time = Managers.state.network:network_time()
				local explode_time = network_time
				local enemies_ignore_fuse = Unit.get_data(unit, "enemies_ignore_fuse")
				local data = {
					explode_time = explode_time,
					killer_unit = killing_blow[DamageDataIndex.ATTACKER],
					enemies_ignore_fuse = enemies_ignore_fuse
				}
				local death_extension = ScriptUnit.extension(unit, "death_system")
				death_extension.death_has_started = true

				return data, DeathReactions.IS_NOT_DONE
			end,
			update = function (unit, dt, context, t, data)
				local network_time = Managers.state.network:network_time()

				if not data.exploded then
					Unit.flow_event(unit, "exploding_barrel_detonate")
					Unit.set_unit_visibility(unit, false)

					local health_extension = ScriptUnit.extension(unit, "health_system")

					if health_extension.in_hand then
						if not health_extension.thrown then
							local position = POSITION_LOOKUP[unit]
							local rotation = Unit.local_rotation(unit, 0)
							local explosion_template = "explosive_barrel"
							local item_name = health_extension.item_name
							local owner_unit = health_extension.owner_unit

							Managers.state.entity:system("area_damage_system"):create_explosion(owner_unit, position, rotation, explosion_template, 1, item_name)

							local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
							local equipment = inventory_extension:equipment()
							local slot_name = equipment.wielded_slot

							inventory_extension:destroy_slot(slot_name)
							inventory_extension:wield_previous_weapon()
						end
					else
						local position = POSITION_LOOKUP[unit]
						local rotation = Unit.local_rotation(unit, 0)
						local explosion_template = "explosive_barrel"
						local item_name = health_extension.item_name

						Managers.state.entity:system("area_damage_system"):create_explosion(unit, position, rotation, explosion_template, 1, item_name)
					end

					data.exploded = true
				elseif network_time >= data.explode_time + 0.5 then
					Managers.state.unit_spawner:mark_for_deletion(unit)

					return DeathReactions.IS_DONE
				end
			end
		},
		husk = {
			start = function (unit, context, t, killing_blow, is_server)
				local network_time = Managers.state.network:network_time()
				local explode_time = network_time
				local enemies_ignore_fuse = Unit.get_data(unit, "enemies_ignore_fuse")
				local data = {
					explode_time = explode_time,
					killer_unit = killing_blow[DamageDataIndex.ATTACKER],
					enemies_ignore_fuse = enemies_ignore_fuse
				}
				local death_extension = ScriptUnit.extension(unit, "death_system")
				death_extension.death_has_started = true

				return data, DeathReactions.IS_NOT_DONE
			end,
			update = function (unit, dt, context, t, data)
				local network_time = Managers.state.network:network_time()

				if not data.exploded then
					Unit.flow_event(unit, "exploding_barrel_detonate")
					Unit.set_unit_visibility(unit, false)

					local health_extension = ScriptUnit.extension(unit, "health_system")

					if health_extension.in_hand and not health_extension.thrown then
						local position = POSITION_LOOKUP[unit]
						local rotation = Unit.local_rotation(unit, 0)
						local explosion_template = "explosive_barrel"
						local item_name = health_extension.item_name
						local owner_unit = health_extension.owner_unit

						Managers.state.entity:system("area_damage_system"):create_explosion(owner_unit, position, rotation, explosion_template, 1, item_name)

						local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
						local equipment = inventory_extension:equipment()
						local slot_name = equipment.wielded_slot

						inventory_extension:destroy_slot(slot_name)
						inventory_extension:wield_previous_weapon()
					end

					data.exploded = true
				elseif network_time >= data.explode_time + 0.5 then
					return DeathReactions.IS_DONE
				end
			end
		}
	},
	nurgle_liquid_blob = {
		unit = {
			start = function (unit, context, t, killing_blow, is_server)
				local network_time = Managers.state.network:network_time()
				local data = {
					start_time = network_time
				}
				local death_extension = ScriptUnit.extension(unit, "death_system")

				Unit.set_flow_variable(unit, "current_health", 0)
				Unit.flow_event(unit, "lua_on_death")

				death_extension.death_has_started = true

				return data, DeathReactions.IS_NOT_DONE
			end,
			update = function (unit, dt, context, t, data)
				local network_time = Managers.state.network:network_time()
				local delaytime = Unit.get_data(unit, "death_reaction_delay") or 0
				local start_time = data.start_time
				local result = DeathReactions.IS_NOT_DONE

				if network_time >= start_time + delaytime then
					Unit.flow_event(unit, "lua_death_reaction_start")

					if not data.destroyed then
						local num_actors = Unit.num_actors(unit)

						for i = 0, num_actors - 1, 1 do
							Unit.destroy_actor(unit, i)
						end

						local projectile_linker_system = Managers.state.entity:system("projectile_linker_system")

						projectile_linker_system:clear_linked_projectiles(unit)

						local position = Unit.local_position(unit, 0)
						local nav_world = Managers.state.entity:system("ai_system"):nav_world()
						local position_on_navmesh = LocomotionUtils.get_close_pos_below_on_mesh(nav_world, position, 4)

						if not position_on_navmesh then
							Managers.state.unit_spawner:mark_for_deletion(unit)

							result = DeathReactions.IS_DONE
						else
							local rotation = Unit.local_rotation(unit, 0)
							local direction = Quaternion.forward(rotation)
							direction = Vector3.flat(direction)
							local extension_init_data = {
								area_damage_system = {
									liquid_template = "nurgle_liquid",
									flow_dir = direction,
									source_unit = unit
								}
							}
							local aoe_unit_name = "units/hub_elements/empty"
							local liquid_aoe_unit = Managers.state.unit_spawner:spawn_network_unit(aoe_unit_name, "liquid_aoe_unit", extension_init_data, position_on_navmesh)
							local liquid_area_damage_extension = ScriptUnit.extension(liquid_aoe_unit, "area_damage_system")

							liquid_area_damage_extension:ready()
						end

						data.destroyed = true
					elseif data.destroyed and network_time >= start_time + 0.5 then
						result = DeathReactions.IS_DONE
					end

					return result
				end
			end
		},
		husk = {
			start = function (unit, context, t, killing_blow, is_server)
				local network_time = Managers.state.network:network_time()
				local data = {
					start_time = network_time
				}
				local death_extension = ScriptUnit.extension(unit, "death_system")
				death_extension.death_has_started = true

				return data, DeathReactions.IS_NOT_DONE
			end,
			update = function (unit, dt, context, t, data)
				local network_time = Managers.state.network:network_time()
				local start_time = data.start_time
				local result = DeathReactions.IS_NOT_DONE

				if not data.destroyed then
					Unit.set_unit_visibility(unit, false)

					local num_actors = Unit.num_actors(unit)

					for i = 0, num_actors - 1, 1 do
						Unit.destroy_actor(unit, i)
					end

					local projectile_linker_system = Managers.state.entity:system("projectile_linker_system")

					projectile_linker_system:clear_linked_projectiles(unit)

					data.destroyed = true
				elseif data.destroyed and network_time >= start_time + 0.5 then
					result = DeathReactions.IS_DONE
				end

				return result
			end
		}
	},
	lamp_oil = {
		unit = {
			start = function (unit, context, t, killing_blow, is_server)
				local network_time = Managers.state.network:network_time()
				local data = {
					killer_unit = killing_blow[DamageDataIndex.ATTACKER],
					start_time = network_time
				}
				local death_extension = ScriptUnit.extension(unit, "death_system")
				death_extension.death_has_started = true

				return data, DeathReactions.IS_NOT_DONE
			end,
			update = function (unit, dt, context, t, data)
				local network_time = Managers.state.network:network_time()
				local start_time = data.start_time
				local result = DeathReactions.IS_NOT_DONE

				if not data.exploded then
					Unit.flow_event(unit, "exploding_barrel_detonate")
					Unit.set_unit_visibility(unit, false)

					local position = POSITION_LOOKUP[unit]
					local nav_world = Managers.state.entity:system("ai_system"):nav_world()
					local position_on_navmesh = LocomotionUtils.get_close_pos_below_on_mesh(nav_world, position, 4)

					if not position_on_navmesh then
						Managers.state.unit_spawner:mark_for_deletion(unit)

						result = DeathReactions.IS_DONE
					else
						local rotation = Unit.local_rotation(unit, 0)
						local direction = Quaternion.forward(rotation)
						direction = Vector3.flat(direction)
						local extension_init_data = {
							area_damage_system = {
								liquid_template = "lamp_oil_fire",
								flow_dir = direction,
								source_unit = unit
							}
						}
						local aoe_unit_name = "units/hub_elements/empty"
						local liquid_aoe_unit = Managers.state.unit_spawner:spawn_network_unit(aoe_unit_name, "liquid_aoe_unit", extension_init_data, position_on_navmesh)
						local liquid_area_damage_extension = ScriptUnit.extension(liquid_aoe_unit, "area_damage_system")

						liquid_area_damage_extension:ready()
					end

					local health_extension = ScriptUnit.extension(unit, "health_system")

					if health_extension.in_hand and not health_extension.thrown then
						local owner_unit = health_extension.owner_unit
						local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
						local equipment = inventory_extension:equipment()
						local slot_name = equipment.wielded_slot

						inventory_extension:destroy_slot(slot_name)
						inventory_extension:wield_previous_weapon()
					end

					data.exploded = true
				elseif data.exploded and network_time >= start_time + 0.5 then
					Managers.state.unit_spawner:mark_for_deletion(unit)

					result = DeathReactions.IS_DONE
				end

				return result
			end
		},
		husk = {
			start = function (unit, context, t, killing_blow, is_server)
				local network_time = Managers.state.network:network_time()
				local data = {
					killer_unit = killing_blow[DamageDataIndex.ATTACKER],
					start_time = network_time
				}
				local death_extension = ScriptUnit.extension(unit, "death_system")
				death_extension.death_has_started = true

				return data, DeathReactions.IS_NOT_DONE
			end,
			update = function (unit, dt, context, t, data)
				local network_time = Managers.state.network:network_time()
				local start_time = data.start_time
				local result = DeathReactions.IS_NOT_DONE

				if not data.exploded then
					Unit.flow_event(unit, "exploding_barrel_detonate")
					Unit.set_unit_visibility(unit, false)

					local health_extension = ScriptUnit.extension(unit, "health_system")

					if health_extension.in_hand and not health_extension.thrown then
						local position = POSITION_LOOKUP[unit]
						local nav_world = Managers.state.entity:system("ai_system"):nav_world()
						local position_on_navmesh = LocomotionUtils.get_close_pos_below_on_mesh(nav_world, position, 4)

						if not position_on_navmesh then
							result = DeathReactions.IS_DONE
						else
							local rotation = Unit.local_rotation(unit, 0)
							local direction = Quaternion.forward(rotation)
							direction = Vector3.flat(direction)
							local liquid_template_id = NetworkLookup.liquid_area_damage_templates.lamp_oil_fire
							local network_manager = Managers.state.network
							local invalid_game_object_id = NetworkConstants.invalid_game_object_id

							network_manager.network_transmit:send_rpc_server("rpc_create_liquid_damage_area", invalid_game_object_id, position_on_navmesh, direction, liquid_template_id)
						end

						local owner_unit = health_extension.owner_unit
						local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
						local equipment = inventory_extension:equipment()
						local slot_name = equipment.wielded_slot

						inventory_extension:destroy_slot(slot_name)
						inventory_extension:wield_previous_weapon()
					end

					data.exploded = true
				elseif data.exploded and network_time >= start_time + 0.5 then
					result = DeathReactions.IS_DONE
				end

				return result
			end
		}
	},
	lure_unit = {
		unit = {
			start = function (unit, context, t, killing_blow, is_server)
				Managers.state.unit_spawner:mark_for_deletion(unit)

				return nil, DeathReactions.IS_DONE
			end
		},
		husk = {
			start = function (unit, context, t, killing_blow, is_server)
				return nil, DeathReactions.IS_DONE
			end
		}
	}
}

DeathReactions.get_reaction = function (death_reaction_template, is_husk)
	local templates = DeathReactions.templates
	local husk_key = (is_husk and "husk") or "unit"
	local reaction = templates[death_reaction_template][husk_key]

	fassert(reaction, "Death reaction for template %q and husk key %q does not exist", death_reaction_template, husk_key)

	return reaction
end

DeathReactions._add_ai_killed_by_player_telemetry = function (victim_unit, breed_name, player_unit, player, damage_type, weapon_name, death_hit_zone)
	local network_manager = Managers.state.network
	local is_server = network_manager.is_server
	local local_player = player.local_player
	local is_bot = player.bot_player

	if (is_bot and is_server) or local_player then
		local player_position = POSITION_LOOKUP[player_unit]
		local victim_position = POSITION_LOOKUP[victim_unit]

		Managers.telemetry.events:player_killed_ai(player, player_position, victim_position, breed_name, weapon_name, damage_type, death_hit_zone)
	end
end

return
