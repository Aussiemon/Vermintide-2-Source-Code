-- chunkname: @scripts/entity_system/systems/area_damage/area_damage_system.lua

AreaDamageSystem = class(AreaDamageSystem, ExtensionSystemBase)

local unit_alive = Unit.alive
local RPCS = {
	"rpc_add_liquid_damage_blob",
	"rpc_area_damage",
	"rpc_create_explosion",
	"rpc_enable_area_damage",
	"rpc_update_liquid_damage_blob",
	"rpc_create_liquid_damage_area",
	"rpc_add_damage_wave_fx",
	"rpc_add_damage_blob_fx",
	"rpc_abort_damage_blob",
	"rpc_damage_wave_set_state",
	"rpc_create_damage_wave",
	"rpc_create_thornsister_push_wave",
	"rpc_necromancer_create_curse_weave",
	"rpc_necromancer_create_curse_area",
}
local extensions = {
	"AreaDamageExtension",
	"TimedExplosionExtension",
	"LiquidAreaDamageExtension",
	"LiquidAreaDamageHuskExtension",
	"DamageWaveExtension",
	"DamageWaveHuskExtension",
	"DamageBlobExtension",
	"DamageBlobHuskExtension",
	"ProximityMineExtension",
}
local AOE_DAMAGE_RING_BUFFER_SIZE = 128
local NUM_UNITS_TO_DAMAGE_PER_FRAME = 15

DLCUtils.append("area_damage_extension", extensions)

AreaDamageSystem.init = function (self, entity_system_creation_context, system_name)
	AreaDamageSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	local network_event_delegate = entity_system_creation_context.network_event_delegate

	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	self.liquid_extensions = {}
	self.liquid_extension_indexes = {}
	self.num_liquid_extensions = 0
	self._source_attacker_unit_data = {}

	self:_create_aoe_damage_buffer()
end

local LIQUID_EXTENSIONS = {
	"DamageBlobExtension",
	"DamageWaveExtension",
	"LiquidAreaDamageExtension",
}

AreaDamageSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = AreaDamageSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)

	if table.contains(LIQUID_EXTENSIONS, extension_name) then
		local num_liquid_extensions = self.num_liquid_extensions
		local new_index = num_liquid_extensions + 1

		self.liquid_extensions[new_index] = extension
		self.liquid_extension_indexes[extension] = new_index
		self.num_liquid_extensions = new_index
	end

	local source_attacker = extension_init_data.source_attacker_unit

	if source_attacker then
		local data = {
			source_attacker_unit = source_attacker,
			breed = Unit.get_data(source_attacker, "breed"),
		}

		self._source_attacker_unit_data[unit] = data

		local player = Managers.player:owner(source_attacker)

		if player then
			data.attacker_unique_id = player:unique_id()
			data.attacker_side = Managers.state.side.side_by_unit[source_attacker]
		end
	end

	if extension.is_transient and self.is_server then
		Managers.level_transition_handler.transient_package_loader:add_unit(unit, extension.transient_name_override)
	end

	return extension
end

AreaDamageSystem.has_source_attacker_unit_data = function (self, unit)
	return self._source_attacker_unit_data[unit]
end

AreaDamageSystem.on_remove_extension = function (self, unit, extension_name)
	local extension = ScriptUnit.extension(unit, "area_damage_system")
	local liquid_extension_indexes = self.liquid_extension_indexes
	local extension_index = liquid_extension_indexes[extension]

	if extension_index then
		local liquid_extensions = self.liquid_extensions
		local num_liquid_extensions = self.num_liquid_extensions
		local last_extension = liquid_extensions[num_liquid_extensions]

		liquid_extensions[extension_index] = last_extension
		liquid_extensions[num_liquid_extensions] = nil
		liquid_extension_indexes[last_extension] = extension_index
		liquid_extension_indexes[extension] = nil
		self.num_liquid_extensions = num_liquid_extensions - 1
	end

	self._source_attacker_unit_data[unit] = nil

	if extension.is_transient and self.is_server then
		Managers.level_transition_handler.transient_package_loader:remove_unit(unit)
	end

	AreaDamageSystem.super.on_remove_extension(self, unit, extension_name)
end

AreaDamageSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)
end

AreaDamageSystem.update = function (self, context, t)
	AreaDamageSystem.super.update(self, context, t)
	self:_update_aoe_damage_buffer()
