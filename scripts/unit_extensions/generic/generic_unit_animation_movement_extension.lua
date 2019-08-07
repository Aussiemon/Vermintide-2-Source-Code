require("scripts/unit_extensions/generic/animation_movement_templates")

GenericUnitAnimationMovementExtension = class(GenericUnitAnimationMovementExtension)

GenericUnitAnimationMovementExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	local init_data_template_name = extension_init_data.template
	self.template = AnimationMovementTemplates[init_data_template_name]
	self.network_type = (extension_init_data.is_husk and "husk") or "owner"
	self.data = {}
	self.enabled = false
end

GenericUnitAnimationMovementExtension.extensions_ready = function (self)
	local template = self.template

	template[self.network_type].init(self.unit, self.data)

	local breed = Unit.get_data(self.unit, "breed")
end

GenericUnitAnimationMovementExtension.destroy = function (self)
	local template = self.template

	template[self.network_type].leave(self.unit, self.data)

	self.template = nil
	self.data = nil
end

GenericUnitAnimationMovementExtension.reset = function (self)
	return
end

GenericUnitAnimationMovementExtension.set_enabled = function (self, enable)
	self.enabled = enable

	if not enable then
		self.leave = true
	end
end

GenericUnitAnimationMovementExtension.update = function (self, unit, input, dt, context, t)
	local data = self.data
	local template = self.template
	local enabled = self.enabled

	if enabled then
		template[self.network_type].update(unit, t, dt, data)
	elseif self.leave then
		template[self.network_type].leave(unit, data)

		self.leave = false
	end
end

return
