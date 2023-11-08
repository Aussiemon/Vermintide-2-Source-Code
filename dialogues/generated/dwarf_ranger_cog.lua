return function ()
	define_rule({
		name = "pdr_activate_ability_dwarf_engineer",
		response = "pdr_activate_ability_dwarf_engineer",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"activate_ability"
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
				"player_career",
				OP.EQ,
				"dr_engineer"
			},
			{
				"faction_memory",
				"last_activate_ability_dwarf_engineer",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_activate_ability_dwarf_engineer",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pdr_activate_ability_dwarf_engineer = {
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "dwarf_ranger_cog",
			sound_events_n = 10,
			category = "activate_ability",
			dialogue_animations_n = 10,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
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
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pdr_activate_ability_dwarf_engineer_01",
				"pdr_activate_ability_dwarf_engineer_02",
				"pdr_activate_ability_dwarf_engineer_03",
				"pdr_activate_ability_dwarf_engineer_04",
				"pdr_activate_ability_dwarf_engineer_05",
				"pdr_activate_ability_dwarf_engineer_06",
				"pdr_activate_ability_dwarf_engineer_07",
				"pdr_activate_ability_dwarf_engineer_08",
				"pdr_activate_ability_dwarf_engineer_09",
				"pdr_activate_ability_dwarf_engineer_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_activate_ability_dwarf_engineer_01",
				"pdr_activate_ability_dwarf_engineer_02",
				"pdr_activate_ability_dwarf_engineer_03",
				"pdr_activate_ability_dwarf_engineer_04",
				"pdr_activate_ability_dwarf_engineer_05",
				"pdr_activate_ability_dwarf_engineer_06",
				"pdr_activate_ability_dwarf_engineer_07",
				"pdr_activate_ability_dwarf_engineer_08",
				"pdr_activate_ability_dwarf_engineer_09",
				"pdr_activate_ability_dwarf_engineer_10"
			},
			sound_events_duration = {
				1.4520416259766,
				1.3176041841507,
				1.7979791164398,
				1.9152292013168,
				1.5095624923706,
				1.5485208034515,
				1.1934167146683,
				1.3340417146683,
				2.2459790706634,
				2.3116042613983
			}
		}
	})
end
