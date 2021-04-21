return function ()
	define_rule({
		name = "pwh_morris_introspection",
		response = "pwh_morris_introspection",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				15
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"pwh_morris_introspection",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_introspection",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_morris_introspection",
		response = "pbw_morris_introspection",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				15
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"pbw_morris_introspection",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_introspection",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_morris_introspection",
		response = "pdr_morris_introspection",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				15
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"pdr_morris_introspection",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_introspection",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_morris_introspection",
		response = "pwe_morris_introspection",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				15
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"pwe_morris_introspection",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_introspection",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_morris_introspection",
		response = "pes_morris_introspection",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				15
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"pes_morris_introspection",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_introspection",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pdr_morris_introspection = {
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "hero_conversations_dlc_morris_introspect",
			sound_events_n = 15,
			category = "story_talk",
			dialogue_animations_n = 15,
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_introspection_01",
				"pdr_morris_introspection_02",
				"pdr_morris_introspection_03",
				"pdr_morris_introspection_04",
				"pdr_morris_introspection_05",
				"pdr_morris_introspection_06",
				"pdr_morris_introspection_07",
				"pdr_morris_introspection_08",
				"pdr_morris_introspection_09",
				"pdr_morris_introspection_10",
				"pdr_morris_introspection_11",
				"pdr_morris_introspection_12",
				"pdr_morris_introspection_13",
				"pdr_morris_introspection_14",
				"pdr_morris_introspection_15"
			},
			sound_events_duration = {
				7.5650000572205,
				8.685396194458,
				6.5906457901001,
				8.1740627288818,
				8.0580415725708,
				6.5886039733887,
				8.21399974823,
				7.871208190918,
				7.9578957557678,
				6.8152084350586,
				7.5818958282471,
				5.6564373970032,
				6.9813957214356,
				6.316041469574,
				4.5605206489563
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_morris_introspection_01",
				"pdr_morris_introspection_02",
				"pdr_morris_introspection_03",
				"pdr_morris_introspection_04",
				"pdr_morris_introspection_05",
				"pdr_morris_introspection_06",
				"pdr_morris_introspection_07",
				"pdr_morris_introspection_08",
				"pdr_morris_introspection_09",
				"pdr_morris_introspection_10",
				"pdr_morris_introspection_11",
				"pdr_morris_introspection_12",
				"pdr_morris_introspection_13",
				"pdr_morris_introspection_14",
				"pdr_morris_introspection_15"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			}
		},
		pwh_morris_introspection = {
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "hero_conversations_dlc_morris_introspect",
			sound_events_n = 15,
			category = "story_talk",
			dialogue_animations_n = 15,
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_introspection_01",
				"pwh_morris_introspection_02",
				"pwh_morris_introspection_03",
				"pwh_morris_introspection_04",
				"pwh_morris_introspection_05",
				"pwh_morris_introspection_06",
				"pwh_morris_introspection_07",
				"pwh_morris_introspection_08",
				"pwh_morris_introspection_09",
				"pwh_morris_introspection_10",
				"pwh_morris_introspection_11",
				"pwh_morris_introspection_12",
				"pwh_morris_introspection_13",
				"pwh_morris_introspection_14",
				"pwh_morris_introspection_15"
			},
			sound_events_duration = {
				3.2084167003632,
				4.7127084732056,
				4.7969584465027,
				5.5999999046326,
				6.3496875762939,
				2.5860209465027,
				4.9425835609436,
				4.8541040420532,
				9.3372917175293,
				3.7032499313355,
				5.4826040267944,
				3.92933344841,
				5.2438960075378,
				5.6026043891907,
				4.8982915878296
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwh_morris_introspection_01",
				"pwh_morris_introspection_02",
				"pwh_morris_introspection_03",
				"pwh_morris_introspection_04",
				"pwh_morris_introspection_05",
				"pwh_morris_introspection_06",
				"pwh_morris_introspection_07",
				"pwh_morris_introspection_08",
				"pwh_morris_introspection_09",
				"pwh_morris_introspection_10",
				"pwh_morris_introspection_11",
				"pwh_morris_introspection_12",
				"pwh_morris_introspection_13",
				"pwh_morris_introspection_14",
				"pwh_morris_introspection_15"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			}
		},
		pbw_morris_introspection = {
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "hero_conversations_dlc_morris_introspect",
			sound_events_n = 15,
			category = "story_talk",
			dialogue_animations_n = 15,
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_introspection_01",
				"pbw_morris_introspection_02",
				"pbw_morris_introspection_03",
				"pbw_morris_introspection_04",
				"pbw_morris_introspection_05",
				"pbw_morris_introspection_06",
				"pbw_morris_introspection_07",
				"pbw_morris_introspection_08",
				"pbw_morris_introspection_09",
				"pbw_morris_introspection_10",
				"pbw_morris_introspection_11",
				"pbw_morris_introspection_12",
				"pbw_morris_introspection_13",
				"pbw_morris_introspection_14",
				"pbw_morris_introspection_15"
			},
			sound_events_duration = {
				7.6368126869202,
				5.451208114624,
				5.6040625572205,
				7.1569166183472,
				5.9784374237061,
				8.001916885376,
				7.181583404541,
				6.5701456069946,
				6.116229057312,
				7.5971875190735,
				5.6886248588562,
				8.2011041641235,
				7.2628540992737,
				5.3365206718445,
				8.0164375305176
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pbw_morris_introspection_01",
				"pbw_morris_introspection_02",
				"pbw_morris_introspection_03",
				"pbw_morris_introspection_04",
				"pbw_morris_introspection_05",
				"pbw_morris_introspection_06",
				"pbw_morris_introspection_07",
				"pbw_morris_introspection_08",
				"pbw_morris_introspection_09",
				"pbw_morris_introspection_10",
				"pbw_morris_introspection_11",
				"pbw_morris_introspection_12",
				"pbw_morris_introspection_13",
				"pbw_morris_introspection_14",
				"pbw_morris_introspection_15"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			}
		},
		pwe_morris_introspection = {
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "hero_conversations_dlc_morris_introspect",
			sound_events_n = 15,
			category = "story_talk",
			dialogue_animations_n = 15,
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_introspection_01",
				"pwe_morris_introspection_02",
				"pwe_morris_introspection_03",
				"pwe_morris_introspection_04",
				"pwe_morris_introspection_05",
				"pwe_morris_introspection_06",
				"pwe_morris_introspection_07",
				"pwe_morris_introspection_08",
				"pwe_morris_introspection_09",
				"pwe_morris_introspection_10",
				"pwe_morris_introspection_11",
				"pwe_morris_introspection_12",
				"pwe_morris_introspection_13",
				"pwe_morris_introspection_14",
				"pwe_morris_introspection_15"
			},
			sound_events_duration = {
				2.7760207653046,
				5.1915831565857,
				4.0806875228882,
				6.0001873970032,
				5.417396068573,
				3.2182500362396,
				5.8921041488647,
				5.4889168739319,
				4.5330729484558,
				4.2813539505005,
				7.7257709503174,
				4.7814583778381,
				7.7360625267029,
				7.1546459197998,
				5.5269165039063
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwe_morris_introspection_01",
				"pwe_morris_introspection_02",
				"pwe_morris_introspection_03",
				"pwe_morris_introspection_04",
				"pwe_morris_introspection_05",
				"pwe_morris_introspection_06",
				"pwe_morris_introspection_07",
				"pwe_morris_introspection_08",
				"pwe_morris_introspection_09",
				"pwe_morris_introspection_10",
				"pwe_morris_introspection_11",
				"pwe_morris_introspection_12",
				"pwe_morris_introspection_13",
				"pwe_morris_introspection_14",
				"pwe_morris_introspection_15"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			}
		},
		pes_morris_introspection = {
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "hero_conversations_dlc_morris_introspect",
			sound_events_n = 15,
			category = "story_talk",
			dialogue_animations_n = 15,
			randomize_indexes = {},
			sound_events = {
				"pes_morris_introspection_01",
				"pes_morris_introspection_02",
				"pes_morris_introspection_03",
				"pes_morris_introspection_04",
				"pes_morris_introspection_05",
				"pes_morris_introspection_06",
				"pes_morris_introspection_07",
				"pes_morris_introspection_08",
				"pes_morris_introspection_09",
				"pes_morris_introspection_10",
				"pes_morris_introspection_11",
				"pes_morris_introspection_12",
				"pes_morris_introspection_13",
				"pes_morris_introspection_14",
				"pes_morris_introspection_15"
			},
			sound_events_duration = {
				3.3608334064484,
				3.9082708358765,
				3.5379791259766,
				5.7867293357849,
				5.893937587738,
				4.3664999008179,
				3.6116042137146,
				5.5626873970032,
				4.2566041946411,
				4.4922289848328,
				4.4332914352417,
				7.1131043434143,
				5.3880624771118,
				6.2105832099915,
				5.0647916793823
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_morris_introspection_01",
				"pes_morris_introspection_02",
				"pes_morris_introspection_03",
				"pes_morris_introspection_04",
				"pes_morris_introspection_05",
				"pes_morris_introspection_06",
				"pes_morris_introspection_07",
				"pes_morris_introspection_08",
				"pes_morris_introspection_09",
				"pes_morris_introspection_10",
				"pes_morris_introspection_11",
				"pes_morris_introspection_12",
				"pes_morris_introspection_13",
				"pes_morris_introspection_14",
				"pes_morris_introspection_15"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			}
		}
	})
end
