local settings = DLCSettings.belakor
settings.ui_materials = {
	"materials/ui/ui_1080p_belakor_atlas"
}
settings.ui_texture_settings = {
	filenames = {
		"scripts/ui/atlas_settings/gui_belakor_atlas"
	},
	atlas_settings = {
		belakor_atlas = {
			offscreen_material_name = "gui_belakor_atlas_offscreen",
			masked_point_sample_material_name = "gui_belakor_atlas_point_sample_masked",
			masked_offscreen_material_name = "gui_belakor_atlas_masked_offscreen",
			point_sample_offscreen_material_name = "gui_belakor_atlas_point_sample_offscreen",
			saturated_material_name = "gui_belakor_atlas_saturated",
			masked_material_name = "gui_belakor_atlas_masked",
			point_sample_material_name = "gui_belakor_atlas_point_sample",
			masked_saturated_material_name = "gui_belakor_atlas_masked_saturated",
			saturated_offscreen_material_name = "gui_belakor_atlas_saturated",
			masked_point_sample_offscreen_material_name = "gui_belakor_atlas_point_sample_masked_offscreen",
			material_name = "gui_belakor_atlas"
		}
	}
}
settings.breed_textures = {
	shadow_lieutenant = "unit_frame_portrait_enemy_shadowchampion"
}

return
