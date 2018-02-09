local push_radius = 2
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_active_ability_ranger = {
		default = {
			kind = "dummy",
			total_time = 0,
			allowed_chain_actions = {}
		}
	},
	action_inspect = ActionTemplates.action_inspect_right,
	action_wield = ActionTemplates.wield_right,
	action_career_skill = ActionTemplates.career_skill_dummy,
	action_instant_grenade_throw = ActionTemplates.instant_equip_grenade,
	action_instant_heal_self = ActionTemplates.instant_equip_and_heal_self,
	action_instant_heal_other = ActionTemplates.instant_equip_and_heal_other,
	action_instant_drink_potion = ActionTemplates.instant_equip_and_drink_potion,
	action_instant_equip_tome = ActionTemplates.instant_equip_tome,
	action_instant_equip_grimoire = ActionTemplates.instant_equip_grimoire,
	action_instant_equip_grenade = ActionTemplates.instant_equip_grenade_only,
	action_instant_equip_healing_draught = ActionTemplates.instant_equip_and_drink_healing_draught
}
weapon_template.right_hand_unit = "units/weapons/player/wpn_emp_grenade_02_t2/wpn_emp_grenade_02_t2"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right
weapon_template.wield_anim = "veteran_ranger_ability_grenade"
weapon_template.gui_texture = "hud_consumable_icon_grenade"
weapon_template.crosshair_style = "default"
weapon_template.max_fatigue_points = 4
weapon_template.dodge_distance = 1
weapon_template.dodge_speed = 1
weapon_template.dodge_count = 3
weapon_template.can_give_other = true
Weapons = Weapons or {}
Weapons.bardin_ranger_career_skill_weapon = table.create_copy(Weapons.bardin_ranger_career_skill_weapon, weapon_template)

return 
