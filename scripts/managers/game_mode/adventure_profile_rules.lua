-- chunkname: @scripts/managers/game_mode/adventure_profile_rules.lua

AdventureProfileRules = class(AdventureProfileRules)

AdventureProfileRules.init = function (self, profile_synchronizer, network_server)
	self._profile_synchronizer = profile_synchronizer
	self._network_server = network_server
end

AdventureProfileRules._profile_career_exists = function (self, profile_index, career_index)
	local profile = SPProfiles[profile_index]
	local careers = profile and profile.careers
	local career = careers and careers[career_index]

	return career ~= nil
end

AdventureProfileRules._profile_career_unlocked = function (self, profile_index, career_index)
	local profile = SPProfiles[profile_index]
	local careers = profile and profile.careers
	local career = careers and careers[career_index]

	return career and career:is_unlocked_function(profile.display_name, ExperienceSettings.max_level)
end

AdventureProfileRules.handle_profile_delegation_for_joining_player = function (self, peer_id, local_player_id)
	local profile_synchronizer = self._profile_synchronizer
	local new_profile_index, new_career_index
	local current_profile_index, current_career_index = profile_synchronizer:profile_by_peer(peer_id, local_player_id)
	local party_id = Managers.mechanism:reserved_party_id_by_peer(peer_id)

	if not current_profile_index then
		local wanted_profile_index, wanted_career_index = self._network_server:peer_wanted_profile(peer_id, local_player_id)
		local current_reserver = profile_synchronizer:get_profile_index_reservation(party_id, wanted_profile_index)

		if not current_reserver or current_reserver == peer_id then
			new_profile_index, new_career_index = wanted_profile_index, wanted_career_index
		else
			new_profile_index, new_career_index = profile_synchronizer:get_first_free_profile(party_id)
		end
	end

	if new_profile_index then
		local profile = SPProfiles[new_profile_index]

		if not profile or profile.affiliation ~= "heroes" then
			new_profile_index, new_career_index = profile_synchronizer:get_first_free_profile(party_id)
		end

		if new_career_index then
			if not self:_profile_career_exists(new_profile_index, new_career_index) then
				print("Career " .. new_career_index .. " does not exist, switching to career index 1")

				new_career_index = 1
			end

			if Network.peer_id() == peer_id and not self:_profile_career_unlocked(new_profile_index, new_career_index) then
				print("Missing career: " .. new_career_index .. " unlock requirements, switching to career index 1")

				new_career_index = 1
			end

			local is_bot = false
			local success = Managers.mechanism:try_reserve_profile_for_peer_by_mechanism(peer_id, new_profile_index, new_career_index, false)

			fassert(success, "this should always succeed since we checked everything before")
			profile_synchronizer:assign_full_profile(peer_id, local_player_id, new_profile_index, new_career_index, is_bot)
		else
			local status = Managers.party:get_player_status(peer_id, local_player_id)

			status.profile_index = current_profile_index
			status.career_index = current_career_index
		end
	end
end
