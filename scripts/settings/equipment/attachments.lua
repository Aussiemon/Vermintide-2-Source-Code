﻿-- chunkname: @scripts/settings/equipment/attachments.lua

require("scripts/settings/attachment_node_linking")

FirstPersonAttachments = {}
FirstPersonAttachments.witch_hunter = {
	unit = "units/beings/player/witch_hunter/first_person_base/chr_first_person_mesh",
	attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
}
FirstPersonAttachments.bright_wizard = {
	unit = "units/beings/player/bright_wizard/first_person_base/chr_first_person_mesh",
	attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
}
FirstPersonAttachments.wood_elf = {
	unit = "units/beings/player/way_watcher/first_person_base/chr_first_person_mesh",
	attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
}
FirstPersonAttachments.dwarf_ranger = {
	unit = "units/beings/player/dwarf_ranger_upgraded/first_person_base/chr_first_person_mesh",
	attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
}
FirstPersonAttachments.empire_soldier = {
	unit = "units/beings/player/empire_soldier/first_person_base/chr_first_person_mesh",
	attachment_node_linking = AttachmentNodeLinking.first_person_attachment,
}
Attachments = {}

local hanging_trophy = {
	display_unit = "units/weapons/weapon_display/display_trophy",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.trophies.hanging,
	slots = {
		"slot_trinket_1",
		"slot_trinket_2",
		"slot_trinket_3",
	},
	buffs = {},
}
local flat_trophy = {
	display_unit = "units/weapons/weapon_display/display_trophy",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.trophies.flat,
	slots = {
		"slot_trinket_1",
		"slot_trinket_2",
		"slot_trinket_3",
	},
	buffs = {},
}

Attachments.hanging_trophy = table.clone(hanging_trophy)
Attachments.flat_trophy = table.clone(flat_trophy)

local wh_hats = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.wh_hats = table.clone(wh_hats)

local wh_hats_skinned = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_wide,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.wh_hats_skinned = table.clone(wh_hats_skinned)

local wh_face = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.wh_face,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.wh_face = table.clone(wh_face)

local wh_face_no_hair = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.wh_face,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_00",
		third_person = {
			mtr_head = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_00",
		},
	},
}

Attachments.wh_face_no_hair = table.clone(wh_face_no_hair)

local wh_hats_no_ears = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.wh_hats_no_ears = table.clone(wh_hats_no_ears)

local wh_hats_no_ears_skinned = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_wide,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.wh_hats_no_ears_skinned = table.clone(wh_hats_no_ears_skinned)

local wh_hats_no_ears_skinned_lock_jaw = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_ears_lock_jaw",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_wide,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.wh_hats_no_ears_skinned_lock_jaw = table.clone(wh_hats_no_ears_skinned_lock_jaw)

local wh_hats_face_skinned = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_face,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.wh_hats_face_skinned = table.clone(wh_hats_face_skinned)

local wh_hats_no_ears_face_skinned = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_face,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.wh_hats_no_ears_face_skinned = table.clone(wh_hats_no_ears_face_skinned)

local wh_z_hats_tattoo_00 = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_00",
		third_person = {
			mtr_head = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_00",
		},
	},
}

Attachments.wh_z_hats_tattoo_00 = table.clone(wh_z_hats_tattoo_00)

local wh_z_hats_tattoo_00_face_skinned = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_face,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_00",
		third_person = {
			mtr_head = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_00",
		},
	},
}

Attachments.wh_z_hats_tattoo_00_face_skinned = table.clone(wh_z_hats_tattoo_00_face_skinned)

local wh_z_hats_tattoo_01 = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_01",
		third_person = {
			mtr_head = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_01",
		},
	},
}

Attachments.wh_z_hats_tattoo_01 = table.clone(wh_z_hats_tattoo_01)

local wh_z_hats_tattoo_02 = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_02",
		third_person = {
			mtr_head = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_02",
		},
	},
}

