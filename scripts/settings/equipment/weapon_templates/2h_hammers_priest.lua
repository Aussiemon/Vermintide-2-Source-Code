local push_radius = 2.5
local time_mod = 0.9
local weapon_mode_normal = nil
local weapon_mode_charged = 1
local weapon_template = {
	actions = {
		action_one = {
			default = {
				anim_end_event = "attack_finished",
				kind = "melee_start",
				attack_hold_input = "action_one_hold",
				anim_event = "attack_swing_charge_right",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				total_time = math.huge,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.2,
						buff_name = "planted_charging_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "light_attack_01",
						start_time = 0,
						action = "action_one",
						end_time = 0.35,
						input = "action_one_release"
					},
					{
						sub_action = "heavy_attack_01",
						start_time = 0.5,
						action = "action_one",
						input = "action_one_release"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						release_required = "action_two_hold",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "weapon_reload",
						input = "weapon_reload"
					},
					{
						start_time = 0.3,
						blocker = true,
						end_time = 1.5,
						input = "action_one_hold"
					},
					{
						sub_action = "heavy_attack_01",
						start_time = 0.7,
						action = "action_one",
						auto_chain = true
					}
				},
				enter_function = function (attacker_unit, input_extension)
					return input_extension:reset_release_input()
				end
			},
			default_02 = {
				kind = "melee_start",
				anim_end_event = "attack_finished",
				anim_event = "attack_swing_charge",
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
						sub_action = "light_attack_02",
						start_time = 0,
						action = "action_one",
						end_time = 0.25,
						input = "action_one_release"
					},
					{
						sub_action = "heavy_attack_02",
						start_time = 0.45,
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
						start_time = 0.3,
						blocker = true,
						end_time = 1.5,
						input = "action_one_hold"
					},
					{
						sub_action = "heavy_attack_02",
						start_time = 0.6,
						action = "action_one",
						auto_chain = true
					}
				}
			},
			default_03 = {
				anim_end_event = "attack_finished",
				kind = "melee_start",
				attack_hold_input = "action_one_hold",
				anim_event = "attack_swing_charge_right_down",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				total_time = math.huge,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.2,
						buff_name = "planted_charging_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "light_attack_03",
						start_time = 0,
						action = "action_one",
						end_time = 0.25,
						input = "action_one_release"
					},
					{
						sub_action = "heavy_attack_03",
						start_time = 0.35,
						action = "action_one",
						input = "action_one_release"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						release_required = "action_two_hold",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
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
						start_time = 0.3,
						blocker = true,
						end_time = 1.5,
						input = "action_one_hold"
					},
					{
						sub_action = "heavy_attack_03",
						start_time = 0.8,
						action = "action_one",
						auto_chain = true
					}
				},
				enter_function = function (attacker_unit, input_extension)
					return input_extension:reset_release_input()
				end
			},
			heavy_attack_01 = {
				damage_window_start = 0.3,
				push_radius = 3,
				anim_end_event = "attack_finished",
				kind = "sweep",
				first_person_hit_anim = "hit_left_shake",
				range_mod = 1.3,
				sweep_z_offset = 0.05,
				width_mod = 30,
				additional_critical_strike_chance = 0.1,
				use_precision_sweep = false,
				hit_effect = "melee_hit_hammers_2h",
				slide_armour_hit = true,
				damage_profile = "priest_hammer_heavy_blunt_tank_upper",
				damage_window_end = 0.5,
				impact_sound_event = "hammer_2h_hit",
				charge_value = "heavy_attack",
				no_damage_impact_sound_event = "blunt_hit_armour",
				dedicated_target_range = 3,
				weapon_up_offset_mod = 0.25,
				uninterruptible = true,
				anim_event = "attack_swing_up",
				hit_stop_anim = "attack_hit",
				total_time = 2.25,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 1.4,
						end_time = 0.2,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_02",
						start_time = 0.65,
						action = "action_one",
						release_required = "action_one_hold",
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
						action = "weapon_reload",
						input = "weapon_reload"
					},
					{
						sub_action = "default_from_out_of_screen",
						start_time = 0.7,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						end_time = 0.3,
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.5,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "default_from_offscreen",
						start_time = 0.85,
						action = "action_three",
						input = "action_three"
					}
				},
				enter_function = function (attacker_unit, input_extension)
					return input_extension:reset_release_input()
				end,
				hit_mass_count = TANK_HIT_MASS_COUNT,
				baked_sweep = {
					{
						0.26666666666666666,
						-0.227996826171875,
						0.4810295104980469,
						-0.18421483039855957,
						-0.5152795314788818,
						0.5645925402641296,
						-0.4902445077896118,
						-0.4187871217727661
					},
					{
						0.3111111111111111,
						-0.17911630868911743,
						0.5266447067260742,
						-0.14414525032043457,
						-0.4635620415210724,
						0.6524781584739685,
						-0.377284437417984,
						-0.46587446331977844
					},
					{
						0.35555555555555557,
						0.03868913650512695,
						0.516301155090332,
						-0.044394493103027344,
						-0.27671027183532715,
						0.8257386088371277,
						-0.1305597573518753,
						-0.47385796904563904
					},
					{
						0.4,
						0.22304153442382812,
						0.4073152542114258,
						0.02141129970550537,
						-0.033538445830345154,
						0.8820384740829468,
						0.1309354454278946,
						-0.4513748586177826
					},
					{
						0.4444444444444444,
						0.31200700998306274,
						0.19499778747558594,
						-0.0023535490036010742,
						0.1698911339044571,
						0.6794611215591431,
						0.6225466132164001,
						-0.34914952516555786
					},
					{
						0.48888888888888893,
						0.33029642701148987,
						-0.18982219696044922,
						-0.0767369270324707,
						0.2036742866039276,
						0.444772332906723,
						0.8616822957992554,
						0.1349000632762909
					},
					{
						0.5333333333333333,
						0.36456915736198425,
						-0.2580528259277344,
						-0.10302913188934326,
						0.2085227221250534,
						0.39923229813575745,
						0.8551049828529358,
						0.25676319003105164
					}
				}
			},
			heavy_attack_02 = {
				damage_window_start = 0.35,
				push_radius = 3,
				range_mod = 1.3,
				kind = "sweep",
				first_person_hit_anim = "hit_right_shake",
				sweep_z_offset = 0.1,
				width_mod = 30,
				additional_critical_strike_chance = 0,
				use_precision_sweep = false,
				hit_effect = "melee_hit_hammers_2h",
				slide_armour_hit = true,
				damage_profile = "heavy_blunt_tank",
				damage_window_end = 0.5,
				impact_sound_event = "hammer_2h_hit",
				charge_value = "heavy_attack",
				anim_end_event = "attack_finished",
				no_damage_impact_sound_event = "blunt_hit_armour",
				dedicated_target_range = 3,
				weapon_up_offset_mod = 0.25,
				uninterruptible = true,
				anim_event = "attack_swing_heavy_right",
				hit_stop_anim = "attack_hit",
				total_time = 2.25,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 1.4,
						end_time = 0.2,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_03",
						start_time = 0.65,
						action = "action_one",
						release_required = "action_one_hold",
						end_time = 1.35,
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 1.35,
						action = "action_one",
						release_required = "action_one_hold",
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "weapon_reload",
						input = "weapon_reload"
					},
					{
						sub_action = "default_from_out_of_screen",
						start_time = 0.7,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						end_time = 0.3,
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.5,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "default_from_offscreen",
						start_time = 0.75,
						action = "action_three",
						input = "action_three"
					}
				},
				enter_function = function (attacker_unit, input_extension)
					return input_extension:reset_release_input()
				end,
				critical_strike = {},
				hit_mass_count = TANK_HIT_MASS_COUNT,
				baked_sweep = {
					{
						0.31666666666666665,
						0.16953390836715698,
						0.4892711639404297,
						-0.03548908233642578,
						-0.15414656698703766,
						0.8041136860847473,
						-0.07697810977697372,
						-0.5689590573310852
					},
					{
						0.35277777777777775,
						0.27152395248413086,
						0.4378538131713867,
						-0.0355304479598999,
						0.011030995287001133,
						0.7408086061477661,
						0.20654411613941193,
						-0.6390778422355652
					},
					{
						0.3888888888888889,
						0.3072696030139923,
						0.48340320587158203,
						-0.128129243850708,
						0.37091851234436035,
						0.5541998744010925,
						0.4425201416015625,
						-0.5995480418205261
					},
					{
						0.425,
						0.3042217791080475,
						0.18708324432373047,
						-0.14750158786773682,
						0.5808215141296387,
						0.26610198616981506,
						0.718478798866272,
						-0.27499881386756897
					},
					{
						0.46111111111111114,
						0.26906412839889526,
						0.047733306884765625,
						-0.1531757116317749,
						0.6504351496696472,
						0.22474586963653564,
						0.7108327746391296,
						-0.14539672434329987
					},
					{
						0.49722222222222223,
						0.26559820771217346,
						-0.08467960357666016,
						-0.1732635498046875,
						0.7714474201202393,
						0.20945167541503906,
						0.6006905436515808,
						-0.013031132519245148
					},
					{
						0.5333333333333333,
						0.2717093229293823,
						-0.1901073455810547,
						-0.20296871662139893,
						0.8592789173126221,
						0.2117975950241089,
						0.45954692363739014,
						0.0748213604092598
					}
				}
			},
			heavy_attack_03 = {
				damage_window_start = 0.3,
				push_radius = 3,
				anim_end_event = "attack_finished",
				kind = "sweep",
				first_person_hit_anim = "hit_left_shake",
				range_mod = 1.3,
				sweep_z_offset = 0.05,
				width_mod = 30,
				additional_critical_strike_chance = 0,
				use_precision_sweep = true,
				hit_effect = "melee_hit_hammers_2h",
				slide_armour_hit = true,
				damage_profile = "priest_hammer_blunt_smiter",
				damage_window_end = 0.43,
				impact_sound_event = "hammer_2h_hit",
				charge_value = "heavy_attack",
				no_damage_impact_sound_event = "blunt_hit_armour",
				dedicated_target_range = 3,
				weapon_up_offset_mod = 0.25,
				uninterruptible = true,
				anim_event = "attack_swing_heavy_right_diagonal",
				hit_stop_anim = "attack_hit",
				total_time = 2.25,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.75,
						end_time = 0.2,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0.65,
						action = "action_one",
						release_required = "action_one_hold",
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
						action = "weapon_reload",
						input = "weapon_reload"
					},
					{
						sub_action = "default_from_out_of_screen",
						start_time = 0.7,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						end_time = 0.3,
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.5,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "default_from_offscreen",
						start_time = 0.75,
						action = "action_three",
						input = "action_three"
					}
				},
				enter_function = function (attacker_unit, input_extension)
					return input_extension:reset_release_input()
				end,
				hit_mass_count = TANK_HIT_MASS_COUNT,
				baked_sweep = {
					{
						0.26666666666666666,
						-0.006768941879272461,
						0.6334190368652344,
						0.18792176246643066,
						-0.6469882726669312,
						0.08969038724899292,
						-0.11757375299930573,
						-0.7480229139328003
					},
					{
						0.29944444444444446,
						-0.016073226928710938,
						0.6763916015625,
						0.05070066452026367,
						-0.4986059367656708,
						0.03874656558036804,
						-0.07532476633787155,
						-0.8626801371574402
					},
					{
						0.3322222222222222,
						-0.005365848541259766,
						0.7098684310913086,
						-0.133101224899292,
						-0.31269434094429016,
						0.010349338874220848,
						0.030838174745440483,
						-0.9492966532707214
					},
					{
						0.365,
						0.012783050537109375,
						0.7377243041992188,
						-0.3476231098175049,
						-0.1513054370880127,
						-0.00980305951088667,
						0.0712868720293045,
						-0.9858644604682922
					},
					{
						0.3977777777777778,
						0.006738185882568359,
						0.5775051116943359,
						-0.5185589790344238,
						0.2663084864616394,
						-0.004769408144056797,
						0.0014795010210946202,
						-0.9638749361038208
					},
					{
						0.4305555555555555,
						0.010546207427978516,
						0.32291221618652344,
						-0.6397647857666016,
						0.7034010291099548,
						0.015224460512399673,
						0.015417479909956455,
						-0.7104628682136536
					},
					{
						0.4633333333333333,
						0.046652793884277344,
						0.19236278533935547,
						-0.6931107044219971,
						0.8123747706413269,
						-0.0640672892332077,
						0.17253288626670837,
						-0.5533308982849121
					}
				}
			},
			light_attack_01 = {
				damage_window_start = 0.32,
				range_mod = 1.3,
				kind = "sweep",
				no_damage_impact_sound_event = "blunt_hit_armour",
				additional_critical_strike_chance = 0,
				use_precision_sweep = true,
				width_mod = 30,
				damage_profile = "medium_blunt_smiter_2h_hammer",
				aim_assist_ramp_multiplier = 0.5,
				aim_assist_max_ramp_multiplier = 0.8,
				hit_effect = "melee_hit_hammers_2h",
				aim_assist_ramp_decay_delay = 0.1,
				damage_window_end = 0.47,
				impact_sound_event = "hammer_2h_hit",
				charge_value = "light_attack",
				anim_end_event = "attack_finished",
				dedicated_target_range = 2.85,
				weapon_up_offset_mod = 0.25,
				uninterruptible = true,
				anim_event = "attack_swing_down_right",
				hit_stop_anim = "attack_hit",
				total_time = 1.5,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.4,
						end_time = 0.2,
						buff_name = "planted_decrease_movement"
					},
					{
						start_time = 0.2,
						external_multiplier = 1.4,
						end_time = 0.35,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.5,
						external_multiplier = 0.75,
						end_time = 0.8,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_02",
						start_time = 0.7,
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
						action = "weapon_reload",
						input = "weapon_reload"
					},
					{
						sub_action = "default_from_out_of_screen",
						start_time = 0.7,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						end_time = 0.3,
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_wield",
						end_time = 0.3,
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.75,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "default_from_offscreen",
						start_time = 0.7,
						action = "action_three",
						input = "action_three"
					}
				},
				baked_sweep = {
					{
						0.2866666666666667,
						-0.20361649990081787,
						0.39415836334228516,
						0.13566112518310547,
						-0.6830467581748962,
						-0.12466604262590408,
						0.10645263642072678,
						-0.7117396593093872
					},
					{
						0.3227777777777778,
						-0.16666966676712036,
						0.44611454010009766,
						0.11589920520782471,
						-0.646102249622345,
						-0.08665993809700012,
						0.0743463784456253,
						-0.7546619176864624
					},
					{
						0.35888888888888887,
						-0.10177946090698242,
						0.535064697265625,
						0.059004902839660645,
						-0.5961325168609619,
						0.03835175186395645,
						0.005732744932174683,
						-0.8019490838050842
					},
					{
						0.395,
						-0.020412027835845947,
						0.604456901550293,
						-0.0513843297958374,
						-0.4681015610694885,
						0.15559662878513336,
						-0.0504695363342762,
						-0.8684028387069702
					},
					{
						0.4311111111111111,
						0.03363347053527832,
						0.5513486862182617,
						-0.2520366907119751,
						-0.16943460702896118,
						0.15708424150943756,
						-0.14452944695949554,
						-0.9621474742889404
					},
					{
						0.4672222222222222,
						0.11414515972137451,
						0.1433258056640625,
						-0.2770993709564209,
						0.6924742460250854,
						0.1154709979891777,
						0.08212728798389435,
						-0.7073902487754822
					},
					{
						0.5033333333333333,
						0.290766179561615,
						-0.3697662353515625,
						-0.4480334520339966,
						0.9077972173690796,
						0.0831223875284195,
						0.05263565853238106,
						-0.40770626068115234
					}
				}
			},
			light_attack_02 = {
				damage_window_start = 0.31,
				anim_end_event = "attack_finished",
				range_mod = 1.3,
				kind = "sweep",
				no_damage_impact_sound_event = "blunt_hit_armour",
				charge_value = "light_attack",
				additional_critical_strike_chance = 0,
				width_mod = 30,
				use_precision_sweep = true,
				slide_armour_hit = true,
				damage_profile = "medium_blunt_smiter_2h_hammer",
				hit_effect = "melee_hit_hammers_2h",
				aim_assist_ramp_multiplier = 0.5,
				aim_assist_max_ramp_multiplier = 0.8,
				damage_window_end = 0.5,
				impact_sound_event = "hammer_2h_hit",
				hit_stop_kill_anim = "attack_hit_alt_effect",
				aim_assist_ramp_decay_delay = 0.1,
				dedicated_target_range = 2.85,
				weapon_up_offset_mod = 0.25,
				uninterruptible = true,
				anim_event = "attack_swing_up_left",
				hit_stop_anim = "attack_hit",
				total_time = 1.5,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.6,
						end_time = 0.2,
						buff_name = "planted_decrease_movement"
					},
					{
						start_time = 0.2,
						external_multiplier = 1.4,
						end_time = 0.35,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.5,
						external_multiplier = 0.75,
						end_time = 0.8,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default_03",
						start_time = 0.7,
						action = "action_one",
						end_time = 1,
						input = "action_one"
					},
					{
						sub_action = "default_03",
						start_time = 1,
						action = "action_one",
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "weapon_reload",
						input = "weapon_reload"
					},
					{
						sub_action = "default_from_out_of_screen",
						start_time = 0.7,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						end_time = 0.3,
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_wield",
						end_time = 0.3,
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.5,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "default_from_offscreen",
						start_time = 0.7,
						action = "action_three",
						input = "action_three"
					}
				},
				baked_sweep = {
					{
						0.27666666666666667,
						0.4834250807762146,
						-0.3543844223022461,
						-0.5084280967712402,
						0.7401217818260193,
						0.26535192131996155,
						0.06499706953763962,
						-0.6144782304763794
					},
					{
						0.3194444444444444,
						0.37633419036865234,
						0.0743856430053711,
						-0.8079235553741455,
						0.4474731385707855,
						0.22351649403572083,
						0.213565394282341,
						-0.8391650915145874
					},
					{
						0.3622222222222222,
						0.35166874527931213,
						0.5964384078979492,
						-0.7346616387367249,
						0.030037160962820053,
						0.22828859090805054,
						0.20158155262470245,
						-0.9520226120948792
					},
					{
						0.405,
						0.15542137622833252,
						0.7294559478759766,
						-0.3177605867385864,
						-0.042159125208854675,
						0.38282155990600586,
						0.03172384202480316,
						-0.9223144054412842
					},
					{
						0.4477777777777778,
						-0.1789531707763672,
						0.48725223541259766,
						0.04552590847015381,
						-0.48569661378860474,
						0.16409055888652802,
						0.08992494642734528,
						-0.8538656830787659
					},
					{
						0.4905555555555555,
						-0.27720552682876587,
						0.2977733612060547,
						0.18117010593414307,
						-0.7175465226173401,
						0.11553270369768143,
						0.1455211341381073,
						-0.6712695360183716
					},
					{
						0.5333333333333333,
						-0.24520456790924072,
						0.20232105255126953,
						0.22656035423278809,
						0.8432480096817017,
						-0.22185960412025452,
						-0.20084716379642487,
						0.4465104043483734
					}
				}
			},
			light_attack_03 = {
				damage_window_start = 0.3,
				range_mod = 1.35,
				kind = "sweep",
				no_damage_impact_sound_event = "blunt_hit_armour",
				additional_critical_strike_chance = 0.1,
				slide_armour_hit = true,
				width_mod = 30,
				damage_profile = "medium_blunt_tank",
				aim_assist_ramp_multiplier = 0.5,
				hit_effect = "melee_hit_hammers_2h",
				aim_assist_max_ramp_multiplier = 0.8,
				aim_assist_ramp_decay_delay = 0.1,
				damage_window_end = 0.45,
				impact_sound_event = "hammer_2h_hit",
				charge_value = "light_attack",
				anim_end_event = "attack_finished",
				dedicated_target_range = 2,
				weapon_up_offset_mod = 0.25,
				uninterruptible = true,
				anim_event = "attack_swing_left",
				hit_stop_anim = "attack_hit",
				total_time = 1.5,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.4,
						end_time = 0.2,
						buff_name = "planted_decrease_movement"
					},
					{
						start_time = 0.2,
						external_multiplier = 1.4,
						end_time = 0.35,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.5,
						external_multiplier = 0.4,
						end_time = 0.8,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0.7,
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
						action = "weapon_reload",
						input = "weapon_reload"
					},
					{
						sub_action = "default_from_out_of_screen",
						start_time = 0.7,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						end_time = 0.3,
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_wield",
						end_time = 0.3,
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.5,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "default_from_offscreen",
						start_time = 0.8,
						action = "action_three",
						input = "action_three"
					}
				},
				hit_mass_count = TANK_HIT_MASS_COUNT,
				baked_sweep = {
					{
						0.26666666666666666,
						0.1173708438873291,
						0.6998157501220703,
						0.0919424295425415,
						-0.628872275352478,
						-0.05749310180544853,
						0.022027980536222458,
						-0.775067150592804
					},
					{
						0.30277777777777776,
						0.423335999250412,
						0.6261348724365234,
						0.02801370620727539,
						-0.6146677732467651,
						-0.11037971824407578,
						0.40232720971107483,
						-0.6694270968437195
					},
					{
						0.3388888888888889,
						0.1190691590309143,
						0.7149763107299805,
						-0.16961002349853516,
						-0.22591659426689148,
						-0.557704508304596,
						0.10151708126068115,
						-0.7922257781028748
					},
					{
						0.375,
						-0.23838531970977783,
						0.41539573669433594,
						-0.22301411628723145,
						0.2769657373428345,
						-0.5642416477203369,
						-0.33986616134643555,
						-0.6995801329612732
					},
					{
						0.4111111111111111,
						-0.2638699412345886,
						0.21971416473388672,
						-0.23610436916351318,
						-0.5317155122756958,
						0.35405346751213074,
						0.595596432685852,
						0.48702120780944824
					},
					{
						0.44722222222222224,
						-0.23992860317230225,
						0.1511211395263672,
						-0.2552213668823242,
						-0.6394719481468201,
						0.17780597507953644,
						0.6929464340209961,
						0.28157758712768555
					},
					{
						0.48333333333333334,
						-0.10930633544921875,
						0.16281795501708984,
						-0.2752906084060669,
						-0.6464124917984009,
						0.1211184412240982,
						0.7441206574440002,
						0.11732739955186844
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
				no_damage_impact_sound_event = "slashing_hit_armour",
				dedicated_target_range = 2,
				anim_event = "attack_push",
				damage_profile_inner = "medium_push",
				total_time = 1,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 1,
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
						doubleclick_window = 0,
						input = "action_one"
					},
					{
						sub_action = "punch",
						start_time = 0.35,
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
						action = "action_one",
						release_required = "action_two_hold",
						doubleclick_window = 0,
						input = "action_one_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "weapon_reload",
						input = "weapon_reload"
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
					},
					{
						sub_action = "default",
						start_time = 0.5,
						action = "action_three",
						input = "action_three"
					}
				},
				push_radius = push_radius,
				chain_condition_func = function (attacker_unit, input_extension)
					local status_extension = ScriptUnit.extension(attacker_unit, "status_system")

					return not status_extension:fatigued()
				end
			},
			punch = {
				damage_window_start = 0.25,
				range_mod = 0.7,
				kind = "sweep",
				first_person_hit_anim = "attack_hit",
				no_damage_impact_sound_event = "blunt_hit_armour",
				sweep_z_offset = 0.2,
				width_mod = 30,
				additional_critical_strike_chance = 0,
				damage_profile = "light_blunt_smiter_stab",
				aim_assist_ramp_multiplier = 0.5,
				hit_effect = "melee_hit_hammers_2h",
				aim_assist_max_ramp_multiplier = 0.8,
				aim_assist_ramp_decay_delay = 0.1,
				damage_window_end = 0.32,
				impact_sound_event = "hammer_2h_hit",
				charge_value = "light_attack",
				anim_end_event = "attack_finished",
				dedicated_target_range = 2,
				weapon_up_offset_mod = 0.35,
				uninterruptible = true,
				anim_event = "attack_slam",
				hit_stop_anim = "attack_hit",
				total_time = 1,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.8,
						end_time = 0.2,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.2,
						external_multiplier = 1.4,
						end_time = 0.35,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.5,
						external_multiplier = 0.8,
						end_time = 0.8,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0.55,
						action = "action_one",
						end_time = 1.8,
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 1.8,
						action = "action_one",
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 0.7,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						release_required = "action_two_hold",
						end_time = 0.3,
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_wield",
						end_time = 0.3,
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.5,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.8,
						action = "action_three",
						input = "action_three"
					}
				},
				baked_sweep = {
					{
						0.25,
						0.38310909271240234,
						-0.4715089797973633,
						0.04562544822692871,
						0.1934261918067932,
						0.6850212812423706,
						0.6528607606887817,
						-0.2590465247631073
					},
					{
						0.28,
						0.40972232818603516,
						-0.43228721618652344,
						0.010809659957885742,
						0.21117369830608368,
						0.6782233715057373,
						0.6367289423942566,
						-0.29999178647994995
					},
					{
						0.3,
						0.37592220306396484,
						-0.1692647933959961,
						-0.013623952865600586,
						0.23801389336585999,
						0.6623486876487732,
						0.6118143200874329,
						-0.3610081076622009
					},
					{
						0.32,
						0.1467733383178711,
						0.4883394241333008,
						-0.01981055736541748,
						0.24411778151988983,
						0.6513223052024841,
						0.6247824430465698,
						-0.3547291159629822
					}
				}
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
						external_multiplier = 0.6,
						buff_name = "planted_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0.2,
						action = "action_wield",
						input = "action_wield"
					},
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
					}
				}
			},
			default_from_out_of_screen = {
				cooldown = 0.15,
				minimum_hold_time = 0.2,
				anim_end_event = "parry_finished",
				kind = "block",
				hold_input = "action_two_hold",
				anim_event = "parry_pose_02",
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
						external_multiplier = 0.6,
						buff_name = "planted_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0.2,
						action = "action_wield",
						input = "action_wield"
					},
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
					}
				}
			}
		},
		action_three = {
			default = {
				damage_window_start = 0.25,
				range_mod = 0.7,
				kind = "sweep",
				first_person_hit_anim = "attack_hit",
				no_damage_impact_sound_event = "blunt_hit_armour",
				sweep_z_offset = 0.2,
				width_mod = 30,
				additional_critical_strike_chance = 0,
				damage_profile = "light_blunt_smiter_stab",
				aim_assist_ramp_multiplier = 0.5,
				hit_effect = "melee_hit_hammers_2h",
				aim_assist_max_ramp_multiplier = 0.8,
				aim_assist_ramp_decay_delay = 0.1,
				damage_window_end = 0.32,
				impact_sound_event = "hammer_2h_hit",
				charge_value = "light_attack",
				anim_end_event = "attack_finished",
				dedicated_target_range = 2,
				weapon_up_offset_mod = 0.35,
				uninterruptible = true,
				anim_event = "attack_slam",
				hit_stop_anim = "attack_hit",
				total_time = 1,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.8,
						end_time = 0.2,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.2,
						external_multiplier = 1.4,
						end_time = 0.35,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.5,
						external_multiplier = 0.8,
						end_time = 0.8,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0.65,
						action = "action_one",
						end_time = 1.8,
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 1.8,
						action = "action_one",
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 0.7,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						release_required = "action_two_hold",
						end_time = 0.3,
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_wield",
						end_time = 0.3,
						input = "action_wield"
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
						0.25,
						0.38310909271240234,
						-0.4715089797973633,
						0.04562544822692871,
						0.1934261918067932,
						0.6850212812423706,
						0.6528607606887817,
						-0.2590465247631073
					},
					{
						0.28,
						0.40972232818603516,
						-0.43228721618652344,
						0.010809659957885742,
						0.21117369830608368,
						0.6782233715057373,
						0.6367289423942566,
						-0.29999178647994995
					},
					{
						0.3,
						0.37592220306396484,
						-0.1692647933959961,
						-0.013623952865600586,
						0.23801389336585999,
						0.6623486876487732,
						0.6118143200874329,
						-0.3610081076622009
					},
					{
						0.32,
						0.1467733383178711,
						0.4883394241333008,
						-0.01981055736541748,
						0.24411778151988983,
						0.6513223052024841,
						0.6247824430465698,
						-0.3547291159629822
					}
				}
			},
			default_from_offscreen = {
				damage_window_start = 0.25,
				range_mod = 0.7,
				kind = "sweep",
				first_person_hit_anim = "attack_hit",
				no_damage_impact_sound_event = "blunt_hit_armour",
				sweep_z_offset = 0.2,
				width_mod = 30,
				additional_critical_strike_chance = 0,
				damage_profile = "light_blunt_smiter_stab",
				aim_assist_ramp_multiplier = 0.5,
				hit_effect = "melee_hit_hammers_2h",
				aim_assist_max_ramp_multiplier = 0.8,
				aim_assist_ramp_decay_delay = 0.1,
				damage_window_end = 0.32,
				impact_sound_event = "hammer_2h_hit",
				charge_value = "light_attack",
				anim_end_event = "attack_finished",
				dedicated_target_range = 2,
				weapon_up_offset_mod = 0.35,
				uninterruptible = true,
				anim_event = "attack_slam_charge",
				hit_stop_anim = "attack_hit",
				total_time = 1,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				anim_time_scale = time_mod * 1,
				buff_data = {
					{
						start_time = 0,
						external_multiplier = 0.8,
						end_time = 0.2,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.2,
						external_multiplier = 1.4,
						end_time = 0.35,
						buff_name = "planted_fast_decrease_movement"
					},
					{
						start_time = 0.5,
						external_multiplier = 0.8,
						end_time = 0.8,
						buff_name = "planted_fast_decrease_movement"
					}
				},
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0.65,
						action = "action_one",
						end_time = 1.8,
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 1.8,
						action = "action_one",
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 0.7,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						release_required = "action_two_hold",
						end_time = 0.3,
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_wield",
						end_time = 0.3,
						input = "action_wield"
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
						0.25,
						0.38310909271240234,
						-0.4715089797973633,
						0.04562544822692871,
						0.1934261918067932,
						0.6850212812423706,
						0.6528607606887817,
						-0.2590465247631073
					},
					{
						0.28,
						0.40972232818603516,
						-0.43228721618652344,
						0.010809659957885742,
						0.21117369830608368,
						0.6782233715057373,
						0.6367289423942566,
						-0.29999178647994995
					},
					{
						0.3,
						0.37592220306396484,
						-0.1692647933959961,
						-0.013623952865600586,
						0.23801389336585999,
						0.6623486876487732,
						0.6118143200874329,
						-0.3610081076622009
					},
					{
						0.32,
						0.1467733383178711,
						0.4883394241333008,
						-0.01981055736541748,
						0.24411778151988983,
						0.6513223052024841,
						0.6247824430465698,
						-0.3547291159629822
					}
				}
			}
		},
		action_inspect = ActionTemplates.action_inspect,
		action_wield = ActionTemplates.wield
	},
	right_hand_unit = "units/weapons/player/wpn_empire_short_sword/wpn_empire_short_sword",
	right_hand_attachment_node_linking = AttachmentNodeLinking.two_handed_melee_weapon,
	display_unit = "units/weapons/weapon_display/display_2h_hammers",
	wield_anim = "to_2h_hammer_priest",
	buff_type = "MELEE_2H",
	weapon_type = "MACE_2H",
	max_fatigue_points = 6,
	dodge_count = 2,
	block_angle = 90,
	outer_block_angle = 360,
	block_fatigue_point_multiplier = 0.5,
	outer_block_fatigue_point_multiplier = 2,
	sound_event_block_within_arc = "weapon_foley_blunt_2h_block_wood",
	buffs = {
		change_dodge_distance = {
			external_optional_multiplier = 1
		},
		change_dodge_speed = {
			external_optional_multiplier = 1
		}
	},
	attack_meta_data = {
		tap_attack = {
			max_range = 2.75,
			arc = 0,
			penetrating = true
		},
		hold_attack = {
			max_range = 3,
			arc = 2,
			penetrating = true
		}
	},
	aim_assist_settings = {
		max_range = 5,
		no_aim_input_multiplier = 0,
		base_multiplier = 0,
		effective_max_range = 4,
		breed_scalars = {
			skaven_storm_vermin = 1,
			skaven_clan_rat = 0.5,
			skaven_slave = 0.5
		}
	},
	weapon_diagram = {
		light_attack = {
			[DamageTypes.ARMOR_PIERCING] = 5,
			[DamageTypes.CLEAVE] = 2,
			[DamageTypes.SPEED] = 2,
			[DamageTypes.STAGGER] = 3,
			[DamageTypes.DAMAGE] = 6
		},
		heavy_attack = {
			[DamageTypes.ARMOR_PIERCING] = 4,
			[DamageTypes.CLEAVE] = 6,
			[DamageTypes.SPEED] = 1,
			[DamageTypes.STAGGER] = 6,
			[DamageTypes.DAMAGE] = 6
		}
	},
	tooltip_keywords = {
		"weapon_keyword_wide_sweeps",
		"weapon_keyword_crowd_control",
		"weapon_keyword_armour_piercing"
	},
	tooltip_compare = {
		light = {
			action_name = "action_one",
			sub_action_name = "light_attack_left"
		},
		heavy = {
			action_name = "action_one",
			sub_action_name = "heavy_attack_01"
		}
	},
	tooltip_detail = {
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
	},
	weapon_sway_settings = {
		camera_look_sensitivity = 1,
		sway_range = 1,
		recetner_dampening = 1,
		look_sensitivity = 0.5,
		recenter_max_vel = 5,
		recenter_acc = 5,
		lerp_speed = math.huge
	},
	wwise_dep_right_hand = {
		"wwise/two_handed_hammers"
	},
	tooltip_special_action_description = "special_action_2h_hammer_priest"
}

return {
	two_handed_hammer_priest_template = weapon_template
}
