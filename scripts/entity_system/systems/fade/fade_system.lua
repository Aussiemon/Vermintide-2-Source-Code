FadeSystem = class(FadeSystem, ExtensionSystemBase)
FadeSystem.system_extensions = {
	"PlayerUnitFadeExtension",
	"AIUnitFadeExtension"
}
local unit_alive = Unit.alive
local script_unit_extension = ScriptUnit.extension
FadeSystem.init = function (self, entity_system_creation_context, system_name)
	local extensions = FadeSystem.system_extensions

	FadeSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	self.fade_unit_list = {}
	self.fade_units_idx_map = {}
	self.num_fade_units = 0
	self.faded_ai_units = {}
	self.unit_extension_data = {}

	return 
end
FadeSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = {}

	if extension_name == "PlayerUnitFadeExtension" then
		local idx = self.num_fade_units + 1
		self.fade_unit_list[idx] = unit
		self.fade_units_idx_map[unit] = idx
		self.num_fade_units = idx
		extension.min_value = 0
	elseif extension_name == "AIUnitFadeExtension" then
	else
		error(string.format("[FadeSystem] Extension not found %s", extension_name))
	end

	extension.unit = unit
	extension.cached_value = 0
	self.unit_extension_data[unit] = extension

	ScriptUnit.set_extension(unit, self.name, extension)

	return extension
end
FadeSystem.set_min_fade = function (self, unit, min_fade)
	self.unit_extension_data[unit].min_value = min_fade

	return 
end
FadeSystem.on_remove_extension = function (self, unit, extension_name)
	if extension_name == "PlayerUnitFadeExtension" then
		local fade_unit_list = self.fade_unit_list
		local fade_units_idx_map = self.fade_units_idx_map
		local num_fade_units = self.num_fade_units
		local idx = fade_units_idx_map[unit]

		table.remove(fade_unit_list, idx)

		fade_units_idx_map[unit] = nil
		num_fade_units = num_fade_units - 1

		for idx = 1, num_fade_units, 1 do
			local fade_unit = fade_unit_list[idx]
			fade_units_idx_map[fade_unit] = idx
		end

		self.num_fade_units = num_fade_units
	end

	Unit.set_scalar_for_materials_in_unit_and_childs(unit, "inv_jitter_alpha", 0)

	self.unit_extension_data[unit] = nil

	ScriptUnit.remove_extension(unit, self.name)

	return 
end
FadeSystem.local_player_created = function (self, player)
	self.player = player

	return 
end
FadeSystem.update = function (self, context, t)
	if Development.parameter("fade_on_camera_ai_collision") == false then
		return 
	end

	if not self.player then
		return 
	end

	local local_player = self.player
	local local_player_id = local_player.local_player_id(local_player)
	local viewport_name = local_player.viewport_name
	local camera_position = nil
	local freeflight_manager = Managers.free_flight

	if freeflight_manager.active(freeflight_manager, local_player_id) then
		camera_position = freeflight_manager.camera_position_rotation(freeflight_manager, local_player_id)
	else
		camera_position = Managers.state.camera:camera_position(viewport_name)
	end

	local camera_position_height = camera_position.z
	local camera_position_flat = Vector3.flat(camera_position)
	local fade_unit_list = self.fade_unit_list
	local num_fade_units = self.num_fade_units
	local unit_extension_data = self.unit_extension_data

	Profiler.start("fade_unit_list")

	for i = 1, num_fade_units, 1 do
		local fade_unit = fade_unit_list[i]
		local extension = unit_extension_data[fade_unit]
		local cached_value = extension.cached_value
		local value = self.calculate_and_set_jitter_alpha(self, camera_position_flat, camera_position_height, fade_unit, nil, extension.min_value)
		extension.cached_value = value
	end

	Profiler.stop("fade_unit_list")
	self.update_ai_units(self, camera_position, camera_position_flat, camera_position_height)

	return 
end
local ai_units = {}
FadeSystem.update_ai_units = function (self, camera_position, camera_position_flat, camera_position_height)
	Profiler.start("update_ai_units")

	local unit_extension_data = self.unit_extension_data
	local faded_ai_units = self.faded_ai_units

	for unit, _ in pairs(faded_ai_units) do
		if not unit_alive(unit) then
			faded_ai_units[unit] = nil
		else
			local health_extension = script_unit_extension(unit, "health_system")

			if not health_extension.is_alive(health_extension) then
				Unit.set_scalar_for_materials_in_unit_and_childs(unit, "inv_jitter_alpha", 0)

				unit_extension_data[unit].cached_value = 0
				faded_ai_units[unit] = nil
			end
		end
	end

	local num_ai_units = AiUtils.broadphase_query(camera_position, 2, ai_units)

	for i = 1, num_ai_units, 1 do
		local unit = ai_units[i]
		local extension = unit_extension_data[unit]

		if extension then
			local cached_value = extension.cached_value
			local value = self.calculate_and_set_jitter_alpha(self, camera_position_flat, camera_position_height, unit, cached_value, 0)
			extension.cached_value = value

			if 0 < value then
				faded_ai_units[unit] = true
			else
				faded_ai_units[unit] = nil
			end
		end
	end

	Profiler.stop("update_ai_units")

	return 
end
local unit_world_position = Unit.world_position
local unit_node = Unit.node
local vector3_flat = Vector3.flat
local vector3_length = Vector3.length
local MAX_FADE_DISTANCE = 0.7
local MIN_FADE_DISTANCE = 0.5
local CHANGE_DISTANCE = MAX_FADE_DISTANCE - MIN_FADE_DISTANCE
local MAX_HEIGHT_DIFFERENCE = 1
FadeSystem.calculate_and_set_jitter_alpha = function (self, camera_position_flat, camera_height, unit, cached_value, min_value)
	local fade_unit_position = unit_world_position(unit, unit_node(unit, "j_spine"))
	local fade_unit_position_height = fade_unit_position.z
	local fade_unit_position_flat = vector3_flat(fade_unit_position)
	local to_vec = fade_unit_position_flat - camera_position_flat
	local value = 0

	if self._verify_length(self, to_vec, unit) then
		local to_vec_length = vector3_length(to_vec)
		local height_difference = math.abs(camera_height - fade_unit_position_height)

		if height_difference < MAX_HEIGHT_DIFFERENCE then
			value = math.clamp((to_vec_length - MIN_FADE_DISTANCE)/CHANGE_DISTANCE, 0, 1) - 1
		else
			value = 0
		end
	end

	value = math.max(min_value, value)

	if value ~= cached_value then
		Unit.set_scalar_for_materials_in_unit_and_childs(unit, "inv_jitter_alpha", value)
	end

	return value
end
SAFE_DISTANCE = SAFE_DISTANCE or MIN_FADE_DISTANCE*2
FadeSystem._verify_length = function (self, vec, unit)
	if SAFE_DISTANCE < math.abs(vec[1]) or SAFE_DISTANCE < math.abs(vec[2]) then
		return false
	else
		return true
	end

	return 
end

return 
