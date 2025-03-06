-- chunkname: @scripts/settings/dlcs/versus_rewards/versus_rewards_ui_settings.lua

local settings = DLCSettings.versus_rewards

settings.ui_materials = {
	"materials/ui/ui_1080p_versus_rewards_atlas",
}
settings.ui_texture_settings = {
	filenames = {
		"scripts/ui/atlas_settings/gui_versus_rewards_atlas",
	},
	atlas_settings = {
		versus_rewards_atlas = {
			masked_material_name = "gui_versus_rewards_atlas_masked",
			masked_offscreen_material_name = "gui_versus_rewards_atlas_masked_offscreen",
			masked_point_sample_material_name = "gui_versus_rewards_atlas_point_sample_masked",
			masked_point_sample_offscreen_material_name = "gui_versus_rewards_atlas_point_sample_masked_offscreen",
			masked_saturated_material_name = "gui_versus_rewards_atlas_masked_saturated",
			material_name = "gui_versus_rewards_atlas",
			offscreen_material_name = "gui_versus_rewards_atlas_offscreen",
			point_sample_material_name = "gui_versus_rewards_atlas_point_sample",
			point_sample_offscreen_material_name = "gui_versus_rewards_atlas_point_sample_offscreen",
			saturated_material_name = "gui_versus_rewards_atlas_saturated",
			saturated_offscreen_material_name = "gui_versus_rewards_atlas_saturated",
		},
	},
}
