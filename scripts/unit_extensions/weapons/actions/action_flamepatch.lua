ActionFlamepatch = class(ActionFlamepatch)
local POSITION_TWEAK = -1
local SPRAY_RANGE = math.abs(POSITION_TWEAK) + 5
local SPRAY_RADIUS = 2

ActionFlamepatch.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	self.owner_unit = owner_unit
	self.first_person_unit = first_person_unit
	self.weapon_unit = weapon_unit
	self.item_name = item_name
	self.is_server = is_server
	self.world = world
	self.nav_world = Managers.state.entity:system("ai_system"):nav_world()
	self.owner_player = Managers.player:owner(owner_unit)
	self.wwise_world = Managers.world:wwise_world(self.world)
	self.stop_sound_event = "Stop_player_combat_weapon_drakegun_flamethrower_shoot"
	self.flamepatch_timer = 2.5

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end

	self.overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
	self.is_server = is_server
	self.network_transmit = Managers.state.network.network_transmit
	self.unit_id = Managers.state.network.unit_storage:go_id(owner_unit)
	self._is_critical_strike = false
end

ActionFlamepatch.client_owner_start_action = function (self, new_action, t)
	self.current_action = new_action
	self.state = "waiting_to_shoot"
	self.time_to_shoot = t + new_action.fire_time
	self.overcharge_timer = 0
	self.damage_timer = 1
	self.flamepatch_timer = 2.5
	self.stop_sound_event = new_action.stop_fire_event or self.stop_sound_event
	self.muzzle_node_name = new_action.fx_node or "fx_muzzle"
	local current_action = self.current_action
	local weapon_unit = self.weapon_unit
	local world = self.world
	local go_id = self.unit_id
	local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[current_action.overcharge_type]

	self.overcharge_extension:add_charge(overcharge_amount)

	local flamethrower_range = new_action.range or SPRAY_RANGE * SPRAY_RANGE
	local flamethrower_effect = new_action.particle_effect_flames
	local flamethrower_effect_3p = new_action.particle_effect_flames_3p
	local flamethrower_impact_effect = new_action.particle_effect_impact
	local flamethrower_effect_id = NetworkLookup.effects[flamethrower_effect_3p]
	local flamethrower_impact_effect_id = NetworkLookup.effects[flamethrower_impact_effect]
	self.flamethrower_effect = World.create_particles(world, flamethrower_effect, Vector3.zero())
	self.flamethrower_impact_effect = World.create_particles(world, flamethrower_impact_effect, Vector3.zero())

	World.link_particles(world, self.flamethrower_effect, weapon_unit, Unit.node(weapon_unit, self.muzzle_node_name), Matrix4x4.identity(), "destroy")

	if self.is_server or LEVEL_EDITOR_TEST then
		self.network_transmit:send_rpc_clients("rpc_start_flamethrower", go_id, flamethrower_effect_id, flamethrower_impact_effect_id, flamethrower_range)
	else
		self.network_transmit:send_rpc_server("rpc_start_flamethrower", go_id, flamethrower_effect_id, flamethrower_impact_effect_id, flamethrower_range)
	end

	self.source_id = WwiseWorld.make_auto_source(self.wwise_world, self.weapon_unit)

	WwiseWorld.trigger_event(self.wwise_world, new_action.fire_sound_event, self.source_id)
end

local INDEX_POSITION = 1
local INDEX_DISTANCE = 2
local INDEX_NORMAL = 3
local INDEX_ACTOR = 4

