GenericStatusExtension = class(GenericStatusExtension)
local DamageDataIndex = DamageDataIndex
local MAX_INTOXICATION_LEVEL = 3
local MIN_INTOXICATION_LEVEL = -3
local NUM_PACK_MASTER_GRABS = 2
local NUM_GLOBADIER_POISONS = 2
local NUM_TIMES_KNOCKED_DOWN = 2
local block_breaking_fatigue_types = {
	blocked_slam = true,
	blocked_attack_2 = true,
	blocked_berzerker = true,
	chaos_cleave = true,
	blocked_sv_sweep_2 = true,
	blocked_sv_cleave = true,
	complete = true,
	blocked_running = true,
	blocked_charge = true,
	sv_shove = true,
	sv_push = true,
	blocked_sv_sweep = true,
	shield_blocked_slam = true,
	chaos_spawn_combo = true,
	blocked_headbutt = true,
	blocked_attack = true,
	blocked_ranged = true,
	blocked_attack_3 = true
}

GenericStatusExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.world = extension_init_context.world
	self.profile_id = extension_init_data.profile_id

	fassert(self.profile_id)

	self.unit = unit
	self.pacing_intensity = 0
	self.pacing_intensity_decay_delay = 0
	self.move_speed_multiplier = 1
	self.move_speed_multiplier_timer = 1
	self.invisible = {}
	self.crouching = false
	self.blocking = false
	self.override_blocking = nil
	self.charge_blocking = false
	self.catapulted = false
	self.catapulted_direction = nil
	self.pounced_down = false
	self.on_ladder = false
	self.is_ledge_hanging = false
	self.left_ladder_timer = 0
	self.aim_unit = nil
	self.revived = false
	self.dead = false
	self.pulled_up = false
	self.overpowered = false
	self.overpowered_template = nil
	self.overpowered_attacking_unit = nil
	self._has_blocked = false
	self.my_dodge_cd = 0
	self.my_dodge_jump_override_t = 0
	self.dodge_cooldown = 0
	self.dodge_cooldown_delay = 0
	self.is_aiming = false
	self.dodge_count = 2
	self.combo_target_count = 0
	self.fatigue = 0
	self.last_fatigue_gain_time = 0
	self.show_fatigue_gui = false
	self.max_fatigue_points = 100
	self.next_hanging_damage_time = 0
	self.block_broken = false
	self.block_broken_at_t = -math.huge
	self.stagger_immune = false
	self.pushed = false
	self.pushed_at_t = -math.huge
	self.push_cooldown = false
	self.push_cooldown_timer = false
	self.timed_block = nil
	self.shield_block = nil
	self.charged = false
	self.charged_at_t = -math.huge
	self.interrupt_cooldown = false
	self.interrupt_cooldown_timer = nil
	self.inside_transport_unit = nil
	self.using_transport = false
	self.dodge_position = Vector3Box(0, 0, 0)
	self.overcharge_exploding = false
	self.fall_height = nil
	self.under_ratling_gunner_attack = nil
	self.last_catapulted_time = 0
	self.grabbed_by_tentacle = false
	self.grabbed_by_tentacle_status = nil
	self.grabbed_by_chaos_spawn = false
	self.grabbed_by_chaos_spawn_status = nil
	self.in_vortex = false
	self.in_vortex_unit = nil
	self.near_vortex = false
	self.near_vortex_unit = nil
	self.in_liquid = false
	self.in_liquid_unit = nil
	self.in_hanging_cage_unit = nil
	self.in_hanging_cage_state = nil
	self.in_hanging_cage_animations = nil
	self.wounds = extension_init_data.wounds

	if self.wounds == -1 then
		self.wounds = math.huge
	end

	self._base_max_wounds = self.wounds
	self._num_times_grabbed_by_pack_master = 0
	self._num_times_hit_by_globadier_poison = 0
	self._num_times_knocked_down = 0
	self.is_server = Managers.player.is_server
	self.update_funcs = {}

	self:set_spawn_grace_time(5)

	self.ready_for_assisted_respawn = false
	self.assisted_respawning = false
	self.player = extension_init_data.player
	self.is_bot = self.player.bot_player
	self.in_end_zone = false
	self.is_husk = self.player.remote

	if self.is_server then
		self.conflict_director = Managers.state.conflict
	end

	self._intoxication_level = 0
	self.noclip = {}
	self._incapacitated_outline_ids = {}
	self._assisted_respawn_outline_id = -1
	self._invisible_outline_id = -1
end

GenericStatusExtension.extensions_ready = function (self)
	local unit = self.unit
	self.health_extension = ScriptUnit.extension(unit, "health_system")
	self.buff_extension = ScriptUnit.extension(unit, "buff_system")
	self.inventory_extension = ScriptUnit.extension(unit, "inventory_system")
	self.career_extension = ScriptUnit.extension(unit, "career_system")
	self.locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	if ScriptUnit.has_extension(unit, "first_person_system") and not self.locomotion_extension.is_bot then
		self.first_person_extension = ScriptUnit.extension(unit, "first_person_system")
		self.low_health_playing_id, self.low_health_source_id = self.first_person_extension:play_hud_sound_event("hud_low_health")
	end
end

GenericStatusExtension.destroy = function (self)
	local first_person_extension = self.first_person_extension

	if first_person_extension then
		first_person_extension:play_hud_sound_event("stop_hud_low_health")
	end
end

GenericStatusExtension.add_damage_intensity = function (self, percent_health_lost, damage_type)
	self.pacing_intensity = math.clamp(self.pacing_intensity + percent_health_lost * CurrentIntensitySettings.intensity_add_per_percent_dmg_taken * 100, 0, 100)
	self.pacing_intensity_decay_delay = CurrentIntensitySettings.decay_delay
end

GenericStatusExtension.add_pacing_intensity = function (self, value)
	self.pacing_intensity = math.clamp(self.pacing_intensity + value, 0, 100)
	self.pacing_intensity_decay_delay = CurrentIntensitySettings.decay_delay
end

GenericStatusExtension.add_combo_target_count = function (self, value)
	self.combo_target_count = math.clamp(self.combo_target_count + value, 0, 5)
end

GenericStatusExtension.add_pacing_intensity_by_difficulty = function (self, intensity_table)
	local difficulty = Managers.state.difficulty:get_difficulty()
	local value = intensity_table[difficulty]

	if not value then
		return
	end

	self.pacing_intensity = math.clamp(self.pacing_intensity + value, 0, 100)
	self.pacing_intensity_decay_delay = CurrentIntensitySettings.decay_delay
end

GenericStatusExtension.add_intoxication_level = function (self, num_levels)
	self._intoxication_level = math.clamp(self._intoxication_level + num_levels, MIN_INTOXICATION_LEVEL, MAX_INTOXICATION_LEVEL)
end

GenericStatusExtension.invert_intoxication_level = function (self)
	self._intoxication_level = self._intoxication_level * -1
end

GenericStatusExtension.intoxication_level = function (self)
	return self._intoxication_level
end

local intensity_ignored_damage_types = {
	temporary_health_degen = true,
	overcharge = true,
	wounded_dot = true,
	knockdown_bleed = true,
	heal = true,
	health_degen = true
}

