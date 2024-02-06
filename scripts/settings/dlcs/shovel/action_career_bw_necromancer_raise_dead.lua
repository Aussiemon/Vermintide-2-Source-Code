-- chunkname: @scripts/settings/dlcs/shovel/action_career_bw_necromancer_raise_dead.lua

local MIN_RADIUS = 4.5
local MAX_RADIUS = 9
local TIME_BETWEEN_SPAWNS = 0.75
local CHARGE_PER_SPAWN_PERCENT = 0.15
local CHARGE_LEEWAY = 0.1
local MIN_ANGLE, MAX_ANGLE = math.degrees_to_radians(-60), math.degrees_to_radians(60)

ActionCareerBWNecromancerRaiseDead = class(ActionCareerBWNecromancerRaiseDead, ActionBase)

ActionCareerBWNecromancerRaiseDead.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerBWNecromancerRaiseDead.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self._career_extension = ScriptUnit.extension(owner_unit, "career_system")
	self._passive_ability = self._career_extension:get_passive_ability_by_name("bw_necromancer")
	self._inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self._first_person_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")
	self._talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	self._buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self._weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")
	self._owner_unit = owner_unit
	self._is_server = is_server
	self._world = world
	self._ai_navigation_system = Managers.state.entity:system("ai_navigation_system")
	self._nav_world = Managers.state.entity:system("ai_system"):nav_world()
	self._traverse_logic = Managers.state.entity:system("ai_slot_system"):traverse_logic()
	self._seed = math.random_seed()
	self.fx_spline_ids = {
		World.find_particles_variable(world, "fx/wpnfx_staff_death/curse_spirit", "spline_1"),
		World.find_particles_variable(world, "fx/wpnfx_staff_death/curse_spirit", "spline_2"),
		World.find_particles_variable(world, "fx/wpnfx_staff_death/curse_spirit", "spline_3"),
	}

	self._nav_callback = function ()
		local t = Managers.time:time("game")

		self:_update_spawning(t)
	end
end

ActionCareerBWNecromancerRaiseDead.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	action_init_data = action_init_data or {}

	ActionCareerBWNecromancerRaiseDead.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)

	self._next_spawn_t = t

	if chain_action_data then
		self:_play_vo()
	end
end

ActionCareerBWNecromancerRaiseDead._trigger_spawn = function (self)
	local position = self:_generate_position()

	if position then
		World.create_particles(self._world, "fx/necromancer_summon_decal", position)

		local fx_name_id = NetworkLookup.effects["fx/wpnfx_staff_death/curse_spirit_first"]
		local start_pos = POSITION_LOOKUP[self._owner_unit] + Vector3.up() * 0.5
		local fp_rotation = self._first_person_extension:current_rotation()
		local right = Quaternion.right(fp_rotation)
		local to_pos = position - start_pos
		local side = math.sign(Vector3.dot(to_pos, right))
		local offset = math.pi * math.random(0.1, 0.25)
		local side_offset = Quaternion.axis_angle(Vector3.up(), offset * side)

		to_pos = Quaternion.rotate(side_offset, to_pos)

		local mid_point = start_pos + to_pos * 0.5 + Vector3.up()
		local spline_points = {
			start_pos,
			mid_point,
			position,
		}

		Managers.state.network:rpc_play_particle_effect_spline(nil, fx_name_id, self.fx_spline_ids, spline_points)
	end

	self._passive_ability:spawn_pet(self._controlled_unit_template, self._breed_to_spawn, position, NecromancerPositionModes.Absolute)
	self._career_extension:reduce_activated_ability_cooldown_percent(-CHARGE_PER_SPAWN_PERCENT)
end

ActionCareerBWNecromancerRaiseDead.client_owner_post_update = function (self, dt, t, world, can_damage, current_time_in_action)
	self._ai_navigation_system:add_safe_navigation_callback(self._nav_callback)
end

ActionCareerBWNecromancerRaiseDead._update_spawning = function (self, t)
	local current_cooldown = self._career_extension:current_ability_cooldown_percentage()

	if current_cooldown >= 1 - CHARGE_LEEWAY then
		self._weapon_extension:stop_action("action_complete")
	end

	if t > self._next_spawn_t then
		self._next_spawn_t = self._next_spawn_t + TIME_BETWEEN_SPAWNS

		self:_trigger_spawn()
	end
end

ActionCareerBWNecromancerRaiseDead._play_vo = function (self)
	local owner_unit = self.owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)
end

ActionCareerBWNecromancerRaiseDead._generate_position = function (self)
	local source_pos = self._position:unbox()
	local above, below = 1, 3
	local player_nav_pos = LocomotionUtils.pos_on_mesh(self._nav_world, source_pos, above, below)

	if not player_nav_pos then
		return nil
	end

	local x, y

	self._seed, x, y = math.get_uniformly_random_point_inside_sector_seeded(self._seed, MIN_RADIUS, MAX_RADIUS, MIN_ANGLE, MAX_ANGLE)

	local delta_pos = Vector3(x, y, 0)
	local fp_rotation = self._first_person_extension:current_rotation()

	delta_pos = Quaternion.rotate(fp_rotation, delta_pos)

	local wanted_position = player_nav_pos + delta_pos
	local _, position = GwNavQueries.raycast(self._nav_world, player_nav_pos, wanted_position, self._traverse_logic)

	return position
end
