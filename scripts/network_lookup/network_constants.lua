-- chunkname: @scripts/network_lookup/network_constants.lua

NetworkConstants = NetworkConstants or {}

local function check_bounderies(network_variable_name, network_lookup_name, store_variable_info)
	local network_variable_info = Network.type_info(network_variable_name)

	if store_variable_info == nil or store_variable_info then
		NetworkConstants[network_variable_name] = network_variable_info
	end

	local num_lookup_entries = #NetworkLookup[network_lookup_name]
	local max_network_entries = network_variable_info.max

	fassert(num_lookup_entries <= max_network_entries, "Too many entries in NetworkLookup.%s (%d, max:%d), raise global.network_config value for %s by a factor 2.", network_lookup_name, num_lookup_entries, max_network_entries, network_variable_name)
end

NetworkConstants.damage = Network.type_info("damage")
NetworkConstants.damage_hotjoin_sync = Network.type_info("damage_hotjoin_sync")
NetworkConstants.health = Network.type_info("health")
NetworkConstants.velocity = Network.type_info("velocity")
NetworkConstants.enemy_velocity = Network.type_info("enemy_velocity")
NetworkConstants.VELOCITY_EPSILON = Vector3.length(Vector3(NetworkConstants.velocity.tolerance, NetworkConstants.velocity.tolerance, NetworkConstants.velocity.tolerance)) * 1.1
NetworkConstants.position = Network.type_info("position")
NetworkConstants.rotation = Network.type_info("rotation")
NetworkConstants.enemy_rotation = Network.type_info("enemy_rotation")
NetworkConstants.max_attachments = 4
NetworkConstants.clock_time = Network.type_info("clock_time")
NetworkConstants.ping = Network.type_info("ping")
NetworkConstants.animation_variable_float = Network.type_info("animation_variable_float")
NetworkConstants.number = Network.type_info("number")
NetworkConstants.game_object_id_max = Network.type_info("game_object_id").max
NetworkConstants.invalid_game_object_id = NetworkConstants.game_object_id_max
NetworkConstants.max_overcharge = Network.type_info("max_overcharge")
NetworkConstants.max_energy = Network.type_info("max_energy")
NetworkConstants.weave_score = Network.type_info("weave_score")
NetworkConstants.statistics_path_max_size = Network.type_info("statistics_path").max_size

check_bounderies("damage_profile", "damage_profiles")
check_bounderies("anim_event", "anims")
check_bounderies("bt_action_name", "bt_action_names")
check_bounderies("surface_material_effect", "surface_material_effects")
check_bounderies("vfx", "effects")
check_bounderies("light_weight_projectile_lookup", "light_weight_projectile_effects")

NetworkConstants.light_weight_projectile_speed = Network.type_info("light_weight_projectile_speed")
NetworkConstants.light_weight_projectile_index = Network.type_info("light_weight_projectile_index")
NetworkConstants.weapon_id = Network.type_info("weapon_id")

local num_items = #ItemMasterList

fassert(num_items <= NetworkConstants.weapon_id.max, "Too many weapons in ItemMasterList, global.network_config value weapon_id needs to be raised.")

NetworkConstants.weight_array = Network.type_info("weight_array")

