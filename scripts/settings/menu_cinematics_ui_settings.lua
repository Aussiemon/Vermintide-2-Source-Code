local settings = DLCSettings.menu_cinematics
settings.ui_materials = {
	"materials/ui/ui_1080p_menu_cinematics_atlas"
}
settings.ui_texture_settings = {
	filenames = {
		"scripts/ui/atlas_settings/gui_menu_cinematics_atlas"
	},
	atlas_settings = {
		menu_cinematics_atlas = {
			offscreen_material_name = "gui_menu_cinematics_atlas_offscreen",
			masked_point_sample_material_name = "gui_menu_cinematics_atlas_point_sample_masked",
			masked_offscreen_material_name = "gui_menu_cinematics_atlas_masked_offscreen",
			point_sample_offscreen_material_name = "gui_menu_cinematics_atlas_point_sample_offscreen",
			saturated_material_name = "gui_menu_cinematics_atlas_saturated",
			masked_material_name = "gui_menu_cinematics_atlas_masked",
			point_sample_material_name = "gui_menu_cinematics_atlas_point_sample",
			masked_saturated_material_name = "gui_menu_cinematics_atlas_masked_saturated",
			saturated_offscreen_material_name = "gui_menu_cinematics_atlas_saturated",
			masked_point_sample_offscreen_material_name = "gui_menu_cinematics_atlas_point_sample_masked_offscreen",
			material_name = "gui_menu_cinematics_atlas"
		}
	}
}
