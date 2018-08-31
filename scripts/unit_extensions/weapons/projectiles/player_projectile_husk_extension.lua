PlayerProjectileHuskExtension = class(PlayerProjectileHuskExtension)

PlayerProjectileHuskExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local owner_unit = extension_init_data.owner_unit
	local item_name = extension_init_data.item_name
	self.world = extension_init_context.world
	self.unit = unit
	self.owner_unit = owner_unit
	self.owner_player = Managers.player:owner(owner_unit)
	self.item_name = item_name
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
	self.current_action = current_action
	local projectile_info = current_action.projectile_info
	local impact_data = current_action.impact_data
	local timed_data = current_action.timed_data
	self.power_level = extension_init_data.power_level
	self.projectile_info = projectile_info
	self.impact_data = impact_data
	self.timed_data = timed_data
	self.time_initialized = extension_init_data.time_initialized
	self.scale = extension_init_data.scale
	self.num_targets_hit = 0
	self.hit_units = {}
	local entity_manager = Managers.state.entity
	self.projectile_linker_system = entity_manager:system("projectile_linker_system")
	self.is_server = Managers.player.is_server
	self.active = true
	self.was_active = true
	self.did_damage = false
	self.num_bounces = 0
	self._is_critical_strike = extension_init_data.is_critical_strike

	self:initialize_projectile(projectile_info, impact_data)
end

PlayerProjectileHuskExtension.destroy = function (self)
	return
end

PlayerProjectileHuskExtension.extensions_ready = function (self, world, unit)
	self.locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
end

PlayerProjectileHuskExtension.initialize_projectile = function (self, projectile_info, impact_data)
	local unit = self.unit

	if impact_data then
		self.is_impact = true
		self.stop_impacts = false
		self.amount_of_mass_hit = 0
		local damage_profile_name = impact_data.damage_profile or "default"
		local damage_profile = DamageProfileTemplates[damage_profile_name]
		local owner_unit = self.owner_unit
		local difficulty_level = Managers.state.difficulty:get_difficulty()
		local cleave_power_level = ActionUtils.scale_power_levels(self.power_level, "cleave", owner_unit, difficulty_level)
		local max_mass_attack, max_mass_impact = ActionUtils.get_max_targets(damage_profile, cleave_power_level)
		self.max_mass_attack = max_mass_attack
		self.max_mass_impact = max_mass_impact
		self.max_mass = (max_mass_impact < max_mass_attack and max_mass_attack) or max_mass_impact
	end

	local timed_data = self.timed_data

	if timed_data then
		self.is_timed = true
		self.life_time = self.time_initialized + timed_data.life_time
	end

	if projectile_info.times_bigger then
		local scale = self.scale

		Unit.set_flow_variable(unit, "scale", scale)

		local times_bigger = projectile_info.times_bigger
		local unit_scale = math.lerp(1, times_bigger, scale)

		Unit.set_local_scale(unit, 0, Vector3(unit_scale, unit_scale, unit_scale))
	end

	Unit.flow_event(unit, "lua_projectile_init")

	if self._is_critical_strike then
		Unit.flow_event(unit, "vfx_critical_strike")
	end

	Unit.flow_event(unit, "lua_trail")
end

PlayerProjectileHuskExtension.update = function (self, unit, input, _, context, t)
	if not self.active then
		if self.was_active then
			self.was_active = false
		end

		return
	end

	if self.is_timed then
		self:handle_timed_events(t)
	end
end

PlayerProjectileHuskExtension.stop = function (self)
	Unit.flow_event(self.unit, "lua_projectile_end")
	self.locomotion_extension:stop()

	self.stop_impacts = true
	self.active = false
end

PlayerProjectileHuskExtension.handle_timed_events = function (self, t)
	if self.life_time <= t then
		local unit = self.unit
		local timed_data = self.timed_data
		local aoe_data = timed_data.aoe

		if aoe_data then
			self:do_aoe(aoe_data, POSITION_LOOKUP[unit])
		end

		self:stop()
	end
end

PlayerProjectileHuskExtension.impact_level = function (self, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, level_index)
	local impact_data = self.impact_data

	self:hit_level_unit(impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, self.hit_units, level_index)
end

