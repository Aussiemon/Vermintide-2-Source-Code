PlayerProjectileUnitExtension = class(PlayerProjectileUnitExtension)
local unit_world_rotation = Unit.world_rotation
local unit_world_position = Unit.world_position
local quaternion_forward = Quaternion.forward
local vector3_lerp = Vector3.lerp
local quaternion_lerp = Quaternion.lerp
local unit_set_local_position = Unit.set_local_position
local unit_set_local_rotation = Unit.set_local_rotation
local DELETION_GRACE_TIMER = 0.3

PlayerProjectileUnitExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local item_name = extension_init_data.item_name
	local owner_unit = extension_init_data.owner_unit
	self._world = extension_init_context.world
	self._wwise_world = Managers.world:wwise_world(self._world)
	self._projectile_unit = unit
	self._owner_unit = owner_unit
	self._owner_player = Managers.player:owner(owner_unit)
	local owner_buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")
	self.item_name = item_name
	local owner_inventory_extension = ScriptUnit.has_extension(owner_unit, "inventory_system")

	if owner_inventory_extension then
		local equipment = owner_inventory_extension:equipment()

		if equipment then
			local wielded_item_data = equipment.wielded

			if wielded_item_data then
				local item_units = BackendUtils.get_item_units(wielded_item_data)
				local is_ammo_weapon = item_units and item_units.is_ammo_weapon

				if is_ammo_weapon then
					local wielded_item_template = BackendUtils.get_item_template(wielded_item_data)
					local material_settings = item_units.material_settings or wielded_item_template.material_settings

					if material_settings then
						GearUtils.apply_material_settings(unit, material_settings)
					end
				end
			end
		end
	end

	local item_data = ItemMasterList[item_name]
	local item_template = BackendUtils.get_item_template(item_data)
	local item_template_name = extension_init_data.item_template_name
	local action_name = extension_init_data.action_name
	local sub_action_name = extension_init_data.sub_action_name
	self.action_lookup_data = {
		item_template_name = item_template_name,
		action_name = action_name,
		sub_action_name = sub_action_name
	}
	local current_action = item_template.actions[action_name][sub_action_name]
	self._current_action = current_action
	local projectile_info = current_action.projectile_info
	local impact_data = current_action.impact_data
	local timed_data = current_action.timed_data
	self.power_level = extension_init_data.power_level
	self.projectile_info = projectile_info

	if impact_data.grenade and owner_buff_extension and owner_buff_extension:has_buff_perk("frag_fire_grenades") then
		impact_data = table.shallow_copy(impact_data)
		impact_data.aoe = ExplosionTemplates.frag_fire_grenade
	end

	if impact_data then
		self._impact_data = impact_data
		local impact_damage_profile_name = impact_data.damage_profile or "default"
		self._impact_damage_profile_id = NetworkLookup.damage_profiles[impact_damage_profile_name]
	end

	if timed_data then
		self._timed_data = timed_data
		local timed_damage_profile_name = timed_data.damage_profile or "default"
		self._timed_damage_profile_id = NetworkLookup.damage_profiles[timed_damage_profile_name]
	end

	self._time_initialized = extension_init_data.time_initialized
	self.scale = extension_init_data.scale
	self._num_targets_hit = 0
	self._hit_units = {}
	self._hit_afro_units = {}
	local entity_manager = Managers.state.entity
	self._weapon_system = entity_manager:system("weapon_system")
	self._projectile_linker_system = entity_manager:system("projectile_linker_system")
	self._is_server = Managers.player.is_server
	self._marked_for_deletion = false
	self._did_damage = false
	self._num_bounces = 0
	self._num_additional_penetrations = owner_buff_extension:apply_buffs_to_value(0, "ranged_additional_penetrations")
	self._is_critical_strike = not not extension_init_data.is_critical_strike

	self:initialize_projectile(projectile_info, impact_data)
end

PlayerProjectileUnitExtension.extensions_ready = function (self, world, unit)
	self._locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
	self._impact_extension = ScriptUnit.extension(unit, "projectile_impact_system")
end

PlayerProjectileUnitExtension.initialize_projectile = function (self, projectile_info, impact_data)
	local unit = self._projectile_unit

	if impact_data then
		self._is_impact = true
		self._stop_impacts = false
		self._amount_of_mass_hit = 0
		local damage_profile_name = impact_data.damage_profile or "default"
		local damage_profile = DamageProfileTemplates[damage_profile_name]
		local owner_unit = self._owner_unit
		local difficulty_level = Managers.state.difficulty:get_difficulty()
		local cleave_power_level = ActionUtils.scale_power_levels(self.power_level, "cleave", owner_unit, difficulty_level)
		local max_mass_attack, max_mass_impact = ActionUtils.get_max_targets(damage_profile, cleave_power_level)
		self._max_mass = (max_mass_impact < max_mass_attack and max_mass_attack) or max_mass_impact
	end

	local timed_data = self._timed_data

	if timed_data then
		self._is_timed = true

		if timed_data.activate_life_time_on_impact then
			self._life_time = math.huge
		else
			self:_activate_life_time(self._time_initialized)
		end
	end

	if projectile_info.times_bigger then
		local scale = self.scale

		Unit.set_flow_variable(unit, "scale", scale)

		local times_bigger = projectile_info.times_bigger
		local unit_scale = math.lerp(1, times_bigger, scale)

		Unit.set_local_scale(unit, 0, Vector3(unit_scale, unit_scale, unit_scale))
	end

	if projectile_info.hide_projectile then
		Unit.set_unit_visibility(unit, false)
	end

	if projectile_info.anim_blend_settings then
		local first_person_extension = ScriptUnit.extension(self._owner_unit, "first_person_system")
		local owner_unit_1p = first_person_extension:get_first_person_unit()
		local link_node = projectile_info.anim_blend_settings.link_node
		self._owner_unit_1p = owner_unit_1p
		self._anim_node_id = (Unit.has_node(owner_unit_1p, link_node) and Unit.node(owner_unit_1p, link_node)) or 0
		self._anim_blend_enabled = true
	end

	Unit.flow_event(unit, "lua_projectile_init")
	self:_handle_critical_strike(unit, self._is_critical_strike)
	Unit.flow_event(unit, "lua_trail")
end

PlayerProjectileUnitExtension._handle_critical_strike = function (self, unit, is_critical_strike)
	if self._is_critical_strike then
		Unit.flow_event(unit, "vfx_critical_strike")
	end
end

PlayerProjectileUnitExtension.mark_for_deletion = function (self)
	if not self._marked_for_deletion then
		self._marked_for_deletion = true
		self._deletion_time = Managers.time:time("game") + DELETION_GRACE_TIMER
	end
end

