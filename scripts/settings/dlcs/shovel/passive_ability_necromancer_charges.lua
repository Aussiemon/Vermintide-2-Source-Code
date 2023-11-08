local RPCS = {
	"rpc_necromancer_passive_spawn_pet",
	"rpc_necromancer_respawn_all_pets",
	"rpc_necromancer_passive_stragglify_pets",
	"rpc_necromancer_stragglify_client_pet"
}
local PositionModesLookup = nil
NecromancerPositionModes, PositionModesLookup = table.enum_lookup("Absolute", "Relative")
PassiveAbilityNecromancerCharges = class(PassiveAbilityNecromancerCharges)

PassiveAbilityNecromancerCharges.init = function (self, extension_init_context, unit, extension_init_data, ability_init_data)
	self._player = extension_init_data.player
	self._is_local = extension_init_data.player.local_player
	self._owner_unit = unit
	self._is_server = extension_init_context.is_server
	self._nav_world = Managers.state.entity:system("ai_system"):nav_world()
	self._army_definition = {
		"pet_skeleton",
		"pet_skeleton",
		"pet_skeleton",
		"pet_skeleton",
		"pet_skeleton",
		"pet_skeleton"
	}
	self._spawn_queue = {}
	self._queued_pets = {}
	self._spawned_pets = {}
	self._num_queued_pets = 0
	self._pet_respawn_buffs = {}
	self._last_spawn_index = 0
	self._resummon_spawn_data = {}
	self._network_transmit = extension_init_context.network_transmit
	self._network_event_delegate = self._network_transmit.network_event_delegate

	self._network_event_delegate:register(self, unpack(RPCS))

	self._unit_storage = extension_init_context.unit_storage
	self._ping_explosion_params = {
		source_attacker_unit = unit
	}
	self._dual_wield_params = {
		source_attacker_unit = unit
	}
	self._achv_staff_gandalf_data = {}
end

PassiveAbilityNecromancerCharges.warm_up_skeletons = function (self, breeds)
	print("Necromancer - Warm up skeletons:")

	local enemy_package_loader = Managers.level_transition_handler.enemy_package_loader
	local breed_processed = enemy_package_loader.breed_processed
	local ignore_breed_limits = true

	for k, breed_name in ipairs(breeds) do
		if not breed_processed[breed_name] then
			printf("\t -> %s", breed_name)
			enemy_package_loader:request_breed(breed_name, ignore_breed_limits)
		end
	end
end

PassiveAbilityNecromancerCharges.extensions_ready = function (self, world, unit)
	self._buff_system = Managers.state.entity:system("buff_system")
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")
	self._status_extension = ScriptUnit.extension(unit, "status_system")
	self._talent_extension = ScriptUnit.extension(unit, "talent_system")
	self._cutscene_system = Managers.state.entity:system("cutscene_system")
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

	self._start_update_t = Managers.time:time("game") + 3
end

PassiveAbilityNecromancerCharges._on_talents_changed = function (self, unit, talent_extension)
	if unit ~= self._owner_unit then
		return
	end

	self._has_army = talent_extension:has_talent("sienna_necromancer_6_1")
	self._has_dual_wield = talent_extension:has_talent("sienna_necromancer_6_2")
	local has_mix = talent_extension:has_talent("sienna_necromancer_6_3")

	if has_mix then
		self._army_definition = {
			"pet_skeleton_with_shield",
			"pet_skeleton_with_shield",
			"pet_skeleton_with_shield",
			"pet_skeleton_armored",
			"pet_skeleton_armored",
			"pet_skeleton_armored"
		}
	elseif self._has_dual_wield then
		self._army_definition = table.fill({}, 6, "pet_skeleton_dual_wield")
	else
		self._army_definition = table.fill({}, 6, "pet_skeleton")
	end

	local is_in_inn_level = Managers.level_transition_handler:in_hub_level()
	self._pets_forbidden_in_level = script_data.pets_forbidden_in_hub and is_in_inn_level

	if self._is_server then
		self:warm_up_skeletons(self._army_definition)
	end

	self._force_respawn_pets = true
end

