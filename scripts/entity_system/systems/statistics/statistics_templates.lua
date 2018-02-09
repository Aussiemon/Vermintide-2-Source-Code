StatisticsTemplateCategories = {
	player = {
		"multikill"
	}
}
StatisticsTemplates = {}
StatisticsTemplates.multikill = {
	config = {
		kills_to_get = 1,
		time_window = 10
	},
	init = function ()
		local data = {
			kills_total_last = 0,
			kill_times_n = 0,
			kill_times = {}
		}

		return data
	end,
	update = function (unit, extension, context, t)
		local data = extension.multikill
		local kills_total_last = data.kills_total_last
		local kills_total = context.statistics_db:get_stat(extension.statistics_id, "kills_total")

		if kills_total <= kills_total_last then
			return 
		end

		local time_window = StatisticsTemplates.multikill.config.time_window
		local kills_to_get = StatisticsTemplates.multikill.config.kills_to_get
		local kill_times = data.kill_times
		local kill_times_n = data.kill_times_n
		local i = 1

		while i <= kill_times_n do
			if kill_times[i] + time_window < t then
				kill_times[i] = kill_times[kill_times_n]
				kill_times[kill_times_n] = nil
				kill_times_n = kill_times_n - 1
			else
				i = i + 1
			end
		end

		kill_times_n = kill_times_n + 1
		kill_times[kill_times_n] = t

		if kills_to_get <= kill_times_n then
			local profile_name = ScriptUnit.extension(unit, "dialogue_system").context.player_profile

			SurroundingAwareSystem.add_event(unit, "multikill", DialogueSettings.default_view_distance, "profile_name", profile_name, "number_of_kills", kill_times_n)
		end

		data.kill_times_n = kill_times_n
		data.kills_total_last = kills_total

		return 
	end
}
local templates = {}

for name, template in pairs(StatisticsTemplates) do
	template.name = name
end

for name, cat in pairs(StatisticsTemplateCategories) do
	assert(StatisticsTemplates[name] == nil, "Statistics templates: Can't have category with the same name as a template")
end

return 
