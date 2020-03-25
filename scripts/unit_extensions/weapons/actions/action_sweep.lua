ActionSweep = class(ActionSweep, ActionBase)
local unit_alive = Unit.alive
local unit_get_data = Unit.get_data
local unit_world_position = Unit.world_position
local unit_world_rotation = Unit.world_rotation
local unit_local_rotation = Unit.local_rotation
local unit_flow_event = Unit.flow_event
local unit_set_flow_variable = Unit.set_flow_variable
local unit_node = Unit.node
local unit_actor = Unit.actor
local unit_animation_event = Unit.animation_event
local unit_has_animation_event = Unit.has_animation_event
local unit_has_animation_state_machine = Unit.has_animation_state_machine
local actor_node = Actor.node
local action_hitbox_vertical_fov = math.degrees_to_radians(120)
local action_hitbox_horizontal_fov = math.degrees_to_radians(115.55)

local function weapon_printf(...)
	if script_data.debug_weapons then
		print("[ActionSweep] " .. sprintf(...))
	end
end

local BAKED_SWEEP_TIME = 1
local BAKED_SWEEP_POS = 2
local BAKED_SWEEP_ROT = 5

local function _get_baked_pose(time, data)
	local num_data = #data

	for i = 1, num_data, 1 do
		local current = data[i]
		local next = data[math.min(i + 1, num_data)]

		if current == next or (i == 1 and time <= current[BAKED_SWEEP_TIME]) then
			local loc = Vector3(current[BAKED_SWEEP_POS], current[BAKED_SWEEP_POS + 1], current[BAKED_SWEEP_POS + 2])
			local rot = Quaternion.from_elements(current[BAKED_SWEEP_ROT], current[BAKED_SWEEP_ROT + 1], current[BAKED_SWEEP_ROT + 2], current[BAKED_SWEEP_ROT + 3])

			return Matrix4x4.from_quaternion_position(rot, loc)
		elseif current[BAKED_SWEEP_TIME] <= time and time <= next[BAKED_SWEEP_TIME] then
			local time_range = math.max(next[BAKED_SWEEP_TIME] - current[BAKED_SWEEP_TIME], 0.0001)
			local lerp_t = (time - current[BAKED_SWEEP_TIME]) / time_range
			local start_position = Vector3(current[BAKED_SWEEP_POS], current[BAKED_SWEEP_POS + 1], current[BAKED_SWEEP_POS + 2])
			local start_rotation = Quaternion.from_elements(current[BAKED_SWEEP_ROT], current[BAKED_SWEEP_ROT + 1], current[BAKED_SWEEP_ROT + 2], current[BAKED_SWEEP_ROT + 3])
			local end_position = Vector3(next[BAKED_SWEEP_POS], next[BAKED_SWEEP_POS + 1], next[BAKED_SWEEP_POS + 2])
			local end_rotation = Quaternion.from_elements(next[BAKED_SWEEP_ROT], next[BAKED_SWEEP_ROT + 1], next[BAKED_SWEEP_ROT + 2], next[BAKED_SWEEP_ROT + 3])
			local current_position = Vector3.lerp(start_position, end_position, lerp_t)
			local current_rotation = Quaternion.lerp(start_rotation, end_rotation, lerp_t)

			return Matrix4x4.from_quaternion_position(current_rotation, current_position)
		end
	end

	return nil, nil
end

local function get_baked_data_name(action_hand)
	if action_hand then
		return "baked_sweep_" .. action_hand
	else
		return "baked_sweep"
	end
end

ActionSweep.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionSweep.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.stored_half_extents = Vector3Box()
	self._stored_position = Vector3Box()
	self._stored_rotation = QuaternionBox()
	local _, weapon_half_extents = Unit.box(damage_unit)

	self.stored_half_extents:store(weapon_half_extents)

	self._hit_units = {}
	self._could_damage_last_update = false
	self._has_played_rumble_effect = false
	self._status_extension = ScriptUnit.extension(owner_unit, "status_system")
	self._stored_attack_data = {}
	self._dt = 0
end

ActionSweep.check_precision_target = function (self, owner_unit, owner_player, dedicated_target_range, check_distance, weapon_furthest_point)
	local current_target = self._precision_target_unit

	if not AiUtils.unit_alive(current_target) then
		return nil
	end

	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

	first_person_extension:disable_rig_movement()

	local pos = first_person_extension:current_position()
	local rot = first_person_extension:current_rotation()
	local direction = Quaternion.forward(rot)
	local node = "j_spine"
	local target_position = unit_world_position(current_target, unit_node(current_target, node))
	local good_target = false
	local player_to_target_vector = target_position - pos
	local player_to_target_distance = Vector3.length(player_to_target_vector)
	local player_to_target_unit_dir = Vector3.normalize(player_to_target_vector)
	local dot = Vector3.dot(player_to_target_unit_dir, direction)
	local target_health_extension = ScriptUnit.extension(current_target, "health_system")

	if dot < 0.9 or dedicated_target_range < player_to_target_distance then
		good_target = false
	elseif target_health_extension:is_alive() then
		good_target = true
	end

	return (good_target and current_target) or nil
end

