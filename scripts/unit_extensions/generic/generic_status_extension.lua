-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
GenericStatusExtension = class(GenericStatusExtension)
script_data.debug_draw_block_arcs = script_data.debug_draw_block_arcs or Development.parameter("debug_draw_block_arcs")
script_data.debug_draw_push_arcs = script_data.debug_draw_push_arcs or Development.parameter("debug_draw_push_arcs")
local DamageDataIndex = DamageDataIndex
local ATTACK_INTENSITY_RESET = 0.25
local ATTACK_INTENSITY_DECAY = 1
local ATTACK_INTENSITY_DECAY_FAST = 2
GenericStatusExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.world = extension_init_context.world
	self.profile_id = extension_init_data.profile_id

	fassert(self.profile_id)

	self.unit = unit
	self.intensity = 0
	self.intensity_decay_delay = 0
	self.move_speed_multiplier = 1
	self.move_speed_multiplier_timer = 1
	self.invisible = false
	self.crouching = false
	self.blocking = false
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
	self.dodge_count = 2
	self.combo_target_count = 0
	self.fatigue = 0
	self.last_fatigue_gain_time = 0
	self.show_fatigue_gui = false
	self.max_fatigue_points = 100
	self.next_hanging_damage_time = 0
	self.block_broken = false
	self.pushed = false
	self.push_cooldown = false
	self.push_cooldown_timer = false
	self.timed_block = nil
	self.interrupt_cooldown = false
	self.interrupt_cooldown_timer = nil
	self.attack_intensity = 0
	self.attack_allowed = true
	local difficulty_manager = Managers.state.difficulty
	local difficulty_settings = difficulty_manager.get_difficulty_settings(difficulty_manager)
	self.attack_intensity_threshold = difficulty_settings.attack_intensity_threshold or 3
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

	self.max_wounds = self.wounds
	self.poison_level = 0
	self.times_poisoned = 0
	self.is_server = Managers.player.is_server
	self.update_funcs = {}

	self.set_spawn_grace_time(self, 5)

	self.ready_for_assisted_respawn = false
	self.assisted_respawning = false
	self.player = extension_init_data.player
	self.in_end_zone = false
	self.is_husk = self.player.remote

	return 
end
GenericStatusExtension.extensions_ready = function (self)
	local unit = self.unit
	self.health_extension = ScriptUnit.extension(unit, "health_system")
	self.buff_extension = ScriptUnit.extension(unit, "buff_system")
	self.inventory_extension = ScriptUnit.extension(unit, "inventory_system")
	self.locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	if ScriptUnit.has_extension(unit, "first_person_system") and not self.locomotion_extension.is_bot then
		self.first_person_extension = ScriptUnit.extension(unit, "first_person_system")
		self.low_health_playing_id, self.low_health_source_id = self.first_person_extension:play_hud_sound_event("hud_low_health")
	end

	return 
end
GenericStatusExtension.destroy = function (self)
	local first_person_extension = self.first_person_extension

	if first_person_extension then
		first_person_extension.play_hud_sound_event(first_person_extension, "stop_hud_low_health")
	end

	return 
end
GenericStatusExtension.add_damage_intensity = function (self, percent_health_lost, damage_type)
	self.intensity = math.clamp(self.intensity + percent_health_lost*CurrentIntensitySettings.intensity_add_per_percent_dmg_taken*100, 0, 100)
	self.intensity_decay_delay = CurrentIntensitySettings.decay_delay

	return 
end
GenericStatusExtension.add_intensity = function (self, value)
	self.intensity = math.clamp(self.intensity + value, 0, 100)
	self.intensity_decay_delay = CurrentIntensitySettings.decay_delay

	return 
end
GenericStatusExtension.add_combo_target_count = function (self, value)
	self.combo_target_count = math.clamp(self.combo_target_count + value, 0, 5)

	return 
end
GenericStatusExtension.add_intensity_by_difficulty = function (self, intensity_table)
	local difficulty = Managers.state.difficulty:get_difficulty()
	local value = intensity_table[difficulty]

	if not value then
		return 
	end

	self.intensity = math.clamp(self.intensity + value, 0, 100)
	self.intensity_decay_delay = CurrentIntensitySettings.decay_delay

	return 
end
local intensity_ignored_damage_types = {
	temporary_health_degen = true,
	overcharge = true,
	wounded_dot = true,
	heal = true,
	knockdown_bleed = true
}
GenericStatusExtension.update = function (self, unit, input, dt, context, t)
	local health_extension = self.health_extension
	local damages, num_damages = health_extension.recent_damages(health_extension)

	if self.is_server then
		local stride = DamageDataIndex.STRIDE

		for i = 1, num_damages/stride, 1 do
			local index = (i - 1)*stride
			local damage_type = damages[index + DamageDataIndex.DAMAGE_TYPE]

			if not intensity_ignored_damage_types[damage_type] then
				local amount = damages[index + DamageDataIndex.DAMAGE_AMOUNT]
				local max_health = health_extension.get_max_health(health_extension)

				self.add_damage_intensity(self, amount/max_health, damage_type)
			end
		end

		if self.intensity_decay_delay <= 0 and not Managers.state.conflict:intensity_decay_frozen() then
			self.intensity = math.clamp(self.intensity - CurrentIntensitySettings.decay_per_second*dt, 0, CurrentIntensitySettings.max_intensity)
		end

		self.intensity_decay_delay = self.intensity_decay_delay - dt
	end

	local current_player_health = self.health_extension:current_health_percent()

	if 0 < self.attack_intensity then
		if self.attack_intensity_threshold < self.attack_intensity then
			self.attack_allowed = false
		elseif self.attack_intensity < ATTACK_INTENSITY_RESET then
			self.attack_allowed = true
		end

		local attack_intensity_decay = ATTACK_INTENSITY_DECAY
		local buff_extension = self.buff_extension

		if buff_extension.has_buff_type(buff_extension, "bardin_ironbreaker_activated_ability") or buff_extension.has_buff_type(buff_extension, "bardin_ironbreaker_activated_ability_duration") then
			attack_intensity_decay = ATTACK_INTENSITY_DECAY_FAST
		end

		self.attack_intensity = self.attack_intensity - dt*attack_intensity_decay*self.attack_intensity_threshold
	end

	if self.move_speed_multiplier_timer < 1 then
		local move_speed_timer_added_bonus = dt
		move_speed_timer_added_bonus = move_speed_timer_added_bonus*PlayerUnitStatusSettings.move_speed_reduction_on_hit_recover_time
		self.move_speed_multiplier_timer = self.move_speed_multiplier_timer + move_speed_timer_added_bonus
	end

	if 0 < num_damages then
		local slow_movement = false

		for i = 1, num_damages/DamageDataIndex.STRIDE, 1 do
			local damage_type = damages[(i - 1)*DamageDataIndex.STRIDE + DamageDataIndex.DAMAGE_TYPE]

			if PlayerUnitMovementSettings.slowing_damage_types[damage_type] then
				slow_movement = true

				break
			end
		end

		if slow_movement then
			self.move_speed_multiplier = self.current_move_speed_multiplier(self)*0.5
			self.move_speed_multiplier = math.max(0.2, self.move_speed_multiplier)
			self.move_speed_multiplier_timer = 0
		end
	end

	local player = self.player

	if not player.remote then
		local previous_max_fatigue_points = self.max_fatigue_points
		local max_fatigue_points = self._get_current_max_fatigue_points(self) or previous_max_fatigue_points
		local degen_delay = self.block_broken_degen_delay or self.push_degen_delay or PlayerUnitStatusSettings.FATIGUE_DEGEN_DELAY
		degen_delay = degen_delay/self.buff_extension:apply_buffs_to_value(1, StatBuffIndex.FATIGUE_REGEN)

		if previous_max_fatigue_points ~= max_fatigue_points then
			self.fatigue = (max_fatigue_points ~= 0 or 0) and previous_max_fatigue_points/max_fatigue_points*self.fatigue
		end

		if 0 < num_damages and 50 <= self.fatigue then
			if self.action_stun_push then
				self.action_stun_push = false
			else
				self.remove_fatigue_points(self, max_fatigue_points/100)
			end
		end

		if self.last_fatigue_gain_time + degen_delay <= t then
			self.action_stun_push = false
			self.show_fatigue_gui = false
			local degen_amount = (max_fatigue_points ~= 0 or 0) and PlayerUnitStatusSettings.FATIGUE_POINTS_DEGEN_AMOUNT/max_fatigue_points*PlayerUnitStatusSettings.MAX_FATIGUE
			local new_degen_amount = self.buff_extension:apply_buffs_to_value(degen_amount, StatBuffIndex.FATIGUE_REGEN)

			if degen_amount < new_degen_amount then
				self.has_bonus_fatigue_active = true
			elseif not self.bonus_fatigue_active_timer then
				self.has_bonus_fatigue_active = false
			end

			self.remove_fatigue_points(self, new_degen_amount*dt)

			self.block_broken_degen_delay = nil
			self.push_degen_delay = nil
		end

		if 0 < self.dodge_cooldown and self.dodge_cooldown_delay and self.dodge_cooldown_delay < t then
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
				self.interrupt_cooldown_timer = t + 1.5
			elseif self.interrupt_cooldown_timer < t then
				self.interrupt_cooldown = false
				self.interrupt_cooldown_timer = nil
			end
		end

		local first_person_extension = self.first_person_extension

		if first_person_extension and self.low_health_playing_id then
			local health = current_player_health*100
			local wwise_world = Managers.world:wwise_world(self.world)

			WwiseWorld.set_source_parameter(wwise_world, self.low_health_source_id, "health_status", health)
		end

		if self.shielded and not health_extension.has_assist_shield(health_extension) and health_extension.previous_shield_end_reason(health_extension) then
			self.set_shielded(self, false)
		end
	end

	if self.pack_master_status then
		if self.pack_master_status == "pack_master_hanging" then
			if self.is_server then
				if self.next_hanging_damage_time < t then
					local h = PlayerUnitStatusSettings.hanging_by_pack_master

					DamageUtils.add_damage_network(unit, unit, h.damage_amount, h.hit_zone_name, h.damage_type, Vector3.up(), "skaven_pack_master")

					self.next_hanging_damage_time = t + 1
				end

				if self.dead then
					StatusUtils.set_grabbed_by_pack_master_network("pack_master_dropping", unit, true, nil)
				end
			end
		elseif self.pack_master_status == "pack_master_dropping" then
			if self.release_falling_time and self.release_falling_time < t then
				local locomotion = ScriptUnit.extension(unit, "locomotion_system")

				locomotion.set_disabled(locomotion, false, nil, nil, true)

				if self.is_server then
					StatusUtils.set_grabbed_by_pack_master_network("pack_master_released", unit, false, nil)
				end

				self.release_falling_time = nil
			end
		elseif self.pack_master_status == "pack_master_unhooked" then
			if self.release_unhook_time and self.release_unhook_time < t then
				local locomotion = ScriptUnit.extension(unit, "locomotion_system")

				locomotion.set_disabled(locomotion, false, nil, nil, true)

				if self.is_server then
					StatusUtils.set_grabbed_by_pack_master_network("pack_master_released", unit, false, nil)
				end

				self.release_unhook_time = nil
			end
		elseif self.pack_master_status == "pack_master_released" then
			self.pack_master_status = nil
		end
	end

	local poison_level = math.min(PlayerUnitStatusSettings.poison_level_max, self.poison_level)

	if self.is_server and 0 < poison_level and self.poison_next_t < t then
		self.poison_next_t = t + PlayerUnitStatusSettings.poison_dot_time

		if Unit.alive(self.poison_attacker) then
			local damage = PlayerUnitStatusSettings.poison_dot_function(poison_level)

			DamageUtils.add_damage_network(unit, self.poison_attacker, damage, "full", "globadier_gas_dot", Vector3(1, 0, 0), "skaven_poison_wind_globadier")
		end
	end

	if 0 < poison_level then
		local wwise_world = Managers.world:wwise_world(self.world)

		if self.poison_time_to_cough < t then
			local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()

			dialogue_input.trigger_dialogue_event(dialogue_input, "hit_by_goo", event_data)

			self.poison_time_to_cough = t + 2
		end
	elseif self.poison_t then
		self.poison_next_t = nil
		self.poison_time_to_cough = nil
	end

	for id, func in pairs(self.update_funcs) do
		func(self, t)
	end

	if script_data.debug_draw_block_arcs then
		self._debug_draw_block_arcs(self, unit)
	end

	if script_data.debug_draw_push_arcs then
		self._debug_draw_push_arcs(self, unit)
	end

	return 