Attachments.wh_z_hats_tattoo_02 = table.clone(wh_z_hats_tattoo_02)

local wh_z_hats_tattoo_03 = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_03",
		third_person = {
			mtr_head = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_03",
		},
	},
}

Attachments.wh_z_hats_tattoo_03 = table.clone(wh_z_hats_tattoo_03)

local wh_z_hats_tattoo_04 = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_04",
		third_person = {
			mtr_head = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_04",
		},
	},
}

Attachments.wh_z_hats_tattoo_04 = table.clone(wh_z_hats_tattoo_04)

local wh_z_hats_tattoo_05 = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_05",
		third_person = {
			mtr_head = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_05",
		},
	},
}

Attachments.wh_z_hats_tattoo_05 = table.clone(wh_z_hats_tattoo_05)

local wh_z_hats_tattoo_06 = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_06",
		third_person = {
			mtr_head = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_face_06",
		},
	},
}

Attachments.wh_z_hats_tattoo_06 = table.clone(wh_z_hats_tattoo_06)

local wh_z_hat_10 = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_hat_10_face",
		third_person = {
			mtr_head = "units/beings/player/witch_hunter_zealot/headpiece/wh_z_hat_10_face",
		},
	},
}

Attachments.wh_z_hat_10 = table.clone(wh_z_hat_10)

local ww_hoods = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_mask",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_wide,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.ww_hoods = table.clone(ww_hoods)

local ww_hoods_jaw = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_mask",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_face_wide,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.ww_hoods_jaw = table.clone(ww_hoods_jaw)

local ww_balaclava_wide = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_balaclava",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_face_wide,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.ww_balaclava_wide = table.clone(ww_balaclava_wide)

local ww_full_face = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_head_default",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_wide,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.ww_full_face = table.clone(ww_full_face)

local ww_half_masks = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_half_mask",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_face_long,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.ww_half_masks = table.clone(ww_half_masks)

local ww_masks = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_mask",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_face_long,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.ww_masks = table.clone(ww_masks)

local ww_hat = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_head_default",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.ww_hat = table.clone(ww_hat)

local ww_hat_no_hood = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_head_no_hood",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.ww_hat_no_hood = table.clone(ww_hat_no_hood)

local ww_hat_no_face = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_head_default_no_face",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.ww_hat_no_face = table.clone(ww_hat_no_face)

local ww_helmet = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_helmet",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.ww_helmet = table.clone(ww_helmet)

local ww_helmet_ears = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_helmet_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.ww_helmet_ears = table.clone(ww_helmet_ears)

local ww_helmet_ears_skinned = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_helmet_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_face_long,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.ww_helmet_ears_skinned = table.clone(ww_helmet_ears_skinned)

local ww_helmet_skinned = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_helmet",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_wide,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.ww_helmet_skinned = table.clone(ww_helmet_skinned)

local ww_helmet_mask = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_helmet_mask",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_face_long,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.ww_helmet_mask = table.clone(ww_helmet_mask)

local ww_helmet_mask_jaw = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_helmet_mask",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_face,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.ww_helmet_mask_jaw = table.clone(ww_helmet_mask_jaw)

local ww_helmet_jaw = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_helmet",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_face_long,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.ww_helmet_jaw = table.clone(ww_helmet_jaw)

local ww_half_mask_full_face = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_head_default",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_face_long,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.ww_half_mask_full_face = table.clone(ww_half_mask_full_face)

local ww_hide_eyes_hair_hood_down = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_eyes_hair_hood_down",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.ww_hide_eyes_hair_hood_down = table.clone(ww_hide_eyes_hair_hood_down)

local es_hats = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.es_hats = table.clone(es_hats)

local es_hats_jaw = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_face,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.es_hats_jaw = table.clone(es_hats_jaw)

local es_hats_no_ear = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.es_hats_no_ear = table.clone(es_hats_no_ear)

