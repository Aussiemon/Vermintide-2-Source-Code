EnemyPackageLoaderSettings = EnemyPackageLoaderSettings or {}
EnemyPackageLoaderSettings.policy = "default"
EnemyPackageLoaderSettings.unload_startup_packages_between_levels = false
EnemyPackageLoaderSettings.breed_path = "resource_packages/breeds/"
EnemyPackageLoaderSettings.categories = {
	{
		id = "bosses",
		dynamic_loading = false,
		limit = math.huge,
		breeds = {
			"chaos_spawn",
			"chaos_troll",
			"skaven_rat_ogre",
			"skaven_stormfiend"
		}
	},
	{
		id = "specials",
		dynamic_loading = false,
		limit = math.huge,
		breeds = {
			"chaos_plague_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"skaven_ratling_gunner",
			"skaven_warpfire_thrower",
			"chaos_vortex_sorcerer"
		}
	},
	{
		id = "level_specific",
		dynamic_loading = true,
		limit = math.huge,
		breeds = {
			"chaos_dummy_sorcerer",
			"chaos_exalted_champion_warcamp",
			"chaos_exalted_sorcerer",
			"skaven_storm_vermin_warlord",
			"skaven_storm_vermin_champion",
			"chaos_plague_wave_spawner",
			"skaven_stormfiend_boss",
			"skaven_grey_seer"
		}
	},
	{
		id = "debug",
		dynamic_loading = true,
		forbidden_in_build = "release",
		limit = math.huge,
		breeds = {
			"chaos_zombie",
			"chaos_tentacle",
			"chaos_tentacle_sorcerer",
			"pet_rat",
			"pet_pig",
			"skaven_stormfiend_demo"
		}
	},
	{
		id = "always_loaded",
		dynamic_loading = false,
		breeds = {
			"chaos_berzerker",
			"chaos_fanatic",
			"chaos_marauder",
			"chaos_raider",
			"chaos_warrior",
			"skaven_clan_rat",
			"skaven_storm_vermin",
			"skaven_storm_vermin_with_shield",
			"skaven_slave",
			"skaven_loot_rat",
			"chaos_marauder_with_shield",
			"skaven_clan_rat_with_shield",
			"skaven_plague_monk",
			"chaos_vortex",
			"critter_rat",
			"critter_pig"
		}
	}
}
local category_changes = nil

if PLATFORM == "xb1" or PLATFORM == "ps4" or script_data.enemy_package_loader_policy == "console" then
	EnemyPackageLoaderSettings.policy = "console"
	EnemyPackageLoaderSettings.unload_startup_packages_between_levels = true
	category_changes = {
		bosses = {
			limit = 1,
			dynamic_loading = true
		},
		specials = {
			limit = 3,
			dynamic_loading = true
		},
		level_specific = {
			dynamic_loading = true,
			limit = math.huge
		},
		debug = {
			forbidden_in_build = "release",
			dynamic_loading = true,
			limit = math.huge
		}
	}
end

print("enemy_package_loader_policy:", EnemyPackageLoaderSettings.policy)

if category_changes then
	local categories = EnemyPackageLoaderSettings.categories

	for i = 1, #categories, 1 do
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
	chaos_marauder_with_shield = "chaos_marauder_with_shield_opt",
	chaos_raider = "chaos_raider_opt",
	chaos_fanatic = "chaos_fanatic_opt",
	skaven_slave = "skaven_slave_opt",
	chaos_berzerker = "chaos_berzerker_opt",
	skaven_clan_rat_with_shield = "skaven_clan_rat_with_shield_opt",
	skaven_clan_rat = "skaven_clan_rat_opt",
	chaos_marauder = "chaos_marauder_opt"
}
EnemyPackageLoaderSettings.alias_to_breed = {
	chaos_raider_tutorial = "chaos_raider",
	chaos_dummy_troll = "chaos_troll",
	skaven_dummy_slave = "skaven_slave",
	chaos_exalted_champion_norsca = "chaos_exalted_champion_warcamp",
	chaos_marauder_tutorial = "chaos_marauder",
	skaven_storm_vermin_commander = "skaven_storm_vermin",
	chaos_spawn_exalted_champion_norsca = "chaos_spawn",
	skaven_clan_rat_tutorial = "skaven_clan_rat",
	skaven_dummy_clan_rat = "skaven_clan_rat"
}
EnemyPackageLoaderSettings.breed_to_aliases = {}
local alias_to_breed = EnemyPackageLoaderSettings.alias_to_breed
local breed_to_aliases = EnemyPackageLoaderSettings.breed_to_aliases

for alias, breed_name in pairs(alias_to_breed) do
	if not breed_to_aliases[breed_name] then
		breed_to_aliases[breed_name] = {}
	end

	local aliases = breed_to_aliases[breed_name]
	aliases[#aliases + 1] = alias
end

return
