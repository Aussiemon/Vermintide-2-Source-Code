-- chunkname: @scripts/unit_extensions/weapons/actions/action_minigun.lua

ActionMinigun = class(ActionMinigun, ActionRangedBase)

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local BOT_THREAT_REFRESH_TIME = 1
local BOT_THREAT_DURATION = 1.2
local BOT_THREAT_AREA_W, BOT_THREAT_AREA_H, BOT_THREAT_AREA_D = 3, 2, 6
local MAX_SHOTS_PER_FRAME = 3
local FREE_ABILITY_AMMO_TIME = 10
local unit_set_flow_variable = Unit.set_flow_variable
local unit_flow_event = Unit.flow_event

ActionMinigun.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionMinigun.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.career_extension = ScriptUnit.extension(owner_unit, "career_system")
	self.buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self.weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")
	self.ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
	self._attack_speed_anim_var_3p = Unit.animation_find_variable(owner_unit, "attack_speed")
	self._time_to_shoot = 0
	self._last_avoidance_t = 0
	self._free_ammo_t = 0
	self._ranged_attack = true
	self._num_extra_shots = 0
end

ActionMinigun.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	local old_time_to_shoot = self._time_to_shoot

	ActionMinigun.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level)

	self._visual_heat_generation = new_action.visual_heat_generation or 0
	self._base_anim_speed = new_action.base_anim_speed or 1
	self._shot_cost = new_action.ammo_usage
	self._calculated_attack_speed = false
	self._initial_rounds_per_second = new_action.initial_rounds_per_second
	self._max_rps = new_action.max_rps
	self._rps_loss_per_second = new_action.rps_loss_per_second
	self._rps_gain_per_shot = new_action.rps_gain_per_shot
	self._projectiles_per_shot = new_action.shot_count
	self._use_ability_as_ammo = new_action.use_ability_as_ammo
	self._check_near_wall = new_action.dont_shoot_near_wall
	self._near_wall = false

	local windup = math.clamp(self.weapon_extension:get_custom_data("windup"), 0, 1)

	self._current_rps = math.lerp(self._initial_rounds_per_second, self._max_rps, windup)
	self._attack_speed_mod = 1
	self._ammo_expended = 0
	self.extra_buff_shot = false

	self:_update_attack_speed(t)

	self._time_to_shoot = math.max(old_time_to_shoot, t - 1 / self._current_rps)
	self._first_shot = true

	local fire_loop_start = new_action.fire_loop_start

	if fire_loop_start then
		self.first_person_extension:play_hud_sound_event(fire_loop_start)
	end

	self:_play_vo()
end

ActionMinigun._update_attack_speed = function (self, t)
	if not self._calculated_attack_speed then
		self._attack_speed_mod = ActionUtils.get_action_time_scale(self.owner_unit, self.current_action)

		self:_update_animation_speed(self._current_rps * self._attack_speed_mod)

		self._calculated_attack_speed = true
	end
end

ActionMinigun._waiting_to_shoot = function (self, dt, t)
	self:_update_animation_speed(self._current_rps)

	if self._check_near_wall then
		self:_update_near_wall()
	end

	if not self._near_wall and t >= self._time_to_shoot then
		self:_shoot(dt, t)
	end
end

ActionMinigun.get_projectile_start_position_rotation = function (self)
	local fire_node = Unit.node(self.weapon_unit, "a_barrel")
	local barrel_rot = Unit.world_rotation(self.weapon_unit, fire_node)
	local barrel_dir = Quaternion.forward(barrel_rot)
	local barrel_right = Quaternion.right(barrel_rot)
	local from_position = Unit.world_position(self.weapon_unit, fire_node) + barrel_dir * 0.4 + barrel_right * 0.1
	local camera_pos, camera_rot = self.first_person_extension:camera_position_rotation()
	local physics_world = World.physics_world(self.world)
	local aim_dir = Quaternion.forward(camera_rot)
	local side = Managers.state.side.side_by_unit[self.owner_unit]
	local aim_at_pos = WeaponHelper:look_at_enemy_or_static_position(physics_world, camera_pos, aim_dir, side, 0.15, 100)
	local shoot_direction, distance = Vector3.direction_length(aim_at_pos - from_position)

	if distance < 2 then
		from_position = camera_pos
		shoot_direction = Vector3.normalize(aim_at_pos - from_position)
	end

	local rotation = Quaternion.look(shoot_direction)

	return from_position, rotation