end

AreaDamageSystem.create_explosion = function (self, attacker_unit, position, rotation, explosion_template_name, scale, damage_source, attacker_power_level, is_critical_strike, source_attacker_unit)
	if not NetworkUtils.network_safe_position(position) then
		return false
	end

	local network_manager = Managers.state.network
	local game = network_manager:game()

	if game then
		local original_template = ExplosionUtils.get_template(explosion_template_name)
		local explosion_template = table.clone(original_template)
		local difficulty_name = Managers.state.difficulty:get_difficulty()

		if explosion_template.scaling then
			explosion_template.explosion.radius = explosion_template.explosion.radius[difficulty_name]
		end

		local is_husk = false

		DamageUtils.create_explosion(self.world, attacker_unit, position, rotation, explosion_template, scale, damage_source, self.is_server, is_husk, attacker_unit, attacker_power_level, is_critical_strike)

		if unit_alive(attacker_unit) then
			local attacker_unit_id, attacker_is_level_unit = network_manager:game_object_or_level_id(attacker_unit)

			if attacker_unit_id then
				local explosion_template_id = NetworkLookup.explosion_templates[explosion_template_name]
				local damage_source_id = NetworkLookup.damage_sources[damage_source]
				local attacker_power_level = attacker_power_level and math.clamp(attacker_power_level, MIN_POWER_LEVEL, MAX_POWER_LEVEL) or 0
				local is_critical_strike = not not is_critical_strike
				local source_attacker_unit_id = network_manager:unit_game_object_id(source_attacker_unit) or attacker_unit_id

				if self.is_server then
					self.network_transmit:send_rpc_clients("rpc_create_explosion", attacker_unit_id, attacker_is_level_unit, position, rotation, explosion_template_id, scale, damage_source_id, attacker_power_level, is_critical_strike, source_attacker_unit_id)
				else
					self.network_transmit:send_rpc_server("rpc_create_explosion", attacker_unit_id, attacker_is_level_unit, position, rotation, explosion_template_id, scale, damage_source_id, attacker_power_level, is_critical_strike, source_attacker_unit_id)
				end
			end
		end
	end
end

AreaDamageSystem.enable_area_damage = function (self, unit, enable)
	fassert(self.is_server, "You better call this on the server, or it's gonna craaash")

	local area_damage_extension = ScriptUnit.extension(unit, "area_damage_system")

	area_damage_extension:enable_area_damage(enable)

	local level_index = Managers.state.network:level_object_id(unit)

	self.network_transmit:send_rpc_clients("rpc_enable_area_damage", level_index, enable)
end

AreaDamageSystem.is_position_in_liquid = function (self, position, nav_cost_map_table)
	local liquid_extensions = self.liquid_extensions
	local num_liquid_extensions = self.num_liquid_extensions
	local result = false

	for i = 1, num_liquid_extensions do
		local extension = liquid_extensions[i]

		result = extension:is_position_inside(position, nav_cost_map_table)

		if result then
			break
		end
	end

	return result
end

AreaDamageSystem._create_aoe_damage_buffer = function (self)
	local buffer_size = AOE_DAMAGE_RING_BUFFER_SIZE

	self._aoe_damage_ring_buffer = {
		read_index = 1,
		size = 0,
		write_index = 1,
		buffer = Script.new_array(buffer_size),
		max_size = buffer_size,
	}

	for index = 1, buffer_size do
		self._aoe_damage_ring_buffer.buffer[index] = {
			actual_power_level = 0,
			damage_source = "n/a",
			do_damage = false,
			explosion_template_name = "n/a",
			full_power_level = 0,
			hit_distance = 0,
			hit_zone_name = "n/a",
			max_damage_radius = 0,
			push_speed = 0,
			radius = 0,
			radius_max = 0,
			radius_min = 0,
			shield_blocked = false,
			impact_position = Vector3Box(),
			hit_direction = Vector3Box(),
		}
	end
end

