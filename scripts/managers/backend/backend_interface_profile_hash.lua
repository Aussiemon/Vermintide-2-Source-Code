BackendInterfaceProfileHash = class(BackendInterfaceProfileHash)

BackendInterfaceProfileHash.init = function (self)
	return
end

BackendInterfaceProfileHash.on_authenticated = function (self)
	local hash = Backend.get_hashed_profile_id()

	if hash ~= SaveData.backend_profile_hash then
		SaveData.backend_profile_hash = hash

		if SaveData.save_loaded then
			Managers.save:auto_save(SaveFileName, SaveData, nil)
		end
	end
end
