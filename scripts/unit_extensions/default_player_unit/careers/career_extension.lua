﻿-- chunkname: @scripts/unit_extensions/default_player_unit/careers/career_extension.lua

require("scripts/unit_extensions/default_player_unit/careers/career_utils")

CareerExtension = class(CareerExtension)

local ABILITY_READY_ANTI_SPAM_DELAY = 1

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

	if not DEDICATED_SERVER and self._profile_name == "bright_wizard" then
		GlobalShaderFlags.set_global_shader_flag("NECROMANCER_CAREER_REMAP", self._career_name == "bw_necromancer")
	end

	self._career_data = career_data
	self._breed = career_data.breed or profile.breed

	local num_abilities = CareerUtils.num_abilities(profile_index, career_index)

	self._num_abilities = num_abilities
	self._abilities = {}
	self._abilities_always_usable_reasons = {}
	self._last_ability_ready_t = 0

	for ability_id = 1, num_abilities do
		local ability_data = CareerUtils.get_ability_data(profile_index, career_index, ability_id)
		local ability_class = ability_data.ability_class
		local cooldown = (ability_data.spawn_cooldown_percent or 0) * ability_data.cooldown
		local cooldown_percent_int = extension_init_data.ability_cooldown_percent_int or 100

		if cooldown_percent_int < 100 then
			local cooldown_percent = cooldown_percent_int * 0.01

			cooldown = cooldown_percent * ability_data.cooldown
		end

		self._abilities[ability_id] = {
			cooldown_anim_started = false,
			is_ready = false,
			name = ability_data.name,
			cooldowns = {
				cooldown,
			},
			initial_max_cooldown = ability_data.cooldown,
			max_cooldown = ability_data.cooldown,
			activated_ability = ability_class and ability_class:new(extension_init_context, unit, extension_init_data, ability_data),
			weapon_name = ability_data.weapon_name,
			weapon_names_by_index = ability_data.weapon_names_by_index,
			cooldown_paused = ability_data.start_paused or false,
			cooldown_anim_time = ability_data.cooldown_anim_time,
			cost = ability_data.cost or 1,
			draw_ui_in_ghost_mode = ability_data.draw_ui_in_ghost_mode or false,
		}
	end

	local passive_ability = CareerUtils.get_passive_ability_by_career(career_data)
	local passive_ability_classes = passive_ability.passive_ability_classes
	local num_passive_abilities = passive_ability_classes and #passive_ability_classes or 0

	self._passive_abilities = {}
	self._passive_abilities_update = {}
	self._passive_abilities_by_name = {}
	self._num_passive_abilities = num_passive_abilities

	for i = 1, num_passive_abilities do
		local ability_data = passive_ability_classes[i]
		local ability_class = ability_data.ability_class
		local passive_ability = ability_class:new(extension_init_context, unit, extension_init_data, ability_data.init_data)

		self._passive_abilities[i] = passive_ability

		if passive_ability and passive_ability.update then
			self._passive_abilities_update[i] = passive_ability
		end

		self._passive_abilities_by_name[ability_data.name] = passive_ability
	end

	self._num_passive_abilities_update = #self._passive_abilities_update
	self._ability_always_usable = nil

	self:setup_extra_ability_uses(0, 0, 0, 0)
	Unit.set_data(unit, "breed", self._breed)
	fassert(self._breed.hit_zones, "Player Breed '%s' is missing a 'hit_zones' table.", profile.display_name)
	DamageUtils.create_hit_zone_lookup(unit, self._breed)
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

CareerExtension.ability_by_id = function (self, ability_id)
	local ability = self._abilities[ability_id].activated_ability

	return ability
end

CareerExtension.ability_name_by_id = function (self, ability_id)
	local ability = self._abilities[ability_id]

	return ability.name
end

CareerExtension.ability_by_name = function (self, ability_name)
	for i = 1, #self._abilities do
		local ability = self._abilities[i]

		if ability.name == ability_name then
			return ability, i
		end
	end
end

CareerExtension._is_husk = function (self)
	local player = self.player

	return not player.local_player and (not self.is_server or not player.bot_player)
end

