stingray.WwiseVisualization = stingray.WwiseVisualization or {}
WwiseVisualization = stingray.WwiseVisualization
local Unit = stingray.Unit
local Vector3 = stingray.Vector3
local LineObject = stingray.LineObject
local Color = stingray.Color
local LevelEditor = stingray.LevelEditor or LevelEditor
local soundscape_units = {}

local function verify_unit_script_data(unit)
	local result = true
	local event_name = Unit.get_data(unit, "Wwise", "event_name")

	if event_name == nil or event_name == "" then
		result = false
	elseif Wwise.has_event(event_name) == false then
		print_error("WwiseVisualizaton. Wwise banks do not contain event: " .. event_name)

		result = false
	end

	return result
end

WwiseVisualization.add_soundscape_unit = function (unit)
	if not stingray.Wwise then
		return 
	end

	if not verify_unit_script_data(unit) then
		return 
	end

	soundscape_units[#soundscape_units + 1] = unit

	return 
end

local function render_soundscape_unit(lines, lines_noz, unit)
	local event_name = Unit.get_data(unit, "Wwise", "event_name")
	local unit_object_name = Unit.get_data(unit, "Wwise", "unit_node") or ""
	local unit_object = 1

	if unit_object_name ~= "" then
		unit_object = Unit.node(unit, unit_object_name)
	end

	local pose = Unit.world_pose(unit, unit_object)
	local position = Matrix4x4.translation(pose)
	local shape = string.lower(Unit.get_data(unit, "Wwise", "shape"))
	local default_scale = 5
	local scale = default_scale

	if shape == "sphere" then
		scale = Unit.get_data(unit, "Wwise", "sphere_radius") or default_scale
	elseif shape == "box" then
		scale = Vector3(0, 0, 0)
		scale.x = Unit.get_data(unit, "Wwise", "box_extents", 0) or default_scale
		scale.y = Unit.get_data(unit, "Wwise", "box_extents", 1) or default_scale
		scale.z = Unit.get_data(unit, "Wwise", "box_extents", 2) or default_scale
	end

	local range = nil

	if Unit.has_data(unit, "Wwise", "trigger_range") then
		range = Unit.get_data(unit, "Wwise", "trigger_range")
	else
		range = Wwise.max_attenuation(event_name)
	end

	local trigger_range_color = Color(0, 240, 170)
	local source_shape_color = Color(0, 160, 225)

	if Wwise.position_type(event_name) == Wwise.WWISE_3D_SOUND then
		if shape == "point" then
			LineObject.add_sphere(lines_noz, trigger_range_color, position, range)
		elseif shape == "sphere" then
			LineObject.add_sphere(lines_noz, source_shape_color, position, scale)
			LineObject.add_sphere(lines_noz, trigger_range_color, position, scale + range)
		elseif shape == "box" then
			Matrix4x4.set_x(pose, Vector3.normalize(Matrix4x4.x(pose)))
			Matrix4x4.set_y(pose, Vector3.normalize(Matrix4x4.y(pose)))
			Matrix4x4.set_z(pose, Vector3.normalize(Matrix4x4.z(pose)))
			LineObject.add_box(lines_noz, source_shape_color, pose, scale)
			LineObject.add_box(lines_noz, trigger_range_color, pose, scale + Vector3(1, 1, 1)*range)
		end
	end

	return 
end

WwiseVisualization.render = function (lines, lines_noz)
	if not stingray.Wwise then
		return 
	end

	local current_selection, last_selected_level_object, last_selected_component_id = nil

	if LevelEditor then
		current_selection = Selection.objects(LevelEditor.selection)
		last_selected_level_object, last_selected_component_id = Selection.last_selected_object(LevelEditor.selection)
	else
		current_selection = LevelEditing.selection:objects()
		last_selected_level_object, last_selected_component_id = Selection.last_selected_object(LevelEditing.selection)
	end

	for _, selection_table in pairs(current_selection) do
		local selection_unit = selection_table._unit
		local i = Array.index_of(soundscape_units, selection_unit)

		if i then
			local soundscape_unit = soundscape_units[i]

			if not Unit.alive(soundscape_unit) then
				table.remove(soundscape_units, i)
			else
				render_soundscape_unit(lines, lines_noz, soundscape_unit)
			end
		end
	end

	return 
end

return WwiseVisualization
