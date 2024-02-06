-- chunkname: @scripts/settings/dlcs/geheimnisnacht_2021/geheimnisnacht_2021_altar_extension.lua

Geheimnisnacht2021AltarExtension = class(Geheimnisnacht2021AltarExtension)

local ambient_vfx_name = "fx/halloween_event_ambient"
local explosion_vfx_name = "fx/halloween_event_final_explosion"
local decal_unit_name = "units/decals/decal_halloween_2021"
local decal_size = 3
local decal_offset_rot = math.degrees_to_radians(78.5)
local decal_offset = {
	-0.04,
	-0.1,
}
local STATE_INIT = 0
local STATE_AGGROED = 1
local STATE_INTERACTABLE = 2
local STATE_DESTRUCTIBLE = 3
local ANIM_STATE_AGGROED = "to_interactable"
local ANIM_STATE_INTERACTABLE = "to_destructible"
local ANIM_STATE_INTERACT_START = "hit_start"
local ANIM_STATE_INTERACT_END = "hit_end"
local game_session_set_game_object_field = GameSession.set_game_object_field
local game_session_game_object_field = GameSession.game_object_field

Geheimnisnacht2021AltarExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self._is_server = Managers.state.network.is_server
	self.world = extension_init_context.world
	self._state = extension_init_data.state or STATE_INIT
	self._audio_system = Managers.state.entity:system("audio_system")
	self._unit_spawner = Managers.state.unit_spawner

	self:_init_state()
end

Geheimnisnacht2021AltarExtension.destroy = function (self)
	self:unregister_events()
end

Geheimnisnacht2021AltarExtension.assign_cultist_group_id = function (self, group_id)
	self._cultist_group_id = group_id
end

Geheimnisnacht2021AltarExtension.get_current_state = function (self)
	return self._state
end

Geheimnisnacht2021AltarExtension.can_interact = function (self)
	return self._state == STATE_INTERACTABLE
end

Geheimnisnacht2021AltarExtension.on_interact = function (self, server_interact, success)
	if not server_interact then
		Unit.animation_event(self._unit, ANIM_STATE_INTERACT_END)
	end

	if server_interact and success then
		self:change_state(STATE_DESTRUCTIBLE)
	end
end

Geheimnisnacht2021AltarExtension.on_interact_start = function (self, server_interact)
	if not server_interact then
		Unit.animation_event(self._unit, ANIM_STATE_INTERACT_START)
	end
end

Geheimnisnacht2021AltarExtension.update = function (self, unit, input, dt, context, t)
	local game = Managers.state.network:game()
	local id = self._go_id or Managers.state.unit_storage:go_id(unit)

	if game and id then
		if self._is_server then
			game_session_set_game_object_field(game, id, "state", self._state)
		else
			local state = game_session_game_object_field(game, id, "state")

			self:change_state(state)
		end

		self._go_id = id
	end

	if not self._check_time then
		self._check_time = 0
	end

	if not self._hero_close and t > self._check_time then
		local nearby_player_units = FrameTable.alloc_table()
		local proximity_extension = Managers.state.entity:system("proximity_system")
		local broadphase = proximity_extension.player_units_broadphase

		Broadphase.query(broadphase, POSITION_LOOKUP[unit], 35, nearby_player_units)

		for _, player_unit in pairs(nearby_player_units) do
			local player = Managers.player:owner(player_unit)
			local is_bot = player and not player:is_player_controlled()

			if not is_bot then
				self:play_relevant_faction_sound()
				self:set_ritual_sound(true)

				self._hero_close = true

				if not self.nurglings_spawned and self._is_server then
					self:spawn_nurglings()
				end
			end
		end

		self._check_time = t + 1
	end
end

