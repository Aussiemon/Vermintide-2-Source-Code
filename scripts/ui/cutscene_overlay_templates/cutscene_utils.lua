-- chunkname: @scripts/ui/cutscene_overlay_templates/cutscene_utils.lua

local M = {}

function _convert_string_timestamp_to_seconds(string_timestamp)
	local minutes, seconds, hundredths = string.match(string_timestamp, "(%d+)%:(%d+)%:(%d+)")
	local time_in_seconds = minutes * 60 + seconds + hundredths * 0.01

	return time_in_seconds
end

M.convert_string_timestamps_to_seconds = function (cutscene_template_settings)
	for template_name, template in pairs(cutscene_template_settings) do
		for index, entry in ipairs(template) do
			local start_timestamp = entry.start_timestamp
			local end_timestamp = entry.end_timestamp
			local start_time_in_seconds = _convert_string_timestamp_to_seconds(start_timestamp)
			local end_time_in_seconds = _convert_string_timestamp_to_seconds(end_timestamp)
			local duration = end_time_in_seconds - start_time_in_seconds

			entry.duration = duration
			entry.start_time = start_time_in_seconds
			entry.end_time = end_time_in_seconds
		end
	end
end

return M