PlayerProjectileUnitExtension.stop = function (self)
	if self._stop_impacts then
		return
	end

	local unit = self._projectile_unit

	if self._anim_blend_enabled then
		self._anim_blend_enabled = false
		local real_pos = self._locomotion_extension:current_position()
		local real_rot = self._locomotion_extension:current_rotation()

		unit_set_local_position(unit, 0, real_pos)
		unit_set_local_rotation(unit, 0, real_rot)
	end

	local timed_data = self._timed_data
	local activate_life_time_on_impact = timed_data and timed_data.activate_life_time_on_impact

	if not activate_life_time_on_impact then
		self:mark_for_deletion()
		Unit.flow_event(unit, "lua_projectile_end")

		self.active = false
	end

	self._locomotion_extension:stop()

	self._stop_impacts = true
end

PlayerProjectileUnitExtension._stop_by_life_time = function (self)
	self:mark_for_deletion()
	Unit.flow_event(self._projectile_unit, "lua_projectile_end")
	self._locomotion_extension:stop()

	self._stop_impacts = true
	self.active = false
end

PlayerProjectileUnitExtension.update = function (self, unit, input, _, context, t)
	if self._marked_for_deletion then
		if self._deletion_time <= t and not self.delete_done then
			self.delete_done = true

			Managers.state.unit_spawner:mark_for_deletion(self._projectile_unit)
		end

		return
	end

	if self._anim_blend_enabled then
		local owner_unit = self._owner_unit_1p
		local anim_blend_settings = self.projectile_info.anim_blend_settings
		local blend_time = anim_blend_settings.blend_time
		local blend_func = anim_blend_settings.blend_func
		local life_time = self._locomotion_extension.life_time
		local blend_t = math.min(blend_func(life_time / blend_time), 1)

		if not ALIVE[owner_unit] or blend_t >= 1 then
			self._anim_blend_enabled = false
		else
			local real_pos = self._locomotion_extension:current_position()
			local real_rot = self._locomotion_extension:current_rotation()

			if real_pos and real_rot then
				local anim_node = self._anim_node_id
				local forward_offset = anim_blend_settings.forward_offset
				local owner_rot = unit_world_rotation(owner_unit, 0)
				local anim_pos = unit_world_position(owner_unit, anim_node)
				local pos_offset = quaternion_forward(owner_rot) * forward_offset
				local blended_pos = vector3_lerp(anim_pos + pos_offset, real_pos, blend_t)

				unit_set_local_position(unit, 0, blended_pos)

				if anim_blend_settings.use_anim_rotation then
					local anim_rot = unit_world_rotation(owner_unit, anim_node)
					local blended_rot = quaternion_lerp(anim_rot, real_rot, blend_t)

					unit_set_local_rotation(unit, 0, blended_rot)
				end
			end
		end
	end

	if self._is_timed then
		self:handle_timed_events(t)
	end

	if self._is_impact and not self._stop_impacts then
		local impact_extension = self._impact_extension
		local recent_impacts, num_impacts = impact_extension:recent_impacts()

		if num_impacts > 0 then
			self:handle_impacts(recent_impacts, num_impacts, t)
		end
	end
end

PlayerProjectileUnitExtension.handle_timed_events = function (self, t)
	if self._life_time <= t then
		local unit = self._projectile_unit
		local timed_data = self._timed_data
		local aoe_data = timed_data.aoe

		if aoe_data then
			self:do_aoe(aoe_data, POSITION_LOOKUP[unit])
		end

		local sound_event = self._timed_data.life_time_activate_sound_stop_event

		if sound_event then
			WwiseWorld.trigger_event(self._wwise_world, sound_event)
		end

		self:_stop_by_life_time()
	end
end

PlayerProjectileUnitExtension.destroy = function (self)
	return
end

PlayerProjectileUnitExtension.validate_position = function (self, position, min, max)
	for i = 1, 3, 1 do
		local coord = position[i]

		if coord < min or max < coord then
			print("[PlayerProjectileUnitExtension] position is not valid, outside of NetworkConstants.position")

			return false
		end
	end

	return true
end

PlayerProjectileUnitExtension._alert_enemy = function (self, hit_unit, owner_unit)
	local is_server = self._is_server
	local network_manager = Managers.state.network

	if is_server then
		AiUtils.alert_unit_of_enemy(hit_unit, owner_unit)
	elseif Unit.alive(owner_unit) then
		local hit_unit_go_id = network_manager:unit_game_object_id(hit_unit)
		local owner_unit_go_id = network_manager:unit_game_object_id(owner_unit)

		network_manager.network_transmit:send_rpc_server("rpc_alert_enemy", hit_unit_go_id, owner_unit_go_id)
	end
end

local best_hit_units = {}

