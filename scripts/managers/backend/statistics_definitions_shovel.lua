-- chunkname: @scripts/managers/backend/statistics_definitions_shovel.lua

local player = StatisticsDefinitions.player
local database_names = {
	"shovel_sac_vent",
	"shovel_sac_low",
	"shovel_fast_generate",
	"shovel_command_elite",
	"shovel_skeleton_attack_big",
	"shovel_skeleton_defend",
	"shovel_many_skeletons",
	"shovel_melee_balefire",
	"shovel_fast_staff_attack",
	"shovel_staff_balefire",
	"shovel_big_suck",
	"shovel_big_cleave",
	"shovel_headshot_scythe",
	"shovel_staff_gandalf",
	"shovel_skeleton_balefire",
	"shovel_keep_skeletons_alive",
}

for i = 1, #database_names do
	local name = database_names[i]

	player[name] = {
		source = "player_data",
		value = 0,
		database_name = name,
	}
end
