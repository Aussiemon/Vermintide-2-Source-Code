require("scripts/settings/attack_intensity_settings")

PlayerUnitAttackIntensityExtension = class(PlayerUnitAttackIntensityExtension)
local DEFAULT_ATTACK_INTENSITY_CLAMP = 25

PlayerUnitAttackIntensityExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._network_manager = Managers.state.network
	self._world = extension_init_context.world
	self._unit = unit
	self._attack_intensity = {}
	self._attack_allowed = {}
	self._attack_intensity_threshold = {}
	self._attack_intensity_decay = {}
	self._attack_intensity_decay_grace = {}
	self._attack_intensity_reset = {}
	local difficulty_manager = Managers.state.difficulty
	local difficulty_settings = difficulty_manager:get_difficulty_settings()
	local difficulty_lookup = AttackIntensitySettings.difficulty
	self._attack_intensity_difficulty = Managers.state.difficulty:get_difficulty_value_from_table(difficulty_lookup)

	self:_setup_intensity()
end

PlayerUnitAttackIntensityExtension._setup_intensity = function (self)
	for type, _ in pairs(AttackIntensitySettings.attack_type_intesities) do
		local intensity_settings = self._attack_intensity_difficulty[type]
		self._attack_intensity[type] = 0
		self._attack_allowed[type] = true
		self._attack_intensity_threshold[type] = intensity_settings.threshold
		self._attack_intensity_decay[type] = intensity_settings.decay
		self._attack_intensity_decay_grace[type] = 0
		self._attack_intensity_reset[type] = intensity_settings.reset
	end
end

PlayerUnitAttackIntensityExtension.extensions_ready = function (self, world, unit)
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")
end

PlayerUnitAttackIntensityExtension.update = function (self, unit, input, dt, context, t)
	if RELOAD then
		self:_setup_intensity()

		RELOAD = false
	end

	for type, _ in pairs(AttackIntensitySettings.attack_type_intesities) do
		local decay_grace = self._attack_intensity_decay_grace[type]

		if decay_grace > 0 then
			decay_grace = math.max(decay_grace - dt, 0)
			self._attack_intensity_decay_grace[type] = decay_grace
		else
			local intensity = self._attack_intensity[type]

			if intensity > 0 then
				local decay = (self._attack_allowed[type] and self._attack_intensity_decay[type] * 0.25) or self._attack_intensity_decay[type]
				local threshold = self._attack_intensity_threshold[type]
				local reset = self._attack_intensity_reset[type]
				local buff_extension = self._buff_extension
				decay = buff_extension:apply_buffs_to_value(decay, "attack_intensity_decay")
				threshold = buff_extension:apply_buffs_to_value(threshold, "attack_intensity_threshold")
				reset = buff_extension:apply_buffs_to_value(reset, "attack_intensity_reset")
				intensity = math.max(intensity - dt * decay * threshold, 0)

				if threshold < intensity then
					self._attack_allowed[type] = false
				end

				if intensity <= reset then
					self._attack_allowed[type] = true
				end

				self._attack_intensity[type] = intensity
			end
		end
	end
end

PlayerUnitAttackIntensityExtension.add_attack_intensity = function (self, attack_intensity_type, added_attack_intensity, clamp_override)
	fassert(AttackIntensitySettings.attack_type_intesities[attack_intensity_type], "No attack intesity settings defined for attack type \"%s\"", attack_intensity_type)

	self._attack_intensity_decay_grace[attack_intensity_type] = self._attack_intensity_difficulty[attack_intensity_type].decay_grace
	self._attack_intensity[attack_intensity_type] = math.clamp(self._attack_intensity[attack_intensity_type] + added_attack_intensity, 0, clamp_override or DEFAULT_ATTACK_INTENSITY_CLAMP)

	if self._attack_intensity_threshold[attack_intensity_type] < self._attack_intensity[attack_intensity_type] then
		self._attack_allowed[attack_intensity_type] = false
	elseif not self._attack_allowed[attack_intensity_type] and self._attack_intensity[attack_intensity_type] < self._attack_intensity_reset[attack_intensity_type] then
		self._attack_allowed[attack_intensity_type] = true
	end
end

PlayerUnitAttackIntensityExtension.want_an_attack = function (self, attack_intensity_type)
	fassert(AttackIntensitySettings.attack_type_intesities[attack_intensity_type], "No attack intesity settings defined for attack type \"%s\"", attack_intensity_type)

	return self._attack_allowed[attack_intensity_type]
end

return
