require("scripts/settings/equipment/player_wwise_dependencies")

Cosmetics = {}
local skin_dr_default = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/dwarf_ranger/third_person_base/chr_third_person_husk_base",
	career = 1,
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/dwarf_ranger/third_person_base/chr_third_person_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	always_hide_attachment_slots = {
		"slot_hat"
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
local skin_dr_ironbreaker_black_and_gold = {
	third_person_husk = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_base",
	career = 1,
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_ironbreaker/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_ironbreaker/skins/black_and_gold/chr_dwarf_ranger_ironbreaker_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_ironbreaker/skins/black_and_gold/mtr_outfit_black_and_gold"
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_ironbreaker/skins/black_and_gold/mtr_outfit_black_and_gold_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.ironbreaker)
}
Cosmetics.skin_dr_ironbreaker_black_and_gold = table.clone(skin_dr_ironbreaker_black_and_gold)
local skin_dr_ironbreaker_blue = {
	third_person_husk = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_base",
	career = 1,
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_ironbreaker/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_ironbreaker/skins/blue/chr_dwarf_ranger_ironbreaker_blue",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_ironbreaker/skins/blue/mtr_outfit_blue"
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_ironbreaker/skins/blue/mtr_outfit_blue_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.ironbreaker)
}
Cosmetics.skin_dr_ironbreaker_blue = table.clone(skin_dr_ironbreaker_blue)
local skin_dr_ironbreaker_crimson = {
	third_person_husk = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_base",
	career = 1,
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_ironbreaker/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_ironbreaker/skins/crimson/chr_dwarf_ranger_ironbreaker_crimson",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_ironbreaker/skins/crimson/mtr_outfit_crimson"
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_ironbreaker/skins/crimson/mtr_outfit_crimson_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.ironbreaker)
}
Cosmetics.skin_dr_ironbreaker_crimson = table.clone(skin_dr_ironbreaker_crimson)
local skin_dr_ironbreaker_green = {
	third_person_husk = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_base",
	career = 1,
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_ironbreaker/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_ironbreaker/skins/green/chr_dwarf_ranger_ironbreaker_green",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_ironbreaker/skins/green/mtr_outfit_green"
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_ironbreaker/skins/green/mtr_outfit_green_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.ironbreaker)
}
Cosmetics.skin_dr_ironbreaker_green = table.clone(skin_dr_ironbreaker_green)
local skin_dr_ironbreaker_iron = {
	third_person_husk = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_base",
	career = 1,
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_ironbreaker/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_ironbreaker/skins/iron/chr_dwarf_ranger_ironbreaker_iron",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_ironbreaker/skins/iron/mtr_outfit_iron"
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_ironbreaker/skins/iron/mtr_outfit_iron_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.ironbreaker)
}
Cosmetics.skin_dr_ironbreaker_iron = table.clone(skin_dr_ironbreaker_iron)
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
local skin_dr_slayer_axe = {
	third_person_husk = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_base",
	career = 2,
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/skins/axe/chr_dwarf_ranger_slayer_axe",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/axe/mtr_outfit_axe",
			mtr_body = "units/beings/player/dwarf_ranger_slayer/skins/axe/mtr_body_axe"
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/axe/mtr_outfit_axe_1p",
			mtr_skin = "units/beings/player/dwarf_ranger_slayer/skins/axe/mtr_body_axe_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.slayer)
}
Cosmetics.skin_dr_slayer_axe = table.clone(skin_dr_slayer_axe)
local skin_dr_slayer_dragon = {
	third_person_husk = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_base",
	career = 2,
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/skins/dragon/chr_dwarf_ranger_slayer_dragon",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/dragon/mtr_outfit_dragon",
			mtr_body = "units/beings/player/dwarf_ranger_slayer/skins/dragon/mtr_body_dragon"
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/dragon/mtr_outfit_dragon_1p",
			mtr_skin = "units/beings/player/dwarf_ranger_slayer/skins/dragon/mtr_body_dragon_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.slayer)
}
Cosmetics.skin_dr_slayer_dragon = table.clone(skin_dr_slayer_dragon)
local skin_dr_slayer_skaven = {
	third_person_husk = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_base",
	career = 2,
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/skins/skaven/chr_dwarf_ranger_slayer_skaven",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/skaven/mtr_outfit_skaven",
			mtr_body = "units/beings/player/dwarf_ranger_slayer/skins/skaven/mtr_body_skaven"
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/skaven/mtr_outfit_skaven_1p",
			mtr_skin = "units/beings/player/dwarf_ranger_slayer/skins/skaven/mtr_body_skaven_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.slayer)
}
Cosmetics.skin_dr_slayer_skaven = table.clone(skin_dr_slayer_skaven)
local skin_dr_slayer_skull = {
	third_person_husk = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_base",
	career = 2,
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/skins/skull/chr_dwarf_ranger_slayer_skull",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/skull/mtr_outfit_skull",
			mtr_body = "units/beings/player/dwarf_ranger_slayer/skins/skull/mtr_body_skull"
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/skull/mtr_outfit_skull_1p",
			mtr_skin = "units/beings/player/dwarf_ranger_slayer/skins/skull/mtr_body_skull_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.slayer)
}
Cosmetics.skin_dr_slayer_skull = table.clone(skin_dr_slayer_skull)
local skin_dr_slayer_runes = {
	third_person_husk = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_base",
	career = 2,
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/skins/runes/chr_dwarf_ranger_slayer_runes",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/runes/mtr_outfit_runes",
			mtr_body = "units/beings/player/dwarf_ranger_slayer/skins/runes/mtr_body_runes"
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/runes/mtr_outfit_runes_1p",
			mtr_skin = "units/beings/player/dwarf_ranger_slayer/skins/runes/mtr_body_runes_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.slayer)
}
Cosmetics.skin_dr_slayer_runes = table.clone(skin_dr_slayer_runes)
local skin_dr_slayer_wing = {
	third_person_husk = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_base",
	career = 2,
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/skins/wing/chr_dwarf_ranger_slayer_wing",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/wing/mtr_outfit_wing",
			mtr_body = "units/beings/player/dwarf_ranger_slayer/skins/wing/mtr_body_wing"
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/wing/mtr_outfit_wing_1p",
			mtr_skin = "units/beings/player/dwarf_ranger_slayer/skins/wing/mtr_body_wing_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.slayer)
}
Cosmetics.skin_dr_slayer_wing = table.clone(skin_dr_slayer_wing)
local skin_dr_slayer_skull = {
	third_person_husk = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_base",
	career = 2,
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/skins/skull/chr_dwarf_ranger_slayer_skull",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/skull/mtr_outfit_skull",
			mtr_body = "units/beings/player/dwarf_ranger_slayer/skins/skull/mtr_body_skull"
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/skull/mtr_outfit_skull_1p",
			mtr_skin = "units/beings/player/dwarf_ranger_slayer/skins/skull/mtr_body_skull_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.slayer)
}
Cosmetics.skin_dr_slayer_skull = table.clone(skin_dr_slayer_skull)
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
		package_name = "units/beings/player/dwarf_ranger_upgraded/skins/helmgart/chr_dwarf_ranger_upgraded_helmgart",
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
		package_name = "units/beings/player/dwarf_ranger_upgraded/skins/barak_varr/chr_dwarf_ranger_upgraded_barak_varr",
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
		package_name = "units/beings/player/dwarf_ranger_upgraded/skins/black_and_gold/chr_dwarf_ranger_upgraded_black_and_gold",
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
		package_name = "units/beings/player/dwarf_ranger_upgraded/skins/brown_and_yellow/chr_dwarf_ranger_upgraded_brown_and_yellow",
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
		package_name = "units/beings/player/dwarf_ranger_upgraded/skins/karak_norn/chr_dwarf_ranger_upgraded_karak_norn",
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
		package_name = "units/beings/player/dwarf_ranger_upgraded/skins/zhufbar/chr_dwarf_ranger_upgraded_zhufbar",
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
	third_person_husk = "units/beings/player/empire_soldier/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier/third_person_base/chr_third_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/empire_soldier/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	always_hide_attachment_slots = {
		"slot_hat"
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
local skin_es_knight_black_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_knight/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_knight/skins/black_and_gold/chr_empire_soldier_knight_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_knight/skins/black_and_gold/mtr_outfit_black_and_gold"
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_knight/skins/black_and_gold/mtr_outfit_black_and_gold_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.knight)
}
Cosmetics.skin_es_knight_black_and_gold = table.clone(skin_es_knight_black_and_gold)
local skin_es_knight_bronze = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_knight/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_knight/skins/bronze/chr_empire_soldier_knight_bronze",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_knight/skins/bronze/mtr_outfit_bronze"
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_knight/skins/bronze/mtr_outfit_bronze_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.knight)
}
Cosmetics.skin_es_knight_bronze = table.clone(skin_es_knight_bronze)
local skin_es_knight_green = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_knight/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_knight/skins/green/chr_empire_soldier_knight_green",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_knight/skins/green/mtr_outfit_green"
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_knight/skins/green/mtr_outfit_green_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.knight)
}
Cosmetics.skin_es_knight_green = table.clone(skin_es_knight_green)
local skin_es_knight_middenland = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_knight/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_knight/skins/middenland/chr_empire_soldier_knight_middenland",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_knight/skins/middenland/mtr_outfit_middenland"
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_knight/skins/middenland/mtr_outfit_middenland_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.knight)
}
Cosmetics.skin_es_knight_middenland = table.clone(skin_es_knight_middenland)
local skin_es_knight_red = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_knight/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_knight/skins/red/chr_empire_soldier_knight_red",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_knight/skins/red/mtr_outfit_red"
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_knight/skins/red/mtr_outfit_red_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.knight)
}
Cosmetics.skin_es_knight_red = table.clone(skin_es_knight_red)
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
		package_name = "units/beings/player/empire_soldier_mercenary/skins/helmgart/chr_empire_soldier_mercenary_helmgart",
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
		package_name = "units/beings/player/empire_soldier_mercenary/skins/black_and_gold/chr_empire_soldier_mercenary_black_and_gold",
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
		package_name = "units/beings/player/empire_soldier_mercenary/skins/carroburg/chr_empire_soldier_mercenary_carroburg",
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
		package_name = "units/beings/player/empire_soldier_mercenary/skins/middenland/chr_empire_soldier_mercenary_middenland",
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
		package_name = "units/beings/player/empire_soldier_mercenary/skins/ostermark/chr_empire_soldier_mercenary_ostermark",
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
		package_name = "units/beings/player/empire_soldier_mercenary/skins/ostland/chr_empire_soldier_mercenary_ostland",
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
local skin_es_huntsman_black_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_huntsman/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_huntsman/skins/black_and_gold/chr_empire_soldier_huntsman_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_huntsman/skins/black_and_gold/mtr_outfit_black_and_gold"
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_huntsman/skins/black_and_gold/mtr_outfit_black_and_gold_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.huntsman)
}
Cosmetics.skin_es_huntsman_black_and_gold = table.clone(skin_es_huntsman_black_and_gold)
local skin_es_huntsman_middenland = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_huntsman/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_huntsman/skins/middenland/chr_empire_soldier_huntsman_middenland",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_huntsman/skins/middenland/mtr_outfit_middenland"
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_huntsman/skins/middenland/mtr_outfit_middenland_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.huntsman)
}
Cosmetics.skin_es_huntsman_middenland = table.clone(skin_es_huntsman_middenland)
local skin_es_huntsman_ostermark = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_huntsman/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_huntsman/skins/ostermark/chr_empire_soldier_huntsman_ostermark",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_huntsman/skins/ostermark/mtr_outfit_ostermark"
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_huntsman/skins/ostermark/mtr_outfit_ostermark_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.huntsman)
}
Cosmetics.skin_es_huntsman_ostermark = table.clone(skin_es_huntsman_ostermark)
local skin_es_huntsman_red_and_white = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_huntsman/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_huntsman/skins/red_and_white/chr_empire_soldier_huntsman_red_and_white",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_huntsman/skins/red_and_white/mtr_outfit_red_and_white"
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_huntsman/skins/red_and_white/mtr_outfit_red_and_white_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.huntsman)
}
Cosmetics.skin_es_huntsman_red_and_white = table.clone(skin_es_huntsman_red_and_white)
local skin_es_huntsman_yellow_and_green = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_huntsman/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_huntsman/skins/yellow_and_green/chr_empire_soldier_huntsman_yellow_and_green",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_huntsman/skins/yellow_and_green/mtr_outfit_yellow_and_green"
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_huntsman/skins/yellow_and_green/mtr_outfit_yellow_and_green_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.huntsman)
}
Cosmetics.skin_es_huntsman_yellow_and_green = table.clone(skin_es_huntsman_yellow_and_green)
local skin_ww_default = {
	third_person_husk = "units/beings/player/way_watcher/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher/third_person_base/chr_third_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/way_watcher/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	always_hide_attachment_slots = {
		"slot_hat"
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
local skin_ww_shade_black_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_shade/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_shade/skins/black_and_gold/chr_way_watcher_shade_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_shade/skins/black_and_gold/mtr_outfit_black_and_gold"
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_shade/skins/black_and_gold/mtr_outfit_black_and_gold_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.shade)
}
Cosmetics.skin_ww_shade_black_and_gold = table.clone(skin_ww_shade_black_and_gold)
local skin_ww_shade_ash = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_shade/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_shade/skins/ash/chr_way_watcher_shade_ash",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_shade/skins/ash/mtr_outfit_ash"
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_shade/skins/ash/mtr_outfit_ash_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.shade)
}
Cosmetics.skin_ww_shade_ash = table.clone(skin_ww_shade_ash)
local skin_ww_shade_crimson = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_shade/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_shade/skins/crimson/chr_way_watcher_shade_crimson",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_shade/skins/crimson/mtr_outfit_crimson"
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_shade/skins/crimson/mtr_outfit_crimson_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.shade)
}
Cosmetics.skin_ww_shade_crimson = table.clone(skin_ww_shade_crimson)
local skin_ww_shade_emerald = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_shade/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_shade/skins/emerald/chr_way_watcher_shade_emerald",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_shade/skins/emerald/mtr_outfit_emerald"
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_shade/skins/emerald/mtr_outfit_emerald_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.shade)
}
Cosmetics.skin_ww_shade_emerald = table.clone(skin_ww_shade_emerald)
local skin_ww_shade_midnight = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_shade/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_shade/skins/midnight/chr_way_watcher_shade_midnight",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_shade/skins/midnight/mtr_outfit_midnight"
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_shade/skins/midnight/mtr_outfit_midnight_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.shade)
}
Cosmetics.skin_ww_shade_midnight = table.clone(skin_ww_shade_midnight)
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
local skin_ww_maidenguard_black_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_maiden_guard/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_maiden_guard/skins/black_and_gold/chr_way_watcher_maiden_guard_black_and_gold",
		third_person = {
			mtr_ww_mg_hat_01 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hat_01_black",
			mtr_outfit = "units/beings/player/way_watcher_maiden_guard/skins/black_and_gold/mtr_outfit_black_and_gold",
			mtr_ww_mg_hats_02 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hats_02_black",
			mtr_ww_mg_hats_01 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hats_01_black"
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_maiden_guard/skins/black_and_gold/mtr_outfit_black_and_gold_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.maiden_guard)
}
Cosmetics.skin_ww_maidenguard_black_and_gold = table.clone(skin_ww_maidenguard_black_and_gold)
local skin_ww_maidenguard_caledor = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_maiden_guard/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_maiden_guard/skins/caledor/chr_way_watcher_maiden_guard_caledor",
		third_person = {
			mtr_ww_mg_hat_01 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hat_01_green",
			mtr_outfit = "units/beings/player/way_watcher_maiden_guard/skins/caledor/mtr_outfit_caledor",
			mtr_ww_mg_hats_02 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hats_02_green",
			mtr_ww_mg_hats_01 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hats_01_green"
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_maiden_guard/skins/caledor/mtr_outfit_caledor_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.maiden_guard)
}
Cosmetics.skin_ww_maidenguard_caledor = table.clone(skin_ww_maidenguard_caledor)
local skin_ww_maidenguard_elyrion = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_maiden_guard/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_maiden_guard/skins/elyrion/chr_way_watcher_maiden_guard_elyrion",
		third_person = {
			mtr_ww_mg_hat_01 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hat_01_blue",
			mtr_outfit = "units/beings/player/way_watcher_maiden_guard/skins/elyrion/mtr_outfit_elyrion",
			mtr_ww_mg_hats_02 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hats_02_blue",
			mtr_ww_mg_hats_01 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hats_01_blue"
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_maiden_guard/skins/elyrion/mtr_outfit_elyrion_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.maiden_guard)
}
Cosmetics.skin_ww_maidenguard_elyrion = table.clone(skin_ww_maidenguard_elyrion)
local skin_ww_maidenguard_red_and_yellow = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_maiden_guard/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_maiden_guard/skins/red_and_yellow/chr_way_watcher_maiden_guard_red_and_yellow",
		third_person = {
			mtr_ww_mg_hat_01 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hat_01_red_yellow",
			mtr_outfit = "units/beings/player/way_watcher_maiden_guard/skins/red_and_yellow/mtr_outfit_red_and_yellow",
			mtr_ww_mg_hats_02 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hats_02_red_yellow",
			mtr_ww_mg_hats_01 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hats_01_red_yellow"
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_maiden_guard/skins/red_and_yellow/mtr_outfit_red_and_yellow_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.maiden_guard)
}
Cosmetics.skin_ww_maidenguard_red_and_yellow = table.clone(skin_ww_maidenguard_red_and_yellow)
local skin_ww_maidenguard_white_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_maiden_guard/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_maiden_guard/skins/white_and_gold/chr_way_watcher_maiden_guard_white_and_gold",
		third_person = {
			mtr_ww_mg_hat_01 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hat_01_white_gold",
			mtr_outfit = "units/beings/player/way_watcher_maiden_guard/skins/white_and_gold/mtr_outfit_white_and_gold",
			mtr_ww_mg_hats_02 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hats_02_white_gold",
			mtr_ww_mg_hats_01 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hats_01_white_gold"
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_maiden_guard/skins/white_and_gold/mtr_outfit_white_and_gold_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.maiden_guard)
}
Cosmetics.skin_ww_maidenguard_white_and_gold = table.clone(skin_ww_maidenguard_white_and_gold)
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
		package_name = "units/beings/player/way_watcher_upgraded/skins/helmgart/chr_way_watcher_upgraded_helmgart",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/helmgart/mtr_outfit_helmgart",
			mtr_outfit_ds = "units/beings/player/way_watcher_upgraded/skins/helmgart/mtr_outfit_helmgart_ds"
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/helmgart/mtr_outfit_helmgart_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.waywatcher)
}
Cosmetics.skin_ww_waywatcher_helmgart = table.clone(skin_ww_waywatcher_helmgart)
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
		package_name = "units/beings/player/way_watcher_upgraded/skins/anmyr/chr_way_watcher_upgraded_anmyr",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/anmyr/mtr_outfit_anmyr",
			mtr_outfit_ds = "units/beings/player/way_watcher_upgraded/skins/anmyr/mtr_outfit_anmyr_ds"
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
		package_name = "units/beings/player/way_watcher_upgraded/skins/atylwyth/chr_way_watcher_upgraded_atylwyth",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/atylwyth/mtr_outfit_atylwyth",
			mtr_outfit_ds = "units/beings/player/way_watcher_upgraded/skins/atylwyth/mtr_outfit_atylwyth_ds"
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
		package_name = "units/beings/player/way_watcher_upgraded/skins/black_and_gold/chr_way_watcher_upgraded_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/black_and_gold/mtr_outfit_black_and_gold",
			mtr_outfit_ds = "units/beings/player/way_watcher_upgraded/skins/black_and_gold/mtr_outfit_black_and_gold_ds"
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
		package_name = "units/beings/player/way_watcher_upgraded/skins/cythral/chr_way_watcher_upgraded_cythral",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/cythral/mtr_outfit_cythral",
			mtr_outfit_ds = "units/beings/player/way_watcher_upgraded/skins/cythral/mtr_outfit_cythral_ds"
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/cythral/mtr_outfit_cythral_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.waywatcher)
}
Cosmetics.skin_ww_waywatcher_cythral = table.clone(skin_ww_waywatcher_cythral)
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
		package_name = "units/beings/player/way_watcher_upgraded/skins/tirsyth/chr_way_watcher_upgraded_tirsyth",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/tirsyth/mtr_outfit_tirsyth",
			mtr_outfit_ds = "units/beings/player/way_watcher_upgraded/skins/tirsyth/mtr_outfit_tirsyth_ds"
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/tirsyth/mtr_outfit_tirsyth_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.waywatcher)
}
Cosmetics.skin_ww_waywatcher_tirsyth = table.clone(skin_ww_waywatcher_tirsyth)
local skin_wh_default = {
	third_person_husk = "units/beings/player/witch_hunter/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/witch_hunter/third_person_base/chr_third_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/witch_hunter/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	always_hide_attachment_slots = {
		"slot_hat"
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
		package_name = "units/beings/player/witch_hunter_captain/skins/helmgart/chr_witch_hunter_captain_helmgart",
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
		package_name = "units/beings/player/witch_hunter_captain/skins/black_and_gold/chr_witch_hunter_captain_black_and_gold",
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
		package_name = "units/beings/player/witch_hunter_captain/skins/grey_and_yellow/chr_witch_hunter_captain_grey_and_yellow",
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
		package_name = "units/beings/player/witch_hunter_captain/skins/middenland/chr_witch_hunter_captain_middenland",
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
		package_name = "units/beings/player/witch_hunter_captain/skins/ostermark/chr_witch_hunter_captain_ostermark",
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
		package_name = "units/beings/player/witch_hunter_captain/skins/ostland/chr_witch_hunter_captain_ostland",
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
local skin_wh_zealot_black_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_zealot/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/skins/black_and_gold/chr_witch_hunter_zealot_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_zealot/skins/black_and_gold/mtr_outfit_black_and_gold",
			mtr_outfit_ds = "units/beings/player/witch_hunter_zealot/skins/black_and_gold/mtr_outfit_ds_black_and_gold"
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_zealot/skins/black_and_gold/mtr_outfit_black_and_gold_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.zealot)
}
Cosmetics.skin_wh_zealot_black_and_gold = table.clone(skin_wh_zealot_black_and_gold)
local skin_wh_zealot_crimson = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_zealot/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/skins/crimson/chr_witch_hunter_zealot_crimson",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_zealot/skins/crimson/mtr_outfit_crimson",
			mtr_outfit_ds = "units/beings/player/witch_hunter_zealot/skins/crimson/mtr_outfit_ds_crimson"
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_zealot/skins/crimson/mtr_outfit_crimson_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.zealot)
}
Cosmetics.skin_wh_zealot_crimson = table.clone(skin_wh_zealot_crimson)
local skin_wh_zealot_green_and_yellow = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_zealot/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/skins/green_and_yellow/chr_witch_hunter_zealot_green_and_yellow",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_zealot/skins/green_and_yellow/mtr_outfit_green_and_yellow",
			mtr_outfit_ds = "units/beings/player/witch_hunter_zealot/skins/green_and_yellow/mtr_outfit_ds_green_and_yellow"
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_zealot/skins/green_and_yellow/mtr_outfit_green_and_yellow_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.zealot)
}
Cosmetics.skin_wh_zealot_green_and_yellow = table.clone(skin_wh_zealot_green_and_yellow)
local skin_wh_zealot_middenland = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_zealot/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/skins/middenland/chr_witch_hunter_zealot_middenland",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_zealot/skins/middenland/mtr_outfit_middenland",
			mtr_outfit_ds = "units/beings/player/witch_hunter_zealot/skins/middenland/mtr_outfit_ds_middenland"
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_zealot/skins/middenland/mtr_outfit_middenland_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.zealot)
}
Cosmetics.skin_wh_zealot_middenland = table.clone(skin_wh_zealot_middenland)
local skin_wh_zealot_pure = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_zealot/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/skins/pure/chr_witch_hunter_zealot_pure",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_zealot/skins/pure/mtr_outfit_pure",
			mtr_outfit_ds = "units/beings/player/witch_hunter_zealot/skins/pure/mtr_outfit_ds_pure"
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_zealot/skins/pure/mtr_outfit_pure_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.zealot)
}
Cosmetics.skin_wh_zealot_pure = table.clone(skin_wh_zealot_pure)
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
local skin_wh_bountyhunter_black_and_gold = {
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
		package_name = "units/beings/player/witch_hunter_bounty_hunter/skins/black_and_gold/chr_witch_hunter_bounty_hunter_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_bounty_hunter/skins/black_and_gold/mtr_outfit_black_and_gold"
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_bounty_hunter/skins/black_and_gold/mtr_outfit_black_and_gold_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.bounty_hunter)
}
Cosmetics.skin_wh_bountyhunter_black_and_gold = table.clone(skin_wh_bountyhunter_black_and_gold)
local skin_wh_bountyhunter_brown_and_white = {
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
		package_name = "units/beings/player/witch_hunter_bounty_hunter/skins/brown_and_white/chr_witch_hunter_bounty_hunter_brown_and_white",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_bounty_hunter/skins/brown_and_white/mtr_outfit_brown_and_white"
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_bounty_hunter/skins/brown_and_white/mtr_outfit_brown_and_white_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.bounty_hunter)
}
Cosmetics.skin_wh_bountyhunter_brown_and_white = table.clone(skin_wh_bountyhunter_brown_and_white)
local skin_wh_bountyhunter_green_and_yellow = {
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
		package_name = "units/beings/player/witch_hunter_bounty_hunter/skins/green_and_yellow/chr_witch_hunter_bounty_hunter_green_and_yellow",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_bounty_hunter/skins/green_and_yellow/mtr_outfit_green_and_yellow"
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_bounty_hunter/skins/green_and_yellow/mtr_outfit_green_and_yellow_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.bounty_hunter)
}
Cosmetics.skin_wh_bountyhunter_green_and_yellow = table.clone(skin_wh_bountyhunter_green_and_yellow)
local skin_wh_bountyhunter_middenland = {
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
		package_name = "units/beings/player/witch_hunter_bounty_hunter/skins/middenland/chr_witch_hunter_bounty_hunter_middenland",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_bounty_hunter/skins/middenland/mtr_outfit_middenland"
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_bounty_hunter/skins/middenland/mtr_outfit_middenland_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.bounty_hunter)
}
Cosmetics.skin_wh_bountyhunter_middenland = table.clone(skin_wh_bountyhunter_middenland)
local skin_wh_bountyhunter_yellow_and_red = {
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
		package_name = "units/beings/player/witch_hunter_bounty_hunter/skins/yellow_and_red/chr_witch_hunter_bounty_hunter_yellow_and_red",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_bounty_hunter/skins/yellow_and_red/mtr_outfit_yellow_and_red"
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_bounty_hunter/skins/yellow_and_red/mtr_outfit_yellow_and_red_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.bounty_hunter)
}
Cosmetics.skin_wh_bountyhunter_yellow_and_red = table.clone(skin_wh_bountyhunter_yellow_and_red)
local skin_bw_default = {
	third_person_husk = "units/beings/player/bright_wizard/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard/third_person_base/chr_third_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/bright_wizard/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	always_hide_attachment_slots = {
		"slot_hat"
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
local skin_bw_unchained_ash = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_unchained/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_unchained/skins/ash/chr_bright_wizard_unchained_ash",
		third_person = {
			mtr_body = "units/beings/player/bright_wizard_unchained/skins/ash/mtr_outfit_ash"
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_unchained/skins/ash/mtr_outfit_ash_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.unchained)
}
Cosmetics.skin_bw_unchained_ash = table.clone(skin_bw_unchained_ash)
local skin_bw_unchained_black_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_unchained/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_unchained/skins/black_and_gold/chr_bright_wizard_unchained_black_and_gold",
		third_person = {
			mtr_body = "units/beings/player/bright_wizard_unchained/skins/black_and_gold/mtr_outfit_black_and_gold"
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_unchained/skins/black_and_gold/mtr_outfit_black_and_gold_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.unchained)
}
Cosmetics.skin_bw_unchained_black_and_gold = table.clone(skin_bw_unchained_black_and_gold)
local skin_bw_unchained_bronze = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_unchained/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_unchained/skins/bronze/chr_bright_wizard_unchained_bronze",
		third_person = {
			mtr_body = "units/beings/player/bright_wizard_unchained/skins/bronze/mtr_outfit_bronze"
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_unchained/skins/bronze/mtr_outfit_bronze_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.unchained)
}
Cosmetics.skin_bw_unchained_bronze = table.clone(skin_bw_unchained_bronze)
local skin_bw_unchained_brown_and_white = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_unchained/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_unchained/skins/brown_and_white/chr_bright_wizard_unchained_brown_and_white",
		third_person = {
			mtr_body = "units/beings/player/bright_wizard_unchained/skins/brown_and_white/mtr_outfit_brown_and_white"
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_unchained/skins/brown_and_white/mtr_outfit_brown_and_white_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.unchained)
}
Cosmetics.skin_bw_unchained_brown_and_white = table.clone(skin_bw_unchained_brown_and_white)
local skin_bw_unchained_ostermark = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_unchained/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_unchained/skins/ostermark/chr_bright_wizard_unchained_ostermark",
		third_person = {
			mtr_body = "units/beings/player/bright_wizard_unchained/skins/ostermark/mtr_outfit_ostermark"
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_unchained/skins/ostermark/mtr_outfit_ostermark_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.unchained)
}
Cosmetics.skin_bw_unchained_ostermark = table.clone(skin_bw_unchained_ostermark)
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
local skin_bw_scholar_ash = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_scholar/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_scholar/skins/ash/chr_bright_wizard_scholar_ash",
		third_person = {
			mtr_body = "units/beings/player/bright_wizard_scholar/skins/ash/mtr_outfit_ash"
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_scholar/skins/ash/mtr_outfit_ash_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.scholar)
}
Cosmetics.skin_bw_scholar_ash = table.clone(skin_bw_scholar_ash)
local skin_bw_scholar_black_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_scholar/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_scholar/skins/black_and_gold/chr_bright_wizard_scholar_black_and_gold",
		third_person = {
			mtr_body = "units/beings/player/bright_wizard_scholar/skins/black_and_gold/mtr_outfit_black_and_gold"
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_scholar/skins/black_and_gold/mtr_outfit_black_and_gold_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.scholar)
}
Cosmetics.skin_bw_scholar_black_and_gold = table.clone(skin_bw_scholar_black_and_gold)
local skin_bw_scholar_bronze = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_scholar/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_scholar/skins/bronze/chr_bright_wizard_scholar_bronze",
		third_person = {
			mtr_body = "units/beings/player/bright_wizard_scholar/skins/bronze/mtr_outfit_bronze"
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_scholar/skins/bronze/mtr_outfit_bronze_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.scholar)
}
Cosmetics.skin_bw_scholar_bronze = table.clone(skin_bw_scholar_bronze)
local skin_bw_scholar_brown_and_white = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_scholar/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_scholar/skins/brown_and_white/chr_bright_wizard_scholar_brown_and_white",
		third_person = {
			mtr_body = "units/beings/player/bright_wizard_scholar/skins/brown_and_white/mtr_outfit_brown_and_white"
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_scholar/skins/brown_and_white/mtr_outfit_brown_and_white_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.scholar)
}
Cosmetics.skin_bw_scholar_brown_and_white = table.clone(skin_bw_scholar_brown_and_white)
local skin_bw_scholar_ostermark = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_scholar/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_scholar/skins/ostermark/chr_bright_wizard_scholar_ostermark",
		third_person = {
			mtr_body = "units/beings/player/bright_wizard_scholar/skins/ostermark/mtr_outfit_ostermark"
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_scholar/skins/ostermark/mtr_outfit_ostermark_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.scholar)
}
Cosmetics.skin_bw_scholar_ostermark = table.clone(skin_bw_scholar_ostermark)
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
		package_name = "units/beings/player/bright_wizard_adept/skins/helmgart/chr_bright_wizard_adept_helmgart",
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
		package_name = "units/beings/player/bright_wizard_adept/skins/ash/chr_bright_wizard_adept_ash",
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
		package_name = "units/beings/player/bright_wizard_adept/skins/black_and_gold/chr_bright_wizard_adept_black_and_gold",
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
		package_name = "units/beings/player/bright_wizard_adept/skins/brown_and_yellow/chr_bright_wizard_adept_brown_and_yellow",
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
		package_name = "units/beings/player/bright_wizard_adept/skins/ostermark/chr_bright_wizard_adept_ostermark",
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
		package_name = "units/beings/player/bright_wizard_adept/skins/ostland/chr_bright_wizard_adept_ostland",
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
local frame_0000 = {
	icon = "unit_frame_02"
}
Cosmetics.frame_0000 = table.clone(frame_0000)
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
local frame_0007 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0007 = table.clone(frame_0007)
local frame_0008 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0008 = table.clone(frame_0008)
local frame_0009 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0009 = table.clone(frame_0009)
local frame_0010 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0010 = table.clone(frame_0010)
local frame_0011 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0011 = table.clone(frame_0011)
local frame_0012 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0012 = table.clone(frame_0012)
local frame_0013 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0013 = table.clone(frame_0013)
local frame_0014 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0014 = table.clone(frame_0014)
local frame_0015 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0015 = table.clone(frame_0015)
local frame_0016 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0016 = table.clone(frame_0016)
local frame_0017 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0017 = table.clone(frame_0017)
local frame_0018 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0018 = table.clone(frame_0018)
local frame_0019 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0019 = table.clone(frame_0019)
local frame_0020 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0020 = table.clone(frame_0020)
local frame_0021 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0021 = table.clone(frame_0021)
local frame_0022 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0022 = table.clone(frame_0022)
local frame_0023 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0023 = table.clone(frame_0023)
local frame_0024 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0024 = table.clone(frame_0024)
local frame_0025 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0025 = table.clone(frame_0025)
local frame_0026 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0026 = table.clone(frame_0026)
local frame_0027 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0027 = table.clone(frame_0027)
local frame_0028 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0028 = table.clone(frame_0028)
local frame_0029 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0029 = table.clone(frame_0029)
local frame_0030 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0030 = table.clone(frame_0030)
local frame_0031 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0031 = table.clone(frame_0031)
local frame_0032 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0032 = table.clone(frame_0032)
local frame_0033 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0033 = table.clone(frame_0033)
local frame_0034 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0034 = table.clone(frame_0034)
local frame_0035 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0035 = table.clone(frame_0035)
local frame_0036 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0036 = table.clone(frame_0036)
local frame_0037 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0037 = table.clone(frame_0037)
local frame_0038 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0038 = table.clone(frame_0038)
local frame_0039 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0039 = table.clone(frame_0039)
local frame_0040 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0040 = table.clone(frame_0040)
local frame_0041 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0041 = table.clone(frame_0041)
local frame_0042 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0042 = table.clone(frame_0042)
local frame_0043 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0043 = table.clone(frame_0043)
local frame_0044 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0044 = table.clone(frame_0044)
local frame_0045 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0045 = table.clone(frame_0045)
local frame_0046 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0046 = table.clone(frame_0046)
local frame_0047 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0047 = table.clone(frame_0047)
local frame_0048 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0048 = table.clone(frame_0048)
local frame_0049 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0049 = table.clone(frame_0049)
local frame_0050 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0050 = table.clone(frame_0050)
local frame_0051 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0051 = table.clone(frame_0051)
local frame_0052 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0052 = table.clone(frame_0052)
local frame_0053 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0053 = table.clone(frame_0053)
local frame_0054 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0054 = table.clone(frame_0054)
local frame_0055 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0055 = table.clone(frame_0055)
local frame_0056 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0056 = table.clone(frame_0056)
local frame_0057 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0057 = table.clone(frame_0057)
local frame_0058 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0058 = table.clone(frame_0058)
local frame_0059 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0059 = table.clone(frame_0059)
local frame_0060 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0060 = table.clone(frame_0060)
local frame_0061 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0061 = table.clone(frame_0061)
local frame_0062 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0062 = table.clone(frame_0062)
local frame_0063 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0063 = table.clone(frame_0063)
local frame_0064 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0064 = table.clone(frame_0064)
local frame_0065 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0065 = table.clone(frame_0065)
local frame_0066 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0066 = table.clone(frame_0066)
local frame_0067 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0067 = table.clone(frame_0067)
local frame_0068 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0068 = table.clone(frame_0068)
local frame_0069 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0069 = table.clone(frame_0069)
local frame_0070 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0070 = table.clone(frame_0070)
local frame_0071 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0071 = table.clone(frame_0071)
local frame_0072 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0072 = table.clone(frame_0072)
local frame_0073 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0073 = table.clone(frame_0073)
local frame_0074 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0074 = table.clone(frame_0074)
local frame_0075 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0075 = table.clone(frame_0075)
local frame_0076 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0076 = table.clone(frame_0076)
local frame_0077 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0077 = table.clone(frame_0077)
local frame_0078 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0078 = table.clone(frame_0078)
local frame_0079 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0079 = table.clone(frame_0079)
local frame_0080 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0080 = table.clone(frame_0080)
local frame_0081 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0081 = table.clone(frame_0081)
local frame_dev = {
	icon = "unit_frame_02"
}
Cosmetics.frame_dev = table.clone(frame_dev)
local frame_collectors_edition = {
	icon = "unit_frame_02"
}
Cosmetics.frame_collectors_edition = table.clone(frame_collectors_edition)
local frame_collectors_edition_preorder = {
	icon = "unit_frame_02"
}
Cosmetics.frame_collectors_edition_preorder = table.clone(frame_collectors_edition_preorder)
local frame_community_01 = {
	icon = "unit_frame_02"
}
Cosmetics.frame_community_01 = table.clone(frame_community_01)
local frame_skulls = {
	icon = "unit_frame_02"
}
Cosmetics.frame_skulls = table.clone(frame_skulls)
local frame_summer = {
	icon = "unit_frame_02"
}
Cosmetics.frame_summer = table.clone(frame_summer)
local frame_bogenhafen_01 = {
	icon = "unit_frame_02"
}
Cosmetics.frame_bogenhafen_01 = table.clone(frame_bogenhafen_01)
local frame_bogenhafen_02 = {
	icon = "unit_frame_02"
}
Cosmetics.frame_bogenhafen_02 = table.clone(frame_bogenhafen_02)
local frame_bogenhafen_03 = {
	icon = "unit_frame_02"
}
Cosmetics.frame_bogenhafen_03 = table.clone(frame_bogenhafen_03)
local frame_bogenhafen_04 = {
	icon = "unit_frame_02"
}
Cosmetics.frame_bogenhafen_04 = table.clone(frame_bogenhafen_04)

for name, cosmetic_data in pairs(Cosmetics) do
	cosmetic_data.name = name
end

return
