local weapon_template = {}
weapon_template.actions = {
	action_career_hold = {
		default = {
			kind = "action_selector",
			conditional_actions = {
				{
					sub_action = "default_2",
					condition = function (talent_extension, buff_extension)
						return talent_extension and talent_extension:has_talent("markus_questing_knight_ability_tank_attack")
					end
				},
				{
					sub_action = "default_3",
					condition = function (talent_extension, buff_extension)
						return talent_extension and talent_extension:has_talent("markus_questing_knight_ability_double_activation")
					end
				}
			},
			default_action = {
				sub_action = "default_1"
			}
		},
		default_1 = {
			anim_end_event = "ability_finished",
			kind = "career_dummy",
			uninterruptible = true,
			anim_event = "questing_knight_ability_base_charge",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					input = "action_two"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					input = "weapon_reload"
				},
				{
					sub_action = "default_smiter",
					start_time = 0.35,
					action = "action_career_release",
					input = "action_career_release"
				},
				{
					sub_action = "default_smiter",
					start_time = 0.35,
					action = "action_career_release",
					input = "action_career_not_hold"
				}
			}
		},
		default_2 = {
			anim_end_event = "ability_finished",
			kind = "career_dummy",
			uninterruptible = true,
			anim_event = "questing_knight_ability_tank_charge",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					input = "action_two"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					input = "weapon_reload"
				},
				{
					sub_action = "default_tank",
					start_time = 0.5,
					action = "action_career_release",
					input = "action_career_release"
				},
				{
					sub_action = "default_tank",
					start_time = 0.5,
					action = "action_career_release",
					input = "action_career_not_hold"
				}
			}
		},
		default_3 = {
			anim_end_event = "ability_finished",
			kind = "career_dummy",
			uninterruptible = true,
			anim_event = "questing_knight_ability_double_activation_charge",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					input = "action_two"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					input = "weapon_reload"
				},
				{
					sub_action = "smiter_combo_1",
					start_time = 0.35,
					action = "action_career_release",
					input = "action_career_release"
				},
				{
					sub_action = "smiter_combo_1",
					start_time = 0.35,
					action = "action_career_release",
					input = "action_career_not_hold"
				}
			}
		}
	},
	action_career_release = {
		default_smiter = {
			damage_window_start = 0.14,
			range_mod = 1.4,
			kind = "career_es_four",
			first_person_hit_anim = "shake_hit",
			anim_time_scale = 1,
			sweep_z_offset = 0.1,
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 1,
			use_precision_sweep = true,
			ignore_armour_hit = true,
			hit_effect = "melee_hit_sword_2h",
			damage_profile = "questing_knight_career_sword",
			damage_window_end = 0.23,
			impact_sound_event = "slashing_hit",
			anim_end_event = "ability_finished",
			on_hit_hud_sound_event = "Play_career_bretonnian_knight_ability_swing_hit",
			dedicated_target_range = 2.5,
			uninterruptible = true,
			anim_event = "questing_knight_ability_base_attack",
			hit_stop_anim = "attack_hit",
			total_time = 1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			vfx_settings = {
				up = 0,
				forward = 2
			},
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.2,
					end_time = 0.2,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.15,
					external_multiplier = 2,
					end_time = 0.45,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.45,
					external_multiplier = 0.5,
					end_time = 0.65,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			baked_sweep = {
				{
					0.10666666666666669,
					0.002361297607421875,
					0.22572040557861328,
					0.4084806442260742,
					-0.5747391581535339,
					-0.023643089458346367,
					-0.08058366179466248,
					-0.8140161037445068
				},
				{
					0.1327777777777778,
					0.007878303527832031,
					0.41441869735717773,
					0.2456207275390625,
					-0.16510161757469177,
					-0.04283272847533226,
					-0.11879976838827133,
					-0.9781582355499268
				},
				{
					0.1588888888888889,
					0.003173828125,
					0.5604715347290039,
					-0.015332221984863281,
					0.37317579984664917,
					-0.07157088071107864,
					-0.1256544440984726,
					-0.9164215326309204
				},
				{
					0.18500000000000003,
					0.009431838989257812,
					0.6247091293334961,
					-0.1364145278930664,
					0.5903171300888062,
					-0.09865187853574753,
					-0.10181120038032532,
					-0.7946244478225708
				},
				{
					0.21111111111111114,
					0.009710311889648438,
					0.6523494720458984,
					-0.3496818542480469,
					0.7631772756576538,
					-0.11792917549610138,
					-0.08753564208745956,
					-0.6292778849601746
				},
				{
					0.23722222222222225,
					-0.011475563049316406,
					0.5043849945068359,
					-0.506662130355835,
					0.8434812426567078,
					-0.08046039938926697,
					-0.04120228812098503,
					-0.5294978618621826
				},
				{
					0.26333333333333336,
					-0.015522956848144531,
					0.3561549186706543,
					-0.5999287366867065,
					0.9093418717384338,
					-0.06475193798542023,
					-0.06767315417528152,
					-0.4053700566291809
				}
			}
		},
		smiter_combo_1 = {
			damage_window_start = 0.14,
			range_mod = 1.4,
			kind = "career_es_four",
			first_person_hit_anim = "shake_hit",
			anim_time_scale = 1,
			sweep_z_offset = 0.1,
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 1,
			combo_no_wield = true,
			use_precision_sweep = true,
			hit_effect = "melee_hit_sword_2h",
			ignore_armour_hit = true,
			damage_window_end = 0.23,
			impact_sound_event = "slashing_hit",
			damage_profile = "questing_knight_career_sword",
			anim_end_event = "ability_finished",
			on_hit_hud_sound_event = "Play_career_bretonnian_knight_ability_swing_hit",
			dedicated_target_range = 2.5,
			uninterruptible = true,
			anim_event = "questing_knight_ability_double_activation_attack_01",
			hit_stop_anim = "attack_hit",
			total_time = 1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			vfx_settings = {
				up = 0,
				forward = 2
			},
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.2,
					end_time = 0.2,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.15,
					external_multiplier = 2,
					end_time = 0.45,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.45,
					external_multiplier = 0.5,
					end_time = 0.65,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					input = "action_two"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					input = "weapon_reload"
				},
				{
					sub_action = "smiter_combo_2",
					start_time = 0.75,
					action = "action_career_release",
					input = "action_career_release"
				},
				{
					sub_action = "smiter_combo_2",
					start_time = 0.75,
					action = "action_career_release",
					input = "action_career_not_hold"
				},
				{
					sub_action = "smiter_combo_2",
					start_time = 0.75,
					action = "action_career_release",
					auto_chain = true
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			baked_sweep = {
				{
					0.10666666666666669,
					0.0023030340671539307,
					0.2261638641357422,
					0.40826356410980225,
					-0.5740386843681335,
					-0.023674916476011276,
					-0.08075253665447235,
					-0.8144925832748413
				},
				{
					0.1327777777777778,
					0.007942155003547668,
					0.40673828125,
					0.25593364238739014,
					-0.18747785687446594,
					-0.04234297201037407,
					-0.11753670126199722,
					-0.9742916822433472
				},
				{
					0.1588888888888889,
					0.003753453493118286,
					0.5575590133666992,
					-0.008395135402679443,
					0.3594699203968048,
					-0.07050682604312897,
					-0.12619024515151978,
					-0.9218927621841431
				},
				{
					0.18500000000000003,
					0.008819222450256348,
					0.6222171783447266,
					-0.13181054592132568,
					0.583687424659729,
					-0.0971175879240036,
					-0.10225801169872284,
					-0.7996376752853394
				},
				{
					0.21111111111111114,
					0.009968265891075134,
					0.6551351547241211,
					-0.3370627760887146,
					0.7566727995872498,
					-0.11719291657209396,
					-0.09068777412176132,
					-0.6367793083190918
				},
				{
					0.23722222222222225,
					-0.011361420154571533,
					0.5058403015136719,
					-0.5058963894844055,
					0.8428370952606201,
					-0.08065628260374069,
					-0.0408385768532753,
					-0.5305209159851074
				},
				{
					0.26333333333333336,
					-0.01573014259338379,
					0.36190319061279297,
					-0.5959649085998535,
					0.9073357582092285,
					-0.06479611992835999,
					-0.06726580113172531,
					-0.4099007248878479
				}
			}
		},
		smiter_combo_2 = {
			damage_window_start = 0.15,
			range_mod = 1.8,
			kind = "career_es_four",
			first_person_hit_anim = "shake_hit",
			anim_time_scale = 1,
			sweep_z_offset = 0.1,
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 1,
			use_precision_sweep = true,
			ignore_armour_hit = true,
			hit_effect = "melee_hit_sword_2h",
			damage_profile = "questing_knight_career_sword_stab",
			damage_window_end = 0.27,
			impact_sound_event = "slashing_hit",
			anim_end_event = "ability_finished",
			on_hit_hud_sound_event = "Play_career_bretonnian_knight_ability_swing_hit",
			dedicated_target_range = 2.5,
			uninterruptible = true,
			anim_event = "questing_knight_ability_double_activation_attack_02",
			hit_stop_anim = "attack_hit",
			total_time = 0.9,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			vfx_settings = {
				up = 1.2,
				forward = 1.5,
				pitch = -math.pi / 2
			},
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.2,
					end_time = 0.2,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.15,
					external_multiplier = 2,
					end_time = 0.45,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.45,
					external_multiplier = 0.5,
					end_time = 0.65,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 1,
					action = "action_two",
					auto_chain = true
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			baked_sweep = {
				{
					0.11666666666666667,
					0.2992544174194336,
					-0.8549087047576904,
					-0.20883572101593018,
					-0.4431801736354828,
					0.5468304753303528,
					0.5484552979469299,
					0.4514026641845703
				},
				{
					0.14777777777777779,
					0.306884765625,
					-0.8023288249969482,
					-0.20673584938049316,
					-0.4364558160305023,
					0.5505356192588806,
					0.5580134391784668,
					0.4416307508945465
				},
				{
					0.1788888888888889,
					0.34606170654296875,
					-0.4087304174900055,
					-0.19377124309539795,
					-0.3824060559272766,
					0.5605194568634033,
					0.6415184140205383,
					0.3578234612941742
				},
				{
					0.21000000000000002,
					0.16968250274658203,
					0.23989242315292358,
					-0.1526503562927246,
					-0.5096800327301025,
					0.476539671421051,
					0.5796784162521362,
					0.42084330320358276
				},
				{
					0.2411111111111111,
					0.20040607452392578,
					0.44659894704818726,
					-0.15443837642669678,
					0.524288535118103,
					-0.3843637704849243,
					-0.5682659149169922,
					-0.5044405460357666
				},
				{
					0.27222222222222225,
					0.19831275939941406,
					0.44607335329055786,
					-0.15331578254699707,
					0.5219355821609497,
					-0.38639694452285767,
					-0.5703303813934326,
					-0.5029953718185425
				},
				{
					0.30333333333333334,
					0.1984424591064453,
					0.44396835565567017,
					-0.15425515174865723,
					0.5210402011871338,
					-0.3872292935848236,
					-0.5679898262023926,
					-0.505923330783844
				}
			}
		},
		default_tank = {
			5,
			damage_window_start = 0.15,
			range_mod = 2,
			sweep_z_offset = 0.1,
			kind = "career_es_four",
			first_person_hit_anim = "shake_hit",
			anim_time_scale = 1,
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 1,
			ignore_armour_hit = true,
			damage_profile = "questing_knight_career_sword_tank",
			hit_effect = "melee_hit_sword_2h",
			damage_window_end = 0.25,
			impact_sound_event = "slashing_hit",
			slide_armour_hit = true,
			anim_end_event = "ability_finished",
			on_hit_hud_sound_event = "Play_career_bretonnian_knight_ability_swing_hit",
			dedicated_target_range = 2.5,
			uninterruptible = true,
			anim_event = "questing_knight_ability_tank_attack",
			hit_stop_anim = "attack_hit",
			total_time = 1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			vfx_settings = {
				up = 0,
				forward = 0.5
			},
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.2,
					end_time = 0.2,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.15,
					external_multiplier = 2,
					end_time = 0.45,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.45,
					external_multiplier = 0.5,
					end_time = 0.65,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.11666666666666667,
					0.2617945671081543,
					0.5216827392578125,
					-0.09017786383628845,
					-0.17894728481769562,
					-0.6804907917976379,
					0.04687986150383949,
					-0.7090222239494324
				},
				{
					0.14444444444444443,
					0.05139589309692383,
					0.6282596588134766,
					-0.09429594874382019,
					0.09876972436904907,
					-0.6820873022079468,
					-0.18397849798202515,
					-0.7008233666419983
				},
				{
					0.17222222222222222,
					-0.1717226505279541,
					0.5754232406616211,
					-0.09418472647666931,
					0.363225519657135,
					-0.5612013936042786,
					-0.47796645760536194,
					-0.5697969198226929
				},
				{
					0.2,
					-0.3698701858520508,
					0.4404783248901367,
					-0.1323847472667694,
					-0.47897839546203613,
					0.4403030574321747,
					0.5777339935302734,
					0.492885559797287
				},
				{
					0.22777777777777777,
					-0.4809814691543579,
					0.2675809860229492,
					-0.1651838719844818,
					-0.6149066090583801,
					0.21872760355472565,
					0.6841543316841125,
					0.3255472481250763
				},
				{
					0.25555555555555554,
					-0.5182117223739624,
					0.17220592498779297,
					-0.21592029929161072,
					-0.6955864429473877,
					-0.0021528340876102448,
					0.7090138792991638,
					0.11599224805831909
				},
				{
					0.2833333333333333,
					-0.4777565002441406,
					0.10524272918701172,
					-0.2528950870037079,
					0.7236777544021606,
					0.08279956132173538,
					-0.6836010813713074,
					-0.04608994349837303
				}
			}
		}
	},
	action_two = {
		default = {
			kind = "career_dummy",
			is_ability_cancel = true,
			anim_end_event = "ability_finished",
			anim_event = "questing_knight_ability_cancel_01",
			total_time = 0.47,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {}
		}
	},
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield
}
weapon_template.attack_meta_data = {
	ignore_allies_for_obstruction = true,
	ignore_allies_for_obstruction_charged = true,
	charged_attack_action_name = "default",
	base_action_name = "action_career_release",
	ignore_enemies_for_obstruction_charged = true,
	charge_when_obstructed = true,
	ignore_enemies_for_obstruction = true,
	tap_attack = {
		penetrating = false,
		arc = 2
	},
	hold_attack = {
		penetrating = true,
		arc = 0
	}
}
weapon_template.right_hand_unit = "units/weapons/player/wpn_greatsword/wpn_greatsword"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.two_handed_melee_weapon
weapon_template.display_unit = "units/weapons/weapon_display/display_2h_swords_executioner"
weapon_template.wield_anim = "to_bastard_sword"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/career/skill_questingknight"
weapon_template.load_state_machine = false
weapon_template.buff_type = "MELEE_2H"
weapon_template.weapon_type = "SWORD_2H"
weapon_template.dodge_count = 2
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1
	},
	change_dodge_speed = {
		external_optional_multiplier = 1
	}
}
weapon_template.particle_fx = {
	wield = {
		{
			orphaned_policy = "stop",
			effect = "fx/grail_knight_smoke_body",
			third_person = true,
			link_target = "owner_3p",
			first_person = false,
			link_node = "j_hips",
			destroy_policy = "stop_spawning"
		},
		{
			orphaned_policy = "stop",
			effect = "fx/grail_knight_ability_light",
			third_person = true,
			link_target = "owner_3p",
			first_person = false,
			link_node = "j_hips",
			destroy_policy = "destroy"
		},
		{
			orphaned_policy = "destroy",
			effect = "fx/knight_sword_trail_sparks",
			third_person = true,
			link_target = "right_weapon",
			first_person = false,
			destroy_policy = "stop_spawning"
		},
		{
			orphaned_policy = "destroy",
			effect = "fx/knight_sword_trail_sparks_1p",
			third_person = false,
			link_target = "right_weapon",
			first_person = true,
			destroy_policy = "stop_spawning"
		},
		{
			orphaned_policy = "destroy",
			effect = "fx/knight_sword_trail",
			third_person = true,
			link_target = "right_weapon",
			first_person = false,
			destroy_policy = "stop_spawning"
		}
	},
	career_action = {
		{
			orphaned_policy = "destroy",
			effect = "fx/knight_sword_trail_1p",
			third_person = false,
			link_target = "right_weapon",
			first_person = true,
			destroy_policy = "stop_spawning"
		}
	}
}
weapon_template.particle_fx_lookup = table.mirror_array_inplace(table.keys(weapon_template.particle_fx))
weapon_template.aim_assist_settings = {
	max_range = 5,
	no_aim_input_multiplier = 0,
	vertical_only = true,
	base_multiplier = 0.025,
	effective_max_range = 3,
	breed_scalars = {
		skaven_storm_vermin = 0.25,
		skaven_clan_rat = 1,
		skaven_slave = 1
	}
}
weapon_template.wwise_dep_left_hand = {
	"wwise/two_handed_swords"
}

return {
	markus_questingknight_career_skill_weapon = table.clone(weapon_template)
}
