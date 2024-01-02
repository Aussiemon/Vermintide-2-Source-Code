require("scripts/unit_extensions/weapons/area_damage/liquid/damage_wave_templates")

local wave_template = DamageWaveTemplates.templates.necromancer_curse_wave
ActionCareerBWNecromancerTargetting = class(ActionCareerBWNecromancerTargetting, ActionBase)
local FORWARD_OFFSET = 1
local HALF_WIDTH = 2
local HALF_HEIGHT = 0.5
local DEBUG_DRAW_TIME = 2.5
local DEBUG_DRAW_CD = 0.25

ActionCareerBWNecromancerTargetting.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerBWNecromancerTargetting.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self._ai_navigation_system = Managers.state.entity:system("ai_navigation_system")
	self._nav_world = Managers.state.entity:system("ai_system"):nav_world()
	self._inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self._talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	self._first_person_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")
	self._weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")
	local player = Managers.player:owner(owner_unit)
	self._local_player = player.local_player
	self._owner_unit = owner_unit
	self._has_valid_position = false
	self._last_valid_cast_direction = Vector3Box()
	self._last_valid_cast_position = Vector3Box()
	self._decal_unit = nil
	self._decal_unit_name = "units/decals/decal_arrow_kerillian"

	self._nav_callback = function ()
		local t = Managers.time:time("game")

		self:_update_targetting(t)
	end
end

ActionCareerBWNecromancerTargetting.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	action_init_data = action_init_data or {}

	ActionCareerBWNecromancerTargetting.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)

	self._round_career_ability = self._talent_extension:has_talent("sienna_necromancer_6_3")
	self._has_valid_position = false

	self._weapon_extension:set_mode(false)

	if self._local_player and not self._round_career_ability then
		local decal_unit_name = self._decal_unit_name
		local unit_spawner = Managers.state.unit_spawner
		self._decal_unit = unit_spawner:spawn_local_unit(decal_unit_name)
	end

	self._ai_navigation_system:add_safe_navigation_callback(self._nav_callback)
	self._first_person_extension:play_hud_sound_event("Play_career_necro_ability_withering_wave_target", nil, false)
end

ActionCareerBWNecromancerTargetting.client_owner_post_update = function (self, dt, t, world, can_damage, current_time_in_action)
	self._ai_navigation_system:add_safe_navigation_callback(self._nav_callback)
end

ActionCareerBWNecromancerTargetting._get_first_person_position_direction = function (self)
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

ActionCareerBWNecromancerTargetting._update_targetting = function (self, t)
	local above = 1
	local below = 2
	local nav_world = self._nav_world
	local _, fp_direction = self:_get_first_person_position_direction()
	local cast_direction = Vector3.normalize(Vector3.flat(fp_direction))

	if self._decal_unit then
		local player_rotation_flat = Quaternion.look(cast_direction, Vector3.up())

		Unit.set_local_position(self._decal_unit, 0, POSITION_LOOKUP[self._owner_unit])
		Unit.set_local_rotation(self._decal_unit, 0, player_rotation_flat)
	end

	if self._round_career_ability then
		local position = POSITION_LOOKUP[self.owner_unit]
		local nav_position = LocomotionUtils.pos_on_mesh(nav_world, position, above, below)

		if not nav_position then
			self._has_valid_position = false

			return
		end

		self._has_valid_position = true

		self._weapon_extension:set_mode(true)
		self._last_valid_cast_position:store(nav_position)
		self._last_valid_cast_direction:store(cast_direction)
	else
		local position = POSITION_LOOKUP[self.owner_unit] + cast_direction * FORWARD_OFFSET
		local nav_position = LocomotionUtils.pos_on_mesh(nav_world, position, above, below)

		if not nav_position then
			self._has_valid_position = false

			return
		end

		local length = (wave_template.max_speed + wave_template.start_speed * 0.5) * wave_template.time_of_life
		local half_length = length * 0.5
		self._has_valid_position = true

		self._weapon_extension:set_mode(true)
		self._last_valid_cast_position:store(nav_position)
		self._last_valid_cast_direction:store(cast_direction)
	end
end

ActionCareerBWNecromancerTargetting.finish = function (self, reason)
	if self._decal_unit then
		local unit_spawner = Managers.state.unit_spawner

		unit_spawner:mark_for_deletion(self._decal_unit)

		self._decal_unit = nil
	end

	if reason == "new_interupting_action" and self._has_valid_position then
		self._weapon_extension:set_mode(true)

		local targeting_data = {
			position = self._last_valid_cast_position,
			direction = self._last_valid_cast_direction
		}

		return targeting_data
	else
		self._inventory_extension:wield_previous_non_level_slot()
	end

	return nil
end
