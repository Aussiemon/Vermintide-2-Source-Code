-- chunkname: @scripts/settings/dlcs/woods/thornsister_wall_extension.lua

ThornSisterWallExtension = class(ThornSisterWallExtension)

local DESPAWN_ANIM_TIME = 1

ThornSisterWallExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._is_server = Managers.state.network.is_server
	self._unit = unit
	self._life_time = extension_init_data.life_time
	self._owner_peer = extension_init_data.owner
	self._owner_unit = extension_init_data.owner_unit
	self._despawn_sound_event = extension_init_data.despawn_sound_event
	self.wall_index = extension_init_data.wall_index
	self.group_spawn_index = extension_init_data.group_spawn_index
	self._despawning = false
	self._initialized = false
	self.world = extension_init_context.world
	self._area_damage_extension = ScriptUnit.extension(self._unit, "area_damage_system")

	local source_talent_extension = ScriptUnit.has_extension(self._owner_unit, "talent_system")

	if source_talent_extension and source_talent_extension:has_talent("kerillian_thorn_sister_debuff_wall") then
		self._is_explosive_wall = true

		local career_extension = ScriptUnit.has_extension(self._owner_unit, "career_system")

		self._owner_career_power_level = career_extension and career_extension:get_career_power_level() or 100
	end

	self._original_rotation = QuaternionBox(Unit.local_rotation(unit, 0))

	local side_manager = Managers.state.side
	local side = side_manager.side_by_unit[self._owner_unit] or Managers.state.side:get_side_from_name("heroes")
	local side_id = side.side_id

	side_manager:add_unit_to_side(unit, side_id)

	local is_versus = Managers.mechanism:current_mechanism_name() == "versus"

	if is_versus then
		local extents_padding = 1.25
		local _, extents = Unit.box(unit, false)

		self._player_boss_trample_radius = (extents[1] > extents[2] and extents[1] or extents[2]) * extents_padding
	end
end

ThornSisterWallExtension.update = function (self, unit, input, dt, context, t)
	if not self._initialized then
		local life_time = self._life_time

		self._despawn_t = t + life_time
		self._despawn_anim_start_t = t + math.max(life_time - DESPAWN_ANIM_TIME, 0)
		self._initialized = true

		self:trigger_area_damage()
	end

	self:_update_local_player_pactsworn_collision()
	self:_check_player_boss_trample()

	if not self._despawning and t >= self._despawn_anim_start_t then
		self:despawn()
	end

	if self._is_server and t >= self._despawn_t then
		Managers.state.side:remove_unit_from_side(self._unit)
		Managers.state.unit_spawner:mark_for_deletion(self._unit)
	end
end

ThornSisterWallExtension.trigger_area_damage = function (self)
	self._area_damage_extension:enable_area_damage(true)

	if self._is_server then
		local network_manager = Managers.state.network
		local unit_id = network_manager:unit_game_object_id(self._unit)

		network_manager.network_transmit:send_rpc_clients("rpc_thorn_bush_trigger_area_damage", unit_id)
	end
end

local empty_damage_table = {}

ThornSisterWallExtension._despawn_single = function (self, skip_sound, grab_average_position)
	if self._despawning then
		return
	end

	local death_system = Managers.state.entity:system("death_system")

	death_system:kill_unit(self._unit, empty_damage_table)

	if self._versus_blocker_unit then
		World.destroy_unit(self.world, self._versus_blocker_unit)

		self._versus_blocker_unit = nil
	end

	if self._is_server then
		self._area_damage_extension:enable_area_damage(false)
	end

	Unit.flow_event(self._unit, "despawn")

	self._despawning = true

	if self._is_server and self._despawn_sound_event and not skip_sound then
		self:_trigger_despawn_sound(grab_average_position)
	end

	self._despawn_t = math.min(self._despawn_t or math.huge, Managers.time:time("game") + DESPAWN_ANIM_TIME)
end

