ControlledUnitDisbandType = table.enum("kill", "remove", "none")
ControlledUnitTemplates = {
	necromancer_pet = {
		pet_ui_type = "buff",
		duration = 20,
		disband_type = ControlledUnitDisbandType.kill
	},
	necromancer_pet_charges = {
		pet_ui_type = "health",
		disband_type = ControlledUnitDisbandType.kill,
		buff_on_command = {
			[CommandStates.Attacking] = {
				{
					remove_on_command = false,
					name = "skeleton_command_attack_boost"
				}
			},
			[CommandStates.StandingGround] = {
				{
					remove_on_command = true,
					name = "skeleton_command_defend_boost"
				}
			}
		}
	},
	necromancer_pet_ability = {
		pet_ui_type = "buff",
		duration = 20,
		disband_type = ControlledUnitDisbandType.kill
	},
	necromancer_pet_straggler = {
		pet_ui_type = "buff",
		duration = 20,
		disband_type = ControlledUnitDisbandType.kill
	}
}
ControlledUnitTemplates.necromancer_pet_straggler_client = table.clone(ControlledUnitTemplates.necromancer_pet_straggler)
ControlledUnitTemplates.necromancer_pet_straggler_client.disband_type = ControlledUnitDisbandType.none
ControlledUnitTemplates.necromancer_pet_straggler_client.pet_ui_type = "server_controlled"

for name, template in pairs(ControlledUnitTemplates) do
	template.name = name
end
