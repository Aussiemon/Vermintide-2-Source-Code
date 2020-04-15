require("scripts/settings/equipment/player_wwise_dependencies")
require("scripts/utils/cosmetics_utils")

Cosmetics = {
	skin_dr_default = {
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
	},
	skin_dr_ironbreaker = {
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
	},
	skin_dr_ironbreaker_black_and_gold = {
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
	},
	skin_dr_ironbreaker_blue = {
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
	},
	skin_dr_ironbreaker_crimson = {
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
	},
	skin_dr_ironbreaker_green = {
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
	},
	skin_dr_ironbreaker_iron = {
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
	},
	skin_dr_slayer = {
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
	},
	skin_dr_slayer_axe = {
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
	},
	skin_dr_slayer_dragon = {
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
	},
	skin_dr_slayer_skaven = {
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
	},
	skin_dr_slayer_skull = {
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
	},
	skin_dr_slayer_runes = {
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
	},
	skin_dr_slayer_wing = {
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
	},
	skin_dr_slayer_skull = {
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
	},
	skin_dr_ranger = {
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
	},
	skin_dr_ranger_helmgart = {
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
	},
	skin_dr_ranger_barak_varr = {
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
	},
	skin_dr_ranger_black_and_gold = {
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
	},
	skin_dr_ranger_brown_and_yellow = {
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
	},
	skin_dr_ranger_karak_norn = {
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
	},
	skin_dr_ranger_zhufbar = {
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
	},
	skin_es_default = {
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
	},
	skin_es_knight = {
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
	},
	skin_es_knight_black_and_gold = {
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
	},
	skin_es_knight_bronze = {
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
	},
	skin_es_knight_green = {
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
	},
	skin_es_knight_middenland = {
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
	},
	skin_es_knight_red = {
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
	},
	skin_es_mercenary = {
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
	},
	skin_es_mercenary_helmgart = {
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
	},
	skin_es_mercenary_black_and_gold = {
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
	},
	skin_es_mercenary_carroburg = {
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
	},
	skin_es_mercenary_middenland = {
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
	},
	skin_es_mercenary_ostermark = {
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
	},
	skin_es_mercenary_ostland = {
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
	},
	skin_es_huntsman = {
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
	},
	skin_es_huntsman_black_and_gold = {
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
	},
	skin_es_huntsman_middenland = {
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
	},
	skin_es_huntsman_ostermark = {
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
	},
	skin_es_huntsman_red_and_white = {
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
	},
	skin_es_huntsman_yellow_and_green = {
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
	},
	skin_ww_default = {
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
	},
	skin_ww_shade = {
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
	},
	skin_ww_shade_black_and_gold = {
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
	},
	skin_ww_shade_ash = {
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
	},
	skin_ww_shade_crimson = {
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
	},
	skin_ww_shade_emerald = {
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
	},
	skin_ww_shade_midnight = {
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
	},
	skin_ww_maidenguard = {
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
	},
	skin_ww_maidenguard_black_and_gold = {
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
	},
	skin_ww_maidenguard_caledor = {
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
	},
	skin_ww_maidenguard_elyrion = {
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
	},
	skin_ww_maidenguard_red_and_yellow = {
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
	},
	skin_ww_maidenguard_white_and_gold = {
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
	},
	skin_ww_waywatcher = {
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
	},
	skin_ww_waywatcher_helmgart = {
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
	},
	skin_ww_waywatcher_anmyr = {
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
	},
	skin_ww_waywatcher_atylwyth = {
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
	},
	skin_ww_waywatcher_black_and_gold = {
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
	},
	skin_ww_waywatcher_cythral = {
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
	},
	skin_ww_waywatcher_tirsyth = {
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
	},
	skin_wh_default = {
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
	},
	skin_wh_captain = {
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
	},
	skin_wh_captain_helmgart = {
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
	},
	skin_wh_captain_black_and_gold = {
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
	},
	skin_wh_captain_grey_and_yellow = {
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
	},
	skin_wh_captain_middenland = {
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
	},
	skin_wh_captain_ostermark = {
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
	},
	skin_wh_captain_ostland = {
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
	},
	skin_wh_zealot = {
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
	},
	skin_wh_zealot_black_and_gold = {
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
	},
	skin_wh_zealot_crimson = {
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
	},
	skin_wh_zealot_green_and_yellow = {
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
	},
	skin_wh_zealot_middenland = {
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
	},
	skin_wh_zealot_pure = {
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
	},
	skin_wh_bountyhunter = {
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
	},
	skin_wh_bountyhunter_black_and_gold = {
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
	},
	skin_wh_bountyhunter_brown_and_white = {
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
	},
	skin_wh_bountyhunter_green_and_yellow = {
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
	},
	skin_wh_bountyhunter_middenland = {
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
	},
	skin_wh_bountyhunter_yellow_and_red = {
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
	},
	skin_bw_default = {
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
	},
	skin_bw_unchained = {
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
	},
	skin_bw_unchained_ash = {
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
	},
	skin_bw_unchained_black_and_gold = {
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
	},
	skin_bw_unchained_bronze = {
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
	},
	skin_bw_unchained_brown_and_white = {
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
	},
	skin_bw_unchained_ostermark = {
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
	},
	skin_bw_scholar = {
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
	},
	skin_bw_scholar_ash = {
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
	},
	skin_bw_scholar_black_and_gold = {
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
	},
	skin_bw_scholar_bronze = {
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
	},
	skin_bw_scholar_brown_and_white = {
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
	},
	skin_bw_scholar_ostermark = {
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
	},
	skin_bw_adept = {
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
	},
	skin_bw_adept_helmgart = {
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
	},
	skin_bw_adept_ash = {
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
	},
	skin_bw_adept_black_and_gold = {
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
	},
	skin_bw_adept_brown_and_yellow = {
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
	},
	skin_bw_adept_ostermark = {
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
	},
	skin_bw_adept_ostland = {
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
	},
	frame_0000 = {
		icon = "unit_frame_02"
	},
	frame_0001 = {
		icon = "unit_frame_02"
	},
	frame_0002 = {
		icon = "unit_frame_03"
	},
	frame_0003 = {
		icon = "unit_frame_04"
	},
	frame_0004 = {
		icon = "unit_frame_05"
	},
	frame_0005 = {
		icon = "unit_frame_06"
	},
	frame_0006 = {
		icon = "unit_frame_07"
	},
	frame_0007 = {
		icon = "unit_frame_07"
	},
	frame_0008 = {
		icon = "unit_frame_07"
	},
	frame_0009 = {
		icon = "unit_frame_07"
	},
	frame_0010 = {
		icon = "unit_frame_07"
	},
	frame_0011 = {
		icon = "unit_frame_07"
	},
	frame_0012 = {
		icon = "unit_frame_07"
	},
	frame_0013 = {
		icon = "unit_frame_07"
	},
	frame_0014 = {
		icon = "unit_frame_07"
	},
	frame_0015 = {
		icon = "unit_frame_07"
	},
	frame_0016 = {
		icon = "unit_frame_07"
	},
	frame_0017 = {
		icon = "unit_frame_07"
	},
	frame_0018 = {
		icon = "unit_frame_07"
	},
	frame_0019 = {
		icon = "unit_frame_07"
	},
	frame_0020 = {
		icon = "unit_frame_07"
	},
	frame_0021 = {
		icon = "unit_frame_07"
	},
	frame_0022 = {
		icon = "unit_frame_07"
	},
	frame_0023 = {
		icon = "unit_frame_07"
	},
	frame_0024 = {
		icon = "unit_frame_07"
	},
	frame_0025 = {
		icon = "unit_frame_07"
	},
	frame_0026 = {
		icon = "unit_frame_07"
	},
	frame_0027 = {
		icon = "unit_frame_07"
	},
	frame_0028 = {
		icon = "unit_frame_07"
	},
	frame_0029 = {
		icon = "unit_frame_07"
	},
	frame_0030 = {
		icon = "unit_frame_07"
	},
	frame_0031 = {
		icon = "unit_frame_07"
	},
	frame_0032 = {
		icon = "unit_frame_07"
	},
	frame_0033 = {
		icon = "unit_frame_07"
	},
	frame_0034 = {
		icon = "unit_frame_07"
	},
	frame_0035 = {
		icon = "unit_frame_07"
	},
	frame_0036 = {
		icon = "unit_frame_07"
	},
	frame_0037 = {
		icon = "unit_frame_07"
	},
	frame_0038 = {
		icon = "unit_frame_07"
	},
	frame_0039 = {
		icon = "unit_frame_07"
	},
	frame_0040 = {
		icon = "unit_frame_07"
	},
	frame_0041 = {
		icon = "unit_frame_07"
	},
	frame_0042 = {
		icon = "unit_frame_07"
	},
	frame_0043 = {
		icon = "unit_frame_07"
	},
	frame_0044 = {
		icon = "unit_frame_07"
	},
	frame_0045 = {
		icon = "unit_frame_07"
	},
	frame_0046 = {
		icon = "unit_frame_07"
	},
	frame_0047 = {
		icon = "unit_frame_07"
	},
	frame_0048 = {
		icon = "unit_frame_07"
	},
	frame_0049 = {
		icon = "unit_frame_07"
	},
	frame_0050 = {
		icon = "unit_frame_07"
	},
	frame_0051 = {
		icon = "unit_frame_07"
	},
	frame_0052 = {
		icon = "unit_frame_07"
	},
	frame_0053 = {
		icon = "unit_frame_07"
	},
	frame_0054 = {
		icon = "unit_frame_07"
	},
	frame_0055 = {
		icon = "unit_frame_07"
	},
	frame_0056 = {
		icon = "unit_frame_07"
	},
	frame_0057 = {
		icon = "unit_frame_07"
	},
	frame_0058 = {
		icon = "unit_frame_07"
	},
	frame_0059 = {
		icon = "unit_frame_07"
	},
	frame_0060 = {
		icon = "unit_frame_07"
	},
	frame_0061 = {
		icon = "unit_frame_07"
	},
	frame_0062 = {
		icon = "unit_frame_07"
	},
	frame_0063 = {
		icon = "unit_frame_07"
	},
	frame_0064 = {
		icon = "unit_frame_07"
	},
	frame_0065 = {
		icon = "unit_frame_07"
	},
	frame_0066 = {
		icon = "unit_frame_07"
	},
	frame_0067 = {
		icon = "unit_frame_07"
	},
	frame_0068 = {
		icon = "unit_frame_07"
	},
	frame_0069 = {
		icon = "unit_frame_07"
	},
	frame_0070 = {
		icon = "unit_frame_07"
	},
	frame_0071 = {
		icon = "unit_frame_07"
	},
	frame_0072 = {
		icon = "unit_frame_07"
	},
	frame_0073 = {
		icon = "unit_frame_07"
	},
	frame_0074 = {
		icon = "unit_frame_07"
	},
	frame_0075 = {
		icon = "unit_frame_07"
	},
	frame_0076 = {
		icon = "unit_frame_07"
	},
	frame_0077 = {
		icon = "unit_frame_07"
	},
	frame_0078 = {
		icon = "unit_frame_07"
	},
	frame_0079 = {
		icon = "unit_frame_07"
	},
	frame_0080 = {
		icon = "unit_frame_07"
	},
	frame_0081 = {
		icon = "unit_frame_07"
	},
	frame_0084 = {
		icon = "unit_frame_07"
	},
	frame_0085 = {
		icon = "unit_frame_07"
	},
	frame_0086 = {
		icon = "unit_frame_07"
	},
	frame_0087 = {
		icon = "unit_frame_07"
	},
	frame_0089 = {
		icon = "unit_frame_07"
	},
	frame_0090 = {
		icon = "unit_frame_07"
	},
	frame_0091 = {
		icon = "unit_frame_02"
	},
	frame_0094 = {
		icon = "unit_frame_02"
	},
	frame_0095 = {
		icon = "unit_frame_02"
	},
	frame_0096 = {
		icon = "unit_frame_02"
	},
	frame_dev = {
		icon = "unit_frame_02"
	},
	frame_bear = {
		icon = "unit_frame_02"
	},
	frame_collectors_edition = {
		icon = "unit_frame_02"
	},
	frame_collectors_edition_preorder = {
		icon = "unit_frame_02"
	},
	frame_community_01 = {
		icon = "unit_frame_02"
	},
	frame_skulls = {
		icon = "unit_frame_02"
	},
	frame_year_of_the_rat = {
		icon = "unit_frame_02"
	},
	frame_summer = {
		icon = "unit_frame_02"
	},
	frame_geheimnisnacht_01 = {
		icon = "unit_frame_02"
	},
	frame_geheimnisnacht_02 = {
		icon = "unit_frame_02"
	},
	frame_geheimnisnacht_03 = {
		icon = "unit_frame_02"
	},
	frame_bogenhafen_01 = {
		icon = "unit_frame_02"
	},
	frame_bogenhafen_02 = {
		icon = "unit_frame_02"
	},
	frame_bogenhafen_03 = {
		icon = "unit_frame_02"
	},
	frame_bogenhafen_04 = {
		icon = "unit_frame_02"
	},
	frame_holly_01 = {
		icon = "unit_frame_02"
	},
	frame_holly_02 = {
		icon = "unit_frame_02"
	},
	frame_holly_03 = {
		icon = "unit_frame_02"
	},
	frame_holly_04 = {
		icon = "unit_frame_02"
	},
	frame_mondstille_01 = {
		icon = "unit_frame_02"
	},
	frame_mondstille_02 = {
		icon = "unit_frame_02"
	},
	frame_mondstille_03 = {
		icon = "unit_frame_02"
	},
	frame_celebration_01 = {
		icon = "unit_frame_02"
	},
	frame_celebration_02 = {
		icon = "unit_frame_02"
	},
	frame_celebration_03 = {
		icon = "unit_frame_02"
	},
	frame_scorpion_complete_all_helmgart_levels_cataclysm = {
		icon = "unit_frame_02"
	},
	frame_scorpion_complete_all_helmgart_level_achievements_cataclysm = {
		icon = "unit_frame_02"
	},
	frame_scorpion_complete_bogenhafen_cataclysm = {
		icon = "unit_frame_02"
	},
	frame_scorpion_complete_plaza_cataclysm = {
		icon = "unit_frame_02"
	},
	frame_scorpion_complete_crater_recruit = {
		icon = "unit_frame_02"
	},
	frame_scorpion_complete_crater_veteran = {
		icon = "unit_frame_02"
	},
	frame_scorpion_complete_crater_champion = {
		icon = "unit_frame_02"
	},
	frame_scorpion_complete_crater_legend = {
		icon = "unit_frame_02"
	},
	frame_scorpion_complete_crater_cataclysm = {
		icon = "unit_frame_02"
	},
	frame_scorpion_season_1_beasts = {
		icon = "unit_frame_02"
	},
	frame_scorpion_season_1_death = {
		icon = "unit_frame_02"
	},
	frame_scorpion_season_1_fire = {
		icon = "unit_frame_02"
	},
	frame_scorpion_season_1_heavens = {
		icon = "unit_frame_02"
	},
	frame_scorpion_season_1_life = {
		icon = "unit_frame_02"
	},
	frame_scorpion_season_1_light = {
		icon = "unit_frame_02"
	},
	frame_scorpion_season_1_metal = {
		icon = "unit_frame_02"
	},
	frame_scorpion_season_1_shadow = {
		icon = "unit_frame_02"
	},
	frame_scorpion_season_1_cataclysm_1 = {
		icon = "unit_frame_02"
	},
	frame_scorpion_season_1_cataclysm_2 = {
		icon = "unit_frame_02"
	},
	frame_scorpion_season_1_cataclysm_3 = {
		icon = "unit_frame_02"
	},
	frame_scorpion_season_1_leaderboard_1 = {
		icon = "unit_frame_02"
	},
	frame_scorpion_season_1_leaderboard_2 = {
		icon = "unit_frame_02"
	},
	frame_scorpion_season_1_leaderboard_3 = {
		icon = "unit_frame_02"
	}
}

for _, dlc in pairs(DLCSettings) do
	local files_names = dlc.cosmetics_files

	if files_names then
		for _, file_name in ipairs(files_names) do
			local cosmetics_templates = require(file_name)

			if cosmetics_templates then
				for template_name, template in pairs(cosmetics_templates) do
					Cosmetics[template_name] = template
				end
			end
		end
	end
end

for name, cosmetic_data in pairs(Cosmetics) do
	cosmetic_data.name = name
end

return