end
GenericStatusExtension._debug_draw_block_arcs = function (self, unit)
	local inventory_extension = self.inventory_extension
	local equipment = inventory_extension.equipment(inventory_extension)
	local weapon_template_name = equipment.wielded.template or equipment.wielded.temporary_template

	if weapon_template_name then
		local weapon_template = Weapons[weapon_template_name]
		local player = self.player

		if player then
			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
			local player_position = POSITION_LOOKUP[unit]
			local player_rotation = (first_person_extension and first_person_extension.current_rotation(first_person_extension)) or Unit.world_rotation(unit, 0)
			local player_direction = Vector3.normalize(Quaternion.forward(player_rotation))
			local player_direction_flat = Vector3.flat(player_direction)
			local buff_extension = self.buff_extension
			local block_angle = buff_extension.apply_buffs_to_value(buff_extension, weapon_template.block_angle or 90, StatBuffIndex.BLOCK_ANGLE)
			local outer_block_angle = buff_extension.apply_buffs_to_value(buff_extension, weapon_template.outer_block_angle or 360, StatBuffIndex.BLOCK_ANGLE)
			block_angle = math.clamp(block_angle, 0, 360)
			outer_block_angle = math.clamp(outer_block_angle, 0, 360)
			local block_half_angle = math.rad(block_angle*0.5)
			local outer_block_half_angle = math.rad(outer_block_angle*0.5)
			local color = Color(255, 255, 255)

			if self.is_blocking(self) then
				local block_color = self._debug_draw_color

				if block_color and not Color(unpack(block_color)) then
				end
			end

			local inner_left_direction = Quaternion.rotate(Quaternion(Vector3.up(), block_half_angle), player_direction_flat)
			local inner_right_direction = Quaternion.rotate(Quaternion(Vector3.up(), -block_half_angle), player_direction_flat)

			QuickDrawer:line(player_position + Vector3.up(), player_position + Vector3.normalize(inner_left_direction)*2 + Vector3.up(), color)
			QuickDrawer:line(player_position + Vector3.up(), player_position + Vector3.normalize(inner_right_direction)*2 + Vector3.up(), color)

			local outer_left_direction = Quaternion.rotate(Quaternion(Vector3.up(), outer_block_half_angle), player_direction_flat)
			local outer_right_direction = Quaternion.rotate(Quaternion(Vector3.up(), -outer_block_half_angle), player_direction_flat)

			QuickDrawer:line(player_position + Vector3.up(), player_position + Vector3.normalize(outer_left_direction)*2 + Vector3.up(), color)
			QuickDrawer:line(player_position + Vector3.up(), player_position + Vector3.normalize(outer_right_direction)*2 + Vector3.up(), color)
		end
	end

	return 
end
GenericStatusExtension._debug_draw_push_arcs = function (self, unit)
	local player = self.player
	local current_action = self._current_action

	if player and current_action then
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
		local player_position = POSITION_LOOKUP[unit]
		local player_rotation = (first_person_extension and first_person_extension.current_rotation(first_person_extension)) or Unit.world_rotation(unit, 0)
		local player_direction = Vector3.normalize(Quaternion.forward(player_rotation))
		local player_direction_flat = Vector3.flat(player_direction)
		local buff_extension = self.buff_extension
		local push_half_angle = math.rad(buff_extension.apply_buffs_to_value(buff_extension, current_action.push_angle or 90, StatBuffIndex.BLOCK_ANGLE)*0.5)
		local outer_push_half_angle = math.rad(buff_extension.apply_buffs_to_value(buff_extension, current_action.outer_push_angle or 360, StatBuffIndex.BLOCK_ANGLE)*0.5)
		local color = Color(255, 255, 255)
		local inner_left_direction = Quaternion.rotate(Quaternion(Vector3.up(), push_half_angle), player_direction_flat)
		local inner_right_direction = Quaternion.rotate(Quaternion(Vector3.up(), -push_half_angle), player_direction_flat)

		QuickDrawer:line(player_position + Vector3.up(), player_position + Vector3.normalize(inner_left_direction)*2 + Vector3.up(), color)
		QuickDrawer:line(player_position + Vector3.up(), player_position + Vector3.normalize(inner_right_direction)*2 + Vector3.up(), color)

		local outer_left_direction = Quaternion.rotate(Quaternion(Vector3.up(), outer_push_half_angle), player_direction_flat)
		local outer_right_direction = Quaternion.rotate(Quaternion(Vector3.up(), -outer_push_half_angle), player_direction_flat)

		QuickDrawer:line(player_position + Vector3.up(), player_position + Vector3.normalize(outer_left_direction)*2 + Vector3.up(), color)
		QuickDrawer:line(player_position + Vector3.up(), player_position + Vector3.normalize(outer_right_direction)*2 + Vector3.up(), color)
	end

	return 
end
GenericStatusExtension.set_spawn_grace_time = function (self, duration)
	local t = Managers.time:time("game")
	self.spawn_grace_time = t + duration
	self.spawn_grace = true
	self.update_funcs.spawn_grace_time = GenericStatusExtension.update_spawn_grace_time

	return 
end
GenericStatusExtension.update_spawn_grace_time = function (self, t)
	if self.spawn_grace_time < t then
		self.spawn_grace = false
		self.update_funcs.spawn_grace_time = nil
	end

	return 
end
GenericStatusExtension.fall_distance = function (self)
	if self.fall_height then
		local current_fall_height = POSITION_LOOKUP[self.unit].z
		local fall_distance = self.fall_height - current_fall_height

		return fall_distance
	end

	return 0
