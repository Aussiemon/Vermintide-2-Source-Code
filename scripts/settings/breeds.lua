require("scripts/utils/benchmark/benchmark_handler")
require("scripts/unit_extensions/human/ai_player_unit/ai_utils")
require("scripts/managers/bot_nav_transition/bot_nav_transition_manager")
require("scripts/settings/player_unit_status_settings")
require("scripts/unit_extensions/human/ai_player_unit/debug_breeds/debug_globadier")
require("scripts/unit_extensions/human/ai_player_unit/debug_breeds/debug_gutter_runner")
require("scripts/settings/smartobject_settings")
require("scripts/settings/nav_tag_volume_settings")
require("foundation/scripts/util/table")
require("foundation/scripts/util/error")
require("scripts/unit_extensions/human/ai_player_unit/ai_breed_snippets")
require("scripts/settings/dlc_settings")
require("scripts/settings/player_bots_settings")

DEFAULT_BREED_AOE_HEIGHT = 1.5
DEFAULT_BREED_AOE_RADIUS = 0.3
Breeds = Breeds or {}
BreedActions = BreedActions or {}
BreedHitZonesLookup = BreedHitZonesLookup or {}

dofile("scripts/settings/breeds/breed_tweaks")
dofile("scripts/settings/breeds/breed_skaven_clan_rat")
dofile("scripts/settings/breeds/breed_skaven_clan_rat_with_shield")
dofile("scripts/settings/breeds/breed_skaven_dummy_clan_rat")
dofile("scripts/settings/breeds/breed_skaven_slave")
dofile("scripts/settings/breeds/breed_skaven_dummy_slave")
dofile("scripts/settings/breeds/breed_skaven_storm_vermin")
dofile("scripts/settings/breeds/breed_skaven_storm_vermin_champion")
dofile("scripts/settings/breeds/breed_skaven_storm_vermin_with_shield")
dofile("scripts/settings/breeds/breed_skaven_loot_rat")
dofile("scripts/settings/breeds/breed_skaven_gutter_runner")
dofile("scripts/settings/breeds/breed_skaven_plague_monk")
dofile("scripts/settings/breeds/breed_skaven_pack_master")
dofile("scripts/settings/breeds/breed_skaven_poison_wind_globadier")
dofile("scripts/settings/breeds/breed_skaven_ratling_gunner")
dofile("scripts/settings/breeds/breed_skaven_warpfire_thrower")
dofile("scripts/settings/breeds/breed_skaven_rat_ogre")
dofile("scripts/settings/breeds/breed_skaven_stormfiend")
dofile("scripts/settings/breeds/breed_skaven_stormfiend_demo")
dofile("scripts/settings/breeds/breed_chaos_marauder")
dofile("scripts/settings/breeds/breed_chaos_fanatic")
dofile("scripts/settings/breeds/breed_chaos_marauder_with_shield")
dofile("scripts/settings/breeds/breed_chaos_berzerker")
dofile("scripts/settings/breeds/breed_chaos_raider")
dofile("scripts/settings/breeds/breed_chaos_warrior")
dofile("scripts/settings/breeds/breed_chaos_troll")
dofile("scripts/settings/breeds/breed_chaos_dummy_troll")
dofile("scripts/settings/breeds/breed_chaos_tentacle")
dofile("scripts/settings/breeds/breed_chaos_tentacle_sorcerer")
dofile("scripts/settings/breeds/breed_chaos_vortex_sorcerer")
dofile("scripts/settings/breeds/breed_chaos_vortex")
dofile("scripts/settings/breeds/breed_chaos_plague_sorcerer")
dofile("scripts/settings/breeds/breed_chaos_corruptor_sorcerer")
dofile("scripts/settings/breeds/breed_chaos_plague_wave_spawner")
dofile("scripts/settings/breeds/breed_chaos_spawn")
dofile("scripts/settings/breeds/breed_chaos_dummy_sorcerer")
dofile("scripts/settings/breeds/breed_chaos_exalted_champion")
dofile("scripts/settings/breeds/breed_critters")
dofile("scripts/settings/breeds/breed_pets")

for _, dlc in pairs(DLCSettings) do
	local breeds = dlc.breeds

	if breeds then
		for _, breed in ipairs(breeds) do
			dofile(breed)
		end
	end
end

