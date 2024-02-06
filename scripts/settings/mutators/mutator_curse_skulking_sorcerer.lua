-- chunkname: @scripts/settings/mutators/mutator_curse_skulking_sorcerer.lua

local base_skulking_sorcerer = require("scripts/settings/mutators/mutator_skulking_sorcerer")
local curse_skulking_sorcerer = table.clone(base_skulking_sorcerer)
local NORMAL = 2
local HARD = 3
local HARDER = 4
local HARDEST = 5
local CATACLYSM = 6
local CATACLYSM_2 = 6
local CATACLYSM_3 = 7
local RESPAWN_TIME = {
	[NORMAL] = 30,
	[HARD] = 30,
	[HARDER] = 30,
	[HARDEST] = 30,
	[CATACLYSM] = 30,
}
local MAX_HEALTH = {
	[NORMAL] = 20,
	[HARD] = 30,
	[HARDER] = 44,
	[HARDEST] = 66,
	[CATACLYSM] = 90,
	[CATACLYSM_2] = 120,
	[CATACLYSM_3] = 150,
}

curse_skulking_sorcerer.display_name = "curse_skulking_sorcerer_name"
curse_skulking_sorcerer.description = "curse_skulking_sorcerer_desc"
curse_skulking_sorcerer.icon = "deus_curse_nurgle_01"

curse_skulking_sorcerer.server_initialize_function = function (context, data)
	MutatorUtils.store_breed_and_action_settings(context, data)

	Breeds.curse_mutator_sorcerer.max_health = MAX_HEALTH
end

curse_skulking_sorcerer.server_start_function = function (context, data)
	base_skulking_sorcerer.server_start_function(context, data)

	local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
	local respawn_time = RESPAWN_TIME[difficulty_rank] or RESPAWN_TIME[NORMAL]

	data.respawn_times = {
		respawn_time,
		respawn_time + 1,
	}
	data.breed_name = "curse_mutator_sorcerer"
end

curse_skulking_sorcerer.server_stop_function = function (context, data)
	MutatorUtils.restore_breed_and_action_settings(context, data)
end

curse_skulking_sorcerer.server_ai_killed_function = function (context, data, killed_unit, killer_unit, death_data)
	if death_data.breed.name == "curse_mutator_sorcerer" and HEALTH_ALIVE[killer_unit] then
		local killed_by_player = Managers.player:is_player_unit(killer_unit)

		if killed_by_player then
			local dialogue_input = ScriptUnit.extension_input(killer_unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()

			dialogue_input:trigger_dialogue_event("curse_positive_effect_happened", event_data)
		end
	end
end

return curse_skulking_sorcerer