CareerExtension.extensions_ready = function (self, world, unit)
	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	local passive_ability_data = CareerUtils.get_passive_ability_by_career(self._career_data)
	local buffs = passive_ability_data.buffs
	local player = self.player

	if buffs and (self.is_server or player.local_player) then
		for i = 1, #buffs do
			local buff = buffs[i]

			buff_extension:add_buff(buff)
		end
	end

	local husk_buffs = passive_ability_data.husk_buffs

	if husk_buffs and not self.is_server and not player.local_player then
		for i = 1, #husk_buffs do
			local buff = husk_buffs[i]

			buff_extension:add_buff(buff)
		end
	end

	local mechanism_buffs = Managers.mechanism:mechanism_setting_for_title("base_career_buffs")

	if mechanism_buffs then
		for i = 1, #mechanism_buffs do
			local buff = mechanism_buffs[i]

			buff_extension:add_buff(buff)
		end
	end

	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")

	local abilities = self._abilities

	for i = 1, self._num_abilities do
		local ability = abilities[i]
		local activated_ability = ability.activated_ability

		if activated_ability then
			activated_ability:extensions_ready(world, unit)
		end
	end

	local passive_abilities = self._passive_abilities

	for i = 1, self._num_passive_abilities do
		local ability = passive_abilities[i]

		ability:extensions_ready(world, unit)
	end

	Managers.state.event:register(self, "ingame_menu_opened", "stop_ability")
	Managers.state.event:register(self, "gm_event_round_started", "on_round_started")
end

CareerExtension.game_object_initialized = function (self, unit, go_id)
	local passive_abilities = self._passive_abilities

	for i = 1, self._num_passive_abilities do
		local ability = passive_abilities[i]

		if ability.game_object_initialized then
			ability:game_object_initialized(unit, go_id)
		end
	end
end

CareerExtension.force_trigger_active_ability = function (self)
	local player = self.player
	local abilities = self._abilities

	for i = 1, self._num_abilities do
		local ability = abilities[i]

		if ability.activated_ability and ability.activated_ability.force_trigger_ability and (self.is_server and player.bot_player or player.local_player) then
			ability.activated_ability:force_trigger_ability()

			break
		end
	end
end

CareerExtension.update = function (self, unit, input, dt, context, t)
	local abilities = self._abilities
	local was_ready = self:_cooldown_charge_ready(1)

	for i = 1, self._num_abilities do
		local ability = abilities[i]

		if not ability.cooldown_paused then
			local already_ready = self:_cooldown_charge_ready(i)
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local cooldown_speed_multiplier = buff_extension:apply_buffs_to_value(1, "cooldown_regen")

			self:reduce_activated_ability_cooldown(dt * cooldown_speed_multiplier, i)
			self:check_cooldown_anim(i)

			if already_ready or self._abilities_always_usable then
				local player = self.player

				if ability.activated_ability and (self.is_server and player.bot_player or player.local_player) then
					ability.activated_ability:update(unit, input, dt, context, t)
				end
			elseif self:_cooldown_charge_ready(i) then
				self:_run_ability_ready_feedback(i, t)
			end
		end
	end

	local passive_abilities_update = self._passive_abilities_update

	for i = 1, self._num_passive_abilities_update do
		local ability = passive_abilities_update[i]

		ability:update(dt, t)
	end

	local is_ready = self:_cooldown_charge_ready(1)

	if not was_ready or not is_ready then
		self:_update_game_object_field(unit)

		if is_ready and self._buff_extension then
			self._buff_extension:trigger_procs("on_ability_recharged")
		end
	end
end

CareerExtension.stop_ability = function (self, reason, ability_id)
	local is_server = self.is_server
	local player = self.player

	if is_server and player.bot_player or player.local_player then
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

	if game then
		local go_id = Managers.state.unit_storage:go_id(unit)

		ability_percentage = math.clamp(ability_percentage, 0, 1)

		GameSession.set_game_object_field(game, go_id, "ability_percentage", ability_percentage)
	end
end

CareerExtension.destroy = function (self)
	local passive_abilities = self._passive_abilities

	for i = 1, self._num_passive_abilities do
		local ability = passive_abilities[i]

		ability:destroy()
	end

	local abilities = self._abilities

	for i = 1, self._num_abilities do
		local ability = abilities[i].activated_ability

		if ability and ability.destroy then
			ability:destroy()
		end
	end
end

CareerExtension.get_activated_ability_data = function (self, ability_id)
	ability_id = ability_id or 1

	local career_data = self._career_data
	local activated_ability_data = career_data.activated_ability[ability_id]

	return activated_ability_data
end

