local function debug_print(message, ...)
	if DEBUG_TWITCH then
		print("[Twitch] " .. string.format(message, ...))
	end
end

TwitchVoteTemplates = TwitchVoteTemplates or {}
TwitchVoteTemplates.twitch_spawn_rat_ogre = {
	text = "twitch_vote_spawn_rat_ogre",
	breed_name = "skaven_rat_ogre",
	texture_id = "unit_frame_portrait_enemy_rat_ogre",
	cost = 180,
	texture_size = {
		60,
		70
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning rat ogre")

			local breed = Breeds.skaven_rat_ogre

			Managers.state.conflict:spawn_one(breed, nil, nil, {
				max_health_modifier = 0.85
			})
		end
	end
}
TwitchVoteTemplates.twitch_spawn_stormfiend = {
	text = "twitch_vote_spawn_stormfiend",
	breed_name = "skaven_stormfiend",
	texture_id = "unit_frame_portrait_enemy_stormfiend",
	cost = 180,
	texture_size = {
		60,
		70
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning stormfiend")

			local breed = Breeds.skaven_stormfiend

			Managers.state.conflict:spawn_one(breed, nil, nil, {
				max_health_modifier = 0.85
			})
		end
	end
}
TwitchVoteTemplates.twitch_spawn_chaos_troll = {
	text = "twitch_vote_spawn_chaos_troll",
	breed_name = "chaos_troll",
	texture_id = "unit_frame_portrait_enemy_chaos_troll",
	cost = 180,
	texture_size = {
		60,
		70
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning chaos troll")

			local breed = Breeds.chaos_troll

			Managers.state.conflict:spawn_one(breed, nil, nil, {
				max_health_modifier = 0.85
			})
		end
	end
}
TwitchVoteTemplates.twitch_spawn_chaos_spawn = {
	text = "twitch_vote_spawn_chaos_spawn",
	breed_name = "chaos_spawn",
	texture_id = "unit_frame_portrait_enemy_chaos_spawn",
	cost = 180,
	texture_size = {
		60,
		70
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning chaos spawn")

			local breed = Breeds.chaos_spawn

			Managers.state.conflict:spawn_one(breed, nil, nil, {
				max_health_modifier = 0.85
			})
		end
	end
}
TwitchVoteTemplates.twitch_spawn_corruptor_sorcerer = {
	text = "twitch_vote_spawn_corruptor_sorcerer",
	breed_name = "chaos_corruptor_sorcerer",
	texture_id = "unit_frame_portrait_enemy_sorcerer_corruptor",
	cost = 150,
	texture_size = {
		60,
		70
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning group of corruptor sorcerers")

			local amount = 2

			for i = 1, amount, 1 do
				local breed = Breeds.chaos_corruptor_sorcerer

				Managers.state.conflict:spawn_one(breed)
			end
		end
	end
}
TwitchVoteTemplates.twitch_spawn_vortex_sorcerer = {
	text = "twitch_vote_spawn_vortex_sorcerer",
	breed_name = "chaos_vortex_sorcerer",
	texture_id = "unit_frame_portrait_enemy_sorcerer_vortex",
	cost = 100,
	texture_size = {
		60,
		70
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning group of vortex sorceres")

			local amount = 3

			for i = 1, amount, 1 do
				local breed = Breeds.chaos_vortex_sorcerer

				Managers.state.conflict:spawn_one(breed)
			end
		end
	end
}
TwitchVoteTemplates.twitch_spawn_gutter_runner = {
	text = "twitch_vote_spawn_gutter_runner",
	breed_name = "skaven_gutter_runner",
	texture_id = "unit_frame_portrait_enemy_gutter_runner",
	cost = 150,
	texture_size = {
		60,
		70
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning group of gutter runners")

			local amount = 2

			for i = 1, amount, 1 do
				local breed = Breeds.skaven_gutter_runner

				Managers.state.conflict:spawn_one(breed)
			end
		end
	end
}
TwitchVoteTemplates.twitch_spawn_pack_master = {
	text = "twitch_vote_spawn_pack_master",
	breed_name = "skaven_pack_master",
	texture_id = "unit_frame_portrait_enemy_packmaster",
	cost = 150,
	texture_size = {
		60,
		70
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning group of packmasters")

			local amount = 3

			for i = 1, amount, 1 do
				local breed = Breeds.skaven_pack_master

				Managers.state.conflict:spawn_one(breed)
			end
		end
	end
}
TwitchVoteTemplates.twitch_spawn_poison_wind_globadier = {
	text = "twitch_vote_spawn_poison_wind_globadier",
	breed_name = "skaven_poison_wind_globadier",
	texture_id = "unit_frame_portrait_enemy_poison_wind",
	cost = 100,
	texture_size = {
		60,
		70
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning group of poison wind globadiers")

			local amount = 3

			for i = 1, amount, 1 do
				local breed = Breeds.skaven_poison_wind_globadier

				Managers.state.conflict:spawn_one(breed)
			end
		end
	end
}
TwitchVoteTemplates.twitch_spawn_ratling_gunner = {
	text = "twitch_vote_spawn_ratling_gunner",
	breed_name = "skaven_ratling_gunner",
	texture_id = "unit_frame_portrait_enemy_ratling_gunner",
	cost = 100,
	texture_size = {
		60,
		70
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning group of ratling gunners")

			local amount = 4

			for i = 1, amount, 1 do
				local breed = Breeds.skaven_ratling_gunner

				Managers.state.conflict:spawn_one(breed)
			end
		end
	end
}
TwitchVoteTemplates.twitch_spawn_warpfire_thrower = {
	text = "twitch_vote_spawn_warpfire_thrower",
	breed_name = "skaven_warpfire_thrower",
	texture_id = "unit_frame_portrait_enemy_warpfire",
	cost = 100,
	texture_size = {
		60,
		70
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning group of warpfire throwers")

			local amount = 4

			for i = 1, amount, 1 do
				local breed = Breeds.skaven_warpfire_thrower

				Managers.state.conflict:spawn_one(breed)
			end
		end
	end
}
TwitchVoteTemplates.twitch_spawn_horde_vector_blob = {
	text = "twitch_vote_spawn_horde",
	cost = 100,
	texture_id = "unit_frame_portrait_enemy_clanrat",
	texture_size = {
		60,
		70
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning horde")

			local horde_type = "vector_blob"
			local amount = 1

			for i = 1, amount, 1 do
				Managers.state.conflict.horde_spawner:horde(horde_type)
			end
		end
	end
}
TwitchVoteTemplates.twitch_spawn_death_squad_storm_vermin = {
	text = "twitch_vote_spawn_death_squad_storm_vermin",
	cost = 250,
	texture_id = "unit_frame_portrait_enemy_stormvermin",
	boss_equivalent = true,
	texture_size = {
		60,
		70
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning storm vermin death squad")

			local amount = 12

			for i = 1, amount, 1 do
				local breed = Breeds.skaven_storm_vermin

				Managers.state.conflict:spawn_one(breed)
			end
		end
	end
}
TwitchVoteTemplates.twitch_spawn_death_squad_chaos_warrior = {
	text = "twitch_vote_spawn_death_squad_chaos_warrior",
	cost = 250,
	texture_id = "unit_frame_portrait_enemy_chaos_warrior",
	boss_equivalent = true,
	texture_size = {
		60,
		70
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning chaos warriors death squad")

			local amount = 6

			for i = 1, amount, 1 do
				local breed = Breeds.chaos_warrior

				Managers.state.conflict:spawn_one(breed)
			end
		end
	end
}
TwitchVoteTemplates.twitch_spawn_loot_rat_fiesta = {
	text = "twitch_vote_spawn_loot_rat_fiesta",
	cost = -300,
	texture_id = "unit_frame_portrait_enemy_lootrat",
	texture_size = {
		60,
		70
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Spawning loot rat fiesta")

			local amount = 10

			for i = 1, amount, 1 do
				local breed = Breeds.skaven_loot_rat

				Managers.state.conflict:spawn_one(breed)
			end
		end
	end
}

return
