TwitchVoteTemplates = TwitchVoteTemplates or {}
TwitchVoteTemplates.rat_ogre = {
	cost = 200,
	text = "twitch_vote_spawn_rat_ogre",
	texture_id = "twitch_rat_ogre",
	on_success = function (is_server)
		if is_server then
			local breed = Breeds.skaven_rat_ogre

			Managers.state.conflict:spawn_one(breed)
		end

		return 
	end
}
TwitchVoteTemplates.stormfiend = {
	cost = 200,
	text = "twitch_vote_spawn_stormfiend",
	texture_id = "twitch_rat_ogre",
	on_success = function (is_server)
		if is_server then
			local breed = Breeds.skaven_stormfiend

			Managers.state.conflict:spawn_one(breed)
		end

		return 
	end
}
TwitchVoteTemplates.chaos_troll = {
	cost = 200,
	text = "twitch_vote_spawn_chaos_troll",
	texture_id = "twitch_rat_ogre",
	on_success = function (is_server)
		if is_server then
			local breed = Breeds.chaos_troll

			Managers.state.conflict:spawn_one(breed)
		end

		return 
	end
}
TwitchVoteTemplates.chaos_spawn = {
	cost = 200,
	text = "twitch_vote_spawn_chaos_spawn",
	texture_id = "twitch_rat_ogre",
	on_success = function (is_server)
		if is_server then
			local breed = Breeds.chaos_spawn

			Managers.state.conflict:spawn_one(breed)
		end

		return 
	end
}
TwitchVoteTemplates.corruptor_sorcerer = {
	cost = 100,
	text = "twitch_vote_spawn_corruptor_sorcerer",
	texture_id = "twitch_rat_ogre",
	on_success = function (is_server)
		if is_server then
			local amount = 3

			for i = 1, amount, 1 do
				local breed = Breeds.chaos_corruptor_sorcerer

				Managers.state.conflict:spawn_one(breed)
			end
		end

		return 
	end
}
TwitchVoteTemplates.vortex_sorcerer = {
	cost = 100,
	text = "twitch_vote_spawn_vortex_sorcerer",
	texture_id = "twitch_rat_ogre",
	on_success = function (is_server)
		if is_server then
			local amount = 3

			for i = 1, amount, 1 do
				local breed = Breeds.chaos_vortex_sorcerer

				Managers.state.conflict:spawn_one(breed)
			end
		end

		return 
	end
}
TwitchVoteTemplates.gutter_runner = {
	cost = 100,
	text = "twitch_vote_spawn_gutter_runner",
	texture_id = "twitch_rat_ogre",
	on_success = function (is_server)
		if is_server then
			local amount = 3

			for i = 1, amount, 1 do
				local breed = Breeds.skaven_gutter_runner

				Managers.state.conflict:spawn_one(breed)
			end
		end

		return 
	end
}
TwitchVoteTemplates.pack_master = {
	cost = 100,
	text = "twitch_vote_spawn_pack_master",
	texture_id = "twitch_rat_ogre",
	on_success = function (is_server)
		if is_server then
			local amount = 3

			for i = 1, amount, 1 do
				local breed = Breeds.skaven_pack_master

				Managers.state.conflict:spawn_one(breed)
			end
		end

		return 
	end
}
TwitchVoteTemplates.poison_wind_globadier = {
	cost = 100,
	text = "twitch_vote_spawn_poison_wind_globadier",
	texture_id = "twitch_rat_ogre",
	on_success = function (is_server)
		if is_server then
			local amount = 3

			for i = 1, amount, 1 do
				local breed = Breeds.skaven_poison_wind_globadier

				Managers.state.conflict:spawn_one(breed)
			end
		end

		return 
	end
}
TwitchVoteTemplates.ratling_gunner = {
	cost = 100,
	text = "twitch_vote_spawn_ratling_gunner",
	texture_id = "twitch_rat_ogre",
	on_success = function (is_server)
		if is_server then
			local amount = 3

			for i = 1, amount, 1 do
				local breed = Breeds.skaven_ratling_gunner

				Managers.state.conflict:spawn_one(breed)
			end
		end

		return 
	end
}
TwitchVoteTemplates.warpfire_thrower = {
	cost = 100,
	text = "twitch_vote_spawn_warpfire_thrower",
	texture_id = "twitch_rat_ogre",
	on_success = function (is_server)
		if is_server then
			local amount = 3

			for i = 1, amount, 1 do
				local breed = Breeds.skaven_warpfire_thrower

				Managers.state.conflict:spawn_one(breed)
			end
		end

		return 
	end
}
TwitchVoteTemplates.warpfire_thrower = {
	cost = 100,
	text = "twitch_vote_spawn_warpfire_thrower",
	texture_id = "twitch_rat_ogre",
	on_success = function (is_server)
		if is_server then
			local amount = 3

			for i = 1, amount, 1 do
				local breed = Breeds.skaven_warpfire_thrower

				Managers.state.conflict:spawn_one(breed)
			end
		end

		return 
	end
}
TwitchVoteTemplates.horde_vector_blob = {
	cost = 200,
	text = "twitch_vote_spawn_horde",
	texture_id = "twitch_rat_ogre",
	on_success = function (is_server)
		if is_server then
			local horde_type = "vector_blob"

			Managers.state.conflict.horde_spawner:horde(horde_type)
		end

		return 
	end
}
TwitchVoteTemplates.death_squad_storm_vermin = {
	cost = -300,
	text = "twitch_vote_spawn_death_squad_storm_vermin",
	texture_id = "twitch_rat_ogre",
	on_success = function (is_server)
		if is_server then
			local amount = 12

			for i = 1, amount, 1 do
				local breed = Breeds.skaven_storm_vermin

				Managers.state.conflict:spawn_one(breed)
			end
		end

		return 
	end
}
TwitchVoteTemplates.death_squad_chaos_warrior = {
	cost = -300,
	text = "twitch_vote_spawn_death_squad_chaos_warrior",
	texture_id = "twitch_rat_ogre",
	on_success = function (is_server)
		if is_server then
			local amount = 6

			for i = 1, amount, 1 do
				local breed = Breeds.chaos_warrior

				Managers.state.conflict:spawn_one(breed)
			end
		end

		return 
	end
}
TwitchVoteTemplates.loot_rat_fiesta = {
	cost = -400,
	text = "twitch_vote_spawn_loot_rat_fiesta",
	texture_id = "twitch_rat_ogre",
	on_success = function (is_server)
		if is_server then
			local amount = 20

			for i = 1, amount, 1 do
				local breed = Breeds.skaven_loot_rat

				Managers.state.conflict:spawn_one(breed)
			end
		end

		return 
	end
}

return 
