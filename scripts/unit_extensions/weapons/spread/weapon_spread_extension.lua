-- chunkname: @scripts/unit_extensions/weapons/spread/weapon_spread_extension.lua

require("scripts/unit_extensions/weapons/spread/spread_templates")

WeaponSpreadExtension = class(WeaponSpreadExtension)

WeaponSpreadExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self.owner_unit = extension_init_data.owner_unit

	local item_name = extension_init_data.item_name

	self.item_name = item_name

	local item_data = ItemMasterList[item_name]
	local item_template = BackendUtils.get_item_template(item_data)

	self.default_spread_template_name = item_template.default_spread_template
	self.spread_lerp_speed_pitch = item_template.spread_lerp_speed_pitch or item_template.spread_lerp_speed or 4
	self.spread_lerp_speed_yaw = item_template.spread_lerp_speed_yaw or item_template.spread_lerp_speed or 4
	self.spread_lerp_speed_pitch_zoom = item_template.spread_lerp_speed_pitch_zoom or item_template.spread_lerp_speed_zoom or item_template.spread_lerp_speed or 4
	self.spread_lerp_speed_yaw_zoom = item_template.spread_lerp_speed_yaw_zoom or item_template.spread_lerp_speed_zoom or item_template.spread_lerp_speed or 4
	self.spread_settings = SpreadTemplates[self.default_spread_template_name]
	self.current_state = "still"
	self.current_yaw = 0
	self.current_pitch = 0
	self.shooting = false
	self.hit_aftermath = false
	self.hit_timer = 0
end

WeaponSpreadExtension.extensions_ready = function (self, world, unit)
	local owner_unit = self.owner_unit

	self.owner_health_extension = ScriptUnit.extension(owner_unit, "health_system")
	self.owner_status_extension = ScriptUnit.extension(owner_unit, "status_system")
	self.owner_buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self.owner_locomotion_extension = ScriptUnit.extension(owner_unit, "locomotion_system")
end

WeaponSpreadExtension.destroy = function (self)
	return
end

local ignored_damage_types = {
	buff = true,
	buff_shared_medpack = true,
	buff_shared_medpack_temp_health = true,
	heal = true,
	health_degen = true,
	life_drain = true,
	life_tap = true,
	temporary_health_degen = true,
	vomit_ground = true,
	warpfire_ground = true,
	wounded_dot = true,
}

WeaponSpreadExtension.update = function (self, unit, input, dt, context, t)
	local current_pitch = self.current_pitch
	local current_yaw = self.current_yaw
	local current_state = self.current_state
	local continuous_spread_settings = self.spread_settings.continuous
	local state_settings = continuous_spread_settings[current_state]
	local owner_buff_extension = self.owner_buff_extension
	local new_pitch = owner_buff_extension:apply_buffs_to_value(state_settings.max_pitch, "reduced_spread")
	local new_yaw = owner_buff_extension:apply_buffs_to_value(state_settings.max_yaw, "reduced_spread")
	local status_extension = self.owner_status_extension
	local locomotion_extension = self.owner_locomotion_extension
	local moving = CharacterStateHelper.is_moving(locomotion_extension)
	local crouching = CharacterStateHelper.is_crouching(status_extension)
	local zooming = CharacterStateHelper.is_zooming(status_extension)
	local new_state
	local lerp_speed_pitch = zooming and self.spread_lerp_speed_pitch_zoom or self.spread_lerp_speed_pitch
	local lerp_speed_yaw = zooming and self.spread_lerp_speed_yaw_zoom or self.spread_lerp_speed_yaw

	if self.hit_aftermath then
		self.hit_timer = self.hit_timer - dt

		local rand = Math.random(0.5, 1)

		lerp_speed_pitch = rand
		lerp_speed_yaw = rand

		if self.hit_timer <= 0 then
			self.hit_aftermath = false
		end
	end

	new_state = moving and (crouching and (zooming and "zoomed_crouch_moving" or "crouch_moving") or zooming and "zoomed_moving" or "moving") or crouching and (zooming and "zoomed_crouch_still" or "crouch_still") or zooming and "zoomed_still" or "still"

	if moving then
		new_pitch = owner_buff_extension:apply_buffs_to_value(new_pitch, "reduced_spread_moving")
		new_yaw = owner_buff_extension:apply_buffs_to_value(new_yaw, "reduced_spread_moving")
	end

	current_pitch = math.lerp(current_pitch, new_pitch, dt * lerp_speed_pitch)
	current_yaw = math.lerp(current_yaw, new_yaw, dt * lerp_speed_yaw)

	if current_state ~= new_state then
		self.current_state = new_state
	end

	local immediate_spread_settings = self.spread_settings.immediate
	local immediate_pitch = 0
	local immediate_yaw = 0
	local health_extension = self.owner_health_extension
	local recent_damage_type = health_extension:recently_damaged()
	local hit = recent_damage_type and not ignored_damage_types[recent_damage_type]

	if hit then
		local spread_settings = immediate_spread_settings.being_hit

		immediate_pitch = owner_buff_extension:apply_buffs_to_value(spread_settings.immediate_pitch, "reduced_spread_hit")
		immediate_yaw = owner_buff_extension:apply_buffs_to_value(spread_settings.immediate_yaw, "reduced_spread_hit")
		self.hit_aftermath = true
		self.hit_timer = 1.5
	end

	if self.shooting then
		local spread_settings = immediate_spread_settings.shooting

		immediate_pitch = owner_buff_extension:apply_buffs_to_value(spread_settings.immediate_pitch, "reduced_spread_shot")
		immediate_yaw = owner_buff_extension:apply_buffs_to_value(spread_settings.immediate_yaw, "reduced_spread_shot")
		self.shooting = false
	end

	current_pitch = current_pitch + immediate_pitch
	current_yaw = current_yaw + immediate_yaw
	self.current_pitch = math.min(current_pitch, SpreadTemplates.maximum_pitch)
	self.current_yaw = math.min(current_yaw, SpreadTemplates.maximum_yaw)