ActionSweep.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	ActionSweep.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)

	self._has_played_rumble_effect = false
	self._current_action = new_action
	self._action_time_started = t
	self._has_hit_environment = false
	self._has_hit_precision_target = true
	self._precision_target_unit = nil
	self._number_of_hit_enemies = 0
	self._amount_of_mass_hit = 0
	self._number_of_potential_hit_results = 0
	self._hit_mass_of_potential_hit_results = 0
	self._network_manager = Managers.state.network
	self._last_potential_hit_result_has_result = false
	self._last_potential_hit_result = {}
	local owner_unit = self.owner_unit
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")
	self._owner_buff_extension = buff_extension
	self._owner_hud_extension = hud_extension
	local anim_time_scale = ActionUtils.get_action_time_scale(owner_unit, new_action)
	self._anim_time_scale = anim_time_scale
	self._time_to_hit = t + (new_action.hit_time or 0) / anim_time_scale
	local action_hand = action_init_data and action_init_data.action_hand
	local damage_profile_name = (action_hand and new_action["damage_profile_" .. action_hand]) or new_action.damage_profile or "default"
	self._action_hand = action_hand
	self._baked_sweep_data = new_action[get_baked_data_name(self._action_hand)]
	self._baked_data_dt_recip = (self._baked_sweep_data and 1 / #self._baked_sweep_data) or 1
	self._damage_profile_id = NetworkLookup.damage_profiles[damage_profile_name]
	local damage_profile = DamageProfileTemplates[damage_profile_name]
	self._damage_profile = damage_profile
	self._has_starting_melee_boost = nil
	self._starting_melee_boost_curve_multiplier = nil
	local has_melee_boost, _ = self:_get_power_boost()
	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, new_action, t) or has_melee_boost
	local difficulty_level = Managers.state.difficulty:get_difficulty()
	local cleave_power_level = ActionUtils.scale_power_levels(power_level, "cleave", owner_unit, difficulty_level)
	cleave_power_level = buff_extension:apply_buffs_to_value(cleave_power_level, "power_level_melee")
	cleave_power_level = buff_extension:apply_buffs_to_value(cleave_power_level, "power_level_melee_cleave")
	self._power_level = power_level
	local max_targets_attack, max_targets_impact = ActionUtils.get_max_targets(damage_profile, cleave_power_level)
	max_targets_attack = buff_extension:apply_buffs_to_value(max_targets_attack or 1, "increased_max_targets")
	max_targets_impact = buff_extension:apply_buffs_to_value(max_targets_impact or 1, "increased_max_targets")

	if buff_extension:has_buff_type("armor penetration") then
		max_targets_impact = max_targets_impact * 2
	end

	self._max_targets_attack = max_targets_attack
	self._max_targets_impact = max_targets_impact
	self._max_targets = (max_targets_impact < max_targets_attack and max_targets_attack) or max_targets_impact
	self._down_offset = new_action.sweep_z_offset or 0.1
	self._auto_aim_reset = false

	if not Managers.player:owner(self.owner_unit).bot_player and damage_profile.charge_value == "heavy_attack" then
		Managers.state.controller_features:add_effect("rumble", {
			rumble_effect = "light_swing"
		})
	end

	local first_person_unit = self.first_person_unit

	if global_is_inside_inn then
		self._down_offset = 0
	end

	self._attack_aborted = false
	self._send_delayed_hit_rpc = false

	table.clear(self._hit_units)
	buff_extension:trigger_procs("on_sweep")

	self._ignore_mass_and_armour = buff_extension:has_buff_type("ignore_mass_and_armour")
	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

	self:_handle_critical_strike(is_critical_strike, buff_extension, hud_extension, first_person_extension, "on_critical_sweep", "Play_player_combat_crit_swing_2D")

	self._is_critical_strike = is_critical_strike
	self._started_damage_window = false

	unit_flow_event(first_person_unit, "sfx_swing_started")

	if new_action.use_precision_sweep then
		first_person_extension:disable_rig_movement()

		local physics_world = World.get_data(self.world, "physics_world")
		local pos = first_person_extension:current_position()
		local rot = first_person_extension:current_rotation()
		local direction = Quaternion.forward(rot)
		local collision_filter = "filter_melee_sweep"
		local results = PhysicsWorld.immediate_raycast(physics_world, pos, direction, new_action.dedicated_target_range, "all", "collision_filter", collision_filter)

		if results then
			local side = Managers.state.side.side_by_unit[owner_unit]
			local enemy_units_lookup = side.enemy_units_lookup
			local num_results = #results

			for i = 1, num_results, 1 do
				local result = results[i]
				local actor = result[4]
				local hit_unit = Actor.unit(actor)
				local breed = unit_get_data(hit_unit, "breed")
				local friendly_fire = not enemy_units_lookup[hit_unit]

				if breed and not friendly_fire then
					local node = actor_node(actor)
					local hit_zone = breed.hit_zones_lookup[node]
					local hit_zone_name = hit_zone.name

					if hit_zone_name ~= "afro" then
						local target_health_extension = ScriptUnit.extension(hit_unit, "health_system")

						if target_health_extension:is_alive() then
							self._precision_target_unit = hit_unit
							self._has_hit_precision_target = false

							break
						end
					end
				end
			end
		end

		if not self._precision_target_unit and ScriptUnit.has_extension(owner_unit, "smart_targeting_system") then
			local targeting_extension = ScriptUnit.extension(owner_unit, "smart_targeting_system")
			local targeting_data = targeting_extension:get_targeting_data()
			local smart_targeting_unit = targeting_data.unit
			local target_health_extension = smart_targeting_unit and ScriptUnit.has_extension(smart_targeting_unit, "health_system")

			if smart_targeting_unit and target_health_extension and target_health_extension:is_alive() then
				self._precision_target_unit = smart_targeting_unit
				self._has_hit_precision_target = false
			end
		end
	end

	local weapon_unit = self.weapon_unit
	local rotation = unit_world_rotation(weapon_unit, 0)
	local weapon_up_dir = Quaternion.up(rotation)
	local weapon_up_offset_mod = new_action.weapon_up_offset_mod or 0
	local weapon_up_offset = weapon_up_dir * weapon_up_offset_mod
	local actual_position_initial = POSITION_LOOKUP[weapon_unit]
	local position_initial = Vector3(actual_position_initial.x, actual_position_initial.y, actual_position_initial.z - self._down_offset) + weapon_up_offset

	self._stored_position:store(position_initial)
	self._stored_rotation:store(rotation)

	self._could_damage_last_update = false

	if new_action.lookup_data.sub_action_name == "assassinate" then
		local buff = buff_extension:get_non_stacking_buff("assassinate")

		buff_extension:remove_buff(buff.id)
	end
end

local SWEEP_RESULTS = {}

if PhysicsWorld.stop_reusing_sweep_tables then
	PhysicsWorld.stop_reusing_sweep_tables()
end

ActionSweep.client_owner_post_update = function (self, dt, t, world, _, current_time_in_action)
	local owner_unit = self.owner_unit
	local current_action = self._current_action
	self.current_time_in_action = current_time_in_action
	self._dt = dt
	local aborted = false

	if (aborted or self._attack_aborted) and current_action.reset_aim_on_attack and not self._auto_aim_reset then
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

		first_person_extension:reset_aim_assist_multiplier()

		self._auto_aim_reset = true
	end

	local modified_time_in_action = current_time_in_action - 2 * dt
	local is_within_damage_window = self:_update_sweep(dt, t, current_action, modified_time_in_action)
	local hud_extension = self._owner_hud_extension

	if hud_extension and self._is_critical_strike then
		if is_within_damage_window and not self._started_damage_window then
			self._started_damage_window = true
		elseif not is_within_damage_window and hud_extension.show_critical_indication and self._started_damage_window then
			hud_extension.show_critical_indication = false
		end
	end
end

ActionSweep._update_sweep = function (self, dt, t, current_action, current_time_in_action)
	local is_within_damage_window = nil
	local use_baked = self._baked_sweep_data

	if use_baked then
		is_within_damage_window = self:_update_sweep_baked(dt, t, current_action, current_time_in_action)
	else
		is_within_damage_window = self:_update_sweep_runtime(dt, t, current_action, current_time_in_action)
	end

	if self._send_delayed_hit_rpc and self._time_to_hit <= t then
		local data = self._stored_attack_data

		self:_send_attack_hit(t, data.damage_source_id, data.attacker_unit_id, data.hit_unit_id, data.hit_zone_id, data.hit_position:unbox(), data.attack_direction:unbox(), data.damage_profile_id, unpack(data.optional_parameters))

		self._send_delayed_hit_rpc = false
	end

	return is_within_damage_window
end

