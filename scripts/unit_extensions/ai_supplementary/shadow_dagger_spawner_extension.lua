-- chunkname: @scripts/unit_extensions/ai_supplementary/shadow_dagger_spawner_extension.lua

ShadowDaggerSpawnerExtension = class(ShadowDaggerSpawnerExtension)

local DAGGER_COUNT = 12
local TIME_BETWEEN_LAUNCHES = 1.2
local DAGGER_SPAWN_RADIUS = 0.5
local DAGGER_WIND_UP_TIME = 1
local TIME_TO_DESTROY_SPAWNER_AFTER_ALL_DAGGERS = 1.5
local DISTANCE_CHECK_FOR_VALID_SPAWN = 4
local COLLISION_FILTER_FOR_VALID_SPAWN = "filter_in_line_of_sight_no_players_no_enemies"
local UNIT_NAME = "units/props/blk/blk_curse_shadow_dagger_01"
local GRAVITY_SETTINGS = "drake_pistols"
local TRAJECTORY_TEMPLATE_NAME = "throw_trajectory"
local IMPACT_COLLISION_FILTER = "filter_ray_projectile"
local IMPACT_EXPLOSION_NAME = "shadow_dagger_impact"
local SPEED = 300
local SPHERE_RADIUS = 0.5
local ONLY_ONE_IMPACT = true

local function spawn_dagger(spawner_unit, from_position, direction)
	local damage_source = "n/a"
	local gravity_settings = GRAVITY_SETTINGS
	local trajectory_template_name = TRAJECTORY_TEMPLATE_NAME
	local impact_collision_filter = IMPACT_COLLISION_FILTER
	local speed = SPEED
	local unit_name = UNIT_NAME
	local rotation = Quaternion.look(direction, Vector3.up())
	local angle = ActionUtils.pitch_from_rotation(rotation)
	local impact_explosion_name = IMPACT_EXPLOSION_NAME
	local sphere_radius = SPHERE_RADIUS
	local only_one_impact = ONLY_ONE_IMPACT
	local extension_init_data = {
		projectile_locomotion_system = {
			rotate_around_forward = true,
			rotation_speed = 10,
			angle = angle,
			speed = speed,
			target_vector = direction,
			initial_position = from_position,
			trajectory_template_name = trajectory_template_name,
			gravity_settings = gravity_settings,
			start_paused_for_time = DAGGER_WIND_UP_TIME,
		},
		projectile_impact_system = {
			sphere_radius = sphere_radius,
			only_one_impact = only_one_impact,
			collision_filter = impact_collision_filter,
			owner_unit = spawner_unit,
		},
		projectile_system = {
			impact_template_name = "direct_impact",
			damage_source = damage_source,
			owner_unit = spawner_unit,
			explosion_template_name = impact_explosion_name,
		},
	}

	return Managers.state.unit_spawner:spawn_network_unit(unit_name, "shadow_dagger_unit", extension_init_data, from_position)
end

local function check_if_can_spawn(from, to, physics_world, collision_filter)
	local direction = to - from
	local length = Vector3.length(direction)

	direction = Vector3.normalize(direction)

	if length < 0.001 then
		length = 0.001
	end

	local radius = SPHERE_RADIUS
	local halfway_position = from + direction * length * 0.5
	local radius_for_preparation = length

	PhysicsWorld.prepare_actors_for_overlap(physics_world, halfway_position, radius_for_preparation)

	local max_hits = 1
	local result = PhysicsWorld.linear_sphere_sweep(physics_world, from, to, radius, max_hits, "collision_filter", collision_filter, "report_initial_overlap")

	return not result
end

ShadowDaggerSpawnerExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world

	self.world = world
	self.physics_world = World.get_data(world, "physics_world")
	self.unit = unit
	self.is_server = Managers.player.is_server
	self._limitted_spawner = extension_init_data.limitted_spawner
end

ShadowDaggerSpawnerExtension.destroy = function (self)
	return
end

ShadowDaggerSpawnerExtension.on_remove_extension = function (self, unit, extension_name)
	return
end

ShadowDaggerSpawnerExtension.update = function (self, unit, input, dt, context, t)
	if self._done then
		return
	end

	if not self.is_server then
		return
	end

	if self._destroy_t then
		if t > self._destroy_t then
			if Unit.alive(unit) then
				Managers.state.unit_spawner:mark_for_deletion(unit)
			end

			self._done = true
		end

		return
	end

	local next_dagger_t = self._next_dagger_t

	if not next_dagger_t or next_dagger_t < t then
		local launched_daggers = self._launched_daggers or -1

		launched_daggers = launched_daggers + 1

		local start_position = Unit.world_position(unit, 0)

		start_position = start_position + Vector3(0, 0, 1)

		local up = Vector3.up()
		local direction = Quaternion.forward(Quaternion(up, 2 * math.pi * (launched_daggers / DAGGER_COUNT)))
		local direction_normalized = Vector3.normalize(direction)

		start_position = start_position + direction_normalized * DAGGER_SPAWN_RADIUS

		local distance_check_position = start_position + direction_normalized * DISTANCE_CHECK_FOR_VALID_SPAWN

		if check_if_can_spawn(start_position, distance_check_position, self.physics_world, COLLISION_FILTER_FOR_VALID_SPAWN) then
			spawn_dagger(self.unit, start_position, direction)

			self._next_dagger_t = t + TIME_BETWEEN_LAUNCHES
		end

		self._launched_daggers = launched_daggers

		if self._limitted_spawner and launched_daggers >= DAGGER_COUNT then
			self._destroy_t = t + TIME_TO_DESTROY_SPAWNER_AFTER_ALL_DAGGERS
		end
	end
end