PassiveAbilityNecromancerCharges._register_events = function (self)
	Managers.state.event:register(self, "on_talents_changed", "_on_talents_changed")
end

PassiveAbilityNecromancerCharges._unregister_events = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		Managers.state.event:unregister("on_talents_changed", self)
	end
end

PassiveAbilityNecromancerCharges.destroy = function (self)
	self._network_event_delegate:unregister(self)
	self:_unregister_events()

	local game_session = Managers.state.network:game()

	if not game_session then
		return
	end

	if self._is_server then
		self:_kill_all_pets_server(true)
	end
end

PassiveAbilityNecromancerCharges.update = function (self, dt, t)
	if t < self._start_update_t then
		return
	end

	if self._is_server then
		self:_update_pets_server()
		self:_update_spawning(t)
	end

	self:_update_achievements(t)
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

PassiveAbilityNecromancerCharges.spawn_army_pet = function (self, optional_last_index, optional_position, optional_position_mode)
	local army_def = self._army_definition
	local index = math.index_wrapper((optional_last_index or 0) + 1, #army_def)
	local template_name = "necromancer_pet_charges"
	local breed_name = army_def[index]

	self:spawn_pet(template_name, breed_name, optional_position, optional_position_mode)

	return index
end

PassiveAbilityNecromancerCharges.spawn_pet = function (self, template_name, breed_name, optional_position, optional_position_mode)
	if self._pets_forbidden_in_level then
		return
	end

	if not optional_position then
		self._last_spawn_index = self._last_spawn_index + 1
		optional_position = relative_raise_positions[self._last_spawn_index % #relative_raise_positions + 1]:unbox()
		optional_position_mode = NecromancerPositionModes.Relative
	end

	local is_server = self._is_server

	if is_server then
		self:_queue_pet(breed_name, optional_position, optional_position_mode, template_name)
	else
		local network_transmit = self._network_transmit
		local breed_id = NetworkLookup.breeds[breed_name]
		local template_id = NetworkLookup.controlled_unit_templates[template_name]
		local position_mode_id = PositionModesLookup[optional_position_mode]

		network_transmit:send_rpc_server("rpc_necromancer_passive_spawn_pet", template_id, breed_id, optional_position, position_mode_id)
	end
end

PassiveAbilityNecromancerCharges.spawn_pets = function (self, num_pets, template_name, breed_name)
	for i = 1, num_pets do
		self:spawn_pet(template_name, breed_name)
	end
end

PassiveAbilityNecromancerCharges._queue_pet = function (self, breed_name, position, position_mode, template_name)
	if self:is_invalid_spawn_position(position) then
		position = Vector3.zero()
		position_mode = NecromancerPositionModes.Relative
	end

	self._spawn_queue[#self._spawn_queue + 1] = {
		breed_name = breed_name,
		position = Vector3Box(position),
		position_mode = position_mode,
		template_name = template_name
	}
end

PassiveAbilityNecromancerCharges.store_buff_unit = function (self, buff_unit)
	self._buff_unit = buff_unit
end

PassiveAbilityNecromancerCharges.is_ready = function (self)
	if not ALIVE[self._buff_unit] then
		return true
	end

	local buff_extension = ScriptUnit.extension(self._buff_unit, "buff_system")
	local has_buff = buff_extension:has_buff_type("raise_dead_ability")

	return not has_buff
end

PassiveAbilityNecromancerCharges.rpc_necromancer_stragglify_client_pet = function (self, channel_id, game_object_id)
	local pet_unit = self._unit_storage:unit(game_object_id)

	self._commander_extension:set_controlled_unit_template(pet_unit, "necromancer_pet_straggler_client")
end

PassiveAbilityNecromancerCharges.rpc_necromancer_passive_spawn_pet = function (self, channel_id, template_id, breed_id, position, position_mode_id)
	assert(self._is_server, "[PassiveAbilityNecromancerCharges] 'rpc_necromancer_passive_spawn_pet' is a server only function.")

	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	if peer_id ~= self._player.peer_id then
		return
	end

	local breed_name = NetworkLookup.breeds[breed_id]
	local template_name = NetworkLookup.controlled_unit_templates[template_id]
	local position_mode = PositionModesLookup[position_mode_id]

	self:_queue_pet(breed_name, position, position_mode, template_name)
end

PassiveAbilityNecromancerCharges.stragglify_pets = function (self, peer_id)
	if not self._is_server then
		self._network_transmit:send_rpc_server("rpc_necromancer_passive_stragglify_pets")

		return
	end

	if self._has_army then
		local commander_ext = self._commander_extension
		local t = Managers.time:time("game")

		for pet_unit in pairs(self._spawned_pets) do
			if HEALTH_ALIVE[pet_unit] then
				local template = commander_ext:controlled_unit_template(pet_unit)

				if template.name ~= "necromancer_pet_straggler" then
					commander_ext:set_controlled_unit_template(pet_unit, "necromancer_pet_straggler", true, t)

					if peer_id then
						local game_object_id = self._unit_storage:go_id(pet_unit)

						self._network_transmit:send_rpc("rpc_necromancer_stragglify_client_pet", peer_id, game_object_id)
					end
				end
			end
		end
	else
		self:_kill_all_pets_server(false)
	end
end

PassiveAbilityNecromancerCharges.rpc_necromancer_passive_stragglify_pets = function (self, channel_id)
	assert(self._is_server, "[PassiveAbilityNecromancerCharges] 'rpc_necromancer_passive_stragglify_pets' is a server only function.")

	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	if peer_id ~= self._player.peer_id then
		return
	end

	self:stragglify_pets(peer_id)
end

PassiveAbilityNecromancerCharges.rpc_necromancer_respawn_all_pets = function (self, channel_id)
	assert(self._is_server, "[PassiveAbilityNecromancerCharges] 'rpc_necromancer_respawn_pets' is a server only function.")

	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	if peer_id ~= self._player.peer_id then
		return
	end

	for id in pairs(self._pet_respawn_buffs) do
		self:consume_pet_charge(id)
	end
end

PassiveAbilityNecromancerCharges._update_pets_server = function (self)
	if self._pets_forbidden_in_level then
		return
	end

	local status_extension = self._status_extension

	if (status_extension:is_dead() or status_extension:is_ready_for_assisted_respawn()) and not self._was_dead then
		self._was_dead = true

		self:_kill_all_pets_server()
	end
end

PassiveAbilityNecromancerCharges.invalid_spawn_position = function (self)
	return Vector3(0, 0, -500)
end

PassiveAbilityNecromancerCharges.is_invalid_spawn_position = function (self, position)
	return not position or position[3] < -400
end

PassiveAbilityNecromancerCharges._spawn_pet_server = function (self, breed_name, position, position_mode, template_name)
	local commander_ext = self._commander_extension
	local owner_buff_extension = self._buff_extension
	local necromancer_unit = self._owner_unit
	local side_id = Managers.state.side.side_by_unit[necromancer_unit].side_id
	local spawn_category = "resurrected"
	local queued_pets = self._queued_pets
	local breed = Breeds[breed_name]
	local optional_data = {
		ignore_event_counter = true,
		ignore_breed_limits = true,
		side_id = side_id,
		spawned_func = function (pet_unit, breed, optional_data)
			if ALIVE[necromancer_unit] then
				self._spawned_pets[pet_unit] = template_name
				queued_pets[optional_data] = nil
				self._num_queued_pets = self._num_queued_pets - 1

				owner_buff_extension:trigger_procs("on_pet_spawned", pet_unit)

				local params = FrameTable.alloc_table()
				params.source_attacker_unit = necromancer_unit

				self._buff_system:add_buff_synced(pet_unit, "sienna_necromancer_pet_attack_sfx", BuffSyncType.Local, params, self._player.peer_id)
				self._buff_system:add_buff_synced(pet_unit, "update_anim_movespeed", BuffSyncType.All)

				if self._has_dual_wield then
					self._buff_system:add_buff_synced(pet_unit, "sienna_necromancer_passive_balefire", BuffSyncType.Local)
				end

				if template_name == "necromancer_pet_charges" then
					if self._has_dual_wield then
						self._buff_system:add_buff_synced(pet_unit, "sienna_necromancer_6_2_pet_buff", BuffSyncType.Local, self._dual_wield_params)
					end
				elseif template_name == "necromancer_pet_ability" then
					local bb = BLACKBOARDS[pet_unit]
					bb.ability_spawned = true
					bb.dont_follow_commander = true

					if not self._talent_extension:has_talent("sienna_necromancer_6_3_2") then
						local navigation_extension = bb.navigation_extension

						navigation_extension:add_movement_modifier(0.35 + math.random() * 0.2)
					end
				end

				local t = Managers.time:time("game")

				commander_ext:add_controlled_unit(pet_unit, template_name, t)
				self:_extract_resummon_data(pet_unit, template_name)
			end
		end
	}
	local fp_rotation_flat = nil

	if self._first_person_extension then
		fp_rotation_flat = self._first_person_extension:current_rotation()
		fp_rotation_flat = Quaternion.look(Vector3.flat(Quaternion.forward(fp_rotation_flat)), Vector3.up())
	else
		local game_object_id = self._unit_storage:go_id(necromancer_unit)
		local game = Managers.state.network:game()
		local aim_direction = GameSession.game_object_field(game, game_object_id, "aim_direction")
		fp_rotation_flat = Quaternion.look(Vector3.flat(aim_direction), Vector3.up())
	end

	if position_mode == NecromancerPositionModes.Relative then
		position = POSITION_LOOKUP[necromancer_unit] + Quaternion.rotate(fp_rotation_flat, position)
	end

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

	queued_pets[optional_data] = Managers.state.conflict:spawn_queued_unit(breed, Vector3Box(position), QuaternionBox(fp_rotation_flat), spawn_category, nil, nil, optional_data)
	self._num_queued_pets = self._num_queued_pets + 1

	return true
end

PassiveAbilityNecromancerCharges._kill_all_pets_server = function (self, is_destroy)
	local queued_pets = self._queued_pets

	for spawn_data, queue_id in pairs(queued_pets) do
		queued_pets[spawn_data] = nil
		self._num_queued_pets = self._num_queued_pets - 1

		Managers.state.conflict:remove_queued_unit(queue_id)
	end

	self._disable_pet_charges = true
	local spawned_pets = self._spawned_pets

	for controlled_unit in pairs(spawned_pets) do
		self:_remove_unit(controlled_unit)

		if HEALTH_ALIVE[controlled_unit] then
			AiUtils.kill_unit(controlled_unit)
		end
	end

	self._disable_pet_charges = false

	if is_destroy then
		return
	end

	self:_remove_pet_charges()
end

PassiveAbilityNecromancerCharges.resummon_pet = function (self, controlled_unit)
	local commander_extension = ScriptUnit.extension(self._owner_unit, "ai_commander_system")
	local controlled_units = commander_extension:get_controlled_units() or EMPTY_TABLE
	local controlled_unit_data = controlled_units[controlled_unit]
	local template = controlled_unit_data.template
	local template_name = template and template.name or self._spawned_pets[controlled_unit]

	self:_gather_resummon_data(controlled_unit, template_name)

	self._disable_pet_charges = true

	self:_remove_unit(controlled_unit)
	AiUtils.kill_unit(controlled_unit)

	local breed_name = BLACKBOARDS[controlled_unit].breed.name

	self:spawn_pets(1, template_name, breed_name)

	self._disable_pet_charges = false
end

local EMPTY_TABLE = {}

PassiveAbilityNecromancerCharges._gather_resummon_data = function (self, controlled_unit, template_name)
	if not self._is_server then
		return
	end

	local commander_extension = ScriptUnit.extension(self._owner_unit, "ai_commander_system")
	local controlled_units = commander_extension:get_controlled_units() or EMPTY_TABLE
	local controlled_unit_data = controlled_units[controlled_unit]
	local start_t = controlled_unit_data.start_t
	local health_extension = ScriptUnit.extension(controlled_unit, "health_system")
	local damage_taken = health_extension:get_damage_taken()
	self._resummon_spawn_data[template_name] = self._resummon_spawn_data[template_name] or {}
	self._resummon_spawn_data[template_name][#self._resummon_spawn_data[template_name] + 1] = {
		damage_taken = damage_taken,
		start_t = start_t
	}
end

PassiveAbilityNecromancerCharges._extract_resummon_data = function (self, unit, template_name)
	local template_resummon_data = self._resummon_spawn_data[template_name]

	if not template_resummon_data then
		return
	end

	local resummon_data = template_resummon_data[#template_resummon_data]
	local damage_taken = resummon_data.damage_taken
	local start_t = resummon_data.start_t
	local commander_extension = ScriptUnit.extension(self._owner_unit, "ai_commander_system")
	local controlled_units = commander_extension:get_controlled_units()
	local controlled_unit_data = controlled_units[unit]
	controlled_unit_data.start_t = start_t
	local health_extension = ScriptUnit.extension(unit, "health_system")

	health_extension:set_server_damage_taken(resummon_data.damage_taken)

	template_resummon_data[#template_resummon_data] = nil

	if #template_resummon_data == 0 then
		self._resummon_spawn_data[template_name] = nil
	end
end

PassiveAbilityNecromancerCharges._remove_unit = function (self, controlled_unit)
	self._spawned_pets[controlled_unit] = nil

	self._commander_extension:remove_controlled_unit(controlled_unit)
end

PassiveAbilityNecromancerCharges.add_pet_charge = function (self, removed_unit, override_duration)
	assert(self._is_server, "[PassiveAbilityNecromancerCharges] Local only function")
	Managers.state.event:unregister_referenced("on_ai_unit_destroyed", removed_unit, self)

	if self._disable_pet_charges then
		return
	end

	local params = nil

	if override_duration then
		params = FrameTable.alloc_table()
		params.external_optional_duration = override_duration
	end

	local buff_id = self._buff_system:add_buff_synced(self._owner_unit, "sienna_pet_spawn_charge", BuffSyncType.ClientAndServer, params, self._player.peer_id)
	self._pet_respawn_buffs[buff_id] = true
end

PassiveAbilityNecromancerCharges.consume_pet_charge = function (self, buff_id)
	assert(self._is_server, "[PassiveAbilityNecromancerCharges] Local only function")

	self._pet_respawn_buffs[buff_id] = nil

	self._buff_system:remove_buff_synced(self._owner_unit, buff_id)
	self:spawn_pets(1, "necromancer_pet_charges")
end

PassiveAbilityNecromancerCharges._remove_pet_charges = function (self)
	assert(self._is_server, "[PassiveAbilityNecromancerCharges] Local only function")

	local owner_unit = self._owner_unit
	local buff_system = self._buff_system

	for buff_id in pairs(self._pet_respawn_buffs) do
		buff_system:remove_buff_synced(owner_unit, buff_id)

		self._pet_respawn_buffs[buff_id] = nil
	end
end

PassiveAbilityNecromancerCharges._update_spawning = function (self, t)
	if self._cutscene_system:is_active() then
		return
	end

	local requeue_i = 0
	local queue = self._spawn_queue

	for i = 1, #queue do
		local spawn_data = queue[i]
		local breed_name = spawn_data.breed_name
		local position = spawn_data.position
		local template_name = spawn_data.template_name
		local position_mode = spawn_data.position_mode
		local success = self:_spawn_pet_server(breed_name, position:unbox(), position_mode, template_name)
		queue[i] = nil

		if not success then
			requeue_i = requeue_i + 1
			queue[requeue_i] = spawn_data
		end
	end
end

PassiveAbilityNecromancerCharges._update_achievements = function (self, t)
	if self._is_local then
		self:_achievement_staff_gandalf_update(t)
	end
end

PassiveAbilityNecromancerCharges.achievement_staff_gandalf_trigger = function (self, target_unit, t, check_delay)
	self._achv_staff_gandalf_data[target_unit] = t + check_delay
end

PassiveAbilityNecromancerCharges._achievement_staff_gandalf_update = function (self, t)
	for unit, check_t in pairs(self._achv_staff_gandalf_data) do
		if check_t < t then
			self._achv_staff_gandalf_data[unit] = nil

			Managers.state.achievement:trigger_event("necromancer_staff_gandalf_delayed_check", unit)
		end
	end
end
