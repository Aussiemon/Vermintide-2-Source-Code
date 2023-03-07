BackendInterfaceLootBenchmark = class(BackendInterfaceLootBenchmark)

BackendInterfaceLootBenchmark.init = function (self, backend_mirror)
	return
end

BackendInterfaceLootBenchmark.ready = function (self)
	return true
end

BackendInterfaceLootBenchmark.update = function (self, dt)
	return
end

BackendInterfaceLootBenchmark.open_loot_chest = function (self, hero_name, backend_id)
	return 1
end

BackendInterfaceLootBenchmark.loot_chest_rewards_request_cb = function (self, data, result)
	return
end

BackendInterfaceLootBenchmark.generate_end_of_level_loot = function (self, game_won, quick_play_bonus, difficulty, level_key, hero_name, start_experience, end_experience, loot_profile_name, deed_item_name, deed_backend_id, game_mode_key, game_time, end_of_level_rewards_arguments)
	return 1
end

BackendInterfaceLootBenchmark.end_of_level_loot_request_cb = function (self, data, result)
	return
end

BackendInterfaceLootBenchmark.achievement_rewards_claimed = function (self, achievement_id)
	return nil
end

BackendInterfaceLootBenchmark.can_claim_achievement_rewards = function (self, achievement_id)
	return false
end

BackendInterfaceLootBenchmark.claim_achievement_rewards = function (self, achievement_id)
	return 1
end

BackendInterfaceLootBenchmark.achievement_rewards_request_cb = function (self, data, result)
	return
end

BackendInterfaceLootBenchmark.is_loot_generated = function (self, id)
	return false
end

BackendInterfaceLootBenchmark.get_loot = function (self, id)
	return nil
end