ThornSisterWallExtension._trigger_despawn_sound = function (self, grab_average_position)
	local owner_unit = self._owner_unit
	local average_position = POSITION_LOOKUP[self._unit]

	if grab_average_position then
		local segment_count = 1
		local all_thorn_walls = Managers.state.entity:get_entities("ThornSisterWallExtension")

		if all_thorn_walls then
			local wall_index = self.wall_index

			for unit, extension in pairs(all_thorn_walls) do
				if unit ~= self._unit and extension.wall_index == wall_index and extension._owner_unit == owner_unit then
					average_position = average_position + POSITION_LOOKUP[self._unit]
					segment_count = segment_count + 1
				end
			end
		end

		average_position = average_position / segment_count
	end

	Managers.state.entity:system("audio_system"):play_audio_position_event(self._despawn_sound_event, average_position)
end

ThornSisterWallExtension.despawn = function (self, only_this)
	local owner_unit = self._owner_unit
	local skip_sound = false
	local average_position_for_sound = not only_this

	self:_despawn_single(skip_sound, average_position_for_sound)

	if only_this then
		return
	end

	local all_thorn_walls = Managers.state.entity:get_entities("ThornSisterWallExtension")

	if all_thorn_walls then
		skip_sound = true
		average_position_for_sound = nil

		local wall_index = self.wall_index

		for unit, extension in pairs(all_thorn_walls) do
			if unit ~= self._unit and extension.wall_index == wall_index and extension._owner_unit == owner_unit then
				extension:_despawn_single(skip_sound, average_position_for_sound)
			end
		end
	end
end

ThornSisterWallExtension.die = function (self)
	if not self._despawning then
		self:despawn()

		local t = Managers.time:time("game")

		self._despawn_t = t + DESPAWN_ANIM_TIME
	end
end

ThornSisterWallExtension.owner = function (self)
	return self._owner_unit
end

ThornSisterWallExtension._update_local_player_pactsworn_collision = function (self)
	local is_versus = Managers.mechanism:current_mechanism_name() == "versus"

	if not is_versus then
		return
	end

	local local_player = Managers.player:local_player()
	local local_player_unit = local_player and local_player.player_unit

	if not local_player_unit then
		return
	end

	local ghost_mode_extension = ScriptUnit.has_extension(local_player_unit, "ghost_mode_system")

	if not ghost_mode_extension then
		return
	end

	if self._despawning then
		return
	end

	local is_in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()
	local is_dirty = self._local_player_in_ghost_mode ~= is_in_ghost_mode

	self._local_player_in_ghost_mode = is_in_ghost_mode

	if is_dirty then
		if is_in_ghost_mode then
			if self._versus_blocker_unit then
				World.destroy_unit(self.world, self._versus_blocker_unit)

				self._versus_blocker_unit = nil
			end
		else
			local unit = self._unit
			local blocker_pos = Unit.local_position(unit, 0)
			local blocker_rot = Unit.local_rotation(unit, 0)

			self._versus_blocker_unit = World.spawn_unit(self.world, "units/beings/player/way_watcher_thornsister/abilities/ww_thornsister_thorn_wall_01", blocker_pos, blocker_rot)

			Unit.set_unit_visibility(self._versus_blocker_unit, false)

			local actor = Unit.actor(self._versus_blocker_unit, "c_simple")

			Actor.set_collision_filter(actor, "filter_mover_blocker_pactsworn")
		end
	end
end

ThornSisterWallExtension._check_player_boss_trample = function (self)
	local trample_radius = self._player_boss_trample_radius

	if not trample_radius or self._despawning then
		return
	end

	local pos = Unit.local_position(self._unit, 0)
	local side = Managers.state.side.side_by_unit[self._unit]
	local enemy_player_units = side.ENEMY_PLAYER_AND_BOT_UNITS

	for _, player_unit in pairs(enemy_player_units) do
		local breed = Unit.get_data(player_unit, "breed")

		if breed.boss then
			local ghost_mode_extension = ScriptUnit.extension(player_unit, "ghost_mode_system")

			if ghost_mode_extension and not ghost_mode_extension:is_in_ghost_mode() then
				local mover = Unit.mover(player_unit)

				if mover then
					local radius = Mover.radius(mover)
					local player_pos = POSITION_LOOKUP[player_unit]
					local trample_distance = radius + trample_radius
					local distance_sq = Vector3.distance_squared(pos, player_pos)
					local trample_sq = trample_distance * trample_distance

					if distance_sq < trample_sq then
						local only_this = true

						self:despawn(only_this)

						break
					end
				end
			end
		end
	end
end