ActionSweep._update_sweep_baked = function (self, dt, t, current_action, current_time_in_action)
	local is_within_damage_window = nil
	local damage_window_start = current_action.damage_window_start / self._anim_time_scale

	if current_time_in_action + dt >= damage_window_start - 0.03333333333333333 then
		local owner_unit = self.owner_unit
		local weapon_unit = self.weapon_unit
		local physics_world = self.physics_world
		local baked_sweep_data = self._baked_sweep_data
		local aborted = false
		local current_dt = 0
		local max_dt = 0.016666666666666666
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
		local first_person_unit = first_person_extension:get_first_person_unit()
		local unit_transform = Unit.world_pose(first_person_unit, 0)

		while not aborted and not self._attack_aborted and current_dt < dt do
			local interpolated_dt = math.min(max_dt, dt - current_dt)
			current_dt = math.min(current_dt + max_dt, dt)
			local action_time = (current_time_in_action + current_dt) * self._anim_time_scale
			local local_pose = _get_baked_pose(action_time, baked_sweep_data)
			local world_pose = Matrix4x4.multiply(local_pose, unit_transform)
			local current_position = Matrix4x4.translation(world_pose)
			local current_rotation = Matrix4x4.rotation(world_pose)
			is_within_damage_window = self:_is_within_damage_window(current_time_in_action + current_dt, current_action, owner_unit)
			aborted = self:_do_overlap(interpolated_dt, t, weapon_unit, owner_unit, current_action, physics_world, is_within_damage_window, current_position, current_rotation)
		end
	end

	return is_within_damage_window
end

ActionSweep._update_sweep_runtime = function (self, dt, t, current_action, current_time_in_action)
	local owner_unit = self.owner_unit
	local weapon_unit = self.weapon_unit
	local physics_world = self.physics_world
	local max_dt = current_action.forced_interpolation or 0.016666666666666666
	local current_dt = 0
	local start_position = self._stored_position:unbox()
	local start_rotation = self._stored_rotation:unbox()
	local end_position = POSITION_LOOKUP[weapon_unit]
	local end_rotation = unit_world_rotation(weapon_unit, 0)
	local aborted = false
	local is_within_damage_window = nil

	while not aborted and not self._attack_aborted and current_dt < dt do
		local interpolated_dt = math.min(max_dt, dt - current_dt)
		current_dt = math.min(current_dt + max_dt, dt)
		local lerp_t = current_dt / dt
		local current_position = Vector3.lerp(start_position, end_position, lerp_t)
		local current_rotation = Quaternion.lerp(start_rotation, end_rotation, lerp_t)
		is_within_damage_window = self:_is_within_damage_window(current_time_in_action + current_dt, current_action, owner_unit)
		aborted = self:_do_overlap(interpolated_dt, t, weapon_unit, owner_unit, current_action, physics_world, is_within_damage_window, current_position, current_rotation)
	end

	return is_within_damage_window
end

ActionSweep._get_power_boost = function (self)
	local has_melee_boost = self._has_starting_melee_boost
	local melee_boost_curve_multiplier = self._starting_melee_boost_curve_multiplier

	if not has_melee_boost then
		local owner_unit = self.owner_unit
		local damage_profile = self._damage_profile
		local melee_boost_override = damage_profile and damage_profile.melee_boost_override
		has_melee_boost, melee_boost_curve_multiplier = ActionUtils.get_melee_boost(owner_unit, melee_boost_override)
		self._starting_melee_boost_curve_multiplier = melee_boost_curve_multiplier
		self._has_starting_melee_boost = has_melee_boost
	end

	return has_melee_boost, melee_boost_curve_multiplier
end

ActionSweep._is_within_damage_window = function (self, current_time_in_action, action, owner_unit)
	local damage_window_start = action.damage_window_start
	local damage_window_end = action.damage_window_end

	if not damage_window_start and not damage_window_end then
		return false
	end

	local anim_time_scale = self._anim_time_scale
	damage_window_start = damage_window_start / anim_time_scale
	damage_window_end = damage_window_end or action.total_time or math.huge
	damage_window_end = damage_window_end / anim_time_scale
	local after_start = damage_window_start < current_time_in_action
	local before_end = current_time_in_action < damage_window_end

	return after_start and before_end
end

ActionSweep._get_target_hit_mass = function (self, difficulty_rank, shield_blocked, current_action, breed, hit_unit_id)
	local hit_mass_total = (shield_blocked and ((breed.hit_mass_counts_block and breed.hit_mass_counts_block[difficulty_rank]) or breed.hit_mass_count_block)) or (breed.hit_mass_counts and breed.hit_mass_counts[difficulty_rank]) or breed.hit_mass_count or 1
	local action_mass_override = current_action.hit_mass_count

	if self._ignore_mass_and_armour then
		hit_mass_total = 1
	elseif action_mass_override and action_mass_override[breed.name] then
		local mass_cost_multiplier = action_mass_override[breed.name]
		hit_mass_total = hit_mass_total * (mass_cost_multiplier or 1)
	end

	local game = self._network_manager:game()

	if not breed.is_player then
		local hit_unit_action_id = GameSession.game_object_field(game, hit_unit_id, "bt_action_name")
		local hit_unit_action_name = NetworkLookup.bt_action_names[hit_unit_action_id]

		if hit_unit_action_name == "stagger" then
			hit_mass_total = hit_mass_total * 0.75
		end
	end

	local buff_extension = self._owner_buff_extension

	if buff_extension:has_buff_perk("hit_mass_override") then
		hit_mass_total = hit_mass_total * 0.75
	end

	return hit_mass_total
end

ActionSweep._calculate_hit_mass = function (self, difficulty_rank, target_health_extension, actual_hit_target_index, shield_blocked, current_action, breed, hit_unit_id)
	local can_damage = false
	local can_stagger = false

	if target_health_extension:is_alive() then
		can_damage = self._amount_of_mass_hit <= self._max_targets_attack
		can_stagger = self._amount_of_mass_hit <= self._max_targets_impact
		local target_hit_mass = self:_get_target_hit_mass(difficulty_rank, shield_blocked, current_action, breed, hit_unit_id)
		self._amount_of_mass_hit = self._amount_of_mass_hit + target_hit_mass
		self._number_of_hit_enemies = self._number_of_hit_enemies + 1
		actual_hit_target_index = self._number_of_hit_enemies
	else
		shield_blocked = false
	end

	return math.ceil(actual_hit_target_index), shield_blocked, can_damage, can_stagger
end

ActionSweep._calculate_hit_mass_level_object = function (self, unit, target_health_extension, actual_hit_target_index, current_action)
	if target_health_extension:is_alive() then
		local hit_mass_total = unit_get_data(unit, "hit_mass")

		if self._ignore_mass_and_armour then
			hit_mass_total = 1
		end

		self._amount_of_mass_hit = self._amount_of_mass_hit + hit_mass_total
		self._number_of_hit_enemies = self._number_of_hit_enemies + 1
	end
end

local function calculate_attack_direction(action, weapon_rotation)
	local quaternion_axis = action.attack_direction or "forward"
	local attack_direction = Quaternion[quaternion_axis](weapon_rotation)

	return (action.invert_attack_direction and -attack_direction) or attack_direction
end