AreaDamageSystem.add_aoe_damage_target = function (self, hit_unit, attacker_unit, impact_position, shield_blocked, do_damage, hit_zone_name, damage_source, hit_distance, push_speed, radius, max_damage_radius, radius_min, radius_max, full_power_level, actual_power_level, hit_direction, explosion_template_name, is_critical_strike, allow_critical_proc, source_attacker_unit, target_number)
	local aoe_damage_ring_buffer = self._aoe_damage_ring_buffer
	local buffer = aoe_damage_ring_buffer.buffer
	local read_index = aoe_damage_ring_buffer.read_index
	local write_index = aoe_damage_ring_buffer.write_index
	local size = aoe_damage_ring_buffer.size
	local max_size = aoe_damage_ring_buffer.max_size

	if max_size < size + 1 then
		local aoe_damage_data = buffer[read_index]

		self:_damage_unit(aoe_damage_data)

		size = size - 1
		aoe_damage_ring_buffer.read_index = read_index % max_size + 1
	end

	local aoe_damage_data = buffer[write_index]

	aoe_damage_data.hit_unit = hit_unit
	aoe_damage_data.attacker_unit = attacker_unit
	aoe_damage_data.source_attacker_unit = source_attacker_unit

	aoe_damage_data.impact_position:store(impact_position)

	aoe_damage_data.shield_blocked = shield_blocked
	aoe_damage_data.do_damage = do_damage
	aoe_damage_data.hit_zone_name = hit_zone_name
	aoe_damage_data.damage_source = damage_source
	aoe_damage_data.hit_distance = hit_distance
	aoe_damage_data.push_speed = push_speed
	aoe_damage_data.radius = radius
	aoe_damage_data.max_damage_radius = max_damage_radius
	aoe_damage_data.radius_min = radius_min
	aoe_damage_data.radius_max = radius_max
	aoe_damage_data.full_power_level = full_power_level
	aoe_damage_data.actual_power_level = actual_power_level

	aoe_damage_data.hit_direction:store(hit_direction)

	aoe_damage_data.explosion_template_name = explosion_template_name
	aoe_damage_data.is_critical_strike = is_critical_strike
	aoe_damage_data.allow_critical_proc = allow_critical_proc
	aoe_damage_data.target_number = target_number
	size = size + 1
	aoe_damage_ring_buffer.size = size
	aoe_damage_ring_buffer.write_index = write_index % max_size + 1
end

AreaDamageSystem._update_aoe_damage_buffer = function (self)
	local aoe_damage_ring_buffer = self._aoe_damage_ring_buffer

	if aoe_damage_ring_buffer.size == 0 then
		return
	end

	local buffer = aoe_damage_ring_buffer.buffer
	local read_index = aoe_damage_ring_buffer.read_index
	local max_size = aoe_damage_ring_buffer.max_size
	local num_updates = math.min(NUM_UNITS_TO_DAMAGE_PER_FRAME, aoe_damage_ring_buffer.size)

	for i = 1, num_updates do
		local aoe_damage_data = buffer[read_index]

		self:_damage_unit(aoe_damage_data)

		read_index = read_index % max_size + 1
		aoe_damage_ring_buffer.size = aoe_damage_ring_buffer.size - 1
	end

	aoe_damage_ring_buffer.read_index = read_index
end

