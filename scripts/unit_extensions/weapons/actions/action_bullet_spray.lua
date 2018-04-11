ActionBulletSpray = class(ActionBulletSpray)
local POSITION_TWEAK = -1
local SPRAY_RANGE = math.abs(POSITION_TWEAK) + 5
local SPRAY_RADIUS = 3.5
local PLAYER_SPRAY_RADIUS = 2
local MAX_TARGETS = 10
local NODES = {
	"j_leftshoulder",
	"j_rightshoulder",
	"j_spine1"
}
ActionBulletSpray.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	self.owner_unit = owner_unit
	self.owner_unit_first_person = first_person_unit
	self.weapon_unit = weapon_unit
	self.item_name = item_name
	self.is_server = is_server
	self.world = world

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end

	self.targets = {}
	self.overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
	self._is_critical_strike = false

	return 
end
ActionBulletSpray.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	local weapon_unit = self.weapon_unit
	local owner_unit = self.owner_unit
	local first_person_unit = self.owner_unit_first_person
	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, new_action, t)
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self.power_level = power_level
	self.current_action = new_action
	self._target_index = 1
	self.shot = false

	if new_action.use_ammo_at_time then
		self.use_ammo_time = t + new_action.use_ammo_at_time
		self.used_ammo = false
	end

	local cone_hypotenuse = math.sqrt(SPRAY_RANGE * SPRAY_RANGE + SPRAY_RADIUS * SPRAY_RADIUS)
	self.CONE_COS_ALPHA = SPRAY_RANGE / cone_hypotenuse
	local overcharge_type = new_action.overcharge_type

	if overcharge_type then
		local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[overcharge_type]

		self.overcharge_extension:add_charge(overcharge_amount)
	end

	if is_critical_strike then
		Unit.flow_event(owner_unit, "vfx_critical_strike")
		Unit.flow_event(first_person_unit, "vfx_critical_strike")

		local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

		if hud_extension then
			hud_extension.show_critical_indication = true
		end
	end

	self._is_critical_strike = is_critical_strike

	return 
