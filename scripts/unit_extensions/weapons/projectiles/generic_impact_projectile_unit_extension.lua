﻿-- chunkname: @scripts/unit_extensions/weapons/projectiles/generic_impact_projectile_unit_extension.lua

GenericImpactProjectileUnitExtension = class(GenericImpactProjectileUnitExtension)

GenericImpactProjectileUnitExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.world = extension_init_context.world
	self.unit = unit
	self.owner_unit = extension_init_data.owner_unit
	self.damage_source = extension_init_data.damage_source
	self.impact_template_name = extension_init_data.impact_template_name

	assert(self.impact_template_name)

	self.is_server = Managers.player.is_server
	self.network_manager = Managers.state.network
	self.explosion_template_name = extension_init_data.explosion_template_name

	Unit.flow_event(unit, "lua_projectile_init")
end

GenericImpactProjectileUnitExtension.extensions_ready = function (self, world, unit)
	self.locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
	self.impact_extension = ScriptUnit.has_extension(unit, "projectile_impact_system")
end

GenericImpactProjectileUnitExtension.destroy = function (self)
	Unit.flow_event(self.unit, "lua_projectile_end")
end

GenericImpactProjectileUnitExtension.update = function (self, unit, input, _, context, t)
	local impact_extension = self.impact_extension

	if not impact_extension then
		return
	end

	local recent_impacts, num_impacts = impact_extension:recent_impacts()

	if num_impacts == 0 then
		return
	end

	self:_execute_impact(recent_impacts, num_impacts, 1)

	if self.impact_template_name == "vfx_impact" then
		return
	end

	local UNIT = ProjectileImpactDataIndex.UNIT
	local POSITION = ProjectileImpactDataIndex.POSITION
	local DIRECTION = ProjectileImpactDataIndex.DIRECTION
	local NORMAL = ProjectileImpactDataIndex.NORMAL
	local ACTOR_INDEX = ProjectileImpactDataIndex.ACTOR_INDEX
	local STRIDE = ProjectileImpactDataIndex.STRIDE
	local network_manager = self.network_manager
	local self_unit_id = network_manager:unit_game_object_id(self.unit)
	local num_units_hits = num_impacts / STRIDE

	for i = 1, num_units_hits do
		local j = (i - 1) * STRIDE
		local unit = recent_impacts[j + UNIT]
		local position = recent_impacts[j + POSITION]:unbox()
		local direction = recent_impacts[j + DIRECTION]:unbox()
		local normal = recent_impacts[j + NORMAL]:unbox()
		local actor_index = recent_impacts[j + ACTOR_INDEX]
		local unit_id, is_level_unit = network_manager:game_object_or_level_id(unit)
		local game_object_id, level_unit_id

		if is_level_unit then
			game_object_id, level_unit_id = NetworkConstants.game_object_id_max, unit_id
		elseif unit_id then
			game_object_id, level_unit_id = unit_id, 0
		end

		if unit_id then
			if self.is_server then
				network_manager.network_transmit:send_rpc_clients("rpc_generic_impact_projectile_impact", self_unit_id, game_object_id, level_unit_id, position, direction, normal, actor_index, num_units_hits)
			else
				network_manager.network_transmit:send_rpc_server("rpc_generic_impact_projectile_impact", self_unit_id, game_object_id, level_unit_id, position, direction, normal, actor_index, num_units_hits)
			end
		end
	end
end

GenericImpactProjectileUnitExtension._execute_impact = function (self, recent_impacts, num_impacts, impact_counter)
	local impact = ProjectileTemplates.impact_templates[self.impact_template_name]
	local explosion_template = ExplosionUtils.get_template(self.explosion_template_name)
	local server_stop = false

	if self.is_server then
		server_stop = impact.server.execute(self.world, self.damage_source, self.unit, recent_impacts, num_impacts, self.owner_unit, explosion_template, impact_counter)
	end

	local client_stop = impact.client.execute(self.world, self.damage_source, self.unit, recent_impacts, num_impacts, self.owner_unit, explosion_template, impact_counter)

	if server_stop or client_stop then
		self.locomotion_extension:stop()
	end
end

local rpc_dummy_impact = {
	[ProjectileImpactDataIndex.POSITION] = Vector3Box(),
	[ProjectileImpactDataIndex.DIRECTION] = Vector3Box(),
	[ProjectileImpactDataIndex.NORMAL] = Vector3Box(),
}

GenericImpactProjectileUnitExtension.impact = function (self, unit, position, direction, normal, actor, impact_counter)
	rpc_dummy_impact[ProjectileImpactDataIndex.UNIT] = unit

	rpc_dummy_impact[ProjectileImpactDataIndex.POSITION]:store(position)
	rpc_dummy_impact[ProjectileImpactDataIndex.DIRECTION]:store(direction)
	rpc_dummy_impact[ProjectileImpactDataIndex.NORMAL]:store(normal)

	rpc_dummy_impact[ProjectileImpactDataIndex.ACTOR_INDEX] = actor

	self:_execute_impact(rpc_dummy_impact, ProjectileImpactDataIndex.STRIDE, impact_counter)
end

local dummy_impact = {}

GenericImpactProjectileUnitExtension.force_impact = function (self, unit, hit_position)
	local locomotion_extension = self.locomotion_extension

	dummy_impact[ProjectileImpactDataIndex.POSITION] = Vector3Box(hit_position)

	local impact = ProjectileTemplates.impact_templates[self.impact_template_name]
	local explosion_template = ExplosionUtils.get_template(self.explosion_template_name)
	local server_stop = false

	if self.is_server then
		server_stop = impact.server.execute(self.world, self.damage_source, unit, dummy_impact, 1, self.owner_unit, explosion_template)
	end

	local client_stop = impact.client.execute(self.world, self.damage_source, unit, dummy_impact, 1, self.owner_unit, explosion_template)

	if server_stop or client_stop then
		locomotion_extension:stop()
	end
end