AreaDamageSystem._damage_unit = function (self, aoe_damage_data)
	local hit_unit = aoe_damage_data.hit_unit
	local attacker_unit = aoe_damage_data.attacker_unit
	local source_attacker_unit = aoe_damage_data.source_attacker_unit
	local impact_position = aoe_damage_data.impact_position:unbox()
	local shield_blocked = aoe_damage_data.shield_blocked
	local do_damage = aoe_damage_data.do_damage
	local hit_zone_name = aoe_damage_data.hit_zone_name
	local damage_source = aoe_damage_data.damage_source
	local hit_distance = aoe_damage_data.hit_distance
	local push_speed = aoe_damage_data.push_speed
	local radius = aoe_damage_data.radius
	local max_damage_radius = aoe_damage_data.max_damage_radius
	local radius_min = aoe_damage_data.radius_min
	local radius_max = aoe_damage_data.radius_max
	local full_power_level = aoe_damage_data.full_power_level
	local actual_power_level = aoe_damage_data.actual_power_level
	local hit_direction = aoe_damage_data.hit_direction:unbox()
	local explosion_template_name = aoe_damage_data.explosion_template_name
	local is_critical_strike = aoe_damage_data.is_critical_strike
	local allow_critical_proc = aoe_damage_data.allow_critical_proc
	local target_number = aoe_damage_data.target_number
	local hit_unit_alive = unit_alive(hit_unit)

	if not hit_unit_alive then
		return
	end

	local attacker_unit_alive = unit_alive(attacker_unit)

	if not attacker_unit_alive then
		return
	end

	local explosion_template = ExplosionUtils.get_template(explosion_template_name)
	local explosion_data = explosion_template.explosion
	local breed = AiUtils.unit_breed(hit_unit)
	local breed_immunity = breed and explosion_data.immune_breeds and (explosion_data.immune_breeds[breed.name] or explosion_data.immune_breeds.all)
	local bot = Managers.player:owner(hit_unit) and not Managers.player:owner(hit_unit):is_player_controlled()
	local bot_damage_immunity = bot and explosion_data.bot_damage_immunity or false
	local is_immune = breed_immunity or bot_damage_immunity

	if shield_blocked then
		hit_distance = math.lerp(hit_distance, radius, 0.5)
	end

	local glancing_hit = max_damage_radius < hit_distance
	local attacker_player = Managers.player:owner(attacker_unit)
	local attacker_is_player = attacker_player ~= nil

	if attacker_is_player then
		local item_data = rawget(ItemMasterList, damage_source)

		if breed and item_data and not IGNORED_ITEM_TYPES_FOR_BUFFS[item_data.item_type] then
			local attack_type = "aoe"

			if item_data and item_data.item_type == "grenade" then
				attack_type = "grenade"
			end

			if not explosion_template.ignore_buffs then
				local send_to_server = false

				if attacker_player and attacker_player.remote then
					local peer_id = attacker_player.peer_id
					local attack_type_id = NetworkLookup.buff_attack_types[attack_type]
					local network_manager = Managers.state.network
					local attacker_unit_id = network_manager:unit_game_object_id(attacker_unit)
					local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
					local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
					local buff_weapon_type_id = NetworkLookup.buff_weapon_types["n/a"]
					local damage_source_id = NetworkLookup.damage_sources[damage_source]
					local channel_id = PEER_ID_TO_CHANNEL[peer_id]

					RPC.rpc_buff_on_attack(channel_id, attacker_unit_id, hit_unit_id, attack_type_id, is_critical_strike and allow_critical_proc or false, hit_zone_id, 1, buff_weapon_type_id, damage_source_id)
					DamageUtils.buff_on_attack(attacker_unit, hit_unit, attack_type, is_critical_strike and allow_critical_proc, hit_zone_name, target_number, send_to_server, "n/a", nil, damage_source)
				elseif attacker_player then
					DamageUtils.buff_on_attack(attacker_unit, hit_unit, attack_type, is_critical_strike and allow_critical_proc, hit_zone_name, target_number, send_to_server, "n/a", nil, damage_source)
				end
			end

			if not explosion_template.no_aggro and not breed.cannot_be_aggroed then
				AiUtils.aggro_unit_of_enemy(hit_unit, attacker_unit)
			end
		end
	end

	if not is_immune then
		local blocking = false
		local blackboard = BLACKBOARDS[hit_unit]
		local player = Managers.player:owner(hit_unit)
		local is_bot = player and not player:is_player_controlled()

		if blackboard and radius < hit_distance and blackboard.shield_user then
			local stagger = blackboard.stagger

			blocking = not stagger or stagger < 1
		end

		local hit_ragdoll_actor

		if not blocking and breed and breed.hitbox_ragdoll_translation then
			hit_ragdoll_actor = breed.hitbox_ragdoll_translation.j_spine or breed.hitbox_ragdoll_translation.j_spine1
		end

		local bot_damage_profile_name = is_bot and explosion_data.bot_damage_profile
		local damage_profile_name = bot_damage_profile_name or glancing_hit and explosion_data.damage_profile_glance or explosion_data.damage_profile or "default"

		if not do_damage or is_immune then
			damage_profile_name = damage_profile_name .. "_no_damage"
		end

		local t = Managers.time:time("game")
		local damage_profile = DamageProfileTemplates[damage_profile_name]
		local target_index = target_number
		local boost_curve_multiplier = 0
		local backstab_multiplier = 1

		is_critical_strike = false

		local added_dot
		local first_hit = false
		local total_hits = 0

		DamageUtils.add_damage_network_player(damage_profile, target_index, actual_power_level, hit_unit, attacker_unit, hit_zone_name, impact_position, hit_direction, damage_source, hit_ragdoll_actor, boost_curve_multiplier, is_critical_strike, added_dot, first_hit, total_hits, backstab_multiplier, source_attacker_unit)

		local target_alive = HEALTH_ALIVE[hit_unit]

		if target_alive then
			DamageUtils.stagger_ai(t, damage_profile, target_index, actual_power_level, hit_unit, attacker_unit, hit_zone_name, hit_direction, boost_curve_multiplier, is_critical_strike, shield_blocked, damage_source, source_attacker_unit)
		elseif explosion_data.on_death_func then
			explosion_data.on_death_func(hit_unit)
		end

		DamageUtils.apply_dot(damage_profile, target_index, full_power_level, hit_unit, attacker_unit, hit_zone_name, damage_source, boost_curve_multiplier, is_critical_strike, explosion_data, source_attacker_unit)

		if push_speed and DamageUtils.is_player_unit(hit_unit) then
			local status_extension = ScriptUnit.extension(hit_unit, "status_system")

			if not status_extension:is_disabled() then
				local locomotion_system = ScriptUnit.extension(hit_unit, "locomotion_system")

				locomotion_system:add_external_velocity(hit_direction * push_speed)
			end
		end
	end
