SummonedVortexHuskExtension = class(SummonedVortexHuskExtension)

SummonedVortexHuskExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	local game = Managers.state.network:game()
	self.world = world
	self.game = game
	self.unit = unit
	local vortex_template_name = extension_init_data.vortex_template_name
	local vortex_template = VortexTemplates[vortex_template_name]
	self.vortex_template_name = vortex_template_name
	self.vortex_template = vortex_template
	local inner_fx_name = vortex_template.inner_fx_name
	local position = POSITION_LOOKUP[unit]
	local inner_fx_id = World.create_particles(world, inner_fx_name, position)
	local rotation = Unit.local_rotation(unit, 0)
	local inner_pose = Matrix4x4.from_quaternion(rotation)
	local inner_scale_xy = vortex_template.full_inner_radius / vortex_template.full_fx_radius
	local inner_fx_z_scale_multiplier = vortex_template.inner_fx_z_scale_multiplier or 1

	Matrix4x4.set_scale(inner_pose, Vector3(inner_scale_xy, inner_scale_xy, inner_fx_z_scale_multiplier))
	World.link_particles(world, inner_fx_id, unit, 0, inner_pose, "stop")

	self._inner_fx_id = inner_fx_id
	local outer_fx_name = vortex_template.outer_fx_name
	local outer_fx_id = World.create_particles(world, outer_fx_name, position)
	local outer_pose = Matrix4x4.from_quaternion(rotation)
	local outer_scale_xy = vortex_template.full_outer_radius / vortex_template.full_fx_radius
	local outer_fx_z_scale_multiplier = vortex_template.outer_fx_z_scale_multiplier or 1

	Matrix4x4.set_scale(outer_pose, Vector3(outer_scale_xy, outer_scale_xy, outer_fx_z_scale_multiplier))
	World.link_particles(world, outer_fx_id, unit, 0, outer_pose, "stop")

	self._outer_fx_id = outer_fx_id
	local inner_decal_unit = extension_init_data.inner_decal_unit

	if inner_decal_unit then
		World.link_unit(world, inner_decal_unit, unit, 0)
		Unit.set_local_scale(inner_decal_unit, 0, Vector3(inner_scale_xy, inner_scale_xy, 1))
		Unit.flow_event(inner_decal_unit, "vortex_spawned")

		self._inner_decal_unit = inner_decal_unit
	end

	local outer_decal_unit = extension_init_data.outer_decal_unit

	if outer_decal_unit then
		World.link_unit(world, outer_decal_unit, unit, 0)
		Unit.set_local_scale(outer_decal_unit, 0, Vector3(outer_scale_xy, outer_scale_xy, 1))
		Unit.flow_event(outer_decal_unit, "vortex_spawned")

		self._outer_decal_unit = outer_decal_unit
	end

	self._owner_unit = extension_init_data.owner_unit or unit
	local unit_storage = Managers.state.unit_storage
	local go_id = unit_storage:go_id(unit)
	self.current_height_lerp = GameSession.game_object_field(game, go_id, "height_percentage")
end

SummonedVortexHuskExtension.extensions_ready = function (self, world, unit)
	local start_sound_event_name = self.vortex_template.start_sound_event_name or "Play_enemy_sorcerer_vortex_loop"

	WwiseUtils.trigger_unit_event(world, start_sound_event_name, unit)
end

SummonedVortexHuskExtension.destroy = function (self)
	local world = self.world
	local unit = self.unit
	local stop_sound_event_name = self.vortex_template.stop_sound_event_name or "Stop_enemy_sorcerer_vortex_loop"

	WwiseUtils.trigger_unit_event(world, stop_sound_event_name, unit)

	local inner_decal_unit = self._inner_decal_unit

	if Unit.alive(inner_decal_unit) then
		Unit.flow_event(inner_decal_unit, "vortex_despawned")
	end

	local outer_decal_unit = self._outer_decal_unit

	if Unit.alive(outer_decal_unit) then
		Unit.flow_event(outer_decal_unit, "vortex_despawned")
	end
end

local HEIGHT_FX_LERP = 2

SummonedVortexHuskExtension.update = function (self, unit, input, dt, context, t)
	local game = self.game
	local unit_storage = Managers.state.unit_storage
	local go_id = unit_storage:go_id(unit)
	local fx_radius_percentage = GameSession.game_object_field(game, go_id, "fx_radius_percentage")
	local height_percentage = GameSession.game_object_field(game, go_id, "height_percentage")
	local current_height_lerp = self.current_height_lerp
	local height_lerp = math.lerp(current_height_lerp, height_percentage, math.min(dt * HEIGHT_FX_LERP, 1))
	self.current_height_lerp = height_lerp
	local vortex_template = self.vortex_template
	local scale_xy = fx_radius_percentage * vortex_template.full_fx_radius
	local scale_z = height_lerp * vortex_template.max_height

	Unit.set_local_scale(unit, 0, Vector3(scale_xy, scale_xy, scale_z))
end

local spiral = {}
local spiral_segments = 8
local spiral_lines = 10

SummonedVortexHuskExtension.debug_render_vortex = function (self, t, dt, pos, fx_radius, inner_radius, outer_radius, spin_speed, height)
	fx_radius = fx_radius + math.sin(t * 1.7) * 0.4
	local step = 2 * math.pi / 6
	local col_delta = math.floor(155 / spiral_segments)
	local height_step = height / spiral_segments

	for j = 1, spiral_lines do
		local alpha = j * 2 * math.pi / spiral_lines

		for i = 1, spiral_segments do
			local r = fx_radius + 0.5 * i * i / spiral_segments
			local v = t * spin_speed + i * step + alpha
			spiral[i] = Vector3(math.sin(v) * r, math.cos(v) * r, (i - 1) * height_step)
		end

		local r = fx_radius + math.sin(t) * 0.2
		local v = t * spin_speed + alpha + 0 * step
		local pos1 = Vector3(math.sin(v) * r, math.cos(v) * r, 0)

		QuickDrawer:sphere(pos + pos1, (math.sin(v * 3) + 1) / 3, Color(155, 255, 155))

		for i = 1, spiral_segments do
			local pos2 = spiral[i]
			local color = Color(155 - col_delta * i, 255 - col_delta * i, 155 - col_delta * i)

			QuickDrawer:line(pos + pos1, pos + pos2, color)

			pos1 = pos2
		end
	end

	QuickDrawer:circle(pos, inner_radius, Vector3.up(), Colors.get("pink"))
	QuickDrawer:circle(pos, outer_radius, Vector3.up(), Colors.get("lime_green"))
end
