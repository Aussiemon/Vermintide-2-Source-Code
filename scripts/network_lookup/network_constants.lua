NetworkConstants = NetworkConstants or {}
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
NetworkConstants.damage_profile = Network.type_info("damage_profile")

assert(#NetworkLookup.damage_profiles <= NetworkConstants.damage_profile.max, "Too many damage profiles, global config max value needs to be upped")

NetworkConstants.statistics_path_max_size = Network.type_info("statistics_path").max_size
NetworkConstants.anim_event = Network.type_info("anim_event")

assert(#NetworkLookup.anims <= NetworkConstants.anim_event.max, "Too many anim events in network lookup, time to up the network config max value, max: " .. NetworkConstants.anim_event.max .. "|anims " .. #NetworkLookup.anims)

NetworkConstants.bt_action_name = Network.type_info("bt_action_name")

assert(#NetworkLookup.bt_action_names <= NetworkConstants.bt_action_name.max, "Too many bt_action_name events in network lookup, time to up the network config max value")

NetworkConstants.surface_material_effect = Network.type_info("surface_material_effect")

assert(#NetworkLookup.surface_material_effects <= NetworkConstants.surface_material_effect.max, "Too many surface material effects in network lookup, time to up the network config max value")

NetworkConstants.vfx = Network.type_info("vfx")
local effetcs_max = NetworkConstants.vfx.max
local effects_amount = #NetworkLookup.effects

fassert(effects_amount <= effetcs_max, "Too many effects in network lookup, amount: %i, max: %i, update global.network_config", effects_amount, effetcs_max)

NetworkConstants.light_weight_projectile_particle_lookup = Network.type_info("light_weight_projectile_particle_lookup")
local light_weight_particle_max = NetworkConstants.light_weight_projectile_particle_lookup.max
local light_weight_particle_amount = #NetworkLookup.light_weight_projectile_particle_effects

fassert(light_weight_particle_amount <= light_weight_particle_max, "Too many light weight projectile particle effects in network lookup, amount: %i, max: %i, update global.network_config", light_weight_particle_amount, light_weight_particle_max)

NetworkConstants.light_weight_projectile_speed = Network.type_info("light_weight_projectile_speed")
NetworkConstants.light_weight_projectile_index = Network.type_info("light_weight_projectile_index")
NetworkConstants.weapon_id = Network.type_info("weapon_id")
local num_items = #ItemMasterList

assert(num_items <= NetworkConstants.weapon_id.max, "Too many weapons in ItemMasterList, global.network_config value weapon_id needs to be raised.")

local num_damage_sources = #NetworkLookup.damage_sources
NetworkConstants.damage_source_id = Network.type_info("damage_source_id")

assert(num_damage_sources <= NetworkConstants.damage_source_id.max, "Too many damage sources, global.network_config value damage_source_id needs to be raised.")
assert(num_items <= num_damage_sources, "weapon_id lookup is set higher than damage_source_id lookup despite all weapons being damage sources.")

local num_weapon_skins = #NetworkLookup.weapon_skins
NetworkConstants.lookup = Network.type_info("lookup")

fassert(num_weapon_skins <= NetworkConstants.lookup.max, "Too many weapon skins for network typ lookup, make a new type specific for weapon skins and change this check to use that.")

local num_actions = #NetworkLookup.actions
NetworkConstants.action = Network.type_info("action")

fassert(num_actions <= NetworkConstants.action.max, "Too many actions, raise global.network_config value for action by a factor 2")

local num_sub_actions = #NetworkLookup.sub_actions
NetworkConstants.sub_action = Network.type_info("sub_action")

fassert(num_sub_actions <= NetworkConstants.sub_action.max, "Too many sub actions, raise global.network_config value for sub_action by a factor 2")

local num_item_template_names = #NetworkLookup.item_template_names
NetworkConstants.item_template_name = Network.type_info("item_template_name")

fassert(num_item_template_names <= NetworkConstants.item_template_name.max, "Too many item template names, raise global.network_config value for item_template_name by a factor 2")

local num_terror_flow_events = #NetworkLookup.terror_flow_events
NetworkConstants.terror_flow_event = Network.type_info("terror_flow_event")

fassert(num_terror_flow_events <= NetworkConstants.terror_flow_event.max, "Too many terror flow events, raise global.network_config value for terror_flow_event by a factor 2")

NetworkConstants.story_time = Network.type_info("story_time")
local fatigue_points_max = Network.type_info("fatigue_points").max
local num_fatigue_types = #NetworkLookup.fatigue_types

fassert(num_fatigue_types <= fatigue_points_max, "Too many fatigue_types, raise global.network_config value for fatigue_points by a factor of 2")

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
NetworkConstants.marker_lookup = Network.type_info("marker_lookup")
local num_markers = #NetworkLookup.markers

fassert(num_markers <= NetworkConstants.marker_lookup.max, "Too many dialogue system markers, raise global.network_config value for marker_lookup by a factor 2")

NetworkConstants.dialogue_lookup = Network.type_info("dialogue_lookup")
local num_dialogues = #NetworkLookup.dialogues
local max_dialogues = NetworkConstants.dialogue_lookup.max

fassert(num_dialogues <= max_dialogues, "Too many entries in dialogue lookup (%i, max:%i), raise global.network_config vlaue for dialogue_lookup by a factor 2", num_dialogues, max_dialogues)

NetworkConstants.statuses = Network.type_info("player_status")

assert(#NetworkLookup.statuses <= NetworkConstants.statuses.max, "Too many statuses, raise global.network_config value for player_status by a factor 2")

NetworkConstants.uint_16 = Network.type_info("uint_16")
NetworkConstants.server_controlled_buff_id = Network.type_info("server_controlled_buff_id")

return 
