PlayerProjectileUnitExtension = class(PlayerProjectileUnitExtension)
local DELETION_GRACE_TIMER = 0.3

PlayerProjectileUnitExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local item_name = extension_init_data.item_name
	local owner_unit = extension_init_data.owner_unit
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

	if impact_data then
		self.impact_data = impact_data
		local impact_damage_profile_name = impact_data.damage_profile or "default"
		self.impact_damage_profile_id = NetworkLookup.damage_profiles[impact_damage_profile_name]
	end

	if timed_data then
		self.timed_data = timed_data
		local timed_damage_profile_name = timed_data.damage_profile or "default"
		self.timed_damage_profile_id = NetworkLookup.damage_profiles[timed_damage_profile_name]
	end

	self.time_initialized = extension_init_data.time_initialized
	self.scale = extension_init_data.scale
	self.num_targets_hit = 0
	self.hit_units = {}
	self.hit_affro_units = {}
	local entity_manager = Managers.state.entity
	self.weapon_system = entity_manager:system("weapon_system")
	self.projectile_linker_system = entity_manager:system("projectile_linker_system")
	self.is_server = Managers.player.is_server
	self.marked_for_deletion = false
	self.did_damage = false
	self.num_bounces = 0
	self._is_critical_strike = not not extension_init_data.is_critical_strike

	self:initialize_projectile(projectile_info, impact_data)
end

PlayerProjectileUnitExtension.extensions_ready = function (self, world, unit)
	self.locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
	self.impact_extension = ScriptUnit.extension(unit, "projectile_impact_system")
end

PlayerProjectileUnitExtension.initialize_projectile = function (self, projectile_info, impact_data)
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

	if projectile_info.hide_projectile then
		Unit.set_unit_visibility(unit, false)
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
	if not self.marked_for_deletion then
		self.marked_for_deletion = true
		self.deletion_time = Managers.time:time("game") + DELETION_GRACE_TIMER
	end
end

PlayerProjectileUnitExtension.stop = function (self)
	if not self.stop_impacts then
		self:mark_for_deletion()
		Unit.flow_event(self.unit, "lua_projectile_end")
		self.locomotion_extension:stop()

		self.stop_impacts = true
		self.active = false
	end
end

PlayerProjectileUnitExtension.update = function (self, unit, input, _, context, t)
	if self.marked_for_deletion then
		if self.deletion_time <= t and not self.delete_done then
			self.delete_done = true

			Managers.state.unit_spawner:mark_for_deletion(self.unit)
		end

		return
	end

	if self.is_timed then
		self:handle_timed_events(t)
	end

	if self.is_impact and not self.stop_impacts then
		local impact_extension = self.impact_extension
		local recent_impacts, num_impacts = impact_extension:recent_impacts()

		if num_impacts > 0 then
			self:handle_impacts(recent_impacts, num_impacts)
		end
	end
end

PlayerProjectileUnitExtension.handle_timed_events = function (self, t)
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