PlayerProjectileUnitExtension.handle_impacts = function (self, impacts, num_impacts, time)
	table.clear(best_hit_units)

	local unit = self._projectile_unit
	local owner_unit = self._owner_unit
	local is_server = self._is_server
	local UNIT_INDEX = ProjectileImpactDataIndex.UNIT
	local POSITION_INDEX = ProjectileImpactDataIndex.POSITION
	local DIRECTION_INDEX = ProjectileImpactDataIndex.DIRECTION
	local NORMAL_INDEX = ProjectileImpactDataIndex.NORMAL
	local ACTOR_INDEX = ProjectileImpactDataIndex.ACTOR_INDEX
	local hit_units = self._hit_units
	local hit_afro_units = self._hit_afro_units
	local impact_data = self._impact_data
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local unit_id = network_manager:unit_game_object_id(unit)
	local pos_min = NetworkConstants.position.min
	local pos_max = NetworkConstants.position.max

	for i = 1, num_impacts / ProjectileImpactDataIndex.STRIDE, 1 do
		local j = (i - 1) * ProjectileImpactDataIndex.STRIDE
		local hit_position = impacts[j + POSITION_INDEX]:unbox()
		local hit_unit = impacts[j + UNIT_INDEX]
		local actor_index = impacts[j + ACTOR_INDEX]
		local hit_actor = Unit.actor(hit_unit, actor_index)
		local breed = AiUtils.unit_breed(hit_unit)

		if breed then
			local node = Actor.node(hit_actor)
			local hit_zone = breed.hit_zones_lookup[node]

			if hit_zone and hit_zone.name ~= "afro" then
				local potential_hit_zone = best_hit_units[hit_unit]

				if not potential_hit_zone or (potential_hit_zone and hit_zone.prio < potential_hit_zone.prio) then
					best_hit_units[hit_unit] = hit_zone
				end
			elseif not hit_afro_units[hit_unit] and hit_zone and hit_zone.name == "afro" then
				self:_alert_enemy(hit_unit, owner_unit)

				hit_afro_units[hit_unit] = true
			end
		end
	end

	for i = 1, num_impacts / ProjectileImpactDataIndex.STRIDE, 1 do
		repeat
			if self._stop_impacts then
				return
			end

			local j = (i - 1) * ProjectileImpactDataIndex.STRIDE
			local hit_unit = impacts[j + UNIT_INDEX]
			local hit_position = impacts[j + POSITION_INDEX]:unbox()
			local hit_direction = impacts[j + DIRECTION_INDEX]:unbox()
			local hit_normal = impacts[j + NORMAL_INDEX]:unbox()
			local actor_index = impacts[j + ACTOR_INDEX]
			local hit_actor = Unit.actor(hit_unit, actor_index)
			local valid_position = self:validate_position(hit_position, pos_min, pos_max)

			if not valid_position then
				self:stop()
			end

			hit_unit, hit_actor = ActionUtils.redirect_shield_hit(hit_unit, hit_actor)
			local hit_self = hit_unit == owner_unit

			if not hit_self and valid_position and not hit_units[hit_unit] then
				local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

				if hud_extension then
					hud_extension.show_critical_indication = false
				end

				local timed_data = self._timed_data

				if timed_data and timed_data.activate_life_time_on_impact then
					self:_activate_life_time(time)
				end

				local breed = AiUtils.unit_breed(hit_unit)

				if breed then
					local best_hit_zone = best_hit_units[hit_unit]

					if best_hit_zone then
						local node = Actor.node(hit_actor)
						local hit_zone = breed.hit_zones_lookup[node]

						if hit_zone.name == best_hit_zone.name then
							hit_units[hit_unit] = true
						else
							break
						end
					else
						break
					end
				else
					hit_units[hit_unit] = true
				end

				local level_index, is_level_unit = network_manager:game_object_or_level_id(hit_unit)

				if is_server then
					if is_level_unit then
						network_transmit:send_rpc_clients("rpc_player_projectile_impact_level", unit_id, level_index, hit_position, hit_direction, hit_normal, actor_index)
					elseif level_index then
						network_transmit:send_rpc_clients("rpc_player_projectile_impact_dynamic", unit_id, level_index, hit_position, hit_direction, hit_normal, actor_index)
					end
				elseif is_level_unit then
					network_transmit:send_rpc_server("rpc_player_projectile_impact_level", unit_id, level_index, hit_position, hit_direction, hit_normal, actor_index)
				elseif level_index then
					network_transmit:send_rpc_server("rpc_player_projectile_impact_dynamic", unit_id, level_index, hit_position, hit_direction, hit_normal, actor_index)
				end

				local side_manager = Managers.state.side
				local is_enemy = side_manager:is_enemy(owner_unit, hit_unit)
				local has_ranged_boost, ranged_boost_curve_multiplier = ActionUtils.get_ranged_boost(owner_unit)

				if breed then
					if is_enemy then
						self:hit_enemy(impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, breed, has_ranged_boost, ranged_boost_curve_multiplier)

						local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")

						if buff_extension then
							buff_extension:trigger_procs("on_ranged_hit")
						end
					elseif breed.is_player then
						self:hit_player(impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, has_ranged_boost, ranged_boost_curve_multiplier)
					end
				elseif is_level_unit or Unit.get_data(hit_unit, "is_dummy") then
					self:hit_level_unit(impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, level_index, has_ranged_boost, ranged_boost_curve_multiplier)
				elseif not is_level_unit then
					self:hit_non_level_unit(impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, has_ranged_boost, ranged_boost_curve_multiplier)
				end
			end
		until true
	end
end

PlayerProjectileUnitExtension._activate_life_time = function (self, game_time)
	local timed_data = self._timed_data
	local sound_event = timed_data.life_time_activate_sound_start_event

	if sound_event then
		WwiseWorld.trigger_event(self._wwise_world, sound_event)
	end

	self._life_time = game_time + timed_data.life_time
end

PlayerProjectileUnitExtension.hit_enemy = function (self, impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, breed, has_ranged_boost, ranged_boost_curve_multiplier)
	local shield_blocked = false
	local damage_profile_name = impact_data.damage_profile or "default"
	local damage_profile = DamageProfileTemplates[damage_profile_name]
	local allow_link = true
	local forced_penetration = false
	local aoe_data = impact_data.aoe
	breed = AiUtils.unit_breed(hit_unit)

	if not breed then
		return
	end

	if damage_profile then
		local node = Actor.node(hit_actor)
		local hit_zone = breed.hit_zones_lookup[node]
		local hit_zone_name = hit_zone.name
		local send_to_server = true
		local charge_value = damage_profile.charge_value or "projectile"
		local is_critical_strike = self._is_critical_strike
		local owner_unit = self._owner_unit
		local num_targets_hit = self._num_targets_hit + 1
		local unmodified = true

		if hit_zone_name ~= "head" and AiUtils.unit_alive(hit_unit) and breed and breed.hit_zones and breed.hit_zones.head then
			local owner_buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")
			local auto_headshot = owner_buff_extension and owner_buff_extension:has_buff_perk("auto_headshot")

			if auto_headshot and hit_zone_name ~= "afro" then
				hit_zone_name = "head"
				unmodified = false

				owner_buff_extension:trigger_procs("on_auto_headshot")
			end
		end

		local buff_type = DamageUtils.get_item_buff_type(self.item_name)

		DamageUtils.buff_on_attack(owner_unit, hit_unit, charge_value, is_critical_strike, hit_zone_name, num_targets_hit, send_to_server, buff_type, unmodified)

		shield_blocked, forced_penetration = self:hit_enemy_damage(damage_profile, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, breed, has_ranged_boost, ranged_boost_curve_multiplier)
		allow_link = hit_zone_name ~= "ward"

		if allow_link and breed and not shield_blocked then
			local impact_pickup_settings = impact_data.pickup_settings

			if impact_pickup_settings then
				allow_link = not not impact_pickup_settings.link_hit_zones[hit_zone_name]
			end
		end
	end

	local grenade = impact_data.grenade

	if grenade or (aoe_data and self._max_mass <= self._amount_of_mass_hit) then
		self:do_aoe(aoe_data, hit_position)

		if grenade then
			local owner_unit = self._owner_unit
			local owner_buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")

			if owner_buff_extension then
				owner_buff_extension:trigger_procs("on_grenade_exploded", impact_data, hit_position, self._is_critical_strike, self.item_name, Unit.local_rotation(self._projectile_unit, 0), self.scale, self.power_level)
			end
		end

		self:stop()
	end

	local current_action = self._current_action

	if current_action.use_max_targets then
		if current_action.max_targets <= self._num_targets_hit then
			if self._num_additional_penetrations > 0 then
				forced_penetration = true
			else
				local hit_enemy_or_player = true

				self:_handle_linking(impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, self._did_damage, allow_link, shield_blocked, hit_enemy_or_player)
				self:stop()
			end
		end
	elseif self._max_mass <= self._amount_of_mass_hit then
		if self._num_additional_penetrations > 0 then
			forced_penetration = true
		else
			local hit_enemy_or_player = true

			self:_handle_linking(impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, self._did_damage, allow_link, shield_blocked, hit_enemy_or_player)
			self:stop()
		end
	end

	if self._locomotion_extension.notify_hit_enemy then
		self._locomotion_extension:notify_hit_enemy(hit_unit)
	end

	if forced_penetration then
		self._num_additional_penetrations = self._num_additional_penetrations - 1
	end
end

