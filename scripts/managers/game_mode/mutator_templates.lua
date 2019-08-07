local mutator_settings = local_require("scripts/settings/mutator_settings")

local function modify_breed_health_start(context, data)
	local template = data.template
	local modify_health_breeds = template.modify_health_breeds

	if modify_health_breeds then
		local health_modifier = template.health_modifier
		local vanilla_breed_health = {}

		for _, breed_name in ipairs(modify_health_breeds) do
			local breed = Breeds[breed_name]
			local max_health = breed.max_health
			vanilla_breed_health[breed_name] = table.clone(max_health)

			for i, health in ipairs(max_health) do
				max_health[i] = health * health_modifier
			end
		end

		data.vanilla_breed_health = vanilla_breed_health
	end
end

local function modify_breed_health_stop(context, data)
	if data.vanilla_breed_health then
		for breed_name, max_health in pairs(data.vanilla_breed_health) do
			Breeds[breed_name].max_health = max_health
		end
	end
end

local function modify_breed_armor_category_start(context, data)
	local template = data.template
	local modify_primary_armor_category_breeds = template.modify_primary_armor_category_breeds

	if modify_primary_armor_category_breeds then
		local primary_armor_category = template.primary_armor_category
		local vanilla_breed_primary_armor_category = {}

		for _, breed_name in ipairs(modify_primary_armor_category_breeds) do
			local breed = Breeds[breed_name]
			local old_primary_armor_category = breed.primary_armor_category

			if old_primary_armor_category then
				vanilla_breed_primary_armor_category[breed_name] = old_primary_armor_category
			else
				vanilla_breed_primary_armor_category[breed_name] = false
			end

			breed.primary_armor_category = primary_armor_category
		end

		if not data.vanilla_breed_primary_armor_category then
			data.vanilla_breed_primary_armor_category = vanilla_breed_primary_armor_category
		end
	end
end

local function modify_breed_armor_category_stop(context, data)
	if data.vanilla_breed_primary_armor_category then
		for breed_name, primary_armor_category in pairs(data.vanilla_breed_primary_armor_category) do
			if primary_armor_category then
				Breeds[breed_name].primary_armor_category = primary_armor_category
			else
				Breeds[breed_name].primary_armor_category = nil
			end
		end
	end
end

local function modify_breed_primary_armor_category_start(context, data)
	local template = data.template
	local modify_armor_category_breeds = template.modify_armor_category_breeds

	if modify_armor_category_breeds then
		local armor_category = template.armor_category
		local vanilla_breed_armor_category = {}

		for _, breed_name in ipairs(modify_armor_category_breeds) do
			local breed = Breeds[breed_name]
			local old_armor_category = breed.armor_category

			if old_armor_category then
				vanilla_breed_armor_category[breed_name] = old_armor_category
				breed.armor_category = armor_category
			end
		end

		if not data.vanilla_breed_armor_category then
			data.vanilla_breed_armor_category = vanilla_breed_armor_category
		end
	end
end

local function modify_breed_primary_armor_category_stop(context, data)
	if data.vanilla_breed_armor_category then
		for breed_name, armor_category in pairs(data.vanilla_breed_armor_category) do
			Breeds[breed_name].armor_category = armor_category
		end
	end
end

local function default_start_function_server(context, data)
	local template = data.template
	local remove_pickup_settings = template.remove_pickups

	if remove_pickup_settings then
		local pickup_types = {}

		for i = 1, #remove_pickup_settings, 1 do
			local pickup_type = remove_pickup_settings[i]
			pickup_types[pickup_type] = true
		end

		local excluded_pickup_item_names = template.excluded_pickup_item_names
		local pickup_units = Managers.state.entity:get_entities("PickupUnitExtension")

		for unit, extension in pairs(pickup_units) do
			local pickup_settings = extension:get_pickup_settings()
			local is_excluded = excluded_pickup_item_names and excluded_pickup_item_names[pickup_settings.item_name]

			if (not is_excluded and pickup_types.all) or pickup_types[pickup_settings.type] then
				Managers.state.unit_spawner:mark_for_deletion(unit)
			end
		end
	end
