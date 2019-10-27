CareerExtension = class(CareerExtension)

CareerExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self.world = extension_init_context.world
	self.is_server = Managers.player.is_server
	self.player = extension_init_data.player
	self.input_manager = Managers.input
	local profile_index = extension_init_data.profile_index
	local career_index = extension_init_data.career_index
	local profile = SPProfiles[profile_index]
	local career_data = profile.careers[career_index]
	self._profile_index = profile_index
	self._career_index = career_index
	self._career_name = career_data.name
	self._profile_name = profile.display_name
	self._career_data = career_data
	local num_abilities = #career_data.activated_ability
	self._num_abilities = num_abilities
	self._abilities = {}

	for ability_id = 1, num_abilities, 1 do
		local ability_data = career_data.activated_ability[ability_id]
		local ability_class = ability_data.ability_class
		local cooldown = (ability_data.spawn_cooldown_percent or 1) * ability_data.cooldown
		local cooldown_percent_int = extension_init_data.ability_cooldown_percent_int or 100

		if cooldown_percent_int < 100 then
			local cooldown_percent = cooldown_percent_int * 0.01
			cooldown = cooldown_percent * ability_data.cooldown
		end

		self._abilities[ability_id] = {
			cooldown_paused = false,
			cooldown_anim_started = false,
			is_ready = false,
			name = ability_data.name,
			cooldown = cooldown,
			initial_max_cooldown = ability_data.cooldown,
			max_cooldown = ability_data.cooldown,
			spawn_cooldown = cooldown,
			activated_ability = ability_class and ability_class:new(extension_init_context, unit, extension_init_data, ability_data),
			weapon_name = ability_data.weapon_name,
			uses_conditionals = ability_data.uses_conditionals,
			cooldown_anim_time = ability_data.cooldown_anim_time
		}
	end

	local breed = career_data.breed or profile.breed

	Unit.set_data(unit, "breed", breed)
	fassert(breed.hit_zones, "Player Breed '%s' is missing a 'hit_zones' table.", profile.display_name)
	DamageUtils.create_hit_zone_lookup(unit, breed)
end

CareerExtension.ability_id = function (self, ability_name)
	for ability_id, ability in ipairs(self._abilities) do
		if ability.name == ability_name then
			return ability_id
		end
	end

	return nil
end

CareerExtension.ability_was_triggered = function (self, ability_id)
	local ability = self._abilities[ability_id].activated_ability

	return ability:was_triggered()
end

CareerExtension.extensions_ready = function (self, world, unit)
	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	local passive_ability_data = self._career_data.passive_ability
	local buffs = passive_ability_data.buffs
	local player = self.player

	if buffs and (self.is_server or player.local_player) then
		for i = 1, #buffs, 1 do
			local buff = buffs[i]

			buff_extension:add_buff(buff)
		end
	end

	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")
	local abilities = self._abilities

	for i = 1, self._num_abilities, 1 do
		local ability = abilities[i]
		local activated_ability = ability.activated_ability

		if activated_ability then
			activated_ability:extensions_ready(world, unit)
		end
	end

	Managers.state.event:register(self, "ingame_menu_opened", "stop_ability")
end

CareerExtension.update = function (self, unit, input, dt, context, t)
	local abilities = self._abilities
	local was_ready = abilities[1].is_ready

	for i = 1, self._num_abilities, 1 do
		local ability = abilities[i]

		if not ability.cooldown_paused then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local cooldown_speed_multiplier = buff_extension:apply_buffs_to_value(1, "cooldown_regen")
			ability.cooldown = math.max(ability.cooldown - dt * cooldown_speed_multiplier, 0)

			self:check_cooldown_anim(i)

			local uses_conditionals = ability.uses_conditionals

			if ability.is_ready or uses_conditionals then
				local player = self.player

				if ability.activated_ability and ((self.is_server and player.bot_player) or player.local_player) then
					ability.activated_ability:update(unit, input, dt, context, t)
				end

				if uses_conditionals then
					ability.is_ready = ability.activated_ability:conditions_met()
				end
			elseif ability.cooldown == 0 and not uses_conditionals then
				ability.is_ready = true

				self:run_ability_ready_feedback(i)
			end
		end
	end

	local is_ready = abilities[1].is_ready

	if not was_ready or not is_ready then
		self:_update_game_object_field(unit)
	end
