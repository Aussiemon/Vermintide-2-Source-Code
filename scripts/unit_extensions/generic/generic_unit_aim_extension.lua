-- chunkname: @scripts/unit_extensions/generic/generic_unit_aim_extension.lua

require("scripts/unit_extensions/generic/aim_templates")

GenericUnitAimExtension = class(GenericUnitAimExtension)

GenericUnitAimExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self.template = AimTemplates[extension_init_data.template or Unit.get_data(unit, "aim_template")]
	self.network_type = extension_init_data.is_husk and "husk" or "owner"
	self.data = {}
	self.enabled = false
end

GenericUnitAimExtension.extensions_ready = function (self)
	local template = self.template

	template[self.network_type].init(self.unit, self.data)

	local breed = Unit.get_data(self.unit, "breed")

	self.always_aim = DEDICATED_SERVER or breed and breed.always_look_at_target or self.template == "innkeeper"
end

GenericUnitAimExtension.destroy = function (self)
	local template = self.template

	template[self.network_type].leave(self.unit, self.data)

	self.template = nil
	self.data = nil
end

GenericUnitAimExtension.reset = function (self)
	return
end

GenericUnitAimExtension.set_enabled = function (self, enable)
	self.enabled = enable
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
end
