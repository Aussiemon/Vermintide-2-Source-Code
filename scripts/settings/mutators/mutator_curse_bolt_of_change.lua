local base_lighting_strike = require("scripts/settings/mutators/mutator_lightning_strike")
local bolt_of_change = table.clone(base_lighting_strike)
local STOP_SPAWN_DISTANCE = 5
bolt_of_change.curse_package_name = "resource_packages/mutators/mutator_curse_bolt_of_change"
bolt_of_change.display_name = "curse_bolt_of_change_name"
bolt_of_change.description = "curse_bolt_of_change_desc"
bolt_of_change.icon = "deus_curse_tzeentch_01"
bolt_of_change.spawn_rate = 40
bolt_of_change.max_spawns = math.huge
local BOT_DAMAGE_MODIFIER = 0.3
local NORMAL = 2
local HARD = 3
local HARDER = 4
local HARDEST = 5
local CATACLYSM = 6
local difficulty_settings = {
	bolt_amount = {
		[NORMAL] = 1,
		[HARD] = 2,
		[HARDER] = 2,
		[HARDEST] = 2,
		[CATACLYSM] = 2
	},
	change_limit = {
		[NORMAL] = 1,
		[HARD] = 2,
		[HARDER] = 3,
		[HARDEST] = 3,
		[CATACLYSM] = 3
	}
}
local BOLT_EXPLOSION_SOUND_EVENT = "morris_bolt_of_change_laughter"
local breed_override = {
	chaos_warrior = {
		chance = 0.3,
		breed = "chaos_spawn"
	},
	beastmen_bestigor = {
		chance = 0.3,
		breed = "chaos_spawn"
	},
	skaven_slave = {
		chance = 0.005,
		breed = "critter_rat"
	}
}
local max_spawn_amounts = {
	chaos_spawn = 1
}
local max_specials = 2
local unchangeable_breeds = {
	chaos_troll = true,
	chaos_spawn_exalted_champion_warcamp = true,
	chaos_exalted_champion_warcamp = true,
	chaos_exalted_sorcerer = true,
	skaven_storm_vermin_warlord = true,
	pet_rat = true,
	chaos_exalted_champion_norsca = true,
	beastmen_minotaur = true,
	skaven_stormfiend = true,
	skaven_grey_seer = true,
	skaven_rat_ogre = true,
	pet_pig = true,
	chaos_spawn = true,
	chaos_exalted_sorcerer_drachenfels = true,
	skaven_stormfiend_boss = true,
	pet_wolf = true,
	skaven_storm_vermin_champion = true
}
local excluded_random_breeds = {
	chaos_spawn_exalted_champion_warcamp = true,
	chaos_exalted_champion_warcamp = true,
	chaos_exalted_sorcerer = true,
	beastmen_ungor = true,
	skaven_storm_vermin_warlord = true,
	pet_pig = true,
	pet_rat = true,
	chaos_exalted_champion_norsca = true,
	beastmen_minotaur = true,
	chaos_fanatic = true,
	skaven_slave = true,
	skaven_stormfiend = true,
	skaven_grey_seer = true,
	skaven_rat_ogre = true,
	chaos_troll = true,
	chaos_spawn = true,
	chaos_exalted_sorcerer_drachenfels = true,
	skaven_stormfiend_boss = true,
	pet_wolf = true,
	skaven_storm_vermin_champion = true
}

local function in_range_to_end(range, total_path_dist, conflict_director)
	local main_path_info = conflict_director.main_path_info
	local ahead_player_travel_dist = nil

	if not main_path_info.ahead_unit then
		ahead_player_travel_dist = 0
	else
		local ahead_player_info = conflict_director.main_path_player_info[main_path_info.ahead_unit]
		ahead_player_travel_dist = ahead_player_info.travel_dist
	end

	return ahead_player_travel_dist >= total_path_dist - range
end

