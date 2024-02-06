-- chunkname: @scripts/settings/dlcs/shovel/action_career_bw_necromancer_raise_dead_targeting.lua

local DECAL_NAME = "fx/bw_necromancer_ability_indicator"
local RAYCAST_SPEED = 15
local RAYCAST_GRAVITY = -12

ActionCareerBWNecromancerRaiseDeadTargeting = class(ActionCareerBWNecromancerRaiseDeadTargeting, ActionBase)

ActionCareerBWNecromancerRaiseDeadTargeting.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerBWNecromancerRaiseDeadTargeting.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self._ai_navigation_system = Managers.state.entity:system("ai_navigation_system")
	self._first_person_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")
	self._inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self._weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")
	self._career_extension = ScriptUnit.extension(owner_unit, "career_system")
	self._buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self._world = world
	self._owner_unit = owner_unit
	self._last_valid_spawn_position = Vector3Box()
	self._fp_rotation = QuaternionBox()
	self._decal_diameter_id = World.find_particles_variable(self._world, DECAL_NAME, "diameter")
	self._unit_spawner = Managers.state.unit_spawner
	self._buff_unit_params = {
		is_husk = true,
	}

	self._nav_callback = function ()
		local t = Managers.time:time("game")

		self:_update_targeting(t)
	end
end

ActionCareerBWNecromancerRaiseDeadTargeting.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	action_init_data = action_init_data or {}

	ActionCareerBWNecromancerRaiseDeadTargeting.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)
	self._weapon_extension:set_mode(true)

	local breed_to_spawn = new_action.breed_to_spawn
	local talent_ext = ScriptUnit.has_extension(self._owner_unit, "talent_system")

	if talent_ext and talent_ext:has_talent("sienna_necromancer_6_3_2") then
		breed_to_spawn = new_action.faster_breed_to_spawn
	end

	self._spawn_data = {
		cooldown_leeway = new_action.cooldown_leeway,
		cooldown_per_spawn_percent = new_action.cooldown_per_spawn_percent,
		controlled_unit_template = new_action.controlled_unit_template,
		breed_to_spawn = breed_to_spawn,
		spawns_per_second = new_action.spawns_per_second,
		target_center = Vector3Box(),
	}

	local owner_unit = self._owner_unit

	self._first_person_extension:play_unit_sound_event("Play_career_necro_ability_raise_dead_target", owner_unit, 0, false)

	self._valid = false
	self._diameter = new_action.radius * 2

	self:_start_targeting()
	self._ai_navigation_system:add_safe_navigation_callback(self._nav_callback)
end

ActionCareerBWNecromancerRaiseDeadTargeting.client_owner_post_update = function (self, dt, t, world, can_damage, current_time_in_action)
	self._ai_navigation_system:add_safe_navigation_callback(self._nav_callback)
end

ActionCareerBWNecromancerRaiseDeadTargeting._start_targeting = function (self)
	local world = self._world

	self._spawn_decal_id = World.create_particles(world, DECAL_NAME, Vector3(0, 0, -600))

	World.set_particles_variable(world, self._spawn_decal_id, self._decal_diameter_id, Vector3(self._diameter, self._diameter, 1))

	local owner_pos = POSITION_LOOKUP[self._owner_unit]

	self._last_valid_spawn_position:store(owner_pos)
end

ActionCareerBWNecromancerRaiseDeadTargeting._update_targeting = function (self, t)
	local good_target, target_pos = self:_get_projectile_position(RAYCAST_SPEED)
	local world = self._world

	if good_target then
		self._valid = true

		self._spawn_data.target_center:store(target_pos)
		World.move_particles(world, self._spawn_decal_id, target_pos)
	end
end

ActionCareerBWNecromancerRaiseDeadTargeting._get_projectile_position = function (self)
	local world = self._world
	local physics_world = World.get_data(world, "physics_world")
	local collision_filter = "filter_adept_teleport"
	local player_position, raycast_direction = self:_get_first_person_position_direction()
	local velocity = raycast_direction * RAYCAST_SPEED
	local gravity = Vector3(0, 0, RAYCAST_GRAVITY)
	local good_target_position, target_position = WeaponHelper:ground_target(physics_world, self._owner_unit, player_position, velocity, gravity, collision_filter)

	if good_target_position then
		local nav_world = Managers.state.entity:system("ai_system"):nav_world()
		local above, below = 1, 1
		local nav_position = LocomotionUtils.pos_on_mesh(nav_world, target_position, above, below)

		if not nav_position then
			local horizontal_tolerance = 3
			local distance_from_obstacle = 0.5

			nav_position = GwNavQueries.inside_position_from_outside_position(nav_world, target_position, above, below, horizontal_tolerance, distance_from_obstacle)
		end

		good_target_position = not not nav_position
		target_position = nav_position
	end

	return good_target_position, target_position