end

local function default_stop_function_server(context, data)
	modify_breed_health_stop(context, data)
	modify_breed_armor_category_stop(context, data)
	modify_breed_primary_armor_category_stop(context, data)
end

local function default_hot_join_sync_function_server(context, data, peer_id)
	return
end

local function default_ai_killed_function_server(context, data, killed_unit, killer_unit, death_data, killing_blow)
	return
end

local function default_level_object_killed_function_server(context, data, killed_unit, killing_blow)
	return
end

local function default_ai_hit_by_player_function_server(context, data, hit_unit, attacking_unit, attack_data)
	return
end

local function default_player_hit_function_server(context, data, hit_unit, attacking_unit, attack_data)
	return
end

local function default_player_respawned_function_server(context, data, spawned_unit)
	return
end

local function default_damage_taken_function_server(context, data, attacked_unit, attacker_unit, damage, damage_source, damage_type)
	return
end

local function default_ai_spawned_function_server(context, data, spawned_unit)
	return
end

local function default_start_function_client(context, data)
	modify_breed_armor_category_start(context, data)
	modify_breed_primary_armor_category_start(context, data)
end

local function default_stop_function_client(context, data)
	modify_breed_armor_category_stop(context, data)
	modify_breed_primary_armor_category_stop(context, data)
end

local function default_hot_join_sync_function_client(context, data, peer_id)
	return
end

local function default_ai_killed_function_client(context, data, killed_unit, killer_unit, death_data, killing_blow)
	return
end

local function default_level_object_killed_function_client(context, data, killed_unit, killing_blow)
	return
end

local function default_ai_hit_by_player_function_client(context, data, hit_unit, attacking_unit, attack_data)
	return
end

local function default_player_hit_function_client(context, data, hit_unit, attacking_unit, attack_data)
	return
end

local function default_player_respawned_function_client(context, data, spawned_unit)
	return
end

local function default_damage_taken_function_client(context, data, attacked_unit, attacker_unit, damage, damage_source, damage_type)
	return
end

local function default_ai_spawned_function_client(context, data, spawned_unit)
	return
end

local function default_server_players_left_safe_zone(context, data)
	return
end

local function default_initialize_function_server(context, data)
	modify_breed_health_start(context, data)
	modify_breed_armor_category_start(context, data)
	modify_breed_primary_armor_category_start(context, data)
end

MutatorTemplates = MutatorTemplates or {}

