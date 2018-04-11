local function calculate_attack_direction(action, weapon_rotation)
	local quaternion_axis = action.attack_direction or "forward"
	local attack_direction = Quaternion[quaternion_axis](weapon_rotation)

	return (action.invert_attack_direction and -attack_direction) or attack_direction
end

local unit_get_data = Unit.get_data
ActionSweep = class(ActionSweep)
ActionSweep.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	self.world = world
	self.owner_unit = owner_unit
	self.first_person_unit = first_person_unit
	self.weapon_unit = weapon_unit
	self.item_name = item_name
	self.weapon_system = weapon_system
	self._is_critical_strike = false
	self.has_played_rumble_effect = false
	self.owner = Managers.player:unit_owner(self.owner_unit)
	self.stored_half_extents = Vector3Box()
	self.stored_position = Vector3Box()
	self.stored_rotation = QuaternionBox()
	local weapon_pose, weapon_half_extents = Unit.box(damage_unit)

	self.stored_half_extents:store(weapon_half_extents)

	self.hit_units = {}
	self.could_damage_last_update = false
	self.status_extension = ScriptUnit.extension(owner_unit, "status_system")
	self.is_server = is_server
	self.action_buff_data = {}
	self._drawer = Managers.state.debug:drawer({
		mode = "retained",
		name = "weapon_system"
	})

	return 
end
ActionSweep.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	self.has_played_rumble_effect = false
	self.current_action = new_action
	self.action_time_started = t
	self.has_hit_environment = false
	self.has_hit_target = false
	self.target_breed_unit = nil
	self.number_of_hit_enemies = 0
	self.amount_of_mass_hit = 0
	self.network_manager = Managers.state.network
	local owner_unit = self.owner_unit
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	local career_extension = ScriptUnit.extension(owner_unit, "career_system")
	self.owner_buff_extension = buff_extension
	self.owner_career_extension = career_extension
	local has_melee_boost, boost_curve_multiplier = career_extension.has_melee_boost(career_extension)
	self.melee_boost_curve_multiplier = boost_curve_multiplier
	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, new_action, t) or has_melee_boost
	self.power_level = power_level
	self.power_level = buff_extension.apply_buffs_to_value(buff_extension, power_level, StatBuffIndex.POWER_LEVEL_MELEE)
	local action_hand = action_init_data and action_init_data.action_hand
	local damage_profile_name = (action_hand and new_action["damage_profile_" .. action_hand]) or new_action.damage_profile or "default"
	self.action_hand = action_hand
	self.damage_profile_id = NetworkLookup.damage_profiles[damage_profile_name]
	local damage_profile = DamageProfileTemplates[damage_profile_name]
	self.damage_profile = damage_profile
	local cleave_distribution = damage_profile.cleave_distribution or DefaultCleaveDistribution
	local cleave_range = Cleave.max - Cleave.min
	local cleave_power_level = ActionUtils.scale_powerlevels(self.power_level, "cleave", owner_unit)
	local attack_cleave_power_level = cleave_power_level * cleave_distribution.attack
	local attack_percentage = DamageUtils.get_power_level_percentage(attack_cleave_power_level)
	local max_targets_attack = cleave_range * attack_percentage
	local impact_cleave_power_level = cleave_power_level * cleave_distribution.impact
	local impact_percentage = DamageUtils.get_power_level_percentage(impact_cleave_power_level)
	local max_targets_impact = cleave_range * impact_percentage
	max_targets_attack = buff_extension.apply_buffs_to_value(buff_extension, max_targets_attack or 1, StatBuffIndex.INCREASED_MAX_TARGETS)
	max_targets_impact = buff_extension.apply_buffs_to_value(buff_extension, max_targets_impact or 1, StatBuffIndex.INCREASED_MAX_TARGETS)

	if buff_extension.has_buff_type(buff_extension, "armor penetration") then
		max_targets_impact = max_targets_impact * 2
	end

	self.max_targets_attack = max_targets_attack
	self.max_targets_impact = max_targets_impact
	self.max_targets = (max_targets_impact < max_targets_attack and max_targets_attack) or max_targets_impact
	self.down_offset = new_action.sweep_z_offset or 0.1
	self.auto_aim_reset = false

	if not Managers.player:owner(self.owner_unit).bot_player then
		Managers.state.controller_features:add_effect("rumble", {
			rumble_effect = "light_swing"
		})
	end

	local first_person_unit = self.first_person_unit
	local owner_player = Managers.player:owner(owner_unit)

	if global_is_inside_inn then
		self.down_offset = 0
	end

	self.attack_aborted = false

	for k, v in pairs(self.hit_units) do
		self.hit_units[k] = nil
	end

	buff_extension.trigger_procs(buff_extension, "on_sweep")

	self.ignore_mass_and_armour = buff_extension.has_buff_type(buff_extension, "ignore_mass_and_armour")

	if is_critical_strike then
		Unit.flow_event(owner_unit, "vfx_critical_strike")
		Unit.flow_event(first_person_unit, "vfx_critical_strike")

		local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

		if hud_extension then
			hud_extension.show_critical_indication = true
		end

		buff_extension.trigger_procs(buff_extension, "on_critical_sweep")

		local crit_hud_sound_event = "Play_player_combat_crit_swing_2D"
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

		first_person_extension.play_hud_sound_event(first_person_extension, crit_hud_sound_event, nil, false)
	end

	self._is_critical_strike = is_critical_strike
	self._started_damage_window = false

	Unit.flow_event(first_person_unit, "sfx_swing_started")

	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

	first_person_extension.disable_rig_movement(first_person_extension)

	local physics_world = World.get_data(self.world, "physics_world")
	local pos = first_person_extension.current_position(first_person_extension)
	local rot = first_person_extension.current_rotation(first_person_extension)
	local direction = Quaternion.forward(rot)
	local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
	local collision_filter = (DamageUtils.allow_friendly_fire_melee(difficulty_settings, owner_player) and "filter_melee_sweep") or "filter_melee_sweep_no_player"
	local results = PhysicsWorld.immediate_raycast(physics_world, pos, direction, new_action.dedicated_target_range, "all", "collision_filter", collision_filter)

	if results then
		local num_results = #results

		for i = 1, num_results, 1 do
			local result = results[i]
			local actor = result[4]
			local hit_unit = Actor.unit(actor)
			local breed = unit_get_data(hit_unit, "breed")

			if breed then
				local node = Actor.node(actor)
				local hit_zone = breed.hit_zones_lookup[node]

				if hit_zone.name ~= "afro" then
					local target_health_extension = ScriptUnit.extension(hit_unit, "health_system")

					if target_health_extension.is_alive(target_health_extension) then
						self.target_breed_unit = hit_unit

						break
					end
				end
			end
		end
	end

	local weapon_unit = self.weapon_unit
	local rotation = Unit.world_rotation(weapon_unit, 0)
	local weapon_up_dir = Quaternion.up(rotation)
	local weapon_up_offset_mod = new_action.weapon_up_offset_mod or 0
	local weapon_up_offset = weapon_up_dir * weapon_up_offset_mod
	local actual_position_initial = POSITION_LOOKUP[weapon_unit]
	local position_initial = Vector3(actual_position_initial.x, actual_position_initial.y, actual_position_initial.z - self.down_offset) + weapon_up_offset

	self.stored_position:store(position_initial)
	self.stored_rotation:store(rotation)

	self.could_damage_last_update = false

	if new_action.lookup_data.sub_action_name == "assassinate" then
		local buff = buff_extension.get_non_stacking_buff(buff_extension, "assassinate")

		buff_extension.remove_buff(buff_extension, buff.id)
	end

	self._drawer:reset()

	return 
