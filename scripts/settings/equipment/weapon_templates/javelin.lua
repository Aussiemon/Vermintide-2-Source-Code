local ALERT_SOUND_RANGE_FIRE = 4
local ALERT_SOUND_RANGE_HIT = 2
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			anim_end_event = "attack_finished",
			kind = "melee_start",
			attack_hold_input = "action_one_hold",
			anim_event = "attack_swing_charge",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.3,
					end_time = 0.25,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.25,
					external_multiplier = 0.7,
					end_time = 0.5,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.35,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "stab_01",
					start_time = 0,
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_stab",
					start_time = 0.35,
					action = "action_one",
					force_release_input = "action_one_hold",
					input = "action_one_release"
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_two",
					input = "action_two_hold",
					end_time = math.huge
				},
				{
					start_time = 0.3,
					blocker = true,
					end_time = 1.5,
					input = "action_one_hold"
				}
			},
			condition_func = function (unit, input_extension, ammo_extension)
				if ammo_extension and (ammo_extension:total_remaining_ammo() <= 0 or ammo_extension:is_reloading()) then
					return false
				end

				return true
			end
		},
		default_left = {
			kind = "melee_start",
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_charge",
			attack_hold_input = "action_one_hold",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.3,
					end_time = 0.25,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.25,
					external_multiplier = 0.7,
					end_time = 0.5,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.35,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "stab_02",
					start_time = 0,
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_stab",
					start_time = 0.45,
					action = "action_one",
					force_release_input = "action_one_hold",
					input = "action_one_release"
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_two",
					input = "action_two_hold",
					end_time = math.huge
				},
				{
					start_time = 0.3,
					blocker = true,
					end_time = 1.5,
					input = "action_one_hold"
				}
			}
		},
		default_chain_01 = {
			kind = "melee_start",
			anim_end_event = "attack_finished",
			anim_event = "attack_chain_01",
			attack_hold_input = "action_one_hold",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			enter_function = function (attacker_unit, input_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
			end,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.35,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "chain_stab_01",
					start_time = 0,
					action = "action_one",
					end_time = 0.5,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_stab",
					start_time = 0.55,
					action = "action_one",
					force_release_input = "action_one_hold",
					input = "action_one_release"
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_two",
					input = "action_two_hold",
					end_time = math.huge
				}
			}
		},
		default_chain_02 = {
			kind = "melee_start",
			anim_end_event = "attack_finished",
			anim_event = "attack_chain_02",
			attack_hold_input = "action_one_hold",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			enter_function = function (attacker_unit, input_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
			end,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.35,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "chain_stab_02",
					start_time = 0,
					action = "action_one",
					end_time = 0.5,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_stab",
					start_time = 0.55,
					action = "action_one",
					force_release_input = "action_one_hold",
					input = "action_one_release"
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_two",
					input = "action_two_hold",
					end_time = math.huge
				}
			}
		},
		default_chain_03 = {
			kind = "melee_start",
			anim_end_event = "attack_finished",
			anim_event = "attack_chain_03",
			attack_hold_input = "action_one_hold",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			enter_function = function (attacker_unit, input_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
			end,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.35,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "chain_stab_03",
					start_time = 0,
					action = "action_one",
					end_time = 0.5,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_stab",
					start_time = 0.55,
					action = "action_one",
					force_release_input = "action_one_hold",
					input = "action_one_release"
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_two",
					input = "action_two_hold",
					end_time = math.huge
				}
			}
		},
		stab_01 = {
			damage_window_start = 0.1,
			range_mod = 1.35,
			hit_stop_anim = "attack_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "javelin_stab_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = true,
			width_mod = 20,
			damage_profile = "medium_javelin_smiter_stab",
			hit_shield_stop_anim = "attack_hit_shield",
			aim_assist_ramp_multiplier = 0.5,
			hit_effect = "melee_hit_sword_1h",
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.1,
			damage_window_end = 0.2,
			impact_sound_event = "javelin_stab_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.8,
			range_mod_add = 0.25,
			uninterruptible = true,
			anim_event = "attack_swing_stab",
			height_mod = 4,
			total_time = 0.9,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.3,
					end_time = 0.25,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.25,
					external_multiplier = 0.7,
					end_time = 0.5,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.35,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default_left",
					start_time = 0.55,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one",
					end_time = math.huge
				},
				{
					sub_action = "charge_from_stab_02",
					start_time = 0.3,
					action = "action_two",
					end_time = 0.5,
					input = "action_two_hold"
				}
			},
			baked_sweep = {
				{
					0.06666666666666668,
					0.3305835723876953,
					-0.34534549713134766,
					-0.27189886569976807,
					0.549194872379303,
					0.3693420886993408,
					0.437251478433609,
					-0.6089192628860474
				},
				{
					0.09444444444444446,
					0.22556400299072266,
					-0.4104452133178711,
					-0.15607857704162598,
					0.6388583779335022,
					0.23746083676815033,
					0.23757730424404144,
					-0.6921195387840271
				},
				{
					0.12222222222222223,
					0.13665294647216797,
					0.4511985778808594,
					-0.12193381786346436,
					0.6757432818412781,
					-0.04890710487961769,
					-0.1177792176604271,
					-0.7260215282440186
				},
				{
					0.15000000000000002,
					0.12272214889526367,
					0.7227563858032227,
					-0.12071621417999268,
					0.6606518030166626,
					-0.137604221701622,
					-0.22386318445205688,
					-0.703199565410614
				},
				{
					0.17777777777777778,
					0.1292405128479004,
					0.6959629058837891,
					-0.12065386772155762,
					0.6598964333534241,
					-0.1300027072429657,
					-0.21250201761722565,
					-0.7088574171066284
				},
				{
					0.20555555555555557,
					0.12964200973510742,
					0.6954822540283203,
					-0.1205899715423584,
					0.6597594618797302,
					-0.1303025782108307,
					-0.2123393416404724,
					-0.7089786529541016
				},
				{
					0.23333333333333334,
					0.12865400314331055,
					0.6944990158081055,
					-0.12080168724060059,
					0.6596964001655579,
					-0.13107988238334656,
					-0.211606964468956,
					-0.7091130614280701
				}
			}
		},
		stab_02 = {
			damage_window_start = 0.06,
			range_mod = 1.35,
			hit_stop_anim = "attack_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "javelin_stab_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = true,
			width_mod = 20,
			damage_profile = "medium_javelin_smiter_stab",
			hit_shield_stop_anim = "attack_hit_shield",
			aim_assist_ramp_multiplier = 0.5,
			hit_effect = "melee_hit_sword_1h",
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.1,
			damage_window_end = 0.16,
			impact_sound_event = "javelin_stab_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.8,
			range_mod_add = 0.25,
			uninterruptible = true,
			anim_event = "attack_swing_stab_02",
			height_mod = 4,
			total_time = 0.9,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.3,
					end_time = 0.25,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.25,
					external_multiplier = 0.7,
					end_time = 0.5,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.35,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "chain_stab_01",
					start_time = 0.55,
					action = "action_one",
					input = "action_one",
					end_time = math.huge
				},
				{
					sub_action = "charge_from_stab_02",
					start_time = 0.25,
					action = "action_two",
					end_time = 0.43,
					input = "action_two_hold"
				}
			},
			baked_sweep = {
				{
					0.026666666666666665,
					0.6193647384643555,
					-0.31058692932128906,
					0.07839584350585938,
					0.06531381607055664,
					0.6755775809288025,
					0.7304489016532898,
					-0.07598309963941574
				},
				{
					0.05444444444444444,
					0.5050935745239258,
					-0.4526824951171875,
					0.1933649778366089,
					-0.10275669395923615,
					0.6941450238227844,
					0.7121403217315674,
					0.021446412429213524
				},
				{
					0.08222222222222222,
					0.3066110610961914,
					0.13411235809326172,
					0.13377976417541504,
					-0.14531788229942322,
					0.7101529240608215,
					0.6872853636741638,
					0.04695113003253937
				},
				{
					0.10999999999999999,
					0.19968032836914062,
					0.6970796585083008,
					0.041188716888427734,
					-0.1444232016801834,
					0.7065479755401611,
					0.6920448541641235,
					0.03171467408537865
				},
				{
					0.13777777777777778,
					0.2052764892578125,
					0.6839866638183594,
					0.043387413024902344,
					-0.13917116820812225,
					0.7052488327026367,
					0.694416880607605,
					0.03226065635681152
				},
				{
					0.16555555555555557,
					0.2059488296508789,
					0.6832513809204102,
					0.0429530143737793,
					-0.1388341635465622,
					0.7057233452796936,
					0.693999171257019,
					0.03232284262776375
				},
				{
					0.19333333333333333,
					0.2055492401123047,
					0.6823263168334961,
					0.04276168346405029,
					-0.13845160603523254,
					0.7057943344116211,
					0.6939883828163147,
					0.03264281526207924
				}
			}
		},
		heavy_stab = {
			damage_window_start = 0.04,
			range_mod = 1.35,
			hit_stop_anim = "attack_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "javelin_stab_hit_armour",
			additional_critical_strike_chance = 0,
			use_precision_sweep = true,
			width_mod = 20,
			damage_profile = "heavy_javelin_smiter_stab_bleed",
			hit_shield_stop_anim = "attack_hit_shield",
			aim_assist_ramp_multiplier = 0.5,
			hit_effect = "melee_hit_sword_1h",
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.1,
			damage_window_end = 0.16,
			impact_sound_event = "javelin_stab_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.8,
			range_mod_add = 0.25,
			uninterruptible = true,
			anim_event = "attack_swing_stab_charge",
			height_mod = 4,
			total_time = 1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.3,
					end_time = 0.25,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.25,
					external_multiplier = 0.7,
					end_time = 0.5,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.5,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0.8,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.55,
					action = "action_one",
					input = "action_one_hold",
					end_time = math.huge
				},
				{
					sub_action = "chain_stab_01",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one_release",
					end_time = math.huge
				},
				{
					sub_action = "default",
					start_time = 0.8,
					action = "action_two",
					input = "action_two_hold",
					end_time = math.huge
				}
			},
			baked_sweep = {
				{
					0.006666666666666668,
					0.5786838531494141,
					-0.25781700015068054,
					-0.15937817096710205,
					0.2875909209251404,
					0.6623334288597107,
					0.6050375699996948,
					-0.33546316623687744
				},
				{
					0.034444444444444444,
					0.56072998046875,
					-0.12266474962234497,
					-0.16014909744262695,
					0.2629777491092682,
					0.6598801016807556,
					0.6267914175987244,
					-0.3202085494995117
				},
				{
					0.06222222222222223,
					0.41266822814941406,
					0.23739326000213623,
					-0.1813739538192749,
					0.41559430956840515,
					0.5251554250717163,
					0.5286012887954712,
					-0.5216071009635925
				},
				{
					0.09000000000000001,
					0.22064590454101562,
					0.6383257508277893,
					-0.17161738872528076,
					0.5693798065185547,
					0.34158340096473694,
					0.30481666326522827,
					-0.6827989220619202
				},
				{
					0.11777777777777779,
					0.11458206176757812,
					0.7223713994026184,
					-0.16998565196990967,
					0.6495229601860046,
					0.16707107424736023,
					0.11437045782804489,
					-0.7328892350196838
				},
				{
					0.14555555555555555,
					0.11237716674804688,
					0.7233278155326843,
					-0.16323304176330566,
					0.656710684299469,
					0.11240401864051819,
					0.0715281069278717,
					-0.7422804236412048
				},
				{
					0.17333333333333334,
					0.11611747741699219,
					0.719279944896698,
					-0.16489315032958984,
					0.6548587679862976,
					0.12227894365787506,
					0.07968251407146454,
					-0.7415245175361633
				}
			}
		},
		chain_stab_01 = {
			damage_window_start = 0.05,
			range_mod = 1.35,
			hit_stop_anim = "attack_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "javelin_stab_hit_armour",
			additional_critical_strike_chance = 0,
			width_mod = 20,
			use_precision_sweep = true,
			damage_profile = "medium_javelin_smiter_stab",
			aim_assist_ramp_multiplier = 0.5,
			hit_effect = "melee_hit_sword_1h",
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.1,
			damage_window_end = 0.25,
			impact_sound_event = "javelin_stab_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.8,
			range_mod_add = 0.25,
			uninterruptible = true,
			anim_event = "attack_swing_left",
			height_mod = 4,
			total_time = 0.4,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.35,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "chain_stab_02",
					start_time = 0.05,
					action = "action_one",
					end_time = 0.35,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.35,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one",
					end_time = math.huge
				}
			},
			baked_sweep = {
				{
					0.01666666666666667,
					0.2606630325317383,
					-0.5877747535705566,
					-0.18113350868225098,
					0.6192577481269836,
					0.2879035174846649,
					0.2988870143890381,
					-0.6665568351745605
				},
				{
					0.061111111111111116,
					0.14211559295654297,
					0.4660935401916504,
					-0.14449310302734375,
					0.6765066981315613,
					-0.0524018332362175,
					-0.11531256884336472,
					-0.7254624366760254
				},
				{
					0.10555555555555557,
					0.12738990783691406,
					0.6884756088256836,
					-0.1364227533340454,
					0.6547830700874329,
					-0.12636610865592957,
					-0.21403422951698303,
					-0.7137787342071533
				},
				{
					0.15,
					0.12904739379882812,
					0.695000171661377,
					-0.14073646068572998,
					0.6566386222839355,
					-0.12910772860050201,
					-0.2131718546152115,
					-0.7118389010429382
				},
				{
					0.19444444444444445,
					0.129058837890625,
					0.6949830055236816,
					-0.14072179794311523,
					0.6566387414932251,
					-0.12910747528076172,
					-0.21317175030708313,
					-0.7118389010429382
				},
				{
					0.2388888888888889,
					0.12927722930908203,
					0.694770336151123,
					-0.14083635807037354,
					0.6566374897956848,
					-0.12900538742542267,
					-0.212859109044075,
					-0.7119520902633667
				},
				{
					0.2833333333333333,
					0.20427989959716797,
					0.6132898330688477,
					-0.18884289264678955,
					0.6510308384895325,
					-0.051568176597356796,
					-0.07536566257476807,
					-0.7535380721092224
				}
			}
		},
		chain_stab_02 = {
			damage_window_start = 0.27,
			range_mod = 1.35,
			hit_stop_anim = "attack_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "javelin_stab_hit_armour",
			additional_critical_strike_chance = 0,
			width_mod = 20,
			use_precision_sweep = true,
			damage_profile = "medium_javelin_smiter_stab",
			aim_assist_ramp_multiplier = 0.5,
			hit_effect = "melee_hit_sword_1h",
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.1,
			damage_window_end = 0.37,
			impact_sound_event = "javelin_stab_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.8,
			range_mod_add = 0.25,
			uninterruptible = true,
			anim_event = "attack_swing_right",
			height_mod = 4,
			total_time = 0.6,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.35,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "chain_stab_03",
					start_time = 0.35,
					action = "action_one",
					end_time = 0.75,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one",
					end_time = math.huge
				}
			},
			baked_sweep = {
				{
					0.2366666666666667,
					0.30550670623779297,
					-0.5235757827758789,
					-0.17065995931625366,
					0.3730241060256958,
					0.599800705909729,
					0.5740035772323608,
					-0.4142608046531677
				},
				{
					0.2644444444444445,
					0.28437232971191406,
					-0.4370450973510742,
					-0.16197717189788818,
					0.3537741005420685,
					0.6041872501373291,
					0.5835884213447571,
					-0.4113711416721344
				},
				{
					0.2922222222222222,
					0.17377376556396484,
					0.3726534843444824,
					-0.16123700141906738,
					0.4225410223007202,
					0.5158154368400574,
					0.5173313617706299,
					-0.5364342927932739
				},
				{
					0.32,
					0.14693069458007812,
					0.7328734397888184,
					-0.15569591522216797,
					0.4580988585948944,
					0.47798630595207214,
					0.4808213710784912,
					-0.5748785138130188
				},
				{
					0.3477777777777778,
					0.14776229858398438,
					0.701322078704834,
					-0.15466809272766113,
					0.4556368589401245,
					0.47996702790260315,
					0.48293831944465637,
					-0.5734083652496338
				},
				{
					0.37555555555555553,
					0.14780807495117188,
					0.7019884586334229,
					-0.1547224521636963,
					0.4556564688682556,
					0.47999027371406555,
					0.48294001817703247,
					-0.573371946811676
				},
				{
					0.4033333333333333,
					0.14780807495117188,
					0.701988697052002,
					-0.15472251176834106,
					0.45565640926361084,
					0.4799902141094208,
					0.48294001817703247,
					-0.573371946811676
				}
			}
		},
		chain_stab_03 = {
			damage_window_start = 0.24,
			range_mod = 1.35,
			hit_stop_anim = "attack_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "javelin_stab_hit_armour",
			additional_critical_strike_chance = 0,
			width_mod = 20,
			use_precision_sweep = true,
			damage_profile = "medium_javelin_smiter_stab_bleed",
			aim_assist_ramp_multiplier = 0.5,
			hit_effect = "melee_hit_sword_1h",
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.1,
			damage_window_end = 0.34,
			impact_sound_event = "javelin_stab_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.8,
			range_mod_add = 0.25,
			uninterruptible = true,
			anim_event = "attack_swing_up",
			height_mod = 4,
			total_time = 0.85,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.35,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one",
					end_time = math.huge
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_two",
					input = "action_two_hold",
					end_time = math.huge
				}
			},
			baked_sweep = {
				{
					0.20666666666666667,
					0.45890140533447266,
					-0.5438385009765625,
					0.0920458436012268,
					-0.08772727847099304,
					0.6752855777740479,
					0.7321291565895081,
					0.016740312799811363
				},
				{
					0.23444444444444446,
					0.32787132263183594,
					0.05308341979980469,
					0.11589056253433228,
					-0.14075738191604614,
					0.7113621830940247,
					0.6871524453163147,
					0.04441606253385544
				},
				{
					0.26222222222222225,
					0.20438861846923828,
					0.6773319244384766,
					0.043960750102996826,
					-0.14433518052101135,
					0.7074929475784302,
					0.6910586357116699,
					0.032544560730457306
				},
				{
					0.29000000000000004,
					0.20506858825683594,
					0.6839456558227539,
					0.04326349496841431,
					-0.13950499892234802,
					0.7054104208946228,
					0.6941894292831421,
					0.03218042105436325
				},
				{
					0.31777777777777777,
					0.205291748046875,
					0.6832799911499023,
					0.04312938451766968,
					-0.13917775452136993,
					0.7055976390838623,
					0.6940640807151794,
					0.03219687566161156
				},
				{
					0.34555555555555556,
					0.20538997650146484,
					0.687077522277832,
					0.041262805461883545,
					-0.13910719752311707,
					0.7054281234741211,
					0.6942516565322876,
					0.032170407474040985
				},
				{
					0.37333333333333335,
					0.2062511444091797,
					0.7310867309570312,
					0.022400200366973877,
					-0.14215390384197235,
					0.7005814909934998,
					0.6983355283737183,
					0.036129798740148544
				}
			}
		},
		throw_charged = {
			reset_aim_on_attack = true,
			anim_end_event = "attack_finished",
			speed = 7000,
			kind = "thrown_projectile",
			anim_event_last_ammo_3p = "attack_throw_last",
			charge_value = "zoomed_arrow_hit",
			weapon_action_hand = "right",
			hit_effect = "throwing_javelin",
			anim_event_last_ammo = "attack_throw_last",
			minimum_hold_time = 0.4,
			attack_template = "arrow_sniper_1",
			ammo_usage = 1,
			anim_event_infinite_ammo = "attack_throw",
			apply_recoil = true,
			fire_time = 0.03,
			anim_event_infinite_ammo_3p = "attack_throw",
			hold_input = "action_two_hold",
			anim_event = "attack_throw",
			no_out_of_ammo_vo = true,
			total_time = 0.55,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.3,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.45,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.45,
					action = "action_two",
					input = "action_two_hold",
					end_time = math.huge
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			projectile_info = Projectiles.javelin,
			impact_data = {
				depth_damage_modifier_min = 1,
				flow_event_on_walls = "teleport_out",
				link = true,
				depth_offset = -0.2,
				depth = 0.7,
				flow_event_on_init = "link_projectile_show",
				wall_nail = true,
				damage_profile = "thrown_javelin",
				no_stop_on_friendly_fire = true,
				depth_damage_modifier_max = 1.2
			},
			alert_sound_range_fire = ALERT_SOUND_RANGE_FIRE,
			alert_sound_range_hit = ALERT_SOUND_RANGE_HIT,
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.2,
				vertical_climb = -2,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		}
	},
	action_two = {
		default = {
			allow_hold_toggle = true,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			action_priority = 1,
			weapon_action_hand = "right",
			hold_input = "action_two_hold",
			anim_event = "throw_charge",
			minimum_hold_time = 0.2,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.25,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.3,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0.2,
					action = "action_wield",
					input = "action_wield",
					end_time = math.huge
				},
				{
					sub_action = "throw_charged",
					start_time = 0.5,
					action = "action_one",
					input = "action_one",
					end_time = math.huge
				},
				{
					softbutton_threshold = 0.5,
					start_time = 0.4,
					action = "action_one",
					sub_action = "throw_charged",
					input = "action_one_softbutton_gamepad",
					end_time = math.huge
				}
			},
			condition_func = function (unit, input_extension, ammo_extension)
				if ammo_extension and (ammo_extension:total_remaining_ammo() <= 0 or ammo_extension:is_reloading()) then
					return false
				end

				return true
			end,
			chain_condition_func = function (action_user, input_extension, ammo_extension)
				if ammo_extension and (ammo_extension:total_remaining_ammo() <= 0 or ammo_extension:is_reloading()) then
					return false
				end

				return true
			end
		},
		charge_from_stab_02 = {
			allow_hold_toggle = true,
			anim_end_event = "attack_finished",
			kind = "melee_start",
			action_priority = 0,
			weapon_action_hand = "right",
			hold_input = "action_two_hold",
			anim_event = "throw_charge",
			minimum_hold_time = 0.2,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.25,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0.2,
					action = "action_wield",
					input = "action_wield",
					end_time = math.huge
				},
				{
					sub_action = "throw_charged",
					start_time = 0.25,
					action = "action_one",
					input = "action_one",
					end_time = math.huge
				},
				{
					softbutton_threshold = 0.75,
					start_time = 0.65,
					action = "action_one",
					sub_action = "throw_charged",
					input = "action_one_softbutton_gamepad",
					end_time = math.huge
				}
			},
			condition_func = function (unit, input_extension, ammo_extension)
				if ammo_extension and (ammo_extension:total_remaining_ammo() <= 0 or ammo_extension:is_reloading()) then
					return false
				end

				return true
			end,
			chain_condition_func = function (action_user, input_extension, ammo_extension)
				if ammo_extension and (ammo_extension:total_remaining_ammo() <= 0 or ammo_extension:is_reloading()) then
					return false
				end

				return true
			end
		}
	},
	weapon_reload = {
		default = {
			anim_time_scale = 1,
			catch_time = 0.7,
			should_not_remove = true,
			anim_end_event = "reload_finished",
			kind = "catch",
			uninterruptible = false,
			hold_input = "weapon_reload_hold",
			anim_event = "reload",
			total_time = 1.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.85,
					buff_name = "planted_fast_decrease_movement",
					end_time = math.huge
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
			end,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 1,
					action = "weapon_reload",
					auto_chain = true
				}
			},
			condition_func = function (unit, input_extension, ammo_extension)
				if ammo_extension and ammo_extension:total_remaining_ammo() < ammo_extension:max_ammo() then
					return true
				end

				return false
			end,
			chain_condition_func = function (action_user, input_extension, ammo_extension)
				if ammo_extension and ammo_extension:total_remaining_ammo() < ammo_extension:max_ammo() then
					return true
				end

				return false
			end
		}
	},
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield
}
weapon_template.ammo_data = {
	ammo_hand = "right",
	ammo_per_reload = 1,
	ammo_type = "throwing_javelin",
	ammo_per_clip = 1,
	block_ammo_pickup = true,
	play_reload_anim_on_wield_reload = true,
	should_update_anim_ammo = true,
	has_wield_reload_anim = true,
	max_ammo = 3,
	reload_on_ammo_pickup = true,
	reload_time = 0,
	ammo_kind = "thrown_javelin",
	ammo_unit_attachment_node_linking = AttachmentNodeLinking.polearm
}
weapon_template.attack_meta_data = {
	max_range = 30,
	can_charge_shot = true,
	always_charge_before_firing = true,
	charged_attack_action_name = "throw_charged",
	aim_at_node = "j_spine1",
	ignore_enemies_for_obstruction_charged = true,
	aim_at_node_charged = "j_spine1",
	minimum_charge_time = 0.55,
	charge_when_obstructed = false,
	ignore_enemies_for_obstruction = false,
	effective_against = bit.bor(BreedCategory.Berserker, BreedCategory.Special),
	effective_against_charged = bit.bor(BreedCategory.Berserker, BreedCategory.Special, BreedCategory.Armored)
}
local action = weapon_template.actions.action_one.throw_charged
weapon_template.default_loaded_projectile_settings = {
	drop_multiplier = 0.03,
	speed = action.speed,
	gravity = ProjectileGravitySettings[action.projectile_info.gravity_settings]
}
weapon_template.default_spread_template = "throwing_axe"
weapon_template.right_hand_unit = "units/weapons/player/wpn_we_javelin_01/wpn_we_javelin_01"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.polearm
weapon_template.left_hand_unit = "units/weapons/player/wpn_we_javelin_01/wpn_we_javelin_01"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.javelin
weapon_template.start_hidden_left_3p = true
weapon_template.display_unit = "units/weapons/weapon_display/display_2h_spears_wood_elf"
weapon_template.crosshair_style = "projectile"
weapon_template.no_ammo_reload_event = "to_ammo"
weapon_template.reload_event = "to_ammo"
weapon_template.buff_type = "RANGED"
weapon_template.wield_anim = "to_javelin"
weapon_template.wield_anim_no_ammo = "to_javelin_noammo"
weapon_template.wield_anim_no_ammo_on_husk = true
weapon_template.weapon_type = "POLEARM"
weapon_template.default_projectile_action = weapon_template.actions.action_one.default
weapon_template.dodge_count = 6
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.2
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.2
	}
}
weapon_template.wwise_dep_ammo = {
	"wwise/javelin"
}
weapon_template.wwise_dep_right_hand = {
	"wwise/javelin"
}
weapon_template.wwise_dep_left_hand = {
	"wwise/javelin"
}
weapon_template.aim_assist_settings = {
	max_range = 50,
	no_aim_input_multiplier = 0,
	always_auto_aim = true,
	base_multiplier = 0,
	target_node = "j_neck",
	effective_max_range = 30,
	breed_scalars = {
		skaven_storm_vermin = 1,
		skaven_clan_rat = 1,
		skaven_slave = 1
	}
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_armour_piercing",
	"weapon_keyword_sniper",
	"weapon_keyword_versatile"
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "default"
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "throw_charged"
	}
}
weapon_template.tooltip_detail = {
	light = {
		action_name = "action_one",
		sub_action_name = "default"
	},
	heavy = {
		{
			action_name = "action_one",
			chain_start_time = 0.65,
			sub_action_name = "throw_charged"
		},
		{
			action_name = "action_one",
			chain_start_time = 0.8,
			sub_action_name = "throw_special_charged"
		},
		custom_chain = true
	}
}

return {
	javelin_template = table.clone(weapon_template)
}
