Framerate = {
	set_low_power = function ()
		if IS_WINDOWS and not DEDICATED_SERVER then
			Application.set_time_step_policy("no_smoothing", "clear_history", "throttle", 60)
		end
	end,
	set_playing = function ()
		Application.set_time_step_policy("external_step_range", 0, 100, "system_step_range", 0, 100, "debt_payback", 0)

		if DEDICATED_SERVER then
			Application.set_time_step_policy("no_smoothing", "throttle", 30)
		elseif IS_WINDOWS then
			Application.set_time_step_policy("smoothing", 11, 2, 0.1)

			local max_fps = Application.user_setting("max_fps")

			if max_fps == nil or max_fps == 0 then
				Application.set_time_step_policy("no_throttle")
			else
				Application.set_time_step_policy("throttle", max_fps)
			end
		else
			Application.set_time_step_policy("no_smoothing")
		end
	end,
	set_catchup = function ()
		if IS_WINDOWS then
			Application.set_time_step_policy("smoothing", 11, 2, 0.5)
		end
	end,
	set_replay = function ()
		Application.set_time_step_policy("throttle", 60, "no_smoothing", "debt_payback", 0)
	end
}

return
