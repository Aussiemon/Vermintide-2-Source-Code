local settings = DLCSettings.steak
settings.unit_variation_settings = {
	beastmen_minotaur = {
		materials_enabled_from_start = {
			"skin_tint",
			"horn_tint",
			"cloth_tint"
		},
		material_variations = {
			skin_tint = {
				min = 0,
				max = 31,
				materials = {
					"mtr_skin",
					"mtr_head",
					"mtr_fur"
				},
				variables = {
					"tint_color_variation"
				}
			},
			horn_tint = {
				min = 0,
				max = 31,
				materials = {
					"mtr_horns"
				},
				variables = {
					"tint_color_variation"
				}
			},
			cloth_tint = {
				min = 0,
				max = 31,
				materials = {
					"mtr_outfit"
				},
				variables = {
					"tint_color_variation"
				}
			}
		}
	}
}
