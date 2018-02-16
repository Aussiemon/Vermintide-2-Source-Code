require("scripts/settings/outline_settings")

OutlineSystem = class(OutlineSystem, ExtensionSystemBase)
OutlineSystem.system_extensions = {
	"AIOutlineExtension",
	"PickupOutlineExtension",
	"PlayerHuskOutlineExtension",
	"PlayerOutlineExtension",
	"DoorOutlineExtension",
	"ObjectiveOutlineExtension",
	"ObjectiveLightOutlineExtension",
	"ElevatorOutlineExtension",
	"ConditionalInteractOutlineExtension",
	"ConditionalPickupOutlineExtension",
	"EnemyOutlineExtension",
	"GenericOutlineExtension"
}
OutlineSystem.init = function (self, context, system_name)
	local extensions = OutlineSystem.system_extensions

	OutlineSystem.super.init(self, context, system_name, extensions)

	self.world = context.world
	self.physics_world = World.get_data(self.world, "physics_world")
	self.unit_extension_data = {}
	self.units = {}
	self.current_index = 0
	self.darkness_system = Managers.state.entity:system("darkness_system")
	self.cutscene_system = Managers.state.entity:system("cutscene_system")

	return 
end
OutlineSystem.on_add_extension = function (self, world, unit, extension_name)
	local extension = {}

	if extension_name == "PlayerOutlineExtension" then
		extension.outline_color = OutlineSettings.colors.ally
		extension.method = "never"
		extension.flag = "outline_unit"
		extension.apply_method = "unit_and_childs"
	elseif extension_name == "PlayerHuskOutlineExtension" then
		extension.outline_color = OutlineSettings.colors.ally
		extension.distance = OutlineSettings.ranges.player_husk
		extension.method = "outside_distance_or_not_visible"
		extension.last_set_method = extension.method
		extension.flag = "outline_unit"
		extension.apply_method = "unit_and_childs"
		extension.set_method_player_setting = function (method)
			if extension.override_method then
				extension.last_set_method = method
			else
				extension.method = method
				extension.last_set_method = method
			end

			return 
		end
		extension.update_override_method_player_setting = function ()
			local override_method = nil
			local player_outlines = Application.user_setting("player_outlines")

			if player_outlines == "off" then
				override_method = "never"
			elseif player_outlines == "always_on" then
				override_method = "always"
			end

			extension.override_method = override_method

			if override_method == nil then
				extension.method = extension.last_set_method
			else
				extension.method = override_method
			end

			return 
		end

		extension.update_override_method_player_setting()
	elseif extension_name == "PickupOutlineExtension" then
		extension.outline_color = OutlineSettings.colors.interactable
		extension.distance = OutlineSettings.ranges.pickup
		extension.method = "within_distance_and_not_in_dark"
		extension.pinged_method = "not_in_dark"
		extension.flag = "outline_unit_z"
		extension.apply_method = "unit"
	elseif extension_name == "AIOutlineExtension" then
		extension.outline_color = OutlineSettings.colors.interactable
		extension.distance = OutlineSettings.ranges.player_husk
		extension.method = "never"
		extension.pinged_method = "not_in_dark"
		extension.flag = "outline_unit"
		extension.apply_method = "unit"
	elseif extension_name == "DoorOutlineExtension" then
		extension.outline_color = OutlineSettings.colors.interactable
		extension.distance = OutlineSettings.ranges.doors
		extension.method = "within_distance_and_not_in_dark"
		extension.pinged_method = "not_in_dark"
		extension.flag = "outline_unit_z"
		extension.apply_method = "unit"
	elseif extension_name == "ObjectiveOutlineExtension" then
		extension.outline_color = OutlineSettings.colors.interactable
		extension.distance = OutlineSettings.ranges.objective
		extension.method = "within_distance"
		extension.pinged_method = "always"
		extension.flag = "outline_unit"
		extension.apply_method = "unit"
	elseif extension_name == "ObjectiveLightOutlineExtension" then
		extension.outline_color = OutlineSettings.colors.interactable
		extension.distance = OutlineSettings.ranges.objective_light
		extension.method = "within_distance"
		extension.pinged_method = "always"
		extension.flag = "outline_unit_z"
		extension.apply_method = "unit"
	elseif extension_name == "ElevatorOutlineExtension" then
		extension.outline_color = OutlineSettings.colors.interactable
		extension.distance = OutlineSettings.ranges.elevators
		extension.method = "within_distance"
		extension.pinged_method = "not_in_dark"
		extension.flag = "outline_unit_z"
		extension.apply_method = "unit"
	elseif extension_name == "ConditionalInteractOutlineExtension" then
		extension.outline_color = OutlineSettings.colors.interactable
		extension.distance = OutlineSettings.ranges.doors
		extension.method = "conditional_within_distance"
		extension.flag = "outline_unit_z"
		extension.apply_method = "unit"
	elseif extension_name == "ConditionalPickupOutlineExtension" then
		extension.outline_color = OutlineSettings.colors.interactable
		extension.distance = OutlineSettings.ranges.pickup
		extension.method = "conditional_within_distance"
		extension.flag = "outline_unit_z"
		extension.apply_method = "unit"
	elseif extension_name == "EnemyOutlineExtension" then
		extension.outline_color = OutlineSettings.colors.knocked_down
		extension.method = "never"
		extension.pinged_method = "not_in_dark"
		extension.flag = "outline_unit"
		extension.apply_method = "unit_and_childs"
	elseif extension_name == "GenericOutlineExtension" then
		extension.outline_color = OutlineSettings.colors.interactable
		extension.distance = OutlineSettings.ranges.interactable
		extension.method = "within_distance"
		extension.pinged_method = "not_in_dark"
		extension.flag = "outline_unit_z"
		extension.apply_method = "unit"
	end

	extension.set_outline_color = function (color)
		extension.outline_color = OutlineSettings.colors[color]
		extension.new_color = true

		return 
	end
	extension.reapply_outline = function ()
		extension.reapply = true

		return 
	end
	extension.set_method = function (method)
		extension.method = method

		return 
	end
	extension.set_distance = function (distance_type)
		extension.distance = OutlineSettings.ranges[distance_type]

		return 
	end
	extension.set_pinged = function (pinged)
		if pinged then
			if not extension.pinged then
				extension.previous_flag = extension.flag
			end

			local c = extension.outline_color.channel
			local channel = Color(c[1], c[2], c[3], c[4])

			self:outline_unit(unit, extension.previous_flag, channel, false, extension.apply_method, false)

			extension.flag = "outline_unit"
			local c = OutlineSettings.colors.player_attention.channel
			local channel = Color(c[1], c[2], c[3], c[4])

			self:outline_unit(unit, extension.flag, channel, true, extension.apply_method, false)

			extension.outlined = true
		else
			local c = OutlineSettings.colors.player_attention.channel
			local channel = Color(c[1], c[2], c[3], c[4])

			self:outline_unit(unit, extension.flag, channel, false, extension.apply_method, false)

			extension.flag = extension.previous_flag
			extension.reapply = true
		end

		extension.pinged = pinged

		return 
	end
	extension.outlined = false
	extension.new_color = false

	ScriptUnit.set_extension(unit, "outline_system", extension, {})

	self.unit_extension_data[unit] = extension
	self.units[#self.units + 1] = unit

	return extension
end
OutlineSystem.on_remove_extension = function (self, unit, extension_name)
	self.unit_extension_data[unit] = nil

	table.remove(self.units, table.find(self.units, unit))
	ScriptUnit.remove_extension(unit, self.NAME)

	return 
end
OutlineSystem.local_player_created = function (self, player)
	self.camera_unit = player.camera_follow_unit

	return 
end
OutlineSystem._is_cutscene_active = function (self)
	local cutscene_system = self.cutscene_system

	if not cutscene_system then
		return false
	end

	return cutscene_system.active_camera and not cutscene_system.ingame_hud_enabled
end
OutlineSystem.update = function (self, context, t)
	if #self.units == 0 then
		return 
	end

	if script_data.disable_outlines then
		return 
	end

	if not self.camera_unit then
		return 
	end

	local checks_per_frame = 4
	local current_index = self.current_index
	local units = self.units

	for i = 1, checks_per_frame, 1 do
		current_index = current_index + 1

		if not units[current_index] then
			current_index = 1
		end

		local unit = self.units[current_index]
		local extension = self.unit_extension_data[unit]

		if not extension then
		else
			local is_pinged = extension.pinged
			local method = (is_pinged and extension.pinged_method) or extension.method

			if self[method](self, unit, extension) then
				if not extension.outlined or extension.new_color or extension.reapply then
					local c = (is_pinged and OutlineSettings.colors.player_attention.channel) or extension.outline_color.channel
					local channel = Color(c[1], c[2], c[3], c[4])

					self.outline_unit(self, unit, extension.flag, channel, true, extension.apply_method, extension.reapply)

					extension.outlined = true
				end
			elseif extension.outlined or extension.new_color or extension.reapply then
				local c = extension.outline_color.channel
				local channel = Color(c[1], c[2], c[3], c[4])

				self.outline_unit(self, unit, extension.flag, channel, false, extension.apply_method, extension.reapply)

				extension.outlined = false
			end

			extension.new_color = false
			extension.reapply = false
		end
	end

	self.current_index = current_index

	return 
end
OutlineSystem.outline_unit = function (self, unit, flag, channel, do_outline, apply_method, is_reapply)
	if Unit.has_data(unit, "outlined_meshes") then
		local i = 0

		while Unit.has_data(unit, "outlined_meshes", i) do
			local mesh_name = Unit.get_data(unit, "outlined_meshes", i)
			local mesh = Unit.mesh(unit, mesh_name)

			Mesh.set_shader_pass_flag(mesh, flag, do_outline)

			if do_outline then
				local num_materials = Mesh.num_materials(mesh)

				for j = 0, num_materials - 1, 1 do
					local material = Mesh.material(mesh, j)

					Material.set_color(material, "outline_color", channel)

					if not is_reapply then
						Material.set_scalar(material, "outline_time", Managers.time:time("game"))
					end
				end
			end

			i = i + 1
		end
	elseif apply_method == "unit_and_childs" then
		Unit.set_shader_pass_flag_for_meshes_in_unit_and_childs(unit, flag, do_outline)
		Unit.set_color_for_materials_in_unit_and_childs(unit, "outline_color", channel)

		if not is_reapply then
			Unit.set_scalar_for_materials_in_unit_and_childs(unit, "outline_time", Managers.time:time("game"))
		end
	elseif apply_method == "unit" then
		Unit.set_shader_pass_flag_for_meshes(unit, flag, do_outline)
		Unit.set_color_for_materials(unit, "outline_color", channel)

		if not is_reapply then
			Unit.set_scalar_for_materials(unit, "outline_time", Managers.time:time("game"))
		end
	else
		error(sprintf("Non-existant apply method %s", apply_method))
	end

	return 
end
OutlineSystem.raycast_result = function (self, unit_center)
	local physics_world = self.physics_world
	local camera_position = Unit.local_position(self.camera_unit, 0)
	local distance = Vector3.distance(camera_position, unit_center)
	local direction = Vector3.normalize(unit_center - camera_position)
	local result, num_hits = PhysicsWorld.immediate_raycast(physics_world, camera_position, direction, distance, "all", "collision_filter", "filter_ai_line_of_sight_check", "use_global_table")

	return result, num_hits
end
OutlineSystem.distance_to_unit = function (self, unit)
	local camera_position = Unit.local_position(self.camera_unit, 0)
	local pose, radius = Unit.box(unit)
	local unit_center = Matrix4x4.translation(pose)
	local distance = Vector3.distance(camera_position, unit_center)

	return distance
end
OutlineSystem.never = function (self, unit, extension)
	return false
end
OutlineSystem.ai_alive = function (self, unit, extension)
	local active_cutscene = self._is_cutscene_active(self)
	local alive = AiUtils.unit_alive(unit)

	return alive and not active_cutscene
end
OutlineSystem.always = function (self, unit, extension)
	local active_cutscene = self._is_cutscene_active(self)

	return not active_cutscene
end
OutlineSystem.visible = function (self, unit, extension)
	local pose, radius = Unit.box(unit)
	local unit_center = Matrix4x4.translation(pose)
	local in_darkness = self.darkness_system:is_in_darkness(unit_center)
	local active_cutscene = self._is_cutscene_active(self)

	return not in_darkness and not self.raycast_result(self, unit_center) and not active_cutscene
end
OutlineSystem.not_in_dark = function (self, unit, extension)
	local pose, radius = Unit.box(unit)
	local unit_center = Matrix4x4.translation(pose)
	local in_darkness = self.darkness_system:is_in_darkness(unit_center)
	local active_cutscene = self._is_cutscene_active(self)

	return not in_darkness and not active_cutscene
end
OutlineSystem.not_visible = function (self, unit, extension)
	local active_cutscene = self._is_cutscene_active(self)

	return not self.visible(self, unit, extension) and not active_cutscene
end
OutlineSystem.within_distance_and_not_in_dark = function (self, unit, extension)
	if not self.within_distance(self, unit, extension) then
		return false
	end

	local pose, radius = Unit.box(unit)
	local unit_center = Matrix4x4.translation(pose)
	local in_darkness = self.darkness_system:is_in_darkness(unit_center)
	local active_cutscene = self._is_cutscene_active(self)

	return not in_darkness and not active_cutscene
end
OutlineSystem.within_distance = function (self, unit, extension)
	local active_cutscene = self._is_cutscene_active(self)

	return self.distance_to_unit(self, unit) <= extension.distance and not active_cutscene
end
OutlineSystem.outside_distance = function (self, unit, extension)
	local active_cutscene = self._is_cutscene_active(self)

	return extension.distance < self.distance_to_unit(self, unit) and not active_cutscene
end
OutlineSystem.outside_distance_or_not_visible = function (self, unit, extension)
	local active_cutscene = self._is_cutscene_active(self)

	if self.outside_distance(self, unit, extension) then
		return not active_cutscene
	end

	if self.not_visible(self, unit, extension) then
		return not active_cutscene
	end

	return false
end
OutlineSystem.within_distance_and_visible = function (self, unit, extension)
	if self.within_distance(self, unit, extension) and self.visible(self, unit, extension) then
		local active_cutscene = self._is_cutscene_active(self)

		return not active_cutscene
	end

	return false
end
OutlineSystem.conditional_within_distance = function (self, unit, extension)
	if self.within_distance(self, unit, extension) then
		local interaction_type = Unit.get_data(unit, "interaction_data", "interaction_type")
		local interaction_data = InteractionDefinitions[interaction_type]
		local local_player = Managers.player:local_player()
		local player_unit = local_player.player_unit
		local can_interact = false

		if player_unit then
			can_interact = interaction_data.client.can_interact(player_unit, unit)
		end

		local active_cutscene = self._is_cutscene_active(self)

		return can_interact and not active_cutscene
	end

	return false
end

return 
