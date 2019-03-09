return {
	description = "description_mutator_corpse_explosion",
	icon = "icon_deed_normal_01",
	display_name = "display_name_mutator_corpse_explosion",
	server_ai_killed_function = function (context, data, killed_unit, killer_unit, death_data)
		local unit_name = "units/hub_elements/empty"
		local unit_template_name = "timed_explosion_unit"
		local position = POSITION_LOOKUP[killed_unit]
		local blackboard = BLACKBOARDS[killed_unit]
		local breed = blackboard.breed
		local rotation = Quaternion.identity()
		local extension_init_data = {
			area_damage_system = {
				explosion_template_name = breed.corpse_explosion_template_name or "corpse_explosion_default"
			}
		}

		Managers.state.unit_spawner:spawn_network_unit(unit_name, unit_template_name, extension_init_data, position, rotation)
	end
}
