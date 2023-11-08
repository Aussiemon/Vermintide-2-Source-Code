local weapon_template = {
	actions = {},
	right_hand_unit = "units/weapons/player/wpn_packmaster_claw/wpn_packmaster_claw",
	right_hand_attachment_node_linking = AttachmentNodeLinking.packmaster_claw,
	wield_anim = "to_packmaster_claw",
	state_machine = "units/beings/player/first_person_base/state_machines/common",
	load_state_machine = false
}

return {
	packmaster_claw = table.clone(weapon_template)
}
