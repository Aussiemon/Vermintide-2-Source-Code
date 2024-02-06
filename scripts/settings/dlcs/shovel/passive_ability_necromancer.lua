-- chunkname: @scripts/settings/dlcs/shovel/passive_ability_necromancer.lua

local RPCS = {
	"rpc_necromancer_passive_spawn_pet",
}
local RAISE_DEAD_COST = 10

PassiveAbilityNecromancer = class(PassiveAbilityNecromancer)

PassiveAbilityNecromancer.init = function (self, extension_init_context, unit, extension_init_data, ability_init_data)
	self._death_stacks = 0
	self._player = extension_init_data.player
	self._is_local = extension_init_data.player.local_player
	self._owner_unit = unit
	self._is_server = extension_init_context.is_server
	self._nav_world = Managers.state.entity:system("ai_system"):nav_world()
	self._breed_to_spawn = "pet_skeleton"
	self._spawn_queue = {}
	self._queued_pets = {}
	self._spawned_pets = {}
	self._num_queued_pets = 0
	self._pet_respawn_buffs = {}
	self._last_spawn_index = 0
	self._network_transmit = extension_init_context.network_transmit
	self._network_event_delegate = self._network_transmit.network_event_delegate

	self._network_event_delegate:register(self, unpack(RPCS))

	self._unit_storage = extension_init_context.unit_storage
	self._ping_explosion_params = {
		source_attacker_unit = unit,
	}
end

PassiveAbilityNecromancer.extensions_ready = function (self, world, unit)
	self._buff_system = Managers.state.entity:system("buff_system")
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")
	self._status_extension = ScriptUnit.extension(unit, "status_system")

	local career_extension = ScriptUnit.has_extension(unit, "career_system")

	if career_extension then
		local ability_id = career_extension:ability_id("bw_necromancer")

		self._career_ability = career_extension:ability_by_id(ability_id)
	end

	if self._is_local or self._is_server then
		self._commander_extension = ScriptUnit.extension(unit, "ai_commander_system")
	end

	self:_register_events()
	self:_on_talents_changed(unit, ScriptUnit.extension(unit, "talent_system"))
end

PassiveAbilityNecromancer.destroy = function (self)
	self._network_event_delegate:unregister(self)
	self:_unregister_events()

	local game_session = Managers.state.network:game()

	if not game_session then
		return
	end

	if self._is_server then
		self:_kill_all_pets_server()
	end
end

PassiveAbilityNecromancer._on_talents_changed = function (self, unit, talent_extension)
	if unit ~= self._owner_unit then
		return
	end

	self._has_dual_wield = talent_extension:has_talent("sienna_necromancer_4_1")
	self._has_shield = talent_extension:has_talent("sienna_necromancer_4_2")
	self._has_charge = talent_extension:has_talent("sienna_necromancer_4_3")

	if self._has_dual_wield then
		self._breed_to_spawn = "pet_skeleton_dual_wield"
	elseif self._has_shield then
		self._breed_to_spawn = "pet_skeleton_with_shield"
	elseif self._has_charge then
		self._breed_to_spawn = "pet_skeleton_armored"
	else
		self._breed_to_spawn = "pet_skeleton"
	end
end

PassiveAbilityNecromancer._register_events = function (self)
	local event_manager = Managers.state.event

	if self._is_server then
		event_manager:register(self, "on_killed", "event_on_killed")
	end

	event_manager:register(self, "on_talents_changed", "_on_talents_changed")
end

PassiveAbilityNecromancer._unregister_events = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		Managers.state.event:unregister("on_killed", self)
		Managers.state.event:unregister("on_talents_changed", self)
	end
end

PassiveAbilityNecromancer.destroy = function (self)
	self._network_event_delegate:unregister(self)
	self:_unregister_events()

	local game_session = Managers.state.network:game()

	if not game_session then
		return
	end

	if self._is_server then
		self:_kill_all_pets_server()
	end
end

PassiveAbilityNecromancer.update = function (self, dt, t)
	if self._is_server then
		self:_update_pets_server()
		self:_update_spawning()
	end
end

PassiveAbilityNecromancer._update_pets_server = function (self)
	local status_extension = self._status_extension

	if status_extension:is_dead() or status_extension:is_knocked_down() then
		self:_kill_all_pets_server()
	end
end

local relative_raise_positions = {}
local offset = 4
local num_positions = 10
local angle_between_positions = math.pi * 0.05

