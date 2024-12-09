-- chunkname: @scripts/settings/equipment/cosmetics.lua

require("scripts/settings/equipment/skin_material_settings_templates")
require("scripts/utils/cosmetics_utils")

Cosmetics = {}
Cosmetics.skin_dr_default = {
	career = 1,
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_husk_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/dwarf_ranger/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.bardin,
	},
	always_hide_attachment_slots = {
		"slot_hat",
	},
}
Cosmetics.skin_dr_ironbreaker = {
	career = 1,
	equip_hat_event = "show_beard_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_husk_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_ironbreaker/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.bardin,
	},
}
Cosmetics.skin_dr_ironbreaker_black_and_gold = {
	career = 1,
	equip_hat_event = "show_beard_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_husk_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_ironbreaker/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.bardin,
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_ironbreaker/skins/black_and_gold/chr_dwarf_ranger_ironbreaker_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_ironbreaker/skins/black_and_gold/mtr_outfit_black_and_gold",
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_ironbreaker/skins/black_and_gold/mtr_outfit_black_and_gold_1p",
		},
	},
}
Cosmetics.skin_dr_ironbreaker_blue = {
	career = 1,
	equip_hat_event = "show_beard_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_husk_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_ironbreaker/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.bardin,
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_ironbreaker/skins/blue/chr_dwarf_ranger_ironbreaker_blue",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_ironbreaker/skins/blue/mtr_outfit_blue",
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_ironbreaker/skins/blue/mtr_outfit_blue_1p",
		},
	},
}
Cosmetics.skin_dr_ironbreaker_crimson = {
	career = 1,
	equip_hat_event = "show_beard_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_husk_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_ironbreaker/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.bardin,
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_ironbreaker/skins/crimson/chr_dwarf_ranger_ironbreaker_crimson",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_ironbreaker/skins/crimson/mtr_outfit_crimson",
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_ironbreaker/skins/crimson/mtr_outfit_crimson_1p",
		},
	},
}
Cosmetics.skin_dr_ironbreaker_green = {
	career = 1,
	equip_hat_event = "show_beard_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_husk_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_ironbreaker/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.bardin,
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_ironbreaker/skins/green/chr_dwarf_ranger_ironbreaker_green",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_ironbreaker/skins/green/mtr_outfit_green",
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_ironbreaker/skins/green/mtr_outfit_green_1p",
		},
	},
}
Cosmetics.skin_dr_ironbreaker_iron = {
	career = 1,
	equip_hat_event = "show_beard_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_husk_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_ironbreaker/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.bardin,
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_ironbreaker/skins/iron/chr_dwarf_ranger_ironbreaker_iron",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_ironbreaker/skins/iron/mtr_outfit_iron",
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_ironbreaker/skins/iron/mtr_outfit_iron_1p",
		},
	},
}
Cosmetics.skin_dr_slayer = {
	career = 2,
	equip_hat_event = "show_beard_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_husk_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.bardin,
	},
}
Cosmetics.skin_dr_slayer_axe = {
	career = 2,
	equip_hat_event = "show_beard_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_husk_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.bardin,
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/skins/axe/chr_dwarf_ranger_slayer_axe",
		third_person = {
			mtr_body = "units/beings/player/dwarf_ranger_slayer/skins/axe/mtr_body_axe",
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/axe/mtr_outfit_axe",
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/axe/mtr_outfit_axe_1p",
			mtr_skin = "units/beings/player/dwarf_ranger_slayer/skins/axe/mtr_body_axe_1p",
		},
	},
}
Cosmetics.skin_dr_slayer_dragon = {
	career = 2,
	equip_hat_event = "show_beard_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_husk_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.bardin,
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/skins/dragon/chr_dwarf_ranger_slayer_dragon",
		third_person = {
			mtr_body = "units/beings/player/dwarf_ranger_slayer/skins/dragon/mtr_body_dragon",
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/dragon/mtr_outfit_dragon",
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/dragon/mtr_outfit_dragon_1p",
			mtr_skin = "units/beings/player/dwarf_ranger_slayer/skins/dragon/mtr_body_dragon_1p",
		},
	},
}
Cosmetics.skin_dr_slayer_skaven = {
	career = 2,
	equip_hat_event = "show_beard_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_husk_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.bardin,
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/skins/skaven/chr_dwarf_ranger_slayer_skaven",
		third_person = {
			mtr_body = "units/beings/player/dwarf_ranger_slayer/skins/skaven/mtr_body_skaven",
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/skaven/mtr_outfit_skaven",
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/skaven/mtr_outfit_skaven_1p",
			mtr_skin = "units/beings/player/dwarf_ranger_slayer/skins/skaven/mtr_body_skaven_1p",
		},
	},
}
Cosmetics.skin_dr_slayer_skull = {
	career = 2,
	equip_hat_event = "show_beard_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_husk_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.bardin,
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/skins/skull/chr_dwarf_ranger_slayer_skull",
		third_person = {
			mtr_body = "units/beings/player/dwarf_ranger_slayer/skins/skull/mtr_body_skull",
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/skull/mtr_outfit_skull",
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/skull/mtr_outfit_skull_1p",
			mtr_skin = "units/beings/player/dwarf_ranger_slayer/skins/skull/mtr_body_skull_1p",
		},
	},
}
Cosmetics.skin_dr_slayer_runes = {
	career = 2,
	equip_hat_event = "show_beard_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_husk_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.bardin,
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/skins/runes/chr_dwarf_ranger_slayer_runes",
		third_person = {
			mtr_body = "units/beings/player/dwarf_ranger_slayer/skins/runes/mtr_body_runes",
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/runes/mtr_outfit_runes",
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/runes/mtr_outfit_runes_1p",
			mtr_skin = "units/beings/player/dwarf_ranger_slayer/skins/runes/mtr_body_runes_1p",
		},
	},
}
Cosmetics.skin_dr_slayer_wing = {
	career = 2,
	equip_hat_event = "show_beard_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_husk_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.bardin,
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/skins/wing/chr_dwarf_ranger_slayer_wing",
		third_person = {
			mtr_body = "units/beings/player/dwarf_ranger_slayer/skins/wing/mtr_body_wing",
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/wing/mtr_outfit_wing",
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/wing/mtr_outfit_wing_1p",
			mtr_skin = "units/beings/player/dwarf_ranger_slayer/skins/wing/mtr_body_wing_1p",
		},
	},
}
Cosmetics.skin_dr_slayer_skull = {
	career = 2,
	equip_hat_event = "show_beard_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_husk_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.bardin,
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/skins/skull/chr_dwarf_ranger_slayer_skull",
		third_person = {
			mtr_body = "units/beings/player/dwarf_ranger_slayer/skins/skull/mtr_body_skull",
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/skull/mtr_outfit_skull",
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_slayer/skins/skull/mtr_outfit_skull_1p",
			mtr_skin = "units/beings/player/dwarf_ranger_slayer/skins/skull/mtr_body_skull_1p",
		},
	},
}
Cosmetics.skin_dr_ranger = {
	career = 3,
	equip_hat_event = "show_beard_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_husk_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.bardin,
	},
}
Cosmetics.skin_dr_ranger_helmgart = {
	career = 3,
	equip_hat_event = "show_beard_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_husk_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.bardin,
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_upgraded/skins/helmgart/chr_dwarf_ranger_upgraded_helmgart",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/helmgart/mtr_outfit_helmgart",
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/helmgart/mtr_outfit_helmgart_1p",
		},
	},
}
Cosmetics.skin_dr_ranger_barak_varr = {
	career = 3,
	equip_hat_event = "show_beard_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_husk_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.bardin,
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_upgraded/skins/barak_varr/chr_dwarf_ranger_upgraded_barak_varr",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/barak_varr/mtr_outfit_barak_varr",
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/barak_varr/mtr_outfit_barak_varr_1p",
		},
	},
}
Cosmetics.skin_dr_ranger_black_and_gold = {
	career = 3,
	equip_hat_event = "show_beard_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_husk_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.bardin,
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_upgraded/skins/black_and_gold/chr_dwarf_ranger_upgraded_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/black_and_gold/mtr_outfit_black_and_gold",
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/black_and_gold/mtr_outfit_black_and_gold_1p",
		},
	},
}
Cosmetics.skin_dr_ranger_brown_and_yellow = {
	career = 3,
	equip_hat_event = "show_beard_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_husk_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.bardin,
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_upgraded/skins/brown_and_yellow/chr_dwarf_ranger_upgraded_brown_and_yellow",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/brown_and_yellow/mtr_outfit_brown_and_yellow",
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/brown_and_yellow/mtr_outfit_brown_and_yellow_1p",
		},
	},
}
Cosmetics.skin_dr_ranger_karak_norn = {
	career = 3,
	equip_hat_event = "show_beard_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_husk_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.bardin,
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_upgraded/skins/karak_norn/chr_dwarf_ranger_upgraded_karak_norn",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/karak_norn/mtr_outfit_karak_norn",
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/karak_norn/mtr_outfit_karak_norn_1p",
		},
	},
}
Cosmetics.skin_dr_ranger_zhufbar = {
	career = 3,
	equip_hat_event = "show_beard_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/dwarf_ranger/chr_third_person_husk_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.bardin,
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_upgraded/skins/zhufbar/chr_dwarf_ranger_upgraded_zhufbar",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/zhufbar/mtr_outfit_zhufbar",
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/zhufbar/mtr_outfit_zhufbar_1p",
		},
	},
}
Cosmetics.skin_es_default = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/empire_soldier/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/empire_soldier/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kruber,
	},
	always_hide_attachment_slots = {
		"slot_hat",
	},
}
Cosmetics.skin_es_knight = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/empire_soldier/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_knight/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kruber,
	},
}
Cosmetics.skin_es_knight_black_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/empire_soldier/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_knight/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kruber,
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_knight/skins/black_and_gold/chr_empire_soldier_knight_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_knight/skins/black_and_gold/mtr_outfit_black_and_gold",
			mtr_outfit_ds = "units/beings/player/empire_soldier_knight/skins/black_and_gold/mtr_outfit_black_and_gold_ds",
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_knight/skins/black_and_gold/mtr_outfit_black_and_gold_1p",
		},
	},
}
Cosmetics.skin_es_knight_bronze = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/empire_soldier/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_knight/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kruber,
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_knight/skins/bronze/chr_empire_soldier_knight_bronze",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_knight/skins/bronze/mtr_outfit_bronze",
			mtr_outfit_ds = "units/beings/player/empire_soldier_knight/skins/bronze/mtr_outfit_bronze_ds",
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_knight/skins/bronze/mtr_outfit_bronze_1p",
		},
	},
}
Cosmetics.skin_es_knight_green = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/empire_soldier/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_knight/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kruber,
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_knight/skins/green/chr_empire_soldier_knight_green",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_knight/skins/green/mtr_outfit_green",
			mtr_outfit_ds = "units/beings/player/empire_soldier_knight/skins/green/mtr_outfit_green_ds",
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_knight/skins/green/mtr_outfit_green_1p",
		},
	},
}
Cosmetics.skin_es_knight_middenland = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/empire_soldier/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_knight/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kruber,
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_knight/skins/middenland/chr_empire_soldier_knight_middenland",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_knight/skins/middenland/mtr_outfit_middenland",
			mtr_outfit_ds = "units/beings/player/empire_soldier_knight/skins/middenland/mtr_outfit_middenland_ds",
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_knight/skins/middenland/mtr_outfit_middenland_1p",
		},
	},
}
Cosmetics.skin_es_knight_red = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/empire_soldier/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_knight/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kruber,
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_knight/skins/red/chr_empire_soldier_knight_red",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_knight/skins/red/mtr_outfit_red",
			mtr_outfit_ds = "units/beings/player/empire_soldier_knight/skins/red/mtr_outfit_red_ds",
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_knight/skins/red/mtr_outfit_red_1p",
		},
	},
}
Cosmetics.skin_es_mercenary = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/empire_soldier/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kruber,
	},
}
Cosmetics.skin_es_mercenary_helmgart = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/empire_soldier/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kruber,
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_mercenary/skins/helmgart/chr_empire_soldier_mercenary_helmgart",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/helmgart/mtr_outfit_helmgart",
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/helmgart/mtr_outfit_helmgart_1p",
		},
	},
}
Cosmetics.skin_es_mercenary_black_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/empire_soldier/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kruber,
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_mercenary/skins/black_and_gold/chr_empire_soldier_mercenary_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/black_and_gold/mtr_outfit_black_and_gold",
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/black_and_gold/mtr_outfit_black_and_gold_1p",
		},
	},
}
Cosmetics.skin_es_mercenary_carroburg = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/empire_soldier/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kruber,
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_mercenary/skins/carroburg/chr_empire_soldier_mercenary_carroburg",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/carroburg/mtr_outfit_carroburg",
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/carroburg/mtr_outfit_carroburg_1p",
		},
	},
}
Cosmetics.skin_es_mercenary_middenland = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/empire_soldier/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kruber,
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_mercenary/skins/middenland/chr_empire_soldier_mercenary_middenland",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/middenland/mtr_outfit_middenland",
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/middenland/mtr_outfit_middenland_1p",
		},
	},
}
Cosmetics.skin_es_mercenary_ostermark = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/empire_soldier/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kruber,
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_mercenary/skins/ostermark/chr_empire_soldier_mercenary_ostermark",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/ostermark/mtr_outfit_ostermark",
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/ostermark/mtr_outfit_ostermark_1p",
		},
	},
}
Cosmetics.skin_es_mercenary_ostland = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/empire_soldier/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kruber,
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_mercenary/skins/ostland/chr_empire_soldier_mercenary_ostland",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/ostland/mtr_outfit_ostland",
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/ostland/mtr_outfit_ostland_1p",
		},
	},
}
Cosmetics.skin_es_huntsman = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/empire_soldier/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_huntsman/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kruber,
	},
}
Cosmetics.skin_es_huntsman_black_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/empire_soldier/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_huntsman/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kruber,
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_huntsman/skins/black_and_gold/chr_empire_soldier_huntsman_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_huntsman/skins/black_and_gold/mtr_outfit_black_and_gold",
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_huntsman/skins/black_and_gold/mtr_outfit_black_and_gold_1p",
		},
	},
}
Cosmetics.skin_es_huntsman_middenland = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/empire_soldier/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_huntsman/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kruber,
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_huntsman/skins/middenland/chr_empire_soldier_huntsman_middenland",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_huntsman/skins/middenland/mtr_outfit_middenland",
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_huntsman/skins/middenland/mtr_outfit_middenland_1p",
		},
	},
}
Cosmetics.skin_es_huntsman_ostermark = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/empire_soldier/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_huntsman/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kruber,
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_huntsman/skins/ostermark/chr_empire_soldier_huntsman_ostermark",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_huntsman/skins/ostermark/mtr_outfit_ostermark",
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_huntsman/skins/ostermark/mtr_outfit_ostermark_1p",
		},
	},
}
Cosmetics.skin_es_huntsman_red_and_white = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/empire_soldier/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_huntsman/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kruber,
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_huntsman/skins/red_and_white/chr_empire_soldier_huntsman_red_and_white",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_huntsman/skins/red_and_white/mtr_outfit_red_and_white",
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_huntsman/skins/red_and_white/mtr_outfit_red_and_white_1p",
		},
	},
}
Cosmetics.skin_es_huntsman_yellow_and_green = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/empire_soldier/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/empire_soldier/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_huntsman/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kruber,
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_huntsman/skins/yellow_and_green/chr_empire_soldier_huntsman_yellow_and_green",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_huntsman/skins/yellow_and_green/mtr_outfit_yellow_and_green",
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_huntsman/skins/yellow_and_green/mtr_outfit_yellow_and_green_1p",
		},
	},
}
Cosmetics.skin_ww_default = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/way_watcher/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/way_watcher/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kerillian,
	},
	always_hide_attachment_slots = {
		"slot_hat",
	},
}
Cosmetics.skin_ww_shade = {
	equip_hat_event = "show_balaclava_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/way_watcher/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_shade/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kerillian,
	},
}
Cosmetics.skin_ww_shade_black_and_gold = {
	equip_hat_event = "show_balaclava_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/way_watcher/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_shade/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kerillian,
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_shade/skins/black_and_gold/chr_way_watcher_shade_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_shade/skins/black_and_gold/mtr_outfit_black_and_gold",
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_shade/skins/black_and_gold/mtr_outfit_black_and_gold_1p",
		},
	},
}
Cosmetics.skin_ww_shade_ash = {
	equip_hat_event = "show_balaclava_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/way_watcher/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_shade/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kerillian,
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_shade/skins/ash/chr_way_watcher_shade_ash",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_shade/skins/ash/mtr_outfit_ash",
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_shade/skins/ash/mtr_outfit_ash_1p",
		},
	},
}
Cosmetics.skin_ww_shade_crimson = {
	equip_hat_event = "show_balaclava_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/way_watcher/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_shade/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kerillian,
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_shade/skins/crimson/chr_way_watcher_shade_crimson",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_shade/skins/crimson/mtr_outfit_crimson",
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_shade/skins/crimson/mtr_outfit_crimson_1p",
		},
	},
}
Cosmetics.skin_ww_shade_emerald = {
	equip_hat_event = "show_balaclava_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/way_watcher/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_shade/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kerillian,
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_shade/skins/emerald/chr_way_watcher_shade_emerald",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_shade/skins/emerald/mtr_outfit_emerald",
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_shade/skins/emerald/mtr_outfit_emerald_1p",
		},
	},
}
Cosmetics.skin_ww_shade_midnight = {
	equip_hat_event = "show_balaclava_default",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/way_watcher/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_shade/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kerillian,
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_shade/skins/midnight/chr_way_watcher_shade_midnight",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_shade/skins/midnight/mtr_outfit_midnight",
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_shade/skins/midnight/mtr_outfit_midnight_1p",
		},
	},
}
Cosmetics.skin_ww_maidenguard = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/way_watcher/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_maiden_guard/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kerillian,
	},
}
Cosmetics.skin_ww_maidenguard_black_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/way_watcher/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_maiden_guard/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kerillian,
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_maiden_guard/skins/black_and_gold/chr_way_watcher_maiden_guard_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_maiden_guard/skins/black_and_gold/mtr_outfit_black_and_gold",
			mtr_ww_mg_hat_01 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hat_01_black",
			mtr_ww_mg_hats_01 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hats_01_black",
			mtr_ww_mg_hats_02 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hats_02_black",
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_maiden_guard/skins/black_and_gold/mtr_outfit_black_and_gold_1p",
		},
	},
}
Cosmetics.skin_ww_maidenguard_caledor = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/way_watcher/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_maiden_guard/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kerillian,
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_maiden_guard/skins/caledor/chr_way_watcher_maiden_guard_caledor",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_maiden_guard/skins/caledor/mtr_outfit_caledor",
			mtr_ww_mg_hat_01 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hat_01_green",
			mtr_ww_mg_hats_01 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hats_01_green",
			mtr_ww_mg_hats_02 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hats_02_green",
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_maiden_guard/skins/caledor/mtr_outfit_caledor_1p",
		},
	},
}
Cosmetics.skin_ww_maidenguard_elyrion = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/way_watcher/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_maiden_guard/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kerillian,
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_maiden_guard/skins/elyrion/chr_way_watcher_maiden_guard_elyrion",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_maiden_guard/skins/elyrion/mtr_outfit_elyrion",
			mtr_ww_mg_hat_01 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hat_01_blue",
			mtr_ww_mg_hats_01 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hats_01_blue",
			mtr_ww_mg_hats_02 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hats_02_blue",
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_maiden_guard/skins/elyrion/mtr_outfit_elyrion_1p",
		},
	},
}
Cosmetics.skin_ww_maidenguard_red_and_yellow = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/way_watcher/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_maiden_guard/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kerillian,
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_maiden_guard/skins/red_and_yellow/chr_way_watcher_maiden_guard_red_and_yellow",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_maiden_guard/skins/red_and_yellow/mtr_outfit_red_and_yellow",
			mtr_ww_mg_hat_01 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hat_01_red_yellow",
			mtr_ww_mg_hats_01 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hats_01_red_yellow",
			mtr_ww_mg_hats_02 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hats_02_red_yellow",
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_maiden_guard/skins/red_and_yellow/mtr_outfit_red_and_yellow_1p",
		},
	},
}
Cosmetics.skin_ww_maidenguard_white_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/way_watcher/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_maiden_guard/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kerillian,
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_maiden_guard/skins/white_and_gold/chr_way_watcher_maiden_guard_white_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_maiden_guard/skins/white_and_gold/mtr_outfit_white_and_gold",
			mtr_ww_mg_hat_01 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hat_01_white_gold",
			mtr_ww_mg_hats_01 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hats_01_white_gold",
			mtr_ww_mg_hats_02 = "units/beings/player/way_watcher_maiden_guard/headpiece/ww_mg_hats_02_white_gold",
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_maiden_guard/skins/white_and_gold/mtr_outfit_white_and_gold_1p",
		},
	},
}
Cosmetics.skin_ww_waywatcher = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/way_watcher/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kerillian,
	},
}
Cosmetics.skin_ww_waywatcher_helmgart = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/way_watcher/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kerillian,
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_upgraded/skins/helmgart/chr_way_watcher_upgraded_helmgart",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/helmgart/mtr_outfit_helmgart",
			mtr_outfit_ds = "units/beings/player/way_watcher_upgraded/skins/helmgart/mtr_outfit_helmgart_ds",
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/helmgart/mtr_outfit_helmgart_1p",
		},
	},
}
Cosmetics.skin_ww_waywatcher_anmyr = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/way_watcher/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kerillian,
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_upgraded/skins/anmyr/chr_way_watcher_upgraded_anmyr",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/anmyr/mtr_outfit_anmyr",
			mtr_outfit_ds = "units/beings/player/way_watcher_upgraded/skins/anmyr/mtr_outfit_anmyr_ds",
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/anmyr/mtr_outfit_anmyr_1p",
		},
	},
}
Cosmetics.skin_ww_waywatcher_atylwyth = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/way_watcher/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kerillian,
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_upgraded/skins/atylwyth/chr_way_watcher_upgraded_atylwyth",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/atylwyth/mtr_outfit_atylwyth",
			mtr_outfit_ds = "units/beings/player/way_watcher_upgraded/skins/atylwyth/mtr_outfit_atylwyth_ds",
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/atylwyth/mtr_outfit_atylwyth_1p",
		},
	},
}
Cosmetics.skin_ww_waywatcher_black_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/way_watcher/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kerillian,
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_upgraded/skins/black_and_gold/chr_way_watcher_upgraded_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/black_and_gold/mtr_outfit_black_and_gold",
			mtr_outfit_ds = "units/beings/player/way_watcher_upgraded/skins/black_and_gold/mtr_outfit_black_and_gold_ds",
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/black_and_gold/mtr_outfit_black_and_gold_1p",
		},
	},
}
Cosmetics.skin_ww_waywatcher_cythral = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/way_watcher/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kerillian,
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_upgraded/skins/cythral/chr_way_watcher_upgraded_cythral",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/cythral/mtr_outfit_cythral",
			mtr_outfit_ds = "units/beings/player/way_watcher_upgraded/skins/cythral/mtr_outfit_cythral_ds",
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/cythral/mtr_outfit_cythral_1p",
		},
	},
}
Cosmetics.skin_ww_waywatcher_tirsyth = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/way_watcher/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/way_watcher/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.kerillian,
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_upgraded/skins/tirsyth/chr_way_watcher_upgraded_tirsyth",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/tirsyth/mtr_outfit_tirsyth",
			mtr_outfit_ds = "units/beings/player/way_watcher_upgraded/skins/tirsyth/mtr_outfit_tirsyth_ds",
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/tirsyth/mtr_outfit_tirsyth_1p",
		},
	},
}
Cosmetics.skin_wh_default = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/witch_hunter/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/witch_hunter/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.victor,
	},
	always_hide_attachment_slots = {
		"slot_hat",
	},
}
Cosmetics.skin_wh_captain = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/witch_hunter/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_captain/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.victor,
	},
}
Cosmetics.skin_wh_captain_helmgart = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/witch_hunter/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_captain/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.victor,
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_captain/skins/helmgart/chr_witch_hunter_captain_helmgart",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/helmgart/mtr_outfit_helmgart",
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/helmgart/mtr_outfit_helmgart_1p",
		},
	},
}
Cosmetics.skin_wh_captain_black_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/witch_hunter/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_captain/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.victor,
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_captain/skins/black_and_gold/chr_witch_hunter_captain_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/black_and_gold/mtr_outfit_black_and_gold",
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/black_and_gold/mtr_outfit_black_and_gold_1p",
		},
	},
}
Cosmetics.skin_wh_captain_grey_and_yellow = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/witch_hunter/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_captain/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.victor,
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_captain/skins/grey_and_yellow/chr_witch_hunter_captain_grey_and_yellow",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/grey_and_yellow/mtr_outfit_grey_and_yellow",
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/grey_and_yellow/mtr_outfit_grey_and_yellow_1p",
		},
	},
}
Cosmetics.skin_wh_captain_middenland = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/witch_hunter/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_captain/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.victor,
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_captain/skins/middenland/chr_witch_hunter_captain_middenland",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/middenland/mtr_outfit_middenland",
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/middenland/mtr_outfit_middenland_1p",
		},
	},
}
Cosmetics.skin_wh_captain_ostermark = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/witch_hunter/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_captain/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.victor,
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_captain/skins/ostermark/chr_witch_hunter_captain_ostermark",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/ostermark/mtr_outfit_ostermark",
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/ostermark/mtr_outfit_ostermark_1p",
		},
	},
}
Cosmetics.skin_wh_captain_ostland = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/witch_hunter/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_captain/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.victor,
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_captain/skins/ostland/chr_witch_hunter_captain_ostland",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/ostland/mtr_outfit_ostland",
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/ostland/mtr_outfit_ostland_1p",
		},
	},
}
Cosmetics.skin_wh_zealot = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/witch_hunter/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_zealot/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.victor,
	},
}
Cosmetics.skin_wh_zealot_black_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/witch_hunter/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_zealot/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.victor,
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/skins/black_and_gold/chr_witch_hunter_zealot_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_zealot/skins/black_and_gold/mtr_outfit_black_and_gold",
			mtr_outfit_ds = "units/beings/player/witch_hunter_zealot/skins/black_and_gold/mtr_outfit_ds_black_and_gold",
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_zealot/skins/black_and_gold/mtr_outfit_black_and_gold_1p",
		},
	},
}
Cosmetics.skin_wh_zealot_crimson = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/witch_hunter/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_zealot/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.victor,
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/skins/crimson/chr_witch_hunter_zealot_crimson",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_zealot/skins/crimson/mtr_outfit_crimson",
			mtr_outfit_ds = "units/beings/player/witch_hunter_zealot/skins/crimson/mtr_outfit_ds_crimson",
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_zealot/skins/crimson/mtr_outfit_crimson_1p",
		},
	},
}
Cosmetics.skin_wh_zealot_green_and_yellow = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/witch_hunter/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_zealot/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.victor,
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/skins/green_and_yellow/chr_witch_hunter_zealot_green_and_yellow",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_zealot/skins/green_and_yellow/mtr_outfit_green_and_yellow",
			mtr_outfit_ds = "units/beings/player/witch_hunter_zealot/skins/green_and_yellow/mtr_outfit_ds_green_and_yellow",
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_zealot/skins/green_and_yellow/mtr_outfit_green_and_yellow_1p",
		},
	},
}
Cosmetics.skin_wh_zealot_middenland = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/witch_hunter/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_zealot/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.victor,
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/skins/middenland/chr_witch_hunter_zealot_middenland",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_zealot/skins/middenland/mtr_outfit_middenland",
			mtr_outfit_ds = "units/beings/player/witch_hunter_zealot/skins/middenland/mtr_outfit_ds_middenland",
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_zealot/skins/middenland/mtr_outfit_middenland_1p",
		},
	},
}
Cosmetics.skin_wh_zealot_pure = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/witch_hunter/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_zealot/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.victor,
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/skins/pure/chr_witch_hunter_zealot_pure",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_zealot/skins/pure/mtr_outfit_pure",
			mtr_outfit_ds = "units/beings/player/witch_hunter_zealot/skins/pure/mtr_outfit_ds_pure",
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_zealot/skins/pure/mtr_outfit_pure_1p",
		},
	},
}
Cosmetics.skin_wh_bountyhunter = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/witch_hunter/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_bounty_hunter/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/witch_hunter_bounty_hunter/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.victor,
	},
}
Cosmetics.skin_wh_bountyhunter_black_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/witch_hunter/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_bounty_hunter/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/witch_hunter_bounty_hunter/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.victor,
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_bounty_hunter/skins/black_and_gold/chr_witch_hunter_bounty_hunter_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_bounty_hunter/skins/black_and_gold/mtr_outfit_black_and_gold",
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_bounty_hunter/skins/black_and_gold/mtr_outfit_black_and_gold_1p",
		},
	},
}
Cosmetics.skin_wh_bountyhunter_brown_and_white = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/witch_hunter/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_bounty_hunter/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/witch_hunter_bounty_hunter/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.victor,
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_bounty_hunter/skins/brown_and_white/chr_witch_hunter_bounty_hunter_brown_and_white",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_bounty_hunter/skins/brown_and_white/mtr_outfit_brown_and_white",
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_bounty_hunter/skins/brown_and_white/mtr_outfit_brown_and_white_1p",
		},
	},
}
Cosmetics.skin_wh_bountyhunter_green_and_yellow = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/witch_hunter/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_bounty_hunter/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/witch_hunter_bounty_hunter/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.victor,
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_bounty_hunter/skins/green_and_yellow/chr_witch_hunter_bounty_hunter_green_and_yellow",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_bounty_hunter/skins/green_and_yellow/mtr_outfit_green_and_yellow",
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_bounty_hunter/skins/green_and_yellow/mtr_outfit_green_and_yellow_1p",
		},
	},
}
Cosmetics.skin_wh_bountyhunter_middenland = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/witch_hunter/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_bounty_hunter/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/witch_hunter_bounty_hunter/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.victor,
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_bounty_hunter/skins/middenland/chr_witch_hunter_bounty_hunter_middenland",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_bounty_hunter/skins/middenland/mtr_outfit_middenland",
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_bounty_hunter/skins/middenland/mtr_outfit_middenland_1p",
		},
	},
}
Cosmetics.skin_wh_bountyhunter_yellow_and_red = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/witch_hunter/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/witch_hunter/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_bounty_hunter/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/witch_hunter_bounty_hunter/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.victor,
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_bounty_hunter/skins/yellow_and_red/chr_witch_hunter_bounty_hunter_yellow_and_red",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_bounty_hunter/skins/yellow_and_red/mtr_outfit_yellow_and_red",
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_bounty_hunter/skins/yellow_and_red/mtr_outfit_yellow_and_red_1p",
		},
	},
}
Cosmetics.skin_bw_default = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/bright_wizard/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/bright_wizard/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.sienna,
	},
	always_hide_attachment_slots = {
		"slot_hat",
	},
}
Cosmetics.skin_bw_unchained = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/bright_wizard/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_unchained/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.sienna,
	},
}
Cosmetics.skin_bw_unchained_ash = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/bright_wizard/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_unchained/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.sienna,
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_unchained/skins/ash/chr_bright_wizard_unchained_ash",
		third_person = {
			mtr_body = "units/beings/player/bright_wizard_unchained/skins/ash/mtr_outfit_ash",
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_unchained/skins/ash/mtr_outfit_ash_1p",
		},
	},
}
Cosmetics.skin_bw_unchained_black_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/bright_wizard/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_unchained/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.sienna,
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_unchained/skins/black_and_gold/chr_bright_wizard_unchained_black_and_gold",
		third_person = {
			mtr_body = "units/beings/player/bright_wizard_unchained/skins/black_and_gold/mtr_outfit_black_and_gold",
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_unchained/skins/black_and_gold/mtr_outfit_black_and_gold_1p",
		},
	},
}
Cosmetics.skin_bw_unchained_bronze = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/bright_wizard/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_unchained/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.sienna,
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_unchained/skins/bronze/chr_bright_wizard_unchained_bronze",
		third_person = {
			mtr_body = "units/beings/player/bright_wizard_unchained/skins/bronze/mtr_outfit_bronze",
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_unchained/skins/bronze/mtr_outfit_bronze_1p",
		},
	},
}
Cosmetics.skin_bw_unchained_brown_and_white = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/bright_wizard/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_unchained/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.sienna,
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_unchained/skins/brown_and_white/chr_bright_wizard_unchained_brown_and_white",
		third_person = {
			mtr_body = "units/beings/player/bright_wizard_unchained/skins/brown_and_white/mtr_outfit_brown_and_white",
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_unchained/skins/brown_and_white/mtr_outfit_brown_and_white_1p",
		},
	},
}
Cosmetics.skin_bw_unchained_ostermark = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/bright_wizard/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_unchained/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.sienna,
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_unchained/skins/ostermark/chr_bright_wizard_unchained_ostermark",
		third_person = {
			mtr_body = "units/beings/player/bright_wizard_unchained/skins/ostermark/mtr_outfit_ostermark",
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_unchained/skins/ostermark/mtr_outfit_ostermark_1p",
		},
	},
}
Cosmetics.skin_bw_scholar = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/bright_wizard/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_scholar/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.sienna,
	},
}
Cosmetics.skin_bw_scholar_ash = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/bright_wizard/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_scholar/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.sienna,
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_scholar/skins/ash/chr_bright_wizard_scholar_ash",
		third_person = {
			mtr_body = "units/beings/player/bright_wizard_scholar/skins/ash/mtr_outfit_ash",
			mtr_body_ds = "units/beings/player/bright_wizard_scholar/skins/ash/mtr_outfit_ash_ds",
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_scholar/skins/ash/mtr_outfit_ash_1p",
		},
	},
}
Cosmetics.skin_bw_scholar_black_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/bright_wizard/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_scholar/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.sienna,
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_scholar/skins/black_and_gold/chr_bright_wizard_scholar_black_and_gold",
		third_person = {
			mtr_body = "units/beings/player/bright_wizard_scholar/skins/black_and_gold/mtr_outfit_black_and_gold",
			mtr_body_ds = "units/beings/player/bright_wizard_scholar/skins/black_and_gold/mtr_outfit_black_and_gold_ds",
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_scholar/skins/black_and_gold/mtr_outfit_black_and_gold_1p",
		},
	},
}
Cosmetics.skin_bw_scholar_bronze = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/bright_wizard/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_scholar/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.sienna,
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_scholar/skins/bronze/chr_bright_wizard_scholar_bronze",
		third_person = {
			mtr_body = "units/beings/player/bright_wizard_scholar/skins/bronze/mtr_outfit_bronze",
			mtr_body_ds = "units/beings/player/bright_wizard_scholar/skins/bronze/mtr_outfit_bronze_ds",
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_scholar/skins/bronze/mtr_outfit_bronze_1p",
		},
	},
}
Cosmetics.skin_bw_scholar_brown_and_white = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/bright_wizard/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_scholar/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.sienna,
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_scholar/skins/brown_and_white/chr_bright_wizard_scholar_brown_and_white",
		third_person = {
			mtr_body = "units/beings/player/bright_wizard_scholar/skins/brown_and_white/mtr_outfit_brown_and_white",
			mtr_body_ds = "units/beings/player/bright_wizard_scholar/skins/brown_and_white/mtr_outfit_brown_and_white_ds",
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_scholar/skins/brown_and_white/mtr_outfit_brown_and_white_1p",
		},
	},
}
Cosmetics.skin_bw_scholar_ostermark = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/bright_wizard/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_scholar/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.sienna,
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_scholar/skins/ostermark/chr_bright_wizard_scholar_ostermark",
		third_person = {
			mtr_body = "units/beings/player/bright_wizard_scholar/skins/ostermark/mtr_outfit_ostermark",
			mtr_body_ds = "units/beings/player/bright_wizard_scholar/skins/ostermark/mtr_outfit_ostermark_ds",
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_scholar/skins/ostermark/mtr_outfit_ostermark_1p",
		},
	},
}
Cosmetics.skin_bw_adept = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/bright_wizard/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_adept/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.sienna,
	},
}
Cosmetics.skin_bw_adept_helmgart = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/bright_wizard/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_adept/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.sienna,
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_adept/skins/helmgart/chr_bright_wizard_adept_helmgart",
		third_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/helmgart/mtr_outfit_helmgart",
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/helmgart/mtr_outfit_helmgart_1p",
		},
	},
}
Cosmetics.skin_bw_adept_ash = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/bright_wizard/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_adept/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.sienna,
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_adept/skins/ash/chr_bright_wizard_adept_ash",
		third_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/ash/mtr_outfit_ash",
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/ash/mtr_outfit_ash_1p",
		},
	},
}
Cosmetics.skin_bw_adept_black_and_gold = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/bright_wizard/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_adept/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.sienna,
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_adept/skins/black_and_gold/chr_bright_wizard_adept_black_and_gold",
		third_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/black_and_gold/mtr_outfit_black_and_gold",
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/black_and_gold/mtr_outfit_black_and_gold_1p",
		},
	},
}
Cosmetics.skin_bw_adept_brown_and_yellow = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/bright_wizard/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_adept/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.sienna,
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_adept/skins/brown_and_yellow/chr_bright_wizard_adept_brown_and_yellow",
		third_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/brown_and_yellow/mtr_outfit_brown_and_yellow",
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/brown_and_yellow/mtr_outfit_brown_and_yellow_1p",
		},
	},
}
Cosmetics.skin_bw_adept_ostermark = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/bright_wizard/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_adept/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.sienna,
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_adept/skins/ostermark/chr_bright_wizard_adept_ostermark",
		third_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/ostermark/mtr_outfit_ostermark",
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/ostermark/mtr_outfit_ostermark_1p",
		},
	},
}
Cosmetics.skin_bw_adept_ostland = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_bot = "units/beings/player/third_person_base/bright_wizard/chr_third_person_base",
	third_person_husk = "units/beings/player/third_person_base/bright_wizard/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_adept/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
	},
	third_person_attachment = {
		unit = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.third_person_attachment.sienna,
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_adept/skins/ostland/chr_bright_wizard_adept_ostland",
		third_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/ostland/mtr_outfit_ostland",
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/ostland/mtr_outfit_ostland_1p",
		},
	},
}
Cosmetics.frame_0000 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_0001 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_0002 = {
	icon = "unit_frame_03",
}
Cosmetics.frame_0003 = {
	icon = "unit_frame_04",
}
Cosmetics.frame_0004 = {
	icon = "unit_frame_05",
}
Cosmetics.frame_0005 = {
	icon = "unit_frame_06",
}
Cosmetics.frame_0006 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0007 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0008 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0009 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0010 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0011 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0012 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0013 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0014 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0015 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0016 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0017 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0018 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0019 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0020 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0021 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0022 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0023 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0024 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0025 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0026 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0027 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0028 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0029 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0030 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0031 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0032 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0033 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0034 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0035 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0036 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0037 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0038 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0039 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0040 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0041 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0042 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0043 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0044 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0045 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0046 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0047 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0048 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0049 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0050 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0051 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0052 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0053 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0054 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0055 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0056 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0057 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0058 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0059 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0060 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0061 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0062 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0063 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0064 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0065 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0066 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0067 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0068 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0069 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0070 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0071 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0072 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0073 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0074 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0075 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0076 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0077 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0078 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0079 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0080 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0081 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0084 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0085 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0086 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0087 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0089 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0090 = {
	icon = "unit_frame_07",
}
Cosmetics.frame_0091 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_0094 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_0095 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_0096 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_0097 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_0098 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_0099 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_0100 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_0101 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_0102 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_0103 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_0104 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_0105 = {
	icon = "unit_frame_02",
	texture_package_name = "resource_packages/store/item_icons/store_item_icon_frame_0105",
	unit = "",
	attachment_node = {
		unit = "units/ui/ui_portrait_frame",
		attachment_node = AttachmentNodeLinking.ui_portrait_frame,
	},
	material_settings = {
		portrait_frame = {
			texture = "gui/1080p/single_textures/store_item_icons/store_item_icon_frame_0105/store_item_icon_frame_0105",
			type = "texture",
		},
	},
}
Cosmetics.frame_0106 = {
	icon = "unit_frame_02",
	texture_package_name = "resource_packages/store/item_icons/store_item_icon_frame_0106",
	unit = "",
	attachment_node = {
		unit = "units/ui/ui_portrait_frame",
		attachment_node = AttachmentNodeLinking.ui_portrait_frame,
	},
	material_settings = {
		portrait_frame = {
			texture = "gui/1080p/single_textures/store_item_icons/store_item_icon_frame_0106/store_item_icon_frame_0106",
			type = "texture",
		},
	},
}
Cosmetics.frame_0107 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_0108 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_0109 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_0110 = {
	icon = "unit_frame_02",
	texture_package_name = "resource_packages/store/item_icons/store_item_icon_frame_0110",
	unit = "",
	attachment_node = {
		unit = "units/ui/ui_portrait_frame",
		attachment_node = AttachmentNodeLinking.ui_portrait_frame,
	},
	material_settings = {
		portrait_frame = {
			texture = "gui/1080p/single_textures/store_item_icons/store_item_icon_frame_0110/store_item_icon_frame_0110",
			type = "texture",
		},
	},
}
Cosmetics.frame_0111 = {
	icon = "unit_frame_02",
	texture_package_name = "resource_packages/store/item_icons/store_item_icon_frame_0111",
	unit = "",
	attachment_node = {
		unit = "units/ui/ui_portrait_frame",
		attachment_node = AttachmentNodeLinking.ui_portrait_frame,
	},
	material_settings = {
		portrait_frame = {
			texture = "gui/1080p/single_textures/store_item_icons/store_item_icon_frame_0111/store_item_icon_frame_0111",
			type = "texture",
		},
	},
}
Cosmetics.frame_dev = {
	icon = "unit_frame_02",
}
Cosmetics.frame_bear = {
	icon = "unit_frame_02",
}
Cosmetics.frame_collectors_edition = {
	icon = "unit_frame_02",
}
Cosmetics.frame_collectors_edition_preorder = {
	icon = "unit_frame_02",
}
Cosmetics.frame_community_01 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_skulls = {
	icon = "unit_frame_02",
}
Cosmetics.frame_year_of_the_rat = {
	icon = "unit_frame_02",
}
Cosmetics.frame_summer = {
	icon = "unit_frame_02",
}
Cosmetics.frame_geheimnisnacht_01 = {
	icon = "unit_frame_02",
	texture_package_name = "resource_packages/store/item_icons/store_item_icon_frame_geheimnisnacht_01",
	unit = "",
	attachment_node = {
		unit = "units/ui/ui_portrait_frame",
		attachment_node = AttachmentNodeLinking.ui_portrait_frame,
	},
	material_settings = {
		portrait_frame = {
			texture = "gui/1080p/single_textures/store_item_icons/store_item_icon_frame_geheimnisnacht_01/store_item_icon_frame_geheimnisnacht_01",
			type = "texture",
		},
	},
}
Cosmetics.frame_geheimnisnacht_02 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_geheimnisnacht_03 = {
	icon = "unit_frame_02",
	texture_package_name = "resource_packages/store/item_icons/store_item_icon_frame_geheimnisnacht_03",
	unit = "",
	attachment_node = {
		unit = "units/ui/ui_portrait_frame",
		attachment_node = AttachmentNodeLinking.ui_portrait_frame,
	},
	material_settings = {
		portrait_frame = {
			texture = "gui/1080p/single_textures/store_item_icons/store_item_icon_frame_geheimnisnacht_03/store_item_icon_frame_geheimnisnacht_03",
			type = "texture",
		},
	},
}
Cosmetics.frame_bogenhafen_01 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_bogenhafen_02 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_bogenhafen_03 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_bogenhafen_04 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_holly_01 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_holly_02 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_holly_03 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_holly_04 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_drachenfels_01 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_drachenfels_02 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_drachenfels_03 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_drachenfels_04 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_drachenfels_05 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_wizards_trail_01 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_wizards_tower_01 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_mondstille_01 = {
	icon = "unit_frame_02",
	texture_package_name = "resource_packages/store/item_icons/store_item_icon_frame_mondstille_01",
	unit = "",
	attachment_node = {
		unit = "units/ui/ui_portrait_frame",
		attachment_node = AttachmentNodeLinking.ui_portrait_frame,
	},
	material_settings = {
		portrait_frame = {
			texture = "gui/1080p/single_textures/store_item_icons/store_item_icon_frame_mondstille_01/store_item_icon_frame_mondstille_01",
			type = "texture",
		},
	},
}
Cosmetics.frame_mondstille_02 = {
	icon = "unit_frame_02",
	texture_package_name = "resource_packages/store/item_icons/store_item_icon_frame_mondstille_02",
	unit = "",
	attachment_node = {
		unit = "units/ui/ui_portrait_frame",
		attachment_node = AttachmentNodeLinking.ui_portrait_frame,
	},
	material_settings = {
		portrait_frame = {
			texture = "gui/1080p/single_textures/store_item_icons/store_item_icon_frame_mondstille_02/store_item_icon_frame_mondstille_02",
			type = "texture",
		},
	},
}
Cosmetics.frame_mondstille_03 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_celebration_01 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_celebration_02 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_celebration_03 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_celebration_05 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_beta_2024 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_streamer = {
	icon = "unit_frame_02",
}
Cosmetics.frame_scorpion_complete_all_helmgart_levels_cataclysm = {
	icon = "unit_frame_02",
}
Cosmetics.frame_scorpion_complete_all_helmgart_level_achievements_cataclysm = {
	icon = "unit_frame_02",
	texture_package_name = "resource_packages/store/item_icons/store_item_icon_frame_scorpion_achieve_cata",
	unit = "",
	attachment_node = {
		unit = "units/ui/ui_portrait_frame",
		attachment_node = AttachmentNodeLinking.ui_portrait_frame,
	},
	material_settings = {
		portrait_frame = {
			texture = "gui/1080p/single_textures/store_item_icons/store_item_icon_frame_scorpion_achieve_cata/store_item_icon_frame_scorpion_achieve_cata",
			type = "texture",
		},
	},
}
Cosmetics.frame_scorpion_complete_bogenhafen_cataclysm = {
	icon = "unit_frame_02",
}
Cosmetics.frame_scorpion_complete_plaza_cataclysm = {
	icon = "unit_frame_02",
}
Cosmetics.frame_scorpion_complete_crater_recruit = {
	icon = "unit_frame_02",
}
Cosmetics.frame_scorpion_complete_crater_veteran = {
	icon = "unit_frame_02",
}
Cosmetics.frame_scorpion_complete_crater_champion = {
	icon = "unit_frame_02",
}
Cosmetics.frame_scorpion_complete_crater_legend = {
	icon = "unit_frame_02",
}
Cosmetics.frame_scorpion_complete_crater_cataclysm = {
	icon = "unit_frame_02",
}
Cosmetics.frame_scorpion_season_1_beasts = {
	icon = "unit_frame_02",
}
Cosmetics.frame_scorpion_season_1_death = {
	icon = "unit_frame_02",
}
Cosmetics.frame_scorpion_season_1_fire = {
	icon = "unit_frame_02",
}
Cosmetics.frame_scorpion_season_1_heavens = {
	icon = "unit_frame_02",
}
Cosmetics.frame_scorpion_season_1_life = {
	icon = "unit_frame_02",
}
Cosmetics.frame_scorpion_season_1_light = {
	icon = "unit_frame_02",
}
Cosmetics.frame_scorpion_season_1_metal = {
	icon = "unit_frame_02",
}
Cosmetics.frame_scorpion_season_1_shadow = {
	icon = "unit_frame_02",
}
Cosmetics.frame_scorpion_season_1_cataclysm_1 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_scorpion_season_1_cataclysm_2 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_scorpion_season_1_cataclysm_3 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_scorpion_season_1_leaderboard_1 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_scorpion_season_1_leaderboard_2 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_scorpion_season_1_leaderboard_3 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_season_03_quickplay = {
	icon = "unit_frame_02",
}
Cosmetics.frame_season_03_tier_1 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_season_03_tier_2 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_season_03_tier_3 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_season_04_quickplay = {
	icon = "unit_frame_02",
}
Cosmetics.frame_season_04_tier_1 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_season_04_tier_2 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_season_04_tier_3 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_season_04_tier_4 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_skulls_2021 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_skulls_2022 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_celebration_06 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_globadier_01 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_globadier_02 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_gutter_runner_01 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_gutter_runner_02 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_packmaster_01 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_packmaster_02 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_ratling_gunner_01 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_ratling_gunner_02 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_troll_01 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_troll_02 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_warpfire_thrower_01 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_warpfire_thrower_02 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_versus_01 = {
	icon = "unit_frame_02",
	texture_package_name = "resource_packages/store/item_icons/store_item_icon_frame_versus_01",
	unit = "",
	attachment_node = {
		unit = "units/ui/ui_portrait_frame",
		attachment_node = AttachmentNodeLinking.ui_portrait_frame,
	},
	material_settings = {
		portrait_frame = {
			texture = "gui/1080p/single_textures/store_item_icons/store_item_icon_frame_versus_01/store_item_icon_frame_versus_01",
			type = "texture",
		},
	},
}
Cosmetics.frame_versus_02 = {
	icon = "unit_frame_02",
	texture_package_name = "resource_packages/store/item_icons/store_item_icon_frame_versus_02",
	unit = "",
	attachment_node = {
		unit = "units/ui/ui_portrait_frame",
		attachment_node = AttachmentNodeLinking.ui_portrait_frame,
	},
	material_settings = {
		portrait_frame = {
			texture = "gui/1080p/single_textures/store_item_icons/store_item_icon_frame_versus_02/store_item_icon_frame_versus_02",
			type = "texture",
		},
	},
}
Cosmetics.frame_rat_ogre_01 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_rat_ogre_02 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_skulls_2023 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_skulls_2024 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_karak_01 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_karak_02 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_karak_03 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_karak_04 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_karak_05 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_termite_01 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_necromancer_01 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_necromancer_02 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_necromancer_03 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_geheimnisnacht_04 = {
	icon = "unit_frame_02",
	texture_package_name = "resource_packages/store/item_icons/store_item_icon_frame_geheimnisnacht_04",
	unit = "",
	attachment_node = {
		unit = "units/ui/ui_portrait_frame",
		attachment_node = AttachmentNodeLinking.ui_portrait_frame,
	},
	material_settings = {
		portrait_frame = {
			texture = "gui/1080p/single_textures/store_item_icons/store_item_icon_frame_geheimnisnacht_04/store_item_icon_frame_geheimnisnacht_04",
			type = "texture",
		},
	},
}
Cosmetics.frame_geheimnisnacht_05 = {
	icon = "unit_frame_02",
	texture_package_name = "resource_packages/store/item_icons/store_item_icon_frame_geheimnisnacht_05",
	unit = "",
	attachment_node = {
		unit = "units/ui/ui_portrait_frame",
		attachment_node = AttachmentNodeLinking.ui_portrait_frame,
	},
	material_settings = {
		portrait_frame = {
			texture = "gui/1080p/single_textures/store_item_icons/store_item_icon_frame_geheimnisnacht_05/store_item_icon_frame_geheimnisnacht_05",
			type = "texture",
		},
	},
}
Cosmetics.coin_template = {
	icon = "unit_frame_02",
	unit = "",
	attachment_node = {
		unit = "units/ui/versus_coin/versus_coin",
		attachment_node = AttachmentNodeLinking.ui_portrait_frame,
	},
}
Cosmetics.frame_geheimnisnacht_2024 = {
	icon = "unit_frame_02",
}
Cosmetics.frame_gotwf_01 = {
	icon = "unit_frame_02",
	texture_package_name = "resource_packages/store/item_icons/store_item_icon_frame_gotwf_01",
	unit = "",
	attachment_node = {
		unit = "units/ui/ui_portrait_frame",
		attachment_node = AttachmentNodeLinking.ui_portrait_frame,
	},
	material_settings = {
		portrait_frame = {
			texture = "gui/1080p/single_textures/store_item_icons/store_item_icon_frame_gotwf_01/store_item_icon_frame_gotwf_01",
			type = "texture",
		},
	},
}
Cosmetics.frame_gotwf_2024 = {
	icon = "unit_frame_02",
}
Cosmetics.pose_template = {
	icon = "icons_placeholder",
}

DLCUtils.map_list("cosmetics_files", function (file_name)
	local cosmetics_templates = require(file_name)

	if cosmetics_templates then
		table.merge(Cosmetics, cosmetics_templates)
	end
end)

for name, cosmetic_data in pairs(Cosmetics) do
	cosmetic_data.name = name
end