end
local SWEEP_RESULTS = {}

if PhysicsWorld.stop_reusing_sweep_tables then
	PhysicsWorld.stop_reusing_sweep_tables()
end

ActionSweep.client_owner_post_update = function (self, dt, t, world, _, current_time_in_action)
	local unit = self.weapon_unit
	local owner_unit = self.owner_unit
	local current_action = self.current_action
	local physics_world = World.get_data(world, "physics_world")
	local max_dt = current_action.forced_interpolation or 0.016666666666666666
	local current_dt = 0
	local aborted = false
	local start_position = self.stored_position:unbox()
	local start_rotation = self.stored_rotation:unbox()
	local end_position = POSITION_LOOKUP[unit]
	local end_rotation = Unit.world_rotation(unit, 0)
	local i = 0

	if (aborted or self.attack_aborted) and current_action.reset_aim_on_attack and not self.auto_aim_reset then
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

		first_person_extension.reset_aim_assist_multiplier(first_person_extension)

		self.auto_aim_reset = true
	end

	local can_damage = nil

	while not aborted and not self.attack_aborted and current_dt < dt do
		i = i + 1
		local interpolated_dt = math.min(max_dt, dt - current_dt)
		current_dt = math.min(current_dt + max_dt, dt)
		local lerp_t = current_dt / dt
		local current_position = Vector3.lerp(start_position, end_position, lerp_t)
		local current_rotation = Quaternion.lerp(start_rotation, end_rotation, lerp_t)
		can_damage = self._is_within_damage_window(self, current_time_in_action - 2 * dt + current_dt, current_action, owner_unit)
		aborted = self._do_overlap(self, interpolated_dt, t, unit, owner_unit, current_action, physics_world, can_damage, current_position, current_rotation)
	end

	local hud_extension = ScriptUnit.has_extension(self.owner_unit, "hud_system")

	if hud_extension and self._is_critical_strike then
		if can_damage and not self._started_damage_window then
			self._started_damage_window = true
		elseif not can_damage and hud_extension.show_critical_indication and self._started_damage_window then
			hud_extension.show_critical_indication = false
		end
	end

	return 
end
ActionSweep._is_within_damage_window = function (self, current_time_in_action, action, owner_unit)
	local damage_window_start = action.damage_window_start
	local damage_window_end = action.damage_window_end

	if not damage_window_start and not damage_window_end then
		return false
	end

	local anim_time_scale = action.anim_time_scale or 1
	anim_time_scale = ActionUtils.apply_attack_speed_buff(anim_time_scale, owner_unit)
	damage_window_start = damage_window_start / anim_time_scale
	damage_window_end = damage_window_end or action.total_time or math.huge
	damage_window_end = damage_window_end / anim_time_scale
	local after_start = damage_window_start < current_time_in_action
	local before_end = current_time_in_action < damage_window_end

	return after_start and before_end
end
ActionSweep._calculate_hit_mass = function (self, difficulty_rank, target_health_extension, actual_hit_target_index, shield_blocked, current_action, breed, hit_unit_id)
	local can_damage = false
	local can_stagger = false
	local buff_extension = self.owner_buff_extension

	if target_health_extension.is_alive(target_health_extension) then
		can_damage = self.amount_of_mass_hit <= self.max_targets_attack
		can_stagger = self.amount_of_mass_hit <= self.max_targets_impact
		local hit_mass_total = (shield_blocked and ((breed.hit_mass_counts_block and breed.hit_mass_counts_block[difficulty_rank]) or breed.hit_mass_count_block)) or (breed.hit_mass_counts and breed.hit_mass_counts[difficulty_rank]) or breed.hit_mass_count or 1
		local action_mass_override = current_action.hit_mass_count

		if self.ignore_mass_and_armour then
			hit_mass_total = 1
		elseif action_mass_override and action_mass_override[breed.name] then
			local mass_cost_multiplier = action_mass_override[breed.name]
			hit_mass_total = hit_mass_total * (mass_cost_multiplier or 1)
		end

		local game = self.network_manager:game()
		local hit_unit_action_id = GameSession.game_object_field(game, hit_unit_id, "bt_action_name")
		local hit_unit_action_name = NetworkLookup.bt_action_names[hit_unit_action_id]

		if hit_unit_action_name == "stagger" then
			hit_mass_total = hit_mass_total * 0.75
		end

		if buff_extension.has_buff_perk(buff_extension, "hit_mass_override") then
			hit_mass_total = hit_mass_total * 0.75
		end

		self.amount_of_mass_hit = self.amount_of_mass_hit + hit_mass_total
		self.number_of_hit_enemies = self.number_of_hit_enemies + 1
		actual_hit_target_index = self.number_of_hit_enemies
	else
		shield_blocked = false
	end

	return math.ceil(actual_hit_target_index), shield_blocked, can_damage, can_stagger
