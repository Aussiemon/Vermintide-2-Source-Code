InGameChallenge = class(InGameChallenge)
InGameChallengeStatus = InGameChallengeStatus or CreateStrictEnumTable("Uninitialized", "InProgress", "Paused", "Finished")
InGameChallengeResult = InGameChallengeResult or CreateStrictEnumTable("Uninitialized", "Completed", "Canceled")

InGameChallenge.init = function (self, challenge_template, is_repeatable, category, reward, owner_unique_id, is_server, custom_amount, unique_id, auto_resume)
	self._challenge_template_name = challenge_template
	self._challenge_template = InGameChallengeTemplates[challenge_template]
	self._is_repeatable = is_repeatable
	self._category = category
	self._reward_name = reward
	self._reward = InGameChallengeRewards[reward]
	self._owner_unique_id = owner_unique_id
	self._is_server = is_server
	self._unique_id = unique_id
	self._auto_resume = auto_resume
	self._required_progress = custom_amount or self._challenge_template.default_target
	self._events_registered = false
	self._callback_table = nil

	self:reset(false)
end

InGameChallenge.reset = function (self, start_challenge)
	self:_unregister_events()

	self._needs_sync = true
	self._marked_for_cleanup = false
	self._challenge_data = {}
	self._progress = 0
	self._status = InGameChallengeStatus.Uninitialized
	self._result = InGameChallengeResult.Uninitialized

	if start_challenge then
		self:start()
	end
end

InGameChallenge.on_round_start = function (self)
	if self._status == InGameChallengeStatus.InProgress then
		self:_register_events()
	end
end

InGameChallenge.on_round_end = function (self)
	self:_unregister_events()
end

InGameChallenge.start = function (self)
	if self._status == InGameChallengeStatus.Uninitialized then
		self._status = InGameChallengeStatus.InProgress

		self:_register_events()

		self._needs_sync = true
	end
end

InGameChallenge.set_paused = function (self, paused)
	if paused then
		if self._status == InGameChallengeStatus.InProgress then
			self._status = InGameChallengeStatus.Paused

			self:_unregister_events()

			self._needs_sync = true
			self.paused_t = Managers.time:time("main")
		end
	elseif self._status == InGameChallengeStatus.Paused then
		self._status = InGameChallengeStatus.InProgress

		self:_register_events()

		self._needs_sync = true
		self.paused_t = nil
	end
end

InGameChallenge.cancel = function (self)
	self:_complete(InGameChallengeResult.Canceled)
end

InGameChallenge.get_category = function (self)
	return self._category
end

InGameChallenge.get_owner_unique_id = function (self)
	return self._owner_unique_id
end

InGameChallenge.get_challenge = function (self)
	return self._challenge_template
end

InGameChallenge.get_reward = function (self)
	return self._reward
end

InGameChallenge.is_active = function (self)
	return self._status == InGameChallengeStatus.InProgress or self._status == InGameChallengeStatus.Finished
end

InGameChallenge.has_ended = function (self)
	return self._status == InGameChallengeStatus.Finished
end

InGameChallenge.is_repeatable = function (self)
	return self._is_repeatable
end

InGameChallenge.auto_resume = function (self)
	return self._auto_resume
end

InGameChallenge.get_progress = function (self)
	return self._progress, self._required_progress
end

InGameChallenge.get_unique_id = function (self)
	return self._unique_id
end

InGameChallenge.get_status = function (self)
	return self._status
end

InGameChallenge.get_result = function (self)
	return self._result
end

InGameChallenge.get_challenge_name = function (self)
	return self._challenge_template_name
end

InGameChallenge.get_reward_name = function (self)
	return self._reward_name
end

InGameChallenge.belongs_to = function (self, player_unique_id)
	return self._owner_unique_id == player_unique_id
end

InGameChallenge._register_events = function (self)
	if not self._is_server then
		return
	end

	local event_manager = Managers.state.event

	if event_manager and not self._events_registered then
		self._events_registered = true
		local events_to_register = self._challenge_template.events

		if events_to_register then
			local callback_table = {}

			for event_name, event_function in pairs(events_to_register) do
				callback_table[event_name] = function (_, ...)
					local t = Managers.time:time("main")
					local progress_by = event_function(t, self._challenge_data, ...) or 0

					if progress_by ~= 0 then
						self._progress = math.clamp(self._progress + progress_by, 0, self._required_progress)

						self:_on_progress_updated()
					end
				end

				event_manager:register(callback_table, event_name, event_name)
			end

			self._callback_table = callback_table
		end
	end
end

InGameChallenge._unregister_events = function (self)
	if not self._is_server then
		return
	end

	if self._events_registered then
		local event_manager = Managers.state.event

		if event_manager then
			local callback_table = self._callback_table

			if callback_table then
				for event_name, _ in pairs(callback_table) do
					event_manager:unregister(event_name, callback_table)
				end
			end
		end

		self._callback_table = nil
		self._events_registered = false
	end
end

InGameChallenge._on_progress_updated = function (self)
	self._needs_sync = true

	if self._required_progress <= self._progress then
		self:_complete(InGameChallengeResult.Completed)
	end
end

InGameChallenge._complete = function (self, result)
	if self._result == InGameChallengeResult.Uninitialized and self._status ~= InGameChallengeStatus.Uninitialized then
		self._status = InGameChallengeStatus.Finished
		self._result = result

		if result == InGameChallengeResult.Completed then
			self:_award_reward()
		end

		self:_unregister_events()

		self._needs_sync = true
	end
end

InGameChallenge._award_reward = function (self)
	if not self._is_server then
		return
	end

	local reward = self._reward

	if reward then
		local targets = InGameChallengeRewardTargets[reward.target](self._owner_unique_id)

		InGameChallengeRewardTypes[reward.type](reward, targets, self._owner_unique_id)
	end
end

InGameChallenge.mark_for_cleanup = function (self)
	self._marked_for_cleanup = true
end

InGameChallenge.pending_cleanup = function (self)
	return self._marked_for_cleanup
end

InGameChallenge.needs_sync = function (self, consume)
	local sync = self._needs_sync

	if consume then
		self._needs_sync = false
	end

	return sync
end

InGameChallenge.client_update = function (self, progress, status_id, result_id)
	self._progress = progress
	self._status = InGameChallengeStatus[status_id]
	self._result = InGameChallengeResult[result_id]
end

return
