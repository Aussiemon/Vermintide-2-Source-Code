local mutator_settings = require("scripts/settings/mutator_settings")

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

local function default_start_function_server(context, data)
	local template = data.template
	local remove_pickup_settings = template.remove_pickups

	if remove_pickup_settings then
		local pickup_types = {}

		for i = 1, #remove_pickup_settings, 1 do
			local pickup_type = remove_pickup_settings[i]
			pickup_types[pickup_type] = true
		end

		local pickup_units = Managers.state.entity:get_entities("PickupUnitExtension")

		for unit, extension in pairs(pickup_units) do
			local pickup_settings = extension:get_pickup_settings()

			if pickup_types.all or pickup_types[pickup_settings.type] then
				Managers.state.unit_spawner:mark_for_deletion(unit)
			end
		end
	end
end

local function default_stop_function_server(context, data)
	modify_breed_health_stop(context, data)
end

local function default_ai_killed_function_server(context, data, killed_unit, killer_unit)
	return
end

local function default_start_function_client(context, data)
	return
end

local function default_stop_function_client(context, data)
	return
end

local function default_ai_killed_function_client(context, data, killed_unit, killer_unit)
	return
end

local function default_initialize_function_server(context, data)
	modify_breed_health_start(context, data)
end

MutatorTemplates = {}

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

	if template.server_ai_killed_function then
		local function ai_killed_function(context, data, killed_unit, killer_unit)
			default_ai_killed_function_server(context, data, killed_unit, killer_unit)
			template.server_ai_killed_function(context, data, killed_unit, killer_unit)
		end

		template.server.ai_killed_function = ai_killed_function
	else
		template.server.ai_killed_function = default_ai_killed_function_server
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

	if template.client_ai_killed_function then
		local function ai_killed_function(context, data, killed_unit, killer_unit)
			default_ai_killed_function_client(context, data, killed_unit, killer_unit)
			template.client_ai_killed_function(context, data, killed_unit, killer_unit)
		end

		template.client.ai_killed_function = ai_killed_function
	else
		template.client.ai_killed_function = default_ai_killed_function_client
	end

	if template.server_update_function then
		template.server.update = template.server_update_function
	end

	if template.client_update_function then
		template.client.update = template.client_update_function
	end

	MutatorTemplates[name] = template
end

return
