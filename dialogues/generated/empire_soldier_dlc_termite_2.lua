-- chunkname: @dialogues/generated/empire_soldier_dlc_termite_2.lua

return function ()
	define_rule({
		name = "pes_power_bonus_mushroom_a",
		probability = 1,
		response = "pes_power_bonus_mushroom_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_power_bonus_mushroom_b",
		probability = 1,
		response = "pes_power_bonus_mushroom_b",
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
				"empire_soldier",
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
		name = "pes_power_broken_elevator_a",
		probability = 1,
		response = "pes_power_broken_elevator_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_power_broken_elevator_b",
		probability = 1,
		response = "pes_power_broken_elevator_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_power_cavern_bomb_leaves_b",
		probability = 1,
		response = "pes_power_cavern_bomb_leaves_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_power_cavern_debris_bridge_a",
		probability = 1,
		response = "pes_power_cavern_debris_bridge_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_power_cavern_disable_generator_a",
		probability = 1,
		response = "pes_power_cavern_disable_generator_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_power_cavern_disable_generator_b",
		probability = 1,
		response = "pes_power_cavern_disable_generator_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_power_cavern_disable_warp_sphere_a",
		probability = 1,
		response = "pes_power_cavern_disable_warp_sphere_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_power_cavern_disable_warp_sphere_b",
		probability = 1,
		response = "pes_power_cavern_disable_warp_sphere_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_power_cavern_disable_warp_sphere_complete_b",
		probability = 1,
		response = "pes_power_cavern_disable_warp_sphere_complete_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_power_cavern_disable_warp_sphere_complete_c",
		probability = 1,
		response = "pes_power_cavern_disable_warp_sphere_complete_c",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_power_cavern_disable_wheel_a",
		probability = 1,
		response = "pes_power_cavern_disable_wheel_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_power_cavern_disable_wheel_all_hands_a",
		probability = 1,
		response = "pes_power_cavern_disable_wheel_all_hands_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_power_cavern_disable_wheel_complete_a",
		probability = 1,
		response = "pes_power_cavern_disable_wheel_complete_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_power_cavern_disable_wheel_complete_b",
		probability = 1,
		response = "pes_power_cavern_disable_wheel_complete_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_power_cavern_disable_wheel_complete_c",
		probability = 1,
		response = "pes_power_cavern_disable_wheel_complete_c",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_power_cavern_disable_wheel_two_a",
		probability = 1,
		response = "pes_power_cavern_disable_wheel_two_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_power_cavern_disable_wheel_two_b",
		probability = 1,
		response = "pes_power_cavern_disable_wheel_two_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_power_cavern_elevator_foot_a",
		probability = 1,
		response = "pes_power_cavern_elevator_foot_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_power_cavern_elevator_foot_b",
		probability = 1,
		response = "pes_power_cavern_elevator_foot_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_power_cavern_event_complete_b",
		probability = 1,
		response = "pes_power_cavern_event_complete_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_power_cavern_reveal_a",
		probability = 1,
		response = "pes_power_cavern_reveal_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_power_cavern_reveal_b",
		probability = 1,
		response = "pes_power_cavern_reveal_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_power_escape_begin_a",
		probability = 1,
		response = "pes_power_escape_begin_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_power_escape_begin_b",
		probability = 1,
		response = "pes_power_escape_begin_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_power_escape_exit_tunnel_a",
		probability = 1,
		response = "pes_power_escape_exit_tunnel_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_power_escape_exit_tunnel_a_safety",
		probability = 1,
		response = "pes_power_escape_exit_tunnel_a_safety",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_power_escape_exit_tunnel_b",
		probability = 1,
		response = "pes_power_escape_exit_tunnel_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_power_escape_final_word_b",
		probability = 1,
		response = "pes_power_escape_final_word_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_power_escape_monster_fight_b",
		probability = 1,
		response = "pes_power_escape_monster_fight_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_power_escape_monster_fight_end_a",
		probability = 1,
		response = "pes_power_escape_monster_fight_end_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_power_escape_monster_reveal_a",
		probability = 1,
		response = "pes_power_escape_monster_reveal_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_power_escape_surprise_b",
		probability = 1,
		response = "pes_power_escape_surprise_b",
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
				"empire_soldier",
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
		name = "pes_power_escape_surprise_c",
		probability = 1,
		response = "pes_power_escape_surprise_c",
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
				"empire_soldier",
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
		name = "pes_power_first_interstitial_b",
		probability = 1,
		response = "pes_power_first_interstitial_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_power_start_banter_b",
		probability = 1,
		response = "pes_power_start_banter_b",
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
				"empire_soldier",
			},
		},
	})
	add_dialogues({
		pes_power_bonus_mushroom_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_bonus_mushroom_a_01",
				[2] = "pes_power_bonus_mushroom_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_bonus_mushroom_a_01",
				[2] = "pes_power_bonus_mushroom_a_02",
			},
			sound_events_duration = {
				[1] = 2.2825832366943,
				[2] = 1.9941250085831,
			},
		},
		pes_power_bonus_mushroom_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_bonus_mushroom_b_01",
				[2] = "pes_power_bonus_mushroom_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_bonus_mushroom_b_01",
				[2] = "pes_power_bonus_mushroom_b_02",
			},
			sound_events_duration = {
				[1] = 2.312020778656,
				[2] = 4.0767498016357,
			},
		},
		pes_power_broken_elevator_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_broken_elevator_a_01",
				[2] = "pes_power_broken_elevator_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_broken_elevator_a_01",
				[2] = "pes_power_broken_elevator_a_02",
			},
			sound_events_duration = {
				[1] = 3.6802291870117,
				[2] = 2.1582708358765,
			},
		},
		pes_power_broken_elevator_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_broken_elevator_b_01",
				[2] = "pes_power_broken_elevator_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_broken_elevator_b_01",
				[2] = "pes_power_broken_elevator_b_02",
			},
			sound_events_duration = {
				[1] = 2.5863125324249,
				[2] = 1.6490833759308,
			},
		},
		pes_power_cavern_bomb_leaves_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_cavern_bomb_leaves_b_01",
				[2] = "pes_power_cavern_bomb_leaves_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_cavern_bomb_leaves_b_01",
				[2] = "pes_power_cavern_bomb_leaves_b_02",
			},
			sound_events_duration = {
				[1] = 1.8450000286102,
				[2] = 1.4529374837875,
			},
		},
		pes_power_cavern_debris_bridge_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_cavern_debris_bridge_a_01",
				[2] = "pes_power_cavern_debris_bridge_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_cavern_debris_bridge_a_01",
				[2] = "pes_power_cavern_debris_bridge_a_02",
			},
			sound_events_duration = {
				[1] = 3.0206458568573,
				[2] = 4.6183543205261,
			},
		},
		pes_power_cavern_disable_generator_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_cavern_disable_generator_a_01",
				[2] = "pes_power_cavern_disable_generator_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_cavern_disable_generator_a_01",
				[2] = "pes_power_cavern_disable_generator_a_02",
			},
			sound_events_duration = {
				[1] = 4.2488956451416,
				[2] = 3.3863332271576,
			},
		},
		pes_power_cavern_disable_generator_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_cavern_disable_generator_b_01",
				[2] = "pes_power_cavern_disable_generator_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_cavern_disable_generator_b_01",
				[2] = "pes_power_cavern_disable_generator_b_02",
			},
			sound_events_duration = {
				[1] = 2.4524791240692,
				[2] = 0.95458334684372,
			},
		},
		pes_power_cavern_disable_warp_sphere_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_cavern_disable_warp_sphere_a_01",
				[2] = "pes_power_cavern_disable_warp_sphere_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_cavern_disable_warp_sphere_a_01",
				[2] = "pes_power_cavern_disable_warp_sphere_a_02",
			},
			sound_events_duration = {
				[1] = 2.8138542175293,
				[2] = 3.4159998893738,
			},
		},
		pes_power_cavern_disable_warp_sphere_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_cavern_disable_warp_sphere_b_01",
				[2] = "pes_power_cavern_disable_warp_sphere_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_cavern_disable_warp_sphere_b_01",
				[2] = "pes_power_cavern_disable_warp_sphere_b_02",
			},
			sound_events_duration = {
				[1] = 2.633291721344,
				[2] = 1.6278125047684,
			},
		},
		pes_power_cavern_disable_warp_sphere_complete_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_cavern_disable_warp_sphere_complete_b_01",
				[2] = "pes_power_cavern_disable_warp_sphere_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_cavern_disable_warp_sphere_complete_b_01",
				[2] = "pes_power_cavern_disable_warp_sphere_complete_b_02",
			},
			sound_events_duration = {
				[1] = 3.4900207519531,
				[2] = 1.5934166908264,
			},
		},
		pes_power_cavern_disable_warp_sphere_complete_c = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_cavern_disable_warp_sphere_complete_c_01",
				[2] = "pes_power_cavern_disable_warp_sphere_complete_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_cavern_disable_warp_sphere_complete_c_01",
				[2] = "pes_power_cavern_disable_warp_sphere_complete_c_02",
			},
			sound_events_duration = {
				[1] = 2.0515208244324,
				[2] = 5.6223125457764,
			},
		},
		pes_power_cavern_disable_wheel_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_cavern_disable_wheel_a_01",
				[2] = "pes_power_cavern_disable_wheel_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_cavern_disable_wheel_a_01",
				[2] = "pes_power_cavern_disable_wheel_a_02",
			},
			sound_events_duration = {
				[1] = 3.7708542346954,
				[2] = 4.3505415916443,
			},
		},
		pes_power_cavern_disable_wheel_all_hands_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_cavern_disable_wheel_all_hands_a_01",
				[2] = "pes_power_cavern_disable_wheel_all_hands_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_cavern_disable_wheel_all_hands_a_01",
				[2] = "pes_power_cavern_disable_wheel_all_hands_a_02",
			},
			sound_events_duration = {
				[1] = 1.82577085495,
				[2] = 2.5325000286102,
			},
		},
		pes_power_cavern_disable_wheel_complete_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_cavern_disable_wheel_complete_a_01",
				[2] = "pes_power_cavern_disable_wheel_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_cavern_disable_wheel_complete_a_01",
				[2] = "pes_power_cavern_disable_wheel_complete_a_02",
			},
			sound_events_duration = {
				[1] = 2.0675415992737,
				[2] = 2.4271457195282,
			},
		},
		pes_power_cavern_disable_wheel_complete_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_cavern_disable_wheel_complete_b_01",
				[2] = "pes_power_cavern_disable_wheel_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_cavern_disable_wheel_complete_b_01",
				[2] = "pes_power_cavern_disable_wheel_complete_b_02",
			},
			sound_events_duration = {
				[1] = 2.0128333568573,
				[2] = 2.3200833797455,
			},
		},
		pes_power_cavern_disable_wheel_complete_c = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_cavern_disable_wheel_complete_c_01",
				[2] = "pes_power_cavern_disable_wheel_complete_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_cavern_disable_wheel_complete_c_01",
				[2] = "pes_power_cavern_disable_wheel_complete_c_02",
			},
			sound_events_duration = {
				[1] = 2.2489583492279,
				[2] = 1.628145813942,
			},
		},
		pes_power_cavern_disable_wheel_two_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_cavern_disable_wheel_two_a_01",
				[2] = "pes_power_cavern_disable_wheel_two_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_cavern_disable_wheel_two_a_01",
				[2] = "pes_power_cavern_disable_wheel_two_a_02",
			},
			sound_events_duration = {
				[1] = 1.1906249523163,
				[2] = 1.0085624456406,
			},
		},
		pes_power_cavern_disable_wheel_two_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_cavern_disable_wheel_two_b_01",
				[2] = "pes_power_cavern_disable_wheel_two_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_cavern_disable_wheel_two_b_01",
				[2] = "pes_power_cavern_disable_wheel_two_b_02",
			},
			sound_events_duration = {
				[1] = 2.9973542690277,
				[2] = 2.3000416755676,
			},
		},
		pes_power_cavern_elevator_foot_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_cavern_elevator_foot_a_01",
				[2] = "pes_power_cavern_elevator_foot_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_cavern_elevator_foot_a_01",
				[2] = "pes_power_cavern_elevator_foot_a_02",
			},
			sound_events_duration = {
				[1] = 3.5866875648499,
				[2] = 3.438916683197,
			},
		},
		pes_power_cavern_elevator_foot_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_cavern_elevator_foot_b_01",
				[2] = "pes_power_cavern_elevator_foot_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_cavern_elevator_foot_b_01",
				[2] = "pes_power_cavern_elevator_foot_b_02",
			},
			sound_events_duration = {
				[1] = 3.7176041603088,
				[2] = 3.2405416965485,
			},
		},
		pes_power_cavern_event_complete_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_cavern_event_complete_b_01",
				[2] = "pes_power_cavern_event_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_cavern_event_complete_b_01",
				[2] = "pes_power_cavern_event_complete_b_02",
			},
			sound_events_duration = {
				[1] = 3.1826457977295,
				[2] = 2.5718541145325,
			},
		},
		pes_power_cavern_reveal_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_cavern_reveal_a_01",
				[2] = "pes_power_cavern_reveal_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_cavern_reveal_a_01",
				[2] = "pes_power_cavern_reveal_a_02",
			},
			sound_events_duration = {
				[1] = 2.6117291450501,
				[2] = 3.4624373912811,
			},
		},
		pes_power_cavern_reveal_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_cavern_reveal_b_01",
				[2] = "pes_power_cavern_reveal_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_cavern_reveal_b_01",
				[2] = "pes_power_cavern_reveal_b_02",
			},
			sound_events_duration = {
				[1] = 2.4264583587647,
				[2] = 1.9869375228882,
			},
		},
		pes_power_escape_begin_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_escape_begin_a_01",
				[2] = "pes_power_escape_begin_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_escape_begin_a_01",
				[2] = "pes_power_escape_begin_a_02",
			},
			sound_events_duration = {
				[1] = 3.1370625495911,
				[2] = 3.3780832290649,
			},
		},
		pes_power_escape_begin_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_escape_begin_b_01",
				[2] = "pes_power_escape_begin_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_escape_begin_b_01",
				[2] = "pes_power_escape_begin_b_02",
			},
			sound_events_duration = {
				[1] = 1.4048957824707,
				[2] = 1.2825000286102,
			},
		},
		pes_power_escape_exit_tunnel_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_escape_exit_tunnel_a_01",
				[2] = "pes_power_escape_exit_tunnel_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_escape_exit_tunnel_a_01",
				[2] = "pes_power_escape_exit_tunnel_a_02",
			},
			sound_events_duration = {
				[1] = 2.3306457996368,
				[2] = 1.9626874923706,
			},
		},
		pes_power_escape_exit_tunnel_a_safety = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_escape_exit_tunnel_a_01",
				[2] = "pes_power_escape_exit_tunnel_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_escape_exit_tunnel_a_01",
				[2] = "pes_power_escape_exit_tunnel_a_02",
			},
			sound_events_duration = {
				[1] = 2.3306457996368,
				[2] = 1.9626874923706,
			},
		},
		pes_power_escape_exit_tunnel_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_escape_exit_tunnel_b_01",
				[2] = "pes_power_escape_exit_tunnel_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_escape_exit_tunnel_b_01",
				[2] = "pes_power_escape_exit_tunnel_b_02",
			},
			sound_events_duration = {
				[1] = 2.3983540534973,
				[2] = 2.459166765213,
			},
		},
		pes_power_escape_final_word_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_escape_final_word_b_01",
				[2] = "pes_power_escape_final_word_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_escape_final_word_b_01",
				[2] = "pes_power_escape_final_word_b_02",
			},
			sound_events_duration = {
				[1] = 2.2047290802002,
				[2] = 2.5286457538605,
			},
		},
		pes_power_escape_monster_fight_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_escape_monster_fight_b_01",
				[2] = "pes_power_escape_monster_fight_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_escape_monster_fight_b_01",
				[2] = "pes_power_escape_monster_fight_b_02",
			},
			sound_events_duration = {
				[1] = 2.6129791736603,
				[2] = 2.4903750419617,
			},
		},
		pes_power_escape_monster_fight_end_a = {
			category = "npc_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_escape_monster_fight_end_a_01",
				[2] = "pes_power_escape_monster_fight_end_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_escape_monster_fight_end_a_01",
				[2] = "pes_power_escape_monster_fight_end_a_02",
			},
			sound_events_duration = {
				[1] = 3.7590625286102,
				[2] = 3.0762083530426,
			},
		},
		pes_power_escape_monster_reveal_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_escape_monster_reveal_a_01",
				[2] = "pes_power_escape_monster_reveal_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_escape_monster_reveal_a_01",
				[2] = "pes_power_escape_monster_reveal_a_02",
			},
			sound_events_duration = {
				[1] = 1.3992916345596,
				[2] = 1.7471041679382,
			},
		},
		pes_power_escape_surprise_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_escape_surprise_b_01",
				[2] = "pes_power_escape_surprise_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_escape_surprise_b_01",
				[2] = "pes_power_escape_surprise_b_02",
			},
			sound_events_duration = {
				[1] = 1.7211874723434,
				[2] = 2.4328334331513,
			},
		},
		pes_power_escape_surprise_c = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_escape_surprise_c_01",
				[2] = "pes_power_escape_surprise_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_escape_surprise_c_01",
				[2] = "pes_power_escape_surprise_c_02",
			},
			sound_events_duration = {
				[1] = 1.8671457767487,
				[2] = 1.7358541488648,
			},
		},
		pes_power_first_interstitial_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_first_interstitial_b_01",
				[2] = "pes_power_first_interstitial_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_first_interstitial_b_01",
				[2] = "pes_power_first_interstitial_b_02",
			},
			sound_events_duration = {
				[1] = 2.0592083930969,
				[2] = 2.0350415706634,
			},
		},
		pes_power_start_banter_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_2",
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
				[1] = "pes_power_start_banter_b_01",
				[2] = "pes_power_start_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_start_banter_b_01",
				[2] = "pes_power_start_banter_b_02",
			},
			sound_events_duration = {
				[1] = 2.2773332595825,
				[2] = 1.7536875009537,
			},
		},
	})
end
