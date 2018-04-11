AreaDamageSystem = class(AreaDamageSystem, ExtensionSystemBase)
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
	"rpc_create_damage_wave"
}
local extensions = {
	"AreaDamageExtension",
	"LiquidAreaDamageExtension",
	"LiquidAreaDamageHuskExtension",
	"DamageWaveExtension",
	"DamageWaveHuskExtension",
	"DamageBlobExtension",
	"DamageBlobHuskExtension"
}
AreaDamageSystem.init = function (self, entity_system_creation_context, system_name)
	AreaDamageSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	self.liquid_extensions = {}
	self.liquid_extension_indexes = {}
	self.num_liquid_extensions = 0

	return 
end
local LIQUID_EXTENSIONS = {
	"DamageBlobExtension",
	"DamageWaveExtension",
	"LiquidAreaDamageExtension"
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

	return extension
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

	AreaDamageSystem.super.on_remove_extension(self, unit, extension_name)

	return 
end
AreaDamageSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	return 
end
AreaDamageSystem.create_explosion = function (self, attacker_unit, position, rotation, explosion_template_name, scale, damage_source, attacker_power_level)
	if not NetworkUtils.network_safe_position(position) then
		return false
	end

	local explosion_template = ExplosionTemplates[explosion_template_name]
	local is_husk = false

	DamageUtils.create_explosion(self.world, attacker_unit, position, rotation, explosion_template, scale, damage_source, self.is_server, is_husk, attacker_unit, attacker_power_level)

	local network_manager = Managers.state.network
	local attacker_unit_id, attacker_is_level_unit = network_manager.game_object_or_level_id(network_manager, attacker_unit)
	local explosion_template_id = NetworkLookup.explosion_templates[explosion_template_name]
	local damage_source_id = NetworkLookup.damage_sources[damage_source]
	local game = network_manager.game(network_manager)

	if game then
		if self.is_server then
			network_manager.network_transmit:send_rpc_clients("rpc_create_explosion", attacker_unit_id, attacker_is_level_unit, position, rotation, explosion_template_id, scale, damage_source_id, attacker_power_level or 0)
		else
			network_manager.network_transmit:send_rpc_server("rpc_create_explosion", attacker_unit_id, attacker_is_level_unit, position, rotation, explosion_template_id, scale, damage_source_id, attacker_power_level or 0)
		end
	end

	return 
end
AreaDamageSystem.enable_area_damage = function (self, unit, enable)
	fassert(self.is_server, "You better call this on the server, or it's gonna craaash")

	local area_damage_extension = ScriptUnit.extension(unit, "area_damage_system")

	area_damage_extension.enable(area_damage_extension, enable)

	local level_index = Managers.state.network:level_object_id(unit)

	self.network_transmit:send_rpc_clients("rpc_enable_area_damage", level_index, enable)

	return 
end
AreaDamageSystem.is_position_in_liquid = function (self, position, nav_cost_map_table)
	Profiler.start("AreaDamageSystem:is_position_in_liquid")

	local liquid_extensions = self.liquid_extensions
	local num_liquid_extensions = self.num_liquid_extensions
	local result = false

	for i = 1, num_liquid_extensions, 1 do
		local extension = liquid_extensions[i]
		result = extension.is_position_inside(extension, position, nav_cost_map_table)

		if result then
			break
		end
	end

	Profiler.stop("AreaDamageSystem:is_position_in_liquid")

	return result
end
AreaDamageSystem.rpc_area_damage = function (self, sender, go_id, position)
	local unit = self.unit_storage:unit(go_id)
	local area_damage_system = ScriptUnit.extension(unit, "area_damage_system")

	if area_damage_system then
		area_damage_system.start(area_damage_system)
	end

	return 
end
AreaDamageSystem.rpc_create_explosion = function (self, sender, attacker_unit_id, attacker_is_level_unit, position, rotation, explosion_template_name_id, scale, damage_source_id, attacker_power_level)
	if self.is_server then
		self.network_transmit:send_rpc_clients_except("rpc_create_explosion", sender, attacker_unit_id, attacker_is_level_unit, position, rotation, explosion_template_name_id, scale, damage_source_id, attacker_power_level or 0)
	end

	local attacker_unit = nil

	if attacker_is_level_unit then
		attacker_unit = LevelHelper:unit_by_index(self.world, attacker_unit_id)
	else
		attacker_unit = self.unit_storage:unit(attacker_unit_id)
	end

	local explosion_template_name = NetworkLookup.explosion_templates[explosion_template_name_id]
	local explosion_template = ExplosionTemplates[explosion_template_name]
	local damage_source = NetworkLookup.damage_sources[damage_source_id]
	local is_husk = true

	DamageUtils.create_explosion(self.world, attacker_unit, position, rotation, explosion_template, scale, damage_source, self.is_server, is_husk, attacker_unit, attacker_power_level)

	return 
end
AreaDamageSystem.rpc_enable_area_damage = function (self, sender, level_index, enable)
	local unit = Managers.state.network:game_object_or_level_unit(level_index, true)
	local area_damage_extension = ScriptUnit.extension(unit, "area_damage_system")

	area_damage_extension.enable(area_damage_extension, enable)

	return 
end
AreaDamageSystem.rpc_create_liquid_damage_area = function (self, sender, source_unit_go_id, position, flow_direction, liquid_template_id)
	fassert(self.is_server, "Error! Only the server should create Liquid Damage Areas!")

	local source_unit = self.unit_storage:unit(source_unit_go_id)
	local liquid_template = NetworkLookup.liquid_area_damage_templates[liquid_template_id]
	local extension_init_data = {
		area_damage_system = {
			flow_dir = flow_direction,
			liquid_template = liquid_template,
			source_unit = source_unit
		}
	}
	local aoe_unit_name = "units/weapons/projectile/poison_wind_globe/poison_wind_globe"
	local liquid_aoe_unit = Managers.state.unit_spawner:spawn_network_unit(aoe_unit_name, "liquid_aoe_unit", extension_init_data, position)
	local liquid_area_damage_extension = ScriptUnit.extension(liquid_aoe_unit, "area_damage_system")

	liquid_area_damage_extension.ready(liquid_area_damage_extension)

	return 
end
AreaDamageSystem.rpc_add_liquid_damage_blob = function (self, sender, liquid_unit_id, blob_id, position, is_filled)
	local unit = self.unit_storage:unit(liquid_unit_id)

	if unit then
		local liquid_area_damage_extension = ScriptUnit.extension(unit, "area_damage_system")

		liquid_area_damage_extension.add_damage_blob(liquid_area_damage_extension, blob_id, position, is_filled)
	end

	return 
end
AreaDamageSystem.rpc_update_liquid_damage_blob = function (self, sender, liquid_unit_id, blob_id, state)
	local unit = self.unit_storage:unit(liquid_unit_id)

	if not unit then
		return 
	end

	local liquid_area_damage_extension = ScriptUnit.extension(unit, "area_damage_system")
	local state = NetworkLookup.liquid_damage_blob_states[state]

	if state == "filled" then
		liquid_area_damage_extension.set_damage_blob_filled(liquid_area_damage_extension, blob_id)
	elseif state == "remove" then
		liquid_area_damage_extension.remove_damage_blob(liquid_area_damage_extension, blob_id)
	elseif state == "destroy" then
		liquid_area_damage_extension.destroy(liquid_area_damage_extension, blob_id)
	end

	return 
end
AreaDamageSystem.rpc_damage_wave_set_state = function (self, sender, unit_id, state)
	local unit = self.unit_storage:unit(unit_id)

	if not unit then
		return 
	end

	local damage_wave_extension = ScriptUnit.extension(unit, "area_damage_system")
	local state = NetworkLookup.damage_wave_states[state]

	if state == "impact" then
		damage_wave_extension.on_wavefront_impact(damage_wave_extension, unit)
	elseif state == "running" then
		damage_wave_extension.set_running_wave(damage_wave_extension, unit)
	elseif state == "arrived" then
		damage_wave_extension.set_wave_arrived(damage_wave_extension, unit)
	elseif state == "hide" then
		damage_wave_extension.hide_wave(damage_wave_extension, unit)
	end

	return 
end
AreaDamageSystem.rpc_create_damage_wave = function (self, sender, source_unit_go_id, position, optional_target_position, damage_wave_template_id)
	fassert(self.is_server, "Error! Only the server should create Damage Waves!")

	local source_unit = self.unit_storage:unit(source_unit_go_id)
	local damage_wave_template = NetworkLookup.damage_wave_templates[damage_wave_template_id]
	local extension_init_data = {
		area_damage_system = {
			damage_wave_template_name = damage_wave_template,
			source_unit = source_unit
		}
	}
	local unit_name = "units/hub_elements/empty"
	local damage_wave_unit = Managers.state.unit_spawner:spawn_network_unit(unit_name, "damage_wave_unit", extension_init_data, position)
	local damage_wave_extension = ScriptUnit.extension(damage_wave_unit, "area_damage_system")

	damage_wave_extension.launch_wave(damage_wave_extension, nil, optional_target_position)

	return 
end
AreaDamageSystem.rpc_add_damage_wave_fx = function (self, sender, damage_wave_unit_id, position)
	local unit = self.unit_storage:unit(damage_wave_unit_id)

	if unit then
		local damage_wave_extension = ScriptUnit.extension(unit, "area_damage_system")

		damage_wave_extension.add_damage_wave_fx(damage_wave_extension, position)
	end

	return 
end
AreaDamageSystem.rpc_add_damage_blob_fx = function (self, sender, damage_blob_unit_id, position, life_time_percentage)
	local unit = self.unit_storage:unit(damage_blob_unit_id)

	if unit then
		local damage_blob_extension = ScriptUnit.extension(unit, "area_damage_system")

		damage_blob_extension.add_damage_blob_fx(damage_blob_extension, position, life_time_percentage)
	end

	return 
end
AreaDamageSystem.rpc_abort_damage_blob = function (self, sender, damage_blob_unit_id)
	local unit = self.unit_storage:unit(damage_blob_unit_id)

	if unit then
		local damage_blob_extension = ScriptUnit.extension(unit, "area_damage_system")

		damage_blob_extension.abort(damage_blob_extension)
	end

	return 
end

return 