CHAOS = {}
SKAVEN = {}
CRITTER = {}
ELITES = {}
local DEFAULT_NAVTAG_LAYERS = {
	end_zone = 0,
	ledges = 1.5,
	barrel_explosion = 10,
	jumps = 1.5,
	bot_ratling_gun_fire = 3,
	big_boy_destructible = 0,
	planks = 1.5,
	ledges_with_fence = 1.5,
	doors = 1.5,
	teleporters = 5,
	bot_poison_wind = 1.5,
	fire_grenade = 10
}
local DEFAULT_NAV_COST_MAP_LAYERS = {
	plague_wave = 20,
	troll_bile = 20,
	lamp_oil_fire = 10,
	warpfire_thrower_warpfire = 20,
	vortex_near = 1,
	stormfiend_warpfire = 30,
	vortex_danger_zone = 1
}
local available_nav_tag_layers = table.clone(DEFAULT_NAVTAG_LAYERS)
local available_nav_cost_map_layers = table.clone(DEFAULT_NAV_COST_MAP_LAYERS)

for breed_name, breed_data in pairs(Breeds) do
	local lookup = BreedHitZonesLookup[breed_name]

	if lookup then
		breed_data.hit_zones_lookup = lookup

		fassert(breed_data.debug_color, "breed needs a debug color")
	end

	local allowed_layers = breed_data.allowed_layers

	if allowed_layers then
		table.merge(available_nav_tag_layers, allowed_layers)
	end

	local nav_cost_map_allowed_layers = breed_data.nav_cost_map_allowed_layers

	if nav_cost_map_allowed_layers then
		table.merge(available_nav_cost_map_layers, nav_cost_map_allowed_layers)
	end

	if breed_data.special then
		breed_data.immediate_threat = true
	end
end

for breed_name, breed_actions in pairs(BreedActions) do
	for action_name, action_data in pairs(breed_actions) do
		action_data.name = action_name
	end
end

local function set_bot_threat_tweak_data(current_table, max_start_delay)
	if current_table.duration then
		current_table.max_start_delay = math.min(max_start_delay, current_table.duration * 0.9)
	elseif current_table.bot_threat_duration then
		current_table.bot_threat_max_start_delay = math.min(max_start_delay, current_table.bot_threat_duration * 0.9)
	end
end

local function find_and_set_bot_threat_tweak_data(current_table, current_difficulty)
	if current_table.bot_threat_difficulty_data then
		local current_difficulty_data = current_table.bot_threat_difficulty_data[current_difficulty]
		local max_start_delay = current_difficulty_data.max_start_delay

		if current_table.bot_threats then
			local bot_threats = current_table.bot_threats

			if bot_threats[1] then
				local num_threats = #bot_threats

				for i = 1, num_threats, 1 do
					local bot_threat = bot_threats[i]

					set_bot_threat_tweak_data(bot_threat, max_start_delay)
				end
			else
				for _, animation_bot_threats in pairs(bot_threats) do
					local num_threats = #animation_bot_threats

					for i = 1, num_threats, 1 do
						local bot_threat = animation_bot_threats[i]

						set_bot_threat_tweak_data(bot_threat, max_start_delay)
					end
				end
			end
		elseif current_table.bot_threat_duration then
			set_bot_threat_tweak_data(current_table, max_start_delay)
		end
	else
		for _, data in pairs(current_table) do
			if type(data) == "table" then
				find_and_set_bot_threat_tweak_data(data, current_difficulty)
			end
		end
	end
end

function SET_BREED_DIFFICULTY()
	local current_difficulty = (Managers and Managers.state.difficulty and Managers.state.difficulty:get_difficulty()) or "normal"

	for breed_name, breed_actions in pairs(BreedActions) do
		for action_name, action_data in pairs(breed_actions) do
			if action_data.difficulty_diminishing_damage then
				local difficulty_dimishing_damage = action_data.difficulty_diminishing_damage[current_difficulty]
				action_data.dimishing_damage = table.clone(difficulty_dimishing_damage)
			end

			if action_data.difficulty_damage then
				local difficulty_damage = action_data.difficulty_damage[current_difficulty]
				action_data.damage = table.clone(difficulty_damage)
			end

			if action_data.blocked_difficulty_damage then
				local blocked_difficulty_damage = action_data.blocked_difficulty_damage[current_difficulty]
				action_data.blocked_damage = table.clone(blocked_difficulty_damage)
			end

			find_and_set_bot_threat_tweak_data(action_data, current_difficulty)
		end
	end
end

