PlayerUnitHealthExtension = class(PlayerUnitHealthExtension, GenericHealthExtension)

local function _add_player_damaged_telemetry(unit, damage_type, damage_source)
	local player_manager = Managers.player
	local owner = player_manager:owner(unit)

	if owner then
		local local_player = owner.local_player
		local is_bot = owner.bot_player
		local network_manager = Managers.state.network
		local is_server = network_manager.is_server

		if (is_bot and is_server) or local_player then
			local position = POSITION_LOOKUP[unit]

			Managers.telemetry.events:player_damaged(owner, damage_type, damage_source, position)
		end
	end
end

PlayerUnitHealthExtension.init = function (self, extension_init_context, unit, extension_init_data)
	PlayerUnitHealthExtension.super.init(self, extension_init_context, unit, extension_init_data)

	local player = extension_init_data.player
	local is_local_player = player.local_player
	local is_bot = not player:is_player_controlled()
	self.player = player
	self.is_bot = is_bot
	self.network_manager = Managers.state.network
	self.game = self.network_manager:game()
	self.unit_storage = extension_init_context.unit_storage
	self._profile_index = extension_init_data.profile_index
	self._career_index = extension_init_data.career_index
	self._shield_amount = 0
	self._shield_duration_left = 0
	self._end_reason = ""
	self.wounded_degen_timer = 0

	if self.is_server and not is_local_player and not is_bot then
		self:create_health_game_object()
	end
end

PlayerUnitHealthExtension.hot_join_sync = function (self, sender)
	return
end

PlayerUnitHealthExtension.cb_game_session_disconnect = function (self)
	self.health_game_object_id = nil
end

PlayerUnitHealthExtension.set_health_game_object_id = function (self, go_id)
	self.health_game_object_id = go_id
end

PlayerUnitHealthExtension.create_health_game_object = function (self)
	fassert(self.is_server, "Trying to create health game object on a client")

	local unit = self.unit
	local difficulty_manager = Managers.state.difficulty
	local difficulty_settings = difficulty_manager:get_difficulty_settings()
	local max_health_alive, max_health_kd = self:_get_base_max_health()
	local game_object_id = self.network_manager:unit_game_object_id(unit)
	local game_object_data_table = {
		current_temporary_health = 0,
		go_type = NetworkLookup.go_types.player_unit_health,
		unit_game_object_id = game_object_id,
		current_health = max_health_alive,
		max_health = max_health_alive,
		current_wounds = difficulty_settings.wounds,
		max_wounds = difficulty_settings.wounds
	}
	local callback = callback(self, "cb_game_session_disconnect")
	local health_game_object_id = self.network_manager:create_game_object("player_unit_health", game_object_data_table, callback)
	self.health_game_object_id = health_game_object_id
	self.previous_max_health = max_health_alive
	self.previous_state = self.state
end

PlayerUnitHealthExtension.sync_health_state = function (self)
	local player = self.player
	local health_state, health_percentage, temporary_health_percentage, melee_ammo, ranged_ammo = Managers.state.spawn:get_status(player)

	if script_data.network_debug then
		printf("PlayerUnitHealthExtension:sync_health_state() health_state (%s) health_percentage (%s) temporary_health_percentage (%s) melee slot ammo (%s) ranged slot ammo (%s)", health_state, tostring(health_percentage), tostring(temporary_health_percentage), tostring(melee_ammo), tostring(ranged_ammo))
	end

	if health_state == nil then
		print("[PlayerUnitHealthExtension] Spawn manager returned nil value for spawn state, killing character. player:", player)
		table.dump(player)
	else
		self.set_health_percentage = health_percentage
		self.set_temporary_health_percentage = temporary_health_percentage

		if health_state == "knocked_down" then
			self:_knock_down(self.unit)
		end
	end
end