GenericStatusExtension.update = function (self, unit, input, dt, context, t)
	local health_extension = self.health_extension
	local damages, num_damages = health_extension:recent_damages()

	if self.is_server then
		local stride = DamageDataIndex.STRIDE

		for i = 1, num_damages / stride do
			local index = (i - 1) * stride
			local damage_type = damages[index + DamageDataIndex.DAMAGE_TYPE]

			if not intensity_ignored_damage_types[damage_type] then
				local amount = damages[index + DamageDataIndex.DAMAGE_AMOUNT]
				local max_health = health_extension:get_max_health()

				self:add_damage_intensity(amount / max_health, damage_type)
			end
		end

		local ignore_pacing_decay_delay = self.conflict_director.pacing:ignore_pacing_intensity_decay_delay()

		if (self.pacing_intensity_decay_delay <= 0 or ignore_pacing_decay_delay) and not self.conflict_director:intensity_decay_frozen() then
			self.pacing_intensity = math.clamp(self.pacing_intensity - CurrentIntensitySettings.decay_per_second * dt, 0, CurrentIntensitySettings.max_intensity)
		end

		self.pacing_intensity_decay_delay = self.pacing_intensity_decay_delay - dt
	end

	if self.move_speed_multiplier_timer < 1 then
		local move_speed_timer_added_bonus = dt
		move_speed_timer_added_bonus = move_speed_timer_added_bonus * PlayerUnitStatusSettings.move_speed_reduction_on_hit_recover_time
		self.move_speed_multiplier_timer = self.move_speed_multiplier_timer + move_speed_timer_added_bonus
	end

	local disable_regen_boost_on_low_fatigue = true

	if num_damages > 0 then
		local slow_movement = false

		for i = 1, num_damages / DamageDataIndex.STRIDE do
			local damage_type = damages[(i - 1) * DamageDataIndex.STRIDE + DamageDataIndex.DAMAGE_TYPE]

			if PlayerUnitMovementSettings.slowing_damage_types[damage_type] then
				slow_movement = true
				local buff_extension = self.buff_extension

				if buff_extension:has_buff_perk("no_moveslow_on_hit") then
					slow_movement = false
				end

				break
			end

			if not intensity_ignored_damage_types[damage_type] then
				disable_regen_boost_on_low_fatigue = false
			end
		end

		if slow_movement then
			self.move_speed_multiplier = self:current_move_speed_multiplier() * 0.5
			self.move_speed_multiplier = math.max(0.2, self.move_speed_multiplier)
			self.move_speed_multiplier_timer = 0
		end
	end

	local player = self.player

	if not player.remote then
		local previous_max_fatigue_points = self.max_fatigue_points
		local max_fatigue_points = self:_get_current_max_fatigue_points() or previous_max_fatigue_points
		local degen_delay = self.block_broken_degen_delay or self.push_degen_delay or PlayerUnitStatusSettings.FATIGUE_DEGEN_DELAY
		degen_delay = degen_delay / self.buff_extension:apply_buffs_to_value(1, "fatigue_regen")

		if previous_max_fatigue_points ~= max_fatigue_points then
			self.fatigue = max_fatigue_points == 0 and 0 or previous_max_fatigue_points / max_fatigue_points * self.fatigue
		end

		if not disable_regen_boost_on_low_fatigue and num_damages > 0 and self.fatigue >= 50 then
			if self.action_stun_push then
				self.action_stun_push = false
			else
				self:remove_fatigue_points(100 / max_fatigue_points)
			end
		end

		if t >= self.last_fatigue_gain_time + degen_delay then
			self.action_stun_push = false
			self.show_fatigue_gui = false
			local degen_amount = max_fatigue_points == 0 and 0 or PlayerUnitStatusSettings.FATIGUE_POINTS_DEGEN_AMOUNT / max_fatigue_points * PlayerUnitStatusSettings.MAX_FATIGUE
			local new_degen_amount = self.buff_extension:apply_buffs_to_value(degen_amount, "fatigue_regen")

			if degen_amount < new_degen_amount then
				self.has_bonus_fatigue_active = true
			elseif not self.bonus_fatigue_active_timer then
				self.has_bonus_fatigue_active = false
			end

			self:remove_fatigue_points(new_degen_amount * dt)

			self.block_broken_degen_delay = nil
			self.push_degen_delay = nil
		end

		if self.dodge_cooldown > 0 and self.dodge_cooldown_delay and self.dodge_cooldown_delay < t then
			self.dodge_cooldown = 0
		end

		self.max_fatigue_points = max_fatigue_points
		local bonus_fatigue_active_timer = self.bonus_fatigue_active_timer

		if bonus_fatigue_active_timer and bonus_fatigue_active_timer <= t then
			self.has_bonus_fatigue_active = false
			self.bonus_fatigue_active_timer = nil
		end

		if self.push_cooldown then
			if not self.push_cooldown_timer then
				self.push_cooldown_timer = t + 1.5
			elseif self.push_cooldown_timer < t then
				self.push_cooldown_timer = false
				self.pushed = false
				self.push_cooldown = false
			end
		end

		if self.interrupt_cooldown then
			if not self.interrupt_cooldown_timer then
				self.interrupt_cooldown_timer = t + 0.5
			elseif self.interrupt_cooldown_timer < t then
				self.interrupt_cooldown = false
				self.interrupt_cooldown_timer = nil
			end
		end

		local first_person_extension = self.first_person_extension

		if first_person_extension and self.low_health_playing_id then
			local current_player_health_percentage = self.health_extension:current_health_percent()
			local health = current_player_health_percentage * 100
			local wwise_world = Managers.world:wwise_world(self.world)

			WwiseWorld.set_source_parameter(wwise_world, self.low_health_source_id, "health_status", health)
		end

		if self.shielded and not health_extension:has_assist_shield() and health_extension:previous_shield_end_reason() then
			self:set_shielded(false)
		end
	end

	if self.pack_master_status then
		if self.pack_master_status == "pack_master_hanging" then
			if self.is_server then
				if self.next_hanging_damage_time < t then
					local h = PlayerUnitStatusSettings.hanging_by_pack_master

					DamageUtils.add_damage_network(unit, unit, h.damage_amount, h.hit_zone_name, h.damage_type, nil, Vector3.up(), "skaven_pack_master")

					self.next_hanging_damage_time = t + 1
				end

				if self.dead then
					StatusUtils.set_grabbed_by_pack_master_network("pack_master_dropping", unit, true, nil)
				end
			end
		elseif self.pack_master_status == "pack_master_dropping" then
			if self.release_falling_time and self.release_falling_time < t then
				local locomotion = ScriptUnit.extension(unit, "locomotion_system")

				locomotion:set_disabled(false, nil, nil, true)

				if self.is_server then
					StatusUtils.set_grabbed_by_pack_master_network("pack_master_released", unit, false, nil)
				end

				self.release_falling_time = nil
			end
		elseif self.pack_master_status == "pack_master_unhooked" then
			if self.release_unhook_time and self.release_unhook_time < t then
				local locomotion = ScriptUnit.extension(unit, "locomotion_system")

				locomotion:set_disabled(false, nil, nil, true)

				if self.is_server then
					StatusUtils.set_grabbed_by_pack_master_network("pack_master_released", unit, false, nil)
				end

				self.release_unhook_time = nil
			end
		elseif self.pack_master_status == "pack_master_released" then
			self.pack_master_status = nil
		elseif self.pack_master_status == "pack_master_dragging" then
			if self.is_server and (not self.pack_master_grabber or not Unit.alive(self.pack_master_grabber)) then
				StatusUtils.set_grabbed_by_pack_master_network("pack_master_unhooked", unit, false, nil)
			end
		elseif self.pack_master_status == "pack_master_hoisting" and self.is_server and (not self.pack_master_grabber or not Unit.alive(self.pack_master_grabber)) then
			StatusUtils.set_grabbed_by_pack_master_network("pack_master_unhooked", unit, false, nil)
		end
	end

	for _, func in pairs(self.update_funcs) do
		func(self, t)
	end

	if self.player.local_player then
		local in_end_zone = self:is_in_end_zone()

		if self._current_end_zone_state ~= in_end_zone then
			Wwise.set_state("inside_waystone", in_end_zone and "true" or "false")

			self._current_end_zone_state = in_end_zone
		end
	end
end

GenericStatusExtension.set_spawn_grace_time = function (self, duration)
	local t = Managers.time:time("game")
	self.spawn_grace_time = t + duration
	self.spawn_grace = true
	self.update_funcs.spawn_grace_time = GenericStatusExtension.update_spawn_grace_time
end

GenericStatusExtension.update_spawn_grace_time = function (self, t)
	if self.spawn_grace_time < t then
		self.spawn_grace = false
		self.update_funcs.spawn_grace_time = nil
	end
end

GenericStatusExtension.fall_distance = function (self)
	if self.fall_height then
		local current_fall_height = POSITION_LOOKUP[self.unit].z
		local fall_distance = self.fall_height - current_fall_height

		return fall_distance
	end

	return 0
end

GenericStatusExtension.set_ignore_next_fall_damage = function (self, ignore)
	self.ignore_next_fall_damage = ignore
end

GenericStatusExtension.update_falling = function (self, t)
	if self.locomotion_extension:is_on_ground() and not self.on_ladder then
		local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(self.unit)
		local min_fall_damage_height = movement_settings_table.fall.heights.MIN_FALL_DAMAGE_HEIGHT
		local hard_landing_fall_height = movement_settings_table.fall.heights.HARD_LANDING_FALL_HEIGHT
		local gravity_scale = self.locomotion_extension:get_script_driven_gravity_scale()
		local fall_distance = math.abs(self:fall_distance() * gravity_scale)
		local fall_event = "landed"

		if min_fall_damage_height < fall_distance then
			fall_distance = math.abs(fall_distance)

			if not global_is_inside_inn and not self.inside_transport_unit and not self.ignore_next_fall_damage and not self.is_bot then
				local network_height = math.clamp(fall_distance * 4, 0, 255)
				local network_manager = Managers.state.network
				local unit_storage = Managers.state.unit_storage
				local go_id = unit_storage:go_id(self.unit)

				network_manager.network_transmit:send_rpc_server("rpc_take_falling_damage", go_id, network_height)
			end

			fall_event = "landed_soft"

			if hard_landing_fall_height <= fall_distance then
				fall_event = "landed_hard"
			end
		end

		if self.first_person_extension then
			self.first_person_extension:play_camera_effect_sequence(fall_event, t)
		end

		self.ignore_next_fall_damage = false
		self.update_funcs.falling = nil
		self.fall_height = nil
	end
end

GenericStatusExtension._get_current_max_fatigue_points = function (self)
	local inventory_extension = self.inventory_extension
	local slot_name = inventory_extension:get_wielded_slot_name()
	local slot_data = inventory_extension:get_slot_data(slot_name)

	if slot_data then
		local item_data = slot_data.item_data
		local item_template = slot_data.item_template or BackendUtils.get_item_template(item_data)
		local max_fatigue_points = item_template.max_fatigue_points
		max_fatigue_points = max_fatigue_points and math.clamp(self.buff_extension:apply_buffs_to_value(max_fatigue_points, "max_fatigue"), 1, 100)

		return max_fatigue_points
	end
end

GenericStatusExtension.get_max_fatigue_points = function (self)
	return self:_get_current_max_fatigue_points()
end

GenericStatusExtension.can_block = function (self, attacking_unit, attack_direction)
	local unit = self.unit
	local player = self.player
	local inventory_extension = self.inventory_extension
	local equipment = inventory_extension:equipment()
	local network_manager = Managers.state.network
	local weapon_template_name = equipment.wielded.template or equipment.wielded.temporary_template
	local weapon_template = Weapons[weapon_template_name]

	if not weapon_template_name then
		return false
	end

	local game = network_manager:game()
	local unit_id = network_manager:unit_game_object_id(unit)

	if not game or not unit_id then
		return false
	end

	if player then
		local aim_direction = GameSession.game_object_field(game, unit_id, "aim_direction")
		local player_direction_flat = Vector3.flat(aim_direction)
		local player_position = POSITION_LOOKUP[unit]
		local attacker_position = POSITION_LOOKUP[attacking_unit] or Unit.world_position(attacking_unit, 0)
		local block_direction = Vector3.normalize(attacker_position - player_position)
		local block_direction_flat = Vector3.flat(block_direction)
		local buff_extension = self.buff_extension
		local block_angle = buff_extension:apply_buffs_to_value(weapon_template.block_angle or 90, "block_angle")
		local outer_block_angle = buff_extension:apply_buffs_to_value(weapon_template.outer_block_angle or 360, "block_angle")
		block_angle = math.clamp(block_angle, 0, 360)
		outer_block_angle = math.clamp(outer_block_angle, 0, 360)
		local block_half_angle = math.rad(block_angle * 0.5)
		local outer_block_half_angle = math.rad(outer_block_angle * 0.5)
		local dot = Vector3.dot(block_direction_flat, player_direction_flat)
		local angle_to_attacker = math.acos(dot)
		local block = angle_to_attacker <= block_half_angle
		local outer_block = block_half_angle < angle_to_attacker and angle_to_attacker <= outer_block_half_angle

		if not block and not outer_block then
			return false
		end

		if script_data.debug_draw_block_arcs then
			if block and not outer_block then
				self._debug_draw_color = Colors.get_table("lime")
			elseif not block and outer_block then
				self._debug_draw_color = Colors.get_table("dark_orange")
			else
				self._debug_draw_color = Colors.get_table("red")
			end
		end

		local fatigue_point_costs_multiplier = outer_block and (weapon_template.outer_block_fatigue_point_multiplier or 2) or weapon_template.block_fatigue_point_multiplier or 1
		local improved_block = block and not outer_block

		if not attack_direction then
			local cross = Vector3.cross(block_direction_flat, player_direction_flat)
			attack_direction = cross.z < 0 and "left" or "right"
		end

		return true, fatigue_point_costs_multiplier, improved_block, attack_direction
	end

	return false
end