end

CareerExtension.stop_ability = function (self, reason, ability_id)
	local is_server = self.is_server
	local player = self.player

	if (is_server and player.bot_player) or player.local_player then
		ability_id = ability_id or 1
		local ability = self._abilities[ability_id]
		local activated_ability = ability.activated_ability

		if activated_ability then
			activated_ability:stop(reason)
		end
	end
end

CareerExtension._update_game_object_field = function (self, unit)
	if (not self.is_server or not self.player.bot_player) and not self.player.local_player then
		return
	end

	local ability_cooldown, max_cooldown = self:current_ability_cooldown(1)
	local ability_percentage = 1

	if ability_cooldown then
		ability_percentage = ability_cooldown / max_cooldown
	end

	local network_manager = Managers.state.network
	local game = network_manager:game()
	local go_id = Managers.state.unit_storage:go_id(unit)
	ability_percentage = math.clamp(ability_percentage, 0, 1)

	GameSession.set_game_object_field(game, go_id, "ability_percentage", ability_percentage)
end

CareerExtension.destroy = function (self)
	return
end

CareerExtension.get_activated_ability_data = function (self, ability_id)
	ability_id = ability_id or 1
	local career_data = self._career_data
	local activated_ability_data = career_data.activated_ability[ability_id]

	return activated_ability_data
end

CareerExtension.start_activated_ability_cooldown = function (self, ability_id, refund_percent)
	ability_id = ability_id or 1
	local ability = self._abilities[ability_id]
	local cooldown = ability.max_cooldown * (1 - (refund_percent or 0))
	local buff_extension = ScriptUnit.extension(self._unit, "buff_system")
	ability.cooldown = buff_extension:apply_buffs_to_value(cooldown, "activated_cooldown")
	ability.cooldown_anim_started = false
	ability.cooldown_paused = false
	ability.is_ready = false
end

CareerExtension.reduce_activated_ability_cooldown_percent = function (self, amount, ability_id, ignore_paused)
	ability_id = ability_id or 1
	local ability = self._abilities[ability_id]

	if ability.cooldown_paused and not ignore_paused then
		return
	end

	local max_cooldown = ability.max_cooldown
	local reduction = max_cooldown * amount
	ability.cooldown = ability.cooldown - reduction

	if ignore_paused and ability.cooldown <= 0 then
		self:set_activated_ability_cooldown_unpaused(ability_id)
	end
end

CareerExtension.reduce_activated_ability_cooldown = function (self, amount, ability_id, ignore_paused)
	ability_id = ability_id or 1
	local ability = self._abilities[ability_id]

	if ability.cooldown_paused and not ignore_paused then
		return
	end

	ability.cooldown = ability.cooldown - amount

	if ignore_paused and ability.cooldown <= 0 then
		self:set_activated_ability_cooldown_unpaused(ability_id)
	end
end

CareerExtension.uses_cooldown = function (self, ability_id)
	ability_id = ability_id or 1
	local ability = self._abilities[ability_id]

	return not ability.uses_conditionals
end

CareerExtension.set_activated_ability_cooldown_paused = function (self, ability_id)
	ability_id = ability_id or 1
	local ability = self._abilities[ability_id]
	ability.cooldown_paused = true
end

CareerExtension.set_activated_ability_cooldown_unpaused = function (self, ability_id)
	ability_id = ability_id or 1
	local ability = self._abilities[ability_id]
	ability.cooldown_paused = false
end

CareerExtension.reset_cooldown = function (self, ability_id)
	ability_id = ability_id or 1
	local ability = self._abilities[ability_id]
	ability.cooldown = ability.max_cooldown
end

CareerExtension.can_use_activated_ability = function (self, ability_id)
	ability_id = ability_id or 1
	local ability = self._abilities[ability_id]

	return ability.is_ready and not ability.cooldown_paused
end

CareerExtension.current_ability_cooldown = function (self, ability_id)
	ability_id = ability_id or 1
	local ability = self._abilities[ability_id]

	return ability.cooldown, ability.max_cooldown
end

CareerExtension.current_ability_cooldown_percentage = function (self, ability_id)
	local network_manager = Managers.state.network
	local game = network_manager:game()
	local go_id = Managers.state.unit_storage:go_id(self._unit)

	return GameSession.game_object_field(game, go_id, "ability_percentage")
