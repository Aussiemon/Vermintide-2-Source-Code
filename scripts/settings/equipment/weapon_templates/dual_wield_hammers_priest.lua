local push_radius = 2
local time_mod = 0.9
local weapon_template = {}
weapon_template.actions = {
	action_one = {
		default = {
			kind = "melee_start",
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_charge_down",
			attack_hold_input = "action_one_hold",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.35,
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
			anim_event = "attack_swing_charge_right",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.35,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "light_attack_right_uppercut",
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
		default_down = {
			kind = "melee_start",
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_charge_down",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.35,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "light_attack_down",
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
		default_left = {
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
					external_multiplier = 0.35,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "light_attack_left_diagonal",
					start_time = 0,
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release"
				},
				{
					sub_action = "heavy_attack_3",
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
					sub_action = "heavy_attack_3",
					start_time = 1,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		heavy_attack = {
			damage_window_start = 0.2,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			range_mod = 1.2,
			no_damage_impact_sound_event = "blunt_hit_armour",
			weapon_action_hand = "both",
			use_precision_sweep = false,
			additional_critical_strike_chance = 0,
			hit_effect = "melee_hit_hammers_1h",
			damage_profile_left = "light_blunt_smiter_dual",
			damage_window_end = 0.3,
			impact_sound_event = "hammer_2h_hit",
			charge_value = "heavy_attack",
			anim_end_event = "attack_finished",
			damage_profile_right = "light_blunt_smiter_dual",
			dedicated_target_range = 2.5,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_down",
			hit_stop_anim = "attack_hit",
			total_time = 2.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.1,
					end_time = 0.15,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_right",
					start_time = 0.6,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.1,
					input = "action_one"
				},
				{
					sub_action = "default_right",
					start_time = 0.6,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.1,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 1.1,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.5,
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
			dual_hit_stop_anims = {
				left = "shake_hit",
				right = "attack_hit"
			},
			baked_sweep_right = {
				{
					0.16666666666666669,
					0.15654802322387695,
					0.02315521240234375,
					0.3120236396789551,
					-0.6653652787208557,
					0.14939355850219727,
					0.0380515530705452,
					-0.7304263710975647
				},
				{
					0.19444444444444445,
					0.2652301788330078,
					0.05859184265136719,
					0.29294252395629883,
					-0.5734065771102905,
					0.025871774181723595,
					0.08348160982131958,
					-0.8145958781242371
				},
				{
					0.22222222222222224,
					0.26085853576660156,
					0.2454209327697754,
					0.22440195083618164,
					-0.46537840366363525,
					-0.028607992455363274,
					0.13780656456947327,
					-0.8738500475883484
				},
				{
					0.25,
					0.18212652206420898,
					0.5094923973083496,
					0.08247995376586914,
					-0.2479676604270935,
					-0.0321069173514843,
					0.1640438288450241,
					-0.9542383551597595
				},
				{
					0.2777777777777778,
					0.08623170852661133,
					0.6936163902282715,
					-0.1431107521057129,
					0.40370336174964905,
					0.0407046340405941,
					0.02616075426340103,
					-0.913609504699707
				},
				{
					0.3055555555555556,
					0.06195878982543945,
					0.6823115348815918,
					-0.3191981315612793,
					0.7770496010780334,
					-0.05829286947846413,
					-0.05830298364162445,
					-0.6240165829658508
				},
				{
					0.3333333333333333,
					0.05724000930786133,
					0.5987324714660645,
					-0.5308818817138672,
					0.8262473940849304,
					-0.027081726118922234,
					-0.036122798919677734,
					-0.561495304107666
				}
			},
			baked_sweep_left = {
				{
					0.16666666666666669,
					-0.25240468978881836,
					-0.006455898284912109,
					0.33380937576293945,
					-0.6648439764976501,
					0.03431875631213188,
					-0.10115358978509903,
					-0.7393055558204651
				},
				{
					0.19444444444444445,
					-0.2459859848022461,
					0.13266897201538086,
					0.27230119705200195,
					-0.5367324352264404,
					0.16887496411800385,
					-0.11425033211708069,
					-0.8187469244003296
				},
				{
					0.22222222222222224,
					-0.2397298812866211,
					0.26127004623413086,
					0.19046354293823242,
					-0.45998647809028625,
					0.20520147681236267,
					-0.11478967219591141,
					-0.8562290668487549
				},
				{
					0.25,
					-0.18147897720336914,
					0.4646620750427246,
					0.0759272575378418,
					-0.3101317584514618,
					0.1467442810535431,
					-0.01629411242902279,
					-0.9391586184501648
				},
				{
					0.2777777777777778,
					-0.16168928146362305,
					0.6815438270568848,
					-0.2415766716003418,
					0.4526563286781311,
					0.09866248816251755,
					0.049113836139440536,
					-0.8848479390144348
				},
				{
					0.3055555555555556,
					-0.16396808624267578,
					0.5881085395812988,
					-0.5359139442443848,
					0.8237957954406738,
					0.034393973648548126,
					0.0020743603818118572,
					-0.565838634967804
				},
				{
					0.3333333333333333,
					-0.1909770965576172,
					0.358095645904541,
					-0.6830000877380371,
					0.8196665644645691,
					-0.023543579503893852,
					-0.017516443505883217,
					-0.5720887184143066
				}
			}
		},
		heavy_attack_2 = {
			damage_window_start = 0.3,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			range_mod = 1.3,
			no_damage_impact_sound_event = "blunt_hit_armour",
			weapon_action_hand = "both",
			use_precision_sweep = false,
			hit_effect = "melee_hit_hammers_1h",
			additional_critical_strike_chance = 0,
			damage_profile_left = "medium_blunt_tank_dual",
			damage_window_end = 0.42,
			impact_sound_event = "hammer_2h_hit",
			charge_value = "heavy_attack",
			anim_end_event = "attack_finished",
			damage_profile_right = "medium_blunt_tank_dual",
			dedicated_target_range = 2.5,
			uninterruptible = true,
			anim_event = "attack_swing_heavy_right_diagonal",
			hit_stop_anim = "attack_hit",
			total_time = 2.25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.85,
					end_time = 0.15,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_left",
					start_time = 0.75,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.1,
					input = "action_one"
				},
				{
					sub_action = "default_left",
					start_time = 0.7,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.1,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 1.1,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.5,
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
			dual_hit_stop_anims = {
				left = "attack_hit",
				right = "shake_hit"
			},
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep_right = {
				{
					0.26666666666666666,
					-0.26318788528442383,
					0.27470922470092773,
					0.025964736938476562,
					-0.6661665439605713,
					0.23009195923805237,
					-0.3880881667137146,
					-0.5938580632209778
				},
				{
					0.29777777777777775,
					-0.1559438705444336,
					0.5248122215270996,
					-0.007342815399169922,
					-0.40219804644584656,
					0.3344038128852844,
					-0.21738645434379578,
					-0.8241080045700073
				},
				{
					0.3288888888888889,
					0.11891031265258789,
					0.6858696937561035,
					-0.14557600021362305,
					0.22747042775154114,
					0.4822046756744385,
					0.168319970369339,
					-0.8290984630584717
				},
				{
					0.36,
					0.4301791191101074,
					0.635836124420166,
					-0.2498488426208496,
					0.563397228717804,
					0.4205609858036041,
					0.4013458788394928,
					-0.587054967880249
				},
				{
					0.3911111111111111,
					0.6120328903198242,
					0.49678945541381836,
					-0.2978501319885254,
					0.642537534236908,
					0.3368270695209503,
					0.466903954744339,
					-0.5056617259979248
				},
				{
					0.42222222222222217,
					0.700904369354248,
					0.38785409927368164,
					-0.32062292098999023,
					0.6846367716789246,
					0.2679082751274109,
					0.5138868093490601,
					-0.44206109642982483
				},
				{
					0.4533333333333333,
					0.7368974685668945,
					0.27492570877075195,
					-0.3332056999206543,
					0.7118569612503052,
					0.2037190943956375,
					0.5416684746742249,
					-0.39793649315834045
				}
			},
			baked_sweep_left = {
				{
					0.26666666666666666,
					-0.5201835632324219,
					0.31885862350463867,
					-0.024402141571044922,
					-0.360756516456604,
					0.22929035127162933,
					-0.17485840618610382,
					-0.8869640231132507
				},
				{
					0.29777777777777775,
					-0.4581789970397949,
					0.37151098251342773,
					0.012908935546875,
					-0.4088504910469055,
					0.2560546100139618,
					-0.17667275667190552,
					-0.857941746711731
				},
				{
					0.3288888888888889,
					-0.37996530532836914,
					0.4473128318786621,
					0.05196523666381836,
					-0.4075166881084442,
					0.2835070788860321,
					-0.14511293172836304,
					-0.8558598756790161
				},
				{
					0.36,
					-0.2889838218688965,
					0.5423216819763184,
					0.0639042854309082,
					-0.2826847732067108,
					0.3231121599674225,
					-0.04771261662244797,
					-0.9018932580947876
				},
				{
					0.3911111111111111,
					-0.1580352783203125,
					0.645841121673584,
					0.004985332489013672,
					0.06585349887609482,
					0.3377380669116974,
					0.1491515040397644,
					-0.9270114302635193
				},
				{
					0.42222222222222217,
					0.10879087448120117,
					0.663973331451416,
					-0.15134096145629883,
					0.48692038655281067,
					0.3281864821910858,
					0.3855535686016083,
					-0.7117237448692322
				},
				{
					0.4533333333333333,
					0.45244836807250977,
					0.4676394462585449,
					-0.3410325050354004,
					0.7274168729782104,
					0.31556370854377747,
					0.521752655506134,
					-0.3147355020046234
				}
			}
		},
		heavy_attack_3 = {
			damage_window_start = 0.3,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			range_mod = 1.3,
			no_damage_impact_sound_event = "blunt_hit_armour",
			weapon_action_hand = "both",
			use_precision_sweep = false,
			additional_critical_strike_chance = 0,
			hit_effect = "melee_hit_hammers_1h",
			damage_profile_left = "medium_blunt_tank_dual",
			damage_window_end = 0.42,
			impact_sound_event = "hammer_2h_hit",
			charge_value = "heavy_attack",
			anim_end_event = "attack_finished",
			damage_profile_right = "medium_blunt_tank_dual",
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
					external_multiplier = 0.85,
					end_time = 0.15,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.1,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.7,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.1,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 1.1,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.5,
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
			dual_hit_stop_anims = {
				left = "shake_hit",
				right = "attack_hit"
			},
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep_right = {
				{
					0.26666666666666666,
					0.517207145690918,
					0.33188390731811523,
					0.13567876815795898,
					-0.6025068759918213,
					-0.2198968231678009,
					0.1606660634279251,
					-0.7502115368843079
				},
				{
					0.29777777777777775,
					0.48079729080200195,
					0.4448885917663574,
					0.10469961166381836,
					-0.47925662994384766,
					-0.2792552709579468,
					0.0690794587135315,
					-0.8291909098625183
				},
				{
					0.3288888888888889,
					0.42427778244018555,
					0.559699535369873,
					0.049698829650878906,
					-0.321893572807312,
					-0.33510875701904297,
					-0.014428812079131603,
					-0.8853691220283508
				},
				{
					0.36,
					0.3391103744506836,
					0.6445984840393066,
					0.015920162200927734,
					-0.15636785328388214,
					-0.38296931982040405,
					-0.11669409275054932,
					-0.9029209017753601
				},
				{
					0.3911111111111111,
					0.23105764389038086,
					0.6603913307189941,
					-0.09666252136230469,
					0.11084084212779999,
					-0.41555067896842957,
					-0.1740148961544037,
					-0.8858615756034851
				},
				{
					0.42222222222222217,
					0.052115440368652344,
					0.6509585380554199,
					-0.1792306900024414,
					0.41235971450805664,
					-0.39962756633758545,
					-0.27962490916252136,
					-0.769459068775177
				},
				{
					0.4533333333333333,
					-0.1597146987915039,
					0.557767391204834,
					-0.2646026611328125,
					0.6726387143135071,
					-0.31994858384132385,
					-0.372915655374527,
					-0.553284764289856
				}
			},
			baked_sweep_left = {
				{
					0.26666666666666666,
					0.2907595634460449,
					0.3419928550720215,
					0.022760868072509766,
					-0.7123002409934998,
					-0.27946892380714417,
					0.330062597990036,
					-0.5527966022491455
				},
				{
					0.29777777777777775,
					0.22411632537841797,
					0.5139050483703613,
					0.010796070098876953,
					-0.45424968004226685,
					-0.41834166646003723,
					0.21015983819961548,
					-0.7579448223114014
				},
				{
					0.3288888888888889,
					-0.009414196014404297,
					0.7665657997131348,
					-0.11818122863769531,
					0.20586077868938446,
					-0.47188347578048706,
					-0.06683480739593506,
					-0.8546814918518066
				},
				{
					0.36,
					-0.30890655517578125,
					0.7053656578063965,
					-0.3007493019104004,
					0.5667516589164734,
					-0.32905298471450806,
					-0.28595229983329773,
					-0.6991051435470581
				},
				{
					0.3911111111111111,
					-0.46486425399780273,
					0.4211001396179199,
					-0.43574047088623047,
					0.669794499874115,
					-0.28075703978538513,
					-0.3532153069972992,
					-0.5897371172904968
				},
				{
					0.42222222222222217,
					-0.5349960327148438,
					0.11862707138061523,
					-0.48098039627075195,
					0.7559560537338257,
					-0.23343098163604736,
					-0.38955026865005493,
					-0.4714774191379547
				},
				{
					0.4533333333333333,
					-0.5545644760131836,
					0.015152454376220703,
					-0.5187067985534668,
					0.8021622896194458,
					-0.20503877103328705,
					-0.3781055212020874,
					-0.4141630232334137
				}
			}
		},
		light_attack_left = {
			damage_window_start = 0.37,
			range_mod = 1.2,
			anim_end_event = "attack_finished",
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			weapon_action_hand = "right",
			additional_critical_strike_chance = 0,
			damage_profile = "light_blunt_tank_dual",
			hit_effect = "melee_hit_hammers_1h",
			damage_window_end = 0.48,
			impact_sound_event = "hammer_2h_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_left",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
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
					sub_action = "default_right",
					start_time = 0.5,
					action = "action_one",
					end_time = 1.2,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1.2,
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
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				}
			},
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.33666666666666667,
					0.49183225631713867,
					0.5059337615966797,
					0.019550323486328125,
					-0.3808225691318512,
					-0.534411609172821,
					0.3478183448314667,
					-0.6696274280548096
				},
				{
					0.3661111111111111,
					0.39947080612182617,
					0.5747871398925781,
					0.013221263885498047,
					-0.30052489042282104,
					-0.5786430835723877,
					0.27627599239349365,
					-0.7060655355453491
				},
				{
					0.39555555555555555,
					0.2627439498901367,
					0.6476993560791016,
					-0.004790306091308594,
					-0.14614726603031158,
					-0.6202512979507446,
					0.13875746726989746,
					-0.7580736875534058
				},
				{
					0.425,
					0.0486140251159668,
					0.7107257843017578,
					-0.04398846626281738,
					0.13614138960838318,
					-0.6102627515792847,
					-0.11792556941509247,
					-0.7714521884918213
				},
				{
					0.45444444444444443,
					-0.284151554107666,
					0.5922756195068359,
					-0.14520740509033203,
					0.5244271755218506,
					-0.37351858615875244,
					-0.5336770415306091,
					-0.54831463098526
				},
				{
					0.48388888888888887,
					-0.4031982421875,
					0.42185020446777344,
					-0.238508939743042,
					-0.6614693999290466,
					0.16568289697170258,
					0.6657582521438599,
					0.3029412031173706
				},
				{
					0.5133333333333333,
					-0.4350428581237793,
					0.31566810607910156,
					-0.32268810272216797,
					-0.6278933882713318,
					0.05756044760346413,
					0.7322655916213989,
					0.25734010338783264
				}
			}
		},
		light_attack_down = {
			damage_window_start = 0.35,
			range_mod = 1.2,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			weapon_action_hand = "right",
			width_mod = 30,
			use_precision_sweep = true,
			additional_critical_strike_chance = 0,
			damage_profile = "light_blunt_smiter",
			hit_effect = "melee_hit_hammers_1h",
			damage_window_end = 0.45,
			impact_sound_event = "hammer_2h_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_down",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
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
					sub_action = "default",
					start_time = 0.6,
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
			baked_sweep = {
				{
					0.31666666666666665,
					-0.23234844207763672,
					0.28469038009643555,
					0.16241025924682617,
					-0.6651695370674133,
					0.28322961926460266,
					-0.3182084560394287,
					-0.6132485866546631
				},
				{
					0.34444444444444444,
					-0.21570587158203125,
					0.29766035079956055,
					0.17670106887817383,
					-0.7023366689682007,
					0.22553013265132904,
					-0.24594566226005554,
					-0.628784716129303
				},
				{
					0.37222222222222223,
					-0.17762470245361328,
					0.4572291374206543,
					0.1819462776184082,
					-0.5807936787605286,
					0.21810875833034515,
					-0.1574244201183319,
					-0.7683260440826416
				},
				{
					0.4,
					-0.08386373519897461,
					0.6690363883972168,
					0.10540771484375,
					-0.16500169038772583,
					0.1985905021429062,
					-0.08591709285974503,
					-0.9622653126716614
				},
				{
					0.42777777777777776,
					0.026959896087646484,
					0.7633872032165527,
					-0.14059734344482422,
					0.4487789571285248,
					0.11303641647100449,
					0.04416581615805626,
					-0.8853641152381897
				},
				{
					0.45555555555555555,
					0.3703179359436035,
					0.35306215286254883,
					-0.803802490234375,
					0.8415616154670715,
					0.18528074026107788,
					0.1180766224861145,
					-0.49346020817756653
				},
				{
					0.48333333333333334,
					0.7856979370117188,
					0.258364200592041,
					-0.6517729759216309,
					0.6517223715782166,
					0.4078597128391266,
					0.47821739315986633,
					-0.42451930046081543
				}
			}
		},
		light_attack_left_diagonal = {
			damage_window_start = 0.3,
			range_mod = 1.2,
			anim_end_event = "attack_finished",
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			weapon_action_hand = "left",
			additional_critical_strike_chance = 0,
			damage_profile = "light_blunt_tank_dual_diag",
			hit_effect = "melee_hit_hammers_1h",
			damage_window_end = 0.4,
			impact_sound_event = "hammer_2h_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
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
					sub_action = "default",
					start_time = 0.6,
					action = "action_one",
					end_time = 1.1,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1.1,
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
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.26666666666666666,
					0.2583732604980469,
					0.40912866592407227,
					0.03143882751464844,
					-0.7123141288757324,
					-0.28721433877944946,
					0.33012375235557556,
					-0.5487574338912964
				},
				{
					0.29444444444444445,
					0.18236112594604492,
					0.5359454154968262,
					0.007831096649169922,
					-0.5371131896972656,
					-0.38426825404167175,
					0.24242715537548065,
					-0.7106873393058777
				},
				{
					0.32222222222222224,
					-0.06480598449707031,
					0.7348589897155762,
					-0.12880802154541016,
					0.09927047044038773,
					-0.45450901985168457,
					-0.04222869500517845,
					-0.8841853141784668
				},
				{
					0.35,
					-0.30153799057006836,
					0.6982588768005371,
					-0.27622461318969727,
					0.5384100675582886,
					-0.3874012529850006,
					-0.2237308770418167,
					-0.7141284346580505
				},
				{
					0.37777777777777777,
					-0.4573025703430176,
					0.49935388565063477,
					-0.4021186828613281,
					0.7130110263824463,
					-0.39036983251571655,
					-0.25646013021469116,
					-0.5229289531707764
				},
				{
					0.40555555555555556,
					-0.5776257514953613,
					0.18833208084106445,
					-0.4643263816833496,
					0.7615035176277161,
					-0.3024449050426483,
					-0.3343915045261383,
					-0.4656412899494171
				},
				{
					0.43333333333333335,
					-0.5701889991760254,
					0.010045528411865234,
					-0.5038728713989258,
					0.7643519639968872,
					-0.20920555293560028,
					-0.3897307515144348,
					-0.46915778517723083
				}
			}
		},
		light_attack_right_uppercut = {
			damage_window_start = 0.3,
			range_mod = 1.2,
			anim_end_event = "attack_finished",
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			weapon_action_hand = "left",
			additional_critical_strike_chance = 0,
			damage_profile = "light_blunt_tank_dual_upper",
			hit_effect = "melee_hit_hammers_1h",
			damage_window_end = 0.43,
			impact_sound_event = "hammer_2h_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_up",
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
					sub_action = "default_left",
					start_time = 0.5,
					action = "action_one",
					end_time = 1.1,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1.1,
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
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.26666666666666666,
					-0.3310251235961914,
					0.5773372650146484,
					-0.28188037872314453,
					-0.14339423179626465,
					0.8246268033981323,
					-0.004245712421834469,
					-0.5471844673156738
				},
				{
					0.29944444444444446,
					-0.3060722351074219,
					0.6322898864746094,
					-0.2645289897918701,
					-0.12836158275604248,
					0.8491814732551575,
					0.11172829568386078,
					-0.4999309480190277
				},
				{
					0.3322222222222222,
					-0.2413616180419922,
					0.6902542114257812,
					-0.21393918991088867,
					-0.0567379854619503,
					0.8286432027816772,
					0.2220226675271988,
					-0.5107223391532898
				},
				{
					0.365,
					-0.03188037872314453,
					0.7107162475585938,
					-0.09517455101013184,
					0.16577325761318207,
					0.6806984543800354,
					0.5193406343460083,
					-0.489340603351593
				},
				{
					0.3977777777777778,
					0.30824851989746094,
					0.5172185897827148,
					0.08072733879089355,
					0.34268149733543396,
					0.44162094593048096,
					0.7885711789131165,
					-0.2563120722770691
				},
				{
					0.4305555555555555,
					0.5002756118774414,
					0.1243734359741211,
					-0.02861952781677246,
					0.6169372200965881,
					-0.27324673533439636,
					0.6480399370193481,
					-0.35322651267051697
				},
				{
					0.4633333333333333,
					0.49694108963012695,
					-0.10272598266601562,
					-0.20318341255187988,
					0.10790154337882996,
					-0.7248886227607727,
					0.29954928159713745,
					-0.6108715534210205
				}
			}
		},
		light_attack_bopp = {
			damage_window_start = 0.15,
			range_mod = 1.05,
			kind = "sweep",
			first_person_hit_anim = "shake_hit",
			no_damage_impact_sound_event = "blunt_hit_armour",
			weapon_action_hand = "right",
			width_mod = 30,
			additional_critical_strike_chance = 0,
			use_precision_sweep = true,
			damage_profile = "light_blunt_smiter_stab",
			hit_effect = "melee_hit_hammers_1h",
			damage_window_end = 0.25,
			impact_sound_event = "hammer_2h_hit",
			anim_end_event = "attack_finished",
			dedicated_target_range = 2.5,
			anim_event = "attack_swing_stab",
			hit_stop_anim = "attack_hit",
			total_time = 2.1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.4,
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
					sub_action = "default_down",
					start_time = 0.45,
					action = "action_one",
					end_time = 1.35,
					input = "action_one"
				},
				{
					sub_action = "default_down",
					start_time = 0.45,
					action = "action_one",
					end_time = 1.35,
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
					start_time = 0.5,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_wield",
					input = "action_wield"
				}
			},
			baked_sweep = {
				{
					0.11666666666666667,
					0.48706626892089844,
					-0.45084142684936523,
					-0.04552507400512695,
					0.20474320650100708,
					0.6895254850387573,
					0.639441967010498,
					-0.27156734466552734
				},
				{
					0.14444444444444443,
					0.5255637168884277,
					-0.42364072799682617,
					-0.061376094818115234,
					0.24789050221443176,
					0.6772243976593018,
					0.6095623970031738,
					-0.32916736602783203
				},
				{
					0.17222222222222222,
					0.5165705680847168,
					-0.3451976776123047,
					-0.0278472900390625,
					0.24140867590904236,
					0.6735426187515259,
					0.6129740476608276,
					-0.3351493775844574
				},
				{
					0.2,
					0.4829268455505371,
					-0.210662841796875,
					-0.014826297760009766,
					0.28566789627075195,
					0.6661176681518555,
					0.6075430512428284,
					-0.3249194920063019
				},
				{
					0.22777777777777777,
					0.4090242385864258,
					0.064178466796875,
					-0.03638172149658203,
					0.2939976453781128,
					0.700250506401062,
					0.5953528881072998,
					-0.2622396945953369
				},
				{
					0.25555555555555554,
					0.24717283248901367,
					0.43937110900878906,
					-0.043089866638183594,
					0.27030524611473083,
					0.6643009185791016,
					0.5536308288574219,
					-0.4232403039932251
				},
				{
					0.2833333333333333,
					0.17776918411254883,
					0.5814676284790039,
					-0.04411172866821289,
					0.22985932230949402,
					0.6452429890632629,
					0.526884913444519,
					-0.5032081604003906
				}
			}
		},
		push = {
			damage_window_start = 0.05,
			outer_push_angle = 180,
			kind = "push_stagger",
			anim_end_event = "attack_finished",
			no_damage_impact_sound_event = "blunt_hit_armour",
			damage_profile_outer = "light_push",
			weapon_action_hand = "left",
			push_angle = 100,
			hit_effect = "melee_hit_hammers_1h",
			damage_window_end = 0.2,
			impact_sound_event = "hammer_2h_hit",
			charge_value = "action_push",
			dedicated_target_range = 2,
			anim_event = "attack_push",
			damage_profile_inner = "medium_push",
			total_time = 0.8,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.2,
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
					start_time = 0.3,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.3,
					action = "action_one",
					release_required = "action_two_hold",
					doubleclick_window = 0,
					input = "action_one_hold"
				},
				{
					sub_action = "light_attack_bopp",
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
					start_time = 0.3,
					action = "action_two",
					send_buffer = true,
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.3,
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
weapon_template.display_unit = "units/weapons/weapon_display/display_dual_hammers"
weapon_template.buff_type = "MELEE_1H"
weapon_template.weapon_type = "MACE_1H"
weapon_template.max_fatigue_points = 8
weapon_template.dodge_count = 3
weapon_template.block_angle = 90
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.5
weapon_template.outer_block_fatigue_point_multiplier = 2
weapon_template.sound_event_block_within_arc = "weapon_foley_blunt_1h_block_wood"
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.15
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.15
	}
}
weapon_template.wield_anim = "to_dual_hammers_priest"
weapon_template.wield_anim_career = {
	wh_zealot = "to_dual_hammers",
	wh_priest = "to_dual_hammers_priest",
	wh_captain = "to_dual_hammers",
	wh_bountyhunter = "to_dual_hammers"
}
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/melee/dual_hammers_priest"
weapon_template.attack_meta_data = {
	tap_attack = {
		penetrating = false,
		arc = 0
	},
	hold_attack = {
		penetrating = true,
		arc = 0
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
		[DamageTypes.ARMOR_PIERCING] = 1,
		[DamageTypes.CLEAVE] = 5,
		[DamageTypes.SPEED] = 5,
		[DamageTypes.STAGGER] = 3,
		[DamageTypes.DAMAGE] = 2
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 3,
		[DamageTypes.CLEAVE] = 4,
		[DamageTypes.SPEED] = 3,
		[DamageTypes.STAGGER] = 3,
		[DamageTypes.DAMAGE] = 5
	}
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_crowd_control",
	"weapon_keyword_fast_attacks",
	"weapon_keyword_wide_sweeps"
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "light_attack_left"
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "heavy_attack_2"
	}
}
weapon_template.tooltip_detail = {
	light = {
		action_name = "action_one",
		sub_action_name = "default"
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "default"
	},
	push = {
		action_name = "action_one",
		sub_action_name = "push"
	}
}
weapon_template.wwise_dep_left_hand = {
	"wwise/one_handed_hammers"
}
weapon_template.wwise_dep_right_hand = {
	"wwise/one_handed_hammers"
}

return {
	dual_wield_hammers_priest_template = weapon_template
}
