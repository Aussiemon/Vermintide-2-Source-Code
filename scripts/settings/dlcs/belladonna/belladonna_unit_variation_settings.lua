-- chunkname: @scripts/settings/dlcs/belladonna/belladonna_unit_variation_settings.lua

local settings = DLCSettings.belladonna

settings.unit_variation_settings = {
	beastmen_common = {
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
settings.unit_variation_settings.beastmen_common_tattoo = table.create_copy(settings.unit_variation_settings.beastmen_common_tattoo, settings.unit_variation_settings.beastmen_common)
settings.unit_variation_settings.beastmen_common_tattoo.material_variations.tattoo = {
	max = 3,
	min = 0,
	materials = {
		"mtr_skin",
	},
	variables = {
		"tattoo_style",
	},
}
settings.unit_variation_settings.beastmen_common_tattoo.material_variations.tattoo_head = {
	max = 3,
	min = 0,
	materials = {
		"mtr_head",
	},
	variables = {
		"tattoo_style",
	},
}
settings.unit_variation_settings.beastmen_common_tattoo.material_variations.tattoo_tint = {
	max = 31,
	min = 0,
	materials = {
		"mtr_skin",
		"mtr_head",
	},
	variables = {
		"tattoo_color_variation",
	},
}
settings.unit_variation_settings.beastmen_common_tattoo.materials_enabled_from_start = {
	"skin_tint",
	"horn_tint",
	"cloth_tint",
	"tattoo",
	"tattoo_head",
	"tattoo_tint",
}
settings.unit_variation_settings.beastmen_gor = table.create_copy(settings.unit_variation_settings.beastmen_gor, settings.unit_variation_settings.beastmen_common_tattoo)
settings.unit_variation_settings.beastmen_gor.material_variations.tattoo_tint.min = 0
settings.unit_variation_settings.beastmen_gor.material_variations.tattoo_tint.max = 15
settings.unit_variation_settings.beastmen_ungor = table.create_copy(settings.unit_variation_settings.beastmen_ungor, settings.unit_variation_settings.beastmen_common)
settings.unit_variation_settings.beastmen_ungor.material_variations.skin_tint.materials = {
	"mtr_skin",
	"mtr_fur",
	"mtr_head_00",
	"mtr_head_01",
	"mtr_head_02",
	"mtr_head_03",
}
settings.unit_variation_settings.beastmen_ungor.material_variations.skin_tint.min = 0
settings.unit_variation_settings.beastmen_ungor.material_variations.skin_tint.max = 15
settings.unit_variation_settings.beastmen_ungor.material_variations.cloth_tint.min = 0
settings.unit_variation_settings.beastmen_ungor.material_variations.cloth_tint.max = 15
settings.unit_variation_settings.beastmen_ungor_archer = table.create_copy(settings.unit_variation_settings.beastmen_ungor_archer, settings.unit_variation_settings.beastmen_ungor)
settings.unit_variation_settings.beastmen_ungor_archer.material_variations.skin_tint.min = 16
settings.unit_variation_settings.beastmen_ungor_archer.material_variations.skin_tint.max = 31
settings.unit_variation_settings.beastmen_ungor_archer.material_variations.cloth_tint.min = 16
settings.unit_variation_settings.beastmen_ungor_archer.material_variations.cloth_tint.max = 31
settings.unit_variation_settings.beastmen_ungor_archer.material_variations.tattoo = {
	max = 3,
	min = 0,
	materials = {
		"mtr_skin",
	},
	variables = {
		"tattoo_style",
	},
}
settings.unit_variation_settings.beastmen_ungor_archer.material_variations.tattoo_tint = {
	max = 31,
	min = 16,
	materials = {
		"mtr_skin",
	},
	variables = {
		"tattoo_color_variation",
	},
}
settings.unit_variation_settings.beastmen_ungor_archer.materials_enabled_from_start = {
	"skin_tint",
	"horn_tint",
	"cloth_tint",
	"tattoo",
	"tattoo_tint",
}
settings.unit_variation_settings.beastmen_bestigor = table.create_copy(settings.unit_variation_settings.beastmen_bestigor, settings.unit_variation_settings.beastmen_common_tattoo)
settings.unit_variation_settings.beastmen_bestigor.material_variations.cloth_tint_set_1 = {
	max = 2,
	min = 2,
	materials = {
		"mtr_outfit",
	},
	variables = {
		"tint_color_set_1",
	},
}
settings.unit_variation_settings.beastmen_bestigor.material_variations.fur_tint_set_1 = {
	max = 13,
	min = 13,
	materials = {
		"mtr_fur",
	},
	variables = {
		"tint_color_set_1",
	},
}
settings.unit_variation_settings.beastmen_bestigor.material_variations.skin_tint_set_2 = {
	max = 12,
	min = 12,
	materials = {
		"mtr_skin",
		"mtr_head",
	},
	variables = {
		"tint_color_set_2",
	},
}
settings.unit_variation_settings.beastmen_bestigor.material_variations.tattoo_table = {
	max = 4,
	min = 4,
	materials = {
		"mtr_skin",
		"mtr_head",
	},
	variables = {
		"tattoo_color_set",
	},
}
settings.unit_variation_settings.beastmen_bestigor.materials_enabled_from_start = {
	"skin_tint",
	"horn_tint",
	"cloth_tint",
	"tattoo",
	"tattoo_head",
	"tattoo_tint",
	"tattoo_table",
	"cloth_tint_set_1",
	"fur_tint_set_1",
	"skin_tint_set_2",
}
settings.unit_variation_settings.beastmen_standard_bearer = table.create_copy(settings.unit_variation_settings.beastmen_standard_bearer, settings.unit_variation_settings.beastmen_bestigor)
settings.unit_variation_settings.beastmen_standard_bearer.material_variations.cloth_tint_set_1.min = 3
settings.unit_variation_settings.beastmen_standard_bearer.material_variations.cloth_tint_set_1.max = 3
settings.unit_variation_settings.beastmen_standard_bearer.material_variations.fur_tint_set_1.min = 7
settings.unit_variation_settings.beastmen_standard_bearer.material_variations.fur_tint_set_1.max = 7
settings.unit_variation_settings.beastmen_standard_bearer.material_variations.skin_tint_set_2.min = 6
settings.unit_variation_settings.beastmen_standard_bearer.material_variations.skin_tint_set_2.max = 6
