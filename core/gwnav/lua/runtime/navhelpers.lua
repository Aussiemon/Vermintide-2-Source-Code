require("core/gwnav/lua/safe_require")

local NavHelpers = safe_require_guard()
local Color = stingray.Color
local Unit = stingray.Unit
NavHelpers.unit_script_data = function (unit, default, ...)
	if unit and Unit.alive(unit) and Unit.has_data(unit, ...) then
		return Unit.get_data(unit, ...)
	else
		return default
	end

	return 
end
NavHelpers.get_layer_and_smartobject = function (unit, script_object_name)
	local is_exclusive = NavHelpers.unit_script_data(unit, false, script_object_name, "is_exclusive")

	if is_exclusive then
		return is_exclusive, Color(255, 0, 0), -1, -1, -1
	end

	local layer_id = NavHelpers.unit_script_data(unit, -1, script_object_name, "layer_id")
	local smartobject_id = NavHelpers.unit_script_data(unit, -1, script_object_name, "smartobject_id")
	local user_data_id = NavHelpers.unit_script_data(unit, -1, script_object_name, "user_data_id")
	local nav_tag_color = Color(NavHelpers.unit_script_data(unit, 0, script_object_name, "color", "r"), NavHelpers.unit_script_data(unit, 255, script_object_name, "color", "g"), NavHelpers.unit_script_data(unit, 0, script_object_name, "color", "b"))

	return is_exclusive, nav_tag_color, layer_id, smartobject_id, user_data_id
end

return NavHelpers
