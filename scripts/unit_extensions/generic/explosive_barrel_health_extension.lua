ExplosiveBarrelHealthExtension = class(ExplosiveBarrelHealthExtension, GenericHealthExtension)

ExplosiveBarrelHealthExtension.init = function (self, extension_init_context, unit, extension_init_data)
	ExplosiveBarrelHealthExtension.super.init(self, extension_init_context, unit, extension_init_data)

	self.in_hand = extension_init_data.in_hand
	self.item_name = extension_init_data.item_name
	local data = extension_init_data.health_data

	if data then
		self.ignited = true
		self.explode_time = data.explode_time
		self.fuse_time = data.fuse_time
		local last_damage_data = self.last_damage_data
		last_damage_data.attacker_unit_id = data.attacker_unit_id
		self.insta_explode = not self.in_hand

		Unit.flow_event(unit, "exploding_barrel_fuse_init")
	end

	local owner_unit = extension_init_data.owner_unit

	if owner_unit then
		self.owner_unit = owner_unit
		self.owner_unit_health_extension = ScriptUnit.extension(owner_unit, "health_system")
		self.ignored_damage_types = extension_init_data.ignored_damage_types
	end
end

ExplosiveBarrelHealthExtension.update = function (self, dt, context, t)
	local owner_unit_health_extension = self.owner_unit_health_extension

	if owner_unit_health_extension then
		local recent_damages, num_damages = owner_unit_health_extension:recent_damages()

		for i = 1, num_damages / DamageDataIndex.STRIDE, 1 do
			local j = (i - 1) * DamageDataIndex.STRIDE
			local attacker_unit = recent_damages[j + DamageDataIndex.ATTACKER]
			local damage_amount = recent_damages[j + DamageDataIndex.DAMAGE_AMOUNT]
			local damage_type = recent_damages[j + DamageDataIndex.DAMAGE_TYPE]
			local source_attacker_unit = recent_damages[j + DamageDataIndex.SOURCE_ATTACKER_UNIT]
			local ignore_damage_type = self.ignored_damage_types[damage_type]

			if not ignore_damage_type then
				if damage_type == "heal" then
					self:add_heal(attacker_unit, -damage_amount, nil, "n/a")
				else
					local hit_zone_name = recent_damages[j + DamageDataIndex.HIT_ZONE]
					local hit_position = Vector3Aux.unbox(recent_damages[j + DamageDataIndex.POSITION])
					local damage_direction = Vector3Aux.unbox(recent_damages[j + DamageDataIndex.DIRECTION])
					local damage_source_name = recent_damages[j + DamageDataIndex.DAMAGE_SOURCE_NAME]

					self:add_damage(attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, nil, source_attacker_unit)
				end
			end
		end
	end

	if self.ignited and not self._dead and not self.exploded then
		local network_time = Managers.state.network:network_time()
		local fuse_time_left = self.explode_time - network_time
		local fuse_time_percent = fuse_time_left / self.fuse_time

		Unit.set_data(self.unit, "fuse_time_percent", fuse_time_percent)

		if self.explode_time <= network_time then
			self.insta_explode = true

			self:add_damage(self.unit, self.health, "full", "undefined", Unit.world_position(self.unit, 0), Vector3(0, 0, -1), nil, nil, self.last_attacker_unit)
		elseif not self.in_hand and not self.insta_explode and self.insta_explode_time <= network_time then
			self.insta_explode = true
		elseif not self.played_fuse_out and network_time >= self.explode_time - 1.2 then
			Unit.flow_event(self.unit, "exploding_barrel_fuse_out")

			self.played_fuse_out = true
		end
	end
end

ExplosiveBarrelHealthExtension.apply_client_predicted_damage = function (self, predicted_damage)
	return
end

ExplosiveBarrelHealthExtension.add_damage = function (self, attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, source_attacker_unit, hit_react_type, is_critical_strike, added_dot)
	if damage_type and (damage_type == "blade_storm" or damage_type == "life_tap") then
		return
	end

	self.last_attacker_unit = attacker_unit
	local did_damage = damage_amount > 0
	local unit = self.unit
	local network_manager = Managers.state.network
	local unit_id, is_level_unit = network_manager:game_object_or_level_id(unit)
	local damage_table = self:_add_to_damage_history_buffer(unit, attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, source_attacker_unit, hit_react_type, is_critical_strike)

	StatisticsUtil.register_damage(unit, damage_table, self.statistics_db)
	fassert(damage_type, "No damage_type!")

	self._recent_damage_type = damage_type
	self._recent_hit_react_type = hit_react_type

	self:save_kill_feed_data(attacker_unit, damage_table, hit_zone_name, damage_type, damage_source_name, source_attacker_unit)
	DamageUtils.handle_hit_indication(attacker_unit, unit, damage_amount, hit_zone_name, added_dot)

	if not self:get_is_invincible() and not self.dead then
		local internal_damage_amount = (did_damage and self.insta_explode and self.health) or 0
		self.damage = self.damage + internal_damage_amount

		if self:_should_die() and (self.is_server or not unit_id) then
			local death_system = Managers.state.entity:system("death_system")

			death_system:kill_unit(unit, damage_table)
		end
	end

	self:_sync_out_damage(attacker_unit, unit_id, is_level_unit, source_attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, hit_react_type, is_critical_strike, added_dot)

	if did_damage and not self.ignited then
		local network_time = Managers.state.network:network_time()
		local fuse_time = (Unit.has_data(unit, "fuse_time") and Unit.get_data(unit, "fuse_time")) or 4
		local insta_explode_time = network_time + 0.2
		local explode_time = network_time + fuse_time

		Unit.flow_event(unit, "exploding_barrel_fuse_init")

		self.fuse_time = fuse_time
		self.explode_time = explode_time
		self.ignited = true
		self.insta_explode_time = insta_explode_time
	elseif did_damage and self.ignited and self.insta_explode and not self.exploded then
		self.exploded = true

		if self.ignited and not self.played_fuse_out then
			Unit.flow_event(self.unit, "exploding_barrel_remove_fuse")
		end
	end
end

ExplosiveBarrelHealthExtension.health_data = function (self)
	local last_damage_data = self.last_damage_data
	local data = {
		fuse_time = self.fuse_time,
		explode_time = self.explode_time,
		attacker_unit_id = last_damage_data.attacker_unit_id
	}

	return data
end

return