PlayerUnitHealthExtension._get_base_max_health = function (self)
	local profile_index = self._profile_index
	local career_index = self._career_index
	local current_hero = SPProfiles[profile_index]
	local career_data = current_hero.careers[career_index]
	local attributes = career_data.attributes

	return attributes.max_hp, attributes.max_hp_kd
end

PlayerUnitHealthExtension._calculate_max_health = function (self)
	local buff_extension = self.buff_extension
	local health_state = self.state
	local max_health_alive, max_health_kd = self:_get_base_max_health()
	local max_health = nil
	local modifier = 1

	if health_state == "alive" then
		max_health = buff_extension:apply_buffs_to_value(max_health_alive, StatBuffIndex.MAX_HEALTH_ALIVE)
	else
		max_health = buff_extension:apply_buffs_to_value(max_health_kd, StatBuffIndex.MAX_HEALTH_KD)
	end

	max_health = buff_extension:apply_buffs_to_value(max_health, StatBuffIndex.MAX_HEALTH)
	local num_grimoires = buff_extension:num_buff_perk("skaven_grimoire")
	local multiplier = buff_extension:apply_buffs_to_value(PlayerUnitDamageSettings.GRIMOIRE_HEALTH_DEBUFF, StatBuffIndex.CURSE_PROTECTION)
	local num_twitch_grimoires = buff_extension:num_buff_perk("twitch_grimoire")
	local twitch_multiplier = PlayerUnitDamageSettings.GRIMOIRE_HEALTH_DEBUFF

	if num_grimoires + num_twitch_grimoires > 0 then
		modifier = 1 + num_grimoires * multiplier + num_twitch_grimoires * twitch_multiplier
	end

	max_health = max_health * modifier
	max_health = DamageUtils.networkify_health(max_health)

	return max_health
end

PlayerUnitHealthExtension.extensions_ready = function (self, world, unit)
	self.status_extension = ScriptUnit.extension(unit, "status_system")
	self.buff_extension = ScriptUnit.extension(unit, "buff_system")

	if self.is_server and not self.is_bot then
		self:sync_health_state()
	end
end

PlayerUnitHealthExtension._knock_down = function (self, unit)
	self.state = "knocked_down"

	StatusUtils.set_knocked_down_network(unit, true)
	StatusUtils.set_wounded_network(unit, false, "knocked_down")
end

PlayerUnitHealthExtension._revive = function (self, unit, t)
	self.state = "alive"

	StatusUtils.set_knocked_down_network(unit, false)
	StatusUtils.set_wounded_network(unit, true, "revived", t)
	StatusUtils.set_revived_network(unit, false)
end

