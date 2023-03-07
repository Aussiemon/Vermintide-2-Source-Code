local dlc_settings = DLCSettings.belakor
local REAL_PLAYER_LOCAL_ID = 1
dlc_settings.ingame_challenge_templates = {}
dlc_settings.challenge_categories = {
	"deus_mutator"
}
dlc_settings.ingame_challenge_rewards = {
	deus_power_up_quest_test_reward_01 = {
		reward_id = "deus_power_up_quest_test_reward_01",
		sound = "Play_hud_grail_knight_stamina",
		consume_value = 1,
		type = "deus_power_up",
		consume_type = "round",
		target = "owner",
		granted_power_up_name = "deus_power_up_quest_granted_test_01",
		granted_power_up_rarity = "exotic",
		icon = "icon_objective_cdr"
	}
}
dlc_settings.ingame_challenge_reward_types = {
	deus_power_up = function (reward_data, target_units, reward_instigator)
		local mechanism = Managers.mechanism:game_mechanism()
		local run_controller = mechanism:get_deus_run_controller()

		if not run_controller then
			return
		end

		local granted_power_up_name = reward_data.granted_power_up_name
		local granted_power_up_rarity = reward_data.granted_power_up_rarity
		local new_power_up = run_controller:grant_party_power_up(granted_power_up_name, granted_power_up_rarity)
		local human_players = Managers.player:human_players()
		local buff_system = Managers.state.entity:system("buff_system")
		local talent_interface = Managers.backend:get_talents_interface()
		local deus_backend = Managers.backend:get_interface("deus")

		for unique_id, player in pairs(human_players) do
			local peer_id, local_player_id = PlayerUtils.split_unique_player_id(reward_instigator)
			local player_unit = player.player_unit
			local profile_index, career_index = run_controller:get_player_profile(peer_id, local_player_id)

			DeusPowerUpUtils.activate_deus_power_up(new_power_up, buff_system, talent_interface, deus_backend, run_controller, player_unit, profile_index, career_index)
		end

		local return_data = nil

		return return_data
	end
}
dlc_settings.ingame_challenge_rewards_description = {
	deus_power_up_quest_test_reward_01 = "deus_power_up_quest_test_reward_01"
}
dlc_settings.ingame_challenge_validation_functions = {
	deus_power_up = function (data)
		fassert(data.granted_power_up_name and data.granted_power_up_rarity, "power_up challenges must set a power_up that is granting the challenge", data.reward_id)
		fassert(DeusPowerUps[data.granted_power_up_rarity], "reward power_up %s not valid: power_up rarity %s not found in power_ups list", data.reward_id, data.granted_power_up_rarity)
		fassert(DeusPowerUps[data.granted_power_up_rarity][data.granted_power_up_name], "reward power_up %s not valid: granted_power_up %s with rarity %s not found in power_ups list", data.reward_id, data.granted_power_up_name, data.granted_power_up_rarity)
		fassert(not DeusPowerUps[data.granted_power_up_rarity][data.granted_power_up_name].talent, "reward power_up %s not valid: can't grant talent power_ups at the moment", data.reward_id, data.quest_power_up_rarity)

		return true
	end
}
