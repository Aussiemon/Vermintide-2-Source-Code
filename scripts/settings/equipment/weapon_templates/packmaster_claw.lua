local weapon_template = weapon_template or {}
weapon_template.actions = {}
weapon_template.right_hand_unit = "units/weapons/player/wpn_packmaster_claw/wpn_packmaster_claw"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.packmaster_claw
weapon_template.wield_anim = "to_packmaster_claw"

return {
	packmaster_claw = table.clone(weapon_template)
}
