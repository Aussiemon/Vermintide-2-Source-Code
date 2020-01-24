local utils = require("scripts/ui/cutscene_overlay_templates/cutscene_utils")
local start_layer = 700
local template_settings = {
	template_1 = {}
}

utils.convert_string_timestamps_to_seconds(template_settings)

return {
	templates = template_settings
}
