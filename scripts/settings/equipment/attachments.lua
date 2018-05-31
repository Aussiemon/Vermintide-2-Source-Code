require("scripts/settings/attachment_node_linking")

FirstPersonAttachments = {
	witch_hunter = {
		unit = "units/beings/player/witch_hunter/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	bright_wizard = {
		unit = "units/beings/player/bright_wizard/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wood_elf = {
		unit = "units/beings/player/way_watcher/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	dwarf_ranger = {
		unit = "units/beings/player/dwarf_ranger_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	empire_soldier = {
		unit = "units/beings/player/empire_soldier/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	}
}
Attachments = {}
local hanging_trophy = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_trophy",
	attachment_node_linking = AttachmentNodeLinking.trophies.hanging,
	slots = {
		"slot_trinket_1",
		"slot_trinket_2",
		"slot_trinket_3"
	},
	buffs = {}
}
local flat_trophy = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_trophy",
	attachment_node_linking = AttachmentNodeLinking.trophies.flat,
	slots = {
		"slot_trinket_1",
		"slot_trinket_2",
		"slot_trinket_3"
	},
	buffs = {}
}
Attachments.hanging_trophy = table.clone(hanging_trophy)
Attachments.flat_trophy = table.clone(flat_trophy)
local wh_hats = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.wh_hats = table.clone(wh_hats)
local wh_hats_skinned = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.wh_hats_skinned = table.clone(wh_hats_skinned)
local wh_z_hats_tattoo_00 = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_00",
		third_person = {
			mtr_head = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_00"
		}
	}
}
Attachments.wh_z_hats_tattoo_00 = table.clone(wh_z_hats_tattoo_00)
local wh_z_hats_tattoo_01 = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_01",
		third_person = {
			mtr_head = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_01"
		}
	}
}
Attachments.wh_z_hats_tattoo_01 = table.clone(wh_z_hats_tattoo_01)
local wh_z_hats_tattoo_02 = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_02",
		third_person = {
			mtr_head = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_02"
		}
	}
}
Attachments.wh_z_hats_tattoo_02 = table.clone(wh_z_hats_tattoo_02)
local wh_z_hats_tattoo_03 = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_03",
		third_person = {
			mtr_head = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_03"
		}
	}
}
Attachments.wh_z_hats_tattoo_03 = table.clone(wh_z_hats_tattoo_03)
local wh_z_hats_tattoo_04 = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_04",
		third_person = {
			mtr_head = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_04"
		}
	}
}
Attachments.wh_z_hats_tattoo_04 = table.clone(wh_z_hats_tattoo_04)
local wh_z_hats_tattoo_05 = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_05",
		third_person = {
			mtr_head = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_05"
		}
	}
}
Attachments.wh_z_hats_tattoo_05 = table.clone(wh_z_hats_tattoo_05)
local wh_z_hats_tattoo_06 = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_06",
		third_person = {
			mtr_head = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_06"
		}
	}
}
Attachments.wh_z_hats_tattoo_06 = table.clone(wh_z_hats_tattoo_06)
local ww_hoods = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_mask",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.ww_hoods = table.clone(ww_hoods)
local ww_full_face = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_head_default",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.ww_full_face = table.clone(ww_full_face)
local ww_half_masks = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_half_mask",
	attachment_node_linking = AttachmentNodeLinking.ww_mask,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.ww_half_masks = table.clone(ww_half_masks)
local ww_masks = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_mask",
	attachment_node_linking = AttachmentNodeLinking.ww_mask,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.ww_masks = table.clone(ww_masks)
local ww_hat = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hat",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.ww_hat = table.clone(ww_hat)
local ww_helmet = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_helmet",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.ww_helmet = table.clone(ww_helmet)
local ww_helmet_skinned = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_helmet",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.ww_helmet_skinned = table.clone(ww_helmet_skinned)
local ww_helmet_mask = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_helmet_mask",
	attachment_node_linking = AttachmentNodeLinking.ww_mask,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.ww_helmet_mask = table.clone(ww_helmet_mask)
local es_hats = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.es_hats = table.clone(es_hats)
local es_hats_no_ear = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_ears",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.es_hats_no_ear = table.clone(es_hats_no_ear)
local es_hats_no_beard = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_beard",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.es_hats_no_beard = table.clone(es_hats_no_beard)
local es_hats_skinned = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet_es_hood",
	show_attachments_event = "lua_show_ears",
	attachment_node_linking = AttachmentNodeLinking.es_hat_skinned,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.es_hats_skinned = table.clone(es_hats_skinned)
local es_hats_no_ears_skinned = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet_es_hood",
	show_attachments_event = "lua_hide_ears",
	attachment_node_linking = AttachmentNodeLinking.es_hat_skinned,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.es_hats_no_ears_skinned = table.clone(es_hats_no_ears_skinned)
local es_hats_no_beard_skinned = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet_es_hood",
	show_attachments_event = "lua_hide_beard",
	attachment_node_linking = AttachmentNodeLinking.es_hat_skinned,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.es_hats_no_beard_skinned = table.clone(es_hats_no_beard_skinned)
local es_beard = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.es_beard = table.clone(es_beard)
local es_beard_skinned = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet_es_hood",
	show_attachments_event = "lua_hide_beard",
	attachment_node_linking = AttachmentNodeLinking.es_beard_skinned,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.es_beard_skinned = table.clone(es_beard_skinned)
