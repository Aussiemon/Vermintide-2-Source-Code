local settings = DLCSettings.morris
settings.vortex_templates = {
	blood_storm = {
		override_movement_speed = 3,
		outer_fx_z_scale_multiplier = 0.1,
		min_inner_radius = 0.38,
		inner_fx_z_scale_multiplier = 0.1,
		medium_cost_nav_cost_map_cost_type = "vortex_near",
		min_outer_radius = 2,
		player_actions_allowed = true,
		stop_sound_event_name = "Stop_curse_blood_storm_loop",
		outer_fx_name = "fx/deus_bloodstorm_vortex_small_outer",
		full_fx_radius = 6,
		high_cost_nav_cost_map_cost_type = "vortex_danger_zone",
		min_fx_radius = 2,
		inner_fx_name = "fx/deus_bloodstorm_vortex_small",
		windup_time = 3,
		random_wander = true,
		max_height = 10,
		start_sound_event_name = "Play_curse_blood_storm_loop",
		full_inner_radius = 4,
		full_outer_radius = 6,
		stop_and_process_player = false,
		forced_standing_still = false,
		use_nav_cost_map_volumes = true,
		breed_name = "chaos_vortex",
		max_allowed_inner_radius_dist = 3.5,
		start_radius = 0.1,
		time_of_life = {
			8,
			10
		},
		time_of_life = {
			4,
			6
		},
		damage = {
			5,
			3,
			1.5
		},
		difficulty_damage = {
			easy = {
				2,
				4,
				2
			},
			normal = {
				3,
				5,
				3
			},
			hard = {
				5,
				7,
				5
			},
			harder = {
				10,
				8,
				10
			},
			hardest = {
				20,
				10,
				15
			},
			cataclysm = {
				10,
				8,
				5
			},
			cataclysm_2 = {
				15,
				10,
				10
			},
			cataclysm_3 = {
				30,
				15,
				22.5
			}
		}
	}
}
settings.breeds = {
	"scripts/settings/breeds/breed_chaos_greed_pinata",
	"scripts/settings/breeds/breed_chaos_curse_mutator_sorcerer"
}
settings.behaviour_trees = {
	"scripts/entity_system/systems/behaviour/trees/chaos/chaos_greed_pinata_behavior",
	"scripts/entity_system/systems/behaviour/trees/chaos/chaos_curse_mutator_sorcerer_behavior"
}
settings.behaviour_trees_precompiled = {
	"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_greed_pinata",
	"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_curse_mutator_sorcerer"
}
settings.health_extensions = {
	"GreedPinataHealthExtension"
}
settings.ai_breed_snippets_file_names = {
	"scripts/settings/dlcs/morris/morris_ai_breed_snippets"
}
settings.bt_enter_hooks = {
	on_skulking_sorcerer_grab = function (unit, blackboard, t)
		local health_extension = ScriptUnit.extension(unit, "health_system")
		health_extension.is_invincible = false
		local target_unit = blackboard.target_unit
		local dialogue_input = ScriptUnit.extension_input(target_unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()

		dialogue_input:trigger_dialogue_event("curse_damage_taken", event_data)
	end
}

return
