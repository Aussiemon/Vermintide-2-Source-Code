-- chunkname: @scripts/unit_extensions/weapons/area_damage/liquid/damage_wave_templates.lua

local stagger_types = require("scripts/utils/stagger_types")

DamageWaveTemplates = {}
DamageWaveTemplates.templates = {
	plague_wave_teleport = {
		acceleration = 10,
		ai_query_distance = 0.8,
		apply_buff_to_ai = true,
		apply_buff_to_player = true,
		apply_impact_buff_to_ai = false,
		apply_impact_buff_to_player = true,
		buff_wave_impact_name = "plague_wave_face_base",
		create_bot_aoe_threat = true,
		damage_friendly_ai = true,
		fx_name_arrived = "fx/chaos_sorcerer_plague_wave_hit_01",
		fx_name_impact = "fx/plague_wave_03",
		fx_name_init = "fx/chaos_sorcerer_plauge_wave_02",
		fx_name_running = "fx/chaos_sorcerer_plauge_wave_01",
		fx_separation_dist = 1.5,
		fx_unit = "units/beings/enemies/chaos_sorcerer_fx/chr_chaos_sorcerer_fx",
		impact_wave_sound = "Play_magic_plague_wave_hit",
		launch_animation = "wave_summon_release",
		launch_wave_sound = "Play_magic_plague_wave",
		max_height = 2.5,
		max_speed = 10,
		nav_cost_map_cost_type = "plague_wave",
		overflow_dist = 5,
		particle_arrived_stop_mode = "stop",
		player_query_distance = 0.8,
		running_wave_sound = "Play_magic_plague_wave_loop",
		start_speed = 5,
		stop_running_wave_sound = "Stop_magic_plague_wave_loop",
		time_of_life = 10,
		trigger_dialogue_on_impact = true,
		use_nav_cost_map_volumes = false,
		immune_breeds = {
			chaos_exalted_sorcerer = true,
			chaos_plague_sorcerer = true,
			chaos_spawn = true,
			chaos_troll = true,
			skaven_grey_seer = true,
			skaven_rat_ogre = true,
			skaven_stormfiend = true,
		},
		ai_push_data = {
			push_along_wave_direction = true,
			stagger_distance = 3,
			stagger_impact = {
				stagger_types.explosion,
				stagger_types.heavy,
				stagger_types.none,
				stagger_types.none,
				stagger_types.explosion,
			},
			stagger_duration = {
				2.5,
				1,
				0,
				0,
				4,
			},
		},
		player_push_data = {
			ahead_dist = 1.5,
			dodged_width = 0.5,
			player_pushed_speed = 20,
			push_forward_offset = 1.5,
			push_width = 1.25,
		},
	},
	plague_wave = {
		acceleration = 15,
		ai_query_distance = 0.8,
		apply_buff_to_ai = true,
		apply_buff_to_player = true,
		apply_impact_buff_to_ai = false,
		apply_impact_buff_to_player = true,
		buff_wave_impact_name = "plague_wave_face_base",
		create_bot_aoe_threat = true,
		damage_friendly_ai = true,
		fx_name_arrived = "fx/chaos_sorcerer_plague_wave_hit_01",
		fx_name_impact = "fx/plague_wave_03",
		fx_name_init = "fx/chaos_sorcerer_plauge_wave_02",
		fx_name_running = "fx/chaos_sorcerer_plauge_wave_01",
		fx_separation_dist = 1.5,
		fx_unit = "units/beings/enemies/chaos_sorcerer_fx/chr_chaos_sorcerer_fx",
		impact_wave_sound = "Play_magic_plague_wave_hit",
		launch_animation = "wave_summon_release",
		launch_wave_sound = "Play_magic_plague_wave",
		max_height = 2.5,
		max_speed = 20,
		nav_cost_map_cost_type = "plague_wave",
		overflow_dist = 5,
		particle_arrived_stop_mode = "stop",
		player_query_distance = 0.8,
		running_wave_sound = "Play_magic_plague_wave_loop",
		start_speed = 10,
		stop_running_wave_sound = "Stop_magic_plague_wave_loop",
		time_of_life = 10,
		trigger_dialogue_on_impact = true,
		use_nav_cost_map_volumes = false,
		immune_breeds = {
			chaos_exalted_sorcerer = true,
			chaos_plague_sorcerer = true,
			chaos_spawn = true,
			chaos_troll = true,
			skaven_grey_seer = true,
			skaven_rat_ogre = true,
			skaven_stormfiend = true,
		},
		ai_push_data = {
			push_along_wave_direction = true,
			stagger_distance = 3,
			stagger_impact = {
				stagger_types.explosion,
				stagger_types.heavy,
				stagger_types.none,
				stagger_types.none,
				stagger_types.explosion,
			},
			stagger_duration = {
				2.5,
				1,
				0,
				0,
				4,
			},
		},
		player_push_data = {
			ahead_dist = 1.5,
			dodged_width = 0.5,
			player_pushed_speed = 20,
			push_forward_offset = 1.5,
			push_width = 1.25,
		},
	},
	pattern_plague_wave = {
		acceleration = 8,
		ai_query_distance = 0.8,
		apply_buff_to_ai = false,
		apply_buff_to_player = false,
		apply_impact_buff_to_ai = false,
		apply_impact_buff_to_player = true,
		buff_wave_impact_name = "plague_wave_face_base",
		damage_friendly_ai = true,
		fx_name_arrived = "fx/chaos_sorcerer_plague_wave_hit_01",
		fx_name_impact = "fx/plague_wave_03",
		fx_name_init = "fx/chaos_sorcerer_plauge_wave_02",
		fx_name_running = "fx/chaos_sorcerer_plauge_wave_01",
		fx_separation_dist = 1.5,
		fx_unit = "units/beings/enemies/chaos_sorcerer_fx/chr_chaos_sorcerer_fx",
		impact_wave_sound = "Play_magic_plague_wave_hit",
		launch_animation = "wave_summon_release",
		launch_wave_sound = "Play_magic_plague_wave",
		max_height = 2.5,
		max_speed = 15,
		nav_cost_map_cost_type = "plague_wave",
		overflow_dist = 5,
		particle_arrived_stop_mode = "stop",
		player_query_distance = 0.8,
		running_wave_sound = "Play_magic_plague_wave_loop",
		start_speed = 10,
		stop_running_wave_sound = "Stop_magic_plague_wave_loop",
		time_of_life = 3,
		use_nav_cost_map_volumes = false,
		immune_breeds = {
			chaos_exalted_sorcerer = true,
			chaos_plague_sorcerer = true,
			chaos_spawn = true,
			chaos_troll = true,
			skaven_rat_ogre = true,
			skaven_stormfiend = true,
		},
		ai_push_data = {
			push_along_wave_direction = true,
			stagger_distance = 3,
			stagger_impact = {
				stagger_types.explosion,
				stagger_types.heavy,
				stagger_types.none,
				stagger_types.none,
				stagger_types.explosion,
			},
			stagger_duration = {
				2.5,
				1,
				0,
				0,
				4,
			},
		},
		player_push_data = {
			ahead_dist = 1.5,
			dodged_width = 0.5,
			player_pushed_speed = 17,
			push_forward_offset = 1.5,
			push_width = 1.25,
		},
	},
	vermintide = {
		acceleration = 25,
		ai_query_distance = 1,
		apply_buff_to_ai = true,
		apply_buff_to_player = true,
		apply_impact_buff_to_ai = false,
		apply_impact_buff_to_player = true,
		buff_wave_impact_name = "vermintide_face_base",
		create_bot_aoe_threat = true,
		damage_friendly_ai = true,
		fx_name_arrived = "fx/chr_grey_seer_lightning_hit_02",
		fx_name_impact = "fx/chr_grey_seer_lightning_hit_01",
		fx_name_init = "fx/chr_grey_seer_lightning_init_01",
		fx_name_running = "fx/chr_grey_seer_lightning_wave_01",
		fx_separation_dist = 1.5,
		fx_unit = "units/hub_elements/empty",
		max_height = 2.5,
		max_speed = 25,
		nav_cost_map_cost_type = "plague_wave",
		overflow_dist = 5,
		particle_arrived_stop_mode = "stop",
		player_query_distance = 1,
		running_wave_sound = "Play_emitter_grey_seer_electric_ground_wave",
		start_speed = 12,
		stop_running_wave_sound = "Stop_emitter_grey_seer_electric_ground_wave",
		time_of_life = 10,
		trigger_dialogue_on_impact = true,
		use_nav_cost_map_volumes = false,
		immune_breeds = {
			chaos_exalted_sorcerer = true,
			chaos_plague_sorcerer = true,
			chaos_spawn = true,
			chaos_troll = true,
			skaven_grey_seer = true,
			skaven_rat_ogre = true,
			skaven_stormfiend = true,
		},
		ai_push_data = {
			push_along_wave_direction = true,
			stagger_distance = 3,
			stagger_impact = {
				stagger_types.explosion,
				stagger_types.heavy,
				stagger_types.none,
				stagger_types.none,
				stagger_types.explosion,
			},
			stagger_duration = {
				2.5,
				1,
				0,
				0,
				4,
			},
		},
		player_push_data = {
			ahead_dist = 1.5,
			dodged_width = 0.5,
			player_pushed_speed = 17,
			push_forward_offset = 1.5,
			push_width = 1.25,
		},
	},
}
DamageWaveTemplates.templates.sienna_adept_ability_trail = {
	acceleration = 100,
	ai_query_distance = 2,
	apply_buff_to_ai = true,
	apply_buff_to_player = true,
	apply_impact_buff_to_ai = false,
	apply_impact_buff_to_player = false,
	blob_separation_dist = 1,
	buff_template_name = "sienna_adept_ability_trail",
	buff_template_type = "sienna_adept_ability_trail",
	fx_name_arrived = "fx/brw_adept_skill_02",
	fx_name_filled = "fx/brw_adept_skill_02",
	fx_name_impact = "fx/brw_adept_skill_02",
	fx_name_init = "fx/brw_adept_skill_02",
	fx_name_running = "fx/brw_adept_skill_02",
	fx_separation_dist = 0.45,
	ignore_obstacles = true,
	launch_wave_sound = "Play_sienna_adept_blink_ability",
	max_height = 2.5,
	max_speed = 100,
	overflow_dist = 0,
	particle_arrived_stop_mode = "stop",
	player_query_distance = 1,
	start_speed = 15,
	time_of_life = 6,
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
	end,
}
DamageWaveTemplates.templates.sienna_adept_ability_trail_increased_duration = table.clone(DamageWaveTemplates.templates.sienna_adept_ability_trail)
DamageWaveTemplates.templates.sienna_adept_ability_trail_increased_duration.time_of_life = 10
DamageWaveTemplates.templates.sienna_adept_ability_trail_increased_duration.fx_name_init = "fx/brw_adept_skill_02_upgraded"
DamageWaveTemplates.templates.sienna_adept_ability_trail_increased_duration.fx_name_running = "fx/brw_adept_skill_02_upgraded"
DamageWaveTemplates.templates.sienna_adept_ability_trail_increased_duration.fx_name_impact = "fx/brw_adept_skill_02_upgraded"
DamageWaveTemplates.templates.sienna_adept_ability_trail_increased_duration.fx_name_filled = "fx/brw_adept_skill_02_upgraded"
DamageWaveTemplates.templates.sienna_adept_ability_trail_increased_duration.fx_name_arrived = "fx/brw_adept_skill_02_upgraded"
DamageWaveTemplates.templates.thornsister_thorn_wall_push = {
	acceleration = 100,
	ai_query_distance = 1.5,
	apply_buff_to_ai = false,
	apply_buff_to_player = false,
	apply_impact_buff_to_ai = false,
	apply_impact_buff_to_player = false,
	create_blobs = false,
	damage_friendly_ai = true,
	fx_name_running = "fx/thorn_vines",
	fx_unit = "units/hub_elements/empty",
	ignore_obstacles = true,
	is_transient = true,
	launch_wave_sound = "career_ability_kerilian_thorngrasp",
	max_height = 2.5,
	max_speed = 10,
	overflow_dist = 0.2,
	particle_arrived_stop_mode = "stop",
	player_query_distance = 1.5,
	start_speed = 10,
	time_of_life = 6,
	transient_name_override = "units/beings/player/way_watcher_thornsister/abilities/ww_thornsister_thorn_wave_01",
	immune_breeds = {
		chaos_exalted_sorcerer = true,
		chaos_plague_sorcerer = true,
		chaos_spawn = true,
		chaos_troll = true,
		skaven_grey_seer = true,
		skaven_rat_ogre = true,
		skaven_stormfiend = true,
	},
	ai_push_data = {
		drag_along_wave = true,
		push_along_wave_direction = true,
		stagger_impact = {
			stagger_types.heavy,
			stagger_types.heavy,
			stagger_types.heavy,
			stagger_types.none,
			stagger_types.heavy,
			stagger_types.medium,
		},
		stagger_duration = {
			0.5,
			0.5,
			0.5,
			0,
			0.5,
			0.5,
		},
		stagger_refresh_time = {
			0.5,
			0.5,
			0.5,
			math.huge,
			0.5,
			math.huge,
		},
		stagger_distance_table = {
			0.5,
			0.5,
			0.5,
			0.5,
			0.5,
			1,
		},
		wave_drag_multiplier_table = {
			1,
			0.1,
			1,
			0,
			1,
			0,
		},
	},
	update_func = function (damage_wave_ext, unit, position, t, dt)
		local update_data = damage_wave_ext._update_data

		if not update_data then
			update_data = {
				next_spawn_t = 0,
			}
			damage_wave_ext._update_data = update_data
		end

		if t >= update_data.next_spawn_t and damage_wave_ext.wave_direction then
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

			for i = 1, #segments do
				local spawn_position = segments[i]:unbox()

				Managers.state.unit_spawner:request_spawn_network_unit("thornsister_thorn_wall_unit", spawn_position, rotation, source_unit, wall_index, i)
			end
		end
	end,
}