ActionSweep._check_backstab = function (self, breed, is_dummy_unit, hit_unit, owner_unit, buff_extension, first_person_extension)
	local backstab_multiplier = 1

	if (breed or is_dummy_unit) and AiUtils.unit_alive(hit_unit) then
		local owner_unit_pos = POSITION_LOOKUP[owner_unit]
		local hit_unit_pos = unit_world_position(hit_unit, 0)
		local owner_to_hit_dir = Vector3.normalize(hit_unit_pos - owner_unit_pos)
		local hit_unit_direction = Quaternion.forward(unit_local_rotation(hit_unit, 0))
		local hit_angle = Vector3.dot(hit_unit_direction, owner_to_hit_dir)
		local behind_target = hit_angle >= 0.55 and hit_angle <= 1

		if behind_target then
			backstab_multiplier = buff_extension:apply_buffs_to_value(backstab_multiplier, "backstab_multiplier")

			if script_data.debug_legendary_traits then
				backstab_multiplier = 1.5
			end

			if backstab_multiplier > 1 then
				first_person_extension:play_hud_sound_event("hud_player_buff_backstab")

				local side = Managers.state.side.side_by_unit[owner_unit]
				local player_and_bot_units = side.PLAYER_AND_BOT_UNITS

				for j = 1, #player_and_bot_units, 1 do
					local friendly_unit = player_and_bot_units[j]
					local friendly_buff_extension = ScriptUnit.has_extension(friendly_unit, "buff_system")

					if friendly_buff_extension then
						friendly_buff_extension:trigger_procs("on_backstab", hit_unit)
					end
				end
			end
		end
	end

	return backstab_multiplier
end

ActionSweep._send_attack_hit = function (self, t, damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, damage_profile_id, ...)
	if t < self._time_to_hit then
		local boxed_hit_pos = Vector3Box(hit_position)
		local boxed_attack_dir = Vector3Box(attack_direction)

		table.clear(self._stored_attack_data)

		self._stored_attack_data.damage_source_id = damage_source_id
		self._stored_attack_data.attacker_unit_id = attacker_unit_id
		self._stored_attack_data.hit_unit_id = hit_unit_id
		self._stored_attack_data.hit_zone_id = hit_zone_id
		self._stored_attack_data.hit_position = boxed_hit_pos
		self._stored_attack_data.attack_direction = boxed_attack_dir
		self._stored_attack_data.damage_profile_id = damage_profile_id
		self._stored_attack_data.optional_parameters = {
			...
		}
		self._send_delayed_hit_rpc = true
	else
		self.weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, damage_profile_id, ...)

		local impact_explosion_template_name = self._current_action.impact_explosion_template

		if impact_explosion_template_name then
			local hit_unit = self._network_manager:game_object_or_level_unit(hit_unit_id)
			local spine_node = Unit.has_node(hit_unit, "c_spine") and Unit.node(hit_unit, "c_spine")
			local explosion_position = (spine_node and Unit.world_position(hit_unit, spine_node)) or hit_position
			local world = self.world
			local owner_unit = self.owner_unit
			local rotation = self._stored_rotation:unbox()
			local scale = 1
			local item_name = self.item_name
			local power_level = self._power_level
			local is_server = self.is_server
			local is_husk = false
			local is_critical_strike = false
			local weapon_unit = self.weapon_unit
			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local impact_explosion_template = ExplosionTemplates[impact_explosion_template_name]
			local owner_unit_go_id = network_manager:unit_game_object_id(owner_unit)
			local impact_explosion_template_id = NetworkLookup.explosion_templates[impact_explosion_template_name]

			if is_server then
				network_transmit:send_rpc_clients("rpc_create_explosion", owner_unit_go_id, false, explosion_position, rotation, impact_explosion_template_id, scale, damage_source_id, power_level, is_critical_strike, owner_unit_go_id)
			else
				network_transmit:send_rpc_server("rpc_create_explosion", owner_unit_go_id, false, explosion_position, rotation, impact_explosion_template_id, scale, damage_source_id, power_level, is_critical_strike, owner_unit_go_id)
			end

			DamageUtils.create_explosion(world, owner_unit, explosion_position, rotation, impact_explosion_template, scale, item_name, is_server, is_husk, weapon_unit, power_level, is_critical_strike)
		end
	end
end