PlayerProjectileHuskExtension.impact_dynamic = function (self, hit_unit, hit_position, hit_direction, hit_normal, hit_actor)
	local impact_data = self.impact_data
	local breed = Unit.get_data(hit_unit, "breed")
	local is_player = table.contains(PLAYER_AND_BOT_UNITS, hit_unit)
	local has_ranged_boost = false
	local ranged_boost_curve_multiplier = 0

	if breed then
		self:hit_enemy(impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, breed, self.hit_units, ranged_boost_curve_multiplier)
	elseif is_player then
		self:hit_player(impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, self.hit_units, ranged_boost_curve_multiplier)
	elseif not is_player then
		self:hit_non_level_unit(impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, self.hit_units, ranged_boost_curve_multiplier)
	end
end

PlayerProjectileHuskExtension.hit_afro = function (self, breed, hit_actor)
	local node = Actor.node(hit_actor)
	local hit_zone = breed.hit_zones_lookup[node]
	local hit_zone_name = hit_zone.name

	return hit_zone_name == "afro", hit_zone_name
end

PlayerProjectileHuskExtension.hit_enemy = function (self, impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, breed, hit_units, ranged_boost_curve_multiplier)
	if hit_actor == nil then
		return
	end

	if self:hit_afro(breed, hit_actor) then
		return
	end

	local owner_unit = self.owner_unit
	local damage_profile_name = impact_data.damage_profile or "default"
	local damage_profile = DamageProfileTemplates[damage_profile_name]
	local allow_link = true
	local aoe_data = impact_data.aoe

	if damage_profile then
		if not aoe_data then
			local node = Actor.node(hit_actor)
			local hit_zone = breed.hit_zones_lookup[node]
			local hit_zone_name = hit_zone.name
			local send_to_server = false
			local charge_value = damage_profile.charge_value or "projectile"
			local is_critical_strike = self._is_critical_strike
			local owner_unit = self.owner_unit
			local num_targets_hit = self.num_targets_hit + 1

			DamageUtils.buff_on_attack(owner_unit, hit_unit, charge_value, is_critical_strike, hit_zone_name, num_targets_hit, send_to_server)
		end

		allow_link = self:hit_enemy_damage(damage_profile, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, breed, ranged_boost_curve_multiplier, hit_units)
	end

	local grenade = impact_data.grenade

	if grenade or (aoe_data and self.max_mass <= self.amount_of_mass_hit) then
		self:do_aoe(aoe_data, hit_position)
		self:stop()
	end

	local current_action = self.current_action

	if current_action.use_max_targets then
		if current_action.max_targets <= self.num_targets_hit then
			if impact_data.link and self.did_damage and allow_link then
				self:link_projectile(hit_unit, hit_position, hit_direction, hit_normal, hit_actor, self.did_damage)
			end

			self:stop()
		end
	elseif self.max_mass <= self.amount_of_mass_hit then
		if impact_data.link and self.did_damage and allow_link then
			self:link_projectile(hit_unit, hit_position, hit_direction, hit_normal, hit_actor, self.did_damage)
		end

		self:stop()
	end
end

