return function ()
	define_rule({
		name = "pbw_wv_afternoon_rain",
		response = "pbw_wv_afternoon_rain",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_afternoon_rain_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pbw_wv_dawn_rain",
		response = "pbw_wv_dawn_rain",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dawn_rain_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pbw_wv_dawn_snow",
		response = "pbw_wv_dawn_snow",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dawn_snow_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pbw_wv_dusk_rain",
		response = "pbw_wv_dusk_rain",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dusk_rain_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pbw_wv_dusk_snow",
		response = "pbw_wv_dusk_snow",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dusk_snow_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pbw_wv_dusk_storm",
		response = "pbw_wv_dusk_storm",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dusk_storm_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pbw_wv_midday_sunny",
		response = "pbw_wv_midday_sunny",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_midday_sunny_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pbw_wv_midnight_clear",
		response = "pbw_wv_midnight_clear",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_midnight_clear_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pbw_wv_midnight_fog",
		response = "pbw_wv_midnight_fog",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_midnight_fog_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pbw_wv_midnight_storm",
		response = "pbw_wv_midnight_storm",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_midnight_storm_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pdr_wv_afternoon_rain",
		response = "pdr_wv_afternoon_rain",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_afternoon_rain_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pdr_wv_dawn_rain",
		response = "pdr_wv_dawn_rain",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dawn_rain_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pdr_wv_dawn_snow",
		response = "pdr_wv_dawn_snow",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dawn_snow_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pdr_wv_dusk_rain",
		response = "pdr_wv_dusk_rain",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dusk_rain_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pdr_wv_dusk_snow",
		response = "pdr_wv_dusk_snow",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dusk_snow_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pdr_wv_dusk_storm",
		response = "pdr_wv_dusk_storm",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dusk_storm_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pdr_wv_midday_sunny",
		response = "pdr_wv_midday_sunny",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_midday_sunny_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pdr_wv_midnight_clear",
		response = "pdr_wv_midnight_clear",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_midnight_clear_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pdr_wv_midnight_fog",
		response = "pdr_wv_midnight_fog",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_midnight_fog_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pdr_wv_midnight_storm",
		response = "pdr_wv_midnight_storm",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_midnight_storm_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pes_wv_afternoon_rain",
		response = "pes_wv_afternoon_rain",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_afternoon_rain_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pes_wv_dawn_rain",
		response = "pes_wv_dawn_rain",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dawn_rain_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pes_wv_dawn_snow",
		response = "pes_wv_dawn_snow",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dawn_snow_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pes_wv_dusk_rain",
		response = "pes_wv_dusk_rain",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dusk_rain_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pes_wv_dusk_snow",
		response = "pes_wv_dusk_snow",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dusk_snow_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pes_wv_dusk_storm",
		response = "pes_wv_dusk_storm",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dusk_storm_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pes_wv_midday_sunny",
		response = "pes_wv_midday_sunny",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_midday_sunny_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pes_wv_midnight_clear",
		response = "pes_wv_midnight_clear",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_midnight_clear_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pes_wv_midnight_fog",
		response = "pes_wv_midnight_fog",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_midnight_fog_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pes_wv_midnight_storm",
		response = "pes_wv_midnight_storm",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_midnight_storm_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pwe_wv_afternoon_rain",
		response = "pwe_wv_afternoon_rain",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_afternoon_rain_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pwe_wv_dawn_rain",
		response = "pwe_wv_dawn_rain",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dawn_rain_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pwe_wv_dawn_snow",
		response = "pwe_wv_dawn_snow",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dawn_snow_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pwe_wv_dusk_rain",
		response = "pwe_wv_dusk_rain",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dusk_rain_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pwe_wv_dusk_snow",
		response = "pwe_wv_dusk_snow",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dusk_snow_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pwe_wv_dusk_storm",
		response = "pwe_wv_dusk_storm",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dusk_storm_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pwe_wv_midday_sunny",
		response = "pwe_wv_midday_sunny",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_midday_sunny_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pwe_wv_midnight_clear",
		response = "pwe_wv_midnight_clear",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_midnight_clear_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pwe_wv_midnight_fog",
		response = "pwe_wv_midnight_fog",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_midnight_fog_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pwe_wv_midnight_storm",
		response = "pwe_wv_midnight_storm",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_midnight_storm_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pwh_wv_afternoon_rain",
		response = "pwh_wv_afternoon_rain",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_afternoon_rain_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pwh_wv_dawn_rain",
		response = "pwh_wv_dawn_rain",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dawn_rain_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pwh_wv_dawn_snow",
		response = "pwh_wv_dawn_snow",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dawn_snow_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pwh_wv_dusk_rain",
		response = "pwh_wv_dusk_rain",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dusk_rain_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pwh_wv_dusk_snow",
		response = "pwh_wv_dusk_snow",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dusk_snow_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pwh_wv_dusk_storm",
		response = "pwh_wv_dusk_storm",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_dusk_storm_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pwh_wv_midday_sunny",
		response = "pwh_wv_midday_sunny",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_midday_sunny_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pwh_wv_midnight_clear",
		response = "pwh_wv_midnight_clear",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_midnight_clear_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pwh_wv_midnight_fog",
		response = "pwh_wv_midnight_fog",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_midnight_fog_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		name = "pwh_wv_midnight_storm",
		response = "pwh_wv_midnight_storm",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"weather",
				OP.EQ,
				"wv_midnight_storm_01"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"weather_vo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"weather_vo",
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
		pbw_wv_afternoon_rain = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_wv_afternoon_rain_01",
				[2.0] = "pbw_wv_afternoon_rain_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_wv_afternoon_rain_01",
				[2.0] = "pbw_wv_afternoon_rain_02"
			},
			sound_events_duration = {
				[1.0] = 1.9349166154861,
				[2.0] = 2.4431250095367
			}
		},
		pbw_wv_dawn_rain = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_wv_dawn_rain_01",
				[2.0] = "pbw_wv_dawn_rain_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_wv_dawn_rain_01",
				[2.0] = "pbw_wv_dawn_rain_02"
			},
			sound_events_duration = {
				[1.0] = 2.8301665782928,
				[2.0] = 4.1285834312439
			}
		},
		pbw_wv_dawn_snow = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_wv_dawn_snow_01",
				[2.0] = "pbw_wv_dawn_snow_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_wv_dawn_snow_01",
				[2.0] = "pbw_wv_dawn_snow_02"
			},
			sound_events_duration = {
				[1.0] = 4.2023334503174,
				[2.0] = 2.6906666755676
			}
		},
		pbw_wv_dusk_rain = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_wv_dusk_rain_01",
				[2.0] = "pbw_wv_dusk_rain_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_wv_dusk_rain_01",
				[2.0] = "pbw_wv_dusk_rain_02"
			},
			sound_events_duration = {
				[1.0] = 2.5758957862854,
				[2.0] = 4.1653332710266
			}
		},
		pbw_wv_dusk_snow = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_wv_dusk_snow_01",
				[2.0] = "pbw_wv_dusk_snow_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_wv_dusk_snow_01",
				[2.0] = "pbw_wv_dusk_snow_02"
			},
			sound_events_duration = {
				[1.0] = 3.4916040897369,
				[2.0] = 4.2035207748413
			}
		},
		pbw_wv_dusk_storm = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_wv_dusk_storm_01",
				[2.0] = "pbw_wv_dusk_storm_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_wv_dusk_storm_01",
				[2.0] = "pbw_wv_dusk_storm_02"
			},
			sound_events_duration = {
				[1.0] = 3.8473334312439,
				[2.0] = 4.3800206184387
			}
		},
		pbw_wv_midday_sunny = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_wv_midday_sunny_01",
				[2.0] = "pbw_wv_midday_sunny_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_wv_midday_sunny_01",
				[2.0] = "pbw_wv_midday_sunny_02"
			},
			sound_events_duration = {
				[1.0] = 5.0870623588562,
				[2.0] = 4.0594582557678
			}
		},
		pbw_wv_midnight_clear = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_wv_midnight_clear_01",
				[2.0] = "pbw_wv_midnight_clear_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_wv_midnight_clear_01",
				[2.0] = "pbw_wv_midnight_clear_02"
			},
			sound_events_duration = {
				[1.0] = 6.3450832366943,
				[2.0] = 3.0348541736603
			}
		},
		pbw_wv_midnight_fog = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_wv_midnight_fog_01",
				[2.0] = "pbw_wv_midnight_fog_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_wv_midnight_fog_01",
				[2.0] = "pbw_wv_midnight_fog_02"
			},
			sound_events_duration = {
				[1.0] = 3.1519374847412,
				[2.0] = 3.8616666793823
			}
		},
		pbw_wv_midnight_storm = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_wv_midnight_storm_01",
				[2.0] = "pbw_wv_midnight_storm_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_wv_midnight_storm_01",
				[2.0] = "pbw_wv_midnight_storm_02"
			},
			sound_events_duration = {
				[1.0] = 3.1857917308807,
				[2.0] = 1.7188333272934
			}
		},
		pdr_wv_afternoon_rain = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_wv_afternoon_rain_01",
				[2.0] = "pdr_wv_afternoon_rain_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_wv_afternoon_rain_01",
				[2.0] = "pdr_wv_afternoon_rain_02"
			},
			sound_events_duration = {
				[1.0] = 2.1442708969116,
				[2.0] = 2.3664374351502
			}
		},
		pdr_wv_dawn_rain = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_wv_dawn_rain_01",
				[2.0] = "pdr_wv_dawn_rain_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_wv_dawn_rain_01",
				[2.0] = "pdr_wv_dawn_rain_02"
			},
			sound_events_duration = {
				[1.0] = 2.1583542823791,
				[2.0] = 2.4777083396912
			}
		},
		pdr_wv_dawn_snow = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_wv_dawn_snow_01",
				[2.0] = "pdr_wv_dawn_snow_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_wv_dawn_snow_01",
				[2.0] = "pdr_wv_dawn_snow_02"
			},
			sound_events_duration = {
				[1.0] = 2.3033957481384,
				[2.0] = 3.2941875457764
			}
		},
		pdr_wv_dusk_rain = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_wv_dusk_rain_01",
				[2.0] = "pdr_wv_dusk_rain_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_wv_dusk_rain_01",
				[2.0] = "pdr_wv_dusk_rain_02"
			},
			sound_events_duration = {
				[1.0] = 2.4478750228882,
				[2.0] = 2.6602916717529
			}
		},
		pdr_wv_dusk_snow = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_wv_dusk_snow_01",
				[2.0] = "pdr_wv_dusk_snow_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_wv_dusk_snow_01",
				[2.0] = "pdr_wv_dusk_snow_02"
			},
			sound_events_duration = {
				[1.0] = 2.3128750324249,
				[2.0] = 1.2116667032242
			}
		},
		pdr_wv_dusk_storm = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_wv_dusk_storm_01",
				[2.0] = "pdr_wv_dusk_storm_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_wv_dusk_storm_01",
				[2.0] = "pdr_wv_dusk_storm_02"
			},
			sound_events_duration = {
				[1.0] = 2.3322291374206,
				[2.0] = 3.2400832176209
			}
		},
		pdr_wv_midday_sunny = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_wv_midday_sunny_01",
				[2.0] = "pdr_wv_midday_sunny_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_wv_midday_sunny_01",
				[2.0] = "pdr_wv_midday_sunny_02"
			},
			sound_events_duration = {
				[1.0] = 2.4004583358765,
				[2.0] = 3.9354999065399
			}
		},
		pdr_wv_midnight_clear = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_wv_midnight_clear_01",
				[2.0] = "pdr_wv_midnight_clear_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_wv_midnight_clear_01",
				[2.0] = "pdr_wv_midnight_clear_02"
			},
			sound_events_duration = {
				[1.0] = 3.6676459312439,
				[2.0] = 2.5968959331513
			}
		},
		pdr_wv_midnight_fog = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_wv_midnight_fog_01",
				[2.0] = "pdr_wv_midnight_fog_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_wv_midnight_fog_01",
				[2.0] = "pdr_wv_midnight_fog_02"
			},
			sound_events_duration = {
				[1.0] = 2.6612708568573,
				[2.0] = 2.0488541126251
			}
		},
		pdr_wv_midnight_storm = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_wv_midnight_storm_01",
				[2.0] = "pdr_wv_midnight_storm_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_wv_midnight_storm_01",
				[2.0] = "pdr_wv_midnight_storm_02"
			},
			sound_events_duration = {
				[1.0] = 1.5919582843781,
				[2.0] = 1.6594375371933
			}
		},
		pes_wv_afternoon_rain = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wv_afternoon_rain_01",
				[2.0] = "pes_wv_afternoon_rain_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_wv_afternoon_rain_01",
				[2.0] = "pes_wv_afternoon_rain_02"
			},
			sound_events_duration = {
				[1.0] = 3.3991875648499,
				[2.0] = 3.2569582462311
			}
		},
		pes_wv_dawn_rain = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wv_dawn_rain_01",
				[2.0] = "pes_wv_dawn_rain_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_wv_dawn_rain_01",
				[2.0] = "pes_wv_dawn_rain_02"
			},
			sound_events_duration = {
				[1.0] = 5.0151872634888,
				[2.0] = 4.3593125343323
			}
		},
		pes_wv_dawn_snow = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wv_dawn_snow_01",
				[2.0] = "pes_wv_dawn_snow_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_wv_dawn_snow_01",
				[2.0] = "pes_wv_dawn_snow_02"
			},
			sound_events_duration = {
				[1.0] = 4.8169164657593,
				[2.0] = 4.8612289428711
			}
		},
		pes_wv_dusk_rain = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wv_dusk_rain_01",
				[2.0] = "pes_wv_dusk_rain_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_wv_dusk_rain_01",
				[2.0] = "pes_wv_dusk_rain_02"
			},
			sound_events_duration = {
				[1.0] = 2.4918959140778,
				[2.0] = 5.3446664810181
			}
		},
		pes_wv_dusk_snow = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wv_dusk_snow_01",
				[2.0] = "pes_wv_dusk_snow_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_wv_dusk_snow_01",
				[2.0] = "pes_wv_dusk_snow_02"
			},
			sound_events_duration = {
				[1.0] = 4.266104221344,
				[2.0] = 3.404833316803
			}
		},
		pes_wv_dusk_storm = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wv_dusk_storm_01",
				[2.0] = "pes_wv_dusk_storm_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_wv_dusk_storm_01",
				[2.0] = "pes_wv_dusk_storm_02"
			},
			sound_events_duration = {
				[1.0] = 4.4993958473206,
				[2.0] = 4.6636247634888
			}
		},
		pes_wv_midday_sunny = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wv_midday_sunny_01",
				[2.0] = "pes_wv_midday_sunny_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_wv_midday_sunny_01",
				[2.0] = "pes_wv_midday_sunny_02"
			},
			sound_events_duration = {
				[1.0] = 5.2053956985474,
				[2.0] = 3.9767291545868
			}
		},
		pes_wv_midnight_clear = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wv_midnight_clear_01",
				[2.0] = "pes_wv_midnight_clear_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_wv_midnight_clear_01",
				[2.0] = "pes_wv_midnight_clear_02"
			},
			sound_events_duration = {
				[1.0] = 5.2630209922791,
				[2.0] = 5.3713750839233
			}
		},
		pes_wv_midnight_fog = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wv_midnight_fog_01",
				[2.0] = "pes_wv_midnight_fog_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_wv_midnight_fog_01",
				[2.0] = "pes_wv_midnight_fog_02"
			},
			sound_events_duration = {
				[1.0] = 4.3552293777466,
				[2.0] = 4.4536457061768
			}
		},
		pes_wv_midnight_storm = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wv_midnight_storm_01",
				[2.0] = "pes_wv_midnight_storm_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_wv_midnight_storm_01",
				[2.0] = "pes_wv_midnight_storm_02"
			},
			sound_events_duration = {
				[1.0] = 2.3599584102631,
				[2.0] = 4.0218544006348
			}
		},
		pwe_wv_afternoon_rain = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_wv_afternoon_rain_01",
				[2.0] = "pwe_wv_afternoon_rain_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_wv_afternoon_rain_01",
				[2.0] = "pwe_wv_afternoon_rain_02"
			},
			sound_events_duration = {
				[1.0] = 4.5888957977295,
				[2.0] = 5.0381875038147
			}
		},
		pwe_wv_dawn_rain = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_wv_dawn_rain_01",
				[2.0] = "pwe_wv_dawn_rain_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_wv_dawn_rain_01",
				[2.0] = "pwe_wv_dawn_rain_02"
			},
			sound_events_duration = {
				[1.0] = 7.9971041679382,
				[2.0] = 6.7615833282471
			}
		},
		pwe_wv_dawn_snow = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_wv_dawn_snow_01",
				[2.0] = "pwe_wv_dawn_snow_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_wv_dawn_snow_01",
				[2.0] = "pwe_wv_dawn_snow_02"
			},
			sound_events_duration = {
				[1.0] = 5.0856456756592,
				[2.0] = 7.7069792747498
			}
		},
		pwe_wv_dusk_rain = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_wv_dusk_rain_01",
				[2.0] = "pwe_wv_dusk_rain_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_wv_dusk_rain_01",
				[2.0] = "pwe_wv_dusk_rain_02"
			},
			sound_events_duration = {
				[1.0] = 3.9765207767487,
				[2.0] = 3.7315626144409
			}
		},
		pwe_wv_dusk_snow = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_wv_dusk_snow_01",
				[2.0] = "pwe_wv_dusk_snow_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_wv_dusk_snow_01",
				[2.0] = "pwe_wv_dusk_snow_02"
			},
			sound_events_duration = {
				[1.0] = 4.9148125648499,
				[2.0] = 4.7886247634888
			}
		},
		pwe_wv_dusk_storm = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_wv_dusk_storm_01",
				[2.0] = "pwe_wv_dusk_storm_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_wv_dusk_storm_01",
				[2.0] = "pwe_wv_dusk_storm_02"
			},
			sound_events_duration = {
				[1.0] = 4.0973958969116,
				[2.0] = 5.3332710266113
			}
		},
		pwe_wv_midday_sunny = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_wv_midday_sunny_01",
				[2.0] = "pwe_wv_midday_sunny_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_wv_midday_sunny_01",
				[2.0] = "pwe_wv_midday_sunny_02"
			},
			sound_events_duration = {
				[1.0] = 3.3275415897369,
				[2.0] = 5.3575625419617
			}
		},
		pwe_wv_midnight_clear = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_wv_midnight_clear_01",
				[2.0] = "pwe_wv_midnight_clear_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_wv_midnight_clear_01",
				[2.0] = "pwe_wv_midnight_clear_02"
			},
			sound_events_duration = {
				[1.0] = 4.4455623626709,
				[2.0] = 7.0328330993652
			}
		},
		pwe_wv_midnight_fog = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_wv_midnight_fog_01",
				[2.0] = "pwe_wv_midnight_fog_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_wv_midnight_fog_01",
				[2.0] = "pwe_wv_midnight_fog_02"
			},
			sound_events_duration = {
				[1.0] = 4.6279582977295,
				[2.0] = 2.7787499427795
			}
		},
		pwe_wv_midnight_storm = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_wv_midnight_storm_01",
				[2.0] = "pwe_wv_midnight_storm_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_wv_midnight_storm_01",
				[2.0] = "pwe_wv_midnight_storm_02"
			},
			sound_events_duration = {
				[1.0] = 3.816645860672,
				[2.0] = 5.4176664352417
			}
		},
		pwh_wv_afternoon_rain = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wv_afternoon_rain_01",
				[2.0] = "pwh_wv_afternoon_rain_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_wv_afternoon_rain_01",
				[2.0] = "pwh_wv_afternoon_rain_02"
			},
			sound_events_duration = {
				[1.0] = 2.4517707824707,
				[2.0] = 2.5730624198914
			}
		},
		pwh_wv_dawn_rain = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wv_dawn_rain_01",
				[2.0] = "pwh_wv_dawn_rain_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_wv_dawn_rain_01",
				[2.0] = "pwh_wv_dawn_rain_02"
			},
			sound_events_duration = {
				[1.0] = 2.7561666965485,
				[2.0] = 5.4456872940064
			}
		},
		pwh_wv_dawn_snow = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wv_dawn_snow_01",
				[2.0] = "pwh_wv_dawn_snow_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_wv_dawn_snow_01",
				[2.0] = "pwh_wv_dawn_snow_02"
			},
			sound_events_duration = {
				[1.0] = 3.7381250858307,
				[2.0] = 4.7077293395996
			}
		},
		pwh_wv_dusk_rain = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wv_dusk_rain_01",
				[2.0] = "pwh_wv_dusk_rain_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_wv_dusk_rain_01",
				[2.0] = "pwh_wv_dusk_rain_02"
			},
			sound_events_duration = {
				[1.0] = 3.1983957290649,
				[2.0] = 3.0172708034515
			}
		},
		pwh_wv_dusk_snow = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wv_dusk_snow_01",
				[2.0] = "pwh_wv_dusk_snow_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_wv_dusk_snow_01",
				[2.0] = "pwh_wv_dusk_snow_02"
			},
			sound_events_duration = {
				[1.0] = 5.0808539390564,
				[2.0] = 3.8222708702087
			}
		},
		pwh_wv_dusk_storm = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wv_dusk_storm_01",
				[2.0] = "pwh_wv_dusk_storm_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_wv_dusk_storm_01",
				[2.0] = "pwh_wv_dusk_storm_02"
			},
			sound_events_duration = {
				[1.0] = 3.3258540630341,
				[2.0] = 3.1792707443237
			}
		},
		pwh_wv_midday_sunny = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wv_midday_sunny_01",
				[2.0] = "pwh_wv_midday_sunny_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_wv_midday_sunny_01",
				[2.0] = "pwh_wv_midday_sunny_02"
			},
			sound_events_duration = {
				[1.0] = 3.9602084159851,
				[2.0] = 4.2871041297913
			}
		},
		pwh_wv_midnight_clear = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wv_midnight_clear_01",
				[2.0] = "pwh_wv_midnight_clear_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_wv_midnight_clear_01",
				[2.0] = "pwh_wv_midnight_clear_02"
			},
			sound_events_duration = {
				[1.0] = 2.8942084312439,
				[2.0] = 5.273895740509
			}
		},
		pwh_wv_midnight_fog = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wv_midnight_fog_01",
				[2.0] = "pwh_wv_midnight_fog_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_wv_midnight_fog_01",
				[2.0] = "pwh_wv_midnight_fog_02"
			},
			sound_events_duration = {
				[1.0] = 4.6653122901917,
				[2.0] = 3.8175001144409
			}
		},
		pwh_wv_midnight_storm = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "weather_vo",
			sound_events_n = 2,
			category = "casual_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wv_midnight_storm_01",
				[2.0] = "pwh_wv_midnight_storm_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_wv_midnight_storm_01",
				[2.0] = "pwh_wv_midnight_storm_02"
			},
			sound_events_duration = {
				[1.0] = 3.4052708148956,
				[2.0] = 2.9969582557678
			}
		}
	})
end
