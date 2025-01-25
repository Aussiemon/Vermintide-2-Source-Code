-- chunkname: @dialogues/generated/witch_hunter_dlc_termite_2.lua

return function ()
	define_rule({
		name = "pwh_power_bonus_mushroom_a",
		probability = 1,
		response = "pwh_power_bonus_mushroom_a",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_power_bonus_mushroom_b",
		probability = 1,
		response = "pwh_power_bonus_mushroom_b",
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
				"witch_hunter",
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
		name = "pwh_power_broken_elevator_a",
		probability = 1,
		response = "pwh_power_broken_elevator_a",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_power_broken_elevator_b",
		probability = 1,
		response = "pwh_power_broken_elevator_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_power_cavern_bomb_leaves_b",
		probability = 1,
		response = "pwh_power_cavern_bomb_leaves_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_power_cavern_debris_bridge_a",
		probability = 1,
		response = "pwh_power_cavern_debris_bridge_a",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_power_cavern_disable_generator_a",
		probability = 1,
		response = "pwh_power_cavern_disable_generator_a",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_power_cavern_disable_generator_b",
		probability = 1,
		response = "pwh_power_cavern_disable_generator_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_power_cavern_disable_warp_sphere_a",
		probability = 1,
		response = "pwh_power_cavern_disable_warp_sphere_a",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_power_cavern_disable_warp_sphere_b",
		probability = 1,
		response = "pwh_power_cavern_disable_warp_sphere_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_power_cavern_disable_warp_sphere_complete_b",
		probability = 1,
		response = "pwh_power_cavern_disable_warp_sphere_complete_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_power_cavern_disable_warp_sphere_complete_c",
		probability = 1,
		response = "pwh_power_cavern_disable_warp_sphere_complete_c",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_power_cavern_disable_wheel_a",
		probability = 1,
		response = "pwh_power_cavern_disable_wheel_a",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_power_cavern_disable_wheel_all_hands_a",
		probability = 1,
		response = "pwh_power_cavern_disable_wheel_all_hands_a",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_power_cavern_disable_wheel_complete_a",
		probability = 1,
		response = "pwh_power_cavern_disable_wheel_complete_a",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"power_cavern_disable_wheel_complete",
				OP.LT,
				2,
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
		name = "pwh_power_cavern_disable_wheel_complete_b",
		probability = 1,
		response = "pwh_power_cavern_disable_wheel_complete_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_power_cavern_disable_wheel_complete_c",
		probability = 1,
		response = "pwh_power_cavern_disable_wheel_complete_c",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_power_cavern_disable_wheel_two_a",
		probability = 1,
		response = "pwh_power_cavern_disable_wheel_two_a",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_power_cavern_disable_wheel_two_b",
		probability = 1,
		response = "pwh_power_cavern_disable_wheel_two_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_power_cavern_elevator_foot_a",
		probability = 1,
		response = "pwh_power_cavern_elevator_foot_a",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_power_cavern_elevator_foot_b",
		probability = 1,
		response = "pwh_power_cavern_elevator_foot_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_power_cavern_event_complete_b",
		probability = 1,
		response = "pwh_power_cavern_event_complete_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_power_cavern_reveal_a",
		probability = 1,
		response = "pwh_power_cavern_reveal_a",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_power_cavern_reveal_b",
		probability = 1,
		response = "pwh_power_cavern_reveal_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_power_escape_begin_a",
		probability = 1,
		response = "pwh_power_escape_begin_a",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_power_escape_begin_b",
		probability = 1,
		response = "pwh_power_escape_begin_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_power_escape_exit_tunnel_a",
		probability = 1,
		response = "pwh_power_escape_exit_tunnel_a",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_power_escape_exit_tunnel_a_safety",
		probability = 1,
		response = "pwh_power_escape_exit_tunnel_a_safety",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_power_escape_exit_tunnel_b",
		probability = 1,
		response = "pwh_power_escape_exit_tunnel_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_power_escape_final_word_b",
		probability = 1,
		response = "pwh_power_escape_final_word_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_power_escape_monster_fight_b",
		probability = 1,
		response = "pwh_power_escape_monster_fight_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_power_escape_monster_fight_end_a",
		probability = 1,
		response = "pwh_power_escape_monster_fight_end_a",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_power_escape_monster_reveal_a",
		probability = 1,
		response = "pwh_power_escape_monster_reveal_a",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_power_escape_surprise_b",
		probability = 1,
		response = "pwh_power_escape_surprise_b",
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
				"witch_hunter",
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
		name = "pwh_power_escape_surprise_c",
		probability = 1,
		response = "pwh_power_escape_surprise_c",
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
				"witch_hunter",
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
		name = "pwh_power_first_interstitial_b",
		probability = 1,
		response = "pwh_power_first_interstitial_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_power_start_banter_b",
		probability = 1,
		response = "pwh_power_start_banter_b",
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
				"witch_hunter",
			},
		},
	})
	add_dialogues({
		pwh_power_bonus_mushroom_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_bonus_mushroom_a_01",
				[2] = "pwh_power_bonus_mushroom_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_bonus_mushroom_a_01",
				[2] = "pwh_power_bonus_mushroom_a_02",
			},
			sound_events_duration = {
				[1] = 3.600625038147,
				[2] = 3.3716666698456,
			},
		},
		pwh_power_bonus_mushroom_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_bonus_mushroom_b_01",
				[2] = "pwh_power_bonus_mushroom_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_bonus_mushroom_b_01",
				[2] = "pwh_power_bonus_mushroom_b_02",
			},
			sound_events_duration = {
				[1] = 2.413583278656,
				[2] = 3.4391040802002,
			},
		},
		pwh_power_broken_elevator_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_broken_elevator_a_01",
				[2] = "pwh_power_broken_elevator_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_broken_elevator_a_01",
				[2] = "pwh_power_broken_elevator_a_02",
			},
			sound_events_duration = {
				[1] = 3.7162082195282,
				[2] = 3.2322707176209,
			},
		},
		pwh_power_broken_elevator_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_broken_elevator_b_01",
				[2] = "pwh_power_broken_elevator_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_broken_elevator_b_01",
				[2] = "pwh_power_broken_elevator_b_02",
			},
			sound_events_duration = {
				[1] = 3.7627708911896,
				[2] = 2.2930207252502,
			},
		},
		pwh_power_cavern_bomb_leaves_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_cavern_bomb_leaves_b_01",
				[2] = "pwh_power_cavern_bomb_leaves_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_cavern_bomb_leaves_b_01",
				[2] = "pwh_power_cavern_bomb_leaves_b_02",
			},
			sound_events_duration = {
				[1] = 1.3859374523163,
				[2] = 1.9850416183472,
			},
		},
		pwh_power_cavern_debris_bridge_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_cavern_debris_bridge_a_01",
				[2] = "pwh_power_cavern_debris_bridge_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_cavern_debris_bridge_a_01",
				[2] = "pwh_power_cavern_debris_bridge_a_02",
			},
			sound_events_duration = {
				[1] = 2.3836250305176,
				[2] = 3.7417707443237,
			},
		},
		pwh_power_cavern_disable_generator_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_cavern_disable_generator_a_01",
				[2] = "pwh_power_cavern_disable_generator_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_cavern_disable_generator_a_01",
				[2] = "pwh_power_cavern_disable_generator_a_02",
			},
			sound_events_duration = {
				[1] = 4.3372707366943,
				[2] = 1.8622291088104,
			},
		},
		pwh_power_cavern_disable_generator_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_cavern_disable_generator_b_01",
				[2] = "pwh_power_cavern_disable_generator_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_cavern_disable_generator_b_01",
				[2] = "pwh_power_cavern_disable_generator_b_02",
			},
			sound_events_duration = {
				[1] = 3.2651875019074,
				[2] = 4.2652292251587,
			},
		},
		pwh_power_cavern_disable_warp_sphere_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_cavern_disable_warp_sphere_a_01",
				[2] = "pwh_power_cavern_disable_warp_sphere_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_cavern_disable_warp_sphere_a_01",
				[2] = "pwh_power_cavern_disable_warp_sphere_a_02",
			},
			sound_events_duration = {
				[1] = 3.1872498989105,
				[2] = 2.6608126163483,
			},
		},
		pwh_power_cavern_disable_warp_sphere_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_cavern_disable_warp_sphere_b_01",
				[2] = "pwh_power_cavern_disable_warp_sphere_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_cavern_disable_warp_sphere_b_01",
				[2] = "pwh_power_cavern_disable_warp_sphere_b_02",
			},
			sound_events_duration = {
				[1] = 3.051854133606,
				[2] = 1.4909374713898,
			},
		},
		pwh_power_cavern_disable_warp_sphere_complete_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_cavern_disable_warp_sphere_complete_b_01",
				[2] = "pwh_power_cavern_disable_warp_sphere_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_cavern_disable_warp_sphere_complete_b_01",
				[2] = "pwh_power_cavern_disable_warp_sphere_complete_b_02",
			},
			sound_events_duration = {
				[1] = 2.0392708778381,
				[2] = 2.1112291812897,
			},
		},
		pwh_power_cavern_disable_warp_sphere_complete_c = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_cavern_disable_warp_sphere_complete_c_01",
				[2] = "pwh_power_cavern_disable_warp_sphere_complete_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_cavern_disable_warp_sphere_complete_c_01",
				[2] = "pwh_power_cavern_disable_warp_sphere_complete_c_02",
			},
			sound_events_duration = {
				[1] = 2.334166765213,
				[2] = 2.9154374599457,
			},
		},
		pwh_power_cavern_disable_wheel_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_cavern_disable_wheel_a_01",
				[2] = "pwh_power_cavern_disable_wheel_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_cavern_disable_wheel_a_01",
				[2] = "pwh_power_cavern_disable_wheel_a_02",
			},
			sound_events_duration = {
				[1] = 6.6750626564026,
				[2] = 5.1564793586731,
			},
		},
		pwh_power_cavern_disable_wheel_all_hands_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_cavern_disable_wheel_all_hands_a_01",
				[2] = "pwh_power_cavern_disable_wheel_all_hands_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_cavern_disable_wheel_all_hands_a_01",
				[2] = "pwh_power_cavern_disable_wheel_all_hands_a_02",
			},
			sound_events_duration = {
				[1] = 3.20277094841,
				[2] = 3.8422083854675,
			},
		},
		pwh_power_cavern_disable_wheel_complete_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_cavern_disable_wheel_complete_a_01",
				[2] = "pwh_power_cavern_disable_wheel_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_cavern_disable_wheel_complete_a_01",
				[2] = "pwh_power_cavern_disable_wheel_complete_a_02",
			},
			sound_events_duration = {
				[1] = 3.6195209026337,
				[2] = 2.5228333473206,
			},
		},
		pwh_power_cavern_disable_wheel_complete_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_cavern_disable_wheel_complete_b_01",
				[2] = "pwh_power_cavern_disable_wheel_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_cavern_disable_wheel_complete_b_01",
				[2] = "pwh_power_cavern_disable_wheel_complete_b_02",
			},
			sound_events_duration = {
				[1] = 3.1882290840149,
				[2] = 3.9272916316986,
			},
		},
		pwh_power_cavern_disable_wheel_complete_c = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_cavern_disable_wheel_complete_c_01",
				[2] = "pwh_power_cavern_disable_wheel_complete_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_cavern_disable_wheel_complete_c_01",
				[2] = "pwh_power_cavern_disable_wheel_complete_c_02",
			},
			sound_events_duration = {
				[1] = 4.1710624694824,
				[2] = 5.4416251182556,
			},
		},
		pwh_power_cavern_disable_wheel_two_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_cavern_disable_wheel_two_a_01",
				[2] = "pwh_power_cavern_disable_wheel_two_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_cavern_disable_wheel_two_a_01",
				[2] = "pwh_power_cavern_disable_wheel_two_a_02",
			},
			sound_events_duration = {
				[1] = 1.6453125476837,
				[2] = 2.3485207557678,
			},
		},
		pwh_power_cavern_disable_wheel_two_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_cavern_disable_wheel_two_b_01",
				[2] = "pwh_power_cavern_disable_wheel_two_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_cavern_disable_wheel_two_b_01",
				[2] = "pwh_power_cavern_disable_wheel_two_b_02",
			},
			sound_events_duration = {
				[1] = 2.4763333797455,
				[2] = 2.9078958034515,
			},
		},
		pwh_power_cavern_elevator_foot_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_cavern_elevator_foot_a_01",
				[2] = "pwh_power_cavern_elevator_foot_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_cavern_elevator_foot_a_01",
				[2] = "pwh_power_cavern_elevator_foot_a_02",
			},
			sound_events_duration = {
				[1] = 3.2945625782013,
				[2] = 2.7087292671204,
			},
		},
		pwh_power_cavern_elevator_foot_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_cavern_elevator_foot_b_01",
				[2] = "pwh_power_cavern_elevator_foot_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_cavern_elevator_foot_b_01",
				[2] = "pwh_power_cavern_elevator_foot_b_02",
			},
			sound_events_duration = {
				[1] = 3.8571457862854,
				[2] = 5.7368960380554,
			},
		},
		pwh_power_cavern_event_complete_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_cavern_event_complete_b_01",
				[2] = "pwh_power_cavern_event_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_cavern_event_complete_b_01",
				[2] = "pwh_power_cavern_event_complete_b_02",
			},
			sound_events_duration = {
				[1] = 2.7021458148956,
				[2] = 4.6822290420532,
			},
		},
		pwh_power_cavern_reveal_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_cavern_reveal_a_01",
				[2] = "pwh_power_cavern_reveal_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_cavern_reveal_a_01",
				[2] = "pwh_power_cavern_reveal_a_02",
			},
			sound_events_duration = {
				[1] = 3.1554999351502,
				[2] = 5.468249797821,
			},
		},
		pwh_power_cavern_reveal_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_cavern_reveal_b_01",
				[2] = "pwh_power_cavern_reveal_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_cavern_reveal_b_01",
				[2] = "pwh_power_cavern_reveal_b_02",
			},
			sound_events_duration = {
				[1] = 4.1297707557678,
				[2] = 4.2140207290649,
			},
		},
		pwh_power_escape_begin_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_escape_begin_a_01",
				[2] = "pwh_power_escape_begin_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_escape_begin_a_01",
				[2] = "pwh_power_escape_begin_a_02",
			},
			sound_events_duration = {
				[1] = 5.3147292137146,
				[2] = 3.7159376144409,
			},
		},
		pwh_power_escape_begin_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_escape_begin_b_01",
				[2] = "pwh_power_escape_begin_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_escape_begin_b_01",
				[2] = "pwh_power_escape_begin_b_02",
			},
			sound_events_duration = {
				[1] = 3.2554583549499,
				[2] = 3.0479791164398,
			},
		},
		pwh_power_escape_exit_tunnel_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_escape_exit_tunnel_a_01",
				[2] = "pwh_power_escape_exit_tunnel_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_escape_exit_tunnel_a_01",
				[2] = "pwh_power_escape_exit_tunnel_a_02",
			},
			sound_events_duration = {
				[1] = 2.9448750019074,
				[2] = 2.0824167728424,
			},
		},
		pwh_power_escape_exit_tunnel_a_safety = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_escape_exit_tunnel_a_01",
				[2] = "pwh_power_escape_exit_tunnel_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_escape_exit_tunnel_a_01",
				[2] = "pwh_power_escape_exit_tunnel_a_02",
			},
			sound_events_duration = {
				[1] = 2.9448750019074,
				[2] = 2.0824167728424,
			},
		},
		pwh_power_escape_exit_tunnel_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_escape_exit_tunnel_b_01",
				[2] = "pwh_power_escape_exit_tunnel_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_escape_exit_tunnel_b_01",
				[2] = "pwh_power_escape_exit_tunnel_b_02",
			},
			sound_events_duration = {
				[1] = 3.0553541183472,
				[2] = 3.7747082710266,
			},
		},
		pwh_power_escape_final_word_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_escape_final_word_b_01",
				[2] = "pwh_power_escape_final_word_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_escape_final_word_b_01",
				[2] = "pwh_power_escape_final_word_b_02",
			},
			sound_events_duration = {
				[1] = 3.009708404541,
				[2] = 4.3198747634888,
			},
		},
		pwh_power_escape_monster_fight_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_escape_monster_fight_b_01",
				[2] = "pwh_power_escape_monster_fight_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_escape_monster_fight_b_01",
				[2] = "pwh_power_escape_monster_fight_b_02",
			},
			sound_events_duration = {
				[1] = 1.7358125448227,
				[2] = 2.7038333415985,
			},
		},
		pwh_power_escape_monster_fight_end_a = {
			category = "npc_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_escape_monster_fight_end_a_01",
				[2] = "pwh_power_escape_monster_fight_end_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_escape_monster_fight_end_a_01",
				[2] = "pwh_power_escape_monster_fight_end_a_02",
			},
			sound_events_duration = {
				[1] = 3.6526041030884,
				[2] = 3.722062587738,
			},
		},
		pwh_power_escape_monster_reveal_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_escape_monster_reveal_a_02",
			},
			sound_events = {
				[1] = "pwh_power_escape_monster_reveal_a_02",
			},
			sound_events_duration = {
				[1] = 1.9651875495911,
			},
		},
		pwh_power_escape_surprise_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_escape_surprise_b_01",
				[2] = "pwh_power_escape_surprise_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_escape_surprise_b_01",
				[2] = "pwh_power_escape_surprise_b_02",
			},
			sound_events_duration = {
				[1] = 2.8032083511352,
				[2] = 2.9440207481384,
			},
		},
		pwh_power_escape_surprise_c = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_escape_surprise_c_01",
				[2] = "pwh_power_escape_surprise_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_escape_surprise_c_01",
				[2] = "pwh_power_escape_surprise_c_02",
			},
			sound_events_duration = {
				[1] = 2.7738125324249,
				[2] = 3.9719166755676,
			},
		},
		pwh_power_first_interstitial_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_first_interstitial_b_01",
				[2] = "pwh_power_first_interstitial_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_first_interstitial_b_01",
				[2] = "pwh_power_first_interstitial_b_02",
			},
			sound_events_duration = {
				[1] = 4.261146068573,
				[2] = 2.8307292461395,
			},
		},
		pwh_power_start_banter_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_2",
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
				[1] = "pwh_power_start_banter_b_01",
				[2] = "pwh_power_start_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_start_banter_b_01",
				[2] = "pwh_power_start_banter_b_02",
			},
			sound_events_duration = {
				[1] = 2.1483957767487,
				[2] = 5.293333530426,
			},
		},
	})
end