fassert(#NetworkLookup.level_keys <= NetworkConstants.weight_array.max_size, "Too many levels in LevelSettings, global.network_config value weight_array needs to be raised.")

local num_damage_sources = #NetworkLookup.damage_sources

NetworkConstants.damage_source_id = Network.type_info("damage_source_id")

fassert(num_damage_sources <= NetworkConstants.damage_source_id.max, "Too many damage sources, global.network_config value damage_source_id needs to be raised.")
fassert(num_items <= num_damage_sources, "weapon_id lookup is set higher than damage_source_id lookup despite all weapons being damage sources.")
check_bounderies("lookup", "weapon_skins")
check_bounderies("action", "actions")
check_bounderies("sub_action", "sub_actions")
check_bounderies("item_template_name", "item_template_names")
check_bounderies("buff_weapon_types", "buff_weapon_types")
check_bounderies("terror_flow_event", "terror_flow_events")

NetworkConstants.story_time = Network.type_info("story_time")

check_bounderies("fatigue_points", "fatigue_types")

local damage_hotjoin_sync_max = NetworkConstants.damage_hotjoin_sync.max

for name, breed in pairs(Breeds) do
	local max_health = breed.max_health

	if max_health then
		for _, health in ipairs(max_health) do
			fassert(health < damage_hotjoin_sync_max, "Assert, breed %s is unkillable since his health (%d) is bigger then max damage (%f) sent over the network. Raise global.network_config value for damage by a factor of 2", name, health, damage_hotjoin_sync_max)
		end
	end
end

NetworkConstants.teleports = Network.type_info("teleports")

check_bounderies("marker_lookup", "markers")
check_bounderies("dialogue_lookup", "dialogues")
check_bounderies("player_status", "statuses")

NetworkConstants.uint_16 = Network.type_info("uint_16")
NetworkConstants.server_controlled_buff_id = Network.type_info("server_controlled_buff_id")

local uint_8 = Network.type_info("uint_8")

fassert(uint_8.bits == 8, "uint_8 is not 8 bits.")

local uint_16 = Network.type_info("uint_16")

fassert(uint_16.bits == 16, "uint_16 is not 16 bits.")

local uint_19 = Network.type_info("uint_19")

fassert(uint_19.bits == 19, "uint_19 is not 19 bits.")

local uint_32 = Network.type_info("uint_32")

fassert(uint_32.bits == 32, "uint_32 is not 32 bits.")

local enemy_package_loader_bitmask_array = Network.type_info("enemy_package_loader_bitmask_array")
local num_bitmasks_bits = enemy_package_loader_bitmask_array.max_size * uint_32.bits
local num_breeds = #NetworkLookup.breeds

fassert(num_breeds <= num_bitmasks_bits, "Need to update enemy_package_loader_bitmask_array so that it has enough 32-bit elements to contain number of breeds (%i).", num_breeds)

NetworkConstants.max_breed_freezer_units_per_rpc = Network.type_info("packed_breed_go_ids").max_size

check_bounderies("mutator_lookup", "mutator_templates")
check_bounderies("buff_lookup", "buff_templates")
check_bounderies("statistics_path_lookup", "statistics_path_names")

local mechanism_id = Network.type_info("mechanism_id")

fassert(table.size(MechanismSettings) <= mechanism_id.max, "Too many mechanism settings, please up mechanism_id value in global.network_config")

local party_slot_id = Network.type_info("party_slot_id")

NetworkConstants.INVALID_PARTY_SLOT_ID = party_slot_id.min

fassert(NetworkConstants.INVALID_PARTY_SLOT_ID == 0, "party_slot_ids should start at one because we need an invalid slot id for syncing purposes.")

local max_statistics_paths = Network.type_info("statistics_path_lookup").max
local num_statistics_paths = #NetworkLookup.statistics_path_names

fassert(num_statistics_paths <= max_statistics_paths, "Too many entries in statistics_path lookup (%d, max:%d), raise global.network_config value for statistics_path by a factor 2", num_statistics_paths, max_statistics_paths)

NetworkConstants.mutator_array = Network.type_info("mutator_array")
NetworkConstants.buff_array = Network.type_info("buff_array")
NetworkConstants.buff_variable_type_array = Network.type_info("buff_variable_type_array")
NetworkConstants.buff_variable_data_array = Network.type_info("buff_variable_data_array")

local ready_request_id = Network.type_info("ready_request_id")

NetworkConstants.READY_REQUEST_ID_MAX = ready_request_id.max

check_bounderies("health_status_lookup", "health_statuses")
check_bounderies("interaction_lookup", "interactions")
check_bounderies("interaction_state_lookup", "interaction_states")
check_bounderies("proc_function_lookup", "proc_functions")
check_bounderies("difficulty_lookup", "difficulties")

local game_mode_state_id_max = Network.type_info("game_mode_state_id").max

for game_mode_key, settings in pairs(GameModeSettings) do
	local num_states = #settings.game_mode_states

	fassert(num_states <= game_mode_state_id_max, "Too many game mode states in %s, it has %u maximum is %u", game_mode_key, num_states, game_mode_state_id_max)
end
