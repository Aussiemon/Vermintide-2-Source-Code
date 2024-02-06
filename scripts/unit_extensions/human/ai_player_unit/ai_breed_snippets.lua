-- chunkname: @scripts/unit_extensions/human/ai_player_unit/ai_breed_snippets.lua

local unit_get_data = Unit.get_data
local script_data = script_data

AiBreedSnippets = AiBreedSnippets or {}

local vector3_distance = Vector3.distance

local function set_initial_aggro(unit, blackboard)
	local side = Managers.state.side.side_by_unit[unit]
	local enemy_player_and_bot_units = side.ENEMY_PLAYER_AND_BOT_UNITS
	local breed = blackboard.breed
	local weights = breed.perception_weights
	local best_score = 0
	local best_enemy

	for i = 1, #enemy_player_and_bot_units do
		local enemy_unit = enemy_player_and_bot_units[i]
		local enemy_pos = POSITION_LOOKUP[enemy_unit]
		local pos = POSITION_LOOKUP[unit]
		local dist = vector3_distance(pos, enemy_pos)

		if dist < breed.detection_radius then
			local inv_radius = math.clamp(1 - dist / weights.max_distance, 0, 1)
			local score = inv_radius * inv_radius * weights.distance_weight

			if best_score < score then
				best_score = score
				best_enemy = enemy_unit
			end
		end
	end

	if best_enemy then
		local aggro_list = blackboard.aggro_list

		aggro_list[best_enemy] = 50

		print("Boss gave ", best_enemy, "initial aggro")
	end
end

local function setup_start_angry(unit, blackboard, conflict_director)
	local breed = blackboard.breed
	local ai_simple = ScriptUnit.extension(unit, "ai_system")
	local behind_door = blackboard.optional_spawn_data.spawn_behind_door

	if behind_door then
		ai_simple:set_perception(breed.perception, breed.target_selection)

		local main_paths = conflict_director.main_path_info.main_paths
		local _, travel_dist = MainPathUtils.closest_pos_at_main_path(main_paths, POSITION_LOOKUP[unit])

		blackboard.waiting = {
			awake_on_players_passing = true,
			next_player_unit_index = 1,
			next_update_time = 0,
			view_cone_dot = 1,
			travel_dist = travel_dist,
		}
	else
		ai_simple:set_perception(breed.perception, breed.target_selection_angry)
		conflict_director:add_angry_boss(1, blackboard)

		blackboard.is_angry = true

		set_initial_aggro(unit, blackboard)
	end
end

AiBreedSnippets.on_rat_ogre_spawn = function (unit, blackboard)
	local breed = blackboard.breed

	blackboard.cycle_rage_anim_index = 0
	blackboard.aggro_list = {}
	blackboard.fling_skaven_timer = 0
	blackboard.next_move_check = 0
	blackboard.is_valid_target_func = GenericStatusExtension.is_ogre_target

	local conflict_director = Managers.state.conflict

	setup_start_angry(unit, blackboard, conflict_director)
	conflict_director:freeze_intensity_decay(10)
	conflict_director:add_unit_to_bosses(unit)
end

AiBreedSnippets.on_rat_ogre_death = function (unit, blackboard)
	local conflict_director = Managers.state.conflict

	conflict_director:freeze_intensity_decay(1)
	conflict_director:remove_unit_from_bosses(unit)
	print("rat ogre died!")

	if blackboard.is_angry then
		conflict_director:add_angry_boss(-1)
	end

	AiBreedSnippets.reward_boss_kill_loot(unit, blackboard)
end

AiBreedSnippets.on_rat_ogre_despawn = function (unit, blackboard)
	local conflict_director = Managers.state.conflict

	conflict_director:freeze_intensity_decay(1)
	conflict_director:remove_unit_from_bosses(unit)
	print("rat ogre was despawned!")

	if blackboard.is_angry then
		conflict_director:add_angry_boss(-1)
	end

	if not blackboard.rewarded_boss_loot then
		AiBreedSnippets.reward_boss_kill_loot(unit, blackboard)
	end
end

local function stop_stormfiend_firewall_ambience(unit, blackboard)
	local audio_system = Managers.state.entity:system("audio_system")

	audio_system:play_2d_audio_event("Stop_stormfiend_ambience")

	local action = BreedActions.skaven_stormfiend.shoot
	local sound_parameter = action.global_sound_parameter

	audio_system:set_global_parameter_with_lerp(sound_parameter, 0)

	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local parameter_id = NetworkLookup.global_parameter_names[sound_parameter]

	network_transmit:send_rpc_clients("rpc_client_audio_set_global_parameter_with_lerp", parameter_id, 0)

	local group_blackboard = blackboard.group_blackboard

	group_blackboard.firewall_environment_intensity = 0
end

AiBreedSnippets.on_stormfiend_spawn = function (unit, blackboard)
	blackboard.aggro_list = {}
	blackboard.fling_skaven_timer = 0
	blackboard.next_move_check = 0

	local conflict_director = Managers.state.conflict

	setup_start_angry(unit, blackboard, conflict_director)
	conflict_director:freeze_intensity_decay(10)
	conflict_director:add_unit_to_bosses(unit)

	local breed = blackboard.breed
	local breed_name = breed.name

	if conflict_director:count_units_by_breed(breed_name) == 0 then
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_2d_audio_event("Play_stormfiend_ambience")
	end
end

AiBreedSnippets.on_stormfiend_death = function (unit, blackboard)
	local conflict_director = Managers.state.conflict

	conflict_director:freeze_intensity_decay(1)
	conflict_director:remove_unit_from_bosses(unit)
	print("stormfiend died!")

	local breed = blackboard.breed
	local breed_name = breed.name

	if conflict_director:count_units_by_breed(breed_name) == 0 then
		stop_stormfiend_firewall_ambience(unit, blackboard)
	end

	if blackboard.is_angry then
		conflict_director:add_angry_boss(-1)
	end

	AiBreedSnippets.reward_boss_kill_loot(unit, blackboard)
end

AiBreedSnippets.on_stormfiend_despawn = function (unit, blackboard)
	local conflict_director = Managers.state.conflict

	conflict_director:freeze_intensity_decay(1)
	conflict_director:remove_unit_from_bosses(unit)

	local breed = blackboard.breed
	local breed_name = breed.name

	if conflict_director:count_units_by_breed(breed_name) == 0 then
		stop_stormfiend_firewall_ambience(unit, blackboard)
	end

	if blackboard.is_angry then
		conflict_director:add_angry_boss(-1)
	end

	if not blackboard.rewarded_boss_loot then
		AiBreedSnippets.reward_boss_kill_loot(unit, blackboard)
	end
end

AiBreedSnippets.on_stormfiend_demo_death = function (unit, blackboard)
	local conflict_director = Managers.state.conflict

	conflict_director:freeze_intensity_decay(1)
	conflict_director:remove_unit_from_bosses(unit)

	local breed = blackboard.breed
	local breed_name = breed.name

	if conflict_director:count_units_by_breed(breed_name) == 0 then
		stop_stormfiend_firewall_ambience(unit, blackboard)
	end

	if blackboard.is_angry then
		conflict_director:add_angry_boss(-1)
	end

	AiBreedSnippets.on_stormfiend_demo_shoot(unit, blackboard)
end

AiBreedSnippets.on_stormfiend_demo_despawn = function (unit, blackboard)
	local conflict_director = Managers.state.conflict

	conflict_director:freeze_intensity_decay(1)
	conflict_director:remove_unit_from_bosses(unit)

	local breed = blackboard.breed
	local breed_name = breed.name

	if conflict_director:count_units_by_breed(breed_name) == 0 then
		stop_stormfiend_firewall_ambience(unit, blackboard)
	end

	if blackboard.is_angry then
		conflict_director:add_angry_boss(-1)
	end

	AiBreedSnippets.on_stormfiend_demo_shoot(unit, blackboard)
end

AiBreedSnippets.on_stormfiend_demo_shoot = function (unit, blackboard)
	local world = blackboard.world

	LevelHelper:flow_event(world, "demo_fire_event")

	local player_unit = blackboard.target_unit
	local look_at_direction = POSITION_LOOKUP[unit] - POSITION_LOOKUP[player_unit]
	local rotation = Quaternion.look(look_at_direction, Vector3.up())
	local first_person_extension = ScriptUnit.extension(player_unit, "first_person_system")

	first_person_extension:disable_rig_movement()
	first_person_extension:force_look_rotation(rotation, 1)

	local time_manager = Managers.time

	time_manager:set_global_time_scale_lerp(0.1, 0.5)

	local inverted_value = 0.9
	local audio_system = Managers.state.entity:system("audio_system")

	audio_system:set_global_parameter_with_lerp("demo_slowmo", inverted_value)
end