CareerExtension.start_activated_ability_cooldown = function (self, ability_id, refund_percent, modified_cost, ignore_ability_readiness)
	ability_id = ability_id or 1

	local ability = self._abilities[ability_id]
	local refund = ability.max_cooldown * (ability.cost * (refund_percent or 0))
	local cost = ability.max_cooldown * ability.cost

	if modified_cost then
		cost = ability.max_cooldown * modified_cost
	end

	local unit = self._unit
	local buff_extension = ScriptUnit.extension(unit, "buff_system")

	if buff_extension:has_buff_perk("free_ability") then
		cost = 0
	end

	if self:_cooldown_charge_ready(ability_id) or self._abilities_always_usable or ignore_ability_readiness then
		local local_players = Managers.player:players_at_peer(Network.peer_id())

		if local_players and unit then
			for _, player in pairs(local_players) do
				local player_unit = player.player_unit

				if ALIVE[player_unit] then
					local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")

					if buff_extension then
						buff_extension:trigger_procs("on_ability_activated", unit, ability_id)

						local local_player = self.player
						local other_player = player

						Managers.state.achievement:trigger_event("any_ability_used", unit, ability_id, local_player, other_player)
					end

					local cosmetic_extension = ScriptUnit.has_extension(player_unit, "cosmetic_system")

					if cosmetic_extension then
						cosmetic_extension:trigger_ability_activated_events()
					end
				end
			end
		end
	end

	local network_manager = Managers.state.network
	local unit_id = network_manager:unit_game_object_id(unit)
	local game = network_manager:game()

	if game then
		if self.is_server then
			network_manager.network_transmit:send_rpc_clients("rpc_ability_activated", unit_id, ability_id)
		else
			network_manager.network_transmit:send_rpc_server("rpc_ability_activated", unit_id, ability_id)
		end
	end

	local game_mode = Managers.state.game_mode and Managers.state.game_mode:game_mode()

	if self.player.local_player and game_mode and game_mode.activated_ability_telemetry then
		local ability_data = self:get_activated_ability_data(ability_id)
		local ability_name = ability_data.name or ability_data.display_name

		game_mode:activated_ability_telemetry(ability_name, self.player)
	end

	local current_cooldown = self:current_ability_cooldown(ability_id)
	local min_cooldown = ability.max_cooldown * (1 - ability.cost)

	if current_cooldown <= min_cooldown or cost <= 0 then
		self:increase_activated_ability_cooldown(cost - refund, ability_id)

		local new_cooldown = self:current_ability_cooldown(ability_id)
		local buffed_cooldown = buff_extension:apply_buffs_to_value(new_cooldown, "activated_cooldown")

		if new_cooldown < buffed_cooldown then
			self:increase_activated_ability_cooldown(buffed_cooldown - new_cooldown, ability_id)
		elseif buffed_cooldown < new_cooldown then
			self:reduce_activated_ability_cooldown(new_cooldown - buffed_cooldown, ability_id)
		end
	elseif self._extra_ability_uses > 0 then
		self:modify_extra_ability_uses(-1)
		buff_extension:trigger_procs("on_extra_ability_consumed", unit)
		Managers.state.achievement:trigger_event("free_cast_used", unit, unit)
	end

	buff_extension:trigger_procs("on_ability_cooldown_started")

	ability.cooldown_paused = false
	ability.cooldown_anim_started = false
end

CareerExtension.reduce_activated_ability_cooldown_percent = function (self, amount, ability_id, ignore_paused)
	ability_id = ability_id or 1

	local ability = self._abilities[ability_id]

	self:reduce_activated_ability_cooldown(ability.max_cooldown * amount, ability_id, ignore_paused)
end

CareerExtension.reduce_activated_ability_cooldown = function (self, amount, ability_id, ignore_paused)
	ability_id = ability_id or 1

	local ability = self._abilities[ability_id]

	if ability.cooldown_paused and not ignore_paused then
		return
	end

	if amount < 0 then
		return self:increase_activated_ability_cooldown(-amount, ability_id, ignore_paused)
	end

	local charge_idx = self:_currently_decaying_cooldown(ability_id)
	local cooldowns = ability.cooldowns

	for i = charge_idx, 1, -1 do
		if amount < math.epsilon then
			break
		end

		local cooldown = cooldowns[i]
		local removed = math.min(cooldown, amount)

		cooldowns[i] = math.clamp(cooldown - removed, 0, ability.max_cooldown)
		amount = amount - removed
	end

	local is_ready = self:_cooldown_charge_ready(ability_id)

	if not is_ready then
		ability.cooldown_paused = false
	end

	if ignore_paused and is_ready then
		self:set_activated_ability_cooldown_unpaused(ability_id)
	end
