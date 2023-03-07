require("scripts/settings/player_data")

local steam = rawget(_G, "Steam")
local branch_name = steam and steam.branch_name and steam.branch_name()

if branch_name and branch_name ~= "public" then
	SaveFileName = "save_data_" .. tostring(branch_name)
else
	SaveFileName = "save_data"
end

SaveData = SaveData or {
	profiles_version = 45,
	player_data_version = 8,
	talents_version = 1,
	save_loaded = false,
	video_version = 1,
	version = 7
}

function populate_save_data(save_data)
	local version_match = SaveData.version == save_data.version

	if version_match then
		if SaveData.profiles_version ~= save_data.profiles_version then
			save_data.profiles = nil

			print("Wrong profiles_version for save file, saved: ", save_data.profiles_version, " current: ", SaveData.profiles_version)

			save_data.profiles_version = SaveData.profiles_version
		end

		if SaveData.player_data_version ~= save_data.player_data_version then
			save_data.player_data = nil

			print("Wrong player_data_version for save file, saved: ", save_data.player_data_version, " current: ", SaveData.player_data_version)

			save_data.player_data_version = SaveData.player_data_version
		end

		if SaveData.video_version ~= save_data.video_version then
			print("User haven't seen the latest video yet - Show instead of loading screen")

			save_data.video_version = SaveData.video_version
		end

		if SaveData.talents_version ~= save_data.talents_version then
			save_data.talents = nil

			print("Wrong talents_version for save file, saved: ", save_data.talents_version, " current: ", SaveData.talents_version)

			save_data.talents_version = SaveData.talents_version
		end

		if not save_data.backend_profile_hash then
			save_data.backend_profile_hash = SaveData.backend_profile_hash
		end

		SaveData = save_data
	else
		print("Wrong version for save file, saved: ", save_data.version, " current: ", SaveData.version)
	end

	local id = rawget(_G, "Steam") and Steam.user_id() or "local_save"

	populate_player_data_from_save(SaveData, id, version_match)

	SaveData.save_loaded = true
end
