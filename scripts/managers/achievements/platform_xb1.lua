local platform_functions = {
	init = function (achievement_manager)
		if not rawget(_G, "XB1Achievements") then
			if Managers.account:user_detached() then
				achievement_manager._xbox_achievements_initialized = false
			else
				local setup_data = require("scripts/settings/events_xb1")

				Events.setup(setup_data)
				rawset(_G, "XB1Achievements", Achievements(Managers.account:user_id()))
				Achievements.refresh(XB1Achievements)

				achievement_manager._xbox_achievements_initialized = true
			end
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
	unlock = function (template)
		if not rawget(_G, "XB1Achievements") or Achievements.is_refreshing(XB1Achievements) then
			return
		end

		assert(template.ID_XB1, "[AchievementManager] There is no Achievement ID specified for achievement: " .. template.id)
		print("[AchievementManager] Unlocking Achievement: ", template.ID_XB1)
		Managers.xbox_events:write(template.ID_XB1, {
			Managers.account:xbox_user_id(),
			Managers.account:player_session_id(),
			1
		}, nil, nil, nil, true)

		local token = Application.time_since_launch() + 5

		Managers.account:set_achievement_unlocked(template.id)

		return token
	end,
	unlock_result = function (token)
		local time = Application.time_since_launch()

		return token < time and not Achievements.is_refreshing(XB1Achievements)
	end,
	reset = function ()
		errorf("Tried to reset Achievements, not implemented!")
	end
}

return platform_functions
