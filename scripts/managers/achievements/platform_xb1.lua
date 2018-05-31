local PROGRESS_TASK_IDLE = Achievements2017.PROGRESS_TASK_IDLE
local PROGRESS_TASK_STARTED = Achievements2017.PROGRESS_TASK_STARTED
local PROGRESS_TASK_COMPLETED = Achievements2017.PROGRESS_TASK_COMPLETED
local PROGRESS_TASK_FAILED = Achievements2017.PROGRESS_TASK_FAILED

local function initialize_xbox_achivements()
	rawset(_G, "XB1Achievements", Achievements2017(Managers.account:user_id()))
	Achievements2017.refresh(XB1Achievements)
end

local function try_set_progress(template, progress)
	if not rawget(_G, "XB1Achievements") then
		return
	end

	if Achievements2017.is_refreshing(XB1Achievements) or Achievements2017.progress_task_status(XB1Achievements) == PROGRESS_TASK_STARTED then
		return
	end

	local template_id = template.id
	local achievement_id = template.ID_XB1
	local current_progress = Achievements2017.progress(XB1Achievements, achievement_id)

	if current_progress == -1 then
		Managers.account:set_achievement_unlocked(template_id)

		return false, string.format("[AchievementManager] Error when fetching current progress for achievement %q", template_id)
	end

	if current_progress == 100 then
		Managers.account:set_achievement_unlocked(template_id)

		return
	end

	if progress <= current_progress then
		return
	end

	local error_msg = Achievements2017.set_progress(XB1Achievements, achievement_id, progress)

	if error_msg then
		Managers.account:set_achievement_unlocked(template_id)

		return false, error_msg
	end

	local completed = progress == 100

	return true, nil, completed
end

local platform_functions = {
	init = function (self)
		self.init_state = "not_initialized"

		if not Managers.account:user_detached() then
			initialize_xbox_achivements()

			self.init_state = "started"
		end

		self._unlocked_achievements = Managers.account:get_unlocked_achievement_list()
	end,
	update = function (self)
		if self.init_state == "not_initialized" then
			if not Managers.account:user_detached() then
				initialize_xbox_achivements()

				self.init_state = "started"
			end

			return true
		end

		if self.init_state == "started" then
			if not Achievements2017.is_refreshing(XB1Achievements) then
				self.init_state = "complete"
			end

			return true
		end
	end,
	check_version_number = function ()
		return true
	end,
	version_result = function (token)
		return true
	end,
	is_unlocked = function (template)
		return not template.ID_XB1
	end,
	set_progress = function (template, progress, progress_max)
		if progress > 0 then
			local progress_raw = progress / progress_max * 100
			local progress_percent = math.floor(progress_raw + 0.5)

			return try_set_progress(template, progress_percent)
		end
	end,
	unlock = function (template)
		return try_set_progress(template, 100)
	end,
	unlock_result = function (token, template_id)
		local result = Achievements2017.progress_task_status(XB1Achievements)

		if result == PROGRESS_TASK_STARTED then
			return false
		elseif result == PROGRESS_TASK_COMPLETED then
			Achievements2017.refresh(XB1Achievements)

			return true
		elseif result == PROGRESS_TASK_FAILED then
			Managers.account:set_achievement_unlocked(template_id)

			return true, "error"
		end
	end,
	reset = function ()
		errorf("Tried to reset Achievements, not implemented!")
	end
}

return platform_functions