PlayerProjectileUnitExtension.hit_enemy_damage = function (self, damage_profile, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, breed, has_ranged_boost, ranged_boost_curve_multiplier)
	local network_manager = Managers.state.network
	local owner = self._owner_player
	local owner_unit = self._owner_unit
	local action = self._current_action
	local is_server = self._is_server
	local node = Actor.node(hit_actor)
	local hit_zone = breed.hit_zones_lookup[node]
	local hit_zone_name = action.projectile_info.forced_hitzone or hit_zone.name
	local attack_direction = hit_direction
	local forced_penetration = false
	local was_alive = (is_server and AiUtils.unit_alive(hit_unit)) or AiUtils.client_predicted_unit_alive(hit_unit)

	if was_alive then
		self._num_targets_hit = self._num_targets_hit + 1
	end

	if hit_zone_name ~= "head" and AiUtils.unit_alive(hit_unit) and breed and breed.hit_zones and breed.hit_zones.head then
		local owner_buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")
		local auto_headshot = owner_buff_extension and owner_buff_extension:has_buff_perk("auto_headshot")

		if auto_headshot and hit_zone_name ~= "afro" then
			hit_zone_name = "head"

			owner_buff_extension:trigger_procs("on_auto_headshot")
		end
	end

	local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
	local power_level = self.power_level
	local is_critical_strike = self._is_critical_strike
	local target_settings = damage_profile.default_target
	local attack_template = AttackTemplates[target_settings.attack_template]
	local attacker_unit_id = network_manager:unit_game_object_id(owner_unit)
	local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
	local shield_blocked = false
	local trueflight_blocking = target_settings.trueflight_blocking

	if not action.ignore_shield_hit then
		shield_blocked = AiUtils.attack_is_shield_blocked(hit_unit, owner_unit, trueflight_blocking, hit_direction)
	end

	breed = AiUtils.unit_breed(hit_unit)
	local is_dummy = Unit.get_data(hit_unit, "is_dummy")
	local multiplier_type = DamageUtils.get_breed_damage_multiplier_type(breed, hit_zone_name, is_dummy)

	if (multiplier_type == "headshot" or (multiplier_type == "weakspot" and not shield_blocked)) and not action.no_headshot_sound and AiUtils.unit_alive(hit_unit) then
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

		first_person_extension:play_hud_sound_event("Play_hud_headshot", nil, false)
	end

	if was_alive then
		local action_mass_override = action.hit_mass_count
		local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
		local hit_mass_total = (shield_blocked and ((breed.hit_mass_counts_block and breed.hit_mass_counts_block[difficulty_rank]) or breed.hit_mass_count_block)) or (breed.hit_mass_counts and breed.hit_mass_counts[difficulty_rank]) or breed.hit_mass_count or 1

		if action_mass_override and action_mass_override[breed.name] then
			local mass_cost_multiplier = action_mass_override[breed.name]
			hit_mass_total = hit_mass_total * (mass_cost_multiplier or 1)
		end

		self._amount_of_mass_hit = self._amount_of_mass_hit + hit_mass_total
	end

	local actual_target_index = math.ceil(self._amount_of_mass_hit)
	local hit_effect = action.hit_effect
	local is_husk = not owner.local_player
	local damage_sound = attack_template.sound_type
	local enemy_type = breed.name
	local hit_rotation = Quaternion.look(attack_direction, Vector3.up())
	local damage_source = self.item_name
	local damage_source_id = NetworkLookup.damage_sources[damage_source]
	local damage_profile_id = self._impact_damage_profile_id
	local weapon_system = self._weapon_system
	local predicted_damage, invulnerable = DamageUtils.calculate_damage(DamageOutput, hit_unit, owner_unit, hit_zone_name, power_level, BoostCurves[target_settings.boost_curve_type], ranged_boost_curve_multiplier, is_critical_strike, damage_profile, actual_target_index, nil, damage_source)

	if not is_server then
		local target_health_extension = Unit.alive(hit_unit) and ScriptUnit.has_extension(hit_unit, "health_system")

		if target_health_extension then
			local networked_damage = DamageUtils.networkify_damage(predicted_damage)

			target_health_extension:apply_client_predicted_damage(networked_damage)
		end
	end

	weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, damage_profile_id, "power_level", power_level, "hit_target_index", actual_target_index, "blocking", shield_blocked, "shield_break_procced", false, "boost_curve_multiplier", ranged_boost_curve_multiplier, "is_critical_strike", is_critical_strike, "first_hit", self._num_targets_hit == 1)

	local no_damage = predicted_damage <= 0

	if was_alive and no_damage then
		self._did_damage = predicted_damage

		if self._num_additional_penetrations > 0 then
			forced_penetration = true
		else
			self._amount_of_mass_hit = self._max_mass

			self:stop()
		end
	elseif was_alive and not action.ignore_armor and (breed.armor_category == 2 or breed.armor_category == 3 or shield_blocked) then
		self._did_damage = predicted_damage

		if self._num_additional_penetrations > 0 then
			forced_penetration = true
		else
			self._amount_of_mass_hit = self._max_mass

			self:stop()
		end
	else
		self._did_damage = predicted_damage

		if hit_zone_name == "head" or hit_zone_name == "neck" then
			self._did_damage = predicted_damage - 1
		end

		EffectHelper.player_critical_hit(self._world, is_critical_strike, owner_unit, hit_unit, hit_position)
	end

	if invulnerable then
		hit_effect = "invulnerable"

		DamageUtils.handle_hit_indication(owner_unit, hit_unit, 0, hit_zone_name, false, true)
	end

	if hit_effect then
		EffectHelper.play_skinned_surface_material_effects(hit_effect, self._world, hit_unit, hit_position, hit_rotation, hit_normal, is_husk, enemy_type, damage_sound, no_damage, hit_zone_name, shield_blocked, invulnerable)
	end

	if hit_zone_name == "head" and not shield_blocked then
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
		local _, procced = buff_extension:apply_buffs_to_value(0, "coop_stamina")

		if (procced or script_data.debug_legendary_traits) and AiUtils.unit_alive(hit_unit) then
			local headshot_coop_stamina_fatigue_type = breed.headshot_coop_stamina_fatigue_type or "headshot_clan_rat"
			local fatigue_type_id = NetworkLookup.fatigue_types[headshot_coop_stamina_fatigue_type]

			if is_server then
				network_manager.network_transmit:send_rpc_clients("rpc_replenish_fatigue_other_players", fatigue_type_id)
			else
				network_manager.network_transmit:send_rpc_server("rpc_replenish_fatigue_other_players", fatigue_type_id)
			end

			StatusUtils.replenish_stamina_local_players(owner_unit, headshot_coop_stamina_fatigue_type)
			first_person_extension:play_hud_sound_event("hud_player_buff_headshot", nil, false)
		end
	end

	return shield_blocked, forced_penetration
end