bolt_of_change.server_start_function = function (context, data)
	data.seed = Managers.mechanism:get_level_seed("mutator")
	data.change_cooldown = 1
	data.spawn_delay = 0.25
	data.spawn_queue = {}
	data.spawned_units_data = {}
	data.explosion_template_name = "generic_mutator_explosion"

	data.cb_enemy_spawned_function = function (unit, breed, optional_data)
		local blackboard = BLACKBOARDS[unit]

		if not breed.special then
			blackboard.spawn_type = "horde"
			blackboard.spawning_finished = true
		end

		local unit_data = {
			unit = unit,
			breed_name = breed.name
		}

		table.insert(data.spawned_units_data, unit_data)
	end

	base_lighting_strike.server_start_function(context, data)

	data.lighting_strike_callback = callback(data.template, "cb_on_explode", data)
	data.explosion_template = ExplosionTemplates.bolt_of_change
	data.decal_unit_name = "units/decals/deus_decal_aoe_bluefire_02"
	data.follow_time = data.explosion_template.follow_time
	data.time_to_explode = data.explosion_template.time_to_explode
	data.extension_init_data = {
		area_damage_system = {
			explosion_template_name = "bolt_of_change"
		}
	}
	data.all_available_breeds = {}
	data.available_breeds = {
		skaven = {},
		chaos = {},
		beastmen = {},
		undead = {},
		critter = {}
	}
	data.difficulty_rank = Managers.state.difficulty:get_difficulty_rank()

	data.template.populate_available_breeds(context, data)
end

bolt_of_change.server_stop_function = function (context, data)
	local unit_spawner = Managers.state.unit_spawner

	if #data.units > 0 and unit_spawner then
		for k, unit in ipairs(data.units) do
			if ALIVE[unit] then
				unit_spawner:mark_for_deletion(unit)

				data.units[k] = nil
			end
		end
	end
end

local function filter_respawning_players(players_array, player_manager, deus_run_controller)
	local filtered_array = {}

	for _, player_unit in ipairs(players_array) do
		local player = player_manager:unit_owner(player_unit)
		local peer_id = player.peer_id
		local local_player_id = player:local_player_id()
		local health_state = deus_run_controller:get_player_health_state(peer_id, local_player_id)

		if health_state ~= "respawning" then
			table.insert(filtered_array, player_unit)
		end
	end

	return filtered_array
end