Geheimnisnacht2021AltarExtension.die = function (self)
	if self._is_server then
		local target_node = Unit.node(self._unit, "j_skull_anim")
		local target_node_position = Unit.world_position(self._unit, target_node)
		local pickup_system = Managers.state.entity:system("pickup_system")

		pickup_system:buff_spawn_pickup("geheimnisnacht_2021_side_objective", target_node_position, true)
	end

	Managers.state.achievement:trigger_event("altar_destroyed")
	Unit.flow_event(self._unit, "lua_dead")
	World.create_particles(self.world, explosion_vfx_name, POSITION_LOOKUP[self._unit] + Vector3.up())

	if self._ambient_vfx then
		World.destroy_particles(self.world, self._ambient_vfx)

		self._ambient_vfx = nil
	end

	self:set_ritual_sound(false)
	self:unregister_events()
end

Geheimnisnacht2021AltarExtension.register_events = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		self._registered_events = true

		event_manager:register(self, "geheimnisnacht_2021_altar_cultists_killed", "on_cultists_killed")
		event_manager:register(self, "geheimnisnacht_2021_altar_cultists_aggroed", "on_cultists_aggroed")

		if self._is_server then
			event_manager:register(self, "nurgling_killed", "nurglings_flee")
		end
	end
end

Geheimnisnacht2021AltarExtension.unregister_events = function (self)
	local event_manager = Managers.state.event

	if event_manager and self._registered_events then
		self._registered_events = nil

		event_manager:unregister("geheimnisnacht_2021_altar_cultists_killed", self)
		event_manager:unregister("geheimnisnacht_2021_altar_cultists_aggroed", self)

		if self._is_server then
			event_manager:unregister("nurgling_killed", self)
		end
	end
end

Geheimnisnacht2021AltarExtension.on_cultists_killed = function (self, group_id)
	if group_id == self._cultist_group_id then
		self:change_state(STATE_INTERACTABLE)
		self:stop_relevant_faction_sound()
	end
end

Geheimnisnacht2021AltarExtension.on_cultists_aggroed = function (self, group_id)
	if group_id == self._cultist_group_id then
		self:stop_relevant_faction_sound()
		self:change_state(STATE_AGGROED)
		self:nurglings_flee()
	end
end

Geheimnisnacht2021AltarExtension.stop_relevant_faction_sound = function (self)
	local faction = self._faction

	if faction then
		local audio_system = self._audio_system
		local unit = self._unit

		if not ALIVE[unit] then
			return
		end

		if faction == "chaos" then
			audio_system:play_audio_unit_event("enemy_marauder_halloween_ritual_loop_stop", unit)
		else
			audio_system:play_audio_unit_event("enemy_skaven_halloween_ritual_loop_stop", unit)
		end
	end
end

Geheimnisnacht2021AltarExtension.play_relevant_faction_sound = function (self)
	local faction = self._faction

	if faction then
		local unit = self._unit

		if not ALIVE[unit] then
			return
		end

		local audio_system = self._audio_system

		if faction == "chaos" then
			audio_system:play_audio_unit_event("enemy_marauder_halloween_ritual_loop", unit)
		else
			audio_system:play_audio_unit_event("enemy_skaven_halloween_ritual_loop", unit)
		end
	end
end

Geheimnisnacht2021AltarExtension.set_ritual_sound = function (self, activate)
	local audio_system = self._audio_system
	local unit = self._unit

	if activate then
		audio_system:play_audio_unit_event("halloween_event_ritual_loop", unit)
	else
		audio_system:play_audio_unit_event("halloween_event_ritual_loop_stop", unit)
	end
end

Geheimnisnacht2021AltarExtension.setup_faction = function (self, faction)
	if faction then
		self._faction = faction
	end
end

Geheimnisnacht2021AltarExtension.change_state = function (self, new_state)
	local current_state = self._state

	if current_state < new_state then
		for i = current_state + 1, new_state do
			self:_increment_state(i)
		end

		self._state = new_state
	end
end

