-- chunkname: @dialogues/generated/dwarf_ranger_dlc_termite_2.lua

return function ()
	define_rule({
		name = "pdr_power_bonus_mushroom_a",
		probability = 1,
		response = "pdr_power_bonus_mushroom_a",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_power_bonus_mushroom_b",
		probability = 1,
		response = "pdr_power_bonus_mushroom_b",
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
				"dwarf_ranger",
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
		name = "pdr_power_broken_elevator_a",
		probability = 1,
		response = "pdr_power_broken_elevator_a",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_power_broken_elevator_b",
		probability = 1,
		response = "pdr_power_broken_elevator_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_power_cavern_bomb_leaves_b",
		probability = 1,
		response = "pdr_power_cavern_bomb_leaves_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_power_cavern_debris_bridge_a",
		probability = 1,
		response = "pdr_power_cavern_debris_bridge_a",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_power_cavern_disable_generator_a",
		probability = 1,
		response = "pdr_power_cavern_disable_generator_a",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_power_cavern_disable_generator_b",
		probability = 1,
		response = "pdr_power_cavern_disable_generator_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_power_cavern_disable_warp_sphere_a",
		probability = 1,
		response = "pdr_power_cavern_disable_warp_sphere_a",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_power_cavern_disable_warp_sphere_b",
		probability = 1,
		response = "pdr_power_cavern_disable_warp_sphere_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_power_cavern_disable_warp_sphere_complete_b",
		probability = 1,
		response = "pdr_power_cavern_disable_warp_sphere_complete_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_power_cavern_disable_warp_sphere_complete_c",
		probability = 1,
		response = "pdr_power_cavern_disable_warp_sphere_complete_c",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_power_cavern_disable_wheel_a",
		probability = 1,
		response = "pdr_power_cavern_disable_wheel_a",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_power_cavern_disable_wheel_all_hands_a",
		probability = 1,
		response = "pdr_power_cavern_disable_wheel_all_hands_a",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_power_cavern_disable_wheel_complete_a",
		probability = 1,
		response = "pdr_power_cavern_disable_wheel_complete_a",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_power_cavern_disable_wheel_complete_b",
		probability = 1,
		response = "pdr_power_cavern_disable_wheel_complete_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_power_cavern_disable_wheel_complete_c",
		probability = 1,
		response = "pdr_power_cavern_disable_wheel_complete_c",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_power_cavern_disable_wheel_two_a",
		probability = 1,
		response = "pdr_power_cavern_disable_wheel_two_a",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_power_cavern_disable_wheel_two_b",
		probability = 1,
		response = "pdr_power_cavern_disable_wheel_two_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_power_cavern_elevator_foot_a",
		probability = 1,
		response = "pdr_power_cavern_elevator_foot_a",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_power_cavern_elevator_foot_b",
		probability = 1,
		response = "pdr_power_cavern_elevator_foot_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_power_cavern_event_complete_b",
		probability = 1,
		response = "pdr_power_cavern_event_complete_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_power_cavern_reveal_a",
		probability = 1,
		response = "pdr_power_cavern_reveal_a",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_power_cavern_reveal_b",
		probability = 1,
		response = "pdr_power_cavern_reveal_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_power_escape_begin_a",
		probability = 1,
		response = "pdr_power_escape_begin_a",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_power_escape_begin_b",
		probability = 1,
		response = "pdr_power_escape_begin_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_power_escape_exit_tunnel_a",
		probability = 1,
		response = "pdr_power_escape_exit_tunnel_a",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_power_escape_exit_tunnel_a_safety",
		probability = 1,
		response = "pdr_power_escape_exit_tunnel_a_safety",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_power_escape_exit_tunnel_b",
		probability = 1,
		response = "pdr_power_escape_exit_tunnel_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_power_escape_final_word_b",
		probability = 1,
		response = "pdr_power_escape_final_word_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_power_escape_monster_fight_b",
		probability = 1,
		response = "pdr_power_escape_monster_fight_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_power_escape_monster_fight_end_a",
		probability = 1,
		response = "pdr_power_escape_monster_fight_end_a",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_power_escape_monster_reveal_a",
		probability = 1,
		response = "pdr_power_escape_monster_reveal_a",
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_power_escape_surprise_b",
		probability = 1,
		response = "pdr_power_escape_surprise_b",
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
				"dwarf_ranger",
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
		name = "pdr_power_escape_surprise_c",
		probability = 1,
		response = "pdr_power_escape_surprise_c",
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
				"dwarf_ranger",
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
		name = "pdr_power_first_interstitial_b",
		probability = 1,
		response = "pdr_power_first_interstitial_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_power_start_banter_b",
		probability = 1,
		response = "pdr_power_start_banter_b",
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
				"dwarf_ranger",
			},
		},
	})
	add_dialogues({
		pdr_power_bonus_mushroom_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_bonus_mushroom_a_01",
				[2] = "pdr_power_bonus_mushroom_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_bonus_mushroom_a_01",
				[2] = "pdr_power_bonus_mushroom_a_02",
			},
			sound_events_duration = {
				[1] = 4.108416557312,
				[2] = 2.4753124713898,
			},
		},
		pdr_power_bonus_mushroom_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_bonus_mushroom_b_01",
				[2] = "pdr_power_bonus_mushroom_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_bonus_mushroom_b_01",
				[2] = "pdr_power_bonus_mushroom_b_02",
			},
			sound_events_duration = {
				[1] = 3.7273540496826,
				[2] = 1.544145822525,
			},
		},
		pdr_power_broken_elevator_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_broken_elevator_a_01",
				[2] = "pdr_power_broken_elevator_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_broken_elevator_a_01",
				[2] = "pdr_power_broken_elevator_a_02",
			},
			sound_events_duration = {
				[1] = 2.6071875095367,
				[2] = 2.5700209140778,
			},
		},
		pdr_power_broken_elevator_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_broken_elevator_b_01",
				[2] = "pdr_power_broken_elevator_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_broken_elevator_b_01",
				[2] = "pdr_power_broken_elevator_b_02",
			},
			sound_events_duration = {
				[1] = 2.3984792232513,
				[2] = 1.7961041927338,
			},
		},
		pdr_power_cavern_bomb_leaves_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_cavern_bomb_leaves_b_01",
				[2] = "pdr_power_cavern_bomb_leaves_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_cavern_bomb_leaves_b_01",
				[2] = "pdr_power_cavern_bomb_leaves_b_02",
			},
			sound_events_duration = {
				[1] = 1.9864583015442,
				[2] = 1.8091249465942,
			},
		},
		pdr_power_cavern_debris_bridge_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_cavern_debris_bridge_a_01",
				[2] = "pdr_power_cavern_debris_bridge_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_cavern_debris_bridge_a_01",
				[2] = "pdr_power_cavern_debris_bridge_a_02",
			},
			sound_events_duration = {
				[1] = 2.8182916641235,
				[2] = 2.01597905159,
			},
		},
		pdr_power_cavern_disable_generator_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_cavern_disable_generator_a_01",
				[2] = "pdr_power_cavern_disable_generator_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_cavern_disable_generator_a_01",
				[2] = "pdr_power_cavern_disable_generator_a_02",
			},
			sound_events_duration = {
				[1] = 3.0767917633057,
				[2] = 3.827166557312,
			},
		},
		pdr_power_cavern_disable_generator_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_cavern_disable_generator_b_01",
				[2] = "pdr_power_cavern_disable_generator_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_cavern_disable_generator_b_01",
				[2] = "pdr_power_cavern_disable_generator_b_02",
			},
			sound_events_duration = {
				[1] = 3.3526875972748,
				[2] = 1.9237500429153,
			},
		},
		pdr_power_cavern_disable_warp_sphere_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_cavern_disable_warp_sphere_a_01",
				[2] = "pdr_power_cavern_disable_warp_sphere_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_cavern_disable_warp_sphere_a_01",
				[2] = "pdr_power_cavern_disable_warp_sphere_a_02",
			},
			sound_events_duration = {
				[1] = 2.1324167251587,
				[2] = 2.48472905159,
			},
		},
		pdr_power_cavern_disable_warp_sphere_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_cavern_disable_warp_sphere_b_01",
				[2] = "pdr_power_cavern_disable_warp_sphere_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_cavern_disable_warp_sphere_b_01",
				[2] = "pdr_power_cavern_disable_warp_sphere_b_02",
			},
			sound_events_duration = {
				[1] = 2.8787708282471,
				[2] = 2.2926042079926,
			},
		},
		pdr_power_cavern_disable_warp_sphere_complete_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_cavern_disable_warp_sphere_complete_b_01",
				[2] = "pdr_power_cavern_disable_warp_sphere_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_cavern_disable_warp_sphere_complete_b_01",
				[2] = "pdr_power_cavern_disable_warp_sphere_complete_b_02",
			},
			sound_events_duration = {
				[1] = 3.8738124370575,
				[2] = 4.5230832099915,
			},
		},
		pdr_power_cavern_disable_warp_sphere_complete_c = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_cavern_disable_warp_sphere_complete_c_01",
				[2] = "pdr_power_cavern_disable_warp_sphere_complete_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_cavern_disable_warp_sphere_complete_c_01",
				[2] = "pdr_power_cavern_disable_warp_sphere_complete_c_02",
			},
			sound_events_duration = {
				[1] = 2.5258750915527,
				[2] = 2.0517916679382,
			},
		},
		pdr_power_cavern_disable_wheel_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_cavern_disable_wheel_a_01",
				[2] = "pdr_power_cavern_disable_wheel_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_cavern_disable_wheel_a_01",
				[2] = "pdr_power_cavern_disable_wheel_a_02",
			},
			sound_events_duration = {
				[1] = 4.0056877136231,
				[2] = 6.0445418357849,
			},
		},
		pdr_power_cavern_disable_wheel_all_hands_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_cavern_disable_wheel_all_hands_a_01",
				[2] = "pdr_power_cavern_disable_wheel_all_hands_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_cavern_disable_wheel_all_hands_a_01",
				[2] = "pdr_power_cavern_disable_wheel_all_hands_a_02",
			},
			sound_events_duration = {
				[1] = 4.8882918357849,
				[2] = 2.1798748970032,
			},
		},
		pdr_power_cavern_disable_wheel_complete_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_cavern_disable_wheel_complete_a_01",
				[2] = "pdr_power_cavern_disable_wheel_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_cavern_disable_wheel_complete_a_01",
				[2] = "pdr_power_cavern_disable_wheel_complete_a_02",
			},
			sound_events_duration = {
				[1] = 4.370041847229,
				[2] = 4.8485207557678,
			},
		},
		pdr_power_cavern_disable_wheel_complete_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_cavern_disable_wheel_complete_b_01",
				[2] = "pdr_power_cavern_disable_wheel_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_cavern_disable_wheel_complete_b_01",
				[2] = "pdr_power_cavern_disable_wheel_complete_b_02",
			},
			sound_events_duration = {
				[1] = 4.8045625686645,
				[2] = 3.5614583492279,
			},
		},
		pdr_power_cavern_disable_wheel_complete_c = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_cavern_disable_wheel_complete_c_01",
				[2] = "pdr_power_cavern_disable_wheel_complete_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_cavern_disable_wheel_complete_c_01",
				[2] = "pdr_power_cavern_disable_wheel_complete_c_02",
			},
			sound_events_duration = {
				[1] = 2.5828125476837,
				[2] = 5.9077706336975,
			},
		},
		pdr_power_cavern_disable_wheel_two_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_cavern_disable_wheel_two_a_01",
				[2] = "pdr_power_cavern_disable_wheel_two_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_cavern_disable_wheel_two_a_01",
				[2] = "pdr_power_cavern_disable_wheel_two_a_02",
			},
			sound_events_duration = {
				[1] = 2.5628125667572,
				[2] = 2.2013957500458,
			},
		},
		pdr_power_cavern_disable_wheel_two_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_cavern_disable_wheel_two_b_01",
				[2] = "pdr_power_cavern_disable_wheel_two_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_cavern_disable_wheel_two_b_01",
				[2] = "pdr_power_cavern_disable_wheel_two_b_02",
			},
			sound_events_duration = {
				[1] = 2.5435209274292,
				[2] = 2.2970833778381,
			},
		},
		pdr_power_cavern_elevator_foot_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_cavern_elevator_foot_a_01",
				[2] = "pdr_power_cavern_elevator_foot_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_cavern_elevator_foot_a_01",
				[2] = "pdr_power_cavern_elevator_foot_a_02",
			},
			sound_events_duration = {
				[1] = 3.235208272934,
				[2] = 4.6366667747498,
			},
		},
		pdr_power_cavern_elevator_foot_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_cavern_elevator_foot_b_01",
				[2] = "pdr_power_cavern_elevator_foot_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_cavern_elevator_foot_b_01",
				[2] = "pdr_power_cavern_elevator_foot_b_02",
			},
			sound_events_duration = {
				[1] = 1.9733958244324,
				[2] = 3.5872707366943,
			},
		},
		pdr_power_cavern_event_complete_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_cavern_event_complete_b_01",
				[2] = "pdr_power_cavern_event_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_cavern_event_complete_b_01",
				[2] = "pdr_power_cavern_event_complete_b_02",
			},
			sound_events_duration = {
				[1] = 2.665854215622,
				[2] = 5.4879374504089,
			},
		},
		pdr_power_cavern_reveal_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_cavern_reveal_a_01",
				[2] = "pdr_power_cavern_reveal_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_cavern_reveal_a_01",
				[2] = "pdr_power_cavern_reveal_a_02",
			},
			sound_events_duration = {
				[1] = 1.7567083835602,
				[2] = 2.1983332633972,
			},
		},
		pdr_power_cavern_reveal_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_cavern_reveal_b_01",
				[2] = "pdr_power_cavern_reveal_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_cavern_reveal_b_01",
				[2] = "pdr_power_cavern_reveal_b_02",
			},
			sound_events_duration = {
				[1] = 3.3217709064484,
				[2] = 3.0659999847412,
			},
		},
		pdr_power_escape_begin_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_escape_begin_a_01",
				[2] = "pdr_power_escape_begin_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_escape_begin_a_01",
				[2] = "pdr_power_escape_begin_a_02",
			},
			sound_events_duration = {
				[1] = 2.0492084026337,
				[2] = 2.4601874351502,
			},
		},
		pdr_power_escape_begin_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_escape_begin_b_01",
				[2] = "pdr_power_escape_begin_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_escape_begin_b_01",
				[2] = "pdr_power_escape_begin_b_02",
			},
			sound_events_duration = {
				[1] = 2.1928124427795,
				[2] = 1.9427917003632,
			},
		},
		pdr_power_escape_exit_tunnel_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_escape_exit_tunnel_a_01",
				[2] = "pdr_power_escape_exit_tunnel_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_escape_exit_tunnel_a_01",
				[2] = "pdr_power_escape_exit_tunnel_a_02",
			},
			sound_events_duration = {
				[1] = 2.7544584274292,
				[2] = 2.2675623893738,
			},
		},
		pdr_power_escape_exit_tunnel_a_safety = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_escape_exit_tunnel_a_01",
				[2] = "pdr_power_escape_exit_tunnel_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_escape_exit_tunnel_a_01",
				[2] = "pdr_power_escape_exit_tunnel_a_02",
			},
			sound_events_duration = {
				[1] = 2.7544584274292,
				[2] = 2.2675623893738,
			},
		},
		pdr_power_escape_exit_tunnel_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_escape_exit_tunnel_b_01",
				[2] = "pdr_power_escape_exit_tunnel_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_escape_exit_tunnel_b_01",
				[2] = "pdr_power_escape_exit_tunnel_b_02",
			},
			sound_events_duration = {
				[1] = 1.4360624551773,
				[2] = 1.6327083110809,
			},
		},
		pdr_power_escape_final_word_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_escape_final_word_b_01",
				[2] = "pdr_power_escape_final_word_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_escape_final_word_b_01",
				[2] = "pdr_power_escape_final_word_b_02",
			},
			sound_events_duration = {
				[1] = 3.1078751087189,
				[2] = 4.8851251602173,
			},
		},
		pdr_power_escape_monster_fight_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_escape_monster_fight_b_01",
				[2] = "pdr_power_escape_monster_fight_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_escape_monster_fight_b_01",
				[2] = "pdr_power_escape_monster_fight_b_02",
			},
			sound_events_duration = {
				[1] = 2.2312083244324,
				[2] = 2.5189790725708,
			},
		},
		pdr_power_escape_monster_fight_end_a = {
			category = "npc_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_escape_monster_fight_end_a_01",
				[2] = "pdr_power_escape_monster_fight_end_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_escape_monster_fight_end_a_01",
				[2] = "pdr_power_escape_monster_fight_end_a_02",
			},
			sound_events_duration = {
				[1] = 2.1897292137146,
				[2] = 2.7469582557678,
			},
		},
		pdr_power_escape_monster_reveal_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_escape_monster_reveal_a_01",
				[2] = "pdr_power_escape_monster_reveal_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_escape_monster_reveal_a_01",
				[2] = "pdr_power_escape_monster_reveal_a_02",
			},
			sound_events_duration = {
				[1] = 2.7047708034515,
				[2] = 2.9824376106262,
			},
		},
		pdr_power_escape_surprise_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_escape_surprise_b_01",
				[2] = "pdr_power_escape_surprise_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_escape_surprise_b_01",
				[2] = "pdr_power_escape_surprise_b_02",
			},
			sound_events_duration = {
				[1] = 1.1229583024979,
				[2] = 1.0885833501816,
			},
		},
		pdr_power_escape_surprise_c = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_escape_surprise_c_01",
				[2] = "pdr_power_escape_surprise_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_escape_surprise_c_01",
				[2] = "pdr_power_escape_surprise_c_02",
			},
			sound_events_duration = {
				[1] = 1.4855833053589,
				[2] = 2.1124582290649,
			},
		},
		pdr_power_first_interstitial_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_first_interstitial_b_01",
				[2] = "pdr_power_first_interstitial_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_first_interstitial_b_01",
				[2] = "pdr_power_first_interstitial_b_02",
			},
			sound_events_duration = {
				[1] = 4.5289168357849,
				[2] = 4.0155210494995,
			},
		},
		pdr_power_start_banter_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_termite_2",
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
				[1] = "pdr_power_start_banter_b_01",
				[2] = "pdr_power_start_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_start_banter_b_01",
				[2] = "pdr_power_start_banter_b_02",
			},
			sound_events_duration = {
				[1] = 1.4352291822434,
				[2] = 3.1707708835602,
			},
		},
	})
end
