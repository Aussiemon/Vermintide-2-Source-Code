local breed_data = {
	detection_radius = 90,
	animation_sync_rpc = "rpc_sync_anim_state_1",
	has_inventory = false,
	unit_template = "ai_unit_plague_wave_spawner",
	no_autoaim = true,
	behavior = "chaos_plague_wave_spawner",
	target_selection = "pick_closest_vortex_target",
	exchange_order = 1,
	race = "chaos",
	not_bot_target = true,
	poison_resistance = 1,
	perception = "perception_all_seeing",
	debug_spawn_category = "Misc",
	far_off_despawn_immunity = true,
	bone_lod_level = 0,
	special = true,
	base_unit = "units/hub_elements/empty",
	threat_value = 0,
	debug_color = {
		255,
		255,
		255,
		255
	},
	hitzone_multiplier_types = {},
	hit_zones = {}
}
Breeds.chaos_plague_wave_spawner = table.create_copy(Breeds.chaos_plague_wave_spawner, breed_data)
local action_data = {
	plague_wave_spawn = {
		is_spawner = true,
		spawn_func_name = "spawn_plague_wave_from_spawner"
	},
	spawning_pattern = {
		external_event_name = "catacombs_end_event",
		anticipation_fx = "fx/catacombs_end_event_water_bubble",
		plague_wave_spawn_cooldown = 8,
		event_delete_state = 100,
		anticipation_fx_offset_time = 3
	}
}
BreedActions.chaos_plague_wave_spawner = table.create_copy(BreedActions.chaos_plague_wave_spawner, action_data)

return 