ActionSweep._do_overlap = function (self, dt, t, unit, owner_unit, current_action, physics_world, is_within_damage_window, current_position, current_rotation)
	if self._attack_aborted then
		return
	end

	local current_rot_up = Quaternion.up(current_rotation)
	local hit_environment_rumble = false
	local network_manager = self._network_manager
	local weapon_system = self.weapon_system
	local weapon_up_dir = Quaternion.up(current_rotation)
	local weapon_up_offset_mod = current_action.weapon_up_offset_mod or 0
	local weapon_up_offset = weapon_up_dir * weapon_up_offset_mod

	if not is_within_damage_window and not self._could_damage_last_update then
		local actual_last_position_current = current_position
		local last_position_current = Vector3(actual_last_position_current.x, actual_last_position_current.y, actual_last_position_current.z - self._down_offset) + weapon_up_offset

		self._stored_position:store(last_position_current)
		self._stored_rotation:store(current_rotation)

		return
	end

	local final_frame = not is_within_damage_window and self._could_damage_last_update
	self._could_damage_last_update = is_within_damage_window
	local position_previous = self._stored_position:unbox()
	local rotation_previous = self._stored_rotation:unbox()
	local weapon_up_dir_previous = Quaternion.up(rotation_previous)
	local actual_position_current = current_position
	local position_current = Vector3(actual_position_current.x, actual_position_current.y, actual_position_current.z - self._down_offset) + weapon_up_offset
	local rotation_current = current_rotation

	self._stored_position:store(position_current)
	self._stored_rotation:store(rotation_current)

	local weapon_half_extents = self.stored_half_extents:unbox()
	local weapon_half_length = weapon_half_extents.z
	local range_mod = (current_action.range_mod and current_action.range_mod * SweepRangeMod) or SweepRangeMod
	local width_mod = (current_action.width_mod and current_action.width_mod * SweepWidthMod) or 20 * SweepWidthMod
	local height_mod = (current_action.height_mod and current_action.height_mod * SweepHeigthMod) or 4 * SweepHeigthMod
	local range_mod_add = current_action.range_mod_add or 0

	if global_is_inside_inn then
		range_mod = 0.65 * range_mod
		width_mod = width_mod / 4
	end

	weapon_half_length = weapon_half_length * range_mod + range_mod_add / 2
	weapon_half_extents.x = weapon_half_extents.x * width_mod
	weapon_half_extents.y = weapon_half_extents.y * height_mod
	weapon_half_extents.z = weapon_half_length
	local weapon_rot = current_rotation
	local position_start = position_previous + weapon_up_dir_previous * weapon_half_length
	local position_end = (position_previous + current_rot_up * weapon_half_length * 2) - Quaternion.up(rotation_previous) * weapon_half_length
	local max_num_hits1 = 5
	local max_num_hits2 = 20
	local max_num_hits3 = 5
	local attack_direction = calculate_attack_direction(current_action, weapon_rot)
	local owner_player = Managers.player:owner(owner_unit)
	local weapon_cross_section = Vector3(weapon_half_extents.x, weapon_half_extents.y, 0.0001)
	local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
	local collision_filter = "filter_melee_sweep"

	if PhysicsWorld.start_reusing_sweep_tables then
		PhysicsWorld.start_reusing_sweep_tables()
	end

	local sweep_results1 = PhysicsWorld.linear_obb_sweep(physics_world, position_previous, position_previous + weapon_up_dir_previous * weapon_half_length * 2, weapon_cross_section, rotation_previous, max_num_hits1, "collision_filter", collision_filter, "report_initial_overlap")
	local sweep_results2 = PhysicsWorld.linear_obb_sweep(physics_world, position_start, position_end, weapon_half_extents, rotation_previous, max_num_hits2, "collision_filter", collision_filter, "report_initial_overlap")
	local sweep_results3 = PhysicsWorld.linear_obb_sweep(physics_world, position_previous + current_rot_up * weapon_half_length, position_current + current_rot_up * weapon_half_length, weapon_half_extents, rotation_current, max_num_hits3, "collision_filter", collision_filter, "report_initial_overlap")
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

					break
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

					break
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
	local damage_profile = self._damage_profile
	local hit_units = self._hit_units
	local environment_unit_hit = false
	local weapon_furthest_point = position_current + current_rot_up * weapon_half_length * 2
	local lost_precision_target = nil

	if current_action.use_precision_sweep and self._precision_target_unit then
		local this_frames_precision_target = self:check_precision_target(owner_unit, owner_player, current_action.dedicated_target_range, true, weapon_furthest_point)

		if self._precision_target_unit ~= this_frames_precision_target then
			lost_precision_target = true
			self._precision_target_unit = nil
		end
	end

	local number_of_results_this_frame = num_results1 + num_results2 + num_results3

	if final_frame and self._last_potential_hit_result_has_result then
		local num_added = 0
		local index_to_add_potential = 1

		for i = 1, #self._last_potential_hit_result, 1 do
			if not self._last_potential_hit_result[i].already_hit then
				local saved_result = {}
				local has_potential_actor = self._last_potential_hit_result[i].actor:unbox()

				if has_potential_actor then
					saved_result.actor = self._last_potential_hit_result[i].actor:unbox()
					saved_result.position = self._last_potential_hit_result[i].hit_position:unbox()
					saved_result.normal = self._last_potential_hit_result[i].hit_normal:unbox()

					table.insert(SWEEP_RESULTS, index_to_add_potential, saved_result)

					local potential_unit = self._last_potential_hit_result[i].hit_unit
					hit_units[potential_unit] = nil
					index_to_add_potential = index_to_add_potential + 1
					num_added = num_added + 1
				end
			end
		end

		number_of_results_this_frame = number_of_results_this_frame + num_added
	end

	local side = Managers.state.side.side_by_unit[owner_unit]
	local enemy_units_lookup = side.enemy_units_lookup
	local view_position, view_rotation = first_person_extension:camera_position_rotation()

	for i = 1, number_of_results_this_frame, 1 do
		local has_potential_result = self._last_potential_hit_result_has_result
		local has_hit_precision_target = self._has_hit_precision_target
		local has_hit_precision_target_and_has_last_hit_result = has_potential_result and (has_hit_precision_target or lost_precision_target)
		local result = SWEEP_RESULTS[i]
		local hit_actor = result.actor
		local hit_unit = Actor.unit(hit_actor)
		local hit_position = result.position
		local hit_normal = result.normal

		if has_hit_precision_target_and_has_last_hit_result then
			local last_potential_result_index = #self._last_potential_hit_result
			local use_saved_target_instead = false

			if lost_precision_target then
				use_saved_target_instead = true
				lost_precision_target = false
			elseif self._last_potential_hit_result[last_potential_result_index].hit_mass_budget then
				use_saved_target_instead = true
			end

			if use_saved_target_instead then
				local last_potential_actor = self._last_potential_hit_result[last_potential_result_index].actor:unbox()

				if last_potential_actor then
					hit_actor = last_potential_actor
					hit_unit = Actor.unit(hit_actor)
					hit_position = self._last_potential_hit_result[last_potential_result_index].hit_position:unbox()
					hit_normal = self._last_potential_hit_result[last_potential_result_index].hit_normal:unbox()
					local potential_unit = self._last_potential_hit_result[last_potential_result_index].hit_unit
					hit_units[potential_unit] = nil
					self._last_potential_hit_result[last_potential_result_index].already_hit = true
					i = i - 1
				end
			end

			self._last_potential_hit_result_has_result = false
		end

		local hit_armor = false

		if unit_alive(hit_unit) and Vector3.is_valid(hit_position) then
			fassert(Vector3.is_valid(hit_position), "The hit position is not valid! Actor: %s, Unit: %s", hit_actor, hit_unit)
			assert(hit_unit, "hit_unit is nil.")

			hit_unit, hit_actor = ActionUtils.redirect_shield_hit(hit_unit, hit_actor)
			local breed = AiUtils.unit_breed(hit_unit)
			local is_dodging = false
			local in_view = first_person_extension:is_within_custom_view(hit_position, view_position, view_rotation, action_hitbox_vertical_fov, action_hitbox_horizontal_fov)
			local is_character = breed ~= nil
			local hit_self = hit_unit == owner_unit
			local is_friendly_fire = not enemy_units_lookup[hit_unit]
			local shield_blocked = false

			if breed and breed.can_dodge then
				is_dodging = AiUtils.attack_is_dodged(hit_unit)
			end

			if is_character and not is_friendly_fire and not hit_self and in_view and (has_hit_precision_target_and_has_last_hit_result or self._hit_units[hit_unit] == nil) then
				hit_units[hit_unit] = true
				local status_extension = self._status_extension
				shield_blocked = is_dodging or (AiUtils.attack_is_shield_blocked(hit_unit, owner_unit) and not current_action.ignore_armour_hit and not self._ignore_mass_and_armour and not status_extension:is_invisible())
				local target_health_extension = ScriptUnit.extension(hit_unit, "health_system")
				local can_damage = false
				local can_stagger = false
				local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
				local actual_hit_target_index = 1
				local target_settings = nil

				if current_action.use_precision_sweep and self._precision_target_unit ~= nil and not self._has_hit_precision_target and not final_frame then
					if hit_unit == self._precision_target_unit then
						self._has_hit_precision_target = true
						actual_hit_target_index, shield_blocked, can_damage, can_stagger = self:_calculate_hit_mass(difficulty_rank, target_health_extension, actual_hit_target_index, shield_blocked, current_action, breed, hit_unit_id)
						target_settings = damage_profile.default_target
					elseif target_health_extension:is_alive() then
						local potential_target_hit_mass = self:_get_target_hit_mass(difficulty_rank, shield_blocked, current_action, breed, hit_unit_id)
						local num_potential_hits = self._number_of_potential_hit_results + 1
						local result_to_save = {}
						self._last_potential_hit_result_has_result = true
						result_to_save.hit_unit = hit_unit
						result_to_save.actor = ActorBox(hit_actor)
						result_to_save.hit_position = Vector3Box(hit_position)
						result_to_save.hit_normal = Vector3Box(hit_normal)
						result_to_save.hit_mass_budget = self._max_targets - (self._amount_of_mass_hit + potential_target_hit_mass) >= 0
						self._last_potential_hit_result[num_potential_hits] = result_to_save
						self._number_of_potential_hit_results = num_potential_hits
					end
				elseif self._amount_of_mass_hit < self._max_targets or has_hit_precision_target_and_has_last_hit_result then
					if not is_friendly_fire then
						actual_hit_target_index, shield_blocked, can_damage, can_stagger = self:_calculate_hit_mass(difficulty_rank, target_health_extension, actual_hit_target_index, shield_blocked, current_action, breed, hit_unit_id)
					end

					local targets = damage_profile.targets
					target_settings = (targets and targets[actual_hit_target_index]) or damage_profile.default_target
				end

				if target_settings then
					local buff_extension = self._owner_buff_extension
					local damage_profile_id = self._damage_profile_id
					local hit_zone_name = nil

					if breed then
						local node = actor_node(hit_actor)
						local hit_zone = breed.hit_zones_lookup[node]
						hit_zone_name = hit_zone.name
						hit_armor = (target_health_extension:is_alive() and (breed.armor_category == 2 or breed.stagger_armor_category == 2)) or breed.armor_category == 3
					else
						hit_zone_name = "torso"
					end

					local abort_attack = self._max_targets <= self._number_of_hit_enemies or (self._max_targets <= self._amount_of_mass_hit and not self._ignore_mass_and_armour) or (hit_armor and not current_action.slide_armour_hit and not current_action.ignore_armour_hit and not self._ignore_mass_and_armour)

					if shield_blocked then
						abort_attack = self._max_targets <= self._amount_of_mass_hit + 3 or (hit_armor and not current_action.slide_armour_hit and not current_action.ignore_armour_hit and not self._ignore_mass_and_armour)
					end

					local armor_type = breed.armor_category

					self:_play_hit_animations(owner_unit, current_action, abort_attack, hit_zone_name, armor_type, shield_blocked)

					if sound_effect_extension and AiUtils.unit_alive(hit_unit) then
						sound_effect_extension:add_hit()
					end

					local damage_source = self.item_name
					local damage_source_id = NetworkLookup.damage_sources[damage_source]
					local attacker_unit_id = network_manager:unit_game_object_id(owner_unit)
					local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
					local is_server = self.is_server
					local backstab_multiplier = self:_check_backstab(breed, nil, hit_unit, owner_unit, buff_extension, first_person_extension)

					if breed and not is_dodging then
						local has_melee_boost, melee_boost_curve_multiplier = self:_get_power_boost()
						local power_level = self._power_level
						local is_critical_strike = self._is_critical_strike or has_melee_boost

						self:_play_character_impact(is_server, owner_unit, hit_unit, breed, hit_position, hit_zone_name, current_action, damage_profile, actual_hit_target_index, power_level, attack_direction, shield_blocked, melee_boost_curve_multiplier, is_critical_strike, backstab_multiplier)
					end

					if is_dodging then
						abort_attack = false
					end

					if Managers.state.controller_features and self.owner.local_player and not self._has_played_rumble_effect then
						if hit_armor then
							Managers.state.controller_features:add_effect("rumble", {
								rumble_effect = "hit_armor"
							})
						else
							local hit_rumble_effect = current_action.hit_rumble_effect or "hit_character"

							Managers.state.controller_features:add_effect("rumble", {
								rumble_effect = hit_rumble_effect
							})
						end

						if abort_attack then
							self._has_played_rumble_effect = true
						end
					end

					local has_melee_boost, melee_boost_curve_multiplier = self:_get_power_boost()
					local power_level = self._power_level
					local is_critical_strike = self._is_critical_strike or has_melee_boost
					local charge_value = damage_profile.charge_value
					local shield_break_procc = false
					local buff_result = "no_buff"

					if shield_blocked then
						if (charge_value == "heavy_attack" and buff_extension:has_buff_perk("shield_break")) or buff_extension:has_buff_type("armor penetration") then
							shield_break_procc = true
						end
					else
						local send_to_server = true
						local number_of_hit_enemies = self._number_of_hit_enemies
						local buff_type = DamageUtils.get_item_buff_type(self.item_name)
						buff_result = DamageUtils.buff_on_attack(owner_unit, hit_unit, charge_value, is_critical_strike, hit_zone_name, number_of_hit_enemies, send_to_server, buff_type)
						local attack_template_id = NetworkLookup.attack_templates[target_settings.attack_template]

						weapon_system:rpc_weapon_blood(nil, attacker_unit_id, attack_template_id)

						local blood_position = Vector3(result.position.x, result.position.y, result.position.z + self._down_offset)

						Managers.state.blood:add_enemy_blood(blood_position, hit_unit, target_health_extension)
					end

					if buff_result ~= "killing_blow" then
						self:_send_attack_hit(t, damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, damage_profile_id, "power_level", power_level, "hit_target_index", actual_hit_target_index, "blocking", shield_blocked, "shield_break_procced", shield_break_procc, "boost_curve_multiplier", melee_boost_curve_multiplier, "is_critical_strike", is_critical_strike, "can_damage", can_damage, "can_stagger", can_stagger, "backstab_multiplier", backstab_multiplier, "first_hit", self._number_of_hit_enemies == 1)

						if not shield_blocked and not self.is_server then
							local attack_template_id = NetworkLookup.attack_templates[target_settings.attack_template]

							network_manager.network_transmit:send_rpc_server("rpc_weapon_blood", attacker_unit_id, attack_template_id)
						end

						unit_flow_event(self.first_person_unit, "sfx_swing_hit")

						if current_action.add_fatigue_on_hit then
							self:_handle_fatigue(buff_extension, self._status_extension, current_action, false)
						end
					else
						first_person_extension:play_hud_sound_event("Play_hud_matchmaking_countdown")
					end

					if abort_attack then
						break
					end
				end
			elseif not is_character and in_view then
				if ScriptUnit.has_extension(hit_unit, "ai_inventory_item_system") then
					if not self._hit_units[hit_unit] then
						unit_flow_event(hit_unit, "break_shield")

						self._hit_units[hit_unit] = true
					end

					if Managers.state.controller_features and self.owner.local_player and not self._has_played_rumble_effect then
						Managers.state.controller_features:add_effect("rumble", {
							rumble_effect = "hit_shield"
						})

						self._has_played_rumble_effect = true
					end
				elseif hit_units[hit_unit] == nil and ScriptUnit.has_extension(hit_unit, "health_system") then
					local level_index, is_level_unit = Managers.state.network:game_object_or_level_id(hit_unit)
					local is_dummy_unit = unit_get_data(hit_unit, "is_dummy")

					if is_dummy_unit then
						local target_health_extension = ScriptUnit.extension(hit_unit, "health_system")
						local hit_unit_armor = unit_get_data(hit_unit, "armor") or 1

						self:_calculate_hit_mass_level_object(hit_unit, target_health_extension, 1, current_action)
						self:hit_level_object(hit_units, hit_unit, owner_unit, current_action, hit_position, attack_direction, level_index, true, hit_actor)
						self:_play_environmental_effect(current_rotation, current_action, hit_unit, hit_position, hit_normal, hit_actor)

						hit_environment_rumble = true
						local is_armored = hit_unit_armor and hit_unit_armor == 2
						local abort_attack = self._max_targets <= self._number_of_hit_enemies or ((is_armored or self._max_targets <= self._amount_of_mass_hit) and not current_action.slide_armour_hit and not self._ignore_mass_and_armour)

						self:_play_hit_animations(owner_unit, current_action, abort_attack)

						if abort_attack then
							break
						end
					elseif is_level_unit then
						self:hit_level_object(hit_units, hit_unit, owner_unit, current_action, hit_position, attack_direction, level_index, false)
						self:_play_environmental_effect(current_rotation, current_action, hit_unit, hit_position, hit_normal, hit_actor)

						hit_environment_rumble = true
					else
						self._hit_units[hit_unit] = hit_unit
						local actual_hit_target_index = math.ceil(self._amount_of_mass_hit + 1)
						local damage_source = self.item_name
						local damage_source_id = NetworkLookup.damage_sources[damage_source]
						local attacker_unit_id = network_manager:unit_game_object_id(owner_unit)
						local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
						local hit_zone_id = NetworkLookup.hit_zones.full
						local damage_profile_id = self._damage_profile_id
						local has_melee_boost, melee_boost_curve_multiplier = self:_get_power_boost()
						local power_level = self._power_level
						local is_critical_strike = self._is_critical_strike or has_melee_boost
						local attack_allowed = unit_get_data(hit_unit, "allow_melee_damage")

						if attack_allowed ~= false then
							self:_send_attack_hit(t, damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, damage_profile_id, "power_level", power_level, "hit_target_index", actual_hit_target_index, "blocking", shield_blocked, "boost_curve_multiplier", melee_boost_curve_multiplier, "is_critical_strike", is_critical_strike)

							local abort_attack = not unit_get_data(hit_unit, "weapon_hit_through")

							self:_play_hit_animations(owner_unit, current_action, abort_attack)
							self:_play_environmental_effect(current_rotation, current_action, hit_unit, hit_position, hit_normal, hit_actor)

							hit_environment_rumble = true
						end
					end
				elseif hit_units[hit_unit] == nil then
					if global_is_inside_inn then
						local abort_attack = true

						self:_play_hit_animations(owner_unit, current_action, abort_attack)
					end

					environment_unit_hit = i
					hit_environment_rumble = true
				end
			end

			if shield_blocked then
				self._amount_of_mass_hit = self._amount_of_mass_hit + 3
			end
		end
	end

	if environment_unit_hit and not self._has_hit_environment and num_results1 + num_results2 > 0 then
		self._has_hit_environment = true
		local result = SWEEP_RESULTS[environment_unit_hit]
		local hit_actor = result.actor
		local hit_unit = Actor.unit(hit_actor)

		assert(hit_unit, "hit unit is nil")
		fassert(hit_unit, "hit unit is nil")

		if unit ~= hit_unit then
			local hit_position = result.position
			local hit_normal = result.normal
			local hit_direction = attack_direction

			self:_play_environmental_effect(current_rotation, current_action, hit_unit, hit_position, hit_normal, hit_actor)

			if Managers.state.controller_features and global_is_inside_inn and self.owner.local_player and not self._has_played_rumble_effect then
				Managers.state.controller_features:add_effect("rumble", {
					rumble_effect = "hit_environment"
				})

				self._has_played_rumble_effect = true
			end

			if hit_unit and unit_alive(hit_unit) and hit_actor then
				unit_set_flow_variable(hit_unit, "hit_actor", hit_actor)
				unit_set_flow_variable(hit_unit, "hit_direction", hit_direction)
				unit_set_flow_variable(hit_unit, "hit_position", hit_position)
				unit_flow_event(hit_unit, "lua_simple_damage")
			end
		end
	end

	if final_frame then
		self._attack_aborted = true
	end

	if Managers.state.controller_features and global_is_inside_inn and hit_environment_rumble and self.owner.local_player and not self._has_played_rumble_effect then
		Managers.state.controller_features:add_effect("rumble", {
			rumble_effect = "hit_environment"
		})

		self._has_played_rumble_effect = true
	end

	if PhysicsWorld.stop_reusing_sweep_tables then
		PhysicsWorld.stop_reusing_sweep_tables()
	end
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
end

