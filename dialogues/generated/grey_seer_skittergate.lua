return function ()
	define_rule({
		name = "egs_level_skittergate_rasknitt_appears",
		response = "egs_level_skittergate_rasknitt_appears",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_intro"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			},
			{
				"user_memory",
				"skittergate_rasknitt_appears",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"skittergate_rasknitt_appears",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "egs_level_skittergate_rasknitt_calls_mount",
		name = "egs_level_skittergate_rasknitt_calls_mount",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_call_mount"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_gameplay_shielded",
		name = "egs_gameplay_shielded",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_shielded"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_gameplay_witchhunter_knock_down",
		name = "egs_gameplay_witchhunter_knock_down",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pdr_gameplay_knocked_down"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_gameplay_brightwizard_knock_down",
		name = "egs_gameplay_brightwizard_knock_down",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pbw_gameplay_knocked_down"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_gameplay_dwarfranger_knock_down",
		name = "egs_gameplay_dwarfranger_knock_down",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pdr_gameplay_knocked_down"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_gameplay_woodelf_knock_down",
		name = "egs_gameplay_woodelf_knock_down",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwe_gameplay_knocked_down"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_gameplay_empiresoldier_knock_down",
		name = "egs_gameplay_empiresoldier_knock_down",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pes_gameplay_knocked_down"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_gameplay_witchhunter_killed",
		name = "egs_gameplay_witchhunter_killed",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_gameplay_brightwizard_killed",
		name = "egs_gameplay_brightwizard_killed",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_gameplay_dwarfranger_killed",
		name = "egs_gameplay_dwarfranger_killed",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_gameplay_woodelf_killed",
		name = "egs_gameplay_woodelf_killed",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_gameplay_empiresoldier_killed",
		name = "egs_gameplay_empiresoldier_killed",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_skittergate_rasknitt_mounting_stormfiend",
		name = "egs_level_skittergate_rasknitt_mounting_stormfiend",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_mounting"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_skittergate_rasknitt_on_stormfiend",
		name = "egs_level_skittergate_rasknitt_on_stormfiend",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_shooting"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_skittergate_rasknitt_dismounted",
		name = "egs_level_skittergate_rasknitt_dismounted",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_rasknitt_dismounted"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_skittergate_rasknitt_calls_mount_battle",
		name = "egs_level_skittergate_rasknitt_calls_mount_battle",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_calls_mount_battle"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_skittergate_stormfiend_dead",
		name = "egs_level_skittergate_stormfiend_dead",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_stormfiend_dead"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_skittergate_summon_skaven",
		name = "egs_level_skittergate_summon_skaven",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_summon"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_skittergate_cast_lightning",
		name = "egs_level_skittergate_cast_lightning",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_cast_lightning"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_skittergate_cast_vermintide",
		name = "egs_level_skittergate_cast_vermintide",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_cast_vermintide"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_skitter_gate_teleport_death",
		name = "egs_level_skitter_gate_teleport_death",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_teleport_to_death"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_skittergate_teleport_away",
		name = "egs_level_skittergate_teleport_away",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_teleport_away"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_death_scene_01",
		name = "egs_death_scene_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_death_scene"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_skittergate_rasknitt_calls_mount_intro",
		name = "egs_level_skittergate_rasknitt_calls_mount_intro",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"egs_call_mount_intro"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	add_dialogues({
		egs_level_skittergate_rasknitt_mounting_stormfiend = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "grey_seer_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"egs_level_skittergate_rasknitt_mounting_stormfiend_01",
				"egs_level_skittergate_rasknitt_mounting_stormfiend_02",
				"egs_level_skittergate_rasknitt_mounting_stormfiend_03",
				"egs_level_skittergate_rasknitt_mounting_stormfiend_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"egs_level_skittergate_rasknitt_mounting_stormfiend_01",
				"egs_level_skittergate_rasknitt_mounting_stormfiend_02",
				"egs_level_skittergate_rasknitt_mounting_stormfiend_03",
				"egs_level_skittergate_rasknitt_mounting_stormfiend_04"
			},
			randomize_indexes = {}
		},
		egs_level_skittergate_rasknitt_calls_mount = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "grey_seer_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"egs_level_skittergate_rasknitt_calls_mount_01",
				"egs_level_skittergate_rasknitt_calls_mount_02",
				"egs_level_skittergate_rasknitt_calls_mount_03",
				"egs_level_skittergate_rasknitt_calls_mount_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"egs_level_skittergate_rasknitt_calls_mount_01",
				"egs_level_skittergate_rasknitt_calls_mount_02",
				"egs_level_skittergate_rasknitt_calls_mount_03",
				"egs_level_skittergate_rasknitt_calls_mount_04"
			},
			randomize_indexes = {}
		},
		egs_gameplay_dwarfranger_knock_down = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "grey_seer_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"egs_gameplay_dwarfranger_knock_down_01",
				"egs_gameplay_dwarfranger_knock_down_02",
				"egs_gameplay_dwarfranger_knock_down_03",
				"egs_gameplay_dwarfranger_knock_down_04",
				"egs_gameplay_dwarfranger_knock_down_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"egs_gameplay_dwarfranger_knock_down_01",
				"egs_gameplay_dwarfranger_knock_down_02",
				"egs_gameplay_dwarfranger_knock_down_03",
				"egs_gameplay_dwarfranger_knock_down_04",
				"egs_gameplay_dwarfranger_knock_down_05"
			},
			randomize_indexes = {}
		},
		egs_level_skittergate_rasknitt_dismounted = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "grey_seer_skittergate",
			sound_distance = 50,
			category = "boss_talk_interrupt",
			dialogue_animations_n = 4,
			sound_events = {
				"egs_level_skittergate_rasknitt_dismounted_01",
				"egs_level_skittergate_rasknitt_dismounted_02",
				"egs_level_skittergate_rasknitt_dismounted_03",
				"egs_level_skittergate_rasknitt_dismounted_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"egs_level_skittergate_rasknitt_dismounted_01",
				"egs_level_skittergate_rasknitt_dismounted_02",
				"egs_level_skittergate_rasknitt_dismounted_03",
				"egs_level_skittergate_rasknitt_dismounted_04"
			},
			randomize_indexes = {}
		},
		egs_level_skittergate_rasknitt_on_stormfiend = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "grey_seer_skittergate",
			sound_distance = 50,
			category = "boss_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"egs_level_skittergate_rasknitt_on_stormfiend_01",
				"egs_level_skittergate_rasknitt_on_stormfiend_02",
				"egs_level_skittergate_rasknitt_on_stormfiend_03",
				"egs_level_skittergate_rasknitt_on_stormfiend_04",
				"egs_shooting_01",
				"egs_shooting_02",
				"egs_shooting_03",
				"egs_shooting_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"egs_level_skittergate_rasknitt_on_stormfiend_01",
				"egs_level_skittergate_rasknitt_on_stormfiend_02",
				"egs_level_skittergate_rasknitt_on_stormfiend_03",
				"egs_level_skittergate_rasknitt_on_stormfiend_04",
				"egs_shooting_01",
				"egs_shooting_02",
				"egs_shooting_03",
				"egs_shooting_04"
			},
			randomize_indexes = {}
		},
		egs_gameplay_shielded = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "grey_seer_skittergate",
			category = "boss_reaction_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"egs_gameplay_shielded_01",
				"egs_gameplay_shielded_02",
				"egs_gameplay_shielded_03",
				"egs_gameplay_shielded_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"egs_gameplay_shielded_01",
				"egs_gameplay_shielded_02",
				"egs_gameplay_shielded_03",
				"egs_gameplay_shielded_04"
			},
			randomize_indexes = {}
		},
		egs_gameplay_empiresoldier_killed = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "grey_seer_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"egs_gameplay_empiresoldier_killed_01",
				"egs_gameplay_empiresoldier_killed_02",
				"egs_gameplay_empiresoldier_killed_03",
				"egs_gameplay_empiresoldier_killed_04",
				"egs_gameplay_empiresoldier_killed_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"egs_gameplay_empiresoldier_killed_01",
				"egs_gameplay_empiresoldier_killed_02",
				"egs_gameplay_empiresoldier_killed_03",
				"egs_gameplay_empiresoldier_killed_04",
				"egs_gameplay_empiresoldier_killed_05"
			},
			randomize_indexes = {}
		},
		egs_level_skittergate_rasknitt_calls_mount_intro = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "grey_seer_skittergate",
			category = "boss_talk_interrupt",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "egs_level_skittergate_rasknitt_calls_mount_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "egs_level_skittergate_rasknitt_calls_mount_01"
			}
		},
		egs_death_scene_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "grey_seer_skittergate",
			sound_distance = 50,
			category = "boss_talk_interrupt",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "egs_death_scene_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "egs_death_scene_01"
			}
		},
		egs_level_skittergate_teleport_away = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "grey_seer_skittergate",
			sound_distance = 50,
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"egs_level_skittergate_teleport_away_01",
				"egs_level_skittergate_teleport_away_02",
				"egs_level_skittergate_teleport_away_03",
				"egs_level_skittergate_teleport_away_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"egs_level_skittergate_teleport_away_01",
				"egs_level_skittergate_teleport_away_02",
				"egs_level_skittergate_teleport_away_03",
				"egs_level_skittergate_teleport_away_04"
			},
			randomize_indexes = {}
		},
		egs_gameplay_empiresoldier_knock_down = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "grey_seer_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"egs_gameplay_empiresoldier_knock_down_01",
				"egs_gameplay_empiresoldier_knock_down_02",
				"egs_gameplay_empiresoldier_knock_down_03",
				"egs_gameplay_empiresoldier_knock_down_04",
				"egs_gameplay_empiresoldier_knock_down_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"egs_gameplay_empiresoldier_knock_down_01",
				"egs_gameplay_empiresoldier_knock_down_02",
				"egs_gameplay_empiresoldier_knock_down_03",
				"egs_gameplay_empiresoldier_knock_down_04",
				"egs_gameplay_empiresoldier_knock_down_05"
			},
			randomize_indexes = {}
		},
		egs_level_skitter_gate_teleport_death = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "grey_seer_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "egs_level_skitter_gate_teleport_death"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "egs_level_skitter_gate_teleport_death"
			}
		},
		egs_gameplay_witchhunter_killed = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "grey_seer_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"egs_gameplay_witchhunter_killed_01",
				"egs_gameplay_witchhunter_killed_02",
				"egs_gameplay_witchhunter_killed_03",
				"egs_gameplay_witchhunter_killed_04",
				"egs_gameplay_witchhunter_killed_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"egs_gameplay_witchhunter_killed_01",
				"egs_gameplay_witchhunter_killed_02",
				"egs_gameplay_witchhunter_killed_03",
				"egs_gameplay_witchhunter_killed_04",
				"egs_gameplay_witchhunter_killed_05"
			},
			randomize_indexes = {}
		},
		egs_level_skittergate_cast_lightning = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "grey_seer_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"egs_level_skittergate_cast_lightning_01",
				"egs_level_skittergate_cast_lightning_02",
				"egs_level_skittergate_cast_lightning_03",
				"egs_level_skittergate_cast_lightning_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"egs_level_skittergate_cast_lightning_01",
				"egs_level_skittergate_cast_lightning_02",
				"egs_level_skittergate_cast_lightning_03",
				"egs_level_skittergate_cast_lightning_04"
			},
			randomize_indexes = {}
		},
		egs_gameplay_witchhunter_knock_down = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "grey_seer_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"egs_gameplay_witchhunter_knock_down_01",
				"egs_gameplay_witchhunter_knock_down_02",
				"egs_gameplay_witchhunter_knock_down_03",
				"egs_gameplay_witchhunter_knock_down_04",
				"egs_gameplay_witchhunter_knock_down_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"egs_gameplay_witchhunter_knock_down_01",
				"egs_gameplay_witchhunter_knock_down_02",
				"egs_gameplay_witchhunter_knock_down_03",
				"egs_gameplay_witchhunter_knock_down_04",
				"egs_gameplay_witchhunter_knock_down_05"
			},
			randomize_indexes = {}
		},
		egs_gameplay_woodelf_killed = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "grey_seer_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"egs_gameplay_woodelf_killed_01",
				"egs_gameplay_woodelf_killed_02",
				"egs_gameplay_woodelf_killed_03",
				"egs_gameplay_woodelf_killed_04",
				"egs_gameplay_woodelf_killed_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"egs_gameplay_woodelf_killed_01",
				"egs_gameplay_woodelf_killed_02",
				"egs_gameplay_woodelf_killed_03",
				"egs_gameplay_woodelf_killed_04",
				"egs_gameplay_woodelf_killed_05"
			},
			randomize_indexes = {}
		},
		egs_level_skittergate_stormfiend_dead = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "grey_seer_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"egs_level_skittergate_stormfiend_dead_01",
				"egs_level_skittergate_stormfiend_dead_02",
				"egs_level_skittergate_stormfiend_dead_03",
				"egs_level_skittergate_stormfiend_dead_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"egs_level_skittergate_stormfiend_dead_01",
				"egs_level_skittergate_stormfiend_dead_02",
				"egs_level_skittergate_stormfiend_dead_03",
				"egs_level_skittergate_stormfiend_dead_04"
			},
			randomize_indexes = {}
		},
		egs_level_skittergate_cast_vermintide = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "grey_seer_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"egs_level_skittergate_cast_vermintide_01",
				"egs_level_skittergate_cast_vermintide_02",
				"egs_level_skittergate_cast_vermintide_03",
				"egs_level_skittergate_cast_vermintide_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"egs_level_skittergate_cast_vermintide_01",
				"egs_level_skittergate_cast_vermintide_02",
				"egs_level_skittergate_cast_vermintide_03",
				"egs_level_skittergate_cast_vermintide_04"
			},
			randomize_indexes = {}
		},
		egs_level_skittergate_summon_skaven = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "grey_seer_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"egs_level_skittergate_summon_skaven_01",
				"egs_level_skittergate_summon_skaven_02",
				"egs_level_skittergate_summon_skaven_03",
				"egs_level_skittergate_summon_skaven_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"egs_level_skittergate_summon_skaven_01",
				"egs_level_skittergate_summon_skaven_02",
				"egs_level_skittergate_summon_skaven_03",
				"egs_level_skittergate_summon_skaven_04"
			},
			randomize_indexes = {}
		},
		egs_level_skittergate_rasknitt_calls_mount_battle = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "grey_seer_skittergate",
			category = "boss_talk_interrupt",
			dialogue_animations_n = 4,
			sound_events = {
				"egs_level_skittergate_rasknitt_calls_mount_battle_01",
				"egs_level_skittergate_rasknitt_calls_mount_battle_02",
				"egs_level_skittergate_rasknitt_calls_mount_battle_03",
				"egs_level_skittergate_rasknitt_calls_mount_battle_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"egs_level_skittergate_rasknitt_calls_mount_battle_01",
				"egs_level_skittergate_rasknitt_calls_mount_battle_02",
				"egs_level_skittergate_rasknitt_calls_mount_battle_03",
				"egs_level_skittergate_rasknitt_calls_mount_battle_04"
			},
			randomize_indexes = {}
		},
		egs_level_skittergate_rasknitt_appears = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "grey_seer_skittergate",
			sound_distance = 50,
			category = "boss_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "egs_level_skittergate_rasknitt_appears_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "egs_level_skittergate_rasknitt_appears_03"
			}
		},
		egs_gameplay_dwarfranger_killed = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "grey_seer_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"egs_gameplay_dwarfranger_killed_01",
				"egs_gameplay_dwarfranger_killed_02",
				"egs_gameplay_dwarfranger_killed_03",
				"egs_gameplay_dwarfranger_killed_04",
				"egs_gameplay_dwarfranger_killed_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"egs_gameplay_dwarfranger_killed_01",
				"egs_gameplay_dwarfranger_killed_02",
				"egs_gameplay_dwarfranger_killed_03",
				"egs_gameplay_dwarfranger_killed_04",
				"egs_gameplay_dwarfranger_killed_05"
			},
			randomize_indexes = {}
		},
		egs_gameplay_brightwizard_killed = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "grey_seer_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"egs_gameplay_brightwizard_killed_01",
				"egs_gameplay_brightwizard_killed_02",
				"egs_gameplay_brightwizard_killed_03",
				"egs_gameplay_brightwizard_killed_04",
				"egs_gameplay_brightwizard_killed_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"egs_gameplay_brightwizard_killed_01",
				"egs_gameplay_brightwizard_killed_02",
				"egs_gameplay_brightwizard_killed_03",
				"egs_gameplay_brightwizard_killed_04",
				"egs_gameplay_brightwizard_killed_05"
			},
			randomize_indexes = {}
		},
		egs_gameplay_woodelf_knock_down = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "grey_seer_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"egs_gameplay_woodelf_knock_down_01",
				"egs_gameplay_woodelf_knock_down_02",
				"egs_gameplay_woodelf_knock_down_03",
				"egs_gameplay_woodelf_knock_down_04",
				"egs_gameplay_woodelf_knock_down_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"egs_gameplay_woodelf_knock_down_01",
				"egs_gameplay_woodelf_knock_down_02",
				"egs_gameplay_woodelf_knock_down_03",
				"egs_gameplay_woodelf_knock_down_04",
				"egs_gameplay_woodelf_knock_down_05"
			},
			randomize_indexes = {}
		},
		egs_gameplay_brightwizard_knock_down = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "grey_seer_skittergate",
			category = "boss_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"egs_gameplay_brightwizard_knock_down_01",
				"egs_gameplay_brightwizard_knock_down_02",
				"egs_gameplay_brightwizard_knock_down_03",
				"egs_gameplay_brightwizard_knock_down_04",
				"egs_gameplay_brightwizard_knock_down_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"egs_gameplay_brightwizard_knock_down_01",
				"egs_gameplay_brightwizard_knock_down_02",
				"egs_gameplay_brightwizard_knock_down_03",
				"egs_gameplay_brightwizard_knock_down_04",
				"egs_gameplay_brightwizard_knock_down_05"
			},
			randomize_indexes = {}
		}
	})
end
