-- chunkname: @scripts/unit_extensions/level/event_light_spawner_extension.lua

EventLightSpawnerExtension = class(EventLightSpawnerExtension)

local raycasts_per_frame = 1

EventLightSpawnerExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world

	self.world = world
	self.unit = unit
	self.is_server = Managers.player.is_server
	self.unit_spawner = Managers.state.unit_spawner
	self._units = {}
	self._spawn_pool = {}
	self._spawn_pool_timer = 0
	self._spawn_pool_spawn_index = 1
	self._spawn_pool_add_index = 1
	self._num_raycasts = 0
	self._speed = extension_init_data.speed or Unit.get_data(unit, "speed") or 1
	self._respawn_timer = extension_init_data.respawn_timer or Unit.get_data(unit, "respawn_timer") or 10
	self._first_spawn_delay = extension_init_data.first_spawn_delay or Unit.get_data(unit, "first_spawn_delay") or 0
	self._unit_to_spawn = extension_init_data.unit_to_spawn or Unit.get_data(unit, "unit_to_spawn")
	self._light_intensity = Unit.get_data(unit, "light_intensity") or 1
	self._active = false

	Unit.set_unit_visibility(self.unit, false)

	if self.is_server then
		for i = 1, 4 do
			local spawn_unit = {
				speed = self._speed,
				id = i,
				respawn_time = self._respawn_timer - self._first_spawn_delay,
			}

			self._units[i] = spawn_unit
		end
	end
end

EventLightSpawnerExtension.update = function (self, unit, input, dt, context, t)
	if not self.is_server then
		return
	end

	local active = Unit.get_data(unit, "active")

	if not self._active and active then
		self:_activate()
	elseif self._active and not active then
		self:_deactivate()
	end

	if self._active then
		local units = self._units
		local hero_side = Managers.state.side:get_side_from_name("heroes")
		local players = hero_side.PLAYER_AND_BOT_UNITS

		for index, _ in pairs(players) do
			local light_unit = units[index]

			if not light_unit.unit then
				light_unit.respawn_time = light_unit.respawn_time + dt

				local player_unit = light_unit.chase_target

				if light_unit.respawn_time >= self._respawn_timer and player_unit and Unit.alive(player_unit) then
					self:_add_to_spawn_pool(light_unit.id)

					light_unit.respawn_time = 0
				end
			end
		end

		self:_update_spawn_pool(dt)
		self:_update_units(context, dt)
	end
end

EventLightSpawnerExtension._update_units = function (self, context, dt)
	local units = self._units

	for _, light_unit in pairs(units) do
		local unit = light_unit and light_unit.unit
		local player_unit = light_unit.chase_target

		if not player_unit then
			self:_sync_light_units()
		end

		if player_unit and Unit.alive(player_unit) and unit and Unit.alive(unit) then
			local unit_position = Unit.local_position(unit, 0)
			local player_pos = player_unit and POSITION_LOOKUP[player_unit] + Vector3.up()
			local physics_world = World.physics_world(context.world)
			local direction = player_pos - unit_position

			direction = Vector3.length(direction) == 0 and Vector3.down() or Vector3.normalize(direction)

			local length = 1

			PhysicsWorld.prepare_actors_for_raycast(physics_world, unit_position, direction, 0.1)

			local result = PhysicsWorld.immediate_raycast(physics_world, unit_position, direction, length, "all", "collision_filter", "filter_player_hit_box_and_static_check")

			if result then
				local num_hits = #result

				for i = 1, num_hits do
					local hit = result[i]
					local hit_actor = hit[4]
					local hit_unit = Actor.unit(hit_actor)
					local unit_breed = AiUtils.unit_breed(hit_unit)

					if not unit_breed and i == num_hits then
						self:_explode_spirit(unit)

						light_unit.unit = nil
					elseif hit_unit == player_unit then
						local damage_profile = DamageProfileTemplates.warpfire_thrower_explosion
						local power_level = 100
						local hit_direction = unit_position - player_pos

						hit_direction = Vector3.normalize(hit_direction)

						local player = Managers.player:owner(player_unit)
						local is_player = player and player:is_player_controlled()

						if is_player then
							DamageUtils.add_damage_network_player(damage_profile, nil, power_level, player_unit, unit, "full", player_pos, hit_direction, "undefined", nil, 0, false, nil, false, 0, 1)
						end

						self:_explode_spirit(unit)

						light_unit.unit = nil
					end
				end
			end
		end
	end

	for _, light_unit in pairs(units) do
		local unit = light_unit.unit

		if unit then
			local unit_position = Unit.local_position(unit, 0)
			local player_unit = light_unit.chase_target

			if Unit.alive(player_unit) then
				local player_pos = player_unit and POSITION_LOOKUP[player_unit]
				local player = Managers.player:owner(player_unit)
				local is_player = player and player:is_player_controlled()

				if player_pos and is_player then
					local chase_target_position = player_pos + Vector3(0, 0, 1)
					local direction_vector = chase_target_position - unit_position

					direction_vector = Vector3.normalize(direction_vector)

					local move_vector = direction_vector * (dt * light_unit.speed)
					local new_position = unit_position + move_vector

					Unit.set_local_position(unit, 0, new_position)
				elseif player_pos and not is_player then
					local chase_target_position = player_pos + Vector3(0, 0, 1)
					local direction_vector = chase_target_position - unit_position
					local magnitude = Vector3.length(direction_vector)
					local move_vector_modifier = magnitude < 3 and math.max(0, magnitude - 2) or 1

					direction_vector = Vector3.normalize(direction_vector)

					local move_vector = direction_vector * (dt * light_unit.speed) * move_vector_modifier
					local new_position = unit_position + move_vector

					Unit.set_local_position(unit, 0, new_position)
				end
			else
				light_unit.chase_target = nil

				self:_explode_spirit(light_unit.unit)

				light_unit.unit = nil
			end
		end
	end