PlayerUnitHealthExtension.update = function (self, dt, context, t)
	local status_extension = self.status_extension
	local game_object_id = self.health_game_object_id
	local unit = self.unit

	if self._shield_duration_left > 0 then
		self._shield_duration_left = self._shield_duration_left - dt
	elseif not self._end_reason then
		self:remove_assist_shield("timed_out")
	end

	if self.is_server then
		if self.state == "alive" then
			if not self:_is_alive() and not status_extension:is_knocked_down() then
				self:_knock_down(unit)
			end
		elseif self.state == "knocked_down" and self:_is_alive() and status_extension:is_revived() then
			self:_revive(unit, t)
		end

		local game = self.game
		local max_health = self:_calculate_max_health()

		GameSession.set_game_object_field(game, game_object_id, "max_health", max_health)

		local state = self.state
		local previous_state = self.previous_state
		local previous_max_health = self.previous_max_health
		local health = GameSession.game_object_field(game, game_object_id, "current_health")
		local temporary_health = GameSession.game_object_field(game, game_object_id, "current_temporary_health")

		if previous_state and state ~= previous_state then
			if state == "knocked_down" then
				health = 0
				temporary_health = max_health
			elseif state == "alive" then
				health = 0
				temporary_health = max_health / 2
			end
		elseif max_health ~= previous_max_health then
			local previous_health_percentage = health / previous_max_health
			health = max_health * previous_health_percentage
		end

		local set_health_percentage = self.set_health_percentage

		if set_health_percentage then
			health = max_health * set_health_percentage
			self.set_health_percentage = nil
		end

		local set_temporary_health_percentage = self.set_temporary_health_percentage

		if set_temporary_health_percentage then
			temporary_health = max_health * set_temporary_health_percentage
			self.set_temporary_health_percentage = nil
		end

		health = DamageUtils.networkify_health(health)
		temporary_health = DamageUtils.networkify_health(temporary_health)

		GameSession.set_game_object_field(game, game_object_id, "current_health", health)
		GameSession.set_game_object_field(game, game_object_id, "current_temporary_health", temporary_health)

		if script_data.show_player_health then
			local max_wounds = status_extension:max_wounds_network_safe()
			local current_wounds = status_extension:num_wounds_remaining()

			Debug.text("[%s] perm=%.2f (%.3f%%) temp=%.2f (%.3f%%) max=%.2f wounds=%.0f/%.0f", SPProfilesAbbreviation[self._profile_index], health, self:current_permanent_health_percent(), temporary_health, self:current_temporary_health_percent(), max_health, current_wounds, max_wounds)
		end

		if self.wounded_degen_timer <= t then
			if temporary_health > 0 and state == "alive" then
				local new_temporary_health = temporary_health - PlayerUnitStatusSettings.WOUNDED_DEGEN_AMOUNT
				local min_temporary_health_left = (health <= 0 and 1) or 0
				local damage = temporary_health - math.max(new_temporary_health, min_temporary_health_left)

				if damage > 0 then
					DamageUtils.add_damage_network(unit, unit, damage, "torso", "temporary_health_degen", Vector3(1, 0, 0), "temporary_health_degen")
				end
			end

			self.wounded_degen_timer = t + PlayerUnitStatusSettings.WOUNDED_DEGEN_DELAY
		end

		self.previous_state = state
		self.previous_max_health = max_health
	end
end

local FORCED_PERMANENT_DAMAGE_TYPES = {}

