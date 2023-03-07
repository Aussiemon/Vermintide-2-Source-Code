InGameChallengeTemplates = InGameChallengeTemplates or {}
InGameChallengeTemplates.kill_enemies = {
	default_target = 3,
	description = "challenge_description_kill_enemies_01",
	events = {
		on_player_killed_enemy = function (t, data, killing_blow, breed_killed, ai_unit)
			return 1
		end
	}
}
InGameChallengeTemplates.kill_elites = {
	default_target = 20,
	description = "challenge_description_kill_elites_01",
	events = {
		on_player_killed_enemy = function (t, data, killing_blow, breed_killed, ai_unit)
			if breed_killed.elite then
				return 1
			end
		end
	}
}
InGameChallengeTemplates.kill_specials = {
	default_target = 10,
	description = "challenge_description_kill_specials_01",
	events = {
		on_player_killed_enemy = function (t, data, killing_blow, breed_killed, ai_unit)
			if breed_killed.special then
				return 1
			end
		end
	}
}
InGameChallengeTemplates.kill_monsters = {
	default_target = 1,
	description = "challenge_description_kill_monsters_01",
	events = {
		on_player_killed_enemy = function (t, data, killing_blow, breed_killed, ai_unit)
			if breed_killed.boss then
				return 1
			end
		end
	}
}
InGameChallengeTemplates.find_tome = {
	default_target = 1,
	description = "challenge_description_find_tome_01",
	events = {
		player_pickup_tome = function (t, data, player)
			return 1
		end
	}
}
InGameChallengeTemplates.find_grimoire = {
	default_target = 1,
	description = "challenge_description_find_grimoire_01",
	events = {
		player_pickup_grimoire = function (t, data, player)
			return 1
		end
	}
}
InGameChallengeTemplates.kill_roamers = {
	default_target = 1,
	description = "challenge_description_kill_roamers_01",
	events = {
		on_player_killed_enemy = function (t, data, killing_blow, breed_killed, ai_unit)
			if not breed_killed.boss and not breed_killed.special and not breed_killed.elite then
				return 1
			end
		end
	}
}

for _, dlc in pairs(DLCSettings) do
	local ingame_challenge_templates = dlc.ingame_challenge_templates

	if ingame_challenge_templates then
		table.merge(InGameChallengeTemplates, ingame_challenge_templates)
	end
end