local function necro_wave_try_direction(nav_world, from, velocity, d_angle)
	local next_to = from + Quaternion.rotate(Quaternion.axis_angle(Vector3.up(), -d_angle), velocity)
	local next_success, next_pos = GwNavQueries.raycast(nav_world, from, next_to)
	local dir = Vector3.normalize(next_pos - from)

	if next_success then
		return true, next_pos, dir
	end

	return false, next_pos, dir
end

DamageWaveTemplates.templates.necromancer_curse_wave = {
	acceleration = 0,
	apply_buff_to_ai = false,
	apply_buff_to_player = false,
	apply_impact_buff_to_ai = true,
	apply_impact_buff_to_player = false,
	buff_wave_impact_name = "sienna_necromancer_career_skill_on_hit_damage",
	damage_friendly_ai = false,
	fx_name_running = "fx/necromancer_wave",
	fx_unit = "units/hub_elements/empty",
	ignore_obstacles = true,
	max_height = 2.5,
	max_speed = 4,
	num_waves = 1,
	overflow_dist = 0.2,
	particle_arrived_stop_mode = "stop",
	player_query_distance = 2.2,
	running_wave_sound = "Play_career_necro_ability_withering_wave_loop",
	spawn_separation_dist = 0.4,
	start_speed = 4,
	stop_running_wave_sound = "Stop_career_necro_ability_withering_wave_loop",
	target_separation_dist = 1.5,
	time_of_life = 3.5,
	immune_breeds = {},
	running_spawn_config = {
		{
			frequency = 1,
			max_random_angle = 0,
			separation_type = "box",
			spawn_type = "unit",
			start_delay = 0,
			names = {
				"units/decals/necromancer_ability_decal",
			},
			bounds = {
				0,
				0,
				0,
			},
			offset = {
				0,
				4,
				0,
			},
			on_spawn = function (damage_wave_extension, config, name, unit, world)
				local scale = Vector3(5, 6, 5)

				Unit.set_local_scale(unit, 0, scale)

				local start_time = World.time(Application.main_world())
				local speed = DamageWaveTemplates.templates.necromancer_curse_wave.start_speed
				local fade_time = scale.y / speed
				local end_time = start_time + fade_time
				local fade_direction = Vector2(0, 1)

				Unit.set_vector2_for_material(unit, "projector", "start_end_time", Vector2(start_time, end_time))
				Unit.set_vector2_for_material(unit, "projector", "fade_direction", fade_direction)
				Unit.set_scalar_for_material(unit, "projector", "trailing_fade_delay", 1.5)
			end,
		},
		{
			frequency = 0.5,
			max_random_angle = 0,
			separation_type = "box",
			spawn_type = "unit",
			start_delay = 0,
			names = {
				"units/decals/necromancer_ability_decal_mark1",
				"units/decals/necromancer_ability_decal_mark2",
				"units/decals/necromancer_ability_decal_mark3",
				"units/decals/necromancer_ability_decal_mark4",
				"units/decals/necromancer_ability_decal_mark5",
				"units/decals/necromancer_ability_decal_mark6",
			},
			bounds = {
				0.4,
				2,
				0,
			},
			offset = {
				-1.1,
				4,
				0,
			},
			on_spawn = function (damage_wave_extension, config, name, unit, world)
				local scale = Vector3(1, 1, 1)

				Unit.set_local_scale(unit, 0, scale)

				local start_time = World.time(Application.main_world())
				local end_time = start_time + 3
				local fade_time = 1.5

				Unit.set_vector2_for_material(unit, "projector", "start_end_time", Vector2(start_time, end_time))
				Unit.set_scalar_for_material(unit, "projector", "fade_time", fade_time)
				Unit.set_scalar_for_material(unit, "projector", "enable_fade", 1)
			end,
		},
		{
			frequency = 0.5,
			max_random_angle = 0,
			separation_type = "box",
			spawn_type = "unit",
			start_delay = 0.25,
			names = {
				"units/decals/necromancer_ability_decal_mark1",
				"units/decals/necromancer_ability_decal_mark2",
				"units/decals/necromancer_ability_decal_mark3",
				"units/decals/necromancer_ability_decal_mark4",
				"units/decals/necromancer_ability_decal_mark5",
				"units/decals/necromancer_ability_decal_mark6",
			},
			bounds = {
				0.4,
				2,
				0,
			},
			offset = {
				1.4,
				4,
				0,
			},
			on_spawn = function (damage_wave_extension, config, name, unit, world)
				local scale = Vector3(1, 1, 1)

				Unit.set_local_scale(unit, 0, scale)

				local start_time = World.time(Application.main_world())
				local end_time = start_time + 3
				local fade_time = 1.5

				Unit.set_vector2_for_material(unit, "projector", "start_end_time", Vector2(start_time, end_time))
				Unit.set_scalar_for_material(unit, "projector", "fade_time", fade_time)
				Unit.set_scalar_for_material(unit, "projector", "enable_fade", 1)
			end,
		},
	},
	ai_push_data = {
		drag_along_wave = false,
		push_along_wave_direction = true,
		stagger_impact = {
			stagger_types.heavy,
			stagger_types.heavy,
			stagger_types.heavy,
			stagger_types.none,
			stagger_types.heavy,
			stagger_types.heavy,
		},
		stagger_duration = {
			0.7,
			0.7,
			0,
			0,
			0.7,
			0.5,
		},
		stagger_refresh_time = {
			math.huge,
			math.huge,
			math.huge,
			math.huge,
			math.huge,
			math.huge,
		},
		stagger_distance_table = {
			0.5,
			0.5,
			0.5,
			0.5,
			0.5,
			1,
		},
		wave_drag_multiplier_table = {
			1,
			0.1,
			0,
			0,
			1,
			0,
		},
		hit_half_extends = {
			2.5,
			0.5,
			1.5,
		},
	},
	update_func = function (damage_wave_ext, unit, position, t, dt)
		if not damage_wave_ext.wave_direction then
			return
		end

		local update_data = damage_wave_ext._update_data

		if not update_data then
			local wave_direction = damage_wave_ext.wave_direction:unbox()

			update_data = {
				failed_attempts = 0,
				next_direction_update_t = 0,
				next_spawn_t = 0,
				hand_units_by_player = {},
				original_direction = Vector3Box(wave_direction),
				last_pos = Vector3Box(position - wave_direction),
			}
			damage_wave_ext._update_data = update_data
		end

		if script_data.debug_necromancer_curse_wave then
			QuickDrawer:sphere(position, 0.5)
		end

		if not Managers.player.is_server then
			return
		end

		if t >= update_data.next_direction_update_t then
			if update_data.next_direction then
				damage_wave_ext.wave_direction = update_data.next_direction
				update_data.next_direction = nil
			end

			local acceleration = damage_wave_ext.acceleration

			assert(not acceleration or acceleration == 0, "Calculations won't be accurate if wave has acceleration")

			local radius = DamageWaveTemplates.templates.necromancer_curse_wave.ai_query_distance
			local speed = damage_wave_ext.wave_speed
			local velocity = damage_wave_ext.wave_direction:unbox() * speed * radius
			local from = position
			local to = position + update_data.original_direction:unbox() * speed * radius * 2
			local nav_world = Managers.state.entity:system("ai_system"):nav_world()
			local success, pos = GwNavQueries.raycast(nav_world, from, to)
			local next_pos

			if success or Vector3.distance_squared(from, pos) > radius * radius then
				update_data.next_direction = update_data.original_direction
				next_pos = pos
			else
				to = from + velocity
				success, pos = GwNavQueries.raycast(nav_world, from, to)

				if success then
					update_data.next_direction_update_t = t + 1
				elseif update_data.failed_attempts < 4 then
					local next_from = pos + Vector3.normalize(from - pos) * radius
					local d_angle = math.pi * 0.25

					repeat
						local new_dir

						success, next_pos, new_dir = necro_wave_try_direction(nav_world, next_from, velocity, -d_angle)

						if success then
							update_data.next_direction = Vector3Box(new_dir)

							break
						end

						success, next_pos, new_dir = necro_wave_try_direction(nav_world, next_from, velocity, d_angle)

						if success then
							update_data.next_direction = Vector3Box(new_dir)

							break
						end

						success, next_pos, new_dir = necro_wave_try_direction(nav_world, next_from, velocity, -2 * d_angle)

						if success then
							update_data.next_direction = Vector3Box(new_dir)

							break
						end

						success, next_pos, new_dir = necro_wave_try_direction(nav_world, next_from, velocity, 2 * d_angle)

						if success then
							update_data.next_direction = Vector3Box(new_dir)
						end

						break
					until true
				end
			end

			if success then
				update_data.next_direction_update_t = t + 1
				update_data.failed_attempts = 0
			elseif next_pos then
				local time_to_reach = (Vector3.distance(next_pos, from) - radius) / speed

				update_data.next_direction_update_t = t + time_to_reach
				update_data.failed_attempts = update_data.failed_attempts + 1
			end
		end
	end,
	on_arrive_func = function (damage_wave_ext, position, rotation)
		return
	end,
}