end
GenericStatusExtension.update_falling = function (self, t)
	if self.locomotion_extension:is_on_ground() and not self.on_ladder then
		local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(self.unit)
		local FALL_DAMAGE_MULTIPLIER = movement_settings_table.fall.heights.FALL_DAMAGE_MULTIPLIER
		local MIN_FALL_DAMAGE_HEIGHT = movement_settings_table.fall.heights.MIN_FALL_DAMAGE_HEIGHT
		local MIN_FALL_DAMAGE = movement_settings_table.fall.heights.MIN_FALL_DAMAGE
		local MAX_FALL_DAMAGE = movement_settings_table.fall.heights.MAX_FALL_DAMAGE
		local HARD_LANDING_FALL_HEIGHT = movement_settings_table.fall.heights.HARD_LANDING_FALL_HEIGHT
		local end_fall_height = POSITION_LOOKUP[self.unit].z
		local fall_distance = self.fall_height - end_fall_height
		local fall_event = "landed"

		if MIN_FALL_DAMAGE_HEIGHT < fall_distance then
			fall_distance = math.abs(fall_distance)

			if not global_is_inside_inn then
				local network_height = math.clamp(fall_distance*4, 0, 255)
				local network_manager = Managers.state.network
				local unit_storage = Managers.state.unit_storage
				local go_id = unit_storage.go_id(unit_storage, self.unit)

				network_manager.network_transmit:send_rpc_server("rpc_take_falling_damage", go_id, network_height)
			end

			fall_event = "landed_soft"

			if HARD_LANDING_FALL_HEIGHT <= fall_distance then
				fall_event = "landed_hard"
			end
		end

		if self.first_person_extension then
			self.first_person_extension:play_camera_effect_sequence(fall_event, t)
		end

		self.update_funcs.falling = nil
		self.fall_height = nil
	end

	return 
end
GenericStatusExtension._get_current_max_fatigue_points = function (self)
	local inventory_extension = self.inventory_extension
	local slot_name = inventory_extension.get_wielded_slot_name(inventory_extension)
	local slot_data = inventory_extension.get_slot_data(inventory_extension, slot_name)

	if slot_data then
		local item_data = slot_data.item_data
		local item_template = slot_data.item_template or BackendUtils.get_item_template(item_data)
		local max_fatigue_points = item_template.max_fatigue_points

		if max_fatigue_points then
			max_fatigue_points = self.buff_extension:apply_buffs_to_value(max_fatigue_points, StatBuffIndex.MAX_FATIGUE)
			local player = self.player
			local boon_handler = player.boon_handler

			if boon_handler then
				local num_bonus_fatigue_boons = boon_handler.get_num_boons(boon_handler, "bonus_fatigue")
				local boon_template = BoonTemplates.bonus_fatigue
				max_fatigue_points = max_fatigue_points + num_bonus_fatigue_boons*boon_template.fatigue_increase
			end
		end

		return max_fatigue_points
	end

	return 
end
GenericStatusExtension.can_block = function (self, attacking_unit, attack_direction)
	local unit = self.unit
	local inventory_extension = self.inventory_extension
	local equipment = inventory_extension.equipment(inventory_extension)
	local network_manager = Managers.state.network
	local weapon_template_name = equipment.wielded.template or equipment.wielded.temporary_template
	local weapon_template = Weapons[weapon_template_name]

	if not weapon_template_name then
		return false
	end

	local player = self.player

	if player then
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
		local player_position = POSITION_LOOKUP[unit]
		local player_rotation = (first_person_extension and first_person_extension.current_rotation(first_person_extension)) or Unit.world_rotation(unit, 0)
		local player_direction = Vector3.normalize(Quaternion.forward(player_rotation))
		local player_direction_flat = Vector3.flat(player_direction)
		local attacker_position = POSITION_LOOKUP[attacking_unit]
		local block_direction = Vector3.normalize(attacker_position - player_position)
		local block_direction_flat = Vector3.flat(block_direction)
		local buff_extension = self.buff_extension
		local block_angle = buff_extension.apply_buffs_to_value(buff_extension, weapon_template.block_angle or 90, StatBuffIndex.BLOCK_ANGLE)
		local outer_block_angle = buff_extension.apply_buffs_to_value(buff_extension, weapon_template.outer_block_angle or 360, StatBuffIndex.BLOCK_ANGLE)
		block_angle = math.clamp(block_angle, 0, 360)
		outer_block_angle = math.clamp(outer_block_angle, 0, 360)
		local block_half_angle = math.rad(block_angle*0.5)
		local outer_block_half_angle = math.rad(outer_block_angle*0.5)
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

		local fatigue_point_costs_multiplier = (outer_block and (weapon_template.outer_block_fatigue_point_multiplier or 2)) or weapon_template.block_fatigue_point_multiplier or 1
		local improved_block = block and not outer_block

		if not attack_direction then
			local cross = Vector3.cross(block_direction_flat, player_direction_flat)

			if cross.z < 0 then
				attack_direction = "left"
			else
				attack_direction = "right"
			end
		end

		return true, fatigue_point_costs_multiplier, improved_block, attack_direction
	end

	return 
end
GenericStatusExtension.blocked_attack = function (self, fatigue_type, attacking_unit, fatigue_point_costs_multiplier, improved_block, attack_direction)
	local unit = self.unit
	local inventory_extension = self.inventory_extension
	local equipment = inventory_extension.equipment(inventory_extension)
	local network_manager = Managers.state.network
	local blocking_unit = nil

	self.set_has_blocked(self, true)

	local player = self.player

	if player then
		if not player.remote then

			-- decompilation error in this vicinity
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
			local first_person_unit = first_person_extension.get_first_person_unit(first_person_extension)
			local t = Managers.time:time("game")
			local time_blocking = t - self.raise_block_time
			local timed_block = time_blocking <= 0.3

			Unit.animation_event(first_person_unit, parry_reaction)
		else
			blocking_unit = equipment.right_hand_wielded_unit_3p or equipment.left_hand_wielded_unit_3p

			self.add_fatigue_points(self, fatigue_type, attacking_unit, blocking_unit, fatigue_point_costs_multiplier)
			Unit.animation_event(unit, "parry_hit_reaction")
		end

		Managers.state.entity:system("play_go_tutorial_system"):register_block()
	end

	if blocking_unit then
		local unit_pos = POSITION_LOOKUP[blocking_unit]
		local unit_rot = Unit.world_rotation(blocking_unit, 0)
		local particle_position = unit_pos + Quaternion.up(unit_rot)*Math.random()*0.5 + Quaternion.right(unit_rot)*0.1

		World.create_particles(self.world, "fx/wpnfx_sword_spark_parry", particle_position)
	end

	return 
end
GenericStatusExtension.set_shielded = function (self, shielded)
	local unit = self.unit
	local player = self.player
	local t = Managers.time:time("game")

	if player.local_player then
		local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

		if shielded then
			first_person_extension.play_hud_sound_event(first_person_extension, "hud_player_buff_shield_activate")
			first_person_extension.create_screen_particles(first_person_extension, "fx/screenspace_shield_healed")
		else
			local health_extension = self.health_extension
			local shield_end_reason = health_extension.previous_shield_end_reason(health_extension)

			if shield_end_reason == "blocked_damage" then
				first_person_extension.play_hud_sound_event(first_person_extension, "hud_player_buff_shield_down")
			elseif shield_end_reason == "timed_out" then
				first_person_extension.play_hud_sound_event(first_person_extension, "hud_player_buff_shield_deactivate")
			end
		end
	end

	self.shielded = shielded

	return 
end
GenericStatusExtension.healed = function (self, reason)
	local unit = self.unit
	local player = self.player
	local t = Managers.time:time("game")

	if player.local_player then
		local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
		local first_person_unit = first_person_extension.get_first_person_unit(first_person_extension)

		Unit.flow_event(first_person_unit, "sfx_heal")

		local mood = HealingMoods[reason]

		if mood then
			MOOD_BLACKBOARD[mood] = true
		end
	else
		ScriptWorld.create_particles_linked(self.world, "fx/chr_player_fak_healed", unit, 0, "destroy")
	end

	return 
end
GenericStatusExtension.fatigued = function (self)
	local max_fatigue = PlayerUnitStatusSettings.MAX_FATIGUE
	local max_fatigue_points = self.max_fatigue_points

	return (max_fatigue_points == 0 and true) or max_fatigue - max_fatigue/max_fatigue_points < self.fatigue
