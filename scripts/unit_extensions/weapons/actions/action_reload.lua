ActionReload = class(ActionReload, ActionBase)

ActionReload.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionReload.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
end

ActionReload.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	local owner_unit = self.owner_unit
	local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	local ammo_extension = nil
	local equipment = inventory_extension:equipment()

	if equipment.right_hand_wielded_unit ~= nil and ScriptUnit.has_extension(equipment.right_hand_wielded_unit, "ammo_system") then
		ammo_extension = ScriptUnit.extension(equipment.right_hand_wielded_unit, "ammo_system")
	elseif equipment.left_hand_wielded_unit ~= nil and ScriptUnit.has_extension(equipment.left_hand_wielded_unit, "ammo_system") then
		ammo_extension = ScriptUnit.extension(equipment.left_hand_wielded_unit, "ammo_system")
	end

	if ammo_extension:can_reload() then
		local play_reload_animation = true

		ammo_extension:start_reload(play_reload_animation)
	end
end

ActionReload.client_owner_post_update = function (self, dt, t, world, can_damage)
	return
end

ActionReload.finish = function (self, reason)
	return
end

return
