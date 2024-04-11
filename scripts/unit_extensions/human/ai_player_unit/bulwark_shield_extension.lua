-- chunkname: @scripts/unit_extensions/human/ai_player_unit/bulwark_shield_extension.lua

require("scripts/unit_extensions/human/ai_player_unit/ai_shield_user_extension")

BulwarkShieldExtension = class(BulwarkShieldExtension, AIShieldUserExtension)

BulwarkShieldExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.super.init(self, extension_init_context, unit, extension_init_data)
end

BulwarkShieldExtension.destroy = function (self)
	return
end

BulwarkShieldExtension.extensions_ready = function (self, world, unit)
	self.super.extensions_ready(self, world, unit)

	local inventory_extension = ScriptUnit.extension(unit, "ai_inventory_system")

	self._wwise_world = Managers.world:wwise_world(world)
	self._world = world
	self._shield_unit = inventory_extension.inventory_item_shield_unit
	self._audio_system = Managers.state.entity:system("audio_system")
	self._unit = unit
end

BulwarkShieldExtension.set_is_blocking = function (self, is_blocking)
	if is_blocking and self._blackboard.reset_after_stagger then
		return
	end

	self.super.set_is_blocking(self, is_blocking)
end

BulwarkShieldExtension.set_is_dodging = function (self, is_dodging)
	self.super.set_is_dodging(self, is_dodging)
end

BulwarkShieldExtension.break_shield = function (self)
	return
end

BulwarkShieldExtension.can_block_attack = function (self, attacker_unit, trueflight_blocking, hit_direction)
	return self.super.can_block_attack(self, attacker_unit, trueflight_blocking, hit_direction)
end

BulwarkShieldExtension.play_shield_hit_sfx = function (self, shield_broken, stagger_amount, break_threshold)
	if not self.is_blocking then
		return
	end

	stagger_amount = stagger_amount == 0 and 0.1 or stagger_amount

	local parameter_value = math.clamp(stagger_amount / break_threshold, 0, 1)
	local event = shield_broken and "Play_enemy_chaos_bulwark_stagger_break" or "Play_enemy_chaos_bulwark_stagger"
	local parameter_name = "bulwark_stagger_amount"

	self._audio_system:play_audio_unit_param_float_event(event, parameter_name, parameter_value, self._unit)
end
