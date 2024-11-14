-- chunkname: @scripts/settings/enemy_package_loader_settings.lua

EnemyPackageLoaderSettings = EnemyPackageLoaderSettings or {}
EnemyPackageLoaderSettings.policy = "default"
EnemyPackageLoaderSettings.max_loaded_breed_cap = 35
EnemyPackageLoaderSettings.unload_startup_packages_between_levels = true
EnemyPackageLoaderSettings.breed_path = "resource_packages/breeds/"
EnemyPackageLoaderSettings.categories = {
	{
		dynamic_loading = false,
		id = "bosses",
		limit = math.huge,
		breeds = {
			"chaos_spawn",
			"chaos_troll",
			"skaven_rat_ogre",
			"skaven_stormfiend",
		},
	},
	{
		dynamic_loading = false,
		id = "specials",
		limit = math.huge,
		breeds = {
			"chaos_plague_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"skaven_ratling_gunner",
			"skaven_warpfire_thrower",
			"chaos_vortex_sorcerer",
		},
	},
	{
		dynamic_loading = true,
		id = "level_specific",
		limit = math.huge,
		breeds = {
			"chaos_dummy_sorcerer",
			"chaos_exalted_champion_warcamp",
			"chaos_exalted_sorcerer",
			"skaven_storm_vermin_warlord",
			"skaven_storm_vermin_champion",
			"chaos_plague_wave_spawner",
			"skaven_stormfiend_boss",
			"skaven_grey_seer",
			"training_dummy",
			"pet_skeleton",
			"pet_skeleton_with_shield",
			"pet_skeleton_dual_wield",
			"pet_skeleton_armored",
			"chaos_bulwark",
			"critter_nurgling",
		},
	},
	{
		dynamic_loading = true,
		forbidden_in_build = "release",
		id = "debug",
		limit = math.huge,
		breeds = {
			"chaos_zombie",
			"chaos_skeleton",
			"chaos_tentacle",
			"chaos_tentacle_sorcerer",
			"skaven_stormfiend_demo",
			"human_pleb",
			"human_soldier",
		},
	},
	{
		dynamic_loading = false,
		id = "always_loaded",
		breeds = {
			"chaos_vortex",
			"critter_rat",
			"critter_pig",
		},
	},
}

do
	local categories = EnemyPackageLoaderSettings.categories

	for dlc_name, dlc in pairs(DLCSettings) do
		local breed_categories = dlc.enemy_package_loader_breed_categories

		if breed_categories then
			for category_id, breeds_to_add in pairs(breed_categories) do
				local target_category

				for i = 1, #categories do
					local category = categories[i]

					if category.id == category_id then
						target_category = category

						break
					end
				end

				fassert(target_category ~= nil, "Couldn't find EnemeyPackageLoader category %s specified in DLC %s.", category_id, dlc_name)

				for i = 1, #categories do
					local category = categories[i]
					local breeds = category.breeds

					for j = 1, #breeds_to_add do
						local breed_to_add = breeds_to_add[j]

						for k = 1, #breeds do
							local breed = breeds[k]

							fassert(breed ~= breed_to_add, "Breed %s (DLC: %s) is already defined in category %s!", breed_to_add, dlc_name, category.id)
						end
					end
				end

				local target_breeds = target_category.breeds

				for i = 1, #breeds_to_add do
					local breed_to_add = breeds_to_add[i]

					target_breeds[#target_breeds + 1] = breed_to_add

					printf("[EnemyPackageLoaderSettings] Added DLC breed %s (DLC %s) to category %s.", breed_to_add, dlc_name, category_id)
				end
			end
		end
	end
end

local category_changes

if IS_CONSOLE or script_data.enemy_package_loader_policy == "console" then
	EnemyPackageLoaderSettings.policy = "console"
	EnemyPackageLoaderSettings.unload_startup_packages_between_levels = true
	EnemyPackageLoaderSettings.max_loaded_breed_cap = 35
	category_changes = {
		bosses = {
			dynamic_loading = true,
			limit = 1,
		},
		specials = {
			dynamic_loading = true,
			limit = 3,
			replacement_breed_override_funcs = {
				patrol = "_find_patrol_replacement",
			},
		},
		level_specific = {
			dynamic_loading = true,
			limit = math.huge,
		},
		debug = {
			dynamic_loading = true,
			forbidden_in_build = "release",
			limit = math.huge,
		},
	}
end

print("[EnemyPackageLoaderSettings] enemy_package_loader_policy:", EnemyPackageLoaderSettings.policy)

if category_changes then
	local categories = EnemyPackageLoaderSettings.categories

	for i = 1, #categories do
		local category = categories[i]
		local changes = category_changes[category.id]

		if changes then
			for key, value in pairs(changes) do
				category[key] = value
			end
		end
	end
end

EnemyPackageLoaderSettings.opt_lookup_breed_names = {
	chaos_berzerker = "chaos_berzerker_opt",
	chaos_fanatic = "chaos_fanatic_opt",
	chaos_marauder = "chaos_marauder_opt",
	chaos_marauder_with_shield = "chaos_marauder_with_shield_opt",
	chaos_raider = "chaos_raider_opt",
	skaven_clan_rat = "skaven_clan_rat_opt",
	skaven_clan_rat_with_shield = "skaven_clan_rat_with_shield_opt",
	skaven_slave = "skaven_slave_opt",
	skaven_storm_vermin = "skaven_storm_vermin_opt",
	skaven_storm_vermin_with_shield = "skaven_storm_vermin_with_shield_opt",
}
EnemyPackageLoaderSettings.alias_to_breed = {
	chaos_dummy_troll = "chaos_troll",
	chaos_exalted_champion_norsca = "chaos_exalted_champion_warcamp",
	chaos_marauder_tutorial = "chaos_marauder",
	chaos_raider_tutorial = "chaos_raider",
	chaos_spawn_exalted_champion_norsca = "chaos_spawn",
	skaven_clan_rat_tutorial = "skaven_clan_rat",
	skaven_dummy_clan_rat = "skaven_clan_rat",
	skaven_dummy_slave = "skaven_slave",
	skaven_storm_vermin_commander = "skaven_storm_vermin",
}
EnemyPackageLoaderSettings.breed_to_aliases = {}

for dlc_name, dlc in pairs(DLCSettings) do
	local dlc_alias_to_breed = dlc.alias_to_breed

	if dlc_alias_to_breed then
		for alias, breed_name in pairs(dlc_alias_to_breed) do
			EnemyPackageLoaderSettings.alias_to_breed[alias] = breed_name
		end
	end

	local dlc_opt_lookup_breed_names = dlc.opt_lookup_breed_names

	if dlc_opt_lookup_breed_names then
		for alias, breed_name in pairs(dlc_opt_lookup_breed_names) do
			EnemyPackageLoaderSettings.opt_lookup_breed_names[alias] = breed_name
		end
	end
end

local alias_to_breed = EnemyPackageLoaderSettings.alias_to_breed
local breed_to_aliases = EnemyPackageLoaderSettings.breed_to_aliases

for alias, breed_name in pairs(alias_to_breed) do
	if not breed_to_aliases[breed_name] then
		breed_to_aliases[breed_name] = {}
	end

	local aliases = breed_to_aliases[breed_name]

	aliases[#aliases + 1] = alias
end
