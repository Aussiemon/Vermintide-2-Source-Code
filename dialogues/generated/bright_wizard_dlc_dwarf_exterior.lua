-- chunkname: @dialogues/generated/bright_wizard_dlc_dwarf_exterior.lua

return function ()
	define_rule({
		name = "pbw_dwarf_beacons_bridge_stuck_b",
		response = "pbw_dwarf_beacons_bridge_stuck_b",
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
				"dwarf_beacons_bridge_stuck_a",
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
				"dwarf_beacons_bridge_stuck_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_bridge_stuck_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_external_begin_end_event_b",
		response = "pbw_dwarf_external_begin_end_event_b",
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
				"dwarf_external_begin_end_event_a",
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
				"dwarf_external_begin_end_event_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_begin_end_event_b",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_external_cliff",
		response = "pbw_dwarf_external_cliff",
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
				"dwarf_external_cliff",
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
				"dwarf_external_cliff",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_cliff",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_external_elevator_briefing_a",
		response = "pbw_dwarf_external_elevator_briefing_a",
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
				"dwarf_external_elevator_briefing_a",
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
				"dwarf_external_elevator_briefing_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_elevator_briefing_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_external_elevator_briefing_c",
		response = "pbw_dwarf_external_elevator_briefing_c",
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
				"dwarf_external_elevator_briefing_b",
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
				"dwarf_external_elevator_briefing_c",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_elevator_briefing_c",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_external_end_event_complete_01_b",
		response = "pbw_dwarf_external_end_event_complete_01_b",
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
				"dwarf_external_end_event_complete_01_a",
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
				"dwarf_external_end_event_complete_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_end_event_complete_b",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_external_end_event_complete_02_b",
		response = "pbw_dwarf_external_end_event_complete_02_b",
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
				"dwarf_external_end_event_complete_02_a",
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
				"dwarf_external_end_event_complete_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_end_event_complete_b",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_external_end_event_complete_03_b",
		response = "pbw_dwarf_external_end_event_complete_03_b",
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
				"dwarf_external_end_event_complete_03_a",
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
				"dwarf_external_end_event_complete_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_end_event_complete_b",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_external_end_event_fuse_lit",
		response = "pbw_dwarf_external_end_event_fuse_lit",
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
				"dwarf_external_end_event_fuse_lit",
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
				"dwarf_external_end_event_fuse_lit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_end_event_fuse_lit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_external_event_reminder_b",
		response = "pbw_dwarf_external_event_reminder_b",
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
				"nde_dwarf_external_event_reminder_a",
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
				"dwarf_external_event_reminder_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_event_reminder_b",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_external_ghost_town_a",
		response = "pbw_dwarf_external_ghost_town_a",
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
				"dwarf_external_ghost_town_a",
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
				2,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"dwarf_external_ghost_town_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_ghost_town_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_external_mid_conversation_a_dummy",
		response = "pbw_dwarf_external_mid_conversation_a_dummy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				1,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				2,
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"dwarf_external_natural_beauty",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"dwarf_external_elevator_briefing_a",
				OP.NOT,
				"dwarf_external_elevator_briefing_a",
			},
			{
				"faction_memory",
				"dwarf_external_mid_conversation_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_mid_conversation_a",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_external_mid_event_done",
		response = "pbw_dwarf_external_mid_event_done",
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
				"dwarf_external_mid_event_done",
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
				"dwarf_external_mid_event_done",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_mid_event_done",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_external_mid_event_seen",
		response = "pbw_dwarf_external_mid_event_seen",
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
				"dwarf_external_mid_event_seen",
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
				"dwarf_external_mid_event_seen",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_mid_event_seen",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_external_migdahl_a",
		response = "pbw_dwarf_external_migdahl_a",
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
				"dwarf_external_migdahl_a",
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
				5,
			},
			{
				"faction_memory",
				"dwarf_external_migdahl_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_migdahl_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_external_natural_beauty",
		response = "pbw_dwarf_external_natural_beauty",
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
				"dwarf_external_natural_beauty",
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
				"dwarf_external_natural_beauty",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_natural_beauty",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_external_nearly_there_b",
		response = "pbw_dwarf_external_nearly_there_b",
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
				"dwarf_external_nearly_there_a",
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
				"dwarf_external_nearly_there_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_nearly_there_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_external_occupied_mine",
		response = "pbw_dwarf_external_occupied_mine",
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
				"dwarf_external_occupied_mine",
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
				"dwarf_external_occupied_mine",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_occupied_mine",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_external_safety_a",
		response = "pbw_dwarf_external_safety_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"intensity",
				OP.LT,
				20,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				30,
			},
			{
				"faction_memory",
				"dwarf_external_end_event_complete_b",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"dwarf_external_safety_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_safety_a",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_external_safety_c",
		response = "pbw_dwarf_external_safety_c",
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
				"dwarf_external_safety_b",
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
				"dwarf_external_safety_c",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_safety_c",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_external_skaven_works",
		response = "pbw_dwarf_external_skaven_works",
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
				"dwarf_external_skaven_works",
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
				"dwarf_external_skaven_works",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_skaven_works",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_external_start_banter_a",
		response = "pbw_dwarf_external_start_banter_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"dwarf_external_start_banter_a",
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
				"dwarf_external_start_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_start_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_external_start_banter_b",
		response = "pbw_dwarf_external_start_banter_b",
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
				"dwarf_external_start_banter_a",
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
		name = "pbw_dwarf_external_start_banter_c",
		response = "pbw_dwarf_external_start_banter_c",
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
				"dwarf_external_start_banter_b",
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
		name = "pbw_dwarf_external_which_way_a",
		response = "pbw_dwarf_external_which_way_a",
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
				"dwarf_external_which_way_a",
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
				"dwarf_external_which_way_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_which_way_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_external_which_way_c",
		response = "pbw_dwarf_external_which_way_c",
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
				"nde_dwarf_external_which_way_b",
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
				"dwarf_external_which_way_c",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_external_which_way_c",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pbw_dwarf_beacons_bridge_stuck_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				"pbw_dwarf_beacons_bridge_stuck_b_01",
				"pbw_dwarf_beacons_bridge_stuck_b_02",
				"pbw_dwarf_beacons_bridge_stuck_b_03",
				"pbw_dwarf_beacons_bridge_stuck_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_beacons_bridge_stuck_b_01",
				"pbw_dwarf_beacons_bridge_stuck_b_02",
				"pbw_dwarf_beacons_bridge_stuck_b_03",
				"pbw_dwarf_beacons_bridge_stuck_b_04",
			},
			sound_events_duration = {
				2.209979057312,
				1.6829999685288,
				1.9439791440964,
				1.1219791173935,
			},
		},
		pbw_dwarf_external_begin_end_event_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				"pbw_dwarf_external_begin_end_event_b_01",
				"pbw_dwarf_external_begin_end_event_b_02",
				"pbw_dwarf_external_begin_end_event_b_03",
				"pbw_dwarf_external_begin_end_event_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_external_begin_end_event_b_01",
				"pbw_dwarf_external_begin_end_event_b_02",
				"pbw_dwarf_external_begin_end_event_b_03",
				"pbw_dwarf_external_begin_end_event_b_04",
			},
			sound_events_duration = {
				0.99099999666214,
				2.1989998817444,
				2.0099792480469,
				1.6959999799728,
			},
		},
		pbw_dwarf_external_cliff = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				"pbw_dwarf_external_cliff_01",
				"pbw_dwarf_external_cliff_02",
				"pbw_dwarf_external_cliff_03",
				"pbw_dwarf_external_cliff_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_external_cliff_01",
				"pbw_dwarf_external_cliff_02",
				"pbw_dwarf_external_cliff_03",
				"pbw_dwarf_external_cliff_04",
			},
			sound_events_duration = {
				4.776978969574,
				5.0459790229797,
				3.470999956131,
				3.4800000190735,
			},
		},
		pbw_dwarf_external_elevator_briefing_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				"pbw_dwarf_external_elevator_briefing_a_01",
				"pbw_dwarf_external_elevator_briefing_a_02",
				"pbw_dwarf_external_elevator_briefing_a_03",
				"pbw_dwarf_external_elevator_briefing_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_external_elevator_briefing_a_01",
				"pbw_dwarf_external_elevator_briefing_a_02",
				"pbw_dwarf_external_elevator_briefing_a_03",
				"pbw_dwarf_external_elevator_briefing_a_04",
			},
			sound_events_duration = {
				3.937979221344,
				3.9509792327881,
				4.2559790611267,
				7.6529793739319,
			},
		},
		pbw_dwarf_external_elevator_briefing_c = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				"pbw_dwarf_external_elevator_briefing_c_01",
				"pbw_dwarf_external_elevator_briefing_c_02",
				"pbw_dwarf_external_elevator_briefing_c_03",
				"pbw_dwarf_external_elevator_briefing_c_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_external_elevator_briefing_c_01",
				"pbw_dwarf_external_elevator_briefing_c_02",
				"pbw_dwarf_external_elevator_briefing_c_03",
				"pbw_dwarf_external_elevator_briefing_c_04",
			},
			sound_events_duration = {
				1.3059791326523,
				2.2379791736603,
				3.506979227066,
				2.8090000152588,
			},
		},
		pbw_dwarf_external_end_event_complete_01_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				[1] = "pbw_dwarf_external_end_event_complete_01_b_01",
				[2] = "pbw_dwarf_external_end_event_complete_01_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_dwarf_external_end_event_complete_01_b_01",
				[2] = "pbw_dwarf_external_end_event_complete_01_b_02",
			},
			sound_events_duration = {
				[1] = 3.9389791488648,
				[2] = 2.8649792671204,
			},
		},
		pbw_dwarf_external_end_event_complete_02_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				[1] = "pbw_dwarf_external_end_event_complete_02_b_01",
				[2] = "pbw_dwarf_external_end_event_complete_02_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_dwarf_external_end_event_complete_02_b_01",
				[2] = "pbw_dwarf_external_end_event_complete_02_b_02",
			},
			sound_events_duration = {
				[1] = 3.3779792785645,
				[2] = 2.7649791240692,
			},
		},
		pbw_dwarf_external_end_event_complete_03_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				[1] = "pbw_dwarf_external_end_event_complete_03_b_01",
				[2] = "pbw_dwarf_external_end_event_complete_03_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_dwarf_external_end_event_complete_03_b_01",
				[2] = "pbw_dwarf_external_end_event_complete_03_b_02",
			},
			sound_events_duration = {
				[1] = 3.558000087738,
				[2] = 5.0599789619446,
			},
		},
		pbw_dwarf_external_end_event_fuse_lit = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				"pbw_objective_skaven_tunnels_lighting_the_fuse_01",
				"pbw_objective_skaven_tunnels_lighting_the_fuse_02",
				"pbw_objective_skaven_tunnels_lighting_the_fuse_03",
				"pbw_objective_skaven_tunnels_lighting_the_fuse_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_skaven_tunnels_lighting_the_fuse_01",
				"pbw_objective_skaven_tunnels_lighting_the_fuse_02",
				"pbw_objective_skaven_tunnels_lighting_the_fuse_03",
				"pbw_objective_skaven_tunnels_lighting_the_fuse_04",
			},
			sound_events_duration = {
				2.1522917747498,
				2.0030832290649,
				1.9526875019074,
				1.4683542251587,
			},
		},
		pbw_dwarf_external_event_reminder_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				"pbw_dwarf_external_event_reminder_b_01",
				"pbw_dwarf_external_event_reminder_b_02",
				"pbw_dwarf_external_event_reminder_b_03",
				"pbw_dwarf_external_event_reminder_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_external_event_reminder_b_01",
				"pbw_dwarf_external_event_reminder_b_02",
				"pbw_dwarf_external_event_reminder_b_03",
				"pbw_dwarf_external_event_reminder_b_04",
			},
			sound_events_duration = {
				2.7009999752045,
				2.6129999160767,
				2.4209792613983,
				2.3839790821075,
			},
		},
		pbw_dwarf_external_ghost_town_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				"pbw_dwarf_external_ghost_town_a_01",
				"pbw_dwarf_external_ghost_town_a_02",
				"pbw_dwarf_external_ghost_town_a_03",
				"pbw_dwarf_external_ghost_town_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_external_ghost_town_a_01",
				"pbw_dwarf_external_ghost_town_a_02",
				"pbw_dwarf_external_ghost_town_a_03",
				"pbw_dwarf_external_ghost_town_a_04",
			},
			sound_events_duration = {
				2.3159792423248,
				4.6509790420532,
				3.3499791622162,
				4.4349789619446,
			},
		},
		pbw_dwarf_external_mid_conversation_a_dummy = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_exterior",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "dwarf_external_mid_conversation_a",
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
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
		pbw_dwarf_external_mid_event_done = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_arena_ice_continue_01",
				"pbw_arena_ice_continue_03",
				"pbw_arena_ice_continue_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_arena_ice_continue_01",
				"pbw_arena_ice_continue_03",
				"pbw_arena_ice_continue_04",
			},
			sound_events_duration = {
				1.4616667032242,
				1.4691874980927,
				1.6439167261124,
			},
		},
		pbw_dwarf_external_mid_event_seen = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				"pbw_level_helmgart_military_locked_portcullis_01",
				"pbw_level_helmgart_military_locked_portcullis_02",
				"pbw_level_helmgart_military_locked_portcullis_03",
				"pbw_level_helmgart_military_locked_portcullis_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_helmgart_military_locked_portcullis_01",
				"pbw_level_helmgart_military_locked_portcullis_02",
				"pbw_level_helmgart_military_locked_portcullis_03",
				"pbw_level_helmgart_military_locked_portcullis_04",
			},
			sound_events_duration = {
				1.3462916612625,
				2.0394062399864,
				3.1770625114441,
				4.1369376182556,
			},
		},
		pbw_dwarf_external_migdahl_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				"pbw_dwarf_external_migdahl_a_01",
				"pbw_dwarf_external_migdahl_a_02",
				"pbw_dwarf_external_migdahl_a_03",
				"pbw_dwarf_external_migdahl_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_external_migdahl_a_01",
				"pbw_dwarf_external_migdahl_a_02",
				"pbw_dwarf_external_migdahl_a_03",
				"pbw_dwarf_external_migdahl_a_04",
			},
			sound_events_duration = {
				3.9909791946411,
				5.4210000038147,
				3.8329792022705,
				6.2369790077209,
			},
		},
		pbw_dwarf_external_natural_beauty = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				"pbw_dwarf_external_natural_beauty_01",
				"pbw_dwarf_external_natural_beauty_02",
				"pbw_dwarf_external_natural_beauty_03",
				"pbw_dwarf_external_natural_beauty_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_external_natural_beauty_01",
				"pbw_dwarf_external_natural_beauty_02",
				"pbw_dwarf_external_natural_beauty_03",
				"pbw_dwarf_external_natural_beauty_04",
			},
			sound_events_duration = {
				3.4519791603088,
				3.477979183197,
				4.6599793434143,
				4.0439791679382,
			},
		},
		pbw_dwarf_external_nearly_there_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				"pbw_dwarf_external_nearly_there_b_01",
				"pbw_dwarf_external_nearly_there_b_02",
				"pbw_dwarf_external_nearly_there_b_03",
				"pbw_dwarf_external_nearly_there_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_external_nearly_there_b_01",
				"pbw_dwarf_external_nearly_there_b_02",
				"pbw_dwarf_external_nearly_there_b_03",
				"pbw_dwarf_external_nearly_there_b_04",
			},
			sound_events_duration = {
				2.8929791450501,
				4.1409997940064,
				5.3429789543152,
				6.8789792060852,
			},
		},
		pbw_dwarf_external_occupied_mine = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				"pbw_dwarf_external_occupied_mine_01",
				"pbw_dwarf_external_occupied_mine_02",
				"pbw_dwarf_external_occupied_mine_03",
				"pbw_dwarf_external_occupied_mine_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_external_occupied_mine_01",
				"pbw_dwarf_external_occupied_mine_02",
				"pbw_dwarf_external_occupied_mine_03",
				"pbw_dwarf_external_occupied_mine_04",
			},
			sound_events_duration = {
				3.7260000705719,
				4.4029793739319,
				5.2709794044495,
				2.4929790496826,
			},
		},
		pbw_dwarf_external_safety_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				"pbw_dwarf_external_safety_a_01",
				"pbw_dwarf_external_safety_a_02",
				"pbw_dwarf_external_safety_a_03",
				"pbw_dwarf_external_safety_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_external_safety_a_01",
				"pbw_dwarf_external_safety_a_02",
				"pbw_dwarf_external_safety_a_03",
				"pbw_dwarf_external_safety_a_04",
			},
			sound_events_duration = {
				2.2829999923706,
				3.9790000915527,
				6.5069789886475,
				4.0999999046326,
			},
		},
		pbw_dwarf_external_safety_c = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				"pbw_dwarf_external_safety_c_01",
				"pbw_dwarf_external_safety_c_02",
				"pbw_dwarf_external_safety_c_03",
				"pbw_dwarf_external_safety_c_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_external_safety_c_01",
				"pbw_dwarf_external_safety_c_02",
				"pbw_dwarf_external_safety_c_03",
				"pbw_dwarf_external_safety_c_04",
			},
			sound_events_duration = {
				6.3779792785644,
				2.1419792175293,
				4.6499791145325,
				6.4119791984558,
			},
		},
		pbw_dwarf_external_skaven_works = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				"pbw_dwarf_external_skaven_works_01",
				"pbw_dwarf_external_skaven_works_02",
				"pbw_dwarf_external_skaven_works_03",
				"pbw_dwarf_external_skaven_works_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_external_skaven_works_01",
				"pbw_dwarf_external_skaven_works_02",
				"pbw_dwarf_external_skaven_works_03",
				"pbw_dwarf_external_skaven_works_04",
			},
			sound_events_duration = {
				2.437979221344,
				3.4969792366028,
				4.0209794044495,
				4.9479789733887,
			},
		},
		pbw_dwarf_external_start_banter_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				[1] = "pbw_dwarf_external_start_banter_a_01",
				[2] = "pbw_dwarf_external_start_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_dwarf_external_start_banter_a_01",
				[2] = "pbw_dwarf_external_start_banter_a_02",
			},
			sound_events_duration = {
				[1] = 3.595999956131,
				[2] = 2.9729790687561,
			},
		},
		pbw_dwarf_external_start_banter_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				[1] = "pbw_dwarf_external_start_banter_b_01",
				[2] = "pbw_dwarf_external_start_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_dwarf_external_start_banter_b_01",
				[2] = "pbw_dwarf_external_start_banter_b_02",
			},
			sound_events_duration = {
				[1] = 4.1100001335144,
				[2] = 4.5009789466858,
			},
		},
		pbw_dwarf_external_start_banter_c = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				[1] = "pbw_dwarf_external_start_banter_c_01",
				[2] = "pbw_dwarf_external_start_banter_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_dwarf_external_start_banter_c_01",
				[2] = "pbw_dwarf_external_start_banter_c_02",
			},
			sound_events_duration = {
				[1] = 5.0469789505005,
				[2] = 4.6709790229797,
			},
		},
		pbw_dwarf_external_which_way_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				"pbw_dwarf_external_which_way_a_01",
				"pbw_dwarf_external_which_way_a_02",
				"pbw_dwarf_external_which_way_a_03",
				"pbw_dwarf_external_which_way_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_external_which_way_a_01",
				"pbw_dwarf_external_which_way_a_02",
				"pbw_dwarf_external_which_way_a_03",
				"pbw_dwarf_external_which_way_a_04",
			},
			sound_events_duration = {
				2.8239998817444,
				2.3699791431427,
				3.0669791698456,
				3.2069792747498,
			},
		},
		pbw_dwarf_external_which_way_c = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_exterior",
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
				"pbw_dwarf_external_which_way_c_01",
				"pbw_dwarf_external_which_way_c_02",
				"pbw_dwarf_external_which_way_c_03",
				"pbw_dwarf_external_which_way_c_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_external_which_way_c_01",
				"pbw_dwarf_external_which_way_c_02",
				"pbw_dwarf_external_which_way_c_03",
				"pbw_dwarf_external_which_way_c_04",
			},
			sound_events_duration = {
				3.1749792098999,
				3.8250000476837,
				2.7669792175293,
				3.329999923706,
			},
		},
	})
end
