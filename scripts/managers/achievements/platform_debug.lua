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