end
GenericStatusExtension.add_fatigue_points = function (self, fatigue_type, attacking_unit, blocking_weapon_unit, fatigue_point_costs_multiplier)
	local buff_extension = self.buff_extension

	if Development.parameter("disable_fatigue_system") then
		return 
	end

	local amount = PlayerUnitStatusSettings.fatigue_point_costs[fatigue_type]
	local t = Managers.time:time("game")
	local max_fatigue = PlayerUnitStatusSettings.MAX_FATIGUE
	local max_fatigue_points = self.max_fatigue_points
	local fatigue_cost = amount*max_fatigue/max_fatigue_points*(fatigue_point_costs_multiplier or 1)

	if blocking_weapon_unit and self.timed_block and t < self.timed_block then
		fatigue_cost = buff_extension.apply_buffs_to_value(buff_extension, fatigue_cost, StatBuffIndex.TIMED_BLOCK_COST)
	end

	if amount and fatigue_point_costs_multiplier and amount < 2 and fatigue_point_costs_multiplier < 1 and buff_extension.has_buff_perk(buff_extension, "in_arc_block_cost_reduction") then
		fatigue_cost = 0
	end

	if blocking_weapon_unit then
		fatigue_cost = buff_extension.apply_buffs_to_value(buff_extension, fatigue_cost, StatBuffIndex.BLOCK_COST)
	end

	if buff_extension.has_buff_perk(buff_extension, "overcharged_block") then
		local overcharge_extension = ScriptUnit.has_extension(self.unit, "overcharge_system")

		if overcharge_extension and overcharge_extension.above_overcharge_threshold(overcharge_extension) then
			fatigue_cost = fatigue_cost*0.5

			overcharge_extension.remove_charge(overcharge_extension, amount)
		end
	end

	self.fatigue = math.clamp(self.fatigue + fatigue_cost, 0, max_fatigue)
	local current_fatigue = self.fatigue

	if blocking_weapon_unit then
		buff_extension.trigger_procs(buff_extension, "on_block", attacking_unit, fatigue_type, blocking_weapon_unit)
	end

	if self._block_breaking_fatigue_gain(self, fatigue_type, max_fatigue) then
		buff_extension.trigger_procs(buff_extension, "on_block_broken", attacking_unit, fatigue_type, blocking_weapon_unit)
	end

	local block_breaking = false

	if self._block_breaking_fatigue_gain(self, fatigue_type, max_fatigue) then
		self.set_block_broken(self, true)

		block_breaking = true
	end

	if 0 < fatigue_cost then
		self.last_fatigue_gain_time = t
		self.show_fatigue_gui = true
	end

	if fatigue_type == "action_stun_push" then
		self.action_stun_push = true
	end

	local first_person_extension = self.first_person_extension

	if PlayerUnitStatusSettings.fatigue_points_to_play_heavy_block_sfx < amount and first_person_extension then
		first_person_extension.play_hud_sound_event(first_person_extension, "Play_player_combat_heavy_block_sweetner", nil, false)
	end

	local fatigue_points_to_trigger_vo = PlayerUnitStatusSettings.fatigue_points_to_trigger_vo
	local fatigue = self.fatigue

	if fatigue_points_to_trigger_vo <= amount and max_fatigue <= fatigue then
		local player_profile = ScriptUnit.extension(self.unit, "dialogue_system").context.player_profile

		SurroundingAwareSystem.add_event(self.unit, "block_broken_by_heavy_hit", DialogueSettings.grabbed_broadcast_range, "profile_name", player_profile)
	end

	local position = POSITION_LOOKUP[self.unit]

	Managers.telemetry.events:fatigue_gained(self.player, position, fatigue_type, block_breaking)

	return 
end
GenericStatusExtension.remove_fatigue_points = function (self, amount)
	self.fatigue = math.max(self.fatigue - amount, 0)

	return 
end
GenericStatusExtension.get_dodge_item_data = function (self)
	local inventory_extension = self.inventory_extension
	local slot_name = inventory_extension.get_wielded_slot_name(inventory_extension)
	local slot_data = inventory_extension.get_slot_data(inventory_extension, slot_name)
	local dodge_count = nil

	if slot_data then
		local item_data = slot_data.item_data
		local item_template = slot_data.item_template or BackendUtils.get_item_template(item_data)
		dodge_count = item_template.dodge_count
	end

	self.dodge_count = dodge_count or 2

	return 
end
GenericStatusExtension.add_dodge_cooldown = function (self)
	self.get_dodge_item_data(self)

	self.dodge_cooldown = math.min(self.dodge_cooldown + 1, self.dodge_count + 3)
	self.dodge_cooldown_delay = nil

	return 
end
GenericStatusExtension.start_dodge_cooldown = function (self, t)
	self.dodge_cooldown_delay = t + 0.5

	return 
end
GenericStatusExtension.get_dodge_cooldown = function (self)
	local buff_extension = ScriptUnit.extension(self.unit, "buff_system")
	local cooldown = (math.max(self.dodge_cooldown - self.dodge_count, 0)/3 - 1)*0.6 + 0.4

	return (buff_extension.has_buff_type(buff_extension, "passive_career_we_2") and 1) or cooldown
end
GenericStatusExtension._block_breaking_fatigue_gain = function (self, fatigue_type, max_fatigue)
	return max_fatigue <= self.fatigue and self._block_breaking_fatigue_type(self, fatigue_type)
end
GenericStatusExtension._block_breaking_fatigue_type = function (self, fatigue_type)
	return fatigue_type == "blocked_attack" or fatigue_type == "sv_shove" or fatigue_type == "complete" or fatigue_type == "blocked_ranged" or fatigue_type == "blocked_running" or fatigue_type == "blocked_sv_cleave" or fatigue_type == "blocked_sv_sweep" or fatigue_type == "sv_push" or fatigue_type == "chaos_cleave" or fatigue_type == "blocked_berzerker" or fatigue_type == "chaos_spawn_combo"
end
GenericStatusExtension.current_fatigue = function (self)
	return self.fatigue
end
GenericStatusExtension.current_fatigue_points = function (self)
	local max_fatigue = PlayerUnitStatusSettings.MAX_FATIGUE
	local max_fatigue_points = self.max_fatigue_points

	return (max_fatigue_points ~= 0 or 0) and math.ceil(self.fatigue/max_fatigue/max_fatigue_points), max_fatigue_points
end
GenericStatusExtension.set_pushed = function (self, pushed)
	if pushed and self.push_cooldown then
		return 
	elseif pushed then
		self.pushed = pushed
		self.push_cooldown = true
	else
		self.pushed = pushed
	end

	return 
end
GenericStatusExtension.set_pushed_no_cooldown = function (self, pushed)
	self.pushed = pushed

	return 
end
GenericStatusExtension.set_hit_react_type = function (self, hit_react_type)
	self._hit_react_type = hit_react_type

	return 
end
GenericStatusExtension.hitreact_interrupt = function (self)
	if self.interrupt_cooldown then
		return false
	else
		self.interrupt_cooldown = true

		return true
	end

	return 
end
GenericStatusExtension.want_an_attack = function (self)
	return self.attack_allowed
end
GenericStatusExtension.add_attack_intensity = function (self, attack_intensity, clamp_override)
	self.attack_intensity = math.clamp(self.attack_intensity + attack_intensity, 0, clamp_override or 10)

	if self.attack_intensity_threshold < self.attack_intensity then
		self.attack_allowed = false
	end

	return 
end
GenericStatusExtension.is_pushed = function (self)
	return self.pushed and not self.overcharge_exploding
end
GenericStatusExtension.hit_react_type = function (self)
	return self._hit_react_type or "light"
end
GenericStatusExtension.set_block_broken = function (self, block_broken)
	self.block_broken = block_broken

	if block_broken then
		self.block_broken_degen_delay = 0
	end

	return 
end
GenericStatusExtension.set_has_pushed = function (self, degen_delay)
	local buff_extension = self.buff_extension

	if not buff_extension.has_buff_perk(buff_extension, "slayer_stamina") then
		self.push_degen_delay = degen_delay or 3
	end

	return 
end
GenericStatusExtension.set_has_blocked = function (self, has_blocked)
	self._has_blocked = has_blocked

	return 
end
GenericStatusExtension.set_pounced_down = function (self, pounced_down, pouncer_unit)
	local unit = self.unit
	local locomotion = ScriptUnit.extension(unit, "locomotion_system")
	self.pounced_down = pounced_down

	if pounced_down then
		self.pouncer_unit = pouncer_unit
		local foe_rotation = Unit.local_rotation(pouncer_unit, 0)
		local foe_forward = Quaternion.forward(foe_rotation)
		local towards_foe_rotation = Quaternion.look(-foe_forward, Vector3.up())

		Unit.set_local_rotation(unit, 0, towards_foe_rotation)
		Unit.set_local_rotation(pouncer_unit, 0, towards_foe_rotation)

		if not self.is_husk then
			locomotion.set_wanted_velocity(locomotion, Vector3.zero())
		end

		locomotion.set_disabled(locomotion, true, LocomotionUtils.update_local_animation_driven_movement_with_parent, pouncer_unit)
	else
		locomotion.set_disabled(locomotion, false, LocomotionUtils.update_local_animation_driven_movement_with_parent)

		self.pouncer_unit = nil
	end

	self.set_outline_incapacitated(self, pounced_down or self.is_disabled(self), pouncer_unit, true)

	if pounced_down then
		SurroundingAwareSystem.add_event(unit, "pounced_down", DialogueSettings.pounced_down_broadcast_range, "target", unit, "target_name", ScriptUnit.extension(unit, "dialogue_system").context.player_profile)

		local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()
		event_data.distance = DialogueSettings.pounced_down_broadcast_range
		event_data.target = unit
		event_data.target_name = ScriptUnit.extension(unit, "dialogue_system").context.player_profile

		dialogue_input.trigger_dialogue_event(dialogue_input, "pounced_down", event_data)
		Managers.music:trigger_event("enemy_gutter_runner_pounced_stinger")
	end

	if self.is_server then
		local go_id = Managers.state.unit_storage:go_id(self.unit)
		local enemy_go_id = Managers.state.unit_storage:go_id(pouncer_unit)

		Managers.state.network.network_transmit:send_rpc_clients("rpc_status_change_bool", NetworkLookup.statuses.pounced_down, pounced_down, go_id, enemy_go_id)
	end

	return 
