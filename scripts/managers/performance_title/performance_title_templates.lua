PerformanceTitles = {
	titles = {
		headhunter = {
			evaluation_template = "equal_higher",
			display_name = "performance_title_headhunter",
			amount = 1,
			stat_types = {
				{
					"headshots"
				}
			}
		},
		doctor = {
			evaluation_template = "equal_higher",
			display_name = "performance_title_doctor",
			amount = 1,
			stat_types = {
				{
					"times_friend_healed"
				}
			}
		},
		savior = {
			evaluation_template = "equal_higher",
			display_name = "performance_title_savior",
			amount = 1,
			stat_types = {
				{
					"saves"
				}
			}
		},
		reviver = {
			evaluation_template = "equal_higher",
			display_name = "performance_title_reviver",
			amount = 1,
			stat_types = {
				{
					"revives"
				}
			}
		}
	}
}

local function get_stats(statistics_db, stats_id, stat_types)
	local stat = 0

	for i, stats in ipairs(stat_types) do
		stat = stat + statistics_db:get_stat(stats_id, unpack(stats))
	end

	return stat
end

PerformanceTitles.templates = {
	equal_higher = {
		evaluate = function (statistics_db, stats_id, data)
			local stat = get_stats(statistics_db, stats_id, data.stat_types)

			return data.amount <= stat, stat
		end,
		compare = function (amount_1, amount_2)
			return amount_2 <= amount_1
		end
	}
}

for title_name, settings in pairs(PerformanceTitles.titles) do
	fassert(settings.display_name, "No display name in performance title %s", title_name)

	local evaluation_template = settings.evaluation_template
	local template = PerformanceTitles.templates[evaluation_template]

	fassert(template, "Performance Titles %s failed, no evaluation_template called %s", title_name, tostring(evaluation_template))
end

return
