-- chunkname: @scripts/settings/dlcs/penny/penny_ai_breed_snippets.lua

AiBreedSnippets = AiBreedSnippets or {}

local function check_for_recent_attackers_drachenfels(unit, blackboard, t, ranged_range)
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
				blackboard.recent_attacker_unit = attacking_unit
				blackboard.recent_attacker_timer = t + 3
				blackboard.recent_attacker = true

				local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
				local event_data = FrameTable.alloc_table()

				dialogue_input:trigger_networked_dialogue_event("ebh_retaliation_missile", event_data)
			elseif is_melee then
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

AiBreedSnippets.on_chaos_exalted_sorcerer_drachenfels_spawn = function (unit, blackboard)
	local t = Managers.time:time("game")
	local breed = blackboard.breed

	blackboard.next_move_check = 0
	blackboard.max_vortex_units = breed.max_vortex_units
	blackboard.done_casting_timer = 0
	blackboard.spawned_allies_wave = 0
	blackboard.recent_attacker_timer = 0
	blackboard.recent_melee_attacker_timer = 0
	blackboard.health_extension = ScriptUnit.extension(unit, "health_system")
	blackboard.num_portals_alive = 0
	blackboard.tentacle_portal_units = {}
	blackboard.ring_total_cooldown = 20
	blackboard.charge_total_cooldown = 20
	blackboard.teleport_total_cooldown = 10
	blackboard.ring_cooldown = 0
	blackboard.charge_cooldown = 0
	blackboard.ring_summonings_finished = 0
	blackboard.teleport_cooldown = 0
	blackboard.ready_to_summon = true
	blackboard.surrounding_players = 0
	blackboard.aggro_list = {}
	blackboard.ring_pulse_rate = 0
	blackboard.defensive_phase_duration = 0
	blackboard.defensive_phase_max_duration = 60

	local available_spells = breed.available_spells
	local spells, spells_lookup = {}, {}
	local physics_world = World.get_data(blackboard.world, "physics_world")
	local level_analysis = Managers.state.conflict.level_analysis
	local node_units = level_analysis.generic_ai_node_units.sorcerer_boss_drachenfels_center
	local center_unit = node_units[1]

	blackboard.no_kill_achievement = true
	blackboard.ring_center_position = Vector3Box(Unit.local_position(center_unit, 0))
	blackboard.spell_count = 0

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
			explosion_template_name = "chaos_drachenfels_strike_missile_impact",
			magic_missile = true,
			magic_missile_speed = 10,
			name = "magic_missile_ground",
			projectile_unit_name = "units/weapons/projectile/strike_missile_drachenfels/strike_missile_drachenfels",
			range = 40,
			target_ground = true,
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
			explosion_template_name = "chaos_slow_bomb_missile_new",
			life_time = 15,
			magic_missile = true,
			magic_missile_speed = 2.5,
			name = "seeking_bomb_missile",
			projectile_unit_name = "units/weapons/projectile/insect_swarm_missile_drachenfels/insect_swarm_missile_drachenfels_01",
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
	local center_node_units = level_analysis.generic_ai_node_units.sorcerer_boss_drachenfels_center
	local wall_node_units = level_analysis.generic_ai_node_units.sorcerer_boss_drachenfels_wall
	local level_has_boss_arena = center_node_units and wall_node_units and id_lookup.sorcerer_boss_drachenfels and id_lookup.sorcerer_boss_drachenfels_minion

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
		blackboard.intro_timer = t + 12.3

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

	local side = Managers.state.side:get_side_from_name("heroes")
	local player_units = side.PLAYER_AND_BOT_UNITS

	for _, player_unit in pairs(player_units) do
		local health_extension = ScriptUnit.extension(player_unit, "health_system")

		health_extension.is_invincible = true
	end

	blackboard.spells = spells
	blackboard.spells_lookup = spells_lookup

	local breed = blackboard.breed
	local audio_system_extension = Managers.state.entity:system("audio_system")

	if breed.teleport_sound_event then
		audio_system_extension:play_audio_unit_event(breed.teleport_sound_event, unit)
	end

	local conflict_director = Managers.state.conflict

	conflict_director:add_unit_to_bosses(unit)

	blackboard.is_valid_target_func = GenericStatusExtension.is_lord_target
end

local show_arena_extents = false