PlayerUnitHealthExtension.add_damage = function (self, attacker_unit, damage_amount, hit_zone_name, damage_type, damage_direction, damage_source_name, hit_ragdoll_actor, damaging_unit, hit_react_type, is_critical_strike, added_dot)
	if DamageUtils.is_in_inn then
		return
	end

	local status_extension = self.status_extension

	if status_extension:is_ready_for_assisted_respawn() then
		return
	end

	local breed = Unit.get_data(attacker_unit, "breed")

	if breed and breed.boss then
		local owner_player = Managers.player:owner(self.unit)

		if owner_player and owner_player.local_player and not owner_player.bot_player then
			Managers.state.event:trigger("show_boss_health_bar", attacker_unit)
		end
	end

	fassert(damage_type, "No damage_type!")

	local unit = self.unit
	local damage_table = PlayerUnitHealthExtension.super._add_to_damage_history_buffer(self, unit, attacker_unit, damage_amount, hit_zone_name, damage_type, damage_direction, damage_source_name, hit_ragdoll_actor, damaging_unit, hit_react_type, is_critical_strike)

	if damage_type ~= "temporary_health_degen" then
		StatisticsUtil.register_damage(unit, damage_table, self.statistics_db)
	end

	self._recent_damage_type = damage_type
	self._recent_hit_react_type = hit_react_type
	local controller_features_manager = Managers.state.controller_features

	if controller_features_manager then
		local player = self.player

		if player.local_player and damage_amount > 0 then
			controller_features_manager:add_effect("hit_rumble", {
				damage_amount = damage_amount,
				unit = unit
			})
		end
	end

	_add_player_damaged_telemetry(unit, damage_type, damage_source_name or "n/a")

	local buff_extension = ScriptUnit.extension(unit, "buff_system")

	buff_extension:trigger_procs("on_damage_taken", attacker_unit, damage_amount, damage_type)

	local ai_inventory_extension = ScriptUnit.has_extension(attacker_unit, "ai_inventory_system")

	if ai_inventory_extension then
		ai_inventory_extension:play_hit_sound(unit, damage_type)
	end

	if ScriptUnit.has_extension(attacker_unit, "hud_system") then
		DamageUtils.handle_hit_indication(attacker_unit, unit, damage_amount, hit_zone_name, added_dot)
	end

	if self.player.local_player and (buff_extension:has_buff_type("bardin_ironbreaker_activated_ability") or buff_extension:has_buff_type("bardin_ironbreaker_activated_ability_duration")) then
		local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

		first_person_extension:play_hud_sound_event("Play_career_ability_bardin_ironbreaker_hit")
	end

	if self.is_server and not self.is_invincible and not script_data.player_invincible then
		local game = self.game
		local game_object_id = self.health_game_object_id

		if game and game_object_id then
			local force_permanent_damage = FORCED_PERMANENT_DAMAGE_TYPES[damage_type]
			local current_health = GameSession.game_object_field(game, game_object_id, "current_health")
			local current_temporary_health = GameSession.game_object_field(game, game_object_id, "current_temporary_health")
			local permanent_damage_amount = 0
			local temporary_damage_amount = 0

			if force_permanent_damage then
				permanent_damage_amount = (current_health < damage_amount and current_health) or damage_amount
				temporary_damage_amount = (current_health < damage_amount and damage_amount - current_health) or 0
			else
				permanent_damage_amount = (current_temporary_health < damage_amount and damage_amount - current_temporary_health) or 0
				temporary_damage_amount = (current_temporary_health < damage_amount and current_temporary_health) or damage_amount
			end

			local new_health = (current_health < permanent_damage_amount and 0) or current_health - permanent_damage_amount

			GameSession.set_game_object_field(game, game_object_id, "current_health", new_health)

			local new_temporary_health = (current_temporary_health < temporary_damage_amount and 0) or current_temporary_health - temporary_damage_amount

			GameSession.set_game_object_field(game, game_object_id, "current_temporary_health", new_temporary_health)

			local is_dead = new_health + new_temporary_health <= 0 and (self.state ~= "alive" or not status_extension:has_wounds_remaining())

			if is_dead and self.state ~= "dead" then
				local death_system = Managers.state.entity:system("death_system")

				death_system:kill_unit(unit, damage_table)
			end

			local unit_id = self.unit_storage:go_id(unit)
			local attacker_unit_id, attacker_is_level_unit = self.network_manager:game_object_or_level_id(attacker_unit)
			local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
			local damage_type_id = NetworkLookup.damage_types[damage_type]
			local damage_source_id = NetworkLookup.damage_sources[damage_source_name or "n/a"]
			local hit_ragdoll_actor_id = NetworkLookup.hit_ragdoll_actors[hit_ragdoll_actor or "n/a"]
			local hit_react_type_id = NetworkLookup.hit_react_types[hit_react_type or "light"]
			is_critical_strike = is_critical_strike or false
			added_dot = added_dot or false

			self.network_transmit:send_rpc_clients("rpc_add_damage", unit_id, false, attacker_unit_id, attacker_is_level_unit, damage_amount, hit_zone_id, damage_type_id, damage_direction, damage_source_id, hit_ragdoll_actor_id, hit_react_type_id, is_dead, is_critical_strike, added_dot)
		end
	end
end

