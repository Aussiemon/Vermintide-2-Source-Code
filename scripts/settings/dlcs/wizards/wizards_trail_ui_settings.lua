local settings = DLCSettings.wizards_part_1
settings.ui_materials = {
	"materials/ui/ui_1080p_wizards_trail_atlas"
}
settings.ui_texture_settings = {
	filenames = {
		"scripts/ui/atlas_settings/gui_wizards_trail_atlas"
	},
	atlas_settings = {
		wizards_trail_atlas = {
			offscreen_material_name = "gui_wizards_trail_atlas_offscreen",
			masked_point_sample_material_name = "gui_wizards_trail_atlas_point_sample_masked",
			masked_offscreen_material_name = "gui_wizards_trail_atlas_masked_offscreen",
			point_sample_offscreen_material_name = "gui_wizards_trail_atlas_point_sample_offscreen",
			saturated_material_name = "gui_wizards_trail_atlas_saturated",
			masked_material_name = "gui_wizards_trail_atlas_masked",
			point_sample_material_name = "gui_wizards_trail_atlas_point_sample",
			masked_saturated_material_name = "gui_wizards_trail_atlas_masked_saturated",
			saturated_offscreen_material_name = "gui_wizards_trail_atlas_saturated",
			masked_point_sample_offscreen_material_name = "gui_wizards_trail_atlas_point_sample_masked_offscreen",
			material_name = "gui_wizards_trail_atlas"
		}
	}
}

return
