-- chunkname: @scripts/settings/dlcs/morris/rarity_settings.lua

local plentiful_color = Colors.get_table("plentiful")
local red = 255 / plentiful_color[2]
local green = 255 / plentiful_color[3]
local blue = 255 / plentiful_color[4]
local plentiful_multiplier = red < green and red or green

plentiful_multiplier = plentiful_multiplier < blue and plentiful_multiplier or blue

local common_color = Colors.get_table("common")
local red = 255 / common_color[2]
local green = 255 / common_color[3]
local blue = 255 / common_color[4]
local common_multiplier = red < green and red or green

common_multiplier = common_multiplier < blue and common_multiplier or blue

local rare_color = Colors.get_table("rare")
local red = 255 / rare_color[2]
local green = 255 / rare_color[3]
local blue = 255 / rare_color[4]
local rare_multiplier = red < green and red or green

rare_multiplier = rare_multiplier < blue and rare_multiplier or blue

local exotic_color = Colors.get_table("exotic")
local red = 255 / exotic_color[2]
local green = 255 / exotic_color[3]
local blue = 255 / exotic_color[4]
local exotic_multiplier = red < green and red or green

exotic_multiplier = exotic_multiplier < blue and exotic_multiplier or blue

local unique_color = Colors.get_table("unique")
local red = 255 / unique_color[2]
local green = 255 / unique_color[3]
local blue = 255 / unique_color[4]
local unique_multiplier = red < green and red or green

unique_multiplier = unique_multiplier < blue and unique_multiplier or blue

local event_color = Colors.get_table("event")
local red = 255 / event_color[2]
local green = 255 / event_color[3]
local blue = 255 / event_color[4]
local event_multiplier = red < green and red or green

event_multiplier = event_multiplier < blue and event_multiplier or blue
ORDER_RARITY = table.mirror_array({
	"plentiful",
	"common",
	"rare",
	"exotic",
	"unique",
	"magic",
	"promo",
})
RaritySettings = RaritySettings or {
	plentiful = {
		display_name = "rarity_display_name_plentiful",
		name = "plentiful",
		order = 1,
		color = plentiful_color,
		frame_color = {
			plentiful_color[1],
			plentiful_color[2] * plentiful_multiplier,
			plentiful_color[3] * plentiful_multiplier,
			plentiful_color[4] * plentiful_multiplier,
		},
	},
	common = {
		display_name = "rarity_display_name_common",
		name = "common",
		order = 2,
		color = common_color,
		frame_color = {
			common_color[1],
			common_color[2] * common_multiplier,
			common_color[3] * common_multiplier,
			common_color[4] * common_multiplier,
		},
	},
	rare = {
		display_name = "rarity_display_name_rare",
		name = "rare",
		order = 3,
		color = rare_color,
		frame_color = {
			rare_color[1],
			rare_color[2] * rare_multiplier,
			rare_color[3] * rare_multiplier,
			rare_color[4] * rare_multiplier,
		},
	},
	exotic = {
		display_name = "rarity_display_name_exotic",
		name = "exotic",
		order = 4,
		color = exotic_color,
		frame_color = {
			exotic_color[1],
			exotic_color[2] * exotic_multiplier,
			exotic_color[3] * exotic_multiplier,
			exotic_color[4] * exotic_multiplier,
		},
	},
	unique = {
		display_name = "rarity_display_name_unique",
		name = "unique",
		order = 5,
		color = unique_color,
		frame_color = {
			unique_color[1],
			unique_color[2] * unique_multiplier,
			unique_color[3] * unique_multiplier,
			unique_color[4] * unique_multiplier,
		},
	},
	event = {
		display_name = "rarity_display_name_event",
		name = "event",
		order = 6,
		color = event_color,
		frame_color = {
			event_color[1],
			event_color[2] * event_multiplier,
			event_color[3] * event_multiplier,
			event_color[4] * event_multiplier,
		},
	},
}
