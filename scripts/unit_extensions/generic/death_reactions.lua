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
		if not player.remote and (not script_data.disable_remote_blood_splatter or Unit.alive(attacker_unit) and player == player_manager:owner(attacker_unit)) then
			local vp_name = player.viewport_name
			local cam_pos = camera_manager:camera_position(vp_name)

			if Vector3.distance_squared(cam_pos, pos) < 9 and (not script_data.disable_behind_blood_splatter or camera_manager:is_in_view(vp_name, pos)) then
				local particle_name = SCREENSPACE_DEATH_EFFECTS[damage_type] or "fx/screenspace_blood_drops"

				Managers.state.blood:play_screen_space_blood(particle_name, Vector3.zero())
			end
		end
	end
end

local function handle_boss_difficulty_kill_achievement_tracking(breed, statistics_db)
	local difficulty_kill_achievements = breed.difficulty_kill_achievements

	if difficulty_kill_achievements then
		for i = 1, #difficulty_kill_achievements do
			local kill_achivement = difficulty_kill_achievements[i]
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
					local saved_rank = statistics_db:get_persistent_stat(player:stats_id(), kill_achivement)

					if saved_rank < current_rank then
						statistics_db:set_stat(player:stats_id(), kill_achivement, current_rank)
					end
				end

				local_player_id = local_player_id + 1
			end
		end
	end
end

local function handle_military_event_achievement(damage_type, breed_name, statistics_db)
	if damage_type == "military_finish" and breed_name == "chaos_warrior" then
		local stat_names = {
			"military_statue_kill_chaos_warriors",
			"military_statue_kill_chaos_warriors_cata"
		}

		for i = 1, #stat_names do
			local allowed_difficulties = QuestSettings.allowed_difficulties[stat_names[i]]
			local difficulty = Managers.state.difficulty:get_difficulty()

			if allowed_difficulties[difficulty] then
				local local_player = Managers.player:local_player()

				if local_player then
					local stats_id = local_player:stats_id()

					statistics_db:increment_stat(stats_id, "military_statue_kill_chaos_warriors_session")

					local num_chaos_warriors_killed = statistics_db:get_stat(stats_id, "military_statue_kill_chaos_warriors_session")

					if num_chaos_warriors_killed >= 3 then
						statistics_db:increment_stat(stats_id, stat_names[i])
						Managers.state.network.network_transmit:send_rpc_clients("rpc_increment_stat", NetworkLookup.statistics[stat_names[i]])
					end
				end
			end
		end
	end
end

local function handle_castle_boss_achievement(killing_blow, unit)
	local conflict_manager = Managers.state.conflict

	if conflict_manager:count_units_by_breed_during_event("chaos_exalted_sorcerer_drachenfels") > 0 then
		local player_manager = Managers.player
		local victim_health_extension = ScriptUnit.has_extension(unit, "health_system")
		local victim_damage_data = victim_health_extension.last_damage_data
		local victim_player = player_manager:owner(unit)
		local attacker_unique_id = victim_damage_data.attacker_unique_id
		local attacker_player = player_manager:player_from_unique_id(attacker_unique_id)

		if attacker_player and attacker_player ~= victim_player then
			local boss_units = conflict_manager:alive_bosses()
			local boss_unit = boss_units[1]

			if boss_unit ~= unit then
				local blackboard = BLACKBOARDS[boss_unit]
				blackboard.no_kill_achievement = false
			end
		end
	end
end

local function ai_default_unit_pre_start(unit, context, t, killing_blow)
	local statistics_db = context.statistics_db
	local blackboard = BLACKBOARDS[unit]
	local breed = blackboard.breed
	local damage_type = killing_blow[DamageDataIndex.DAMAGE_TYPE]

	StatisticsUtil.register_kill(unit, killing_blow, statistics_db, true)
	handle_boss_difficulty_kill_achievement_tracking(breed, statistics_db)
	handle_military_event_achievement(damage_type, breed.name, statistics_db)
	handle_castle_boss_achievement(killing_blow, unit)
	QuestSettings.handle_bastard_block_on_death(breed, unit, killing_blow, statistics_db)

	local killer_unit = killing_blow[DamageDataIndex.ATTACKER]
	local owner_unit = AiUtils.get_actual_attacker_unit(killer_unit)
	local player = Managers.player:owner(owner_unit)

	if player then
		local weapon_name = killing_blow[DamageDataIndex.DAMAGE_SOURCE_NAME]
		local death_hit_zone = killing_blow[DamageDataIndex.HIT_ZONE]
		local breed_name = breed.name

		DeathReactions._add_ai_killed_by_player_telemetry(unit, breed_name, owner_unit, player, damage_type, weapon_name, death_hit_zone)
	end
end