table.merge(available_nav_tag_layers, BotNavTransitionManager.TRANSITION_LAYERS)
table.merge(available_nav_cost_map_layers, BotNavTransitionManager.NAV_COST_MAP_LAYERS)

LAYER_ID_MAPPING = {}

for k, v in pairs(available_nav_tag_layers) do
	LAYER_ID_MAPPING[#LAYER_ID_MAPPING + 1] = k
end

NAV_COST_MAP_LAYER_ID_MAPPING = {}

for k, v in pairs(available_nav_cost_map_layers) do
	NAV_COST_MAP_LAYER_ID_MAPPING[#NAV_COST_MAP_LAYER_ID_MAPPING + 1] = k
end

fassert(#LAYER_ID_MAPPING < NavTagVolumeStartLayer, "Nav tag volume layers are conflicting with layers used by other systems.")

for i = #LAYER_ID_MAPPING + 1, NavTagVolumeStartLayer - 1, 1 do
	LAYER_ID_MAPPING[i] = "dummy_layer" .. i
end

NAV_TAG_VOLUME_LAYER_COST_AI = NAV_TAG_VOLUME_LAYER_COST_AI or {}
NAV_TAG_VOLUME_LAYER_COST_BOTS = NAV_TAG_VOLUME_LAYER_COST_BOTS or {}

for _, layer_name in ipairs(NavTagVolumeLayers) do
	LAYER_ID_MAPPING[#LAYER_ID_MAPPING + 1] = layer_name
	NAV_TAG_VOLUME_LAYER_COST_AI[layer_name] = NAV_TAG_VOLUME_LAYER_COST_AI[layer_name] or 1
	NAV_TAG_VOLUME_LAYER_COST_BOTS[layer_name] = NAV_TAG_VOLUME_LAYER_COST_BOTS[layer_name] or 1
end

table.mirror_array_inplace(LAYER_ID_MAPPING)
table.mirror_array_inplace(NAV_COST_MAP_LAYER_ID_MAPPING)

local PerceptionTypes = {
	perception_regular_update_aggro = true,
	perception_regular = true,
	perception_all_seeing_boss = true,
	perception_no_seeing = true,
	perception_all_seeing = true,
	perception_pack_master = true,
	perception_all_seeing_re_evaluate = true,
	perception_rat_ogre = true
}
local TargetSelectionTypes = {
	pick_rat_ogre_target_with_weights = true,
	pick_ninja_approach_target = true,
	pick_closest_target_with_filter = true,
	pick_flee_target = true,
	pick_closest_vortex_target = true,
	pick_player_controller_allied = true,
	pick_rat_ogre_target_idle = true,
	pick_boss_sorcerer_target = true,
	pick_closest_target_with_spillover = true,
	pick_solitary_target = true,
	horde_pick_closest_target_with_spillover = true,
	pick_pack_master_target = true,
	pick_no_targets = true,
	pick_closest_target = true,
	pick_mutator_sorcerer_target = true,
	pick_corruptor_target = true
}

for name, breed in pairs(Breeds) do
	breed.name = name

	if not breed.allowed_layers then
		breed.allowed_layers = table.clone(DEFAULT_NAVTAG_LAYERS)
	end

	if not breed.nav_cost_map_allowed_layers then
		breed.nav_cost_map_allowed_layers = table.clone(DEFAULT_NAV_COST_MAP_LAYERS)
	end

	if breed.perception and not PerceptionTypes[breed.perception] then
		error("Bad perception type '" .. breed.perception .. "' specified in breed .. '" .. breed.name .. "'.")
	end

	if breed.target_selection and not TargetSelectionTypes[breed.target_selection] then
		error("Bad 'target_selection' type '" .. breed.target_selection .. "' specified in breed .. '" .. breed.name .. "'.")
	end

	if breed.smart_object_template == nil then
		breed.smart_object_template = "fallback"
	end

	if breed.race == "chaos" then
		CHAOS[breed.name] = true
	elseif breed.race == "skaven" then
		SKAVEN[breed.name] = true
	elseif breed.race == "critter" then
		CRITTER[breed.name] = true
	elseif breed.race then
		error("Bad race type '" .. breed.race .. "' specified in breed .. '" .. breed.name .. "'.")
	else
		error("Missing 'race' type in breed .. '" .. breed.name .. "'.")
	end

	if breed.elite then
		ELITES[breed.name] = true
	end
end

return
