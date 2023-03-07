local platform_functions = {
	init = function (achievement_manager)
		return
	end,
	check_version_number = function ()
		return true
	end,
	version_result = function (token)
		local result = Stats.progress(token)

		if result.done then
			return true, result.error
		end
	end
}

platform_functions.is_unlocked = function (template)
	assert(template.ID_STEAM, "[AchievementManager] There is no Achievement ID specified for achievement: " .. template.id)

	local unlocked, error_msg = Achievement.unlocked(template.ID_STEAM)

	return unlocked, error_msg
end

platform_functions.unlock = function (template)
	assert(template.ID_STEAM, "[AchievementManager] There is no Achievement ID specified for achievement: " .. template.id)

	local token, error_msg = Achievement.unlock(template.ID_STEAM)

	return token, error_msg
end

platform_functions.unlock_result = function (token)
	local result = Achievement.progress(token)

	if result.done then
		return true, result.error
	end
end

platform_functions.reset = function ()
	Achievement.reset()
end

return platform_functions