PlayerProjectileUnitExtension.handle_impacts = function (self, impacts, num_impacts)
	local unit = self.unit
	local owner_unit = self.owner_unit
	local UNIT_INDEX = ProjectileImpactDataIndex.UNIT
	local POSITION_INDEX = ProjectileImpactDataIndex.POSITION
	local DIRECTION_INDEX = ProjectileImpactDataIndex.DIRECTION
	local NORMAL_INDEX = ProjectileImpactDataIndex.NORMAL
	local ACTOR_INDEX = ProjectileImpactDataIndex.ACTOR_INDEX
	local hit_units = self.hit_units
	local hit_affro_units = self.hit_affro_units
	local impact_data = self.impact_data
	local link = impact_data.link
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local unit_id = network_manager:unit_game_object_id(unit)
	local pos_min = NetworkConstants.position.min
	local pos_max = NetworkConstants.position.max

	for i = 1, num_impacts / ProjectileImpactDataIndex.STRIDE, 1 do
		if self.stop_impacts then
			break
		end

		local j = (i - 1) * ProjectileImpactDataIndex.STRIDE
		local hit_unit = impacts[j + UNIT_INDEX]
		local hit_position = impacts[j + POSITION_INDEX]:unbox()
		local hit_direction = impacts[j + DIRECTION_INDEX]:unbox()
		local hit_normal = impacts[j + NORMAL_INDEX]:unbox()
		local actor_index = impacts[j + ACTOR_INDEX]
		local hit_actor = Unit.actor(hit_unit, actor_index)
		local validate_position = self:validate_position(hit_position, pos_min, pos_max)

		if not validate_position then
			self:stop()
		end

		hit_unit, hit_actor = ActionUtils.redirect_shield_hit(hit_unit, hit_actor)
		local hit_self = hit_unit == owner_unit

		if not hit_self and validate_position and not hit_units[hit_unit] then
			local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

			if hud_extension then
				hud_extension.show_critical_indication = false
			end

			local breed = Unit.get_data(hit_unit, "breed")
			local hit_affro = false

			if breed and self:hit_afro(breed, hit_actor) then
				if not hit_affro_units[hit_unit] then
					if ScriptUnit.has_extension(hit_unit, "ai_system") then
						if self.is_server then
							AiUtils.alert_unit_of_enemy(hit_unit, owner_unit)
						elseif Unit.alive(owner_unit) then
							local network_manager = Managers.state.network

							network_manager.network_transmit:send_rpc_server("rpc_alert_enemy", network_manager:unit_game_object_id(hit_unit), network_manager:unit_game_object_id(owner_unit))
						end
					end

					if script_data.ai_debug_sound_detection then
						local drawer = Managers.state.debug:drawer({
							mode = "retained",
							name = "sound_alert_wizz"
						})

						drawer:sphere(hit_position, 1.5, Colors.get("blue"))
					end

					hit_affro_units[hit_unit] = true
				end

				hit_affro = true
			else
				hit_units[hit_unit] = true
			end

			if not hit_affro then
				if breed then
					local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
					local _, procced = buff_extension:apply_buffs_to_value(0, StatBuffIndex.AUTOMATIC_HEAD_SHOT)
					local node = Actor.node(hit_actor)
					local hit_zone = breed.hit_zones_lookup[node]

					if procced and breed.hit_zones.head and hit_zone.name ~= "head" and hit_zone.name ~= "ward" then
						local head_hit_zone = breed.hit_zones.head
						local actors = head_hit_zone.actors
						local num_actors = #actors

						for i = 1, num_actors, 1 do
							local actor_name = actors[i]
							local head_actor_index = Unit.find_actor(hit_unit, actor_name)

							if head_actor_index then
								local head_actor = Unit.actor(hit_unit, head_actor_index)
								local actor_position = Actor.center_of_mass(head_actor)
								local validate_position = self:validate_position(actor_position, pos_min, pos_max)

								if validate_position then
									hit_actor = head_actor
									actor_index = head_actor_index
									hit_position = actor_position

									break
								end
							end
						end
					end
				end

				local level_index, is_level_unit = network_manager:game_object_or_level_id(hit_unit)

				if self.is_server then
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

				local has_ranged_boost, ranged_boost_curve_multiplier = ActionUtils.get_ranged_boost(owner_unit)

				if breed then
					self:hit_enemy(impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, breed, has_ranged_boost, ranged_boost_curve_multiplier)
				elseif table.contains(PLAYER_AND_BOT_UNITS, hit_unit) then
					self:hit_player(impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, has_ranged_boost, ranged_boost_curve_multiplier)
				elseif is_level_unit or Unit.get_data(hit_unit, "is_dummy") then
					self:hit_level_unit(impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, level_index, has_ranged_boost, ranged_boost_curve_multiplier)
				elseif not is_level_unit then
					self:hit_non_level_unit(impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, has_ranged_boost, ranged_boost_curve_multiplier)
				end

				local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

				buff_extension:trigger_procs("on_ranged_hit")
			end
		end
	end
end

PlayerProjectileUnitExtension.hit_afro = function (self, breed, hit_actor)
	local node = Actor.node(hit_actor)
	local hit_zone = breed.hit_zones_lookup[node]
	local hit_zone_name = hit_zone.name

	return hit_zone_name == "afro", hit_zone_name
end

