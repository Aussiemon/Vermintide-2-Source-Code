require("scripts/unit_extensions/weapons/single_weapon_unit_templates")

SingleWeaponUnitExtension = class(SingleWeaponUnitExtension)

SingleWeaponUnitExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	self.world = world
	self.unit = unit
	self.owner_unit = extension_init_data.owner_unit
	local item_template = extension_init_data.item_template
	self.single_weapon_template_name = item_template.single_weapon_template_name
	self.weapon_template = SingleWeaponUnitTemplates.get_template(self.single_weapon_template_name)
	self.is_server = Managers.player.is_server
	self.data = {}
end

SingleWeaponUnitExtension.extensions_ready = function (self, world, unit)
	return
end

SingleWeaponUnitExtension.has_current_action = function (self)
	return false
end

SingleWeaponUnitExtension.change_state = function (self, state)
	self.state = state

	self.weapon_template[state](self.world, self.unit, self.owner_unit, self.data)
end

SingleWeaponUnitExtension.destroy = function (self)
	self.weapon_template.destroy(self.world, self.unit, self.owner_unit, self.data)
end

SingleWeaponUnitExtension.update = function (self, unit, input, dt, context, t)
	self.weapon_template.update(self.world, self.unit, self.owner_unit, self.data, t, dt)
end

return
