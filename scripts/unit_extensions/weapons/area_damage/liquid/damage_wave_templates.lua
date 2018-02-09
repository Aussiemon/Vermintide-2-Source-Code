DamageWaveTemplates = {
	templates = {
		plague_wave = {
			stop_running_wave_sound = "Stop_magic_plague_wave_loop",
			trigger_dialogue_on_impact = true,
			launch_wave_sound = "Play_magic_plague_wave",
			buff_wave_impact_name = "plague_wave_face_base",
			fx_name_impact = "fx/plague_wave_03",
			apply_impact_buff_to_ai = false,
			buff_template_name = "plague_wave_ground_base",
			start_speed = 12,
			fx_separation_dist = 1.5,
			fx_name_arrived = "fx/chaos_sorcerer_plague_wave_hit_01",
			apply_buff_to_player = true,
			max_speed = 25,
			wave_width = 1,
			running_wave_sound = "Play_magic_plague_wave_loop",
			max_height = 2.5,
			fx_name_filled = "fx/plague_wave_04",
			fx_name_running = "fx/chaos_sorcerer_plauge_wave_01",
			buff_wave_impact_type = "troll_bile_face",
			launch_animation = "wave_summon_release",
			acceleration = 25,
			overflow_dist = 5,
			particle_arrived_stop_mode = "stop",
			blob_separation_dist = 2,
			create_bot_aoe_threat = true,
			impact_wave_sound = "Play_magic_plague_wave_hit",
			apply_buff_to_ai = true,
			time_of_life = 10,
			use_nav_cost_map_volumes = true,
			buff_template_type = "troll_bile_ground",
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
				push_forward_offset = 1.5,
				push_width = 1.25,
				ahead_dist = 1.5,
				player_pushed_speed = 17
			}
		},
		pattern_plague_wave = {
			max_speed = 15,
			launch_wave_sound = "Play_magic_plague_wave",
			buff_wave_impact_name = "chaos_zombie_explosion",
			fx_name_impact = "fx/plague_wave_03",
			fx_separation_dist = 1.5,
			buff_template_name = "plague_wave_ground_base",
			start_speed = 10,
			stop_running_wave_sound = "Stop_magic_plague_wave_loop",
			fx_name_arrived = "fx/chaos_sorcerer_plague_wave_hit_01",
			apply_buff_to_player = false,
			wave_width = 3,
			running_wave_sound = "Play_magic_plague_wave_loop",
			max_height = 2.5,
			fx_name_filled = "fx/plague_wave_04",
			fx_name_running = "fx/chaos_sorcerer_plauge_wave_01",
			buff_wave_impact_type = "chaos_zombie_explosion",
			launch_animation = "wave_summon_release",
			acceleration = 8,
			overflow_dist = 5,
			particle_arrived_stop_mode = "stop",
			blob_separation_dist = 3.5,
			apply_impact_buff_to_ai = false,
			impact_wave_sound = "Play_magic_plague_wave_hit",
			apply_buff_to_ai = false,
			time_of_life = 3,
			use_nav_cost_map_volumes = false,
			buff_template_type = "troll_bile_ground",
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
				push_forward_offset = 1.5,
				push_width = 1.25,
				ahead_dist = 1.5,
				player_pushed_speed = 17
			}
		},
		vermintide = {
			wave_width = 1.4,
			max_speed = 25,
			fx_separation_dist = 1.5,
			buff_wave_impact_name = "plague_wave_face_base",
			acceleration = 10,
			overflow_dist = 5,
			fx_name_running = "fx/wpnfx_warp_fire_remains_rim",
			buff_template_name = "plague_wave_ground_base",
			start_speed = 4,
			fx_name_impact = "fx/plague_wave_03",
			fx_name_arrived = "fx/doomwheel_explosion",
			apply_buff_to_player = true,
			blob_separation_dist = 3.5,
			particle_arrived_stop_mode = "destroy",
			apply_impact_buff_to_ai = false,
			max_height = 2.5,
			use_nav_cost_map_volumes = true,
			fx_name_filled = "fx/chr_warp_fire_flamethrower_remains_01",
			apply_buff_to_ai = true,
			time_of_life = 0.5,
			launch_wave_sound = "Play_magic_plague_wave",
			running_wave_sound = "Play_magic_plague_wave_loop",
			impact_wave_sound = "fireball_big_hit",
			buff_wave_impact_type = "troll_bile_face",
			stop_running_wave_sound = "Stop_magic_plague_wave_loop",
			buff_template_type = "troll_bile_ground",
			nav_cost_map_cost_type = "plague_wave",
			apply_impact_buff_to_player = true,
			fx_name_init = "fx/chr_warp_fire_flamethrower_01",
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
				push_forward_offset = 1.5,
				push_width = 1.25,
				ahead_dist = 1.5,
				player_pushed_speed = 17
			}
		}
	}
}
DamageWaveTemplates.templates.sienna_adept_ability_trail = {
	wave_width = 1,
	max_speed = 100,
	fx_separation_dist = 0.15,
	buff_wave_impact_name = "plague_wave_face_base",
	acceleration = 100,
	overflow_dist = 0,
	fx_name_running = "fx/wpnfx_lamp_oil_remains",
	buff_template_name = "plague_wave_ground_base",
	start_speed = 100,
	fx_name_impact = "fx/wpnfx_lamp_oil_remains",
	fx_name_arrived = "fx/wpnfx_lamp_oil_remains",
	apply_buff_to_player = false,
	blob_separation_dist = 0.2,
	particle_arrived_stop_mode = "stop",
	apply_impact_buff_to_ai = false,
	max_height = 0.5,
	launch_wave_sound = "Play_sienna_adept_blink_ability",
	fx_name_filled = "fx/wpnfx_lamp_oil_remains",
	apply_buff_to_ai = true,
	time_of_life = 6,
	buff_wave_impact_type = "troll_bile_face",
	buff_template_type = "troll_bile_ground",
	apply_impact_buff_to_player = false,
	fx_name_init = "fx/wpnfx_lamp_oil_remains",
	immune_breeds = {}
}
DamageWaveTemplates.templates.sienna_adept_ability_trail_increased_duration = table.clone(DamageWaveTemplates.templates.sienna_adept_ability_trail)
DamageWaveTemplates.templates.sienna_adept_ability_trail_increased_duration.time_of_life = 10

return 
