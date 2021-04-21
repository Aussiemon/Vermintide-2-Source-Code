return {
	description = "description_mutator_elite_run",
	icon = "mutator_icon_elite_run",
	display_name = "display_name_mutator_elite_run",
	roamer_override_lookup = {
		chaos_marauder_with_shield = "chaos_berzerker",
		beastmen_gor = "beastmen_bestigor",
		chaos_fanatic = "chaos_marauder",
		beastmen_ungor = "beastmen_gor",
		skaven_clan_rat_with_shield = "skaven_storm_vermin",
		skaven_clan_rat = "skaven_storm_vermin",
		chaos_marauder = "chaos_raider"
	},
	server_start_function = function (context, data)
		local roamer_override_lookup = data.template.roamer_override_lookup

		Managers.state.entity:system("ai_interest_point_system"):set_breed_override_lookup(roamer_override_lookup)
		Managers.state.conflict:set_breed_override_lookup(roamer_override_lookup)

		for breed, override_breed in pairs(roamer_override_lookup) do
			local threat_value = Breeds[breed].threat_value

			Managers.state.conflict:set_threat_value(override_breed, threat_value)
		end
	end,
	server_stop_function = function (context, data)
		local roamer_override_lookup = data.template.roamer_override_lookup

		for _, override_breed in pairs(roamer_override_lookup) do
			local threat_value = Breeds[override_breed].threat_value

			Managers.state.conflict:set_threat_value(override_breed, threat_value)
		end
	end
}