local sound_events = {
	axe_2h_hit = "slashing_hit",
	slashing_hit = "slashing_hit",
	stab_hit = "stab_hit",
	crowbill_stab_hit = "stab_hit",
	Play_weapon_fire_torch_flesh_hit = "burning_hit",
	axe_1h_hit = "slashing_hit",
	hammer_2h_hit = "blunt_hit",
	blunt_hit = "blunt_hit"
}

ActionSweep._play_character_impact = function (self, is_server, attacker_unit, hit_unit, breed, hit_position, hit_zone_name, current_action, damage_profile, target_index, power_level, attack_direction, blocking, boost_curve_multiplier, is_critical_strike, backstab_multiplier)
	local attacker_player = Managers.player:owner(attacker_unit)
	local husk = attacker_player.bot_player
	local world = self.world
	local owner_unit = self.owner_unit
	local target_settings = (damage_profile.targets and damage_profile.targets[target_index]) or damage_profile.default_target
	local attack_template_name = target_settings.attack_template
	local attack_template = AttackTemplates[attack_template_name]
	local predicted_damage = 0

	if target_settings then
		local damage_source = self.item_name
		local boost_curve = BoostCurves[target_settings.boost_curve_type]
		predicted_damage = DamageUtils.calculate_damage(DamageOutput, hit_unit, attacker_unit, hit_zone_name, power_level, boost_curve, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, backstab_multiplier, damage_source)
	end

	local no_damage = predicted_damage <= 0
	local hitzone_armor_categories = breed.hitzone_armor_categories
	local target_unit_armor = (hitzone_armor_categories and hitzone_armor_categories[hit_zone_name]) or breed.armor_category
	local sound_event = (no_damage and current_action.stagger_impact_sound_event) or current_action.impact_sound_event

	if blocking then
		if sound_events[sound_event] == "blunt_hit" then
			sound_event = breed.shield_blunt_block_sound or "blunt_hit_shield_wood"
		elseif sound_events[sound_event] == "slashing_hit" then
			sound_event = breed.shield_slashing_block_sound or "slashing_hit_shield_wood"
		elseif sound_events[sound_event] == "stab_hit" then
			sound_event = breed.shield_stab_block_sound or "stab_hit_shield_wood"
		elseif sound_events[sound_event] == "burning_hit" then
			sound_event = breed.shield_stab_block_sound or "Play_weapon_fire_torch_wood_shield_hit"
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
		hit_effect = current_action.impact_particle_effect or BloodSettings:get_hit_effect_for_race(breed.race)

		EffectHelper.player_critical_hit(world, is_critical_strike, attacker_unit, hit_unit, hit_position)
	end

	if predicted_damage <= 0 then
		damage_type = "no_damage"
	end

	local is_dummy = unit_get_data(hit_unit, "is_dummy")

	if hit_effect and not is_dummy then
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
		local hit_unit_id = network_manager:unit_game_object_id(hit_unit)

		if is_server then
			network_manager.network_transmit:send_rpc_clients("rpc_play_melee_hit_effects", sound_event_id, hit_position, sound_type_id, hit_unit_id)
		else
			network_manager.network_transmit:send_rpc_server("rpc_play_melee_hit_effects", sound_event_id, hit_position, sound_type_id, hit_unit_id)
		end
	else
		Application.warning("[ActionSweep] Missing sound event for sweep action in unit %q.", self.weapon_unit)
	end

	local multiplier_type = DamageUtils.get_breed_damage_multiplier_type(breed, hit_zone_name, is_dummy)

	if (multiplier_type == "headshot" or (multiplier_type == "weakspot" and not blocking)) and not current_action.no_headshot_sound and AiUtils.unit_alive(hit_unit) then
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

		first_person_extension:play_hud_sound_event("Play_hud_melee_headshot", nil, false)
	end

	local target_health_extension = ScriptUnit.extension(hit_unit, "health_system")
	local wounds_left = target_health_extension:current_health()
	local target_presumed_dead = wounds_left <= predicted_damage
	local sound_effect_extension = ScriptUnit.has_extension(self.owner_unit, "sound_effect_system")

	if sound_effect_extension and target_presumed_dead then
		sound_effect_extension:melee_kill()
	end

	if blocking then
		return
	end

	if not is_dummy and not husk and not target_presumed_dead and breed and not breed.disable_local_hit_reactions and unit_has_animation_state_machine(hit_unit) then
		local hit_anim = nil

		if unit_has_animation_event(hit_unit, "hit_reaction_climb") then
			local network_manager = Managers.state.network
			local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
			local action_name = NetworkLookup.bt_action_names[GameSession.game_object_field(network_manager:game(), hit_unit_id, "bt_action_name")]

			if action_name and action_name == "climb" then
				hit_anim = "hit_reaction_climb"
			end
		end

		if not hit_anim then
			local hit_unit_dir = Quaternion.forward(unit_local_rotation(hit_unit, 0))
			local angle_difference = Vector3.flat_angle(hit_unit_dir, attack_direction)

			if angle_difference < -math.pi * 0.75 or angle_difference > math.pi * 0.75 then
				hit_anim = "hit_reaction_backward"
			elseif angle_difference < -math.pi * 0.25 then
				hit_anim = "hit_reaction_left"
			elseif angle_difference < math.pi * 0.25 then
				hit_anim = "hit_reaction_forward"
			else
				hit_anim = "hit_reaction_right"
			end
		end

		unit_animation_event(hit_unit, hit_anim)
	end
