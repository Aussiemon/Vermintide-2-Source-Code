-- chunkname: @dialogues/generated/hub_conversations_carousel.lua

return function ()
	define_rule({
		name = "nde_vs_hub_idle_a",
		probability = 1,
		response = "nde_vs_hub_idle_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"idle_vo",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer",
			},
			{
				"user_memory",
				"vs_hub_idle_vo",
				OP.LT,
				2,
			},
		},
		on_done = {
			{
				"user_memory",
				"vs_hub_idle_vo",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_hub_vs_keep_onboarding_a",
		probability = 1,
		response = "nik_hub_vs_keep_onboarding_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"first_time_vs_hub",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_hub_vs_keep_onboarding_b",
		probability = 1,
		response = "nik_hub_vs_keep_onboarding_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak_self",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nik_hub_vs_keep_onboarding_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_hub_vs_keep_onboarding_c",
		probability = 1,
		response = "nik_hub_vs_keep_onboarding_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak_self",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nik_hub_vs_keep_onboarding_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_hub_vs_keep_onboarding_d",
		probability = 1,
		response = "nik_hub_vs_keep_onboarding_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak_self",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nik_hub_vs_keep_onboarding_c",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	add_dialogues({
		nde_vs_hub_idle_a = {
			category = "story_talk_keep",
			database = "hub_conversations_carousel",
			dialogue_animations_n = 10,
			face_animations_n = 10,
			randomize_indexes_n = 0,
			sound_events_n = 10,
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
			},
			localization_strings = {
				"nde_vs_hub_idle_a_01",
				"nde_vs_hub_idle_a_02",
				"nde_vs_hub_idle_a_03",
				"nde_vs_hub_idle_a_04",
				"nde_vs_hub_idle_a_05",
				"nde_vs_hub_idle_a_06",
				"nde_vs_hub_idle_a_07",
				"nde_vs_hub_idle_a_08",
				"nde_vs_hub_idle_a_09",
				"nde_vs_hub_idle_a_10",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_hub_idle_a_01",
				"nde_vs_hub_idle_a_02",
				"nde_vs_hub_idle_a_03",
				"nde_vs_hub_idle_a_04",
				"nde_vs_hub_idle_a_05",
				"nde_vs_hub_idle_a_06",
				"nde_vs_hub_idle_a_07",
				"nde_vs_hub_idle_a_08",
				"nde_vs_hub_idle_a_09",
				"nde_vs_hub_idle_a_10",
			},
			sound_events_duration = {
				3.9562292098999,
				2.9117915630341,
				4.4378123283386,
				5.5999794006348,
				4.3811039924622,
				6.1630625724792,
				3.805645942688,
				6.1717710494995,
				4.7642707824707,
				6.0922708511353,
			},
		},
		nik_hub_vs_keep_onboarding_a = {
			category = "story_talk_keep",
			database = "hub_conversations_carousel",
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
				[1] = "nik_hub_vs_keep_onboarding_a_01",
			},
			sound_events = {
				[1] = "nik_hub_vs_keep_onboarding_a_01",
			},
			sound_events_duration = {
				[1] = 2.732833147049,
			},
		},
		nik_hub_vs_keep_onboarding_b = {
			category = "story_talk_keep",
			database = "hub_conversations_carousel",
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
				[1] = "nik_hub_vs_keep_onboarding_b_01",
			},
			sound_events = {
				[1] = "nik_hub_vs_keep_onboarding_b_01",
			},
			sound_events_duration = {
				[1] = 5.3698959350586,
			},
		},
		nik_hub_vs_keep_onboarding_c = {
			category = "story_talk_keep",
			database = "hub_conversations_carousel",
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
				[1] = "nik_hub_vs_keep_onboarding_c_01",
			},
			sound_events = {
				[1] = "nik_hub_vs_keep_onboarding_c_01",
			},
			sound_events_duration = {
				[1] = 4.1025834083557,
			},
		},
		nik_hub_vs_keep_onboarding_d = {
			category = "story_talk_keep",
			database = "hub_conversations_carousel",
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
				[1] = "nik_hub_vs_keep_onboarding_d_01",
			},
			sound_events = {
				[1] = "nik_hub_vs_keep_onboarding_d_01",
			},
			sound_events_duration = {
				[1] = 9.8119783401489,
			},
		},
	})
end