end
ActionSweep._calculate_hit_mass_level_object = function (self, unit, target_health_extension, actual_hit_target_index, current_action)
	local can_damage = false
	local can_stagger = false
	local buff_extension = self.owner_buff_extension

	if target_health_extension.is_alive(target_health_extension) then
		can_damage = self.amount_of_mass_hit <= self.max_targets_attack
		can_stagger = self.amount_of_mass_hit <= self.max_targets_impact
		local hit_mass_total = unit_get_data(unit, "hit_mass")
		local action_mass_override = current_action.hit_mass_count

		if self.ignore_mass_and_armour then
			hit_mass_total = 1
		end

		self.amount_of_mass_hit = self.amount_of_mass_hit + hit_mass_total
		self.number_of_hit_enemies = self.number_of_hit_enemies + 1
	end

	return 
end
ActionSweep._do_overlap = function (self, dt, t, unit, owner_unit, current_action, physics_world, can_damage, current_position, current_rotation)
	local drawer = self._drawer
	local current_time_in_action = t - self.action_time_started
	local current_rot_up = Quaternion.up(current_rotation)
	local hit_environment_rumble = false
	local weapon_system = self.weapon_system

	if self.attack_aborted then
		return 
	end

	local weapon_up_dir = Quaternion.up(current_rotation)
	local weapon_up_offset_mod = current_action.weapon_up_offset_mod or 0
	local weapon_up_offset = weapon_up_dir * weapon_up_offset_mod

	if not can_damage and not self.could_damage_last_update then
		local actual_last_position_current = current_position
		local last_position_current = Vector3(actual_last_position_current.x, actual_last_position_current.y, actual_last_position_current.z - self.down_offset) + weapon_up_offset

		self.stored_position:store(last_position_current)
		self.stored_rotation:store(current_rotation)

		return 
	end

	final_frame = not can_damage and self.could_damage_last_update
	self.could_damage_last_update = can_damage
	local position_previous = self.stored_position:unbox()
	local rotation_previous = self.stored_rotation:unbox()
	local weapon_up_dir_previous = Quaternion.up(rotation_previous)
	local actual_position_current = current_position
	local position_current = Vector3(actual_position_current.x, actual_position_current.y, actual_position_current.z - self.down_offset) + weapon_up_offset
	local rotation_current = current_rotation

	self.stored_position:store(position_current)
	self.stored_rotation:store(rotation_current)

	local weapon_half_extents = self.stored_half_extents:unbox()
	local weapon_half_length = weapon_half_extents.z
	local range_mod = current_action.range_mod or 1
	local width_mod = (current_action.width_mod and current_action.width_mod * 1.25) or 25
	local height_mod = (current_action.height_mod and current_action.height_mod * 1.25) or 4

	if global_is_inside_inn then
		range_mod = 0.65 * range_mod
		width_mod = width_mod / 4
	end

	weapon_half_length = weapon_half_length * range_mod
	weapon_half_extents.x = weapon_half_extents.x * width_mod
	weapon_half_extents.y = weapon_half_extents.y * height_mod

	if script_data.debug_weapons then
		drawer.capsule(drawer, position_previous, position_previous + weapon_up_dir_previous * weapon_half_length * 2, 0.02)
		drawer.capsule(drawer, position_current, position_current + current_rot_up * weapon_half_length * 2, 0.01, Color(0, 0, 255))
		Debug.text("Missed target count: %d", self.missed_targets or 0)
	end

	local weapon_rot = current_rotation
	local middle_rot = Quaternion.lerp(rotation_previous, weapon_rot, 0.5)
	local position_start = position_previous + weapon_up_dir_previous * weapon_half_length
	local position_end = (position_previous + current_rot_up * weapon_half_length * 2) - Quaternion.up(rotation_previous) * weapon_half_length
	local max_num_hits = 5
	local attack_direction = calculate_attack_direction(current_action, weapon_rot)
	local owner_player = Managers.player:owner(owner_unit)
	local weapon_cross_section = Vector3(weapon_half_extents.x, weapon_half_extents.y, 0.0001)
	local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
	local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
	local collision_filter = (DamageUtils.allow_friendly_fire_melee(difficulty_settings, owner_player) and "filter_melee_sweep") or "filter_melee_sweep_no_player"

	if PhysicsWorld.start_reusing_sweep_tables then
		PhysicsWorld.start_reusing_sweep_tables()
	end

	local sweep_results1 = PhysicsWorld.linear_obb_sweep(physics_world, position_previous, position_previous + weapon_up_dir_previous * weapon_half_length * 2, weapon_cross_section, rotation_previous, max_num_hits, "collision_filter", collision_filter, "report_initial_overlap")
	local sweep_results2 = PhysicsWorld.linear_obb_sweep(physics_world, position_start, position_end, weapon_half_extents, rotation_previous, max_num_hits, "collision_filter", collision_filter, "report_initial_overlap")
	local sweep_results3 = PhysicsWorld.linear_obb_sweep(physics_world, position_previous + current_rot_up * weapon_half_length, position_current + current_rot_up * weapon_half_length, weapon_half_extents, rotation_current, max_num_hits, "collision_filter", collision_filter, "report_initial_overlap")
	local num_results1 = 0
	local num_results2 = 0
	local num_results3 = 0

	if sweep_results1 then
		num_results1 = #sweep_results1

		for i = 1, num_results1, 1 do
			SWEEP_RESULTS[i] = sweep_results1[i]
		end
	end

	if sweep_results2 then
		for i = 1, #sweep_results2, 1 do
			local info = sweep_results2[i]
			local this_actor = info.actor
			local found = nil

			for j = 1, num_results1, 1 do
				if SWEEP_RESULTS[j].actor == this_actor then
					found = true
				end
			end

			if not found then
				num_results2 = num_results2 + 1
				SWEEP_RESULTS[num_results1 + num_results2] = info
			end
		end
	end

	if sweep_results3 then
		for i = 1, #sweep_results3, 1 do
			local info = sweep_results3[i]
			local this_actor = info.actor
			local found = nil

			for j = 1, num_results1 + num_results2, 1 do
				if SWEEP_RESULTS[j].actor == this_actor then
					found = true
				end
			end

			if not found then
				num_results3 = num_results3 + 1
				SWEEP_RESULTS[num_results1 + num_results2 + num_results3] = info
			end
		end
	end

	for i = num_results1 + num_results2 + num_results3 + 1, #SWEEP_RESULTS, 1 do
		SWEEP_RESULTS[i] = nil
	end

	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	local sound_effect_extension = ScriptUnit.has_extension(owner_unit, "sound_effect_system")
	local owner_unit_direction = Quaternion.forward(Unit.local_rotation(owner_unit, 0))
	local owner_unit_pos = Unit.world_position(owner_unit, 0)
	local damage_profile = self.damage_profile
	local hit_units = self.hit_units
	local environment_unit_hit = false

	for i = 1, num_results1 + num_results2 + num_results3, 1 do
		local result = SWEEP_RESULTS[i]
		local hit_actor = result.actor
		local hit_unit = Actor.unit(hit_actor)
		local hit_position = result.position
		local hit_armor = false

		if Unit.alive(hit_unit) and Vector3.is_valid(hit_position) then
			fassert(Vector3.is_valid(hit_position), "The hit position is not valid! Actor: %s, Unit: %s", hit_actor, hit_unit)
			assert(hit_unit, "hit_unit is nil.")

			hit_unit, hit_actor = DamageUtils.redirect_shield_hit(hit_unit, hit_actor)
			local breed = unit_get_data(hit_unit, "breed")
			local is_dodging = false
			local is_server = self.is_server
			local in_view = first_person_extension.is_within_default_view(first_person_extension, hit_position)
			local is_player = table.contains(PLAYER_AND_BOT_UNITS, hit_unit)
			local is_character = breed or is_player
			local hit_self = hit_unit == owner_unit
			local shield_blocked = false

			if breed and breed.can_dodge then
				is_dodging = AiUtils.attack_is_dodged(hit_unit)
			end

			if is_character and hit_units[hit_unit] == nil and in_view and not hit_self then
				hit_units[hit_unit] = true
				shield_blocked = is_dodging or (AiUtils.attack_is_shield_blocked(hit_unit, owner_unit) and not current_action.ignore_armour_hit and not self.ignore_mass_and_armour)
				local network_manager = self.network_manager
				local target_health_extension = ScriptUnit.extension(hit_unit, "health_system")
				local can_damage = false
				local can_stagger = false
				local hit_unit_id = network_manager.unit_game_object_id(network_manager, hit_unit)
				local actual_hit_target_index = 1
				local target_settings = nil

				if current_action.use_target and self.target_breed_unit ~= nil then
					if hit_unit == self.target_breed_unit then
						actual_hit_target_index, shield_blocked, can_damage, can_stagger = self._calculate_hit_mass(self, difficulty_rank, target_health_extension, actual_hit_target_index, shield_blocked, current_action, breed, hit_unit_id)
						target_settings = damage_profile.default_target
					end
				elseif self.amount_of_mass_hit < self.max_targets then
					if not is_player then
						actual_hit_target_index, shield_blocked, can_damage, can_stagger = self._calculate_hit_mass(self, difficulty_rank, target_health_extension, actual_hit_target_index, shield_blocked, current_action, breed, hit_unit_id)
					end

					local targets = damage_profile.targets
					target_settings = (targets and targets[actual_hit_target_index]) or damage_profile.default_target
				end

				if target_settings then
					local buff_extension = self.owner_buff_extension
					local damage_profile_id = self.damage_profile_id
					local hit_zone_name = nil

					if breed then
						local node = Actor.node(hit_actor)
						local hit_zone = breed.hit_zones_lookup[node]
						hit_zone_name = hit_zone.name
						hit_armor = (target_health_extension.is_alive(target_health_extension) and (breed.armor_category == 2 or breed.stagger_armor_category == 2)) or breed.armor_category == 3
					else
						hit_zone_name = "torso"
					end

					local abort_attack = self.max_targets <= self.number_of_hit_enemies or (self.max_targets <= self.amount_of_mass_hit and not self.ignore_mass_and_armour) or (hit_armor and not current_action.ignore_armour_hit and not self.ignore_mass_and_armour)

					weapon_printf("checking for abort %s %s %s", tostring(abort_attack), tostring(self.amount_of_mass_hit), tostring(self.max_targets))

					if shield_blocked then
						abort_attack = self.max_targets <= self.amount_of_mass_hit + 3 or (hit_armor and not current_action.ignore_armour_hit and not self.ignore_mass_and_armour)
					end

					local armor_type = breed.armor_category

					self._play_hit_animations(self, owner_unit, current_action, abort_attack, hit_zone_name, armor_type, shield_blocked)

					if sound_effect_extension and AiUtils.unit_alive(hit_unit) then
						sound_effect_extension.add_hit(sound_effect_extension)
					end

					local damage_source = self.item_name
					local damage_source_id = NetworkLookup.damage_sources[damage_source]
					local attacker_unit_id = network_manager.unit_game_object_id(network_manager, owner_unit)
					local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
					local is_server = self.is_server
					local backstab_multiplier = 1
					local headshot_multiplier = current_action.headshot_multiplier

					if breed and AiUtils.unit_alive(hit_unit) then
						local hit_unit_pos = Unit.world_position(hit_unit, 0)
						local owner_to_hit_dir = Vector3.normalize(hit_unit_pos - owner_unit_pos)
						local hit_unit_direction = Quaternion.forward(Unit.local_rotation(hit_unit, 0))
						local hit_angle = Vector3.dot(hit_unit_direction, owner_to_hit_dir)
						local behind_target = 0.55 <= hit_angle and hit_angle <= 1
						local talent_extension = ScriptUnit.has_extension(owner_unit, "talent_system")

						if talent_extension and talent_extension.has_talent(talent_extension, "kerillian_shade_wider_backstab_angle", "wood_elf", true) then
							behind_target = 0.2 <= hit_angle and hit_angle <= 1
						end

						if behind_target then
							local procced = false
							backstab_multiplier, procced = buff_extension.apply_buffs_to_value(buff_extension, backstab_multiplier, StatBuffIndex.BACKSTAB_MULTIPLIER)

							if script_data.debug_legendary_traits then
								backstab_multiplier = 1.5
								procced = true
							end

							if procced then
								first_person_extension.play_hud_sound_event(first_person_extension, "hud_player_buff_backstab")

								local player_and_bot_units = PLAYER_AND_BOT_UNITS

								for i = 1, #player_and_bot_units, 1 do
									local unit = player_and_bot_units[i]
									local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

									if buff_extension then
										buff_extension.trigger_procs(buff_extension, "on_backstab", hit_unit, breed_data)
									end
								end
							end
						end
					end

					if breed and not is_dodging then
						self._play_character_impact(self, is_server, owner_unit, hit_unit, breed, hit_position, hit_zone_name, current_action, damage_profile, actual_hit_target_index, self.power_level, attack_direction, shield_blocked, self.melee_boost_curve_multiplier, self._is_critical_strike, backstab_multiplier)
					end

					if is_dodging then
						abort_attack = false
					end

					if Managers.state.controller_features and self.owner.local_player and not self.has_played_rumble_effect then
						if hit_armor then
							Managers.state.controller_features:add_effect("rumble", {
								rumble_effect = "hit_armor"
							})
						else
							local hit_rumble_effect = current_action.hit_rumble_effect or "hit_character"

							Managers.state.controller_features:add_effect("rumble", {
								rumble_effect = "hit_character"
							})
						end

						if abort_attack then
							self.has_played_rumble_effect = true
						end
					end

					local is_critical_strike = self._is_critical_strike
					local charge_value = damage_profile.charge_value
					local shield_break_procc = false
					local buff_result = "no_buff"

					if shield_blocked then
						local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

						weapon_printf("HIT SHIELD", shield_blocked, buff_extension.has_buff_type(buff_extension, "armor penetration"))

						if (charge_value == "heavy_attack" and buff_extension.has_buff_perk(buff_extension, "shield_break")) or buff_extension.has_buff_type(buff_extension, "armor penetration") then
							shield_break_procc = true
						end
					else
						local send_to_server = true
						buff_result = DamageUtils.buff_on_attack(owner_unit, hit_unit, charge_value, is_critical_strike, hit_zone_name, self.number_of_hit_enemies, send_to_server)
						local attack_template_id = NetworkLookup.attack_templates[target_settings.attack_template]

						weapon_system.rpc_weapon_blood(weapon_system, nil, attacker_unit_id, attack_template_id)

						local blood_position = Vector3(result.position.x, result.position.y, result.position.z + self.down_offset)

						Managers.state.blood:add_enemy_blood(blood_position, result.normal, result.actor)
					end

					if buff_result ~= "killing_blow" then
						local power_level = self.power_level

						weapon_system.send_rpc_attack_hit(weapon_system, damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, attack_direction, damage_profile_id, "power_level", power_level, "hit_target_index", actual_hit_target_index, "blocking", shield_blocked, "shield_break_procced", shield_break_procc, "boost_curve_multiplier", self.melee_boost_curve_multiplier, "is_critical_strike", is_critical_strike, "can_damage", can_damage, "can_stagger", can_stagger, "backstab_multiplier", backstab_multiplier)

						if not shield_blocked and not self.is_server then
							local attack_template_id = NetworkLookup.attack_templates[target_settings.attack_template]

							network_manager.network_transmit:send_rpc_server("rpc_weapon_blood", attacker_unit_id, attack_template_id)
						end
					else
						first_person_extension.play_hud_sound_event(first_person_extension, "Play_hud_matchmaking_countdown")
					end

					if abort_attack then
						break
					end
				end
			elseif not is_character and in_view then
				if ScriptUnit.has_extension(hit_unit, "ai_inventory_item_system") then
					if not self.hit_units[hit_unit] then
						Unit.flow_event(hit_unit, "break_shield")

						self.hit_units[hit_unit] = true
					end

					if Managers.state.controller_features and self.owner.local_player and not self.has_played_rumble_effect then
						Managers.state.controller_features:add_effect("rumble", {
							rumble_effect = "hit_shield"
						})

						self.has_played_rumble_effect = true
					end
				elseif hit_units[hit_unit] == nil and ScriptUnit.has_extension(hit_unit, "health_system") then
					local level_index, is_level_unit = Managers.state.network:game_object_or_level_id(hit_unit)
					local is_dummy_unit = unit_get_data(hit_unit, "is_dummy")

					if is_dummy_unit then
						local target_health_extension = ScriptUnit.extension(hit_unit, "health_system")
						local hit_unit_armor = unit_get_data(hit_unit, "armor") or 1

						self._calculate_hit_mass_level_object(self, hit_unit, target_health_extension, 1, current_action)
						self.hit_level_object(self, hit_units, hit_unit, owner_unit, current_action, attack_direction, level_index, true, hit_actor)

						local is_armored = hit_unit_armor and hit_unit_armor == 2
						local abort_attack = self.max_targets <= self.number_of_hit_enemies or ((is_armored or self.max_targets <= self.amount_of_mass_hit) and not self.ignore_mass_and_armour)
						local hit_position = SWEEP_RESULTS[i].position
						local hit_normal = SWEEP_RESULTS[i].normal

						self._play_environmental_effect(self, current_rotation, current_action, hit_unit, hit_position, hit_normal, hit_actor)

						hit_environment_rumble = true

						self._play_hit_animations(self, owner_unit, current_action, abort_attack)

						if abort_attack then
							break
						end
					elseif is_level_unit then
						self.hit_level_object(self, hit_units, hit_unit, owner_unit, current_action, attack_direction, level_index, false)

						local hit_position = SWEEP_RESULTS[i].position
						local hit_normal = SWEEP_RESULTS[i].normal

						self._play_environmental_effect(self, current_rotation, current_action, hit_unit, hit_position, hit_normal, hit_actor)

						hit_environment_rumble = true
					else
						self.hit_units[hit_unit] = hit_unit
						local actual_hit_target_index = math.ceil(self.amount_of_mass_hit + 1)
						local targets = damage_profile.targets
						local target_settings = (targets and targets[actual_hit_target_index]) or damage_profile.default_target
						local damage_source = self.item_name
						local damage_source_id = NetworkLookup.damage_sources[damage_source]
						local network_manager = Managers.state.network
						local attacker_unit_id = network_manager.unit_game_object_id(network_manager, owner_unit)
						local hit_unit_id = network_manager.unit_game_object_id(network_manager, hit_unit)
						local hit_zone_id = NetworkLookup.hit_zones.full
						local damage_profile_id = self.damage_profile_id
						local power_level = self.power_level
						local is_critical_strike = self._is_critical_strike

						weapon_system.send_rpc_attack_hit(weapon_system, damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, attack_direction, damage_profile_id, "power_level", power_level, "hit_target_index", actual_hit_target_index, "boost_curve_multiplier", self.melee_boost_curve_multiplier, "is_critical_strike", is_critical_strike)

						local abort_attack = not unit_get_data(hit_unit, "weapon_hit_through")

						self._play_hit_animations(self, owner_unit, current_action, abort_attack)

						local hit_normal = SWEEP_RESULTS[i].normal

						self._play_environmental_effect(self, current_rotation, current_action, hit_unit, hit_position, hit_normal, hit_actor)

						hit_environment_rumble = true
					end
				elseif hit_units[hit_unit] == nil then
					if global_is_inside_inn then
						local abort_attack = true

						self._play_hit_animations(self, owner_unit, current_action, abort_attack)
					end

					environment_unit_hit = i
					hit_environment_rumble = true
				end
			end

			if shield_blocked then
				self.amount_of_mass_hit = self.amount_of_mass_hit + 3
			end
		end
	end

	if environment_unit_hit and not self.has_hit_environment and 0 < num_results1 + num_results2 then
		self.has_hit_environment = true
		local result = SWEEP_RESULTS[environment_unit_hit]
		local hit_actor = result.actor
		local hit_unit = Actor.unit(hit_actor)

		assert(hit_unit, "hit unit is nil")

		if unit ~= hit_unit then
			local hit_position = result.position
			local hit_normal = result.normal
			local hit_direction = attack_direction
			local unit_set_flow_variable = Unit.set_flow_variable

			self._play_environmental_effect(self, current_rotation, current_action, hit_unit, hit_position, hit_normal, hit_actor)

			if Managers.state.controller_features and global_is_inside_inn and self.owner.local_player and not self.has_played_rumble_effect then
				Managers.state.controller_features:add_effect("rumble", {
					rumble_effect = "hit_environment"
				})

				self.has_played_rumble_effect = true
			end

			if hit_unit and Unit.alive(hit_unit) and hit_actor then
				unit_set_flow_variable(hit_unit, "hit_actor", hit_actor)
				unit_set_flow_variable(hit_unit, "hit_direction", hit_direction)
				unit_set_flow_variable(hit_unit, "hit_position", hit_position)
				Unit.flow_event(hit_unit, "lua_simple_damage")
			end
		end
	end

	if final_frame then
		self.attack_aborted = true
	end

	if Managers.state.controller_features and global_is_inside_inn and hit_environment_rumble and self.owner.local_player and not self.has_played_rumble_effect then
		Managers.state.controller_features:add_effect("rumble", {
			rumble_effect = "hit_environment"
		})

		self.has_played_rumble_effect = true
	end

	if script_data.debug_weapons then
		Debug.text("Has dedicated target: %s", self.target_breed_unit ~= nil)

		local pose = Matrix4x4.from_quaternion_position(rotation_previous, position_start)

		drawer.box_sweep(drawer, pose, weapon_half_extents, position_end - position_start, Color(0, 255, 0), Color(0, 100, 0))
		drawer.sphere(drawer, position_start, 0.1)
		drawer.sphere(drawer, position_end, 0.1, Color(255, 0, 255))
		drawer.vector(drawer, position_start, position_end - position_start)

		local pose = Matrix4x4.from_quaternion_position(rotation_current, position_previous + Quaternion.up(rotation_current) * weapon_half_length)

		drawer.box_sweep(drawer, pose, weapon_half_extents, position_current - position_previous)
	end

	if PhysicsWorld.stop_reusing_sweep_tables then
		PhysicsWorld.stop_reusing_sweep_tables()
	end

	return 