end

local DUMMY_BREED = {}

ActionSweep.hit_level_object = function (self, hit_units, hit_unit, owner_unit, current_action, hit_position, attack_direction, level_index, is_dummy_unit, hit_actor)
	hit_units[hit_unit] = true
	self._has_hit_environment = true
	local no_player_damage = unit_get_data(hit_unit, "no_damage_from_players")

	if not no_player_damage then
		local hit_zone_name = "full"

		if not is_dummy_unit then
			self._amount_of_mass_hit = self._amount_of_mass_hit + 1
		end

		local target_index = math.ceil(self._amount_of_mass_hit)
		local damage_profile = self._damage_profile
		local damage_profile_id = self._damage_profile_id
		local damage_source = self.item_name
		local has_melee_boost, melee_boost_curve_multiplier = self:_get_power_boost()
		local power_level = self._power_level
		local is_critical_strike = self._is_critical_strike or has_melee_boost

		if is_dummy_unit then
			local node = actor_node(hit_actor)
			local head_actor = unit_actor(hit_unit, "c_head")
			local head_node = actor_node(head_actor)

			if node == head_node then
				hit_zone_name = "head"
			else
				hit_zone_name = "full"
			end

			local actual_hit_target_index = 1
			local buff_extension = self._owner_buff_extension
			local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
			local backstab_multiplier = self:_check_backstab(nil, is_dummy_unit, hit_unit, owner_unit, buff_extension, first_person_extension)
			local shield_blocked = false
			DUMMY_BREED.armor_category = unit_get_data(hit_unit, "armor")

			self:_play_character_impact(self.is_server, owner_unit, hit_unit, DUMMY_BREED, hit_position, hit_zone_name, current_action, damage_profile, actual_hit_target_index, power_level, attack_direction, shield_blocked, melee_boost_curve_multiplier, is_critical_strike, backstab_multiplier)
			DamageUtils.damage_dummy_unit(hit_unit, owner_unit, hit_zone_name, power_level, melee_boost_curve_multiplier, is_critical_strike, damage_profile, target_index, hit_position, attack_direction, damage_source, hit_actor, damage_profile_id)
		else
			DamageUtils.damage_level_unit(hit_unit, owner_unit, hit_zone_name, power_level, melee_boost_curve_multiplier, is_critical_strike, damage_profile, target_index, attack_direction, damage_source)
		end
	end

	local first_person_hit_anim = current_action.first_person_hit_anim

	if first_person_hit_anim then
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
		local first_person_unit = first_person_extension:get_first_person_unit()

		unit_animation_event(first_person_unit, first_person_hit_anim)
	end