GenericStatusExtension.blocked_attack = function (self, fatigue_type, attacking_unit, fatigue_point_costs_multiplier, improved_block, attack_direction)
	local unit = self.unit
	local inventory_extension = self.inventory_extension
	local equipment = inventory_extension:equipment()
	local blocking_unit = nil

	self:set_has_blocked(true)

	local player = self.player

	if player then
		local buff_extension = self.buff_extension
		local all_blocks_parry_buff = "power_up_deus_block_procs_parry_exotic"
		local all_blocks_parry = buff_extension:has_buff_type(all_blocks_parry_buff)
		local is_timed_block = false
		local t = Managers.time:time("game")

		if self.timed_block and (t < self.timed_block or all_blocks_parry) then
			buff_extension:trigger_procs("on_timed_block", attacking_unit)

			is_timed_block = true
		end

		if not player.remote then
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
			local first_person_unit = first_person_extension:get_first_person_unit()

			if Managers.state.controller_features and player.local_player then
				Managers.state.controller_features:add_effect("rumble", {
					rumble_effect = "block"
				})
			end

			blocking_unit = equipment.right_hand_wielded_unit or equipment.left_hand_wielded_unit
			local weapon_template_name = equipment.wielded.template or equipment.wielded.temporary_template
			local weapon_template = Weapons[weapon_template_name]

			if is_timed_block then
				first_person_extension:play_hud_sound_event("Play_player_parry_success", nil, false)
			end

			self:add_fatigue_points(fatigue_type, attacking_unit, blocking_unit, fatigue_point_costs_multiplier, is_timed_block)

			local parry_reaction = "parry_hit_reaction"

			if improved_block then
				local amount = PlayerUnitStatusSettings.fatigue_point_costs[fatigue_type]

				if amount <= 2 and (attack_direction == "left" or attack_direction == "right") then
					parry_reaction = "parry_deflect_" .. attack_direction
				end

				local block_arc_event = weapon_template and weapon_template.sound_event_block_within_arc or "Play_player_block_ark_success"

				first_person_extension:play_hud_sound_event(block_arc_event, nil, false)
			else
				local wwise_world = Managers.world:wwise_world(self.world)
				local enemy_pos = POSITION_LOOKUP[attacking_unit]

				if enemy_pos then
					local player_pos = first_person_extension:current_position()
					local dir_to_enemy = Vector3.normalize(enemy_pos - player_pos)

					WwiseWorld.trigger_event(wwise_world, "Play_player_combat_out_of_arc_block", player_pos + dir_to_enemy)
				end
			end

			Unit.animation_event(first_person_unit, parry_reaction)
			QuestSettings.handle_bastard_block(unit, attacking_unit, true)
		else
			blocking_unit = equipment.right_hand_wielded_unit_3p or equipment.left_hand_wielded_unit_3p

			QuestSettings.handle_bastard_block(unit, attacking_unit, true)
			self:add_fatigue_points(fatigue_type, attacking_unit, blocking_unit, fatigue_point_costs_multiplier, is_timed_block)
			Unit.animation_event(unit, "parry_hit_reaction")
		end

		Managers.state.entity:system("play_go_tutorial_system"):register_block()
	end

	if blocking_unit then
		local unit_pos = POSITION_LOOKUP[blocking_unit]
		local unit_rot = Unit.world_rotation(blocking_unit, 0)
		local particle_position = unit_pos + Quaternion.up(unit_rot) * Math.random() * 0.5 + Quaternion.right(unit_rot) * 0.1

		World.create_particles(self.world, "fx/wpnfx_sword_spark_parry", particle_position)
	end
end

GenericStatusExtension.set_shielded = function (self, shielded)
	local unit = self.unit
	local player = self.player

	if player.local_player then
		local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

		if shielded then
			first_person_extension:play_hud_sound_event("hud_player_buff_shield_activate")
			first_person_extension:create_screen_particles("fx/screenspace_shield_healed")
		else
			local health_extension = self.health_extension
			local shield_end_reason = health_extension:previous_shield_end_reason()

			if shield_end_reason == "blocked_damage" then
				first_person_extension:play_hud_sound_event("hud_player_buff_shield_down")
			elseif shield_end_reason == "timed_out" then
				first_person_extension:play_hud_sound_event("hud_player_buff_shield_deactivate")
			end
		end
	end

	self.shielded = shielded
end

local no_sfx_heal_reasons = {
	career_passive = true,
	health_regen = true,
	heal_from_proc = true,
	career_skill = true
}
local vfx_heal_reasons = {
	bandage_temp_health = true,
	buff_shared_medpack_temp_health = true,
	healing_draught_temp_health = true,
	buff_shared_medpack = true,
	bandage = true,
	bandage_trinket = true,
	healing_draught = true
}

GenericStatusExtension.healed = function (self, reason)
	local unit = self.unit
	local player = self.player

	if player.local_player then
		if not no_sfx_heal_reasons[reason] then
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
			local first_person_unit = first_person_extension:get_first_person_unit()

			Unit.flow_event(first_person_unit, "sfx_heal")
		end

		local mood = HealingMoods[reason]

		if mood then
			MOOD_BLACKBOARD[mood] = true
		end
	elseif vfx_heal_reasons[reason] then
		ScriptWorld.create_particles_linked(self.world, "fx/chr_player_fak_healed", unit, 0, "destroy")
	end
end

GenericStatusExtension.fatigued = function (self)
	local max_fatigue = PlayerUnitStatusSettings.MAX_FATIGUE
	local max_fatigue_points = self.max_fatigue_points
	local no_push_fatigue_cost = self.buff_extension:has_buff_perk("no_push_fatigue_cost")

	if no_push_fatigue_cost then
		return false
	end

	return max_fatigue_points == 0 and true or self.fatigue > max_fatigue - max_fatigue / max_fatigue_points
end

GenericStatusExtension.add_fatigue_points = function (self, fatigue_type, attacking_unit, blocking_weapon_unit, fatigue_point_costs_multiplier, is_timed_block)
	local buff_extension = self.buff_extension

	if Development.parameter("disable_fatigue_system") then
		return
	end

	local amount = PlayerUnitStatusSettings.fatigue_point_costs[fatigue_type]
	local t = Managers.time:time("game")
	local max_fatigue = PlayerUnitStatusSettings.MAX_FATIGUE
	local max_fatigue_points = self.max_fatigue_points
	local fatigue_cost = amount * max_fatigue / max_fatigue_points * (fatigue_point_costs_multiplier or 1)

	if is_timed_block then
		fatigue_cost = buff_extension:apply_buffs_to_value(fatigue_cost, "timed_block_cost")
	end

	if amount and fatigue_point_costs_multiplier and amount < 2 and fatigue_point_costs_multiplier < 1 and buff_extension:has_buff_perk("in_arc_block_cost_reduction") then
		fatigue_cost = 0
	end

	if blocking_weapon_unit then
		fatigue_cost = buff_extension:apply_buffs_to_value(fatigue_cost, "block_cost")

		if buff_extension:has_buff_perk("overcharged_block") then
			local overcharge_extension = ScriptUnit.has_extension(self.unit, "overcharge_system")

			if overcharge_extension and overcharge_extension:above_overcharge_threshold() then
				fatigue_cost = fatigue_cost * 0.5

				overcharge_extension:remove_charge(amount)
			end
		end
	end

	self.fatigue = math.clamp(self.fatigue + fatigue_cost, 0, max_fatigue)

	if blocking_weapon_unit then
		buff_extension:trigger_procs("on_block", attacking_unit, fatigue_type, blocking_weapon_unit)
	end

	if max_fatigue <= self.fatigue and block_breaking_fatigue_types[fatigue_type] then
		buff_extension:trigger_procs("on_block_broken", attacking_unit, fatigue_type, blocking_weapon_unit)
		self:set_block_broken(true, t)
	end

	if fatigue_cost > 0 then
		self.last_fatigue_gain_time = t
		self.show_fatigue_gui = true
	end

	if fatigue_type == "action_stun_push" then
		self.action_stun_push = true
	end

	local first_person_extension = self.first_person_extension

	if PlayerUnitStatusSettings.fatigue_points_to_play_heavy_block_sfx < amount and first_person_extension then
		first_person_extension:play_hud_sound_event("Play_player_combat_heavy_block_sweetner", nil, false)
	end

	local fatigue_points_to_trigger_vo = PlayerUnitStatusSettings.fatigue_points_to_trigger_vo
	local fatigue = self.fatigue

	if fatigue_points_to_trigger_vo <= amount and max_fatigue <= fatigue then
		local player_profile = ScriptUnit.extension(self.unit, "dialogue_system").context.player_profile

		SurroundingAwareSystem.add_event(self.unit, "block_broken_by_heavy_hit", DialogueSettings.grabbed_broadcast_range, "profile_name", player_profile)
	end

	local position = POSITION_LOOKUP[self.unit]
end

GenericStatusExtension.remove_fatigue_points = function (self, amount)
	self.fatigue = math.max(self.fatigue - amount, 0)
end

GenericStatusExtension.remove_all_fatigue = function (self)
	self.fatigue = 0
end

GenericStatusExtension.get_dodge_item_data = function (self)
	local inventory_extension = self.inventory_extension
	local slot_name = inventory_extension:get_wielded_slot_name()
	local slot_data = inventory_extension:get_slot_data(slot_name)
	local dodge_count = nil

	if slot_data then
		local item_data = slot_data.item_data
		local item_template = slot_data.item_template or BackendUtils.get_item_template(item_data)
		dodge_count = item_template.dodge_count
	end

	self.dodge_count = dodge_count or 2
end

GenericStatusExtension.add_dodge_cooldown = function (self)
	if self.buff_extension:has_buff_perk("infinite_dodge") then
		self.dodge_cooldown = 0

		return
	end

	self:get_dodge_item_data()

	self.dodge_cooldown = math.min(self.dodge_cooldown + 1, 3 + self.dodge_count)
	self.dodge_cooldown_delay = nil
end

GenericStatusExtension.start_dodge_cooldown = function (self, t)
	self.dodge_cooldown_delay = t + 0.5
end

GenericStatusExtension.get_dodge_cooldown = function (self)
	if self.buff_extension:has_buff_type("passive_career_we_2") then
		return 1
	end

	return 0.4 + 0.6 * (1 - math.max(self.dodge_cooldown - self.dodge_count, 0) / 3)
end

GenericStatusExtension.current_fatigue = function (self)
	return self.fatigue
end

GenericStatusExtension.current_fatigue_points = function (self)
	local max_fatigue = PlayerUnitStatusSettings.MAX_FATIGUE
	local max_fatigue_points = self.max_fatigue_points

	return max_fatigue_points == 0 and 0 or math.ceil(self.fatigue / (max_fatigue / max_fatigue_points)), max_fatigue_points
end

GenericStatusExtension.set_stagger_immune = function (self, stagger_immune)
	self.stagger_immune = stagger_immune
end

GenericStatusExtension.set_pushed = function (self, pushed, t)
	if pushed and (self.push_cooldown or self.stagger_immune) then
		return
	elseif pushed then
		self.pushed = pushed
		self.push_cooldown = true
		self.pushed_at_t = t
	else
		self.pushed = pushed
	end
end

GenericStatusExtension.set_charged = function (self, charged, t)
	self.charged = charged
end

GenericStatusExtension.set_pushed_no_cooldown = function (self, pushed, t)
	if pushed and self.stagger_immune then
		return
	end

	self.pushed = pushed

	if pushed then
		self.pushed_at_t = t
	end
end

GenericStatusExtension.set_hit_react_type = function (self, hit_react_type)
	self._hit_react_type = hit_react_type
end