end

AreaDamageSystem.rpc_area_damage = function (self, channel_id, go_id, position)
	local unit = self.unit_storage:unit(go_id)

	if unit then
		Unit.set_local_position(unit, 0, position)

		local area_damage_extension = ScriptUnit.extension(unit, "area_damage_system")

		area_damage_extension:start_area_damage()
	end
end

AreaDamageSystem.rpc_create_explosion = function (self, channel_id, attacker_unit_id, attacker_is_level_unit, position, rotation, explosion_template_name_id, scale, damage_source_id, attacker_power_level, is_critical_strike, source_attacker_unit_id)
	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_create_explosion", peer_id, attacker_unit_id, attacker_is_level_unit, position, rotation, explosion_template_name_id, scale, damage_source_id, attacker_power_level or 0, is_critical_strike, source_attacker_unit_id)
	end

	local attacker_unit

	if attacker_is_level_unit then
		attacker_unit = LevelHelper:unit_by_index(self.world, attacker_unit_id)
	else
		attacker_unit = self.unit_storage:unit(attacker_unit_id)
	end

	local source_attacker_unit = self.unit_storage:unit(source_attacker_unit_id)
	local explosion_template_name = NetworkLookup.explosion_templates[explosion_template_name_id]
	local explosion_template = ExplosionUtils.get_template(explosion_template_name)
	local damage_source = NetworkLookup.damage_sources[damage_source_id]
	local is_husk = true

	DamageUtils.create_explosion(self.world, attacker_unit, position, rotation, explosion_template, scale, damage_source, self.is_server, is_husk, attacker_unit, attacker_power_level, is_critical_strike, source_attacker_unit)
end

AreaDamageSystem.rpc_enable_area_damage = function (self, channel_id, level_index, enable)
	local unit = Managers.state.network:game_object_or_level_unit(level_index, true)
	local area_damage_extension = ScriptUnit.extension(unit, "area_damage_system")

	area_damage_extension:enable(enable)
end

AreaDamageSystem.rpc_create_liquid_damage_area = function (self, channel_id, source_unit_go_id, position, flow_direction, liquid_template_id)
	fassert(self.is_server, "Error! Only the server should create Liquid Damage Areas!")

	local source_unit = self.unit_storage:unit(source_unit_go_id)
	local liquid_template = NetworkLookup.liquid_area_damage_templates[liquid_template_id]
	local extension_init_data = {
		area_damage_system = {
			flow_dir = flow_direction,
			liquid_template = liquid_template,
			source_unit = source_unit,
		},
	}
	local aoe_unit_name = "units/hub_elements/empty"
	local liquid_aoe_unit = Managers.state.unit_spawner:spawn_network_unit(aoe_unit_name, "liquid_aoe_unit", extension_init_data, position)
	local liquid_area_damage_extension = ScriptUnit.extension(liquid_aoe_unit, "area_damage_system")

	liquid_area_damage_extension:ready()
end

AreaDamageSystem.rpc_add_liquid_damage_blob = function (self, channel_id, liquid_unit_id, blob_id, position, is_filled)
	local unit = self.unit_storage:unit(liquid_unit_id)

	if unit then
		local liquid_area_damage_extension = ScriptUnit.extension(unit, "area_damage_system")

		liquid_area_damage_extension:add_damage_blob(blob_id, position, is_filled)
	end
