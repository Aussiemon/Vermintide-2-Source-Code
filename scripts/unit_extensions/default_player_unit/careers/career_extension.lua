CareerExtension = class(CareerExtension)

CareerExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self.world = extension_init_context.world
	self.is_server = Managers.player.is_server
	self.player = extension_init_data.player
	self._is_ready = false
	self.input_manager = Managers.input
	local profile_index = extension_init_data.profile_index
	local career_index = extension_init_data.career_index
	local profile = SPProfiles[profile_index]
	local career_data = profile.careers[career_index]
	self._profile_index = profile_index
	self._career_index = career_index
	self._career_name = career_data.name
	self._profile_name = profile.display_name
	self._cooldown = 0
	self._career_data = career_data
	local initial_ability_percentage = extension_init_data.initial_ability_percentage or 0
	local max_cooldown = career_data.activated_ability.cooldown
	local initial_cooldown_percentage = 1 - initial_ability_percentage
	initial_cooldown_percentage = math.clamp(initial_cooldown_percentage, 0, 1)
	self._initial_cooldown = max_cooldown * initial_cooldown_percentage

	if career_data.activated_ability.ability_class then
		self._activated_ability = career_data.activated_ability.ability_class:new(extension_init_context, unit, extension_init_data)
	end
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

	self:start_activated_ability_cooldown()

	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")

	if self._activated_ability then
		self._activated_ability:extensions_ready(world, unit)
	end

	Managers.state.event:register(self, "ingame_menu_opened", "stop_ability")
end

CareerExtension.update = function (self, unit, input, dt, context, t)
	if self._cooldown_paused then
		return
	end

	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	local cooldown_speed_multiplier = buff_extension:apply_buffs_to_value(1, "cooldown_regen")
	self._cooldown = math.max(self._cooldown - dt * cooldown_speed_multiplier, 0)

	if self._is_ready then
		local player = self.player

		if self._activated_ability and ((self.is_server and player.bot_player) or player.local_player) then
			self._activated_ability:update(unit, input, dt, context, t)
		end

		return
	elseif self._cooldown == 0 then
		self._is_ready = true
		local first_person_extension = self._first_person_extension

		if first_person_extension then
			first_person_extension:play_hud_sound_event("Play_hud_ability_ready")
		end
	end

	self:_update_game_object_field(unit)
end

CareerExtension.stop_ability = function (self, reason)
	local activated_ability = self._activated_ability
	local is_server = self.is_server
	local player = self.player

	if activated_ability and ((is_server and player.bot_player) or player.local_player) then
		activated_ability:stop(reason)
	end
end

CareerExtension._update_game_object_field = function (self, unit)
	if (not self.is_server or not self.player.bot_player) and not self.player.local_player then
		return
	end

	local ability_cooldown, max_cooldown = self:current_ability_cooldown()
	local ability_percentage = 1

	if ability_cooldown then
		ability_percentage = ability_cooldown / max_cooldown
	end

	local network_manager = Managers.state.network
	local game = network_manager:game()
	local go_id = Managers.state.unit_storage:go_id(unit)
	ability_percentage = math.min(1, ability_percentage)

	GameSession.set_game_object_field(game, go_id, "ability_percentage", ability_percentage)
end

CareerExtension.destroy = function (self)
	return
end

CareerExtension.get_activated_ability_data = function (self)
	local career_data = self._career_data
	local activated_ability_data = career_data.activated_ability

	return activated_ability_data
end

CareerExtension.start_activated_ability_cooldown = function (self, refund_percent)
	self._is_ready = false
	local activated_ability_data = self:get_activated_ability_data()
	local cooldown = activated_ability_data.cooldown * (1 - (refund_percent or 0))

	if self._initial_cooldown then
		cooldown = (Development.parameter("short_ability_cooldowns") and cooldown) or self._initial_cooldown
		self._initial_cooldown = nil
	end

	local buff_extension = ScriptUnit.extension(self._unit, "buff_system")
	local cooldown = buff_extension:apply_buffs_to_value(cooldown, "activated_cooldown")
	self._cooldown = cooldown
	self._max_cooldown = activated_ability_data.cooldown
	self._cooldown_paused = false

	if Development.parameter("short_ability_cooldowns") then
		self._cooldown = 5
	end
end

CareerExtension.reduce_activated_ability_cooldown_percent = function (self, amount)
	if self._cooldown_paused then
		return
	end

	local max_cooldown = self._max_cooldown
	local reduction = max_cooldown * amount
	self._cooldown = self._cooldown - reduction
end

CareerExtension.reduce_activated_ability_cooldown = function (self, amount)
	if self._cooldown_paused then
		return
	end

	self._cooldown = self._cooldown - amount
end

CareerExtension.set_activated_ability_cooldown_paused = function (self)
	self._cooldown_paused = true
end

CareerExtension.can_use_activated_ability = function (self)
	return self._is_ready and not self._cooldown_paused
end

CareerExtension.current_ability_cooldown = function (self)
	return self._cooldown, self._max_cooldown
end

CareerExtension.get_max_ability_cooldown = function (self)
	return self._max_cooldown
end

CareerExtension.current_ability_paused = function (self)
	return self._cooldown_paused
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

CareerExtension.career_skill_weapon_name = function (self)
	return self:get_activated_ability_data().weapon_name
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
	local has_murder_hobo_buff = buff_extension:has_buff_type("markus_huntsman_activated_ability")
	local has_ranger_buff = buff_extension:has_buff_type("bardin_ranger_activated_ability") or buff_extension:has_buff_type("bardin_ranger_activated_ability_duration")
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

	return BackendUtils.get_total_power_level(profile_name, career_name)
end

CareerExtension.set_state = function (self, state)
	self._state = state
end

CareerExtension.get_state = function (self)
	return self._state or "default"
end

return