end

CareerExtension.increase_activated_ability_cooldown = function (self, amount, ability_id, ignore_paused)
	ability_id = ability_id or 1

	local ability = self._abilities[ability_id]

	if ability.cooldown_paused and not ignore_paused then
		return
	end

	if amount < 0 then
		return self:reduce_activated_ability_cooldown(-amount, ability_id, ignore_paused)
	end

	local charge_idx = self:_currently_decaying_cooldown(ability_id)
	local cooldowns = ability.cooldowns

	for i = charge_idx, #cooldowns do
		if amount < math.epsilon then
			break
		end

		local cooldown = cooldowns[i]
		local added = math.min(ability.max_cooldown - cooldown, amount)

		cooldowns[i] = math.clamp(cooldown + added, 0, ability.max_cooldown)
		amount = amount - added
	end

	if not self:_cooldown_charge_ready(ability_id) then
		ability.cooldown_paused = false
	end
end

CareerExtension.modify_max_cooldown = function (self, ability_id, bonus, multiplier)
	ability_id = ability_id or 1
	bonus = bonus or 0
	multiplier = multiplier or 1

	local ability = self._abilities[ability_id]
	local current_max_cooldown = ability.max_cooldown

	ability.max_cooldown = ability.max_cooldown + ability.initial_max_cooldown * multiplier + bonus

	local cooldowns = ability.cooldowns

	for i = 1, #cooldowns do
		local cooldown = cooldowns[i]
		local cooldown_fraction = math.clamp(cooldown / current_max_cooldown, 0, 1)

		cooldowns[i] = cooldown_fraction * ability.max_cooldown
	end
end

CareerExtension.uses_cooldown = function (self, ability_id)
	ability_id = ability_id or 1

	local ability = self._abilities[ability_id]
	local max_cooldown = ability.max_cooldown

	return max_cooldown and max_cooldown > 0
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

CareerExtension.abilities_always_usable = function (self)
	return self._abilities_always_usable
end

CareerExtension.set_abilities_always_usable = function (self, value, reason)
	if value then
		self._abilities_always_usable_reasons[reason] = value
	else
		self._abilities_always_usable_reasons[reason] = nil
	end

	self._abilities_always_usable = next(self._abilities_always_usable_reasons) ~= nil
end

CareerExtension.has_abilities_always_usable_reason = function (self, reason)
	return self._abilities_always_usable_reasons[reason] ~= nil
end

CareerExtension.modify_extra_ability_uses = function (self, num)
	self._extra_ability_uses = math.max(self._extra_ability_uses + num, 0)

	self:set_abilities_always_usable(self._extra_ability_uses > 0, "extra_ability_uses")
end

CareerExtension.get_extra_ability_uses = function (self)
	return self._extra_ability_uses, self._extra_ability_uses_max
end

CareerExtension.get_extra_ability_charge = function (self)
	return self._extra_ability_use_charge, self._extra_ability_use_required_charge
end

CareerExtension.modify_extra_ability_charge = function (self, amount)
	local current_charge = self._extra_ability_use_charge

	if self._extra_ability_uses >= self._extra_ability_uses_max then
		current_charge = 0
	else
		current_charge = math.max(current_charge + amount, 0)

		if current_charge >= self._extra_ability_use_required_charge then
			current_charge = current_charge - self._extra_ability_use_required_charge

			self:modify_extra_ability_uses(1)
		end
	end

	self._extra_ability_use_charge = current_charge
end

CareerExtension.update_extra_ability_charge = function (self, required_charge)
	self._extra_ability_use_required_charge = required_charge
end

CareerExtension.setup_extra_ability_uses = function (self, current_charge, max_charge, current_extra_uses, max_extra_uses)
	self._extra_ability_use_charge = math.min(current_charge, max_charge)
	self._extra_ability_use_required_charge = max_charge
	self._extra_ability_uses = math.min(current_extra_uses, max_extra_uses)
	self._extra_ability_uses_max = max_extra_uses

	if self._extra_ability_uses == self._extra_ability_uses_max then
		self._extra_ability_use_charge = 0
	end
end

