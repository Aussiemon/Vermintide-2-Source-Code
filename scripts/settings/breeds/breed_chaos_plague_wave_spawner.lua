-- chunkname: @scripts/settings/breeds/breed_chaos_plague_wave_spawner.lua

local breed_data = {
	animation_sync_rpc = "rpc_sync_anim_state_1",
	base_unit = "units/hub_elements/empty",
	behavior = "chaos_plague_wave_spawner",
	bone_lod_level = 0,
	debug_spawn_category = "Misc",
	detection_radius = 90,
	exchange_order = 1,
	far_off_despawn_immunity = true,
	has_inventory = false,
	no_autoaim = true,
	not_bot_target = true,
	perception = "perception_all_seeing",
	poison_resistance = 1,
	race = "chaos",
	special = true,
	target_selection = "pick_closest_vortex_target",
	threat_value = 0,
	unit_template = "ai_unit_plague_wave_spawner",
	infighting = InfightingSettings.small,
	debug_color = {
		255,
		255,
		255,
		255,
	},
	hitzone_multiplier_types = {},
	hit_zones = {},
}

Breeds.chaos_plague_wave_spawner = table.create_copy(Breeds.chaos_plague_wave_spawner, breed_data)

local action_data = {
	plague_wave_spawn = {
		is_spawner = true,
		spawn_func_name = "spawn_plague_wave_from_spawner",
	},
	spawning_pattern = {
		anticipation_fx = "fx/catacombs_end_event_water_bubble",
		anticipation_fx_offset_time = 3,
		event_delete_state = 100,
		external_event_name = "catacombs_end_event",
		plague_wave_spawn_cooldown = 8,
	},
}

BreedActions.chaos_plague_wave_spawner = table.create_copy(BreedActions.chaos_plague_wave_spawner, action_data)