local function ai_default_unit_start(unit, context, t, killing_blow, is_server)
	local killer_unit = killing_blow[DamageDataIndex.SOURCE_ATTACKER_UNIT] or killing_blow[DamageDataIndex.ATTACKER]
	local death_hit_zone = killing_blow[DamageDataIndex.HIT_ZONE]
	local damage_type = killing_blow[DamageDataIndex.DAMAGE_TYPE]
	local damaged_by_other = unit ~= killer_unit
	local blackboard = BLACKBOARDS[unit]
	local ai_extension = ScriptUnit.extension(unit, "ai_system")

	if damaged_by_other then
		AiUtils.alert_nearby_friends_of_enemy(unit, blackboard.group_blackboard.broadphase, killer_unit)
	end

	local breed = blackboard.breed

	if is_server and breed.custom_death_enter_function then
		local damage_source = killing_blow[DamageDataIndex.DAMAGE_SOURCE_NAME]

		breed.custom_death_enter_function(unit, killer_unit, damage_type, death_hit_zone, t, damage_source)
	end

	ai_extension:die(killer_unit, killing_blow)

	local locomotion = ScriptUnit.has_extension(unit, "locomotion_system")

	if locomotion then
		locomotion.death_velocity_boxed = locomotion.movement_type == "script_driven" and Vector3Box(locomotion:current_velocity()) or nil

		locomotion:set_affected_by_gravity(false)
		locomotion:set_movement_type("script_driven")
		locomotion:set_wanted_velocity(Vector3.zero())
		Managers.state.entity:system("ai_navigation_system"):add_navbot_to_release(unit)
		locomotion:set_collision_disabled("death_reaction", true)
		locomotion:set_movement_type("disabled")
	end

	if not breed.keep_weapon_on_death and ScriptUnit.has_extension(unit, "ai_inventory_system") then
		local inventory_extension = Managers.state.entity:system("ai_inventory_system")

		inventory_extension:drop_item(unit)
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

	local death_extension = ScriptUnit.extension(unit, "death_system")
	local data = {
		breed = breed,
		finish_time = t + (breed.time_to_unspawn_after_death or 10),
		wall_nail_data = death_extension.wall_nail_data
	}
	local force_despawn = breed.force_despawn

	if Managers.state.game_mode:has_activated_mutator("metal") and damage_type == "metal_mutator" then
		force_despawn = true
	end

	if force_despawn then
		Managers.state.unit_spawner:mark_for_deletion(unit)
	elseif not breed.ignore_death_watch_timer then
		data.push_to_death_watch_timer = 0
	end

	Managers.state.game_mode:ai_killed(unit, owner_unit, data, killing_blow)

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
			local hit, hit_position, hit_distance, _, _ = PhysicsWorld.immediate_raycast(World.get_data(world, "physics_world"), position, dir, data.nailed and math.min(ray_dist, 0.4) or ray_dist, "closest", "collision_filter", collision_filter)

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

	Managers.state.conflict:register_unit_destroyed(unit, "death_done")

	return DeathReactions.IS_DONE
end

local function ai_default_husk_pre_start(unit, context, t, killing_blow)
	local statistics_db = context.statistics_db

	if not is_hot_join_sync(killing_blow) then
		StatisticsUtil.register_kill(unit, killing_blow, statistics_db)
	end

	local breed = Unit.get_data(unit, "breed")

	handle_boss_difficulty_kill_achievement_tracking(breed, statistics_db)

	local killer_unit = killing_blow[DamageDataIndex.ATTACKER]
	local owner_unit = AiUtils.get_actual_attacker_unit(killer_unit)
	local player = Managers.player:owner(owner_unit)

	if player then
		local breed_name = breed.name
		local damage_type = killing_blow[DamageDataIndex.DAMAGE_TYPE]
		local weapon_name = killing_blow[DamageDataIndex.DAMAGE_SOURCE_NAME]
		local death_hit_zone = killing_blow[DamageDataIndex.HIT_ZONE]

		DeathReactions._add_ai_killed_by_player_telemetry(unit, breed_name, owner_unit, player, damage_type, weapon_name, death_hit_zone)
	end
end

local function ai_default_husk_start(unit, context, t, killing_blow, is_server)
	local killer_unit = killing_blow[DamageDataIndex.ATTACKER]
	local damage_type = killing_blow[DamageDataIndex.DAMAGE_TYPE]
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

	local death_extension = ScriptUnit.extension(unit, "death_system")
	local data = {
		breed = breed,
		finish_time = t + 10,
		wall_nail_data = death_extension.wall_nail_data
	}

	Managers.state.game_mode:ai_killed(unit, owner_unit, data, killing_blow)

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

	if Unit.has_animation_state_machine(killed_unit) then
		if Unit.has_data(killed_unit, "enemy_dialogue_face_anim") then
			Unit.animation_event(killed_unit, "talk_end")
		end

		if Unit.has_data(killed_unit, "enemy_dialogue_body_anim") then
			Unit.animation_event(killed_unit, "talk_body_end")
		end
	end

	local killer_dialogue_extension = ScriptUnit.has_extension(killer_unit, "dialogue_system")
	local player = Managers.player:owner(killer_unit)

	if killer_dialogue_extension and player ~= nil then
		local killed_unit_name = "UNKNOWN"
		local breed_data = Unit.get_data(killed_unit, "breed")

		if breed_data then
			killed_unit_name = breed_data.name
		elseif ScriptUnit.has_extension(killed_unit, "dialogue_system") then
			killed_unit_name = ScriptUnit.extension(killed_unit, "dialogue_system").context.player_profile
		end

		if killed_unit_name == "skaven_rat_ogre" then
			local user_memory = killer_dialogue_extension.user_memory
			user_memory.times_killed_rat_ogre = (user_memory.times_killed_rat_ogre or 0) + 1
		end

		local inventory_extension = ScriptUnit.extension(killer_unit, "inventory_system")
		local weapon_slot = inventory_extension:get_wielded_slot_name()

		if weapon_slot == "slot_melee" or weapon_slot == "slot_ranged" then
			local dot_type = false
			local event_data = FrameTable.alloc_table()
			event_data.killed_type = killed_unit_name
			event_data.hit_zone = hit_zone
			event_data.weapon_slot = weapon_slot
			local weapon_data = inventory_extension:get_slot_data(weapon_slot)

			if weapon_data then
				event_data.weapon_type = weapon_data.item_data.item_type
				local attack_template = AttackTemplates[damage_type]

				if attack_template and attack_template.dot_type then
					dot_type = attack_template.dot_type
				end
			end

			local killer_name = killer_dialogue_extension.context.player_profile
			local blackboard = BLACKBOARDS[killed_unit]
			local optional_spawn_data = blackboard and blackboard.optional_spawn_data

			if optional_spawn_data and not optional_spawn_data.prevent_killed_enemy_dialogue then
				SurroundingAwareSystem.add_event(killer_unit, "killed_enemy", DialogueSettings.default_view_distance, "killer_name", killer_name, "hit_zone", hit_zone, "enemy_tag", killed_unit_name, "weapon_slot", weapon_slot, "dot_type", dot_type)
			end

			local event_name = "enemy_kill"
			local dialogue_input = ScriptUnit.extension_input(killer_unit, "dialogue_system")

			dialogue_input:trigger_dialogue_event(event_name, event_data)
		end
	end
end