end

AreaDamageSystem.rpc_update_liquid_damage_blob = function (self, channel_id, liquid_unit_id, blob_id, state)
	local unit = self.unit_storage:unit(liquid_unit_id)

	if not unit then
		return
	end

	local liquid_area_damage_extension = ScriptUnit.extension(unit, "area_damage_system")

	state = NetworkLookup.liquid_damage_blob_states[state]

	if state == "filled" then
		liquid_area_damage_extension:set_damage_blob_filled(blob_id)
	elseif state == "remove" then
		liquid_area_damage_extension:remove_damage_blob(blob_id)
	elseif state == "destroy" then
		liquid_area_damage_extension:destroy(blob_id)
	end
end

AreaDamageSystem.rpc_damage_wave_set_state = function (self, channel_id, unit_id, state)
	local unit = self.unit_storage:unit(unit_id)

	if not unit then
		return
	end

	local damage_wave_extension = ScriptUnit.extension(unit, "area_damage_system")

	state = NetworkLookup.damage_wave_states[state]

	if state == "impact" then
		damage_wave_extension:on_wavefront_impact(unit)
	elseif state == "running" then
		damage_wave_extension:set_running_wave(unit)
	elseif state == "arrived" then
		damage_wave_extension:set_wave_arrived(unit)
	elseif state == "hide" then
		damage_wave_extension:hide_wave(unit)
	end
end

AreaDamageSystem._create_damage_wave = function (self, source_unit, position, damage_wave_template, unit_name, optional_extension_init_data)
	fassert(self.is_server, "Error! Only the server should create Damage Waves!")

	unit_name = unit_name or "units/hub_elements/empty"

	local extension_init_data = optional_extension_init_data or {}
	local area_system_data = extension_init_data.area_damage_system or {}

	area_system_data.damage_wave_template_name = damage_wave_template
	area_system_data.source_unit = source_unit
	extension_init_data.area_damage_system = area_system_data

	local damage_wave_unit = Managers.state.unit_spawner:spawn_network_unit(unit_name, "damage_wave_unit", extension_init_data, position)
	local damage_wave_extension = ScriptUnit.extension(damage_wave_unit, "area_damage_system")

	return damage_wave_extension
end

AreaDamageSystem.rpc_create_damage_wave = function (self, channel_id, source_unit_go_id, position, optional_target_position, damage_wave_template_id)
	fassert(self.is_server, "Error! Only the server should create Damage Waves!")

	local unit_name = "units/hub_elements/empty"
	local source_unit = self.unit_storage:unit(source_unit_go_id)
	local damage_wave_template = NetworkLookup.damage_wave_templates[damage_wave_template_id]
	local damage_wave_extension = self:_create_damage_wave(source_unit, position, damage_wave_template, unit_name)

	damage_wave_extension:launch_wave(nil, optional_target_position)
end

AreaDamageSystem.rpc_create_thornsister_push_wave = function (self, channel_id, source_unit_go_id, position, optional_target_position, damage_wave_template_id, power_level, segments, wall_index)
	fassert(self.is_server, "Error! Only the server should create thornsister push waves!")

	local unit_name = "units/hub_elements/empty"
	local source_unit = self.unit_storage:unit(source_unit_go_id)
	local damage_wave_template = NetworkLookup.damage_wave_templates[damage_wave_template_id]
	local damage_wave_extension = self:_create_damage_wave(source_unit, position, damage_wave_template)
	local segment_positions = {}

	for i = 1, #segments do
		segment_positions[i] = Vector3Box(segments[i])
	end

	local optional_data = {
		power_level = power_level,
		boxed_wall_segments = segment_positions,
		wall_index = wall_index,
	}

	damage_wave_extension:launch_wave(nil, optional_target_position, optional_data)
end