CareerExtension.update_extra_ability_uses_max = function (self, max_extra_uses)
	self._extra_ability_uses = math.min(self._extra_ability_uses, max_extra_uses)
	self._extra_ability_uses_max = max_extra_uses

	if self._extra_ability_uses == self._extra_ability_uses_max then
		self._extra_ability_use_charge = 0
	end
end

CareerExtension.reset_cooldown = function (self, ability_id)
	ability_id = ability_id or 1

	local ability = self._abilities[ability_id]
	local cooldowns = ability.cooldowns

	for i = 1, #cooldowns do
		cooldowns[i] = ability.max_cooldown
	end
end

CareerExtension.can_use_activated_ability = function (self, ability_id)
	local network_manager = Managers.state.network
	local game = network_manager:game()

	if not game then
		return false
	end

	ability_id = ability_id or 1

	local ability = self._abilities[ability_id]
	local ability_bar_fill = 1 - self:current_ability_cooldown_percentage(ability_id)

	return (self:_cooldown_charge_ready(ability_id) or ability_bar_fill >= ability.cost or self._abilities_always_usable) and not ability.cooldown_paused
end

CareerExtension._cooldown_charge_ready = function (self, ability_id)
	return self:current_ability_cooldown(ability_id) == 0
end

CareerExtension.current_ability_cooldown = function (self, ability_id)
	ability_id = ability_id or 1

	local ability = self._abilities[ability_id]
	local cooldowns = ability.cooldowns
	local num_cooldowns = #cooldowns
	local wanted_num_cooldowns = self._buff_extension:apply_buffs_to_value(1, "extra_ability_charges")

	for i = num_cooldowns + 1, wanted_num_cooldowns do
		self:_add_cooldown_charge(ability_id)

		num_cooldowns = num_cooldowns + 1
	end

	for i = wanted_num_cooldowns + 1, num_cooldowns do
		self:_remove_cooldown_charge(ability_id)

		num_cooldowns = num_cooldowns - 1
	end

	local cooldown = cooldowns[num_cooldowns]

	return cooldown, ability.max_cooldown > 0 and ability.max_cooldown or 1
end

CareerExtension._add_cooldown_charge = function (self, ability_id)
	ability_id = ability_id or 1

	local ability = self._abilities[ability_id]
	local cooldowns = ability.cooldowns

	table.insert(cooldowns, 0)
end

CareerExtension._remove_cooldown_charge = function (self, ability_id)
	ability_id = ability_id or 1

	local ability = self._abilities[ability_id]
	local cooldowns = ability.cooldowns

	table.remove(cooldowns, 1)
end

CareerExtension._currently_decaying_cooldown = function (self, ability_id)
	ability_id = ability_id or 1

	local ability = self._abilities[ability_id]
	local cooldowns = ability.cooldowns

	for i = #cooldowns, 1, -1 do
		local cooldown = cooldowns[i]

		if cooldown ~= 0 then
			return i
		end
	end

	local index = 1

	return index
end

CareerExtension.get_number_of_ability_cooldowns = function (self, ability_id)
	ability_id = ability_id or 1

	local ability = self._abilities[ability_id]
	local cooldowns = ability.cooldowns

	return #cooldowns or 1
end

CareerExtension.num_charges_ready = function (self, ability_id)
	ability_id = ability_id or 1

	local ability = self._abilities[ability_id]
	local cooldowns = ability.cooldowns
	local max_ready = #cooldowns
	local num_ready = 0

	for i = max_ready, 1, -1 do
		local cooldown = cooldowns[i]

		if cooldown > 0 then
			break
		end

		num_ready = num_ready + 1
	end

	return num_ready, max_ready
end

CareerExtension.current_ability_cooldown_percentage = function (self, ability_id)
	if self:_is_husk() then
		local network_manager = Managers.state.network
		local game = network_manager and network_manager:game()

		if not game then
			return 0
		end

		local go_id = Managers.state.unit_storage:go_id(self._unit)

		return GameSession.game_object_field(game, go_id, "ability_percentage")
	else
		ability_id = ability_id or 1

		local ability_cooldown, max_cooldown = self:current_ability_cooldown(ability_id)

		return ability_cooldown / max_cooldown
	end
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

CareerExtension.profile_index = function (self)
	return self._profile_index
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