PlayerProjectileUnitExtension.hit_player = function (self, impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, has_ranged_boost, ranged_boost_curve_multiplier)
	local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
	local hit = false
	local allow_link = false
	local shield_blocked = false
	local forced_penetration = false
	local owner_player = self._owner_player
	local damage_profile_name = impact_data.damage_profile or "default"
	local damage_profile = DamageProfileTemplates[damage_profile_name]

	if damage_profile and DamageUtils.allow_friendly_fire_ranged(difficulty_settings, owner_player) then
		allow_link = self:hit_player_damage(damage_profile, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, has_ranged_boost, ranged_boost_curve_multiplier)
		hit = true
	end

	if hit then
		local aoe_data = impact_data.aoe

		if aoe_data and self._max_mass <= self._amount_of_mass_hit then
			self:do_aoe(aoe_data, hit_position)

			if impact_data.grenade then
				local owner_unit = self._owner_unit
				local owner_buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")

				if owner_buff_extension then
					owner_buff_extension:trigger_procs("on_grenade_exploded", impact_data, hit_position, self._is_critical_strike, self.item_name, Unit.local_rotation(self._projectile_unit, 0), self.scale, self.power_level)
				end
			end

			self:stop()
		end

		if not impact_data.no_stop_on_friendly_fire then
			local action = self._current_action

			if action.use_max_targets then
				if action.max_targets <= self._num_targets_hit then
					if self._num_additional_penetrations > 0 then
						forced_penetration = true
					else
						local hit_player_or_enemy = true

						self:_handle_linking(impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, self._did_damage, allow_link, shield_blocked, hit_player_or_enemy)
						self:stop()
					end
				end
			elseif self._max_mass <= self._amount_of_mass_hit then
				if self._num_additional_penetrations > 0 then
					forced_penetration = true
				else
					local hit_player_or_enemy = true

					self:_handle_linking(impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, self._did_damage, allow_link, shield_blocked, hit_player_or_enemy)
					self:stop()
				end
			end
		end
	end

	if forced_penetration then
		self._num_additional_penetrations = self._num_additional_penetrations - 1
	end
end

PlayerProjectileUnitExtension.hit_player_damage = function (self, damage_profile, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, has_ranged_boost, ranged_boost_curve_multiplier)
	local owner_unit = self._owner_unit
	local network_manager = Managers.state.network
	local attacker_unit_id = network_manager:unit_game_object_id(owner_unit)
	local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
	local num_targets_hit = self._num_targets_hit + 1
	self._num_targets_hit = num_targets_hit
	self._amount_of_mass_hit = self._amount_of_mass_hit + 1
	local actual_target_index = math.ceil(self._amount_of_mass_hit)
	local target_settings = damage_profile.default_target
	local action = self._current_action
	local hit_effect = action.hit_effect
	local owner = self._owner_player
	local is_husk = not owner.local_player
	local hit_rotation = Quaternion.look(hit_direction, Vector3.up())
	local damage_source = self.item_name
	local damage_profile_id = self._impact_damage_profile_id
	local power_level = self.power_level
	local breed = AiUtils.unit_breed(hit_unit)
	local node = Actor.node(hit_actor)
	local hit_zone = breed.hit_zones_lookup[node]
	local hit_zone_name = hit_zone.name
	local is_critical_strike = self._is_critical_strike
	local damage_source_id = NetworkLookup.damage_sources[damage_source]
	local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
	local weapon_system = self._weapon_system

	weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, hit_direction, damage_profile_id, "power_level", power_level, "hit_target_index", actual_target_index, "blocking", false, "shield_break_procced", false, "boost_curve_multiplier", ranged_boost_curve_multiplier, "is_critical_strike", is_critical_strike, "first_hit", num_targets_hit == 1)

	local predicted_damage, invulnerable = DamageUtils.calculate_damage(DamageOutput, hit_unit, owner_unit, hit_zone_name, power_level, BoostCurves[target_settings.boost_curve_type], ranged_boost_curve_multiplier, is_critical_strike, damage_profile, actual_target_index, nil, damage_source)
	local no_damage = predicted_damage <= 0

	if no_damage then
		self._did_damage = false

		self:stop()
	else
		self._did_damage = predicted_damage
	end

	if invulnerable then
		hit_effect = "invulnerable"

		DamageUtils.handle_hit_indication(owner_unit, hit_unit, 0, hit_zone_name, false, true)
	end

	if hit_effect then
		EffectHelper.play_skinned_surface_material_effects(hit_effect, self._world, hit_unit, hit_position, hit_rotation, hit_normal, is_husk)
	end

	local allow_link = false

	return allow_link
end

PlayerProjectileUnitExtension.hit_level_unit = function (self, impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, level_index, has_ranged_boost, ranged_boost_curve_multiplier)
	local health_extension = ScriptUnit.has_extension(hit_unit, "health_system")
	local damage_profile_name = impact_data.damage_profile_prop or impact_data.damage_profile or "default"
	local damage_profile = DamageProfileTemplates[damage_profile_name]
	local allow_ranged_damage = Unit.get_data(hit_unit, "allow_ranged_damage") ~= false

	if damage_profile and (GameSettingsDevelopment.allow_ranged_attacks_to_damage_props or allow_ranged_damage) then
		if health_extension then
			self:hit_damagable_prop(damage_profile, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, level_index, has_ranged_boost, ranged_boost_curve_multiplier)
		elseif hit_unit and Unit.alive(hit_unit) and hit_actor then
			local unit_set_flow_variable = Unit.set_flow_variable

			unit_set_flow_variable(hit_unit, "hit_actor", hit_actor)
			unit_set_flow_variable(hit_unit, "hit_direction", hit_direction)
			unit_set_flow_variable(hit_unit, "hit_position", hit_position)
			Unit.flow_event(hit_unit, "lua_simple_damage")
		end
	end

	local action = self._current_action
	local hit_effect = action.hit_effect

	if hit_effect then
		local world = self._world
		local hit_rotation = Quaternion.look(hit_direction)
		local owner = self._owner_player
		local is_husk = not owner.local_player

		EffectHelper.play_surface_material_effects(hit_effect, world, hit_unit, hit_position, hit_rotation, hit_normal, nil, is_husk, nil, hit_actor)
	end

	local bounce = impact_data.bounce_on_level_units and not Unit.get_data(hit_unit, "is_dummy")
	local owner_buff_extension = ScriptUnit.has_extension(self._owner_unit, "buff_system")
	local buffed_bounces = 0

	if not impact_data.grenade and owner_buff_extension and not bounce and not Unit.get_data(hit_unit, "is_dummy") then
		bounce = owner_buff_extension:has_buff_perk("add_projectile_bounces")
		buffed_bounces = owner_buff_extension:apply_buffs_to_value(buffed_bounces, "projectile_bounces")
	end

	local bounce_linking = false

	if bounce then
		local num_bounces = self._num_bounces
		local max_bounces = impact_data.max_bounces or 0
		max_bounces = max_bounces + buffed_bounces

		if num_bounces < max_bounces then
			local locomotion_extension = self._locomotion_extension

			if locomotion_extension.bounce then
				locomotion_extension:bounce(hit_position, hit_direction, hit_normal)

				self._num_bounces = self._num_bounces + 1

				return
			end
		else
			bounce_linking = true
		end
	end

	if (not bounce or (bounce and bounce_linking)) and (self._num_additional_penetrations == 0 or not health_extension or impact_data.grenade) then
		self:_handle_linking(impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, false, true, false, false)
	end

	local aoe_data = impact_data.aoe

	if aoe_data then
		self:do_aoe(aoe_data, hit_position)

		if impact_data.grenade and owner_buff_extension then
			owner_buff_extension:trigger_procs("on_grenade_exploded", impact_data, hit_position, self._is_critical_strike, self.item_name, Unit.local_rotation(self._projectile_unit, 0), self.scale, self.power_level)
		end
	end

	if health_extension and self._num_additional_penetrations > 0 and not impact_data.grenade then
		self._num_additional_penetrations = self._num_additional_penetrations - 1
	else
		self:stop()
	end