local function trigger_player_killing_blow_ai_buffs(ai_unit, killing_blow)
	local attacker_unit = killing_blow[DamageDataIndex.SOURCE_ATTACKER_UNIT] or killing_blow[DamageDataIndex.ATTACKER]

	if not Unit.alive(attacker_unit) or not Unit.alive(ai_unit) then
		return
	end

	local breed_attacker = Unit.get_data(attacker_unit, "breed")
	local breed_killed = Unit.get_data(ai_unit, "breed")

	Managers.state.event:trigger("on_killed", killing_blow, breed_killed, breed_attacker, attacker_unit, ai_unit)

	if not breed_attacker or not breed_attacker.is_player or not breed_killed then
		return
	end

	local side_manager = Managers.state.side

	if not side_manager:is_enemy(attacker_unit, ai_unit) then
		return
	end

	Managers.state.event:trigger("on_player_killed_enemy", killing_blow, breed_killed, ai_unit)

	local buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")

	if buff_extension then
		buff_extension:trigger_procs("on_kill", killing_blow, breed_killed, ai_unit)
	end

	if (breed_killed.special or breed_killed.elite) and buff_extension then
		buff_extension:trigger_procs("on_kill_elite_special", killing_blow, breed_killed, ai_unit)
	end

	local side = side_manager.side_by_unit[ai_unit]

	if breed_killed.elite then
		local player_and_bot_units = side.ENEMY_PLAYER_AND_BOT_UNITS

		for i = 1, #player_and_bot_units do
			local unit = player_and_bot_units[i]
			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

			if buff_extension then
				buff_extension:trigger_procs("on_elite_killed", killing_blow, breed_killed, ai_unit)
			end
		end
	end

	if breed_killed.boss then
		local player_and_bot_units = side.ENEMY_PLAYER_AND_BOT_UNITS

		for i = 1, #player_and_bot_units do
			local unit = player_and_bot_units[i]
			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

			if buff_extension then
				buff_extension:trigger_procs("on_boss_killed", killing_blow, breed_killed)
			end
		end
	end

	if breed_killed.special then
		local player_and_bot_units = side.ENEMY_PLAYER_AND_BOT_UNITS

		for i = 1, #player_and_bot_units do
			local unit = player_and_bot_units[i]
			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

			if buff_extension then
				buff_extension:trigger_procs("on_special_killed", killing_blow, breed_killed, ai_unit)
			end
		end
	end

	local ping_extension = ScriptUnit.has_extension(ai_unit, "ping_system")

	if ping_extension then
		local player_and_bot_units = side.ENEMY_PLAYER_AND_BOT_UNITS

		for i = 1, #player_and_bot_units do
			local unit = player_and_bot_units[i]
			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

			if buff_extension then
				buff_extension:trigger_procs("on_ping_target_killed", killing_blow, breed_killed)
			end
		end
	end
end

local function kill_minotaur_under_oak_challenge(player, unit)
	local is_server = Managers.player.is_server

	if is_server then
		local level_key = Managers.state.game_mode:level_key()
		local current_level_name = LevelSettings[level_key].display_name
		local oak_level = LevelSettings.farmlands.display_name
		local oak_weave_level = "dlc_scorpion_field"

		if current_level_name ~= oak_level and current_level_name ~= oak_weave_level then
			return
		end

		local minotaur_position = POSITION_LOOKUP[unit]
		local oak_position = Vector3(18.843, -117.7, 5.5)
		local distance_between = Vector3.distance(oak_position, minotaur_position)
		local reasonable_distance = 35

		if distance_between < reasonable_distance then
			local stat_name = "scorpion_kill_minotaur_farmlands_oak"
			local statistics_db = Managers.player:statistics_db()

			statistics_db:increment_stat_and_sync_to_clients(stat_name)
		end
	end
end

local function ungor_archer_kill_minotaur_challenge(attacker)
	local hit_unit_blackboard = BLACKBOARDS[attacker]

	if hit_unit_blackboard then
		local breed_name = hit_unit_blackboard.breed and hit_unit_blackboard.breed.name

		if breed_name ~= "beastmen_ungor_archer" then
			return
		end

		local stat_name = "scorpion_kill_archers_kill_minotaur"
		local stat_name_index = NetworkLookup.statistics[stat_name]
		local statistics_db = Managers.player:statistics_db()

		statistics_db:increment_stat_and_sync_to_clients("scorpion_kill_archers_kill_minotaur")
	end
end

local function gors_killed_by_warpfire_challenge()
	local statistics_db = Managers.player:statistics_db()

	statistics_db:increment_local_stat("warpfire_killed_gors")

	local num_killed_gors = statistics_db:get_local_stat("warpfire_killed_gors")

	if QuestSettings.num_gors_killed_by_warpfire <= num_killed_gors then
		statistics_db:set_local_stat("warpfire_killed_gors", 0)
		statistics_db:increment_stat_and_sync_to_clients("scorpion_slay_gors_warpfire_damage")
	end
end