end

CareerExtension.get_max_ability_cooldown = function (self, ability_id)
	ability_id = ability_id or 1
	local ability = self._abilities[ability_id]

	return ability.max_cooldown
end

CareerExtension.current_ability_paused = function (self, ability_id)
	ability_id = ability_id or 1
	local ability = self._abilities[ability_id]

	return ability.cooldown_paused
end

CareerExtension.career_index = function (self)
	return self._career_index
end

CareerExtension.career_name = function (self)
	return self._career_name
end

CareerExtension.career_settings = function (self)
	return self._career_data
end

CareerExtension.career_skill_weapon_name = function (self, ability_id)
	ability_id = ability_id or 1
	local ability = self._abilities[ability_id]
	local weapon_name = ability.weapon_name

	return weapon_name
end

CareerExtension.get_base_critical_strike_chance = function (self)
	return self._career_data.attributes.base_critical_strike_chance or 0
end

CareerExtension.has_melee_boost = function (self)
	local buff_extension = self._buff_extension
	local has_shade_buff = buff_extension:has_buff_type("kerillian_shade_activated_ability") or buff_extension:has_buff_type("kerillian_shade_activated_ability_duration")
	local has_murder_hobo_buff = false
	local multiplier = (has_shade_buff and 4) or (has_murder_hobo_buff and 1) or 0

	return has_shade_buff or has_murder_hobo_buff, multiplier
end

CareerExtension.has_ranged_boost = function (self)
	local buff_extension = self._buff_extension
	local has_murder_hobo_buff = buff_extension:has_buff_type("markus_huntsman_activated_ability") or buff_extension:has_buff_type("markus_huntsman_activated_ability_duration")
	local has_ranger_buff = buff_extension:has_buff_type("bardin_ranger_activated_ability") or buff_extension:has_buff_type("bardin_ranger_activated_ability_duration") or buff_extension:has_buff_type("bardin_ranger_activated_ability_stealth_outside_of_smoke")
	local multiplier = (has_murder_hobo_buff and 1.5) or (has_ranger_buff and 1) or 0

	return has_murder_hobo_buff or has_ranger_buff, multiplier
end

CareerExtension.get_career_power_level = function (self)
	local player = self.player
	local career_name = self._career_name
	local profile_name = self._profile_name

	if player.bot_player then
		local player_manager = Managers.player
		local leader_player = player_manager:party_leader_player()

		if leader_player then
			if DEDICATED_SERVER then
				local power_level = leader_player:get_data("power_level")

				if power_level then
					return power_level
				end
			else
				local leader_profile_display_name = leader_player:profile_display_name()
				local leader_career_name = leader_player:career_name()
				profile_name = leader_profile_display_name or profile_name
				career_name = leader_career_name or career_name
			end
		end
	end

	local buff_extension = self._buff_extension
	local power_level = BackendUtils.get_total_power_level(profile_name, career_name)

	if buff_extension then
		power_level = buff_extension:apply_buffs_to_value(power_level, "flat_power_level")
	end

	local clamped_power_level = math.clamp(power_level, MIN_POWER_LEVEL, MAX_POWER_LEVEL)

	return clamped_power_level
end

CareerExtension.set_state = function (self, state)
	self._state = state
end

CareerExtension.get_state = function (self)
	return self._state or "default"
end

CareerExtension.ability_amount = function (self)
	return self._num_abilities
end

CareerExtension.run_ability_ready_feedback = function (self, ability_id)
	local ability = self._abilities[ability_id]

	if ability.activated_ability and ability.activated_ability.ability_ready then
		ability.activated_ability:ability_ready()
	else
		local first_person_extension = self._first_person_extension

		if first_person_extension then
			first_person_extension:play_hud_sound_event("Play_hud_ability_ready")
		end
	end
end

CareerExtension.check_cooldown_anim = function (self, ability_id)
	local ability = self._abilities[ability_id]

	if not ability.cooldown_anim_started and ability.cooldown_anim_time and ability.cooldown - ability.cooldown_anim_time < 0 then
		ability.cooldown_anim_started = true

		ability.activated_ability:start_cooldown_anim()
	end
end

return