end

PlayerProjectileUnitExtension.hit_damagable_prop = function (self, damage_profile, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, level_index, has_ranged_boost, ranged_boost_curve_multiplier)
	self._amount_of_mass_hit = self._amount_of_mass_hit + 1
	local target_index = math.ceil(self._amount_of_mass_hit)
	local owner_unit = self._owner_unit
	local hit_zone_name = "full"
	local power_level = self.power_level
	local is_critical_strike = self._is_critical_strike
	local damage_source = self.item_name
	local is_dummy_unit = Unit.get_data(hit_unit, "is_dummy")

	if is_dummy_unit then
		local node = Actor.node(hit_actor)
		local head_actor = Unit.actor(hit_unit, "c_head")
		local head_node = Actor.node(head_actor)

		if node == head_node then
			hit_zone_name = "head"
			local action = self._current_action

			if not action.no_headshot_sound and AiUtils.unit_alive(hit_unit) then
				local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

				first_person_extension:play_hud_sound_event("Play_hud_headshot", nil, false)
			end
		end

		local check_backstab = false

		DamageUtils.damage_dummy_unit(hit_unit, owner_unit, hit_zone_name, power_level, ranged_boost_curve_multiplier, is_critical_strike, damage_profile, target_index, hit_position, hit_direction, damage_source, hit_actor, self._impact_damage_profile_id or self._timed_damage_profile_id, nil, check_backstab)
	else
		DamageUtils.damage_level_unit(hit_unit, owner_unit, hit_zone_name, power_level, ranged_boost_curve_multiplier, is_critical_strike, damage_profile, target_index, hit_direction, damage_source)
	end
end

PlayerProjectileUnitExtension.hit_non_level_unit = function (self, impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, has_ranged_boost, ranged_boost_curve_multiplier)
	local damage_profile_name = impact_data.damage_profile_prop or impact_data.damage_profile or "default"
	local damage_profile = DamageProfileTemplates[damage_profile_name]
	local stop_impacts = false

	if damage_profile then
		if ScriptUnit.has_extension(hit_unit, "health_system") then
			self:hit_non_level_damagable_unit(damage_profile, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, has_ranged_boost, ranged_boost_curve_multiplier)

			stop_impacts = true
		elseif hit_unit and Unit.alive(hit_unit) and hit_actor then
			local unit_set_flow_variable = Unit.set_flow_variable

			unit_set_flow_variable(hit_unit, "hit_actor", hit_actor)
			unit_set_flow_variable(hit_unit, "hit_direction", hit_direction)
			unit_set_flow_variable(hit_unit, "hit_position", hit_position)
			Unit.flow_event(hit_unit, "lua_simple_damage")
		end
	end

	if self._num_additional_penetrations == 0 then
		self:_handle_linking(impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, false, true, false, false)
	end

	local aoe_data = impact_data.aoe

	if aoe_data then
		self:do_aoe(aoe_data, hit_position)

		if impact_data.grenade then
			local owner_unit = self._owner_unit
			local owner_buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")

			if owner_buff_extension then
				owner_buff_extension:trigger_procs("on_grenade_exploded", impact_data, hit_position, self._is_critical_strike, self.item_name, Unit.local_rotation(self._projectile_unit, 0), self.scale, self.power_level)
			end
		end

		stop_impacts = true
	end

	if stop_impacts then
		if self._num_additional_penetrations > 0 then
			self._num_additional_penetrations = self._num_additional_penetrations - 1
		else
			self:stop()
		end
	end
end

PlayerProjectileUnitExtension.hit_non_level_damagable_unit = function (self, damage_profile, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, has_ranged_boost, ranged_boost_curve_multiplier)
	local network_manager = Managers.state.network
	local hit_zone_name = "full"
	local owner_unit = self._owner_unit
	local attacker_unit_id = network_manager:unit_game_object_id(owner_unit)
	local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
	local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
	local damage_source = self.item_name
	local damage_source_id = NetworkLookup.damage_sources[damage_source]
	local damage_profile_id = self._impact_damage_profile_id
	local power_level = self.power_level
	local is_critical_strike = self._is_critical_strike
	local allow_ranged_damage = Unit.get_data(hit_unit, "allow_ranged_damage") ~= false

	if not allow_ranged_damage then
		return
	end

	local weapon_system = self._weapon_system

	weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, hit_direction, damage_profile_id, "power_level", power_level, "hit_target_index", nil, "blocking", false, "shield_break_procced", false, "boost_curve_multiplier", ranged_boost_curve_multiplier, "is_critical_strike", is_critical_strike)

	local action = self._current_action
	local hit_effect = action.hit_effect

	if hit_effect then
		local world = self._world
		local hit_rotation = Quaternion.look(hit_direction)
		local owner = self._owner_player
		local is_husk = not owner.local_player

		EffectHelper.play_surface_material_effects(hit_effect, world, hit_unit, hit_position, hit_rotation, hit_normal, nil, is_husk, nil, hit_actor)
	end
end

PlayerProjectileUnitExtension._get_projectile_units_names = function (self, projectile_info)
	local projectile_units_template = projectile_info.projectile_units_template

	if projectile_info.use_weapon_skin then
		local inventory_extension = ScriptUnit.has_extension(self._owner_unit, "inventory_system")

		if inventory_extension then
			local slot_name = "slot_ranged"
			local slot_data = inventory_extension:get_slot_data(slot_name)
			projectile_units_template = slot_data.projectile_units_template or projectile_units_template
		end
	end

	local projectile_units = ProjectileUnits[projectile_units_template]

	return projectile_units
end

PlayerProjectileUnitExtension._get_weapon_unit = function (self)
	local inventory_extension = ScriptUnit.has_extension(self._owner_unit, "inventory_system")

	if inventory_extension then
		local slot_name = "slot_ranged"
		local slot_data = inventory_extension:get_slot_data(slot_name)
		local right_hand_unit = slot_data.right_unit_1p
		local left_hand_unit = slot_data.left_unit_1p

		return right_hand_unit or left_hand_unit
	end
end