AiBreedSnippets.on_chaos_exalted_sorcerer_drachenfels_update = function (unit, blackboard, t, dt)
	check_for_recent_attackers_drachenfels(unit, blackboard, t, 10)

	if not blackboard.in_boss_arena then
		return
	end

	if blackboard.intro_timer then
		return
	end

	local side = Managers.state.side.side_by_unit[unit]
	local enemy_player_and_bot_positions = side.ENEMY_PLAYER_AND_BOT_POSITIONS
	local enemy_player_and_bot_units = side.ENEMY_PLAYER_AND_BOT_UNITS
	local num = 0
	local self_pos = POSITION_LOOKUP[unit]
	local range = BreedActions.chaos_exalted_sorcerer_drachenfels.retaliation_aoe.radius

	for i, position in ipairs(enemy_player_and_bot_positions) do
		local player_unit = enemy_player_and_bot_units[i]

		if range > Vector3.distance(self_pos, position) and not ScriptUnit.extension(player_unit, "status_system"):is_disabled() and not ScriptUnit.extension(player_unit, "status_system"):is_invisible() then
			num = num + 1
		end
	end

	blackboard.surrounding_players = num
	blackboard.ring_cooldown = math.max(blackboard.ring_cooldown - dt, 0)
	blackboard.charge_cooldown = math.max(blackboard.charge_cooldown - dt, 0)
	blackboard.teleport_cooldown = math.max(blackboard.teleport_cooldown - dt, 0)
	blackboard.defensive_phase_duration = math.max(blackboard.defensive_phase_duration - dt, 0)

	if show_arena_extents then
		local pose = blackboard.arena_pose_boxed:unbox()
		local half_extents = blackboard.arena_half_extents:unbox()

		QuickDrawer:box(pose, half_extents, Color(0, 255, 70))
	end

	if blackboard.missle_bot_threat_unit then
		local bot_threat_position = POSITION_LOOKUP[blackboard.missle_bot_threat_unit]
		local radius = 2
		local height = 1
		local half_height = height * 0.5
		local size = Vector3(0, radius, half_height)

		bot_threat_position = bot_threat_position - Vector3.up() * half_height

		Managers.state.entity:system("ai_bot_group_system"):aoe_threat_created(bot_threat_position, "cylinder", size, nil, 1)

		blackboard.missle_bot_threat_unit = nil
	end

	if blackboard.third_phase_in_progress and blackboard.current_health ~= 1 then
		if t > blackboard.ring_pulse_rate and not blackboard.ring_damage_effect_time then
			local origin_pos = Vector3Box.unbox(blackboard.ring_center_position)
			local premonition_time = 3

			blackboard.sorcerer_allow_tricke_spawn = false

			Managers.state.network:rpc_play_particle_effect_no_rotation(nil, NetworkLookup.effects["fx/drachenfels_boss_indicator_donut_medium_part_1"], NetworkConstants.invalid_game_object_id, 0, origin_pos, false)
			Managers.state.network:rpc_play_particle_effect_no_rotation(nil, NetworkLookup.effects["fx/drachenfels_boss_indicator_donut_large_part_1"], NetworkConstants.invalid_game_object_id, 0, origin_pos, false)

			blackboard.ring_damage_effect_time = t + premonition_time - 0.75
		elseif blackboard.ring_damage_effect_time and t >= blackboard.ring_damage_effect_time then
			local audio_system = Managers.state.entity:system("audio_system")
			local origin_pos = Vector3Box.unbox(blackboard.ring_center_position)
			local inner_radius = 8
			local outer_radius = 15
			local inner_squared = inner_radius * inner_radius
			local outer_squared = outer_radius * outer_radius
			local power_level = {
				cataclysm = 400,
				cataclysm_2 = 400,
				cataclysm_3 = 400,
				easy = 50,
				hard = 75,
				harder = 100,
				hardest = 150,
				normal = 50,
			}

			Managers.state.network:rpc_play_particle_effect_no_rotation(nil, NetworkLookup.effects["fx/drachenfels_boss_indicator_donut_medium_part_2"], NetworkConstants.invalid_game_object_id, 0, origin_pos, false)
			Managers.state.network:rpc_play_particle_effect_no_rotation(nil, NetworkLookup.effects["fx/drachenfels_boss_indicator_donut_large_part_2"], NetworkConstants.invalid_game_object_id, 0, origin_pos, false)
			audio_system:play_audio_position_event("Play_sorcerer_boss_special_ability_burn", origin_pos)

			local nearby_ais = {}
			local player_units = enemy_player_and_bot_units
			local catapult_strength = 7

			AiUtils.broadphase_query(origin_pos, outer_radius, nearby_ais)

			for _, hit_unit in ipairs(nearby_ais) do
				local position = POSITION_LOOKUP[hit_unit]
				local distance_squared = Vector3.distance_squared(position, origin_pos)

				if inner_squared < distance_squared and hit_unit ~= unit then
					local damage_profile_name = "frag_grenade"
					local damage_profile = DamageProfileTemplates[damage_profile_name]
					local difficulty_rank = Managers.state.difficulty:get_difficulty()
					local actual_power_level = power_level[difficulty_rank]

					DamageUtils.add_damage_network_player(damage_profile, nil, actual_power_level, hit_unit, unit, "torso", POSITION_LOOKUP[hit_unit], Vector3.up(), "undefined")
				end
			end

			for _, player_unit in ipairs(player_units) do
				local position = POSITION_LOOKUP[player_unit]
				local distance_squared = Vector3.distance_squared(position, origin_pos)
				local catapult_direction = "in"
				local direction = catapult_direction == "in" and origin_pos - position or position - origin_pos

				direction = Vector3.normalize(direction)

				if distance_squared < outer_squared and inner_squared < distance_squared then
					local damage_profile_name = "frag_grenade"
					local damage_profile = DamageProfileTemplates[damage_profile_name]
					local difficulty_rank = Managers.state.difficulty:get_difficulty()
					local player = Managers.player:owner(player_unit)
					local is_bot = player and not player:is_player_controlled()
					local actual_power_level = is_bot and 0 or power_level[difficulty_rank]

					DamageUtils.add_damage_network_player(damage_profile, nil, actual_power_level, player_unit, unit, "torso", POSITION_LOOKUP[player_unit], Vector3.up(), "undefined")

					if catapult_strength then
						StatusUtils.set_catapulted_network(player_unit, true, (direction + Vector3.up()) * catapult_strength)
					end

					blackboard.hit_by_eruptions = true
				end
			end

			blackboard.ring_damage_effect_time = nil
			blackboard.ring_pulse_rate = t + 8
			blackboard.sorcerer_allow_tricke_spawn = true
		end
	end
