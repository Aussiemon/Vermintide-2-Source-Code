-- chunkname: @scripts/unit_extensions/default_player_unit/careers/career_ability_poison_wind_globadier_throw.lua

CareerAbilityPoisonWindGlobadierThrow = class(CareerAbilityPoisonWindGlobadierThrow, CareerAbilityDarkPactBase)

CareerAbilityPoisonWindGlobadierThrow.extensions_ready = function (self, world, unit)
	CareerAbilityPoisonWindGlobadierThrow.super.extensions_ready(self, world, unit)

	local ability_init_data = self._ability_data

	self._career_extension:setup_extra_ability_uses(0, ability_init_data.cooldown, 0, ability_init_data.max_stacks)
	self._career_extension:modify_extra_ability_uses(ability_init_data.starting_stack_count)
end

CareerAbilityPoisonWindGlobadierThrow.ability_ready = function (self)
	self.super.ability_ready(self)

	local status_extension = self._status_extension

	if not status_extension:get_in_ghost_mode() then
		local unit = self._unit
		local inventory_extension = ScriptUnit.extension(unit, "inventory_system")

		Unit.flow_event(unit, "reload_finished")
		CharacterStateHelper.show_inventory_3p(unit, true, false, self._is_server, inventory_extension)
	end
end

CareerAbilityPoisonWindGlobadierThrow.update = function (self, unit, input, dt, context, t)
	CareerAbilityPoisonWindGlobadierThrow.super.update(self, unit, input, dt, context, t)
	self._career_extension:modify_extra_ability_charge(dt)
end

CareerAbilityPoisonWindGlobadierThrow.start_cooldown_anim = function (self)
	local first_person_extension = self._first_person_extension
	local unit = self._unit

	if first_person_extension then
		CharacterStateHelper.play_animation_event(unit, "reload_start")
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, "reload_start")
		Unit.flow_event(unit, "reload_start")
		first_person_extension:animation_set_variable("armed", 1)
		first_person_extension:unhide_weapons("catapulted")
	end
end
