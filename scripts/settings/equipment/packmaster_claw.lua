local push_radius = 2
local weapon_template = weapon_template or {}
weapon_template.actions = {}
weapon_template.right_hand_unit = "units/weapons/player/wpn_packmaster_claw/wpn_packmaster_claw"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.packmaster_claw
weapon_template.wield_anim = "to_packmaster_claw"
Weapons = Weapons or {}
Weapons.packmaster_claw = Weapons.packmaster_claw or table.clone(weapon_template)

return
