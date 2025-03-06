-- chunkname: @scripts/settings/equipment/weapon_templates/1h_hammers_book_priest.lua

local unit_set_flow_variable = Unit.set_flow_variable
local unit_flow_event = Unit.flow_event
local push_radius = 2
local time_mod = 0.9
local base_charge_speed = 1.5
local weapon_mode_normal = 1
local weapon_mode_charged = 2
local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			aim_assist_max_ramp_multiplier = 0.4,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.2,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_charge_stab",
			attack_hold_input = "action_one_hold",
			initial_charge_delay = 0.5,
			kind = "book_charge",
			melee_start = true,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			charge_speed = base_charge_speed,
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
					external_multiplier = 0.65,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release",
					start_time = 0,
					sub_action = "light_attack_01",
				},
				{
					action = "action_one",
					input = "action_one_release",
					start_time = 0.5,
					sub_action = "heavy_attack_stab_select",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					release_required = "action_two_hold",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0,
					sub_action = "default",
				},
				{
					blocker = true,
					end_time = 1.2,
					input = "action_one_hold",
					start_time = 0.7,
				},
			},
		},
		default_pose = {
			aim_assist_max_ramp_multiplier = 0.4,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.2,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_charge_left_diagonal",
			attack_hold_input = "action_one_hold",
			initial_charge_delay = 0.5,
			kind = "book_charge",
			melee_start = true,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			charge_speed = base_charge_speed,
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
					external_multiplier = 0.25,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release",
					start_time = 0,
					sub_action = "light_attack_01_pose",
				},
				{
					action = "action_one",
					input = "action_one_release",
					start_time = 0.5,
					sub_action = "heavy_attack_left_select",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					release_required = "action_two_hold",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0,
					sub_action = "default",
				},
				{
					blocker = true,
					end_time = 1.2,
					input = "action_one_hold",
					start_time = 0.7,
				},
			},
		},
		default_right = {
			aim_assist_max_ramp_multiplier = 0.4,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.2,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_charge_left_diagonal",
			initial_charge_delay = 0.5,
			kind = "book_charge",
			melee_start = true,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			charge_speed = base_charge_speed,
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
					external_multiplier = 0.65,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 0.3,
					input = "action_one_release",
					start_time = 0,
					sub_action = "light_attack_02",
				},
				{
					action = "action_one",
					input = "action_one_release",
					start_time = 0.5,
					sub_action = "heavy_attack_left_select",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					release_required = "action_two_hold",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0,
					sub_action = "default",
				},
				{
					blocker = true,
					end_time = 1.2,
					input = "action_one_hold",
					start_time = 0.7,
				},
			},
		},
		heavy_attack_left_select = {
			kind = "action_selector",
			weapon_action_hand = "left",
			conditional_actions = {
				{
					sub_action = "heavy_attack_left_charged",
					condition = function (talent_extension, buff_extension, weapon_extension)
						return weapon_extension and weapon_extension:get_custom_data("charge") >= 1
					end,
				},
			},
			default_action = {
				sub_action = "heavy_attack_left",
			},
		},
		heavy_attack_left = {
			additional_critical_strike_chance = 0,
			aim_assist_max_ramp_multiplier = 0.9,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.4,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_heavy_left_diagonal",
			charge_value = "heavy_attack",
			damage_profile = "medium_blunt_smiter_1h",
			damage_window_end = 0.32,
			damage_window_start = 0.22,
			dedicated_target_range = 3,
			first_person_hit_anim = "shake_hit",
			hit_armor_anim = "attack_hit",
			hit_effect = "melee_hit_hammers_1h",
			hit_shield_stop_anim = "attack_hit",
			hit_stop_anim = "attack_hit",
			hit_stop_kill_anim = "attack_hit_alt_effect",
			impact_sound_event = "blunt_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "blunt_hit_armour",
			reset_aim_on_attack = true,
			total_time = 1.2,
			uninterruptible = true,
			use_precision_sweep = true,
			weapon_action_hand = "left",
			width_mod = 25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.2,
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
					end_time = 0.2,
					external_multiplier = 1,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					input = "action_one",
					release_required = "action_one_hold",
					start_time = 0.65,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one_hold",
					release_required = "action_one_hold",
					start_time = 0.65,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.4,
					sub_action = "default",
				},
				{
					action = "action_two",
					end_time = 0.2,
					input = "action_two_hold",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_three",
					input = "action_three",
					start_time = 0.8,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.5,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			critical_strike = {},
			baked_sweep = {
				{
					0.18666666666666668,
					-0.0591888427734375,
					0.40927600860595703,
					0.23561716079711914,
					-0.6404680013656616,
					-0.08281843364238739,
					0.12738323211669922,
					-0.7528050541877747,
				},
				{
					0.21444444444444444,
					-0.02547454833984375,
					0.4899406433105469,
					0.1853804588317871,
					-0.6043727993965149,
					-0.062409915030002594,
					0.11327768117189407,
					-0.7861340641975403,
				},
				{
					0.24222222222222223,
					-0.008706092834472656,
					0.6664600372314453,
					0.12330913543701172,
					-0.07237698137760162,
					-0.01279249507933855,
					0.07627228647470474,
					-0.9943744540214539,
				},
				{
					0.27,
					-0.02516937255859375,
					0.738408088684082,
					-0.20325040817260742,
					0.45750680565834045,
					-0.004152762237936258,
					0.0043066153302788734,
					-0.8891860246658325,
				},
				{
					0.2977777777777778,
					-0.05207490921020508,
					0.5786247253417969,
					-0.585179328918457,
					0.766994833946228,
					-0.04037140682339668,
					0.005705564748495817,
					-0.6403566598892212,
				},
				{
					0.3255555555555556,
					-0.0643162727355957,
					0.3806133270263672,
					-0.8013739585876465,
					0.8176595568656921,
					-0.0622670017182827,
					0.04119671508669853,
					-0.5708401799201965,
				},
				{
					0.35333333333333333,
					-0.06678628921508789,
					0.2791481018066406,
					-0.882415771484375,
					0.8254759907722473,
					-0.10890519618988037,
					0.07994473725557327,
					-0.5480309724807739,
				},
			},
		},
		heavy_attack_left_charged = {
			additional_critical_strike_chance = 0,
			aim_assist_max_ramp_multiplier = 0.9,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.4,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_left_diagonal_last",
			charge_value = "heavy_attack",
			damage_profile = "medium_blunt_smiter_1h",
			damage_window_end = 0.32,
			damage_window_start = 0.22,
			dedicated_target_range = 3,
			first_person_hit_anim = "shake_hit",
			hit_armor_anim = "attack_hit",
			hit_effect = "melee_hit_hammers_1h",
			hit_shield_stop_anim = "attack_hit",
			hit_stop_anim = "attack_hit",
			hit_stop_kill_anim = "attack_hit_alt_effect",
			impact_explosion_template = "hammer_book_charged_impact_explosion",
			impact_sound_event = "blunt_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "blunt_hit_armour",
			reset_aim_on_attack = true,
			total_time = 1.2,
			uninterruptible = true,
			use_precision_sweep = true,
			weapon_action_hand = "left",
			width_mod = 25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.2,
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
					end_time = 0.2,
					external_multiplier = 1,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					input = "action_one",
					release_required = "action_one_hold",
					start_time = 0.65,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one_hold",
					release_required = "action_one_hold",
					start_time = 0.65,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.4,
					sub_action = "default",
				},
				{
					action = "action_two",
					end_time = 0.2,
					input = "action_two_hold",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_three",
					input = "action_three",
					start_time = 0.8,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.5,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension, remaining_time, weapon_extension)
				if weapon_extension then
					weapon_extension:set_custom_data("charge", 0)

					local inventory_extension = ScriptUnit.has_extension(attacker_unit, "inventory_system")

					if inventory_extension then
						local hammer_unit, book_unit = inventory_extension:get_all_weapon_unit()

						if book_unit then
							unit_set_flow_variable(book_unit, "current_charge", 0)
							unit_flow_event(book_unit, "lua_update_charge")
						end
					end
				end

				return input_extension:reset_release_input()
			end,
			critical_strike = {},
			baked_sweep = {
				{
					0.18666666666666668,
					-0.07946920394897461,
					0.2558317184448242,
					0.261873722076416,
					-0.7094699144363403,
					-0.007096351124346256,
					0.06872042268514633,
					-0.7013412714004517,
				},
				{
					0.21444444444444444,
					-0.03188323974609375,
					0.4617042541503906,
					0.1927809715270996,
					-0.6214532852172852,
					-0.04986602067947388,
					0.10334671288728714,
					-0.7750023603439331,
				},
				{
					0.24222222222222223,
					-0.006375789642333984,
					0.6745548248291016,
					0.12076759338378906,
					-0.07280852645635605,
					-0.018726153299212456,
					0.08037886023521423,
					-0.9939252734184265,
				},
				{
					0.27,
					-0.023718833923339844,
					0.752655029296875,
					-0.20697402954101562,
					0.45308613777160645,
					-0.0006620890344493091,
					0.006855801213532686,
					-0.8914401531219482,
				},
				{
					0.2977777777777778,
					-0.05291271209716797,
					0.5781354904174805,
					-0.5886497497558594,
					0.767123281955719,
					-0.04143320769071579,
					0.004537677392363548,
					-0.6401442289352417,
				},
				{
					0.3255555555555556,
					-0.06466293334960938,
					0.37540435791015625,
					-0.8075485229492188,
					0.8178847432136536,
					-0.06365684419870377,
					0.042187001556158066,
					-0.5702917575836182,
				},
				{
					0.35333333333333333,
					-0.06681966781616211,
					0.2804088592529297,
					-0.8823552131652832,
					0.8254090547561646,
					-0.10832981765270233,
					0.07937672734260559,
					-0.5483282804489136,
				},
			},
		},
		heavy_attack_stab_select = {
			kind = "action_selector",
			weapon_action_hand = "left",
			conditional_actions = {
				{
					sub_action = "heavy_attack_stab_charged",
					condition = function (talent_extension, buff_extension, weapon_extension)
						return weapon_extension and weapon_extension:get_custom_data("charge") >= 1
					end,
				},
			},
			default_action = {
				sub_action = "heavy_attack_stab",
			},
		},
		heavy_attack_stab = {
			additional_critical_strike_chance = 0,
			aim_assist_max_ramp_multiplier = 0.9,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.4,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_stab",
			charge_value = "heavy_attack",
			damage_profile = "medium_blunt_smiter_1h_priest",
			damage_window_end = 0.3,
			damage_window_start = 0.2,
			dedicated_target_range = 3,
			first_person_hit_anim = "shake_hit",
			hit_armor_anim = "attack_hit",
			hit_effect = "melee_hit_hammers_1h",
			hit_shield_stop_anim = "attack_hit",
			hit_stop_anim = "attack_hit",
			hit_stop_kill_anim = "attack_hit_alt_effect",
			impact_sound_event = "blunt_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "blunt_hit_armour",
			range_mod = 1.2,
			reset_aim_on_attack = true,
			total_time = 1.2,
			uninterruptible = true,
			use_precision_sweep = false,
			weapon_action_hand = "left",
			width_mod = 25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.2,
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
					end_time = 0.2,
					external_multiplier = 1,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					input = "action_one",
					release_required = "action_one_hold",
					start_time = 0.5,
					sub_action = "default_right",
				},
				{
					action = "action_one",
					input = "action_one_hold",
					release_required = "action_one_hold",
					start_time = 0.5,
					sub_action = "default_right",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.4,
					sub_action = "default",
				},
				{
					action = "action_two",
					end_time = 0.2,
					input = "action_two_hold",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_three",
					input = "action_three",
					start_time = 0.8,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.5,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			critical_strike = {},
			baked_sweep = {
				{
					0.16666666666666666,
					-0.4580221176147461,
					-0.3986663818359375,
					-0.2755088806152344,
					0.6524879932403564,
					-0.1511213779449463,
					-0.11255872994661331,
					-0.7339975237846375,
				},
				{
					0.1527777777777778,
					-0.46747589111328125,
					-0.470245361328125,
					-0.28101396560668945,
					0.6601250767707825,
					-0.12407459318637848,
					0.01614113710820675,
					-0.7406617999076843,
				},
				{
					0.18888888888888888,
					-0.4373807907104492,
					-0.2706794738769531,
					-0.26996612548828125,
					0.6579129099845886,
					-0.08976339548826218,
					0.02815816178917885,
					-0.7471949458122253,
				},
				{
					0.22499999999999998,
					-0.41812896728515625,
					-0.077301025390625,
					-0.2105426788330078,
					0.6588244438171387,
					-0.0873207375407219,
					0.029766051098704338,
					-0.7466186881065369,
				},
				{
					0.26111111111111107,
					-0.27868175506591797,
					0.20484161376953125,
					-0.18161773681640625,
					0.6558881402015686,
					-0.07857701182365417,
					0.048993583768606186,
					-0.7491568922996521,
				},
				{
					0.29722222222222217,
					-0.16484546661376953,
					0.22809219360351562,
					-0.182342529296875,
					0.6586199402809143,
					-0.05433601886034012,
					0.020860671997070312,
					-0.7502214312553406,
				},
				{
					0.3333333333333333,
					-0.17267227172851562,
					0.2462921142578125,
					-0.18473052978515625,
					0.6612018942832947,
					-0.05796777829527855,
					0.02416776493191719,
					-0.7475746273994446,
				},
			},
		},
		heavy_attack_stab_charged = {
			additional_critical_strike_chance = 0,
			aim_assist_max_ramp_multiplier = 0.9,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.4,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_heavy_stab",
			charge_value = "heavy_attack",
			damage_profile = "medium_blunt_smiter_1h_thrust",
			damage_window_end = 0.3,
			damage_window_start = 0.01,
			dedicated_target_range = 3,
			first_person_hit_anim = "shake_hit",
			hit_armor_anim = "attack_hit",
			hit_effect = "melee_hit_hammers_1h",
			hit_shield_stop_anim = "attack_hit",
			hit_stop_anim = "attack_hit",
			hit_stop_kill_anim = "attack_hit_alt_effect",
			impact_sound_event = "blunt_hit",
			kind = "lunge",
			no_damage_impact_sound_event = "blunt_hit_armour",
			range_mod = 1.2,
			reset_aim_on_attack = true,
			total_time = 1.2,
			uninterruptible = true,
			use_precision_sweep = true,
			weapon_action_hand = "left",
			width_mod = 100,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.2,
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
					end_time = 0.2,
					external_multiplier = 1,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					input = "action_one",
					release_required = "action_one_hold",
					start_time = 0.5,
					sub_action = "default_right",
				},
				{
					action = "action_one",
					input = "action_one_hold",
					release_required = "action_one_hold",
					start_time = 0.5,
					sub_action = "default_right",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.4,
					sub_action = "default",
				},
				{
					action = "action_three",
					input = "action_three",
					start_time = 0.8,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.5,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension, remaining_time, weapon_extension)
				if weapon_extension then
					weapon_extension:set_custom_data("charge", 0)

					local inventory_extension = ScriptUnit.has_extension(attacker_unit, "inventory_system")

					if inventory_extension then
						local hammer_unit, book_unit = inventory_extension:get_all_weapon_unit()

						if book_unit then
							unit_set_flow_variable(book_unit, "current_charge", 0)
							unit_flow_event(book_unit, "lua_update_charge")
						end
					end
				end

				return input_extension:reset_release_input()
			end,
			critical_strike = {},
			lunge_settings = {
				duration = 0.32,
				falloff_to_speed = 5,
				initial_speed = 20,
			},
		},
		light_attack_01 = {
			additional_critical_strike_chance = 0.1,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_right_diagonal",
			damage_profile = "light_blunt_smiter",
			damage_window_end = 0.45,
			damage_window_start = 0.35,
			dedicated_target_range = 2,
			first_person_hit_anim = "shake_hit",
			hit_armor_anim = "attack_hit",
			hit_effect = "melee_hit_hammers_1h",
			hit_shield_stop_anim = "attack_hit",
			hit_stop_anim = "attack_hit",
			hit_stop_kill_anim = "attack_hit_alt_effect",
			impact_sound_event = "blunt_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "blunt_hit_armour",
			range_mod = 1.2,
			total_time = 1.5,
			use_precision_sweep = false,
			weapon_action_hand = "left",
			width_mod = 25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1,
			buff_data = {
				{
					buff_name = "planted_decrease_movement",
					end_time = 0.5,
					external_multiplier = 0.9,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 1.25,
					input = "action_one",
					start_time = 0.6,
					sub_action = "default_right",
				},
				{
					action = "action_one",
					end_time = 1.25,
					input = "action_one_hold",
					start_time = 0.6,
					sub_action = "default_right",
				},
				{
					action = "action_one",
					input = "action_one",
					start_time = 1.25,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.5,
					sub_action = "default",
				},
				{
					action = "action_three",
					input = "action_three",
					start_time = 0.8,
					sub_action = "default",
				},
			},
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.31666666666666665,
					-0.11570930480957031,
					-0.07369327545166016,
					0.3632216453552246,
					-0.5718749165534973,
					-0.029218003153800964,
					0.04822839796543121,
					-0.8184005618095398,
				},
				{
					0.34444444444444444,
					-0.22611474990844727,
					0.23102664947509766,
					0.3444099426269531,
					-0.5472146272659302,
					0.04653001204133034,
					0.006271541118621826,
					-0.8356744647026062,
				},
				{
					0.37222222222222223,
					-0.21840906143188477,
					0.5848884582519531,
					0.15191364288330078,
					-0.1594712883234024,
					0.21928724646568298,
					0.05635998398065567,
					-0.9608879089355469,
				},
				{
					0.4,
					0.010462284088134766,
					0.8636064529418945,
					-0.07312870025634766,
					0.4018280804157257,
					0.2009086012840271,
					0.14187653362751007,
					-0.8820663690567017,
				},
				{
					0.42777777777777776,
					0.36040353775024414,
					0.576655387878418,
					-0.6161527633666992,
					0.8934887647628784,
					0.10863763093948364,
					0.27648037672042847,
					-0.33680009841918945,
				},
				{
					0.45555555555555555,
					0.5194411277770996,
					0.2065134048461914,
					-0.6597771644592285,
					0.8615036606788635,
					-0.23374411463737488,
					0.4247688949108124,
					-0.15081968903541565,
				},
				{
					0.48333333333333334,
					0.5369338989257812,
					0.13503551483154297,
					-0.532689094543457,
					0.3855321407318115,
					-0.5616968870162964,
					0.5667716860771179,
					-0.46328333020210266,
				},
			},
		},
		light_attack_01_pose = {
			additional_critical_strike_chance = 0.1,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_right_diagonal_axe",
			damage_profile = "light_blunt_smiter",
			damage_window_end = 0.45,
			damage_window_start = 0.35,
			dedicated_target_range = 2,
			first_person_hit_anim = "shake_hit",
			hit_armor_anim = "attack_hit",
			hit_effect = "melee_hit_hammers_1h",
			hit_shield_stop_anim = "attack_hit",
			hit_stop_anim = "attack_hit",
			hit_stop_kill_anim = "attack_hit_alt_effect",
			impact_sound_event = "blunt_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "blunt_hit_armour",
			range_mod = 1.2,
			total_time = 1.5,
			use_precision_sweep = false,
			weapon_action_hand = "left",
			width_mod = 25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1,
			buff_data = {
				{
					buff_name = "planted_decrease_movement",
					end_time = 0.5,
					external_multiplier = 0.9,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 1.25,
					input = "action_one",
					start_time = 0.6,
					sub_action = "default_right",
				},
				{
					action = "action_one",
					end_time = 1.25,
					input = "action_one_hold",
					start_time = 0.6,
					sub_action = "default_right",
				},
				{
					action = "action_one",
					input = "action_one",
					start_time = 1.25,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.5,
					sub_action = "default",
				},
				{
					action = "action_three",
					input = "action_three",
					start_time = 0.8,
					sub_action = "default",
				},
			},
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.31666666666666665,
					-0.10376310348510742,
					-0.08031177520751953,
					0.3928866386413574,
					-0.5331535339355469,
					-0.03797125816345215,
					0.054861754179000854,
					-0.8433834910392761,
				},
				{
					0.34444444444444444,
					-0.22058582305908203,
					0.245452880859375,
					0.3670663833618164,
					-0.49734169244766235,
					0.03500329703092575,
					-0.005328578874468803,
					-0.8668319582939148,
				},
				{
					0.37222222222222223,
					-0.21617841720581055,
					0.6130571365356445,
					0.16585779190063477,
					-0.08655393868684769,
					0.20262879133224487,
					0.05741975083947182,
					-0.973731517791748,
				},
				{
					0.4,
					0.026367664337158203,
					0.8832664489746094,
					-0.11625194549560547,
					0.5000936985015869,
					0.17477169632911682,
					0.12509970366954803,
					-0.8388749957084656,
				},
				{
					0.42777777777777776,
					0.35753393173217773,
					0.583918571472168,
					-0.6114001274108887,
					0.8893536329269409,
					0.11293110996484756,
					0.27808693051338196,
					-0.344912052154541,
				},
				{
					0.45555555555555555,
					0.5176301002502441,
					0.2119426727294922,
					-0.662318229675293,
					0.86991947889328,
					-0.2180955708026886,
					0.41781824827194214,
					-0.14526644349098206,
				},
				{
					0.48333333333333334,
					0.5377397537231445,
					0.1373605728149414,
					-0.5362081527709961,
					0.4038103520870209,
					-0.5561511516571045,
					0.5666354894638062,
					-0.45448580384254456,
				},
			},
		},
		light_attack_02 = {
			additional_critical_strike_chance = 0.1,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_left_diagonal",
			damage_profile = "light_blunt_smiter",
			damage_window_end = 0.45,
			damage_window_start = 0.35,
			dedicated_target_range = 2,
			first_person_hit_anim = "shake_hit",
			hit_armor_anim = "attack_hit",
			hit_effect = "melee_hit_hammers_1h",
			hit_shield_stop_anim = "attack_hit",
			hit_stop_anim = "attack_hit",
			hit_stop_kill_anim = "attack_hit_alt_effect",
			impact_sound_event = "blunt_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "blunt_hit_armour",
			range_mod = 1.2,
			total_time = 1.5,
			use_precision_sweep = false,
			weapon_action_hand = "left",
			width_mod = 25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					end_time = 0.4,
					external_multiplier = 1.3,
					start_time = 0.1,
				},
				{
					buff_name = "planted_decrease_movement",
					end_time = 0.9,
					external_multiplier = 0.9,
					start_time = 0.45,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 1.25,
					input = "action_one",
					start_time = 0.6,
					sub_action = "default_pose",
				},
				{
					action = "action_one",
					end_time = 1.25,
					input = "action_one_hold",
					start_time = 0.6,
					sub_action = "default_pose",
				},
				{
					action = "action_one",
					input = "action_one",
					start_time = 1.25,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_three",
					input = "action_three",
					start_time = 0.8,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.5,
					sub_action = "default",
				},
			},
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.31666666666666665,
					0.30942535400390625,
					0.13295459747314453,
					0.11517333984375,
					-0.5472623705863953,
					-0.20885078608989716,
					0.0972473993897438,
					-0.8046292662620544,
				},
				{
					0.34444444444444444,
					0.3043861389160156,
					0.21668243408203125,
					0.1465611457824707,
					-0.5191306471824646,
					-0.23444026708602905,
					0.03920411691069603,
					-0.8209775686264038,
				},
				{
					0.37222222222222223,
					0.2197256088256836,
					0.5720891952514648,
					0.10151147842407227,
					-0.2992919981479645,
					-0.27659812569618225,
					0.08034269511699677,
					-0.9096497893333435,
				},
				{
					0.4,
					-0.009035110473632812,
					0.8968715667724609,
					-0.14126014709472656,
					0.39332708716392517,
					-0.21393033862113953,
					-0.12971161305904388,
					-0.8847047686576843,
				},
				{
					0.42777777777777776,
					-0.39621639251708984,
					0.7556276321411133,
					-0.5838127136230469,
					0.715613067150116,
					-0.19066835939884186,
					-0.35323673486709595,
					-0.5716357827186584,
				},
				{
					0.45555555555555555,
					-0.5124249458312988,
					0.3444967269897461,
					-0.7521748542785645,
					0.8485205173492432,
					-0.22365354001522064,
					-0.31375280022621155,
					-0.3626998960971832,
				},
				{
					0.48333333333333334,
					-0.4623532295227051,
					0.23447322845458984,
					-0.6978187561035156,
					0.8196809887886047,
					-0.2568635046482086,
					-0.3355814516544342,
					-0.386690229177475,
				},
			},
		},
		push_attack = {
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_up_left",
			damage_profile = "light_blunt_tank",
			damage_window_end = 0.35,
			damage_window_start = 0.25,
			dedicated_target_range = 2,
			first_person_hit_anim = "shake_hit",
			hit_effect = "melee_hit_hammers_1h",
			hit_stop_anim = "attack_hit",
			impact_sound_event = "blunt_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "blunt_hit_armour",
			range_mod = 1.2,
			total_time = 1.5,
			use_precision_sweep = false,
			weapon_action_hand = "left",
			width_mod = 25,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.2,
			buff_data = {
				{
					buff_name = "planted_decrease_movement",
					end_time = 0.5,
					external_multiplier = 0.9,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 1.25,
					input = "action_one",
					start_time = 0.5,
					sub_action = "default_right",
				},
				{
					action = "action_one",
					end_time = 1.25,
					input = "action_one_hold",
					start_time = 0.5,
					sub_action = "default_right",
				},
				{
					action = "action_one",
					input = "action_one",
					start_time = 1.25,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.5,
					sub_action = "default",
				},
				{
					action = "action_three",
					input = "action_three",
					start_time = 0.5,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.5,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
			hit_mass_count = TANK_HIT_MASS_COUNT,
			baked_sweep = {
				{
					0.21666666666666667,
					0.42547130584716797,
					0.12789440155029297,
					-0.37540197372436523,
					0.475051611661911,
					0.6354050636291504,
					-0.42996299266815186,
					0.43095043301582336,
				},
				{
					0.24444444444444444,
					0.40695810317993164,
					0.49071693420410156,
					-0.27706050872802734,
					-0.3839033842086792,
					-0.7599777579307556,
					0.15331533551216125,
					-0.5015442371368408,
				},
				{
					0.2722222222222222,
					0.07193613052368164,
					0.7982378005981445,
					-0.09055471420288086,
					-0.07572907209396362,
					-0.7729634046554565,
					-0.2582505941390991,
					-0.5745426416397095,
				},
				{
					0.3,
					-0.38588571548461914,
					0.7659387588500977,
					0.015996932983398438,
					-0.26552900671958923,
					0.5856362581253052,
					0.6328166127204895,
					0.43135562539100647,
				},
				{
					0.3277777777777778,
					-0.6767282485961914,
					0.44066810607910156,
					0.059359073638916016,
					-0.41745930910110474,
					0.2892824113368988,
					0.8279007077217102,
					0.23795756697654724,
				},
				{
					0.3555555555555555,
					-0.7436337471008301,
					0.09676837921142578,
					-0.08425331115722656,
					-0.479866623878479,
					0.1503319889307022,
					0.8175327777862549,
					0.2806572914123535,
				},
				{
					0.3833333333333333,
					-0.7602887153625488,
					-0.026683807373046875,
					-0.30356693267822266,
					-0.6627824902534485,
					0.07030800729990005,
					0.7156693935394287,
					0.2087906450033188,
				},
			},
		},
		push = {
			anim_end_event = "attack_finished",
			anim_event = "attack_push",
			attack_template = "basic_sweep_push",
			charge_value = "action_push",
			damage_profile_inner = "medium_push",
			damage_profile_outer = "light_push",
			damage_window_end = 0.2,
			damage_window_start = 0.05,
			dedicated_target_range = 2,
			hit_effect = "melee_hit_hammers_1h",
			impact_sound_event = "slashing_hit",
			kind = "push_stagger",
			no_damage_impact_sound_event = "slashing_hit_armour",
			outer_push_angle = 180,
			push_angle = 100,
			total_time = 0.8,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					end_time = 0.2,
					external_multiplier = 1.25,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					input = "action_one",
					release_required = "action_two_hold",
					start_time = 0.3,
					sub_action = "default",
				},
				{
					action = "action_one",
					doubleclick_window = 0,
					input = "action_one_hold",
					release_required = "action_two_hold",
					start_time = 0.32,
					sub_action = "default",
				},
				{
					action = "action_one",
					doubleclick_window = 0,
					end_time = 0.8,
					input = "action_one_hold",
					start_time = 0.3,
					sub_action = "push_attack",
					hold_required = {
						"action_two_hold",
						"action_one_hold",
					},
				},
				{
					action = "action_two",
					input = "action_two_hold",
					send_buffer = true,
					start_time = 0.3,
					sub_action = "default",
				},
				{
					action = "action_three",
					input = "action_three",
					start_time = 0.3,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.4,
					sub_action = "default",
				},
			},
			push_radius = push_radius,
			chain_condition_func = function (attacker_unit, input_extension)
				local status_extension = ScriptUnit.extension(attacker_unit, "status_system")

				return not status_extension:fatigued()
			end,
		},
	},
	action_two = {
		default = {
			anim_end_event = "parry_finished",
			anim_event = "parry_pose",
			cooldown = 0.15,
			hold_input = "action_two_hold",
			kind = "block",
			minimum_hold_time = 0.2,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			enter_function = function (attacker_unit, input_extension, remaining_time)
				return input_extension:reset_release_input_with_delay(remaining_time)
			end,
			buff_data = {
				{
					buff_name = "planted_decrease_movement",
					external_multiplier = 0.6,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.2,
					sub_action = "default",
				},
				{
					action = "action_one",
					doubleclick_window = 0,
					input = "action_one",
					start_time = 0.2,
					sub_action = "push",
					hold_required = {
						"action_two_hold",
					},
				},
				{
					action = "action_one",
					doubleclick_window = 0,
					input = "action_one",
					release_required = "action_two_hold",
					start_time = 0.2,
					sub_action = "default",
				},
			},
		},
	},
	action_three = {
		default = {
			anim_end_event = "attack_finished_02",
			anim_event = "spell_pose",
			cooldown = 0.15,
			hold_input = "action_three_hold",
			initial_charge_delay = 0.25,
			kind = "book_charge",
			minimum_hold_time = 0.4,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			charge_speed = base_charge_speed,
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
					external_multiplier = 0.9,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					doubleclick_window = 0,
					input = "action_one",
					release_required = "action_two_hold",
					start_time = 0.2,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.2,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.2,
					sub_action = "default",
				},
			},
		},
	},
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield,
}
weapon_template.right_hand_unit = "units/weapons/player/wpn_wh_book_02/wpn_wh_book_02"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.book.right
weapon_template.left_hand_unit = "units/weapons/player/wpn_empire_short_sword/wpn_empire_short_sword"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.left
weapon_template.display_unit = "units/weapons/weapon_display/display_hammer_book"
weapon_template.wield_anim = "to_1h_hammer_book"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/melee/1h_hammer_book"
weapon_template.buff_type = "MELEE_1H"
weapon_template.weapon_type = "MACE_1H"
weapon_template.max_fatigue_points = 6
weapon_template.dodge_count = 3
weapon_template.block_angle = 90
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.5
weapon_template.outer_block_fatigue_point_multiplier = 2
weapon_template.sound_event_block_within_arc = "weapon_foley_blunt_1h_block_wood"
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.2,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.2,
	},
}
weapon_template.custom_data = {
	charge = 0,
}
weapon_template.attack_meta_data = {
	tap_attack = {
		arc = 0,
	},
	hold_attack = {
		arc = 1,
	},
}
weapon_template.dominant_left = true
weapon_template.aim_assist_settings = {
	base_multiplier = 0,
	effective_max_range = 4,
	max_range = 5,
	no_aim_input_multiplier = 0,
	vertical_only = true,
	breed_scalars = {
		skaven_clan_rat = 1,
		skaven_slave = 1,
		skaven_storm_vermin = 1,
	},
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 3,
		[DamageTypes.CLEAVE] = 0,
		[DamageTypes.SPEED] = 3,
		[DamageTypes.STAGGER] = 3,
		[DamageTypes.DAMAGE] = 4,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 5,
		[DamageTypes.CLEAVE] = 5,
		[DamageTypes.SPEED] = 0,
		[DamageTypes.STAGGER] = 5,
		[DamageTypes.DAMAGE] = 4,
	},
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_fast_attacks",
	"weapon_keyword_wide_sweeps",
	"weapon_keyword_crowd_control",
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "light_attack_left",
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "heavy_attack_left",
	},
}
weapon_template.tooltip_detail = {
	light = {
		action_name = "action_one",
		sub_action_name = "default",
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "default",
	},
	push = {
		action_name = "action_one",
		sub_action_name = "push",
	},
}
weapon_template.wwise_dep_right_hand = {
	"wwise/one_handed_hammers",
}

local one_handed_hammer_book_priest_preview = table.clone(weapon_template)

one_handed_hammer_book_priest_preview.left_hand_attachment_node_linking = AttachmentNodeLinking.book.left
one_handed_hammer_book_priest_preview.right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right
weapon_template.tooltip_special_action_description = "special_action_hammer_book"

return {
	one_handed_hammer_book_priest_template = weapon_template,
	one_handed_hammer_book_priest_preview_template = one_handed_hammer_book_priest_preview,
}
