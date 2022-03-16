local base_splitting_enemies = require("scripts/settings/mutators/mutator_splitting_enemies")
local curse_change_of_tzeentch = table.clone(base_splitting_enemies)
curse_change_of_tzeentch.display_name = "curse_change_of_tzeentch_name"
curse_change_of_tzeentch.description = "curse_change_of_tzeentch_desc"
curse_change_of_tzeentch.icon = "deus_curse_tzeentch_01"
local SPLIT_CHANCE = 0.25

curse_change_of_tzeentch.server_start_function = function (context, data)
	base_splitting_enemies.server_start_function(context, data)

	data.seed = Managers.mechanism:get_level_seed("mutator")
end

curse_change_of_tzeentch.server_ai_killed_function = function (context, data, killed_unit, killer_unit, death_data, killing_blow)
	local random = nil
	data.seed, random = Math.next_random(data.seed)

	if SPLIT_CHANCE < random then
		return
	end

	base_splitting_enemies.server_ai_killed_function(context, data, killed_unit, killer_unit, death_data, killing_blow)
end

curse_change_of_tzeentch.on_split_enemy = function (killer_unit)
	local killed_by_player = ALIVE[killer_unit] and Managers.player:is_player_unit(killer_unit)

	if killed_by_player and ScriptUnit.extension(killer_unit, "health_system"):is_alive() then
		local dialogue_input = ScriptUnit.extension_input(killer_unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()

		dialogue_input:trigger_dialogue_event("curse_negative_effect_happened", event_data)
	end
end

return curse_change_of_tzeentch