GenericStatusExtension.hitreact_interrupt = function (self)
	if self.interrupt_cooldown then
		return false
	else
		self.interrupt_cooldown = true

		return true
	end
end

GenericStatusExtension.is_pushed = function (self)
	return self.pushed and not self.overcharge_exploding
end

GenericStatusExtension.is_charged = function (self)
	return self.charged
end

GenericStatusExtension.hit_react_type = function (self)
	return self._hit_react_type or "light"
end

GenericStatusExtension.set_block_broken = function (self, block_broken, t)
	self.block_broken = block_broken

	if block_broken then
		self.block_broken_degen_delay = 2
		self.block_broken_at_t = t
	end
end

GenericStatusExtension.set_has_pushed = function (self, degen_delay)
	local buff_extension = self.buff_extension

	if not buff_extension:has_buff_perk("slayer_stamina") then
		self.push_degen_delay = degen_delay or 1.5
	end
end

GenericStatusExtension.set_has_blocked = function (self, has_blocked)
	self._has_blocked = has_blocked
end

GenericStatusExtension.set_pounced_down = function (self, pounced_down, pouncer_unit)
	local unit = self.unit
	local locomotion = ScriptUnit.extension(unit, "locomotion_system")
	pounced_down = pounced_down and pouncer_unit ~= nil and Unit.alive(pouncer_unit)
	self.pounced_down = pounced_down

	if pounced_down then
		self.pouncer_unit = pouncer_unit
		local foe_rotation = Unit.local_rotation(pouncer_unit, 0)
		local foe_forward = Quaternion.forward(foe_rotation)
		local towards_foe_rotation = Quaternion.look(-foe_forward, Vector3.up())

		Unit.set_local_rotation(unit, 0, towards_foe_rotation)
		Unit.set_local_rotation(pouncer_unit, 0, towards_foe_rotation)

		if not self.is_husk then
			locomotion:set_wanted_velocity(Vector3.zero())
		end

		locomotion:set_disabled(true, LocomotionUtils.update_local_animation_driven_movement_with_parent, pouncer_unit)
	else
		locomotion:set_disabled(false, LocomotionUtils.update_local_animation_driven_movement_with_parent)

		self.pouncer_unit = nil
	end

	self:set_outline_incapacitated(not self:is_dead() and self:is_disabled(), pouncer_unit, true)

	if pounced_down then
		SurroundingAwareSystem.add_event(unit, "pounced_down", DialogueSettings.pounced_down_broadcast_range, "target", unit, "target_name", ScriptUnit.extension(unit, "dialogue_system").context.player_profile)

		local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()
		event_data.distance = DialogueSettings.pounced_down_broadcast_range
		event_data.target = unit
		event_data.target_name = ScriptUnit.extension(unit, "dialogue_system").context.player_profile

		dialogue_input:trigger_dialogue_event("pounced_down", event_data)
		Managers.music:trigger_event("enemy_gutter_runner_pounced_stinger")
	end

	if self.is_server then
		local go_id = Managers.state.unit_storage:go_id(self.unit)
		local enemy_go_id = Managers.state.unit_storage:go_id(pouncer_unit)

		Managers.state.network.network_transmit:send_rpc_clients("rpc_status_change_bool", NetworkLookup.statuses.pounced_down, pounced_down, go_id, enemy_go_id)
	end

	if pounced_down then
		local buff_extension = ScriptUnit.extension(unit, "buff_system")

		buff_extension:trigger_procs("on_player_disabled", "assassin_pounced", pouncer_unit)
		Managers.state.event:trigger("on_player_disabled", "assassin_pounced", unit, pouncer_unit)
		Managers.state.achievement:trigger_event("register_player_disabled", unit)
	end
end

GenericStatusExtension.set_crouching = function (self, crouching)
	self.crouching = crouching

	self:set_slowed(crouching)

	local player = self.player

	if player and not player.remote then
		local go_id = Managers.state.unit_storage:go_id(self.unit)

		if self.is_server then
			Managers.state.network.network_transmit:send_rpc_clients("rpc_status_change_bool", NetworkLookup.statuses.crouching, crouching, go_id, 0)
		else
			Managers.state.network.network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.crouching, crouching, go_id, 0)
		end
	end
end

GenericStatusExtension.crouch_toggle = function (self)
	local crouching = not self.crouching

	return crouching
end

local biggest_hit = {}

GenericStatusExtension.set_knocked_down = function (self, knocked_down)
	self.knocked_down = knocked_down
	local unit = self.unit
	local health_extension = self.health_extension or ScriptUnit.extension(unit, "health_system")
	local buff_extension = self.buff_extension or ScriptUnit.extension(unit, "buff_system")
	local player = self.player
	local is_server = self.is_server

	self:set_outline_incapacitated(not self:is_dead() and self:is_disabled())

	if knocked_down then
		StatisticsUtil.register_knockdown(unit, health_extension, nil, is_server)

		local dialogue_event = "knocked_down"
		local num_times_knocked_down = self._num_times_knocked_down

		if NUM_TIMES_KNOCKED_DOWN <= num_times_knocked_down then
			dialogue_event = "knocked_down_multiple_times"
		end

		num_times_knocked_down = num_times_knocked_down + 1
		self._num_times_knocked_down = num_times_knocked_down

		SurroundingAwareSystem.add_event(unit, dialogue_event, DialogueSettings.knocked_down_broadcast_range, "target", unit, "target_name", ScriptUnit.extension(unit, "dialogue_system").context.player_profile)

		local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()
		event_data.distance = 0
		event_data.height_distance = 0
		event_data.target_name = ScriptUnit.extension(unit, "dialogue_system").context.player_profile

		dialogue_input:trigger_dialogue_event("knocked_down", event_data)

		local position = POSITION_LOOKUP[unit]
		local nearby_units = {}
		local num_nearby_units = AiUtils.broadphase_query(position, DialogueSettings.knocked_down_broadcast_range, nearby_units)

		for i = 1, num_nearby_units do
			local nearby_unit = nearby_units[i]
			local nearby_unit_dialogue_extension = ScriptUnit.has_extension(nearby_unit, "dialogue_system")

			if nearby_unit_dialogue_extension then
				local nearby_unit_dialogue_input = nearby_unit_dialogue_extension.input

				nearby_unit_dialogue_input:trigger_dialogue_event("knocked_down", event_data)
			end
		end

		if is_server and not self.knocked_down_bleed_id then
			self.knocked_down_bleed_id = buff_extension:add_buff("knockdown_bleed")
		end

		if player.local_player then
			MOOD_BLACKBOARD.knocked_down = true
		end

		buff_extension:trigger_procs("on_knocked_down")

		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit

		if local_player_unit then
			local local_player_buff_extension = ScriptUnit.has_extension(local_player_unit, "buff_system")

			if local_player_buff_extension then
				local_player_buff_extension:trigger_procs("on_ally_knocked_down", unit)
			end
		end

		if self._intoxication_level < 0 then
			self._intoxication_level = -1
		end
	else
		health_extension:reset()

		if is_server and self.knocked_down_bleed_id then
			buff_extension:remove_buff(self.knocked_down_bleed_id)

			self.knocked_down_bleed_id = nil
		end

		if player.local_player then
			MOOD_BLACKBOARD.knocked_down = false
		end
	end

	if knocked_down then
		if is_server then
			self:add_pacing_intensity(CurrentIntensitySettings.intensity_add_knockdown)
		end

		local kill_damages, _ = health_extension:recent_damages()

		pack_index[DamageDataIndex.STRIDE](biggest_hit, 1, unpack_index[DamageDataIndex.STRIDE](kill_damages, 1))

		if player then
			local damage_type = biggest_hit[DamageDataIndex.DAMAGE_TYPE]
			local position = POSITION_LOOKUP[unit]

			Managers.telemetry.events:player_knocked_down(player, damage_type, position)
		end

		Managers.state.achievement:trigger_event("player_knocked_down", player)
	end

	Managers.music:check_last_man_standing_music_state()
end

GenericStatusExtension.set_ready_for_assisted_respawn = function (self, ready, flavour_unit)
	self.ready_for_assisted_respawn = ready
	self.assisted_respawn_flavour_unit = flavour_unit
	local unit = self.unit
	local outline_extension = ScriptUnit.has_extension(unit, "outline_system")

	if not outline_extension then
		return
	end

	local player = self.player

	if ready then
		if player and player.local_player then
			self._assisted_respawn_outline_id = outline_extension:add_outline(OutlineSettings.templates.ready_for_assisted_respawn)
		else
			self._assisted_respawn_outline_id = outline_extension:add_outline(OutlineSettings.templates.ready_for_assisted_respawn_husk)
		end
	else
		outline_extension:remove_outline(self._assisted_respawn_outline_id)

		self._assisted_respawn_outline_id = nil
	end
end

GenericStatusExtension.set_assisted_respawning = function (self, respawning, helper_unit)
	self.assisted_respawning = respawning
	self.assisted_respawn_helper_unit = helper_unit
end

GenericStatusExtension.is_assisted_respawning = function (self)
	return self.assisted_respawning
end

GenericStatusExtension.get_assisted_respawn_helper_unit = function (self)
	return self.assisted_respawn_helper_unit
end

GenericStatusExtension.set_respawned = function (self, respawned)
	if respawned then
		self:set_ready_for_assisted_respawn(false)
		Managers.music:check_last_man_standing_music_state()
	end
end

GenericStatusExtension.set_dead = function (self, dead)
	local player = self.player

	if dead and ScriptUnit.has_extension(self.unit, "outline_system") then
		local outline_extension = ScriptUnit.extension(self.unit, "outline_system")

		outline_extension:add_outline(OutlineSettings.templates.dead)
	end

	if dead and player and not player.remote then
		local inventory_extension = self.inventory_extension
		local career_extension = self.career_extension

		CharacterStateHelper.stop_weapon_actions(inventory_extension, "dead")
		CharacterStateHelper.stop_career_abilities(career_extension, "dead")
	end

	Managers.state.achievement:trigger_event("player_dead", player)

	self.dead = dead
end

GenericStatusExtension.set_blocking = function (self, blocking)
	self.blocking = blocking
	local inventory_extension = self.inventory_extension
	local slot_name = inventory_extension:get_wielded_slot_name()
	local slot_data = inventory_extension:get_slot_data(slot_name)

	if slot_data then
		local item_data = slot_data.item_data
		local item_template = slot_data.item_template or BackendUtils.get_item_template(item_data)
		self.shield_block = item_template.shield_block or false
	end

	if blocking then
		local t = Managers.time:time("game")
		self.raise_block_time = t
	end
end

GenericStatusExtension.set_override_blocking = function (self, blocking, rpc_server)
	self.override_blocking = blocking

	if rpc_server then
		local network_manager = Managers.state.network
		local game = network_manager:game()
		local unit_id = network_manager:unit_game_object_id(self.unit)

		if unit_id and game then
			network_manager.network_transmit:send_rpc_server("rpc_set_override_blocking", unit_id, blocking or false)
		end
	end
end

