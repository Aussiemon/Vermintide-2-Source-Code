-- chunkname: @scripts/settings/dlcs/shovel/buff_settings_shovel.lua

require("scripts/settings/profiles/career_constants")

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local stagger_types = require("scripts/utils/stagger_types")
local settings = DLCSettings.shovel
local ability_radius = 4
local ability_diameter = 2 * ability_radius
local buff_params = {}

local function apply_curse_buff(target_unit, attacking_unit, necromancer_unit)
	if not Managers.state.network.is_server then
		return
	end

	local buff_extension = ScriptUnit.has_extension(target_unit, "buff_system")

	if not buff_extension then
		return
	end

	local buff_to_add = "necromancer_cursed_blood"
	local talent_extension = necromancer_unit and ScriptUnit.has_extension(necromancer_unit, "talent_system")

	if talent_extension and talent_extension:has_talent("sienna_necromancer_4_2") then
		buff_to_add = "necromancer_cursed_blood_dot"
	end

	local buff_system = Managers.state.entity:system("buff_system")

	buff_system:add_buff(target_unit, buff_to_add, attacking_unit, true, nil, necromancer_unit)
end

local function send_soul_on_nearby_enemy(source_unit, range)
	local fp_extension = ScriptUnit.extension(source_unit, "first_person_system")

	fp_extension:play_hud_sound_event("Play_career_necro_ability_trapped_souls")

	local side = Managers.state.side.side_by_unit[source_unit]
	local broadphase_categories = side and side.enemy_broadphase_categories
	local nearby_ai_units = FrameTable.alloc_table()

	AiUtils.broadphase_query(POSITION_LOOKUP[source_unit], range, nearby_ai_units, broadphase_categories)

	local closest_enemy_or_nil = nearby_ai_units[1]
	local true_flight_template_name = "necromancer_trapped_soul"
	local position, rotation = fp_extension:camera_position_rotation()
	local angle = Quaternion.yaw(rotation)
	local target_vector = Vector3.normalize(Vector3.flat(Quaternion.forward(rotation)))
	local speed = 1
	local projectile_info = Projectiles.necromancer_trapped_soul
	local impact_template_name = "necromancer_trapped_soul"
	local scale = 0
	local is_crit = false
	local career_extension = ScriptUnit.extension(source_unit, "career_system")
	local power_level = career_extension:get_career_power_level()
	local projectile_system = Managers.state.entity:system("projectile_system")

	projectile_system:spawn_ai_true_flight_projectile(source_unit, closest_enemy_or_nil, true_flight_template_name, position, rotation, angle, target_vector, speed, projectile_info, impact_template_name, scale, is_crit, power_level)
end

local function _spawn_skeleton_ability_fx(source_unit, target_position, buff, world)
	World.create_particles(world, "fx/necromancer_summon_decal", target_position)

	buff.fx_spline_ids = buff.fx_spline_ids or {
		World.find_particles_variable(world, "fx/wpnfx_staff_death/curse_spirit", "spline_1"),
		World.find_particles_variable(world, "fx/wpnfx_staff_death/curse_spirit", "spline_2"),
		World.find_particles_variable(world, "fx/wpnfx_staff_death/curse_spirit", "spline_3"),
	}

	local fx_name_id = NetworkLookup.effects["fx/wpnfx_staff_death/curse_spirit_first"]
	local start_pos = POSITION_LOOKUP[source_unit] + Vector3.up() * 0.5
	local to_pos = target_position - start_pos
	local rot
	local fp_extension = ScriptUnit.has_extension(source_unit, "first_person_system")

	if fp_extension then
		rot = fp_extension:current_rotation()
	else
		rot = Quaternion.look(to_pos, Vector3.up())
	end

	local right = Quaternion.right(rot)

	start_pos = start_pos + right * math.random(-0.5, 0.5)

	local side = math.sign(Vector3.dot(to_pos, right))
	local offset = math.pi * math.random(0.1, 0.25)
	local side_offset = Quaternion.axis_angle(Vector3.up(), offset * side)

	to_pos = Quaternion.rotate(side_offset, to_pos)

	local mid_point = start_pos + to_pos * 0.5 + Vector3.up() * 2
	local spline_points = {
		start_pos,
		mid_point,
		target_position,
	}
end

local function _on_death_damage_nearby(owner_unit, buff, params, world)
	local position = POSITION_LOOKUP[owner_unit]
	local side_by_unit = Managers.state.side.side_by_unit
	local necromancer_unit = buff.source_attacker_unit

	if not ALIVE[necromancer_unit] then
		return
	end

	local necromancer_side = side_by_unit[necromancer_unit]
	local nearby_ai_units = FrameTable.alloc_table()
	local debuff_spread_radius = buff.template.debuff_spread_radius
	local num_nearby_units = AiUtils.broadphase_query(POSITION_LOOKUP[owner_unit], debuff_spread_radius, nearby_ai_units)
	local closest_enemy
	local best_score = math.huge

	for i = 1, num_nearby_units do
		local hit_unit = nearby_ai_units[i]
		local hit_side = side_by_unit[hit_unit]

		if hit_unit ~= owner_unit and necromancer_side ~= hit_side and HEALTH_ALIVE[hit_unit] then
			local score = Vector3.distance_squared(POSITION_LOOKUP[hit_unit], position)

			if score < best_score then
				best_score = score
				closest_enemy = hit_unit
			end
		end
	end

	if closest_enemy then
		local enemy_buff_ext = ScriptUnit.has_extension(closest_enemy, "buff_system")

		if enemy_buff_ext then
			local spread_params = FrameTable.alloc_table()

			spread_params.attacker_unit = owner_unit
			spread_params.source_attacker_unit = necromancer_unit

			local difficulty_name = Managers.state.difficulty:get_difficulty()
			local breed = Unit.get_data(owner_unit, "breed")
			local strengh = 1

			if breed.elite then
				strengh = 2
			end

			if breed.special then
				strengh = 3
			end

			if breed.primary_armor_category and breed.primary_armor_category == 6 or breed.armor_category == 6 then
				strengh = 4
			end

			if breed.boss then
				strengh = 5
			end

			local damage_lookup = {
				normal = {
					12,
					24,
					32,
					40,
					120,
				},
				hard = {
					18,
					36,
					48,
					60,
					180,
				},
				harder = {
					26.25,
					52.5,
					70,
					87.5,
					262.5,
				},
				hardest = {
					39.75,
					79.5,
					106,
					132.5,
					397.5,
				},
				cataclysm = {
					50.25,
					100.5,
					134,
					167.5,
					500,
				},
			}

			spread_params.external_optional_value = damage_lookup[difficulty_name][strengh] or 1

			enemy_buff_ext:add_buff("necromancer_on_death_delayed_health_damage", spread_params)

			local target_position
			local spine_node = Unit.has_node(closest_enemy, "j_spine") and Unit.node(closest_enemy, "j_spine")

			if spine_node then
				target_position = Unit.world_position(closest_enemy, spine_node)
			else
				target_position = POSITION_LOOKUP[closest_enemy] + 0.5 * Vector3.up()
			end

			if target_position then
				_spawn_skeleton_ability_fx(owner_unit, target_position, buff, world)
			end
		end
	end
end