local es_hats_no_ear_lock_neck = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_ears_lock_neck",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.es_hats_no_ear_lock_neck = table.clone(es_hats_no_ear_lock_neck)

local es_hats_no_moustache = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_moustache",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.es_hats_no_moustache = table.clone(es_hats_no_moustache)

local es_hats_no_moustache_skinned = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_moustache",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.es_hat_skinned_wide,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.es_hats_no_moustache_skinned = table.clone(es_hats_no_moustache_skinned)

local es_hats_no_ear_moustache = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_ears_moustache",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.es_hats_no_ear_moustache = table.clone(es_hats_no_ear_moustache)

local es_hats_no_ear_moustache_skinned = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_ears_moustache",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.es_hat_skinned_wide,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.es_hats_no_ear_moustache_skinned = table.clone(es_hats_no_ear_moustache_skinned)

local es_hats_no_beard_ear_nose_moustache = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_ears_nose_moustache",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.es_hats_no_beard_ear_nose_moustache = table.clone(es_hats_no_beard_ear_nose_moustache)

local es_hats_no_beard = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_beard",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.es_hats_no_beard = table.clone(es_hats_no_beard)

local es_hats_no_ears_beard = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_ears_beard",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.es_hats_no_ears_beard = table.clone(es_hats_no_ears_beard)

local es_hats_skinned = {
	display_unit = "units/weapons/weapon_display/display_helmet_es_hood",
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.es_hat_skinned_wide,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.es_hats_skinned = table.clone(es_hats_skinned)

local es_hats_no_ears_skinned = {
	display_unit = "units/weapons/weapon_display/display_helmet_es_hood",
	show_attachments_event = "lua_hide_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.es_hat_skinned_wide,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.es_hats_no_ears_skinned = table.clone(es_hats_no_ears_skinned)

local es_hats_no_beard_skinned = {
	display_unit = "units/weapons/weapon_display/display_helmet_es_hood",
	show_attachments_event = "lua_hide_beard",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.es_hat_skinned_wide,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.es_hats_no_beard_skinned = table.clone(es_hats_no_beard_skinned)

local es_beard = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_beard",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.es_beard = table.clone(es_beard)

local es_beard_skinned = {
	display_unit = "units/weapons/weapon_display/display_helmet_es_hood",
	show_attachments_event = "lua_hide_beard",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.es_beard,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.es_beard_skinned = table.clone(es_beard_skinned)

local dr_helmets = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.dr_helmets = table.clone(dr_helmets)

local dr_helmets_skinned_long = {
	display_unit = "units/weapons/weapon_display/display_helmet_dr_hood",
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_wide_arms,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.dr_helmets_skinned_long = table.clone(dr_helmets_skinned_long)

local dr_helmets_skinned_long_no_head = {
	display_unit = "units/weapons/weapon_display/display_helmet_dr_hood",
	show_attachments_event = "lua_hide_head",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_wide_arms,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.dr_helmets_skinned_long_no_head = table.clone(dr_helmets_skinned_long_no_head)

local dr_helmets_no_ear = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.dr_helmets_no_ear = table.clone(dr_helmets_no_ear)

local dr_helmets_hide_ears_skin_jaw = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_face_long,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.dr_helmets_hide_ears_skin_jaw = table.clone(dr_helmets_hide_ears_skin_jaw)

local dr_helmets_hide_beard = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_beard",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.dr_beard,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.dr_helmets_hide_beard = table.clone(dr_helmets_hide_beard)

local dr_helmets_hide_head_beard = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_head_beard",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.player_face,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.dr_helmets_hide_head_beard = table.clone(dr_helmets_hide_head_beard)

local dr_helmets_beard_ears = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_beard_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.dr_beard,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.dr_helmets_beard_ears = table.clone(dr_helmets_beard_ears)

local dr_helmets_beard_face = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_face_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.player_face,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.dr_helmets_beard_face = table.clone(dr_helmets_beard_face)

local dr_helmets_beard_face_ears = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_face_hide_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.player_face,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.dr_helmets_beard_face_ears = table.clone(dr_helmets_beard_face_ears)

local dr_helmets_hide_beard_ears_default_only = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_default_beard_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.dr_beard,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.dr_helmets_hide_beard_ears_default_only = table.clone(dr_helmets_hide_beard_ears_default_only)

local dr_hair_tattoo_00 = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_normal_nose",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_00",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_00",
		},
	},
}

Attachments.dr_hair_tattoo_00 = table.clone(dr_hair_tattoo_00)

local dr_hair_tattoo_00_hide_ears_skin_jaw = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_face_long,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_00",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_00",
		},
	},
}

