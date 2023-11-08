local push_radius = 2
local time_mod = 1
local weapon_template = {}
weapon_template.actions = {
	action_one = {
		default = {
			kind = "melee_start",
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_charge_diagonal",
			attack_hold_input = "action_one_hold",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.5,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "light_attack_left",
					start_time = 0,
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack",
					start_time = 0.5,
					action = "action_one",
					input = "action_one_release"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_wield",
					input = "action_wield"
				},
				{
					start_time = 0.3,
					blocker = true,
					end_time = 1,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack",
					start_time = 0.7,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		default_right = {
			kind = "melee_start",
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_charge_left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.5,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "light_attack_right",
					start_time = 0,
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_2",
					start_time = 0.5,
					action = "action_one",
					input = "action_one_release"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_wield",
					input = "action_wield"
				},
				{
					start_time = 0.3,
					blocker = true,
					end_time = 1,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack_2",
					start_time = 1,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		default_last = {
			kind = "melee_start",
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_charge_right",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.5,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "light_attack_up_right",
					start_time = 0,
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack",
					start_time = 0.5,
					action = "action_one",
					input = "action_one_release"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_wield",
					input = "action_wield"
				},
				{
					start_time = 0.3,
					blocker = true,
					end_time = 1,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack",
					start_time = 1,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		default_left = {
			kind = "melee_start",
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_charge_right",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.5,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "light_attack_up_left",
					start_time = 0,
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack",
					start_time = 0.5,
					action = "action_one",
					input = "action_one_release"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_wield",
					input = "action_wield"
				},
				{
					start_time = 0.3,
					blocker = true,
					end_time = 1,
					input = "action_one_hold"
				},
				{
					sub_action = "heavy_attack",
					start_time = 0.7,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		heavy_attack = {
			damage_window_start = 0.15,
			range_mod = 1.15,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			weapon_action_hand = "both",
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			hit_effect = "melee_hit_dagger",
			slide_armour_hit = true,
			damage_profile_left = "light_slashing_linesman_dual_medium",
			damage_window_end = 0.4,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			damage_profile_right = "light_slashing_linesman_dual_medium",
			dedicated_target_range = 2.5,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_left_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 2.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.25,
					end_time = 0.25,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.25,
					external_multiplier = 0.9,
					end_time = 0.4,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right",
					start_time = 0.6,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 0.75,
					input = "action_one"
				},
				{
					sub_action = "default_right",
					start_time = 1,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 1,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			hit_mass_count = HEAVY_LINESMAN_HIT_MASS_COUNT,
			baked_sweep_right = {
				{
					0.11666666666666667,
					-0.3282308578491211,
					0.20677566528320312,
					0.03135108947753906,
					-0.6316266059875488,
					0.24598079919815063,
					-0.01390988938510418,
					-0.7350835204124451
				},
				{
					0.16944444444444445,
					-0.3087639808654785,
					0.3108196258544922,
					0.006352424621582031,
					-0.4590339958667755,
					0.3522060811519623,
					-0.12365122884511948,
					-0.8061942458152771
				},
				{
					0.2222222222222222,
					-0.25835275650024414,
					0.4273033142089844,
					0.013180732727050781,
					-0.23631347715854645,
					0.4405791759490967,
					-0.10266878455877304,
					-0.8599448204040527
				},
				{
					0.275,
					-0.09502315521240234,
					0.5826930999755859,
					-0.05784416198730469,
					0.07516291737556458,
					0.5038447976112366,
					0.06443801522254944,
					-0.8581018447875977
				},
				{
					0.3277777777777778,
					0.3698463439941406,
					0.6373805999755859,
					-0.24372577667236328,
					0.5466291904449463,
					0.4248965084552765,
					0.38117629289627075,
					-0.6126697659492493
				},
				{
					0.38055555555555554,
					0.5605192184448242,
					0.41599464416503906,
					-0.3181781768798828,
					0.6760491728782654,
					0.2807996869087219,
					0.5005018711090088,
					-0.4621764123439789
				},
				{
					0.43333333333333335,
					0.6199445724487305,
					0.2512550354003906,
					-0.33178138732910156,
					0.7047979235649109,
					0.1891769915819168,
					0.540800154209137,
					-0.4183385670185089
				}
			},
			baked_sweep_left = {
				{
					0.11666666666666667,
					0.27337121963500977,
					0.2504234313964844,
					0.02742767333984375,
					-0.5762438774108887,
					-0.22574582695960999,
					0.39847055077552795,
					-0.6769070029258728
				},
				{
					0.16944444444444445,
					0.26330089569091797,
					0.25400352478027344,
					0.03152656555175781,
					-0.5824669599533081,
					-0.2253025621175766,
					0.4099588096141815,
					-0.6647592186927795
				},
				{
					0.2222222222222222,
					0.2678966522216797,
					0.37261009216308594,
					0.03131389617919922,
					-0.49487802386283875,
					-0.2841949164867401,
					0.47217464447021484,
					-0.6718482971191406
				},
				{
					0.275,
					0.12757444381713867,
					0.6042442321777344,
					-0.04871940612792969,
					-0.16017627716064453,
					-0.4108457565307617,
					0.3015138804912567,
					-0.8453630805015564
				},
				{
					0.3277777777777778,
					-0.29271411895751953,
					0.69915771484375,
					-0.2734184265136719,
					0.5019019842147827,
					-0.3229021728038788,
					-0.17774398624897003,
					-0.7824549674987793
				},
				{
					0.38055555555555554,
					-0.47046613693237305,
					0.25203514099121094,
					-0.42945098876953125,
					0.7399618029594421,
					-0.22900113463401794,
					-0.34043747186660767,
					-0.5330267548561096
				},
				{
					0.43333333333333335,
					-0.5230088233947754,
					-0.01889801025390625,
					-0.4562215805053711,
					0.788551390171051,
					-0.225145161151886,
					-0.47341233491897583,
					-0.3215232491493225
				}
			}
		},
		heavy_attack_2 = {
			damage_window_start = 0.15,
			range_mod = 1.15,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			weapon_action_hand = "both",
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			hit_effect = "melee_hit_sword_1h",
			slide_armour_hit = true,
			damage_profile_left = "light_slashing_linesman_dual_medium",
			damage_window_end = 0.4,
			impact_sound_event = "slashing_hit",
			anim_end_event = "attack_finished",
			damage_profile_right = "light_slashing_linesman_dual_medium",
			dedicated_target_range = 2.5,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_right",
			hit_stop_anim = "attack_hit",
			total_time = 2.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.5,
					end_time = 0.3,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.3,
					external_multiplier = 0.7,
					end_time = 0.4,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.75,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.25,
					input = "action_one"
				},
				{
					sub_action = "default_left",
					start_time = 1.25,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 1.25,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			hit_mass_count = HEAVY_LINESMAN_HIT_MASS_COUNT,
			baked_sweep_right = {
				{
					0.11666666666666667,
					-0.29720592498779297,
					0.26106834411621094,
					-0.1638956069946289,
					-0.3137936592102051,
					0.48058435320854187,
					-0.44860169291496277,
					-0.6850757598876953
				},
				{
					0.16944444444444445,
					-0.19837284088134766,
					0.4926033020019531,
					-0.1521778106689453,
					-0.1559285968542099,
					0.6565938591957092,
					-0.12691980600357056,
					-0.7269541025161743
				},
				{
					0.2222222222222222,
					0.0724787712097168,
					0.6846122741699219,
					-0.1217489242553711,
					0.25622794032096863,
					0.62513267993927,
					0.4029577076435089,
					-0.6173989772796631
				},
				{
					0.275,
					0.43343544006347656,
					0.5917778015136719,
					-0.1489276885986328,
					0.5665580034255981,
					0.33799129724502563,
					0.65611332654953,
					-0.3664550483226776
				},
				{
					0.3277777777777778,
					0.6770534515380859,
					0.31476402282714844,
					-0.20180034637451172,
					0.6339231133460999,
					0.2437775731086731,
					0.625327467918396,
					-0.3842911422252655
				},
				{
					0.38055555555555554,
					0.7785096168518066,
					-0.021661758422851562,
					-0.225372314453125,
					0.6693102717399597,
					0.17691323161125183,
					0.5781079530715942,
					-0.43187588453292847
				},
				{
					0.43333333333333335,
					0.7899627685546875,
					-0.1772899627685547,
					-0.23154354095458984,
					0.6889456510543823,
					0.13714167475700378,
					0.5563980340957642,
					-0.44381001591682434
				}
			},
			baked_sweep_left = {
				{
					0.11666666666666667,
					0.15451669692993164,
					0.43071937561035156,
					-0.31691551208496094,
					-0.24535758793354034,
					-0.7073465585708618,
					0.2526506185531616,
					-0.6128851175308228
				},
				{
					0.16944444444444445,
					0.0818939208984375,
					0.5713176727294922,
					-0.28692150115966797,
					-0.09695093333721161,
					-0.7651607990264893,
					0.00871153362095356,
					-0.636438250541687
				},
				{
					0.2222222222222222,
					-0.03347301483154297,
					0.6261997222900391,
					-0.20781707763671875,
					0.2328002005815506,
					-0.6711587309837341,
					-0.31333163380622864,
					-0.6302168369293213
				},
				{
					0.275,
					-0.3629450798034668,
					0.5435314178466797,
					-0.18272686004638672,
					-0.518583357334137,
					0.38098397850990295,
					0.6197985410690308,
					0.44919076561927795
				},
				{
					0.3277777777777778,
					-0.6186666488647461,
					0.3421764373779297,
					-0.2073192596435547,
					-0.563861608505249,
					0.15883035957813263,
					0.7635960578918457,
					0.2715770900249481
				},
				{
					0.38055555555555554,
					-0.7030367851257324,
					0.019561767578125,
					-0.25238800048828125,
					-0.5422089695930481,
					-0.06341201812028885,
					0.8334489464759827,
					0.08573886752128601
				},
				{
					0.43333333333333335,
					-0.6788501739501953,
					-0.09879875183105469,
					-0.2697734832763672,
					-0.5190341472625732,
					-0.16913142800331116,
					0.8377891182899475,
					-0.010371075011789799
				}
			}
		},
		light_attack_left = {
			damage_window_start = 0.3,
			range_mod = 1.15,
			anim_end_event = "attack_finished",
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			weapon_action_hand = "left",
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			slide_armour_hit = true,
			hit_effect = "melee_hit_sword_1h",
			damage_profile = "light_slashing_linesman_dual_swords",
			damage_window_end = 0.42,
			impact_sound_event = "slashing_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_left_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.1,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.25,
					end_time = 0.2,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.3,
					external_multiplier = 0.75,
					end_time = 0.5,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right",
					start_time = 0.45,
					action = "action_one",
					end_time = 1,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.3,
					action = "action_wield",
					input = "action_wield"
				}
			},
			impact_axis = Vector3Box(0, 0, 1),
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.26666666666666666,
					0.2855653762817383,
					0.38002586364746094,
					0.033875465393066406,
					-0.615097165107727,
					-0.3086054027080536,
					0.29441165924072266,
					-0.6631289124488831
				},
				{
					0.29777777777777775,
					0.2384185791015625,
					0.4322338104248047,
					0.030068397521972656,
					-0.6416177153587341,
					-0.33117082715034485,
					0.28158676624298096,
					-0.6319506168365479
				},
				{
					0.3288888888888889,
					0.03238487243652344,
					0.7014846801757812,
					-0.07782268524169922,
					-0.10341503471136093,
					-0.44864726066589355,
					0.06023082509636879,
					-0.8856597542762756
				},
				{
					0.36,
					-0.23469257354736328,
					0.705535888671875,
					-0.21743392944335938,
					0.42151716351509094,
					-0.42015349864959717,
					-0.20133428275585175,
					-0.7779838442802429
				},
				{
					0.3911111111111111,
					-0.5610032081604004,
					0.2784252166748047,
					-0.3108863830566406,
					0.7012817859649658,
					-0.32443997263908386,
					-0.466938316822052,
					-0.4300130307674408
				},
				{
					0.42222222222222217,
					-0.6007261276245117,
					0.0583343505859375,
					-0.41704750061035156,
					0.757244884967804,
					-0.2666648030281067,
					-0.4345446228981018,
					-0.40821701288223267
				},
				{
					0.4533333333333333,
					-0.5622587203979492,
					-0.0070056915283203125,
					-0.5175752639770508,
					0.7727096676826477,
					-0.20450586080551147,
					-0.38386526703834534,
					-0.46232524514198303
				}
			}
		},
		light_attack_right = {
			damage_window_start = 0.3,
			range_mod = 1.15,
			anim_end_event = "attack_finished",
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			additional_critical_strike_chance = 0,
			use_precision_sweep = false,
			slide_armour_hit = true,
			damage_profile = "light_slashing_linesman_dual_swords",
			hit_effect = "melee_hit_sword_1h",
			damage_window_end = 0.44,
			impact_sound_event = "slashing_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_right_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.25,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.25,
					end_time = 0.2,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.3,
					external_multiplier = 0.75,
					end_time = 0.5,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.45,
					action = "action_one",
					end_time = 1,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.3,
					action = "action_wield",
					input = "action_wield"
				}
			},
			impact_axis = Vector3Box(0, 0, 1),
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.26666666666666666,
					-0.26312828063964844,
					0.1905670166015625,
					0.03792858123779297,
					-0.6281302571296692,
					0.27056536078453064,
					-0.42300376296043396,
					-0.5944027900695801
				},
				{
					0.3011111111111111,
					-0.19673967361450195,
					0.4127063751220703,
					0.036063194274902344,
					-0.6013584136962891,
					0.29610973596572876,
					-0.40099403262138367,
					-0.624412477016449
				},
				{
					0.33555555555555555,
					0.08800745010375977,
					0.6732349395751953,
					-0.0795736312866211,
					0.19781437516212463,
					0.46084704995155334,
					0.1797642707824707,
					-0.8462707996368408
				},
				{
					0.37,
					0.35327816009521484,
					0.6496295928955078,
					-0.1843271255493164,
					0.587364673614502,
					0.35608407855033875,
					0.4373035728931427,
					-0.5804933309555054
				},
				{
					0.40444444444444444,
					0.5932121276855469,
					0.5164318084716797,
					-0.29065799713134766,
					0.640548586845398,
					0.33952176570892334,
					0.4554711580276489,
					-0.5166900157928467
				},
				{
					0.4388888888888889,
					0.7044010162353516,
					0.3894691467285156,
					-0.3299417495727539,
					0.6887621879577637,
					0.28734704852104187,
					0.4789715111255646,
					-0.4621955454349518
				},
				{
					0.47333333333333333,
					0.6484737396240234,
					0.24375534057617188,
					-0.3948545455932617,
					0.7639240026473999,
					0.14945347607135773,
					0.5731194615364075,
					-0.2561599910259247
				}
			}
		},
		light_attack_up_left = {
			damage_window_start = 0.34,
			range_mod = 1.15,
			anim_end_event = "attack_finished",
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			additional_critical_strike_chance = 0.25,
			use_precision_sweep = false,
			slide_armour_hit = true,
			damage_profile = "light_slashing_linesman_dual_swords",
			hit_effect = "melee_hit_sword_1h",
			damage_window_end = 0.42,
			impact_sound_event = "slashing_hit",
			charge_value = "light_attack",
			no_damage_impact_sound_event = "slashing_hit_armour",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_left",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.1,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.25,
					end_time = 0.3,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.3,
					external_multiplier = 0.9,
					end_time = 0.5,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_last",
					start_time = 0.55,
					action = "action_one",
					end_time = 1,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.3,
					action = "action_wield",
					input = "action_wield"
				}
			},
			impact_axis = Vector3Box(0, 0, 1),
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.3066666666666667,
					0.5081233978271484,
					0.5416908264160156,
					-0.19194602966308594,
					-0.17339780926704407,
					-0.8023534417152405,
					0.2626725435256958,
					-0.5071146488189697
				},
				{
					0.33111111111111113,
					0.45122718811035156,
					0.6395626068115234,
					-0.18300342559814453,
					0.13020437955856323,
					0.8430504202842712,
					-0.18478478491306305,
					0.488023966550827
				},
				{
					0.35555555555555557,
					0.29778337478637695,
					0.7253437042236328,
					-0.14298248291015625,
					0.005146149080246687,
					-0.8593129515647888,
					-0.017738137394189835,
					-0.5111165046691895
				},
				{
					0.38,
					0.10315227508544922,
					0.7418117523193359,
					-0.08599472045898438,
					0.19641278684139252,
					-0.7765366435050964,
					-0.27448543906211853,
					-0.5320438742637634
				},
				{
					0.40444444444444444,
					-0.2059335708618164,
					0.5754375457763672,
					0.04002666473388672,
					-0.3763401508331299,
					0.5374509692192078,
					0.6665176749229431,
					0.3539333641529083
				},
				{
					0.4288888888888889,
					-0.3279895782470703,
					0.3929710388183594,
					0.0794210433959961,
					-0.3997415602207184,
					0.35723960399627686,
					0.8318894505500793,
					0.1433403491973877
				},
				{
					0.4533333333333333,
					-0.36368417739868164,
					0.14899253845214844,
					0.0180511474609375,
					-0.39347711205482483,
					0.10022995620965958,
					0.9118980169296265,
					-0.059764161705970764
				}
			}
		},
		light_attack_up_right = {
			damage_window_start = 0.3,
			range_mod = 1.15,
			anim_end_event = "attack_finished",
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			weapon_action_hand = "left",
			additional_critical_strike_chance = 0.5,
			use_precision_sweep = false,
			slide_armour_hit = true,
			hit_effect = "melee_hit_sword_1h",
			damage_profile = "light_slashing_linesman_dual_swords",
			damage_window_end = 0.43,
			impact_sound_event = "slashing_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_right",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.15,
					end_time = 0.2,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.3,
					external_multiplier = 0.75,
					end_time = 0.5,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_one",
					end_time = 1,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.3,
					action = "action_wield",
					input = "action_wield"
				}
			},
			impact_axis = Vector3Box(0, 0, 1),
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.26666666666666666,
					-0.4730415344238281,
					0.5267124176025391,
					-0.20757293701171875,
					-0.2114563137292862,
					0.6752640008926392,
					-0.05789030343294144,
					-0.7042396068572998
				},
				{
					0.29944444444444446,
					-0.41898584365844727,
					0.6023483276367188,
					-0.21958351135253906,
					-0.03547660633921623,
					0.7821922302246094,
					0.012951408512890339,
					-0.6218914985656738
				},
				{
					0.3322222222222222,
					-0.277498722076416,
					0.7004623413085938,
					-0.16951751708984375,
					0.2546009421348572,
					0.8214384913444519,
					0.18771356344223022,
					-0.47453224658966064
				},
				{
					0.365,
					-0.14664268493652344,
					0.7347221374511719,
					-0.0954132080078125,
					0.27660930156707764,
					0.7147752046585083,
					0.3824652433395386,
					-0.5160465240478516
				},
				{
					0.3977777777777778,
					0.14229249954223633,
					0.6884384155273438,
					0.0039386749267578125,
					0.20129722356796265,
					0.6465257406234741,
					0.6667225360870361,
					-0.3113919496536255
				},
				{
					0.4305555555555555,
					0.5236849784851074,
					0.3172264099121094,
					0.0047321319580078125,
					0.5021207928657532,
					0.22152172029018402,
					0.833525538444519,
					0.06354526430368423
				},
				{
					0.4633333333333333,
					0.4787616729736328,
					-0.011991500854492188,
					0.000621795654296875,
					0.4868749976158142,
					-0.16250517964363098,
					0.7386501431465149,
					0.4369677007198334
				}
			}
		},
		push_stab = {
			damage_window_start = 0.26,
			range_mod = 1.25,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "slashing_hit_armour",
			additional_critical_strike_chance = 0.1,
			use_precision_sweep = true,
			ignore_armour_hit = true,
			damage_profile = "light_slashing_smiter_stab",
			hit_effect = "melee_hit_sword_1h",
			attack_direction = "up",
			aim_assist_ramp_multiplier = 0.2,
			damage_window_end = 0.35,
			impact_sound_event = "slashing_hit",
			aim_assist_max_ramp_multiplier = 0.8,
			anim_end_event = "attack_finished",
			aim_assist_ramp_decay_delay = 0.1,
			reset_aim_on_attack = true,
			dedicated_target_range = 3,
			uninterruptible = true,
			anim_event = "push_stab",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.6,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.25,
					end_time = 0.1,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.45,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			baked_sweep = {
				{
					0.22666666666666668,
					0.3698897361755371,
					-0.10310554504394531,
					0.0030603408813476562,
					0.25992849469184875,
					0.6527273058891296,
					0.6287968754768372,
					-0.333164781332016
				},
				{
					0.25277777777777777,
					0.26204729080200195,
					0.23770713806152344,
					-0.0035572052001953125,
					0.26845642924308777,
					0.6475281119346619,
					0.6331745386123657,
					-0.3282204568386078
				},
				{
					0.2788888888888889,
					0.16387653350830078,
					0.5224590301513672,
					-0.016826629638671875,
					0.2678191661834717,
					0.6524673104286194,
					0.6227471232414246,
					-0.338740736246109
				},
				{
					0.305,
					0.1439356803894043,
					0.5812034606933594,
					-0.02307605743408203,
					0.2680855989456177,
					0.6512244343757629,
					0.6216483116149902,
					-0.34291449189186096
				},
				{
					0.3311111111111111,
					0.14406633377075195,
					0.5863800048828125,
					-0.021928787231445312,
					0.2690240144729614,
					0.6457604169845581,
					0.6193370819091797,
					-0.35642844438552856
				},
				{
					0.3572222222222222,
					0.1415104866027832,
					0.587890625,
					-0.020032882690429688,
					0.2705557346343994,
					0.6421253681182861,
					0.6172472834587097,
					-0.3653498589992523
				},
				{
					0.3833333333333333,
					0.13469409942626953,
					0.5946750640869141,
					-0.020479202270507812,
					0.26946714520454407,
					0.6415072679519653,
					0.6143704056739807,
					-0.372028112411499
				}
			}
		},
		push = {
			damage_window_start = 0.05,
			anim_end_event = "attack_finished",
			outer_push_angle = 180,
			kind = "push_stagger",
			damage_profile_outer = "light_push",
			weapon_action_hand = "right",
			push_angle = 100,
			hit_effect = "melee_hit_sword_1h",
			damage_window_end = 0.2,
			impact_sound_event = "slashing_hit",
			charge_value = "action_push",
			no_damage_impact_sound_event = "slashing_hit_armour",
			dedicated_target_range = 2,
			anim_event = "attack_push",
			damage_profile_inner = "medium_push",
			total_time = 0.8,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.25,
					end_time = 0.2,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.25,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.25,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one_hold"
				},
				{
					sub_action = "push_stab",
					start_time = 0.3,
					action = "action_one",
					doubleclick_window = 0,
					end_time = 0.8,
					input = "action_one_hold",
					hold_required = {
						"action_two_hold",
						"action_one_hold"
					}
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				}
			},
			push_radius = push_radius,
			chain_condition_func = function (attacker_unit, input_extension)
				local status_extension = ScriptUnit.extension(attacker_unit, "status_system")

				return not status_extension:fatigued()
			end
		}
	},
	action_two = {
		default = {
			cooldown = 0.15,
			minimum_hold_time = 0.2,
			anim_end_event = "parry_finished",
			kind = "block",
			hold_input = "action_two_hold",
			anim_event = "parry_pose",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			enter_function = function (attacker_unit, input_extension, remaining_time)
				return input_extension:reset_release_input_with_delay(remaining_time)
			end,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.85,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "push",
					start_time = 0.2,
					action = "action_one",
					doubleclick_window = 0,
					input = "action_one",
					hold_required = {
						"action_two_hold"
					}
				},
				{
					sub_action = "default",
					start_time = 0.2,
					action = "action_one",
					release_required = "action_two_hold",
					doubleclick_window = 0,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.2,
					action = "action_wield",
					input = "action_wield"
				}
			}
		}
	},
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield
}
weapon_template.right_hand_unit = "units/weapons/player/wpn_empire_short_sword/wpn_empire_short_sword"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right
weapon_template.left_hand_unit = "units/weapons/player/wpn_empire_short_sword/wpn_empire_short_sword"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.left
weapon_template.display_unit = "units/weapons/weapon_display/display_dual_weapons"
weapon_template.buff_type = "MELEE_1H"
weapon_template.weapon_type = "DUAL_SWORD_1H"
weapon_template.max_fatigue_points = 6
weapon_template.dodge_count = 6
weapon_template.block_angle = 90
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.5
weapon_template.outer_block_fatigue_point_multiplier = 1
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.25
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.25
	}
}
weapon_template.wield_anim = "to_dual_swords"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/melee/dual_swords"
weapon_template.attack_meta_data = {
	tap_attack = {
		penetrating = false,
		arc = 1
	},
	hold_attack = {
		penetrating = true,
		arc = 1
	}
}
weapon_template.aim_assist_settings = {
	max_range = 5,
	no_aim_input_multiplier = 0,
	base_multiplier = 0,
	target_node = "j_neck",
	effective_max_range = 4,
	breed_scalars = {
		skaven_storm_vermin = 1,
		skaven_clan_rat = 0.5,
		skaven_slave = 0.5
	}
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 0,
		[DamageTypes.CLEAVE] = 5,
		[DamageTypes.SPEED] = 5,
		[DamageTypes.STAGGER] = 0,
		[DamageTypes.DAMAGE] = 2
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 1,
		[DamageTypes.CLEAVE] = 6,
		[DamageTypes.SPEED] = 5,
		[DamageTypes.STAGGER] = 0,
		[DamageTypes.DAMAGE] = 4
	}
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_fast_attacks",
	"weapon_keyword_wide_sweeps",
	"weapon_keyword_crowd_control"
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "light_attack_left"
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "heavy_attack"
	}
}
weapon_template.tooltip_detail = {
	light = {
		action_name = "action_one",
		sub_action_name = "light_attack_left"
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "heavy_attack"
	},
	push = {
		action_name = "action_one",
		sub_action_name = "push"
	}
}
weapon_template.wwise_dep_left_hand = {
	"wwise/one_handed_swords"
}
weapon_template.wwise_dep_right_hand = {
	"wwise/one_handed_swords"
}

return {
	dual_wield_swords_template_1 = table.clone(weapon_template)
}
