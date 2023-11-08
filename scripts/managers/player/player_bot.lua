require("scripts/managers/player/bulldozer_player")

PlayerBot = class(PlayerBot, BulldozerPlayer)
EnergyData = EnergyData or {}
local BOT_COLORS = {
	bright_wizard = QuaternionBox(255, 255, 127, 0),
	witch_hunter = QuaternionBox(255, 255, 215, 0),
	dwarf_ranger = QuaternionBox(255, 125, 125, 200),
	wood_elf = QuaternionBox(255, 50, 205, 50),
	empire_soldier = QuaternionBox(255, 220, 20, 60)
}

PlayerBot.init = function (self, network_manager, player_name, bot_profile_name, is_server, profile_index, career_index, local_player_id, unique_id, ui_id, account_id)
	self.player_name = player_name
	self.bot_profile = PlayerBots[bot_profile_name]
	self._profile_index = profile_index
	self._career_index = career_index
	self.game_object_id = nil
	self.owned_units = {}
	self.bot_player = true
	self.is_server = is_server
	self.peer_id = Network.peer_id()
	self.color = BOT_COLORS[player_name]
	self.viewport_name = player_name
	self.network_manager = network_manager
	local profile = SPProfiles[self._profile_index]
	self.character_name = Localize(profile.character_name)
	self._local_player_id = local_player_id
	self._telemetry_id = "Bot_" .. local_player_id
	self._unique_id = unique_id
	self._ui_id = ui_id
	self._account_id = account_id
	self._spawn_state = "despawned"
end

PlayerBot.profile_index = function (self)
	return self._profile_index
end

PlayerBot.career_index = function (self)
	return self._career_index
end

PlayerBot.stats_id = function (self)
	return self._unique_id
end

PlayerBot.ui_id = function (self)
	return self._ui_id
end

PlayerBot.local_player_id = function (self)
	return self._local_player_id
end

PlayerBot.unique_id = function (self)
	return self._unique_id
end

PlayerBot.platform_id = function (self)
	ferror("Not implemented")
end

PlayerBot.type = function (self)
	return "PlayerBot"
end

PlayerBot.is_player_controlled = function (self)
	return false
end

PlayerBot.set_player_unit = function (self, unit)
	self.player_unit = unit
end

PlayerBot.profile_display_name = function (self)
	local profile = SPProfiles[self._profile_index]
	local display_name = profile and profile.display_name

	return display_name
end

PlayerBot.despawn = function (self)
	self:_set_spawn_state("despawned")

	local player_unit = self.player_unit

	if Unit.alive(player_unit) then
		Managers.state.unit_spawner:mark_for_deletion(player_unit)
		Managers.telemetry_events:player_despawned(self)
	else
		print("player_bot was already despawned. Should not happen.")
	end
end

PlayerBot.name = function (self)
	return self.character_name
end

PlayerBot.telemetry_id = function (self)
	return self._telemetry_id
end

