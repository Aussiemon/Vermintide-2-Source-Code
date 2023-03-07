BackendInterfaceQuestsBenchmark = class(BackendInterfaceQuestsBenchmark)

BackendInterfaceQuestsBenchmark.init = function (self, backend_mirror)
	return
end

BackendInterfaceQuestsBenchmark._refresh = function (self)
	return
end

BackendInterfaceQuestsBenchmark.ready = function (self)
	return true
end

BackendInterfaceQuestsBenchmark.make_dirty = function (self)
	return
end

BackendInterfaceQuestsBenchmark.update = function (self, dt)
	return
end

BackendInterfaceQuestsBenchmark.get_quests_cb = function (self, result)
	return
end

BackendInterfaceQuestsBenchmark.delete = function (self)
	return
end

BackendInterfaceQuestsBenchmark.get_quests = function (self)
	return {}
end

BackendInterfaceQuestsBenchmark.get_daily_quest_update_time = function (self)
	return 0
end

BackendInterfaceQuestsBenchmark.get_time_left_on_event_quest = function (self, key)
	return 0
end

BackendInterfaceQuestsBenchmark.can_refresh_daily_quest = function (self)
	return false
end

BackendInterfaceQuestsBenchmark.refresh_daily_quest = function (self, key)
	return 1
end

BackendInterfaceQuestsBenchmark.refresh_quest_cb = function (self, id, key, result)
	return
end

BackendInterfaceQuestsBenchmark.is_quest_refreshed = function (self, id)
	return true
end

BackendInterfaceQuestsBenchmark.can_claim_quest_rewards = function (self, key)
	return false
end

BackendInterfaceQuestsBenchmark.claim_quest_rewards = function (self, key)
	return 1
end

BackendInterfaceQuestsBenchmark.quest_rewards_request_cb = function (self, data, result)
	return
end

BackendInterfaceQuestsBenchmark.get_quest_key = function (self, quest_id)
	return nil
end

BackendInterfaceQuestsBenchmark.quest_rewards_generated = function (self, id)
	return false
end

BackendInterfaceQuestsBenchmark.get_quest_rewards = function (self, id)
	return {}
end
