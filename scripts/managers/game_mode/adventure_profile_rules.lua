AdventureProfileRules = class(AdventureProfileRules)

AdventureProfileRules.init = function (self, profile_synchronizer, network_server)
	self._profile_synchronizer = profile_synchronizer
	self._network_server = network_server
end

AdventureProfileRules._owner_is_bot = function (self, peer_id, local_player_id)
	local player = Managers.player:player(peer_id, local_player_id)

	if not player then
		return false
	end

	if player:is_player_controlled() then
		return false
	end

	return true
end

AdventureProfileRules._profile_available = function (self, profile_index, career_index)
	local owners = self._profile_synchronizer:owners(profile_index)

	for _, owner_table in ipairs(owners) do
		local peer_id = owner_table.peer_id
		local local_player_id = owner_table.local_player_id

		if not self:_owner_is_bot(peer_id, local_player_id) then
			return false
		end
	end

	return true
end

AdventureProfileRules._get_first_free_profile = function (self)
	local player_manager = Managers.player
	local profile_synchronizer = self._profile_synchronizer
	local hero_profiles = PROFILES_BY_AFFILIATION.heroes

	for _, profile_name in ipairs(hero_profiles) do
		local profile_index = FindProfileIndex(profile_name)
		local career_index = 1

		if self:_profile_available(profile_index, career_index) then
			return profile_index, career_index
		end
	end

	ferror("No free profile available!")
end

AdventureProfileRules._is_only_owner = function (self, peer_id, local_player_id, profile_index, career_index)
	local owners = self._profile_synchronizer:owners(profile_index)

	for i = 1, #owners, 1 do
		local owner_table = owners[i]
		local owner_peer_id = owner_table.peer_id
		local owner_local_player_id = owner_table.local_player_id
		local different_player = owner_peer_id ~= peer_id or owner_local_player_id ~= local_player_id

		if different_player and not self:_owner_is_bot(owner_peer_id, owner_local_player_id) then
			return false
		end
	end

	return true
end

AdventureProfileRules.handle_profile_delegation_for_joining_player = function (self, peer_id, local_player_id)
	local profile_synchronizer = self._profile_synchronizer
	local new_profile_index, new_career_index = nil
	local current_profile_index, current_career_index = profile_synchronizer:profile_by_peer(peer_id, local_player_id)

	if not current_profile_index then
		local wanted_profile_index, wanted_career_index = self._network_server:wanted_profile(peer_id, local_player_id)
		local can_use_wanted_profile = wanted_profile_index and wanted_career_index and self:_profile_available(wanted_profile_index, wanted_career_index)

		if can_use_wanted_profile then
			new_career_index = wanted_career_index
			new_profile_index = wanted_profile_index
		else
			new_profile_index, new_career_index = self:_get_first_free_profile()
		end
	elseif not self:_is_only_owner(peer_id, local_player_id, current_profile_index, current_career_index) then
		new_profile_index, new_career_index = self:_get_first_free_profile()
	end

	if new_profile_index and new_career_index then
		profile_synchronizer:select_profile(peer_id, local_player_id, new_profile_index, new_career_index)
	end
end

return