for name, template in pairs(mutator_settings) do
	template.name = name
	template.server = {}
	template.client = {}

	if template.check_dependencies then
		local all_good = template.check_dependencies()

		fassert(all_good, "Mutator (%s) failed dependency check! :(", name)
	end

	if template.server_initialize_function then
		local function initialize_function(context, data)
			default_initialize_function_server(context, data)
			template.server_initialize_function(context, data)
		end

		template.server.initialize_function = initialize_function
	else
		template.server.initialize_function = default_initialize_function_server
	end

	if template.server_start_function then
		local function start_function(context, data)
			default_start_function_server(context, data)
			template.server_start_function(context, data)
		end

		template.server.start_function = start_function
	else
		template.server.start_function = default_start_function_server
	end

	if template.server_stop_function then
		local function stop_function(context, data)
			default_stop_function_server(context, data)
			template.server_stop_function(context, data)
		end

		template.server.stop_function = stop_function
	else
		template.server.stop_function = default_stop_function_server
	end

	if template.server_hot_join_sync then
		local function hot_join_sync_function(context, data, peer_id)
			default_hot_join_sync_function_server(context, data, peer_id)
			template.server_hot_join_sync(context, data, peer_id)
		end

		template.server.hot_join_sync_function = hot_join_sync_function
	else
		template.server.hot_join_sync_function = default_hot_join_sync_function_server
	end

	if template.server_ai_killed_function then
		local function ai_killed_function(context, data, killed_unit, killer_unit, death_data, killing_blow)
			default_ai_killed_function_server(context, data, killed_unit, killer_unit, death_data, killing_blow)
			template.server_ai_killed_function(context, data, killed_unit, killer_unit, death_data, killing_blow)
		end

		template.server.ai_killed_function = ai_killed_function
	else
		template.server.ai_killed_function = default_ai_killed_function_server
	end

	if template.server_level_object_killed_function then
		local function level_object_killed_function(context, data, killed_unit, killer_unit, death_data, killing_blow)
			default_level_object_killed_function_server(context, data, killed_unit, killer_unit, death_data, killing_blow)
			template.server_level_object_killed_function(context, data, killed_unit, killer_unit, death_data, killing_blow)
		end

		template.server.level_object_killed_function = level_object_killed_function
	else
		template.server.level_object_killed_function = default_level_object_killed_function_server
	end

	if template.server_ai_hit_by_player_function then
		local function ai_hit_by_player_function(context, data, hit_unit, attacking_unit, attack_data)
			default_ai_hit_by_player_function_server(context, data, hit_unit, attacking_unit, attack_data)
			template.server_ai_hit_by_player_function(context, data, hit_unit, attacking_unit, attack_data)
		end

		template.server.ai_hit_by_player_function = ai_hit_by_player_function
	else
		template.server.ai_hit_by_player_function = default_ai_hit_by_player_function_server
	end

	if template.server_player_hit_function then
		local function player_hit_function(context, data, hit_unit, attacking_unit, attack_data)
			default_player_hit_function_server(context, data, hit_unit, attacking_unit, attack_data)
			template.server_player_hit_function(context, data, hit_unit, attacking_unit, attack_data)
		end

		template.server.player_hit_function = player_hit_function
	else
		template.server.player_hit_function = default_player_hit_function_server
	end

	if template.server_player_respawned_function then
		local function player_respawned_function(context, data, spawned_unit)
			default_player_respawned_function_server(context, data, spawned_unit)
			template.server_player_respawned_function(context, data, spawned_unit)
		end

		template.server.player_respawned_function = player_respawned_function
	else
		template.server.player_respawned_function = default_player_respawned_function_server
	end

	if template.server_damage_taken_function then
		local function damage_taken_function(context, data, attacked_unit, attacker_unit, damage, damage_source, damage_type)
			default_damage_taken_function_server(context, data, attacked_unit, attacker_unit, damage, damage_source, damage_type)
			template.server_damage_taken_function(context, data, attacked_unit, attacker_unit, damage, damage_source, damage_type)
		end

		template.server.damage_taken_function = damage_taken_function
	else
		template.server.damage_taken_function = default_damage_taken_function_server
	end

	if template.server_ai_spawned_function then
		local function ai_spawned_function(context, data, spawned_unit)
			default_ai_spawned_function_server(context, data, spawned_unit)
			template.server_ai_spawned_function(context, data, spawned_unit)
		end

		template.server.ai_spawned_function = ai_spawned_function
	else
		template.server.ai_spawned_function = default_ai_spawned_function_server
	end

	if template.server_players_left_safe_zone then
		local function server_players_left_safe_zone(context, data)
			default_server_players_left_safe_zone(context, data)
			template.server_players_left_safe_zone(context, data)
		end

		template.server.server_players_left_safe_zone = server_players_left_safe_zone
	else
		template.server.server_players_left_safe_zone = default_server_players_left_safe_zone
	end

	if template.client_start_function then
		local function start_function(context, data)
			default_start_function_client(context, data)
			template.client_start_function(context, data)
		end

		template.client.start_function = start_function
	else
		template.client.start_function = default_start_function_client
	end

	if template.client_stop_function then
		local function stop_function(context, data)
			default_stop_function_client(context, data)
			template.client_stop_function(context, data)
		end

		template.client.stop_function = stop_function
	else
		template.client.stop_function = default_stop_function_client
	end

	if template.client_hot_join_sync then
		local function hot_join_sync_function(context, data, peer_id)
			default_hot_join_sync_function_client(context, data, peer_id)
			template.client_hot_join_sync(context, data, peer_id)
		end

		template.client.hot_join_sync_function = hot_join_sync_function
	else
		template.client.hot_join_sync_function = default_hot_join_sync_function_client
	end

	if template.client_ai_killed_function then
		local function ai_killed_function(context, data, killed_unit, killer_unit, killing_blow)
			default_ai_killed_function_client(context, data, killed_unit, killer_unit, killing_blow)
			template.client_ai_killed_function(context, data, killed_unit, killer_unit, killing_blow)
		end

		template.client.ai_killed_function = ai_killed_function
	else
		template.client.ai_killed_function = default_ai_killed_function_client
	end

	if template.client_level_object_killed_function then
		local function level_object_killed_function(context, data, killed_unit, killer_unit, killing_blow)
			default_level_object_killed_function_client(context, data, killed_unit, killer_unit, killing_blow)
			template.client_level_object_killed_function(context, data, killed_unit, killer_unit, killing_blow)
		end

		template.client.level_object_killed_function = level_object_killed_function
	else
		template.client.level_object_killed_function = default_level_object_killed_function_client
	end

	if template.client_ai_hit_by_player_function then
		local function ai_hit_by_player_function(context, data, hit_unit, attacking_unit, attack_data)
			default_ai_hit_by_player_function_client(context, data, hit_unit, attacking_unit, attack_data)
			template.client_ai_hit_by_player_function(context, data, hit_unit, attacking_unit, attack_data)
		end

		template.client.ai_hit_by_player_function = ai_hit_by_player_function
	else
		template.client.ai_hit_by_player_function = default_ai_hit_by_player_function_client
	end

	if template.client_player_hit_function then
		local function player_hit_function(context, data, hit_unit, attacking_unit, attack_data)
			default_player_hit_function_client(context, data, hit_unit, attacking_unit, attack_data)
			template.client_player_hit_function(context, data, hit_unit, attacking_unit, attack_data)
		end

		template.client.player_hit_function = player_hit_function
	else
		template.client.player_hit_function = default_player_hit_function_client
	end

	if template.client_player_respawned_function then
		local function player_respawned_function(context, data, spawned_unit)
			default_player_respawned_function_client(context, data, spawned_unit)
			template.client_player_respawned_function(context, data, spawned_unit)
		end

		template.client.player_respawned_function = player_respawned_function
	else
		template.client.player_respawned_function = default_player_respawned_function_client
	end

	if template.client_damage_taken_function then
		local function damage_taken_function(context, data, attacked_unit, attacker_unit, damage, damage_source, damage_type)
			default_damage_taken_function_client(context, data, attacked_unit, attacker_unit, damage, damage_source, damage_type)
			template.client_damage_taken_function(context, data, attacked_unit, attacker_unit, damage, damage_source, damage_type)
		end

		template.client.damage_taken_function = damage_taken_function
	else
		template.client.damage_taken_function = default_damage_taken_function_client
	end

	if template.client_ai_spawned_function then
		local function ai_spawned_function(context, data, spawned_unit)
			default_ai_spawned_function_client(context, data, spawned_unit)
			template.client_ai_spawned_function(context, data, spawned_unit)
		end

		template.client.ai_spawned_function = ai_spawned_function
	else
		template.client.ai_spawned_function = default_ai_spawned_function_client
	end

	if template.server_update_function then
		template.server.update = template.server_update_function
	end

	if template.client_update_function then
		template.client.update = template.client_update_function
	end

	if MutatorTemplates[name] then
		MutatorTemplates[name] = table.create_copy(MutatorTemplates[name], template)
	else
		MutatorTemplates[name] = template
	end
end

return
