ScriptUnit = ScriptUnit or {}
local Entities = rawget(_G, "G_Entities")

if not Entities then
	Entities = {}

	rawset(_G, "G_Entities", Entities)
end

local function reset_entities()
	Entities = {}

	rawset(_G, "G_Entities", Entities)
end

local function remove_unit(unit)
	Entities[unit] = nil
end

local function local_remove_extension(unit, system_name)
	local unit_extensions = Entities[unit]

	fassert(unit_extensions)
	fassert(unit_extensions[system_name], "Tried to remove system %s extension for unit %s", system_name, unit)

	unit_extensions[system_name] = nil
end

local function set_extension_script(unit, system_name, extension)
	local unit_extensions = Entities[unit]

	if not unit_extensions then
		unit_extensions = {}
		Entities[unit] = unit_extensions
	end

	unit_extensions[system_name] = extension
end

local function local_extension(unit, system_name)
	local unit_extensions = Entities[unit]

	return unit_extensions and unit_extensions[system_name]
end

local function local_extension_input(unit, system_name)
	local unit_extensions = Entities[unit]

	return unit_extensions and unit_extensions[system_name] and unit_extensions[system_name].input
end

ScriptUnit.extension_input = function (unit, system_name)
	local extension = local_extension(unit, system_name)

	return extension.input
end

ScriptUnit.extension = function (unit, system_name)
	local unit_extensions = Entities[unit]
	local extension = unit_extensions and unit_extensions[system_name]

	return extension
end

ScriptUnit.extensions = function (unit)
	return Entities[unit]
end

ScriptUnit.has_extension = local_extension

ScriptUnit.has_extension_input = function (unit, extension_name)
	local unit_extensions = Entities[unit]

	return unit_extensions and unit_extensions[extension_name] and unit_extensions[extension_name].input
end

ScriptUnit.check_all_units_deleted = function ()
	if next(Entities) then
		print("------------ UNITS THAT HAVENT BEEN DELETED --------------")

		for unit, extensions in pairs(Entities) do
			local info = unit_alive_info(unit)

			print(unit, Unit.alive(unit), info)
		end

		fassert(false, "Some units have not been cleaned up properly!")
	end
end

ScriptUnit.set_extension = function (unit, system_name, extension)
	set_extension_script(unit, system_name, extension)
end

ScriptUnit.add_extension = function (extension_init_context, unit, extension_name, extension_alias, extension_init_data, extension_pool_table)
	local extension_class = rawget(_G, extension_name)

	fassert(extension_class, "No class found for extension with name %q", extension_name)

	local extension = nil
	extension = extension_class:new(extension_init_context, unit, extension_init_data)

	fassert(not ScriptUnit.has_extension(unit, extension_alias), "An extension already exists with name %q belonging to unit %s", extension_alias, unit)
	set_extension_script(unit, extension_alias, extension)

	return extension
end

ScriptUnit.destroy_extension = function (unit, system_name)
	local extension = ScriptUnit.extension(unit, system_name)

	if extension.destroy then
		extension:destroy()
	end
end

ScriptUnit.optimize = function (unit)
	if Unit.alive(unit) then
		local disable_shadows = Unit.get_data(unit, "disable_shadows")

		if disable_shadows then
			local num_meshes = Unit.num_meshes(unit)

			for i = 0, num_meshes - 1, 1 do
				Unit.set_mesh_visibility(unit, i, false, "shadow_caster")
			end
		end

		local force_ssm = Unit.get_data(unit, "force_ssm")

		if force_ssm then
			local num_meshes = Unit.num_meshes(unit)

			for i = 0, num_meshes - 1, 1 do
				Unit.set_mesh_ssm_visibility(unit, i, true)
			end
		end

		local disable_physics = Unit.get_data(unit, "disable_physics")

		if disable_physics then
			local num_actors = Unit.num_actors(unit)

			for i = 0, num_actors - 1, 1 do
				Unit.destroy_actor(unit, i)
			end
		end
	end
end

ScriptUnit.remove_extension = function (unit, system_name)
	local_remove_extension(unit, system_name)
end

ScriptUnit.remove_unit = remove_unit

ScriptUnit.extension_definitions = function (unit)
	local extensions = {}
	local i = 0

	while Unit.has_data(unit, "extensions", i) do
		local class_name = Unit.get_data(unit, "extensions", i)
		i = i + 1
		extensions[i] = class_name
	end

	return extensions
end

ScriptUnit.move_extensions = function (unit, new_unit)
	Entities[new_unit] = Entities[unit]
	Entities[unit] = nil
end

ScriptUnit.save_scene_graph = function (unit)
	local link_table = {}

	for node_index = 0, Unit.num_scene_graph_items(unit) - 1, 1 do
		local parent_node = Unit.scene_graph_parent(unit, node_index)
		local local_pose = Matrix4x4Box(Unit.local_pose(unit, node_index))
		link_table[node_index] = {
			parent = parent_node,
			local_pose = local_pose
		}
	end

	return link_table
end

ScriptUnit.restore_scene_graph = function (unit, link_table)
	for i, link in ipairs(link_table) do
		if link.parent then
			Unit.scene_graph_link(unit, i, link.parent)
			Unit.set_local_pose(unit, i, link.local_pose:unbox())
		end
	end
end

return