ActionFlamepatch.client_owner_post_update = function (self, dt, t, world, can_damage)
	local owner_unit = self.owner_unit
	local first_person_unit = self.first_person_unit
	local current_action = self.current_action
	local is_server = self.is_server

	if self.state == "waiting_to_shoot" and self.time_to_shoot <= t then
		self.state = "shooting"
	end

	self.overcharge_timer = self.overcharge_timer + dt

	if current_action.overcharge_interval <= self.overcharge_timer then
		local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[current_action.overcharge_type]

		self.overcharge_extension:add_charge(overcharge_amount)

		self.overcharge_timer = 0
	end

	if self.state == "shooting" then
		if not Managers.player:owner(owner_unit).bot_player and not self._rumble_effect_id then
			self._rumble_effect_id = Managers.state.controller_features:add_effect("persistent_rumble", {
				rumble_effect = "reload_start"
			})
		end

		local do_flamepatch = current_action.liquid_area

		if do_flamepatch then
			if current_action.flamepatch_interval <= self.flamepatch_timer then
				self.flamepatch_timer = 0
			end

			if self.flamepatch_timer == 0 then
				local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
				local current_position = first_person_extension:current_position()
				local current_rotation = first_person_extension:current_rotation()
				local direction = Quaternion.forward(current_rotation)
				local end_point = current_position + direction * POSITION_TWEAK + direction * (SPRAY_RANGE - SPRAY_RADIUS)

				self:spawn_liquid_area(current_action.liquid_area.liquid_template, current_position, direction)
			end

			self.flamepatch_timer = self.flamepatch_timer + dt
		end

		local weapon_unit = self.weapon_unit
		local muzzle_position = Unit.world_position(weapon_unit, Unit.node(weapon_unit, self.muzzle_node_name))
		local muzzle_rotation = Unit.world_rotation(weapon_unit, Unit.node(weapon_unit, self.muzzle_node_name))
		local muzzle_direction = Quaternion.forward(muzzle_rotation)
		local flamethrower_range = current_action.range or SPRAY_RANGE * SPRAY_RANGE
		local world = self.world
		local physics_world = World.get_data(world, "physics_world")
		local result = PhysicsWorld.immediate_raycast_actors(physics_world, muzzle_position, muzzle_direction, flamethrower_range, "static_collision_filter", "filter_player_ray_projectile_static_only", "dynamic_collision_filter", "filter_player_ray_projectile_ai_only", "dynamic_collision_filter", "filter_player_ray_projectile_hitbox_only")
		local hit_unit, hit_position = nil

		if result then
			local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
			local owner_player = self.owner_player
			local friendly_fire = DamageUtils.allow_friendly_fire_ranged(difficulty_settings, owner_player)

			for index, hit in pairs(result) do
				local potential_hit_position = hit[INDEX_POSITION]
				local hit_actor = hit[INDEX_ACTOR]
				local potential_hit_unit = Actor.unit(hit_actor)
				potential_hit_unit, hit_actor = ActionUtils.redirect_shield_hit(potential_hit_unit, hit_actor)

				if potential_hit_unit ~= self.owner_unit then
					local breed = Unit.get_data(potential_hit_unit, "breed")
					local is_player = DamageUtils.is_player_unit(potential_hit_unit)
					local hit = false

					if breed then
						local node = Actor.node(hit_actor)
						local hit_zone = breed.hit_zones_lookup[node]
						local hit_zone_name = "torso"
						hit = hit_zone_name ~= "afro"
					elseif is_player then
						hit = friendly_fire and hit_actor ~= Unit.actor(potential_hit_unit, "c_afro")
					else
						hit = true
					end

					if hit then
						hit_position = potential_hit_position - muzzle_direction * 0.15
						hit_unit = potential_hit_unit

						break
					end
				end
			end
		end

		if hit_unit then
			World.move_particles(world, self.flamethrower_impact_effect, hit_position, muzzle_rotation)
		end
	end
end

ActionFlamepatch.finish = function (self, reason)
	local ammo_extension = self.ammo_extension

	if ammo_extension and self.current_action.reload_when_out_of_ammo and ammo_extension:ammo_count() == 0 and ammo_extension:can_reload() then
		local play_reload_animation = true

		ammo_extension:start_reload(play_reload_animation)
	end

	World.stop_spawning_particles(self.world, self.flamethrower_effect)
	World.stop_spawning_particles(self.world, self.flamethrower_impact_effect)

	self.flamethrower_effect = nil
	self.flamethrower_impact_effect = nil
	local go_id = self.unit_id

	if self.is_server or LEVEL_EDITOR_TEST then
		self.network_transmit:send_rpc_clients("rpc_end_flamethrower", go_id)
	else
		self.network_transmit:send_rpc_server("rpc_end_flamethrower", go_id)
	end

	WwiseWorld.trigger_event(self.wwise_world, self.stop_sound_event, self.source_id)

	local hud_extension = ScriptUnit.has_extension(self.owner_unit, "hud_system")

	if hud_extension then
		hud_extension.show_critical_indication = false
	end
end

ActionFlamepatch.destroy = function (self)
	if self.flamethrower_effect then
		World.destroy_particles(self.world, self.flamethrower_effect)

		self.flamethrower_effect = nil
	end

	if self.flamethrower_impact_effect then
		World.destroy_particles(self.world, self.flamethrower_impact_effect)

		self.flamethrower_impact_effect = nil
	end
end

ActionFlamepatch.spawn_liquid_area = function (self, liquid_template_name, projected_start_position, direction)
	local liquid_template_id = NetworkLookup.liquid_area_damage_templates[liquid_template_name]
	local network_manager = Managers.state.network
	local invalid_game_object_id = NetworkConstants.invalid_game_object_id

	network_manager.network_transmit:send_rpc_server("rpc_create_liquid_damage_area", invalid_game_object_id, projected_start_position, direction, liquid_template_id)
end

return