AiBreedSnippets.on_loot_rat_update = function (unit, blackboard, t)
	local t = Managers.time:time("game")
	local cooldown_time = blackboard.dodge_cooldown_time

	if not cooldown_time or cooldown_time < t then
		local breed = blackboard.breed
		local dodge_vector, threat_vector = LocomotionUtils.in_crosshairs_dodge(unit, blackboard, t, breed.dodge_crosshair_radius, breed.dodge_crosshair_delay, breed.dodge_crosshair_min_distance, breed.dodge_crosshair_max_distance)

		if dodge_vector then
			blackboard.dodge_vector = Vector3Box(dodge_vector)
			blackboard.threat_vector = Vector3Box(threat_vector)
			blackboard.dodge_cooldown_time = t + blackboard.breed.dodge_cooldown
		end
	end
end

AiBreedSnippets.on_loot_rat_alerted = function (unit, blackboard, alerting_unit, enemy_unit)
	local t = Managers.time:time("game")
	local cooldown_time = blackboard.dodge_cooldown_time

	if not cooldown_time or cooldown_time < t then
		local breed = blackboard.breed
		local dodge_vector, threat_vector

		if unit == alerting_unit and blackboard.dodge_damage_points > 0 then
			dodge_vector, threat_vector = LocomotionUtils.on_alerted_dodge(unit, blackboard, alerting_unit, enemy_unit)

			if dodge_vector then
				dodge_vector = Vector3Box(dodge_vector)
				threat_vector = Vector3Box(threat_vector)
			end
		end

		if not blackboard.confirmed_player_sighting then
			blackboard.target_unit = enemy_unit
			blackboard.is_alerted = true
			blackboard.is_fleeing = true
			blackboard.is_passive = false
		end

		local ai_simple = ScriptUnit.extension(unit, "ai_system")

		ai_simple:set_perception(breed.perception, breed.target_selection_alerted)

		blackboard.dodge_vector = dodge_vector
		blackboard.threat_vector = threat_vector
		blackboard.dodge_cooldown_time = t + blackboard.breed.dodge_cooldown
	end
end

AiBreedSnippets.on_loot_rat_stagger_action_done = function (unit)
	if Unit.alive(unit) then
		local health_extension = ScriptUnit.extension(unit, "health_system")

		health_extension:regen_dodge_damage_points()
	end
end

AiBreedSnippets.on_chaos_troll_spawn = function (unit, blackboard)
	blackboard.aggro_list = {}
	blackboard.fling_skaven_timer = 0
	blackboard.can_get_downed = true
	blackboard.crouch_sticky_timer = 0
	blackboard.displaced_units = {}
	blackboard.next_move_check = 0
	blackboard.next_rage_time = 0

	local breed = blackboard.breed
	local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()

	blackboard.max_health_regen_per_sec = breed.max_health_regen_per_sec[difficulty_rank]
	blackboard.max_health_regen_time = breed.max_health_regen_time[difficulty_rank]

	local can_start_angry = true

	if ScriptUnit.has_extension(unit, "ai_group_system") then
		local ai_group_extension = ScriptUnit.extension(unit, "ai_group_system")

		can_start_angry = not ai_group_extension.in_patrol
	end

	if can_start_angry then
		local conflict_director = Managers.state.conflict

		setup_start_angry(unit, blackboard, conflict_director)
		conflict_director:freeze_intensity_decay(10)
		conflict_director:add_unit_to_bosses(unit)
	end
end

AiBreedSnippets.on_chaos_troll_death = function (unit, blackboard)
	local conflict_director = Managers.state.conflict

	conflict_director:freeze_intensity_decay(1)
	conflict_director:remove_unit_from_bosses(unit)
	print("chaos troll died!")

	if blackboard.is_angry then
		conflict_director:add_angry_boss(-1)
	end

	AiBreedSnippets.reward_boss_kill_loot(unit, blackboard)
end

AiBreedSnippets.on_chaos_troll_despawn = function (unit, blackboard)
	local conflict_director = Managers.state.conflict

	conflict_director:freeze_intensity_decay(1)
	conflict_director:remove_unit_from_bosses(unit)
	print("chaos troll was despawned!")

	if blackboard.is_angry then
		conflict_director:add_angry_boss(-1)
	end

	if not blackboard.rewarded_boss_loot then
		AiBreedSnippets.reward_boss_kill_loot(unit, blackboard)
	end
end

AiBreedSnippets.on_chaos_dummy_troll_spawn = function (unit, blackboard)
	blackboard.aggro_list = {}
	blackboard.can_get_downed = true
	blackboard.crouch_sticky_timer = 0
	blackboard.displaced_units = {}

	local breed = blackboard.breed
	local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()

	blackboard.max_health_regen_per_sec = breed.max_health_regen_per_sec[difficulty_rank]
	blackboard.max_health_regen_time = breed.max_health_regen_time[difficulty_rank]
	blackboard.idle_sound_timer = Managers.time:time("game") + 2
	blackboard.play_alert = true
end

AiBreedSnippets.on_chaos_dummy_troll_update = function (unit, blackboard)
	local t = Managers.time:time("game")
	local idle_sound_timer = blackboard.idle_sound_timer
	local alert_sound_timer = blackboard.alert_sound_timer
	local audio_system = Managers.state.entity:system("audio_system")

	if blackboard.play_alert then
		audio_system:play_audio_unit_event("Play_enemy_troll_vce_alert", unit)

		blackboard.play_alert = nil

		local network_manager = Managers.state.network

		network_manager:anim_event(unit, "to_combat")
	end

	if idle_sound_timer and idle_sound_timer < t then
		audio_system:play_audio_unit_event("Play_enemy_troll_vce_idle", unit)

		blackboard.idle_sound_timer = nil
	end
end

AiBreedSnippets.on_chaos_dummy_troll_death = function (unit, blackboard)
	local audio_system = Managers.state.entity:system("audio_system")

	audio_system:play_audio_unit_event("Play_enemy_troll_vce_hurt", unit)
end

AiBreedSnippets.on_chaos_dummy_sorcerer_spawn = function (unit, blackboard, t)
	local health_extension = ScriptUnit.extension(unit, "health_system")

	health_extension.is_invincible = true
end