end

ActionMinigun._shoot = function (self, dt, t)
	self:_update_attack_speed(t)
	self:_update_bot_avoidance(t)

	local max_shots

	if self._use_ability_as_ammo then
		local current_cooldown, max_cooldown = self.career_extension:current_ability_cooldown(1)
		local ability_charge = max_cooldown - current_cooldown

		max_shots = ability_charge / self._shot_cost
	else
		max_shots = self.ammo_extension:ammo_count()
	end

	local fire_rounds_per_second = self._current_rps * self._attack_speed_mod
	local rounds_to_fire = math.min(fire_rounds_per_second * (t - self._time_to_shoot), max_shots)
	local num_projectiles = math.floor(rounds_to_fire)

	if num_projectiles > 0 then
		local override_extra_shots = true
		local projectiles_per_shot = self._projectiles_per_shot
		local total_shots = projectiles_per_shot
		local buff_shots = self:_update_extra_shots(self.buff_extension, 0, override_extra_shots) or 0

		if buff_shots > 0 then
			self.extra_buff_shot = true
			self._num_extra_shots = buff_shots
			total_shots = total_shots + buff_shots
		end

		self._current_rps = math.clamp(self._current_rps + self._rps_gain_per_shot * num_projectiles, self._initial_rounds_per_second, self._max_rps)
		self._time_last_fired = t
		self._time_to_shoot = t - (rounds_to_fire - num_projectiles) / fire_rounds_per_second
		self._num_projectiles_per_shot = num_projectiles * total_shots
		self._state = "start_shooting"
		self._calculated_attack_speed = false
	end

	self._first_shot = false
end

ActionMinigun._shooting = function (self, t, action_ended)
	local num_projectiles_per_shot = self._num_projectiles_per_shot
	local num_projectiles_spawned = self._num_projectiles_spawned
	local num_shots_this_frame = num_projectiles_per_shot - num_projectiles_spawned

	if not action_ended then
		num_shots_this_frame = math.min(num_shots_this_frame, MAX_SHOTS_PER_FRAME)
	end

	self._num_projectiles_spawned = self:shoot(num_shots_this_frame, num_projectiles_spawned, num_projectiles_per_shot)

	if num_projectiles_per_shot - self._num_projectiles_spawned <= 0 then
		self:_staggered_shot_done(t)
	end
end

ActionMinigun._staggered_shot_done = function (self, t)
	local current_action = self.current_action
	local first_person_extension = self.first_person_extension

	if current_action.apply_recoil then
		first_person_extension:apply_recoil()
	end

	local recoil_settings = current_action.recoil_settings

	if recoil_settings then
		first_person_extension:play_camera_recoil(current_action.recoil_settings, t)
	end

	unit_flow_event(self.weapon_unit, "lua_finish_shooting")

	if self:_has_ammo() then
		self._state = "waiting_to_shoot"
	else
		self._state = "finished_shooting"
	end
end

ActionMinigun._finished_shooting = function (self, t)
	self.weapon_extension:stop_action("action_complete")
end

ActionMinigun.finish = function (self, reason)
	if self._near_wall then
		self.first_person_extension:animation_set_variable("disable_shooting", 0)
		CharacterStateHelper.play_animation_event_first_person(self.first_person_extension, "near_wall_updated")
	end

	ActionMinigun.super.finish(self, reason)

	local initial_rps = self._initial_rounds_per_second
	local rps_range = self._max_rps - initial_rps
	local windup = math.clamp((self._current_rps - initial_rps) / rps_range, 0, 1)

	self.weapon_extension:set_custom_data("windup", windup)
end

ActionMinigun.proc_extra_shot = function (self, t)
	return false
end

ActionMinigun.gen_num_shots = function (self)
	return 1, 1
end