GenericStatusExtension.set_charge_blocking = function (self, charge_blocking)
	self.charge_blocking = charge_blocking
end

GenericStatusExtension.set_stagger_immmune = function (self, stagger_immune)
	self.stagger_immune = stagger_immune
end

GenericStatusExtension.set_slowed = function (self, slowed)
	self.is_slowed = slowed
end

GenericStatusExtension.set_wounded = function (self, wounded, reason, t)
	if wounded then
		if not self.buff_extension:has_buff_perk("infinite_wounds") then
			self.wounds = self.wounds - 1
		end
	elseif reason == "healed" then
		self.wounds = self:get_max_wounds()
	end

	if self.player.local_player and not Managers.state.game_mode:has_activated_mutator("instant_death") then
		MOOD_BLACKBOARD.wounded = self.wounds == 1

		if not MOOD_BLACKBOARD.wounded then
			MOOD_BLACKBOARD.bleeding_out = wounded
		else
			MOOD_BLACKBOARD.bleeding_out = false
		end
	end
end

GenericStatusExtension.set_pulled_up = function (self, pulled_up, helper)
	if self.is_ledge_hanging then
		self.pulled_up = pulled_up

		if pulled_up then
			local dialogue_input = ScriptUnit.extension_input(self.unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()
			event_data.reviver = helper
			event_data.reviver_name = ScriptUnit.extension(helper, "dialogue_system").context.player_profile

			dialogue_input:trigger_dialogue_event("revive_completed", event_data)
		end
	elseif not pulled_up then
		self.pulled_up = pulled_up
	end
end

GenericStatusExtension.set_revived = function (self, revived, reviver)
	self.revived = revived
	local unit = self.unit

	if revived then
		local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()
		event_data.reviver = reviver
		event_data.reviver_name = ScriptUnit.extension(reviver, "dialogue_system").context.player_profile

		dialogue_input:trigger_dialogue_event("revive_completed", event_data)

		local revived_buff_extension = ScriptUnit.extension(unit, "buff_system")

		revived_buff_extension:trigger_procs("on_revived", reviver)

		local reviver_buff_extension = ScriptUnit.extension(reviver, "buff_system")

		reviver_buff_extension:trigger_procs("on_revived_ally", unit)
	end
end

GenericStatusExtension.set_zooming = function (self, zooming, camera_name)
	self.zooming = zooming

	self:set_slowed(zooming)

	local player = self.player
	local camera_follow_unit = player.camera_follow_unit

	if zooming then
		if Unit.alive(camera_follow_unit) then
			camera_name = camera_name or "zoom_in"

			if Development.parameter("third_person_mode") then
				camera_name = camera_name .. "_third_person"
			end

			Unit.set_data(camera_follow_unit, "camera", "settings_node", camera_name)

			self.zoom_mode = camera_name
		end
	else
		if Unit.alive(camera_follow_unit) then
			if Development.parameter("third_person_mode") then
				Unit.set_data(camera_follow_unit, "camera", "settings_node", "over_shoulder")
			else
				Unit.set_data(camera_follow_unit, "camera", "settings_node", "first_person_node")
			end
		end

		self.zoom_mode = nil
	end
end

local DEFAULT_ZOOM_TABLE = {
	"zoom_in",
	"increased_zoom_in"
}

GenericStatusExtension.switch_variable_zoom = function (self, zoom_table)
	local player = self.player
	local camera_follow_unit = player.camera_follow_unit

	if Unit.alive(camera_follow_unit) then
		zoom_table = zoom_table or DEFAULT_ZOOM_TABLE
		local new_index = 1

		for i, camera_name in ipairs(zoom_table) do
			if camera_name == self.zoom_mode then
				new_index = i % #zoom_table + 1

				break
			end
		end

		local new_camera_name = zoom_table[new_index]

		Unit.set_data(camera_follow_unit, "camera", "settings_node", new_camera_name)

		self.zoom_mode = new_camera_name
	end
end

GenericStatusExtension.set_grabbed_by_tentacle = function (self, grabbed, tentacle_unit)
	self.grabbed_by_tentacle = grabbed
	self.grabbed_by_tentacle_unit = tentacle_unit
	self.grabbed_by_tentacle_status = grabbed and "grabbed" or nil
end

GenericStatusExtension.set_grabbed_by_tentacle_status = function (self, status)
	self.grabbed_by_tentacle_status = status
end

GenericStatusExtension.set_grabbed_by_chaos_spawn = function (self, grabbed, chaos_spawn_unit)
	self.grabbed_by_chaos_spawn = grabbed

	if grabbed then
		self.grabbed_by_chaos_spawn_status = "grabbed"
		self.grabbed_by_chaos_spawn_status_count = 1
		self.grabbed_by_chaos_spawn_unit = chaos_spawn_unit
	else
		self.grabbed_by_chaos_spawn_status = nil
		self.grabbed_by_chaos_spawn_status_count = nil
	end
end

GenericStatusExtension.set_grabbed_by_chaos_spawn_status = function (self, status)
	if self.grabbed_by_chaos_spawn_status_count then
		self.grabbed_by_chaos_spawn_status = status
		self.grabbed_by_chaos_spawn_status_count = self.grabbed_by_chaos_spawn_status_count + 1
	end
end

GenericStatusExtension.set_in_vortex = function (self, in_vortex, vortex_unit)
	self.in_vortex = in_vortex
	self.in_vortex_unit = in_vortex and vortex_unit or nil

	self:set_outline_incapacitated(not self:is_dead() and self:is_disabled())
end

GenericStatusExtension.set_near_vortex = function (self, near_vortex, vortex_unit)
	self.near_vortex = near_vortex
	self.near_vortex_unit = near_vortex and vortex_unit or nil
end

GenericStatusExtension.set_in_liquid = function (self, in_liquid, liquid_unit)
	self.in_liquid = in_liquid
	self.in_liquid_unit = in_liquid and liquid_unit or nil
end

GenericStatusExtension.set_catapulted = function (self, catapulted, velocity)
	local unit = self.unit

	if catapulted then
		if not self:is_disabled() then
			self.catapulted = true
			self.last_catapulted_time = Managers.time:time("game")

			if not self.is_husk then
				self.catapulted_velocity = Vector3Box(velocity)
				local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
				local dir = Vector3.dot(Quaternion.forward(first_person_extension:current_rotation()), velocity)
				local look_dir, catapulted_direction = nil

				if dir > 0 then
					look_dir = Vector3.normalize(velocity)
					catapulted_direction = "forward"
				else
					look_dir = Vector3.normalize(-velocity)
					catapulted_direction = "backward"
				end

				self.catapulted_direction = catapulted_direction
				local rot = Quaternion.look(look_dir, Vector3.up())

				first_person_extension:force_look_rotation(rot)
			end
		end
	else
		self.catapulted = false
		self.catapulted_direction = nil
		self.catapulted_velocity = nil
	end

	local player = self.player

	if player and not player.remote and Managers.state.network:game() then
		local go_id = Managers.state.unit_storage:go_id(unit)

		if self.is_server then
			Managers.state.network.network_transmit:send_rpc_clients("rpc_set_catapulted", go_id, catapulted, velocity or Vector3.zero())
		else
			Managers.state.network.network_transmit:send_rpc_server("rpc_set_catapulted", go_id, catapulted, velocity or Vector3.zero())
		end
	end
end

GenericStatusExtension.leap_start = function (self, unit)
	local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

	buff_extension:trigger_procs("on_leap_start")
end

GenericStatusExtension.leap_finished = function (self, unit)
	local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

	buff_extension:trigger_procs("on_leap_finished")
end

GenericStatusExtension.set_inside_transport_unit = function (self, unit)
	self.inside_transport_unit = unit
end

GenericStatusExtension.set_using_transport = function (self, using_transport)
	self.using_transport = using_transport
end

GenericStatusExtension.set_overcharge_exploding = function (self, overcharge_exploding)
	self.overcharge_exploding = overcharge_exploding
end

GenericStatusExtension.set_left_ladder = function (self, t)
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(self.unit)
	self.left_ladder_timer = t + movement_settings_table.ladder.leave_ladder_reattach_time
end

GenericStatusExtension.set_is_on_ladder = function (self, is_on_ladder, ladder_unit)
	self.on_ladder = is_on_ladder
	self.current_ladder_unit = ladder_unit
end

GenericStatusExtension.set_is_ledge_hanging = function (self, is_ledge_hanging, ledge_unit)
	self.is_ledge_hanging = is_ledge_hanging
	self.current_ledge_hanging_unit = ledge_unit
	local unit = self.unit

	if not is_ledge_hanging then
		self.pulled_up = false
	end

	local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

	if is_ledge_hanging and buff_extension then
		buff_extension:trigger_procs("on_ledge_hang_start")
	end

	self:set_outline_incapacitated(not self:is_dead() and self:is_disabled())

	if is_ledge_hanging then
		SurroundingAwareSystem.add_event(unit, "ledge_hanging", DialogueSettings.grabbed_broadcast_range, "target", unit, "target_name", ScriptUnit.extension(unit, "dialogue_system").context.player_profile)

		local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()
		event_data.target_name = ScriptUnit.extension(unit, "dialogue_system").context.player_profile

		dialogue_input:trigger_dialogue_event("ledge_hanging", event_data)
	end
end

GenericStatusExtension.set_in_hanging_cage = function (self, in_hanging_cage, cage_unit, state, animations)
	if in_hanging_cage then
		self.in_hanging_cage_unit = cage_unit or self.in_hanging_cage_unit
		self.in_hanging_cage_state = state or self.in_hanging_cage_state
		self.in_hanging_cage_animations = animations or self.in_hanging_cage_animations
	else
		self.in_hanging_cage_unit = nil
		self.in_hanging_cage_state = nil
		self.in_hanging_cage_animations = nil
	end

	self.in_hanging_cage = in_hanging_cage
end

GenericStatusExtension.set_outline_incapacitated = function (self, incapacitated, disabler_unit, outline_disabler_unit)
	local unit = self.unit
	local player = self.player

	if not player then
		return
	end

	local outline_extension = ScriptUnit.has_extension(unit, "outline_system")

	if not outline_extension then
		return
	end

	if incapacitated then
		if not player.local_player then
			if not self._incapacitated_outline_ids.target_id then
				self._incapacitated_outline_ids.target_id = outline_extension:add_outline(OutlineSettings.templates.incapacitated)
			end

			if disabler_unit and not self._incapacitated_outline_ids.disabler_id then
				outline_extension = ScriptUnit.extension(disabler_unit, "outline_system")
				local outline_id = outline_extension:add_outline(OutlineSettings.templates.incapacitated)
				self._incapacitated_outline_ids.disabler_id = outline_id
			end
		end
	else
		local incapacitated_outline_ids = self._incapacitated_outline_ids

		outline_extension:remove_outline(incapacitated_outline_ids.target_id)

		if incapacitated_outline_ids.disabler_id and disabler_unit then
			outline_extension = ScriptUnit.extension(disabler_unit, "outline_system")

			outline_extension:remove_outline(incapacitated_outline_ids.disabler_id)
		end

		table.clear(self._incapacitated_outline_ids)
	end
end

GenericStatusExtension._set_packmaster_unhooked = function (self, locomotion, grabbed_status)
	local t = Managers.time:time("game")

	if self.release_unhook_time then
		-- Nothing
	elseif self.dead then
		if grabbed_status == "pack_master_dragging" or grabbed_status == "pack_master_pulling" then
			self.release_unhook_time = t + PlayerUnitStatusSettings.hanging_by_pack_master.release_dragging_time_dead
		else
			self.release_unhook_time = t + PlayerUnitStatusSettings.hanging_by_pack_master.release_unhook_time_dead
		end
	elseif self.knocked_down then
		self.release_unhook_time = t + PlayerUnitStatusSettings.hanging_by_pack_master.release_unhook_time_ko
	else
		self.release_unhook_time = t + PlayerUnitStatusSettings.hanging_by_pack_master.release_unhook_time
	end

	if not self.is_husk then
		locomotion:set_wanted_velocity(Vector3.zero())
		locomotion:move_to_non_intersecting_position()
	end

	self.pack_master_status = "pack_master_unhooked"
end

GenericStatusExtension.set_pack_master = function (self, grabbed_status, is_grabbed, grabber_unit)
	local unit = self.unit
	self.pack_master_grabber = is_grabbed and grabber_unit or nil
	local previous_status = self.pack_master_status
	self.pack_master_status = grabbed_status

	if is_grabbed then
		local buff_extension = ScriptUnit.extension(unit, "buff_system")

		buff_extension:trigger_procs("on_player_disabled", "pack_master_grab", grabber_unit)
		Managers.state.event:trigger("on_player_disabled", "pack_master_grab", unit, grabber_unit)
		Managers.state.achievement:trigger_event("register_player_disabled", unit)
	end

	local locomotion = ScriptUnit.extension(unit, "locomotion_system")
	local outline_grabbed_unit = grabbed_status ~= "pack_master_hanging"
	local player_manager = Managers.player
	local grabber_player = player_manager:unit_owner(grabber_unit)
	local local_player = player_manager:local_player()

	if local_player ~= grabber_player then
		self:set_outline_incapacitated(not self:is_dead() and self:is_disabled(), grabber_unit, outline_grabbed_unit)
	end

	if grabbed_status == "pack_master_pulling" then
		if not is_grabbed then
			self:_set_packmaster_unhooked(locomotion, grabbed_status)

			return
		end

		self.release_unhook_time = nil
		local foe_rotation = Unit.local_rotation(grabber_unit, 0)
		local foe_forward = Quaternion.forward(foe_rotation)
		local back_to_grabber_rotation = Quaternion.look(foe_forward, Vector3.up())

		Unit.set_local_rotation(unit, 0, back_to_grabber_rotation)

		if not self.is_husk then
			locomotion:set_wanted_velocity(Vector3.zero())
		end

		local unit_name = SPProfiles[self.profile_id].unit_name
		local pulled_anim_name = "attack_grab_" .. unit_name

		Unit.animation_event(grabber_unit, pulled_anim_name)

		local dialogue_event = "grabbed"
		local num_times_grabbed = self._num_times_grabbed_by_pack_master

		if NUM_PACK_MASTER_GRABS <= num_times_grabbed then
			dialogue_event = "grabbed_multiple_times"
		end

		num_times_grabbed = num_times_grabbed + 1
		self._num_times_grabbed_by_pack_master = num_times_grabbed

		SurroundingAwareSystem.add_event(unit, dialogue_event, DialogueSettings.grabbed_broadcast_range, "target", unit, "target_name", ScriptUnit.extension(unit, "dialogue_system").context.player_profile)
		Managers.music:trigger_event("enemy_pack_master_grabbed_stinger")

		self.pack_master_hoisted = false
	elseif grabbed_status == "pack_master_dragging" then
		if not is_grabbed then
			self:_set_packmaster_unhooked(locomotion, grabbed_status)

			return
		end

		if previous_status == "pack_master_pulling" then
			locomotion:set_disabled(false, nil, nil, true)
		end
	elseif grabbed_status == "pack_master_unhooked" then
		if previous_status ~= "pack_master_unhooked" then
			self:_set_packmaster_unhooked(locomotion, grabbed_status)
		end

		locomotion:set_disabled(false, nil, nil, true)
	elseif grabbed_status == "pack_master_hoisting" then
		if not is_grabbed then
			self:_set_packmaster_unhooked(locomotion, grabbed_status)

			return
		end

		if not self.is_husk then
			locomotion:set_wanted_velocity(Vector3.zero())
		end

		local breed = Unit.get_data(grabber_unit, "breed")

		if breed and breed.is_player then
			local new_pos = PactswornUtils.get_hoist_position(unit, grabber_unit)

			locomotion:teleport_to(new_pos, nil)
		end

		local dir = Vector3.normalize(POSITION_LOOKUP[unit] - POSITION_LOOKUP[grabber_unit])

		Vector3.set_z(dir, 0)
		Unit.set_local_rotation(unit, 0, Quaternion.look(dir, Vector3.up()))
		Unit.animation_event(unit, "packmaster_hang_start")
		locomotion:set_disabled(true, LocomotionUtils.update_local_animation_driven_movement_plus_mover)

		local target_unit_name = SPProfiles[self.profile_id].unit_name
		local inventory_extension = self.inventory_extension
		local equipment = inventory_extension:equipment()
		local weapon_unit = equipment.right_hand_wielded_unit_3p
		local slot_name = inventory_extension:get_wielded_slot_name()

		if slot_name == "slot_packmaster_claw" then
			Unit.animation_event(weapon_unit, "attack_grab_hang_" .. target_unit_name)
			Unit.animation_event(grabber_unit, "attack_grab_hang_" .. target_unit_name)
		end

		self.pack_master_hoisted = true
	elseif grabbed_status == "pack_master_hanging" then
		locomotion:set_disabled(true, LocomotionUtils.update_local_animation_driven_movement_plus_mover)
	elseif grabbed_status == "pack_master_dropping" then
		local t = Managers.time:time("game")

		locomotion:set_disabled(false, nil, nil, true)

		if self.release_falling_time then
			-- Nothing
		elseif self.dead then
			self.release_falling_time = t + PlayerUnitStatusSettings.hanging_by_pack_master.release_falling_time_dead
		elseif self.knocked_down then
			self.release_falling_time = t + PlayerUnitStatusSettings.hanging_by_pack_master.release_falling_time_ko
		else
			locomotion:set_disabled(false, nil, nil, true)

			self.release_falling_time = t + PlayerUnitStatusSettings.hanging_by_pack_master.release_falling_time
		end
	elseif grabbed_status == "pack_master_released" then
		SurroundingAwareSystem.add_event(unit, "un_grabbed", DialogueSettings.grabbed_broadcast_range, "target", unit, "target_name", ScriptUnit.extension(unit, "dialogue_system").context.player_profile)

		if not Managers.state.network.is_server then
			locomotion:set_disabled(false, nil, nil, true)
		end
	end
end

GenericStatusExtension.hit_by_globadier_poison = function (self)
	local unit = self.unit
	local dialogue_event = "hit_by_goo"
	local num_times_poisoned = self._num_times_hit_by_globadier_poison

	if NUM_GLOBADIER_POISONS <= num_times_poisoned then
		dialogue_event = "hit_by_goo_multiple_times"
	end

	num_times_poisoned = num_times_poisoned + 1
	self._num_times_hit_by_globadier_poison = num_times_poisoned

	SurroundingAwareSystem.add_event(unit, dialogue_event, DialogueSettings.globadier_poisoned_broadcast_range, "target", unit, "target_name", ScriptUnit.extension(unit, "dialogue_system").context.player_profile)
end

GenericStatusExtension.set_grabbed_by_corruptor = function (self, grabbed_status, is_grabbed, grabber_unit)
	local unit = self.unit
	self.corruptor_grabbed = is_grabbed and grabber_unit or nil
	self.grabbed_by_corruptor = is_grabbed
	self.corruptor_unit = grabber_unit
	self.corruptor_status = grabbed_status

	self:set_outline_incapacitated(not self:is_dead() and self:is_disabled(), grabber_unit, is_grabbed)

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	if grabbed_status == "chaos_corruptor_grabbed" then
		if not self.is_husk then
			locomotion_extension:set_wanted_velocity(Vector3.zero())
		end

		SurroundingAwareSystem.add_event(unit, "grabbed", DialogueSettings.grabbed_broadcast_range, "target", unit, "target_name", ScriptUnit.extension(unit, "dialogue_system").context.player_profile)
		Managers.music:trigger_event("enemy_pack_master_grabbed_stinger")
	elseif grabbed_status == "chaos_corruptor_released" and not self.is_husk then
		locomotion_extension:set_wanted_velocity(Vector3.zero())
		locomotion_extension:move_to_non_intersecting_position()
	end

	if is_grabbed then
		local buff_extension = ScriptUnit.extension(unit, "buff_system")

		buff_extension:trigger_procs("on_player_disabled", "corruptor_grab", self.corruptor_unit)
		Managers.state.event:trigger("on_player_disabled", "corruptor_grab", unit, self.corruptor_unit)
		Managers.state.achievement:trigger_event("register_player_disabled", unit)
	end
end

GenericStatusExtension.get_pacing_intensity = function (self)
	return self.pacing_intensity
end

GenericStatusExtension.get_combo_target_count = function (self)
	return self.combo_target_count
end

GenericStatusExtension.is_pounced_down = function (self)
	return self.pounced_down, self.pouncer_unit
end

GenericStatusExtension.get_pouncer_unit = function (self)
	return self.pouncer_unit
end

GenericStatusExtension.is_knocked_down = function (self)
	return self.knocked_down
end

GenericStatusExtension.set_knocked_down_bleed_buff_paused = function (self, pause_bleed)
	local unit = self.unit
	local buff_extension = self.buff_extension or ScriptUnit.extension(unit, "buff_system")

	if self.knocked_down_bleed_id and pause_bleed then
		buff_extension:remove_buff(self.knocked_down_bleed_id)

		self.knocked_down_bleed_id = nil
	elseif self.knocked_down and not pause_bleed and not self.knocked_down_bleed_id then
		self.knocked_down_bleed_id = buff_extension:add_buff("knockdown_bleed")
	end

	return self.knocked_down_bleed_id
end

GenericStatusExtension.is_ready_for_assisted_respawn = function (self)
	return self.ready_for_assisted_respawn
end

GenericStatusExtension.disabled_vo_reason = function (self)
	local vo_reason = nil

	if self:is_dead() then
		vo_reason = "dead"
	elseif self:is_pounced_down() then
		vo_reason = "pounced_down"
	elseif self:is_grabbed_by_pack_master() or self:is_hanging_from_hook() then
		vo_reason = "grabbed"
	elseif self:get_is_ledge_hanging() then
		vo_reason = "ledge_hanging"
	elseif self:is_knocked_down() or self:is_ready_for_assisted_respawn() then
		vo_reason = "knocked_down"
	end

	return vo_reason
end

GenericStatusExtension.set_has_bonus_fatigue_active = function (self)
	self.has_bonus_fatigue_active = true
	local t = Managers.time:time("game")
	self.bonus_fatigue_active_timer = t + 1.5
	local first_person_extension = self.first_person_extension

	if first_person_extension then
		first_person_extension:play_hud_sound_event("hud_player_buff_regen_stamina")
	end
end

GenericStatusExtension.get_disabler_unit = function (self)
	local disabler_unit = self.grabbed_by_tentacle_unit or self.pouncer_unit or self.grabbed_by_chaos_spawn_unit or self.pack_master_grabber or self.corruptor_unit

	if Unit.alive(disabler_unit) then
		return disabler_unit
	end
end

GenericStatusExtension.is_disabled = function (self)
	return self:is_dead() or self:is_pounced_down() or self:is_knocked_down() or self:is_grabbed_by_pack_master() or self:get_is_ledge_hanging() or self:is_hanging_from_hook() or self:is_ready_for_assisted_respawn() or self:is_grabbed_by_tentacle() or self:is_grabbed_by_chaos_spawn() or self:is_in_vortex() or self:is_grabbed_by_corruptor() or self:is_overpowered()
end

GenericStatusExtension.is_disabled_non_temporarily = function (self)
	return self:is_dead() or self:is_pounced_down() or self:is_knocked_down() or self:is_grabbed_by_pack_master() or self:get_is_ledge_hanging() or self:is_hanging_from_hook() or self:is_ready_for_assisted_respawn() or self:is_grabbed_by_tentacle() or self:is_grabbed_by_corruptor() or self:is_overpowered()
end

GenericStatusExtension.is_valid_vortex_target = function (self)
	return not self:is_dead() and not self:is_pounced_down() and not self:is_knocked_down() and not self:is_grabbed_by_pack_master() and not self:get_is_ledge_hanging() and not self:is_hanging_from_hook() and not self:is_ready_for_assisted_respawn() and not self:is_grabbed_by_tentacle() and not self:is_grabbed_by_chaos_spawn() and not self:is_in_end_zone()
end

GenericStatusExtension.is_valid_corruptor_target = function (self)
	return not self:is_dead() and not self:is_pounced_down() and not self:is_knocked_down() and not self:is_grabbed_by_pack_master() and not self:get_is_ledge_hanging() and not self:is_hanging_from_hook() and not self:is_ready_for_assisted_respawn() and not self:is_grabbed_by_tentacle() and not self:is_grabbed_by_chaos_spawn() and not self:is_in_end_zone()
end

GenericStatusExtension.is_ogre_target = function (self)
	return not self:is_dead() and not self:is_pounced_down() and not self:is_grabbed_by_pack_master() and not self:is_hanging_from_hook() and not self:is_using_transport() and not self:is_grabbed_by_tentacle() and not self:is_grabbed_by_chaos_spawn()
end

GenericStatusExtension.is_chaos_spawn_target = function (self)
	return not self:is_dead() and not self:is_knocked_down() and not self:is_pounced_down() and not self:is_grabbed_by_pack_master() and not self:is_hanging_from_hook() and not self:is_using_transport() and not self:is_grabbed_by_tentacle() and not self:is_grabbed_by_chaos_spawn()
end

GenericStatusExtension.is_lord_target = function (self)
	return not self:is_dead() and not self:is_knocked_down() and not self:is_pounced_down() and not self:is_grabbed_by_pack_master() and not self:is_hanging_from_hook() and not self:is_using_transport() and not self:is_grabbed_by_tentacle() and not self:is_grabbed_by_chaos_spawn()
end

GenericStatusExtension.is_available_for_career_revive = function (self)
	return self:is_knocked_down() and not self:is_pounced_down() and not self:is_grabbed_by_pack_master() and not self:is_hanging_from_hook() and not self:is_grabbed_by_tentacle() and not self:is_grabbed_by_chaos_spawn()
end

GenericStatusExtension.is_grabbed_by_tentacle = function (self)
	return self.grabbed_by_tentacle
end

GenericStatusExtension.is_grabbed_by_corruptor = function (self)
	return self.grabbed_by_corruptor
end

GenericStatusExtension.is_grabbed_by_chaos_spawn = function (self)
	return self.grabbed_by_chaos_spawn
end

GenericStatusExtension.is_in_liquid = function (self)
	return self.in_liquid
end

GenericStatusExtension.is_dead = function (self)
	return self.dead
end

GenericStatusExtension.is_crouching = function (self)
	return self.crouching
end

GenericStatusExtension.is_blocking = function (self)
	return self.override_blocking == nil and self.blocking or self.override_blocking, self.shield_block
end

GenericStatusExtension.is_wounded = function (self)
	return self.wounds < self:get_max_wounds()
end

GenericStatusExtension.is_permanent_heal = function (self, heal_type)
	local buff_extension = ScriptUnit.has_extension(self.unit, "buff_system")

	if buff_extension then
		local disable_permanent_heal = buff_extension:has_buff_perk("disable_permanent_heal")

		if disable_permanent_heal then
			return false
		end

		local temp_to_permanent_health = buff_extension:has_buff_perk("temp_to_permanent_health")

		if temp_to_permanent_health then
			return true
		end
	end

	return heal_type == "healing_draught" or heal_type == "bandage" or heal_type == "bandage_trinket" or heal_type == "buff_shared_medpack" or heal_type == "career_passive" or heal_type == "health_regen" or heal_type == "debug" or heal_type == "health_conversion"
end

GenericStatusExtension.heal_can_remove_wounded = function (self, heal_type)
	return heal_type == "healing_draught" or heal_type == "bandage" or heal_type == "bandage_trinket" or heal_type == "buff_shared_medpack" or heal_type == "debug" or heal_type == "healing_draught_temp_health" or heal_type == "bandage_temp_health" or heal_type == "buff_shared_medpack_temp_health"
end

GenericStatusExtension.is_revived = function (self)
	return self.revived
end

GenericStatusExtension.is_pulled_up = function (self)
	return self.pulled_up
end

GenericStatusExtension.is_zooming = function (self)
	return self.zooming
end

GenericStatusExtension.num_wounds_remaining = function (self)
	return self.wounds
end

GenericStatusExtension.has_wounds_remaining = function (self)
	return self.wounds > 1
end

GenericStatusExtension.has_recently_left_ladder = function (self, t)
	return t < self.left_ladder_timer
end

GenericStatusExtension.get_is_on_ladder = function (self)
	return self.on_ladder, self.current_ladder_unit
end

GenericStatusExtension.get_is_ledge_hanging = function (self)
	return self.is_ledge_hanging, self.current_ledge_hanging_unit
end

GenericStatusExtension.is_catapulted = function (self)
	return self.catapulted, self.catapulted_direction
end

GenericStatusExtension.is_in_vortex = function (self)
	return self.in_vortex
end

GenericStatusExtension.is_block_broken = function (self)
	return self.block_broken
end

GenericStatusExtension.get_inside_transport_unit = function (self)
	return self.inside_transport_unit
end

GenericStatusExtension.is_using_transport = function (self)
	return self.using_transport
end

GenericStatusExtension.is_overcharge_exploding = function (self)
	return self.overcharge_exploding
end

GenericStatusExtension.is_grabbed_by_pack_master = function (self)
	return self.pack_master_grabber ~= nil and Unit.alive(self.pack_master_grabber)
end

GenericStatusExtension.is_hanging_from_hook = function (self)
	return self.pack_master_status == "pack_master_hanging"
end

GenericStatusExtension.get_pack_master_grabber = function (self)
	return self.pack_master_grabber
end

GenericStatusExtension.has_blocked = function (self)
	return self._has_blocked
end

GenericStatusExtension.reset_move_speed_multiplier = function (self)
	self.move_speed_multiplier = 1
	self.move_speed_multiplier_timer = 1
end

GenericStatusExtension.current_move_speed_multiplier = function (self)
	local lerp_t = math.smoothstep(self.move_speed_multiplier_timer, 0, 1)

	return math.lerp(self.move_speed_multiplier, 1, lerp_t)
end

GenericStatusExtension.set_invisible = function (self, invisible, force_third_person, reason)
	assert(not not reason ~= not not self.is_husk, "Setting invisibility is only allowed locally.")

	if not self.is_husk then
		local was_invisible = self:is_invisible()
		self.invisible[reason] = invisible or nil

		if was_invisible == self:is_invisible() then
			return false
		end
	else
		self.invisible.network_sync = invisible or nil
	end

	local unit = self.unit
	local flow_event_name = nil
	local player = self.player
	local is_third_person = force_third_person or self.is_husk or player.bot_player
	local local_player = Managers.player:local_player()
	local side_manager = Managers.state.side
	local unit_side = side_manager.side_by_unit[unit]
	local local_player_party = local_player and Managers.party:get_party_from_player_id(local_player:network_id(), local_player:local_player_id())
	local local_player_side = local_player_party and side_manager.side_by_party[local_player_party]
	local is_enemies = side_manager:is_enemy_by_side(local_player_side, unit_side)
	local fade_value = is_enemies and 1 or 0.65
	local side = Managers.state.side.side_by_unit[unit]
	local unit_is_hero = side and side:name() == "heroes"

	if invisible then
		flow_event_name = "lua_enabled_invisibility"

		if is_third_person then
			Managers.state.entity:system("fade_system"):set_min_fade(unit, fade_value)
		end

		if unit_is_hero and is_enemies then
			local outline_extension = ScriptUnit.extension(self.unit, "outline_system")
			self._invisible_outline_id = outline_extension:add_outline(OutlineSettings.templates.invisible)
		end
	else
		flow_event_name = "lua_disabled_invisibility"

		if is_third_person then
			Managers.state.entity:system("fade_system"):set_min_fade(unit, 0)
		end

		if unit_is_hero and is_enemies then
			local outline_extension = ScriptUnit.extension(self.unit, "outline_system")

			outline_extension:remove_outline(self._invisible_outline_id)

			self._invisible_outline_id = -1
		end
	end

	if is_third_person then
		Unit.flow_event(unit, flow_event_name)
	else
		local first_person_extension = self.first_person_extension

		if first_person_extension then
			local fp_unit = first_person_extension:get_first_person_unit()
			local fp_mesh_unit = first_person_extension:get_first_person_mesh_unit()

			Unit.flow_event(fp_unit, flow_event_name)
			Unit.flow_event(fp_mesh_unit, flow_event_name)
		end
	end

	local buff_extension = self.buff_extension

	if invisible then
		buff_extension:trigger_procs("on_invisible")
	else
		buff_extension:trigger_procs("on_visible")
	end

	if not self.is_husk then
		local network_manager = Managers.state.network

		if network_manager and network_manager:game() then
			local go_id = Managers.state.unit_storage:go_id(unit)

			if self.is_server then
				network_manager.network_transmit:send_rpc_clients("rpc_status_change_bool", NetworkLookup.statuses.invisible, invisible, go_id, 0)
			else
				network_manager.network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.invisible, invisible, go_id, 0)
			end
		end
	end