local pickup_params = {}
DeathReactions.templates = {
	ai_default = {
		unit = {
			pre_start = function (unit, context, t, killing_blow)
				ai_default_unit_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_unit_start(unit, context, t, killing_blow, is_server)

				trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
				trigger_player_killing_blow_ai_buffs(unit, killing_blow)
				Managers.state.entity:system("play_go_tutorial_system"):register_killing_blow(killing_blow[DamageDataIndex.DAMAGE_TYPE], killing_blow[DamageDataIndex.ATTACKER])

				if unit ~= killing_blow[DamageDataIndex.ATTACKER] and ScriptUnit.has_extension(unit, "ai_system") then
					ScriptUnit.extension(unit, "ai_system"):attacked(killing_blow[DamageDataIndex.ATTACKER], t, killing_blow)
				end

				local attacker_unit = killing_blow[DamageDataIndex.ATTACKER]

				Managers.state.game_mode:ai_hit_by_player(unit, attacker_unit, killing_blow)

				return data, result
			end,
			update = function (unit, dt, context, t, data)
				local result = ai_default_unit_update(unit, dt, context, t, data)

				return result
			end
		},
		husk = {
			pre_start = function (unit, context, t, killing_blow)
				ai_default_husk_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_husk_start(unit, context, t, killing_blow, is_server)

				if not is_hot_join_sync(killing_blow) then
					trigger_player_killing_blow_ai_buffs(unit, killing_blow)
				end

				Managers.state.unit_spawner:freeze_unit_extensions(unit, t, data)

				local attacker_unit = killing_blow[DamageDataIndex.ATTACKER]

				Managers.state.game_mode:ai_hit_by_player(unit, attacker_unit, killing_blow)

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
			pre_start = function (unit, context, t, killing_blow)
				ai_default_unit_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_chaos_tentacle_start(unit, context, t, killing_blow, is_server)

				trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
				trigger_player_killing_blow_ai_buffs(unit, killing_blow)

				return data, result
			end,
			update = function (unit, dt, context, t, data)
				local result = ai_chaos_tentacle_update(unit, dt, context, t, data)

				return result
			end
		},
		husk = {
			pre_start = function (unit, context, t, killing_blow)
				ai_default_husk_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_chaos_tentacle_husk_start(unit, context, t, killing_blow, is_server)

				if not is_hot_join_sync(killing_blow) then
					trigger_player_killing_blow_ai_buffs(unit, killing_blow)
				end

				Managers.state.unit_spawner:freeze_unit_extensions(unit, t, data)

				return data, result
			end,
			update = function (unit, dt, context, t, data)
				return DeathReactions.IS_DONE
			end
		}
	},
	chaos_tentacle_portal = {
		unit = {
			pre_start = function (unit, context, t, killing_blow)
				return
			end,
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
			pre_start = function (unit, context, t, killing_blow)
				return
			end,
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
			pre_start = function (unit, context, t, killing_blow)
				ai_default_unit_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_unit_start(unit, context, t, killing_blow, is_server)

				trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
				trigger_player_killing_blow_ai_buffs(unit, killing_blow)

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
			pre_start = function (unit, context, t, killing_blow)
				ai_default_husk_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_husk_start(unit, context, t, killing_blow, is_server)

				if not is_hot_join_sync(killing_blow) then
					trigger_player_killing_blow_ai_buffs(unit, killing_blow)
				end

				Managers.state.unit_spawner:freeze_unit_extensions(unit, t, data)

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
			pre_start = function (unit, context, t, killing_blow)
				ai_default_unit_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_unit_start(unit, context, t, killing_blow, is_server)
				data.despawn_after_time = t + 2

				trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
				trigger_player_killing_blow_ai_buffs(unit, killing_blow)

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
			pre_start = function (unit, context, t, killing_blow)
				ai_default_husk_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_husk_start(unit, context, t, killing_blow, is_server)

				if not is_hot_join_sync(killing_blow) then
					trigger_player_killing_blow_ai_buffs(unit, killing_blow)
				end

				Managers.state.unit_spawner:freeze_unit_extensions(unit, t, data)

				return nil, DeathReactions.IS_DONE
			end,
			update = function (unit, dt, context, t, data)
				return DeathReactions.IS_DONE
			end
		}
	},
	poison_globadier = {
		unit = {
			pre_start = function (unit, context, t, killing_blow)
				ai_default_unit_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local blackboard = BLACKBOARDS[unit]

				play_unit_audio(unit, blackboard, "Stop_enemy_foley_globadier_boiling_loop")

				if unit ~= killing_blow[DamageDataIndex.ATTACKER] and ScriptUnit.has_extension(unit, "ai_system") then
					ScriptUnit.extension(unit, "ai_system"):attacked(killing_blow[DamageDataIndex.ATTACKER], t, killing_blow)
				end

				if blackboard.suicide_run ~= nil and blackboard.suicide_run.explosion_started then
					local action = blackboard.suicide_run.action

					AiUtils.poison_explode_unit(unit, action, blackboard)
					ai_default_unit_start(unit, context, t, killing_blow, is_server)

					local sound_name = "Play_enemy_combat_globadier_suicide_explosion"

					play_unit_audio(unit, blackboard, sound_name)
					trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
					trigger_player_killing_blow_ai_buffs(unit, killing_blow)

					return nil, DeathReactions.IS_DONE
				else
					local data, result = ai_default_unit_start(unit, context, t, killing_blow, is_server)
					data.blackboard = blackboard

					trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
					trigger_player_killing_blow_ai_buffs(unit, killing_blow)

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
			pre_start = function (unit, context, t, killing_blow)
				ai_default_husk_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_husk_start(unit, context, t, killing_blow)

				if not is_hot_join_sync(killing_blow) then
					trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
					trigger_player_killing_blow_ai_buffs(unit, killing_blow)
				end

				Managers.state.unit_spawner:freeze_unit_extensions(unit, t, data)

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
			pre_start = function (unit, context, t, killing_blow)
				ai_default_unit_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local blackboard = BLACKBOARDS[unit]

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
			pre_start = function (unit, context, t, killing_blow)
				ai_default_husk_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_husk_start(unit, context, t, killing_blow)

				Managers.state.unit_spawner:freeze_unit_extensions(unit, t, data)

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
			pre_start = function (unit, context, t, killing_blow)
				ai_default_unit_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local blackboard = BLACKBOARDS[unit]

				if unit ~= killing_blow[DamageDataIndex.ATTACKER] and ScriptUnit.has_extension(unit, "ai_system") then
					ScriptUnit.extension(unit, "ai_system"):attacked(killing_blow[DamageDataIndex.ATTACKER], t, killing_blow)
				end

				local data, result = ai_default_unit_start(unit, context, t, killing_blow, is_server)

				trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
				trigger_player_killing_blow_ai_buffs(unit, killing_blow)
				WwiseUtils.trigger_unit_event(Managers.world:world("level_world"), "Stop_enemy_vo_warpfire", unit, Unit.node(unit, "a_voice"))

				if killing_blow[DamageDataIndex.HIT_ZONE] == "aux" then
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
			pre_start = function (unit, context, t, killing_blow)
				ai_default_husk_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_husk_start(unit, context, t, killing_blow)
				local death_hit_zone = killing_blow[DamageDataIndex.HIT_ZONE]

				if death_hit_zone == "aux" then
					Unit.flow_event(unit, "lua_hide_backpack")

					local death_extension = ScriptUnit.extension(unit, "death_system")
					death_extension.actor_to_disable_on_death = "j_backpack"
				end

				if not is_hot_join_sync(killing_blow) then
					trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
					trigger_player_killing_blow_ai_buffs(unit, killing_blow)
				end

				WwiseUtils.trigger_unit_event(Managers.world:world("level_world"), "Stop_enemy_vo_warpfire", unit, Unit.node(unit, "a_voice"))
				Managers.state.unit_spawner:freeze_unit_extensions(unit, t, data)

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
			pre_start = function (unit, context, t, killing_blow)
				ai_default_unit_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_unit_start(unit, context, t, killing_blow, is_server)

				trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
				trigger_player_killing_blow_ai_buffs(unit, killing_blow)

				local amount_of_loot_drops = math.random(2, 4)

				for i = 1, amount_of_loot_drops do
					local spawn_value = math.random()
					local game_mode_manager = Managers.state.game_mode
					local game_mode = game_mode_manager:game_mode_key()
					local pickups = LootRatPickups[game_mode] or LootRatPickups.default
					local spawn_weighting_total = 0

					for pickup_name, spawn_weighting in pairs(pickups) do
						table.clear(pickup_params)

						if pickup_name == "boss_loot" then
							pickup_name = game_mode_manager:get_boss_loot_pickup()
						end

						local dice_keeper = context.dice_keeper
						local pickup_settings = AllPickups[pickup_name]
						local can_spawn_func = pickup_settings and pickup_settings.can_spawn_func
						local can_spawn_pickup_type = pickup_settings ~= nil
						pickup_params.dice_keeper = dice_keeper

						if can_spawn_func and not can_spawn_func(pickup_params) then
							can_spawn_pickup_type = false
						end

						spawn_weighting_total = spawn_weighting_total + spawn_weighting

						if spawn_value <= spawn_weighting_total and can_spawn_pickup_type then
							local breed = Unit.get_data(unit, "breed")
							local breed_name = breed and breed.name
							local extension_init_data = {
								pickup_system = {
									has_physics = true,
									spawn_type = "loot",
									pickup_name = pickup_name,
									dropped_by_breed = breed_name
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
			pre_start = function (unit, context, t, killing_blow)
				ai_default_husk_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_husk_start(unit, context, t, killing_blow, is_server)

				if not is_hot_join_sync(killing_blow) then
					trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
					trigger_player_killing_blow_ai_buffs(unit, killing_blow)
				end

				Managers.state.unit_spawner:freeze_unit_extensions(unit, t, data)

				return data, result
			end,
			update = function (unit, dt, context, t, data)
				local result = ai_default_husk_update(unit, dt, context, t, data)

				return result
			end
		}
	},
	explosive_loot_rat = {
		unit = {
			pre_start = function (unit, context, t, killing_blow)
				ai_default_unit_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_unit_start(unit, context, t, killing_blow, is_server)

				trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
				trigger_player_killing_blow_ai_buffs(unit, killing_blow)
				AiUtils.loot_rat_explosion(unit, unit, BLACKBOARDS[unit], nil, ExplosionTemplates.loot_rat_explosion)

				if unit ~= killing_blow[DamageDataIndex.ATTACKER] and ScriptUnit.has_extension(unit, "ai_system") then
					ScriptUnit.extension(unit, "ai_system"):attacked(killing_blow[DamageDataIndex.ATTACKER], t, killing_blow)
				end

				local chance_to_spawn_ammmo = 0.2

				if math.random() <= chance_to_spawn_ammmo then
					local pickup_name = "all_ammo_small"
					local pickup_settings = AllPickups[pickup_name]
					local extension_init_data = {
						pickup_system = {
							has_physics = false,
							spawn_type = "loot",
							pickup_name = pickup_name
						}
					}
					local unit_name = pickup_settings.unit_name
					local unit_template_name = pickup_settings.unit_template_name or "pickup_unit"
					local position = POSITION_LOOKUP[unit]
					local rotation = Quaternion.identity()

					Managers.state.unit_spawner:spawn_network_unit(unit_name, unit_template_name, extension_init_data, position, rotation)
				end

				return data, result
			end,
			update = function (unit, dt, context, t, data)
				if BLACKBOARDS[unit].delete_at_t < t and not data.marked_for_deletion then
					Managers.state.unit_spawner:mark_for_deletion(unit)

					data.marked_for_deletion = true
				end

				local result = ai_default_unit_update(unit, dt, context, t, data)

				return result
			end
		},
		husk = {
			pre_start = function (unit, context, t, killing_blow)
				ai_default_husk_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local data, result = ai_default_husk_start(unit, context, t, killing_blow, is_server)

				if not is_hot_join_sync(killing_blow) then
					trigger_unit_dialogue_death_event(unit, killing_blow[DamageDataIndex.ATTACKER], killing_blow[DamageDataIndex.HIT_ZONE], killing_blow[DamageDataIndex.DAMAGE_TYPE])
					trigger_player_killing_blow_ai_buffs(unit, killing_blow)
				end

				Managers.state.unit_spawner:freeze_unit_extensions(unit, t, data)

				return data, result
			end,
			update = function (unit, dt, context, t, data)
				local result = ai_default_husk_update(unit, dt, context, t, data)

				return result
			end
		}
	},
	critter_nurgling = {
		unit = {
			pre_start = function (unit, context, t, killing_blow)
				ai_default_unit_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				Managers.state.event:trigger("nurgling_killed")

				return DeathReactions.templates.ai_default.unit.start(unit, context, t, killing_blow, is_server)
			end,
			update = function (unit, dt, context, t, data)
				return ai_default_unit_update(unit, dt, context, t, data)
			end
		},
		husk = {
			pre_start = function (unit, context, t, killing_blow)
				ai_default_husk_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				return DeathReactions.templates.ai_default.husk.start(unit, context, t, killing_blow, is_server)
			end,
			update = function (unit, dt, context, t, data)
				return ai_default_husk_update(unit, dt, context, t, data)
			end
		}
	},
	player = {
		unit = {
			pre_start = function (unit, context, t, killing_blow)
				local player = Managers.player:owner(unit)
				local damage_type = killing_blow[DamageDataIndex.DAMAGE_TYPE]
				local damage_source = killing_blow[DamageDataIndex.DAMAGE_SOURCE_NAME]
				local position = POSITION_LOOKUP[unit]

				Managers.telemetry.events:player_died(player, damage_type, damage_source, position)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				trigger_player_killing_blow_ai_buffs(unit, killing_blow, true)
				StatisticsUtil.register_kill(unit, killing_blow, context.statistics_db, true)
				Unit.flow_event(unit, "lua_on_death")

				return nil, DeathReactions.IS_DONE
			end
		},
		husk = {
			pre_start = function (unit, context, t, killing_blow)
				local player = Managers.player:owner(unit)
				local damage_type = killing_blow[DamageDataIndex.DAMAGE_TYPE]
				local damage_source = killing_blow[DamageDataIndex.DAMAGE_SOURCE_NAME]
				local position = POSITION_LOOKUP[unit]

				Managers.telemetry.events:player_died(player, damage_type, damage_source, position)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				if not is_hot_join_sync(killing_blow) then
					trigger_player_killing_blow_ai_buffs(unit, killing_blow, true)
					StatisticsUtil.register_kill(unit, killing_blow, context.statistics_db)
					Unit.flow_event(unit, "lua_on_death")

					if ScriptUnit.has_extension(unit, "dialogue_system") then
						SurroundingAwareSystem.add_event(unit, "player_death", DialogueSettings.death_discover_distance, "target", unit, "target_name", ScriptUnit.extension(unit, "dialogue_system").context.player_profile)
					end
				end

				return nil, DeathReactions.IS_DONE
			end
		}
	},
	level_object = {
		unit = {
			pre_start = function (unit, context, t, killing_blow)
				return
			end,
			start = function (unit, context, t, killing_blow, is_server)
				Managers.state.game_mode:level_object_killed(unit, killing_blow)
				Unit.set_flow_variable(unit, "current_health", 0)
				Unit.flow_event(unit, "lua_on_death")
			end,
			update = function (unit, dt, context, t, data)
				return
			end
		},
		husk = {
			pre_start = function (unit, context, t, killing_blow)
				return
			end,
			start = function (unit, context, t, killing_blow, is_server)
				Managers.state.game_mode:level_object_killed(unit, killing_blow)
				Unit.flow_event(unit, "lua_on_death")
			end,
			update = function (unit, dt, context, t, data)
				return
			end
		}
	},
	standard = {
		unit = {
			pre_start = function (unit, context, t, killing_blow)
				return
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local data = {
					despawn_after_time = t + 8
				}
				local standard_extension = ScriptUnit.has_extension(unit, "ai_supplementary_system")

				standard_extension:on_death(killing_blow[DamageDataIndex.ATTACKER])

				local projectile_linker_system = Managers.state.entity:system("projectile_linker_system")

				projectile_linker_system:clear_linked_projectiles(unit)

				return data, DeathReactions.IS_NOT_DONE
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
			pre_start = function (unit, context, t, killing_blow)
				return
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local standard_extension = ScriptUnit.has_extension(unit, "ai_supplementary_system")

				standard_extension:on_death(killing_blow[DamageDataIndex.ATTACKER])

				return nil, DeathReactions.IS_DONE
			end,
			update = function (unit, dt, context, t, data)
				return
			end
		}
	},
	despawn = {
		unit = {
			pre_start = function (unit, context, t, killing_blow)
				return
			end,
			start = function (unit, context, t, killing_blow, is_server, death_extension)
				local data = {
					despawn_after_time = death_extension.extension_init_data.despawn_after_time or 0,
					play_effect = death_extension.extension_init_data.play_effect
				}
				local projectile_linker_system = Managers.state.entity:system("projectile_linker_system")

				projectile_linker_system:clear_linked_projectiles(unit)

				return data, DeathReactions.IS_NOT_DONE
			end,
			update = function (unit, dt, context, t, data)
				if data.despawn_after_time < t then
					local blackboard = BLACKBOARDS[unit]

					Managers.state.conflict:destroy_unit(unit, blackboard, "death_reaction_despawn")

					if data.play_effect then
						local effect_pos = POSITION_LOOKUP[unit]
						local effect_name_id = NetworkLookup.effects[data.play_effect]
						local node_id = 0
						local rotation_offset = Quaternion.identity()
						local network_manager = Managers.state.network

						network_manager:rpc_play_particle_effect(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, effect_pos, rotation_offset, false)
					end

					return DeathReactions.IS_DONE
				end

				return DeathReactions.IS_NOT_DONE
			end
		},
		husk = {
			pre_start = function (unit, context, t, killing_blow)
				return
			end,
			start = function (unit, context, t, killing_blow, is_server)
				return nil, DeathReactions.IS_DONE
			end,
			update = function (unit, dt, context, t, data)
				return
			end
		}
	},
	killable_projectile = {
		unit = {
			pre_start = function (unit, context, t, killing_blow)
				return
			end,
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
			pre_start = function (unit, context, t, killing_blow)
				return
			end,
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
			pre_start = function (unit, context, t, killing_blow)
				return
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local network_time = Managers.state.network:network_time()
				local explode_time = network_time
				local attacker_unit = killing_blow[DamageDataIndex.ATTACKER]
				local data = {
					explode_time = explode_time,
					killer_unit = attacker_unit
				}
				local health_extension = ScriptUnit.has_extension(unit, "health_system")
				local damage_data = health_extension.last_damage_data
				local attacker_unique_id = damage_data.attacker_unique_id
				local attacker_player = Managers.player:player_from_unique_id(attacker_unique_id)
				local stats_id = attacker_player and attacker_player:stats_id()

				Managers.state.achievement:trigger_event("explosive_barrel_destroyed", stats_id, unit, killing_blow)

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

							Managers.state.entity:system("area_damage_system"):create_explosion(owner_unit, position, rotation, explosion_template, 1, item_name, nil, false)

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
						local last_damage_data = health_extension.last_damage_data
						local network_manager = Managers.state.network
						local last_attacker_unit = network_manager:game_object_or_level_unit(last_damage_data.attacker_unit_id, false) or unit

						Managers.state.entity:system("area_damage_system"):create_explosion(last_attacker_unit, position, rotation, explosion_template, 1, item_name, nil, false)

						if last_attacker_unit then
							local buff_extension = ScriptUnit.has_extension(last_attacker_unit, "buff_system")

							if buff_extension then
								buff_extension:trigger_procs("on_barrel_exploded", position, rotation, item_name)
							end
						end
					end

					data.exploded = true
				elseif network_time >= data.explode_time + 0.5 then
					Managers.state.unit_spawner:mark_for_deletion(unit)

					return DeathReactions.IS_DONE
				end
			end
		},
		husk = {
			pre_start = function (unit, context, t, killing_blow)
				return
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local network_time = Managers.state.network:network_time()
				local explode_time = network_time
				local data = {
					explode_time = explode_time,
					killer_unit = killing_blow[DamageDataIndex.ATTACKER]
				}
				local health_extension = ScriptUnit.has_extension(unit, "health_system")
				local damage_data = health_extension.last_damage_data
				local attacker_unique_id = damage_data.attacker_unique_id
				local attacker_player = Managers.player:player_from_unique_id(attacker_unique_id)
				local stats_id = attacker_player and attacker_player:stats_id()

				Managers.state.achievement:trigger_event("explosive_barrel_destroyed", stats_id, unit, killing_blow)

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

						Managers.state.entity:system("area_damage_system"):create_explosion(owner_unit, position, rotation, explosion_template, 1, item_name, nil, false)

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
			pre_start = function (unit, context, t, killing_blow)
				return
			end,
			start = function (unit, context, t, killing_blow, is_server, death_extension)
				local network_time = Managers.state.network:network_time()
				local die_callback = death_extension.extension_init_data.die_callback

				if die_callback then
					die_callback()
				end

				local shrink_and_despawn_time = death_extension.extension_init_data.shrink_and_despawn_time
				local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

				if buff_extension then
					local buff = buff_extension:get_buff_type("bubonic_blob_buff")

					buff_extension:remove_buff(buff.id)
				end

				local data = {
					start_time = network_time,
					shrink_and_despawn_time = shrink_and_despawn_time
				}

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
					if not data.destroyed then
						local num_actors = Unit.num_actors(unit)

						for i = 0, num_actors - 1 do
							Unit.destroy_actor(unit, i)
						end

						local projectile_linker_system = Managers.state.entity:system("projectile_linker_system")

						projectile_linker_system:clear_linked_projectiles(unit)

						local position = Unit.local_position(unit, 0)
						local nav_world = Managers.state.entity:system("ai_system"):nav_world()
						local position_on_navmesh = LocomotionUtils.get_close_pos_below_on_mesh(nav_world, position, 4, 1, 30)

						if not position_on_navmesh then
							local template_name = "nurgle_liquid"
							local template = LiquidAreaDamageTemplates.templates[template_name]
							local hit_player_func = template.hit_player_function
							local sides = Managers.state.side:sides()

							for k = 1, #sides do
								local side = sides[k]
								local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
								local num_player_units = #player_and_bot_units

								for i = 1, num_player_units do
									local player_unit = player_and_bot_units[i]

									hit_player_func(player_unit, player_and_bot_units)
								end
							end

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
						if data.shrink_and_despawn_time then
							local scale_unit_extension = ScriptUnit.has_extension(unit, "props_system")
							local shrinking_state = data.shrinking_state

							if not shrinking_state then
								data.shrinking_state = "waiting"
							elseif shrinking_state == "waiting" then
								if network_time >= start_time + data.shrink_and_despawn_time then
									scale_unit_extension:setup(1, 0, 0.5)

									data.shrinking_state = "shrinking"
								end
							elseif shrinking_state == "shrinking" and scale_unit_extension:scaling_complete() then
								Managers.state.unit_spawner:mark_for_deletion(unit)

								result = DeathReactions.IS_DONE
							end
						else
							result = DeathReactions.IS_DONE
						end
					end

					return result
				end
			end
		},
		husk = {
			pre_start = function (unit, context, t, killing_blow)
				return
			end,
			start = function (unit, context, t, killing_blow, is_server, death_extension)
				local network_time = Managers.state.network:network_time()
				local shrink_and_despawn_time = death_extension.extension_init_data.shrink_and_despawn_time
				local data = {
					start_time = network_time,
					shrink_and_despawn_time = shrink_and_despawn_time
				}
				local death_extension = ScriptUnit.extension(unit, "death_system")
				death_extension.death_has_started = true
				local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

				if buff_extension then
					local buff = buff_extension:get_buff_type("bubonic_blob_buff")

					buff_extension:remove_buff(buff.id)
				end

				return data, DeathReactions.IS_NOT_DONE
			end,
			update = function (unit, dt, context, t, data)
				local network_time = Managers.state.network:network_time()
				local start_time = data.start_time
				local result = DeathReactions.IS_NOT_DONE

				if not data.destroyed then
					local num_actors = Unit.num_actors(unit)

					for i = 0, num_actors - 1 do
						Unit.destroy_actor(unit, i)
					end

					local projectile_linker_system = Managers.state.entity:system("projectile_linker_system")

					projectile_linker_system:clear_linked_projectiles(unit)

					data.destroyed = true
				elseif data.destroyed and network_time >= start_time + 0.5 then
					if data.shrink_and_despawn_time then
						local scale_unit_extension = ScriptUnit.has_extension(unit, "props_system")
						local shrinking_state = data.shrinking_state

						if not shrinking_state then
							data.shrinking_state = "waiting"
						elseif shrinking_state == "waiting" then
							if network_time >= start_time + data.shrink_and_despawn_time then
								scale_unit_extension:setup(1, 0, 0.5)

								data.shrinking_state = "shrinking"
							end
						elseif shrinking_state == "shrinking" and scale_unit_extension:scaling_complete() then
							result = DeathReactions.IS_DONE
						end
					else
						result = DeathReactions.IS_DONE
					end
				end

				return result
			end
		}
	},
	lamp_oil = {
		unit = {
			pre_start = function (unit, context, t, killing_blow)
				return
			end,
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
					local health_extension = ScriptUnit.extension(unit, "health_system")
					local last_damage_data = health_extension.last_damage_data
					local network_manager = Managers.state.network
					local last_attacker_unit = network_manager:game_object_or_level_unit(last_damage_data.attacker_unit_id, false) or unit

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
								source_unit = last_attacker_unit
							}
						}
						local aoe_unit_name = "units/hub_elements/empty"
						local liquid_aoe_unit = Managers.state.unit_spawner:spawn_network_unit(aoe_unit_name, "liquid_aoe_unit", extension_init_data, position_on_navmesh)
						local liquid_area_damage_extension = ScriptUnit.extension(liquid_aoe_unit, "area_damage_system")

						liquid_area_damage_extension:ready()
					end

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
			pre_start = function (unit, context, t, killing_blow)
				return
			end,
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
							local last_damage_data = health_extension.last_damage_data
							local last_attacker_unit_id = last_damage_data.attacker_unit_id or NetworkConstants.invalid_game_object_id

							network_manager.network_transmit:send_rpc_server("rpc_create_liquid_damage_area", last_attacker_unit_id, position_on_navmesh, direction, liquid_template_id)
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
			pre_start = function (unit, context, t, killing_blow)
				return
			end,
			start = function (unit, context, t, killing_blow, is_server)
				Managers.state.unit_spawner:mark_for_deletion(unit)

				return nil, DeathReactions.IS_DONE
			end
		},
		husk = {
			pre_start = function (unit, context, t, killing_blow)
				return
			end,
			start = function (unit, context, t, killing_blow, is_server)
				return nil, DeathReactions.IS_DONE
			end
		}
	},
	minotaur = {
		unit = {
			pre_start = function (unit, context, t, killing_blow)
				ai_default_unit_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local attacker = killing_blow[DamageDataIndex.ATTACKER]
				local player = Managers.player:unit_owner(attacker)

				if player then
					kill_minotaur_under_oak_challenge(player, unit)
				end

				ungor_archer_kill_minotaur_challenge(attacker)

				return DeathReactions.templates.ai_default.unit.start(unit, context, t, killing_blow, is_server)
			end,
			update = function (unit, dt, context, t, data)
				local result = ai_default_unit_update(unit, dt, context, t, data)

				return result
			end
		},
		husk = {
			pre_start = function (unit, context, t, killing_blow)
				ai_default_husk_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				return DeathReactions.templates.ai_default.husk.start(unit, context, t, killing_blow, is_server)
			end,
			update = function (unit, dt, context, t, data)
				local result = ai_default_husk_update(unit, dt, context, t, data)

				return result
			end
		}
	},
	gor = {
		unit = {
			pre_start = function (unit, context, t, killing_blow)
				ai_default_unit_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local damage_type = killing_blow[DamageDataIndex.DAMAGE_TYPE]

				if damage_type == "warpfire" or damage_type == "warpfire_ground" then
					gors_killed_by_warpfire_challenge()
				end

				return DeathReactions.templates.ai_default.unit.start(unit, context, t, killing_blow, is_server)
			end,
			update = function (unit, dt, context, t, data)
				local result = ai_default_unit_update(unit, dt, context, t, data)

				return result
			end
		},
		husk = {
			pre_start = function (unit, context, t, killing_blow)
				ai_default_husk_pre_start(unit, context, t, killing_blow)
			end,
			start = function (unit, context, t, killing_blow, is_server)
				return DeathReactions.templates.ai_default.husk.start(unit, context, t, killing_blow, is_server)
			end,
			update = function (unit, dt, context, t, data)
				local result = ai_default_husk_update(unit, dt, context, t, data)

				return result
			end
		}
	}
}
DeathReactions.templates.shadow_skull = table.clone(DeathReactions.templates.ai_default)

