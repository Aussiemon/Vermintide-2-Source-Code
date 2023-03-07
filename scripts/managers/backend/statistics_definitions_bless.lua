local player = StatisticsDefinitions.player
local database_names = {
	"bless_heal_allies",
	"bless_fast_shield",
	"bless_book_run",
	"bless_saved_by_perk",
	"bless_unbreakable_damage_block",
	"bless_punch_back",
	"bless_cluch_revive",
	"bless_ranged_raki",
	"bless_chaos_warriors",
	"bless_very_righteous",
	"bless_smite_enemies",
	"bless_great_hammer_headshots",
	"bless_kill_specials_hammer_book",
	"bless_mighty_blow",
	"bless_block_attacks",
	"bless_righteous_stagger",
	"bless_charged_hammer",
	"bless_protected_killing"
}

for i = 1, #database_names do
	local name = database_names[i]
	player[name] = {
		value = 0,
		source = "player_data",
		database_name = name
	}
end