local function _delayed_health_damage(unit, buff, params)
	if buff.delayed_damage_procced then
		return
	end

	buff.delayed_damage_procced = true

	local necromancer_unit = buff.source_attacker_unit
	local source_position = buff.source_spread_position:unbox()
	local impact_position = POSITION_LOOKUP[unit]
	local hit_direction = Vector3.normalize(impact_position - source_position)
	local between_pos = source_position + (impact_position - source_position) * 0.5
	local audio_system = Managers.state.entity:system("audio_system")

	audio_system:play_audio_position_event("Play_career_necro_passive_shadow_blood", between_pos)

	local damage_to_deal = buff.value
	local career_extension = ScriptUnit.has_extension(necromancer_unit, "career_system")
	local career_power_level = career_extension:get_career_power_level()
	local damage_profile = DamageProfileTemplates.curse_on_hit

	DamageUtils.add_damage_network_player(damage_profile, nil, career_power_level, unit, necromancer_unit, "torso", impact_position, Vector3.up(), "undefined")

	local blackboard = BLACKBOARDS[unit]
	local stagger_length = 1
	local stagger_type = stagger_types.medium
	local stagger_duration = 1
	local stagger_animation_scale
	local t = Managers.time:time("game")
	local stagger_value = 1
	local always_stagger = true

	AiUtils.stagger(unit, blackboard, necromancer_unit, hit_direction, stagger_length, stagger_type, stagger_duration, stagger_animation_scale, t, stagger_value, always_stagger)

	local buff_ext = ScriptUnit.extension(unit, "buff_system")

	buff_ext:remove_buff(buff.id)
end

local function _spawn_skeleton_ability(necromancer_unit, spawn_data, spawn_index)
	if not ALIVE[necromancer_unit] then
		return
	end

	local radius = ability_radius * 0.8
	local target_center = spawn_data.target_center:unbox()
	local seed = spawn_data.seed or math.random_seed()
	local x, y

	spawn_data.seed, x, y = math.get_uniformly_random_point_inside_sector_seeded(seed, 0, radius, 0, 2 * math.pi)

	local wanted_position = target_center + Vector3(x, y, 0)
	local nav_world = Managers.state.entity:system("ai_system"):nav_world()
	local traverse_logic = Managers.state.entity:system("ai_slot_system"):traverse_logic()
	local _, position = GwNavQueries.raycast(nav_world, target_center, wanted_position, traverse_logic)
	local career_extension = ScriptUnit.extension(necromancer_unit, "career_system")
	local passive_ability = career_extension:get_passive_ability_by_name("bw_necromancer")
	local done = passive_ability:spawn_army_pet(spawn_index, position, NecromancerPositionModes.Absolute)

	return position, done
end

local function is_local(unit)
	local player = Managers.player:owner(unit)

	return player and not player.remote
end