end
ActionSweep._play_environmental_effect = function (self, weapon_rotation, current_action, hit_unit, hit_position, hit_normal, hit_actor)
	local weapon_fwd = Quaternion.forward(weapon_rotation)
	local weapon_right = Quaternion.right(weapon_rotation)
	local weapon_up = Quaternion.up(weapon_rotation)
	local world = self.world
	local weapon_impact_direction = (current_action.impact_axis and current_action.impact_axis:unbox()) or Vector3.forward()
	local hit_effect = current_action.hit_effect
	local impact_direction = weapon_right * weapon_impact_direction.x + weapon_fwd * weapon_impact_direction.y + weapon_up * weapon_impact_direction.z
	local impact_rotation = Quaternion.look(impact_direction, -weapon_right)
	local owner_unit = self.owner_unit
	local owner_player = Managers.player:owner(owner_unit)
	local husk = owner_player.bot_player

	EffectHelper.play_surface_material_effects(hit_effect, world, hit_unit, hit_position, impact_rotation, hit_normal, nil, husk, nil, hit_actor)

	if Managers.state.network:game() then
		EffectHelper.remote_play_surface_material_effects(hit_effect, world, hit_unit, hit_position, impact_rotation, hit_normal, self.is_server, hit_actor)
	end

	if script_data.debug_material_effects then
		local drawer = self._drawer

		drawer.vector(drawer, hit_position - impact_direction * 0.1, impact_direction * 0.1)
		drawer.vector(drawer, hit_position - impact_direction * 0.1, weapon_fwd * 0.1)
	end

	return 