PlayerProjectileUnitExtension._handle_linking = function (self, impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, damage_amount, allow_link, shield_blocked, hit_enemy_or_player)
	if not impact_data.link and not impact_data.link_pickup then
		return
	end

	local projectile_info = self.projectile_info
	local projectile_units = self:_get_projectile_units_names(projectile_info)
	local dummy_linker_unit_name = projectile_units.dummy_linker_unit_name
	local depth = impact_data.depth or 0.15
	local depth_offset = impact_data.depth_offset or 0.15

	if projectile_units.dummy_linker_broken_units then
		local broken_chance = Math.random()

		if damage_amount and not shield_blocked then
			broken_chance = broken_chance * math.clamp(damage_amount / 2, 0.75, 1.25)
		else
			broken_chance = broken_chance * 2
		end

		if broken_chance <= 0.5 then
			local num_variations = #projectile_units.dummy_linker_broken_units
			local random_pick = Math.random(1, num_variations)
			dummy_linker_unit_name = projectile_units.dummy_linker_broken_units[random_pick]

			if random_pick == 1 then
				depth = 0.05
				depth_offset = 0.1
			else
				depth_offset = 0.15
			end
		end
	elseif damage_amount and not shield_blocked then
		local min = impact_data.depth_damage_modifier_min or 1
		local max = impact_data.depth_damage_modifier_max or 3
		depth = depth * math.clamp(damage_amount, min, max)
	end

	if shield_blocked then
		depth = -0.1
	end

	depth = depth + depth_offset

	if allow_link then
		local unit_data_allow_link = Unit.get_data(hit_unit, "allow_link")

		if unit_data_allow_link ~= nil then
			allow_link = unit_data_allow_link
		end
	end

	if allow_link and impact_data.link then
		self:_link_projectile(hit_unit, hit_actor, dummy_linker_unit_name, hit_position, hit_direction, depth, shield_blocked, impact_data.flow_event_on_init, impact_data.flow_event_on_walls)
	elseif impact_data.link_pickup then
		local network_manager = Managers.state.network
		local hit_unit_id, is_level_unit = network_manager:game_object_or_level_id(hit_unit)

		if not hit_unit_id and is_level_unit == nil then
			return
		end

		local impact_pickup_settings = impact_data.pickup_settings
		local slot_data = nil

		if impact_pickup_settings.use_weapon_skin then
			local inventory_extension = ScriptUnit.has_extension(self._owner_unit, "inventory_system")

			if inventory_extension then
				local slot_name = "slot_ranged"
				slot_data = inventory_extension:get_slot_data(slot_name)
			end
		end

		if allow_link then
			local pickup_name = slot_data.link_pickup_template_name or impact_pickup_settings.link_pickup_name

			self:_spawn_linked_pickup_projectile(pickup_name, hit_unit, hit_actor, hit_position, hit_direction, hit_normal, hit_unit_id, is_level_unit, depth, shield_blocked)
		else
			local pickup_name = slot_data.pickup_template_name or impact_pickup_settings.pickup_name

			self:_spawn_pickup_projectile(pickup_name, hit_position, hit_direction, hit_normal, hit_enemy_or_player)
		end
	end
end

PlayerProjectileUnitExtension._redirect_shield_linking = function (self, hit_unit, node_index, link_position, depth_position_offset)
	local breed = AiUtils.unit_breed(hit_unit)
	local do_redirect = AiUtils.unit_alive(hit_unit) and breed and not breed.no_effects_on_shield_block and not breed.is_player

	if not do_redirect then
		return hit_unit, node_index, link_position
	end

	local hit_inventory_extension = ScriptUnit.extension(hit_unit, "ai_inventory_system")
	hit_unit = hit_inventory_extension.inventory_item_shield_unit
	local shield_index = Unit.node(hit_unit, "c_mesh")
	local shield_origo = unit_world_position(hit_unit, shield_index) + depth_position_offset
	local shield_to_projectile_hit = link_position - shield_origo
	local shield_to_projectile_hit_distance = Vector3.length(shield_to_projectile_hit)
	local offset_distance = math.min(shield_to_projectile_hit_distance, 0.25)
	local shield_projectile_position = shield_origo + shield_to_projectile_hit * offset_distance
	link_position = shield_projectile_position
	node_index = shield_index

	return hit_unit, node_index, link_position
end

PlayerProjectileUnitExtension._link_projectile = function (self, hit_unit, hit_actor, linker_unit_name, hit_position, hit_direction, depth, shield_blocked, flow_event_on_init, flow_event_on_walls)
	local unit_spawner = Managers.state.unit_spawner
	local projectile_linker_system = self._projectile_linker_system
	local random_bank = Math.random() * 2.14 - 0.5
	local normalized_direction = Vector3.normalize(hit_direction)
	local depth_position_offset = normalized_direction * depth
	local link_position = hit_position + depth_position_offset
	local link_rotation = Quaternion.multiply(Quaternion.look(normalized_direction), Quaternion(Vector3.forward(), random_bank))
	local node_index = Actor.node(hit_actor)

	if shield_blocked then
		hit_unit, node_index, link_position = self:_redirect_shield_linking(hit_unit, node_index, link_position, depth_position_offset)
	end

	local projectile_dummy = nil

	if ScriptUnit.has_extension(hit_unit, "projectile_linker_system") then
		projectile_dummy = unit_spawner:spawn_local_unit(linker_unit_name, link_position, link_rotation)
		local hit_node_rot = unit_world_rotation(hit_unit, node_index)
		local hit_node_pos = unit_world_position(hit_unit, node_index)
		local rel_pos = link_position - hit_node_pos
		local offset_position = Vector3(Vector3.dot(Quaternion.right(hit_node_rot), rel_pos), Vector3.dot(quaternion_forward(hit_node_rot), rel_pos), Vector3.dot(Quaternion.up(hit_node_rot), rel_pos))
		local has_breed = Unit.has_data(hit_unit, "breed")

		if flow_event_on_init and has_breed then
			Unit.flow_event(projectile_dummy, flow_event_on_init)
		end

		local linker_extension = ScriptUnit.extension(hit_unit, "projectile_linker_system")

		linker_extension:link_projectile(projectile_dummy, offset_position, link_rotation, node_index)
		projectile_linker_system:add_linked_projectile_reference(hit_unit, projectile_dummy)
	else
		projectile_dummy = unit_spawner:spawn_local_unit(linker_unit_name, link_position, link_rotation)

		projectile_linker_system:add_linked_projectile_reference(hit_unit, projectile_dummy)

		if flow_event_on_init then
			Unit.flow_event(projectile_dummy, flow_event_on_init)
		end

		if flow_event_on_walls then
			Unit.flow_event(projectile_dummy, flow_event_on_walls)
		end
	end

	local owner_inventory_extension = ScriptUnit.has_extension(self._owner_unit, "inventory_system")

	if owner_inventory_extension then
		local equipment = owner_inventory_extension:equipment()

		if equipment then
			local wielded_item_data = equipment.wielded

			if wielded_item_data then
				local item_units = BackendUtils.get_item_units(wielded_item_data)
				local is_ammo_weapon = item_units and item_units.is_ammo_weapon

				if is_ammo_weapon then
					local wielded_item_template = BackendUtils.get_item_template(wielded_item_data)
					local material_settings = item_units.material_settings or wielded_item_template.material_settings

					if material_settings then
						GearUtils.apply_material_settings(projectile_dummy, material_settings)
					end
				end
			end
		end
	end
