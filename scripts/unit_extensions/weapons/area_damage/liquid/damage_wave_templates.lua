local stagger_types = require("scripts/utils/stagger_types")
DamageWaveTemplates = {
	templates = {
		plague_wave_teleport = {
			fx_separation_dist = 1.5,
			max_speed = 10,
			fx_unit = "units/beings/enemies/chaos_sorcerer_fx/chr_chaos_sorcerer_fx",
			launch_animation = "wave_summon_release",
			buff_wave_impact_name = "plague_wave_face_base",
			overflow_dist = 5,
			fx_name_running = "fx/chaos_sorcerer_plauge_wave_01",
			fx_name_arrived = "fx/chaos_sorcerer_plague_wave_hit_01",
			start_speed = 5,
			particle_arrived_stop_mode = "stop",
			player_query_distance = 0.8,
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
			acceleration = 10,
			use_nav_cost_map_volumes = false,
			ai_query_distance = 0.8,
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
					stagger_types.explosion,
					stagger_types.heavy,
					stagger_types.none,
					stagger_types.none,
					stagger_types.explosion
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
		plague_wave = {
			fx_separation_dist = 1.5,
			max_speed = 20,
			fx_unit = "units/beings/enemies/chaos_sorcerer_fx/chr_chaos_sorcerer_fx",
			launch_animation = "wave_summon_release",
			buff_wave_impact_name = "plague_wave_face_base",
			overflow_dist = 5,
			fx_name_running = "fx/chaos_sorcerer_plauge_wave_01",
			fx_name_arrived = "fx/chaos_sorcerer_plague_wave_hit_01",
			start_speed = 10,
			particle_arrived_stop_mode = "stop",
			player_query_distance = 0.8,
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
			acceleration = 15,
			use_nav_cost_map_volumes = false,
			ai_query_distance = 0.8,
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
					stagger_types.explosion,
					stagger_types.heavy,
					stagger_types.none,
					stagger_types.none,
					stagger_types.explosion
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
			fx_unit = "units/beings/enemies/chaos_sorcerer_fx/chr_chaos_sorcerer_fx",
			launch_animation = "wave_summon_release",
			buff_wave_impact_name = "plague_wave_face_base",
			overflow_dist = 5,
			fx_name_running = "fx/chaos_sorcerer_plauge_wave_01",
			fx_name_arrived = "fx/chaos_sorcerer_plague_wave_hit_01",
			start_speed = 10,
			particle_arrived_stop_mode = "stop",
			player_query_distance = 0.8,
			apply_buff_to_player = false,
			launch_wave_sound = "Play_magic_plague_wave",
			running_wave_sound = "Play_magic_plague_wave_loop",
			apply_impact_buff_to_ai = false,
			max_height = 2.5,
			impact_wave_sound = "Play_magic_plague_wave_hit",
			stop_running_wave_sound = "Stop_magic_plague_wave_loop",
			apply_buff_to_ai = false,
			time_of_life = 3,
			acceleration = 8,
			use_nav_cost_map_volumes = false,
			ai_query_distance = 0.8,
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
					stagger_types.explosion,
					stagger_types.heavy,
					stagger_types.none,
					stagger_types.none,
					stagger_types.explosion
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
			fx_unit = "units/hub_elements/empty",
			acceleration = 25,
			buff_wave_impact_name = "vermintide_face_base",
			overflow_dist = 5,
			fx_name_running = "fx/chr_grey_seer_lightning_wave_01",
			fx_name_arrived = "fx/chr_grey_seer_lightning_hit_02",
			start_speed = 12,
			particle_arrived_stop_mode = "stop",
			player_query_distance = 1,
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
			ai_query_distance = 1,
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
					stagger_types.explosion,
					stagger_types.heavy,
					stagger_types.none,
					stagger_types.none,
					stagger_types.explosion
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
	fx_separation_dist = 0.45,
	max_speed = 100,
	ignore_obstacles = true,
	acceleration = 100,
	overflow_dist = 0,
	buff_template_name = "sienna_adept_ability_trail",
	start_speed = 15,
	fx_name_running = "fx/brw_adept_skill_02",
	player_query_distance = 1,
	apply_buff_to_player = true,
	blob_separation_dist = 1,
	fx_name_impact = "fx/brw_adept_skill_02",
	apply_impact_buff_to_ai = false,
	max_height = 2.5,
	fx_name_arrived = "fx/brw_adept_skill_02",
	fx_name_filled = "fx/brw_adept_skill_02",
	apply_buff_to_ai = true,
	time_of_life = 6,
	particle_arrived_stop_mode = "stop",
	launch_wave_sound = "Play_sienna_adept_blink_ability",
	ai_query_distance = 2,
	buff_template_type = "sienna_adept_ability_trail",
	apply_impact_buff_to_player = false,
	fx_name_init = "fx/brw_adept_skill_02",
	immune_breeds = {},
	add_buff_func = function (damage_wave_ext, target_unit, buff_template_name, attacker_unit, source_unit)
		if Unit.alive(target_unit) then
			local buff_system = Managers.state.entity:system("buff_system")

			buff_system:add_buff(target_unit, buff_template_name, attacker_unit, false, nil, source_unit)
		end
	end,
	leave_area_func = function (unit)
		if Unit.alive(unit) then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local buff_stacks = buff_extension:get_stacking_buff("sienna_adept_ability_trail")
			local buff = buff_stacks and buff_stacks[1]

			if buff then
				local t = Managers.time:time("game")
				buff.start_time = t
				buff.duration = buff.template.leave_linger_time
			end
		end
	end
}
DamageWaveTemplates.templates.sienna_adept_ability_trail_increased_duration = table.clone(DamageWaveTemplates.templates.sienna_adept_ability_trail)
DamageWaveTemplates.templates.sienna_adept_ability_trail_increased_duration.time_of_life = 10
DamageWaveTemplates.templates.sienna_adept_ability_trail_increased_duration.fx_name_init = "fx/brw_adept_skill_02_upgraded"
DamageWaveTemplates.templates.sienna_adept_ability_trail_increased_duration.fx_name_running = "fx/brw_adept_skill_02_upgraded"
DamageWaveTemplates.templates.sienna_adept_ability_trail_increased_duration.fx_name_impact = "fx/brw_adept_skill_02_upgraded"
DamageWaveTemplates.templates.sienna_adept_ability_trail_increased_duration.fx_name_filled = "fx/brw_adept_skill_02_upgraded"
DamageWaveTemplates.templates.sienna_adept_ability_trail_increased_duration.fx_name_arrived = "fx/brw_adept_skill_02_upgraded"
DamageWaveTemplates.templates.thornsister_thorn_wall_push = {
	launch_wave_sound = "career_ability_kerilian_thorngrasp",
	max_speed = 10,
	ignore_obstacles = true,
	time_of_life = 6,
	acceleration = 100,
	overflow_dist = 0.2,
	fx_name_running = "fx/thorn_vines",
	particle_arrived_stop_mode = "stop",
	start_speed = 10,
	fx_unit = "units/hub_elements/empty",
	player_query_distance = 1.5,
	apply_buff_to_player = false,
	apply_impact_buff_to_ai = false,
	max_height = 2.5,
	apply_buff_to_ai = false,
	create_blobs = false,
	ai_query_distance = 1.5,
	apply_impact_buff_to_player = false,
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
		push_along_wave_direction = true,
		drag_along_wave = true,
		stagger_impact = {
			stagger_types.heavy,
			stagger_types.heavy,
			stagger_types.heavy,
			stagger_types.none,
			stagger_types.heavy,
			stagger_types.medium
		},
		stagger_duration = {
			0.5,
			0.5,
			0.5,
			0,
			0.5,
			0.5
		},
		stagger_refresh_time = {
			0.5,
			0.5,
			0.5,
			math.huge,
			0.5,
			math.huge
		},
		stagger_distance_table = {
			0.5,
			0.5,
			0.5,
			0.5,
			0.5,
			1
		},
		wave_drag_multiplier_table = {
			1,
			0.1,
			1,
			0,
			1,
			0
		}
	},
	update_func = function (damage_wave_ext, unit, position, t, dt)
		local update_data = damage_wave_ext._update_data

		if not update_data then
			update_data = {
				next_spawn_t = 0
			}
			damage_wave_ext._update_data = update_data
		end

		if update_data.next_spawn_t <= t and damage_wave_ext.wave_direction then
			local unit_name = "units/beings/player/way_watcher_thornsister/abilities/ww_thornsister_thorn_wave_01"
			local scale_min = 0.75
			local scale_max = 1.25
			local angle_variance = math.rad(15)
			local max_depth = 0.1
			local next_spawn_delay_min = 0.1
			local next_spawn_delay_max = 0.2
			local spread_diameter = 1
			local num_tries = 3
			local wave_rotation = Quaternion.look(damage_wave_ext.wave_direction:unbox())
			local wave_half_width = damage_wave_ext.template.ai_query_distance
			local wave_right = Quaternion.right(wave_rotation) * math.lerp(-wave_half_width, wave_half_width, math.random())
			local depth_offset = Vector3(0, 0, -max_depth * math.random())
			local spawn_pos, p1, p2, p3 = ConflictUtils.get_spawn_pos_on_circle(damage_wave_ext.nav_world, position + wave_right, 0, spread_diameter, num_tries)

			if spawn_pos then
				local random_rotation = math.lerp(-angle_variance, angle_variance, math.random())
				local spawn_rotation = Quaternion.multiply(wave_rotation, Quaternion.axis_angle(Vector3.up(), random_rotation))
				local floor_normal = Vector3.normalize(Vector3.cross(p2 - p1, p3 - p1))
				local forward = Quaternion.forward(spawn_rotation)
				local right = Vector3.cross(forward, floor_normal)
				forward = Vector3.cross(floor_normal, right)
				spawn_rotation = Quaternion.look(forward, floor_normal)
				local new_unit = Managers.state.unit_spawner:spawn_local_unit(unit_name, spawn_pos + depth_offset, spawn_rotation)
				local random_scale = math.lerp(scale_min, scale_max, math.random())

				Unit.set_local_scale(new_unit, 0, Vector3(random_scale, random_scale, random_scale))
			end

			update_data.next_spawn_t = t + math.lerp(next_spawn_delay_min, next_spawn_delay_max, math.random())
		end
	end,
	on_arrive_func = function (damage_wave_ext, position, rotation)
		local wall_data = damage_wave_ext.optional_data

		if wall_data then
			local explosion_template = "we_thornsister_career_skill_wall_explosion"
			local scale = 1
			local source_unit = damage_wave_ext.source_unit
			local power_level = wall_data.power_level
			local area_damage_system = Managers.state.entity:system("area_damage_system")

			area_damage_system:create_explosion(source_unit, position, rotation, explosion_template, scale, "career_ability", power_level, false)

			local wall_index = wall_data.wall_index
			local segments = wall_data.boxed_wall_segments

			for i = 1, #segments, 1 do
				local spawn_position = segments[i]:unbox()

				Managers.state.unit_spawner:request_spawn_network_unit("thornsister_thorn_wall_unit", spawn_position, rotation, source_unit, wall_index, i)
			end
		end
	end
}

return
