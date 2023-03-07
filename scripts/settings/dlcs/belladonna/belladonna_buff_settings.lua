local settings = DLCSettings.belladonna
settings.buff_templates = {
	invincibility_standard = {
		buffs = {
			{
				update_func = "update_invincibility_standard",
				name = "invincibility_standard",
				max_stacks = 1,
				remove_buff_func = "remove_invincibility_standard",
				apply_buff_func = "apply_invincibility_standard"
			}
		}
	},
	healing_standard = {
		buffs = {
			{
				update_func = "update_healing_standard",
				name = "healing_standard",
				max_stacks = 1,
				remove_buff_func = "remove_healing_standard",
				apply_buff_func = "apply_healing_standard",
				heal_amounts = {
					hardest = 8,
					hard = 3,
					harder = 6,
					cataclysm_2 = 13,
					cataclysm = 11,
					cataclysm_3 = 15,
					normal = 2
				}
			}
		}
	}
}
settings.buff_function_templates = {
	apply_invincibility_standard = function (unit, buff, params, world)
		return
	end,
	update_invincibility_standard = function (unit, buff, params, world)
		QuickDrawer:sphere(POSITION_LOOKUP[unit], 1, Colors.get("cyan"))
	end,
	remove_invincibility_standard = function (unit, buff, params, world)
		if Managers.state.network.is_server then
			local stored_damage = buff.stored_damage
			local standard_is_destroyed = buff.standard_is_destroyed

			if stored_damage and standard_is_destroyed then
				local health_extension = ScriptUnit.extension(unit, "health_system")

				if health_extension:is_alive() then
					local attacker_unit = ALIVE[params.attacker_unit] and params.attacker_unit or unit
					local armor_type = buff.armor_type
					local damage_type = "buff"
					local damage = stored_damage
					local damage_source = buff.damage_source
					buff.applied_damage = true

					DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)
				end
			end
		end
	end,
	apply_healing_standard = function (unit, buff, params, world)
		buff.next_heal_tick_t = params.t + 1

		Unit.flow_event(unit, "vfx_healing_buff")

		if Managers.state.network.is_server then
			local health_extension = ScriptUnit.extension(unit, "health_system")
			local max_health = health_extension:get_max_health()
			local buff_template = buff.template
			local difficulty_level = Managers.state.difficulty:get_difficulty()
			local heal_amount = buff_template.heal_amounts[difficulty_level]
			local new_max_health = max_health + heal_amount * 5

			health_extension:set_max_health(new_max_health)

			health_extension._damage_cap_per_hit = new_max_health
		end
	end,
	update_healing_standard = function (unit, buff, params, world)
		if buff.next_heal_tick_t < params.t then
			buff.next_heal_tick_t = params.t + 1

			if Managers.state.network.is_server then
				local health_extension = ScriptUnit.has_extension(unit, "health_system")

				if health_extension then
					local buff_template = buff.template
					local heal_type = "leech"
					local difficulty_level = Managers.state.difficulty:get_difficulty()
					local heal_amount = buff_template.heal_amounts[difficulty_level]
					heal_amount = DamageUtils.networkify_damage(heal_amount)

					health_extension:add_heal(unit, heal_amount, nil, heal_type)
				end
			end

			Unit.flow_event(unit, "vfx_healing_buff_proc")
		end
	end,
	remove_healing_standard = function (unit, buff, params, world)
		Unit.flow_event(unit, "vfx_remove_healing_buff")

		if Managers.state.network.is_server then
			local health_extension = ScriptUnit.extension(unit, "health_system")
			local max_health = health_extension:get_max_health()
			local buff_template = buff.template
			local difficulty_level = Managers.state.difficulty:get_difficulty()
			local heal_amount = buff_template.heal_amounts[difficulty_level]
			local new_max_health = max_health - heal_amount * 5

			health_extension:set_max_health(new_max_health)

			health_extension._damage_cap_per_hit = new_max_health
			local attacker_unit = ALIVE[params.attacker_unit] and params.attacker_unit or unit
			local damage_type = "buff"
			local damage = 1
			local damage_source = buff.damage_source
			buff.applied_damage = true

			DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)
		end
	end
}
