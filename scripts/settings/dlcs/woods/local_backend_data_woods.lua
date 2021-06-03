local backend_items = {
	{
		power_level = 0,
		key = "skin_ww_thornsister",
		amount = 1
	},
	{
		power_level = 0,
		key = "thornsister_hat_0000",
		amount = 1
	},
	{
		power_level = 5,
		key = "we_javelin",
		amount = 1
	},
	{
		power_level = 5,
		key = "we_life_staff",
		amount = 1
	}
}
local default_backend_data = {
	loadout = {
		we_thornsister = {
			slot_hat = "thornsister_hat_0000",
			slot_skin = "skin_ww_thornsister",
			slot_frame = "frame_0001",
			slot_melee = "we_1h_sword",
			slot_ranged = "we_javelin"
		}
	}
}

return backend_items, default_backend_data
