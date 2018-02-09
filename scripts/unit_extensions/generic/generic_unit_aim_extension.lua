require("scripts/unit_extensions/generic/aim_templates")

GenericUnitAimExtension = class(GenericUnitAimExtension)
GenericUnitAimExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self.template = AimTemplates[extension_init_data.template or Unit.get_data(unit, "aim_template")]
	self.network_type = (extension_init_data.is_husk and "husk") or "owner"
	self.data = {}
	self.enabled = false

	return 
end
GenericUnitAimExtension.extensions_ready = function (self)
	local template = self.template

	template[self.network_type].init(self.unit, self.data)

	local breed = Unit.get_data(self.unit, "breed")
	self.always_aim = (breed and breed.always_look_at_target) or self.template == "innkeeper"

	return 
end
GenericUnitAimExtension.destroy = function (self)
	local template = self.template

	template[self.network_type].leave(self.unit, self.data)

	self.template = nil
	self.data = nil

	return 
end
GenericUnitAimExtension.reset = function (self)
	return 
end
GenericUnitAimExtension.set_enabled = function (self, enable)
	self.enabled = enable

	return 
end
GenericUnitAimExtension.update = function (self, unit, input, dt, context, t)
	local data = self.data
	local template = self.template
	local is_player = DamageUtils.is_player_unit(unit)
	local should_aim = self.enabled or self.always_aim or is_player

	if should_aim then
		template[self.network_type].update(unit, t, dt, data)
	else
		template[self.network_type].leave(unit, data)
	end

	return 
end

return 