end
ActionSweep._play_character_impact = function (self, is_server, attacker_unit, hit_unit, breed, hit_position, hit_zone_name, current_action, damage_profile, target_index, power_level, attack_direction, blocking, boost_curve_multiplier, is_critical_strike, backstab_multiplier)
	local attacker_player = Managers.player:owner(attacker_unit)
	local husk = attacker_player.bot_player
	local breed_name = breed.name
	local world = self.world
	local target_settings = (damage_profile.targets and damage_profile.targets[target_index]) or damage_profile.default_target
	local attack_template_name = target_settings.attack_template
	local attack_template = AttackTemplates[attack_template_name]
	local predicted_damage = 0

	if target_settings then
		local boost_curve = BoostCurves[target_settings.boost_curve_type]
		predicted_damage = DamageUtils.calculate_damage(DamageOutput, hit_unit, attacker_unit, hit_zone_name, power_level, boost_curve, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, backstab_multiplier)
	end

	no_damage = predicted_damage <= 0
	local hitzone_armor_categories = breed.hitzone_armor_categories
	local target_unit_armor = (hitzone_armor_categories and hitzone_armor_categories[hit_zone_name]) or breed.armor_category
	local sound_event = (no_damage and current_action.stagger_impact_sound_event) or current_action.impact_sound_event
	local sound_events = {
		axe_2h_hit = "slashing_hit",
		slashing_hit = "slashing_hit",
		stab_hit = "stab_hit",
		axe_1h_hit = "slashing_hit",
		hammer_2h_hit = "blunt_hit",
		blunt_hit = "blunt_hit"
	}

	if blocking then
		if sound_events[sound_event] == "blunt_hit" then
			sound_event = breed.shield_blunt_block_sound or "blunt_hit_shield_wood"
		elseif sound_events[sound_event] == "slashing_hit" then
			sound_event = breed.shield_slashing_block_sound or "slashing_hit_shield_wood"
		elseif sound_events[sound_event] == "stab_hit" then
			sound_event = breed.shield_stab_block_sound or "stab_hit_shield_wood"
		end
	elseif target_unit_armor == 2 then
		sound_event = (no_damage and current_action.no_damage_impact_sound_event) or current_action.armor_impact_sound_event or current_action.impact_sound_event
	end

	local damage_type = "default"
	local hit_effect = nil

	if blocking then
		if target_unit_armor == 2 then
			hit_effect = "fx/hit_enemy_shield_metal"
		else
			hit_effect = "fx/hit_enemy_shield"
		end

		damage_type = "no_damage"
	elseif not damage_type or damage_type == "no_damage" then
		hit_effect = current_action.no_damage_impact_particle_effect
	elseif predicted_damage <= 0 and target_unit_armor == 2 then
		hit_effect = current_action.armour_impact_particle_effect or "fx/hit_armored"
	elseif predicted_damage <= 0 then
		hit_effect = current_action.no_damage_impact_particle_effect
	else
		hit_effect = current_action.impact_particle_effect or "fx/impact_blood"

		EffectHelper.player_critical_hit(world, is_critical_strike, attacker_unit, hit_unit, hit_position)
	end

	if predicted_damage <= 0 then
		damage_type = "no_damage"
	end

	if hit_effect then
		EffectHelper.player_melee_hit_particles(world, hit_effect, hit_position, attack_direction, damage_type, hit_unit, predicted_damage)
	end

	if (hit_zone_name == "head" or hit_zone_name == "neck") and attack_template.headshot_sound then
		sound_event = attack_template.headshot_sound
	end

	local sound_type = attack_template.sound_type

	if sound_event then
		if not sound_type then
			return 
		end

		EffectHelper.play_melee_hit_effects(sound_event, world, hit_position, sound_type, husk, hit_unit)

		local network_manager = Managers.state.network
		local sound_event_id = NetworkLookup.sound_events[sound_event]
		local sound_type_id = NetworkLookup.melee_impact_sound_types[sound_type]
		local hit_unit_id = network_manager.unit_game_object_id(network_manager, hit_unit)

		if is_server then
			network_manager.network_transmit:send_rpc_clients("rpc_play_melee_hit_effects", sound_event_id, hit_position, sound_type_id, hit_unit_id)
		else
			network_manager.network_transmit:send_rpc_server("rpc_play_melee_hit_effects", sound_event_id, hit_position, sound_type_id, hit_unit_id)
		end
	else
		Application.warning("[ActionSweep] Missing sound event for sweep action in unit %q.", self.weapon_unit)
	end

	local target_health_extension = ScriptUnit.extension(hit_unit, "health_system")
	local wounds_left = target_health_extension.current_health(target_health_extension)
	local target_presumed_dead = wounds_left <= predicted_damage
	local sound_effect_extension = ScriptUnit.has_extension(self.owner_unit, "sound_effect_system")

	if sound_effect_extension and target_presumed_dead then
		sound_effect_extension.melee_kill(sound_effect_extension)
	end

	local staggered = nil

	if blocking then
		return 
	end

	if not husk and not target_presumed_dead and breed and not breed.disable_local_hit_reactions and Unit.has_animation_state_machine(hit_unit) then
		local hit_anim = nil

		if Unit.has_animation_event(hit_unit, "hit_reaction_climb") then
			local network_manager = Managers.state.network
			local hit_unit_id = network_manager.unit_game_object_id(network_manager, hit_unit)
			local action_name = NetworkLookup.bt_action_names[GameSession.game_object_field(network_manager.game(network_manager), hit_unit_id, "bt_action_name")]

			if action_name and action_name == "climb" then
				hit_anim = "hit_reaction_climb"
			end
		end

		if not hit_anim then
			local hit_unit_dir = Quaternion.forward(Unit.local_rotation(hit_unit, 0))
			local angle_difference = Vector3.flat_angle(hit_unit_dir, attack_direction)

			if angle_difference < -math.pi * 0.75 or math.pi * 0.75 < angle_difference then
				hit_anim = "hit_reaction_backward"
			elseif angle_difference < -math.pi * 0.25 then
				hit_anim = "hit_reaction_left"
			elseif angle_difference < math.pi * 0.25 then
				hit_anim = "hit_reaction_forward"
			else
				hit_anim = "hit_reaction_right"
			end
		end

		Unit.animation_event(hit_unit, hit_anim)
	end

	return 
