local settings = DLCSettings.wizards_part_2
local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
settings.buff_templates = {
	wall_slow_debuff = {
		buffs = {
			{
				name = "grudge_mark_crippling_blow_debuff_flow_event",
				flow_event = "sfx_vce_struggle",
				max_stacks = 1,
				duration = 3,
				apply_buff_func = "first_person_flow_event"
			},
			{
				update_func = "update_action_lerp_movement_buff",
				multiplier = 0.3,
				name = "grudge_mark_crippling_blow_slow_run",
				icon = "buff_wall_slow_icon",
				priority_buff = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				lerp_time = 0.1,
				debuff = true,
				max_stacks = 1,
				duration = 3,
				path_to_movement_setting_to_modify = {
					"move_speed"
				},
				sfx = {
					activation_sound = "enemy_grudge_crippling_hit"
				}
			},
			{
				update_func = "update_charging_action_lerp_movement_buff",
				multiplier = 0.3,
				name = "grudge_mark_crippling_blow_slow_crouch",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 3,
				path_to_movement_setting_to_modify = {
					"crouch_move_speed"
				}
			},
			{
				update_func = "update_charging_action_lerp_movement_buff",
				multiplier = 0.3,
				name = "grudge_mark_crippling_blow_slow_walk",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 3,
				path_to_movement_setting_to_modify = {
					"walk_move_speed"
				}
			},
			{
				multiplier = 0.3,
				name = "grudge_mark_crippling_blow_jump_debuff",
				duration = 3,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed"
				}
			},
			{
				multiplier = 0.5,
				name = "grudge_mark_crippling_blow_dodge_speed_debuff",
				duration = 3,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier"
				}
			},
			{
				multiplier = 0.5,
				name = "grudge_mark_crippling_blow_dodge_distance_debuff",
				duration = 3,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier"
				}
			}
		}
	},
	ethereal_skull_debuff = {
		buffs = {
			{
				name = "ethereal_skull_debuff",
				apply_buff_func = "apply_one_from_list",
				buff_list = {
					"ethereal_skull_debuff_delayed_stun_effect"
				}
			}
		}
	},
	ethereal_skull_debuff_delayed_stun = {
		buffs = {
			{
				buff_to_add = "ethereal_skull_debuff_delayed_stun_effect",
				name = "ethereal_skull_debuff_delayed_stun",
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
	ethereal_skull_debuff_delayed_stun_effect = {
		buffs = {
			{
				max_stacks = 1,
				name = "ethereal_skull_debuff_delayed_stun_effect",
				duration = 1
			},
			{
				particle_fx = "fx/skull_trap_ethereal",
				name = "ethereal_skull_debuff_particle",
				offset_rotation_y = 90,
				duration = 1,
				remove_buff_func = "remove_attach_particle",
				apply_buff_func = "apply_attach_particle"
			}
		}
	},
	ethereal_skull_debuff_delayed_banish = {
		buffs = {
			{
				icon = "twitch_icon_vanishing_act",
				name = "ethereal_skull_debuff_delayed_banish",
				debuff = true,
				continuous_effect = "fx/screenspace_inside_plague_vortex",
				max_stacks = 1,
				duration = 3,
				priority_buff = true,
				perk = buff_perks.invulnerable
			},
			{
				max_stacks = 1,
				name = "ethereal_skull_debuff_delayed_banish_stun",
				duration = 3,
				perk = buff_perks.overpowered
			}
		}
	}
}
settings.buff_function_templates = {}
settings.explosion_templates = {
	ethereal_skull_explosion = {
		explosion = {
			always_hurt_players = true,
			radius = 1,
			always_stagger_ai = true,
			alert_enemies = false,
			buff_to_apply = "ethereal_skull_debuff",
			damage_type_glance = "fire_grenade_glance",
			max_damage_radius_min = 0.5,
			attack_template = "drakegun",
			max_damage_radius_max = 1,
			damage_type = "grenade",
			damage_profile = "homing_skull_explosion",
			power_level = 500,
			effect_name = "fx/ethereal_skulls_explosion",
			immune_breeds = {
				chaos_zombie = true,
				skaven_grey_seer = true,
				skaven_stormfiend = true
			}
		}
	},
	ethereal_skull_impact = {
		server_hit_func = function (projectile_unit, damage_source, owner_unit, hit_position, recent_impacts, explosion_template)
			local explosion_position = Unit.local_position(projectile_unit, 0)
			local world = Managers.world:world("level_world")
			explosion_template = ExplosionTemplates.ethereal_skull_explosion

			DamageUtils.create_explosion(world, projectile_unit, explosion_position, Quaternion.identity(), explosion_template, 1, damage_source, true, false, owner_unit, false)

			local network_manager = Managers.state.network
			local attacker_unit_id = network_manager:game_object_or_level_id(projectile_unit)
			local explosion_template_id = NetworkLookup.explosion_templates[explosion_template.name]
			local damage_source_id = NetworkLookup.damage_sources[damage_source]

			Managers.state.network.network_transmit:send_rpc_clients("rpc_create_explosion", attacker_unit_id, false, explosion_position, Quaternion.identity(), explosion_template_id, 1, damage_source_id, 0, false, attacker_unit_id)
			AiUtils.kill_unit(projectile_unit, nil, nil, "undefined", nil)
		end
	}
}
