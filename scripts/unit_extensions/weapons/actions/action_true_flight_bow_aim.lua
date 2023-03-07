require("scripts/unit_extensions/weapons/projectiles/true_flight_templates")

ActionTrueFlightBowAim = class(ActionTrueFlightBowAim, ActionBase)
local actor_unit = Actor.unit
local actor_node = Actor.node
local unit_actor = Unit.actor
local unit_has_node = Unit.has_node
local unit_node = Unit.node
local unit_get_data = Unit.get_data
local unit_world_position = Unit.world_position
local vector3_distance_squared = Vector3.distance_squared
local vector3_length = Vector3.length
local vector3_dot = Vector3.dot
local RAYCAST_INDEX_POSITION = 1
local RAYCAST_INDEX_DISTANCE = 2
local RAYCAST_INDEX_NORMAL = 3
local RAYCAST_INDEX_ACTOR = 4

ActionTrueFlightBowAim.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionTrueFlightBowAim.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	if ScriptUnit.has_extension(self.weapon_unit, "spread_system") then
		self.spread_extension = ScriptUnit.extension(self.weapon_unit, "spread_system")
	end

	self.overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
	self.first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
end

ActionTrueFlightBowAim.client_owner_start_action = function (self, new_action, t, chain_action_data)
	ActionTrueFlightBowAim.super.client_owner_start_action(self, new_action, t, chain_action_data)

	self._marked_target = {}
	self.current_action = new_action
	self.aim_timer = 0
	self.aim_sticky_timer = 0
	self._is_sticky_target = false
	self._current_target_priority = -1
	self.target = chain_action_data and chain_action_data.target or nil
	self.targets = chain_action_data and chain_action_data.targets or {}
	self.aimed_target = chain_action_data and chain_action_data.target or nil

	self:_mark_target(self.target)

	self.time_to_shoot = t
	local owner_unit = self.owner_unit
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self.charge_time = buff_extension:apply_buffs_to_value(new_action.charge_time or 0, "reduced_ranged_charge_time")
	self.overcharge_timer = 0
	self.zoom_condition_function = new_action.zoom_condition_function
	self.prioritized_breeds = new_action.prioritized_breeds
	self.played_aim_sound = false
	self.aim_sound_time = t + (new_action.aim_sound_delay or 0)
	self.aim_zoom_time = t + (new_action.aim_zoom_delay or 0)
	local loaded_projectile_settings = new_action.loaded_projectile_settings

	if loaded_projectile_settings then
		local inventory_extension = ScriptUnit.extension(self.owner_unit, "inventory_system")

		inventory_extension:set_loaded_projectile_override(loaded_projectile_settings)
	end

	self.charge_ready_sound_event = self.current_action.charge_ready_sound_event

	self:_start_charge_sound()

	local spread_template_override = new_action.spread_template_override

	if spread_template_override then
		self.spread_extension:override_spread_template(spread_template_override)
	end
end

ActionTrueFlightBowAim._start_charge_sound = function (self)
	local current_action = self.current_action
	local owner_unit = self.owner_unit
	local owner_player = self.owner_player
	local is_bot = owner_player and owner_player.bot_player
	local is_local = owner_player and not owner_player.remote
	local wwise_world = self.wwise_world

	if is_local and not is_bot then
		local wwise_playing_id, wwise_source_id = ActionUtils.start_charge_sound(wwise_world, self.weapon_unit, owner_unit, current_action)
		self.charging_sound_id = wwise_playing_id
		self.wwise_source_id = wwise_source_id
	end

	ActionUtils.play_husk_sound_event(wwise_world, current_action.charge_sound_husk_name, owner_unit, is_bot)
end

ActionTrueFlightBowAim._stop_charge_sound = function (self)
	local current_action = self.current_action
	local owner_unit = self.owner_unit
	local owner_player = self.owner_player
	local is_bot = owner_player and owner_player.bot_player
	local is_local = owner_player and not owner_player.remote
	local wwise_world = self.wwise_world

	if is_local and not is_bot then
		ActionUtils.stop_charge_sound(wwise_world, self.charging_sound_id, self.wwise_source_id, current_action)

		self.charging_sound_id = nil
		self.wwise_source_id = nil
	end

	ActionUtils.play_husk_sound_event(wwise_world, current_action.charge_sound_husk_stop_event, owner_unit, is_bot)
end

local EMPTY_TABLE = {}