PlayerProjectileHuskExtension.hit_enemy_damage = function (self, damage_profile, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, breed, ranged_boost_curve_multiplier, hit_units)
	local network_manager = Managers.state.network
	local owner = self.owner_player
	local owner_unit = self.owner_unit
	local action = self.current_action
	local node = Actor.node(hit_actor)
	local hit_zone = breed.hit_zones_lookup[node]
	local hit_zone_name = action.projectile_info.forced_hitzone or hit_zone.name
	local attack_direction = hit_direction
	local was_alive = AiUtils.unit_alive(hit_unit)

	if was_alive then
		self.num_targets_hit = self.num_targets_hit + 1
		hit_units[hit_unit] = true
	end

	local target_settings = damage_profile.default_target
	local is_critical_strike = self._is_critical_strike
	local attack_template = AttackTemplates[target_settings.attack_template]
	local shield_blocked = false
	local trueflight_blocking = target_settings.trueflight_blocking

	if not action.ignore_shield_hit then
		shield_blocked = AiUtils.attack_is_shield_blocked(hit_unit, owner_unit, trueflight_blocking, hit_direction)
	end

	if was_alive then
		local action_mass_override = action.hit_mass_count
		local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
		local hit_mass_total = (shield_blocked and ((breed.hit_mass_counts_block and breed.hit_mass_counts_block[difficulty_rank]) or breed.hit_mass_count_block)) or (breed.hit_mass_counts and breed.hit_mass_counts[difficulty_rank]) or breed.hit_mass_count or 1

		if self.ignore_mass_and_armour then
			hit_mass_total = 1
		elseif action_mass_override and action_mass_override[breed.name] then
			local mass_cost_multiplier = action_mass_override[breed.name]
			hit_mass_total = hit_mass_total * (mass_cost_multiplier or 1)
		end

		self.amount_of_mass_hit = self.amount_of_mass_hit + hit_mass_total
	end

	local actual_target_index = math.ceil(self.amount_of_mass_hit)
	local hit_effect = action.hit_effect
	local is_husk = not owner.local_player
	local damage_sound = attack_template.sound_type
	local enemy_type = breed.name
	local hit_rotation = Quaternion.look(hit_normal)
	local power_level = self.power_level
	local damage_source = self.item_name
	local predicted_damage = DamageUtils.calculate_damage(DamageOutput, hit_unit, owner_unit, hit_zone_name, power_level, BoostCurves[target_settings.boost_curve_type], ranged_boost_curve_multiplier, is_critical_strike, damage_profile, actual_target_index, nil, damage_source)
	local no_damage = predicted_damage <= 0

	if was_alive and no_damage then
		self.did_damage = predicted_damage
		self.amount_of_mass_hit = self.max_mass

		self:stop()
	elseif was_alive and not action.ignore_armor and (breed.armor_category == 2 or breed.armor_category == 3 or shield_blocked) then
		self.did_damage = predicted_damage
		self.amount_of_mass_hit = self.max_mass

		self:stop()
	else
		self.did_damage = predicted_damage

		if hit_zone_name == "head" or hit_zone_name == "neck" then
			self.did_damage = predicted_damage - 1
		end

		EffectHelper.player_critical_hit(self.world, is_critical_strike, owner_unit, hit_unit, hit_position)
	end

	if hit_effect then
		EffectHelper.play_skinned_surface_material_effects(hit_effect, self.world, hit_unit, hit_position, hit_rotation, hit_normal, is_husk, enemy_type, damage_sound, no_damage, hit_zone_name)
	end

	return hit_zone_name ~= "ward"
end

PlayerProjectileHuskExtension.hit_player = function (self, impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, hit_units, ranged_boost_curve_multiplier)
	if hit_actor == nil then
		return
	end

	local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
	local hit = false
	local owner_player = self.owner_player
	local damage_profile_name = impact_data.damage_profile or "default"
	local damage_profile = DamageProfileTemplates[damage_profile_name]

	if damage_profile and DamageUtils.allow_friendly_fire_ranged(difficulty_settings, owner_player) and hit_units[hit_unit] == nil then
		self:hit_player_damage(damage_profile, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, ranged_boost_curve_multiplier, hit_units)

		hit = true
	end

	if hit then
		local aoe_data = impact_data.aoe

		if aoe_data and self.max_mass <= self.amount_of_mass_hit then
			self:do_aoe(aoe_data, hit_position)
			self:stop()
		end

		if self.max_mass <= self.amount_of_mass_hit then
			self:stop()
		end
	end
end

PlayerProjectileHuskExtension.hit_player_damage = function (self, damage_profile, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, ranged_boost_curve_multiplier, hit_units)
	local owner_unit = self.owner_unit
	hit_units[hit_unit] = true
	local num_targets_hit = self.num_targets_hit + 1
	self.num_targets_hit = num_targets_hit
	self.amount_of_mass_hit = self.amount_of_mass_hit + 1
	local actual_target_index = math.ceil(self.amount_of_mass_hit)
	local target_settings = damage_profile.default_target
	local attack_template = AttackTemplates[target_settings.attack_template]
	local action = self.current_action
	local hit_effect = action.hit_effect
	local owner = self.owner_player
	local is_husk = not owner.local_player
	local damage_sound = attack_template.sound_type
	local hit_rotation = Quaternion.look(hit_direction, Vector3.up())
	local power_level = self.power_level
	local hit_zone_name = "torso"
	local is_critical_strike = self._is_critical_strike
	local damage_source = self.item_name
	local predicted_damage = DamageUtils.calculate_damage(DamageOutput, hit_unit, owner_unit, hit_zone_name, power_level, BoostCurves[target_settings.boost_curve_type], ranged_boost_curve_multiplier, is_critical_strike, damage_profile, actual_target_index, nil, damage_source)
	local no_damage = predicted_damage <= 0

	if no_damage then
		self.did_damage = false
		self.stop_impacts = true
	else
		self.did_damage = predicted_damage
	end

	if hit_effect then
		EffectHelper.play_skinned_surface_material_effects(hit_effect, self.world, hit_unit, hit_position, hit_rotation, hit_normal, is_husk)
	end
