-- chunkname: @scripts/unit_extensions/objectives/testify/versus_capture_point_objective_extension_testify.lua

local VersusCapturePointObjectiveExtensionTestify = {
	versus_capture_point_objective_get_num_players_inside = function (extension)
		return extension:_get_num_players_inside()
	end,
}

return VersusCapturePointObjectiveExtensionTestify
