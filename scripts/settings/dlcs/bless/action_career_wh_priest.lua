-- chunkname: @scripts/settings/dlcs/bless/action_career_wh_priest.lua

require("scripts/settings/profiles/career_constants")

local spell_params = {}
local spell_params_improved = {
	external_optional_duration = CareerConstants.wh_priest.talent_6_1_improved_ability_duration,
}
local spell_buffs = {
	"victor_priest_activated_ability_invincibility",
	"victor_priest_activated_ability_nuke",
	"victor_priest_activated_noclip",
}

ActionCareerWHPriestUtility = {}

ActionCareerWHPriestUtility.cast_spell = function (target_unit, warrior_priest_unit)
	ActionCareerWHPriestUtility._add_buffs_to_target(target_unit, warrior_priest_unit)

	local talent_extension = ScriptUnit.extension(warrior_priest_unit, "talent_system")

	if talent_extension:has_talent("victor_priest_4_2_new") then
		local career_extension = ScriptUnit.extension(warrior_priest_unit, "career_system")
		local career_passive = career_extension:get_passive_ability_by_name("wh_priest")

		career_passive:modify_resource_percent(CareerConstants.wh_priest.talent_4_2_fury_to_gain_percent)
	end

	if talent_extension:has_talent("victor_priest_6_2") then
		if target_unit ~= warrior_priest_unit then
			ActionCareerWHPriestUtility._add_buffs_to_target(warrior_priest_unit, warrior_priest_unit)
		else
			local side = Managers.state.side.side_by_unit[warrior_priest_unit]

			if not side then
				return
			end

			local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
			local num_units = #player_and_bot_units
			local current_min_dist = math.huge
			local current_target
			local owner_position = POSITION_LOOKUP[warrior_priest_unit]

			for i = 1, num_units do
				local unit = player_and_bot_units[i]

				if ALIVE[unit] and unit ~= warrior_priest_unit then
					local unit_position = POSITION_LOOKUP[unit]
					local dist_squared = Vector3.distance_squared(owner_position, unit_position)

					if dist_squared < current_min_dist then
						current_min_dist = dist_squared
						current_target = unit
					end
				end
			end

			ActionCareerWHPriestUtility._add_buffs_to_target(current_target, warrior_priest_unit)
		end
	end
end

ActionCareerWHPriestUtility._add_buffs_to_target = function (target_unit, warrior_priest_unit)
	local spell_buffs = spell_buffs
	local params = spell_params
	local talent_extension = ScriptUnit.extension(warrior_priest_unit, "talent_system")

	if talent_extension:has_talent("victor_priest_6_1") then
		params = spell_params_improved
	end

	params.attacker_unit = warrior_priest_unit

	if ALIVE[target_unit] then
		local buff_system = Managers.state.entity:system("buff_system")

		for i = 1, #spell_buffs do
			local buff_name = spell_buffs[i]

			buff_system:add_buff_synced(target_unit, buff_name, BuffSyncType.All, params)
		end
	end
end

ActionCareerWHPriest = class(ActionCareerWHPriest, ActionBase)

ActionCareerWHPriest.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerWHPriest.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.owner_unit = owner_unit
	self.career_extension = ScriptUnit.extension(owner_unit, "career_system")
	self.input_extension = ScriptUnit.extension(owner_unit, "input_system")
	self.inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self.status_extension = ScriptUnit.extension(owner_unit, "status_system")
	self.first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	self.talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	self.world = world
end

ActionCareerWHPriest.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	action_init_data = action_init_data or {}

	ActionCareerWHPriest.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)

	local spell_target = chain_action_data and chain_action_data.target

	if new_action.target_self and not self.is_bot then
		spell_target = self.owner_unit
	end

	if ALIVE[spell_target] then
		ActionCareerWHPriestUtility.cast_spell(spell_target, self.owner_unit)
		self.career_extension:start_activated_ability_cooldown()
		CharacterStateHelper.play_animation_event(self.owner_unit, "witch_hunter_active_ability")
		self:_play_vo()
	end
end

ActionCareerWHPriest.client_owner_post_update = function (self, dt, t, world, can_damage, current_time_in_action)
	return
end

ActionCareerWHPriest.finish = function (self, reason)
	ActionCareerWHPriest.super.finish(self, reason)
	self.inventory_extension:wield_previous_non_level_slot()
end

ActionCareerWHPriest._play_vo = function (self)
	local owner_unit = self.owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)

	local first_person_extension = self.first_person_extension
	local audio_event = "career_ability_priest_cast_t3"

	first_person_extension:play_hud_sound_event(audio_event)
	first_person_extension:play_remote_unit_sound_event(audio_event, owner_unit, 0)
end