local dr_helmets = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.dr_helmets = table.clone(dr_helmets)
local dr_helmets_skinned_long = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet_dr_hood",
	show_attachments_event = "lua_show_ears",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_long,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.dr_helmets_skinned_long = table.clone(dr_helmets_skinned_long)
local dr_helmets_no_ear = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_ears",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.dr_helmets_no_ear = table.clone(dr_helmets_no_ear)
local dr_helmets_beard_ears = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_beard_ears",
	attachment_node_linking = AttachmentNodeLinking.dr_beard,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.dr_helmets_beard_ears = table.clone(dr_helmets_beard_ears)
local dr_hair_tattoo_00 = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_normal_nose",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_00",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_00"
		}
	}
}
Attachments.dr_hair_tattoo_00 = table.clone(dr_hair_tattoo_00)
local dr_hair_tattoo_01 = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_normal_nose",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_01",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_01"
		}
	}
}
Attachments.dr_hair_tattoo_01 = table.clone(dr_hair_tattoo_01)
local dr_hair_tattoo_02 = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_normal_nose",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_02",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_02"
		}
	}
}
Attachments.dr_hair_tattoo_02 = table.clone(dr_hair_tattoo_02)
local dr_hair_tattoo_03 = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_normal_nose",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_03",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_03"
		}
	}
}
Attachments.dr_hair_tattoo_03 = table.clone(dr_hair_tattoo_03)
local dr_hair_tattoo_04 = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_normal_nose",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_04",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_04"
		}
	}
}
Attachments.dr_hair_tattoo_04 = table.clone(dr_hair_tattoo_04)
local dr_hair_tattoo_05 = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_normal_nose",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_05",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_05"
		}
	}
}
Attachments.dr_hair_tattoo_05 = table.clone(dr_hair_tattoo_05)
local dr_hair_nose_big_tattoo_00 = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_big_nose",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_00",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_00"
		}
	}
}
Attachments.dr_hair_nose_big_tattoo_00 = table.clone(dr_hair_nose_big_tattoo_00)
local dr_hair_nose_big_tattoo_01 = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_big_nose",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_01",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_01"
		}
	}
}
Attachments.dr_hair_nose_big_tattoo_01 = table.clone(dr_hair_nose_big_tattoo_01)
local dr_hair_nose_big_tattoo_02 = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_big_nose",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_02",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_02"
		}
	}
}
Attachments.dr_hair_nose_big_tattoo_02 = table.clone(dr_hair_nose_big_tattoo_02)
local dr_hair_nose_big_tattoo_03 = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_big_nose",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_03",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_03"
		}
	}
}
Attachments.dr_hair_nose_big_tattoo_03 = table.clone(dr_hair_nose_big_tattoo_03)
local dr_hair_nose_big_tattoo_04 = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_big_nose",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_04",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_04"
		}
	}
}
Attachments.dr_hair_nose_big_tattoo_04 = table.clone(dr_hair_nose_big_tattoo_04)
local dr_hair_nose_big_tattoo_05 = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_big_nose",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_05",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_05"
		}
	}
}
Attachments.dr_hair_nose_big_tattoo_05 = table.clone(dr_hair_nose_big_tattoo_05)
local bw_gates = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_breastplate",
	attachment_node_linking = AttachmentNodeLinking.bw_gate,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.bw_gates = table.clone(bw_gates)
local bw_hat = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.bw_hat = table.clone(bw_hat)
local bw_gates_facemask = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_breastplate",
	attachment_node_linking = AttachmentNodeLinking.bw_gate_facemask,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.bw_gates_facemask = table.clone(bw_gates_facemask)
local bw_gates_no_breastplate = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_breastplate",
	attachment_node_linking = AttachmentNodeLinking.bw_gate,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.bw_gates_no_breastplate = table.clone(bw_gates_no_breastplate)
local bw_gates_facemask_no_breastplate = {
	unit = "",
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_breastplate",
	attachment_node_linking = AttachmentNodeLinking.bw_gate_facemask,
	slots = {
		"slot_hat"
	},
	buffs = {}
}
Attachments.bw_gates_facemask_no_breastplate = table.clone(bw_gates_facemask_no_breastplate)
local necklace_template = {
	display_unit = "",
	attachment_node_linking = AttachmentNodeLinking.non_visual_attachment,
	slots = {
		"slot_necklace"
	}
}
Attachments.necklace_template = table.clone(necklace_template)
local ring_template = {
	display_unit = "",
	attachment_node_linking = AttachmentNodeLinking.non_visual_attachment,
	slots = {
		"slot_ring"
	}
}
Attachments.ring_template = table.clone(ring_template)
local trinket_template = {
	display_unit = "",
	attachment_node_linking = AttachmentNodeLinking.non_visual_attachment,
	slots = {
		"slot_trinket"
	}
}
Attachments.trinket_template = table.clone(trinket_template)

for name, attachment_data in pairs(Attachments) do
	attachment_data.name = name

	assert(attachment_data.units ~= "", "Name is empty")
	assert(attachment_data.attachment_node_linking)
	assert(attachment_data.slots)
end

return
