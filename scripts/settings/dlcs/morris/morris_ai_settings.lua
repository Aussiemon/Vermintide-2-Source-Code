-- chunkname: @scripts/settings/dlcs/morris/morris_ai_settings.lua

local settings = DLCSettings.morris

settings.vortex_templates = {
	blood_storm = {
		breed_name = "chaos_vortex",
		damage = 5,
		forced_standing_still = false,
		full_fx_radius = 6,
		full_inner_radius = 4,
		full_outer_radius = 6,
		high_cost_nav_cost_map_cost_type = "vortex_danger_zone",
		inner_fx_name = "fx/deus_bloodstorm_vortex_small",
		inner_fx_z_scale_multiplier = 0.1,
		max_allowed_inner_radius_dist = 3.5,
		max_height = 10,
		medium_cost_nav_cost_map_cost_type = "vortex_near",
		min_fx_radius = 2,
		min_inner_radius = 0.38,
		min_outer_radius = 2,
		outer_fx_name = "fx/deus_bloodstorm_vortex_small_outer",
		outer_fx_z_scale_multiplier = 0.1,
		override_movement_speed = 3,
		player_actions_allowed = true,
		random_wander = true,
		start_radius = 0.1,
		start_sound_event_name = "Play_curse_blood_storm_loop",
		stop_and_process_player = false,
		stop_sound_event_name = "Stop_curse_blood_storm_loop",
		use_nav_cost_map_volumes = true,
		windup_time = 3,
		time_of_life = {
			4,
			6,
		},
	},
}
settings.breeds = {
	"scripts/settings/breeds/breed_chaos_greed_pinata",
	"scripts/settings/breeds/breed_chaos_curse_mutator_sorcerer",
}
settings.behaviour_trees = {
	"scripts/entity_system/systems/behaviour/trees/chaos/chaos_greed_pinata_behavior",
	"scripts/entity_system/systems/behaviour/trees/chaos/chaos_curse_mutator_sorcerer_behavior",
}
settings.behaviour_trees_precompiled = {
	"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_greed_pinata",
	"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_curse_mutator_sorcerer",
}
settings.health_extensions = {
	"GreedPinataHealthExtension",
}
settings.ai_breed_snippets_file_names = {
	"scripts/settings/dlcs/morris/morris_ai_breed_snippets",
}
settings.bt_enter_hooks = {
	on_skulking_sorcerer_grab = function (unit, blackboard, t)
		local health_extension = ScriptUnit.extension(unit, "health_system")

		health_extension.is_invincible = false

		local target_unit = blackboard.target_unit
		local dialogue_input = ScriptUnit.extension_input(target_unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()

		dialogue_input:trigger_dialogue_event("curse_damage_taken", event_data)
	end,
}
