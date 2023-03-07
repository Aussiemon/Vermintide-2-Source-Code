LevelEndViewDeus = class(LevelEndViewDeus, LevelEndView)

LevelEndViewDeus.start = function (self)
	LevelEndViewDeus.super.start(self)

	self._start_music_event = self.game_won and "Play_won_music_morris" or "Play_lost_music_morris"
	self._stop_music_event = self.game_won and "Stop_won_music_morris" or "Stop_lost_music_morris"
end

LevelEndViewDeus._setup_pages_victory = function (self, rewards)
	local end_of_level_rewards = rewards.end_of_level_rewards
	local chest = end_of_level_rewards.chest
	local index_by_state_name = nil

	if chest then
		index_by_state_name = {
			EndViewStateChest = 2,
			EndViewStateSummaryDeus = 1,
			EndViewStateScore = 3
		}
	else
		index_by_state_name = {
			EndViewStateScore = 2,
			EndViewStateSummaryDeus = 1
		}
	end

	return index_by_state_name
end

LevelEndViewDeus._setup_pages_defeat = function (self, rewards)
	local end_of_level_rewards = rewards.end_of_level_rewards
	local chest = end_of_level_rewards.chest
	local index_by_state_name = nil

	if chest then
		index_by_state_name = {
			EndViewStateChest = 2,
			EndViewStateSummaryDeus = 1,
			EndViewStateScore = 3
		}
	else
		index_by_state_name = {
			EndViewStateScore = 2,
			EndViewStateSummaryDeus = 1
		}
	end

	return index_by_state_name
end