PlayerProjectileUnitExtension.hit_enemy = function (self, impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, breed, has_ranged_boost, ranged_boost_curve_multiplier)
	local owner_unit = self.owner_unit
	local shield_blocked = false
	local damage_profile_name = impact_data.damage_profile or "default"
	local damage_profile = DamageProfileTemplates[damage_profile_name]
	local allow_link = true
	local aoe_data = impact_data.aoe

	if damage_profile then
		local node = Actor.node(hit_actor)
		local hit_zone = breed.hit_zones_lookup[node]
		local hit_zone_name = hit_zone.name
		local send_to_server = true
		local charge_value = damage_profile.charge_value or "projectile"
		local is_critical_strike = self._is_critical_strike
		local owner_unit = self.owner_unit
		local num_targets_hit = self.num_targets_hit + 1

		DamageUtils.buff_on_attack(owner_unit, hit_unit, charge_value, is_critical_strike, hit_zone_name, num_targets_hit, send_to_server, "n/a")

		allow_link, shield_blocked = self:hit_enemy_damage(damage_profile, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, breed, has_ranged_boost, ranged_boost_curve_multiplier)
	end

	local grenade = impact_data.grenade

	if grenade or (aoe_data and self.max_mass <= self.amount_of_mass_hit) then
		self:do_aoe(aoe_data, hit_position)
		self:stop()
	end

	local current_action = self.current_action

	if current_action.use_max_targets then
		if current_action.max_targets <= self.num_targets_hit then
			if impact_data.link and allow_link then
				self:link_projectile(hit_unit, hit_position, hit_direction, hit_normal, hit_actor, self.did_damage, shield_blocked)
			end

			self:stop()
		end
	elseif self.max_mass <= self.amount_of_mass_hit then
		if impact_data.link and allow_link then
			self:link_projectile(hit_unit, hit_position, hit_direction, hit_normal, hit_actor, self.did_damage, shield_blocked)
		end

		self:stop()
	end

	if self.locomotion_extension.notify_hit_enemy then
		self.locomotion_extension:notify_hit_enemy(hit_unit)
	end

	self:_check_projectile_spawn(impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor)
end

PlayerProjectileUnitExtension.hit_enemy_damage = function (self, damage_profile, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, breed, has_ranged_boost, ranged_boost_curve_multiplier)
	local network_manager = Managers.state.network
	local owner = self.owner_player
	local owner_unit = self.owner_unit
	local action = self.current_action
	local node = Actor.node(hit_actor)
	local hit_zone = breed.hit_zones_lookup[node]
	local hit_zone_name = action.projectile_info.forced_hitzone or hit_zone.name
	local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
	local attack_direction = hit_direction
	local was_alive = AiUtils.unit_alive(hit_unit)

	if was_alive then
		self.num_targets_hit = self.num_targets_hit + 1
	end

	local power_level = self.power_level
	local is_critical_strike = self._is_critical_strike
	local target_settings = damage_profile.default_target
	local attack_template = AttackTemplates[target_settings.attack_template]
	local attacker_unit_id = network_manager:unit_game_object_id(owner_unit)
	local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
	local is_server = self.is_server
	local shield_blocked = false
	local trueflight_blocking = target_settings.trueflight_blocking

	if not action.ignore_shield_hit then
		shield_blocked = AiUtils.attack_is_shield_blocked(hit_unit, owner_unit, trueflight_blocking, hit_direction)
	end

	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	local breed = AiUtils.unit_breed(hit_unit)
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

		if self.ignore_mass_and_armour then
			hit_mass_total = 1
		elseif action_mass_override and action_mass_override[breed.name] then
			local mass_cost_multiplier = action_mass_override[breed.name]
			hit_mass_total = hit_mass_total * (mass_cost_multiplier or 1)
		end

		self.amount_of_mass_hit = self.amount_of_mass_hit + hit_mass_total
	end

	local actual_target_index = math.ceil(self.amount_of_mass_hit)
	local wall_nail = action.impact_data.wall_nail
	local hit_ragdoll_actor = nil

	if wall_nail then
		local actor_name = hit_zone.actor_name

		if breed.hitbox_ragdoll_translation then
			hit_ragdoll_actor = breed.hitbox_ragdoll_translation[actor_name]
		end
	end

	if hit_ragdoll_actor == nil then
		hit_ragdoll_actor = "n/a"
	end

	local hit_effect = action.hit_effect
	local is_husk = not owner.local_player
	local damage_sound = attack_template.sound_type
	local enemy_type = breed.name
	local hit_rotation = Quaternion.look(attack_direction, Vector3.up())
	local damage_source = self.item_name
	local damage_source_id = NetworkLookup.damage_sources[damage_source]
	local damage_profile_id = self.impact_damage_profile_id
	local weapon_system = self.weapon_system

	weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, damage_profile_id, "power_level", power_level, "hit_target_index", actual_target_index, "blocking", shield_blocked, "shield_break_procced", false, "boost_curve_multiplier", ranged_boost_curve_multiplier, "is_critical_strike", is_critical_strike)

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
		EffectHelper.play_skinned_surface_material_effects(hit_effect, self.world, hit_unit, hit_position, hit_rotation, hit_normal, is_husk, enemy_type, damage_sound, no_damage, hit_zone_name, shield_blocked)
	end

	if hit_zone_name == "head" and not shield_blocked then
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
		local _, procced = buff_extension:apply_buffs_to_value(0, StatBuffIndex.COOP_STAMINA)

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

	return hit_zone_name ~= "ward", shield_blocked
