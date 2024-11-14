-- chunkname: @scripts/entity_system/systems/outlines/outline_system.lua

require("scripts/settings/outline_settings")
require("scripts/unit_extensions/outline/outline_extension")

OutlineSystem = class(OutlineSystem, ExtensionSystemBase)
OutlineSystem.system_extensions = {
	"AIOutlineExtension",
	"PickupOutlineExtension",
	"PlayerHuskOutlineExtension",
	"PlayerOutlineExtension",
	"MinionOutlineExtension",
	"DoorOutlineExtension",
	"ObjectiveOutlineExtension",
	"ObjectiveLightOutlineExtension",
	"ElevatorOutlineExtension",
	"ConditionalInteractOutlineExtension",
	"ConditionalPickupOutlineExtension",
	"EnemyOutlineExtension",
	"GenericOutlineExtension",
	"SmallPickupOutlineExtension",
	"SmallDoorOutlineExtension",
}
OutlineSystem.system_extensions[#OutlineSystem.system_extensions + 1] = "DarkPactPlayerOutlineExtension"
OutlineSystem.system_extensions[#OutlineSystem.system_extensions + 1] = "DarkPactPlayerHuskOutlineExtension"

OutlineSystem.init = function (self, context, system_name)
	local extensions = OutlineSystem.system_extensions

	OutlineSystem.super.init(self, context, system_name, extensions)

	self.world = context.world
	self.physics_world = World.get_data(self.world, "physics_world")
	self.unit_extension_data = {}
	self.frozen_unit_extension_data = {}
	self.units = {}
	self._initial_outline_data = {}
	self.current_index = 0
	self.darkness_system = Managers.state.entity:system("darkness_system")
	self.cutscene_system = Managers.state.entity:system("cutscene_system")

	local game_mode_manager = Managers.state.game_mode

	self._game_mode = game_mode_manager and game_mode_manager:game_mode()
	self._pulsing_units = {}
	self._event_manager = Managers.state.event

	self._event_manager:register(self, "on_player_joined_party", "on_player_joined_party")
end

OutlineSystem.add_ext_functions = {
	PlayerOutlineExtension = function (extension)
		local id = extension:add_outline({
			method = "never",
			outline_color = OutlineSettings.colors.ally,
			flag = OutlineSettings.flags.non_wall_occluded,
		})

		extension.apply_method = "unit_and_childs"
		extension.pinged_method = "never"

		return id
	end,
	PlayerHuskOutlineExtension = function (extension)
		local id = extension:add_outline({
			method = "outside_distance_or_not_visible",
			outline_color = OutlineSettings.colors.ally,
			distance = OutlineSettings.ranges.player_husk,
			flag = OutlineSettings.flags.non_wall_occluded,
		})

		extension.apply_method = "unit_and_childs"
		extension.pinged_method = "always"

		extension.update_override_method_player_setting = function (self)
			local user_outline_method
			local outline_user_setting = Application.user_setting("player_outlines")

			user_outline_method = outline_user_setting == "off" and "never" or outline_user_setting == "always_on" and "always" or "outside_distance_or_not_visible"

			extension:update_outline({
				method = user_outline_method,
			}, 0)
		end

		extension:update_override_method_player_setting()

		return id
	end,
	MinionOutlineExtension = function (extension)
		local id = extension:add_outline({
			method = "outside_distance_or_not_visible",
			outline_color = OutlineSettings.colors.necromancer_command,
			distance = OutlineSettings.ranges.player_husk,
			flag = OutlineSettings.flags.non_wall_occluded,
		})

		extension.apply_method = "unit_and_childs"
		extension.pinged_method = "always"

		extension.update_override_method_minion_setting = function (self)
			local user_outline_method
			local outline_user_setting = Application.user_setting("minion_outlines")

			user_outline_method = outline_user_setting == "off" and "never" or outline_user_setting == "always_on" and "always" or "outside_distance_or_not_visible"

			extension:update_outline({
				method = user_outline_method,
			}, 0)
		end

		extension:update_override_method_minion_setting()

		return id
	end,
	PickupOutlineExtension = function (extension)
		local id = extension:add_outline({
			method = "within_distance_and_not_in_dark",
			outline_color = OutlineSettings.colors.interactable,
			distance = OutlineSettings.ranges.pickup,
			flag = OutlineSettings.flags.wall_occluded,
		})

		extension.apply_method = "unit"
		extension.pinged_method = "not_in_dark"

		return id
	end,
	AIOutlineExtension = function (extension)
		local id = extension:add_outline({
			method = "never",
			outline_color = OutlineSettings.colors.interactable,
			distance = OutlineSettings.ranges.player_husk,
			flag = OutlineSettings.flags.non_wall_occluded,
		})

		extension.apply_method = "unit"
		extension.pinged_method = "not_in_dark"

		return id
	end,
	DoorOutlineExtension = function (extension)
		local id = extension:add_outline({
			method = "within_distance_and_not_in_dark",
			outline_color = OutlineSettings.colors.interactable,
			distance = OutlineSettings.ranges.doors,
			flag = OutlineSettings.flags.wall_occluded,
		})

		extension.apply_method = "unit"
		extension.pinged_method = "not_in_dark"

		return id
	end,
	SmallDoorOutlineExtension = function (extension)
		local id = extension:add_outline({
			method = "within_distance_and_not_in_dark",
			outline_color = OutlineSettings.colors.interactable,
			distance = OutlineSettings.ranges.small_doors,
			flag = OutlineSettings.flags.wall_occluded,
		})

		extension.apply_method = "unit"
		extension.pinged_method = "not_in_dark"

		return id
	end,
	ObjectiveOutlineExtension = function (extension)
		local id = extension:add_outline({
			method = "within_distance",
			outline_color = OutlineSettings.colors.interactable,
			distance = OutlineSettings.ranges.objective,
			flag = OutlineSettings.flags.non_wall_occluded,
		})

		extension.apply_method = "unit"
		extension.pinged_method = "always"

		return id
	end,
	ObjectiveLightOutlineExtension = function (extension)
		local id = extension:add_outline({
			method = "within_distance",
			outline_color = OutlineSettings.colors.interactable,
			distance = OutlineSettings.ranges.objective_light,
			flag = OutlineSettings.flags.wall_occluded,
		})

		extension.apply_method = "unit"
		extension.pinged_method = "always"

		return id
	end,
	ElevatorOutlineExtension = function (extension)
		local id = extension:add_outline({
			method = "within_distance",
			outline_color = OutlineSettings.colors.interactable,
			distance = OutlineSettings.ranges.elevators,
			flag = OutlineSettings.flags.wall_occluded,
		})

		extension.apply_method = "unit"
		extension.pinged_method = "not_in_dark"

		return id
	end,
	ConditionalInteractOutlineExtension = function (extension)
		local id = extension:add_outline({
			method = "conditional_within_distance",
			outline_color = OutlineSettings.colors.interactable,
			distance = OutlineSettings.ranges.doors,
			flag = OutlineSettings.flags.wall_occluded,
		})

		extension.apply_method = "unit"
		extension.pinged_method = "always"

		return id
	end,
	ConditionalPickupOutlineExtension = function (extension)
		local id = extension:add_outline({
			method = "conditional_within_distance",
			outline_color = OutlineSettings.colors.interactable,
			distance = OutlineSettings.ranges.pickup,
			flag = OutlineSettings.flags.wall_occluded,
		})

		extension.apply_method = "unit"
		extension.pinged_method = "always"

		return id
	end,
	EnemyOutlineExtension = function (extension)
		local id = extension:add_outline({
			method = "never",
			outline_color = OutlineSettings.colors.knocked_down,
			flag = OutlineSettings.flags.non_wall_occluded,
		})

		extension.apply_method = "unit_and_childs"
		extension.pinged_method = "not_in_dark"

		return id
	end,
	SmallPickupOutlineExtension = function (extension)
		local id = extension:add_outline({
			method = "within_distance_and_not_in_dark",
			outline_color = OutlineSettings.colors.interactable,
			distance = OutlineSettings.ranges.small_pickup,
			flag = OutlineSettings.flags.wall_occluded,
		})

		extension.apply_method = "unit"
		extension.pinged_method = "not_in_dark"

		return id
	end,
	GenericOutlineExtension = function (extension)
		local id = extension:add_outline({
			method = "within_distance",
			outline_color = OutlineSettings.colors.interactable,
			distance = OutlineSettings.ranges.interactable,
			flag = OutlineSettings.flags.wall_occluded,
		})

		extension.apply_method = "unit"
		extension.pinged_method = "not_in_dark"

		return id
	end,
	DarkPactPlayerOutlineExtension = function (extension)
		local id = extension:add_outline({
			method = "never",
			outline_color = OutlineSettingsVS.colors.ally,
			flag = OutlineSettings.flags.non_wall_occluded,
		})

		extension.apply_method = "unit_and_childs"
		extension.pinged_method = "show_versus_dark_pact_outline"

		return id
	end,
	DarkPactPlayerHuskOutlineExtension = function (extension)
		local is_ally
		local local_player = Managers.player:local_player()

		if local_player then
			local peer_id = local_player:network_id()
			local local_player_id = local_player:local_player_id()
			local party = Managers.party:get_party_from_player_id(peer_id, local_player_id)
			local side = Managers.state.side.side_by_party[party]

			if side then
				local side_name = side:name()

				if side_name == "dark_pact" then
					is_ally = true
				end
			end
		end

		local id = extension:add_outline({
			method = "always_same_side",
			outline_color = is_ally and OutlineSettingsVS.colors.ally or OutlineSettings.colors.knocked_down,
			distance = OutlineSettings.ranges.player_husk,
			flag = OutlineSettings.flags.non_wall_occluded,
		})

		extension.apply_method = "unit_and_childs"
		extension.pinged_method = "show_versus_dark_pact_outline"

		return id
	end,
}

OutlineSystem.on_add_extension = function (self, world, unit, extension_name)
	local extension = OutlineExtension:new()
	local setup_func = OutlineSystem.add_ext_functions[extension_name]
	local id = setup_func(extension)

	self._initial_outline_data[extension] = {
		setup_func = setup_func,
		id = id,
	}

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

OutlineSystem.on_player_joined_party = function (self, peer_id, local_player_id, party_id)
	if Managers.mechanism:current_mechanism_name() == "versus" then
		self:_reinitialize_outlines(peer_id, party_id)
	end
end

OutlineSystem._reinitialize_outlines = function (self, peer_id, party_id)
	local is_participating_party = Managers.party:is_game_participating_party(party_id)

	if peer_id ~= Network.peer_id() or not is_participating_party then
		return
	end

	for extension, data in pairs(self._initial_outline_data) do
		local setup_func = data.setup_func
		local temp_id = setup_func(extension)

		extension:swap_delete_outline(temp_id, data.id)

		if extension.update_override_method_player_setting then
			extension.update_override_method_player_setting()
		end

		if extension.update_override_method_minion_setting then
			extension.update_override_method_minion_setting()
		end
	end
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

	self._initial_outline_data[extension] = nil
	self.unit_extension_data[unit] = nil

	table.swap_delete(self.units, table.index_of(self.units, unit))
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
		local outline_settings = extension.outline_color
		local c = outline_settings.color
		local color = Color(c[1], c[2], c[3], c[4])

		self:outline_unit(unit, extension.flag, color, false, extension.apply_method, outline_settings)

		extension.outlined = false
	end

	extension.method = "never"

	extension:on_freeze()
end

OutlineSystem.unfreeze = function (self, unit)
	local extension = self.frozen_unit_extension_data[unit]

	fassert(extension, "Unit to unfreeze didn't have frozen extension")

	self.frozen_unit_extension_data[unit] = nil
	self.unit_extension_data[unit] = extension
	self.units[#self.units + 1] = unit

	extension:on_unfreeze()
end

OutlineSystem.local_player_created = function (self, player)
	self._local_player = player
	self.camera_unit = player.camera_follow_unit
end

OutlineSystem._is_cutscene_active = function (self)
	local cutscene_system = self.cutscene_system

	if not cutscene_system then
		return false
	end

	return cutscene_system.active_camera and not cutscene_system.ingame_hud_enabled
end

OutlineSystem._is_photomode_active = function (self)
	local game_mode = self._game_mode

	return game_mode and game_mode:photomode_enabled()
end

OutlineSystem.set_disabled = function (self, disabled)
	if disabled and not self._disabled then
		local units = self.units
		local unit_extension_data = self.unit_extension_data

		for i = 1, #units do
			local unit = units[i]
			local extension = unit_extension_data[unit]

			if extension and extension.outlined then
				local outline_settings = extension.outline_color
				local c = outline_settings.color
				local color = Color(c[1], c[2], c[3], c[4])

				self:outline_unit(unit, extension.flag, color, false, extension.apply_method, outline_settings)

				extension.outlined = false
			end
		end
	end

	self._disabled = disabled
end

OutlineSystem.update = function (self, context, t)
	if self._disabled or script_data.disable_outlines then
		return
	end

	if not self.camera_unit then
		return
	end

	local num_units = #self.units

	if num_units == 0 then
		return
	end

	local dt = context.dt
	local num_to_check_per_frame = math.min(num_units, 20)
	local max_slow_checks_per_frame = 3
	local slow_checks_done = 0
	local current_index = self.current_index
	local units = self.units
	local extensions = self.unit_extension_data
	local active_cutscene = self:_is_cutscene_active() or self:_is_photomode_active()

	for i = 1, num_to_check_per_frame do
		current_index = current_index % num_units + 1

		local unit = units[current_index]
		local extension = extensions[unit]

		if extension then
			local outline_settings = extension.outline_color
			local method = extension.method
			local flag_swiched = extension.prev_flag and extension.prev_flag ~= extension.flag

			if flag_swiched then
				self:outline_unit(unit, extension.prev_flag, Color(0, 0, 0, 0), false, extension.apply_method, outline_settings)

				extension.prev_flag = nil
			end

			local do_outline, slow_check = false, false

			if not active_cutscene then
				do_outline, slow_check = self[method](self, unit, extension)
			end

			if extension.outlined ~= do_outline or extension.reapply then
				local c = outline_settings.color
				local color = Color(255, c[2], c[3], c[4])

				self:outline_unit(unit, extension.flag, color, do_outline, extension.apply_method, outline_settings)

				extension.outlined = do_outline
			end

			extension.reapply = false

			if slow_check then
				slow_checks_done = slow_checks_done + 1

				if max_slow_checks_per_frame <= slow_checks_done then
					break
				end
			end
		end
	end

	self.current_index = current_index

	self:_update_pulsing(dt, t)
end

local PULSE_METHODS = {
	flash = function (t)
		return math.round(t * 3 % 1)
	end,
	pulse = function (t)
		return math.round(t * 3 % 1.5)
	end,
}

OutlineSystem.set_pulsing = function (self, unit, enable, method)
	if enable then
		self._pulsing_units[unit] = PULSE_METHODS[method]
	else
		local pulsing = self._pulsing_units[unit]

		if pulsing then
			self._pulsing_units[unit] = nil

			local extension = self.unit_extension_data[unit]

			if extension then
				extension.reapply = true
			end
		end
	end
end

OutlineSystem._update_pulsing = function (self, dt, t)
	for unit, pulse_function in pairs(self._pulsing_units) do
		local extension = self.unit_extension_data[unit]

		if extension then
			local outline_settings = extension.outline_color
			local c = outline_settings.color
			local t_val = pulse_function(t)
			local color = Color(c[1] * t_val, c[2] * t_val, c[3] * t_val, c[4] * t_val)

			self:outline_unit(unit, extension.flag, color, true, extension.apply_method, outline_settings)

			extension.outlined = true
		else
			self._pulsing_units[unit] = nil
		end
	end
end

OutlineSystem.outline_unit = function (self, unit, flag, color, do_outline, apply_method, outline_settings)
	if Unit.has_data(unit, "outlined_meshes") then
		local i = 0

		while Unit.has_data(unit, "outlined_meshes", i) do
			local mesh_name = Unit.get_data(unit, "outlined_meshes", i)
			local mesh = Unit.mesh(unit, mesh_name)

			Mesh.set_shader_pass_flag(mesh, flag, do_outline)

			if do_outline then
				local num_materials = Mesh.num_materials(mesh)

				for j = 0, num_materials - 1 do
					local material = Mesh.material(mesh, j)

					Material.set_color(material, "outline_color", color)
					Material.set_scalar(material, "outline_pulse_multiplier", outline_settings.pulsate and outline_settings.pulse_multiplier or 0)
				end
			end

			i = i + 1
		end
	elseif apply_method == "unit_and_childs" then
		Unit.set_shader_pass_flag_for_meshes_in_unit_and_childs(unit, flag, do_outline)
		Unit.set_color_for_materials_in_unit_and_childs(unit, "outline_color", color)
		Unit.set_scalar_for_materials_in_unit_and_childs(unit, "outline_pulse_multiplier", outline_settings.pulsate and outline_settings.pulse_multiplier or 0)
	elseif apply_method == "unit" then
		Unit.set_shader_pass_flag_for_meshes(unit, flag, do_outline)
		Unit.set_color_for_materials(unit, "outline_color", color)
		Unit.set_scalar_for_materials(unit, "outline_pulse_multiplier", outline_settings.pulsate and outline_settings.pulse_multiplier or 0)
	else
		error(sprintf("Non-existant apply method %s", apply_method))
	end

	local locomotion_extension = ScriptUnit.has_extension(unit, "locomotion_system")
	local bone_lod_id = locomotion_extension and locomotion_extension.bone_lod_extension_id

	if bone_lod_id then
		EngineOptimized.bone_lod_set_ignore_umbra(bone_lod_id, do_outline)
	end
end

OutlineSystem.raycast_result = function (self, unit_center)
	local physics_world = self.physics_world
	local camera_position = Unit.local_position(self.camera_unit, 0)
	local distance = Vector3.distance(camera_position, unit_center)
	local direction = Vector3.normalize(unit_center - camera_position)
	local result, num_hits = PhysicsWorld.immediate_raycast(physics_world, camera_position, direction, distance, "all", "collision_filter", "filter_ai_line_of_sight_check")

	return result, num_hits
end

OutlineSystem.distance_sq_to_unit = function (self, unit)
	local camera_position = Unit.local_position(self.camera_unit, 0)
	local pose, _ = Unit.box(unit)
	local unit_center = Matrix4x4.translation(pose)
	local distance_sq = Vector3.distance_squared(camera_position, unit_center)

	return distance_sq
end

local IS_SLOW_CHECK = true

OutlineSystem.never = function (self, unit, extension)
	return false
end

OutlineSystem.ai_alive = function (self, unit, extension)
	return not not HEALTH_ALIVE[unit]
end

OutlineSystem.always = function (self, unit, extension)
	return true
end

OutlineSystem.always_same_side = function (self, unit, extension)
	local same_side = extension.same_side

	if not same_side then
		local unit_side = Managers.state.side.side_by_unit[unit]
		local local_side = Managers.state.side.side_by_party[self._local_player:get_party()]

		same_side = not Managers.state.side:is_enemy_by_side(unit_side, local_side)
		extension.same_side = same_side
	end

	return same_side
end

OutlineSystem.same_side_in_ghost_mode = function (self, unit, extension)
	local status_extension = extension.status_extension

	if status_extension == nil then
		status_extension = ScriptUnit.has_extension(unit, "status_system")
		extension.status_extension = status_extension or false
	end

	return status_extension and status_extension:get_in_ghost_mode() and self:always_same_side(unit, extension)
end

OutlineSystem.visible = function (self, unit, extension)
	local pose, _ = Unit.box(unit)
	local unit_center = Matrix4x4.translation(pose)
	local in_darkness = self.darkness_system:is_in_darkness(unit_center)

	return not in_darkness and not self:raycast_result(unit_center), IS_SLOW_CHECK
end

OutlineSystem.not_in_dark = function (self, unit, extension)
	local pose, _ = Unit.box(unit)
	local unit_center = Matrix4x4.translation(pose)
	local in_darkness = self.darkness_system:is_in_darkness(unit_center)

	return not in_darkness
end

OutlineSystem.not_visible = function (self, unit, extension)
	return not self:visible(unit, extension), IS_SLOW_CHECK
end

OutlineSystem.within_distance_and_not_in_dark = function (self, unit, extension)
	if not self:within_distance(unit, extension) then
		return false
	end

	local pose, _ = Unit.box(unit)
	local unit_center = Matrix4x4.translation(pose)
	local in_darkness = self.darkness_system:is_in_darkness(unit_center)

	return not in_darkness
end

OutlineSystem.within_distance = function (self, unit, extension)
	return self:distance_sq_to_unit(unit) <= extension.distance * extension.distance
end

OutlineSystem.outside_distance = function (self, unit, extension)
	return self:distance_sq_to_unit(unit) > extension.distance * extension.distance
end

OutlineSystem.outside_distance_or_not_visible = function (self, unit, extension)
	if self:outside_distance(unit, extension) then
		return true
	end

	if self:not_visible(unit, extension) then
		return true, IS_SLOW_CHECK
	end

	return false, IS_SLOW_CHECK
end

OutlineSystem.within_distance_and_visible = function (self, unit, extension)
	if self:within_distance(unit, extension) and self:visible(unit, extension) then
		return true, IS_SLOW_CHECK
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

		return can_interact
	end

	return false
end

OutlineSystem.in_ghost_mode = function (self, unit, extension)
	local ghost_mode_extension = ScriptUnit.has_extension(unit, "ghost_mode_system")

	return ghost_mode_extension and ghost_mode_extension:is_in_ghost_mode()
end

OutlineSystem.has_gutter_runner_invisible_buff = function (self, unit, extension)
	local buff_system = ScriptUnit.extension(unit, "buff_system")

	return buff_system and buff_system:has_buff_type("vs_gutter_runner_smoke_bomb_invisible")
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

OutlineSystem.destroy = function (self)
	self._event_manager:unregister("on_player_joined_party", self)
end