PlayerUnitHealthExtension.add_heal = function (self, healer_unit, heal_amount, heal_source_name, heal_type)
	local unit = self.unit

	self:_add_to_damage_history_buffer(unit, healer_unit, -heal_amount, nil, "heal", nil, heal_source_name, nil, nil, nil, nil)

	if self.is_server then
		local game = self.game
		local game_object_id = self.health_game_object_id
		local current_health = GameSession.game_object_field(game, game_object_id, "current_health")
		local current_temporary_health = GameSession.game_object_field(game, game_object_id, "current_temporary_health")
		local max_health = GameSession.game_object_field(game, game_object_id, "max_health")

		if self.status_extension:is_permanent_heal(heal_type) and not self.status_extension:is_knocked_down() then
			local new_temporary_health = (current_temporary_health < heal_amount and 0) or current_temporary_health - heal_amount

			GameSession.set_game_object_field(game, game_object_id, "current_temporary_health", new_temporary_health)

			local new_health = (max_health < current_health + new_temporary_health + heal_amount and max_health) or current_health + heal_amount

			GameSession.set_game_object_field(game, game_object_id, "current_health", new_health)
		else
			new_temporary_health = (max_health < current_health + current_temporary_health + heal_amount and max_health - current_health) or current_temporary_health + heal_amount

			GameSession.set_game_object_field(game, game_object_id, "current_temporary_health", new_temporary_health)
		end

		local unit_id = self.unit_storage:go_id(unit)

		if unit_id then
			local network_transmit = self.network_transmit
			local network_manager = Managers.state.network
			local healer_unit_id, healer_is_level_unit = network_manager:game_object_or_level_id(healer_unit)
			local heal_type_id = NetworkLookup.heal_types[heal_type]

			network_transmit:send_rpc_clients("rpc_heal", unit_id, false, healer_unit_id, healer_is_level_unit, heal_amount, heal_type_id)
		end
	end
end

PlayerUnitHealthExtension.die = function (self, damage_type)
	if not self.is_server then
		return
	end

	damage_type = damage_type or "undefined"
	local unit = self.unit

	if damage_type == "volume_insta_kill" then
		self:_knock_down(unit)
	end

	if self.is_bot and damage_type == "volume_insta_kill" then
		local blackboard = BLACKBOARDS[unit]

		for _, player_pos in ipairs(PLAYER_POSITIONS) do
			local pos = LocomotionUtils.new_random_goal_uniformly_distributed(blackboard.nav_world, nil, player_pos, 2, 5, 5)

			if pos then
				local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

				locomotion_extension:teleport_to(pos)
				ScriptUnit.extension(unit, "ai_navigation_system"):teleport(pos)
				ScriptUnit.extension(unit, "ai_system"):clear_failed_paths()

				return
			end
		end
	end

	local damage_amount = NetworkConstants.damage.max
	local hit_zone_name = "full"
	local damage_direction = Vector3.up()

	self:add_damage(unit, damage_amount, hit_zone_name, damage_type, damage_direction)
end

PlayerUnitHealthExtension.destroy = function (self)
	if self.is_server and self.health_game_object_id then
		self.network_manager:destroy_game_object(self.health_game_object_id)

		self.health_game_object_id = nil
	end
end

PlayerUnitHealthExtension.reset = function (self)
	if self.is_server then
		self.state = "alive"
		local game = self.game
		local game_object_id = self.health_game_object_id
		local max_health = GameSession.game_object_field(game, game_object_id, "max_health")

		GameSession.set_game_object_field(game, game_object_id, "current_health", max_health)
		GameSession.set_game_object_field(game, game_object_id, "current_temporary_health", 0)
	end
end

PlayerUnitHealthExtension.is_alive = function (self)
	return self.state ~= "dead"
end

PlayerUnitHealthExtension._is_alive = function (self)
	local game = self.game
	local game_object_id = self.health_game_object_id

	if game and game_object_id then
		local health = GameSession.game_object_field(game, game_object_id, "current_health")
		local temporary_health = GameSession.game_object_field(game, game_object_id, "current_temporary_health")

		return health + temporary_health > 0
	end

	return true
end

PlayerUnitHealthExtension.current_health_percent = function (self)
	local game = self.game
	local game_object_id = self.health_game_object_id

	if game and game_object_id then
		local health = GameSession.game_object_field(game, game_object_id, "current_health")
		local temporary_health = GameSession.game_object_field(game, game_object_id, "current_temporary_health")
		local max_health = GameSession.game_object_field(game, game_object_id, "max_health")

		return (health + temporary_health) / max_health
	end

	return 1