end

PlayerProjectileUnitExtension.hit_player = function (self, impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, has_ranged_boost, ranged_boost_curve_multiplier)
	local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
	local hit = false
	local owner_player = self.owner_player
	local damage_profile_name = impact_data.damage_profile or "default"
	local damage_profile = DamageProfileTemplates[damage_profile_name]

	if damage_profile and DamageUtils.allow_friendly_fire_ranged(difficulty_settings, owner_player) then
		self:hit_player_damage(damage_profile, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, has_ranged_boost, ranged_boost_curve_multiplier)

		hit = true
	end

	if hit then
		local aoe_data = impact_data.aoe

		if aoe_data and self.max_mass <= self.amount_of_mass_hit then
			self:do_aoe(aoe_data, hit_position)
			self:stop()
		end

		local action = self.current_action

		if action.use_max_targets then
			if action.max_targets <= self.num_targets_hit then
				self:stop()
			end
		elseif self.max_mass <= self.amount_of_mass_hit then
			self:stop()
		end
	end

	self:_check_projectile_spawn(self, impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor)
end

ProjectileSpawners = {
	flame_wave = function (self, projectile_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor)
		local owner_unit = self.owner_unit
		local scale = projectile_data.scale
		local item_name = self.item_name
		local action_lookup_data = self.action_lookup_data
		local item_template_name = action_lookup_data.item_template_name
		local action_name = action_lookup_data.action_name
		local sub_action_name = projectile_data.sub_action_name
		local position = hit_position
		local flat_direction = Vector3.normalize(Vector3.flat(hit_direction))
		local flat_angle = -math.atan2(flat_direction.x, flat_direction.y)
		local lateral_speed = 0
		local initial_forward_speed = projectile_data.initial_forward_speed

		Managers.state.entity:system("projectile_system"):spawn_flame_wave_projectile(owner_unit, scale, item_name, item_template_name, action_name, sub_action_name, position, flat_angle, lateral_speed, initial_forward_speed, 0)
	end,
	split_bounce = function (self, projectile_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor)
		local owner_unit = self.owner_unit
		local scale = projectile_data.scale
		local item_name = self.item_name
		local action_lookup_data = self.action_lookup_data
		local item_template_name = action_lookup_data.item_template_name
		local action_name = action_lookup_data.action_name
		local sub_action_name = projectile_data.sub_action_name
		local bounce_dir = hit_direction - 2 * Vector3.dot(hit_direction, hit_normal) * hit_normal
		local spread = Math.random() * math.pi * 2
		local angle = math.pi / 16

		for i = 1, 2, 1 do
			local spread_angle = (2 * i - 3) * spread
			local pitch = Quaternion(Vector3.right(), spread_angle)
			local roll = Quaternion(Vector3.forward(), spread)
			local spread_rot = Quaternion.multiply(roll, pitch)
			local new_dir = Quaternion.rotate(spread_rot, bounce_dir)
			local rotation = Quaternion.look(new_dir, Vector3.up())
			local scale = self.scale
			local angle = math.asin(new_dir.z)
			local target_vector = new_dir
			local speed = ScriptUnit.extension(self.unit, "projectile_locomotion_system").speed * 0.5
			local position = hit_position + new_dir * 0.5

			Managers.state.entity:system("projectile_system"):spawn_player_projectile(owner_unit, position, rotation, scale, angle, target_vector, speed, item_name, item_template_name, action_name, sub_action_name)
		end
	end
}

PlayerProjectileUnitExtension._check_projectile_spawn = function (self, impact_data, ...)
	local projectile_data = impact_data.projectile_spawn

	if projectile_data then
		local spawner_function = ProjectileSpawners[projectile_data.spawner_function]

		spawner_function(self, projectile_data, ...)
	end
