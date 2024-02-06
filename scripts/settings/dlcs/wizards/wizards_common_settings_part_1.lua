-- chunkname: @scripts/settings/dlcs/wizards/wizards_common_settings_part_1.lua

local settings = DLCSettings.wizards_part_1

settings.statistics_definitions = {
	"scripts/managers/backend/statistics_definitions_wizards_part_1",
}
settings.unlock_settings = {
	wizards_part_1 = {
		class = "AlwaysUnlocked",
	},
}
settings.unlock_settings_xb1 = {
	wizards_part_1 = {
		class = "AlwaysUnlocked",
	},
}
settings.unlock_settings_ps4 = {
	CUSA13595_00 = {
		wizards_part_1 = {
			class = "AlwaysUnlocked",
		},
	},
	CUSA13645_00 = {
		wizards_part_1 = {
			class = "AlwaysUnlocked",
		},
	},
}
settings.entity_extensions = {
	"scripts/unit_extensions/wizards/trail_urn_alignment_extension",
}
settings.entity_system_params = {
	trail_urn_alignment = {
		system_class_name = "ExtensionSystemBase",
		system_name = "trail_urn_alignment_system",
		extension_list = {
			"TrailUrnAlignmentExtension",
		},
	},
}
settings.network_go_types = {
	"trail_cog_pickup_projectile_unit_limited",
}
settings.statistics_lookup = {
	"trail_cog_strike",
	"trail_shatterer",
	"trail_sleigher",
	"trail_beacons_are_lit",
	"trail_bonfire_watch_tower",
	"trail_bonfire_river_path",
	"trail_bonfire_lookout_point",
}
settings.interactions = {
	"trail_light_urn",
}
settings.interactions_filenames = {
	"scripts/settings/dlcs/wizards/wizards_interactions",
}
settings.anim_lookup = {
	"interaction_torch",
}