settings.buff_templates = {
	sienna_necromancer_passive_cursed_blood = {
		buffs = {
			{
				buff_func = "necromancer_apply_cursed_blood",
				event = "on_critical_hit",
				name = "sienna_necromancer_passive_cursed_blood",
			},
		},
	},
	sienna_necromancer_career_skill_damage_proc_aura = {
		buffs = {
			{
				ai_buff_name = "sienna_necromancer_career_skill_damage_proc_aura_buff_ai",
				name = "sienna_necromancer_career_skill_damage_proc_aura",
				owner_as_source = true,
				player_buff_name = "sienna_necromancer_career_skill_damage_proc_aura_buff",
				range = 15,
				remove_buff_func = "remove_side_buff_aura",
				server_only = true,
				update_frequency = 1,
				update_func = "side_buff_aura",
			},
		},
	},
	sienna_necromancer_career_skill_damage_proc_aura_buff = {
		buffs = {
			{
				buff_func = "sienna_necromancer_career_skill_damage_proc",
				damage = 10,
				event = "on_hit",
				max_stacks = 1,
				name = "sienna_necromancer_career_skill_damage_proc_aura_buff",
			},
		},
	},
	sienna_necromancer_career_skill_damage_proc_aura_buff_ai = {
		buffs = {
			{
				buff_func = "sienna_necromancer_career_skill_damage_proc",
				damage = 10,
				event = "on_damage_dealt",
				max_stacks = 1,
				name = "sienna_necromancer_career_skill_damage_proc_aura_buff_ai",
			},
		},
	},
	sienna_necromancer_career_skill_on_hit_damage = {
		buffs = {
			{
				apply_buff_func = "sienna_necromancer_on_hit_apply",
				duration = 10,
				max_stacks = 1,
				name = "sienna_necromancer_career_skill_on_hit_damage",
				offset_rotation_y = 90,
				particle_fx = "fx/skull_trap",
				remove_buff_func = "remove_attach_particle",
			},
		},
	},
	necromancer_cursed_blood = {
		buffs = {
			{
				buff_func = "necromancer_cursed_blood_on_death",
				debuff_spread_radius = 5,
				event = "on_death",
				explosion_template = "sienna_necromancer_passive_explosion",
				max_stacks = 1,
				name = "necromancer_cursed_blood",
			},
		},
	},
	necromancer_skeleton_timer = {
		buffs = {
			{
				duration = 20,
				icon = "sienna_necromancer_6_1",
				name = "necromancer_cursed_blood",
			},
		},
	},
	necromancer_harvest_curse = {
		buffs = {
			{
				max_stacks = 1,
				name = "necromancer_harvest_curse",
			},
		},
	},
	necromancer_on_death_delayed_health_damage = {
		buffs = {
			{
				apply_buff_func = "setup_delayed_damage",
				buff_func = "delayed_health_damage",
				debuff_spread_radius = 5,
				event = "on_death",
				max_stacks = 1,
				name = "necromancer_on_death_delayed_health_damage",
				remove_on_proc = true,
				update_func = "delayed_health_damage",
				update_start_delay = 0.1,
			},
		},
	},
	necromancer_cursed_blood_dot = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				buff_func = "necromancer_cursed_blood_on_death",
				damage_profile = "bleed",
				debuff_spread_radius = 5,
				event = "on_death",
				explosion_template = "sienna_necromancer_passive_explosion",
				max_stacks = 1,
				name = "necromancer_cursed_blood",
				time_between_dot_damages = 1.5,
				update_func = "apply_dot_damage",
				update_start_delay = 1.5,
				perks = {
					buff_perks.bleeding,
				},
			},
		},
	},
	necromancer_cursed_blood_delayed_damage = {
		buffs = {
			{
				apply_buff_func = "setup_delayed_damage",
				max_stacks = 1,
				name = "necromancer_cursed_blood_delayed_damage",
				update_func = "remove_and_apply_cursed_blood",
				update_start_delay = 0.3,
			},
		},
	},
	sienna_necromancer_pet_on_spawn_buff = {
		buffs = {
			{
				name = "lifetime",
				remove_buff_func = "sienna_necromancer_expire_spawned_pet",
			},
			{
				buff_func = "on_pet_damage_dealt",
				event = "on_damage_dealt",
				name = "hud_sound_trigger",
				sounds_to_play = {
					"career_necro_skeleton_damage",
				},
			},
		},
	},
	sienna_necromancer_pet_on_spawn_buff_charge = {
		buffs = {
			{
				buff_func = "add_pet_charge",
				event = "on_death",
				name = "pet_tracker",
			},
		},
	},
	sienna_necromancer_pet_attack_sfx = {
		buffs = {
			{
				buff_func = "on_pet_damage_dealt",
				event = "on_damage_dealt",
				name = "hud_sound_trigger",
				sounds_to_play = {
					"career_necro_skeleton_damage",
				},
			},
		},
	},
	sienna_necromancer_perk_1 = {
		buffs = {
			{
				devour_health_percent = 0.15,
				name = "sienna_necromancer_perk_1",
				radius = 5,
				update_func = "sienna_necromancer_perk_1_func",
			},
		},
	},
	necromancer_invulnerability_aura = {
		buffs = {
			{
				icon = "sienna_necromancer_passive",
				max_stacks = 1,
				name = "necromancer_invulnerability_aura",
				perks = {
					buff_perks.invulnerable,
				},
			},
		},
	},
	sienna_necromancer_perk_3 = {
		buffs = {
			{
				buff_func = "add_buff",
				buff_to_add = "sienna_necromancer_lifetaker_crit",
				event = "on_kill",
				name = "sienna_necromancer_perk_3",
			},
		},
	},
	sienna_necromancer_lifetaker_crit = {
		buffs = {
			{
				icon = "sienna_necromancer_passive",
				name = "sienna_necromancer_lifetaker_crit",
				refresh_durations = true,
				stat_buff = "critical_strike_chance",
				bonus = CareerConstants.bw_necromancer.lifetaker_bonus,
				max_stacks = CareerConstants.bw_necromancer.lifetaker_max_stacks,
				duration = CareerConstants.bw_necromancer.lifetaker_duration,
			},
		},
	},
	sienna_pets_alive_cooldown = {
		buffs = {
			{
				multiplier = 5,
				name = "sienna_pets_alive_cooldown",
				stat_buff = "cooldown_regen",
			},
		},
	},
	sienna_pet_spawn_charge = {
		buffs = {
			{
				duration = 20,
				duration_end_func = "spawn_pet",
				icon = "unit_frame_portrait_pet_skeleton",
				is_cooldown = true,
				max_stacks = 4,
				name = "sienna_pet_spawn_charge",
				refresh_other_stacks_on_remove = true,
			},
		},
	},
	necromancer_pet_ping_explosion = {
		buffs = {
			{
				name = "sienna_pet_ping_explosion",
				remove_buff_func = "pet_ping_explosion",
				particles = {
					{
						continuous = true,
						destroy_policy = "destroy",
						effect = "fx/warp_lightning_bolt",
						first_person = false,
						link_node = "j_spine",
						orphaned_policy = "destroy",
						third_person = true,
					},
				},
			},
		},
	},
	sienna_necromancer_empowered_overcharge = {
		buffs = {
			{
				buff_func = "sienna_necromancer_empowered_overcharge_kill",
				event = "on_kill",
				icon = "sienna_necromancer_6_3",
				max_stacks = 1,
				name = "sienna_necromancer_empowered_overcharge",
				percent_overcharge = 0.1,
				stat_buff = "overcharge_damage_immunity",
				perks = {
					buff_perks.overcharge_no_slow,
				},
			},
		},
	},
	death_staff_dot = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "death_staff_dot",
				damage_type = "burninating",
				duration = 6,
				name = "death_staff_dot",
				time_between_dot_damages = 1,
				update_func = "apply_dot_damage",
				update_start_delay = 1,
				perks = {
					buff_perks.burning,
				},
			},
		},
	},
	dual_wield_skeleton_attack_speed = {
		buffs = {
			{
				apply_buff_func = "apply_ai_attack_speed",
				name = "dual_wield_skeleton_attack_speed",
				remove_buff_func = "remove_ai_attack_speed",
				value = 1,
			},
		},
	},
	update_anim_movespeed = {
		buffs = {
			{
				name = "update_anim_movespeed",
				update_func = "update_anim_movespeed",
			},
		},
	},
	raise_dead_ability = {
		buffs = {
			{
				apply_buff_func = "on_raise_dead_start",
				name = "raise_dead_ability",
				remove_buff_on_duration_end = true,
				update_frequency = 0.2,
				update_func = "raise_dead_update",
				update_start_delay = 0.2,
				apply_condition = function (owner_unit, template, params)
					return is_local(params.source_attacker_unit)
				end,
				area_radius = ability_radius,
			},
			{
				area_unit_name = "units/hub_elements/empty",
				buff_area = true,
				buff_area_buff = "sienna_necromancer_career_skill_on_hit_damage",
				buff_enemies = true,
				name = "raise_dead_ability_curse_aura",
				apply_condition = function (owner_unit, template, params)
					local talent_ext = ScriptUnit.has_extension(params.source_attacker_unit, "talent_system")

					return talent_ext and talent_ext:has_talent("sienna_necromancer_6_2_2")
				end,
				area_radius = ability_radius,
			},
			{
				apply_buff_func = "raise_dead_apply",
				delay = 0.02,
				name = "raise_dead_ability_visuals",
				num_small_decals = 0,
				remove_buff_func = "raise_dead_remove",
				skull_spawn_frequency = 0.15,
				update_func = "raise_dead_visual_update",
				unit_names = {
					"units/decals/necromancer_ability_decal_mark1",
					"units/decals/necromancer_ability_decal_mark2",
					"units/decals/necromancer_ability_decal_mark3",
					"units/decals/necromancer_ability_decal_mark4",
					"units/decals/necromancer_ability_decal_mark5",
					"units/decals/necromancer_ability_decal_mark6",
				},
				num_skulls = {
					max = 8,
					min = 4,
				},
				area_radius = ability_radius,
			},
		},
	},
	raise_dead_ability_stagger = {
		buffs = {
			{
				max_stacks = 1,
				name = "raise_dead_ability_stagger",
				update_frequency = 0.75,
				update_func = "necromancer_ability_stagger_update",
				apply_condition = function (owner_unit, template, params)
					return Managers.state.network.is_server
				end,
			},
			{
				max_stacks = 1,
				name = "raise_dead_ability_stagger_visuals",
				update_func = "necromancer_ability_stagger_hands",
			},
		},
	},
	command_elite_challenge_tracker = {
		buffs = {
			{
				max_stacks = 1,
				name = "command_elite_challenge_tracker",
			},
		},
	},
	skeleton_command_attack_boost = {
		buffs = {
			{
				duration = 8,
				max_stacks = 1,
				multiplier = 1,
				name = "skeleton_command_attack_boost",
				refresh_durations = true,
				stat_buff = "damage_dealt",
			},
		},
	},
	skeleton_command_defend_boost = {
		buffs = {
			{
				multiplier = -0.12,
				name = "skeleton_command_defend_boost",
				stat_buff = "damage_taken",
			},
		},
	},
}
settings.proc_functions = {
	sienna_necromancer_5_1_on_kill = function (owner_unit, buff, params)
		if not ALIVE[owner_unit] then
			return
		end

		local killing_blow_data = params[1]

		if not killing_blow_data then
			return
		end

		local breed = params[2]

		if breed.elite then
			local cooldown_removed = buff.template.multiplier
			local career_extension = ScriptUnit.extension(owner_unit, "career_system")

			career_extension:reduce_activated_ability_cooldown_percent(cooldown_removed)
		end
	end,
	sienna_necromancer_add_recast_ready = function (owner_unit, buff, params)
		local ability_id = params[2]
		local career_extension = ScriptUnit.extension(owner_unit, "career_system")
		local current_cooldown = career_extension:current_ability_cooldown(ability_id)

		if current_cooldown == 0 then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local buff_to_add = buff.template.buff_to_add
			local buff_id = buff_extension:add_buff(buff_to_add)
			local recast_buff = buff_extension:get_buff_by_id(buff_id)

			recast_buff._source_buff = buff
			recast_buff._needs_target = buff.template.needs_target
		end
	end,
	necromancer_trigger_recast = function (owner_unit, buff, params)
		local ability_id = params[2]
		local career_extension = ScriptUnit.extension(owner_unit, "career_system")
		local current_cooldown = career_extension:current_ability_cooldown(ability_id)
		local career_ability = career_extension:ability_by_id(ability_id)
		local num_alive_ability_pets = career_ability:num_alive_career_ability_pets()
		local ignore_recast = current_cooldown == 0 and num_alive_ability_pets > 0

		if ignore_recast then
			return false
		end

		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

		table.clear(buff_params)
		buff_extension:add_buff(buff.template.cooldown_buff)

		return true
	end,
	necromancer_apply_cursed_blood = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local necromancer_unit = buff.necromancer_unit

		if not necromancer_unit then
			local profile_index = FindProfileIndex("bright_wizard")
			local career_index = career_index_from_name(profile_index, "bw_necromancer")
			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				if career_index == player:career_index() then
					necromancer_unit = player.player_unit
					buff.necromancer_unit = necromancer_unit

					break
				end
			end
		end

		local target_unit = params[1]

		apply_curse_buff(target_unit, owner_unit, necromancer_unit)
	end,
	sienna_necromancer_career_skill_damage_proc = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local hit_unit = params[1]
		local sienna_unit = buff.source_attacker_unit

		if not ALIVE[sienna_unit] then
			return
		end

		if not buff.last_hit_t then
			buff.last_hit_t = 0
		end

		local t = Managers.time:time("game")

		if t < buff.last_hit_t then
			return
		else
			buff.last_hit_t = t + 0.05
		end

		local damage_to_deal = buff.template.damage
		local buff_ext = ScriptUnit.has_extension(hit_unit, "buff_system")

		if buff_ext and buff_ext:has_buff_type("sienna_necromancer_career_skill_on_hit_damage") then
			local career_extension = ScriptUnit.has_extension(sienna_unit, "career_system")
			local career_power_level = career_extension:get_career_power_level()
			local damage_profile = DamageProfileTemplates.curse_on_hit

			DamageUtils.add_damage_network_player(damage_profile, nil, career_power_level, hit_unit, sienna_unit, "torso", POSITION_LOOKUP[hit_unit], Vector3.up(), "undefined")
		end
	end,
	sienna_necromancer_add_buff_to_pet = function (owner_unit, buff, params)
		local pet_unit = params[1]
		local buff_to_add = buff.template.buff_to_add
		local buff_extension = ScriptUnit.extension(pet_unit, "buff_system")

		table.clear(buff_params)

		buff_params.attacker_unit = owner_unit

		buff_extension:add_buff(buff_to_add, buff_params)
	end,
	sienna_necromancer_low_hp_kill_on_hit = function (owner_unit, buff, params)
		local buff_template = buff.template
		local health_threshold = buff_template.health_threshold
		local health_extension = ScriptUnit.extension(owner_unit, "health_system")
		local current_health_percent = health_extension:current_health_percent()

		if health_threshold < current_health_percent then
			return false
		end

		local cooldown_buff = buff_template.cooldown_buff
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

		buff_extension:add_buff(cooldown_buff, buff_params)

		local is_server = Managers.state.network.is_server

		if not is_server then
			return true
		end

		local side_by_unit = Managers.state.side.side_by_unit
		local player_side = side_by_unit[owner_unit]
		local player_pos = POSITION_LOOKUP[owner_unit]
		local num_to_kill = buff_template.num_enemies
		local radius = buff_template.radius
		local nearby_enemies = FrameTable.alloc_table()
		local num_nearby_units = AiUtils.broadphase_query(player_pos, radius, nearby_enemies)

		local function nearest_enemies_sort_func(unit_a, unit_b)
			local side_a = side_by_unit[unit_a]
			local side_b = side_by_unit[unit_b]

			if side_a ~= side_b then
				return side_a ~= player_side
			end

			return Vector3.distance_squared(player_pos, POSITION_LOOKUP[unit_a]) < Vector3.distance_squared(player_pos, POSITION_LOOKUP[unit_b])
		end

		table.sort(nearby_enemies, nearest_enemies_sort_func)

		num_to_kill = math.min(num_nearby_units, num_to_kill)

		for i = 1, num_to_kill do
			local unit = nearby_enemies[i]
			local blackboard = BLACKBOARDS[unit]
			local breed = blackboard.breed
			local is_boss = breed and breed.boss

			if side_by_unit[unit] == player_side then
				break
			end

			if not is_boss then
				AiUtils.kill_unit(unit, owner_unit)
			end
		end

		return true
	end,
	on_pet_damage_dealt = function (owner_unit, buff, params)
		local hit_unit = params[1]

		if owner_unit == hit_unit then
			return
		end

		local damage_type = params[10]

		if damage_type == "bleed" then
			return
		end

		local necromancer_unit = buff.source_attacker_unit
		local player = Managers.player:unit_owner(necromancer_unit)

		if not player then
			return
		end

		local sounds_to_play = buff.template.sounds_to_play
		local sound_to_play = sounds_to_play[math.random(1, #sounds_to_play)]
		local node = Unit.has_node(hit_unit, "j_spine") and "j_spine" or nil
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_audio_unit_event(sound_to_play, hit_unit, node)
	end,
	add_pet_charge = function (owner_unit, buff, params)
		local commander_unit = buff.source_attacker_unit

		if not ALIVE[owner_unit] then
			return
		end

		local status_extension = ScriptUnit.extension(commander_unit, "status_system")

		if status_extension:is_dead() then
			return
		end

		local career_extension = ScriptUnit.extension(commander_unit, "career_system")
		local passive_ability = career_extension:get_passive_ability_by_name("bw_necromancer")

		passive_ability:add_pet_charge(owner_unit)
	end,
	sienna_necromancer_5_3_free_charge = function (owner_unit, buff, params)
		local controlled_unit = params[1]

		if HEALTH_ALIVE[controlled_unit] then
			return
		end

		local buff_to_add = buff.template.buff_to_add
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

		buff_extension:add_buff(buff_to_add)
	end,
	sienna_necromancer_on_kill_harvest = function (owner_unit, buff, params)
		local killed_unit = params[3]
		local killed_buff_ext = ScriptUnit.has_extension(killed_unit, "buff_system")

		if killed_buff_ext and killed_buff_ext:has_buff_type("sienna_necromancer_career_skill_on_hit_damage") then
			local buff_ext = ScriptUnit.has_extension(owner_unit, "buff_system")

			if buff_ext then
				buff_ext:add_buff("sienna_necromancer_6_2_buff")
			end
		end
	end,
	thank_you_skeletal_add = function (owner_unit, buff, params)
		local commander_ext = ScriptUnit.extension(owner_unit, "ai_commander_system")
		local num_controlled = commander_ext:get_controlled_units_count()

		if num_controlled >= buff.template.skeleton_count then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local buff_to_add = buff.template.buff_to_add

			buff_extension:add_buff(buff_to_add)
		end
	end,
	thank_you_skeletal_remove = function (owner_unit, buff, params)
		local commander_ext = ScriptUnit.extension(owner_unit, "ai_commander_system")
		local num_controlled = commander_ext:get_controlled_units_count()

		if num_controlled <= buff.template.skeleton_count - 1 then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local buff_to_remove = buff.template.buff_to_remove
			local buffs = buff_extension:get_stacking_buff(buff_to_remove)

			if buffs and #buffs > 0 then
				buff_extension:remove_buff(buffs[1].id)
			end
		end
	end,
	trapped_souls_overcharge_lost = function (owner_unit, buff, params)
		local overcharge_lost = params[1]
		local max_overcharge = params[2]

		buff.total_overcharge_lost = buff.total_overcharge_lost + overcharge_lost

		local total_overcharge_lost = buff.total_overcharge_lost
		local percentage_overcharge_lost = total_overcharge_lost / max_overcharge
		local soul_threshold = buff.template.overcharge_threshold
		local num_souls_to_release = percentage_overcharge_lost / soul_threshold
		local range = 7.5

		for i = 1, num_souls_to_release do
			buff.total_overcharge_lost = buff.total_overcharge_lost - soul_threshold * max_overcharge

			send_soul_on_nearby_enemy(owner_unit, range)
		end
	end,
	sienna_necromancer_empowered_overcharge_kill = function (owner_unit, buff, params)
		local percent_vent = buff.template.percent_overcharge
		local overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
		local max_charge = overcharge_extension:get_max_value()

		overcharge_extension:remove_charge(max_charge * percent_vent)
	end,
	remove_necromancer_creeping_curse_always_blocking = function (owner_unit, buff, params)
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")
		local send_to_server = not Managers.state.network.is_server

		status_extension:set_override_blocking(nil, send_to_server)

		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

		buff_extension:remove_buff(buff.id)
	end,
	remove_buff_stack_on_proc = function (owner_unit, buff, params)
		local buff_ext = ScriptUnit.extension(owner_unit, "buff_system")
		local buff_to_remove = buff.template.buff_to_add
		local buffs = buff_ext:get_stacking_buff(buff_to_remove)

		if buffs and #buffs > 0 then
			buff_ext:remove_buff(buffs[1].id)
		end

		if not buffs or #buffs < 1 then
			buff_ext:remove_buff(buff.id)
		end
	end,
	necromancer_on_death_damage = function (owner_unit, buff, params, world)
		_on_death_damage_nearby(owner_unit, buff, params, world)

		return true
	end,
	delayed_health_damage = function (owner_unit, buff, params)
		_delayed_health_damage(owner_unit, buff, params)

		return true
	end,
	necromancer_ability_register_stagger = function (entering_unit, owner_unit, template, buff_area_unit, source_unit)
		if not ALIVE[entering_unit] then
			return
		end

		local buff_ext = ScriptUnit.has_extension(entering_unit, "buff_system")

		if buff_ext then
			table.clear(buff_params)

			buff_params.source_attacker_unit = source_unit
			buff_params.attacker_unit = owner_unit

			buff_ext:add_buff("raise_dead_ability_stagger", buff_params)
		end
	end,
	necromancer_ability_unregister_stagger = function (leaving_unit, owner_unit, template, buff_area_unit, source_unit)
		if not ALIVE[leaving_unit] then
			return
		end

		local buff_ext = ScriptUnit.has_extension(leaving_unit, "buff_system")

		if buff_ext then
			local stagger_buff = buff_ext:get_stacking_buff("raise_dead_ability_stagger_visuals")

			stagger_buff = stagger_buff and stagger_buff[1]

			if stagger_buff then
				buff_ext:remove_buff(stagger_buff.id)
			end
		end
	end,
	necromancer_crit_burst = function (owner_unit, buff, params, world, param_order)
		local is_crit = params[param_order.is_critical_strike]

		if not is_crit then
			return
		end

		local is_first_hit = params[param_order.first_hit]

		if not is_first_hit then
			return
		end

		local hit_unit = params[param_order.attacked_unit]
		local is_burning, applied_this_frame = Managers.state.status_effect:has_status(hit_unit, StatusEffectNames.burning_balefire)

		if not is_burning or applied_this_frame then
			return
		end

		local damage_dealt = params[param_order.damage_amount]

		if damage_dealt <= 0 then
			return
		end

		local template = buff.template
		local side = Managers.state.side.side_by_unit[owner_unit]
		local hit_pos = POSITION_LOOKUP[hit_unit]

		if not hit_pos then
			return
		end

		local unit_storage = Managers.state.unit_storage
		local hit_go_id = unit_storage:go_id(hit_unit)
		local node_id = 0

		if Unit.has_node(hit_unit, "j_spine") then
			node_id = Unit.node(hit_unit, "j_spine")
		end

		local network_manager = Managers.state.network

		network_manager.network_transmit:send_rpc_server("rpc_play_particle_effect", NetworkLookup.effects["fx/necromancer_cursed_explosion_blood"], hit_go_id, node_id, Vector3.zero(), Quaternion.identity(), false)
		network_manager.network_transmit:send_rpc_server("rpc_play_particle_effect", NetworkLookup.effects["fx/necromancer_cursed_explosion_blue"], hit_go_id, node_id, Vector3(0.5, 0, 0), Quaternion.identity(), false)

		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_audio_unit_event("Play_career_necro_ability_cursed_blood", hit_unit, "j_spine")

		local broadphase_categories = side.enemy_broadphase_categories
		local nearby_units = FrameTable.alloc_table()
		local num_nearby = AiUtils.broadphase_query(hit_pos, template.radius, nearby_units, broadphase_categories)

		if num_nearby == 0 then
			return
		end

		local t = Managers.time:time("game")
		local propagated_damage = damage_dealt * template.propagation_multiplier
		local career_extension = ScriptUnit.extension(owner_unit, "career_system")
		local power_level = career_extension:get_career_power_level()

		for i = 1, num_nearby do
			local target_unit = nearby_units[i]

			if target_unit ~= hit_unit then
				local damage_direction = Vector3.normalize(POSITION_LOOKUP[target_unit] - hit_pos)

				DamageUtils.add_damage_network(target_unit, owner_unit, propagated_damage, "torso", "buff", nil, damage_direction, "buff", nil, owner_unit, nil, nil, false, nil, nil, nil, nil, true)
				DamageUtils.stagger_ai(t, DamageProfileTemplates.necromancer_crit_burst_stagger, i + 1, power_level, target_unit, owner_unit, "torso", damage_direction, nil, nil, false, "buff", owner_unit)
			end
		end
	end,
	spawn_ripped_soul = function (owner_unit, buff, params)
		local killing_blow = params[1]
		local damage_type = killing_blow[2]

		if damage_type == "execute" then
			return
		end

		local killed_unit = params[3]
		local has_balefire = Managers.state.status_effect:has_status(killed_unit, "burning_balefire")

		if not has_balefire then
			return
		end

		local orb_starting_position = POSITION_LOOKUP[killed_unit] + Vector3(0, 0, 1)
		local orb_settings = buff.template.orb_settings
		local orb_name = orb_settings.orb_name
		local player = Managers.player:owner(owner_unit)
		local owner_peer_id = player.peer_id
		local cake_slice_dir = Vector3(0, 0, 1)
		local cake_slice_angle_radians = 2 * math.pi
		local orb_system = Managers.state.entity:system("orb_system")

		orb_system:spawn_orb(orb_name, owner_peer_id, orb_starting_position, cake_slice_dir, cake_slice_angle_radians)
	end,
	execute_man_sized_enemy = function (unit, buff, params)
		local hit_unit = params[1]
		local breed = ALIVE[hit_unit] and Unit.get_data(hit_unit, "breed")

		if not breed or breed.boss then
			return false
		end

		if not HEALTH_ALIVE[hit_unit] then
			return false
		end

		AiUtils.kill_unit(hit_unit, unit, nil, "execute")

		return true
	end,
	cursed_vigor_proc = function (unit, buff, params)
		local caster_unit = params[1]

		if unit == caster_unit then
			ProcFunctions.add_buff_local(unit, buff, params)
		end
	end,
}

local function is_bot(unit)
	local player = Managers.player:owner(unit)

	return player and player.bot_player
end

settings.buff_function_templates = {
	sienna_necromancer_perk_1_func = function (unit, buff, params)
		local player_unit = unit

		if ALIVE[player_unit] and Managers.player.is_server then
			local template = buff.template
			local radius = template.radius
			local devour_health_percent = template.devour_health_percent
			local position = POSITION_LOOKUP[player_unit]
			local nearby_enemy_units = FrameTable.alloc_table()
			local proximity_extension = Managers.state.entity:system("proximity_system")
			local broadphase = proximity_extension.enemy_broadphase
			local num_nearby_enemy_units = Broadphase.query(broadphase, position, radius, nearby_enemy_units)
			local side_manager = Managers.state.side

			for i = 1, num_nearby_enemy_units do
				local enemy_unit = nearby_enemy_units[i]

				if ALIVE[enemy_unit] and side_manager:is_enemy(player_unit, enemy_unit) then
					local health_extension = ScriptUnit.has_extension(enemy_unit, "health_system")

					if health_extension and devour_health_percent > health_extension:current_health_percent() then
						local damage_amount = health_extension:current_health()

						DamageUtils.add_damage_network(enemy_unit, player_unit, damage_amount, "full", "buff", nil, Vector3(1, 0, 0), "buff")
					end
				end
			end
		end
	end,
	necromancer_update_knockdown_damage_immunity = function (necromancer_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local tracked_players = buff.knocked_down_players or {}

		buff.knocked_down_players = tracked_players

		local necromancer_side = Managers.state.side.side_by_unit[necromancer_unit]
		local side_disabled = GameModeHelper.side_is_disabled(necromancer_side:name())
		local player_units = necromancer_side.PLAYER_AND_BOT_UNITS
		local buff_system = Managers.state.entity:system("buff_system")
		local radius = buff.template.radius
		local radius_sq = radius * radius
		local necromancer_position = POSITION_LOOKUP[necromancer_unit]

		for i = 1, #player_units do
			repeat
				local other_unit = player_units[i]

				if other_unit == necromancer_unit then
					break
				end

				local tracked_buff_id = tracked_players[other_unit]

				if not ALIVE[other_unit] then
					tracked_players[other_unit] = nil

					break
				end

				local status_ext = ScriptUnit.extension(other_unit, "status_system")

				if side_disabled or not status_ext:is_knocked_down() then
					if tracked_buff_id then
						buff_system:remove_buff_synced(other_unit, tracked_buff_id)
					end

					tracked_players[other_unit] = nil

					break
				end

				local other_position = POSITION_LOOKUP[other_unit]
				local distance_sq = Vector3.length_squared(other_position - necromancer_position)

				if radius_sq < distance_sq then
					if tracked_buff_id then
						buff_system:remove_buff_synced(other_unit, tracked_buff_id)
					end

					tracked_players[other_unit] = nil

					break
				end

				if not tracked_buff_id then
					local invuln_buff = buff.template.buff_to_add
					local player = Managers.player:owner(other_unit)
					local buff_id = buff_system:add_buff_synced(other_unit, invuln_buff, BuffSyncType.ClientAndServer, nil, player.peer_id)

					tracked_players[other_unit] = buff_id
				end
			until true
		end
	end,
	necromancer_knockdown_damage_immunity_remove_all = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local tracked_players = buff.knocked_down_players

		if not tracked_players then
			return
		end

		local buff_system = Managers.state.entity:system("buff_system")

		for other_unit, buff_id in pairs(tracked_players) do
			if ALIVE[other_unit] then
				buff_system:remove_buff_synced(other_unit, buff_id)
			end
		end

		buff.knocked_down_players = nil
	end,
	necromancer_remove_orb_buffs = function (unit, buff, params)
		local buff_ext = ScriptUnit.has_extension(unit, "buff_system")

		if buff_ext then
			local buffs = buff_ext:get_stacking_buff("sienna_necromancer_4_2_soul_rip_stack")

			if buffs and #buffs > 0 then
				for i = 1, #buffs do
					local buff_id = buffs[1].id

					buff_ext:remove_buff(buff_id)
				end
			end

			local buffs = buff_ext:get_stacking_buff("sienna_necromancer_4_2_execute")

			if buffs and #buffs > 0 then
				for i = 1, #buffs do
					local buff_id = buffs[1].id

					buff_ext:remove_buff(buff_id)
				end
			end
		end
	end,
	sienna_necromancer_expire_spawned_pet = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if ALIVE[unit] then
			AiUtils.kill_unit(unit)
		end
	end,
	sienna_necromancer_on_hit_apply = function (unit, buff, params, world)
		if not buff.fx_id then
			local fx = World.create_particles(world, buff.template.particle_fx, POSITION_LOOKUP[unit])

			buff.fx_id = fx

			local template = buff.template
			local node = Unit.has_node(unit, "j_spine")

			if node then
				local node_rotation = Unit.local_rotation(unit, Unit.node(unit, "j_spine"))
				local offset_rotation = Quaternion.from_euler_angles_xyz(template.offset_rotation_x or 0, template.offset_rotation_y or 0, template.offset_rotation_z or 0)
				local pose = Matrix4x4.from_quaternion(Quaternion.multiply(node_rotation, offset_rotation))

				World.link_particles(world, fx, unit, Unit.node(unit, "j_spine"), pose, "stop")
			end
		end
	end,
	setup_delayed_damage = function (unit, buff, params)
		local source_spread_unit = buff.attacker_unit

		buff.source_spread_position = Vector3Box(POSITION_LOOKUP[source_spread_unit])
	end,
	career_skill_health_reduction = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if ALIVE[unit] then
			local attacker_unit = buff.source_attacker_unit
			local talent_ext = ScriptUnit.has_extension(attacker_unit, "talent_system")
			local breed = AiUtils.unit_breed(unit)

			if talent_ext and talent_ext:has_talent("sienna_necromancer_6_1") and breed.elite then
				local buff_system = Managers.state.entity:system("buff_system")

				buff_system:add_buff(unit, "necromancer_cursed_blood", attacker_unit, true, nil, attacker_unit)
			end

			if talent_ext and talent_ext:has_talent("sienna_necromancer_6_2") then
				local buff_system = Managers.state.entity:system("buff_system")

				buff_system:add_buff(unit, "necromancer_harvest_curse", attacker_unit, true, nil, attacker_unit)
			end

			local health_ext = ScriptUnit.has_extension(unit, "health_system")
			local damage_to_deal = 0

			if health_ext then
				damage_to_deal = health_ext:current_health() / 2
			end

			DamageUtils.add_damage_network(unit, attacker_unit, damage_to_deal, "torso", "buff", nil, Vector3(0, 0, 0), "career_ability", nil, attacker_unit)
		end
	end,
	delayed_health_damage = function (unit, buff, params)
		_delayed_health_damage(unit, buff, params)

		local buff_ext = ScriptUnit.extension(unit, "buff_system")

		buff_ext:remove_buff(buff.id)
	end,
	remove_and_apply_cursed_blood = function (unit, buff, params)
		local necromancer_unit = buff.source_attacker_unit
		local source_position = buff.source_spread_position:unbox()
		local damage_profile = DamageProfileTemplates.sienna_necromancer_blood_explosion
		local target_index = 1
		local actual_power_level = DefaultPowerLevel
		local attacker_unit = unit
		local hit_zone_name = "full"
		local impact_position = POSITION_LOOKUP[unit]
		local hit_direction = Vector3.normalize(impact_position - source_position)
		local damage_source = "buff"
		local hit_ragdoll_actor = false
		local boost_curve_multiplier
		local is_critical_strike = false
		local added_dot
		local first_hit = true
		local total_hits = 1
		local backstab_multiplier
		local source_attacker_unit = necromancer_unit
		local between_pos = source_position + (impact_position - source_position) * 0.5
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_audio_position_event("Play_career_necro_passive_shadow_blood", between_pos)
		DamageUtils.add_damage_network_player(damage_profile, target_index, actual_power_level, unit, attacker_unit, hit_zone_name, impact_position, hit_direction, damage_source, hit_ragdoll_actor, boost_curve_multiplier, is_critical_strike, added_dot, first_hit, total_hits, backstab_multiplier, source_attacker_unit)

		local blackboard = BLACKBOARDS[unit]
		local stagger_length = 1
		local stagger_type = stagger_types.medium
		local stagger_duration = 1
		local stagger_animation_scale
		local t = Managers.time:time("game")
		local stagger_value = 1
		local always_stagger = true

		AiUtils.stagger(unit, blackboard, necromancer_unit, hit_direction, stagger_length, stagger_type, stagger_duration, stagger_animation_scale, t, stagger_value, always_stagger)

		local buff_ext = ScriptUnit.extension(unit, "buff_system")

		buff_ext:remove_buff(buff.id)
	end,
	spawn_pet = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if not ALIVE[unit] then
			return
		end

		local status_extension = ScriptUnit.extension(unit, "status_system")

		if status_extension:is_dead() then
			return
		end

		local career_extension = ScriptUnit.extension(unit, "career_system")
		local passive_ability = career_extension:get_passive_ability_by_name("bw_necromancer")

		passive_ability:consume_pet_charge(buff.id)
	end,
	pet_ping_explosion = function (unit, buff, params, world)
		if not Managers.state.network.is_server then
			return
		end

		if ALIVE[unit] then
			local pet_position = POSITION_LOOKUP[unit]
			local player_unit = buff.source_attacker_unit
			local career_extension = ScriptUnit.has_extension(player_unit, "career_system")
			local career_power_level = career_extension and career_extension:get_career_power_level() or DefaultPowerLevel
			local area_damage_system = Managers.state.entity:system("area_damage_system")

			area_damage_system:create_explosion(player_unit, pet_position, Quaternion.identity(), "sienna_necromancer_passive_explosion", 1, "buff", career_power_level, false)
		end

		local health_extension = ScriptUnit.has_extension(unit, "health_system")

		if health_extension and not health_extension:is_dead() then
			AiUtils.kill_unit(unit)
		end
	end,
	necromancer_5_3_setup = function (unit, buff, params)
		buff.total_overcharge_lost = 0
	end,
	necromancer_cursed_area_buff = function (owner_unit, buff, params)
		if not ALIVE[owner_unit] then
			return false
		end

		if is_local(owner_unit) and not is_bot(owner_unit) then
			-- Nothing
		end
	end,
	necromancer_cursed_area_buff_remove = function (owner_unit, buff, params)
		local unit = owner_unit

		if is_local(unit) and not is_bot(unit) then
			-- Nothing
		end
	end,
	apply_necromancer_creeping_curse_always_blocking = function (owner_unit, buff, params)
		local attacker_unit = params.attacker_unit

		if owner_unit == attacker_unit then
			local status_extension = ScriptUnit.extension(owner_unit, "status_system")
			local send_to_server = not Managers.state.network.is_server

			status_extension:set_override_blocking(true, send_to_server)
			status_extension:remove_all_fatigue()
		end
	end,
	necromancer_apply_num_buffs = function (owner_unit, buff, params)
		local template = buff.template
		local num_loops = template.hit_soak_num
		local buff_to_add = template.buff_to_add
		local buff_ext = ScriptUnit.extension(owner_unit, "buff_system")

		for i = 1, num_loops do
			buff_ext:add_buff(buff_to_add)
		end
	end,
	apply_ai_attack_speed = function (owner_unit, buff, params)
		local template = buff.template
		local value = template.value
		local var_id = Unit.animation_find_variable(owner_unit, "attack_speed")
		local current_attack_speed = Unit.animation_get_variable(owner_unit, var_id)

		Unit.animation_set_variable(owner_unit, var_id, current_attack_speed + value)
	end,
	remove_ai_attack_speed = function (owner_unit, buff, params)
		local template = buff.template
		local value = template.value
		local var_id = Unit.animation_find_variable(owner_unit, "attack_speed")
		local current_attack_speed = Unit.animation_get_variable(owner_unit, var_id)

		Unit.animation_set_variable(owner_unit, var_id, current_attack_speed - value)
	end,
	update_anim_movespeed = function (owner_unit, buff, params)
		local pos = POSITION_LOOKUP[owner_unit]

		buff.last_pos = buff.last_pos or Vector3Box(pos)

		local last_pos = buff.last_pos:unbox()

		buff.last_pos:store(pos)

		local dt = 1
		local predicted_ms = Vector3.length(pos - last_pos) / dt

		if predicted_ms > 0 then
			local var_id = buff.var_id or Unit.animation_find_variable(owner_unit, "move_speed")

			buff.var_id = var_id

			Unit.animation_set_variable(owner_unit, var_id, predicted_ms)

			return buff._next_update_t + dt
		end

		return buff._next_update_t + 0.25
	end,
	on_raise_dead_start = function (owner_unit, buff, params, world)
		local necromancer_unit = buff.source_attacker_unit
		local career_extension = ScriptUnit.extension(necromancer_unit, "career_system")
		local passive_ability = career_extension:get_passive_ability_by_name("bw_necromancer")

		passive_ability:kill_pets()
	end,
	raise_dead_update = function (owner_unit, buff, params, world)
		if buff._spawning_done then
			buff._grace_timer = buff._grace_timer or params.time_into_buff + 0.5

			if params.time_into_buff > buff._grace_timer then
				local buff_ext = ScriptUnit.extension(owner_unit, "buff_system")

				buff_ext:remove_buff(buff.id)
			end

			return
		end

		local spawn_data = buff.spawn_data
		local necromancer_unit = buff.source_attacker_unit
		local spawn_index = (buff.spawn_index or 0) + 1

		buff.spawn_index = spawn_index

		local function nav_callback()
			if ALIVE[necromancer_unit] then
				local position, done = _spawn_skeleton_ability(necromancer_unit, spawn_data, spawn_index - 1)

				if position then
					_spawn_skeleton_ability_fx(necromancer_unit, position, buff, world)
				end

				buff._spawning_done = done
			end
		end

		local ai_navigation_system = Managers.state.entity:system("ai_navigation_system")

		ai_navigation_system:add_safe_navigation_callback(nav_callback)

		local t = Managers.time:time("game")
		local frequency = buff.template.update_frequency
		local n = frequency + math.random() * 0.2 - 0.1

		return t + n
	end,
	raise_dead_apply = function (owner_unit, buff, params, world)
		buff.skulls = {}
		buff.num_skulls = 0

		local go_id = Managers.state.unit_storage:go_id(owner_unit)
		local seed = go_id
		local pos_seed = go_id
		local template = buff.template
		local unit_names = template.unit_names
		local units_n = #unit_names
		local radius = 0
		local scale = Vector3(11, 11, 1)
		local owner_pos = POSITION_LOOKUP[owner_unit]

		buff.units = {}

		local primary_buff = ScriptUnit.extension(owner_unit, "buff_system"):get_buff_type("raise_dead_ability")
		local duration = primary_buff and primary_buff.duration or math.huge
		local unit_name_index, pos_x, pos_y, rot_angle
		local decals_to_spawn = template.num_small_decals

		for i = 1, decals_to_spawn do
			seed, unit_name_index = Math.next_random(seed, 1, units_n)

			local unit_name = unit_names[unit_name_index]

			pos_seed, pos_x, pos_y = math.get_uniformly_random_point_inside_sector_seeded(pos_seed, 0, radius - 0.5, 0, math.pi * 2)

			local pos = owner_pos + Vector3(pos_x, pos_y, 0)

			seed, rot_angle = math.next_random_range(seed, 0, math.pi * 2)

			local rot = Quaternion.axis_angle(Vector3.up(), rot_angle)
			local unit = World.spawn_unit(world, unit_name, pos, rot)

			Unit.set_local_scale(unit, 0, scale)

			buff.units[i] = unit

			local start_time = World.time(Application.main_world())
			local end_time = start_time + duration
			local fade_time = 1.5

			Unit.set_vector2_for_material(unit, "projector", "start_end_time", Vector2(start_time, end_time))
			Unit.set_scalar_for_material(unit, "projector", "fade_time", fade_time)
			Unit.set_scalar_for_material(unit, "projector", "enable_fade", 1)
		end
	end,
	raise_dead_remove = function (owner_unit, buff, params, world)
		if is_local(buff.source_attacker_unit) and ALIVE[owner_unit] then
			Managers.state.unit_spawner:mark_for_deletion(owner_unit)
		end

		if ALIVE[buff.area_buff_unit] then
			Managers.state.unit_spawner:mark_for_deletion(buff.area_buff_unit)
		end

		local units = buff.units

		if units then
			for i = 1, #units do
				local unit = units[i]

				World.destroy_unit(world, unit)
			end
		end

		local is_server = Managers.state.network.is_server

		for skull_unit, data in pairs(buff.skulls) do
			if is_server then
				Managers.level_transition_handler.transient_package_loader:remove_unit(skull_unit)
			end

			World.destroy_unit(world, skull_unit)
		end
	end,
	raise_dead_visual_update = function (owner_unit, buff, params, world)
		local template = buff.template
		local delay = template.delay
		local t = params.time_into_buff

		if t - delay < 0 then
			return
		end

		t = t - delay

		local wanted_skulls = math.min(template.num_skulls.min + math.floor(t / template.skull_spawn_frequency), template.num_skulls.max)
		local area_pos = POSITION_LOOKUP[owner_unit]

		buff.skulls = buff.skulls
		buff.num_skulls = buff.num_skulls

		local owner_pos = POSITION_LOOKUP[owner_unit]

		for i = buff.num_skulls, wanted_skulls do
			local angle = math.random() * math.tau / template.num_skulls.min * i + Math.random_range(-0.05, 0.05)
			local rel_pos = Vector3.rotate(Vector3(template.area_radius, 0, 0), angle)
			local rot_direction = i % 2 * 2 - 1
			local unit_rot = Quaternion.look(Vector3.cross(Vector3.up(), rel_pos) * rot_direction)
			local unit_name = "units/beings/player/bright_wizard_necromancer/talents/trapped_soul_skull"
			local skull_unit = World.spawn_unit(world, unit_name, owner_pos + rel_pos, unit_rot)

			if Managers.state.network.is_server then
				Managers.level_transition_handler.transient_package_loader:add_unit(skull_unit, unit_name)
			end

			buff.skulls[skull_unit] = {
				start_t = t,
				level_out_height = Math.random_range(1, 1),
				start_angle = angle,
				rot_direction = rot_direction,
				angular_velocity = Math.random_range(0.5, 0.8) * math.pi,
				outward_offset = Math.random_range(-0.1, 0) * template.area_radius,
			}
			buff.num_skulls = buff.num_skulls + 1
		end

		for skull_unit, data in pairs(buff.skulls) do
			local elapsed_t = t - data.start_t

			if elapsed_t > 4 then
				if Managers.state.network.is_server then
					Managers.level_transition_handler.transient_package_loader:remove_unit(skull_unit)
				end

				World.destroy_unit(world, skull_unit)

				buff.skulls[skull_unit] = nil

				return
			end

			local wanted_angle = data.start_angle + data.angular_velocity * elapsed_t * data.rot_direction
			local rel_pos = Vector3.rotate(Vector3(template.area_radius + data.outward_offset, 0, 0), wanted_angle)
			local curve_y = (1.3 * elapsed_t)^2
			local wanted_height = 0.5 + curve_y * data.level_out_height

			rel_pos[3] = wanted_height

			local wanted_pos = area_pos + rel_pos
			local unit_pos = Unit.local_position(skull_unit, 0)
			local wanted_rot = Quaternion.look(wanted_pos - unit_pos)

			Unit.set_local_position(skull_unit, 0, wanted_pos)
			Unit.set_local_rotation(skull_unit, 0, wanted_rot)
		end
	end,
	necromancer_ability_stagger_update = function (owner_unit, buff, params)
		local buff_area_unit = params.attacker_unit
		local necromancer_unit = params.source_attacker_unit

		if not ALIVE[buff_area_unit] or not ALIVE[necromancer_unit] then
			return
		end

		local unit_pos = POSITION_LOOKUP[owner_unit]
		local area_pos = POSITION_LOOKUP[buff_area_unit]
		local to_center = area_pos - unit_pos
		local direction = Vector3.normalize(to_center)
		local blackboard = BLACKBOARDS[owner_unit]
		local stagger_length = math.min(math.max(Vector3.length(to_center) - 1, 0) * 0.25, 0.5)
		local stagger_type = stagger_types.medium
		local stagger_duration = 1.5
		local stagger_animation_scale
		local t = Managers.time:time("game")
		local stagger_value = 2
		local always_stagger = true

		AiUtils.stagger(owner_unit, blackboard, necromancer_unit, direction, stagger_length, stagger_type, stagger_duration, stagger_animation_scale, t, stagger_value, always_stagger)
	end,
	necromancer_ability_stagger_hands = function (owner_unit, buff, params)
		local buff_area_unit = params.attacker_unit
		local unit_pos = POSITION_LOOKUP[owner_unit]
		local area_pos = POSITION_LOOKUP[buff_area_unit]
		local to_center = area_pos - unit_pos
		local direction = Vector3.normalize(to_center)
		local spawn_rotation = Quaternion.look(Vector3.flat(direction))
		local dist_from_center = Vector3.length(to_center)
		local offset = direction * math.clamp(dist_from_center - 1, 1, 2)
		local max_depth = 0.1
		local depth_offset = Vector3(0, 0, -max_depth * math.random())
		local unit_name = "units/beings/enemies/undead_skeleton_hand/chr_undead_skeleton_hand"
		local new_unit = Managers.state.unit_spawner:spawn_local_unit(unit_name, unit_pos + depth_offset + offset, spawn_rotation)
		local target_var = Unit.animation_find_constraint_target(new_unit, "look_at")

		Unit.animation_set_constraint_target(new_unit, target_var, unit_pos)

		local scale_min = 1.25
		local scale_max = 1.75
		local random_scale = math.lerp(scale_min, scale_max, math.random())

		Unit.set_local_scale(new_unit, 0, Vector3(random_scale, random_scale, random_scale))

		local t = Managers.time:time("game")
		local min_delay = dist_from_center < 1.5 and 1.5 or 0.6
		local max_delay = dist_from_center < 1.5 and 3 or 0.8

		return t + math.random(min_delay, max_delay)
	end,
}
