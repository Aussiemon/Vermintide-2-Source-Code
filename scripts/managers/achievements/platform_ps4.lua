local platform_functions = {
	init = function (achievement_manager)
		return
	end,
	check_version_number = function ()
		return true
	end,
	version_result = function (token)
		return true
	end,
	is_unlocked = function (template)
		return not template.ID_PS4
	end,
	unlock = function (template)
		assert(template.ID_PS4, "[AchievementManager] There is no Trophy ID specified for achievement: " .. template.id)

		local token = Trophies.unlock(Managers.account:initial_user_id(), template.ID_PS4)

		return token
	end,
	unlock_result = function (token)
		local result = Trophies.status(token)

		if result == Trophies.STARTED then
			return false
		end

		Trophies.free(token)

		if result == Trophies.COMPLETED then
			return true
		elseif result == Trophies.ERROR then
			return true, "error"
		elseif result == Trophies.UNKNOWN then
			return true, "unknown"
		end
	end,
	reset = function ()
		errorf("Tried to reset Trophies, not implemented!")
	end
}

return platform_functions