end

EventLightSpawnerExtension._update_spawn_pool = function (self, dt)
	local spawn_pool = self._spawn_pool

	if spawn_pool[self._spawn_pool_spawn_index] then
		self._spawn_pool_timer = self._spawn_pool_timer + dt

		if self._spawn_pool_timer > 1 then
			self._spawn_pool_timer = self._spawn_pool_timer - 1

			local spawned_unit = self.unit_spawner:spawn_network_unit(self._unit_to_spawn, "position_synched_light_unit", nil, Unit.local_position(self.unit, 0))
			local audio_system = Managers.state.entity:system("audio_system")

			audio_system:play_audio_unit_event("Play_bastion_sorcerer_boss_magic_ball_spawn", spawned_unit)

			local light_unit_id = spawn_pool[self._spawn_pool_spawn_index]
			local light_unit = self._units[light_unit_id]

			light_unit.unit = spawned_unit
			spawn_pool[self._spawn_pool_spawn_index] = nil
			self._spawn_pool_spawn_index = self._spawn_pool_spawn_index + 1
		end
	end
end

EventLightSpawnerExtension._add_to_spawn_pool = function (self, id)
	local spawn_pool = self._spawn_pool

	spawn_pool[self._spawn_pool_add_index] = id
	self._spawn_pool_add_index = self._spawn_pool_add_index + 1
end

EventLightSpawnerExtension._activate = function (self)
	self._active = true

	local hero_side = Managers.state.side:get_side_from_name("heroes")
	local players = hero_side.PLAYER_AND_BOT_UNITS

	for index, player in pairs(players) do
		self._units[index].chase_target = player
	end
end

EventLightSpawnerExtension._deactivate = function (self)
	self._active = false

	local units = self._units

	for i = 1, #units do
		local unit = units[i].unit

		if unit then
			self:_explode_spirit(unit)

			units[i].chase_target = nil
			units[i].unit = nil
		end
	end
end

EventLightSpawnerExtension._explode_spirit = function (self, unit)
	local position = Unit.local_position(unit, 0)
	local rotation = Unit.world_rotation(unit, 0)
	local area_damage_system = Managers.state.entity:system("area_damage_system")

	area_damage_system:create_explosion(unit, position, rotation, "bastion_light_spirit", 1, "undefined", 0, false)

	local audio_system = Managers.state.entity:system("audio_system")

	audio_system:play_audio_unit_event("Play_bastion_sorcerer_boss_magic_ball_explode", unit)
	Managers.state.unit_spawner:mark_for_deletion(unit)
end

EventLightSpawnerExtension._sync_light_units = function (self)
	if not self.is_server then
		return
	end

	local units = self._units
	local hero_side = Managers.state.side:get_side_from_name("heroes")
	local players = hero_side.PLAYER_AND_BOT_UNITS

	for _, light_unit in ipairs(units) do
		if not light_unit.chase_target or not Unit.alive(light_unit.chase_target) then
			light_unit.chase_target = nil
		end
	end

	for _, player_unit in pairs(players) do
		local available_unit, is_target

		for _, light_unit in ipairs(units) do
			if light_unit.chase_target then
				if light_unit.chase_target == player_unit then
					is_target = true

					break
				end
			else
				available_unit = available_unit or light_unit
			end
		end

		if not is_target and available_unit then
			self:_add_to_spawn_pool(available_unit.id)

			available_unit.chase_target = player_unit

			break
		end
	end
end