end

GenericStatusExtension.set_move_through_ai = function (self, move_through_ai)
	self.move_through_ai = move_through_ai

	self:set_noclip(move_through_ai, "move_through_ai")
end

GenericStatusExtension.has_noclip = function (self)
	return not table.is_empty(self.noclip)
end

GenericStatusExtension.set_noclip = function (self, no_clip, reason)
	local had_noclip = self:has_noclip()
	self.noclip[reason] = no_clip or nil

	if had_noclip == self:has_noclip() then
		return
	end

	if not self.is_husk then
		self.locomotion_extension:set_mover_filter_property("enemy_noclip", no_clip)
	end
end

GenericStatusExtension.is_invisible = function (self)
	return not table.is_empty(self.invisible)
end

GenericStatusExtension.set_inspecting = function (self, inspecting)
	self.inspecting = inspecting
end

GenericStatusExtension.is_inspecting = function (self)
	return self.inspecting
end

GenericStatusExtension.set_overpowered = function (self, overpowered, overpowered_template, overpowered_attacking_unit)
	self.overpowered = overpowered
	self.overpowered_template = overpowered_template
	self.overpowered_attacking_unit = overpowered_attacking_unit

	self:set_outline_incapacitated(not self:is_dead() and self:is_disabled())
end

GenericStatusExtension.is_overpowered = function (self)
	return self.overpowered