end

PlayerProjectileUnitExtension.hit_player_damage = function (self, damage_profile, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, has_ranged_boost, ranged_boost_curve_multiplier)
	local owner_unit = self.owner_unit
	local network_manager = Managers.state.network
	local attacker_unit_id = network_manager:unit_game_object_id(owner_unit)
	local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
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
	local damage_source = self.item_name
	local damage_profile_id = self.impact_damage_profile_id
	local power_level = self.power_level
	local hit_zone_name = "torso"
	local is_critical_strike = self._is_critical_strike
	local damage_source_id = NetworkLookup.damage_sources[damage_source]
	local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
	local weapon_system = self.weapon_system

	weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, hit_direction, damage_profile_id, "power_level", power_level, "hit_target_index", actual_target_index, "blocking", false, "shield_break_procced", false, "boost_curve_multiplier", ranged_boost_curve_multiplier, "is_critical_strike", is_critical_strike)

	local predicted_damage = DamageUtils.calculate_damage(DamageOutput, hit_unit, owner_unit, hit_zone_name, power_level, BoostCurves[target_settings.boost_curve_type], ranged_boost_curve_multiplier, is_critical_strike, damage_profile, actual_target_index, nil, damage_source)
	local no_damage = predicted_damage <= 0

	if no_damage then
		self.did_damage = false

		self:stop()
	else
		self.did_damage = predicted_damage
	end

	if hit_effect then
		EffectHelper.play_skinned_surface_material_effects(hit_effect, self.world, hit_unit, hit_position, hit_rotation, hit_normal, is_husk)
	end
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

	if script_data.debug_arrow_impacts then
		QuickDrawerStay:cylinder(hit_position + hit_direction * 0.3, hit_position - hit_direction * 0.3, 0.02, Color(0, 0, 255))
	end

	local action = self.current_action
	local hit_effect = action.hit_effect

	if hit_effect then
		local world = self.world
		local hit_rotation = Quaternion.look(hit_direction)
		local owner_unit = self.owner_unit
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

	if impact_data.link then
		self:link_projectile(hit_unit, hit_position, hit_direction, hit_normal, hit_actor)
	end

	self:stop()
	self:_check_projectile_spawn(impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor)
end

PlayerProjectileUnitExtension.hit_damagable_prop = function (self, damage_profile, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, level_index, has_ranged_boost, ranged_boost_curve_multiplier)
	self.amount_of_mass_hit = self.amount_of_mass_hit + 1
	local target_index = math.ceil(self.amount_of_mass_hit)
	local owner_unit = self.owner_unit
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
			local action = self.current_action

			if not action.no_headshot_sound and AiUtils.unit_alive(hit_unit) then
				local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

				first_person_extension:play_hud_sound_event("Play_hud_headshot", nil, false)
			end
		end

		local check_backstab = false

		DamageUtils.damage_dummy_unit(hit_unit, owner_unit, hit_zone_name, power_level, ranged_boost_curve_multiplier, is_critical_strike, damage_profile, target_index, hit_position, hit_direction, damage_source, hit_actor, self.impact_damage_profile_id or self.timed_damage_profile_id, nil, check_backstab)
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

	if impact_data.link then
		self:link_projectile(hit_unit, hit_position, hit_direction, hit_normal, hit_actor)

		stop_impacts = true
	end

	local aoe_data = impact_data.aoe

	if aoe_data then
		self:do_aoe(aoe_data, hit_position)

		stop_impacts = true
	end

	if stop_impacts then
		self:stop()
	end

	self:_check_projectile_spawn(impact_data, hit_unit, hit_position, hit_direction, hit_normal, hit_actor)
end

PlayerProjectileUnitExtension.hit_non_level_damagable_unit = function (self, damage_profile, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, has_ranged_boost, ranged_boost_curve_multiplier)
	local network_manager = Managers.state.network
	local target_settings = damage_profile.default_target
	local hit_zone_name = "full"
	local owner_unit = self.owner_unit
	local attacker_unit_id = network_manager:unit_game_object_id(owner_unit)
	local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
	local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
	local damage_source = self.item_name
	local damage_source_id = NetworkLookup.damage_sources[damage_source]
	local damage_profile_id = self.impact_damage_profile_id
	local power_level = self.power_level
	local is_critical_strike = self._is_critical_strike
	local weapon_system = self.weapon_system

	weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, hit_direction, damage_profile_id, "power_level", power_level, "hit_target_index", nil, "blocking", false, "shield_break_procced", false, "boost_curve_multiplier", ranged_boost_curve_multiplier, "is_critical_strike", is_critical_strike)

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

