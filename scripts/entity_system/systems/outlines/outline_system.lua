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
	self.frozen_unit_extension_data = {}
	self.units = {}
	self.current_index = 0
	self.darkness_system = Managers.state.entity:system("darkness_system")
	self.cutscene_system = Managers.state.entity:system("cutscene_system")
	self._pulsing_units = {}
	self._pulse_id = 0
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
	end

	extension.reapply_outline = function ()
		extension.reapply = true
	end

	extension.set_method = function (method)
		extension.method = method
	end

	extension.set_distance = function (distance_type)
		extension.distance = OutlineSettings.ranges[distance_type]
	end

	extension.set_pinged = function (pinged, flash)
		local outline_system = Managers.state.entity:system("outline_system")

		if outline_system._disabled then
			return
		end

		if extension.priority_outline then
			if pinged then
				if not extension.pinged then
					extension.previous_flag = extension.flag
				end

				extension.flag = "outline_unit"
			else
				extension.flag = extension.previous_flag
			end

			extension.pinged = pinged

			if not extension.flag then
				extension.flag = "outline_unit"
			end

			return
		end

		if not extension.flag then
			extension.flag = "outline_unit"
		end

		if extension.ping_pulse_id then
			outline_system:set_pulsing(unit, false, extension.ping_pulse_id)

			extension.ping_pulse_id = nil
		end

		if pinged then
			if not extension.pinged then
				extension.previous_flag = extension.flag
			end

			if flash then
				extension.ping_pulse_id = outline_system:set_pulsing(unit, true, "flash")
			end

			local c, channel = nil
			c = extension.outline_color.channel
			channel = Color(c[1], c[2], c[3], c[4])

			outline_system:outline_unit(unit, extension.previous_flag, channel, false, extension.apply_method, false)

			extension.flag = "outline_unit"
			c = OutlineSettings.colors.player_attention.channel
			channel = Color(c[1], c[2], c[3], c[4])

			outline_system:outline_unit(unit, extension.flag, channel, true, extension.apply_method, false)

			extension.outlined = true
		else
			local c = OutlineSettings.colors.player_attention.channel
			local channel = Color(c[1], c[2], c[3], c[4])

			outline_system:outline_unit(unit, extension.flag, channel, false, extension.apply_method, false)

			extension.flag = extension.previous_flag or "outline_unit"
			extension.reapply = true
		end

		extension.pinged = pinged
	end

	extension.outlined = false
	extension.new_color = false

	ScriptUnit.set_extension(unit, "outline_system", extension, {})

	self.unit_extension_data[unit] = extension
	self.units[#self.units + 1] = unit

	return extension
end

OutlineSystem.on_remove_extension = function (self, unit, extension_name)
	self.frozen_unit_extension_data[unit] = nil

	self:_cleanup_extension(unit, extension_name)
	ScriptUnit.remove_extension(unit, self.NAME)
end

OutlineSystem.on_freeze_extension = function (self, unit, extension_name)
	local extension = self.unit_extension_data[unit]

	fassert(extension, "Unit was already frozen.")

	self.frozen_unit_extension_data[unit] = extension

	self:_cleanup_extension(unit, extension_name)
end

OutlineSystem._cleanup_extension = function (self, unit, extension_name)
	local extension = self.unit_extension_data[unit]

	if extension == nil then
		return
	end

	self.unit_extension_data[unit] = nil

	table.remove(self.units, table.find(self.units, unit))
end

OutlineSystem.freeze = function (self, unit, extension_name, reason)
	local frozen_extensions = self.frozen_unit_extension_data

	if frozen_extensions[unit] then
		return
	end

	local extension = self.unit_extension_data[unit]

	fassert(extension, "Unit to freeze didn't have unfrozen extension")
	self:_cleanup_extension(unit, extension_name)

	self.unit_extension_data[unit] = nil
	frozen_extensions[unit] = extension

	fassert(extension_name == "EnemyOutlineExtension", "Only support for freezing enemy outline extensions")

	if extension.outlined then
		local c = extension.outline_color.channel
		local channel = Color(c[1], c[2], c[3], c[4])

		self:outline_unit(unit, extension.flag, channel, false, extension.apply_method, extension.reapply)

		extension.outlined = false
	end

	extension.method = "never"
	extension.pinged = false
end

OutlineSystem.unfreeze = function (self, unit)
	local extension = self.frozen_unit_extension_data[unit]

	fassert(extension, "Unit to unfreeze didn't have frozen extension")

	self.frozen_unit_extension_data[unit] = nil
	self.unit_extension_data[unit] = extension
	self.units[#self.units + 1] = unit
end

OutlineSystem.local_player_created = function (self, player)
	self.camera_unit = player.camera_follow_unit
end

OutlineSystem._is_cutscene_active = function (self)
	local cutscene_system = self.cutscene_system

	if not cutscene_system then
		return false
	end

	return cutscene_system.active_camera and not cutscene_system.ingame_hud_enabled
end

OutlineSystem.set_disabled = function (self, disabled)
	if disabled and not self._disabled then
		local units = self.units
		local unit_extension_data = self.unit_extension_data

		for i = 1, #units, 1 do
			local unit = units[i]
			local extension = unit_extension_data[unit]

			if extension and extension.outlined then
				local c = extension.outline_color.channel
				local channel = Color(c[1], c[2], c[3], c[4])

				self:outline_unit(unit, extension.flag, channel, false, extension.apply_method, extension.reapply)

				extension.outlined = false
			end
		end
	end

	self._disabled = disabled
end

OutlineSystem.update = function (self, context, t)
	local dt = context.dt

	if #self.units == 0 then
		return
	end

	if self._disabled or script_data.disable_outlines then
		return
	end

	if not self.camera_unit then
		return
	end

	local checks_per_frame = 4
	local current_index = self.current_index
	local units = self.units

	for i = 1, checks_per_frame, 1 do
		repeat
			current_index = current_index + 1

			if not units[current_index] then
				current_index = 1
			end

			local unit = self.units[current_index]
			local extension = self.unit_extension_data[unit]

			if not extension then
				break
			end

			local is_pinged = extension.pinged
			local method = (is_pinged and extension.pinged_method) or extension.method

			if self[method](self, unit, extension) then
				if not extension.outlined or extension.new_color or extension.reapply then
					local c = (is_pinged and OutlineSettings.colors.player_attention.channel) or extension.outline_color.channel
					local channel = Color(c[1], c[2], c[3], c[4])

					self:outline_unit(unit, extension.flag, channel, true, extension.apply_method, extension.reapply)

					extension.outlined = true
				end
			elseif extension.outlined or extension.new_color or extension.reapply then
				local c = extension.outline_color.channel
				local channel = Color(c[1], c[2], c[3], c[4])

				self:outline_unit(unit, extension.flag, channel, false, extension.apply_method, extension.reapply)

				extension.outlined = false
			end

			extension.new_color = false
			extension.reapply = false
		until true
	end

	self.current_index = current_index

	self:_update_pulsing(dt, t)
end

local PULSE_METHODS = {
	flash = function (t)
		return math.round((t * 3) % 1)
	end,
	pulse = function (t)
		return math.round((t * 3) % 1.5)
	end
}

OutlineSystem.set_pulsing = function (self, unit, enable, method_or_id)
	if enable then
		local method = method_or_id
		local id = self._pulse_id + 1
		self._pulsing_units[unit] = {
			f = PULSE_METHODS[method],
			id = id
		}
		self._pulse_id = id

		return id
	else
		local id = method_or_id
		local pulsing = self._pulsing_units[unit]

		if pulsing and pulsing.id == id then
			self._pulsing_units[unit] = nil
			local channel = Color(0, 0, 0, 0)
			local extension = self.unit_extension_data[unit]

			self:outline_unit(unit, extension.flag, channel, false, extension.apply_method, extension.reapply)

			extension.outlined = false
		end
	end
end

OutlineSystem._update_pulsing = function (self, dt, t)
	for unit, data in pairs(self._pulsing_units) do
		local extension = self.unit_extension_data[unit]

		if extension then
			local is_pinged = extension.pinged
			local c = (is_pinged and OutlineSettings.colors.player_attention.channel) or extension.outline_color.channel
			local t_val = data.f(t)
			local channel = Color(c[1] * t_val, c[2] * t_val, c[3] * t_val, c[4] * t_val)

			self:outline_unit(unit, extension.flag, channel, true, extension.apply_method, extension.reapply)

			extension.outlined = true
		else
			self._pulsing_units[unit] = nil
		end
	end
end

OutlineSystem.set_priority_outline = function (self, unit, apply_method, do_outline)
	local outline_extension = self.unit_extension_data[unit]

	if not outline_extension or self._disabled then
		return
	end

	outline_extension.set_method(apply_method)

	if outline_extension.flag then
		local c = outline_extension.outline_color.channel
		local channel = Color(c[1], c[2], c[3], c[4])

		self:outline_unit(unit, outline_extension.flag, channel, do_outline, outline_extension.apply_method, false)

		outline_extension[(do_outline and "outlined") or "reapply"] = true
	end

	outline_extension.priority_outline = do_outline
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
				end
			end

			i = i + 1
		end
	elseif apply_method == "unit_and_childs" then
		Unit.set_shader_pass_flag_for_meshes_in_unit_and_childs(unit, flag, do_outline)
		Unit.set_color_for_materials_in_unit_and_childs(unit, "outline_color", channel)
	elseif apply_method == "unit" then
		Unit.set_shader_pass_flag_for_meshes(unit, flag, do_outline)
		Unit.set_color_for_materials(unit, "outline_color", channel)
	else
		error(sprintf("Non-existant apply method %s", apply_method))
	end
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
	local pose, _ = Unit.box(unit)
	local unit_center = Matrix4x4.translation(pose)
	local distance = Vector3.distance(camera_position, unit_center)

	return distance
end

OutlineSystem.never = function (self, unit, extension)
	return false
end

OutlineSystem.ai_alive = function (self, unit, extension)
	local active_cutscene = self:_is_cutscene_active()
	local alive = AiUtils.unit_alive(unit)

	return alive and not active_cutscene
end

OutlineSystem.always = function (self, unit, extension)
	local active_cutscene = self:_is_cutscene_active()

	return not active_cutscene
end

OutlineSystem.visible = function (self, unit, extension)
	local pose, _ = Unit.box(unit)
	local unit_center = Matrix4x4.translation(pose)
	local in_darkness = self.darkness_system:is_in_darkness(unit_center)
	local active_cutscene = self:_is_cutscene_active()

	return not in_darkness and not self:raycast_result(unit_center) and not active_cutscene
end

OutlineSystem.not_in_dark = function (self, unit, extension)
	local pose, _ = Unit.box(unit)
	local unit_center = Matrix4x4.translation(pose)
	local in_darkness = self.darkness_system:is_in_darkness(unit_center)
	local active_cutscene = self:_is_cutscene_active()

	return not in_darkness and not active_cutscene
end

OutlineSystem.not_visible = function (self, unit, extension)
	local active_cutscene = self:_is_cutscene_active()

	return not self:visible(unit, extension) and not active_cutscene
end

OutlineSystem.within_distance_and_not_in_dark = function (self, unit, extension)
	if not self:within_distance(unit, extension) then
		return false
	end

	local pose, _ = Unit.box(unit)
	local unit_center = Matrix4x4.translation(pose)
	local in_darkness = self.darkness_system:is_in_darkness(unit_center)
	local active_cutscene = self:_is_cutscene_active()

	return not in_darkness and not active_cutscene
end

OutlineSystem.within_distance = function (self, unit, extension)
	local active_cutscene = self:_is_cutscene_active()

	return self:distance_to_unit(unit) <= extension.distance and not active_cutscene
end

OutlineSystem.outside_distance = function (self, unit, extension)
	local active_cutscene = self:_is_cutscene_active()

	return extension.distance < self:distance_to_unit(unit) and not active_cutscene
end

OutlineSystem.outside_distance_or_not_visible = function (self, unit, extension)
	local active_cutscene = self:_is_cutscene_active()

	if self:outside_distance(unit, extension) then
		return not active_cutscene
	end

	if self:not_visible(unit, extension) then
		return not active_cutscene
	end

	return false
end

OutlineSystem.within_distance_and_visible = function (self, unit, extension)
	if self:within_distance(unit, extension) and self:visible(unit, extension) then
		local active_cutscene = self:_is_cutscene_active()

		return not active_cutscene
	end

	return false
end

OutlineSystem.conditional_within_distance = function (self, unit, extension)
	if self:within_distance(unit, extension) then
		local interaction_type = Unit.get_data(unit, "interaction_data", "interaction_type")
		local interaction_data = InteractionDefinitions[interaction_type]
		local local_player = Managers.player:local_player()
		local player_unit = local_player.player_unit
		local can_interact = false

		if player_unit then
			can_interact = interaction_data.client.can_interact(player_unit, unit)
		end

		local active_cutscene = self:_is_cutscene_active()

		return can_interact and not active_cutscene
	end

	return false
end

OutlineSystem.in_ghost_mode = function (self, unit, extension)
	local ghost_mode_extension = ScriptUnit.has_extension(unit, "ghost_mode_system")

	return ghost_mode_extension and ghost_mode_extension:is_in_ghost_mode()
end

OutlineSystem.has_gutter_runner_invisible_buff = function (self, unit, extension)
	local buff_system = ScriptUnit.extension(unit, "buff_system")

	return buff_system and buff_system:has_buff_type("gutter_runner_foff_invis")
end

OutlineSystem.show_versus_dark_pact_outline = function (self, unit, extension)
	if not self:within_distance_and_not_in_dark(unit, extension) then
		return false
	end

	if self:in_ghost_mode(unit, extension) then
		return false
	end

	return not self:has_gutter_runner_invisible_buff(unit, extension)
end

return