for i = 1, num_positions do
	local angle = (i - (num_positions * 0.5 - 0.5)) * angle_between_positions
	local relative_pos = Vector3Box(Quaternion.rotate(Quaternion.axis_angle(Vector3.up(), angle), Vector3.forward()) * offset)

	relative_raise_positions[#relative_raise_positions + 1] = relative_pos
end

PassiveAbilityNecromancer.spawn_pets = function (self, num_pets, template_name)
	local breed_name = self._breed_to_spawn
	local is_server = self._is_server
	local spawn_index = self._last_spawn_index

	for i = 1, num_pets do
		spawn_index = spawn_index + 1

		local d = relative_raise_positions[spawn_index % #relative_raise_positions + 1]
		local relative_pos = d:unbox()

		if is_server then
			self._spawn_queue[#self._spawn_queue + 1] = {
				breed_name = breed_name,
				relative_pos = Vector3Box(relative_pos),
				template_name = template_name,
			}
		else
			local network_transmit = self._network_transmit
			local breed_id = NetworkLookup.breeds[breed_name]
			local template_id = NetworkLookup.controlled_unit_templates[template_name]

			network_transmit:send_rpc_server("rpc_necromancer_passive_spawn_pet", breed_id, relative_pos, template_id)
		end
	end

	self._last_spawn_index = spawn_index
end

PassiveAbilityNecromancer.spawn_pet = function (self, breed_name, relative_pos, template_name)
	local commander_ext = self._commander_extension
	local owner_buff_extension = self._buff_extension
	local necromancer_unit = self._owner_unit
	local side_id = Managers.state.side.side_by_unit[necromancer_unit].side_id
	local spawn_category = "resurrected"
	local spawn_animation = "spawn_floor"
	local queued_pets = self._queued_pets
	local breed = Breeds[breed_name]
	local optional_data = {
		ignore_breed_limits = true,
		side_id = side_id,
		spawned_func = function (pet_unit, breed, optional_data)
			if ALIVE[necromancer_unit] then
				self._spawned_pets[pet_unit] = true
				queued_pets[optional_data] = nil
				self._num_queued_pets = self._num_queued_pets - 1

				owner_buff_extension:trigger_procs("on_pet_spawned", pet_unit)

				local t = Managers.time:time("game")

				commander_ext:add_controlled_unit(pet_unit, template_name, t)

				local params = FrameTable.alloc_table()

				params.source_attacker_unit = necromancer_unit

				self._buff_system:add_buff_synced(pet_unit, "sienna_necromancer_pet_attack_sfx", BuffSyncType.Local, params, self._player.peer_id)
			end
		end,
	}
	local fp_rotation_flat

	if self._first_person_extension then
		fp_rotation_flat = self._first_person_extension:current_rotation()
		fp_rotation_flat = Quaternion.look(Vector3.flat(Quaternion.forward(fp_rotation_flat)), Vector3.up())
	else
		local game_object_id = self._unit_storage:go_id(necromancer_unit)
		local game = Managers.state.network:game()
		local aim_direction = GameSession.game_object_field(game, game_object_id, "aim_direction")

		fp_rotation_flat = Quaternion.look(Vector3.flat(aim_direction), Vector3.up())
	end

	local position = POSITION_LOOKUP[necromancer_unit] + Quaternion.rotate(fp_rotation_flat, relative_pos)
	local nav_world = self._nav_world
	local unit_is_on_navmesh, z = GwNavQueries.triangle_from_position(nav_world, position, 2, 2)

	if unit_is_on_navmesh then
		position.z = z
	else
		position = GwNavQueries.inside_position_from_outside_position(nav_world, position, 2, 2, 5, 1)
	end

	if not position then
		return false
	end

	queued_pets[optional_data] = Managers.state.conflict:spawn_queued_unit(breed, Vector3Box(position), QuaternionBox(fp_rotation_flat), spawn_category, spawn_animation, nil, optional_data)
	self._num_queued_pets = self._num_queued_pets + 1

	return true
end

local ignored_life_essence_breeds = {
	pet_skeleton = true,
	pet_skeleton_armored = true,
	pet_skeleton_dual_wield = true,
	pet_skeleton_with_shield = true,
}

PassiveAbilityNecromancer.event_on_killed = function (self, killing_blow, breed_killed, breed_attacker, attacker_unit, killed_unit)
	if not breed_killed or ignored_life_essence_breeds[breed_killed.name] then
		return
	end

	local life_essence = breed_killed.threat_value
	local buff_extension = ScriptUnit.has_extension(killed_unit, "buff_system")

	if buff_extension then
		life_essence = buff_extension:apply_buffs_to_value(life_essence, "life_essence")
	end

	self._death_stacks = self._death_stacks + life_essence

	local dead_to_raise = math.floor(self._death_stacks / RAISE_DEAD_COST)

	if dead_to_raise > 0 then
		self:spawn_pets(dead_to_raise, "necromancer_pet")

		self._death_stacks = self._death_stacks - dead_to_raise * RAISE_DEAD_COST
	end
end

PassiveAbilityNecromancer._kill_all_pets_server = function (self)
	local queued_pets = self._queued_pets

	for spawn_data, queue_id in pairs(queued_pets) do
		queued_pets[spawn_data] = nil
		self._num_queued_pets = self._num_queued_pets - 1

		Managers.state.conflict:remove_queued_unit(queue_id)
	end

	local spawned_pets = self._spawned_pets

	for controlled_unit in pairs(spawned_pets) do
		spawned_pets[controlled_unit] = nil

		self._commander_extension:remove_controlled_unit(controlled_unit)
		AiUtils.kill_unit(controlled_unit)
	end
end

PassiveAbilityNecromancer.rpc_necromancer_passive_spawn_pet = function (self, channel_id, breed_id, relative_pos, template_id)
	assert(self._is_server, "[PassiveAbilityNecromancer] 'rpc_necromancer_passive_spawn_pet' is a server only function.")

	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	if peer_id ~= self._player.peer_id then
		return
	end

	local breed_name = NetworkLookup.breeds[breed_id]
	local template_name = NetworkLookup.controlled_unit_templates[template_id]

	self._spawn_queue[#self._spawn_queue + 1] = {
		breed_name = breed_name,
		relative_pos = Vector3Box(relative_pos),
		template_name = template_name,
	}
end

PassiveAbilityNecromancer._update_spawning = function (self)
	local queue = self._spawn_queue
	local failed_i = 1

	for i = 1, #queue do
		local spawn_data = queue[i]
		local breed_name = spawn_data.breed_name
		local relative_pos = spawn_data.relative_pos
		local template_name = spawn_data.template_name
		local success = self:spawn_pet(breed_name, relative_pos:unbox(), template_name)

		queue[i] = nil

		if not success then
			queue[failed_i] = spawn_data
			failed_i = failed_i + 1
		end
	end
end