ActionTrueFlightBowAim.client_owner_post_update = function (self, dt, t, world, can_damage)
	local current_action = self.current_action
	local owner_unit = self.owner_unit
	local time_to_shoot = self.time_to_shoot
	local current_target = self.target
	local owner_player = Managers.player:owner(owner_unit)
	local is_bot = owner_player and owner_player.bot_player

	if current_action.overcharge_interval then
		self.overcharge_timer = self.overcharge_timer + dt

		if current_action.overcharge_interval <= self.overcharge_timer then
			if self.overcharge_extension then
				local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[current_action.overcharge_type]

				self.overcharge_extension:add_charge(overcharge_amount)
			end

			self.overcharge_timer = 0
		end
	end

	if not self.zoom_condition_function or self.zoom_condition_function() then
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")
		local input_extension = ScriptUnit.extension(owner_unit, "input_system")
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

		if not status_extension:is_zooming() and self.aim_zoom_time <= t then
			status_extension:set_zooming(true, current_action.default_zoom)
		end

		if buff_extension:has_buff_type("increased_zoom") and status_extension:is_zooming() and input_extension:get("action_three") then
			status_extension:switch_variable_zoom(current_action.buffed_zoom_thresholds)
		elseif current_action.zoom_thresholds and status_extension:is_zooming() and input_extension:get("action_three") then
			status_extension:switch_variable_zoom(current_action.zoom_thresholds)
		end
	end

	if not self.played_aim_sound and self.aim_sound_time <= t and not is_bot then
		local sound_event = current_action.aim_sound_event

		if sound_event then
			local wwise_world = self.wwise_world

			WwiseWorld.trigger_event(wwise_world, sound_event)
		end

		self.played_aim_sound = true
	end

	if not is_bot and current_target and not AiUtils.unit_alive(current_target) then
		self:_mark_target(nil)

		self.target = nil
		current_target = nil
	end

	local required_aim_time = current_action.aim_time or 0.1
	local aim_sticky_time = current_action.aim_sticky_time or 0

	if required_aim_time <= self.aim_timer and (not current_target or aim_sticky_time <= self.aim_sticky_timer) then
		local physics_world = World.get_data(world, "physics_world")
		local first_person_extension = self.first_person_extension
		local player_position, player_rotation = first_person_extension:get_projectile_start_position_rotation()
		local direction = Vector3.normalize(Quaternion.forward(player_rotation))
		local results, num_results = nil

		if current_action.aim_obstructed_by_walls then
			results, num_results = PhysicsWorld.immediate_raycast_actors(physics_world, player_position, direction, "dynamic_collision_filter", "filter_ray_true_flight_ai_only", "dynamic_collision_filter", "filter_ray_true_flight_hitbox_only", "static_collision_filter", "filter_player_ray_projectile_static_only")
		else
			results, num_results = PhysicsWorld.immediate_raycast_actors(physics_world, player_position, direction, "dynamic_collision_filter", "filter_ray_true_flight_ai_only", "dynamic_collision_filter", "filter_ray_true_flight_hitbox_only")
		end

		local hit_unit = nil
		local higest_priority = -1

		if num_results > 0 then
			local prio_breeds = self.prioritized_breeds or EMPTY_TABLE
			local ignore_bosses = current_action.ignore_bosses

			for i = 1, num_results do
				local result = results[i]
				local hit_actor = result[RAYCAST_INDEX_ACTOR]

				if hit_actor then
					local unit = actor_unit(hit_actor)

					if AiUtils.unit_alive(unit) then
						local node = actor_node(hit_actor)
						local breed = AiUtils.unit_breed(unit)
						local hit_zone = breed and breed.hit_zones_lookup[node]

						if hit_zone and hit_zone.name ~= "afro" and not breed.no_autoaim and (not ignore_bosses or not breed.boss) then
							local priority = prio_breeds[breed.name] or -1

							if priority > 0 and higest_priority < priority then
								hit_unit = unit
								higest_priority = priority
							else
								hit_unit = hit_unit or unit
							end
						end
					end
				end
			end
		end

		if current_action.aim_sticky_target_size and POSITION_LOOKUP[current_target] and self._is_sticky_target and higest_priority <= self._current_target_priority then
			local old_target_distance_sq = vector3_distance_squared(POSITION_LOOKUP[current_target], player_position)
			local new_target_distance_sq = hit_unit and vector3_distance_squared(POSITION_LOOKUP[hit_unit], player_position) or math.huge

			if old_target_distance_sq < new_target_distance_sq or self._priority_target and not priority_target then
				local target_node = unit_has_node(current_target, "j_spine1") and unit_node(current_target, "j_spine1") or 0
				local position = unit_world_position(current_target, target_node)
				local to_old_target = position - player_position
				local dist_to_old_target = vector3_length(to_old_target)
				local dir_to_old_target = dist_to_old_target > 0 and to_old_target / dist_to_old_target or 0
				local radius = current_action.aim_sticky_target_size
				local sticky_target_threshold = math.cos(math.atan2(radius, dist_to_old_target))
				local aim_dir = vector3_dot(direction, dir_to_old_target)

				if sticky_target_threshold < aim_dir then
					hit_unit = current_target
				else
					self._is_sticky_target = false
				end
			end
		end

		if hit_unit and self.aimed_target ~= hit_unit then
			self.aimed_target = hit_unit
			self.aim_timer = 0

			if ALIVE[hit_unit] and current_target ~= hit_unit then
				current_target = hit_unit
				self.target = hit_unit

				self:_mark_target(hit_unit)

				self.aim_sticky_timer = 0
				self._is_sticky_target = higest_priority > 0
				self._current_target_priority = higest_priority
			end
		end
	end

	self.charge_value = math.min(math.max(t - time_to_shoot, 0) / self.charge_time, 1)

	if not is_bot then
		local charge_sound_parameter_name = current_action.charge_sound_parameter_name

		if charge_sound_parameter_name then
			local wwise_world = self.wwise_world
			local wwise_source_id = self.wwise_source_id

			WwiseWorld.set_source_parameter(wwise_world, wwise_source_id, charge_sound_parameter_name, self.charge_value)
		end

		if self.charge_ready_sound_event and self.charge_value >= 1 then
			self.first_person_extension:play_hud_sound_event(self.charge_ready_sound_event)

			self.charge_ready_sound_event = nil
		end
	end

	self.aim_timer = self.aim_timer + dt
	self.aim_sticky_timer = self.aim_sticky_timer + dt
