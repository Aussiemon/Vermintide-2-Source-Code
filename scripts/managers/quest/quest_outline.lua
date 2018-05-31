local daily_quests = {
	quest_type = "daily",
	name = "achv_menu_daily_category_title",
	type = "quest",
	max_entry_amount = 3,
	entries = {}
}
local weekly_quests = {
	quest_type = "weekly",
	name = "achv_menu_weekly_category_title",
	max_entry_amount = 1,
	type = "quest"
}
local event_quests = {
	quest_type = "event",
	name = "achv_menu_event_category_title",
	max_entry_amount = 1,
	type = "quest"
}
local quests = {
	name = "achv_menu_quests_category_title",
	type = "quest",
	categories = {
		daily_quests,
		event_quests
	}
}

return quests