end

ActionCareerBWNecromancerRaiseDeadTargeting._get_first_person_position_direction = function (self)
	local first_person_extension = self._first_person_extension
	local player_position = first_person_extension:current_position()
	local player_rotation = first_person_extension:current_rotation()
	local min_pitch = math.rad(45)
	local max_pitch = math.rad(12.5)
	local yaw = Quaternion.yaw(player_rotation)
	local pitch = math.clamp(Quaternion.pitch(player_rotation), -min_pitch, max_pitch)
	local yaw_rotation = Quaternion(Vector3.up(), yaw)
	local pitch_rotation = Quaternion(Vector3.right(), pitch)
	local raycast_rotation = Quaternion.multiply(yaw_rotation, pitch_rotation)
	local raycast_direction = Quaternion.forward(raycast_rotation)

	return player_position, raycast_direction
end

ActionCareerBWNecromancerRaiseDeadTargeting.finish = function (self, reason, data)
	local world = self._world
	local decal_id = self._spawn_decal_id

	World.destroy_particles(world, decal_id)

	if reason == "new_interupting_action" and self._valid and data.new_sub_action == "spawn_summon_area" then
		local target_center = self._spawn_data.target_center:unbox()
		local buff_unit = self._unit_spawner:spawn_network_unit("units/hub_elements/empty", "buff_unit", self._buff_unit_params, target_center, Quaternion.identity(), nil)
		local params = FrameTable.alloc_table()

		params.source_attacker_unit = self._owner_unit

		local buff_system = Managers.state.entity:system("buff_system")
		local buff_id = buff_system:add_buff_synced(buff_unit, "raise_dead_ability", BuffSyncType.All, params)
		local buff_extension = ScriptUnit.extension(buff_unit, "buff_system")
		local buff = buff_extension:get_buff_by_id(buff_id)

		buff.spawn_data = self._spawn_data

		local owner_unit = self._owner_unit
		local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()

		dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)

		local network_transmit = Managers.state.network.network_transmit
		local sound_to_play = "Play_career_necro_ability_raise_dead_spawn"
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_audio_position_event(sound_to_play, target_center)
		self._first_person_extension:play_unit_sound_event("Play_career_necro_ability_raise_dead_cast", owner_unit, 0, false)
		self._first_person_extension:play_remote_unit_sound_event("Play_career_necro_ability_raise_dead_cast_husk", owner_unit, 0)

		local is_server = self._is_server
		local explosion_template_name = "sienna_necromancer_ability_stagger"
		local talent_ext = ScriptUnit.has_extension(self._owner_unit, "talent_system")

		if talent_ext and talent_ext:has_talent("sienna_necromancer_6_2") then
			explosion_template_name = "sienna_necromancer_ability_stagger_improved"
		end

		local world = self._world
		local explosion_template = ExplosionTemplates[explosion_template_name]
		local scale = 1
		local damage_source = "career_ability"
		local is_husk = false
		local rotation = Quaternion.identity()
		local career_power_level = self._career_extension:get_career_power_level()

		DamageUtils.create_explosion(world, owner_unit, target_center, rotation, explosion_template, scale, damage_source, is_server, is_husk, owner_unit, career_power_level, false, owner_unit)

		local explosion_template_id = NetworkLookup.explosion_templates[explosion_template_name]
		local damage_source_id = NetworkLookup.damage_sources[damage_source]
		local owner_go_id = Managers.state.unit_storage:go_id(owner_unit)

		if is_server then
			network_transmit:send_rpc_clients("rpc_create_explosion", owner_go_id, false, target_center, rotation, explosion_template_id, scale, damage_source_id, career_power_level, false, owner_go_id)
		else
			network_transmit:send_rpc_server("rpc_create_explosion", owner_go_id, false, target_center, rotation, explosion_template_id, scale, damage_source_id, career_power_level, false, owner_go_id)
		end

		local effect_name = "fx/necromancer_wave_round"
		local effect_id = NetworkLookup.effects[effect_name]
		local node_id = 0
		local linked = false

		network_transmit:send_rpc_server("rpc_play_particle_effect_no_rotation", effect_id, NetworkConstants.invalid_game_object_id, node_id, target_center, linked)
		self._career_extension:start_activated_ability_cooldown()

		local passive_ability = self._career_extension:get_passive_ability_by_name("bw_necromancer")

		passive_ability:store_buff_unit(buff_unit)
	end

	return nil
end
