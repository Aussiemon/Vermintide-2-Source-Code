BeastmenStandardHealthExtension = class(BeastmenStandardHealthExtension, GenericHealthExtension)

BeastmenStandardHealthExtension.init = function (self, extension_init_context, unit, extension_init_data)
	BeastmenStandardHealthExtension.super.init(self, extension_init_context, unit, extension_init_data)

	self._unit = unit
end

BeastmenStandardHealthExtension.extensions_ready = function (self, world, unit, extension_name)
	return
end

BeastmenStandardHealthExtension.destroy = function (self)
	BeastmenStandardHealthExtension.super.destroy(self)

	self.blackboard = nil
end

BeastmenStandardHealthExtension.add_damage = function (self, attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, damaging_unit, hit_react_type, is_critical_strike)
	if damage_source_name == "suicide" then
		BeastmenStandardHealthExtension.super.add_damage(self, attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, damaging_unit, hit_react_type, is_critical_strike)
	else
		local master_list_item = rawget(ItemMasterList, damage_source_name)

		if master_list_item then
			local slot_type = master_list_item.slot_type
			local rapier_pistol = damage_type == "shot_carbine"
			local melee_weapon = slot_type and slot_type == "melee" and not rapier_pistol

			if melee_weapon then
				BeastmenStandardHealthExtension.super.add_damage(self, attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, damaging_unit, hit_react_type, is_critical_strike)

				local standard_extension = ScriptUnit.has_extension(self._unit, "ai_supplementary_system")
				local standard_template = standard_extension.standard_template

				if standard_template then
					local sfx_taking_damage = standard_template.sfx_taking_damage

					WwiseUtils.trigger_unit_event(standard_extension.world, sfx_taking_damage, self._unit, 0)
				end
			end
		end
	end
end

return