Attachments.dr_hair_tattoo_00_hide_ears_skin_jaw = table.clone(dr_hair_tattoo_00_hide_ears_skin_jaw)

local dr_hair_tattoo_01 = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_normal_nose",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_01",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_01",
		},
	},
}

Attachments.dr_hair_tattoo_01 = table.clone(dr_hair_tattoo_01)

local dr_hair_tattoo_02 = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_normal_nose",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_02",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_02",
		},
	},
}

Attachments.dr_hair_tattoo_02 = table.clone(dr_hair_tattoo_02)

local dr_hair_tattoo_03 = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_normal_nose",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_03",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_03",
		},
	},
}

Attachments.dr_hair_tattoo_03 = table.clone(dr_hair_tattoo_03)

local dr_hair_tattoo_04 = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_normal_nose",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_04",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_04",
		},
	},
}

Attachments.dr_hair_tattoo_04 = table.clone(dr_hair_tattoo_04)

local dr_hair_tattoo_05 = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_normal_nose",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_05",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_05",
		},
	},
}

Attachments.dr_hair_tattoo_05 = table.clone(dr_hair_tattoo_05)

local dr_hair_nose_big_tattoo_00 = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_big_nose",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_00",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_00",
		},
	},
}

Attachments.dr_hair_nose_big_tattoo_00 = table.clone(dr_hair_nose_big_tattoo_00)

local dr_hair_nose_big_tattoo_01 = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_big_nose",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_01",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_01",
		},
	},
}

Attachments.dr_hair_nose_big_tattoo_01 = table.clone(dr_hair_nose_big_tattoo_01)

local dr_hair_nose_big_tattoo_02 = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_big_nose",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_02",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_02",
		},
	},
}

Attachments.dr_hair_nose_big_tattoo_02 = table.clone(dr_hair_nose_big_tattoo_02)

local dr_hair_nose_big_tattoo_03 = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_big_nose",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_03",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_03",
		},
	},
}

Attachments.dr_hair_nose_big_tattoo_03 = table.clone(dr_hair_nose_big_tattoo_03)

local dr_hair_nose_big_tattoo_04 = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_big_nose",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_04",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_04",
		},
	},
}

Attachments.dr_hair_nose_big_tattoo_04 = table.clone(dr_hair_nose_big_tattoo_04)

local dr_hair_nose_big_tattoo_05 = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_big_nose",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_05",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_face_05",
		},
	},
}

Attachments.dr_hair_nose_big_tattoo_05 = table.clone(dr_hair_nose_big_tattoo_05)

local dr_s_hat_14 = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_normal_nose",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.dr_beard,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_hat_14_face",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_hat_14_face",
		},
	},
}

Attachments.dr_s_hat_14 = table.clone(dr_s_hat_14)

local dr_s_hat_15 = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_beard",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.dr_beard,
	slots = {
		"slot_hat",
	},
	buffs = {},
	character_material_changes = {
		package_name = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_hat_15_face",
		third_person = {
			mtr_face = "units/beings/player/dwarf_ranger_slayer/headpiece/dr_s_hat_15_face",
		},
	},
}

Attachments.dr_s_hat_15 = table.clone(dr_s_hat_15)