end
ActionSweep.hit_level_object = function (self, hit_units, hit_unit, owner_unit, current_action, attack_direction, level_index, is_dummy_unit, hit_actor)
	hit_units[hit_unit] = true
	self.has_hit_environment = true
	local no_player_damage = unit_get_data(hit_unit, "no_damage_from_players")

	if not no_player_damage then
		local hit_zone_name = "full"

		if not is_dummy_unit then
			self.amount_of_mass_hit = self.amount_of_mass_hit + 1
		end

		local target_index = math.ceil(self.amount_of_mass_hit)
		local damage_profile = self.damage_profile
		local is_critical_strike = self._is_critical_strike
		local damage_source = self.item_name
		local power_level = self.power_level
		local boost_curve_multiplier = self.melee_boost_curve_multiplier

		if is_dummy_unit then
			local node = Actor.node(hit_actor)
			local hit_zone_lookup = HitReactions.templates.dummy.hit_zones

			if hit_zone_lookup then
				hit_zone_name = hit_zone_lookup[node]
			end

			DamageUtils.damage_dummy_unit(hit_unit, owner_unit, hit_zone_name, power_level, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, attack_direction, damage_source, hit_actor)
		else
			DamageUtils.damage_level_unit(hit_unit, owner_unit, hit_zone_name, power_level, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, attack_direction, damage_source, hit_actor)
		end
	end

	local first_person_hit_anim = current_action.first_person_hit_anim

	if first_person_hit_anim then
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
		local first_person_unit = first_person_extension.get_first_person_unit(first_person_extension)

		Unit.animation_event(first_person_unit, first_person_hit_anim)
	end

	return 
