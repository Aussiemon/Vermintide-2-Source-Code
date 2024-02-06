-- chunkname: @scripts/settings/dlcs/steak/steak_unit_variation_settings.lua

local settings = DLCSettings.steak

settings.unit_variation_settings = {
	beastmen_minotaur = {
		materials_enabled_from_start = {
			"skin_tint",
			"horn_tint",
			"cloth_tint",
		},
		material_variations = {
			skin_tint = {
				max = 31,
				min = 0,
				materials = {
					"mtr_skin",
					"mtr_head",
					"mtr_fur",
				},
				variables = {
					"tint_color_variation",
				},
			},
			horn_tint = {
				max = 31,
				min = 0,
				materials = {
					"mtr_horns",
				},
				variables = {
					"tint_color_variation",
				},
			},
			cloth_tint = {
				max = 31,
				min = 0,
				materials = {
					"mtr_outfit",
				},
				variables = {
					"tint_color_variation",
				},
			},
		},
	},
}
