require("scripts/settings/equipment/player_wwise_dependencies")

Cosmetics = {}
local skin_dr_default = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/dwarf_ranger/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/dwarf_ranger/third_person_base/chr_third_person_husk_base",
	career = 1,
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.ranger)
}
Cosmetics.skin_dr_default = table.clone(skin_dr_default)
local skin_dr_ironbreaker = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_husk_base",
	career = 1,
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_ironbreaker/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.ironbreaker)
}
Cosmetics.skin_dr_ironbreaker = table.clone(skin_dr_ironbreaker)
local skin_dr_ironbreaker_red = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_husk_base",
	career = 1,
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_ironbreaker/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	tint_data = {
		gradient_variation = 6,
		gradient_value = 4
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.ironbreaker)
}
Cosmetics.skin_dr_ironbreaker_red = table.clone(skin_dr_ironbreaker_red)
local skin_dr_slayer = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_husk_base",
	career = 2,
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.slayer)
}
Cosmetics.skin_dr_slayer = table.clone(skin_dr_slayer)
local skin_dr_ranger = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_husk_base",
	career = 3,
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.ranger)
}
Cosmetics.skin_dr_ranger = table.clone(skin_dr_ranger)
local skin_dr_ranger_barak_varr = {
	third_person_husk = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_base",
	career = 3,
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_upgraded/skins/barak_varr/chr_dwarf_ranger_upgraded_body_barak_varr",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/barak_varr/mtr_outfit_barak_varr"
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/barak_varr/mtr_outfit_barak_varr_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.ranger)
}
Cosmetics.skin_dr_ranger_barak_varr = table.clone(skin_dr_ranger_barak_varr)
local skin_dr_ranger_black_and_gold = {
	third_person_husk = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_base",
	career = 3,
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_upgraded/skins/black_and_gold/chr_dwarf_ranger_upgraded_body_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/black_and_gold/mtr_outfit_black_and_gold"
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/black_and_gold/mtr_outfit_black_and_gold_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.ranger)
}
Cosmetics.skin_dr_ranger_black_and_gold = table.clone(skin_dr_ranger_black_and_gold)
local skin_dr_ranger_brown_and_yellow = {
	third_person_husk = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_base",
	career = 3,
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_upgraded/skins/brown_and_yellow/chr_dwarf_ranger_upgraded_body_brown_and_yellow",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/brown_and_yellow/mtr_outfit_brown_and_yellow"
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/brown_and_yellow/mtr_outfit_brown_and_yellow_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.ranger)
}
Cosmetics.skin_dr_ranger_brown_and_yellow = table.clone(skin_dr_ranger_brown_and_yellow)
local skin_dr_ranger_helmgart = {
	third_person_husk = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_base",
	career = 3,
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_upgraded/skins/helmgart/chr_dwarf_ranger_upgraded_body_helmgart",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/helmgart/mtr_outfit_helmgart"
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/helmgart/mtr_outfit_helmgart_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.ranger)
}
Cosmetics.skin_dr_ranger_helmgart = table.clone(skin_dr_ranger_helmgart)
local skin_dr_ranger_karak_norn = {
	third_person_husk = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_base",
	career = 3,
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_upgraded/skins/karak_norn/chr_dwarf_ranger_upgraded_body_karak_norn",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/karak_norn/mtr_outfit_karak_norn"
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/karak_norn/mtr_outfit_karak_norn_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.ranger)
}
Cosmetics.skin_dr_ranger_karak_norn = table.clone(skin_dr_ranger_karak_norn)
local skin_dr_ranger_zhufbar = {
	third_person_husk = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_base",
	career = 3,
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_upgraded/skins/zhufbar/chr_dwarf_ranger_upgraded_body_zhufbar",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/zhufbar/mtr_outfit_zhufbar"
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/zhufbar/mtr_outfit_zhufbar_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.ranger)
}
Cosmetics.skin_dr_ranger_zhufbar = table.clone(skin_dr_ranger_zhufbar)
local skin_es_default = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/empire_soldier/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.mercenary)
}
Cosmetics.skin_es_default = table.clone(skin_es_default)
local skin_es_knight = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_knight/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.knight)
}
Cosmetics.skin_es_knight = table.clone(skin_es_knight)
local skin_es_mercenary = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.mercenary)
}
Cosmetics.skin_es_mercenary = table.clone(skin_es_mercenary)
local skin_es_mercenary_black_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_mercenary/skins/black_and_gold/empire_soldier_mercenary_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/black_and_gold/mtr_outfit_black_and_gold"
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/black_and_gold/mtr_outfit_black_and_gold_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.mercenary)
}
Cosmetics.skin_es_mercenary_black_and_gold = table.clone(skin_es_mercenary_black_and_gold)
local skin_es_mercenary_carroburg = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_mercenary/skins/carroburg/empire_soldier_mercenary_carroburg",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/carroburg/mtr_outfit_carroburg"
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/carroburg/mtr_outfit_carroburg_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.mercenary)
}
Cosmetics.skin_es_mercenary_carroburg = table.clone(skin_es_mercenary_carroburg)
local skin_es_mercenary_helmgart = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_mercenary/skins/helmgart/empire_soldier_mercenary_helmgart",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/helmgart/mtr_outfit_helmgart"
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/helmgart/mtr_outfit_helmgart_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.mercenary)
}
Cosmetics.skin_es_mercenary_helmgart = table.clone(skin_es_mercenary_helmgart)
local skin_es_mercenary_middenland = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_mercenary/skins/middenland/empire_soldier_mercenary_middenland",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/middenland/mtr_outfit_middenland"
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/middenland/mtr_outfit_middenland_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.mercenary)
}
Cosmetics.skin_es_mercenary_middenland = table.clone(skin_es_mercenary_middenland)
local skin_es_mercenary_ostermark = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_mercenary/skins/ostermark/empire_soldier_mercenary_ostermark",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/ostermark/mtr_outfit_ostermark"
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/ostermark/mtr_outfit_ostermark_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.mercenary)
}
Cosmetics.skin_es_mercenary_ostermark = table.clone(skin_es_mercenary_ostermark)
local skin_es_mercenary_ostland = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_mercenary/skins/ostland/empire_soldier_mercenary_ostland",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/ostland/mtr_outfit_ostland"
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/ostland/mtr_outfit_ostland_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.mercenary)
}
Cosmetics.skin_es_mercenary_ostland = table.clone(skin_es_mercenary_ostland)
local skin_es_huntsman = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_huntsman/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.huntsman)
}
Cosmetics.skin_es_huntsman = table.clone(skin_es_huntsman)
local skin_ww_default = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/way_watcher/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.waywatcher)
}
Cosmetics.skin_ww_default = table.clone(skin_ww_default)
local skin_ww_shade = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_shade/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.shade)
}
Cosmetics.skin_ww_shade = table.clone(skin_ww_shade)
local skin_ww_maidenguard = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_maiden_guard/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.maiden_guard)
}
Cosmetics.skin_ww_maidenguard = table.clone(skin_ww_maidenguard)
local skin_ww_waywatcher = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.waywatcher)
}
Cosmetics.skin_ww_waywatcher = table.clone(skin_ww_waywatcher)
local skin_ww_waywatcher_anmyr = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_upgraded/skins/anmyr/chr_player_waywatcher_wood_elf_anmyr",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/anmyr/mtr_outfit_anmyr"
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/anmyr/mtr_outfit_anmyr_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.waywatcher)
}
Cosmetics.skin_ww_waywatcher_anmyr = table.clone(skin_ww_waywatcher_anmyr)
local skin_ww_waywatcher_atylwyth = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_upgraded/skins/atylwyth/chr_player_waywatcher_wood_elf_atylwyth",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/atylwyth/mtr_outfit_atylwyth"
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/atylwyth/mtr_outfit_atylwyth_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.waywatcher)
}
Cosmetics.skin_ww_waywatcher_atylwyth = table.clone(skin_ww_waywatcher_atylwyth)
local skin_ww_waywatcher_black_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_upgraded/skins/black_and_gold/chr_player_waywatcher_wood_elf_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/black_and_gold/mtr_outfit_black_and_gold"
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/black_and_gold/mtr_outfit_black_and_gold_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.waywatcher)
}
Cosmetics.skin_ww_waywatcher_black_and_gold = table.clone(skin_ww_waywatcher_black_and_gold)
local skin_ww_waywatcher_cythral = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_upgraded/skins/cythral/chr_player_waywatcher_wood_elf_cythral",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/cythral/mtr_outfit_cythral"
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/cythral/mtr_outfit_cythral_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.waywatcher)
}
Cosmetics.skin_ww_waywatcher_cythral = table.clone(skin_ww_waywatcher_cythral)
local skin_ww_waywatcher_helmgart = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_upgraded/skins/helmgart/chr_player_waywatcher_wood_elf_helmgart",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/helmgart/mtr_outfit_helmgart"
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/helmgart/mtr_outfit_helmgart_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.waywatcher)
}
Cosmetics.skin_ww_waywatcher_helmgart = table.clone(skin_ww_waywatcher_helmgart)
local skin_ww_waywatcher_tirsyth = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_upgraded/skins/tirsyth/chr_player_waywatcher_wood_elf_tirsyth",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/tirsyth/mtr_outfit_tirsyth"
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/tirsyth/mtr_outfit_tirsyth_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.waywatcher)
}
Cosmetics.skin_ww_waywatcher_tirsyth = table.clone(skin_ww_waywatcher_tirsyth)
local skin_wh_default = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/witch_hunter/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/witch_hunter/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/witch_hunter/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.witch_hunter_captain)
}
Cosmetics.skin_wh_default = table.clone(skin_wh_default)
local skin_wh_captain = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_captain/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.witch_hunter_captain)
}
Cosmetics.skin_wh_captain = table.clone(skin_wh_captain)
local skin_wh_captain_black_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_captain/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_captain/skins/black_and_gold/chr_witch_hunter_captain_body_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/black_and_gold/mtr_outfit_black_and_gold"
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/black_and_gold/mtr_outfit_black_and_gold_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.witch_hunter_captain)
}
Cosmetics.skin_wh_captain_black_and_gold = table.clone(skin_wh_captain_black_and_gold)
local skin_wh_captain_grey_and_yellow = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_captain/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_captain/skins/grey_and_yellow/chr_witch_hunter_captain_body_grey_and_yellow",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/grey_and_yellow/mtr_outfit_grey_and_yellow"
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/grey_and_yellow/mtr_outfit_grey_and_yellow_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.witch_hunter_captain)
}
Cosmetics.skin_wh_captain_grey_and_yellow = table.clone(skin_wh_captain_grey_and_yellow)
local skin_wh_captain_helmgart = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_captain/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_captain/skins/helmgart/chr_witch_hunter_captain_body_helmgart",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/helmgart/mtr_outfit_helmgart"
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/helmgart/mtr_outfit_helmgart_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.witch_hunter_captain)
}
Cosmetics.skin_wh_captain_helmgart = table.clone(skin_wh_captain_helmgart)
local skin_wh_captain_middenland = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_captain/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_captain/skins/middenland/chr_witch_hunter_captain_body_middenland",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/middenland/mtr_outfit_middenland"
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/middenland/mtr_outfit_middenland_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.witch_hunter_captain)
}
Cosmetics.skin_wh_captain_middenland = table.clone(skin_wh_captain_middenland)
local skin_wh_captain_ostermark = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_captain/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_captain/skins/ostermark/chr_witch_hunter_captain_body_ostermark",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/ostermark/mtr_outfit_ostermark"
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/ostermark/mtr_outfit_ostermark_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.witch_hunter_captain)
}
Cosmetics.skin_wh_captain_ostermark = table.clone(skin_wh_captain_ostermark)
local skin_wh_captain_ostland = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_captain/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_captain/skins/ostland/chr_witch_hunter_captain_body_ostland",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/ostland/mtr_outfit_ostland"
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/ostland/mtr_outfit_ostland_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.witch_hunter_captain)
}
Cosmetics.skin_wh_captain_ostland = table.clone(skin_wh_captain_ostland)
local skin_wh_zealot = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_zealot/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.zealot)
}
Cosmetics.skin_wh_zealot = table.clone(skin_wh_zealot)
local skin_wh_bountyhunter = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/witch_hunter_bounty_hunter/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/witch_hunter_bounty_hunter/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/witch_hunter_bounty_hunter/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_bounty_hunter/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.bounty_hunter)
}
Cosmetics.skin_wh_bountyhunter = table.clone(skin_wh_bountyhunter)
local skin_wh_bountyhunter_02 = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/witch_hunter_bounty_hunter/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/witch_hunter_bounty_hunter/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/witch_hunter_bounty_hunter/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_bounty_hunter/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_bounty_hunter/skins/skin_01/mtr_outfit_skin_01",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_bounty_hunter/skins/skin_01/mtr_outfit_skin_01"
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_bounty_hunter/skins/skin_01/mtr_outfit_fp_skin_01"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.bounty_hunter)
}
Cosmetics.skin_wh_bountyhunter_02 = table.clone(skin_wh_bountyhunter_02)
local skin_bw_default = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/bright_wizard/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.adept)
}
Cosmetics.skin_bw_default = table.clone(skin_bw_default)
local skin_bw_unchained = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_unchained/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.unchained)
}
Cosmetics.skin_bw_unchained = table.clone(skin_bw_unchained)
local skin_bw_scholar = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_scholar/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.scholar)
}
Cosmetics.skin_bw_scholar = table.clone(skin_bw_scholar)
local skin_bw_adept = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_adept/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.adept)
}
Cosmetics.skin_bw_adept = table.clone(skin_bw_adept)
local skin_bw_adept_ash = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_adept/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_adept/skins/ash/chr_player_bright_wizard_adept_ash",
		third_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/ash/mtr_outfit_ash"
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/ash/mtr_outfit_ash_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.adept)
}
Cosmetics.skin_bw_adept_ash = table.clone(skin_bw_adept_ash)
local skin_bw_adept_black_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_adept/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_adept/skins/black_and_gold/chr_player_bright_wizard_adept_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/black_and_gold/mtr_outfit_black_and_gold"
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/black_and_gold/mtr_outfit_black_and_gold_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.adept)
}
Cosmetics.skin_bw_adept_black_and_gold = table.clone(skin_bw_adept_black_and_gold)
local skin_bw_adept_brown_and_yellow = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_adept/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_adept/skins/brown_and_yellow/chr_player_bright_wizard_adept_brown_and_yellow",
		third_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/brown_and_yellow/mtr_outfit_brown_and_yellow"
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/brown_and_yellow/mtr_outfit_brown_and_yellow_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.adept)
}
Cosmetics.skin_bw_adept_brown_and_yellow = table.clone(skin_bw_adept_brown_and_yellow)
local skin_bw_adept_helmgart = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_adept/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_adept/skins/helmgart/chr_player_bright_wizard_adept_helmgart",
		third_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/helmgart/mtr_outfit_helmgart"
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/helmgart/mtr_outfit_helmgart_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.adept)
}
Cosmetics.skin_bw_adept_helmgart = table.clone(skin_bw_adept_helmgart)
local skin_bw_adept_ostermark = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_adept/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_adept/skins/ostermark/chr_player_bright_wizard_adept_ostermark",
		third_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/ostermark/mtr_outfit_ostermark"
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/ostermark/mtr_outfit_ostermark_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.adept)
}
Cosmetics.skin_bw_adept_ostermark = table.clone(skin_bw_adept_ostermark)
local skin_bw_adept_ostland = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_adept/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_adept/skins/ostland/chr_player_bright_wizard_adept_ostland",
		third_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/ostland/mtr_outfit_ostland"
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/ostland/mtr_outfit_ostland_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.adept)
}
Cosmetics.skin_bw_adept_ostland = table.clone(skin_bw_adept_ostland)
local frame_0001 = {
	icon = "unit_frame_02"
}
Cosmetics.frame_0001 = table.clone(frame_0001)
local frame_0002 = {
	icon = "unit_frame_03"
}
Cosmetics.frame_0002 = table.clone(frame_0002)
local frame_0003 = {
	icon = "unit_frame_04"
}
Cosmetics.frame_0003 = table.clone(frame_0003)
local frame_0004 = {
	icon = "unit_frame_05"
}
Cosmetics.frame_0004 = table.clone(frame_0004)
local frame_0005 = {
	icon = "unit_frame_06"
}
Cosmetics.frame_0005 = table.clone(frame_0005)
local frame_0006 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0006 = table.clone(frame_0006)

for name, cosmetic_data in pairs(Cosmetics) do
	cosmetic_data.name = name
end

return 
