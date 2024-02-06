﻿-- chunkname: @dialogues/generated/conversations_prologue.lua

return function ()
	define_rule({
		name = "ecc_prologue_dialogue_answer_bang",
		response = "ecc_prologue_dialogue_answer_bang",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"ecc_prologue_dialogue_answer_bang",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_champion",
			},
		},
	})
	define_rule({
		name = "ecc_prologue_dialogue_answer_lack_of_patience",
		response = "ecc_prologue_dialogue_answer_lack_of_patience",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"ecc_prologue_dialogue_answer_lack_of_patience",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_champion",
			},
		},
	})
	define_rule({
		name = "egs_level_prologue_skittergate_distance_01",
		response = "egs_level_prologue_skittergate_distance_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"egs_level_prologue_skittergate_distance_01",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer",
			},
		},
	})
	define_rule({
		name = "egs_level_prologue_skittergate_distance_02",
		response = "egs_level_prologue_skittergate_distance_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"egs_level_prologue_skittergate_distance_02",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer",
			},
		},
	})
	define_rule({
		name = "egs_level_prologue_skittergate_distance_03",
		response = "egs_level_prologue_skittergate_distance_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"egs_level_prologue_skittergate_distance_03",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer",
			},
		},
	})
	define_rule({
		name = "egs_prologue_dialogue_bang",
		response = "egs_prologue_dialogue_bang",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"egs_prologue_dialogue_bang",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer",
			},
		},
	})
	define_rule({
		name = "egs_prologue_dialogue_excuse",
		response = "egs_prologue_dialogue_excuse",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"egs_prologue_dialogue_excuse",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer",
			},
		},
	})
	define_rule({
		name = "egs_prologue_intro_from_far",
		response = "egs_prologue_intro_from_far",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"egs_prologue_intro_from_far",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer",
			},
		},
	})
	define_rule({
		name = "egs_prologue_ranting_at_skavens",
		response = "egs_prologue_ranting_at_skavens",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"egs_prologue_ranting_at_skavens",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer",
			},
		},
	})
	define_rule({
		name = "nfl_prologue_intro_a",
		response = "nfl_prologue_intro_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_level_prologue_hello_kruber_01",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady",
			},
		},
	})
	define_rule({
		name = "nfl_prologue_intro_c",
		response = "nfl_prologue_intro_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_level_prologue_hello_kruber_02",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady",
			},
			{
				"user_memory",
				"nfl_level_prologue_hello_kruber_02",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"nfl_level_prologue_hello_kruber_02",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nfl_prologue_intro_e",
		response = "nfl_prologue_intro_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_level_prologue_hello_kruber_03",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady",
			},
		},
	})
	define_rule({
		name = "nfl_prologue_portal_e",
		response = "nfl_prologue_portal_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nfl_prologue_portal_e",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady",
			},
		},
	})
	define_rule({
		name = "pbw_level_prologue_elevator_ride_sienna",
		response = "pbw_level_prologue_elevator_ride_sienna",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_prologue_elevator_ride_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_level_prologue_elevator_ride_sienna_02",
		response = "pbw_level_prologue_elevator_ride_sienna_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_prologue_elevator_ride_bardin",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_level_prologue_reached_surface_sienna",
		response = "pbw_level_prologue_reached_surface_sienna",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_ prologue_reached_surface_kerillian",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_level_prologue_seeing_crater_sienna",
		response = "pbw_level_prologue_seeing_crater_sienna",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_prologue_seeing_crater_kruber",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_level_prologue_sienna_up_01",
		response = "pbw_level_prologue_sienna_up_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_prologue_sienna_up",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_level_prologue_skittergate_afar_01",
		response = "pbw_level_prologue_skittergate_afar_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_prologue_skittergate_afar",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pdr_level_prologue_bardin_fallling_01",
		response = "pdr_level_prologue_bardin_fallling_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"prologue_bardin_fallling",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_level_prologue_bardin_passing_one_00",
		response = "pdr_level_prologue_bardin_passing_one_00",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_level_prologue_bardin_passing_one_00",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_memory",
				"pdr_level_prologue_bardin_passing_one_00",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"pdr_level_prologue_bardin_passing_one_00",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_prologue_bardin_passing_one_bardin_01",
		response = "pdr_level_prologue_bardin_passing_one_bardin_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_level_prologue_bardin_passing_one_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_memory",
				"pdr_level_prologue_bardin_passing_one_bardin_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"pdr_level_prologue_bardin_passing_one_bardin_01",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_prologue_bardin_passing_two_01",
		response = "pdr_level_prologue_bardin_passing_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_level_prologue_bardin_passing_two_01",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_memory",
				"pdr_level_prologue_bardin_passing_two_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"pdr_level_prologue_bardin_passing_two_02",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_prologue_bardin_passing_two_02",
		response = "pdr_level_prologue_bardin_passing_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_level_prologue_bardin_passing_two_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_level_prologue_elevator_ride_01",
		response = "pdr_level_prologue_elevator_ride_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_prologue_elevator_ride",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_level_prologue_elevator_ride_bardin",
		response = "pdr_level_prologue_elevator_ride_bardin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_prologue_elevator_ride_kerillian",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_level_prologue_freeing_bardin_01",
		response = "pdr_level_prologue_freeing_bardin_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"pdr_level_prologue_freeing_bardin",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_level_prologue_reached_surface_02",
		response = "pdr_level_prologue_reached_surface_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_ prologue_reached_surface_sienna",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_level_prologue_reached_surface_bardin",
		response = "pdr_level_prologue_reached_surface_bardin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_prologue_reached_surface",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_level_prologue_seeing_crater_01",
		response = "pdr_level_prologue_seeing_crater_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_ prologue_seeing_crater_kerillian",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_level_prologue_wizard_down_b",
		response = "pdr_level_prologue_wizard_down_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_prologue_wizard_down_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_prologue_bardin_dazed_01",
		response = "pdr_prologue_bardin_dazed_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"prologue_bardin_dazed",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_prologue_bardin_healed_01",
		response = "pdr_prologue_bardin_healed_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"prologue_bardin_healed",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_prologue_bardin_revived_01",
		response = "pdr_prologue_bardin_revived_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"prologue_bardin_revived",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_prologue_gate_opens_01",
		response = "pdr_prologue_gate_opens_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"prologue_gate_opens_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_prologue_heal_bardin_01",
		response = "pdr_prologue_heal_bardin_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"prologue_heal_bardin",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_prologue_heal_bardin_take_time_02",
		response = "pdr_prologue_heal_bardin_take_time_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"prologue_heal_bardin_kruber_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_prologue_kerillian_fight_01",
		response = "pdr_prologue_kerillian_fight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"prologue_kerillian_fight_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_prologue_meeting_kerillian_01",
		response = "pdr_prologue_meeting_kerillian_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"prologue_meeting_kerillian_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_prologue_portal_bardin",
		response = "pdr_prologue_portal_bardin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"prologue_portal",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_ability",
		response = "pes_level_prologue_ability",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"pes_level_prologue_ability",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_bardin_fallling_01",
		response = "pes_level_prologue_bardin_fallling_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_prologue_bardin_fallling_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_bardin_passing_one_01",
		response = "pes_level_prologue_bardin_passing_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pes_level_prologue_bardin_passing_one_01",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_memory",
				"pes_level_prologue_bardin_passing_one_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"pes_level_prologue_bardin_passing_one_01",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_bardin_passing_one_02",
		response = "pes_level_prologue_bardin_passing_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pes_level_prologue_bardin_passing_one_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_memory",
				"pes_level_prologue_bardin_passing_one_02",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"pes_level_prologue_bardin_passing_one_02",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_bardin_passing_two_03",
		response = "pes_level_prologue_bardin_passing_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pes_level_prologue_bardin_passing_two_03",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_bardin_passing_two_kruber_01",
		response = "pes_level_prologue_bardin_passing_two_kruber_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pes_level_prologue_bardin_passing_two_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_block",
		response = "pes_level_prologue_block",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"pes_level_prologue_block",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_cage_fall",
		response = "pes_level_prologue_cage_fall",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"pes_level_prologue_cage_fall",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_cage_land",
		response = "pes_level_prologue_cage_land",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"pes_level_prologue_cage_land",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_cage_see_weapon",
		response = "pes_level_prologue_cage_see_weapon",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"pes_level_prologue_cage_see_weapon",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_dodge",
		response = "pes_level_prologue_dodge",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"pes_level_prologue_dodge",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_elevator_ride",
		response = "pes_level_prologue_elevator_ride",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"prologue_elevator_ride",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_elevator_ride_02",
		response = "pes_level_prologue_elevator_ride_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_prologue_elevator_ride_sienna",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_elevator_ride_03",
		response = "pes_level_prologue_elevator_ride_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_prologue_elevator_ride_kerillian_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_fighting_pit",
		response = "pes_level_prologue_fighting_pit",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"pes_level_prologue_fighting_pit",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_fighting_pit_fight",
		response = "pes_level_prologue_fighting_pit_fight",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"pes_level_prologue_fighting_pit_fight",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_first_payback",
		response = "pes_level_prologue_first_payback",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"pes_level_prologue_first_payback",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_freeing_bardin_01",
		response = "pes_level_prologue_freeing_bardin_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"pes_level_prologue_freeing_bardin",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_got_bow",
		response = "pes_level_prologue_got_bow",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"pes_level_prologue_got_bow",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_grab_weapon",
		response = "pes_level_prologue_grab_weapon",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"pes_level_prologue_grab_weapon",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_reached_surface",
		response = "pes_level_prologue_reached_surface",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"prologue_reached_surface",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_seeing_crater_kruber",
		response = "pes_level_prologue_seeing_crater_kruber",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"prologue_seeing_crater",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_sienna_up",
		response = "pes_level_prologue_sienna_up",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"prologue_sienna_up",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_skittergate_afar",
		response = "pes_level_prologue_skittergate_afar",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"prologue_skittergate_afar",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_strong",
		response = "pes_level_prologue_strong",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"pes_level_prologue_strong",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_supply",
		response = "pes_level_prologue_supply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"pes_level_prologue_supply",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_travel",
		response = "pes_level_prologue_travel",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"pes_level_prologue_travel",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_waking_up",
		response = "pes_level_prologue_waking_up",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"pes_level_prologue_waking_up",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_wizard_down_a",
		response = "pes_level_prologue_wizard_down_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"prologue_wizard_down_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_level_prologue_wizard_sound",
		response = "pes_level_prologue_wizard_sound",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"prologue_wizard_sound",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_prologue_bardin_dazed_01",
		response = "pes_prologue_bardin_dazed_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"prologue_bardin_dazed_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_prologue_bardin_healed_01",
		response = "pes_prologue_bardin_healed_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"prologue_bardin_healed_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_prologue_bardin_revived_01",
		response = "pes_prologue_bardin_revived_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"prologue_bardin_revived_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_prologue_gate_opens_01",
		response = "pes_prologue_gate_opens_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"prologue_gate_opens",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_prologue_heal_bardin_kruber_01",
		response = "pes_prologue_heal_bardin_kruber_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"prologue_heal_bardin_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_prologue_intro_b",
		response = "pes_prologue_intro_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pes_level_prologue_hello_kruber_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_prologue_intro_d",
		response = "pes_prologue_intro_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pes_level_prologue_hello_kruber_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_prologue_intro_f",
		response = "pes_prologue_intro_f",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pes_level_prologue_hello_kruber_03",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_prologue_kerillian_fight_01",
		response = "pes_prologue_kerillian_fight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"prologue_kerillian_fight",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_prologue_meeting_kerillian_01",
		response = "pes_prologue_meeting_kerillian_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"prologue_meeting_kerillian",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_memory",
				"prologue_meeting_kerillian",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"prologue_meeting_kerillian",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_prologue_meeting_kerillian_02",
		response = "pes_prologue_meeting_kerillian_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"prologue_meeting_kerillian_kerillian_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_memory",
				"prologue_meeting_kerillian_kerillian_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"prologue_meeting_kerillian_kerillian_01",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_prologue_portal_kruber",
		response = "pes_prologue_portal_kruber",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"prologue_portal_kerillian",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pwe_level_prologue_elevator_ride_kerillian",
		response = "pwe_level_prologue_elevator_ride_kerillian",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_prologue_elevator_ride_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_level_prologue_elevator_ride_kerillian_02",
		response = "pwe_level_prologue_elevator_ride_kerillian_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_prologue_elevator_ride_sienna_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_level_prologue_reached_surface_kerillian",
		response = "pwe_level_prologue_reached_surface_kerillian",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_ prologue_reached_surface_bardin",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_level_prologue_seeing_crater_kerillian",
		response = "pwe_level_prologue_seeing_crater_kerillian",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_ prologue_seeing_crater_sienna",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_level_prologue_sienna_up_01",
		response = "pwe_level_prologue_sienna_up_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_prologue_sienna_up_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_level_prologue_skittergate_afar_01",
		response = "pwe_level_prologue_skittergate_afar_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_prologue_skittergate_afar_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_level_prologue_wizard_sound",
		response = "pwe_level_prologue_wizard_sound",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_prologue_wizard_sound",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_prologue_kerillian_fight_01",
		response = "pwe_prologue_kerillian_fight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"pwe_prologue_kerillian_fight",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_prologue_meeting_kerillian_02",
		response = "pwe_prologue_meeting_kerillian_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"prologue_meeting_kerillian_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_prologue_meeting_kerillian_kerillian_01",
		response = "pwe_prologue_meeting_kerillian_kerillian_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"prologue_meeting_kerillian_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_memory",
				"prologue_meeting_kerillian_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"prologue_meeting_kerillian_01",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_prologue_portal_kerillian",
		response = "pwe_prologue_portal_kerillian",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"prologue_portal_salty",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwh_prologue_portal",
		response = "pwh_prologue_portal",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"prologue_portal",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_prologue_portal_salty",
		response = "pwh_prologue_portal_salty",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"prologue_portal_bardin",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_prologue_portal_salty_02",
		response = "pwh_prologue_portal_salty_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"prologue_portal_kruber",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	add_dialogues({
		ecc_prologue_dialogue_answer_bang = {
			category = "cut_scene_interrupt",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "ecc_prologue_dialogue_answer_bang",
			},
			sound_events = {
				[1] = "ecc_prologue_dialogue_answer_bang",
			},
			sound_events_duration = {
				[1] = 8.6133337020874,
			},
		},
		ecc_prologue_dialogue_answer_lack_of_patience = {
			category = "cut_scene_interrupt_three",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "ecc_prologue_dialogue_answer_lack_of_patience",
			},
			sound_events = {
				[1] = "ecc_prologue_dialogue_answer_lack_of_patience",
			},
			sound_events_duration = {
				[1] = 8.446249961853,
			},
		},
		egs_level_prologue_skittergate_distance_01 = {
			category = "cut_scene",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "egs_level_prologue_skittergate_distance_01",
			},
			sound_events = {
				[1] = "egs_level_prologue_skittergate_distance_01",
			},
			sound_events_duration = {
				[1] = 14.541291236877,
			},
		},
		egs_level_prologue_skittergate_distance_02 = {
			category = "cut_scene",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "egs_level_prologue_skittergate_distance_02",
			},
			sound_events = {
				[1] = "egs_level_prologue_skittergate_distance_02",
			},
			sound_events_duration = {
				[1] = 9.0010204315185,
			},
		},
		egs_level_prologue_skittergate_distance_03 = {
			category = "cut_scene",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "egs_level_prologue_skittergate_distance_03",
			},
			sound_events = {
				[1] = "egs_level_prologue_skittergate_distance_03",
			},
			sound_events_duration = {
				[1] = 9.9780626296997,
			},
		},
		egs_prologue_dialogue_bang = {
			category = "cut_scene",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "egs_prologue_dialogue_bang",
			},
			sound_events = {
				[1] = "egs_prologue_dialogue_bang",
			},
			sound_events_duration = {
				[1] = 16.003479003906,
			},
		},
		egs_prologue_dialogue_excuse = {
			category = "cut_scene_interrupt_two",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "egs_prologue_dialogue_excuse",
			},
			sound_events = {
				[1] = "egs_prologue_dialogue_excuse",
			},
			sound_events_duration = {
				[1] = 20.32356262207,
			},
		},
		egs_prologue_intro_from_far = {
			category = "cut_scene",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "egs_prologue_intro_from_far",
			},
			sound_events = {
				[1] = "egs_prologue_intro_from_far",
			},
			sound_events_duration = {
				[1] = 4.3193960189819,
			},
		},
		egs_prologue_ranting_at_skavens = {
			category = "cut_scene",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "egs_prologue_ranting_at_skavens",
			},
			sound_events = {
				[1] = "egs_prologue_ranting_at_skavens",
			},
			sound_events_duration = {
				[1] = 12.173500061035,
			},
		},
		nfl_prologue_intro_a = {
			category = "level_talk_tutorial_interrupt",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "nfl_level_prologue_hello_kruber_01",
			},
			sound_events = {
				[1] = "nfl_level_prologue_hello_kruber_01",
			},
			sound_events_duration = {
				[1] = 9.2159366607666,
			},
		},
		nfl_prologue_intro_c = {
			category = "level_talk_tutorial_interrupt",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "nfl_level_prologue_hello_kruber_02",
			},
			sound_events = {
				[1] = "nfl_level_prologue_hello_kruber_02",
			},
			sound_events_duration = {
				[1] = 7.8903183937073,
			},
		},
		nfl_prologue_intro_e = {
			category = "cut_scene",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "nfl_level_prologue_hello_kruber_03",
			},
			sound_events = {
				[1] = "nfl_level_prologue_hello_kruber_03",
			},
			sound_events_duration = {
				[1] = 9.2870206832886,
			},
		},
		nfl_prologue_portal_e = {
			category = "npc_talk_interrupt_special",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "nfl_prologue_portal_e_01",
			},
			sound_events = {
				[1] = "nfl_prologue_portal_e_01",
			},
			sound_events_duration = {
				[1] = 8.1883335113525,
			},
		},
		pbw_level_prologue_elevator_ride_sienna = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pbw_level_prologue_elevator_ride_01",
			},
			sound_events = {
				[1] = "pbw_level_prologue_elevator_ride_01",
			},
			sound_events_duration = {
				[1] = 6.2999167442322,
			},
		},
		pbw_level_prologue_elevator_ride_sienna_02 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pbw_level_prologue_elevator_ride_02",
			},
			sound_events = {
				[1] = "pbw_level_prologue_elevator_ride_02",
			},
			sound_events_duration = {
				[1] = 11.840250015259,
			},
		},
		pbw_level_prologue_reached_surface_sienna = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pbw_level_prologue_reached_surface_01",
			},
			sound_events = {
				[1] = "pbw_level_prologue_reached_surface_01",
			},
			sound_events_duration = {
				[1] = 5.0113124847412,
			},
		},
		pbw_level_prologue_seeing_crater_sienna = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pbw_level_prologue_seeing_crater_01",
			},
			sound_events = {
				[1] = "pbw_level_prologue_seeing_crater_01",
			},
			sound_events_duration = {
				[1] = 9.379958152771,
			},
		},
		pbw_level_prologue_sienna_up_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pbw_level_prologue_sienna_up_01",
			},
			sound_events = {
				[1] = "pbw_level_prologue_sienna_up_01",
			},
			sound_events_duration = {
				[1] = 5.0703959465027,
			},
		},
		pbw_level_prologue_skittergate_afar_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pbw_level_prologue_skittergate_afar_01",
			},
			sound_events = {
				[1] = "pbw_level_prologue_skittergate_afar_01",
			},
			sound_events_duration = {
				[1] = 4.4172291755676,
			},
		},
		pdr_level_prologue_bardin_fallling_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 50,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pdr_level_prologue_bardin_fallling_01",
			},
			sound_events = {
				[1] = "pdr_level_prologue_bardin_fallling_01",
			},
			sound_events_duration = {
				[1] = 3.8199999332428,
			},
		},
		pdr_level_prologue_bardin_passing_one_00 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pdr_level_prologue_bardin_passing_one_00",
			},
			sound_events = {
				[1] = "pdr_level_prologue_bardin_passing_one_00",
			},
			sound_events_duration = {
				[1] = 13.418250083923,
			},
		},
		pdr_level_prologue_bardin_passing_one_bardin_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
			},
			localization_strings = {
				[1] = "pdr_level_prologue_bardin_passing_one_01",
			},
			sound_events = {
				[1] = "pdr_level_prologue_bardin_passing_one_01",
			},
			sound_events_duration = {
				[1] = 4.1193957328796,
			},
		},
		pdr_level_prologue_bardin_passing_two_01 = {
			category = "level_talk_tutorial_interrupt",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pdr_level_prologue_bardin_passing_two_01",
			},
			sound_events = {
				[1] = "pdr_level_prologue_bardin_passing_two_01",
			},
			sound_events_duration = {
				[1] = 17.759729385376,
			},
		},
		pdr_level_prologue_bardin_passing_two_02 = {
			category = "level_talk_tutorial_interrupt",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
			},
			localization_strings = {
				[1] = "pdr_level_prologue_bardin_passing_two_02",
			},
			sound_events = {
				[1] = "pdr_level_prologue_bardin_passing_two_02",
			},
			sound_events_duration = {
				[1] = 6.2269167900085,
			},
		},
		pdr_level_prologue_elevator_ride_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pdr_level_prologue_elevator_ride_01",
			},
			sound_events = {
				[1] = "pdr_level_prologue_elevator_ride_01",
			},
			sound_events_duration = {
				[1] = 6.8732085227966,
			},
		},
		pdr_level_prologue_elevator_ride_bardin = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pdr_level_prologue_elevator_ride_02",
			},
			sound_events = {
				[1] = "pdr_level_prologue_elevator_ride_02",
			},
			sound_events_duration = {
				[1] = 6.1547708511353,
			},
		},
		pdr_level_prologue_freeing_bardin_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pdr_level_prologue_freeing_bardin_01",
			},
			sound_events = {
				[1] = "pdr_level_prologue_freeing_bardin_01",
			},
			sound_events_duration = {
				[1] = 2.2649166584015,
			},
		},
		pdr_level_prologue_reached_surface_02 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pdr_level_prologue_reached_surface_02",
			},
			sound_events = {
				[1] = "pdr_level_prologue_reached_surface_02",
			},
			sound_events_duration = {
				[1] = 5.3247289657593,
			},
		},
		pdr_level_prologue_reached_surface_bardin = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pdr_level_prologue_reached_surface_01",
			},
			sound_events = {
				[1] = "pdr_level_prologue_reached_surface_01",
			},
			sound_events_duration = {
				[1] = 6.8339791297913,
			},
		},
		pdr_level_prologue_seeing_crater_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pdr_level_prologue_seeing_crater_01",
			},
			sound_events = {
				[1] = "pdr_level_prologue_seeing_crater_01",
			},
			sound_events_duration = {
				[1] = 7.5956249237061,
			},
		},
		pdr_level_prologue_wizard_down_b = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pdr_level_prologue_wizard_down_b_01",
			},
			sound_events = {
				[1] = "pdr_level_prologue_wizard_down_b_01",
			},
			sound_events_duration = {
				[1] = 3.4416666030884,
			},
		},
		pdr_prologue_bardin_dazed_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pdr_prologue_bardin_dazed_01",
			},
			sound_events = {
				[1] = "pdr_prologue_bardin_dazed_01",
			},
			sound_events_duration = {
				[1] = 4.7509164810181,
			},
		},
		pdr_prologue_bardin_healed_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pdr_prologue_bardin_healed_01",
			},
			sound_events = {
				[1] = "pdr_prologue_bardin_healed_01",
			},
			sound_events_duration = {
				[1] = 6.7281250953674,
			},
		},
		pdr_prologue_bardin_revived_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pdr_prologue_bardin_revived_01",
			},
			sound_events = {
				[1] = "pdr_prologue_bardin_revived_01",
			},
			sound_events_duration = {
				[1] = 5.1767916679382,
			},
		},
		pdr_prologue_gate_opens_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pdr_prologue_gate_opens_01",
			},
			sound_events = {
				[1] = "pdr_prologue_gate_opens_01",
			},
			sound_events_duration = {
				[1] = 3.3783540725708,
			},
		},
		pdr_prologue_heal_bardin_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pdr_prologue_heal_bardin_01",
			},
			sound_events = {
				[1] = "pdr_prologue_heal_bardin_01",
			},
			sound_events_duration = {
				[1] = 2.7736248970032,
			},
		},
		pdr_prologue_heal_bardin_take_time_02 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pdr_prologue_heal_bardin_take_time_02",
			},
			sound_events = {
				[1] = "pdr_prologue_heal_bardin_take_time_02",
			},
			sound_events_duration = {
				[1] = 2.5300209522247,
			},
		},
		pdr_prologue_kerillian_fight_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pdr_prologue_kerillian_fight_01",
			},
			sound_events = {
				[1] = "pdr_prologue_kerillian_fight_01",
			},
			sound_events_duration = {
				[1] = 2.2952499389648,
			},
		},
		pdr_prologue_meeting_kerillian_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pdr_prologue_meeting_kerillian_01",
			},
			sound_events = {
				[1] = "pdr_prologue_meeting_kerillian_01",
			},
			sound_events_duration = {
				[1] = 4.344687461853,
			},
		},
		pdr_prologue_portal_bardin = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 50,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pdr_prologue_portal_01",
			},
			sound_events = {
				[1] = "pdr_prologue_portal_01",
			},
			sound_events_duration = {
				[1] = 5.1975626945496,
			},
		},
		pes_level_prologue_ability = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_angry",
				[2] = "face_angry",
			},
			localization_strings = {
				[1] = "pes_level_prologue_ability_01",
				[2] = "pes_level_prologue_ability_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_prologue_ability_01",
				[2] = "pes_level_prologue_ability_02",
			},
			sound_events_duration = {
				[1] = 2.0712916851044,
				[2] = 1.6363749504089,
			},
		},
		pes_level_prologue_bardin_fallling_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pes_level_prologue_bardin_fallling_01",
			},
			sound_events = {
				[1] = "pes_level_prologue_bardin_fallling_01",
			},
			sound_events_duration = {
				[1] = 1.1619583368301,
			},
		},
		pes_level_prologue_bardin_passing_one_01 = {
			category = "level_talk_tutorial_interrupt",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_level_prologue_bardin_passing_one_01",
			},
			sound_events = {
				[1] = "pes_level_prologue_bardin_passing_one_01",
			},
			sound_events_duration = {
				[1] = 2.8150625228882,
			},
		},
		pes_level_prologue_bardin_passing_one_02 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_level_prologue_bardin_passing_one_02",
			},
			sound_events = {
				[1] = "pes_level_prologue_bardin_passing_one_02",
			},
			sound_events_duration = {
				[1] = 3.1177084445953,
			},
		},
		pes_level_prologue_bardin_passing_two_03 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_level_prologue_bardin_passing_two_03",
			},
			sound_events = {
				[1] = "pes_level_prologue_bardin_passing_two_03",
			},
			sound_events_duration = {
				[1] = 2.7523124217987,
			},
		},
		pes_level_prologue_bardin_passing_two_kruber_01 = {
			category = "level_talk_tutorial_interrupt",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_level_prologue_bardin_passing_two_01",
			},
			sound_events = {
				[1] = "pes_level_prologue_bardin_passing_two_01",
			},
			sound_events_duration = {
				[1] = 2.9927916526794,
			},
		},
		pes_level_prologue_block = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_angry",
				[2] = "face_angry",
			},
			localization_strings = {
				[1] = "pes_level_prologue_block_01",
				[2] = "pes_level_prologue_block_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_prologue_block_01",
				[2] = "pes_level_prologue_block_02",
			},
			sound_events_duration = {
				[1] = 1.3343125581741,
				[2] = 3.5953540802002,
			},
		},
		pes_level_prologue_cage_fall = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_level_prologue_cage_fall_01",
			},
			sound_events = {
				[1] = "pes_level_prologue_cage_fall_01",
			},
			sound_events_duration = {
				[1] = 1.9939583539963,
			},
		},
		pes_level_prologue_cage_land = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_level_prologue_cage_land_01",
			},
			sound_events = {
				[1] = "pes_level_prologue_cage_land_01",
			},
			sound_events_duration = {
				[1] = 2.1853125095367,
			},
		},
		pes_level_prologue_cage_see_weapon = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pes_level_prologue_cage_see_weapon_01",
			},
			sound_events = {
				[1] = "pes_level_prologue_cage_see_weapon_01",
			},
			sound_events_duration = {
				[1] = 3.237583398819,
			},
		},
		pes_level_prologue_dodge = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_angry",
				[2] = "face_angry",
			},
			localization_strings = {
				[1] = "pes_level_prologue_dodge_01",
				[2] = "pes_level_prologue_dodge_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_prologue_dodge_01",
				[2] = "pes_level_prologue_dodge_02",
			},
			sound_events_duration = {
				[1] = 3.8727083206177,
				[2] = 3.2869167327881,
			},
		},
		pes_level_prologue_elevator_ride = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pes_level_prologue_elevator_ride_01",
			},
			sound_events = {
				[1] = "pes_level_prologue_elevator_ride_01",
			},
			sound_events_duration = {
				[1] = 8.6504583358765,
			},
		},
		pes_level_prologue_elevator_ride_02 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pes_level_prologue_elevator_ride_02",
			},
			sound_events = {
				[1] = "pes_level_prologue_elevator_ride_02",
			},
			sound_events_duration = {
				[1] = 9.2886877059937,
			},
		},
		pes_level_prologue_elevator_ride_03 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pes_level_prologue_elevator_ride_03",
			},
			sound_events = {
				[1] = "pes_level_prologue_elevator_ride_03",
			},
			sound_events_duration = {
				[1] = 3.9552500247955,
			},
		},
		pes_level_prologue_fighting_pit = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pes_level_prologue_fighting_pit_01",
			},
			sound_events = {
				[1] = "pes_level_prologue_fighting_pit_01",
			},
			sound_events_duration = {
				[1] = 2.1856458187103,
			},
		},
		pes_level_prologue_fighting_pit_fight = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			randomize_indexes_n = 0,
			sound_events_n = 3,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
			},
			localization_strings = {
				"pes_level_prologue_fighting_pit_02",
				"pes_level_prologue_fighting_pit_03",
				"pes_level_prologue_fighting_pit_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_prologue_fighting_pit_02",
				"pes_level_prologue_fighting_pit_03",
				"pes_level_prologue_fighting_pit_04",
			},
			sound_events_duration = {
				3.6084582805634,
				4.198145866394,
				3.7627770900726,
			},
		},
		pes_level_prologue_first_payback = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pes_level_prologue_first_payback_01",
			},
			sound_events = {
				[1] = "pes_level_prologue_first_payback_01",
			},
			sound_events_duration = {
				[1] = 2.3966875076294,
			},
		},
		pes_level_prologue_freeing_bardin_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pes_level_prologue_freeing_bardin_01",
			},
			sound_events = {
				[1] = "pes_level_prologue_freeing_bardin_01",
			},
			sound_events_duration = {
				[1] = 1.7888749837875,
			},
		},
		pes_level_prologue_got_bow = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pes_level_prologue_got_bow_01",
			},
			sound_events = {
				[1] = "pes_level_prologue_got_bow_01",
			},
			sound_events_duration = {
				[1] = 3.1498749256134,
			},
		},
		pes_level_prologue_grab_weapon = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pes_level_prologue_grab_weapon_01",
			},
			sound_events = {
				[1] = "pes_level_prologue_grab_weapon_01",
			},
			sound_events_duration = {
				[1] = 1.9700833559036,
			},
		},
		pes_level_prologue_reached_surface = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pes_level_prologue_reached_surface_01",
			},
			sound_events = {
				[1] = "pes_level_prologue_reached_surface_01",
			},
			sound_events_duration = {
				[1] = 4.7840418815613,
			},
		},
		pes_level_prologue_seeing_crater_kruber = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pes_level_prologue_seeing_crater_01",
			},
			sound_events = {
				[1] = "pes_level_prologue_seeing_crater_01",
			},
			sound_events_duration = {
				[1] = 7.51016664505,
			},
		},
		pes_level_prologue_sienna_up = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 50,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pes_level_prologue_sienna_up_01",
			},
			sound_events = {
				[1] = "pes_level_prologue_sienna_up_01",
			},
			sound_events_duration = {
				[1] = 2.6450834274292,
			},
		},
		pes_level_prologue_skittergate_afar = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pes_level_prologue_skittergate_afar_01",
			},
			sound_events = {
				[1] = "pes_level_prologue_skittergate_afar_01",
			},
			sound_events_duration = {
				[1] = 4.183958530426,
			},
		},
		pes_level_prologue_strong = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_angry",
				[2] = "face_angry",
			},
			localization_strings = {
				[1] = "pes_level_prologue_strong_01",
				[2] = "pes_level_prologue_strong_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_prologue_strong_01",
				[2] = "pes_level_prologue_strong_02",
			},
			sound_events_duration = {
				[1] = 4.4305000305176,
				[2] = 2.9029166698456,
			},
		},
		pes_level_prologue_supply = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_angry",
				[2] = "face_angry",
			},
			localization_strings = {
				[1] = "pes_level_prologue_supply_01",
				[2] = "pes_level_prologue_supply_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_prologue_supply_01",
				[2] = "pes_level_prologue_supply_02",
			},
			sound_events_duration = {
				[1] = 4.5100626945496,
				[2] = 2.3755624294281,
			},
		},
		pes_level_prologue_travel = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_level_prologue_travel_01",
				[2] = "pes_level_prologue_travel_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_prologue_travel_01",
				[2] = "pes_level_prologue_travel_02",
			},
			sound_events_duration = {
				[1] = 3.3963124752045,
				[2] = 3.7355833053589,
			},
		},
		pes_level_prologue_waking_up = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_level_prologue_waking_up_01",
				[2] = "pes_level_prologue_waking_up_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_prologue_waking_up_01",
				[2] = "pes_level_prologue_waking_up_02",
			},
			sound_events_duration = {
				[1] = 3.4113750457764,
				[2] = 2.4771041870117,
			},
		},
		pes_level_prologue_wizard_down_a = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 50,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pes_level_prologue_wizard_down_a_01",
			},
			sound_events = {
				[1] = "pes_level_prologue_wizard_down_a_01",
			},
			sound_events_duration = {
				[1] = 0.72579169273376,
			},
		},
		pes_level_prologue_wizard_sound = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 50,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pes_level_prologue_wizard_sound_01",
			},
			sound_events = {
				[1] = "pes_level_prologue_wizard_sound_01",
			},
			sound_events_duration = {
				[1] = 4.0069375038147,
			},
		},
		pes_prologue_bardin_dazed_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pes_prologue_bardin_dazed_01",
			},
			sound_events = {
				[1] = "pes_prologue_bardin_dazed_01",
			},
			sound_events_duration = {
				[1] = 2.0529999732971,
			},
		},
		pes_prologue_bardin_healed_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pes_prologue_bardin_healed_01",
			},
			sound_events = {
				[1] = "pes_prologue_bardin_healed_01",
			},
			sound_events_duration = {
				[1] = 1.7419583797455,
			},
		},
		pes_prologue_bardin_revived_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pes_prologue_bardin_revived_01",
			},
			sound_events = {
				[1] = "pes_prologue_bardin_revived_01",
			},
			sound_events_duration = {
				[1] = 2.745854139328,
			},
		},
		pes_prologue_gate_opens_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pes_prologue_gate_opens_01",
			},
			sound_events = {
				[1] = "pes_prologue_gate_opens_01",
			},
			sound_events_duration = {
				[1] = 2.8380000591278,
			},
		},
		pes_prologue_heal_bardin_kruber_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pes_prologue_heal_bardin_01",
			},
			sound_events = {
				[1] = "pes_prologue_heal_bardin_01",
			},
			sound_events_duration = {
				[1] = 3.1837499141693,
			},
		},
		pes_prologue_intro_b = {
			category = "level_talk_tutorial_interrupt",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_level_prologue_hello_kruber_01",
			},
			sound_events = {
				[1] = "pes_level_prologue_hello_kruber_01",
			},
			sound_events_duration = {
				[1] = 2.0002193450928,
			},
		},
		pes_prologue_intro_d = {
			category = "level_talk_tutorial_interrupt",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_level_prologue_hello_kruber_02",
			},
			sound_events = {
				[1] = "pes_level_prologue_hello_kruber_02",
			},
			sound_events_duration = {
				[1] = 1.1038144826889,
			},
		},
		pes_prologue_intro_f = {
			category = "cut_scene",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_level_prologue_hello_kruber_03",
			},
			sound_events = {
				[1] = "pes_level_prologue_hello_kruber_03",
			},
			sound_events_duration = {
				[1] = 4.3787322044373,
			},
		},
		pes_prologue_kerillian_fight_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 50,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pes_prologue_kerillian_fight_01",
			},
			sound_events = {
				[1] = "pes_prologue_kerillian_fight_01",
			},
			sound_events_duration = {
				[1] = 2.4806041717529,
			},
		},
		pes_prologue_meeting_kerillian_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pes_prologue_meeting_kerillian_01",
			},
			sound_events = {
				[1] = "pes_prologue_meeting_kerillian_01",
			},
			sound_events_duration = {
				[1] = 3.5763750076294,
			},
		},
		pes_prologue_meeting_kerillian_02 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pes_prologue_meeting_kerillian_02",
			},
			sound_events = {
				[1] = "pes_prologue_meeting_kerillian_02",
			},
			sound_events_duration = {
				[1] = 1.478395819664,
			},
		},
		pes_prologue_portal_kruber = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pes_prologue_portal_01",
			},
			sound_events = {
				[1] = "pes_prologue_portal_01",
			},
			sound_events_duration = {
				[1] = 4.9087915420532,
			},
		},
		pwe_level_prologue_elevator_ride_kerillian = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pwe_level_prologue_elevator_ride_01",
			},
			sound_events = {
				[1] = "pwe_level_prologue_elevator_ride_01",
			},
			sound_events_duration = {
				[1] = 3.9253125190735,
			},
		},
		pwe_level_prologue_elevator_ride_kerillian_02 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pwe_level_prologue_elevator_ride_02",
			},
			sound_events = {
				[1] = "pwe_level_prologue_elevator_ride_02",
			},
			sound_events_duration = {
				[1] = 6.8933124542236,
			},
		},
		pwe_level_prologue_reached_surface_kerillian = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pwe_level_prologue_reached_surface_01",
			},
			sound_events = {
				[1] = "pwe_level_prologue_reached_surface_01",
			},
			sound_events_duration = {
				[1] = 4.7416458129883,
			},
		},
		pwe_level_prologue_seeing_crater_kerillian = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pwe_level_prologue_seeing_crater_01",
			},
			sound_events = {
				[1] = "pwe_level_prologue_seeing_crater_01",
			},
			sound_events_duration = {
				[1] = 8.842791557312,
			},
		},
		pwe_level_prologue_sienna_up_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pwe_level_prologue_sienna_up_01",
			},
			sound_events = {
				[1] = "pwe_level_prologue_sienna_up_01",
			},
			sound_events_duration = {
				[1] = 5.1095311641693,
			},
		},
		pwe_level_prologue_skittergate_afar_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pwe_level_prologue_skittergate_afar_01",
			},
			sound_events = {
				[1] = "pwe_level_prologue_skittergate_afar_01",
			},
			sound_events_duration = {
				[1] = 5.0440626144409,
			},
		},
		pwe_level_prologue_wizard_sound = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pwe_level_prologue_wizard_sound_01",
			},
			sound_events = {
				[1] = "pwe_level_prologue_wizard_sound_01",
			},
			sound_events_duration = {
				[1] = 1.2356250286102,
			},
		},
		pwe_prologue_kerillian_fight_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
				[2] = "face_contempt",
			},
			localization_strings = {
				[1] = "pwe_prologue_kerillian_fight_01",
				[2] = "pwe_prologue_kerillian_fight_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_prologue_kerillian_fight_01",
				[2] = "pwe_prologue_kerillian_fight_02",
			},
			sound_events_duration = {
				[1] = 1.8511250019074,
				[2] = 1.9170207977295,
			},
		},
		pwe_prologue_meeting_kerillian_02 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pwe_prologue_meeting_kerillian_02",
			},
			sound_events = {
				[1] = "pwe_prologue_meeting_kerillian_02",
			},
			sound_events_duration = {
				[1] = 1.8084374666214,
			},
		},
		pwe_prologue_meeting_kerillian_kerillian_01 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pwe_prologue_meeting_kerillian_01",
			},
			sound_events = {
				[1] = "pwe_prologue_meeting_kerillian_01",
			},
			sound_events_duration = {
				[1] = 6.4856457710266,
			},
		},
		pwe_prologue_portal_kerillian = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pwe_prologue_portal_01",
			},
			sound_events = {
				[1] = "pwe_prologue_portal_01",
			},
			sound_events_duration = {
				[1] = 10.520792007446,
			},
		},
		pwh_prologue_portal = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 50,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pwh_prologue_portal_01",
			},
			sound_events = {
				[1] = "pwh_prologue_portal_01",
			},
			sound_events_duration = {
				[1] = 6.1564168930054,
			},
		},
		pwh_prologue_portal_salty = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 50,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pwh_prologue_portal_02",
			},
			sound_events = {
				[1] = "pwh_prologue_portal_02",
			},
			sound_events_duration = {
				[1] = 6.9052710533142,
			},
		},
		pwh_prologue_portal_salty_02 = {
			category = "level_talk_tutorial",
			database = "conversations_prologue",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pwh_prologue_portal_02b",
			},
			sound_events = {
				[1] = "pwh_prologue_portal_02b",
			},
			sound_events_duration = {
				[1] = 9.0685625076294,
			},
		},
	})
end
