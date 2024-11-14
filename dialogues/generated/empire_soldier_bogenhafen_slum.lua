-- chunkname: @dialogues/generated/empire_soldier_bogenhafen_slum.lua

return function ()
	define_rule({
		name = "pes_hu_level_bogenhafen_slum_blackfire",
		probability = 1,
		response = "pes_hu_level_bogenhafen_slum_blackfire",
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
				"pit_blackfire",
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
				"player_career",
				OP.EQ,
				"es_huntsman",
			},
			{
				"faction_memory",
				"pit_blackfire",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pit_blackfire",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_hu_level_bogenhafen_slum_find_hideout",
		probability = 1,
		response = "pes_hu_level_bogenhafen_slum_find_hideout",
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
				"level_bogenhafen_slum_find_hideout",
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
				"player_career",
				OP.EQ,
				"es_huntsman",
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_find_hideout",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_find_hideout",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_hu_level_bogenhafen_slum_gang",
		probability = 1,
		response = "pes_hu_level_bogenhafen_slum_gang",
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
				"level_bogenhafen_slum_gang",
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
				"player_career",
				OP.EQ,
				"es_huntsman",
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_gang",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_gang",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_hu_level_bogenhafen_slum_noble_food",
		probability = 1,
		response = "pes_hu_level_bogenhafen_slum_noble_food",
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
				"level_bogenhafen_slum_noble_food",
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
				"player_career",
				OP.EQ,
				"es_huntsman",
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_noble_food",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_noble_food",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_hu_level_bogenhafen_slum_noisy_exit",
		probability = 1,
		response = "pes_hu_level_bogenhafen_slum_noisy_exit",
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
				"level_bogenhafen_slum_noisy_exit",
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
				"level_bogenhafen_slum_noisy_exit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_noisy_exit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_hu_level_bogenhafen_slum_squalor",
		probability = 1,
		response = "pes_hu_level_bogenhafen_slum_squalor",
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
				"level_bogenhafen_slum_squalor",
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
				"player_career",
				OP.EQ,
				"es_huntsman",
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_squalor",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_squalor",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_hu_level_bogenhafen_slum_the_58",
		probability = 1,
		response = "pes_hu_level_bogenhafen_slum_the_58",
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
				"level_bogenhafen_slum_the_58",
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
				"player_career",
				OP.EQ,
				"es_huntsman",
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_the_58",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_the_58",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_hu_level_bogenhafen_slum_the_wall",
		probability = 1,
		response = "pes_hu_level_bogenhafen_slum_the_wall",
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
				"pes_level_bogenhafen_slum_the_wall",
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
				"player_career",
				OP.EQ,
				"es_huntsman",
			},
			{
				"faction_memory",
				"pes_level_bogenhafen_slum_the_wall",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_level_bogenhafen_slum_the_wall",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_kn_level_bogenhafen_slum_ambush",
		probability = 1,
		response = "pes_kn_level_bogenhafen_slum_ambush",
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
				"level_bogenhafen_slum_ambush",
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
				"player_career",
				OP.EQ,
				"es_knight",
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_ambush",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_ambush",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_kn_level_bogenhafen_slum_blackfire",
		probability = 1,
		response = "pes_kn_level_bogenhafen_slum_blackfire",
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
				"pit_blackfire",
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
				"player_career",
				OP.EQ,
				"es_knight",
			},
			{
				"faction_memory",
				"pit_blackfire",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pit_blackfire",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_kn_level_bogenhafen_slum_escape",
		probability = 1,
		response = "pes_kn_level_bogenhafen_slum_escape",
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
				"level_bogenhafen_slum_escape",
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
				"player_career",
				OP.EQ,
				"es_knight",
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_escape",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_escape",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_kn_level_bogenhafen_slum_stolen_goods",
		probability = 1,
		response = "pes_kn_level_bogenhafen_slum_stolen_goods",
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
				"level_bogenhafen_slum_stolen_goods",
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
				"player_career",
				OP.EQ,
				"es_knight",
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_stolen_goods",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_stolen_goods",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_kn_level_bogenhafen_slum_too_quiet",
		probability = 1,
		response = "pes_kn_level_bogenhafen_slum_too_quiet",
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
				"level_bogenhafen_slum_too_quiet",
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
				"player_career",
				OP.EQ,
				"es_knight",
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_too_quiet",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_too_quiet",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_ambush",
		probability = 1,
		response = "pes_level_bogenhafen_slum_ambush",
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
				"level_bogenhafen_slum_ambush",
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
				"level_bogenhafen_slum_ambush",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_ambush",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_blackfire",
		probability = 1,
		response = "pes_level_bogenhafen_slum_blackfire",
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
				"pit_blackfire",
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
				"pit_blackfire",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pit_blackfire",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_burn_food",
		probability = 1,
		response = "pes_level_bogenhafen_slum_burn_food",
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
				"level_bogenhafen_slum_burn_food",
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
				"level_bogenhafen_slum_burn_food",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_burn_food",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_cannon",
		probability = 1,
		response = "pes_level_bogenhafen_slum_cannon",
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
				"level_bogenhafen_slum_cannon",
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
				"level_bogenhafen_slum_cannon",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_cannon",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_end",
		probability = 1,
		response = "pes_level_bogenhafen_slum_end",
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
				"level_bogenhafen_slum_end",
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
				"level_bogenhafen_slum_end",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_end",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_escape",
		probability = 1,
		response = "pes_level_bogenhafen_slum_escape",
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
				"level_bogenhafen_slum_escape",
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
				"level_bogenhafen_slum_escape",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_escape",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_find_hideout",
		probability = 1,
		response = "pes_level_bogenhafen_slum_find_hideout",
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
				"level_bogenhafen_slum_find_hideout",
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
				"level_bogenhafen_slum_find_hideout",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_find_hideout",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_fortify",
		probability = 1,
		response = "pes_level_bogenhafen_slum_fortify",
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
				"level_bogenhafen_slum_fortify",
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
				"level_bogenhafen_slum_fortify",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_fortify",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_fortify_prep",
		probability = 1,
		response = "pes_level_bogenhafen_slum_fortify_prep",
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
				"level_bogenhafen_slum_fortify_prep",
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
				"level_bogenhafen_slum_fortify_prep",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_fortify_prep",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_foul_air",
		probability = 1,
		response = "pes_level_bogenhafen_slum_foul_air",
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
				"level_bogenhafen_slum_foul_air",
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
				"level_bogenhafen_slum_foul_air",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_foul_air",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_gang",
		probability = 1,
		response = "pes_level_bogenhafen_slum_gang",
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
				"level_bogenhafen_slum_gang",
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
				"level_bogenhafen_slum_gang",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_gang",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_intro_a",
		probability = 1,
		response = "pes_level_bogenhafen_slum_intro_a",
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
				"level_bogenhafen_slum_intro_a",
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
				"level_bogenhafen_slum_intro_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_intro_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_intro_b",
		probability = 1,
		response = "pes_level_bogenhafen_slum_intro_b",
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
				"level_bogenhafen_slum_intro_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_intro_b",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_intro_c",
		probability = 1,
		response = "pes_level_bogenhafen_slum_intro_c",
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
				"level_bogenhafen_slum_intro_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_intro_c",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_noble_food",
		probability = 1,
		response = "pes_level_bogenhafen_slum_noble_food",
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
				"level_bogenhafen_slum_noble_food",
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
				"level_bogenhafen_slum_noble_food",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_noble_food",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_noisy_exit",
		probability = 1,
		response = "pes_level_bogenhafen_slum_noisy_exit",
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
				"level_bogenhafen_slum_noisy_exit",
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
				"level_bogenhafen_slum_noisy_exit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_noisy_exit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_river",
		probability = 1,
		response = "pes_level_bogenhafen_slum_river",
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
				"level_bogenhafen_slum_river",
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
				"level_bogenhafen_slum_river",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_river",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_search",
		probability = 1,
		response = "pes_level_bogenhafen_slum_search",
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
				"level_bogenhafen_slum_search",
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
				"level_bogenhafen_slum_search",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_search",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_slum",
		probability = 1,
		response = "pes_level_bogenhafen_slum_slum",
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
				"level_bogenhafen_slum_slum",
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
				"level_bogenhafen_slum_slum",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_slum",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_squalor",
		probability = 1,
		response = "pes_level_bogenhafen_slum_squalor",
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
				"level_bogenhafen_slum_squalor",
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
				"level_bogenhafen_slum_squalor",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_squalor",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_stolen_goods",
		probability = 1,
		response = "pes_level_bogenhafen_slum_stolen_goods",
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
				"level_bogenhafen_slum_stolen_goods",
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
				"level_bogenhafen_slum_stolen_goods",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_stolen_goods",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_tainted_food",
		probability = 1,
		response = "pes_level_bogenhafen_slum_tainted_food",
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
				"level_bogenhafen_slum_tainted_food",
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
				"level_bogenhafen_slum_tainted_food",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_tainted_food",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_the_58",
		probability = 1,
		response = "pes_level_bogenhafen_slum_the_58",
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
				"level_bogenhafen_slum_the_58",
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
				"level_bogenhafen_slum_the_58",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_the_58",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_the_wall",
		probability = 1,
		response = "pes_level_bogenhafen_slum_the_wall",
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
				"pes_level_bogenhafen_slum_the_wall",
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
				"pes_level_bogenhafen_slum_the_wall",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_level_bogenhafen_slum_the_wall",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_bogenhafen_slum_too_quiet",
		probability = 1,
		response = "pes_level_bogenhafen_slum_too_quiet",
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
				"level_bogenhafen_slum_too_quiet",
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
				"level_bogenhafen_slum_too_quiet",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_too_quiet",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pes_hu_level_bogenhafen_slum_blackfire = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pes_hu_level_bogenhafen_slum_blackfire_01",
			},
			sound_events = {
				[1] = "pes_hu_level_bogenhafen_slum_blackfire_01",
			},
			sound_events_duration = {
				[1] = 3.4567,
			},
		},
		pes_hu_level_bogenhafen_slum_find_hideout = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_hu_level_bogenhafen_slum_find_hideout_01",
			},
			sound_events = {
				[1] = "pes_hu_level_bogenhafen_slum_find_hideout_01",
			},
			sound_events_duration = {
				[1] = 4.4726667404175,
			},
		},
		pes_hu_level_bogenhafen_slum_gang = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pes_hu_level_bogenhafen_slum_gang_01",
			},
			sound_events = {
				[1] = "pes_hu_level_bogenhafen_slum_gang_01",
			},
			sound_events_duration = {
				[1] = 6.3713960647583,
			},
		},
		pes_hu_level_bogenhafen_slum_noble_food = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_hu_level_bogenhafen_slum_noble_food_01",
			},
			sound_events = {
				[1] = "pes_hu_level_bogenhafen_slum_noble_food_01",
			},
			sound_events_duration = {
				[1] = 6.0021457672119,
			},
		},
		pes_hu_level_bogenhafen_slum_noisy_exit = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_hu_level_bogenhafen_slum_noisy_exit_01",
			},
			sound_events = {
				[1] = "pes_hu_level_bogenhafen_slum_noisy_exit_01",
			},
			sound_events_duration = {
				[1] = 4.8087916374206,
			},
		},
		pes_hu_level_bogenhafen_slum_squalor = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pes_hu_level_bogenhafen_slum_squalor_01",
			},
			sound_events = {
				[1] = "pes_hu_level_bogenhafen_slum_squalor_01",
			},
			sound_events_duration = {
				[1] = 6.7791252136231,
			},
		},
		pes_hu_level_bogenhafen_slum_the_58 = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_hu_level_bogenhafen_slum_the_58_01",
			},
			sound_events = {
				[1] = "pes_hu_level_bogenhafen_slum_the_58_01",
			},
			sound_events_duration = {
				[1] = 5.2184166908264,
			},
		},
		pes_hu_level_bogenhafen_slum_the_wall = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_hu_level_bogenhafen_slum_the_wall_01",
			},
			sound_events = {
				[1] = "pes_hu_level_bogenhafen_slum_the_wall_01",
			},
			sound_events_duration = {
				[1] = 4.1270833015442,
			},
		},
		pes_kn_level_bogenhafen_slum_ambush = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_kn_level_bogenhafen_slum_ambush_01",
			},
			sound_events = {
				[1] = "pes_kn_level_bogenhafen_slum_ambush_01",
			},
			sound_events_duration = {
				[1] = 3.6008541584015,
			},
		},
		pes_kn_level_bogenhafen_slum_blackfire = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pes_kn_level_bogenhafen_slum_blackfire_01",
			},
			sound_events = {
				[1] = "pes_kn_level_bogenhafen_slum_blackfire_01",
			},
			sound_events_duration = {
				[1] = 3.4567,
			},
		},
		pes_kn_level_bogenhafen_slum_escape = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_kn_level_bogenhafen_slum_escape_01",
			},
			sound_events = {
				[1] = "pes_kn_level_bogenhafen_slum_escape_01",
			},
			sound_events_duration = {
				[1] = 3.1252915859222,
			},
		},
		pes_kn_level_bogenhafen_slum_stolen_goods = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_kn_level_bogenhafen_slum_stolen_goods_01",
			},
			sound_events = {
				[1] = "pes_kn_level_bogenhafen_slum_stolen_goods_01",
			},
			sound_events_duration = {
				[1] = 6.7427706718445,
			},
		},
		pes_kn_level_bogenhafen_slum_too_quiet = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_kn_level_bogenhafen_slum_too_quiet_01",
			},
			sound_events = {
				[1] = "pes_kn_level_bogenhafen_slum_too_quiet_01",
			},
			sound_events_duration = {
				[1] = 3.9776458740234,
			},
		},
		pes_level_bogenhafen_slum_ambush = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
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
				"pes_level_bogenhafen_slum_ambush_01",
				"pes_level_bogenhafen_slum_ambush_02",
				"pes_level_bogenhafen_slum_ambush_03",
				"pes_level_bogenhafen_slum_ambush_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_slum_ambush_01",
				"pes_level_bogenhafen_slum_ambush_02",
				"pes_level_bogenhafen_slum_ambush_03",
				"pes_level_bogenhafen_slum_ambush_04",
			},
			sound_events_duration = {
				3.8836874961853,
				2.588770866394,
				3.5529375076294,
				2.1955416202545,
			},
		},
		pes_level_bogenhafen_slum_blackfire = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pes_level_bogenhafen_slum_blackfire_01",
				"pes_level_bogenhafen_slum_blackfire_02",
				"pes_level_bogenhafen_slum_blackfire_03",
				"pes_level_bogenhafen_slum_blackfire_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_slum_blackfire_01",
				"pes_level_bogenhafen_slum_blackfire_02",
				"pes_level_bogenhafen_slum_blackfire_03",
				"pes_level_bogenhafen_slum_blackfire_04",
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
			},
		},
		pes_level_bogenhafen_slum_burn_food = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
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
				"pes_level_bogenhafen_slum_burn_food_01",
				"pes_level_bogenhafen_slum_burn_food_02",
				"pes_level_bogenhafen_slum_burn_food_03",
				"pes_level_bogenhafen_slum_burn_food_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_slum_burn_food_01",
				"pes_level_bogenhafen_slum_burn_food_02",
				"pes_level_bogenhafen_slum_burn_food_03",
				"pes_level_bogenhafen_slum_burn_food_04",
			},
			sound_events_duration = {
				3.930520772934,
				2.3856041431427,
				3.7630417346954,
				3.5218541622162,
			},
		},
		pes_level_bogenhafen_slum_cannon = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
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
				"pes_level_bogenhafen_slum_cannon_01",
				"pes_level_bogenhafen_slum_cannon_02",
				"pes_level_bogenhafen_slum_cannon_03",
				"pes_level_bogenhafen_slum_cannon_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_slum_cannon_01",
				"pes_level_bogenhafen_slum_cannon_02",
				"pes_level_bogenhafen_slum_cannon_03",
				"pes_level_bogenhafen_slum_cannon_04",
			},
			sound_events_duration = {
				5.5001873970032,
				2.7146875858307,
				5.8371667861939,
				3.631854057312,
			},
		},
		pes_level_bogenhafen_slum_end = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
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
				"pes_level_bogenhafen_slum_end_01",
				"pes_level_bogenhafen_slum_end_02",
				"pes_level_bogenhafen_slum_end_03",
				"pes_level_bogenhafen_slum_end_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_slum_end_01",
				"pes_level_bogenhafen_slum_end_02",
				"pes_level_bogenhafen_slum_end_03",
				"pes_level_bogenhafen_slum_end_04",
			},
			sound_events_duration = {
				4.0604376792908,
				4.074583530426,
				4.870041847229,
				4.8436250686645,
			},
		},
		pes_level_bogenhafen_slum_escape = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
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
				"pes_level_bogenhafen_slum_escape_01",
				"pes_level_bogenhafen_slum_escape_02",
				"pes_level_bogenhafen_slum_escape_03",
				"pes_level_bogenhafen_slum_escape_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_slum_escape_01",
				"pes_level_bogenhafen_slum_escape_02",
				"pes_level_bogenhafen_slum_escape_03",
				"pes_level_bogenhafen_slum_escape_04",
			},
			sound_events_duration = {
				1.835520863533,
				2.0077083110809,
				2.0608749389648,
				3.2111666202545,
			},
		},
		pes_level_bogenhafen_slum_find_hideout = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pes_level_bogenhafen_slum_find_hideout_01",
				"pes_level_bogenhafen_slum_find_hideout_02",
				"pes_level_bogenhafen_slum_find_hideout_03",
				"pes_level_bogenhafen_slum_find_hideout_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_slum_find_hideout_01",
				"pes_level_bogenhafen_slum_find_hideout_02",
				"pes_level_bogenhafen_slum_find_hideout_03",
				"pes_level_bogenhafen_slum_find_hideout_04",
			},
			sound_events_duration = {
				3.8923332691193,
				1.8807916641235,
				3.5849583148956,
				7.6091041564941,
			},
		},
		pes_level_bogenhafen_slum_fortify = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
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
				"pes_level_bogenhafen_slum_fortify_01",
				"pes_level_bogenhafen_slum_fortify_02",
				"pes_level_bogenhafen_slum_fortify_03",
				"pes_level_bogenhafen_slum_fortify_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_slum_fortify_01",
				"pes_level_bogenhafen_slum_fortify_02",
				"pes_level_bogenhafen_slum_fortify_03",
				"pes_level_bogenhafen_slum_fortify_04",
			},
			sound_events_duration = {
				2.2024791240692,
				1.5487500429153,
				4.0462083816528,
				2.5072500705719,
			},
		},
		pes_level_bogenhafen_slum_fortify_prep = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
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
				"pes_level_bogenhafen_slum_fortify_prep_01",
				"pes_level_bogenhafen_slum_fortify_prep_02",
				"pes_level_bogenhafen_slum_fortify_prep_03",
				"pes_level_bogenhafen_slum_fortify_prep_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_slum_fortify_prep_01",
				"pes_level_bogenhafen_slum_fortify_prep_02",
				"pes_level_bogenhafen_slum_fortify_prep_03",
				"pes_level_bogenhafen_slum_fortify_prep_04",
			},
			sound_events_duration = {
				1.9961041212082,
				3.3158957958221,
				1.8525832891464,
				3.9502084255219,
			},
		},
		pes_level_bogenhafen_slum_foul_air = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pes_level_bogenhafen_slum_foul_air_01",
				"pes_level_bogenhafen_slum_foul_air_02",
				"pes_level_bogenhafen_slum_foul_air_03",
				"pes_level_bogenhafen_slum_foul_air_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_slum_foul_air_01",
				"pes_level_bogenhafen_slum_foul_air_02",
				"pes_level_bogenhafen_slum_foul_air_03",
				"pes_level_bogenhafen_slum_foul_air_04",
			},
			sound_events_duration = {
				4.375041604042,
				4.6494793891907,
				4.2101459503174,
				3.9336874485016,
			},
		},
		pes_level_bogenhafen_slum_gang = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_concerned",
				"face_neutral",
				"face_neutral",
				"face_curious",
			},
			localization_strings = {
				"pes_level_bogenhafen_slum_gang_01",
				"pes_level_bogenhafen_slum_gang_02",
				"pes_level_bogenhafen_slum_gang_03",
				"pes_level_bogenhafen_slum_gang_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_slum_gang_01",
				"pes_level_bogenhafen_slum_gang_02",
				"pes_level_bogenhafen_slum_gang_03",
				"pes_level_bogenhafen_slum_gang_04",
			},
			sound_events_duration = {
				3.9172084331513,
				4.5212497711182,
				4.9097499847412,
				6.8916668891907,
			},
		},
		pes_level_bogenhafen_slum_intro_a = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
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
				[1] = "pes_level_bogenhafen_slum_intro_a_01",
				[2] = "pes_level_bogenhafen_slum_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_bogenhafen_slum_intro_a_01",
				[2] = "pes_level_bogenhafen_slum_intro_a_02",
			},
			sound_events_duration = {
				[1] = 6.5507497787476,
				[2] = 4.4496874809265,
			},
		},
		pes_level_bogenhafen_slum_intro_b = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
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
				[1] = "pes_level_bogenhafen_slum_intro_b_01",
				[2] = "pes_level_bogenhafen_slum_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_bogenhafen_slum_intro_b_01",
				[2] = "pes_level_bogenhafen_slum_intro_b_02",
			},
			sound_events_duration = {
				[1] = 3.8460834026337,
				[2] = 4.6342082023621,
			},
		},
		pes_level_bogenhafen_slum_intro_c = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
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
				[1] = "pes_level_bogenhafen_slum_intro_c_01",
				[2] = "pes_level_bogenhafen_slum_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_bogenhafen_slum_intro_c_01",
				[2] = "pes_level_bogenhafen_slum_intro_c_02",
			},
			sound_events_duration = {
				[1] = 4.8639686107635,
				[2] = 8.357458114624,
			},
		},
		pes_level_bogenhafen_slum_noble_food = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
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
				"pes_level_bogenhafen_slum_noble_food_01",
				"pes_level_bogenhafen_slum_noble_food_02",
				"pes_level_bogenhafen_slum_noble_food_03",
				"pes_level_bogenhafen_slum_noble_food_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_slum_noble_food_01",
				"pes_level_bogenhafen_slum_noble_food_02",
				"pes_level_bogenhafen_slum_noble_food_03",
				"pes_level_bogenhafen_slum_noble_food_04",
			},
			sound_events_duration = {
				4.1488752365112,
				5.7858333587647,
				5.1601247787476,
				5.9686040878296,
			},
		},
		pes_level_bogenhafen_slum_noisy_exit = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
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
				"pes_level_bogenhafen_slum_noisy_exit_01",
				"pes_level_bogenhafen_slum_noisy_exit_02",
				"pes_level_bogenhafen_slum_noisy_exit_03",
				"pes_level_bogenhafen_slum_noisy_exit_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_slum_noisy_exit_01",
				"pes_level_bogenhafen_slum_noisy_exit_02",
				"pes_level_bogenhafen_slum_noisy_exit_03",
				"pes_level_bogenhafen_slum_noisy_exit_04",
			},
			sound_events_duration = {
				3.0401666164398,
				6.6315627098083,
				3.0163750648499,
				1.7475625276566,
			},
		},
		pes_level_bogenhafen_slum_river = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_level_bogenhafen_slum_river_01",
				"pes_level_bogenhafen_slum_river_02",
				"pes_level_bogenhafen_slum_river_03",
				"pes_level_bogenhafen_slum_river_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_slum_river_01",
				"pes_level_bogenhafen_slum_river_02",
				"pes_level_bogenhafen_slum_river_03",
				"pes_level_bogenhafen_slum_river_04",
			},
			sound_events_duration = {
				4.6078333854675,
				3.449937582016,
				4.6112499237061,
				4.6145625114441,
			},
		},
		pes_level_bogenhafen_slum_search = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
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
				"pes_level_bogenhafen_slum_search_01",
				"pes_level_bogenhafen_slum_search_02",
				"pes_level_bogenhafen_slum_search_03",
				"pes_level_bogenhafen_slum_search_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_slum_search_01",
				"pes_level_bogenhafen_slum_search_02",
				"pes_level_bogenhafen_slum_search_03",
				"pes_level_bogenhafen_slum_search_04",
			},
			sound_events_duration = {
				3.3684582710266,
				2.5360832214356,
				2.8272082805634,
				1.7828749418259,
			},
		},
		pes_level_bogenhafen_slum_slum = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
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
				"pes_level_bogenhafen_slum_slum_01",
				"pes_level_bogenhafen_slum_slum_02",
				"pes_level_bogenhafen_slum_slum_03",
				"pes_level_bogenhafen_slum_slum_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_slum_slum_01",
				"pes_level_bogenhafen_slum_slum_02",
				"pes_level_bogenhafen_slum_slum_03",
				"pes_level_bogenhafen_slum_slum_04",
			},
			sound_events_duration = {
				4.7087707519531,
				3.5232501029968,
				4.3982706069946,
				6.3656044006348,
			},
		},
		pes_level_bogenhafen_slum_squalor = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
			},
			localization_strings = {
				"pes_level_bogenhafen_slum_squalor_01",
				"pes_level_bogenhafen_slum_squalor_02",
				"pes_level_bogenhafen_slum_squalor_03",
				"pes_level_bogenhafen_slum_squalor_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_slum_squalor_01",
				"pes_level_bogenhafen_slum_squalor_02",
				"pes_level_bogenhafen_slum_squalor_03",
				"pes_level_bogenhafen_slum_squalor_04",
			},
			sound_events_duration = {
				2.2117917537689,
				4.153395652771,
				3.5759478807449,
				4.2679790258408,
			},
		},
		pes_level_bogenhafen_slum_stolen_goods = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
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
				"pes_level_bogenhafen_slum_stolen_goods_01",
				"pes_level_bogenhafen_slum_stolen_goods_02",
				"pes_level_bogenhafen_slum_stolen_goods_03",
				"pes_level_bogenhafen_slum_stolen_goods_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_slum_stolen_goods_01",
				"pes_level_bogenhafen_slum_stolen_goods_02",
				"pes_level_bogenhafen_slum_stolen_goods_03",
				"pes_level_bogenhafen_slum_stolen_goods_04",
			},
			sound_events_duration = {
				3.2962708473206,
				2.6640625,
				3.3651041984558,
				4.5013542175293,
			},
		},
		pes_level_bogenhafen_slum_tainted_food = {
			category = "cut_scene",
			database = "empire_soldier_bogenhafen_slum",
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
				"pes_level_bogenhafen_slum_tainted_food_01",
				"pes_level_bogenhafen_slum_tainted_food_02",
				"pes_level_bogenhafen_slum_tainted_food_03",
				"pes_level_bogenhafen_slum_tainted_food_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_slum_tainted_food_01",
				"pes_level_bogenhafen_slum_tainted_food_02",
				"pes_level_bogenhafen_slum_tainted_food_03",
				"pes_level_bogenhafen_slum_tainted_food_04",
			},
			sound_events_duration = {
				5.1007916927338,
				4.6849167346954,
				4.0833539962769,
				5.3445835113525,
			},
		},
		pes_level_bogenhafen_slum_the_58 = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pes_level_bogenhafen_slum_the_58_01",
				"pes_level_bogenhafen_slum_the_58_02",
				"pes_level_bogenhafen_slum_the_58_03",
				"pes_level_bogenhafen_slum_the_58_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_slum_the_58_01",
				"pes_level_bogenhafen_slum_the_58_02",
				"pes_level_bogenhafen_slum_the_58_03",
				"pes_level_bogenhafen_slum_the_58_04",
			},
			sound_events_duration = {
				3.5743958950043,
				5.1438331604004,
				4.5657081604004,
				4.4989790916443,
			},
		},
		pes_level_bogenhafen_slum_the_wall = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
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
				"pes_level_bogenhafen_slum_the_wall_01",
				"pes_level_bogenhafen_slum_the_wall_02",
				"pes_level_bogenhafen_slum_the_wall_03",
				"pes_level_bogenhafen_slum_the_wall_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_slum_the_wall_01",
				"pes_level_bogenhafen_slum_the_wall_02",
				"pes_level_bogenhafen_slum_the_wall_03",
				"pes_level_bogenhafen_slum_the_wall_04",
			},
			sound_events_duration = {
				2.5269062519074,
				3.2197499275208,
				2.0765416622162,
				2.8485417366028,
			},
		},
		pes_level_bogenhafen_slum_too_quiet = {
			category = "level_talk",
			database = "empire_soldier_bogenhafen_slum",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pes_level_bogenhafen_slum_too_quiet_01",
				"pes_level_bogenhafen_slum_too_quiet_02",
				"pes_level_bogenhafen_slum_too_quiet_03",
				"pes_level_bogenhafen_slum_too_quiet_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_slum_too_quiet_01",
				"pes_level_bogenhafen_slum_too_quiet_02",
				"pes_level_bogenhafen_slum_too_quiet_03",
				"pes_level_bogenhafen_slum_too_quiet_04",
			},
			sound_events_duration = {
				3.5705626010895,
				3.7904374599457,
				4.0134792327881,
				6.2976040840149,
			},
		},
	})
end