end

GenericStatusExtension.is_overpowered_by_attacker = function (self)
	return self.overpowered_attacking_unit ~= self.unit
end

GenericStatusExtension.can_dodge = function (self, t)
	local buff_extension = self.buff_extension
	local rooted = buff_extension:has_buff_perk("root")

	return self.my_dodge_cd < t and not rooted
end

GenericStatusExtension.set_dodge_cd = function (self, t, dodge_cd)
	self.my_dodge_cd = t + dodge_cd
end

GenericStatusExtension.can_override_dodge_with_jump = function (self, t)
	return t < self.my_dodge_jump_override_t
end

GenericStatusExtension.set_dodge_jump_override_t = function (self, t, dodge_jump_override_t)
	self.my_dodge_jump_override_t = t + dodge_jump_override_t
end

GenericStatusExtension.dodge_locked = function (self)
	return self.dodge_is_locked
end

GenericStatusExtension.set_dodge_locked = function (self, dodge_locked)
	self.dodge_is_locked = dodge_locked
end

GenericStatusExtension.set_is_dodging = function (self, is_dodging)
	self.is_dodging = is_dodging

	if is_dodging then
		self.dodge_position:store(Unit.world_position(self.unit, 0))
	end

	if not self.is_husk then
		local go_id = Managers.state.unit_storage:go_id(self.unit)

		if self.is_server then
			Managers.state.network.network_transmit:send_rpc_clients("rpc_status_change_bool", NetworkLookup.statuses.dodging, is_dodging, go_id, 0)
		else
			Managers.state.network.network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.dodging, is_dodging, go_id, 0)
		end
	end
