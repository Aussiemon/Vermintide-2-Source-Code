local platform_functions = {
	init = function (achievement_manager)
		return
	end,
	check_version_number = function ()
		return true
	end,
	version_result = function (token)
		return true
	end
}

platform_functions.is_unlocked = function (template)
	return not template.ID_PS4
end

platform_functions.is_platform_achievement = function (template)
	return template.ID_PS4
end

platform_functions.verify_platform_unlocked = function (template)
	local verified = true
	local name = template.name
	local template_id = template.id
	local trophy_id = template.ID_PS4

	printf("[Trophies] Verifying - Name: %q. Template: %q. ID: %q", Localize(name), template_id, trophy_id)
	assert(template.ID_PS4, "[AchievementManager] There is no Trophy ID specified for achievement: " .. template.id)

	local token = Trophies.unlock(Managers.account:initial_user_id(), template.ID_PS4)

	return verified, token
end

platform_functions.unlock = function (template)
	assert(template.ID_PS4, "[Trophies] There is no Trophy ID specified for achievement: " .. template.id)

	local token = Trophies.unlock(Managers.account:initial_user_id(), template.ID_PS4)

	return token
end

platform_functions.unlock_result = function (token, template_id)
	local result = Trophies.status(token)

	if result == Trophies.STARTED then
		return false
	end

	Trophies.free(token)

	if result == Trophies.COMPLETED then
		return true
	elseif result == Trophies.ERROR then
		printf("[Trophies] Failed unlocking trophy - %q", template_id or "Unknown")

		return true, "error"
	elseif result == Trophies.UNKNOWN then
		return true, "unknown"
	end
end

platform_functions.reset = function ()
	errorf("Tried to reset Trophies, not implemented!")
end

return platform_functions