PlayerProjectileUnitExtension.link_projectile = function (self, hit_unit, hit_position, hit_direction, hit_normal, hit_actor, damage, shield_blocked)
	local unit_spawner = Managers.state.unit_spawner
	local projectile_linker_system = self.projectile_linker_system
	local owner_unit = self.owner_unit
	local projectile_info = self.projectile_info
	local dummy_linker_unit_name = projectile_info.dummy_linker_unit_name
	local broken_chance = math.random()
	local impact_data = self.impact_data
	local depth = impact_data.depth or 0.15
	local depth_offset = impact_data.depth_offset or 0.15

	if damage and not shield_blocked then
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
	elseif damage and not shield_blocked then
		depth = depth * math.clamp(damage, 1, 3)
	end

	if shield_blocked then
		depth = -0.1
	end

	local normalized_direction = Vector3.normalize(hit_direction)
	depth = depth + depth_offset
	local random_bank = math.random() * 2.14 - 0.5
	local link_position = hit_position + normalized_direction * depth
	local link_rotation = Quaternion.look(normalized_direction)
	local new_link_rotation = link_rotation
	local node_index = Actor.node(hit_actor)

	if shield_blocked then
		local breed = Unit.get_data(hit_unit, "breed")

		if breed and not breed.no_effects_on_shield_block and AiUtils.unit_alive(hit_unit) then
			local hit_inventory_extension = ScriptUnit.extension(hit_unit, "ai_inventory_system")
			hit_unit = hit_inventory_extension.inventory_item_shield_unit
			local shield_index = Unit.node(hit_unit, "c_mesh")
			local shield_origo = Unit.world_position(hit_unit, shield_index) + normalized_direction * depth
			local shield_to_projectile_hit = link_position - shield_origo
			local shield_to_projectile_hit_distance = Vector3.length(shield_to_projectile_hit)
			local offset_distance = math.min(shield_to_projectile_hit_distance, 0.25)
			local shield_projectile_position = shield_origo + shield_to_projectile_hit * offset_distance
			link_position = shield_projectile_position
			node_index = shield_index
		end
	end

	if ScriptUnit.has_extension(hit_unit, "projectile_linker_system") then
		local projectile_dummy = unit_spawner:spawn_local_unit(dummy_linker_unit_name, link_position, new_link_rotation)
		local hit_node_rot = Unit.world_rotation(hit_unit, node_index)
		local hit_node_pos = Unit.world_position(hit_unit, node_index)
		local rel_pos = link_position - hit_node_pos
		local offset_position = Vector3(Vector3.dot(Quaternion.right(hit_node_rot), rel_pos), Vector3.dot(Quaternion.forward(hit_node_rot), rel_pos), Vector3.dot(Quaternion.up(hit_node_rot), rel_pos))
		local linker_extension = ScriptUnit.extension(hit_unit, "projectile_linker_system")

		linker_extension:link_projectile(projectile_dummy, offset_position, new_link_rotation, node_index)
		projectile_linker_system:add_linked_projectile_reference(hit_unit, projectile_dummy)
	else
		local projectile_dummy = unit_spawner:spawn_local_unit(dummy_linker_unit_name, link_position, new_link_rotation)

		projectile_linker_system:add_linked_projectile_reference(hit_unit, projectile_dummy)
	end
end

PlayerProjectileUnitExtension.do_aoe = function (self, aoe_data, position)
	local world = self.world
	local unit = self.unit
	local owner_unit = self.owner_unit
	local item_name = self.item_name
	local is_server = self.is_server

	if aoe_data.explosion then
		local rotation = Unit.local_rotation(self.unit, 0)
		local scale = self.scale
		local power_level = self.power_level
		local is_husk = false

		DamageUtils.create_explosion(world, owner_unit, position, rotation, aoe_data, scale, item_name, is_server, is_husk, unit, power_level, self._is_critical_strike)
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
	local dir = dir
	local liquid = math.floor(self.scale * 30)
	local extension_init_data = {
		area_damage_system = {
			flow_dir = dir,
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

return
