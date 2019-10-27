DamageWaveTemplates = {
	templates = {
		plague_wave = {
			fx_separation_dist = 1.5,
			max_speed = 20,
			wave_width = 0.8,
			launch_animation = "wave_summon_release",
			buff_wave_impact_name = "plague_wave_face_base",
			overflow_dist = 5,
			acceleration = 15,
			fx_name_running = "fx/chaos_sorcerer_plauge_wave_01",
			start_speed = 10,
			particle_arrived_stop_mode = "stop",
			fx_name_arrived = "fx/chaos_sorcerer_plague_wave_hit_01",
			apply_buff_to_player = true,
			create_bot_aoe_threat = true,
			launch_wave_sound = "Play_magic_plague_wave",
			apply_impact_buff_to_ai = false,
			max_height = 2.5,
			running_wave_sound = "Play_magic_plague_wave_loop",
			impact_wave_sound = "Play_magic_plague_wave_hit",
			apply_buff_to_ai = true,
			time_of_life = 10,
			stop_running_wave_sound = "Stop_magic_plague_wave_loop",
			trigger_dialogue_on_impact = true,
			fx_unit = "units/beings/enemies/chaos_sorcerer_fx/chr_chaos_sorcerer_fx",
			use_nav_cost_map_volumes = false,
			fx_name_impact = "fx/plague_wave_03",
			nav_cost_map_cost_type = "plague_wave",
			apply_impact_buff_to_player = true,
			fx_name_init = "fx/chaos_sorcerer_plauge_wave_02",
			immune_breeds = {
				chaos_troll = true,
				chaos_spawn = true,
				skaven_grey_seer = true,
				chaos_plague_sorcerer = true,
				chaos_exalted_sorcerer = true,
				skaven_rat_ogre = true,
				skaven_stormfiend = true
			},
			ai_push_data = {
				stagger_distance = 3,
				push_along_wave_direction = true,
				stagger_impact = {
					6,
					3,
					0,
					0,
					6
				},
				stagger_duration = {
					2.5,
					1,
					0,
					0,
					4
				}
			},
			player_push_data = {
				ahead_dist = 1.5,
				push_forward_offset = 1.5,
				push_width = 1.25,
				player_pushed_speed = 20,
				dodged_width = 0.5
			}
		},
		pattern_plague_wave = {
			fx_separation_dist = 1.5,
			max_speed = 15,
			wave_width = 0.8,
			launch_animation = "wave_summon_release",
			buff_wave_impact_name = "plague_wave_face_base",
			overflow_dist = 5,
			acceleration = 8,
			fx_name_running = "fx/chaos_sorcerer_plauge_wave_01",
			start_speed = 10,
			particle_arrived_stop_mode = "stop",
			fx_name_arrived = "fx/chaos_sorcerer_plague_wave_hit_01",
			apply_buff_to_player = false,
			launch_wave_sound = "Play_magic_plague_wave",
			running_wave_sound = "Play_magic_plague_wave_loop",
			apply_impact_buff_to_ai = false,
			max_height = 2.5,
			impact_wave_sound = "Play_magic_plague_wave_hit",
			stop_running_wave_sound = "Stop_magic_plague_wave_loop",
			apply_buff_to_ai = false,
			time_of_life = 3,
			fx_unit = "units/beings/enemies/chaos_sorcerer_fx/chr_chaos_sorcerer_fx",
			use_nav_cost_map_volumes = false,
			fx_name_impact = "fx/plague_wave_03",
			nav_cost_map_cost_type = "plague_wave",
			apply_impact_buff_to_player = true,
			fx_name_init = "fx/chaos_sorcerer_plauge_wave_02",
			immune_breeds = {
				chaos_troll = true,
				chaos_spawn = true,
				chaos_exalted_sorcerer = true,
				chaos_plague_sorcerer = true,
				skaven_rat_ogre = true,
				skaven_stormfiend = true
			},
			ai_push_data = {
				stagger_distance = 3,
				push_along_wave_direction = true,
				stagger_impact = {
					6,
					3,
					0,
					0,
					6
				},
				stagger_duration = {
					2.5,
					1,
					0,
					0,
					4
				}
			},
			player_push_data = {
				ahead_dist = 1.5,
				push_forward_offset = 1.5,
				push_width = 1.25,
				player_pushed_speed = 17,
				dodged_width = 0.5
			}
		},
		vermintide = {
			fx_separation_dist = 1.5,
			max_speed = 25,
			wave_width = 1,
			fx_unit = "units/hub_elements/empty",
			buff_wave_impact_name = "vermintide_face_base",
			overflow_dist = 5,
			acceleration = 25,
			fx_name_running = "fx/chr_grey_seer_lightning_wave_01",
			start_speed = 12,
			particle_arrived_stop_mode = "stop",
			fx_name_arrived = "fx/chr_grey_seer_lightning_hit_02",
			apply_buff_to_player = true,
			create_bot_aoe_threat = true,
			running_wave_sound = "Play_emitter_grey_seer_electric_ground_wave",
			apply_impact_buff_to_ai = false,
			max_height = 2.5,
			stop_running_wave_sound = "Stop_emitter_grey_seer_electric_ground_wave",
			trigger_dialogue_on_impact = true,
			apply_buff_to_ai = true,
			time_of_life = 10,
			use_nav_cost_map_volumes = false,
			fx_name_impact = "fx/chr_grey_seer_lightning_hit_01",
			nav_cost_map_cost_type = "plague_wave",
			apply_impact_buff_to_player = true,
			fx_name_init = "fx/chr_grey_seer_lightning_init_01",
			immune_breeds = {
				chaos_troll = true,
				chaos_spawn = true,
				skaven_grey_seer = true,
				chaos_plague_sorcerer = true,
				chaos_exalted_sorcerer = true,
				skaven_rat_ogre = true,
				skaven_stormfiend = true
			},
			ai_push_data = {
				stagger_distance = 3,
				push_along_wave_direction = true,
				stagger_impact = {
					6,
					3,
					0,
					0,
					6
				},
				stagger_duration = {
					2.5,
					1,
					0,
					0,
					4
				}
			},
			player_push_data = {
				ahead_dist = 1.5,
				push_forward_offset = 1.5,
				push_width = 1.25,
				player_pushed_speed = 17,
				dodged_width = 0.5
			}
		}
	}
}
DamageWaveTemplates.templates.sienna_adept_ability_trail = {
	fx_separation_dist = 0.15,
	max_speed = 100,
	ignore_obstacles = true,
	wave_width = 2,
	acceleration = 100,
	overflow_dist = 0,
	fx_name_running = "fx/brw_adept_skill_02",
	buff_template_name = "sienna_adept_ability_trail",
	start_speed = 15,
	fx_name_impact = "fx/brw_adept_skill_02",
	fx_name_arrived = "fx/brw_adept_skill_02",
	apply_buff_to_player = true,
	blob_separation_dist = 0.2,
	particle_arrived_stop_mode = "stop",
	apply_impact_buff_to_ai = false,
	max_height = 2.5,
	launch_wave_sound = "Play_sienna_adept_blink_ability",
	fx_name_filled = "fx/brw_adept_skill_02",
	apply_buff_to_ai = true,
	time_of_life = 6,
	buff_template_type = "burning dot",
	apply_impact_buff_to_player = false,
	fx_name_init = "fx/brw_adept_skill_02",
	immune_breeds = {}
}
DamageWaveTemplates.templates.sienna_adept_ability_trail_increased_duration = table.clone(DamageWaveTemplates.templates.sienna_adept_ability_trail)
DamageWaveTemplates.templates.sienna_adept_ability_trail_increased_duration.time_of_life = 10
DamageWaveTemplates.templates.sienna_adept_ability_trail_increased_duration.fx_name_init = "fx/brw_adept_skill_02_upgraded"
DamageWaveTemplates.templates.sienna_adept_ability_trail_increased_duration.fx_name_running = "fx/brw_adept_skill_02_upgraded"
DamageWaveTemplates.templates.sienna_adept_ability_trail_increased_duration.fx_name_impact = "fx/brw_adept_skill_02_upgraded"
DamageWaveTemplates.templates.sienna_adept_ability_trail_increased_duration.fx_name_filled = "fx/brw_adept_skill_02_upgraded"
DamageWaveTemplates.templates.sienna_adept_ability_trail_increased_duration.fx_name_arrived = "fx/brw_adept_skill_02_upgraded"

return
