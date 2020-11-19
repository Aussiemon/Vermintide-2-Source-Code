local backend_items = {
	{
		power_level = 0,
		key = "skin_dr_engineer",
		amount = 1
	},
	{
		power_level = 5,
		key = "bardin_engineer_career_skill_weapon",
		amount = 1
	},
	{
		power_level = 0,
		key = "engineer_hat_0000",
		amount = 1
	},
	{
		power_level = 5,
		key = "dr_2h_cog_hammer",
		amount = 1
	},
	{
		power_level = 5,
		key = "dr_steam_pistol",
		amount = 1
	}
}
local default_backend_data = {
	loadout = {
		dr_engineer = {
			slot_hat = "engineer_hat_0000",
			slot_skin = "skin_dr_engineer",
			slot_frame = "frame_0001",
			slot_melee = "dr_2h_cog_hammer",
			slot_ranged = "dr_steam_pistol"
		}
	}
}

return backend_items, default_backend_data
