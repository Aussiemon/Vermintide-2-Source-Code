-- chunkname: @dialogues/generated/bright_wizard_dlc_termite_2.lua

return function ()
	define_rule({
		name = "pbw_power_bonus_mushroom_a",
		probability = 1,
		response = "pbw_power_bonus_mushroom_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"power_bonus_mushroom_a",
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
				90,
			},
			{
				"faction_memory",
				"power_bonus_mushroom",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"power_bonus_mushroom",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_power_bonus_mushroom_b",
		probability = 1,
		response = "pbw_power_bonus_mushroom_b",
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
				"power_bonus_mushroom_a",
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
				7,
			},
		},
	})
	define_rule({
		name = "pbw_power_broken_elevator_a",
		probability = 1,
		response = "pbw_power_broken_elevator_a",
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
				"power_broken_elevator_a",
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
				"power_broken_elevator",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"power_broken_elevator",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_power_broken_elevator_b",
		probability = 1,
		response = "pbw_power_broken_elevator_b",
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
				"power_broken_elevator_a",
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
		name = "pbw_power_cavern_bomb_leaves_b",
		probability = 1,
		response = "pbw_power_cavern_bomb_leaves_b",
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
				"vmg_a_power_cavern_bomb_leaves_a",
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
		name = "pbw_power_cavern_debris_bridge_a",
		probability = 1,
		response = "pbw_power_cavern_debris_bridge_a",
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
				"power_cavern_debris_bridge_a",
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
				"flow_all_lower_objectives_done",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"power_cavern_debris_bridge",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"power_cavern_debris_bridge",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_power_cavern_disable_generator_a",
		probability = 1,
		response = "pbw_power_cavern_disable_generator_a",
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
				"power_cavern_disable_generator_a",
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
				"flow_first_wheel_done",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"power_cavern_disable_generator",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"power_cavern_disable_generator",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_power_cavern_disable_generator_b",
		probability = 1,
		response = "pbw_power_cavern_disable_generator_b",
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
				"power_cavern_disable_generator_a",
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
		name = "pbw_power_cavern_disable_warp_sphere_a",
		probability = 1,
		response = "pbw_power_cavern_disable_warp_sphere_a",
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
				"power_cavern_disable_warp_sphere_a",
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
				"flow_first_wheel_done",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"power_cavern_disable_warp_sphere",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"power_cavern_disable_warp_sphere",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_power_cavern_disable_warp_sphere_b",
		probability = 1,
		response = "pbw_power_cavern_disable_warp_sphere_b",
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
				"power_cavern_disable_warp_sphere_a",
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
		name = "pbw_power_cavern_disable_warp_sphere_complete_b",
		probability = 1,
		response = "pbw_power_cavern_disable_warp_sphere_complete_b",
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
				"vmg_a_power_cavern_disable_warp_sphere_complete_a",
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
		name = "pbw_power_cavern_disable_warp_sphere_complete_c",
		probability = 1,
		response = "pbw_power_cavern_disable_warp_sphere_complete_c",
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
				"power_cavern_disable_warp_sphere_complete_b",
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
		name = "pbw_power_cavern_disable_wheel_a",
		probability = 1,
		response = "pbw_power_cavern_disable_wheel_a",
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
				"power_cavern_disable_wheel_a",
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
				"power_cavern_disable_wheel",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"power_cavern_disable_wheel",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_power_cavern_disable_wheel_all_hands_a",
		probability = 1,
		response = "pbw_power_cavern_disable_wheel_all_hands_a",
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
				"power_cavern_disable_wheel_all_hands_a",
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
				"power_cavern_disable_wheel_all_hands",
				OP.LT,
				2,
			},
		},
		on_done = {
			{
				"faction_memory",
				"power_cavern_disable_wheel_all_hands",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_power_cavern_disable_wheel_complete_a",
		probability = 1,
		response = "pbw_power_cavern_disable_wheel_complete_a",
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
				"power_cavern_disable_wheel_complete_a",
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
				"power_cavern_disable_wheel_complete",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"power_cavern_disable_wheel_complete",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_power_cavern_disable_wheel_complete_b",
		probability = 1,
		response = "pbw_power_cavern_disable_wheel_complete_b",
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
				"power_cavern_disable_wheel_complete_a",
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
		name = "pbw_power_cavern_disable_wheel_complete_c",
		probability = 1,
		response = "pbw_power_cavern_disable_wheel_complete_c",
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
				"power_cavern_disable_wheel_complete_b",
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
		name = "pbw_power_cavern_disable_wheel_two_a",
		probability = 1,
		response = "pbw_power_cavern_disable_wheel_two_a",
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
				"power_cavern_disable_wheel_two_a",
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
				"flow_first_wheel_done",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"power_cavern_disable_wheel_two",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"power_cavern_disable_wheel_two",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_power_cavern_disable_wheel_two_b",
		probability = 1,
		response = "pbw_power_cavern_disable_wheel_two_b",
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
				"power_cavern_disable_wheel_two_a",
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
		name = "pbw_power_cavern_elevator_foot_a",
		probability = 1,
		response = "pbw_power_cavern_elevator_foot_a",
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
				"power_cavern_elevator_foot_a",
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
				"power_cavern_elevator_foot",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"power_cavern_elevator_foot",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_power_cavern_elevator_foot_b",
		probability = 1,
		response = "pbw_power_cavern_elevator_foot_b",
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
				"power_cavern_elevator_foot_a",
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
		name = "pbw_power_cavern_event_complete_b",
		probability = 1,
		response = "pbw_power_cavern_event_complete_b",
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
				"vmg_a_power_cavern_event_complete_a",
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
		name = "pbw_power_cavern_reveal_a",
		probability = 1,
		response = "pbw_power_cavern_reveal_a",
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
				"power_cavern_reveal_a",
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
				"power_cavern_reveal",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"power_cavern_reveal",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_power_cavern_reveal_b",
		probability = 1,
		response = "pbw_power_cavern_reveal_b",
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
				"power_cavern_reveal_a",
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
		name = "pbw_power_escape_begin_a",
		probability = 1,
		response = "pbw_power_escape_begin_a",
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
				"power_cavern_bomb_leaves_b",
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
				"power_escape_begin",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"power_escape_begin",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_power_escape_begin_b",
		probability = 1,
		response = "pbw_power_escape_begin_b",
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
				"power_escape_begin_a",
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
		name = "pbw_power_escape_exit_tunnel_a",
		probability = 1,
		response = "pbw_power_escape_exit_tunnel_a",
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
				"vmg_a_power_escape_monster_fight_end_b",
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
				"flow_monster_dead",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"flow_unlock_exit_tunnel",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"power_escape_exit_tunnel",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"power_escape_exit_tunnel",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_power_escape_exit_tunnel_a_safety",
		probability = 1,
		response = "pbw_power_escape_exit_tunnel_a_safety",
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
				"power_escape_exit_tunnel_a_safety",
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
				"flow_monster_dead",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"flow_unlock_exit_tunnel",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"power_escape_exit_tunnel",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"power_escape_exit_tunnel",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_power_escape_exit_tunnel_b",
		probability = 1,
		response = "pbw_power_escape_exit_tunnel_b",
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
				"power_escape_exit_tunnel_a",
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
		name = "pbw_power_escape_final_word_b",
		probability = 1,
		response = "pbw_power_escape_final_word_b",
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
				"nik_power_escape_final_word_a",
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
		name = "pbw_power_escape_monster_fight_b",
		probability = 1,
		response = "pbw_power_escape_monster_fight_b",
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
				"vmg_a_power_escape_monster_fight_a",
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
		name = "pbw_power_escape_monster_fight_end_a",
		probability = 1,
		response = "pbw_power_escape_monster_fight_end_a",
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
				"power_escape_monster_fight_end_a",
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
				"power_escape_monster_fight_end",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"power_escape_monster_fight_end",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_power_escape_monster_reveal_a",
		probability = 1,
		response = "pbw_power_escape_monster_reveal_a",
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
				"power_escape_monster_reveal_a",
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
				"power_escape_monster_reveal",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"power_escape_monster_reveal",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_power_escape_surprise_b",
		probability = 1,
		response = "pbw_power_escape_surprise_b",
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
				"vmg_a_power_escape_surprise_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_rat_ogre",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"last_heard_skaven_rat_ogre",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_power_escape_surprise_c",
		probability = 1,
		response = "pbw_power_escape_surprise_c",
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
				"power_escape_surprise_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_rat_ogre",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"last_heard_skaven_rat_ogre",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_power_first_interstitial_b",
		probability = 1,
		response = "pbw_power_first_interstitial_b",
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
				"vmg_a_power_first_interstitial_a",
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
		name = "pbw_power_start_banter_b",
		probability = 1,
		response = "pbw_power_start_banter_b",
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
				"nik_power_start_banter_a",
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
		name = "pbw_power_start_banter_c",
		probability = 1,
		response = "pbw_power_start_banter_c",
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
				"power_start_banter_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
		},
	})
	add_dialogues({
		pbw_power_bonus_mushroom_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_bonus_mushroom_a_01",
				[2] = "pbw_power_bonus_mushroom_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_bonus_mushroom_a_01",
				[2] = "pbw_power_bonus_mushroom_a_02",
			},
			sound_events_duration = {
				[1] = 2.6478126049042,
				[2] = 1.7944166660309,
			},
		},
		pbw_power_bonus_mushroom_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_bonus_mushroom_b_01",
				[2] = "pbw_power_bonus_mushroom_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_bonus_mushroom_b_01",
				[2] = "pbw_power_bonus_mushroom_b_02",
			},
			sound_events_duration = {
				[1] = 2.8572082519531,
				[2] = 2.6715834140778,
			},
		},
		pbw_power_broken_elevator_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_broken_elevator_a_01",
				[2] = "pbw_power_broken_elevator_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_broken_elevator_a_01",
				[2] = "pbw_power_broken_elevator_a_02",
			},
			sound_events_duration = {
				[1] = 2.4190208911896,
				[2] = 2.3187291622162,
			},
		},
		pbw_power_broken_elevator_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_broken_elevator_b_01",
				[2] = "pbw_power_broken_elevator_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_broken_elevator_b_01",
				[2] = "pbw_power_broken_elevator_b_02",
			},
			sound_events_duration = {
				[1] = 3.1823332309723,
				[2] = 2.4126875400543,
			},
		},
		pbw_power_cavern_bomb_leaves_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_cavern_bomb_leaves_b_01",
				[2] = "pbw_power_cavern_bomb_leaves_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_cavern_bomb_leaves_b_01",
				[2] = "pbw_power_cavern_bomb_leaves_b_02",
			},
			sound_events_duration = {
				[1] = 2.2709999084473,
				[2] = 2.8582291603088,
			},
		},
		pbw_power_cavern_debris_bridge_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_cavern_debris_bridge_a_01",
				[2] = "pbw_power_cavern_debris_bridge_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_cavern_debris_bridge_a_01",
				[2] = "pbw_power_cavern_debris_bridge_a_02",
			},
			sound_events_duration = {
				[1] = 3.0148749351502,
				[2] = 2.5616457462311,
			},
		},
		pbw_power_cavern_disable_generator_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_cavern_disable_generator_a_01",
				[2] = "pbw_power_cavern_disable_generator_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_cavern_disable_generator_a_01",
				[2] = "pbw_power_cavern_disable_generator_a_02",
			},
			sound_events_duration = {
				[1] = 4.8599581718445,
				[2] = 3.2947916984558,
			},
		},
		pbw_power_cavern_disable_generator_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_cavern_disable_generator_b_01",
				[2] = "pbw_power_cavern_disable_generator_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_cavern_disable_generator_b_01",
				[2] = "pbw_power_cavern_disable_generator_b_02",
			},
			sound_events_duration = {
				[1] = 3.1742498874664,
				[2] = 3.4200625419617,
			},
		},
		pbw_power_cavern_disable_warp_sphere_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_cavern_disable_warp_sphere_a_01",
				[2] = "pbw_power_cavern_disable_warp_sphere_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_cavern_disable_warp_sphere_a_01",
				[2] = "pbw_power_cavern_disable_warp_sphere_a_02",
			},
			sound_events_duration = {
				[1] = 2.9323959350586,
				[2] = 2.9640207290649,
			},
		},
		pbw_power_cavern_disable_warp_sphere_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_cavern_disable_warp_sphere_b_01",
				[2] = "pbw_power_cavern_disable_warp_sphere_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_cavern_disable_warp_sphere_b_01",
				[2] = "pbw_power_cavern_disable_warp_sphere_b_02",
			},
			sound_events_duration = {
				[1] = 3.0212917327881,
				[2] = 2.4156041145325,
			},
		},
		pbw_power_cavern_disable_warp_sphere_complete_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_cavern_disable_warp_sphere_complete_b_01",
				[2] = "pbw_power_cavern_disable_warp_sphere_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_cavern_disable_warp_sphere_complete_b_01",
				[2] = "pbw_power_cavern_disable_warp_sphere_complete_b_02",
			},
			sound_events_duration = {
				[1] = 3.3294167518616,
				[2] = 6.6875,
			},
		},
		pbw_power_cavern_disable_warp_sphere_complete_c = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_cavern_disable_warp_sphere_complete_c_01",
				[2] = "pbw_power_cavern_disable_warp_sphere_complete_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_cavern_disable_warp_sphere_complete_c_01",
				[2] = "pbw_power_cavern_disable_warp_sphere_complete_c_02",
			},
			sound_events_duration = {
				[1] = 4.3123960494995,
				[2] = 1.5562708377838,
			},
		},
		pbw_power_cavern_disable_wheel_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_cavern_disable_wheel_a_01",
				[2] = "pbw_power_cavern_disable_wheel_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_cavern_disable_wheel_a_01",
				[2] = "pbw_power_cavern_disable_wheel_a_02",
			},
			sound_events_duration = {
				[1] = 4.1426668167114,
				[2] = 3.0321249961853,
			},
		},
		pbw_power_cavern_disable_wheel_all_hands_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_cavern_disable_wheel_all_hands_a_01",
				[2] = "pbw_power_cavern_disable_wheel_all_hands_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_cavern_disable_wheel_all_hands_a_01",
				[2] = "pbw_power_cavern_disable_wheel_all_hands_a_02",
			},
			sound_events_duration = {
				[1] = 3.5273125171661,
				[2] = 2.3291041851044,
			},
		},
		pbw_power_cavern_disable_wheel_complete_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_cavern_disable_wheel_complete_a_01",
				[2] = "pbw_power_cavern_disable_wheel_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_cavern_disable_wheel_complete_a_01",
				[2] = "pbw_power_cavern_disable_wheel_complete_a_02",
			},
			sound_events_duration = {
				[1] = 4.3647708892822,
				[2] = 3.6827082633972,
			},
		},
		pbw_power_cavern_disable_wheel_complete_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_cavern_disable_wheel_complete_b_01",
				[2] = "pbw_power_cavern_disable_wheel_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_cavern_disable_wheel_complete_b_01",
				[2] = "pbw_power_cavern_disable_wheel_complete_b_02",
			},
			sound_events_duration = {
				[1] = 3.0597290992737,
				[2] = 3.0216250419617,
			},
		},
		pbw_power_cavern_disable_wheel_complete_c = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_cavern_disable_wheel_complete_c_01",
				[2] = "pbw_power_cavern_disable_wheel_complete_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_cavern_disable_wheel_complete_c_01",
				[2] = "pbw_power_cavern_disable_wheel_complete_c_02",
			},
			sound_events_duration = {
				[1] = 2.5596041679382,
				[2] = 3.1629583835602,
			},
		},
		pbw_power_cavern_disable_wheel_two_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_cavern_disable_wheel_two_a_01",
				[2] = "pbw_power_cavern_disable_wheel_two_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_cavern_disable_wheel_two_a_01",
				[2] = "pbw_power_cavern_disable_wheel_two_a_02",
			},
			sound_events_duration = {
				[1] = 1.4104791879654,
				[2] = 2.2498540878296,
			},
		},
		pbw_power_cavern_disable_wheel_two_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_cavern_disable_wheel_two_b_01",
				[2] = "pbw_power_cavern_disable_wheel_two_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_cavern_disable_wheel_two_b_01",
				[2] = "pbw_power_cavern_disable_wheel_two_b_02",
			},
			sound_events_duration = {
				[1] = 2.6119792461395,
				[2] = 2.0816457271576,
			},
		},
		pbw_power_cavern_elevator_foot_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_cavern_elevator_foot_a_01",
				[2] = "pbw_power_cavern_elevator_foot_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_cavern_elevator_foot_a_01",
				[2] = "pbw_power_cavern_elevator_foot_a_02",
			},
			sound_events_duration = {
				[1] = 2.9557082653046,
				[2] = 2.5691249370575,
			},
		},
		pbw_power_cavern_elevator_foot_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_cavern_elevator_foot_b_01",
				[2] = "pbw_power_cavern_elevator_foot_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_cavern_elevator_foot_b_01",
				[2] = "pbw_power_cavern_elevator_foot_b_02",
			},
			sound_events_duration = {
				[1] = 3.574937582016,
				[2] = 3.1270000934601,
			},
		},
		pbw_power_cavern_event_complete_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_cavern_event_complete_b_01",
				[2] = "pbw_power_cavern_event_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_cavern_event_complete_b_01",
				[2] = "pbw_power_cavern_event_complete_b_02",
			},
			sound_events_duration = {
				[1] = 3.6386458873749,
				[2] = 2.5547916889191,
			},
		},
		pbw_power_cavern_reveal_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_cavern_reveal_a_01",
				[2] = "pbw_power_cavern_reveal_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_cavern_reveal_a_01",
				[2] = "pbw_power_cavern_reveal_a_02",
			},
			sound_events_duration = {
				[1] = 2.9028332233429,
				[2] = 1.9868333339691,
			},
		},
		pbw_power_cavern_reveal_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_cavern_reveal_b_01",
				[2] = "pbw_power_cavern_reveal_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_cavern_reveal_b_01",
				[2] = "pbw_power_cavern_reveal_b_02",
			},
			sound_events_duration = {
				[1] = 3.0181250572205,
				[2] = 2.6221249103546,
			},
		},
		pbw_power_escape_begin_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_escape_begin_a_01",
				[2] = "pbw_power_escape_begin_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_escape_begin_a_01",
				[2] = "pbw_power_escape_begin_a_02",
			},
			sound_events_duration = {
				[1] = 2.1556665897369,
				[2] = 2.1380000114441,
			},
		},
		pbw_power_escape_begin_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_escape_begin_b_01",
				[2] = "pbw_power_escape_begin_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_escape_begin_b_01",
				[2] = "pbw_power_escape_begin_b_02",
			},
			sound_events_duration = {
				[1] = 1.2816250324249,
				[2] = 1.3430000543594,
			},
		},
		pbw_power_escape_exit_tunnel_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_escape_exit_tunnel_a_01",
				[2] = "pbw_power_escape_exit_tunnel_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_escape_exit_tunnel_a_01",
				[2] = "pbw_power_escape_exit_tunnel_a_02",
			},
			sound_events_duration = {
				[1] = 2.3187291622162,
				[2] = 2.4587082862854,
			},
		},
		pbw_power_escape_exit_tunnel_a_safety = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_escape_exit_tunnel_a_01",
				[2] = "pbw_power_escape_exit_tunnel_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_escape_exit_tunnel_a_01",
				[2] = "pbw_power_escape_exit_tunnel_a_02",
			},
			sound_events_duration = {
				[1] = 2.3187291622162,
				[2] = 2.4587082862854,
			},
		},
		pbw_power_escape_exit_tunnel_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_escape_exit_tunnel_b_01",
				[2] = "pbw_power_escape_exit_tunnel_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_escape_exit_tunnel_b_01",
				[2] = "pbw_power_escape_exit_tunnel_b_02",
			},
			sound_events_duration = {
				[1] = 1.5789791345596,
				[2] = 1.7423125505447,
			},
		},
		pbw_power_escape_final_word_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_escape_final_word_b_01",
				[2] = "pbw_power_escape_final_word_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_escape_final_word_b_01",
				[2] = "pbw_power_escape_final_word_b_02",
			},
			sound_events_duration = {
				[1] = 3.8100833892822,
				[2] = 3.6693332195282,
			},
		},
		pbw_power_escape_monster_fight_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_escape_monster_fight_b_01",
				[2] = "pbw_power_escape_monster_fight_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_escape_monster_fight_b_01",
				[2] = "pbw_power_escape_monster_fight_b_02",
			},
			sound_events_duration = {
				[1] = 2.9979999065399,
				[2] = 2.0223541259766,
			},
		},
		pbw_power_escape_monster_fight_end_a = {
			category = "npc_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_escape_monster_fight_end_a_01",
				[2] = "pbw_power_escape_monster_fight_end_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_escape_monster_fight_end_a_01",
				[2] = "pbw_power_escape_monster_fight_end_a_02",
			},
			sound_events_duration = {
				[1] = 2.9588959217072,
				[2] = 2.804229259491,
			},
		},
		pbw_power_escape_monster_reveal_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_escape_monster_reveal_a_01",
			},
			sound_events = {
				[1] = "pbw_power_escape_monster_reveal_a_01",
			},
			sound_events_duration = {
				[1] = 0.81581252813339,
			},
		},
		pbw_power_escape_surprise_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_escape_surprise_b_01",
				[2] = "pbw_power_escape_surprise_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_escape_surprise_b_01",
				[2] = "pbw_power_escape_surprise_b_02",
			},
			sound_events_duration = {
				[1] = 1.2782291173935,
				[2] = 1.8085000514984,
			},
		},
		pbw_power_escape_surprise_c = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_escape_surprise_c_01",
				[2] = "pbw_power_escape_surprise_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_escape_surprise_c_01",
				[2] = "pbw_power_escape_surprise_c_02",
			},
			sound_events_duration = {
				[1] = 1.6191458702087,
				[2] = 1.9491041898727,
			},
		},
		pbw_power_first_interstitial_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_first_interstitial_b_01",
				[2] = "pbw_power_first_interstitial_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_first_interstitial_b_01",
				[2] = "pbw_power_first_interstitial_b_02",
			},
			sound_events_duration = {
				[1] = 3.5529582500458,
				[2] = 4.0505833625794,
			},
		},
		pbw_power_start_banter_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_power_start_banter_b_01",
				[2] = "pbw_power_start_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_start_banter_b_01",
				[2] = "pbw_power_start_banter_b_02",
			},
			sound_events_duration = {
				[1] = 3.1038541793823,
				[2] = 3.204916715622,
			},
		},
		pbw_power_start_banter_c = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_2",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			randomize_indexes_n = 0,
			sound_events_n = 3,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_power_start_banter_c_01",
				"pbw_power_start_banter_c_02",
				"pbw_power_start_banter_c_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_power_start_banter_c_01",
				"pbw_power_start_banter_c_02",
				"pbw_power_start_banter_c_03",
			},
			sound_events_duration = {
				5.061083316803,
				5.5306043624878,
				5.1412291526794,
			},
		},
	})
end