end

GenericStatusExtension.get_is_dodging = function (self)
	return self.is_dodging and self.dodge_cooldown <= self.dodge_count
end

GenericStatusExtension.get_dodge_position = function (self)
	return self.dodge_position:unbox()
end

GenericStatusExtension.get_is_slowed = function (self)
	return self.is_slowed
end

GenericStatusExtension.set_falling_height = function (self, override, override_height)
	fassert(not self.is_husk, "Trying to set falling height on non-owned unit")

	self.fall_height = override_height or self.fall_height and not override and POSITION_LOOKUP[self.unit].z < self.fall_height and self.fall_height or POSITION_LOOKUP[self.unit].z
	self.update_funcs.falling = GenericStatusExtension.update_falling
end

GenericStatusExtension.max_wounds_network_safe = function (self)
	local max_wounds = self:get_max_wounds()

	if max_wounds == math.huge then
		max_wounds = -1
	end

	return max_wounds
end

GenericStatusExtension.hot_join_sync = function (self, sender)
	local lookup = NetworkLookup.statuses
	local network_manager = Managers.state.network
	local self_game_object_id = network_manager:unit_game_object_id(self.unit)
	local channel_id = PEER_ID_TO_CHANNEL[sender]
	local flavour_unit_game_object_id = self.ready_for_assisted_respawn and network_manager:unit_game_object_id(self.assisted_respawn_flavour_unit) or 0

	RPC.rpc_hot_join_sync_health_status(channel_id, self_game_object_id, self:max_wounds_network_safe(), self.ready_for_assisted_respawn, flavour_unit_game_object_id)

	if self.pack_master_status then
		local t = Managers.time:time("game")
		local is_grabbed = Unit.alive(self.pack_master_grabber)
		local grabber_go_id = network_manager:unit_game_object_id(self.pack_master_grabber) or NetworkConstants.invalid_game_object_id
		local pack_master_status_id = lookup[self.pack_master_status]

		if self.pack_master_status == "pack_master_dropping" then
			local time_left = math.clamp(t - self.release_falling_time, 0, 7)

			RPC.rpc_hooked_sync(channel_id, pack_master_status_id, self_game_object_id, time_left)
		elseif self.pack_master_status == "pack_master_unhooked" then
			local time_left = math.clamp(t - self.release_unhook_time, 0, 7)

			RPC.rpc_hooked_sync(channel_id, pack_master_status_id, self_game_object_id, time_left)
		end

		RPC.rpc_status_change_bool(channel_id, pack_master_status_id, is_grabbed, self_game_object_id, grabber_go_id)
	end

	local ledge_hanging_unit_game_object_id = self.is_ledge_hanging and network_manager:unit_game_object_id(self.current_ledge_hanging_unit) or 0
	local pouncer_unit_game_object_id = self.pounced_down and network_manager:unit_game_object_id(self.pouncer_unit) or 0
	local current_ladder_unit_game_object_id = self.on_ladder and network_manager:unit_game_object_id(self.current_ladder_unit) or 0

	RPC.rpc_status_change_bool(channel_id, lookup.pounced_down, self.pounced_down, self_game_object_id, pouncer_unit_game_object_id)
	RPC.rpc_status_change_bool(channel_id, lookup.pushed, self.pushed, self_game_object_id, 0)
	RPC.rpc_status_change_bool(channel_id, lookup.charged, self.charged, self_game_object_id, 0)
	RPC.rpc_status_change_bool(channel_id, lookup.dead, self.dead, self_game_object_id, 0)

	local tentacle_grabber_go_id = network_manager:unit_game_object_id(self.grabbed_by_tentacle_unit) or NetworkConstants.invalid_game_object_id

	RPC.rpc_status_change_bool(channel_id, lookup.grabbed_by_tentacle, self.grabbed_by_tentacle, self_game_object_id, tentacle_grabber_go_id)

	if self.grabbed_by_tentacle_status and self.grabbed_by_tentacle_status ~= "grabbed" then
		local grabbed_substatus_id = NetworkLookup.grabbed_by_tentacle[self.grabbed_by_tentacle_status]

		RPC.rpc_status_change_int(channel_id, lookup.grabbed_by_tentacle, grabbed_substatus_id, self_game_object_id)
	end

	local chaos_spawn_grabber_go_id = network_manager:unit_game_object_id(self.grabbed_by_chaos_spawn_unit) or NetworkConstants.invalid_game_object_id

	RPC.rpc_status_change_bool(channel_id, lookup.grabbed_by_chaos_spawn, self.grabbed_by_chaos_spawn, self_game_object_id, chaos_spawn_grabber_go_id)

	if self.grabbed_by_chaos_spawn_status and self.grabbed_by_chaos_spawn_status ~= "grabbed" then
		local grabbed_substatus_id = NetworkLookup.grabbed_by_chaos_spawn[self.grabbed_by_chaos_spawn_status]

		RPC.rpc_status_change_int(channel_id, lookup.grabbed_by_chaos_spawn, grabbed_substatus_id, self_game_object_id)
	end

	local attacking_unit_id = self.overpowered and network_manager:unit_game_object_id(self.overpowered_attacking_unit) or NetworkConstants.invalid_game_object_id
	local status_int = self.overpowered and NetworkLookup.overpowered_templates[self.overpowered_template] or 0

	RPC.rpc_status_change_int_and_unit(channel_id, lookup.overpowered, status_int, self_game_object_id, attacking_unit_id)

	if self.knocked_down then
		local knocked_down_status_id = lookup.knocked_down

		RPC.rpc_status_change_bool(channel_id, knocked_down_status_id, true, self_game_object_id, 0)
	end

	local vortex_unit_id = self.in_vortex and network_manager:unit_game_object_id(self.in_vortex_unit) or NetworkConstants.invalid_game_object_id

	RPC.rpc_status_change_bool(channel_id, lookup.in_vortex, self.in_vortex, self_game_object_id, vortex_unit_id)
	RPC.rpc_status_change_bool(channel_id, lookup.crouching, self.crouching, self_game_object_id, 0)
	RPC.rpc_status_change_bool(channel_id, lookup.pulled_up, self.pulled_up, self_game_object_id, 0)
	RPC.rpc_status_change_bool(channel_id, lookup.ladder_climbing, self.on_ladder, self_game_object_id, current_ladder_unit_game_object_id)
	RPC.rpc_status_change_bool(channel_id, lookup.ledge_hanging, self.is_ledge_hanging, self_game_object_id, ledge_hanging_unit_game_object_id)
	RPC.rpc_status_change_bool(channel_id, lookup.in_end_zone, self.in_end_zone, self_game_object_id, 0)
end

GenericStatusExtension.set_in_end_zone = function (self, in_end_zone)
	if self.is_server and self.in_end_zone ~= in_end_zone then
		local go_id = Managers.state.unit_storage:go_id(self.unit)

		Managers.state.network.network_transmit:send_rpc_clients("rpc_status_change_bool", NetworkLookup.statuses.in_end_zone, in_end_zone, go_id, 0)
	end

	self.in_end_zone = in_end_zone
end

GenericStatusExtension.set_is_aiming = function (self, aiming)
	self.is_aiming = aiming
end

GenericStatusExtension.get_is_aiming = function (self)
	return self.is_aiming
end

GenericStatusExtension.is_in_end_zone = function (self)
	return self.in_end_zone
end

GenericStatusExtension.is_staggered = function (self)
	return false
end

GenericStatusExtension.breed_action = function (self)
	return self._current_action
end

GenericStatusExtension.should_climb = function (self)
	return false
end

GenericStatusExtension.get_max_wounds = function (self)
	local base_max_wounds = self._base_max_wounds
	local buff_extension = self.buff_extension

	return buff_extension:apply_buffs_to_value(base_max_wounds, "extra_wounds")
end
