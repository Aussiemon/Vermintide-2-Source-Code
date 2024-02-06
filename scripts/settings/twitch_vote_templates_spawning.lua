-- chunkname: @scripts/settings/twitch_vote_templates_spawning.lua

local twitch_settings = TwitchSettings

local function debug_print(message, ...)
	if DEBUG_TWITCH then
		print("[Twitch] " .. string.format(message, ...))
	end
end

local function spawn_custom_horde(breed_name, difficulty_amounts)
	local difficulty = Managers.state.difficulty:get_difficulty()
	local num_enemies_range = difficulty_amounts[difficulty]

	num_enemies_range = num_enemies_range or difficulty_amounts.hardest

	local amount_of_enemies = math.ceil(math.random(num_enemies_range[1], num_enemies_range[2]) * twitch_settings.spawn_amount_multiplier)
	local side = Managers.state.side:get_side_from_name("dark_pact")
	local side_id = side.side_id
	local spawn_list = {}

	for i = 1, amount_of_enemies do
		spawn_list[#spawn_list + 1] = breed_name
	end

	local conflict_director = Managers.state.conflict
	local only_ahead = false
	local main_path_info = conflict_director.main_path_info

	if main_path_info.ahead_unit or main_path_info.behind_unit then
		conflict_director.horde_spawner:execute_custom_horde(spawn_list, only_ahead, side_id)
	end
end

local function spawn_hidden(breed_name, difficulty_amounts)
	local difficulty = Managers.state.difficulty:get_difficulty()
	local num_enemies = difficulty_amounts[difficulty]

	num_enemies = num_enemies or difficulty_amounts.hardest

	local amount_of_enemies

	if type(num_enemies) == "table" then
		amount_of_enemies = math.ceil(math.random(num_enemies[1], num_enemies[2]) * twitch_settings.spawn_amount_multiplier)
	else
		amount_of_enemies = math.ceil(num_enemies * twitch_settings.spawn_amount_multiplier)
	end

	local conflict_director = Managers.state.conflict

	for i = 1, amount_of_enemies do
		local hidden_pos = conflict_director.specials_pacing:get_special_spawn_pos()

		conflict_director:spawn_one(Breeds[breed_name], hidden_pos)
	end
end

TwitchVoteTemplates = TwitchVoteTemplates or {}
TwitchVoteTemplates.twitch_spawn_rat_ogre = {
	breed_name = "skaven_rat_ogre",
	cost = 180,
	text = "twitch_vote_spawn_rat_ogre",
	texture_id = "twitch_icon_all_the_rage",
	texture_size = {
		60,
		70,
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning rat ogre")

			local breed = Breeds.skaven_rat_ogre
			local spawn_amount = math.floor(1 * twitch_settings.spawn_amount_multiplier)

			for i = 1, spawn_amount do
				Managers.state.conflict:spawn_one(breed, nil, nil, {
					max_health_modifier = 0.85,
				})
			end
		end
	end,
}
TwitchVoteTemplates.twitch_spawn_stormfiend = {
	breed_name = "skaven_stormfiend",
	cost = 180,
	text = "twitch_vote_spawn_stormfiend",
	texture_id = "twitch_icon_fire_and_fury",
	texture_size = {
		60,
		70,
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning stormfiend")

			local breed = Breeds.skaven_stormfiend
			local spawn_amount = math.floor(1 * twitch_settings.spawn_amount_multiplier)

			for i = 1, spawn_amount do
				Managers.state.conflict:spawn_one(breed, nil, nil, {
					max_health_modifier = 0.85,
				})
			end
		end
	end,
}
TwitchVoteTemplates.twitch_spawn_chaos_troll = {
	breed_name = "chaos_troll",
	cost = 180,
	text = "twitch_vote_spawn_chaos_troll",
	texture_id = "twitch_icon_bad_indigestion",
	texture_size = {
		60,
		70,
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning chaos troll")

			local breed = Breeds.chaos_troll
			local spawn_amount = math.floor(1 * twitch_settings.spawn_amount_multiplier)

			for i = 1, spawn_amount do
				Managers.state.conflict:spawn_one(breed, nil, nil, {
					max_health_modifier = 0.85,
				})
			end
		end
	end,
}
TwitchVoteTemplates.twitch_spawn_chaos_spawn = {
	breed_name = "chaos_spawn",
	cost = 180,
	text = "twitch_vote_spawn_chaos_spawn",
	texture_id = "twitch_icon_writhing_horror",
	texture_size = {
		60,
		70,
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning chaos spawn")

			local breed = Breeds.chaos_spawn
			local spawn_amount = math.floor(1 * twitch_settings.spawn_amount_multiplier)

			for i = 1, spawn_amount do
				Managers.state.conflict:spawn_one(breed, nil, nil, {
					max_health_modifier = 0.85,
				})
			end
		end
	end,
}
TwitchVoteTemplates.twitch_spawn_minotaur = {
	breed_name = "beastmen_minotaur",
	cost = 180,
	text = "twitch_vote_spawn_minotaur",
	texture_id = "twitch_icon_the_bloodkine_wakes",
	texture_size = {
		60,
		70,
	},
	condition_func = function (current_vote)
		return Managers.unlock:is_dlc_unlocked("scorpion")
	end,
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning chaos spawn")

			local breed = Breeds.beastmen_minotaur
			local spawn_amount = math.floor(1 * twitch_settings.spawn_amount_multiplier)

			for i = 1, spawn_amount do
				Managers.state.conflict:spawn_one(breed, nil, nil, {
					max_health_modifier = 0.85,
				})
			end
		end
	end,
}
TwitchVoteTemplates.twitch_spawn_corruptor_sorcerer = {
	breed_name = "chaos_corruptor_sorcerer",
	cost = 150,
	text = "twitch_vote_spawn_corruptor_sorcerer",
	texture_id = "twitch_icon_soul_drinkers",
	texture_size = {
		60,
		70,
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning group of corruptor sorcerers")

			local amount_per_difficulty = {
				hard = 2,
				harder = 3,
				hardest = 3,
				normal = 2,
			}

			spawn_hidden("chaos_corruptor_sorcerer", amount_per_difficulty)
		end
	end,
}
TwitchVoteTemplates.twitch_spawn_vortex_sorcerer = {
	breed_name = "chaos_vortex_sorcerer",
	cost = 100,
	text = "twitch_vote_spawn_vortex_sorcerer",
	texture_id = "twitch_icon_all_aboard_the_wild_ride",
	texture_size = {
		60,
		70,
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning group of vortex sorceres")

			local amount_per_difficulty = {
				hard = 3,
				harder = 4,
				hardest = 4,
				normal = 3,
			}

			spawn_hidden("chaos_vortex_sorcerer", amount_per_difficulty)
		end
	end,
}
TwitchVoteTemplates.twitch_spawn_gutter_runner = {
	breed_name = "skaven_gutter_runner",
	cost = 150,
	text = "twitch_vote_spawn_gutter_runner",
	texture_id = "twitch_icon_sneaking_stabbing",
	texture_size = {
		60,
		70,
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning group of gutter runners")

			local amount_per_difficulty = {
				hard = 2,
				harder = 3,
				hardest = 4,
				normal = 2,
			}

			spawn_hidden("skaven_gutter_runner", amount_per_difficulty)
		end
	end,
}
TwitchVoteTemplates.twitch_spawn_pack_master = {
	breed_name = "skaven_pack_master",
	cost = 150,
	text = "twitch_vote_spawn_pack_master",
	texture_id = "twitch_icon_cruel_hooks",
	texture_size = {
		60,
		70,
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning group of packmasters")

			local amount_per_difficulty = {
				hard = 3,
				harder = 3,
				hardest = 4,
				normal = 3,
			}

			spawn_hidden("skaven_pack_master", amount_per_difficulty)
		end
	end,
}
TwitchVoteTemplates.twitch_spawn_poison_wind_globadier = {
	breed_name = "skaven_poison_wind_globadier",
	cost = 100,
	text = "twitch_vote_spawn_poison_wind_globadier",
	texture_id = "twitch_icon_hold_your_breath",
	texture_size = {
		60,
		70,
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning group of poison wind globadiers")

			local amount_per_difficulty = {
				hard = 3,
				harder = 3,
				hardest = 4,
				normal = 3,
			}

			spawn_hidden("skaven_poison_wind_globadier", amount_per_difficulty)
		end
	end,
}
TwitchVoteTemplates.twitch_spawn_ratling_gunner = {
	breed_name = "skaven_ratling_gunner",
	cost = 100,
	text = "twitch_vote_spawn_ratling_gunner",
	texture_id = "twitch_icon_gunline",
	texture_size = {
		60,
		70,
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning group of ratling gunners")

			local amount_per_difficulty = {
				hard = 3,
				harder = 4,
				hardest = 4,
				normal = 3,
			}

			spawn_hidden("skaven_ratling_gunner", amount_per_difficulty)
		end
	end,
}
TwitchVoteTemplates.twitch_spawn_warpfire_thrower = {
	breed_name = "skaven_warpfire_thrower",
	cost = 100,
	text = "twitch_vote_spawn_warpfire_thrower",
	texture_id = "twitch_icon_kill_it_with_fire",
	texture_size = {
		60,
		70,
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning group of warpfire throwers")

			local amount_per_difficulty = {
				hard = 4,
				harder = 4,
				hardest = 5,
				normal = 4,
			}

			spawn_hidden("skaven_warpfire_thrower", amount_per_difficulty)
		end
	end,
}
TwitchVoteTemplates.twitch_spawn_horde_vector_blob = {
	cost = 100,
	text = "twitch_vote_spawn_horde",
	texture_id = "twitch_icon_release_the_slaves",
	texture_size = {
		60,
		70,
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning horde")

			local amount_of_enemies_per_difficulty = {
				normal = {
					16,
					22,
				},
				hard = {
					22,
					28,
				},
				harder = {
					28,
					36,
				},
				hardest = {
					36,
					42,
				},
			}
			local possible_breeds = {
				"skaven_slave",
				"chaos_fanatic",
			}
			local chosen_breed = possible_breeds[Math.random(1, #possible_breeds)]

			spawn_custom_horde(chosen_breed, amount_of_enemies_per_difficulty)
		end
	end,
}
TwitchVoteTemplates.twitch_spawn_explosive_loot_rats = {
	cost = 100,
	text = "display_name_explosive_loot_rats",
	texture_id = "twitch_icon_explosive_loot_rats",
	texture_size = {
		60,
		70,
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning explosive loot rats")

			local amount_of_enemies_per_difficulty = {
				normal = {
					3,
					4,
				},
				hard = {
					4,
					6,
				},
				harder = {
					6,
					8,
				},
				hardest = {
					8,
					10,
				},
			}

			spawn_custom_horde("skaven_explosive_loot_rat", amount_of_enemies_per_difficulty)
		end
	end,
}
TwitchVoteTemplates.twitch_spawn_plague_monks = {
	cost = 100,
	text = "twitch_vote_spawn_plague_monks",
	texture_id = "twitch_icon_plague_monk",
	texture_size = {
		60,
		70,
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning plague_monks")

			local amount_of_enemies_per_difficulty = {
				normal = {
					3,
					4,
				},
				hard = {
					4,
					6,
				},
				harder = {
					6,
					8,
				},
				hardest = {
					8,
					10,
				},
			}

			spawn_custom_horde("skaven_plague_monk", amount_of_enemies_per_difficulty)
		end
	end,
}
TwitchVoteTemplates.twitch_spawn_berzerkers = {
	cost = 100,
	text = "twitch_vote_spawn_berzerkers",
	texture_id = "twitch_icon_berzerker",
	texture_size = {
		60,
		70,
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning chaos_berzerker")

			local amount_of_enemies_per_difficulty = {
				normal = {
					3,
					4,
				},
				hard = {
					4,
					6,
				},
				harder = {
					6,
					8,
				},
				hardest = {
					8,
					10,
				},
			}

			spawn_custom_horde("chaos_berzerker", amount_of_enemies_per_difficulty)
		end
	end,
}
TwitchVoteTemplates.twitch_spawn_death_squad_storm_vermin = {
	boss_equivalent = true,
	cost = 250,
	text = "twitch_vote_spawn_death_squad_storm_vermin",
	texture_id = "twitch_icon_blackfurs_on_parade",
	texture_size = {
		60,
		70,
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning storm vermin patrol")

			local amount_of_enemies_per_difficulty = {
				normal = {
					6,
					8,
				},
				hard = {
					8,
					10,
				},
				harder = {
					10,
					12,
				},
				hardest = {
					12,
					14,
				},
			}

			spawn_custom_horde("skaven_storm_vermin", amount_of_enemies_per_difficulty)
		end
	end,
}
TwitchVoteTemplates.twitch_spawn_death_squad_chaos_warrior = {
	boss_equivalent = true,
	cost = 250,
	text = "twitch_vote_spawn_death_squad_chaos_warrior",
	texture_id = "twitch_icon_eavymetal",
	texture_size = {
		60,
		70,
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning chaos warriors death squad")

			local amount_of_enemies_per_difficulty = {
				normal = {
					4,
					5,
				},
				hard = {
					4,
					6,
				},
				harder = {
					6,
					8,
				},
				hardest = {
					8,
					10,
				},
			}

			spawn_custom_horde("chaos_warrior", amount_of_enemies_per_difficulty)
		end
	end,
}
TwitchVoteTemplates.twitch_spawn_loot_rat_fiesta = {
	cost = 0,
	text = "twitch_vote_spawn_loot_rat_fiesta",
	texture_id = "twitch_icon_treasure_hunt",
	texture_size = {
		60,
		70,
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning loot rat fiesta")

			local amount = 10 * twitch_settings.spawn_amount_multiplier

			for i = 1, amount do
				local breed = Breeds.skaven_loot_rat

				Managers.state.conflict:spawn_one(breed)
			end
		end
	end,
}