local wave_linger = table.clone(DamageWaveTemplates.templates.necromancer_curse_wave)

wave_linger.fx_name_filled = "fx/necromancer_wave_linger"
wave_linger.fx_separation_dist = 1.5
wave_linger.blob_separation_dist = 1
wave_linger.apply_buff_to_owner = true
wave_linger.buff_template_name = "sienna_necromancer_empowered_overcharge"
wave_linger.buff_template_type = "sienna_necromancer_empowered_overcharge"

wave_linger.add_buff_func = function (damage_wave_ext, target_unit, buff_template_name, attacker_unit, source_unit)
	if not ALIVE[target_unit] or not Managers.state.network.is_server then
		return
	end

	if target_unit ~= damage_wave_ext.source_unit then
		return
	end

	local player = Managers.player:owner(target_unit)

	if not player then
		return
	end

	local buff_extension = ScriptUnit.extension(target_unit, "buff_system")
	local buff_stacks = buff_extension:get_stacking_buff(buff_template_name)
	local buff = buff_stacks and buff_stacks[1]

	if not buff then
		local buff_system = Managers.state.entity:system("buff_system")

		buff_system:add_buff_synced(target_unit, "sienna_necromancer_empowered_overcharge", BuffSyncType.ClientAndServer, nil, player.peer_id)
	end
end

wave_linger.leave_area_func = function (unit)
	if ALIVE[unit] then
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local buff_stacks = buff_extension:get_stacking_buff("sienna_necromancer_empowered_overcharge")
		local buff = buff_stacks and buff_stacks[1]

		if buff then
			buff_extension:remove_buff(buff.id)
		end
	end
end

DamageWaveTemplates.templates.necromancer_curse_wave_linger = wave_linger

for wave_name, wave_template in pairs(DamageWaveTemplates.templates) do
	local ai_push_data = wave_template.ai_push_data
	local hit_half_extends = ai_push_data and ai_push_data.hit_half_extends

	if hit_half_extends then
		fassert(not wave_template.ai_query_distance, "[DamageWaveTemplates] 'ai_query_distance' will be overridden by 'hit_half_extends'. (%s)", wave_name)

		local extends = Vector3Aux.unbox(hit_half_extends)

		wave_template.ai_query_distance = Vector3.length(extends)
	end
end
