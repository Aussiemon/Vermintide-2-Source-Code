-- chunkname: @dialogues/generated/bright_wizard_dlc_wizards_tower.lua

return function ()
	define_rule({
		name = "pbw_enchantment_dummy_trigger",
		probability = 1,
		response = "pbw_enchantment_dummy_trigger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"horde",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"friends_distant",
				OP.GT,
				0,
			},
			{
				"user_context",
				"enemies_distant",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"wizard_tower_enchantment_horde",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_enchantment_horde",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_keep_climbing_dummy_trigger",
		probability = 1,
		response = "pbw_keep_climbing_dummy_trigger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_keep_climbing_dummy",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_test_subjects_dummy_trigger",
		probability = 1,
		response = "pbw_test_subjects_dummy_trigger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_test_subjects_dummy",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_wizard_tower_another_locked_door",
		probability = 1,
		response = "pbw_wizard_tower_another_locked_door",
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
				"wizard_tower_another_locked_door",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"wizard_tower_another_locked_door",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_another_locked_door",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_bones",
		probability = 1,
		response = "pbw_wizard_tower_bones",
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
				"wizard_tower_bones",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"faction_memory",
				"wizard_tower_bones",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_bones",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_brew",
		probability = 1,
		response = "pbw_wizard_tower_brew",
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
				"wizard_tower_brew",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"faction_memory",
				"wizard_tower_brew",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_brew",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_destroy_wards_b",
		probability = 1,
		response = "pbw_wizard_tower_destroy_wards_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_destroy_wards_a_done",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_wizard_tower_familiar",
		probability = 1,
		response = "pbw_wizard_tower_familiar",
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
				"wizard_tower_familiar",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"wizard_tower_familiar",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_familiar",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_gravity_a",
		probability = 1,
		response = "pbw_wizard_tower_gravity_a",
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
				"wizard_tower_gravity_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"wizard_tower_gravity_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_gravity_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_illusion_room",
		probability = 1,
		response = "pbw_wizard_tower_illusion_room",
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
				"wizard_tower_illusion_room",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"faction_memory",
				"wizard_tower_illusion_room",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_illusion_room",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_intro_a",
		probability = 1,
		response = "pbw_wizard_tower_intro_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_intro_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"wizard_tower_intro_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_intro_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_intro_b",
		probability = 1,
		response = "pbw_wizard_tower_intro_b",
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
				"wizard_tower_intro_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"wizard_tower_intro_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_intro_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_intro_c",
		probability = 1,
		response = "pbw_wizard_tower_intro_c",
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
				"wizard_tower_intro_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"wizard_tower_intro_c",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_intro_c",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_jungle",
		probability = 1,
		response = "pbw_wizard_tower_jungle",
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
				"wizard_tower_jungle",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"wizard_tower_jungle",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_jungle",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_leap_of_faith",
		probability = 1,
		response = "pbw_wizard_tower_leap_of_faith",
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
				"wizard_tower_leap_of_faith",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"faction_memory",
				"wizard_tower_leap_of_faith",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_leap_of_faith",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_library",
		probability = 1,
		response = "pbw_wizard_tower_library",
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
				"wizard_tower_library",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"faction_memory",
				"wizard_tower_library",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_library",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_library_two_b",
		probability = 1,
		response = "pbw_wizard_tower_library_two_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nsf_wizard_tower_library_two_a_done",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_wizard_tower_observatory",
		probability = 1,
		response = "pbw_wizard_tower_observatory",
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
				"wizard_tower_observatory",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"faction_memory",
				"wizard_tower_observatory",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_observatory",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_pig",
		probability = 1,
		response = "pbw_wizard_tower_pig",
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
				"wizard_tower_pig",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"faction_memory",
				"wizard_tower_pig",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_pig",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_portal",
		probability = 1,
		response = "pbw_wizard_tower_portal",
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
				"wizard_tower_portal",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"faction_memory",
				"wizard_tower_portal",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_portal",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_alone",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_potion_maker",
		probability = 1,
		response = "pbw_wizard_tower_potion_maker",
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
				"wizard_tower_potion_maker",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"wizard_tower_potion_maker",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_potion_maker",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_reunion",
		probability = 1,
		response = "pbw_wizard_tower_reunion",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_reunion_pbw",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_memory",
				"wizard_tower_reunion",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_reunion",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_ropes",
		probability = 1,
		response = "pbw_wizard_tower_ropes",
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
				"wizard_tower_ropes",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"faction_memory",
				"wizard_tower_ropes",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_ropes",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_scheme_d",
		probability = 1,
		response = "pbw_wizard_tower_scheme_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nfl_wizard_tower_scheme_c",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_wizard_tower_skull_found_subsequent",
		probability = 1,
		response = "pbw_wizard_tower_skull_found_subsequent",
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
				"wizards_tower_skull",
			},
			{
				"query_context",
				"distance",
				OP.LT,
				12,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"wizard_tower_skull_found_subsequent",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"last_seen_tower_skull",
				OP.TIMEDIFF,
				OP.GT,
				140,
			},
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_tower_skull",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"wizard_tower_skull_found_subsequent",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_waste_disposal_b",
		probability = 1,
		response = "pbw_wizard_tower_waste_disposal_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_waste_disposal_a_done",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_wizard_tower_welcome_b",
		probability = 1,
		response = "pbw_wizard_tower_welcome_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_welcome_a_done",
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"wizard_tower_welcome_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_welcome_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_welcome_b_alt",
		probability = 1,
		response = "pbw_wizard_tower_welcome_b_alt",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_welcome_a_done",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"wizard_tower_welcome_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_welcome_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_welcome_d",
		probability = 1,
		response = "pbw_wizard_tower_welcome_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_wizard_tower_welcome_c_01",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_wizard_tower_where_is_she_a",
		probability = 1,
		response = "pbw_wizard_tower_where_is_she_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_tower_where_is_she_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"wizard_tower_where_is_she_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_where_is_she_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_where_is_she_b",
		probability = 1,
		response = "pbw_wizard_tower_where_is_she_b",
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
				"wizard_tower_where_is_she_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"wizard_tower_where_is_she_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_where_is_she_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_wizard_tower_welcome_c",
		probability = 1,
		response = "pes_wizard_tower_welcome_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_wizard_tower_welcome_b_05",
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
	add_dialogues({
		pbw_enchantment_dummy_trigger = {
			category = "enemy_alerts_high",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "wizard_tower_enchantment",
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "dummy",
			},
			sound_events = {
				[1] = "dummy",
			},
			sound_events_duration = {
				[1] = 0.20000000298023,
			},
		},
		pbw_keep_climbing_dummy_trigger = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "wizard_tower_keep_climbing",
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "dummy",
			},
			sound_events = {
				[1] = "dummy",
			},
			sound_events_duration = {
				[1] = 0.20000000298023,
			},
		},
		pbw_test_subjects_dummy_trigger = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "wizard_tower_test_subjects",
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "dummy",
			},
			sound_events = {
				[1] = "dummy",
			},
			sound_events_duration = {
				[1] = 0.20000000298023,
			},
		},
		pbw_wizard_tower_another_locked_door = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_wizard_tower_another_locked_door_01",
				"pbw_wizard_tower_another_locked_door_02",
				"pbw_wizard_tower_another_locked_door_03",
				"pbw_wizard_tower_another_locked_door_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_tower_another_locked_door_01",
				"pbw_wizard_tower_another_locked_door_02",
				"pbw_wizard_tower_another_locked_door_03",
				"pbw_wizard_tower_another_locked_door_04",
			},
			sound_events_duration = {
				1.7399791479111,
				1.7809791564941,
				2.9269790649414,
				2.1429791450501,
			},
		},
		pbw_wizard_tower_bones = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_wizard_tower_bones_01",
				"pbw_wizard_tower_bones_02",
				"pbw_wizard_tower_bones_03",
				"pbw_wizard_tower_bones_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_tower_bones_01",
				"pbw_wizard_tower_bones_02",
				"pbw_wizard_tower_bones_03",
				"pbw_wizard_tower_bones_04",
			},
			sound_events_duration = {
				3.1579792499542,
				1.3099999427795,
				2.7070000171661,
				3.9119791984558,
			},
		},
		pbw_wizard_tower_brew = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_wizard_tower_brew_01",
				"pbw_wizard_tower_brew_02",
				"pbw_wizard_tower_brew_03",
				"pbw_wizard_tower_brew_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_tower_brew_01",
				"pbw_wizard_tower_brew_02",
				"pbw_wizard_tower_brew_03",
				"pbw_wizard_tower_brew_04",
			},
			sound_events_duration = {
				3.8469791412353,
				4.0589790344238,
				2.879979133606,
				3.4689791202545,
			},
		},
		pbw_wizard_tower_destroy_wards_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_wizard_tower_destroy_wards_b_01",
				"pbw_wizard_tower_destroy_wards_b_02",
				"pbw_wizard_tower_destroy_wards_b_03",
				"pbw_wizard_tower_destroy_wards_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_tower_destroy_wards_b_01",
				"pbw_wizard_tower_destroy_wards_b_02",
				"pbw_wizard_tower_destroy_wards_b_03",
				"pbw_wizard_tower_destroy_wards_b_04",
			},
			sound_events_duration = {
				3.7019999027252,
				2.3519999980927,
				3.3099792003632,
				3.7329790592194,
			},
		},
		pbw_wizard_tower_familiar = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_wizard_tower_familiar_01",
				"pbw_wizard_tower_familiar_02",
				"pbw_wizard_tower_familiar_03",
				"pbw_wizard_tower_familiar_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_tower_familiar_01",
				"pbw_wizard_tower_familiar_02",
				"pbw_wizard_tower_familiar_03",
				"pbw_wizard_tower_familiar_04",
			},
			sound_events_duration = {
				3.8579790592194,
				2.9019792079926,
				3.8959791660309,
				3.5639791488648,
			},
		},
		pbw_wizard_tower_gravity_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_wizard_tower_gravity_a_01",
				"pbw_wizard_tower_gravity_a_02",
				"pbw_wizard_tower_gravity_a_03",
				"pbw_wizard_tower_gravity_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_tower_gravity_a_01",
				"pbw_wizard_tower_gravity_a_02",
				"pbw_wizard_tower_gravity_a_03",
				"pbw_wizard_tower_gravity_a_04",
			},
			sound_events_duration = {
				4.0889792442322,
				4.1169791221619,
				3.6649792194366,
				2.8029999732971,
			},
		},
		pbw_wizard_tower_illusion_room = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_wizard_tower_illusion_room_01",
				"pbw_wizard_tower_illusion_room_02",
				"pbw_wizard_tower_illusion_room_03",
				"pbw_wizard_tower_illusion_room_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_tower_illusion_room_01",
				"pbw_wizard_tower_illusion_room_02",
				"pbw_wizard_tower_illusion_room_03",
				"pbw_wizard_tower_illusion_room_04",
			},
			sound_events_duration = {
				4.4679789543152,
				3.6449999809265,
				6.8689789772034,
				1.8989791870117,
			},
		},
		pbw_wizard_tower_intro_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_wizard_tower_intro_a_01",
				[2] = "pbw_wizard_tower_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_wizard_tower_intro_a_01",
				[2] = "pbw_wizard_tower_intro_a_02",
			},
			sound_events_duration = {
				[1] = 4.6869792938232,
				[2] = 4.5919790267944,
			},
		},
		pbw_wizard_tower_intro_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_wizard_tower_intro_b_01",
				[2] = "pbw_wizard_tower_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_wizard_tower_intro_b_01",
				[2] = "pbw_wizard_tower_intro_b_02",
			},
			sound_events_duration = {
				[1] = 3.1329791545868,
				[2] = 4.4059791564941,
			},
		},
		pbw_wizard_tower_intro_c = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_wizard_tower_intro_c_01",
				[2] = "pbw_wizard_tower_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_wizard_tower_intro_c_01",
				[2] = "pbw_wizard_tower_intro_c_02",
			},
			sound_events_duration = {
				[1] = 6.294979095459,
				[2] = 7.1319789886475,
			},
		},
		pbw_wizard_tower_jungle = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_wizard_tower_jungle_01",
				"pbw_wizard_tower_jungle_02",
				"pbw_wizard_tower_jungle_03",
				"pbw_wizard_tower_jungle_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_tower_jungle_01",
				"pbw_wizard_tower_jungle_02",
				"pbw_wizard_tower_jungle_03",
				"pbw_wizard_tower_jungle_04",
			},
			sound_events_duration = {
				2.3709790706634,
				2.9839792251587,
				2.2639791965485,
				2.9289791584015,
			},
		},
		pbw_wizard_tower_leap_of_faith = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_wizard_tower_leap_of_faith_01",
				"pbw_wizard_tower_leap_of_faith_02",
				"pbw_wizard_tower_leap_of_faith_03",
				"pbw_wizard_tower_leap_of_faith_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_tower_leap_of_faith_01",
				"pbw_wizard_tower_leap_of_faith_02",
				"pbw_wizard_tower_leap_of_faith_03",
				"pbw_wizard_tower_leap_of_faith_04",
			},
			sound_events_duration = {
				4.5739998817444,
				2.6269791126251,
				2.6869790554047,
				4.4789791107178,
			},
		},
		pbw_wizard_tower_library = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_wizard_tower_library_01",
				"pbw_wizard_tower_library_02",
				"pbw_wizard_tower_library_03",
				"pbw_wizard_tower_library_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_tower_library_01",
				"pbw_wizard_tower_library_02",
				"pbw_wizard_tower_library_03",
				"pbw_wizard_tower_library_04",
			},
			sound_events_duration = {
				3.8619792461395,
				3.7639791965485,
				6.3660001754761,
				4.5389790534973,
			},
		},
		pbw_wizard_tower_library_two_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_wizard_tower_library_two_b_01",
				"pbw_wizard_tower_library_two_b_02",
				"pbw_wizard_tower_library_two_b_03",
				"pbw_wizard_tower_library_two_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_tower_library_two_b_01",
				"pbw_wizard_tower_library_two_b_02",
				"pbw_wizard_tower_library_two_b_03",
				"pbw_wizard_tower_library_two_b_04",
			},
			sound_events_duration = {
				3.0909790992737,
				2.5769791603088,
				3.5460000038147,
				3.3739790916443,
			},
		},
		pbw_wizard_tower_observatory = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_wizard_tower_observatory_01",
				"pbw_wizard_tower_observatory_02",
				"pbw_wizard_tower_observatory_03",
				"pbw_wizard_tower_observatory_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_tower_observatory_01",
				"pbw_wizard_tower_observatory_02",
				"pbw_wizard_tower_observatory_03",
				"pbw_wizard_tower_observatory_04",
			},
			sound_events_duration = {
				2.0889792442322,
				3.2869791984558,
				6.9219789505005,
				3.9619791507721,
			},
		},
		pbw_wizard_tower_pig = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_wizard_tower_pig_01",
				"pbw_wizard_tower_pig_02",
				"pbw_wizard_tower_pig_03",
				"pbw_wizard_tower_pig_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_tower_pig_01",
				"pbw_wizard_tower_pig_02",
				"pbw_wizard_tower_pig_03",
				"pbw_wizard_tower_pig_04",
			},
			sound_events_duration = {
				4.7249794006348,
				4.4679789543152,
				5.0050001144409,
				3.920000076294,
			},
		},
		pbw_wizard_tower_portal = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_wizard_tower_portal_01",
				"pbw_wizard_tower_portal_02",
				"pbw_wizard_tower_portal_03",
				"pbw_wizard_tower_portal_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_tower_portal_01",
				"pbw_wizard_tower_portal_02",
				"pbw_wizard_tower_portal_03",
				"pbw_wizard_tower_portal_04",
			},
			sound_events_duration = {
				2.9460000991821,
				2.3099792003632,
				1.8739792108536,
				2.545000076294,
			},
		},
		pbw_wizard_tower_potion_maker = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_wizard_tower_potion_maker_01",
				"pbw_wizard_tower_potion_maker_02",
				"pbw_wizard_tower_potion_maker_03",
				"pbw_wizard_tower_potion_maker_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_tower_potion_maker_01",
				"pbw_wizard_tower_potion_maker_02",
				"pbw_wizard_tower_potion_maker_03",
				"pbw_wizard_tower_potion_maker_04",
			},
			sound_events_duration = {
				3.2329790592194,
				2.3319792747498,
				3.0389790534973,
				3.1279792785645,
			},
		},
		pbw_wizard_tower_reunion = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_wizard_tower_reunion_01",
				"pbw_wizard_tower_reunion_02",
				"pbw_wizard_tower_reunion_03",
				"pbw_wizard_tower_reunion_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_tower_reunion_01",
				"pbw_wizard_tower_reunion_02",
				"pbw_wizard_tower_reunion_03",
				"pbw_wizard_tower_reunion_04",
			},
			sound_events_duration = {
				4.5649790763855,
				5.3199791908264,
				5.3369793891907,
				5.8159790039063,
			},
		},
		pbw_wizard_tower_ropes = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_wizard_tower_ropes_01",
				"pbw_wizard_tower_ropes_02",
				"pbw_wizard_tower_ropes_03",
				"pbw_wizard_tower_ropes_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_tower_ropes_01",
				"pbw_wizard_tower_ropes_02",
				"pbw_wizard_tower_ropes_03",
				"pbw_wizard_tower_ropes_04",
			},
			sound_events_duration = {
				2.5939791202545,
				1.7380000352859,
				2.2509999275208,
				2.5529792308807,
			},
		},
		pbw_wizard_tower_scheme_d = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_wizard_tower_scheme_d_01",
				"pbw_wizard_tower_scheme_d_02",
				"pbw_wizard_tower_scheme_d_03",
				"pbw_wizard_tower_scheme_d_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_tower_scheme_d_01",
				"pbw_wizard_tower_scheme_d_02",
				"pbw_wizard_tower_scheme_d_03",
				"pbw_wizard_tower_scheme_d_04",
			},
			sound_events_duration = {
				6.9449791908264,
				3.0419790744781,
				7.3599791526794,
				5.2979793548584,
			},
		},
		pbw_wizard_tower_skull_found_subsequent = {
			category = "seen_items",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_wizard_tower_skull_found_subsequent_01",
				"pbw_wizard_tower_skull_found_subsequent_02",
				"pbw_wizard_tower_skull_found_subsequent_03",
				"pbw_wizard_tower_skull_found_subsequent_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_tower_skull_found_subsequent_01",
				"pbw_wizard_tower_skull_found_subsequent_02",
				"pbw_wizard_tower_skull_found_subsequent_03",
				"pbw_wizard_tower_skull_found_subsequent_04",
			},
			sound_events_duration = {
				0.88999998569489,
				1.3090000152588,
				1.6449999809265,
				1.5130000114441,
			},
		},
		pbw_wizard_tower_waste_disposal_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_wizard_tower_waste_disposal_b_01",
				"pbw_wizard_tower_waste_disposal_b_02",
				"pbw_wizard_tower_waste_disposal_b_03",
				"pbw_wizard_tower_waste_disposal_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_tower_waste_disposal_b_01",
				"pbw_wizard_tower_waste_disposal_b_02",
				"pbw_wizard_tower_waste_disposal_b_03",
				"pbw_wizard_tower_waste_disposal_b_04",
			},
			sound_events_duration = {
				3.7489790916443,
				2.4659790992737,
				3.669979095459,
				3.2969791889191,
			},
		},
		pbw_wizard_tower_welcome_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_wizard_tower_welcome_b_01",
				"pbw_wizard_tower_welcome_b_02",
				"pbw_wizard_tower_welcome_b_03",
				"pbw_wizard_tower_welcome_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_tower_welcome_b_01",
				"pbw_wizard_tower_welcome_b_02",
				"pbw_wizard_tower_welcome_b_03",
				"pbw_wizard_tower_welcome_b_04",
			},
			sound_events_duration = {
				2.1080000400543,
				3.0719792842865,
				3.7539999485016,
				3.1239790916443,
			},
		},
		pbw_wizard_tower_welcome_b_alt = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_wizard_tower_welcome_b_05",
			},
			sound_events = {
				[1] = "pbw_wizard_tower_welcome_b_05",
			},
			sound_events_duration = {
				[1] = 3.930999994278,
			},
		},
		pbw_wizard_tower_welcome_d = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_wizard_tower_welcome_d_01",
			},
			sound_events = {
				[1] = "pbw_wizard_tower_welcome_d_01",
			},
			sound_events_duration = {
				[1] = 6.7739791870117,
			},
		},
		pbw_wizard_tower_where_is_she_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_wizard_tower_where_is_she_a_01",
				[2] = "pbw_wizard_tower_where_is_she_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_wizard_tower_where_is_she_a_01",
				[2] = "pbw_wizard_tower_where_is_she_a_02",
			},
			sound_events_duration = {
				[1] = 3.9279792308807,
				[2] = 4.0119791030884,
			},
		},
		pbw_wizard_tower_where_is_she_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_wizard_tower_where_is_she_b_01",
				[2] = "pbw_wizard_tower_where_is_she_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_wizard_tower_where_is_she_b_01",
				[2] = "pbw_wizard_tower_where_is_she_b_02",
			},
			sound_events_duration = {
				[1] = 3.6019792556763,
				[2] = 5.6449790000916,
			},
		},
		pes_wizard_tower_welcome_c = {
			category = "level_talk",
			database = "bright_wizard_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_wizard_tower_welcome_c_01",
			},
			sound_events = {
				[1] = "pes_wizard_tower_welcome_c_01",
			},
			sound_events_duration = {
				[1] = 1.8697980642319,
			},
		},
	})
end