end

ActionTrueFlightBowAim._get_visible_targets = function (self, aimed_target, num_targets, is_bot)
	local first_person_extension = self.first_person_extension
	local own_position, look_rotation = first_person_extension:get_projectile_start_position_rotation()
	local look_direction = Quaternion.forward(look_rotation)
	local ai_system = Managers.state.entity:system("ai_system")
	local ai_broadphase = ai_system.broadphase
	local targets = {}
	local nearby_ai_units = {}
	local nearby_ai_positions = {}
	local nearby_ai_distances = {}
	local num_nearby_ai_units = EngineOptimized.smart_targeting_query(ai_broadphase, own_position, look_direction, 0, 50, 0.1, 0.2, 0.8, num_targets, nearby_ai_units, nearby_ai_positions, nearby_ai_distances)
	local aimed_target_nearby = false

	if num_nearby_ai_units then
		for i = 1, num_nearby_ai_units do
			local unit = nearby_ai_units[i]

			if AiUtils.unit_alive(unit) then
				local breed = unit_get_data(unit, "breed")

				if breed and not breed.no_autoaim then
					targets[#targets + 1] = unit

					if unit == aimed_target then
						aimed_target_nearby = true
					end
				end
			end
		end
	else
		targets = self.targets
	end

	if aimed_target and not aimed_target_nearby then
		targets[1] = aimed_target
	end

	return targets
end

ActionTrueFlightBowAim.finish = function (self, reason, data)
	local current_action = self.current_action
	local owner_unit = self.owner_unit
	local unzoom_condition_function = current_action.unzoom_condition_function

	if self.spread_extension then
		self.spread_extension:reset_spread_template()
	end

	if not unzoom_condition_function or unzoom_condition_function(reason) then
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")

		status_extension:set_zooming(false)
	end

	local sound_event = current_action.unaim_sound_event

	if sound_event then
		local wwise_world = self.wwise_world

		WwiseWorld.trigger_event(wwise_world, sound_event)
	end

	local chain_action_data = {}

	if current_action.num_projectiles and current_action.num_projectiles > 1 then
		local owner_player = Managers.player:owner(owner_unit)
		local is_bot = owner_player and owner_player.bot_player
		chain_action_data.targets = self:_get_visible_targets(self.target, current_action.num_projectiles, is_bot)
	end

	chain_action_data.target = self.target

	self:_stop_charge_sound()
	self:_mark_target(nil)

	self.targets = nil
	self.target = nil
	local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")

	inventory_extension:set_loaded_projectile_override(nil)

	return chain_action_data
end

ActionTrueFlightBowAim._mark_target = function (self, unit)
	if self.is_bot then
		return
	end

	local old_marked_target = self._marked_target

	if old_marked_target.outline_extension then
		old_marked_target.outline_extension:remove_outline(old_marked_target.outline_id)

		old_marked_target.outline_extension = nil
		old_marked_target.outline_id = nil
	end

	if unit and ALIVE[unit] then
		local target_outline_extenson = ScriptUnit.has_extension(self.target, "outline_system")

		if target_outline_extenson then
			old_marked_target.outline_extension = target_outline_extenson
			old_marked_target.outline_id = target_outline_extenson:add_outline(OutlineSettings.templates.target_enemy)
		end
	end
end