DeathReactions.templates.shadow_skull.unit.start = function (unit, context, t, killing_blow, is_server)
	local data, result = DeathReactions.templates.ai_default.unit.start(unit, context, t, killing_blow, is_server)
	local projectile_extension = ScriptUnit.extension(unit, "projectile_system")

	projectile_extension:destroy()

	local projectile_locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")

	projectile_locomotion_extension:destroy()

	return data, result
end

DeathReactions.templates.shadow_skull.husk.start = function (unit, context, t, killing_blow, is_server)
	local data, result = DeathReactions.templates.ai_default.husk.start(unit, context, t, killing_blow, is_server)
	local projectile_extension = ScriptUnit.extension(unit, "projectile_system")

	projectile_extension:destroy()

	local projectile_locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")

	projectile_locomotion_extension:destroy()

	if is_hot_join_sync(killing_blow) then
		Unit.flow_event(unit, "lua_on_death")
	end

	return data, result
end

DLCUtils.map_list("death_reactions", function (file)
	return table.merge(DeathReactions.templates, require(file))
end)

DeathReactions.get_reaction = function (death_reaction_template, is_husk)
	local templates = DeathReactions.templates
	local husk_key = is_husk and "husk" or "unit"
	local reaction = templates[death_reaction_template][husk_key]

	fassert(reaction, "Death reaction for template %q and husk key %q does not exist", death_reaction_template, husk_key)

	return reaction
end

DeathReactions._add_ai_killed_by_player_telemetry = function (victim_unit, breed_name, player_unit, player, damage_type, weapon_name, death_hit_zone)
	local network_manager = Managers.state.network
	local is_server = network_manager.is_server
	local player_position = POSITION_LOOKUP[player_unit]
	local victim_position = POSITION_LOOKUP[victim_unit]

	Managers.telemetry.events:player_killed_ai(player, player_position, victim_position, breed_name, weapon_name, damage_type, death_hit_zone)
end
