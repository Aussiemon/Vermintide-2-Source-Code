﻿-- chunkname: @scripts/unit_extensions/weapons/actions/action_interaction.lua

ActionInteraction = class(ActionInteraction, ActionBase)

ActionInteraction.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionInteraction.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.interactor_extension = ScriptUnit.extension(owner_unit, "interactor_system")
end

ActionInteraction.client_owner_start_action = function (self, new_action, t)
	ActionInteraction.super.client_owner_start_action(self, new_action, t)

	self.current_action = new_action

	local interaction_type = new_action.interaction_type

	self.interactor_extension:start_interaction(new_action.hold_input, nil, interaction_type)
end

ActionInteraction.client_owner_post_update = function (self, dt, t, world, can_damage)
	return
end

ActionInteraction.finish = function (self, reason)
	local player = Managers.player:unit_owner(self.owner_unit)
	local position = POSITION_LOOKUP[self.owner_unit]

	Managers.telemetry_events:player_used_item(player, self.item_name, position)
end
