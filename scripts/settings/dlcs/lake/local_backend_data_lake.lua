local backend_items = {
	{
		power_level = 0,
		key = "skin_es_questingknight_blue_and_white",
		amount = 1
	},
	{
		power_level = 5,
		key = "markus_questingknight_career_skill_weapon",
		amount = 1
	},
	{
		power_level = 0,
		key = "questing_knight_hat_0000",
		amount = 1
	},
	{
		power_level = 5,
		key = "es_bastard_sword",
		amount = 1
	},
	{
		power_level = 5,
		key = "es_sword_shield_breton",
		amount = 1
	}
}
local default_backend_data = {
	loadout = {
		es_questingknight = {
			slot_hat = "questing_knight_hat_0000",
			slot_skin = "skin_es_questingknight_blue_and_white",
			slot_frame = "frame_0001",
			slot_melee = "es_bastard_sword",
			slot_ranged = "es_sword_shield_breton"
		}
	}
}

return backend_items, default_backend_data
