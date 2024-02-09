-- chunkname: @scripts/settings/dlcs/morris/morris_death_reactions.lua

local death_reactions = {
	destructible_buff_objective_unit = {
		unit = {
			pre_start = function (unit, context, t, killing_blow)
				return
			end,
			start = function (unit, context, t, killing_blow, is_server)
				Managers.state.game_mode:level_object_killed(unit, killing_blow)
				Unit.set_flow_variable(unit, "current_health", 0)
				Unit.flow_event(unit, "lua_on_death")
			end,
			update = function (unit, dt, context, t, data)
				Managers.state.unit_spawner:mark_for_deletion(unit)

				return DeathReactions.IS_DONE
			end,
		},
		husk = {
			pre_start = function (unit, context, t, killing_blow)
				Managers.state.game_mode:level_object_killed(unit, killing_blow)
				Unit.flow_event(unit, "lua_on_death")
			end,
			start = function (unit, context, t, killing_blow, is_server)
				return
			end,
			update = function (unit, dt, context, t, data)
				return DeathReactions.IS_DONE
			end,
		},
	},
	chaos_greed_pinata = table.clone(DeathReactions.templates.ai_default),
}

death_reactions.chaos_greed_pinata.unit.start = function (unit, context, t, killing_blow, is_server)
	local data, result = DeathReactions.templates.ai_default.unit.start(unit, context, t, killing_blow, is_server)

	if is_server then
		local dialogue_system = Managers.state.entity:system("dialogue_system")
		local player_unit = dialogue_system:get_random_player()

		if player_unit then
			local dialogue_input = ScriptUnit.extension_input(player_unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()

			dialogue_input:trigger_dialogue_event("curse_very_positive_effect_happened", event_data)
		end
	end

	return data, result
end

return death_reactions