end

PlayerUnitHealthExtension.current_permanent_health_percent = function (self)
	local game = self.game
	local game_object_id = self.health_game_object_id

	if game and game_object_id then
		local health = GameSession.game_object_field(game, game_object_id, "current_health")
		local max_health = GameSession.game_object_field(game, game_object_id, "max_health")

		return health / max_health
	end

	return 1
end

PlayerUnitHealthExtension.current_temporary_health_percent = function (self)
	local game = self.game
	local game_object_id = self.health_game_object_id

	if game and game_object_id then
		local temporary_health = GameSession.game_object_field(game, game_object_id, "current_temporary_health")
		local max_health = GameSession.game_object_field(game, game_object_id, "max_health")

		return temporary_health / max_health
	end

	return 1
end

PlayerUnitHealthExtension.current_health = function (self)
	local game = self.game
	local game_object_id = self.health_game_object_id

	if game and game_object_id then
		local health = GameSession.game_object_field(game, game_object_id, "current_health")
		local temporary_health = GameSession.game_object_field(game, game_object_id, "current_temporary_health")

		return health + temporary_health
	end

	return self:_calculate_max_health()
end

PlayerUnitHealthExtension.current_permanent_health = function (self)
	local game = self.game
	local game_object_id = self.health_game_object_id

	if game and game_object_id then
		local health = GameSession.game_object_field(game, game_object_id, "current_health")

		return health
	end

	return self:_calculate_max_health()
end

PlayerUnitHealthExtension.current_temporary_health = function (self)
	local game = self.game
	local game_object_id = self.health_game_object_id

	if game and game_object_id then
		local temporary_health = GameSession.game_object_field(game, game_object_id, "current_temporary_health")

		return temporary_health
	end

	return self:_calculate_max_health()
end

PlayerUnitHealthExtension.get_max_health = function (self)
	local game = self.game
	local game_object_id = self.health_game_object_id

	if game and game_object_id then
		local max_health = GameSession.game_object_field(game, game_object_id, "max_health")

		return max_health
	end

	return self:_calculate_max_health()
end

PlayerUnitHealthExtension.get_damage_taken = function (self)
	local game = self.game
	local game_object_id = self.health_game_object_id

	if game and game_object_id then
		local health = GameSession.game_object_field(game, game_object_id, "current_health")
		local temporary_health = GameSession.game_object_field(game, game_object_id, "current_temporary_health")
		local max_health = GameSession.game_object_field(game, game_object_id, "max_health")

		return max_health - health - temporary_health
	end

	return 0
end

PlayerUnitHealthExtension.shield = function (self, shield_amount)
	self._shield_amount = shield_amount
	self._shield_duration_left = 10
	self._end_reason = nil

	if script_data.damage_debug then
		printf("[PlayerUnitHealthExtension] shield %.1f to %s", shield_amount, tostring(self.unit))
	end
end

PlayerUnitHealthExtension.has_assist_shield = function (self)
	return self._shield_duration_left > 0 and self._shield_amount > 0, self._shield_amount
end

PlayerUnitHealthExtension.remove_assist_shield = function (self, end_reason)
	self._shield_duration_left = 0
	self._shield_amount = 0
	self._end_reason = end_reason
end

PlayerUnitHealthExtension.previous_shield_end_reason = function (self)
	return self._end_reason
end

PlayerUnitHealthExtension.set_dead = function (self)
	self.state = "dead"

	self.status_extension:set_dead(true)

	local death_discover_distance = DialogueSettings.death_discover_distance
	local unit = self.unit
	local player_profile = ScriptUnit.extension(unit, "dialogue_system").context.player_profile

	SurroundingAwareSystem.add_event(unit, "player_death", death_discover_distance, "target", unit, "target_name", player_profile)
end

PlayerUnitHealthExtension.set_max_health = function (self, health, update_unmodfied)
	return
end

PlayerUnitHealthExtension.set_current_damage = function (self, damage)
	return
end

return