end
GenericStatusExtension.set_crouching = function (self, crouching)
	self.crouching = crouching

	self.set_slowed(self, crouching)

	local player = self.player

	if player and not player.remote then
		local go_id = Managers.state.unit_storage:go_id(self.unit)

		if self.is_server then
			Managers.state.network.network_transmit:send_rpc_clients("rpc_status_change_bool", NetworkLookup.statuses.crouching, crouching, go_id, 0)
		else
			Managers.state.network.network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.crouching, crouching, go_id, 0)
		end
	end

	return 
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

	self.set_outline_incapacitated(self, knocked_down)

	if knocked_down then
		SurroundingAwareSystem.add_event(unit, "knocked_down", DialogueSettings.knocked_down_broadcast_range, "target", unit, "target_name", ScriptUnit.extension(unit, "dialogue_system").context.player_profile)

		local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()
		event_data.distance = 0
		event_data.height_distance = 0
		event_data.target_name = ScriptUnit.extension(unit, "dialogue_system").context.player_profile

		dialogue_input.trigger_dialogue_event(dialogue_input, "knocked_down", event_data)

		local position = POSITION_LOOKUP[unit]
		local nearby_units = {}
		local num_nearby_units = AiUtils.broadphase_query(position, DialogueSettings.knocked_down_broadcast_range, nearby_units)

		for i = 1, num_nearby_units, 1 do
			local nearby_unit = nearby_units[i]
			local nearby_unit_dialogue_extension = ScriptUnit.has_extension(nearby_unit, "dialogue_system")

			if nearby_unit_dialogue_extension then
				local nearby_unit_dialogue_input = nearby_unit_dialogue_extension.input

				nearby_unit_dialogue_input.trigger_dialogue_event(nearby_unit_dialogue_input, "knocked_down", event_data)
			end
		end

		if is_server then
			self.knocked_down_bleed_id = buff_extension.add_buff(buff_extension, "knockdown_bleed")
		end

		if player.local_player then
			MOOD_BLACKBOARD.knocked_down = true
		end

		buff_extension.trigger_procs(buff_extension, "on_knocked_down")
	else
		health_extension.reset(health_extension)

		if is_server and self.knocked_down_bleed_id then
			buff_extension.remove_buff(buff_extension, self.knocked_down_bleed_id)

			self.knocked_down_bleed_id = nil
		end

		if player.local_player then
			MOOD_BLACKBOARD.knocked_down = false
		end
	end

	if knocked_down then
		if is_server then
			if script_data.debug_player_intensity then
				Managers.state.conflict.pacing:annotate_graph("knockdown", "red")
			end

			self.add_intensity(self, CurrentIntensitySettings.intensity_add_knockdown)
		end

		local kill_damages, num_kill_damages = health_extension.recent_damages(health_extension)

		pack_index[DamageDataIndex.STRIDE](biggest_hit, 1, unpack_index[DamageDataIndex.STRIDE](kill_damages, 1))

		if player then
			local local_player = player.local_player
			local is_bot = player.bot_player

			if (is_bot and self.is_server) or local_player then
				local damage_type = biggest_hit[DamageDataIndex.DAMAGE_TYPE]
				local position = POSITION_LOOKUP[unit]

				Managers.telemetry.events:player_knocked_down(player, damage_type, position)
			end
		end
	end

	Managers.music:check_last_man_standing_music_state(player)

	return 
end
GenericStatusExtension.set_ready_for_assisted_respawn = function (self, ready, flavour_unit)
	local previously_ready = self.ready_for_assisted_respawn
	self.ready_for_assisted_respawn = ready
	self.assisted_respawn_flavour_unit = flavour_unit
	local unit = self.unit
	local player = self.player
	local outline_extension = ScriptUnit.extension(unit, "outline_system")
	local method_name, color_name = nil

	if player and player.local_player then
		outline_extension.set_method("never")
	else
		outline_extension.set_method_player_setting("within_distance")
		outline_extension.set_distance("revive")
		outline_extension.set_outline_color("ally")
	end

	return 
end
GenericStatusExtension.set_assisted_respawning = function (self, respawning, helper_unit)
	self.assisted_respawning = respawning
	self.assisted_respawn_helper_unit = helper_unit

	return 
end
GenericStatusExtension.is_assisted_respawning = function (self)
	return self.assisted_respawning
end
GenericStatusExtension.get_assisted_respawn_helper_unit = function (self)
	return self.assisted_respawn_helper_unit
end
GenericStatusExtension.set_respawned = function (self, respawned)
	local unit = self.unit

	if respawned then
		self.set_ready_for_assisted_respawn(self, false)
		Managers.music:check_last_man_standing_music_state(self.player)
	end

	return 
end
GenericStatusExtension.set_dead = function (self, dead)
	local player = self.player

	if dead and ScriptUnit.has_extension(self.unit, "outline_system") then
		local outline_extension = ScriptUnit.extension(self.unit, "outline_system")

		if player and player.local_player then
			outline_extension.set_method("never")
		else
			outline_extension.set_method_player_setting("never")
		end
	end

	if dead and player and not player.remote then
		local inventory_extension = self.inventory_extension

		CharacterStateHelper.stop_weapon_actions(inventory_extension, "dead")
	end

	self.dead = dead

	return 
end
GenericStatusExtension.set_blocking = function (self, blocking)
	self.blocking = blocking

	if blocking then
		local t = Managers.time:time("game")
		self.raise_block_time = t
	end

	return 
end
GenericStatusExtension.set_slowed = function (self, slowed)
	self.is_slowed = slowed

	return 
end
GenericStatusExtension.set_wounded = function (self, wounded, reason, t)
	if wounded then
		self.wounds = self.wounds - 1
	elseif reason == "healed" then
		self.wounds = self.max_wounds
	end

	local unit = self.unit

	if self.player.local_player then
		MOOD_BLACKBOARD.wounded = self.wounds == 1

		if not MOOD_BLACKBOARD.wounded then
			MOOD_BLACKBOARD.bleeding_out = wounded
		else
			MOOD_BLACKBOARD.bleeding_out = false
		end
	end

	return 
