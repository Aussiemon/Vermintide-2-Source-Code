require("scripts/settings/dlcs/belakor/belakor_balancing")

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local settings = DLCSettings.belakor

local function is_server()
	return Managers.state.network.is_server
end

local function teleport_validation_func(pos, validation_data)
	local enemy_positions = validation_data.side.ENEMY_PLAYER_AND_BOT_POSITIONS

	for i = 1, #enemy_positions do
		if Vector3.distance_squared(pos, enemy_positions[i]) < validation_data.min_dist_sqr then
			return false
		end
	end

	return true
end

local GREY_WINGS_TELEPORT_STATES = {
	IDLE = 1,
	COOLDOWN = 5,
	FINDING_TELEPORT_POSITION = 2,
	TELEPORTING = 3,
	LANDING = 4
}
settings.buff_function_templates = {
	update_belakor_grey_wings_teleport_trigger = function (unit, buff, params)
		if not is_server() then
			return
		end

		local blackboard = BLACKBOARDS[unit]
		local target_unit = blackboard.target_unit
		local parent_buff_shared_table = buff.parent_buff_shared_table

		if not target_unit then
			return
		end

		if blackboard.move_state == "stagger" then
			parent_buff_shared_table.teleport = true

			return
		end

		local owner_position = POSITION_LOOKUP[unit]
		local target_unit_position = POSITION_LOOKUP[target_unit]
		local distance = Vector3.length(target_unit_position - owner_position)
		local template = buff.template

		if template.max_distance_to_trigger_teleport_from_combo_attack < distance then
			return
		end

		local combo_attack_data = blackboard.combo_attack_data

		if blackboard.move_state == "attacking" and combo_attack_data and (combo_attack_data.current_attack_name == "attack_wild_flailing" or combo_attack_data.current_attack_name == "attack_heavy") and not combo_attack_data.aborted then
			parent_buff_shared_table.teleport = true
		end
	end,
	apply_belakor_grey_wings = function (unit, buff, params)
		if not is_server() then
			return
		end

		local shared_table = buff.parent_buff_shared_table
		shared_table.teleport_state = GREY_WINGS_TELEPORT_STATES.IDLE
		local teleport_available_buff = buff.template.teleport_available_buff
		local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
		shared_table.teleport_available_buff_id = buff_extension:add_buff(teleport_available_buff)
		shared_table.blackboard = BLACKBOARDS[unit]
		shared_table.side = Managers.state.side.side_by_unit[unit]
		shared_table.health_extension = ScriptUnit.extension(unit, "health_system")
	end,
	update_belakor_grey_wings = function (unit, buff, params)
		if not is_server() then
			return
		end

		local t = Managers.time:time("game")
		local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
		local shared_table = buff.parent_buff_shared_table
		local blackboard = shared_table.blackboard
		local template = buff.template

		if shared_table.teleport and shared_table.teleport_state == GREY_WINGS_TELEPORT_STATES.IDLE then
			shared_table.teleport_state = GREY_WINGS_TELEPORT_STATES.FINDING_TELEPORT_POSITION
			shared_table.teleport = false
			blackboard.umbral_leap = true
			blackboard.in_vortex = true
			local unit_pos = POSITION_LOOKUP[unit]
			local teleport_effect = template.teleport_effect

			if teleport_effect then
				local effect_name_id = NetworkLookup.effects[teleport_effect]
				local node_id = 0
				local rotation_offset = Quaternion.identity()
				local network_manager = Managers.state.network

				network_manager:rpc_play_particle_effect(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, unit_pos, rotation_offset, false)
			end
		end

		if shared_table.teleport_state == GREY_WINGS_TELEPORT_STATES.COOLDOWN then
			if not shared_table.teleport_cooldown_t then
				local teleport_cooldown = template.teleport_cooldown
				shared_table.teleport_cooldown_t = t + teleport_cooldown
			end

			if shared_table.teleport_available_buff_id then
				buff_extension:remove_buff(shared_table.teleport_available_buff_id)

				shared_table.teleport_available_buff_id = nil
			end

			shared_table.teleport = false

			if shared_table.teleport_cooldown_t < t then
				local teleport_available_buff = buff.template.teleport_available_buff
				shared_table.teleport_available_buff_id = buff_extension:add_buff(teleport_available_buff)
				shared_table.teleport_state = GREY_WINGS_TELEPORT_STATES.IDLE
			end
		end

		if shared_table.teleport_state == GREY_WINGS_TELEPORT_STATES.FINDING_TELEPORT_POSITION then
			local function nav_callback()
				if not ALIVE[unit] or shared_table.teleport_state ~= GREY_WINGS_TELEPORT_STATES.FINDING_TELEPORT_POSITION then
					return
				end

				local unit_pos = POSITION_LOOKUP[unit]
				local far_teleport = true
				local target_unit = blackboard.target_unit

				if target_unit then
					local owner_position = POSITION_LOOKUP[unit]
					local target_unit_position = POSITION_LOOKUP[target_unit]
					local distance = Vector3.length(target_unit_position - owner_position)

					if template.min_distance_to_trigger_gap_closer_teleport < distance then
						far_teleport = false
					end
				end

				local teleport_position, min_dist, max_dist, min_player_dist = nil
				local tries = template.find_valid_pos_attempts
				local side = shared_table.side

				if far_teleport then
					min_dist = template.min_teleport_distance
					max_dist = template.max_teleport_distance
					min_player_dist = template.min_dist_from_players
				else
					min_dist = template.min_teleport_distance_gap_closer
					max_dist = template.max_teleport_distance_gap_closer
					min_player_dist = template.min_dist_from_players_gap_closer
				end

				local validation_data = {
					side = side,
					min_dist_sqr = min_player_dist * min_player_dist
				}
				teleport_position = ConflictUtils.get_spawn_pos_on_circle_with_func_range(blackboard.nav_world, unit_pos, min_dist, max_dist, tries, teleport_validation_func, validation_data, 8, 8)

				if teleport_position then
					shared_table.teleport_t = t + template.teleport_delay
					shared_table.teleport_position = Vector3Box(teleport_position)
					shared_table.teleport_origin_position = Vector3Box(unit_pos)
					shared_table.target_unit = blackboard.target_unit
					shared_table.teleport_state = GREY_WINGS_TELEPORT_STATES.TELEPORTING
				end
			end

			local ai_navigation_system = Managers.state.entity:system("ai_navigation_system")

			ai_navigation_system:add_safe_navigation_callback(nav_callback)
		end

		if shared_table.teleport_state == GREY_WINGS_TELEPORT_STATES.TELEPORTING and ALIVE[unit] and shared_table.teleport_t < t then
			local function nav_callback()
				local unit_pos = POSITION_LOOKUP[unit]
				local teleport_position = shared_table.teleport_position:unbox()
				local teleport_effect = template.teleport_effect

				if teleport_effect then
					local effect_name_id = NetworkLookup.effects[teleport_effect]
					local node_id = 0
					local rotation_offset = Quaternion.identity()
					local network_manager = Managers.state.network

					network_manager:rpc_play_particle_effect(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, unit_pos, rotation_offset, false)
				end

				local teleport_effect_trail = template.teleport_effect_trail

				if teleport_effect_trail then
					local network_manager = Managers.state.network
					local node_id = 0
					local dir = Vector3.normalize(unit_pos - teleport_position)
					local trail_rotation_offset = Quaternion.look(dir, Vector3.up())
					local trail_effect_name_id = NetworkLookup.effects[teleport_effect_trail]

					network_manager:rpc_play_particle_effect(nil, trail_effect_name_id, NetworkConstants.invalid_game_object_id, node_id, unit_pos, trail_rotation_offset, false)
				end

				blackboard.umbral_leap_destination = Vector3Box(teleport_position)
				shared_table.teleport_state = GREY_WINGS_TELEPORT_STATES.COOLDOWN
			end

			local ai_navigation_system = Managers.state.entity:system("ai_navigation_system")

			ai_navigation_system:add_safe_navigation_callback(nav_callback)
		end
	end,
	remove_belakor_grey_wings = function (unit, buff, params)
		if not is_server() then
			return
		end
	end,
	apply_belakor_homing_skull_drain_stamina = function (unit, buff, params)
		local fatigue_type = buff.template.fatigue_type
		local status_extension = ScriptUnit.has_extension(unit, "status_system")

		if status_extension then
			status_extension:add_fatigue_points(fatigue_type)
		end
	end,
	belakor_cultists_apply_eye_glow = function (unit, buff, params)
		if ALIVE[unit] then
			buff.material_res_id = Unit.get_material_resource_id(unit, "mtr_eyes")

			Unit.set_material(unit, "mtr_eyes", "units/beings/enemies/mtr_eyes_belakor_cultist")
		end
	end,
	belakor_cultists_remove_eye_glow = function (unit, buff, params)
		if ALIVE[unit] and buff.material_res_id then
			Unit.set_material_from_id(unit, "mtr_eyes", buff.material_res_id)
		end
	end,
	apply_one_from_list = function (unit, buff, params)
		if is_server() then
			local buff_list = buff.template.buff_list
			local buff_to_add_id = math.random(1, #buff_list)
			local buff_to_add = buff_list[buff_to_add_id]
			local buff_system = Managers.state.entity:system("buff_system")

			buff_system:add_buff(unit, buff_to_add, buff.attacker_unit or unit, false)
		end
	end,
	apply_homing_skull_achieve = function (unit, buff, params)
		Managers.state.achievement:trigger_event("register_skull_hit", unit)
	end
}
settings.proc_functions = {
	belakor_crystal_drop = function (owner_unit, buff, params)
		if is_server() then
			local killed_unit = params[1]
			local position = Unit.world_position(killed_unit, 0) + Vector3(0, 0, 1.5)
			local pickup_system = Managers.state.entity:system("pickup_system")
			local with_physics = true
			local rotation = Quaternion.identity()
			local spawn_type = "dropped"
			local pickup_name = "belakor_crystal"
			local override_unit_template_name = "belakor_crystal_throw"

			for i = 1, buff.template.crystal_count do
				local velocity = Vector3(2 * math.random() - 1, 2 * math.random() - 1, 1)

				pickup_system:spawn_pickup(pickup_name, position, rotation, with_physics, spawn_type, velocity, override_unit_template_name)
			end
		end

		return true
	end,
	belakor_shadow_lieutenant_drop_crystal = function (owner_unit, buff, params)
		if is_server() then
			local killed_unit = params[1]
			local parent_node = Unit.node(killed_unit, "c_spine")
			local position = Unit.world_position(killed_unit, parent_node)
			local pickup_system = Managers.state.entity:system("pickup_system")
			local with_physics = true
			local rotation = Quaternion.identity()
			local spawn_type = "dropped"
			local velocity = Vector3(6 * math.random() - 3, 6 * math.random() - 3, 3)
			local pickup_name = "belakor_crystal"
			local override_unit_template_name = "belakor_crystal_throw"

			pickup_system:spawn_pickup(pickup_name, position, rotation, with_physics, spawn_type, velocity, override_unit_template_name)

			local world = Managers.world:world("level_world")
			local intro_vo_unit = LevelHelper:find_dialogue_unit(world, "ferry_lady")
			local dialogue_extension = intro_vo_unit and ScriptUnit.has_extension(intro_vo_unit, "dialogue_system")

			if dialogue_extension then
				local dialogue_input = ScriptUnit.extension_input(intro_vo_unit, "dialogue_system")
				local event_data = FrameTable.alloc_table()
				local level_transition_handler = Managers.level_transition_handler
				local level_key = level_transition_handler:get_current_level_keys()
				local event_name = nil

				if level_key ~= "arena_belakor" then
					event_name = "shadow_curse_crystal_dropped"
				else
					event_name = "shadow_curse_vortex_crystal"
				end

				dialogue_input:trigger_dialogue_event(event_name, event_data)
			end
		end

		return true
	end,
	on_grey_wings_damage_taken = function (owner_unit, buff, params)
		if not is_server() then
			return
		end

		local blackboard = BLACKBOARDS[owner_unit]
		local attacker_unit = params[1]

		if blackboard.target_unit ~= attacker_unit then
			return
		end

		local buff_template = buff.template
		local valid_damage_types = buff_template.valid_damage_types
		local damage_source = params[3]

		if valid_damage_types and not valid_damage_types[damage_source] then
			return
		end

		buff.parent_buff_shared_table.teleport = true
	end
}
settings.explosion_templates = {
	homing_skull_explosion = {
		explosion = {
			always_hurt_players = true,
			radius = 1,
			always_stagger_ai = true,
			alert_enemies = false,
			sound_event_name = "Play_curse_shadow_dagger_projectile_impact",
			damage_type_glance = "fire_grenade_glance",
			max_damage_radius_min = 0.5,
			attack_template = "drakegun",
			buff_to_apply = "belakor_homing_skull_debuff",
			max_damage_radius_max = 1,
			damage_type = "grenade",
			damage_profile = "homing_skull_explosion",
			power_level = 500,
			effect_name = "fx/belakor/blk_curse_skulls_explosion_fx",
			immune_breeds = {
				chaos_zombie = true,
				skaven_grey_seer = true,
				skaven_stormfiend = true
			}
		}
	},
	homing_skull_impact = {
		server_hit_func = function (projectile_unit, damage_source, owner_unit, hit_position, recent_impacts, explosion_template)
			local explosion_position = Unit.local_position(projectile_unit, 0)
			local world = Managers.world:world("level_world")
			explosion_template = ExplosionTemplates.homing_skull_explosion

			DamageUtils.create_explosion(world, projectile_unit, explosion_position, Quaternion.identity(), explosion_template, 1, damage_source, true, false, owner_unit, false)

			local network_manager = Managers.state.network
			local attacker_unit_id = network_manager:game_object_or_level_id(projectile_unit)
			local explosion_template_id = NetworkLookup.explosion_templates[explosion_template.name]
			local damage_source_id = NetworkLookup.damage_sources[damage_source]

			Managers.state.network.network_transmit:send_rpc_clients("rpc_create_explosion", attacker_unit_id, false, explosion_position, Quaternion.identity(), explosion_template_id, 1, damage_source_id, 0, false, attacker_unit_id)
			AiUtils.kill_unit(projectile_unit, nil, nil, "undefined", nil)
		end
	},
	tiny_explosive_barrel = {
		explosion = {
			radius = 6,
			dot_template_name = "burning_1W_dot",
			max_damage_radius = 1.75,
			sound_event_name = "boon_cluster_barrel_explosion",
			damage_type_glance = "grenade_glance",
			alert_enemies = true,
			attack_template = "drakegun",
			alert_enemies_radius = 10,
			always_hurt_players = true,
			damage_type = "grenade",
			damage_profile = "explosive_barrel",
			effect_name = "fx/wpnfx_barrel_explosion",
			difficulty_power_level = {
				easy = {
					power_level_glance = 100,
					power_level = 200
				},
				normal = {
					power_level_glance = 200,
					power_level = 400
				},
				hard = {
					power_level_glance = 300,
					power_level = 600
				},
				harder = {
					power_level_glance = 400,
					power_level = 800
				},
				hardest = {
					power_level_glance = 500,
					power_level = 1000
				},
				cataclysm = {
					power_level_glance = 550,
					power_level = 1100
				},
				cataclysm_2 = {
					power_level_glance = 575,
					power_level = 1150
				},
				cataclysm_3 = {
					power_level_glance = 600,
					power_level = 1200
				}
			}
		}
	},
	belakor_arena_finish = {
		explosion = {
			always_hurt_players = false,
			radius = 300,
			no_aggro = true,
			player_push_speed = 5,
			collision_filter = "filter_simple_explosion_overlap",
			alert_enemies = false,
			damage_profile = "belakor_arena_finish",
			power_level = 1000,
			level_unit_damage = true
		}
	}
}
local grey_wings_valid_damage_types = {
	light_blunt_linesman = true,
	light_slashing_tank = true,
	drakegun = true,
	blunt_linesman = true,
	light_stab_linesman = true,
	stab_tank = true,
	light_slashing_linesman = true,
	heavy_blunt_smiter = true,
	blunt = true,
	light_blunt_fencer = true,
	heavy_blunt_linesman = true,
	blunt_tank_uppercut = true,
	heavy_blunt_tank = true,
	heavy_slashing_smiter_uppercut = true,
	arrow = true,
	light_stab_smiter = true,
	light_stab_fencer = true,
	heavy_stab_fencer = true,
	bolt_sniper = true,
	piercing = true,
	blunt_tank = true,
	shot_repeating_handgun = true,
	light_slashing_fencer = true,
	projectile = true,
	slashing_fencer = true,
	heavy_slashing_fencer = true,
	shot_sniper = true,
	heavy_stab_smiter = true,
	shot_machinegun = true,
	heavy_slashing_tank = true,
	shot_shotgun = true,
	heavy_slashing_smiter = true,
	light_slashing_linesman_hs = true,
	heavy_stab_tank = true,
	light_slashing_smiter = true,
	slashing_smiter = true,
	drakegun_shot = true,
	arrow_sniper = true,
	stab_smiter = true,
	arrow_carbine = true,
	throwing_axe = true,
	heavy_blunt_fencer = true,
	stab_fencer = true,
	light_blunt_tank = true,
	arrow_machinegun = true,
	light_stab_tank = true,
	slashing_linesman = true,
	blunt_fencer = true,
	slashing_smiter_uppercut = true,
	slashing = true,
	bolt_carbine = true,
	light_blunt_smiter = true,
	heavy_stab_linesman = true,
	blunt_smiter = true,
	slashing_buffed = true,
	shot_carbine = true,
	bolt_machinegun = true,
	slashing_tank = true,
	cutting = true,
	heavy_slashing_linesman = true,
	burning_stab_fencer = true,
	stab_linesman = true
}
settings.buff_templates = {
	orb_test_01 = {
		buffs = {
			{
				event = "on_kill",
				name = "orb_test_01",
				buff_func = "spawn_orb",
				orb_settings = {
					orb_name = "test_orb_01"
				}
			}
		}
	},
	orb_test_buff_01 = {
		activation_effect = "fx/screenspace_potion_02",
		buffs = {
			{
				name = "orb_test_buff_01",
				multiplier = 0.5,
				stat_buff = "attack_speed",
				duration = 2,
				max_stacks = 10,
				icon = "potion_buff_02",
				refresh_durations = true
			}
		}
	},
	belakor_shadow_lieutenant = {
		buffs = {
			{
				multiplier = 1.75,
				name = "belakor_shadow_lieutenant",
				stat_buff = "max_health",
				perk = "anti_oneshot",
				remove_buff_func = "remove_max_health_buff_for_ai",
				apply_buff_func = "apply_max_health_buff_for_ai"
			},
			{
				name = "belakor_shadow_lieutenant_material_objective_unit",
				buff_func = "remove_objective_unit",
				event = "on_death",
				remove_buff_func = "remove_objective_unit",
				apply_buff_func = "apply_objective_unit"
			},
			{
				event = "on_death",
				name = "belakor_shadow_lieutenant_drop_crystal",
				buff_func = "belakor_shadow_lieutenant_drop_crystal"
			}
		}
	},
	belakor_crystal_spawn_on_death = {
		buffs = {
			{
				event = "on_death",
				name = "belakor_crystal_spawn_on_death",
				buff_func = "belakor_crystal_drop",
				crystal_count = BelakorBalancing.totem_crystal_count
			}
		}
	},
	belakor_grey_wings = {
		create_parent_buff_shared_table = true,
		buffs = {
			{
				event = "on_damage_taken",
				name = "belakor_grey_wings",
				buff_func = "on_grey_wings_damage_taken",
				valid_damage_types = grey_wings_valid_damage_types
			},
			{
				min_dist_from_players_gap_closer = 3,
				name = "belakor_grey_wings_teleport_logic",
				min_distance_to_trigger_gap_closer_teleport = 10,
				teleport_effect = "fx/blk_grey_wings_teleport_01",
				remove_buff_func = "remove_belakor_grey_wings",
				teleport_effect_trail = "fx/blk_grey_wings_teleport_direction_01",
				min_teleport_distance_gap_closer = 3,
				teleport_delay = 0.5,
				teleport_cooldown = 1,
				teleport_available_buff = "belakor_grey_wings_teleport_available",
				max_teleport_distance_gap_closer = 6,
				apply_buff_func = "apply_belakor_grey_wings",
				max_teleport_distance = 13,
				min_teleport_distance = 7,
				find_valid_pos_attempts = 5,
				update_func = "update_belakor_grey_wings",
				min_dist_from_players = 5
			},
			{
				update_func = "update_belakor_grey_wings_teleport_trigger",
				name = "belakor_grey_wings_on_combo",
				max_distance_to_trigger_teleport_from_combo_attack = 5
			},
			{
				multiplier = 1,
				name = "belakor_grey_wings_health",
				stat_buff = "max_health",
				remove_buff_func = "remove_max_health_buff_for_ai",
				apply_buff_func = "apply_max_health_buff_for_ai"
			}
		}
	},
	belakor_grey_wings_teleport_available = {
		buffs = {
			{
				name = "belakor_grey_wings_teleport_available",
				perk = buff_perks.invulnerable_ranged
			},
			{
				remove_buff_func = "remove_attach_particle",
				name = "belakor_grey_wings_particle",
				apply_buff_func = "apply_attach_particle",
				particle_fx = "fx/blk_grey_wings_01"
			}
		}
	},
	belakor_homing_skull_debuff = {
		buffs = {
			{
				name = "belakor_homing_skull_debuff",
				apply_buff_func = "apply_one_from_list",
				buff_list = {
					"belakor_homing_skull_debuff_delayed_stun_effect"
				}
			}
		}
	},
	belakor_homing_skull_debuff_delayed_stun = {
		buffs = {
			{
				buff_to_add = "belakor_homing_skull_debuff_delayed_stun_effect",
				name = "belakor_homing_skull_debuff_delayed_stun",
				is_cooldown = true,
				icon = "deus_curse_slaanesh_01",
				continuous_effect = "fx/screenspace_darkness_flash",
				remove_buff_func = "add_buff",
				priority_buff = true,
				debuff = true,
				max_stacks = 1,
				duration = 3
			}
		}
	},
	belakor_homing_skull_debuff_delayed_stun_effect = {
		deactivation_sound = "stop_curse_belakor_shadow_skulls_player_disabled",
		activation_sound = "play_curse_belakor_shadow_skulls_player_disabled_start",
		buffs = {
			{
				priority_buff = true,
				name = "belakor_homing_skull_debuff_delayed_stun_effect",
				debuff = true,
				icon = "deus_curse_belakor_02",
				apply_buff_func = "apply_homing_skull_achieve",
				continuous_effect = "fx/screenspace_darkness_flash",
				max_stacks = 1,
				duration = 2.5,
				perk = buff_perks.overpowered
			},
			{
				particle_fx = "fx/skull_trap",
				name = "belakor_homing_skull_debuff_particle",
				offset_rotation_y = 90,
				duration = 2.5,
				remove_buff_func = "remove_attach_particle",
				apply_buff_func = "apply_attach_particle"
			}
		}
	},
	belakor_homing_skull_debuff_delayed_banish = {
		buffs = {
			{
				icon = "twitch_icon_vanishing_act",
				name = "belakor_homing_skull_debuff_delayed_banish",
				debuff = true,
				continuous_effect = "fx/screenspace_inside_plague_vortex",
				max_stacks = 1,
				duration = 5,
				priority_buff = true,
				perk = buff_perks.invulnerable
			},
			{
				max_stacks = 1,
				name = "belakor_homing_skull_debuff_delayed_banish_stun",
				duration = 5,
				perk = buff_perks.overpowered
			}
		}
	},
	belakor_cultists_buff = {
		buffs = {
			{
				multiplier = 0.25,
				name = "belakor_cultists_buff_damage",
				stat_buff = "damage_dealt"
			},
			{
				multiplier = 1.25,
				name = "belakor_cultists_buff_health",
				stat_buff = "max_health"
			},
			{
				remove_buff_func = "ai_update_max_health",
				name = "belakor_cultists_buff_health_update",
				apply_buff_func = "ai_update_max_health"
			},
			{
				remove_buff_func = "belakor_cultists_remove_eye_glow",
				name = "belakor_cultists_buff_eye_glow",
				apply_buff_func = "belakor_cultists_apply_eye_glow"
			},
			{
				multiplier = 1.1,
				name = "belakor_cultists_buff_stagger",
				stat_buff = "stagger_resistance"
			},
			{
				multiplier = 0.9,
				name = "belakor_cultists_buff_hit_mass",
				stat_buff = "hit_mass_amount"
			}
		}
	}
}