end
ActionSweep.finish = function (self, reason, data)
	if reason == "interacting" then
		Unit.flow_event(self.weapon_unit, "lua_finish_interacting")
	end

	local owner_unit = self.owner_unit
	local weapon_system = self.weapon_system
	local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

	if hud_extension then
		hud_extension.show_critical_indication = false
	end

	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

	first_person_extension.enable_rig_movement(first_person_extension)

	if self._is_critical_strike then
		local stop_crit_hud_sound_event = "Stop_player_combat_crit_swing_2D"

		first_person_extension.play_hud_sound_event(first_person_extension, stop_crit_hud_sound_event, nil, false)
	end

	if not script_data.debug_weapons_always_hit_target then
		return 
	end

	local target_breed_unit = self.target_breed_unit

	if target_breed_unit == nil or self.has_hit_target then
		return 
	end

	weapon_printf("FINISHING OFF MISSED TARGET")

	local network_manager = Managers.state.network
	local breed = unit_get_data(target_breed_unit, "breed")
	local hit_zone_name, _ = next(breed.hit_zones)
	local attack_direction = Vector3.normalize(POSITION_LOOKUP[target_breed_unit] - POSITION_LOOKUP[owner_unit])
	local hit_unit_id = network_manager.unit_game_object_id(network_manager, target_breed_unit)
	local attacker_unit_id = network_manager.unit_game_object_id(network_manager, owner_unit)
	local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
	local power_level = self.power_level
	local is_critical_strike = self._is_critical_strike
	local target_settings = damage_profile.default_target
	local damage_profile_id = self.damage_profile_id
	local shield_blocked = false
	local shield_break_procc = false
	local send_to_server = true
	local charge_value = damage_profile.charge_value

	DamageUtils.buff_on_attack(owner_unit, target_breed_unit, charge_value, is_critical_strike, hit_zone_name, self.number_of_hit_enemies + 1, send_to_server)
	weapon_system.send_rpc_attack_hit(weapon_system, NetworkLookup.damage_sources[self.item_name], attacker_unit_id, hit_unit_id, hit_zone_id, attack_direction, damage_profile_id, "power_level", power_level, "hit_target_index", hit_target_index, "blocking", shield_blocked, "shield_break_procced", shield_break_procc, "boost_curve_multiplier", self.melee_boost_curve_multiplier, "is_critical_strike", is_critical_strike)

	return 
end
ActionSweep.destroy = function (self)
	return 
end
ActionSweep._play_hit_animations = function (self, owner_unit, current_action, abort_attack, hit_zone_name, armor_type, blocking)
	local hit_stop_anim = (current_action.dual_hit_stop_anims and self.action_hand and current_action.dual_hit_stop_anims[self.action_hand]) or current_action.hit_stop_anim
	local first_person_hit_anim = (hit_zone_name ~= "head" and armor_type == 2 and abort_attack and current_action.hit_armor_anim) or (abort_attack and blocking and current_action.hit_shield_stop_anim) or (abort_attack and hit_stop_anim) or current_action.first_person_hit_anim
	local third_person_hit_anim = abort_attack and current_action.hit_stop_anim
	self.attack_aborted = self.attack_aborted or abort_attack

	if first_person_hit_anim then
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
		local first_person_unit = first_person_extension.get_first_person_unit(first_person_extension)

		Unit.animation_event(first_person_unit, first_person_hit_anim)
	end

	if third_person_hit_anim then
		CharacterStateHelper.play_animation_event(owner_unit, third_person_hit_anim)
	end

	return 
end

return 