PlayerBot.spawn = function (self, position, rotation, is_initial_spawn, ammo_melee, ammo_ranged, healthkit, potion, grenade, ability_cooldown_percent_int, additional_items)
	local profile_index = self._profile_index
	local profile = SPProfiles[profile_index]
	local career_index = self:career_index()
	local career = profile.careers[career_index]

	fassert(profile, "[SpawnManager] Trying to spawn with profile %q that doesn't exist in %q.", profile_index, "SPProfiles")

	local nav_world = Managers.state.entity:system("ai_system"):nav_world()
	local difficulty_manager = Managers.state.difficulty
	local difficulty_settings = difficulty_manager:get_difficulty_settings()
	local player_health = difficulty_settings.max_hp
	local game_mode_manager = Managers.state.game_mode
	local player_wounds = game_mode_manager:get_player_wounds(profile)
	local character_state_class_list = {}

	for _, character_state_name in ipairs(career.character_state_list) do
		character_state_class_list[#character_state_class_list + 1] = rawget(_G, character_state_name)
	end

	local initial_inventory = game_mode_manager:get_initial_inventory(healthkit, potion, grenade, additional_items, profile)
	local hero_name = profile.display_name
	local base_skin = career.base_skin
	local base_frame = "default"
	local career_name = career.name
	local skin_item = BackendUtils.get_loadout_item(career_name, "slot_skin")
	local skin_name = skin_item and skin_item.data.name or base_skin
	local skin_data = Cosmetics[skin_name]
	local frame_item = BackendUtils.get_loadout_item(career_name, "slot_frame")
	local frame_name = frame_item and frame_item.data.name or base_frame
	local overcharge_data = OverchargeData[career_name] or {}
	local energy_data = EnergyData[career_name] or {}
	local status = Managers.party:get_status_from_unique_id(self._unique_id)
	local party = Managers.party:get_party(status.party_id)
	local side = Managers.state.side.side_by_party[party]
	local breed = career.breed or profile.breed
	local extension_init_data = {
		ai_system = {
			player = self,
			bot_profile = self.bot_profile,
			nav_world = nav_world
		},
		ai_bot_group_system = {
			initial_inventory = initial_inventory,
			side = side
		},
		input_system = {
			player = self
		},
		character_state_machine_system = {
			start_state = "standing",
			nav_world = nav_world,
			character_state_class_list = character_state_class_list,
			player = self
		},
		health_system = {
			player = self,
			profile_index = profile_index,
			career_index = career_index
		},
		status_system = {
			wounds = player_wounds,
			profile_id = profile_index,
			player = self
		},
		hit_reaction_system = {
			is_husk = false,
			hit_reaction_template = "player"
		},
		death_system = {
			death_reaction_template = "player",
			is_husk = false
		},
		inventory_system = {
			profile = profile,
			initial_inventory = initial_inventory,
			player = self,
			ammo_percent = {
				slot_melee = ammo_melee,
				slot_ranged = ammo_ranged
			}
		},
		locomotion_system = {
			player = self
		},
		camera_system = {
			player = self
		},
		dialogue_context_system = {
			profile = profile
		},
		dialogue_system = {
			wwise_career_switch_group = "player_career",
			faction = "player",
			wwise_voice_switch_group = "character",
			profile = profile,
			wwise_voice_switch_value = profile.character_vo,
			wwise_career_switch_value = career_name
		},
		first_person_system = {
			profile = profile,
			skin_name = skin_name
		},
		ai_navigation_system = {
			nav_world = nav_world
		},
		whereabouts_system = {
			player = self
		},
		aim_system = {
			is_husk = false,
			template = "player"
		},
		attachment_system = {
			profile = profile,
			player = self
		},
		cosmetic_system = {
			profile = profile,
			skin_name = skin_name,
			frame_name = frame_name,
			player = self
		},
		buff_system = {
			is_husk = false
		},
		statistics_system = {
			template = "player",
			statistics_id = self.peer_id
		},
		ai_slot_system = {
			profile_index = profile_index
		},
		talent_system = {
			player = self,
			profile_index = profile_index
		},
		career_system = {
			player = self,
			profile_index = profile_index,
			career_index = career_index,
			ability_cooldown_percent_int = ability_cooldown_percent_int
		},
		overcharge_system = {
			overcharge_data = overcharge_data
		},
		energy_system = {
			energy_data = energy_data
		},
		aggro_system = {
			side = side
		},
		proximity_system = {
			side = side,
			breed = breed
		},
		target_override_system = {
			side = side
		},
		ai_commander_system = {
			player = self
		}
	}
	local unit_template_name = "player_bot_unit"
	local unit_name = skin_data.third_person
	local unit = self:spawn_unit(unit_name, extension_init_data, unit_template_name, position, rotation)

	ScriptUnit.extension(unit, "attachment_system"):show_attachments(true)
	Unit.set_data(unit, "sound_character", career.sound_character)
	Unit.create_actor(unit, "bot_collision", false)

	local level_settings = LevelHelper:current_level_settings()
	local climate_type = level_settings.climate_type or "default"

	Unit.set_flow_variable(unit, "climate_type", climate_type)
	Unit.flow_event(unit, "climate_type_set")

	if self.is_server then
		local health_extension = ScriptUnit.extension(unit, "health_system")

		health_extension:create_health_game_object()
	end

	self:_set_spawn_state("spawned")
	Managers.telemetry_events:player_spawned(self)

	return unit
end

PlayerBot.create_game_object = function (self)
	local game_object_data_table = {
		ping = 0,
		player_controlled = false,
		go_type = NetworkLookup.go_types.player,
		network_id = self:network_id(),
		local_player_id = self:local_player_id(),
		account_id = self.peer_id
	}
	local callback = callback(self, "cb_game_session_disconnect")
	local game_object_id = Managers.state.network:create_player_game_object("bot_player", game_object_data_table, callback)
	self.game_object_id = game_object_id

	self:create_sync_data()
end

PlayerBot.destroy = function (self)
	if self.is_server and self.game_object_id then
		Managers.state.network:destroy_game_object(self.game_object_id)
	end

	if self._player_sync_data then
		self._player_sync_data:destroy()
	end
end