end
GenericStatusExtension.set_pulled_up = function (self, pulled_up, helper)
	if self.is_ledge_hanging then
		self.pulled_up = pulled_up

		if pulled_up then
			local dialogue_input = ScriptUnit.extension_input(self.unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()
			event_data.reviver = helper
			event_data.reviver_name = ScriptUnit.extension(helper, "dialogue_system").context.player_profile

			dialogue_input.trigger_dialogue_event(dialogue_input, "revive_completed", event_data)
		end
	elseif not pulled_up then
		self.pulled_up = pulled_up
	end

	return 
end
GenericStatusExtension.set_revived = function (self, revived, reviver)
	self.revived = revived
	local unit = self.unit

	if revived then
		local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()
		event_data.reviver = reviver
		event_data.reviver_name = ScriptUnit.extension(reviver, "dialogue_system").context.player_profile

		dialogue_input.trigger_dialogue_event(dialogue_input, "revive_completed", event_data)

		local revived_buff_extension = ScriptUnit.extension(unit, "buff_system")

		revived_buff_extension.trigger_procs(revived_buff_extension, "on_revived", reviver)

		local reviver_buff_extension = ScriptUnit.extension(reviver, "buff_system")

		reviver_buff_extension.trigger_procs(reviver_buff_extension, "on_revived_ally", unit)
	end

	return 
end
GenericStatusExtension.set_zooming = function (self, zooming, camera_name)
	self.zooming = zooming

	self.set_slowed(self, zooming)

	local unit = self.unit
	local player = self.player
	local camera_follow_unit = player.camera_follow_unit
	local buff_extension = ScriptUnit.extension(unit, "buff_system")

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

	return 
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
				new_index = i%#zoom_table + 1

				break
			end
		end

		local new_camera_name = zoom_table[new_index]

		Unit.set_data(camera_follow_unit, "camera", "settings_node", new_camera_name)

		self.zoom_mode = new_camera_name
	end

	return 
end
GenericStatusExtension.set_grabbed_by_tentacle = function (self, grabbed, tentacle_unit)
	self.grabbed_by_tentacle = grabbed
	self.grabbed_by_tentacle_unit = tentacle_unit
	self.grabbed_by_tentacle_status = (grabbed and "grabbed") or nil

	return 
end
GenericStatusExtension.set_grabbed_by_tentacle_status = function (self, status)
	self.grabbed_by_tentacle_status = status

	return 
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

	return 
end
GenericStatusExtension.set_grabbed_by_chaos_spawn_status = function (self, status)
	self.grabbed_by_chaos_spawn_status = status
	self.grabbed_by_chaos_spawn_status_count = self.grabbed_by_chaos_spawn_status_count + 1

	return 
end
GenericStatusExtension.set_in_vortex = function (self, in_vortex, vortex_unit)
	self.in_vortex = in_vortex
	self.in_vortex_unit = (in_vortex and vortex_unit) or nil

	return 
end
GenericStatusExtension.set_near_vortex = function (self, near_vortex, vortex_unit)
	self.near_vortex = near_vortex
	self.near_vortex_unit = (near_vortex and vortex_unit) or nil

	return 
end
GenericStatusExtension.set_in_liquid = function (self, in_liquid, liquid_unit)
	self.in_liquid = in_liquid
	self.in_liquid_unit = (in_liquid and liquid_unit) or nil

	return 
end
GenericStatusExtension.set_catapulted = function (self, catapulted, velocity)
	local unit = self.unit

	if catapulted then
		if not self.is_disabled(self) then
			self.catapulted = true
			self.last_catapulted_time = Managers.time:time("game")

			if not self.is_husk then
				self.catapulted_velocity = Vector3Box(velocity)
				local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
				local dir = Vector3.dot(Quaternion.forward(first_person_extension.current_rotation(first_person_extension)), velocity)
				local look_dir, catapulted_direction = nil

				if 0 < dir then
					look_dir = Vector3.normalize(velocity)
					catapulted_direction = "forward"
				else
					look_dir = Vector3.normalize(-velocity)
					catapulted_direction = "backward"
				end

				self.catapulted_direction = catapulted_direction
				local rot = Quaternion.look(look_dir, Vector3.up())

				first_person_extension.force_look_rotation(first_person_extension, rot)
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

	return 
end
GenericStatusExtension.set_inside_transport_unit = function (self, unit)
	self.inside_transport_unit = unit

	return 
end
GenericStatusExtension.set_using_transport = function (self, using_transport)
	self.using_transport = using_transport

	return 
end
GenericStatusExtension.set_overcharge_exploding = function (self, overcharge_exploding)
	self.overcharge_exploding = overcharge_exploding

	return 
end
GenericStatusExtension.set_left_ladder = function (self, t)
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(self.unit)
	self.left_ladder_timer = t + movement_settings_table.ladder.leave_ladder_reattach_time

	return 
end
GenericStatusExtension.set_is_on_ladder = function (self, is_on_ladder, ladder_unit)
	self.on_ladder = is_on_ladder
	self.current_ladder_unit = ladder_unit

	return 
end
GenericStatusExtension.set_is_ledge_hanging = function (self, is_ledge_hanging, ledge_unit)
	self.is_ledge_hanging = is_ledge_hanging
	self.current_ledge_hanging_unit = ledge_unit
	local unit = self.unit

	if not is_ledge_hanging then
		self.pulled_up = false
	end

	self.set_outline_incapacitated(self, is_ledge_hanging)

	if is_ledge_hanging then
		SurroundingAwareSystem.add_event(unit, "ledge_hanging", DialogueSettings.grabbed_broadcast_range, "target", unit, "target_name", ScriptUnit.extension(unit, "dialogue_system").context.player_profile)

		local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()
		event_data.target_name = ScriptUnit.extension(unit, "dialogue_system").context.player_profile

		dialogue_input.trigger_dialogue_event(dialogue_input, "ledge_hanging", event_data)
	end

	return 
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

	return 
end
GenericStatusExtension.set_outline_incapacitated = function (self, incapacitated, disabler_unit, outline_disabler_unit)
	local unit = self.unit
	local player = self.player

	if not player then
		return 
	end

	if not player.local_player then
		local outline_extension = ScriptUnit.extension(unit, "outline_system")
		local color_name = (incapacitated and "knocked_down") or "ally"
		local method_name = (incapacitated and "within_distance") or "outside_distance_or_not_visible"
		local range = (incapacitated and "revive") or "player_husk"

		outline_extension.set_outline_color(color_name)
		outline_extension.set_method_player_setting(method_name)
		outline_extension.set_distance(range)

		if disabler_unit then
			outline_extension = ScriptUnit.extension(disabler_unit, "outline_system")

			outline_extension.set_outline_color("knocked_down")
			outline_extension.set_method((incapacitated and outline_disabler_unit and "always") or "never")
		end
	end

	return 
end
GenericStatusExtension._set_packmaster_unhooked = function (self, locomotion, grabbed_status)
	local unit = self.unit
	local t = Managers.time:time("game")

	if self.release_unhook_time then
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
		locomotion.set_wanted_velocity(locomotion, Vector3.zero())
		locomotion.move_to_non_intersecting_position(locomotion)
	end

	self.pack_master_status = "pack_master_unhooked"

	return 
end
GenericStatusExtension.set_pack_master = function (self, grabbed_status, is_grabbed, grabber_unit)
	local unit = self.unit
	self.pack_master_grabber = (is_grabbed and grabber_unit) or nil
	local previous_status = self.pack_master_status
	self.pack_master_status = grabbed_status
	local locomotion = ScriptUnit.extension(unit, "locomotion_system")
	local outline_grabbed_unit = grabbed_status ~= "pack_master_hanging"

	self.set_outline_incapacitated(self, is_grabbed or self.is_disabled(self), grabber_unit, outline_grabbed_unit)

	if grabbed_status == "pack_master_pulling" then
		if not is_grabbed then
			self._set_packmaster_unhooked(self, locomotion, grabbed_status)

			return 
		end

		self.release_unhook_time = nil
		local foe_rotation = Unit.local_rotation(grabber_unit, 0)
		local foe_forward = Quaternion.forward(foe_rotation)
		local back_to_grabber_rotation = Quaternion.look(foe_forward, Vector3.up())

		Unit.set_local_rotation(unit, 0, back_to_grabber_rotation)

		if not self.is_husk then
			locomotion.set_wanted_velocity(locomotion, Vector3.zero())
		end

		local target_player = self.player
		local unit_name = SPProfiles[self.profile_id].unit_name
		local pulled_anim_name = "attack_grab_" .. unit_name

		Unit.animation_event(grabber_unit, pulled_anim_name)
		SurroundingAwareSystem.add_event(unit, "grabbed", DialogueSettings.grabbed_broadcast_range, "target", unit, "target_name", ScriptUnit.extension(unit, "dialogue_system").context.player_profile)
		Managers.music:trigger_event("enemy_pack_master_grabbed_stinger")

		self.pack_master_hoisted = false
	elseif grabbed_status == "pack_master_dragging" then
		if not is_grabbed then
			self._set_packmaster_unhooked(self, locomotion, grabbed_status)

			return 
		end

		if previous_status == "pack_master_pulling" then
			locomotion.set_disabled(locomotion, false, nil, nil, true)
		else
			Unit.animation_event(grabber_unit, "drag_walk")
			Unit.animation_event(unit, "move_bwd")
		end
	elseif grabbed_status == "pack_master_unhooked" then
		if previous_status ~= "pack_master_unhooked" then
			self._set_packmaster_unhooked(self, locomotion, grabbed_status)
		end

		locomotion.set_disabled(locomotion, false, nil, nil, true)
	elseif grabbed_status == "pack_master_hoisting" then
		if not is_grabbed then
			self._set_packmaster_unhooked(self, locomotion, grabbed_status)

			return 
		end

		if not self.is_husk then
			locomotion.set_wanted_velocity(locomotion, Vector3.zero())
		end

		local dir = Vector3.normalize(POSITION_LOOKUP[unit] - POSITION_LOOKUP[grabber_unit])

		Unit.set_local_rotation(unit, 0, Quaternion.look(dir, Vector3.up()))
		Unit.animation_event(unit, "packmaster_hang_start")
		locomotion.set_disabled(locomotion, true, LocomotionUtils.update_local_animation_driven_movement_plus_mover)
		Unit.animation_event(grabber_unit, "attack_grab_hang")

		self.pack_master_hoisted = true
	elseif grabbed_status == "pack_master_hanging" then
		locomotion.set_disabled(locomotion, true, LocomotionUtils.update_local_animation_driven_movement_plus_mover)
	elseif grabbed_status == "pack_master_dropping" then
		local t = Managers.time:time("game")

		locomotion.set_disabled(locomotion, false, nil, nil, true)

		if self.release_falling_time then
		elseif self.dead then
			self.release_falling_time = t + PlayerUnitStatusSettings.hanging_by_pack_master.release_falling_time_dead
		elseif self.knocked_down then
			self.release_falling_time = t + PlayerUnitStatusSettings.hanging_by_pack_master.release_falling_time_ko
		else
			locomotion.set_disabled(locomotion, false, nil, nil, true)

			self.release_falling_time = t + PlayerUnitStatusSettings.hanging_by_pack_master.release_falling_time
		end
	elseif grabbed_status == "pack_master_released" then
		SurroundingAwareSystem.add_event(unit, "un_grabbed", DialogueSettings.grabbed_broadcast_range, "target", unit, "target_name", ScriptUnit.extension(unit, "dialogue_system").context.player_profile)

		if not Managers.state.network.is_server then
			locomotion.set_disabled(locomotion, false, nil, nil, true)
		end
	end

	return 
end
GenericStatusExtension.set_grabbed_by_corruptor = function (self, grabbed_status, is_grabbed, grabber_unit)
	local unit = self.unit
	self.corruptor_grabbed = (is_grabbed and grabber_unit) or nil
	self.grabbed_by_corruptor = is_grabbed
	self.corruptor_unit = grabber_unit
	local previous_status = self.corruptor_status
	self.corruptor_status = grabbed_status
	local locomotion = ScriptUnit.extension(unit, "locomotion_system")

	self.set_outline_incapacitated(self, is_grabbed or self.is_disabled(self), grabber_unit, is_grabbed)

	if grabbed_status == "chaos_corruptor_grabbed" then
		Unit.animation_event(unit, "to_corruptor")

		if not self.is_husk then
			locomotion.set_wanted_velocity(locomotion, Vector3.zero())
		end

		SurroundingAwareSystem.add_event(unit, "grabbed", DialogueSettings.grabbed_broadcast_range, "target", unit, "target_name", ScriptUnit.extension(unit, "dialogue_system").context.player_profile)
		Managers.music:trigger_event("enemy_pack_master_grabbed_stinger")
	elseif grabbed_status == "chaos_corruptor_released" then
		if not self.is_husk then
			locomotion.set_wanted_velocity(locomotion, Vector3.zero())
			locomotion.move_to_non_intersecting_position(locomotion)
		end

		SurroundingAwareSystem.add_event(unit, "un_grabbed", DialogueSettings.grabbed_broadcast_range, "target", unit, "target_name", ScriptUnit.extension(unit, "dialogue_system").context.player_profile)
	end

	return 
end
GenericStatusExtension.get_intensity = function (self)
	return self.intensity
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
GenericStatusExtension.is_grabbed_by_corruptor = function (self)
	return self.grabbed_by_corruptor
end
GenericStatusExtension.set_knocked_down_bleed_buff = function (self, stop_bleed)
	local buff_extension = self.buff_extension or ScriptUnit.extension(self.unit, "buff_system")

	if self.knocked_down_bleed_id and stop_bleed then
		buff_extension.remove_buff(buff_extension, self.knocked_down_bleed_id)

		self.knocked_down_bleed_id = nil
	elseif self.knocked_down and not stop_bleed then
		self.knocked_down_bleed_id = buff_extension.add_buff(buff_extension, "knockdown_bleed")
	end

	return self.knocked_down_bleed_id
end
GenericStatusExtension.is_ready_for_assisted_respawn = function (self)
	return self.ready_for_assisted_respawn
end
GenericStatusExtension.disabled_vo_reason = function (self)
	local vo_reason = nil

	if self.is_dead(self) then
		vo_reason = "dead"
	elseif self.is_pounced_down(self) then
		vo_reason = "pounced_down"
	elseif self.is_grabbed_by_pack_master(self) or self.is_hanging_from_hook(self) then
		vo_reason = "grabbed"
	elseif self.get_is_ledge_hanging(self) then
		vo_reason = "ledge_hanging"
	elseif self.is_knocked_down(self) or self.is_ready_for_assisted_respawn(self) then
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
		first_person_extension.play_hud_sound_event(first_person_extension, "hud_player_buff_regen_stamina")
	end

	return 
end
GenericStatusExtension.get_disabler_unit = function (self)
	local disabler_unit = self.grabbed_by_tentacle_unit or self.pouncer_unit or self.grabbed_by_chaos_spawn_unit or self.pack_master_grabber or self.corruptor_unit

	if Unit.alive(disabler_unit) then
		return disabler_unit
	end

	return 
end
GenericStatusExtension.is_disabled = function (self)
	return self.is_dead(self) or self.is_pounced_down(self) or self.is_knocked_down(self) or self.is_grabbed_by_pack_master(self) or self.get_is_ledge_hanging(self) or self.is_hanging_from_hook(self) or self.is_ready_for_assisted_respawn(self) or self.is_grabbed_by_tentacle(self) or self.is_grabbed_by_chaos_spawn(self) or self.is_in_vortex(self) or self.grabbed_by_corruptor or self.is_overpowered(self)
end
GenericStatusExtension.is_valid_vortex_target = function (self)
	return not self.is_dead(self) and not self.is_pounced_down(self) and not self.is_knocked_down(self) and not self.is_grabbed_by_pack_master(self) and not self.get_is_ledge_hanging(self) and not self.is_hanging_from_hook(self) and not self.is_ready_for_assisted_respawn(self) and not self.is_grabbed_by_tentacle(self) and not self.is_grabbed_by_chaos_spawn(self) and not self.is_in_end_zone(self)
end
GenericStatusExtension.is_ogre_target = function (self)
	return not self.is_dead(self) and not self.is_pounced_down(self) and not self.is_grabbed_by_pack_master(self) and not self.is_hanging_from_hook(self) and not self.is_using_transport(self) and not self.is_grabbed_by_tentacle(self) and not self.is_grabbed_by_chaos_spawn(self)
end
GenericStatusExtension.is_chaos_spawn_target = function (self)
	return not self.is_dead(self) and not self.is_pounced_down(self) and not self.is_grabbed_by_pack_master(self) and not self.is_hanging_from_hook(self) and not self.is_using_transport(self) and not self.is_grabbed_by_tentacle(self) and not self.is_grabbed_by_chaos_spawn(self)
end
GenericStatusExtension.is_available_for_career_revive = function (self)
	return self.is_knocked_down(self) and not self.is_pounced_down(self) and not self.is_grabbed_by_pack_master(self) and not self.is_hanging_from_hook(self) and not self.is_grabbed_by_tentacle(self) and not self.is_grabbed_by_chaos_spawn(self)
end
GenericStatusExtension.is_grabbed_by_tentacle = function (self)
	return self.grabbed_by_tentacle
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
	return self.blocking
end
GenericStatusExtension.is_wounded = function (self)
	return self.wounds < self.max_wounds
end
GenericStatusExtension.is_permanent_heal = function (self, heal_type)
	return heal_type == "healing_draught" or heal_type == "bandage" or heal_type == "bandage_trinket" or heal_type == "buff_shared_medpack" or heal_type == "career_passive" or heal_type == "debug"
end
GenericStatusExtension.heal_can_remove_wounded = function (self, heal_type)
	return heal_type == "healing_draught" or heal_type == "bandage" or heal_type == "bandage_trinket" or heal_type == "buff_shared_medpack" or heal_type == "debug"
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
GenericStatusExtension.has_wounds_remaining = function (self)
	return 1 < self.wounds
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
GenericStatusExtension.current_move_speed_multiplier = function (self)
	local lerp_t = math.smoothstep(self.move_speed_multiplier_timer, 0, 1)

	return math.lerp(self.move_speed_multiplier, 1, lerp_t)
end
GenericStatusExtension.set_invisible = function (self, invisible)
	self.invisible = invisible
	local unit = self.unit
	local flow_event_name = nil
	local player = self.player
	local owner_player = Managers.player:owner(unit)

	if invisible then
		flow_event_name = "lua_enabled_invisibility"

		if self.is_husk and not player == owner_player then
			Managers.state.entity:system("fade_system"):set_min_fade(unit, 0.8)
		end
	else
		flow_event_name = "lua_disabled_invisibility"

		if self.is_husk and not player == owner_player then
			Managers.state.entity:system("fade_system"):set_min_fade(unit, 0)
		end
	end

	local first_person_extension = self.first_person_extension

	if first_person_extension then
		local fp_unit = first_person_extension.get_first_person_unit(first_person_extension)
		local fp_mesh_unit = first_person_extension.get_first_person_mesh_unit(first_person_extension)

		Unit.flow_event(fp_unit, flow_event_name)
		Unit.flow_event(fp_mesh_unit, flow_event_name)
	end

	if self.is_husk and not player == owner_player then
		Unit.flow_event(unit, flow_event_name)
	end

	if not self.is_husk then
		local go_id = Managers.state.unit_storage:go_id(unit)

		if self.is_server then
			Managers.state.network.network_transmit:send_rpc_clients("rpc_status_change_bool", NetworkLookup.statuses.invisible, invisible, go_id, 0)
		else
			Managers.state.network.network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.invisible, invisible, go_id, 0)
		end
	end

	return 