end

PlayerProjectileUnitExtension._spawn_linked_pickup_projectile = function (self, pickup_name, hit_unit, hit_actor, hit_position, hit_direction, hit_normal, hit_unit_id, is_level_unit, depth, shield_blocked)
	local normalized_direction = Vector3.normalize(hit_direction)
	local depth_position_offset = normalized_direction * depth
	local link_position = hit_position + depth_position_offset
	local node_index = Actor.node(hit_actor)

	if shield_blocked then
		hit_unit, node_index, link_position = self:_redirect_shield_linking(hit_unit, node_index, link_position, depth_position_offset)
	end

	local spawn_limit = 1
	local weapon_unit = self:_get_weapon_unit()

	if weapon_unit then
		local ammo_extension = ScriptUnit.has_extension(weapon_unit, "ammo_system")
		spawn_limit = ammo_extension and ammo_extension:max_ammo()
	end

	local random_pitch = Math.random_range(math.pi / 6, math.pi / 3)
	local random_roll = Math.random_range(-math.pi / 10, math.pi / 10)
	local link_direction = Vector3.normalize((normalized_direction - hit_normal) * 0.5)
	local link_rotation = Quaternion.look(link_direction, Vector3.up())
	link_rotation = Quaternion.multiply(link_rotation, Quaternion(Vector3.forward(), random_roll))
	link_rotation = Quaternion.multiply(link_rotation, Quaternion(Vector3.left(), random_pitch))
	local pickup_name_id = NetworkLookup.pickup_names[pickup_name]
	local pickup_spawn_type = "dropped"
	local pickup_spawn_type_id = NetworkLookup.pickup_spawn_types[pickup_spawn_type]

	Managers.state.network.network_transmit:send_rpc_server("rpc_spawn_linked_pickup", pickup_name_id, link_position, link_rotation, pickup_spawn_type_id, hit_unit_id, node_index, is_level_unit, spawn_limit)
end

PlayerProjectileUnitExtension._spawn_pickup_projectile = function (self, pickup_name, hit_position, hit_direction, hit_normal, hit_enemy_or_player)
	local spawn_limit = 1
	local weapon_unit = self:_get_weapon_unit()

	if weapon_unit then
		local ammo_extension = ScriptUnit.has_extension(weapon_unit, "ammo_system")
		spawn_limit = ammo_extension and ammo_extension:max_ammo()
	end

	local random_angle = math.random(-math.half_pi, math.half_pi)
	local bounce_dir = (hit_enemy_or_player and hit_direction) or Vector3.reflect(hit_direction, hit_normal)
	local position = hit_position + bounce_dir * 0.2
	local rotation = Quaternion.axis_angle(bounce_dir, random_angle)
	local pickup_name_id = NetworkLookup.pickup_names[pickup_name]
	local pickup_spawn_type = "dropped"
	local pickup_spawn_type_id = NetworkLookup.pickup_spawn_types[pickup_spawn_type]
	local pickup_settings = AllPickups[pickup_name]
	local pickup_unit_name = pickup_settings.unit_name
	local pickup_unit_template_name = pickup_settings.unit_template_name
	local pickup_unit_name_id = NetworkLookup.husks[pickup_unit_name]
	local pickup_unit_template_name_id = NetworkLookup.go_types[pickup_unit_template_name]
	local velocity = bounce_dir * self._locomotion_extension.speed * 0.001
	local weapon_pose = Unit.world_pose(self._projectile_unit, 0)
	local av = self.projectile_info.bounce_angular_velocity
	local angular_velocity = Vector3(av[1], av[2], av[3])
	local angular_velocity_transformed = Matrix4x4.transform_without_translation(weapon_pose, angular_velocity)
	local network_position = AiAnimUtils.position_network_scale(position, true)
	local network_rotation = AiAnimUtils.rotation_network_scale(rotation, true)
	local network_velocity = AiAnimUtils.velocity_network_scale(velocity, true)
	local network_angular_velocity = AiAnimUtils.velocity_network_scale(angular_velocity_transformed, true)

	Managers.state.network.network_transmit:send_rpc_server("rpc_spawn_pickup_projectile", pickup_unit_name_id, pickup_unit_template_name_id, network_position, network_rotation, network_velocity, network_angular_velocity, pickup_name_id, pickup_spawn_type_id, spawn_limit)
end

PlayerProjectileUnitExtension.do_aoe = function (self, aoe_data, position)
	local world = self._world
	local unit = self._projectile_unit
	local owner_unit = self._owner_unit
	local item_name = self.item_name
	local is_server = self._is_server
	local source_attacker_unit = owner_unit

	if aoe_data.explosion then
		local rotation = Unit.local_rotation(self._projectile_unit, 0)
		local scale = self.scale
		local power_level = self.power_level
		local is_husk = false

		DamageUtils.create_explosion(world, owner_unit, position, rotation, aoe_data, scale, item_name, is_server, is_husk, unit, power_level, self._is_critical_strike, source_attacker_unit)
	end

	if aoe_data.spawn_unit then
		local owner_unit_id = Managers.state.unit_storage:go_id(owner_unit)
		local extension_init_data = {
			darkness_system = {
				glow_time = aoe_data.spawn_unit.glow_time,
				owner_unit_id = owner_unit_id,
				initial_position = position
			}
		}
		local aoe_unit_path = aoe_data.spawn_unit.unit_path
		local aoe_unit_name = aoe_data.spawn_unit.unit_name

		Managers.state.unit_spawner:spawn_network_unit(aoe_unit_path, aoe_unit_name, extension_init_data, position)
	end

	if is_server then
		if aoe_data.aoe then
			DamageUtils.create_aoe(world, owner_unit, position, item_name, aoe_data)
		end

		if aoe_data.taunt then
			DamageUtils.create_taunt(world, owner_unit, unit, position, aoe_data)
		end
	end
end

PlayerProjectileUnitExtension.spawn_liquid_area = function (self, unit, pos, dir, data)
	local start_pos = pos
	local flow_dir = dir
	local liquid = math.floor(self.scale * 30)
	local extension_init_data = {
		area_damage_system = {
			flow_dir = flow_dir,
			damage_table = data.liquid_area.damage,
			liquid_template = data.liquid_area.liquid_template,
			source_unit = unit,
			max_liquid = liquid
		}
	}
	local aoe_unit_name = "units/hub_elements/empty"
	local liquid_aoe_unit = Managers.state.unit_spawner:spawn_network_unit(aoe_unit_name, "liquid_aoe_unit", extension_init_data, start_pos)
	local liquid_area_damage_extension = ScriptUnit.extension(liquid_aoe_unit, "area_damage_system")

	liquid_area_damage_extension:ready()
end

PlayerProjectileUnitExtension.are_impacts_stopped = function (self)
	return self._stop_impacts
end

return