end

WeaponSpreadExtension.set_shooting = function (self)
	self.shooting = true
end

WeaponSpreadExtension.combine_spread_rotations = function (self, roll, pitch, current_rot)
	local roll_rot = Quaternion(Vector3.forward(), roll)
	local pitch_rot = Quaternion(Vector3.right(), pitch)
	local combined_rotation = Quaternion.multiply(current_rot, roll_rot)

	combined_rotation = Quaternion.multiply(combined_rotation, pitch_rot)

	return combined_rotation
end

WeaponSpreadExtension.get_max_pitch_rotation = function (self, roll_rotation)
	local current_pitch = self.current_pitch
	local current_yaw = self.current_yaw
	local x = current_yaw * math.cos(roll_rotation)
	local y = current_pitch * math.sin(roll_rotation)
	local length = Vector3.length(Vector3(x, y, 0))

	if length < 1e-05 then
		return 0
	end

	local max_pitch_rotation = current_pitch * current_yaw / length

	return math.degrees_to_radians(max_pitch_rotation)
end

WeaponSpreadExtension.get_current_pitch_and_yaw = function (self)
	return self.current_pitch, self.current_yaw
end

WeaponSpreadExtension.override_spread_template = function (self, spread_template_name)
	self.spread_settings = SpreadTemplates[spread_template_name]

	local current_state = self.current_state
	local continuous_spread_settings = self.spread_settings.continuous
	local state_settings = continuous_spread_settings[current_state]

	self.current_pitch = state_settings.max_pitch
	self.current_yaw = state_settings.max_yaw
end

WeaponSpreadExtension.reset_spread_template = function (self)
	self.spread_settings = SpreadTemplates[self.default_spread_template_name]
end

WeaponSpreadExtension.get_randomised_spread = function (self, current_rotation)
	local rand_roll_rotation = math.random() * math.pi * 2
	local pitch = math.random() * self:get_max_pitch_rotation(rand_roll_rotation)
	local final_rotation = self:combine_spread_rotations(rand_roll_rotation, pitch, current_rotation)

	return final_rotation
end

WeaponSpreadExtension.get_target_style_spread = function (self, original_current_shot, original_max_shots, current_rotation, num_layers_spread, bullseye, spread_pitch)
	if bullseye and original_current_shot == 1 then
		return current_rotation
	end

	local current_shot = bullseye and original_current_shot - 1 or original_current_shot
	local max_shots = bullseye and original_max_shots - 1 or original_max_shots
	local layers_of_shots = num_layers_spread or 1
	local shot_roll_current_angle = layers_of_shots * (current_shot / max_shots)
	local shot_roll_spread_modifier = layers_of_shots / max_shots
	local roll_modifier = (0.85 + 0.3 * math.random()) * shot_roll_spread_modifier * 2 + shot_roll_current_angle - shot_roll_spread_modifier
	local rand_roll_rotation = roll_modifier * (math.pi * 2)
	local max_pitch_rotation = self:get_max_pitch_rotation(rand_roll_rotation)
	local random_pitch_scale = math.sqrt(0.25 + 0.5 * math.random())

	if layers_of_shots == 2 and current_shot <= max_shots / layers_of_shots then
		random_pitch_scale = random_pitch_scale * ((spread_pitch or 0.8) / 2)
	else
		random_pitch_scale = random_pitch_scale * (spread_pitch or 0.8)
	end

	local rand_pitch_rotation = random_pitch_scale * max_pitch_rotation
	local final_rotation = self:combine_spread_rotations(rand_roll_rotation, rand_pitch_rotation, current_rotation)

	return final_rotation
end
