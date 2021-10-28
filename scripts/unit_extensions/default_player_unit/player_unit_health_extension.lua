PlayerUnitHealthExtension = class(PlayerUnitHealthExtension, GenericHealthExtension)

PlayerUnitHealthExtension.init = function (self, extension_init_context, unit, extension_init_data)
	PlayerUnitHealthExtension.super.init(self, extension_init_context, unit, extension_init_data)

	local player = extension_init_data.player
	local is_local_player = player.local_player
	local is_bot = not player:is_player_controlled()
	self.player = player
	self.is_bot = is_bot
	self.is_local_player = is_local_player
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
	local max_health_alive, _ = self:_get_base_max_health()
	local game_object_id = self.network_manager:unit_game_object_id(unit)
	local game_object_data_table = {
		current_temporary_health = 0,
		go_type = NetworkLookup.go_types.player_unit_health,
		unit_game_object_id = game_object_id,
		current_health = max_health_alive,
		max_health = max_health_alive,
		uncursed_max_health = max_health_alive,
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
	local status = Managers.party:get_player_status(player:network_id(), player:local_player_id())
	local data = status.game_mode_data
	local health_state = data.health_state
	local health_percentage = data.health_percentage
	local temporary_health_percentage = data.temporary_health_percentage
	local melee_ammo = data.ammo.slot_melee
	local ranged_ammo = data.ammo.slot_ranged

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
			self.set_knocked_down = true
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

PlayerUnitHealthExtension._calculate_buffed_max_health = function (self)
	local buff_extension = self.buff_extension
	local health_state = self.state
	local max_health_alive, max_health_kd = self:_get_base_max_health()
	local max_health = nil

	if health_state == "alive" then
		max_health = buff_extension:apply_buffs_to_value(max_health_alive, "max_health_alive")
	else
		max_health = buff_extension:apply_buffs_to_value(max_health_kd, "max_health_kd")
	end

	max_health = buff_extension:apply_buffs_to_value(max_health, "max_health")

	return max_health
end

PlayerUnitHealthExtension.get_buffed_max_health = function (self)
	local max_health = self:_calculate_buffed_max_health()

	return max_health
end

PlayerUnitHealthExtension._calculate_max_health = function (self)
	local buff_extension = self.buff_extension
	local health_state = self.state
	local modifier = 1
	local num_grimoires = buff_extension:num_buff_perk("skaven_grimoire")
	local grimoire_multiplier = buff_extension:apply_buffs_to_value(PlayerUnitDamageSettings.GRIMOIRE_HEALTH_DEBUFF, "curse_protection")
	local num_twitch_grimoires = buff_extension:num_buff_perk("twitch_grimoire")
	local twitch_grimoire_multiplier = PlayerUnitDamageSettings.GRIMOIRE_HEALTH_DEBUFF
	local num_slayer_curses = buff_extension:num_buff_perk("slayer_curse")
	local slayer_curse_multiplier = buff_extension:apply_buffs_to_value(PlayerUnitDamageSettings.SLAYER_CURSE_HEALTH_DEBUFF, "curse_protection")
	local difficulty_name = Managers.state.difficulty:get_difficulty()
	local num_mutator_curses = buff_extension:num_buff_perk("mutator_curse")
	local mutator_curse_multiplier = buff_extension:apply_buffs_to_value(WindSettings.light.curse_settings.value[difficulty_name], "curse_protection")
	local cursed_health = buff_extension:apply_buffs_to_value(0, "health_curse")

	if health_state == "knocked_down" then
		num_slayer_curses = 0
		cursed_health = 0
	end

	if num_grimoires + num_twitch_grimoires + num_slayer_curses + num_mutator_curses + cursed_health > 0 then
		modifier = 1 + num_grimoires * grimoire_multiplier + num_twitch_grimoires * twitch_grimoire_multiplier + num_slayer_curses * slayer_curse_multiplier + num_mutator_curses * mutator_curse_multiplier + cursed_health
	end

	local max_health = self:_calculate_buffed_max_health()
	max_health = max_health * math.max(modifier, 0.01)

	return max_health
end

PlayerUnitHealthExtension.extensions_ready = function (self, world, unit)
	self.status_extension = ScriptUnit.extension(unit, "status_system")
	self.buff_extension = ScriptUnit.extension(unit, "buff_system")

	if not DEDICATED_SERVER then
		self._outline_extension = ScriptUnit.extension(unit, "outline_system")
	end

	if self.is_server and not self.is_bot then
		self:sync_health_state()
	end
end

PlayerUnitHealthExtension.knock_down = function (self, unit)
	self.state = "knocked_down"

	StatusUtils.set_knocked_down_network(unit, true)
	StatusUtils.set_wounded_network(unit, false, "knocked_down")

	local recent_damages = self:recent_damages()
	local attacker_unit = recent_damages[3]
	local attacker_player = Managers.player:owner(attacker_unit)

	if attacker_player and Managers.mechanism:current_mechanism_name() == "versus" then
		local stats_id = attacker_player:stats_id()
		local statistics_db = Managers.player:statistics_db()
		local target_breed = Unit.get_data(unit, "breed")

		statistics_db:increment_stat(stats_id, "vs_badge_knocked_down_target_per_breed", target_breed.name)
	end
end

PlayerUnitHealthExtension._revive = function (self, unit, t)
	self.state = "alive"

	StatusUtils.set_knocked_down_network(unit, false)
	StatusUtils.set_wounded_network(unit, true, "revived", t)
	StatusUtils.set_revived_network(unit, false)
end

PlayerUnitHealthExtension.update = function (self, dt, context, t)
	local status_extension = self.status_extension
	local unit = self.unit

	if self._shield_duration_left > 0 then
		self._shield_duration_left = self._shield_duration_left - dt
	elseif not self._end_reason then
		self:remove_assist_shield("timed_out")
	end

	if self.is_server then
		if self.set_knocked_down then
			if not status_extension:is_knocked_down() then
				self:knock_down(unit)
			end

			self.set_knocked_down = false
		elseif self.state == "alive" then
			if not self:_is_alive() and not status_extension:is_knocked_down() then
				self:knock_down(unit)
			end
		elseif self.state == "knocked_down" and self:_is_alive() and status_extension:is_revived() then
			self:_revive(unit, t)
		end

		local game = self.game
		local game_object_id = self.health_game_object_id

		if game or game_object_id then
			local max_health = self:_calculate_max_health()
			max_health = DamageUtils.networkify_health(max_health)
			local uncursed_max_health = self:_calculate_buffed_max_health()
			uncursed_max_health = DamageUtils.networkify_health(uncursed_max_health)

			GameSession.set_game_object_field(game, game_object_id, "max_health", max_health)
			GameSession.set_game_object_field(game, game_object_id, "uncursed_max_health", uncursed_max_health)

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
					local buff_extension = self.buff_extension
					local temp_to_permanent_health = buff_extension and buff_extension:has_buff_perk("temp_to_permanent_health")

					if temp_to_permanent_health then
						health = max_health / 2
						temporary_health = 0
					else
						health = 0
						temporary_health = max_health / 2
					end
				end
			elseif max_health ~= previous_max_health then
				local previous_health_percentage, previous_temporary_health_percentage = nil

				if previous_max_health == 0 then
					previous_health_percentage = 0
					previous_temporary_health_percentage = 0
				else
					previous_health_percentage = health / previous_max_health
					previous_temporary_health_percentage = temporary_health / previous_max_health
				end

				health = max_health * previous_health_percentage
				temporary_health = max_health * previous_temporary_health_percentage
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

			if self.wounded_degen_timer <= t then
				local wounded = status_extension:is_wounded()
				local degen_amount = PlayerUnitStatusSettings.WOUNDED_DEGEN_AMOUNT
				local degen_delay = PlayerUnitStatusSettings.WOUNDED_DEGEN_DELAY

				if not wounded then
					degen_amount, degen_delay = self:health_degen_settings()
				end

				if temporary_health > 0 and state == "alive" then
					local new_temporary_health = temporary_health - degen_amount
					local min_temporary_health_left = (health <= 0 and 1) or 0
					local damage = temporary_health - math.max(new_temporary_health, min_temporary_health_left)

					if damage > 0 then
						DamageUtils.add_damage_network(unit, unit, damage, "torso", "temporary_health_degen", nil, Vector3(1, 0, 0), "temporary_health_degen")
					end
				end

				self.wounded_degen_timer = t + degen_delay
			end

			self.previous_state = state
			self.previous_max_health = max_health

			if max_health <= 0 then
				local death_system = Managers.state.entity:system("death_system")

				death_system:forced_kill(unit, "forced")
			end
		end
	end

	if Managers.mechanism:current_mechanism_name() == "versus" then
		self:_update_outline_color(t, dt)
	end
end

PlayerUnitHealthExtension._update_outline_color = function (self, t, dt)
	local local_player = Managers.player:local_player()

	if not local_player then
		return
	end

	local peer_id = local_player:network_id()
	local local_player_id = local_player:local_player_id()
	local party = Managers.party:get_party_from_player_id(peer_id, local_player_id)
	local side = Managers.state.side.side_by_party[party]
	local is_park_pact = side:name() == "dark_pact"

	if not is_park_pact then
		return
	end

	local unit_side = Managers.state.side.side_by_unit[self.unit]

	if not unit_side then
		return
	end

	local unit_is_hero = unit_side:name() == "heroes"

	if not unit_is_hero then
		return
	end

	local new_outline_color = nil
	local outline_ext = self._outline_extension
	local is_disabled = self.status_extension:is_disabled()
	local current_health_percent = self:current_health_percent()

	if is_disabled then
		new_outline_color = OutlineSettingsVS.colors.hero_dying
	elseif current_health_percent >= 0.66 then
		new_outline_color = OutlineSettingsVS.colors.hero_healthy
	elseif current_health_percent >= 0.33 then
		new_outline_color = OutlineSettingsVS.colors.hero_hurt
	else
		new_outline_color = OutlineSettingsVS.colors.hero_dying
	end

	if not self._outline_id then
		self._outline_id = outline_ext:add_outline({
			priority = 2,
			method = "always",
			outline_color = new_outline_color,
			flag = OutlineSettings.flags.non_wall_occluded
		})
	elseif self._current_outline_color ~= new_outline_color then
		outline_ext:update_outline({
			outline_color = new_outline_color
		}, self._outline_id)
	end

	self._current_outline_color = new_outline_color
end

local FORCED_PERMANENT_DAMAGE_TYPES = {
	death_explosion = true
}

PlayerUnitHealthExtension.apply_client_predicted_damage = function (self, predicted_damage)
	return
end

PlayerUnitHealthExtension.add_damage = function (self, attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, source_attacker_unit, hit_react_type, is_critical_strike, added_dot, first_hit, total_hits, attack_type, backstab_multiplier)
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

		QuestSettings.handle_bastard_block(self.unit, attacker_unit, false)
	end

	if damage_source_name == "ground_impact" and not breed.is_hero then
		return
	end

	fassert(damage_type, "No damage_type!")

	local unit = self.unit
	local damage_table = self:_add_to_damage_history_buffer(unit, attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, source_attacker_unit, hit_react_type, is_critical_strike, first_hit, total_hits, attack_type)

	if damage_amount == nil then
		Crashify.print_exception("HealthSystem", "damage_amount is nil in PlayerUnitHealthExtension:add_damage()")
	end

	if damage_type ~= "temporary_health_degen" and damage_type ~= "knockdown_bleed" then
		StatisticsUtil.register_damage(unit, damage_table, self.statistics_db)
	end

	self:save_kill_feed_data(attacker_unit, damage_table, hit_zone_name, damage_type, damage_source_name, source_attacker_unit)

	self._recent_damage_type = damage_type
	self._recent_hit_react_type = hit_react_type
	local controller_features_manager = Managers.state.controller_features

	if controller_features_manager then
		local player = self.player

		if player.local_player and damage_amount > 0 and damage_type ~= "temporary_health_degen" then
			controller_features_manager:add_effect("hit_rumble", {
				damage_amount = damage_amount,
				unit = unit
			})
		end
	end

	if Script.type_name(damage_amount) == "number" and damage_type ~= "temporary_health_degen" and damage_source_name ~= "temporary_health_degen" then
		local player = Managers.player:owner(unit)
		local position = POSITION_LOOKUP[unit]

		Managers.telemetry.events:player_damaged(player, damage_type, damage_source_name or "n/a", damage_amount, position)

		local attacker_player = Managers.player:owner(attacker_unit)

		if not DEDICATED_SERVER and attacker_player then
			local local_player = Managers.player:local_player()

			if attacker_player:unique_id() == local_player:unique_id() then
				local attacker_position = POSITION_LOOKUP[attacker_unit]
				local target_breed = Unit.get_data(unit, "breed")

				Managers.telemetry.events:local_player_damaged_player(attacker_player, target_breed.name, damage_amount, attacker_position, position)
			end
		end
	end

	local buff_extension = ScriptUnit.extension(unit, "buff_system")

	if damage_amount > 0 and damage_source_name ~= "temporary_health_degen" then
		buff_extension:trigger_procs("on_damage_taken", attacker_unit, damage_amount, damage_type)
	end

	local min_health = (buff_extension:has_buff_perk("ignore_death") and 1) or 0

	if damage_source_name ~= "dot_debuff" and damage_type ~= "temporary_health_degen" and damage_type ~= "overcharge" then
		local ai_inventory_extension = ScriptUnit.has_extension(attacker_unit, "ai_inventory_system")

		if ai_inventory_extension then
			ai_inventory_extension:play_hit_sound(unit, damage_type)
		end

		if self.player.local_player and (buff_extension:has_buff_type("bardin_ironbreaker_activated_ability") or buff_extension:has_buff_type("bardin_ironbreaker_activated_ability_taunt_range_and_duration")) then
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

			first_person_extension:play_hud_sound_event("Play_career_ability_bardin_ironbreaker_hit")
		end
	end

	DamageUtils.handle_hit_indication(attacker_unit, unit, damage_amount, hit_zone_name, added_dot)

	local weave_manager = Managers.weave

	if weave_manager:get_active_weave() and self.is_server and damage_amount > 0 then
		weave_manager:player_damaged(damage_amount)
	end

	if self.is_server and not self:get_is_invincible() and not script_data.player_invincible then
		local game = self.game
		local game_object_id = self.health_game_object_id

		if game and game_object_id then
			local force_permanent_damage = FORCED_PERMANENT_DAMAGE_TYPES[damage_type]
			local current_health = GameSession.game_object_field(game, game_object_id, "current_health")
			local current_temporary_health = GameSession.game_object_field(game, game_object_id, "current_temporary_health")
			local permanent_damage_amount, temporary_damage_amount = nil
			local total_health = current_health + current_temporary_health
			local modified_damage_amount = (damage_amount >= total_health and total_health - min_health) or damage_amount

			if force_permanent_damage then
				permanent_damage_amount = (current_health < modified_damage_amount and current_health) or modified_damage_amount
				temporary_damage_amount = (current_health < modified_damage_amount and modified_damage_amount - current_health) or 0
			else
				permanent_damage_amount = (current_temporary_health < modified_damage_amount and modified_damage_amount - current_temporary_health) or 0
				temporary_damage_amount = (current_temporary_health < modified_damage_amount and current_temporary_health) or modified_damage_amount
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
			local source_attacker_unit_id = self.network_manager:unit_game_object_id(source_attacker_unit) or attacker_unit_id
			local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
			local damage_type_id = NetworkLookup.damage_types[damage_type]
			local damage_source_id = NetworkLookup.damage_sources[damage_source_name or "n/a"]
			local hit_ragdoll_actor_id = NetworkLookup.hit_ragdoll_actors[hit_ragdoll_actor or "n/a"]
			local hit_react_type_id = NetworkLookup.hit_react_types[hit_react_type or "light"]
			local attack_type_id = NetworkLookup.buff_attack_types[attack_type or "n/a"]
			is_critical_strike = is_critical_strike or false
			added_dot = added_dot or false
			first_hit = first_hit or false
			total_hits = total_hits or 1
			backstab_multiplier = backstab_multiplier or 1

			self.network_transmit:send_rpc_clients("rpc_add_damage", unit_id, false, attacker_unit_id, attacker_is_level_unit, source_attacker_unit_id, damage_amount, hit_zone_id, damage_type_id, hit_position, damage_direction, damage_source_id, hit_ragdoll_actor_id, hit_react_type_id, is_dead, is_critical_strike, added_dot, first_hit, total_hits, attack_type_id, backstab_multiplier)
		end
	end
end

PlayerUnitHealthExtension.add_heal = function (self, healer_unit, heal_amount, heal_source_name, heal_type)
	local unit = self.unit
	local status_extension = self.status_extension

	self:_add_to_damage_history_buffer(unit, healer_unit, -heal_amount, nil, "heal", nil, heal_source_name, nil, nil, nil, nil)

	if status_extension and status_extension:heal_can_remove_wounded(heal_type) then
		local razer_chroma = Managers.razer_chroma

		razer_chroma:play_animation("health_potion", false, RAZER_ADD_ANIMATION_TYPE.REPLACE)
	end

	Managers.state.achievement:trigger_event("register_heal", healer_unit, unit, heal_amount, heal_type)

	if self.is_server then
		local game = self.game
		local game_object_id = self.health_game_object_id

		if game and game_object_id then
			local current_health = GameSession.game_object_field(game, game_object_id, "current_health")
			local current_temporary_health = GameSession.game_object_field(game, game_object_id, "current_temporary_health")
			local max_health = GameSession.game_object_field(game, game_object_id, "max_health")

			if status_extension:is_permanent_heal(heal_type) and not status_extension:is_knocked_down() then
				local new_temporary_health = (current_temporary_health < heal_amount and 0) or current_temporary_health - heal_amount

				GameSession.set_game_object_field(game, game_object_id, "current_temporary_health", new_temporary_health)

				local new_health = (max_health < current_health + new_temporary_health + heal_amount and max_health) or current_health + heal_amount

				GameSession.set_game_object_field(game, game_object_id, "current_health", new_health)
			else
				local new_temporary_health = (max_health < current_health + current_temporary_health + heal_amount and max_health - current_health) or current_temporary_health + heal_amount

				GameSession.set_game_object_field(game, game_object_id, "current_temporary_health", new_temporary_health)
			end

			if heal_type ~= "career_passive" and not status_extension:is_wounded() then
				local t = Managers.time:time("game")
				local _, _, degen_start = self:health_degen_settings()
				self.wounded_degen_timer = t + degen_start
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
end

PlayerUnitHealthExtension.die = function (self, damage_type)
	if not self.is_server then
		return
	end

	damage_type = damage_type or "undefined"
	local unit = self.unit

	if self.is_bot and damage_type == "volume_insta_kill" then
		local blackboard = BLACKBOARDS[unit]
		local nav_world = blackboard.nav_world
		local side = Managers.state.side.side_by_unit[unit]
		local PLAYER_POSITIONS = side.PLAYER_POSITIONS
		local num_player_positions = #PLAYER_POSITIONS

		for i = 1, num_player_positions, 1 do
			local player_position = PLAYER_POSITIONS[i]
			local position = LocomotionUtils.new_random_goal_uniformly_distributed(nav_world, nil, player_position, 2, 5, 5)

			if position then
				blackboard.locomotion_extension:teleport_to(position)
				blackboard.navigation_extension:teleport(position)
				blackboard.ai_extension:clear_failed_paths()

				return
			end
		end
	end

	if self.state ~= "dead" then
		local game = self.game
		local game_object_id = self.health_game_object_id

		if game and game_object_id then
			GameSession.set_game_object_field(game, game_object_id, "current_health", 0)
			GameSession.set_game_object_field(game, game_object_id, "current_temporary_health", 0)

			local death_system = Managers.state.entity:system("death_system")

			death_system:forced_kill(unit, damage_type)
		end
	end
end

PlayerUnitHealthExtension.entered_kill_volume = function (self, t)
	if self.is_local_player then
		local unit_id = self.unit_storage:go_id(self.unit)

		if unit_id then
			local network_transmit = self.network_transmit
			local damage_type_id = NetworkLookup.damage_types.volume_insta_kill

			network_transmit:send_rpc_server("rpc_request_insta_kill", unit_id, damage_type_id)
		end
	end
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

		if game and game_object_id then
			local max_health = GameSession.game_object_field(game, game_object_id, "max_health")

			GameSession.set_game_object_field(game, game_object_id, "current_health", max_health)
			GameSession.set_game_object_field(game, game_object_id, "current_temporary_health", 0)
		end
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

		if max_health == 0 then
			return 0
		else
			return (health + temporary_health) / max_health
		end
	end

	return 1
end

PlayerUnitHealthExtension.current_permanent_health_percent = function (self)
	local game = self.game
	local game_object_id = self.health_game_object_id

	if game and game_object_id then
		local health = GameSession.game_object_field(game, game_object_id, "current_health")
		local max_health = GameSession.game_object_field(game, game_object_id, "max_health")

		if max_health == 0 then
			return 0
		else
			return health / max_health
		end
	end

	return 1
end

PlayerUnitHealthExtension.current_temporary_health_percent = function (self)
	local game = self.game
	local game_object_id = self.health_game_object_id

	if game and game_object_id then
		local temporary_health = GameSession.game_object_field(game, game_object_id, "current_temporary_health")
		local max_health = GameSession.game_object_field(game, game_object_id, "max_health")

		if max_health == 0 then
			return 0
		else
			return temporary_health / max_health
		end
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

	local max_health = self:_calculate_max_health()
	max_health = DamageUtils.networkify_health(max_health)

	return max_health
end

PlayerUnitHealthExtension.current_permanent_health = function (self)
	local game = self.game
	local game_object_id = self.health_game_object_id

	if game and game_object_id then
		local health = GameSession.game_object_field(game, game_object_id, "current_health")

		return health
	end

	local max_health = self:_calculate_max_health()
	max_health = DamageUtils.networkify_health(max_health)

	return max_health
end

PlayerUnitHealthExtension.current_temporary_health = function (self)
	local game = self.game
	local game_object_id = self.health_game_object_id

	if game and game_object_id then
		local temporary_health = GameSession.game_object_field(game, game_object_id, "current_temporary_health")

		return temporary_health
	end

	local max_health = self:_calculate_max_health()
	max_health = DamageUtils.networkify_health(max_health)

	return max_health
end

PlayerUnitHealthExtension.get_max_health = function (self)
	local game = self.game
	local game_object_id = self.health_game_object_id

	if game and game_object_id then
		local max_health = GameSession.game_object_field(game, game_object_id, "max_health")

		return max_health
	end

	local max_health = self:_calculate_max_health()
	max_health = DamageUtils.networkify_health(max_health)

	return max_health
end

PlayerUnitHealthExtension.get_base_max_health = function (self)
	local base_health = self:_get_base_max_health()

	return base_health
end

PlayerUnitHealthExtension.get_uncursed_max_health = function (self)
	local game = self.game
	local game_object_id = self.health_game_object_id

	if game and game_object_id then
		local uncursed_max_health = GameSession.game_object_field(game, game_object_id, "uncursed_max_health")

		return uncursed_max_health
	end

	local max_health = self:_calculate_max_health()
	max_health = DamageUtils.networkify_health(max_health)

	return max_health
end

PlayerUnitHealthExtension.get_damage_taken = function (self, max_health_go_field)
	local game = self.game
	local game_object_id = self.health_game_object_id

	if game and game_object_id then
		local health = GameSession.game_object_field(game, game_object_id, "current_health")
		local max_health = GameSession.game_object_field(game, game_object_id, max_health_go_field or "max_health")

		return max_health - health
	end

	return 0
end

PlayerUnitHealthExtension.convert_permanent_to_temporary_health = function (self)
	local game = self.game
	local game_object_id = self.health_game_object_id

	if game and game_object_id then
		local health = GameSession.game_object_field(game, game_object_id, "current_health")
		local temporary_health = GameSession.game_object_field(game, game_object_id, "current_temporary_health")

		GameSession.set_game_object_field(game, game_object_id, "current_health", 0)
		GameSession.set_game_object_field(game, game_object_id, "current_temporary_health", health + temporary_health)
	end
end

PlayerUnitHealthExtension.convert_temporary_to_permanent_health = function (self)
	local game = self.game
	local game_object_id = self.health_game_object_id

	if game and game_object_id then
		local health = GameSession.game_object_field(game, game_object_id, "current_health")
		local temporary_health = GameSession.game_object_field(game, game_object_id, "current_temporary_health")

		GameSession.set_game_object_field(game, game_object_id, "current_health", health + temporary_health)
		GameSession.set_game_object_field(game, game_object_id, "current_temporary_health", 0)
	end
end

PlayerUnitHealthExtension.convert_to_temp = function (self, amount)
	amount = DamageUtils.networkify_damage(amount)

	if self.is_server then
		local game = self.game
		local game_object_id = self.health_game_object_id

		if game and game_object_id then
			local health = GameSession.game_object_field(game, game_object_id, "current_health")
			local temporary_health = GameSession.game_object_field(game, game_object_id, "current_temporary_health")
			local convert_amount = math.min(health, amount)

			GameSession.set_game_object_field(game, game_object_id, "current_health", health - convert_amount)
			GameSession.set_game_object_field(game, game_object_id, "current_temporary_health", temporary_health + convert_amount)
		end
	else
		local unit_id = self.unit_storage:go_id(self.unit)

		if unit_id then
			self.network_transmit:send_rpc_server("rpc_request_convert_temp", unit_id, amount)
		end
	end
end

PlayerUnitHealthExtension.switch_permanent_and_temporary_health = function (self)
	local game = self.game
	local game_object_id = self.health_game_object_id

	if game and game_object_id then
		local health = GameSession.game_object_field(game, game_object_id, "current_health")
		local temporary_health = GameSession.game_object_field(game, game_object_id, "current_temporary_health")

		GameSession.set_game_object_field(game, game_object_id, "current_health", temporary_health)
		GameSession.set_game_object_field(game, game_object_id, "current_temporary_health", health)
	end
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

	local unit = self.unit

	if ScriptUnit.has_extension(unit, "dialogue_system") then
		local death_discover_distance = DialogueSettings.death_discover_distance
		local player_profile = ScriptUnit.extension(unit, "dialogue_system").context.player_profile

		SurroundingAwareSystem.add_event(unit, "player_death", death_discover_distance, "target", unit, "target_name", player_profile)
	end

	local recent_damages = self:recent_damages()
	local player = Managers.player:owner(unit)
	local stats_id = player:stats_id()

	Managers.state.event:trigger("on_player_death", stats_id, unit, recent_damages)
end

PlayerUnitHealthExtension.set_max_health = function (self, health)
	return
end

PlayerUnitHealthExtension.set_current_damage = function (self, damage)
	return
end

PlayerUnitHealthExtension.health_degen_settings = function (self)
	local buff_extension = self.buff_extension
	local degen_amount = PlayerUnitStatusSettings.NOT_WOUNDED_DEGEN_AMOUNT
	local degen_delay = PlayerUnitStatusSettings.NOT_WOUNDED_DEGEN_DELAY
	local degen_start = PlayerUnitStatusSettings.NOT_WOUNDED_DEGEN_START

	if buff_extension then
		if buff_extension:has_buff_perk("smiter_healing") then
			degen_amount = PlayerUnitStatusSettings.SMITER_DEGEN_AMOUNT
			degen_delay = PlayerUnitStatusSettings.SMITER_DEGEN_DELAY
			degen_start = PlayerUnitStatusSettings.SMITER_DEGEN_START
		elseif buff_extension:has_buff_perk("linesman_healing") then
			degen_amount = PlayerUnitStatusSettings.LINESMAN_DEGEN_AMOUNT
			degen_delay = PlayerUnitStatusSettings.LINESMAN_DEGEN_DELAY
			degen_start = PlayerUnitStatusSettings.LINESMAN_DEGEN_START
		elseif buff_extension:has_buff_perk("tank_healing") then
			degen_amount = PlayerUnitStatusSettings.TANK_DEGEN_AMOUNT
			degen_delay = PlayerUnitStatusSettings.TANK_DEGEN_DELAY
			degen_start = PlayerUnitStatusSettings.TANK_DEGEN_START
		elseif buff_extension:has_buff_perk("ninja_healing") then
			degen_amount = PlayerUnitStatusSettings.NINJA_DEGEN_AMOUNT
			degen_delay = PlayerUnitStatusSettings.NINJA_DEGEN_DELAY
			degen_start = PlayerUnitStatusSettings.NINJA_DEGEN_START
		end
	end

	if Managers.weave:get_active_wind() == "death" then
		degen_amount = degen_amount * 2
		degen_start = 0
	end

	return degen_amount, degen_delay, degen_start
end

return
