-- chunkname: @scripts/managers/quest/quest_outline.lua

local daily_quests = {
	max_entry_amount = 3,
	name = "achv_menu_daily_category_title",
	quest_type = "daily",
	type = "quest",
	entries = {},
}
local weekly_quests = {
	max_entry_amount = 7,
	name = "achv_menu_weekly_category_title",
	quest_type = "weekly",
	type = "quest",
	entries = {},
}
local event_quests = {
	max_entry_amount = 1,
	name = "achv_menu_event_category_title",
	quest_type = "event",
	type = "quest",
	entries = {},
}
local quests = {
	name = "achv_menu_quests_category_title",
	type = "quest",
	categories = {
		daily_quests,
		weekly_quests,
		event_quests,
	},
}

return quests
