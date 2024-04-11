-- chunkname: @scripts/unit_extensions/ai_commander/controlled_unit_templates.lua

ControlledUnitDisbandType = table.enum("kill", "remove", "none")
ControlledUnitTemplates = {}
ControlledUnitTemplates.necromancer_pet = {
	duration = 20,
	pet_ui_type = "buff",
	disband_type = ControlledUnitDisbandType.kill,
}
ControlledUnitTemplates.necromancer_pet_charges = {
	pet_ui_type = "health",
	disband_type = ControlledUnitDisbandType.kill,
	buff_on_command = {
		[CommandStates.Attacking] = {
			{
				name = "skeleton_command_attack_boost",
				remove_on_command = false,
			},
		},
		[CommandStates.StandingGround] = {
			{
				name = "skeleton_command_defend_boost",
				remove_on_command = true,
			},
		},
	},
}
ControlledUnitTemplates.necromancer_pet_ability = {
	duration = 20,
	pet_ui_type = "buff",
	disband_type = ControlledUnitDisbandType.kill,
}
ControlledUnitTemplates.necromancer_pet_army = {
	client_version = "necromancer_pet_army_client",
	duration = 20,
	pet_ui_type = "buff",
	disband_type = ControlledUnitDisbandType.kill,
}
ControlledUnitTemplates.necromancer_pet_army_client = table.clone(ControlledUnitTemplates.necromancer_pet_army)
ControlledUnitTemplates.necromancer_pet_army_client.disband_type = ControlledUnitDisbandType.none
ControlledUnitTemplates.necromancer_pet_army_client.pet_ui_type = "server_controlled"

for name, template in pairs(ControlledUnitTemplates) do
	template.name = name
end