bolt_of_change.spawn_lightning_strike_unit = function (data)
	local bolt_amount = difficulty_settings.bolt_amount[data.difficulty_rank] or 1
	local bolts_spawned = 0
	local side_manager = Managers.state.side
	local hero_side = side_manager:get_side_from_name("heroes")
	local players_array = table.clone(hero_side.PLAYER_UNITS)
	local deus_run_controller = Managers.mechanism:game_mechanism():get_deus_run_controller()
	local player_manager = Managers.player
	players_array = filter_respawning_players(players_array, player_manager, deus_run_controller)
	data.seed = table.shuffle(players_array, data.seed)

	table.clear(data.units)

	for _, player_unit in ipairs(players_array) do
		if bolt_amount <= bolts_spawned then
			break
		end

		data.extension_init_data.area_damage_system.follow_unit = player_unit
		local unit = Managers.state.unit_spawner:spawn_network_unit(data.decal_unit_name, "timed_explosion_unit", data.extension_init_data, Unit.local_position(player_unit, 0))
		local callback = data.lighting_strike_callback
		local timed_explosion_extension = ScriptUnit.has_extension(unit, "area_damage_system")

		if callback and timed_explosion_extension then
			timed_explosion_extension:add_on_explode_callback(callback)
		end

		local neutral_side = side_manager:get_side_from_name("neutral")
		local side_id = neutral_side.side_id

		side_manager:add_unit_to_side(unit, side_id)
		data.audio_system:play_audio_unit_event("Play_winds_heavens_gameplay_spawn", unit)

		data.units[#data.units + 1] = unit
		bolts_spawned = bolts_spawned + 1
		data.lock_played = false
		data.charge_played = false
		data.hit_played = false
	end

	if #players_array > 0 then
		local player_unit = players_array[1]
		local dialogue_input = ScriptUnit.extension_input(player_unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()

		dialogue_input:trigger_networked_dialogue_event("curse_danger_spotted", event_data)
	end
end

bolt_of_change.server_players_left_safe_zone = function (context, data)
	data.has_left_safe_zone = true
end

bolt_of_change.server_update_function = function (context, data, dt, t)
	if not data.has_left_safe_zone or global_is_inside_inn then
		return
	end

	local conflict_director = Managers.state.conflict
	local total_path_dist = MainPathUtils.total_path_dist()
	local in_end_area = in_range_to_end(STOP_SPAWN_DISTANCE, total_path_dist, conflict_director)

	if in_end_area then
		return
	end

	base_lighting_strike.server_update_function(context, data, dt, t)

	local delete_index = nil
	local spawn_queue = data.spawn_queue

	for i = 1, #spawn_queue do
		local spawn_queue_entry = spawn_queue[i]

		if spawn_queue_entry.spawn_at_t < t then
			local breed = spawn_queue_entry.breed
			local position_box = spawn_queue_entry.position_box
			local rotation_box = spawn_queue_entry.rotation_box
			local spawn_category = "mutator"
			local optional_data = {
				spawned_func = data.cb_enemy_spawned_function
			}

			Managers.state.conflict:spawn_queued_unit(breed, position_box, rotation_box, spawn_category, nil, "terror_event", optional_data)

			delete_index = i

			break
		end
	end

	if delete_index then
		table.swap_delete(spawn_queue, delete_index)
	end

	local spawned_units_data = data.spawned_units_data

	for i = #spawned_units_data, 1, -1 do
		local unit = spawned_units_data[i].unit

		if not HEALTH_ALIVE[unit] then
			table.swap_delete(spawned_units_data, i)
		end
	end
end

bolt_of_change.modify_player_base_damage = function (context, data, damaged_unit, attacker_unit, damage, damage_type)
	local player = Managers.player:owner(damaged_unit)
	local is_bot = player and player.bot_player

	if is_bot then
		return damage * BOT_DAMAGE_MODIFIER
	else
		return damage
	end
end

bolt_of_change.populate_available_breeds = function (context, data)
	local difficulty = Managers.state.difficulty:get_difficulty()
	local contained_breeds = CurrentConflictSettings.contained_breeds[difficulty]
	local available_breeds = data.available_breeds

	for breed_name, _ in pairs(contained_breeds) do
		local race = nil

		if CHAOS[breed_name] then
			race = "chaos"
		elseif SKAVEN[breed_name] then
			race = "skaven"
		elseif BEASTMEN[breed_name] then
			race = "beastmen"
		elseif CRITTER[breed_name] then
			race = "critter"
		end

		if race then
			data.all_available_breeds[breed_name] = true
			available_breeds[race][breed_name] = true
		end
	end

	table.merge_recursive(data.all_available_breeds, CRITTER)
	table.merge_recursive(available_breeds.critter, CRITTER)
end

bolt_of_change.cb_on_explode = function (template, data, explosion_template_name, position)
	local explosion_template = ExplosionTemplates[explosion_template_name]
	local radius = explosion_template.explosion.radius
	local ai_in_range = {}

	AiUtils.broadphase_query(position, radius, ai_in_range)

	local change_limit = difficulty_settings.change_limit[data.difficulty_rank] or 1
	local units_queued_successfully = 0

	for _, ai_unit in ipairs(ai_in_range) do
		if change_limit <= units_queued_successfully then
			break
		end

		local success = template.change_ai(data, ai_unit)

		if success then
			units_queued_successfully = units_queued_successfully + 1
		end
	end

	local audio_system = Managers.state.entity:system("audio_system")

	audio_system:play_2d_audio_event(BOLT_EXPLOSION_SOUND_EVENT)
end

bolt_of_change.get_overridden_breed = function (data, maxed_out_breeds, breed_name)
	local override = breed_override[breed_name]

	if override then
		local override_breed = nil

		if override.chance then
			local random = nil
			data.seed, random = Math.next_random(data.seed)

			if random <= override.chance then
				override_breed = override.breed
			end
		else
			override_breed = override.breed
		end

		if maxed_out_breeds[override_breed] then
			return nil
		elseif data.all_available_breeds[override_breed] then
			return override_breed
		end
	end

	return nil
end

local function get_maxed_out_breeds(t)
	local maxed_breeds = {}
	local breeds_by_amount = {}

	for _, entry in ipairs(t) do
		local breed_name = entry.breed_name
		local max_amount = max_spawn_amounts[breed_name]

		if max_amount then
			local amount = breeds_by_amount[breed_name] or max_amount
			amount = amount - 1
			breeds_by_amount[breed_name] = amount

			if amount <= 0 then
				maxed_breeds[breed_name] = true
			end
		end
	end

	return maxed_breeds
end

local function filter_available_breeds(available_breeds, race, excluded_breeds)
	local filtered_breeds = {}

	for breed_name, _ in pairs(available_breeds[race]) do
		local included = not excluded_breeds[breed_name]

		if included then
			filtered_breeds[breed_name] = true
		end
	end

	return filtered_breeds
end

local function despawn_breed(ai_unit)
	local blackboard = BLACKBOARDS[ai_unit]
	local conflict_director = Managers.state.conflict

	conflict_director:destroy_unit(ai_unit, blackboard, "mutator")
end

local function table_next_random_value(seed, t)
	local num_entries = table.size(t)

	if num_entries > 0 then
		local new_seed, random_index = Math.next_random(seed, 1, num_entries)
		local table_keys = table.keys(t)
		local random_entry = table_keys[random_index]

		return new_seed, random_entry
	end

	return seed, nil
end

local function get_num_specials(conflict_director, spawn_queue)
	local specials_spawned_by_bolt = conflict_director:alive_specials_count()

	for _, spawn_queue_entry in ipairs(spawn_queue) do
		local breed = spawn_queue_entry.breed

		if breed.special then
			specials_spawned_by_bolt = specials_spawned_by_bolt + 1
		end
	end

	return specials_spawned_by_bolt
end

local function array_to_table(array)
	local new_table = {}

	for _, value in ipairs(array) do
		new_table[value] = true
	end

	return new_table
end

bolt_of_change.spawn_new_breed = function (data, ai_unit, new_breed)
	local nav_world = Managers.state.entity:system("ai_system"):nav_world()
	local spawn_queue = data.spawn_queue
	local blackboard = BLACKBOARDS[ai_unit]
	local position = POSITION_LOOKUP[ai_unit]

	if position then
		local explosion_template_name = data.explosion_template_name

		AiUtils.generic_mutator_explosion(ai_unit, blackboard, explosion_template_name)

		local projected_start_pos = LocomotionUtils.pos_on_mesh(nav_world, position, 1, 1)

		if not projected_start_pos then
			local new_projected_start_pos = GwNavQueries.inside_position_from_outside_position(nav_world, position, 6, 6, 8, 0.5)

			if new_projected_start_pos then
				projected_start_pos = new_projected_start_pos
			end
		end

		local time = Managers.time:time("game")
		local spawn_at_t = time + data.spawn_delay
		local rotation = Unit.local_rotation(ai_unit, 0)

		if projected_start_pos then
			local spawn_queue_entry = {
				breed = Breeds[new_breed],
				breed_name = new_breed,
				rotation_box = QuaternionBox(rotation),
				spawn_at_t = spawn_at_t,
				position_box = Vector3Box(projected_start_pos)
			}

			table.insert(spawn_queue, spawn_queue_entry)

			local can_change_at = time + data.change_cooldown

			Unit.set_data(ai_unit, "can_change_at", can_change_at)
		end
	end
end

bolt_of_change.change_ai = function (data, ai_unit)
	local time = Managers.time:time("game")
	local can_change_at = Unit.get_data(ai_unit, "can_change_at") or 0
	local change_cooldown_active = time <= can_change_at
	local breed = Unit.get_data(ai_unit, "breed")
	local unchangeable = unchangeable_breeds[breed.name]

	if change_cooldown_active or unchangeable then
		return
	end

	local excluded_breeds = table.clone(excluded_random_breeds)
	excluded_breeds[breed.name] = true
	local maxed_out_breeds = get_maxed_out_breeds(data.spawned_units_data)
	local maxed_out_breeds_queued = get_maxed_out_breeds(data.spawn_queue)

	table.merge(excluded_breeds, maxed_out_breeds_queued)
	table.merge(excluded_breeds, maxed_out_breeds)

	local num_specials = get_num_specials(Managers.state.conflict, data.spawn_queue)

	if max_specials <= num_specials then
		local special_breeds = array_to_table(CurrentSpecialsSettings.breeds)

		table.merge(excluded_breeds, special_breeds)
	end

	local race = breed.race
	local breeds = filter_available_breeds(data.available_breeds, race, excluded_breeds)
	local new_breed = nil
	data.seed, new_breed = table_next_random_value(data.seed, breeds)

	if new_breed then
		local template = data.template
		local override_breed = template.get_overridden_breed(data, maxed_out_breeds, breed.name)
		new_breed = override_breed or new_breed

		template.spawn_new_breed(data, ai_unit, new_breed)
		despawn_breed(ai_unit)

		return true
	else
		print("Bolt of Change: No available breed found.")

		return false
	end
end

bolt_of_change.server_player_hit_function = function (context, data, hit_unit, attacker_unit, hit_data)
	local damage_type = hit_data[2]

	if damage_type == "bolt_of_change" then
		local dialogue_input = ScriptUnit.extension_input(hit_unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()

		dialogue_input:trigger_dialogue_event("curse_damage_taken", event_data)
	end
end

return bolt_of_change