end
ActionBulletSpray.client_owner_post_update = function (self, dt, t, world, can_damage)
	local current_action = self.current_action
	local owner_unit_1p = self.owner_unit_first_person
	local player_position = POSITION_LOOKUP[owner_unit_1p]
	local player_rotation = Unit.world_rotation(owner_unit_1p, 0)
	local player_direction = Vector3.normalize(Quaternion.forward(player_rotation))
	local targets = self.targets
	local target_index = self._target_index

	if #targets == 0 and not self.shot then
		self._select_targets(self, world, true)

		if not Managers.player:owner(self.owner_unit).bot_player then
			Managers.state.controller_features:add_effect("rumble", {
				rumble_effect = "handgun_fire"
			})
		end

		local fire_sound_event = self.current_action.fire_sound_event

		if fire_sound_event then
			local play_on_husk = self.current_action.fire_sound_on_husk
			local first_person_extension = ScriptUnit.extension(self.owner_unit, "first_person_system")

			first_person_extension.play_hud_sound_event(first_person_extension, fire_sound_event, nil, play_on_husk)
		end
	end

	if self.use_ammo_time and not self.used_ammo and self.use_ammo_time <= t then
		self.used_ammo = true
		local ammo_extension = self.ammo_extension

		if ammo_extension then
			ammo_extension.use_ammo(ammo_extension, self.current_action.ammo_usage)
		end
	end

	local physics_world = World.get_data(world, "physics_world")
	local current_target = targets[target_index]

	if Unit.alive(current_target) then
		local breed = Unit.get_data(current_target, "breed")
		local node = "j_spine"

		if breed then
			local rand = math.random()
			local chance = 1 / #NODES
			local cumalative_value = 0

			for i = 1, #NODES, 1 do
				cumalative_value = cumalative_value + chance

				if rand <= cumalative_value then
					node = NODES[i]

					break
				end
			end
		end

		local target_position = Unit.world_position(current_target, Unit.node(current_target, node))
		local direction = Vector3.normalize(target_position - player_position)
		local result = self.raycast_to_target(self, world, player_position, direction, current_target)
		local target = nil

		if current_action.area_damage then
			target = current_target
		end

		if result then
			DamageUtils.process_projectile_hit(world, self.item_name, self.owner_unit, self.is_server, result, current_action, direction, true, target, nil, self._is_critical_strike, self.power_level)
		end

		local weapon_unit = self.weapon_unit
		local hit_position = (result and result[#result][1]) or player_position + direction * 100

		Unit.set_flow_variable(weapon_unit, "hit_position", hit_position)
		Unit.set_flow_variable(weapon_unit, "trail_life", Vector3.length(hit_position - player_position) * 0.1)
		Unit.flow_event(weapon_unit, "lua_bullet_trail")
		Unit.flow_event(weapon_unit, "lua_bullet_trail_set")
	end

	self._target_index = target_index + 1

	return 
end
ActionBulletSpray.finish = function (self, reason)
	self._clear_targets(self)

	local ammo_extension = self.ammo_extension

	if ammo_extension and self.current_action.reload_when_out_of_ammo and ammo_extension.ammo_count(ammo_extension) == 0 and ammo_extension.can_reload(ammo_extension) then
		local play_reload_animation = true

		ammo_extension.start_reload(ammo_extension, play_reload_animation)
	end

	local hud_extension = ScriptUnit.has_extension(self.owner_unit, "hud_system")

	if hud_extension then
		hud_extension.show_critical_indication = false
	end

	return 
end
ActionBulletSpray._clear_targets = function (self)
	table.clear(self.targets)

	return 
end
local actor_unit = Actor.unit
local vector3_distance = Vector3.distance
local unit_local_position = Unit.local_position
ActionBulletSpray._select_targets = function (self, world, show_outline)
	Profiler.start("bullet select targets")

	local physics_world = World.get_data(world, "physics_world")
	local owner_unit_1p = self.owner_unit_first_person
	local player_position = POSITION_LOOKUP[owner_unit_1p]
	local player_rotation = Unit.world_rotation(owner_unit_1p, 0)
	local player_direction = Vector3.normalize(Quaternion.forward(player_rotation))
	local ignore_hitting_allies = not Managers.state.difficulty:get_difficulty_settings().friendly_fire_ranged
	local current_action = self.current_action

	if current_action.fire_at_gaze_setting and ScriptUnit.has_extension(self.owner_unit, "eyetracking_system") then
		local eyetracking_extension = ScriptUnit.extension(self.owner_unit, "eyetracking_system")

		if eyetracking_extension.get_is_feature_enabled(eyetracking_extension, "tobii_fire_at_gaze") then
			player_direction = eyetracking_extension.gaze_forward(eyetracking_extension)
		end
	end

	local start_point = player_position + player_direction * POSITION_TWEAK + player_direction * SPRAY_RADIUS
	local end_point = player_position + player_direction * POSITION_TWEAK + player_direction * (SPRAY_RANGE - SPRAY_RADIUS)

	PhysicsWorld.prepare_actors_for_overlap(physics_world, start_point, SPRAY_RANGE * SPRAY_RANGE)

	local result = PhysicsWorld.linear_sphere_sweep(physics_world, start_point, end_point, SPRAY_RADIUS, 100, "collision_filter", "filter_character_trigger", "report_initial_overlap")

	Profiler.start("bullet spray sort")
	table.sort(result, function (a, b)
		local a_unit = actor_unit(a.actor)
		local b_unit = actor_unit(b.actor)
		local a_pos = unit_local_position(a_unit, 0)
		local b_pos = unit_local_position(b_unit, 0)
		local a_distance = vector3_distance(player_position, a_pos)
		local b_distance = vector3_distance(player_position, b_pos)

		return a_distance < b_distance
	end)
	Profiler.stop("bullet spray sort")

	if result then
		local num_hits = #result
		local targets = self.targets
		local v, q, m = Script.temp_count()
		local hit_units = {}
		local num_hit = 0

		for i = 1, num_hits, 1 do
			local hit = result[i]
			local hit_actor = hit.actor
			local hit_unit = Actor.unit(hit_actor)
			local hit_position = hit.position

			if not hit_units[hit_unit] then
				local breed = Unit.get_data(hit_unit, "breed")

				if table.contains(PLAYER_AND_BOT_UNITS, hit_unit) and not ignore_hitting_allies then
					if self._is_infront_player(self, player_position, player_direction, hit_position) and self._check_within_cone(self, player_position, player_direction, hit_unit, true) then
						targets[#targets + 1] = hit_unit
						hit_units[hit_unit] = true
					end
				elseif breed and self._is_infront_player(self, player_position, player_direction, hit_position) and self._check_within_cone(self, player_position, player_direction, hit_unit) then
					targets[#targets + 1] = hit_unit
					hit_units[hit_unit] = true

					if ScriptUnit.extension(hit_unit, "health_system"):is_alive() then
						num_hit = num_hit + 1
					end
				end

				if MAX_TARGETS <= num_hit then
					break
				end
			end
		end

		Script.set_temp_count(v, q, m)
	end

	self.shot = true

	Profiler.stop("bullet select targets")

	return 
end
ActionBulletSpray._check_within_cone = function (self, player_position, player_direction, target, player)
	local CONE_COS_ALPHA = self.CONE_COS_ALPHA

	if player then
		local cone_hypotenuse = math.sqrt(SPRAY_RANGE * SPRAY_RANGE + PLAYER_SPRAY_RADIUS * PLAYER_SPRAY_RADIUS)
		CONE_COS_ALPHA = SPRAY_RANGE / cone_hypotenuse
	end

	local target_position = Unit.world_position(target, Unit.node(target, "j_neck"))
	local target_direction = Vector3.normalize(target_position - player_position)
	local target_cos_alpha = Vector3.dot(player_direction, target_direction)

	if CONE_COS_ALPHA <= target_cos_alpha then
		return true
	end

	return false
end
ActionBulletSpray._is_infront_player = function (self, player_position, player_direction, hit_position)
	local player_to_hit_unit_dir = Vector3.normalize(hit_position - player_position)
	local dot = Vector3.dot(player_to_hit_unit_dir, player_direction)

	if 0 < dot then
		return true
	end

	return 
end
ActionBulletSpray.raycast_to_target = function (self, world, from_position, direction, target)
	local physics_world = World.get_data(world, "physics_world")
	local collision_filter = "filter_player_ray_projectile"
	local result = PhysicsWorld.immediate_raycast(physics_world, from_position, direction, "all", "collision_filter", collision_filter)

	return result
end

return 