end

AiBreedSnippets.on_chaos_exalted_sorcerer_drachenfels_death = function (unit, blackboard)
	local conflict_director = Managers.state.conflict

	conflict_director:remove_unit_from_bosses(unit)

	local audio_system = Managers.state.entity:system("audio_system")

	audio_system:play_audio_unit_event("Play_sorcerer_boss_fly_stop", unit)

	local statistics_db = Managers.player:statistics_db()

	if blackboard.no_kill_achievement then
		local stat_name = "penny_castle_no_kill"
		local stat_name_index = NetworkLookup.statistics[stat_name]
		local local_player = Managers.player:local_player()
		local stats_id = local_player:stats_id()

		statistics_db:increment_stat(stats_id, stat_name)
		Managers.state.network.network_transmit:send_rpc_clients("rpc_increment_stat", stat_name_index)
	end

	if not blackboard.hit_by_eruptions then
		local stat_name = "penny_castle_eruptions"
		local stat_name_index = NetworkLookup.statistics[stat_name]
		local local_player = Managers.player:local_player()
		local stats_id = local_player:stats_id()

		statistics_db:increment_stat(stats_id, stat_name)
		Managers.state.network.network_transmit:send_rpc_clients("rpc_increment_stat", stat_name_index)
	end

	local t = Managers.time:time("game")

	Managers.state.conflict.specials_pacing:delay_spawning(t, 120, 20, true)

	if blackboard.is_angry then
		conflict_director:add_angry_boss(-1)
	end

	AiBreedSnippets.drop_loot(4, Vector3(14.959, 383.806, 31.202), true)
end

AiBreedSnippets.on_chaos_exalted_sorcerer_drachenfels_despawn = function (unit, blackboard)
	local conflict_director = Managers.state.conflict

	conflict_director:remove_unit_from_bosses(unit)

	if blackboard.is_angry then
		conflict_director:add_angry_boss(-1)
	end
end
