local daily_quests = {
	quest_type = "daily",
	name = "achv_menu_daily_category_title",
	type = "quest",
	entries = {}
}
local quests = {
	name = "achv_menu_quests_category_title",
	type = "quest",
	categories = {
		daily_quests
	}
}

return quests
