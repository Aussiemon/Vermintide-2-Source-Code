require("scripts/unit_extensions/weapons/ai_weapon_unit_templates")

AiWeaponUnitExtension = class(AiWeaponUnitExtension)

AiWeaponUnitExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	self.world = world
	self.unit = unit
	self.owner_unit = extension_init_data.owner_unit
	self.weapon_template = extension_init_data.weapon_template
	self.is_server = Managers.player.is_server
	self.data = {}
end

AiWeaponUnitExtension.extensions_ready = function (self, world, unit)
	return
end

AiWeaponUnitExtension.destroy = function (self)
	local template = AiWeaponUnitTemplates.get_template(self.weapon_template)

	template.destroy(self.world, self.unit, self.data)
end

AiWeaponUnitExtension.update = function (self, unit, input, dt, context, t)
	local template = AiWeaponUnitTemplates.get_template(self.weapon_template)

	template.update(self.world, self.unit, self.data, t, dt)
end

AiWeaponUnitExtension.shoot_start = function (self, unit_owner, shoot_time)
	self.data.unit_owner = unit_owner
	local template = AiWeaponUnitTemplates.get_template(self.weapon_template)

	template.shoot_start(self.world, self.unit, self.data, shoot_time)
end

AiWeaponUnitExtension.shoot = function (self, unit_owner)
	self.data.unit_owner = unit_owner
	local template = AiWeaponUnitTemplates.get_template(self.weapon_template)

	template.shoot(self.world, self.unit, self.data)
end

AiWeaponUnitExtension.shoot_end = function (self, unit_owner)
	self.data.unit_owner = unit_owner
	local template = AiWeaponUnitTemplates.get_template(self.weapon_template)

	template.shoot_end(self.world, self.unit, self.data)
end

AiWeaponUnitExtension.windup_start = function (self, unit_owner, windup_time)
	self.data.unit_owner = unit_owner
	local template = AiWeaponUnitTemplates.get_template(self.weapon_template)

	template.windup_start(self.world, self.unit, self.data, windup_time)
end

AiWeaponUnitExtension.windup_end = function (self, unit_owner)
	self.data.unit_owner = unit_owner
	local template = AiWeaponUnitTemplates.get_template(self.weapon_template)

	template.windup_end(self.world, self.unit, self.data)
end

return