end

ActionSweep.finish = function (self, reason, data)
	local current_action = self._current_action

	if reason == "new_interupting_action" then
		local current_time_in_action = self.current_time_in_action or 0
		local dt = self._dt
		local t = Managers.time:time("game")

		self:_update_sweep(dt * 2, t, current_action, current_time_in_action - dt)
	end

	if reason == "interacting" then
		unit_flow_event(self.weapon_unit, "lua_finish_interacting")
	end

	local owner_unit = self.owner_unit
	local action_aborted_flow_event = current_action.action_aborted_flow_event

	if action_aborted_flow_event and not self.action_aborted_flow_event_sent then
		unit_flow_event(self.weapon_unit, action_aborted_flow_event)
	end

	self.action_aborted_flow_event_sent = nil
	local hud_extension = self._owner_hud_extension

	if hud_extension then
		hud_extension.show_critical_indication = false
	end

	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

	first_person_extension:enable_rig_movement()

	if self._is_critical_strike then
		local stop_crit_hud_sound_event = "Stop_player_combat_crit_swing_2D"

		first_person_extension:play_hud_sound_event(stop_crit_hud_sound_event, nil, false)
	end
end

ActionSweep.destroy = function (self)
	return
end

ActionSweep._play_hit_animations = function (self, owner_unit, current_action, abort_attack, hit_zone_name, armor_type, blocking)
	local hit_stop_anim = (current_action.dual_hit_stop_anims and self._action_hand and current_action.dual_hit_stop_anims[self._action_hand]) or current_action.hit_stop_anim
	local first_person_hit_anim = (hit_zone_name ~= "head" and armor_type == 2 and abort_attack and current_action.hit_armor_anim) or (abort_attack and blocking and current_action.hit_shield_stop_anim) or (abort_attack and hit_stop_anim) or current_action.first_person_hit_anim
	local third_person_hit_anim = abort_attack and current_action.hit_stop_anim
	self._attack_aborted = self._attack_aborted or abort_attack

	if first_person_hit_anim then
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
		local first_person_unit = first_person_extension:get_first_person_unit()

		unit_animation_event(first_person_unit, first_person_hit_anim)
	end

	local action_aborted_flow_event = current_action.action_aborted_flow_event

	if action_aborted_flow_event and abort_attack then
		self.action_aborted_flow_event_sent = true

		unit_flow_event(self.weapon_unit, action_aborted_flow_event)
	end

	if third_person_hit_anim then
		CharacterStateHelper.play_animation_event(owner_unit, third_person_hit_anim)
	end
end

return
