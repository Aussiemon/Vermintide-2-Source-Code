-- chunkname: @dialogues/generated/bright_wizard_bell.lua

return function ()
	define_rule({
		name = "pbw_bell_intro_a",
		probability = 1,
		response = "pbw_bell_intro_a",
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
				"bell_intro_a",
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
				"bell_intro_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bell_intro_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_bell_intro_b",
		probability = 1,
		response = "pbw_bell_intro_b",
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
				"bell_intro_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"bell_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bell_intro_b",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_bell_intro_c",
		probability = 1,
		response = "pbw_bell_intro_c",
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
				"bell_intro_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"bell_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bell_intro_c",
				OP.TIMESET,
			},
		},
	})
	add_dialogues({
		pbw_bell_intro_a = {
			category = "level_talk",
			database = "bright_wizard_bell",
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
				[1] = "pbw_bell_intro_a_01",
				[2] = "pbw_bell_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_bell_intro_a_01",
				[2] = "pbw_bell_intro_a_02",
			},
			sound_events_duration = {
				[1] = 5.9901251792908,
				[2] = 6.3613748550415,
			},
		},
		pbw_bell_intro_b = {
			category = "level_talk",
			database = "bright_wizard_bell",
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
				[1] = "pbw_bell_intro_b_01",
				[2] = "pbw_bell_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_bell_intro_b_01",
				[2] = "pbw_bell_intro_b_02",
			},
			sound_events_duration = {
				[1] = 6.2526249885559,
				[2] = 4.4450206756592,
			},
		},
		pbw_bell_intro_c = {
			category = "level_talk",
			database = "bright_wizard_bell",
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
				[1] = "pbw_bell_intro_c_01",
				[2] = "pbw_bell_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_bell_intro_c_01",
				[2] = "pbw_bell_intro_c_02",
			},
			sound_events_duration = {
				[1] = 6.9385209083557,
				[2] = 7.0117917060852,
			},
		},
	})
end