end

PlayerProjectileHuskExtension.hit_level_unit = function (self, impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, hit_units, level_index, ranged_boost_curve_multiplier)
	local has_health_extension = ScriptUnit.has_extension(hit_unit, "health_system")
	local damage_profile_name = impact_data.damage_profile_prop or impact_data.damage_profile or "default"
	local damage_profile = DamageProfileTemplates[damage_profile_name]
	local allow_ranged_damage = Unit.get_data(hit_unit, "allow_ranged_damage") ~= false

	if damage_profile and (GameSettingsDevelopment.allow_ranged_attacks_to_damage_props or allow_ranged_damage) then
		if has_health_extension and hit_units[hit_unit] == nil then
			self:hit_damagable_prop(damage_profile, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, hit_units, level_index, ranged_boost_curve_multiplier)
		elseif hit_unit and Unit.alive(hit_unit) and hit_actor then
			local unit_set_flow_variable = Unit.set_flow_variable

			unit_set_flow_variable(hit_unit, "hit_actor", hit_actor)
			unit_set_flow_variable(hit_unit, "hit_direction", hit_direction)
			unit_set_flow_variable(hit_unit, "hit_position", hit_position)
			Unit.flow_event(hit_unit, "lua_simple_damage")
		end
	end

	local action = self.current_action
	local hit_effect = action.hit_effect

	if hit_effect then
		local world = self.world
		local hit_rotation = Quaternion.look(hit_direction)
		local owner = self.owner_player
		local is_husk = not owner.local_player

		EffectHelper.play_surface_material_effects(hit_effect, world, hit_unit, hit_position, hit_rotation, hit_normal, nil, is_husk, nil, hit_actor)
	end

	local bounce = impact_data.bounce_on_level_units and not Unit.get_data(hit_unit, "is_dummy")

	if bounce then
		local num_bounces = self.num_bounces
		local max_bounces = impact_data.max_bounces or 1

		if num_bounces < max_bounces then
			local locomotion_extension = self.locomotion_extension

			if locomotion_extension.bounce then
				locomotion_extension:bounce(hit_normal)

				self.num_bounces = self.num_bounces + 1

				return
			end
		end
	end

	local aoe_data = impact_data.aoe

	if aoe_data then
		self:do_aoe(aoe_data, hit_position)
	end

	if impact_data.link and hit_actor then
		self:link_projectile(hit_unit, hit_position, hit_direction, hit_normal, hit_actor)
	end

	self:stop()
end

PlayerProjectileHuskExtension.hit_damagable_prop = function (self, damage_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, hit_units, level_index, ranged_boost_curve_multiplier)
	hit_units[hit_unit] = true
end

PlayerProjectileHuskExtension.hit_non_level_unit = function (self, impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, hit_units, ranged_boost_curve_multiplier)
	local damage_profile_name = impact_data.damage_profile_prop or impact_data.damage_profile or "default"
	local damage_profile = DamageProfileTemplates[damage_profile_name]
	local stop_impacts = false

	if damage_profile then
		if ScriptUnit.has_extension(hit_unit, "health_system") and hit_units[hit_unit] == nil then
			self:hit_non_level_damagable_unit(damage_profile, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, hit_units, ranged_boost_curve_multiplier)

			stop_impacts = true
		elseif hit_unit and Unit.alive(hit_unit) and hit_actor then
			local unit_set_flow_variable = Unit.set_flow_variable

			unit_set_flow_variable(hit_unit, "hit_actor", hit_actor)
			unit_set_flow_variable(hit_unit, "hit_direction", hit_direction)
			unit_set_flow_variable(hit_unit, "hit_position", hit_position)
			Unit.flow_event(hit_unit, "lua_simple_damage")
		end
	end

	local aoe_data = impact_data.aoe

	if aoe_data then
		self:do_aoe(aoe_data, hit_position)

		stop_impacts = true
	end

	if stop_impacts then
		self:stop()
	end