end
GenericStatusExtension.set_noclip = function (self, no_clip)
	if not self.is_husk then
		self.locomotion_extension:set_mover_filter_property("enemy_noclip", no_clip)
	end

	return 
end
GenericStatusExtension.is_invisible = function (self)
	return self.invisible
end
GenericStatusExtension.set_inspecting = function (self, inspecting)
	self.inspecting = inspecting

	return 
end
GenericStatusExtension.is_inspecting = function (self)
	return self.inspecting
end
GenericStatusExtension.set_overpowered = function (self, overpowered, overpowered_template, overpowered_attacking_unit)
	self.set_outline_incapacitated(self, overpowered)

	self.overpowered = overpowered
	self.overpowered_template = overpowered_template
	self.overpowered_attacking_unit = overpowered_attacking_unit

	return 
end
GenericStatusExtension.is_overpowered = function (self)
	return self.overpowered
end
GenericStatusExtension.can_dodge = function (self, t)
	return self.my_dodge_cd < t
end
GenericStatusExtension.set_dodge_cd = function (self, t, dodge_cd)
	self.my_dodge_cd = t + dodge_cd

	return 
end
GenericStatusExtension.can_override_dodge_with_jump = function (self, t)
	return t < self.my_dodge_jump_override_t
end
GenericStatusExtension.set_dodge_jump_override_t = function (self, t, dodge_jump_override_t)
	self.my_dodge_jump_override_t = t + dodge_jump_override_t

	return 