AiBreedSnippets.on_storm_vermin_champion_spawn = function (unit, blackboard)
	local breed = blackboard.breed

	blackboard.aggro_list = {}
	blackboard.next_move_check = 0
	blackboard.spawned_allies_wave = 0
	blackboard.surrounding_players = 0
	blackboard.current_phase = 1
	blackboard.spawn_type = nil
	blackboard.surrounding_players_last = -math.huge
	blackboard.run_speed = breed.run_speed
	blackboard.inventory_item_set = 1
	blackboard.switching_weapons = 2
	blackboard.dual_wield_timer = Managers.time:time("game") + 30
	blackboard.dual_wield_mode = true
	blackboard.num_times_hit_skaven = 0

	if breed.displace_players_data then
		blackboard.displaced_units = {}
	end

	if Managers.state.difficulty:get_difficulty_rank() >= 2 then
		blackboard.trickle_timer = Managers.time:time("game") + 8
	else
		print("no trickle, difficulty:", Managers.state.difficulty:get_difficulty_rank())
	end

	local network_manager = Managers.state.network
	local unit_id = network_manager:unit_game_object_id(unit)
	local conflict_director = Managers.state.conflict

	conflict_director:freeze_intensity_decay(10)
	conflict_director:add_unit_to_bosses(unit)

	local actor = Unit.actor(unit, "c_trophy_rack_ward")

	Actor.set_collision_enabled(actor, false)
	Actor.set_scene_query_enabled(actor, false)

	local t = Managers.time:time("game")

	blackboard.intro_timer = t + 10
	blackboard.is_valid_target_func = GenericStatusExtension.is_lord_target

	local level_analysis = Managers.state.conflict.level_analysis
	local node_units = level_analysis.generic_ai_node_units.warlord_go_to

	if node_units then
		local spawn_allies_positions = {}

		for i = 1, #node_units do
			local node_unit = node_units[i]
			local pos = Unit.local_position(node_unit, 0)

			spawn_allies_positions[#spawn_allies_positions + 1] = Vector3Box(pos)
		end

		blackboard.spawn_allies_positions = spawn_allies_positions
	end
end

AiBreedSnippets.on_storm_vermin_champion_husk_spawn = function (unit)
	local actor = Unit.actor(unit, "c_trophy_rack_ward")

	Actor.set_collision_enabled(actor, false)
	Actor.set_scene_query_enabled(actor, false)
end

AiBreedSnippets.on_storm_vermin_hot_join_sync = function (sender, unit)
	local bb = BLACKBOARDS[unit]

	if bb.ward_active then
		local network_manager = Managers.state.network
		local unit_id = network_manager:unit_game_object_id(sender)
		local channel_id = PEER_ID_TO_CHANNEL[peer_id]

		RPC.rpc_set_ward_state(channel_id, unit_id, true)
	end
end

AiBreedSnippets.on_storm_vermin_champion_update = function (unit, blackboard, t, dt)
	local side = Managers.state.side.side_by_unit[unit]
	local enemy_player_and_bot_units = side.ENEMY_PLAYER_AND_BOT_UNITS
	local enemy_player_and_bot_positions = side.ENEMY_PLAYER_AND_BOT_POSITIONS
	local self_pos = POSITION_LOOKUP[unit]
	local range = BreedActions.skaven_storm_vermin_champion.special_attack_spin.radius
	local num = 0

	for i, position in ipairs(enemy_player_and_bot_positions) do
		local player_unit = enemy_player_and_bot_units[i]

		if range > Vector3.distance(self_pos, position) and not ScriptUnit.extension(player_unit, "status_system"):is_disabled() and not ScriptUnit.extension(player_unit, "status_system"):is_invisible() then
			num = num + 1
		end
	end

	blackboard.surrounding_players = num

	if blackboard.surrounding_players > 0 then
		blackboard.surrounding_players_last = t
	end

	if blackboard.trickle_timer and t > blackboard.trickle_timer and not blackboard.defensive_mode_duration then
		local conflict_director = Managers.state.conflict

		if conflict_director:count_units_by_breed("skaven_slave") < 4 then
			local strictly_not_close_to_players = true
			local silent = true
			local composition_type = "stronghold_boss_trickle"
			local limit_spawners, terror_event_id
			local side_id = side.side_id

			conflict_director.horde_spawner:execute_event_horde(t, terror_event_id, side_id, composition_type, limit_spawners, silent, nil, strictly_not_close_to_players)

			blackboard.trickle_timer = t + 15
		else
			blackboard.trickle_timer = t + 10
		end
	end

	local breed = blackboard.breed

	if blackboard.dual_wield_mode then
		if t > blackboard.dual_wield_timer and not blackboard.active_node or blackboard.defensive_mode_duration then
			blackboard.dual_wield_timer = t + 20
			blackboard.dual_wield_mode = false
		end
	else
		local hp = ScriptUnit.extension(blackboard.unit, "health_system"):current_health_percent()

		if blackboard.current_phase == 2 and hp < 0.15 then
			blackboard.current_phase = 3

			local new_run_speed = breed.angry_run_speed

			blackboard.run_speed = new_run_speed

			if not blackboard.run_speed_overridden then
				blackboard.navigation_extension:set_max_speed(new_run_speed)
			end
		elseif blackboard.current_phase == 1 and hp < 0.8 then
			blackboard.current_phase = 2
		end

		if blackboard.defensive_mode_duration then
			if not blackboard.defensive_mode_duration_at_t then
				blackboard.defensive_mode_duration_at_t = t + blackboard.defensive_mode_duration
			end

			if t >= blackboard.defensive_mode_duration_at_t then
				blackboard.defensive_mode_duration = nil
				blackboard.defensive_mode_duration_at_t = nil
			else
				blackboard.defensive_mode_duration = t - blackboard.defensive_mode_duration_at_t
				blackboard.dual_wield_mode = false
			end
		elseif t > blackboard.dual_wield_timer and not blackboard.active_node then
			blackboard.dual_wield_mode = true
			blackboard.dual_wield_timer = t + 20
		end
	end

	if blackboard.displaced_units then
		AiUtils.push_intersecting_players(unit, unit, blackboard.displaced_units, breed.displace_players_data, t, dt)
	end
end

AiBreedSnippets.on_storm_vermin_champion_death = function (unit, blackboard)
	local conflict_director = Managers.state.conflict

	conflict_director:freeze_intensity_decay(1)
	conflict_director:remove_unit_from_bosses(unit)

	local t = Managers.time:time("game")

	Managers.state.conflict.specials_pacing:delay_spawning(t, 160, 20, true)

	if blackboard.is_angry then
		conflict_director:add_angry_boss(-1)
	end

	AiBreedSnippets.drop_loot(2, Vector3(166.5, -46, 38), true, unit)
end

AiBreedSnippets.on_storm_vermin_champion_despawn = function (unit, blackboard)
	local conflict_director = Managers.state.conflict

	conflict_director:freeze_intensity_decay(1)
	conflict_director:remove_unit_from_bosses(unit)

	if blackboard.is_angry then
		conflict_director:add_angry_boss(-1)
	end
end

AiBreedSnippets.on_chaos_warrior_spawn = function (unit, blackboard)
	blackboard.displaced_units = {}
	blackboard.aggro_list = {}
end

AiBreedSnippets.on_chaos_warrior_update = function (unit, blackboard, t)
	local breed = blackboard.breed
	local displace_players_data = breed.displace_players_data

	if not displace_players_data or not HEALTH_ALIVE[unit] then
		return
	end

	AiUtils.push_intersecting_players(unit, unit, blackboard.displaced_units, displace_players_data, t)
end

AiBreedSnippets.on_chaos_tentacle_despawn = function (unit, blackboard)
	local tentacle_data = blackboard.tentacle_data

	if tentacle_data and tentacle_data.portal_unit then
		local portal_unit = tentacle_data.portal_unit
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_audio_unit_event("Stop_enemy_sorcerer_portal_loop", portal_unit, "a_surface_center")
		Managers.state.unit_spawner:mark_for_deletion(portal_unit)
	end

	local boss_master_unit = blackboard.boss_master_unit

	if boss_master_unit and Unit.alive(boss_master_unit) then
		local boss_blackboard = BLACKBOARDS[boss_master_unit]

		boss_blackboard.num_portals_alive = boss_blackboard.num_portals_alive - 1
		boss_blackboard.tentacle_portal_units[unit] = nil
	end
end

AiBreedSnippets.on_chaos_spawn_spawn = function (unit, blackboard)
	local breed = blackboard.breed

	blackboard.aggro_list = {}
	blackboard.fling_skaven_timer = 0
	blackboard.next_move_check = 0
	blackboard.cycle_rage_anim_index = 0
	blackboard.attack_grabbed_attacks = 0
	blackboard.chew_attacks_done = 0
	blackboard.grabbed_time = 0
	blackboard.chaos_spawn_is_throwing = false
	blackboard.is_valid_target_func = GenericStatusExtension.is_chaos_spawn_target

	local conflict_director = Managers.state.conflict

	setup_start_angry(unit, blackboard, conflict_director)
	conflict_director:freeze_intensity_decay(10)
	conflict_director:add_unit_to_bosses(unit)
end

AiBreedSnippets.on_chaos_spawn_death = function (unit, blackboard)
	local conflict_director = Managers.state.conflict

	conflict_director:freeze_intensity_decay(1)
	conflict_director:remove_unit_from_bosses(unit)
	print("chaos spawn died!")

	if blackboard.is_angry then
		conflict_director:add_angry_boss(-1)
	end

	AiBreedSnippets.reward_boss_kill_loot(unit, blackboard)
end

AiBreedSnippets.on_chaos_spawn_despawn = function (unit, blackboard)
	local conflict_director = Managers.state.conflict

	conflict_director:freeze_intensity_decay(1)
	conflict_director:remove_unit_from_bosses(unit)

	if blackboard.is_angry then
		conflict_director:add_angry_boss(-1)
	end

	if not blackboard.rewarded_boss_loot then
		AiBreedSnippets.reward_boss_kill_loot(unit, blackboard)
	end
end

AiBreedSnippets.on_chaos_vortex_sorcerer_spawn = function (unit, blackboard)
	local breed = blackboard.breed

	blackboard.max_vortex_units = breed.max_vortex_units
	blackboard.spell_count = 0

	Managers.state.entity:system("surrounding_aware_system"):add_system_event(unit, "heard_enemy", DialogueSettings.hear_chaos_vortex_sorcerer, "enemy_tag", "chaos_vortex_sorcerer")
end

function remove_vortex_units(unit, blackboard)
	local vortex_data = blackboard.vortex_data
	local conflict_director = Managers.state.conflict

	if blackboard.breed.no_despawn_when_master_dies then
		return
	end

	local vortex_units = vortex_data and vortex_data.vortex_units

	if vortex_units then
		for _, vortex_unit in ipairs(vortex_units) do
			if Unit.alive(vortex_unit) then
				local vortex_blackboard = BLACKBOARDS[vortex_unit]

				conflict_director:destroy_unit(vortex_unit, vortex_blackboard, "vortex")
			end
		end

		table.clear(vortex_units)
	end

	local queued_vortex = vortex_data and vortex_data.queued_vortex

	if queued_vortex then
		local unit_spawner = Managers.state.unit_spawner

		for id, queue_data in pairs(queued_vortex) do
			conflict_director:remove_queued_unit(id)

			local inner_decal_unit = queue_data.inner_decal_unit

			if Unit.alive(inner_decal_unit) then
				unit_spawner:mark_for_deletion(inner_decal_unit)
			end

			local outer_decal_unit = queue_data.outer_decal_unit

			if Unit.alive(outer_decal_unit) then
				unit_spawner:mark_for_deletion(outer_decal_unit)
			end

			queued_vortex[id] = nil
		end
	end
end

AiBreedSnippets.on_chaos_vortex_sorcerer_death = function (unit, blackboard)
	remove_vortex_units(unit, blackboard)
end

AiBreedSnippets.on_chaos_vortex_sorcerer_despawn = function (unit, blackboard)
	remove_vortex_units(unit, blackboard)
end

AiBreedSnippets.on_chaos_plague_sorcerer_spawn = function (unit, blackboard)
	blackboard.spell_count = 0
end

AiBreedSnippets.on_chaos_tentacle_sorcerer_spawn = function (unit, blackboard)
	blackboard.spell_count = 0
end

AiBreedSnippets.on_chaos_exalted_sorcerer_spawn = function (unit, blackboard)
	local t = Managers.time:time("game")
	local breed = blackboard.breed

	blackboard.max_vortex_units = breed.max_vortex_units
	blackboard.done_casting_timer = 0
	blackboard.spawned_allies_wave = 0
	blackboard.recent_attacker_timer = 0
	blackboard.recent_melee_attacker_timer = 0
	blackboard.health_extension = ScriptUnit.extension(unit, "health_system")
	blackboard.num_portals_alive = 0
	blackboard.tentacle_portal_units = {}

	local available_spells = breed.available_spells
	local spells, spells_lookup = {}, {}
	local physics_world = World.get_data(blackboard.world, "physics_world")

	blackboard.spell_count = 0

	do
		local spell = {
			name = "vortex",
			spawn_timer = 3,
			physics_world = physics_world,
			vortex_units = {},
			queued_vortex = {},
			vortex_spawn_pos = Vector3Box(),
			search_func = BTChaosSorcererSkulkApproachAction._update_vortex_search,
			spawn_func = BTChaosSorcererSummoningAction._spawn_vortex,
		}

		blackboard.vortex_data = spell
		spells[#spells + 1] = spell
		spells_lookup.vortex = spell
	end

	do
		local spell = {
			name = "boss_vortex",
			spawn_timer = 3,
			physics_world = physics_world,
			vortex_units = {},
			queued_vortex = {},
			vortex_spawn_pos = Vector3Box(),
			spawn_func = BTChaosSorcererSummoningAction._spawn_boss_vortex,
		}

		blackboard.boss_vortex_data = spell
		spells[#spells + 1] = spell
		spells_lookup.boss_vortex = spell
	end

	do
		local spell = {
			name = "plague_wave",
			plague_wave_timer = t + 10,
			physics_world = physics_world,
			target_starting_pos = Vector3Box(),
			plague_wave_rot = QuaternionBox(),
			search_func = BTChaosExaltedSorcererSkulkAction.update_plague_wave,
		}

		blackboard.plague_wave_data = spell
		spells[#spells + 1] = spell
		spells_lookup.plague_wave = spell
	end

	do
		local spell = {
			chance_to_look_for_wall_spawn = 0.5,
			name = "tentacle",
			portal_spawn_type = "n/a",
			search_counter = 0,
			portal_search_timer = t + 3,
			cover_units = {},
			portal_spawn_pos = Vector3Box(),
			portal_spawn_rot = QuaternionBox(),
			physics_world = physics_world,
			search_func = BTChaosSorcererSkulkApproachAction.update_portal_search,
			spawn_func = BTChaosSorcererSummoningAction.spawn_portal,
		}

		blackboard.portal_data = spell
		spells[#spells + 1] = spell
		spells_lookup.tentacle = spell
	end

	do
		local spell = {
			launch_angle = 0.7,
			magic_missile = true,
			magic_missile_speed = 20,
			name = "magic_missile",
			projectile_unit_name = "units/weapons/projectile/magic_missile/magic_missile",
			range = 40,
			true_flight_template_name = "sorcerer_magic_missile",
			search_func = BTChaosExaltedSorcererSkulkAction.update_cast_missile,
			throw_pos = Vector3Box(),
			target_direction = Vector3Box(),
		}

		blackboard.magic_missile_data = spell
		spells[#spells + 1] = spell
		spells_lookup.magic_missile = spell
	end

	do
		local spell = {
			explosion_template_name = "chaos_strike_missile_impact",
			launch_angle = 1.25,
			magic_missile = true,
			magic_missile_speed = 15,
			name = "sorcerer_strike_missile",
			projectile_unit_name = "units/weapons/projectile/strike_missile/strike_missile",
			range = 40,
			true_flight_template_name = "sorcerer_strike_missile",
			search_func = BTChaosExaltedSorcererSkulkAction.update_cast_missile,
			throw_pos = Vector3Box(),
			target_direction = Vector3Box(),
		}

		blackboard.sorcerer_strike_missile_data = spell
		spells[#spells + 1] = spell
		spells_lookup.sorcerer_strike_missile = spell
	end

	do
		local spell = {
			magic_missile = true,
			magic_missile_speed = 20,
			name = "magic_missile_ground",
			projectile_unit_name = "units/weapons/projectile/magic_missile/magic_missile",
			range = 40,
			true_flight_template_name = "sorcerer_magic_missile_ground",
			search_func = BTChaosExaltedSorcererSkulkAction.update_cast_missile,
			throw_pos = Vector3Box(),
			target_direction = Vector3Box(),
		}

		blackboard.magic_missile_ground_data = spell
		spells[#spells + 1] = spell
		spells_lookup.magic_missile_ground = spell
	end

	do
		local spell = {
			magic_missile = true,
			magic_missile_speed = 20,
			name = "missile_barrage",
			range = 40,
			search_func = BTChaosExaltedSorcererSkulkAction.update_cast_missile,
			throw_pos = Vector3Box(),
			target_direction = Vector3Box(),
		}

		blackboard.missile_barrage_data = spell
		spells[#spells + 1] = spell
		spells_lookup.missile_barrage = spell
	end

	do
		local spell = {
			explosion_template_name = "chaos_slow_bomb_missile",
			life_time = 15,
			magic_missile = true,
			magic_missile_speed = 2.5,
			name = "seeking_bomb_missile",
			projectile_unit_name = "units/weapons/projectile/insect_swarm_missile/insect_swarm_missile_01",
			range = 40,
			true_flight_template_name = "sorcerer_slow_bomb_missile",
			search_func = BTChaosExaltedSorcererSkulkAction.update_cast_missile,
			throw_pos = Vector3Box(),
			target_direction = Vector3Box(),
			projectile_size = {
				3,
				3,
				3,
			},
		}

		blackboard.seeking_bomb_missile_data = spell
		spells[#spells + 1] = spell
		spells_lookup.seeking_bomb_missile = spell
	end

	do
		local spell = {
			name = "dummy",
			search_func = BTChaosExaltedSorcererSkulkAction.update_dummy,
		}

		blackboard.dummy_data = spell
		spells[#spells + 1] = spell
		spells_lookup.dummy = spell
	end

	local id_lookup = Managers.state.entity:system("spawner_system")._id_lookup
	local level_analysis = Managers.state.conflict.level_analysis
	local center_node_units = level_analysis.generic_ai_node_units.sorcerer_boss_center
	local wall_node_units = level_analysis.generic_ai_node_units.sorcerer_boss_wall
	local level_has_boss_arena = center_node_units and wall_node_units and id_lookup.sorcerer_boss and id_lookup.sorcerer_boss_minion

	if level_has_boss_arena then
		local center_marker = center_node_units[1]

		blackboard.in_boss_arena = Vector3.distance(POSITION_LOOKUP[unit], Unit.local_position(center_marker, 0)) < 20
	else
		blackboard.in_boss_arena = false
	end

	if blackboard.in_boss_arena then
		blackboard.spawners = {
			sorcerer_boss_center = center_node_units,
		}
		blackboard.mode = "setup"
		blackboard.phase_timer = t + 999
		blackboard.intro_timer = t + 21

		local center_unit = center_node_units[1]
		local arena_center_pos = Unit.local_position(center_unit, 0) + Vector3(0, 0, 0.75)
		local arena_rot = Unit.local_rotation(center_unit, 0)
		local arena_pose_box = Matrix4x4Box(Matrix4x4.from_quaternion_position(arena_rot, arena_center_pos))

		blackboard.arena_pose_boxed = arena_pose_box
		blackboard.arena_half_extents = Vector3Box(12, 12, 1)

		blackboard.valid_teleport_pos_func = function (pos, blackboard)
			local pose = blackboard.arena_pose_boxed:unbox()
			local half_extents = blackboard.arena_half_extents:unbox()
			local inside = math.point_is_inside_oobb(pos, pose, half_extents)

			return inside
		end
	else
		blackboard.phase = "offensive"

		blackboard.valid_teleport_pos_func = function (pos, blackboard)
			return true
		end

		print("Sorcerer boss not in arena")
	end

	blackboard.spells = spells
	blackboard.spells_lookup = spells_lookup

	local effect_name_id = NetworkLookup.effects["fx/chr_chaos_sorcerer_teleport"]
	local node_id = 0
	local rotation_offset = Quaternion.identity()
	local network_manager = Managers.state.network

	network_manager:rpc_play_particle_effect(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, POSITION_LOOKUP[unit], rotation_offset, false)

	local breed = blackboard.breed
	local audio_system_extension = Managers.state.entity:system("audio_system")

	if breed.teleport_sound_event then
		audio_system_extension:play_audio_unit_event(breed.teleport_sound_event, unit)
	end

	local conflict_director = Managers.state.conflict

	conflict_director:add_unit_to_bosses(unit)

	blackboard.is_valid_target_func = GenericStatusExtension.is_lord_target
end

function check_for_recent_attackers(unit, blackboard, t, ranged_range)
	local min_retaliation_dist_sqr = ranged_range or 100
	local health_extension = ScriptUnit.extension(unit, "health_system")
	local recent_damages, nr_damages = health_extension:recent_damages()

	if nr_damages > 0 then
		local attacking_unit = recent_damages[DamageDataIndex.ATTACKER]
		local side = blackboard.side
		local damage_source = recent_damages[DamageDataIndex.DAMAGE_SOURCE_NAME]
		local master_list_item = rawget(ItemMasterList, damage_source)
		local is_melee = master_list_item and master_list_item.slot_type == "melee"

		if Unit.alive(attacking_unit) and side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS[attacking_unit] then
			local dist_sqr = Vector3.distance_squared(POSITION_LOOKUP[unit], POSITION_LOOKUP[attacking_unit])

			if min_retaliation_dist_sqr < dist_sqr and not is_melee then
				blackboard.target_unit = attacking_unit
				blackboard.recent_attacker_unit = attacking_unit
				blackboard.recent_attacker_timer = t + 3
				blackboard.recent_attacker = true

				local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
				local event_data = FrameTable.alloc_table()

				dialogue_input:trigger_networked_dialogue_event("ebh_retaliation_missile", event_data)
			elseif is_melee then
				blackboard.target_unit = attacking_unit
				blackboard.recent_melee_attacker_unit = attacking_unit
				blackboard.recent_melee_attacker_timer = t + 0.35
				blackboard.recent_melee_attacker = true
			end
		end
	elseif blackboard.recent_attacker then
		if t > blackboard.recent_attacker_timer then
			blackboard.recent_attacker_unit = nil
			blackboard.recent_attacker_timer = math.huge
			blackboard.recent_attacker = false
		end
	elseif blackboard.recent_melee_attacker and t > blackboard.recent_melee_attacker_timer then
		blackboard.recent_melee_attacker_unit = nil
		blackboard.recent_melee_attacker_timer = math.huge
		blackboard.recent_melee_attacker = false
	end
end

local show_arena_extents = false

AiBreedSnippets.on_chaos_exalted_sorcerer_update = function (unit, blackboard, t, dt)
	check_for_recent_attackers(unit, blackboard, t)

	if not blackboard.in_boss_arena then
		return
	end

	if blackboard.intro_timer then
		return
	end

	if show_arena_extents then
		local pose = blackboard.arena_pose_boxed:unbox()
		local half_extents = blackboard.arena_half_extents:unbox()

		QuickDrawer:box(pose, half_extents, Color(0, 255, 70))
	end

	local phase = blackboard.phase
	local mode = blackboard.mode

	blackboard.can_spawn_portals = blackboard.num_portals_alive < 1

	if mode == "defensive" then
		if phase == "defensive_completed" then
			blackboard.mode = "offensive"
			blackboard.phase_timer = t + 20
		elseif t > blackboard.phase_timer then
			blackboard.phase = "defensive_ends"
		end
	elseif mode == "offensive" then
		if t > blackboard.phase_timer then
			blackboard.mode = "defensive"
			blackboard.phase = "defensive_starts"
			blackboard.phase_timer = t + 20
		end
	elseif t > blackboard.phase_timer then
		blackboard.mode = "defensive"
		blackboard.phase = "defensive_starts"
		blackboard.phase_timer = t + 20
	end

	if blackboard.missle_bot_threat_unit then
		local bot_threat_position = POSITION_LOOKUP[blackboard.missle_bot_threat_unit]
		local radius = 2
		local height = 1
		local half_height = height * 0.5
		local size = Vector3(radius, half_height, radius)

		bot_threat_position = bot_threat_position - Vector3.up() * half_height

		Managers.state.entity:system("ai_bot_group_system"):aoe_threat_created(bot_threat_position, "cylinder", size, nil, 1)

		blackboard.missle_bot_threat_unit = nil
	end
end

AiBreedSnippets.reward_boss_kill_loot = function (unit, blackboard)
	local pickup_name = Managers.state.game_mode:get_boss_loot_pickup()

	if not pickup_name then
		return
	end

	if blackboard.deny_kill_loot then
		return
	end

	local nav_world = blackboard.nav_world
	local position = POSITION_LOOKUP[unit]
	local below = 1
	local above = 1
	local wanted_drop_position
	local is_on_navmesh, altitude = GwNavQueries.triangle_from_position(nav_world, position, above, below)

	if is_on_navmesh then
		wanted_drop_position = Vector3.copy(position)
		wanted_drop_position.z = altitude
	else
		local horizontal_limit = 2
		local distance_from_nav_border = 0.05

		wanted_drop_position = GwNavQueries.inside_position_from_outside_position(nav_world, position, above, below, horizontal_limit, distance_from_nav_border)
	end

	wanted_drop_position = wanted_drop_position or position

	local breed = Unit.get_data(unit, "breed")
	local breed_name = breed and breed.name
	local extension_init_data = {
		pickup_system = {
			has_physics = true,
			spawn_type = "loot",
			pickup_name = pickup_name,
			dropped_by_breed = breed_name,
		},
	}
	local pickup_settings = AllPickups[pickup_name]
	local unit_name = pickup_settings.unit_name
	local unit_template_name = pickup_settings.unit_template_name or "pickup_unit"
	local rotation = Quaternion.identity()
	local offset = Vector3(0, 0, 0.6)

	Managers.state.unit_spawner:spawn_network_unit(unit_name, unit_template_name, extension_init_data, wanted_drop_position + offset, rotation)

	blackboard.rewarded_boss_loot = true
end

AiBreedSnippets.drop_loot = function (num_die, pos, has_physics, unit)
	local pickup_name = Managers.state.game_mode:get_boss_loot_pickup()

	if not pickup_name then
		return
	end

	local breed = unit and Unit.get_data(unit, "breed")
	local breed_name = breed and breed.name

	for i = 1, num_die do
		local extension_init_data = {
			pickup_system = {
				spawn_type = "loot",
				pickup_name = pickup_name,
				has_physics = has_physics,
				dropped_by_breed = breed_name,
			},
		}
		local pickup_settings = AllPickups[pickup_name]
		local unit_name = pickup_settings.unit_name
		local unit_template_name = pickup_settings.unit_template_name or "pickup_unit"
		local angle = i / num_die * 2 * math.pi
		local position = pos + Vector3(math.cos(angle), math.sin(angle), 0)
		local rotation = Quaternion.identity()

		Managers.state.unit_spawner:spawn_network_unit(unit_name, unit_template_name, extension_init_data, position, rotation)
	end
end

AiBreedSnippets.on_chaos_exalted_sorcerer_death = function (unit, blackboard)
	local conflict_director = Managers.state.conflict

	conflict_director:remove_unit_from_bosses(unit)

	local t = Managers.time:time("game")

	Managers.state.conflict.specials_pacing:delay_spawning(t, 120, 20, true)

	if blackboard.is_angry then
		conflict_director:add_angry_boss(-1)
	end

	AiBreedSnippets.drop_loot(2, Vector3(362.5, 51.6, -9.1), true, unit)
end

AiBreedSnippets.on_chaos_exalted_sorcerer_despawn = function (unit, blackboard)
	local conflict_director = Managers.state.conflict

	conflict_director:remove_unit_from_bosses(unit)

	if blackboard.is_angry then
		conflict_director:add_angry_boss(-1)
	end
end

AiBreedSnippets.on_chaos_exalted_champion_spawn = function (unit, blackboard)
	local t = Managers.time:time("game")
	local breed = blackboard.breed

	blackboard.aggro_list = {}
	blackboard.next_move_check = 0
	blackboard.spawned_allies_wave = 0
	blackboard.surrounding_players = 0
	blackboard.current_phase = 1
	blackboard.spawn_type = nil
	blackboard.surrounding_players_last = -math.huge
	blackboard.run_speed = breed.run_speed
	blackboard.cheer_state = 1
	blackboard.intro_timer = t + 10

	if breed.displace_players_data then
		blackboard.displaced_units = {}
	end

	local conflict_director = Managers.state.conflict

	conflict_director:freeze_intensity_decay(10)
	conflict_director:add_unit_to_bosses(unit)

	blackboard.cheer_timer = t + math.random(15, 30)
	blackboard.walla_sync_timer = t + 2
	blackboard.ray_can_go_update_time = t + 0.5

	local level_analysis = Managers.state.conflict.level_analysis
	local node_units = level_analysis.generic_ai_node_units.chaos_exalted_defensive_move_to

	if node_units then
		local node_unit = node_units[1]
		local pos = Unit.local_position(node_unit, 0)

		blackboard.override_spawn_allies_call_position = Vector3Box(pos)
	end

	blackboard.is_valid_target_func = GenericStatusExtension.is_lord_target
	blackboard.num_times_hit_chaos_warrior = 0
end

AiBreedSnippets.on_chaos_exalted_champion_norsca_spawn = function (unit, blackboard)
	local t = Managers.time:time("game")
	local breed = blackboard.breed

	blackboard.aggro_list = {}
	blackboard.next_move_check = 0
	blackboard.current_phase = 1
	blackboard.spawn_type = nil
	blackboard.run_speed = breed.run_speed

	if breed.displace_players_data then
		blackboard.displaced_units = {}
	end

	local conflict_director = Managers.state.conflict

	conflict_director:freeze_intensity_decay(10)
	conflict_director:add_unit_to_bosses(unit)
	conflict_director:add_angry_boss(1, blackboard)

	blackboard.is_angry = true
	blackboard.ray_can_go_update_time = t + 0.5
	blackboard.is_valid_target_func = GenericStatusExtension.is_lord_target

	local enemy_package_loader = Managers.level_transition_handler.enemy_package_loader
	local transform_action_data = BreedActions.chaos_exalted_champion.transform
	local transform_breed_name = transform_action_data.wanted_breed_transform

	if not enemy_package_loader.breed_processed[transform_breed_name] then
		enemy_package_loader:request_breed(transform_breed_name, true)
	end
end

AiBreedSnippets.on_chaos_exalted_champion_update = function (unit, blackboard, t, dt)
	local self_pos = POSITION_LOOKUP[unit]
	local breed = blackboard.breed
	local wwise_world = Managers.world:wwise_world(blackboard.world)
	local range = BreedActions.chaos_exalted_champion.special_attack_aoe.radius
	local num = 0
	local player_average_hp = 0
	local side = Managers.state.side.side_by_unit[unit]
	local enemy_player_and_bot_positions = side.ENEMY_PLAYER_AND_BOT_POSITIONS
	local enemy_player_and_bot_units = side.ENEMY_PLAYER_AND_BOT_UNITS

	for i, position in ipairs(enemy_player_and_bot_positions) do
		local player_unit = enemy_player_and_bot_units[i]

		if range > Vector3.distance(self_pos, position) and not ScriptUnit.extension(player_unit, "status_system"):is_disabled() and not ScriptUnit.extension(player_unit, "status_system"):is_invisible() then
			num = num + 1
		end

		if ScriptUnit.extension(player_unit, "status_system"):is_knocked_down() then
			player_average_hp = player_average_hp - 1
		else
			local player_hp = ScriptUnit.extension(player_unit, "health_system"):current_health_percent()

			player_average_hp = player_average_hp + player_hp
		end
	end

	blackboard.surrounding_players = num

	if blackboard.surrounding_players > 0 then
		blackboard.surrounding_players_last = t
	end

	player_average_hp = player_average_hp / 4

	local hp = ScriptUnit.extension(unit, "health_system"):current_health_percent()

	if blackboard.current_phase == 1 and hp < 0.75 then
		local new_run_speed = breed.angry_run_speed

		blackboard.run_speed = new_run_speed

		if not blackboard.run_speed_overridden then
			blackboard.navigation_extension:set_max_speed(new_run_speed)
		end
	end

	if blackboard.override_spawn_allies_call_position then
		if blackboard.current_phase == 1 and hp < 0.7 then
			blackboard.current_phase = 2
			blackboard.trickle_timer = t + 10
		elseif blackboard.current_phase == 2 and hp < 0.4 then
			blackboard.current_phase = 3
		end
	end

	local conflict_director = Managers.state.conflict

	if blackboard.defensive_mode_duration then
		local remaining = blackboard.defensive_mode_duration - dt

		if remaining <= 0 then
			blackboard.defensive_mode_duration = nil
		else
			blackboard.defensive_mode_duration = remaining
		end
	end

	if hp > 0.05 and blackboard.trickle_timer and t > blackboard.trickle_timer and not blackboard.defensive_mode_duration then
		local timer = hp * 15

		timer = math.max(timer, 5)

		if conflict_director:count_units_by_breed("chaos_marauder") < 3 then
			local strictly_not_close_to_players = true
			local silent = true
			local composition_type = "warcamp_boss_event_trickle"
			local limit_spawners
			local terror_event_id = "warcamp_boss_minions"
			local side_id = side.side_id

			conflict_director.horde_spawner:execute_event_horde(t, terror_event_id, side_id, composition_type, limit_spawners, silent, nil, strictly_not_close_to_players)

			blackboard.trickle_timer = t + timer
		else
			blackboard.trickle_timer = t + timer
		end
	end

	if blackboard.displaced_units then
		AiUtils.push_intersecting_players(unit, unit, blackboard.displaced_units, breed.displace_players_data, t, dt)
	end

	AiBreedSnippets.update_exalted_champion_cheer_state(unit, blackboard, t, dt, player_average_hp)

	if t > blackboard.ray_can_go_update_time and Unit.alive(blackboard.target_unit) then
		local nav_world = blackboard.nav_world
		local target_position = POSITION_LOOKUP[blackboard.target_unit]

		blackboard.ray_can_go_to_target = LocomotionUtils.ray_can_go_on_mesh(nav_world, POSITION_LOOKUP[unit], target_position, nil, 1, 1)
		blackboard.ray_can_go_update_time = t + 0.5
	end
end

AiBreedSnippets.update_exalted_champion_cheer_state = function (unit, blackboard, t, dt, player_average_hp)
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local audio_system = Managers.state.entity:system("audio_system")
	local hp = ScriptUnit.extension(blackboard.unit, "health_system"):current_health_percent()
	local wwise_world = Managers.world:wwise_world(blackboard.world)
	local hp_diff = (hp - player_average_hp) * 5
	local walla_value = math.min(hp_diff + 1, 5)

	walla_value = math.max(walla_value, 0)

	local cheer_value = math.min(walla_value, 4)

	cheer_value = math.ceil(cheer_value)

	if t > blackboard.cheer_timer then
		WwiseWorld.set_global_parameter(wwise_world, "champion_crowd_voices", 0)
		audio_system:set_global_parameter_with_lerp("champion_crowd_voices", cheer_value)

		blackboard.cheer_timer = t + math.random(10, 25)

		local parameter_id = NetworkLookup.global_parameter_names.champion_crowd_voices

		network_transmit:send_rpc_clients("rpc_client_audio_set_global_parameter", parameter_id, cheer_value)
	end

	audio_system:set_global_parameter("champion_crowd_voices_walla", walla_value)

	if t > blackboard.walla_sync_timer then
		local parameter_id = NetworkLookup.global_parameter_names.champion_crowd_voices_walla

		network_transmit:send_rpc_clients("rpc_client_audio_set_global_parameter", parameter_id, walla_value)

		blackboard.walla_sync_timer = t + 2
	end
end

AiBreedSnippets.on_chaos_exalted_champion_norsca_update = function (unit, blackboard, t, dt)
	local self_pos = POSITION_LOOKUP[unit]
	local breed = blackboard.breed
	local hp = ScriptUnit.extension(blackboard.unit, "health_system"):current_health_percent()

	if blackboard.current_phase == 1 and hp < 0.7 then
		blackboard.current_phase = 2
	end

	if blackboard.displaced_units then
		AiUtils.push_intersecting_players(unit, unit, blackboard.displaced_units, breed.displace_players_data, t, dt)
	end

	if t > blackboard.ray_can_go_update_time and blackboard.target_unit then
		local nav_world = blackboard.nav_world
		local target_position = POSITION_LOOKUP[blackboard.target_unit]

		blackboard.ray_can_go_to_target = LocomotionUtils.ray_can_go_on_mesh(nav_world, POSITION_LOOKUP[unit], target_position, nil, 1, 1)
		blackboard.ray_can_go_update_time = t + 0.5
	end
end

AiBreedSnippets.on_chaos_exalted_champion_death = function (unit, blackboard)
	local conflict_director = Managers.state.conflict

	conflict_director:remove_unit_from_bosses(unit)

	local wwise_world = Managers.world:wwise_world(blackboard.world)

	WwiseWorld.set_global_parameter(wwise_world, "champion_crowd_voices", 0)
	WwiseWorld.set_global_parameter(wwise_world, "champion_crowd_voices", 1)

	blackboard.override_spawn_allies_call_position = nil

	local t = Managers.time:time("game")

	Managers.state.conflict.specials_pacing:delay_spawning(t, 120, 20, true)

	if blackboard.is_angry then
		conflict_director:add_angry_boss(-1)
	end

	AiBreedSnippets.drop_loot(2, Vector3(231, -75, 45), true, unit)
end

AiBreedSnippets.on_chaos_exalted_champion_norsca_death = function (unit, blackboard)
	local conflict_director = Managers.state.conflict

	conflict_director:freeze_intensity_decay(1)
	conflict_director:remove_unit_from_bosses(unit)

	local t = Managers.time:time("game")

	Managers.state.conflict.specials_pacing:delay_spawning(t, 40, 20, true)

	if blackboard.is_angry then
		conflict_director:add_angry_boss(-1)
	end
end

AiBreedSnippets.on_chaos_exalted_champion_despawn = function (unit, blackboard)
	local conflict_director = Managers.state.conflict

	conflict_director:remove_unit_from_bosses(unit)

	if blackboard.is_angry then
		conflict_director:add_angry_boss(-1)
	end
end

AiBreedSnippets.on_stormfiend_boss_spawn = function (unit, blackboard)
	AiBreedSnippets.on_stormfiend_spawn(unit, blackboard)

	local hp = ScriptUnit.extension(blackboard.unit, "health_system"):current_health_percent()

	blackboard.hp_at_mounted = hp

	local health_extension = ScriptUnit.extension(unit, "health_system")

	health_extension.is_invincible = true
	blackboard.current_phase = 1
end

AiBreedSnippets.on_stormfiend_boss_update = function (unit, blackboard)
	local breed = blackboard.breed
	local hp = ScriptUnit.extension(blackboard.unit, "health_system"):current_health_percent()
	local hp_at_mounted = blackboard.hp_at_mounted
	local self_pos = POSITION_LOOKUP[unit]
	local side = Managers.state.side.side_by_unit[unit]
	local enemy_player_and_bot_positions = side.ENEMY_PLAYER_AND_BOT_POSITIONS
	local enemy_player_and_bot_units = side.ENEMY_PLAYER_AND_BOT_UNITS
	local num = 0
	local range = 4

	for i, position in ipairs(enemy_player_and_bot_positions) do
		local player_unit = enemy_player_and_bot_units[i]

		if range > Vector3.distance(self_pos, position) and not ScriptUnit.extension(player_unit, "status_system"):is_disabled() then
			num = num + 1
		end
	end

	blackboard.surrounding_players = num

	if hp_at_mounted - hp >= 0.25 then
		AiBreedSnippets.on_stormfiend_boss_dismount(unit, blackboard)
	end
end

AiBreedSnippets.on_stormfiend_boss_dismount = function (unit, blackboard)
	local grey_seer_unit = blackboard.linked_unit

	if HEALTH_ALIVE[grey_seer_unit] then
		local grey_seer_blackboard = BLACKBOARDS[grey_seer_unit]
		local mounted_data = grey_seer_blackboard.mounted_data
		local network_manager = Managers.state.network
		local locomotion_extension = grey_seer_blackboard.locomotion_extension

		LocomotionUtils.set_animation_driven_movement(grey_seer_unit, true, true, false)
		locomotion_extension:use_lerp_rotation(false)
		locomotion_extension:set_movement_type("snap_to_navmesh")
		network_manager:anim_event_with_variable_float(grey_seer_unit, "stagger_weakspot_fall_off", "stagger_scale", 1.2)

		local t = Managers.time:time("game")

		mounted_data.knocked_off_mounted_timer = t + 30
		grey_seer_blackboard.stagger_immune_time = t + 5
		blackboard.linked_unit = nil

		local game = Managers.state.network:game()
		local go_id = Managers.state.unit_storage:go_id(unit)
		local target_go_id = Managers.state.unit_storage:go_id(grey_seer_unit)

		if game and go_id and target_go_id then
			GameSession.set_game_object_field(game, go_id, "animation_synced_unit_id", 0)
		end
	end
end

AiBreedSnippets.on_grey_seer_spawn = function (unit, blackboard)
	local breed = blackboard.breed
	local t = Managers.time:time("game")
	local physics_world = World.get_data(blackboard.world, "physics_world")

	blackboard.aggro_list = {}

	if Managers.state.difficulty:get_difficulty_rank() >= 2 then
		blackboard.trickle_timer = Managers.time:time("game") + 20
	else
		print("no trickle, difficulty:", Managers.state.difficulty:get_difficulty_rank())
	end

	local spell = {
		explosion_template_name = "grey_seer_warp_lightning_impact",
		magic_missile = true,
		magic_missile_speed = 20,
		name = "magic_missile",
		projectile_unit_name = "units/weapons/projectile/warp_lightning_bolt/warp_lightning_bolt",
		range = 40,
		read_from_missile_data = true,
		true_flight_template_name = "sorcerer_magic_missile",
		search_func = BTChaosExaltedSorcererSkulkAction.update_cast_missile,
		throw_pos = Vector3Box(),
		target_direction = Vector3Box(),
	}

	blackboard.magic_missile_data = spell

	local spell = {
		name = "plague_wave",
		plague_wave_timer = t + 10,
		physics_world = physics_world,
		target_starting_pos = Vector3Box(),
		plague_wave_rot = QuaternionBox(),
		search_func = BTChaosExaltedSorcererSkulkAction.update_plague_wave,
	}

	blackboard.plague_wave_data = spell
	blackboard.spell_count = 0
	blackboard.phase = "magic_missile"
	blackboard.current_spell = blackboard.magic_missile_data
	blackboard.face_target_while_summoning = true
	blackboard.mounted_data = {}
	blackboard.hit_reaction_extension = ScriptUnit.extension(unit, "hit_reaction_system")

	blackboard.hit_reaction_extension:set_hit_effect_template_id("HitEffectsSkavenGreySeerMounted")

	blackboard.current_phase = 1
	blackboard.intro_timer = t + 15
	blackboard.current_hit_reaction_type = "mounted"
	blackboard.damage_wave_template_name = "vermintide"

	local conflict_director = Managers.state.conflict

	conflict_director:add_unit_to_bosses(unit)

	blackboard.is_valid_target_func = GenericStatusExtension.is_lord_target

	local level_analysis = Managers.state.conflict.level_analysis
	local node_units = level_analysis.generic_ai_node_units.grey_seer_death_sequence

	if node_units then
		local death_sequence_positions = {}

		for i = 1, #node_units do
			local node_unit = node_units[i]
			local pos = Unit.local_position(node_unit, 0)

			death_sequence_positions[#death_sequence_positions + 1] = Vector3Box(pos)
		end

		blackboard.death_sequence_positions = death_sequence_positions
	else
		print("Grey seer: Found no death sequence positions")
	end

	local node_units = level_analysis.generic_ai_node_units.grey_seer_teleport_position

	if node_units then
		local defensive_teleport_positions = {}

		for i = 1, #node_units do
			local node_unit = node_units[i]
			local pos = Unit.local_position(node_unit, 0)

			defensive_teleport_positions[#defensive_teleport_positions + 1] = Vector3Box(pos)
		end

		blackboard.defensive_teleport_positions = defensive_teleport_positions
	else
		print("Grey seer: Found no defensive teleport positions")
	end

	local node_units = level_analysis.generic_ai_node_units.grey_seer_call_stormfiend_position

	if node_units then
		local call_stormfiend_positions = {}

		for i = 1, #node_units do
			local node_unit = node_units[i]
			local pos = Unit.local_position(node_unit, 0)

			call_stormfiend_positions[#call_stormfiend_positions + 1] = Vector3Box(pos)
		end

		blackboard.call_stormfiend_positions = call_stormfiend_positions
	else
		print("Grey seer: Found no call stormfiend positions")
	end
end

AiBreedSnippets.on_grey_seer_update = function (unit, blackboard, t)
	local breed = blackboard.breed
	local mounted_data = blackboard.mounted_data
	local health_extension = ScriptUnit.extension(blackboard.unit, "health_system")
	local hp = health_extension:current_health_percent()
	local hit_reaction_extension = blackboard.hit_reaction_extension
	local position = POSITION_LOOKUP[unit]
	local current_phase = blackboard.current_phase
	local mount_unit = mounted_data.mount_unit
	local network_manager = Managers.state.network
	local game = network_manager:game()
	local go_id = Managers.state.unit_storage:go_id(unit)
	local network_transmit = network_manager.network_transmit
	local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")

	if blackboard.intro_timer or current_phase == 6 then
		return
	end

	if blackboard.current_phase ~= 5 and blackboard.death_sequence then
		blackboard.current_phase = 5

		local event_data = FrameTable.alloc_table()

		dialogue_input:trigger_networked_dialogue_event("egs_death_scene", event_data)

		blackboard.face_player_when_teleporting = true
		blackboard.death_sequence = nil

		local strictly_not_close_to_players = true
		local silent = true
		local composition_type = "skittergate_grey_seer_trickle"
		local limit_spawners, terror_event_id
		local conflict_director = Managers.state.conflict
		local side = blackboard.side
		local side_id = side.side_id

		conflict_director.horde_spawner:execute_event_horde(t, terror_event_id, side_id, composition_type, limit_spawners, silent, nil, strictly_not_close_to_players)
	elseif current_phase == 2 and hp < 0.5 then
		blackboard.current_phase = 3
	elseif current_phase == 1 and hp < 0.75 then
		blackboard.current_phase = 2
	end

	if not HEALTH_ALIVE[mount_unit] and blackboard.current_phase ~= 5 and blackboard.current_phase ~= 6 then
		if blackboard.current_phase ~= 4 then
			local event_data = FrameTable.alloc_table()

			dialogue_input:trigger_networked_dialogue_event("egs_stormfiend_dead", event_data)
		end

		blackboard.current_phase = 4
		blackboard.knocked_off_mount = true
		blackboard.call_stormfiend = nil
		blackboard.about_to_mount = nil
		blackboard.should_mount_unit = nil
	end

	if blackboard.unlink_unit then
		blackboard.unlink_unit = nil

		local mount_blackboard = mount_unit and BLACKBOARDS[mount_unit]

		if mount_blackboard then
			mount_blackboard.linked_unit = nil
		end

		blackboard.quick_teleport_timer = t + 10
		blackboard.quick_teleport = nil
		blackboard.hp_at_knocked_off = hp

		local game = Managers.state.network:game()
		local mount_go_id = Managers.state.unit_storage:go_id(mount_unit)

		if game and mount_go_id then
			GameSession.set_game_object_field(game, mount_go_id, "animation_synced_unit_id", 0)
		end
	end

	local call_mount_hp_threshold = 0.25

	if mounted_data.knocked_off_mounted_timer and blackboard.hp_at_knocked_off and call_mount_hp_threshold <= blackboard.hp_at_knocked_off - hp then
		mounted_data.knocked_off_mounted_timer = t
	end

	if blackboard.knocked_off_mount and HEALTH_ALIVE[mount_unit] then
		local mount_blackboard = BLACKBOARDS[mount_unit]
		local mounted_timer_finished = mounted_data.knocked_off_mounted_timer and t >= mounted_data.knocked_off_mounted_timer
		local should_call_stormfiend = not blackboard.call_stormfiend and not mount_blackboard.intro_rage and mounted_timer_finished and not mount_blackboard.goal_position and not mount_blackboard.anim_cb_move

		if should_call_stormfiend then
			blackboard.call_stormfiend = true
		elseif mounted_timer_finished then
			blackboard.about_to_mount = true

			local mount_unit_position = POSITION_LOOKUP[mount_unit]
			local distance_to_goal = Vector3.distance(position, mount_unit_position)

			if distance_to_goal < 2 then
				blackboard.knocked_off_mount = nil
				blackboard.should_mount_unit = true
				blackboard.ready_to_summon = nil
				blackboard.about_to_mount = nil
				blackboard.call_stormfiend = nil
				mount_blackboard.should_mount_unit = true

				local health_extension = ScriptUnit.extension(mount_unit, "health_system")
				local mount_hp = health_extension:current_health_percent()

				mount_blackboard.hp_at_mounted = mount_hp
			end
		end
	end

	if blackboard.trickle_timer and t > blackboard.trickle_timer and not blackboard.defensive_mode_duration and current_phase < 4 then
		local conflict_director = Managers.state.conflict
		local timer = hp * 12

		if blackboard.knocked_off_mount or not HEALTH_ALIVE[mount_unit] then
			timer = timer * 0.5
		end

		if conflict_director:count_units_by_breed("skaven_slave") < 4 then
			local strictly_not_close_to_players = true
			local silent = true
			local composition_type = "skittergate_grey_seer_trickle"
			local limit_spawners, terror_event_id
			local side = blackboard.side
			local side_id = side.side_id

			conflict_director.horde_spawner:execute_event_horde(t, terror_event_id, side_id, composition_type, limit_spawners, silent, nil, strictly_not_close_to_players)

			blackboard.trickle_timer = t + timer
		else
			blackboard.trickle_timer = t + timer
		end
	end

	if blackboard.missile_bot_threat_unit then
		local bot_threat_position = POSITION_LOOKUP[blackboard.missile_bot_threat_unit]
		local radius = 2
		local height = 1
		local half_height = height * 0.5
		local size = Vector3(radius, half_height, radius)

		bot_threat_position = bot_threat_position - Vector3.up() * half_height

		Managers.state.entity:system("ai_bot_group_system"):aoe_threat_created(bot_threat_position, "cylinder", size, nil, 1)

		blackboard.missile_bot_threat_unit = nil
	end
end

AiBreedSnippets.on_grey_seer_death = function (unit, blackboard, t)
	local conflict_director = Managers.state.conflict

	conflict_director:remove_unit_from_bosses(unit)

	local t = Managers.time:time("game")

	Managers.state.conflict.specials_pacing:delay_spawning(t, 120, 20, true)

	if blackboard.is_angry then
		conflict_director:add_angry_boss(-1)
	end

	AiBreedSnippets.drop_loot(3, Vector3(-308, -364, -126), true, unit)
end

AiBreedSnippets.on_grey_seer_despawn = function (unit, blackboard, t)
	local conflict_director = Managers.state.conflict

	conflict_director:remove_unit_from_bosses(unit)

	if blackboard.is_angry then
		conflict_director:add_angry_boss(-1)
	end
end

AiBreedSnippets.on_gutter_runner_spawn = function (unit, blackboard)
	local t = Managers.time:time("game")

	blackboard.initial_pounce_timer = t + math.random(2, 3)

	Managers.state.entity:system("surrounding_aware_system"):add_system_event(unit, "heard_enemy", DialogueSettings.enemies_distant_distance, "enemy_tag", "skaven_gutter_runner")
end

AiBreedSnippets.update_enemy_sighting_within_commander_sticky = function (blackboard)
	local units_in_combat = blackboard.commander_extension:controlled_units_in_combat()
	local within_commander_range = false

	repeat
		if not HEALTH_ALIVE[blackboard.target_unit] then
			break
		end

		if blackboard.override_target_selection_name or blackboard.ability_spawned then
			within_commander_range = true

			break
		end

		if HEALTH_ALIVE[blackboard.commander_target] then
			within_commander_range = true

			break
		end

		blackboard.commander_target = nil

		if blackboard.stick_to_enemy_t then
			local t = Managers.time:time("game")

			if t < blackboard.stick_to_enemy_t then
				within_commander_range = true

				break
			else
				blackboard.stick_to_enemy_t = nil
			end
		end

		if blackboard.attack_token or blackboard.keep_target then
			within_commander_range = true

			break
		end

		local detection_source_pos = blackboard.detection_source_pos:unbox()
		local distance_sq = Vector3.distance_squared(detection_source_pos, POSITION_LOOKUP[blackboard.target_unit])
		local padding = 1
		local detection_radius = blackboard.detection_radius + padding

		if distance_sq < detection_radius * detection_radius then
			within_commander_range = true
		end
	until true

	blackboard.target_unit = within_commander_range and blackboard.target_unit or nil
	blackboard.confirmed_enemy_sighting_within_commander = within_commander_range

	blackboard.commander_extension:set_in_combat(blackboard.unit, within_commander_range)

	local commanded_aggro_sound = blackboard.breed.commanded_unit_aggro_sound

	if commanded_aggro_sound then
		local t = Managers.time:time("game")

		blackboard.last_in_combat_t = blackboard.last_in_combat_t or t

		local required_time_out_of_combat = 2

		if blackboard.target_unit and blackboard.command_state ~= CommandStates.Attacking and t > blackboard.last_in_combat_t + required_time_out_of_combat then
			Managers.state.entity:system("dialogue_system"):trigger_general_unit_event(blackboard.unit, commanded_aggro_sound)
		end

		blackboard.last_in_combat_t = blackboard.target_unit and t or blackboard.last_in_combat_t
	end
end

DLCUtils.require_list("ai_breed_snippets_file_names")