end

PlayerProjectileHuskExtension.hit_non_level_damagable_unit = function (self, damage_profile, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, hit_units, ranged_boost_curve_multiplier)
	local network_manager = Managers.state.network
	hit_units[hit_unit] = true
	local action = self.current_action
	local hit_effect = action.hit_effect

	if hit_effect then
		local world = self.world
		local hit_rotation = Quaternion.look(hit_direction)
		local owner = self.owner_player
		local is_husk = not owner.local_player

		EffectHelper.play_surface_material_effects(hit_effect, world, hit_unit, hit_position, hit_rotation, hit_normal, nil, is_husk, nil, hit_actor)
	end
end

PlayerProjectileHuskExtension.link_projectile = function (self, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, damage)
	local unit_spawner = Managers.state.unit_spawner
	local projectile_linker_system = self.projectile_linker_system
	local owner_unit = self.owner_unit
	local projectile_info = self.projectile_info
	local impact_data = self.impact_data
	local dummy_linker_unit_name = projectile_info.dummy_linker_unit_name
	local broken_chance = math.random()
	local depth = impact_data.depth or 0.15
	local depth_offset = impact_data.depth_offset or 0.15

	if damage then
		broken_chance = broken_chance * math.clamp(damage / 2, 0.75, 1.25)
	else
		broken_chance = broken_chance * 2
	end

	if broken_chance <= 0.5 and projectile_info.dummy_linker_broken_units then
		local broken_unit_variations = #projectile_info.dummy_linker_broken_units
		local random_pick = math.floor(math.random(1, broken_unit_variations))
		dummy_linker_unit_name = projectile_info.dummy_linker_broken_units[random_pick]

		if random_pick == 1 then
			depth = 0.05
			depth_offset = 0.1
		else
			depth_offset = 0.15
		end
	elseif damage then
		depth = depth * math.clamp(damage, 1, 3)
	end

	local normalized_direction = Vector3.normalize(hit_direction)
	depth = depth + depth_offset
	local random_bank = math.random() * 2.14 - 0.5
	local link_position = hit_position + normalized_direction * depth
	local link_rotation = Quaternion.look(normalized_direction)
	local new_link_rotation = Quaternion.multiply(link_rotation, Quaternion(Vector3.forward(), random_bank))
	local has_projectile_linker_extension = ScriptUnit.has_extension(hit_unit, "projectile_linker_system")

	if has_projectile_linker_extension and hit_actor then
		local projectile_dummy = unit_spawner:spawn_local_unit(dummy_linker_unit_name, link_position, new_link_rotation)
		local node_index = Actor.node(hit_actor)
		local hit_node_rot = Unit.world_rotation(hit_unit, node_index)
		local hit_node_pos = Unit.world_position(hit_unit, node_index)
		local rel_pos = link_position - hit_node_pos
		local offset_position = Vector3(Vector3.dot(Quaternion.right(hit_node_rot), rel_pos), Vector3.dot(Quaternion.forward(hit_node_rot), rel_pos), Vector3.dot(Quaternion.up(hit_node_rot), rel_pos))
		local linker_extension = ScriptUnit.extension(hit_unit, "projectile_linker_system")

		linker_extension:link_projectile(projectile_dummy, offset_position, new_link_rotation, node_index)
		projectile_linker_system:add_linked_projectile_reference(owner_unit, projectile_dummy)
	elseif not has_projectile_linker_extension then
		local projectile_dummy = unit_spawner:spawn_local_unit(dummy_linker_unit_name, link_position, new_link_rotation)

		projectile_linker_system:add_linked_projectile_reference(owner_unit, projectile_dummy)
	end
end

PlayerProjectileHuskExtension.do_aoe = function (self, aoe_data, position)
	local world = self.world
	local unit = self.unit
	local owner_unit = self.owner_unit
	local item_name = self.item_name
	local is_server = self.is_server

	if aoe_data.explosion then
		local rotation = Unit.local_rotation(unit, 0)
		local scale = self.scale
		local power_level = self.power_level
		local is_husk = true

		DamageUtils.create_explosion(world, owner_unit, position, rotation, aoe_data, scale, item_name, is_server, is_husk, unit, power_level)
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

return