CareerExtension.career_skill_weapon_name = function (self, ability_id, weapon_index)
	ability_id = ability_id or 1

	local ability = self._abilities[ability_id]

	if weapon_index then
		local weapon_names_by_index = ability.weapon_names_by_index

		if weapon_names_by_index and weapon_names_by_index[weapon_index] then
			return weapon_names_by_index[weapon_index]
		end
	end

	return ability.weapon_name
end

CareerExtension.get_base_critical_strike_chance = function (self)
	return self._career_data.attributes.base_critical_strike_chance or 0
end

CareerExtension.has_melee_boost = function (self)
	local buff_extension = self._buff_extension
	local has_shade_buff = buff_extension:has_buff_perk("shade_melee_boost")
	local has_murder_hobo_buff = false
	local multiplier = has_shade_buff and 4 or has_murder_hobo_buff and 1 or 0

	return has_shade_buff or has_murder_hobo_buff, multiplier
end

CareerExtension.has_ranged_boost = function (self)
	local buff_extension = self._buff_extension
	local has_murder_hobo_buff = buff_extension:has_buff_type("markus_huntsman_activated_ability") or buff_extension:has_buff_type("markus_huntsman_activated_ability_duration")
	local has_ranger_buff = buff_extension:has_buff_type("bardin_ranger_activated_ability_buff")
	local multiplier = has_murder_hobo_buff and 1.5 or has_ranger_buff and 1 or 0

	return has_murder_hobo_buff or has_ranger_buff, multiplier
end

CareerExtension.get_career_power_level = function (self)
	local player = self.player
	local career_name = self._career_name
	local profile_name = self._profile_name
	local power_level = MIN_POWER_LEVEL
	local game_mode_manager = Managers.state.game_mode
	local game_mode_key = game_mode_manager and game_mode_manager:game_mode_key()

	if game_mode_key == "versus" and player.bot_player then
		local game_mode_setting = GameModeSettings[game_mode_key]

		if game_mode_setting and game_mode_setting.power_level_override then
			power_level = game_mode_setting.power_level_override
		end
	else
		if player.bot_player then
			local leader_player = Managers.player:party_leader_player()

			if leader_player then
				player = leader_player
				profile_name = leader_player:profile_display_name()
				career_name = leader_player:career_name()
			end
		end

		if player.remote then
			power_level = player:get_data("power_level") or MIN_POWER_LEVEL
		else
			power_level = BackendUtils.get_total_power_level(profile_name, career_name)
		end
	end

	local buff_extension = self._buff_extension

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

CareerExtension.get_breed = function (self)
	return self._breed
end

CareerExtension.ability_amount = function (self)
	return self._num_abilities
end

CareerExtension._run_ability_ready_feedback = function (self, ability_id, t)
	local ability = self._abilities[ability_id]

	if ability and ability.activated_ability and ability.activated_ability.ability_ready then
		ability.activated_ability:ability_ready()
	else
		local first_person_extension = self._first_person_extension

		if first_person_extension then
			if t > self._last_ability_ready_t + ABILITY_READY_ANTI_SPAM_DELAY then
				first_person_extension:play_hud_sound_event("Play_hud_ability_ready")
			end

			self._last_ability_ready_t = t
		end
	end
end

CareerExtension.check_cooldown_anim = function (self, ability_id)
	local ability = self._abilities[ability_id]

	if not ability.cooldown_anim_started and ability.cooldown_anim_time then
		local cooldown = self:current_ability_cooldown(ability_id)

		if cooldown - ability.cooldown_anim_time < 0 then
			ability.cooldown_anim_started = true

			ability.activated_ability:start_cooldown_anim()
		end
	end
end

CareerExtension.should_reload_career_weapon = function (self)
	return self._career_data.should_reload_career_weapon
end

CareerExtension.set_career_game_object_id = function (self, go_id)
	local passive_abilities = self._passive_abilities

	for i = 1, self._num_passive_abilities do
		local ability = passive_abilities[i]

		if ability and ability.set_career_game_object_id then
			ability:set_career_game_object_id(go_id)
		end
	end
end

CareerExtension.get_passive_ability = function (self, ability_id)
	local passive_abilities = self._passive_abilities

	return passive_abilities and passive_abilities[ability_id or 1]
end

CareerExtension.get_passive_ability_by_name = function (self, ability_name)
	return self._passive_abilities_by_name[ability_name]
end

CareerExtension.on_round_started = function (self)
	self:set_activated_ability_cooldown_unpaused()
end