AreaDamageSystem.rpc_necromancer_create_curse_weave = function (self, channel_id, source_unit_id, position, wave_direction, num_instances)
	local source_unit = self.unit_storage:unit(source_unit_id)

	if not source_unit then
		return
	end

	local unit_name = "units/hub_elements/empty"
	local damage_wave_template = "necromancer_curse_wave"
	local talent_extension = ScriptUnit.has_extension(source_unit, "talent_system")

	if talent_extension and talent_extension:has_talent("sienna_necromancer_6_3") then
		damage_wave_template = "necromancer_curse_wave_linger"
	end

	local wave_template = DamageWaveTemplates.templates[damage_wave_template]
	local extension_init_data = {
		area_damage_system = {
			player_units_inside = {},
			ai_hit_by_wavefront = {},
		},
	}
	local num_waves = wave_template.num_waves
	local spawn_separation_dist = wave_template.spawn_separation_dist
	local target_separation_dist = wave_template.target_separation_dist
	local wave_distance = (wave_template.max_speed + wave_template.start_speed * 0.5) * wave_template.time_of_life
	local talent_extension = ScriptUnit.extension(source_unit, "talent_system")
	local has_circle_talent = false

	if has_circle_talent then
		local step = 2 * math.pi / num_waves

		for i = 0, num_waves - 1 do
			local angle = i * step
			local direction = Quaternion.rotate(Quaternion.axis_angle(Vector3.up(), angle), wave_direction)
			local spawn_position = position + direction * spawn_separation_dist
			local target_position = position + direction * wave_distance
			local damage_wave_extension = self:_create_damage_wave(source_unit, spawn_position, damage_wave_template, unit_name, extension_init_data)

			damage_wave_extension:launch_wave(nil, target_position)
		end
	else
		local rotation = Quaternion.look(wave_direction, Vector3.up())
		local right = Quaternion.right(rotation)

		for i = -(num_waves * 0.5) + 0.5, num_waves * 0.5 - 0.5 do
			local spawn_position = position + right * i * spawn_separation_dist
			local target_position = position + right * i * target_separation_dist + wave_direction * wave_distance

			if script_data.debug_necromancer_curse_wave then
				QuickDrawerStay:sphere(spawn_position, 0.5, Colors.get("yellow"))
				QuickDrawerStay:sphere(target_position, 0.5, Colors.get("green"))
			end

			local damage_wave_extension = self:_create_damage_wave(source_unit, spawn_position, damage_wave_template, unit_name, extension_init_data)

			damage_wave_extension:launch_wave(nil, target_position)
		end
	end
end

AreaDamageSystem.rpc_necromancer_create_curse_area = function (self, channel_id, source_unit_id, position, wave_direction, num_instances)
	local source_unit = self.unit_storage:unit(source_unit_id)

	if not source_unit then
		return
	end

	local world = self.world
	local owner_unit = self.unit_storage:unit(source_unit_id)
	local explosion_template = ExplosionUtils.get_template("sienna_necromancer_curse_area")

	if explosion_template.explosion then
		local is_husk = true
		local is_server = Managers.state.network.is_server

		DamageUtils.create_explosion(world, owner_unit, position, Quaternion.identity(), explosion_template, 1, "career_ability", is_server, is_husk, source_unit, false, nil, source_unit)
	end

	if explosion_template.aoe then
		DamageUtils.create_aoe(world, owner_unit, position, "career_ability", explosion_template)
	end
end

AreaDamageSystem.rpc_add_damage_wave_fx = function (self, channel_id, damage_wave_unit_id, position, rotation, fx_idx, name_index)
	local unit = self.unit_storage:unit(damage_wave_unit_id)

	if unit then
		local damage_wave_extension = ScriptUnit.extension(unit, "area_damage_system")

		damage_wave_extension:add_damage_wave_fx(position, rotation, fx_idx, name_index)
	end
end

AreaDamageSystem.rpc_add_damage_blob_fx = function (self, channel_id, damage_blob_unit_id, position, life_time_percentage)
	local unit = self.unit_storage:unit(damage_blob_unit_id)

	if unit then
		local damage_blob_extension = ScriptUnit.extension(unit, "area_damage_system")

		damage_blob_extension:add_damage_blob_fx(position, life_time_percentage)
	end
end

AreaDamageSystem.rpc_abort_damage_blob = function (self, channel_id, damage_blob_unit_id)
	local unit = self.unit_storage:unit(damage_blob_unit_id)

	if unit then
		if self.is_server then
			local peer_id = CHANNEL_TO_PEER_ID[channel_id]

			self.network_transmit:send_rpc_clients_except("rpc_abort_damage_blob", peer_id, damage_blob_unit_id)
		end

		local damage_blob_extension = ScriptUnit.extension(unit, "area_damage_system")

		damage_blob_extension:abort()
	end
end
