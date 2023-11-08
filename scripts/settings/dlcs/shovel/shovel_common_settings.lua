local settings = DLCSettings.shovel
settings.career_setting_files = {
	"scripts/settings/dlcs/shovel/career_settings_shovel"
}
settings.career_ability_settings = {
	"scripts/settings/dlcs/shovel/career_ability_settings_shovel"
}
settings.action_template_files = {
	"scripts/settings/dlcs/shovel/action_templates_shovel"
}
settings.talent_settings = {
	"scripts/settings/dlcs/shovel/talent_settings_shovel"
}
settings.profile_files = {
	"scripts/settings/dlcs/shovel/shovel_profiles"
}
settings.material_effect_mappings_file_names = {
	"scripts/settings/material_effect_mappings_shovel"
}
settings.statistics_definitions = {
	"scripts/managers/backend/statistics_definitions_shovel"
}
settings.statistics_lookup = {
	"shovel_skeleton_attack_big",
	"shovel_skeleton_defend",
	"shovel_staff_balefire",
	"shovel_skeleton_balefire",
	"shovel_fast_staff_attack"
}
settings.anim_lookup = {
	"to_ghost_scythe",
	"to_quarter_staff",
	"to_quarter_staff_wield",
	"to_quarter_staff_auto",
	"ability_test",
	"ability_test_left",
	"ability_test_right",
	"ability_shield_bash",
	"ability_test_charge",
	"ability_test_charge_finish",
	"necro_ability_start",
	"necro_ability_cancel",
	"necro_ability_cast",
	"inspect_snap_left",
	"inspect_snap_right",
	"inspect_snap_both",
	"inspect_clap",
	"attack_detonate_one",
	"attack_detonate_one_02",
	"attack_detonate_all",
	"idle_disabled",
	"idle_enabled",
	"special_action_02",
	"blood_start",
	"blood_loop",
	"blood_exit",
	"soul_rip_start",
	"soul_rip_loop",
	"soul_rip_attack",
	"soul_rip_pop",
	"soul_rip_exit",
	"chain_attack",
	"chain_attack_02",
	"pet_control_equip",
	"pet_control_cancel",
	"pet_control_target",
	"pet_control_target_command",
	"pet_control_target_command_return",
	"pet_control_sacrifice",
	"to_necro_command_item",
	"career_select_spawn",
	"career_select_spawn_02"
}
settings.husk_lookup = {
	"units/beings/npcs/necromancer_skeleton/chr_npc_necromancer_skeleton",
	"units/weapons/player/wpn_bw_necromancy_staff_01/wpn_bw_necromancy_staff_projectile_02_3p",
	"units/weapons/player/wpn_necromancy_skull/wpn_necromancy_skull_3p",
	"units/weapons/player/wpn_necromancy_skull/wpn_necromancy_skull_3ps",
	"units/props/skulls/deus_skull/deus_skull_01",
	"units/beings/player/bright_wizard_necromancer/talents/ripped_soul",
	"units/beings/player/bright_wizard_necromancer/talents/trapped_soul_skull",
	"units/weapons/player/wpn_bw_necromancy_staff_01/wpn_bw_necromancy_staff_projectile_03"
}
settings.effects = {
	"fx/chr_chaos_warrior_cleave_impact_ground",
	"fx/magic_wind_heavens_lightning_strike_01",
	"fx/wpnfx_skull_explosion_3p",
	"fx/wpnfx_skull_explosion_big_3p",
	"fx/wpnfx_skull_staff_impact",
	"fx/wpnfx_staff_death/rip_channel",
	"fx/wpnfx_staff_death/rip_soul",
	"fx/wpnfx_staff_death/rip_burst",
	"fx/wpnfx_staff_death/rip_temp_directional",
	"fx/wpnfx_staff_death/curse_spirit",
	"fx/wpnfx_staff_death/curse_spirit_first",
	"fx/wpnfx_staff_death/curse_spirit_impact",
	"fx/necromancer_wave_round",
	"fx/player_overcharge_explosion_necromancer",
	"fx/necromancer_skeleton_sacrifice",
	"fx/necromancer_cursed_explosion_blood",
	"fx/necromancer_cursed_explosion_blue"
}
settings._tracked_weapon_kill_stats = {}
settings.unlock_settings = {
	shovel = {
		id = "2585630",
		class = "UnlockDlc",
		requires_restart = true
	},
	shovel_upgrade = {
		id = "2585640",
		class = "UnlockDlc",
		requires_restart = true
	}
}
settings.unlock_settings_xb1 = {
	shovel = {
		id = "35315039-4B53-3034-C05A-465731382100",
		backend_reward_id = "shovel",
		class = "UnlockDlc",
		requires_restart = true
	},
	shovel_upgrade = {
		id = "35315039-4B53-3034-C05A-465731382100",
		backend_reward_id = "shovel_upgrade",
		class = "UnlockDlc"
	}
}
settings.unlock_settings_ps4 = {
	CUSA13595_00 = {
		shovel = {
			product_label = "V2USNECROMANCER0",
			backend_reward_id = "shovel",
			class = "UnlockDlc",
			requires_restart = true,
			id = "17308f2304a046debd6d22e8054b501a"
		},
		shovel_upgrade = {
			id = "17308f2304a046debd6d22e8054b501a",
			product_label = "V2USNECROMANCER0",
			class = "UnlockDlc",
			backend_reward_id = "shovel_upgrade"
		}
	},
	CUSA13645_00 = {
		shovel = {
			product_label = "V2EUNECROMANCER0",
			backend_reward_id = "shovel",
			class = "UnlockDlc",
			requires_restart = true,
			id = "fee4879df76040f2adfca4629c58225f"
		},
		shovel_upgrade = {
			id = "fee4879df76040f2adfca4629c58225f",
			product_label = "V2EUNECROMANCER0",
			class = "UnlockDlc",
			backend_reward_id = "shovel_upgrade"
		}
	}
}
settings.store_layout = {
	structure = {
		cosmetics = {
			sienna = {
				necromancer = {
					necromancer_weapon_skins = "item_details"
				}
			}
		}
	},
	pages = {
		necromancer = {
			sound_event_enter = "Play_hud_store_category_button",
			layout = "category",
			display_name = "bw_necromancer",
			item_filter = "can_wield_bw_necromancer",
			sort_order = 4,
			category_button_texture = "store_category_icon_sienna_necromancer",
			global_shader_flag_overrides = {
				NECROMANCER_CAREER_REMAP = true
			}
		},
		necromancer_weapon_skins = {
			sound_event_enter = "Play_hud_store_category_button",
			layout = "item_list",
			display_name = "menu_store_category_title_weapon_illusions",
			type = "item",
			item_filter = "item_type == weapon_skin",
			sort_order = 3,
			category_button_texture = "store_category_icon_weapons",
			global_shader_flag_overrides = {
				NECROMANCER_CAREER_REMAP = true
			}
		}
	}
}
settings.network_damage_types = {
	"cursed_blood_spread"
}
settings.bt_enter_hooks = {
	disable_perception = function (unit, blackboard, t)
		blackboard.disable_perception_data = blackboard.override_target_selection_name
		blackboard.override_target_selection_name = "perception_no_seeing"
	end,
	necromancer_trigger_explode = function (unit, blackboard, t)
		if not blackboard.explosion_triggered then
			blackboard.explosion_triggered = true

			AiUtils.kill_unit(unit)
		end
	end,
	start_stand_ground = function (unit, blackboard, t)
		blackboard.goal_destination = Vector3Box(blackboard.stand_ground_position:unbox())

		blackboard.navigation_extension:set_enabled(true)
	end,
	start_follow_commander = function (unit, blackboard, t)
		if blackboard.commander_extension then
			blackboard.commander_extension:register_follow_node_update(unit)
			blackboard.navigation_extension:set_enabled(true)
		end
	end
}
settings.projectile_templates = {
	"necromancer_trapped_soul"
}
settings.bt_leave_hooks = {
	enable_perception = function (unit, blackboard, t)
		blackboard.override_target_selection_name = blackboard.disable_perception_data
		blackboard.disable_perception_data = nil
	end,
	start_disabled_resume_timer = function (unit, blackboard, t)
		blackboard.disabled_resume_time = t + 0.5
	end,
	command_attack_done = function (unit, blackboard, t)
		blackboard.new_command_attack = nil
	end,
	remove_charge_target = function (unit, blackboard, t)
		if blackboard.anim_cb_charge_impact_finished or blackboard.commander_target ~= blackboard.charge_target then
			blackboard.stick_to_enemy_t = t + 5
			blackboard.charge_target = nil
		end
	end,
	stop_follow_commander = function (unit, blackboard, t)
		if blackboard.commander_extension then
			blackboard.commander_extension:unregister_follow_node_update(unit)
		end
	end
}
settings.progression_unlocks = {
	bw_necromancer = {
		description = "end_screen_career_unlocked",
		profile = "bright_wizard",
		value = "bw_necromancer",
		title = "bw_necromancer",
		level_requirement = 0,
		unlock_type = "career"
	}
}
settings.systems = {
	"scripts/entity_system/systems/ai/ai_commander_system"
}
settings.entity_extensions = {
	"scripts/unit_extensions/ai_commander/ai_commander_extension"
}