local bw_gates = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.bw_gate,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.bw_gates = table.clone(bw_gates)

local bw_gates_lock_neck = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears_lock_neck",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.bw_gate,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.bw_gates_lock_neck = table.clone(bw_gates_lock_neck)

local bw_hat = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.bw_hat = table.clone(bw_hat)

local bw_hat_lock_neck = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears_lock_neck",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.bw_hat_lock_neck = table.clone(bw_hat_lock_neck)

local bw_hat_no_hair = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_hair",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.bw_hat_no_hair = table.clone(bw_hat_no_hair)

local bw_hat_skinned_wide_no_hair = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_hair",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_wide,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.bw_hat_skinned_wide_no_hair = table.clone(bw_hat_skinned_wide_no_hair)

local bw_hat_no_hair_lock_neck = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_hair_lock_neck",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.bw_hat_no_hair_lock_neck = table.clone(bw_hat_no_hair_lock_neck)

local bw_hat_jaw_no_hair = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_hair",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_face,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.bw_hat_jaw_no_hair = table.clone(bw_hat_jaw_no_hair)

local bw_hat_no_ears = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.bw_hat_no_ears = table.clone(bw_hat_no_ears)

local bw_hat_no_ears_hair = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_ears_hair",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.bw_hat_no_ears_hair = table.clone(bw_hat_no_ears_hair)

local bw_gates_facemask = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.bw_gate_facemask,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.bw_gates_facemask = table.clone(bw_gates_facemask)

local bw_gates_no_breastplate = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_breastplate",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.bw_gate,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.bw_gates_no_breastplate = table.clone(bw_gates_no_breastplate)

local bw_gates_facemask_no_breastplate = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_breastplate",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.bw_gate_facemask,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.bw_gates_facemask_no_breastplate = table.clone(bw_gates_facemask_no_breastplate)

local bw_hat_skinned_wide = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_wide,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.bw_hat_skinned_wide = table.clone(bw_hat_skinned_wide)

local bw_face = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_face",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.player_face,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.bw_face = table.clone(bw_face)

local bw_hat_cloak = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	link_to_skin = true,
	show_attachments_event = "lua_show_ears",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_cloak,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.bw_hat_cloak = table.clone(bw_hat_cloak)

local bw_hair = {
	display_unit = "units/weapons/weapon_display/display_helmet",
	show_attachments_event = "lua_hide_hair",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_hair,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.bw_hair = table.clone(bw_hair)

local bw_hat_skinned_wide_no_head = {
	display_unit = "units/weapons/weapon_display/display_helmet_dr_hood",
	show_attachments_event = "lua_hide_head_eyes",
	unit = "",
	attachment_node_linking = AttachmentNodeLinking.hat_skinned_wide_arms,
	slots = {
		"slot_hat",
	},
	buffs = {},
}

Attachments.bw_hat_skinned_wide_no_head = table.clone(bw_hat_skinned_wide_no_head)

local necklace_template = {
	display_unit = "",
	attachment_node_linking = AttachmentNodeLinking.non_visual_attachment,
	slots = {
		"slot_necklace",
	},
}

Attachments.necklace_template = table.clone(necklace_template)

local ring_template = {
	display_unit = "",
	attachment_node_linking = AttachmentNodeLinking.non_visual_attachment,
	slots = {
		"slot_ring",
	},
}

Attachments.ring_template = table.clone(ring_template)

local trinket_template = {
	display_unit = "",
	attachment_node_linking = AttachmentNodeLinking.non_visual_attachment,
	slots = {
		"slot_trinket",
	},
}

Attachments.trinket_template = table.clone(trinket_template)

for name, attachment_data in pairs(Attachments) do
	attachment_data.name = name

	assert(attachment_data.units ~= "", "Name is empty")
	assert(attachment_data.attachment_node_linking)
	assert(attachment_data.slots)
end
