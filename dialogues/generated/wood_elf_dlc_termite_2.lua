-- chunkname: @dialogues/generated/wood_elf_dlc_termite_2.lua

return function ()
	define_rule({
		name = "pwe_power_bonus_mushroom_a",
		probability = 1,
		response = "pwe_power_bonus_mushroom_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_power_bonus_mushroom_b",
		probability = 1,
		response = "pwe_power_bonus_mushroom_b",
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
				"wood_elf",
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
		name = "pwe_power_broken_elevator_a",
		probability = 1,
		response = "pwe_power_broken_elevator_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_power_broken_elevator_b",
		probability = 1,
		response = "pwe_power_broken_elevator_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_power_cavern_bomb_leaves_b",
		probability = 1,
		response = "pwe_power_cavern_bomb_leaves_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_power_cavern_debris_bridge_a",
		probability = 1,
		response = "pwe_power_cavern_debris_bridge_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_power_cavern_disable_generator_a",
		probability = 1,
		response = "pwe_power_cavern_disable_generator_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_power_cavern_disable_generator_b",
		probability = 1,
		response = "pwe_power_cavern_disable_generator_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_power_cavern_disable_warp_sphere_a",
		probability = 1,
		response = "pwe_power_cavern_disable_warp_sphere_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_power_cavern_disable_warp_sphere_b",
		probability = 1,
		response = "pwe_power_cavern_disable_warp_sphere_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_power_cavern_disable_warp_sphere_complete_b",
		probability = 1,
		response = "pwe_power_cavern_disable_warp_sphere_complete_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_power_cavern_disable_warp_sphere_complete_c",
		probability = 1,
		response = "pwe_power_cavern_disable_warp_sphere_complete_c",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_power_cavern_disable_wheel_a",
		probability = 1,
		response = "pwe_power_cavern_disable_wheel_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_power_cavern_disable_wheel_all_hands_a",
		probability = 1,
		response = "pwe_power_cavern_disable_wheel_all_hands_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_power_cavern_disable_wheel_complete_a",
		probability = 1,
		response = "pwe_power_cavern_disable_wheel_complete_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_power_cavern_disable_wheel_complete_b",
		probability = 1,
		response = "pwe_power_cavern_disable_wheel_complete_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_power_cavern_disable_wheel_complete_c",
		probability = 1,
		response = "pwe_power_cavern_disable_wheel_complete_c",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_power_cavern_disable_wheel_two_a",
		probability = 1,
		response = "pwe_power_cavern_disable_wheel_two_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_power_cavern_disable_wheel_two_b",
		probability = 1,
		response = "pwe_power_cavern_disable_wheel_two_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_power_cavern_elevator_foot_a",
		probability = 1,
		response = "pwe_power_cavern_elevator_foot_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_power_cavern_elevator_foot_b",
		probability = 1,
		response = "pwe_power_cavern_elevator_foot_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_power_cavern_event_complete_b",
		probability = 1,
		response = "pwe_power_cavern_event_complete_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_power_cavern_reveal_a",
		probability = 1,
		response = "pwe_power_cavern_reveal_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_power_cavern_reveal_b",
		probability = 1,
		response = "pwe_power_cavern_reveal_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_power_escape_begin_a",
		probability = 1,
		response = "pwe_power_escape_begin_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_power_escape_begin_b",
		probability = 1,
		response = "pwe_power_escape_begin_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_power_escape_exit_tunnel_a",
		probability = 1,
		response = "pwe_power_escape_exit_tunnel_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_power_escape_exit_tunnel_a_safety",
		probability = 1,
		response = "pwe_power_escape_exit_tunnel_a_safety",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_power_escape_exit_tunnel_b",
		probability = 1,
		response = "pwe_power_escape_exit_tunnel_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_power_escape_final_word_b",
		probability = 1,
		response = "pwe_power_escape_final_word_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_power_escape_monster_fight_b",
		probability = 1,
		response = "pwe_power_escape_monster_fight_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_power_escape_monster_fight_end_a",
		probability = 1,
		response = "pwe_power_escape_monster_fight_end_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_power_escape_monster_reveal_a",
		probability = 1,
		response = "pwe_power_escape_monster_reveal_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_power_escape_surprise_b",
		probability = 1,
		response = "pwe_power_escape_surprise_b",
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
				"wood_elf",
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
		name = "pwe_power_escape_surprise_c",
		probability = 1,
		response = "pwe_power_escape_surprise_c",
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
				"wood_elf",
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
		name = "pwe_power_first_interstitial_b",
		probability = 1,
		response = "pwe_power_first_interstitial_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_power_start_banter_b",
		probability = 1,
		response = "pwe_power_start_banter_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_power_start_banter_c",
		probability = 1,
		response = "pwe_power_start_banter_c",
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
				"wood_elf",
			},
		},
	})
	add_dialogues({
		pwe_power_bonus_mushroom_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_bonus_mushroom_a_01",
				[2] = "pwe_power_bonus_mushroom_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_bonus_mushroom_a_01",
				[2] = "pwe_power_bonus_mushroom_a_02",
			},
			sound_events_duration = {
				[1] = 3.7063541412353,
				[2] = 3.3828125,
			},
		},
		pwe_power_bonus_mushroom_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_bonus_mushroom_b_01",
				[2] = "pwe_power_bonus_mushroom_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_bonus_mushroom_b_01",
				[2] = "pwe_power_bonus_mushroom_b_02",
			},
			sound_events_duration = {
				[1] = 3.2324376106262,
				[2] = 3.3862082958221,
			},
		},
		pwe_power_broken_elevator_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_broken_elevator_a_01",
				[2] = "pwe_power_broken_elevator_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_broken_elevator_a_01",
				[2] = "pwe_power_broken_elevator_a_02",
			},
			sound_events_duration = {
				[1] = 2.4954583644867,
				[2] = 2.9994165897369,
			},
		},
		pwe_power_broken_elevator_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_broken_elevator_b_01",
				[2] = "pwe_power_broken_elevator_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_broken_elevator_b_01",
				[2] = "pwe_power_broken_elevator_b_02",
			},
			sound_events_duration = {
				[1] = 3.2584583759308,
				[2] = 3.2396874427795,
			},
		},
		pwe_power_cavern_bomb_leaves_b = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_cavern_bomb_leaves_b_01",
				[2] = "pwe_power_cavern_bomb_leaves_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_cavern_bomb_leaves_b_01",
				[2] = "pwe_power_cavern_bomb_leaves_b_02",
			},
			sound_events_duration = {
				[1] = 3.0633542537689,
				[2] = 2.012791633606,
			},
		},
		pwe_power_cavern_debris_bridge_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_cavern_debris_bridge_a_01",
				[2] = "pwe_power_cavern_debris_bridge_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_cavern_debris_bridge_a_01",
				[2] = "pwe_power_cavern_debris_bridge_a_02",
			},
			sound_events_duration = {
				[1] = 1.8404791355133,
				[2] = 2.0637707710266,
			},
		},
		pwe_power_cavern_disable_generator_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_cavern_disable_generator_a_01",
				[2] = "pwe_power_cavern_disable_generator_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_cavern_disable_generator_a_01",
				[2] = "pwe_power_cavern_disable_generator_a_02",
			},
			sound_events_duration = {
				[1] = 2.0899999141693,
				[2] = 2.9167499542236,
			},
		},
		pwe_power_cavern_disable_generator_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_cavern_disable_generator_b_01",
				[2] = "pwe_power_cavern_disable_generator_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_cavern_disable_generator_b_01",
				[2] = "pwe_power_cavern_disable_generator_b_02",
			},
			sound_events_duration = {
				[1] = 1.7640416622162,
				[2] = 2.3559167385101,
			},
		},
		pwe_power_cavern_disable_warp_sphere_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_cavern_disable_warp_sphere_a_01",
				[2] = "pwe_power_cavern_disable_warp_sphere_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_cavern_disable_warp_sphere_a_01",
				[2] = "pwe_power_cavern_disable_warp_sphere_a_02",
			},
			sound_events_duration = {
				[1] = 3.1921458244324,
				[2] = 3.0683958530426,
			},
		},
		pwe_power_cavern_disable_warp_sphere_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_cavern_disable_warp_sphere_b_01",
				[2] = "pwe_power_cavern_disable_warp_sphere_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_cavern_disable_warp_sphere_b_01",
				[2] = "pwe_power_cavern_disable_warp_sphere_b_02",
			},
			sound_events_duration = {
				[1] = 2.9717917442322,
				[2] = 2.6538124084473,
			},
		},
		pwe_power_cavern_disable_warp_sphere_complete_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_cavern_disable_warp_sphere_complete_b_01",
				[2] = "pwe_power_cavern_disable_warp_sphere_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_cavern_disable_warp_sphere_complete_b_01",
				[2] = "pwe_power_cavern_disable_warp_sphere_complete_b_02",
			},
			sound_events_duration = {
				[1] = 2.6184792518616,
				[2] = 2.6970207691193,
			},
		},
		pwe_power_cavern_disable_warp_sphere_complete_c = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_cavern_disable_warp_sphere_complete_c_01",
				[2] = "pwe_power_cavern_disable_warp_sphere_complete_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_cavern_disable_warp_sphere_complete_c_01",
				[2] = "pwe_power_cavern_disable_warp_sphere_complete_c_02",
			},
			sound_events_duration = {
				[1] = 3.7547082901001,
				[2] = 2.1660416126251,
			},
		},
		pwe_power_cavern_disable_wheel_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_cavern_disable_wheel_a_01",
				[2] = "pwe_power_cavern_disable_wheel_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_cavern_disable_wheel_a_01",
				[2] = "pwe_power_cavern_disable_wheel_a_02",
			},
			sound_events_duration = {
				[1] = 4.6193542480469,
				[2] = 4.0855832099915,
			},
		},
		pwe_power_cavern_disable_wheel_all_hands_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_cavern_disable_wheel_all_hands_a_01",
				[2] = "pwe_power_cavern_disable_wheel_all_hands_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_cavern_disable_wheel_all_hands_a_01",
				[2] = "pwe_power_cavern_disable_wheel_all_hands_a_02",
			},
			sound_events_duration = {
				[1] = 2.2794165611267,
				[2] = 2.0146250724792,
			},
		},
		pwe_power_cavern_disable_wheel_complete_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_cavern_disable_wheel_complete_a_01",
				[2] = "pwe_power_cavern_disable_wheel_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_cavern_disable_wheel_complete_a_01",
				[2] = "pwe_power_cavern_disable_wheel_complete_a_02",
			},
			sound_events_duration = {
				[1] = 2.6366457939148,
				[2] = 2.8102917671204,
			},
		},
		pwe_power_cavern_disable_wheel_complete_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_cavern_disable_wheel_complete_b_01",
				[2] = "pwe_power_cavern_disable_wheel_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_cavern_disable_wheel_complete_b_01",
				[2] = "pwe_power_cavern_disable_wheel_complete_b_02",
			},
			sound_events_duration = {
				[1] = 3.3317708969116,
				[2] = 3.4916458129883,
			},
		},
		pwe_power_cavern_disable_wheel_complete_c = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_cavern_disable_wheel_complete_c_01",
				[2] = "pwe_power_cavern_disable_wheel_complete_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_cavern_disable_wheel_complete_c_01",
				[2] = "pwe_power_cavern_disable_wheel_complete_c_02",
			},
			sound_events_duration = {
				[1] = 2.4285624027252,
				[2] = 2.8188540935516,
			},
		},
		pwe_power_cavern_disable_wheel_two_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_cavern_disable_wheel_two_a_01",
				[2] = "pwe_power_cavern_disable_wheel_two_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_cavern_disable_wheel_two_a_01",
				[2] = "pwe_power_cavern_disable_wheel_two_a_02",
			},
			sound_events_duration = {
				[1] = 2.8214790821075,
				[2] = 3.6359584331513,
			},
		},
		pwe_power_cavern_disable_wheel_two_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_cavern_disable_wheel_two_b_01",
				[2] = "pwe_power_cavern_disable_wheel_two_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_cavern_disable_wheel_two_b_01",
				[2] = "pwe_power_cavern_disable_wheel_two_b_02",
			},
			sound_events_duration = {
				[1] = 2.6984584331513,
				[2] = 2.3887708187103,
			},
		},
		pwe_power_cavern_elevator_foot_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_cavern_elevator_foot_a_01",
				[2] = "pwe_power_cavern_elevator_foot_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_cavern_elevator_foot_a_01",
				[2] = "pwe_power_cavern_elevator_foot_a_02",
			},
			sound_events_duration = {
				[1] = 5.261833190918,
				[2] = 2.3670415878296,
			},
		},
		pwe_power_cavern_elevator_foot_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_cavern_elevator_foot_b_01",
				[2] = "pwe_power_cavern_elevator_foot_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_cavern_elevator_foot_b_01",
				[2] = "pwe_power_cavern_elevator_foot_b_02",
			},
			sound_events_duration = {
				[1] = 3.8632500171661,
				[2] = 4.2079792022705,
			},
		},
		pwe_power_cavern_event_complete_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_cavern_event_complete_b_01",
				[2] = "pwe_power_cavern_event_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_cavern_event_complete_b_01",
				[2] = "pwe_power_cavern_event_complete_b_02",
			},
			sound_events_duration = {
				[1] = 2.0835833549499,
				[2] = 3.1602292060852,
			},
		},
		pwe_power_cavern_reveal_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_cavern_reveal_a_01",
				[2] = "pwe_power_cavern_reveal_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_cavern_reveal_a_01",
				[2] = "pwe_power_cavern_reveal_a_02",
			},
			sound_events_duration = {
				[1] = 2.6244583129883,
				[2] = 4.3614373207092,
			},
		},
		pwe_power_cavern_reveal_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_cavern_reveal_b_01",
				[2] = "pwe_power_cavern_reveal_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_cavern_reveal_b_01",
				[2] = "pwe_power_cavern_reveal_b_02",
			},
			sound_events_duration = {
				[1] = 4.4066247940064,
				[2] = 3.3960416316986,
			},
		},
		pwe_power_escape_begin_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_escape_begin_a_01",
				[2] = "pwe_power_escape_begin_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_escape_begin_a_01",
				[2] = "pwe_power_escape_begin_a_02",
			},
			sound_events_duration = {
				[1] = 3.558000087738,
				[2] = 3.3060207366943,
			},
		},
		pwe_power_escape_begin_b = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_escape_begin_b_01",
				[2] = "pwe_power_escape_begin_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_escape_begin_b_01",
				[2] = "pwe_power_escape_begin_b_02",
			},
			sound_events_duration = {
				[1] = 1.167729139328,
				[2] = 2.3623750209808,
			},
		},
		pwe_power_escape_exit_tunnel_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_escape_exit_tunnel_a_01",
				[2] = "pwe_power_escape_exit_tunnel_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_escape_exit_tunnel_a_01",
				[2] = "pwe_power_escape_exit_tunnel_a_02",
			},
			sound_events_duration = {
				[1] = 1.7661875486374,
				[2] = 3.6734790802002,
			},
		},
		pwe_power_escape_exit_tunnel_a_safety = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_escape_exit_tunnel_a_01",
				[2] = "pwe_power_escape_exit_tunnel_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_escape_exit_tunnel_a_01",
				[2] = "pwe_power_escape_exit_tunnel_a_02",
			},
			sound_events_duration = {
				[1] = 1.7661875486374,
				[2] = 3.6734790802002,
			},
		},
		pwe_power_escape_exit_tunnel_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_escape_exit_tunnel_b_01",
				[2] = "pwe_power_escape_exit_tunnel_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_escape_exit_tunnel_b_01",
				[2] = "pwe_power_escape_exit_tunnel_b_02",
			},
			sound_events_duration = {
				[1] = 3.2834582328796,
				[2] = 3.3840625286102,
			},
		},
		pwe_power_escape_final_word_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_escape_final_word_b_01",
				[2] = "pwe_power_escape_final_word_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_escape_final_word_b_01",
				[2] = "pwe_power_escape_final_word_b_02",
			},
			sound_events_duration = {
				[1] = 3.6881875991821,
				[2] = 3.4402916431427,
			},
		},
		pwe_power_escape_monster_fight_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_escape_monster_fight_b_01",
				[2] = "pwe_power_escape_monster_fight_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_escape_monster_fight_b_01",
				[2] = "pwe_power_escape_monster_fight_b_02",
			},
			sound_events_duration = {
				[1] = 2.2390625476837,
				[2] = 3.2067708969116,
			},
		},
		pwe_power_escape_monster_fight_end_a = {
			category = "npc_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_escape_monster_fight_end_a_01",
				[2] = "pwe_power_escape_monster_fight_end_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_escape_monster_fight_end_a_01",
				[2] = "pwe_power_escape_monster_fight_end_a_02",
			},
			sound_events_duration = {
				[1] = 2.3558125495911,
				[2] = 3.7252917289734,
			},
		},
		pwe_power_escape_monster_reveal_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_escape_monster_reveal_a_02",
			},
			sound_events = {
				[1] = "pwe_power_escape_monster_reveal_a_02",
			},
			sound_events_duration = {
				[1] = 1.4052916765213,
			},
		},
		pwe_power_escape_surprise_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_escape_surprise_b_01",
				[2] = "pwe_power_escape_surprise_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_escape_surprise_b_01",
				[2] = "pwe_power_escape_surprise_b_02",
			},
			sound_events_duration = {
				[1] = 1.2121249437332,
				[2] = 1.606541633606,
			},
		},
		pwe_power_escape_surprise_c = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_escape_surprise_c_01",
				[2] = "pwe_power_escape_surprise_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_escape_surprise_c_01",
				[2] = "pwe_power_escape_surprise_c_02",
			},
			sound_events_duration = {
				[1] = 2.9677708148956,
				[2] = 2.56995844841,
			},
		},
		pwe_power_first_interstitial_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_first_interstitial_b_01",
				[2] = "pwe_power_first_interstitial_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_first_interstitial_b_01",
				[2] = "pwe_power_first_interstitial_b_02",
			},
			sound_events_duration = {
				[1] = 3.6952707767487,
				[2] = 2.8858749866486,
			},
		},
		pwe_power_start_banter_b = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_2",
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
				[1] = "pwe_power_start_banter_b_01",
				[2] = "pwe_power_start_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_start_banter_b_01",
				[2] = "pwe_power_start_banter_b_02",
			},
			sound_events_duration = {
				[1] = 4.3774375915527,
				[2] = 3.6625626087189,
			},
		},
		pwe_power_start_banter_c = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_2",
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
				"pwe_power_start_banter_c_01",
				"pwe_power_start_banter_c_02",
				"pwe_power_start_banter_c_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_power_start_banter_c_01",
				"pwe_power_start_banter_c_02",
				"pwe_power_start_banter_c_03",
			},
			sound_events_duration = {
				1.9960207939148,
				3.0484375953674,
				3.7135207653046,
			},
		},
	})
end
