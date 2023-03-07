BoonReactivationRules = BoonReactivationRules or {}

BoonReactivationRules.questing_knight = function (player_unique_id)
	local status = Managers.party:get_status_from_unique_id(player_unique_id)

	if status then
		local profile_index = status.profile_index
		local career_index = status.career_index
		local profile = SPProfiles[profile_index]
		local career_settings = profile and profile.careers[career_index]

		return career_settings and career_settings == CareerSettings.es_questingknight
	end

	return false
end
