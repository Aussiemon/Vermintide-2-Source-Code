-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/packmaster/packmaster_state_standing.lua

PackmasterStateStanding = class(PackmasterStateStanding, EnemyCharacterStateStanding)

PackmasterStateStanding.init = function (self, character_state_init_context)
	PackmasterStateStanding.super.init(self, character_state_init_context)

	self._grab_ability_id = self._career_extension:ability_id("grab")
	self._equip_ability_id = self._career_extension:ability_id("equip")

	local lh_weapon_unit, rh_weapon_unit = self._inventory_extension:get_all_weapon_unit()

	self._weapon_unit_left = lh_weapon_unit
	self._weapon_unit_right = rh_weapon_unit
end

PackmasterStateStanding.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	PackmasterStateStanding.super.on_enter(self, unit, input, dt, context, t, previous_state, params)

	self._right_wpn_particle_node_name = "g_skaven_packmaster_claw"
	self._right_wpn_particle_name = "fx/wpnfx_packmaster_enemy_in_range_1p"

	self:check_enemies_in_range_vfx()
end

PackmasterStateStanding.update = function (self, unit, input, dt, context, t)
	local handled = self:common_state_changes()

	if handled then
		return
	end

	self:check_enemies_in_range_vfx()

	local csm = self._csm
	local career_extension = self._career_extension

	if career_extension:ability_was_triggered(self._grab_ability_id) then
		csm:change_state("packmaster_grabbing")

		return
	end

	if career_extension:ability_was_triggered(self._equip_ability_id) then
		csm:change_state("packmaster_equipping")

		return
	end

	self:_update_taunt_dialogue(t)

	handled = self:common_movement(t)
end
