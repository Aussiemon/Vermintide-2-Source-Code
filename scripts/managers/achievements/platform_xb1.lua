-- chunkname: @scripts/managers/achievements/platform_xb1.lua

local PROGRESS_TASK_IDLE = Achievements2017.PROGRESS_TASK_IDLE
local PROGRESS_TASK_STARTED = Achievements2017.PROGRESS_TASK_STARTED
local PROGRESS_TASK_COMPLETED = Achievements2017.PROGRESS_TASK_COMPLETED
local PROGRESS_TASK_FAILED = Achievements2017.PROGRESS_TASK_FAILED

local function initialize_xbox_achivements()
	rawset(_G, "XB1Achievements", Achievements2017(Managers.account:user_id()))

	if Managers.account:is_online() then
		Achievements2017.refresh(XB1Achievements)
	end
end

local function try_set_progress(template, progress)
	if not rawget(_G, "XB1Achievements") then
		return
	end

	local account_manager = Managers.account

	if account_manager:user_detached() then
		return
	end

	if Achievements2017.is_refreshing(XB1Achievements) or Achievements2017.progress_task_status(XB1Achievements) == PROGRESS_TASK_STARTED then
		return
	end

	local is_online = not account_manager:offline_mode()
	local template_id = template.id
	local achievement_id = template.ID_XB1
	local current_progress

	if is_online then
		current_progress = Achievements2017.progress(XB1Achievements, achievement_id)
	else
		current_progress = account_manager:offline_achievement_progress(template_id)

		if not current_progress then
			print("[AchievementManager] [Offline] No current progress, setting", template_id, progress)
			account_manager:set_offline_achievement_progress(template_id, progress)

			return
		end
	end

	if current_progress == -1 then
		account_manager:set_achievement_unlocked(template_id)

		return false, string.format("[AchievementManager] Error when fetching current progress for achievement %q", template_id)
	end

	if current_progress == 100 then
		account_manager:set_achievement_unlocked(template_id)

		return
	end

	if not current_progress or progress <= current_progress then
		return
	end

	local error_msg

	if is_online then
		error_msg = Achievements2017.set_progress(XB1Achievements, achievement_id, progress)
	else
		print("[AchievementManager] [Offline] Setting progress", template_id, current_progress, "->", progress)

		error_msg = Achievements2017.set_progress_offline(XB1Achievements, achievement_id, progress)

		if not error_msg then
			print("[AchievementManager] [Offline] Updating current progress", template_id, progress)
			account_manager:set_offline_achievement_progress(template_id, progress)
		end
	end

	if error_msg then
		account_manager:set_achievement_unlocked(template_id)

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
	is_platform_achievement = function (template)
		return template.ID_XB1
	end,
	verify_platform_unlocked = function (template)
		if not rawget(_G, "XB1Achievements") then
			return
		end

		local account_manager = Managers.account

		if account_manager:user_detached() then
			return
		end

		if Achievements2017.is_refreshing(XB1Achievements) or Achievements2017.progress_task_status(XB1Achievements) == PROGRESS_TASK_STARTED then
			return
		end

		local account_manager = Managers.account
		local is_online = not account_manager:offline_mode()
		local achievement_id = template.ID_XB1
		local template_id = template.id
		local name = template.name
		local completed_progress = 100

		printf("[Achievements2017] Verifying - Name: %q. Template: %q. ID: %q", Localize(name), template_id, achievement_id)

		local progress

		if is_online then
			progress = Achievements2017.progress(XB1Achievements, achievement_id)
		else
			progress = account_manager:offline_achievement_progress(template_id)
		end

		local verified = true
		local token = false

		if not progress or progress == -1 then
			printf("   - #### Error: Couldn't get progress for achievement %q - Removing it from evaluation", template_id)
			account_manager:set_achievement_unlocked(template_id)

			return verified, token
		end

		if progress < completed_progress then
			printf("[Achievements2017] [%s] - Unlocking Name: %q. Template: %q. ID: %q", is_online and "ONLINE" or "OFFLINE", Localize(name), template_id, achievement_id)

			local error_msg

			if is_online then
				error_msg = Achievements2017.set_progress(XB1Achievements, achievement_id, completed_progress)
			else
				error_msg = Achievements2017.set_progress_offline(XB1Achievements, achievement_id, progress)

				if not error_msg then
					account_manager:set_offline_achievement_progress(template_id, progress)
				end
			end

			if error_msg then
				printf("[Achievements2017] #### Error: %s", error_msg)
				account_manager:set_achievement_unlocked(template_id)
			else
				token = true
			end
		else
			print("[Achievements2017] - Already Unlocked")
		end

		return verified, token
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
			if Managers.account:is_online() then
				Achievements2017.refresh(XB1Achievements)
			end

			return true
		elseif result == PROGRESS_TASK_FAILED then
			print("[AchievementManager] PROGRESS_TASK_FAILED", template_id)
			Managers.account:set_achievement_unlocked(template_id)

			return true, "error"
		end
	end,
	reset = function ()
		errorf("Tried to reset Achievements, not implemented!")
	end,
}

return platform_functions
