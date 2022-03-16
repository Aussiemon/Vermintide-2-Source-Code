local weapon_template = {
	actions = {},
	right_hand_unit = "units/weapons/player/wpn_packmaster_claw/wpn_packmaster_claw",
	right_hand_attachment_node_linking = AttachmentNodeLinking.packmaster_claw,
	wield_anim = "to_packmaster_claw"
}

return {
	packmaster_claw = table.clone(weapon_template)
}