Geheimnisnacht2021AltarExtension._init_state = function (self)
	local world = self.world
	local unit = self._unit

	self._health_extension = ScriptUnit.extension(unit, "health_system")
	self._health_extension.is_invincible = true

	if self._state == STATE_INIT then
		self:register_events()
	end

	if self._state ~= STATE_DESTRUCTIBLE then
		local pos = Unit.world_position(unit, 0)
		local rot = Unit.world_rotation(unit, 0)

		self._ambient_vfx = World.create_particles(world, ambient_vfx_name, pos, rot)

		World.link_particles(world, self._ambient_vfx, unit, 0, Matrix4x4.identity(), "stop")

		if decal_unit_name then
			self._decal_unit = self._unit_spawner:spawn_local_unit(decal_unit_name)

			Unit.set_local_position(self._decal_unit, 0, pos + Vector3(decal_offset[1], decal_offset[2], 0))
			Unit.set_local_rotation(self._decal_unit, 0, Quaternion.multiply(rot, Quaternion(Vector3.up(), decal_offset_rot)))
			Unit.set_local_scale(self._decal_unit, 0, Vector3(decal_size, decal_size, 2))
		end
	end
end

Geheimnisnacht2021AltarExtension._increment_state = function (self, new_state)
	if new_state == STATE_AGGROED then
		self:_mark_aggroed()
	elseif new_state == STATE_INTERACTABLE then
		self:_mark_interactable()
	elseif new_state == STATE_DESTRUCTIBLE then
		self:_mark_destructible()
	end
end

Geheimnisnacht2021AltarExtension._mark_aggroed = function (self)
	Unit.animation_event(self._unit, ANIM_STATE_AGGROED)
end

Geheimnisnacht2021AltarExtension._mark_interactable = function (self)
	self:unregister_events()
	Unit.animation_event(self._unit, ANIM_STATE_INTERACTABLE)
end

Geheimnisnacht2021AltarExtension._mark_destructible = function (self)
	if self._decal_unit then
		Unit.flow_event(self._decal_unit, "despawn")

		self._decal_unit = nil
	end

	self:die()
end

Geheimnisnacht2021AltarExtension.nurglings_flee = function (self)
	local ai_group_system = Managers.state.entity:system("ai_group_system")
	local group = ai_group_system:get_ai_group(self.nurgling_group_id)

	if group then
		AIGroupTemplates.critter_nurglings.wake_up_group(group)
	end
end

Geheimnisnacht2021AltarExtension.spawn_nurglings = function (self)
	if self.nurglings_spawned then
		return
	end

	local unit = self._unit
	local altar_pos = Unit.local_position(unit, 0)
	local altar_pos_box = Vector3Box(altar_pos)

	self.nurgling_group_id = Managers.state.entity:system("ai_group_system"):generate_group_id()

	local optional_data = {
		spawned_func = function (unit, breed, optional_data)
			local blackboard = BLACKBOARDS[unit]
			local ai_extension = ScriptUnit.extension(unit, "ai_system")

			ai_extension:set_perception("perception_regular", "pick_no_targets")

			if blackboard then
				blackboard.altar_pos = altar_pos_box
				blackboard.is_fleeing = false
				blackboard.nurgling_spawned_by_altar = true
			end
		end,
	}
	local lowest_amount = 15
	local highest_amount = 20
	local num_nurglings = math.random(lowest_amount, highest_amount)
	local spawn_radius = 1
	local spread = 1
	local tries = 15
	local group_data = {
		template = "critter_nurglings",
		id = self.nurgling_group_id,
		size = num_nurglings,
	}
	local spawn_rot = Quaternion.identity()
	local breed_name = "critter_nurgling"
	local spawn_category = "event"
	local spawn_type = "event"
	local spawn_animation
	local breed_data = Breeds[breed_name]
	local conflict_director = Managers.state.conflict
	local nav_world = Managers.state.entity:system("ai_system"):nav_world()

	for i = 1, num_nurglings do
		local spawn_pos = ConflictUtils.get_spawn_pos_on_circle(nav_world, altar_pos, spawn_radius, spread, tries)

		conflict_director:spawn_queued_unit(breed_data, Vector3Box(spawn_pos), QuaternionBox(spawn_rot), spawn_category, spawn_animation, spawn_type, optional_data, group_data)
	end

	self.nurglings_spawned = true
end
