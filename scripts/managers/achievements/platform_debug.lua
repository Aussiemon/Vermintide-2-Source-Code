local platform_functions = {
	init = function (achievement_manager)
		return
	end,
	check_version_number = function ()
		local token = Application.time_since_launch() + 1 + math.random() * 2

		return false, token
	end,
	version_result = function (token)
		local time = Application.time_since_launch()

		return token < time
	end,
	is_unlocked = function (template)
		return false
	end,
	is_platform_achievement = function (template)
		return false
	end,
	verify_platform_unlocked = function (template)
		local verified = true
		local token = nil

		return verified, token
	end,
	unlock = function (template)
		local token = Application.time_since_launch() + 5 + math.random() * 2

		return token
	end,
	unlock_result = function (token)
		local time = Application.time_since_launch()

		return token < time
	end,
	reset = function ()
		return
	end
}

return platform_functions
