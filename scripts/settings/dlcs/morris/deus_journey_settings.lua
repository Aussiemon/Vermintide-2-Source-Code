AvailableJourneyOrder = {
	"journey_ruin",
	"journey_cave",
	"journey_ice",
	"journey_citadel"
}
DeusJourneyCycleGods = DeusJourneyCycleGods or {
	"nurgle",
	"tzeentch",
	"khorne",
	"slaanesh"
}
DeusJourneySettings = DeusJourneySettings or {
	journey_ruin = {
		description = "journey_ruin_desc",
		level_image = "morris_level_icon_01",
		display_name = "journey_ruin_name",
		video_settings = {
			material_name = "video_default",
			resource = "video/area_videos/morris/area_video_morris"
		}
	},
	journey_cave = {
		description = "journey_cave_desc",
		display_name = "journey_cave_name",
		level_image = "morris_level_icon_03",
		required_journeys = {
			"journey_ruin"
		},
		video_settings = {
			material_name = "video_default",
			resource = "video/area_videos/morris/area_video_morris"
		}
	},
	journey_ice = {
		description = "journey_ice_desc",
		display_name = "journey_ice_name",
		level_image = "morris_level_icon_02",
		required_journeys = {
			"journey_cave"
		},
		video_settings = {
			material_name = "video_default",
			resource = "video/area_videos/morris/area_video_morris"
		}
	},
	journey_citadel = {
		description = "journey_citadel_desc",
		display_name = "journey_citadel_name",
		level_image = "morris_level_icon_04",
		required_journeys = {
			"journey_ice"
		},
		video_settings = {
			material_name = "video_default",
			resource = "video/area_videos/morris/area_video_morris"
		}
	}
}
DeusJourneySettings.default = table.clone(DeusJourneySettings.journey_ruin)
DeusJourneySettings.default.default = true