ActionMinigun.apply_shot_cost = function (self, t)
	if not self._use_ability_as_ammo then
		return ActionMinigun.super.apply_shot_cost(self, t)
	end

	self:_fake_activate_ability(t)

	local should_consume_ammo = self:_should_consume_ammo(t)
	local buff_extension = self.buff_extension

	if buff_extension and buff_extension:has_buff_perk(buff_perks.free_ability_engineer) then
		should_consume_ammo = false
	end

	if should_consume_ammo then
		local projectiles_per_shot = self._num_projectiles_per_shot

		if self.extra_buff_shot then
			projectiles_per_shot = math.max(projectiles_per_shot - self._num_extra_shots, 1)
		end

		self.career_extension:reduce_activated_ability_cooldown(-self._shot_cost * projectiles_per_shot)

		self.extra_buff_shot = false
		self._num_extra_shots = 0
	end
end

ActionMinigun._should_consume_ammo = function (self, t)
	return t > self._free_ammo_t
end

ActionMinigun._has_ammo = function (self)
	if self._use_ability_as_ammo then
		local ability_cooldown, max_cooldown = self.career_extension:current_ability_cooldown(1)

		return max_cooldown - ability_cooldown >= self._shot_cost
	else
		return self.ammo_extension:ammo_count() > 0
	end
end

ActionMinigun._play_vo = function (self)
	local owner_unit = self.owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)
end

ActionMinigun._play_vfx = function (self)
	return
end

ActionMinigun._update_animation_speed = function (self, shots_per_second)
	local anim_time_scale = self._base_anim_speed * shots_per_second

	anim_time_scale = math.clamp(anim_time_scale, NetworkConstants.animation_variable_float.min, NetworkConstants.animation_variable_float.max)

	self.first_person_extension:animation_set_variable("attack_speed", anim_time_scale)

	if self._attack_speed_anim_var_3p then
		Managers.state.network:anim_set_variable_float(self.owner_unit, "attack_speed", anim_time_scale)
	end
end

ActionMinigun._update_bot_avoidance = function (self, t)
	if not self.is_bot and t > self._last_avoidance_t + BOT_THREAT_REFRESH_TIME then
		self._last_avoidance_t = t

		local current_position, current_rotation = self:get_projectile_start_position_rotation()
		local threat_position, threat_rotation, threat_size = AiUtils.calculate_oobb(BOT_THREAT_AREA_D, current_position, current_rotation, BOT_THREAT_AREA_H, BOT_THREAT_AREA_W)

		if self.is_server then
			self.ai_bot_group_system:queue_aoe_threat(threat_position, "oobb", threat_size, threat_rotation, BOT_THREAT_DURATION)
		else
			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit

			network_transmit:send_rpc_server("rpc_bot_create_threat_oobb", threat_position, threat_rotation, threat_size, BOT_THREAT_DURATION)
		end
	end
end

ActionMinigun._fake_activate_ability = function (self, t)
	local buff_extension = self.buff_extension

	if buff_extension then
		self._ammo_expended = self._ammo_expended + self._shot_cost * self._num_projectiles_per_shot

		if buff_extension:has_buff_perk(buff_perks.free_ability) then
			buff_extension:trigger_procs("on_ability_activated", self.owner_unit, 1)
			buff_extension:trigger_procs("on_ability_cooldown_started")

			self._free_ammo_t = t + FREE_ABILITY_AMMO_TIME
		elseif self._ammo_expended > self.career_extension:get_max_ability_cooldown() / 2 then
			buff_extension:trigger_procs("on_ability_activated", self.owner_unit, 1)
			buff_extension:trigger_procs("on_ability_cooldown_started")

			self._ammo_expended = 0
		end
	end
end

ActionMinigun._update_near_wall = function (self)
	local first_person_extension = self.first_person_extension
	local camera_position = first_person_extension:current_position()
	local camera_rotation = first_person_extension:current_rotation()
	local raycast_filter = "filter_in_line_of_sight_no_players_no_enemies"
	local near_wall_length = 1.35
	local direction = Quaternion.forward(camera_rotation)
	local physics_world = World.physics_world(self.world)
	local _, _, distance = PhysicsWorld.raycast(physics_world, camera_position, direction, near_wall_length, "all", "types", "both", "closest", "collision_filter", raycast_filter)
	local near_wall = distance and distance <= near_wall_length

	if near_wall ~= self._near_wall then
		self._near_wall = near_wall

		first_person_extension:animation_set_variable("disable_shooting", near_wall and 1 or 0)
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, "near_wall_updated")
	end
end
