WeaveOnboardingUtils = WeaveOnboardingUtils or {}
local onboarding_step_stat = "scorpion_onboarding_step"
local ui_onboarding_state_stat = "scorpion_ui_onboarding_state"

WeaveOnboardingUtils.tutorial_completed = function (ui_onboarding_state, tutorial)
	return tutorial.ui_onboarding_bit ~= 0 and bit.band(ui_onboarding_state, tutorial.ui_onboarding_bit) == tutorial.ui_onboarding_bit
end

WeaveOnboardingUtils.reached_requirements = function (onboarding_step, tutorial)
	return tutorial.onboarding_step <= onboarding_step
end

WeaveOnboardingUtils.complete_tutorial = function (statistics_db, stats_id, tutorial)
	if statistics_db and stats_id and tutorial then
		local current_state = WeaveOnboardingUtils.get_ui_onboarding_state(statistics_db, stats_id)
		local new_state = bit.bor(current_state, tutorial.ui_onboarding_bit)

		statistics_db:set_stat(stats_id, ui_onboarding_state_stat, new_state)
	end
end

WeaveOnboardingUtils.get_onboarding_step = function (statistics_db, stats_id)
	return statistics_db:get_persistent_stat(stats_id, onboarding_step_stat)
end

WeaveOnboardingUtils.get_ui_onboarding_state = function (statistics_db, stats_id)
	return statistics_db:get_persistent_stat(stats_id, ui_onboarding_state_stat)
end

WeaveOnboardingUtils.complete_onboarding = function ()
	local statistics_db = Managers.player:statistics_db()
	local local_player = Managers.player:local_player()
	local stats_id = local_player:stats_id()

	statistics_db:set_stat(stats_id, onboarding_step_stat, 10)
	statistics_db:set_stat(stats_id, ui_onboarding_state_stat, -1)
end

return
