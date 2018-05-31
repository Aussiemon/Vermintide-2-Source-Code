QuestChallengePropExtension = class(QuestChallengePropExtension)
local ACHIEVEMENT_UPDATE_INTERVAL = 0.5
local QUEST_UPDATE_INTERVAL = 2

QuestChallengePropExtension.init = function (self, extension_init_context, unit)
	self._unit = unit

	self:_highlight_off()

	self._has_unclaimed_achievements = false
	self._has_unclaimed_quests = false
	self._next_unclaimed_achievement_check = 0
	self._next_unclaimed_quest_check = 0
end

QuestChallengePropExtension.update = function (self, unit, input, dt, context, t)
	self:_update_unclaimed_achievement_status(dt, t)
	self:_update_unclaimed_quests_status(dt, t)
	self:_evaluate_highlight_status()
end

QuestChallengePropExtension._update_unclaimed_achievement_status = function (self, dt, t)
	if self._next_unclaimed_achievement_check < t then
		self._has_unclaimed_achievements = Managers.state.achievement:has_any_unclaimed_achievement()
		self._next_unclaimed_achievement_check = t + ACHIEVEMENT_UPDATE_INTERVAL
	end
end

QuestChallengePropExtension._update_unclaimed_quests_status = function (self, dt, t)
	if self._next_unclaimed_quest_check < t then
		self._has_unclaimed_quests = Managers.state.quest:has_any_unclaimed_quests()
		self._next_unclaimed_quest_check = t + QUEST_UPDATE_INTERVAL
	end
end

QuestChallengePropExtension._evaluate_highlight_status = function (self)
	local should_be_highlighted = nil

	if self._has_unclaimed_achievements or self._has_unclaimed_quests then
		should_be_highlighted = true
	else
		should_be_highlighted = false
	end

	local state_differs = should_be_highlighted ~= self._highlighted

	if state_differs then
		if should_be_highlighted then
			self:_highlight_on()
		else
			self:_highlight_off()
		end
	end
end

QuestChallengePropExtension._highlight_on = function (self)
	Unit.flow_event(self._unit, "highlight_on")

	self._highlighted = true
end

QuestChallengePropExtension._highlight_off = function (self)
	Unit.flow_event(self._unit, "highlight_off")

	self._highlighted = false
end

return