end
GenericStatusExtension.dodge_locked = function (self)
	return self.dodge_is_locked
end
GenericStatusExtension.set_dodge_locked = function (self, dodge_locked)
	self.dodge_is_locked = dodge_locked

	return 
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

	return 
end
GenericStatusExtension.get_is_dodging = function (self)
	return self.is_dodging
end
GenericStatusExtension.get_dodge_position = function (self)
	return self.dodge_position:unbox()
end
GenericStatusExtension.get_is_slowed = function (self)
	return self.is_slowed
end
GenericStatusExtension.set_falling_height = function (self, override, override_height)
	self.fall_height = override_height or (self.fall_height and not override and POSITION_LOOKUP[self.unit].z < self.fall_height and self.fall_height) or POSITION_LOOKUP[self.unit].z
	self.update_funcs.falling = GenericStatusExtension.update_falling

	return 
end
GenericStatusExtension.modify_poison = function (self, increase, attacker_unit)
	local poison_level_old = self.poison_level

	if increase then
		self.poison_attacker = attacker_unit
		self.poison_level = poison_level_old + 1

		if poison_level_old == 0 then
			self.poison_next_t = 0
			self.poison_time_to_cough = 0

			if self.first_person_extension then
				local buff_extension = ScriptUnit.extension(self.unit, "buff_system")

				if buff_extension.has_buff_type(buff_extension, "poison_screen_effect_immune") then
					return 
				end

				local particle_id = World.create_particles(self.world, "fx/screenspace_poison_globe_impact", Vector3(0, 0, 0))
				self.poison_particle_id = particle_id
			end
		end
	else
		self.poison_level = poison_level_old - 1

		assert(0 <= self.poison_level, "Poison level became negative")

		if poison_level_old == 1 and self.poison_particle_id then
			World.stop_spawning_particles(self.world, self.poison_particle_id)

			self.poison_particle_id = nil
			self.times_poisoned = self.times_poisoned + 1

			SurroundingAwareSystem.add_event(self.unit, "was_hit_by_goo", DialogueSettings.grabbed_broadcast_range, "target_name", ScriptUnit.extension(self.unit, "dialogue_system").context.player_profile, "times_poisoned", self.times_poisoned)
		end
	end

	return 
end
GenericStatusExtension.max_wounds_network_safe = function (self)
	local max_wounds = self.max_wounds

	if max_wounds == math.huge then
		max_wounds = -1
	end

	return max_wounds
end
GenericStatusExtension.hot_join_sync = function (self, sender)
	local lookup = NetworkLookup.statuses
	local network_manager = Managers.state.network
	local self_game_object_id = network_manager.unit_game_object_id(network_manager, self.unit)
	local flavour_unit_game_object_id = (self.ready_for_assisted_respawn and network_manager.unit_game_object_id(network_manager, self.assisted_respawn_flavour_unit)) or 0

	RPC.rpc_hot_join_sync_health_status(sender, self_game_object_id, self.max_wounds_network_safe(self), self.ready_for_assisted_respawn, flavour_unit_game_object_id)

	if self.pack_master_status then
		local t = Managers.time:time("game")
		local is_grabbed = Unit.alive(self.pack_master_grabber)
		local grabber_go_id = network_manager.unit_game_object_id(network_manager, self.pack_master_grabber) or NetworkConstants.invalid_game_object_id
		local pack_master_status_id = lookup[self.pack_master_status]

		if self.pack_master_status == "pack_master_dropping" then
			local time_left = math.clamp(t - self.release_falling_time, 0, 7)

			RPC.rpc_hooked_sync(sender, pack_master_status_id, self_game_object_id, time_left)
		elseif self.pack_master_status == "pack_master_unhooked" then
			local time_left = math.clamp(t - self.release_unhook_time, 0, 7)

			RPC.rpc_hooked_sync(sender, pack_master_status_id, self_game_object_id, time_left)
		end

		RPC.rpc_status_change_bool(sender, pack_master_status_id, is_grabbed, self_game_object_id, grabber_go_id)
	end

	ledge_hanging_unit_game_object_id = (self.is_ledge_hanging and network_manager.unit_game_object_id(network_manager, self.current_ledge_hanging_unit)) or 0
	local pouncer_unit_game_object_id = (self.pounced_down and network_manager.unit_game_object_id(network_manager, self.pouncer_unit)) or 0
	local current_ladder_unit_game_object_id = (self.on_ladder and network_manager.unit_game_object_id(network_manager, self.current_ladder_unit)) or 0

	RPC.rpc_status_change_bool(sender, lookup.pounced_down, self.pounced_down, self_game_object_id, pouncer_unit_game_object_id)
	RPC.rpc_status_change_bool(sender, lookup.pushed, self.pushed, self_game_object_id, 0)
	RPC.rpc_status_change_bool(sender, lookup.dead, self.dead, self_game_object_id, 0)

	local tentacle_grabber_go_id = network_manager.unit_game_object_id(network_manager, self.grabbed_by_tentacle_unit) or NetworkConstants.invalid_game_object_id

	RPC.rpc_status_change_bool(sender, lookup.grabbed_by_tentacle, self.grabbed_by_tentacle, self_game_object_id, tentacle_grabber_go_id)

	if self.grabbed_by_tentacle_status and self.grabbed_by_tentacle_status ~= "grabbed" then
		local grabbed_substatus_id = NetworkLookup.grabbed_by_tentacle[self.grabbed_by_tentacle_status]

		RPC.rpc_status_change_int(sender, lookup.grabbed_by_tentacle, grabbed_substatus_id, self_game_object_id)
	end

	chaos_spawn_grabber_go_id = network_manager.unit_game_object_id(network_manager, self.grabbed_by_chaos_spawn_unit) or NetworkConstants.invalid_game_object_id

	RPC.rpc_status_change_bool(sender, lookup.grabbed_by_chaos_spawn, self.grabbed_by_chaos_spawn, self_game_object_id, chaos_spawn_grabber_go_id)

	if self.grabbed_by_chaos_spawn_status and self.grabbed_by_chaos_spawn_status ~= "grabbed" then
		local grabbed_substatus_id = NetworkLookup.grabbed_by_chaos_spawn[self.grabbed_by_chaos_spawn_status]

		RPC.rpc_status_change_int(sender, lookup.grabbed_by_chaos_spawn, grabbed_substatus_id, self_game_object_id)
	end

	attacking_unit_id = (self.overpowered and network_manager.unit_game_object_id(network_manager, self.overpowered_attacking_unit)) or NetworkConstants.invalid_game_object_id
	local status_int = (self.overpowered and NetworkLookup.overpowered_templates[self.overpowered_template]) or 0

	RPC.rpc_status_change_int_and_unit(sender, lookup.overpowered, status_int, self_game_object_id, attacking_unit_id)

	if self.knocked_down then
		local knocked_down_status_id = lookup.knocked_down

		RPC.rpc_status_change_bool(sender, knocked_down_status_id, true, self_game_object_id, 0)
	end

	vortex_unit_id = (self.in_vortex and network_manager.unit_game_object_id(network_manager, self.in_vortex_unit)) or NetworkConstants.invalid_game_object_id

	RPC.rpc_status_change_bool(sender, lookup.in_vortex, self.in_vortex, self_game_object_id, vortex_unit_id)
	RPC.rpc_status_change_bool(sender, lookup.crouching, self.crouching, self_game_object_id, 0)
	RPC.rpc_status_change_bool(sender, lookup.pulled_up, self.pulled_up, self_game_object_id, 0)
	RPC.rpc_status_change_bool(sender, lookup.ladder_climbing, self.on_ladder, self_game_object_id, current_ladder_unit_game_object_id)
	RPC.rpc_status_change_bool(sender, lookup.ledge_hanging, self.is_ledge_hanging, self_game_object_id, ledge_hanging_unit_game_object_id)

	return 
end
GenericStatusExtension.set_in_end_zone = function (self, in_end_zone)
	if self.is_server then
		local go_id = Managers.state.unit_storage:go_id(self.unit)

		Managers.state.network.network_transmit:send_rpc_clients("rpc_status_change_bool", NetworkLookup.statuses.in_end_zone, in_end_zone, go_id, 0)
	end

	self.in_end_zone = in_end_zone

	return 
end
GenericStatusExtension.is_in_end_zone = function (self)
	return self.in_end_zone
end

return 
