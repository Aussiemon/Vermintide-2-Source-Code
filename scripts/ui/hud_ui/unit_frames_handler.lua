require("scripts/settings/ui_player_portrait_frame_settings")
require("scripts/ui/hud_ui/unit_frame_ui")

local allowed_consumable_slots = {
	slot_healthkit = true,
	slot_grenade = true,
	slot_potion = true
}
local allowed_weapon_slots = {
	slot_ranged = true,
	slot_melee = true
}
local NUM_PARTY_MEMBERS = 3
UnitFramesHandler = class(UnitFramesHandler)

UnitFramesHandler.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.ingame_ui_context = ingame_ui_context
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self.peer_id = ingame_ui_context.peer_id
	self.profile_synchronizer = ingame_ui_context.profile_synchronizer
	self.player_manager = ingame_ui_context.player_manager
	self.lobby = ingame_ui_context.network_lobby
	self.my_player = ingame_ui_context.player
	self.cleanui = ingame_ui_context.cleanui
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local server_peer_id = network_transmit.server_peer_id
	self.host_peer_id = server_peer_id or network_transmit.peer_id
	local party_manager = Managers.party
	local local_player_id = 1
	local player_status = party_manager:get_player_status(self.peer_id, local_player_id)
	local party_id = player_status.party_id
	local party = party_manager:get_party(party_id)
	local side = Managers.state.side.side_by_party[party]
	self.platform = PLATFORM
	self._unit_frames = {}
	self._unit_frame_index_by_ui_id = {}
	self.unit_frame_by_player = {}

	self:_create_player_unit_frame()
	self:_create_party_members_unit_frames()

	local event_manager = Managers.state.event

	event_manager:register(self, "add_damage_feedback_event", "add_damage_feedback_event")
	event_manager:register(self, "add_respawn_counter_event", "add_respawn_counter_event")

	self._current_frame_index = 1
end

UnitFramesHandler.add_damage_feedback_event = function (self, hash, is_local_player, event_type, attacker_player, target_player, damage_amount)
	local unit_frame = self.unit_frame_by_player[attacker_player]

	if unit_frame then
		local widget = unit_frame.widget

		widget:add_damage_feedback(hash, is_local_player, event_type, attacker_player, target_player, damage_amount)
	end
end

UnitFramesHandler.add_respawn_counter_event = function (self, player, is_local_player, respawn_time)
	local unit_frame = self.unit_frame_by_player[player]

	if unit_frame then
		local widget = unit_frame.widget

		widget:show_respawn_countdown(player, is_local_player, respawn_time)
	end
end

UnitFramesHandler.unit_frame_amount = function (self)
	return #self._unit_frames
end

UnitFramesHandler.get_unit_widget = function (self, index)
	return self._unit_frames[index].widget
end

local function get_portrait_name_by_profile_index(profile_index, career_index)
	local profile_data = SPProfiles[profile_index]
	local careers = profile_data.careers
	local career_settings = careers[career_index]
	local portrait_image = career_settings.portrait_image

	return portrait_image
end

UnitFramesHandler._create_player_unit_frame = function (self)
	local player = self.my_player
	local player_ui_id = player:ui_id()
	local player_data = {
		player_ui_id = player_ui_id,
		player = player,
		own_player = true
	}
	local peer_id = player:network_id()
	player_data.peer_id = peer_id
	local local_player_id = player:local_player_id()
	player_data.local_player_id = local_player_id
	local unit_frame = self:_create_unit_frame_by_type("player")
	unit_frame.player_data = player_data
	unit_frame.sync = true
	self._unit_frames[1] = unit_frame
	self.unit_frame_by_player[player] = unit_frame
	self._unit_frame_index_by_ui_id[player_ui_id] = 1
end

UnitFramesHandler._create_party_members_unit_frames = function (self)
	local unit_frames = self._unit_frames

	for i = 1, NUM_PARTY_MEMBERS, 1 do
		local unit_frame = self:_create_unit_frame_by_type("team", i)
		unit_frames[#unit_frames + 1] = unit_frame
	end

	self:_align_party_member_frames()
end

UnitFramesHandler._create_unit_frame_by_type = function (self, frame_type, frame_index)
	local ingame_ui_context = self.ingame_ui_context
	local unit_frame = {}
	local state_data = {}
	local player_data = {}
	local definitions = nil

	if frame_type == "team" then
		definitions = local_require("scripts/ui/hud_ui/team_member_unit_frame_ui_definitions")
	elseif frame_type == "player" then
		local gamepad_active = self.input_manager:is_device_active("gamepad") or PLATFORM ~= "win32"
		local should_use_game_pad = self.platform ~= "win32" or ((gamepad_active or UISettings.use_gamepad_hud_layout == "always") and UISettings.use_gamepad_hud_layout ~= "never")

		if should_use_game_pad then
			definitions = local_require("scripts/ui/hud_ui/player_console_unit_frame_ui_definitions")
			unit_frame.gamepad_version = true
		else
			definitions = local_require("scripts/ui/hud_ui/player_unit_frame_ui_definitions")
		end
	else
		definitions = local_require("scripts/ui/hud_ui/team_member_unit_frame_ui_definitions")
	end

	unit_frame.data = state_data
	unit_frame.player_data = player_data
	unit_frame.definitions = definitions
	unit_frame.features_list = definitions.features_list
	unit_frame.widget_name_by_feature = definitions.widget_name_by_feature
	unit_frame.widget = UnitFrameUI:new(ingame_ui_context, definitions, state_data, frame_index, player_data, frame_type)

	return unit_frame
end

UnitFramesHandler._get_unused_unit_frame = function (self)
	local unit_frames = self._unit_frames

	for i = 1, #unit_frames, 1 do
		local unit_frame = unit_frames[i]
		local player_data = unit_frame.player_data

		if not player_data.peer_id and not player_data.connecting_peer_id then
			return unit_frame, i
		end
	end
end

UnitFramesHandler._get_unit_frame_by_connecting_peer_id = function (self, peer_id)
	local unit_frames = self._unit_frames

	for i = 1, #unit_frames, 1 do
		local unit_frame = unit_frames[i]

		if unit_frame.player_data.connecting_peer_id == peer_id then
			return unit_frame, i
		end
	end
end

UnitFramesHandler._reset_unit_frame = function (self, unit_frame)
	local widget = unit_frame.widget

	widget:reset()
	table.clear(unit_frame.player_data)
	table.clear(unit_frame.data)

	unit_frame.sync = false
end

UnitFramesHandler.get_frame_by_player = function (self, player)
	local unit_frames = self._unit_frames
	local unit_frame_index_by_ui_id = self.unit_frame_index_by_ui_id
	local unit_frames_used_by_players = 0
end

local temp_active_ui_ids = {}
local temp_active_peer_ids = {}
local temp_connecting_peer_ids = {}

UnitFramesHandler._handle_unit_frame_assigning = function (self)
	local player_manager = self.player_manager
	local players = player_manager:human_and_bot_players()
	local unit_frame_index_by_ui_id = self._unit_frame_index_by_ui_id
	local unit_frames_used_by_players = 0
	local my_player = self.my_player
	local my_peer_id = my_player:network_id()
	local my_local_peer_id = my_player:local_player_id()

	table.clear(temp_active_ui_ids)
	table.clear(temp_active_peer_ids)

	local party = Managers.party:get_party_from_player_id(my_peer_id, my_local_peer_id)
	local frames_changed = false

	if party then
		local occupied_slots = party.occupied_slots

		for i = 1, #occupied_slots, 1 do
			local status = occupied_slots[i]
			local player_peer_id = status.peer_id
			local local_player_id = status.local_player_id
			local player = player_manager:player(player_peer_id, local_player_id)

			if player then
				local player_ui_id = player:ui_id()
				temp_active_ui_ids[player_ui_id] = true
				temp_active_peer_ids[player_peer_id] = true
				local own_player = player == my_player

				if not own_player then
					if not unit_frame_index_by_ui_id[player_ui_id] then
						local add_unit_frame = true
						local game_mode_key = Managers.state.game_mode:game_mode_key()

						if game_mode_key == "tutorial" then
							local play_go_tutorial_system = Managers.state.entity:system("play_go_tutorial_system")
							add_unit_frame = play_go_tutorial_system:bot_portrait_enabled(player)
						end

						if add_unit_frame then
							local avaiable_unit_frame, unit_frame_index = self:_get_unit_frame_by_connecting_peer_id(player_peer_id)

							if not avaiable_unit_frame then
								avaiable_unit_frame, unit_frame_index = self:_get_unused_unit_frame()
							end

							if avaiable_unit_frame then
								unit_frame_index_by_ui_id[player_ui_id] = unit_frame_index

								table.clear(avaiable_unit_frame.data)

								local player_data = {
									player_ui_id = player_ui_id,
									player = player,
									own_player = own_player,
									peer_id = player_peer_id,
									local_player_id = local_player_id
								}
								avaiable_unit_frame.player_data = player_data
								avaiable_unit_frame.sync = true
								frames_changed = true

								if player:is_player_controlled() then
									unit_frames_used_by_players = unit_frames_used_by_players + 1
								end

								self.unit_frame_by_player[player] = avaiable_unit_frame
							end
						end
					elseif player:is_player_controlled() then
						unit_frames_used_by_players = unit_frames_used_by_players + 1
					end
				end
			end
		end
	end

	local mechanism_name = Managers.mechanism:current_mechanism_name()

	if mechanism_name == "adventure" and self:_handle_connecting_peers(temp_active_peer_ids, unit_frames_used_by_players) then
		frames_changed = true
	end

	if self:_cleanup_unused_unit_frames(temp_active_ui_ids, temp_connecting_peer_ids) then
		frames_changed = true
	end

	if frames_changed then
		self:_align_party_member_frames()
	end
end

UnitFramesHandler._handle_connecting_peers = function (self, active_peer_ids, num_unit_frames_used)
	local added_connection = false

	table.clear(temp_connecting_peer_ids)

	if num_unit_frames_used < 3 then
		local members = self.lobby:members()

		if members then
			local lobby_members = members:get_members()

			for i = 1, #lobby_members, 1 do
				local peer_id = lobby_members[i]

				if not active_peer_ids[peer_id] then
					local unit_frame = self:_get_unit_frame_by_connecting_peer_id(peer_id)

					if not unit_frame then
						local avaiable_unit_frame, _ = self:_get_unused_unit_frame()

						if avaiable_unit_frame then
							self:_reset_unit_frame(avaiable_unit_frame)

							avaiable_unit_frame.player_data = {
								connecting_peer_id = peer_id
							}
							added_connection = true
						end
					end

					temp_connecting_peer_ids[peer_id] = true
					num_unit_frames_used = num_unit_frames_used + 1

					if num_unit_frames_used == 3 then
						break
					end
				end
			end
		end
	end

	return added_connection
end

UnitFramesHandler._cleanup_unused_unit_frames = function (self, active_ui_ids, connecting_peer_ids)
	local frames_cleared = false
	local unit_frames = self._unit_frames

	for i = 1, #unit_frames, 1 do
		local unit_frame = unit_frames[i]
		local player_data = unit_frame.player_data
		local player_ui_id = player_data.player_ui_id
		local connecting_peer_id = player_data.connecting_peer_id
		local clear_unit_frame = (connecting_peer_id and not connecting_peer_ids[connecting_peer_id]) or (player_ui_id and not active_ui_ids[player_ui_id])

		if clear_unit_frame then
			self:_reset_unit_frame(unit_frame)

			frames_cleared = true

			if player_ui_id then
				self._unit_frame_index_by_ui_id[player_ui_id] = nil
			end
		end
	end

	return frames_cleared
end

UnitFramesHandler._align_party_member_frames = function (self)
	local start_offset_y = -100
	local start_offset_x = 80
	local spacing = 220
	local is_visible = self._is_visible
	local count = 0
	local unit_frames = self._unit_frames

	for i = 2, #unit_frames, 1 do
		local unit_frame = unit_frames[i]
		local widget = unit_frame.widget
		local player_data = unit_frame.player_data
		local peer_id = player_data.peer_id
		local connecting_peer_id = player_data.connecting_peer_id

		if (peer_id or connecting_peer_id) and is_visible then
			local position_x = start_offset_x
			local position_y = start_offset_y - count * spacing

			widget:set_position(position_x, position_y)

			count = count + 1

			widget:set_visible(true)
		else
			widget:set_visible(false)
		end
	end
end

local function get_ammunition_count(left_hand_wielded_unit, right_hand_wielded_unit, item_template)
	local ammo_extension = nil

	if not item_template.ammo_data then
		return
	end

	local ammo_unit_hand = item_template.ammo_data.ammo_hand

	if ammo_unit_hand == "right" then
		ammo_extension = ScriptUnit.extension(right_hand_wielded_unit, "ammo_system")
	elseif ammo_unit_hand == "left" then
		ammo_extension = ScriptUnit.extension(left_hand_wielded_unit, "ammo_system")
	else
		return
	end

	local ammo_count = ammo_extension:ammo_count()
	local remaining_ammo = ammo_extension:remaining_ammo()
	local single_clip = ammo_extension:using_single_clip()
	local max_ammo = ammo_extension:max_ammo()

	return ammo_count, remaining_ammo, max_ammo, single_clip
end

local function get_overcharge_amount(unit)
	local overcharge_extension = ScriptUnit.extension(unit, "overcharge_system")
	local overcharge_fraction = overcharge_extension:overcharge_fraction()
	local threshold_fraction = overcharge_extension:threshold_fraction()
	local anim_blend_overcharge = overcharge_extension:get_anim_blend_overcharge()

	return true, overcharge_fraction, threshold_fraction, anim_blend_overcharge
end

UnitFramesHandler._set_player_extensions = function (self, player_data, player_unit)
	local extensions = {
		career = ScriptUnit.extension(player_unit, "career_system"),
		health = ScriptUnit.extension(player_unit, "health_system"),
		status = ScriptUnit.extension(player_unit, "status_system"),
		inventory = ScriptUnit.extension(player_unit, "inventory_system"),
		buff = ScriptUnit.extension(player_unit, "buff_system")
	}
	player_data.extensions = extensions
	player_data.player_unit = player_unit
end

local empty_features_list = {}

UnitFramesHandler._sync_player_stats = function (self, unit_frame)
	if not unit_frame.sync then
		return
	end

	local player_data = unit_frame.player_data
	local player = player_data.player

	if not player then
		return
	end

	local gamepad_active = Managers.input:is_device_active("gamepad")
	local peer_id = player_data.peer_id
	local local_player_id = player_data.local_player_id
	local data = unit_frame.data
	local widget = unit_frame.widget
	local profile_synchronizer = self.profile_synchronizer

	if not player_data.extensions then
		local player_unit = player.player_unit

		if player_unit then
			self:_set_player_extensions(player_data, player_unit)
		end
	end

	local profile_index = profile_synchronizer:profile_by_peer(peer_id, local_player_id)

	if not profile_index then
		return
	end

	local health_percent, total_health_percent, active_percentage, is_knocked_down, needs_help, is_wounded, is_ready_for_assisted_respawn = nil
	local is_talking = false
	local player_unit = player_data.player_unit

	if (not player_unit or not Unit.alive(player_unit)) and player_data.extensions then
		player_data.extensions = nil
	end

	local go_id = Managers.state.unit_storage:go_id(player_unit)
	local network_manager = Managers.state.network
	local game = network_manager:game()
	local ability_cooldown_percentage = 0
	local extensions = player_data.extensions
	local equipment, career_index = nil

	if extensions then
		local career_extension = extensions.career
		local buff_extension = extensions.buff
		local status_extension = extensions.status
		local health_extension = extensions.health
		local inventory_extension = extensions.inventory

		if status_extension:is_dead() then
			total_health_percent = 0
		else
			total_health_percent = health_extension:current_health_percent()
		end

		if status_extension:is_dead() then
			health_percent = 0
		else
			health_percent = health_extension:current_permanent_health_percent()
		end

		is_wounded = status_extension:is_wounded()
		is_knocked_down = (status_extension:is_knocked_down() or status_extension:get_is_ledge_hanging()) and total_health_percent > 0
		is_ready_for_assisted_respawn = status_extension:is_ready_for_assisted_respawn()
		needs_help = status_extension:is_grabbed_by_pack_master() or status_extension:is_hanging_from_hook() or status_extension:is_pounced_down() or status_extension:is_grabbed_by_corruptor() or status_extension:is_in_vortex() or status_extension:is_grabbed_by_chaos_spawn()
		local num_grimoires = buff_extension:num_buff_perk("skaven_grimoire")
		local multiplier = buff_extension:apply_buffs_to_value(PlayerUnitDamageSettings.GRIMOIRE_HEALTH_DEBUFF, "curse_protection")
		local num_twitch_grimoires = buff_extension:num_buff_perk("twitch_grimoire")
		local twitch_multiplier = PlayerUnitDamageSettings.GRIMOIRE_HEALTH_DEBUFF
		local num_slayer_curses = buff_extension:num_buff_perk("slayer_curse")
		local slayer_curse_multiplier = buff_extension:apply_buffs_to_value(PlayerUnitDamageSettings.SLAYER_CURSE_HEALTH_DEBUFF, "curse_protection")
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local num_mutator_curses = buff_extension:num_buff_perk("mutator_curse")
		local mutator_curse_multiplier = buff_extension:apply_buffs_to_value(WindSettings.light.curse_settings.value[difficulty_name], "curse_protection")
		active_percentage = 1 + num_grimoires * multiplier + num_twitch_grimoires * twitch_multiplier + num_slayer_curses * slayer_curse_multiplier + num_mutator_curses * mutator_curse_multiplier
		equipment = inventory_extension:equipment()
		career_index = career_extension:career_index()

		if game and go_id then
			ability_cooldown_percentage = GameSession.game_object_field(game, go_id, "ability_percentage") or 0
		end
	else
		health_percent = 0
		total_health_percent = 0
		active_percentage = 1
		is_knocked_down = false
	end

	local is_dead = total_health_percent <= 0
	local is_player_controlled = player:is_player_controlled()
	local display_name = UIRenderer.crop_text(player:name(), 17)
	local level_text = (is_player_controlled and (ExperienceSettings.get_player_level(player) or "")) or UISettings.bots_level_display_text
	local portrait_texture = (career_index and get_portrait_name_by_profile_index(profile_index, career_index)) or "unit_frame_portrait_default"
	local frame_texture = Managers.state.entity:system("cosmetic_system"):get_equipped_frame(player_unit)
	local is_player_server = self.host_peer_id == peer_id
	local is_host = is_player_controlled and is_player_server
	local show_icon = false
	local connecting = false

	if is_knocked_down then
		show_icon = false
	elseif is_dead or is_ready_for_assisted_respawn or needs_help then
		show_icon = true
	end

	local dirty = false
	local update_portrait_status = false
	local update_health_bar_status = false

	if data.connecting ~= connecting then
		data.connecting = connecting

		widget:set_connecting_status(connecting)
	end

	if data.is_knocked_down ~= is_knocked_down then
		data.is_knocked_down = is_knocked_down
		update_portrait_status = true
		update_health_bar_status = true
	end

	if data.is_dead ~= is_dead then
		data.is_dead = is_dead
		update_health_bar_status = true
		update_portrait_status = true
	end

	if data.is_wounded ~= is_wounded then
		data.is_wounded = is_wounded
		update_health_bar_status = true
	end

	if data.needs_help ~= needs_help then
		data.needs_help = needs_help
		update_portrait_status = true
	end

	if data.is_talking ~= is_talking then
		data.is_talking = is_talking

		widget:set_talking(is_talking)

		dirty = true
	end

	if data.show_icon ~= show_icon then
		data.show_icon = show_icon

		widget:set_icon_visibility(show_icon)

		dirty = true
	end

	if data.assisted_respawn ~= is_ready_for_assisted_respawn then
		data.assisted_respawn = is_ready_for_assisted_respawn
		update_portrait_status = true
		dirty = true
	end

	if data.show_health_bar ~= not is_ready_for_assisted_respawn then
		data.show_health_bar = not is_ready_for_assisted_respawn
		update_health_bar_status = true
		dirty = true
	end

	if data.portrait_texture ~= portrait_texture then
		data.portrait_texture = portrait_texture

		widget:set_portrait(portrait_texture)

		dirty = true
	end

	if data.frame_texture ~= frame_texture or data.level_text ~= level_text then
		data.frame_texture = frame_texture
		data.level_text = level_text

		widget:set_portrait_frame(frame_texture, level_text)

		dirty = true
	end

	if data.display_name ~= display_name then
		data.display_name = display_name

		widget:set_player_name(display_name)

		dirty = true
	end

	if data.is_host ~= is_host then
		data.is_host = is_host

		widget:set_host_status(is_host)

		dirty = true
	end

	if update_portrait_status then
		widget:set_portrait_status(is_knocked_down, needs_help, is_dead, is_ready_for_assisted_respawn)

		dirty = true
	end

	if data.total_health_percent ~= total_health_percent or data.active_percentage ~= active_percentage then
		data.total_health_percent = total_health_percent

		widget:set_total_health_percentage(total_health_percent, active_percentage)

		dirty = true
	end

	if data.health_percent ~= health_percent or data.active_percentage ~= active_percentage then
		data.health_percent = health_percent

		widget:set_health_percentage(health_percent, active_percentage)

		dirty = true
	end

	if data.active_percentage ~= active_percentage then
		data.active_percentage = active_percentage

		widget:set_active_percentage(active_percentage)

		dirty = true
	end

	local features_list = unit_frame.features_list or empty_features_list
	local update_ability = features_list.ability

	if update_ability and data.ability_cooldown_percentage ~= ability_cooldown_percentage then
		data.ability_cooldown_percentage = ability_cooldown_percentage

		widget:set_ability_percentage(1 - ability_cooldown_percentage)

		dirty = true
	end

	local update_equipment = features_list.equipment
	local update_weapons = features_list.weapons
	local update_ammo = features_list.ammo

	if equipment and (update_equipment or update_weapons or update_ammo) then
		local wielded = equipment.wielded

		if not data.inventory_slots then
			data.inventory_slots = {}
		end

		local inventory_slots = InventorySettings.slots
		local inventory_slots_data = data.inventory_slots

		for i = 1, #inventory_slots, 1 do
			local slot = inventory_slots[i]
			local slot_name = slot.name
			local slot_data = equipment.slots[slot_name]
			local item_data = slot_data and slot_data.item_data

			if not inventory_slots_data[slot_name] then
				inventory_slots_data[slot_name] = {}
			end

			local stored_slot_data = inventory_slots_data[slot_name]

			if update_ammo and slot_name == "slot_ranged" and item_data then
				local item_template = BackendUtils.get_item_template(item_data)

				if item_template.ammo_data then
					local ammo_fraction = 1

					if game and go_id then
						ammo_fraction = GameSession.game_object_field(game, go_id, "ammo_percentage")
					end

					if stored_slot_data.ammo_fraction ~= ammo_fraction then
						widget:set_ammo_percentage(ammo_fraction)

						stored_slot_data.ammo_fraction = ammo_fraction
					end
				end
			end

			if update_equipment and allowed_consumable_slots[slot_name] then
				local slot_visible = (slot_data and true) or false
				local item_name = item_data and item_data.name

				if stored_slot_data.visible ~= slot_visible or stored_slot_data.item_name ~= item_name then
					stored_slot_data.visible = slot_visible
					stored_slot_data.item_name = item_name

					widget:set_inventory_slot_data(slot_name, slot_visible, item_data)

					dirty = true
				end
			end

			if update_weapons and allowed_weapon_slots[slot_name] and slot_data then
				local item_name = item_data.name
				local hud_icon = item_data.hud_icon
				local is_wielded = wielded == item_data

				if stored_slot_data.is_wielded ~= is_wielded or stored_slot_data.item_name ~= item_name then
					widget:set_equipped_weapon_info(slot_name, is_wielded, item_name, hud_icon)

					if stored_slot_data.item_name ~= item_name then
						stored_slot_data.no_ammo = nil
					end

					stored_slot_data.is_wielded = is_wielded
					stored_slot_data.item_name = item_name
					stored_slot_data.hud_icon = hud_icon
					dirty = true
				end

				local item_template = BackendUtils.get_item_template(item_data)

				if item_template.ammo_data then
					local ammo_count, remaining_ammo, _, using_single_clip = get_ammunition_count(slot_data.left_unit_1p, slot_data.right_unit_1p, item_template)

					if stored_slot_data.ammo_count ~= ammo_count or stored_slot_data.remaining_ammo ~= remaining_ammo or stored_slot_data.no_ammo then
						stored_slot_data.ammo_count = ammo_count
						stored_slot_data.remaining_ammo = remaining_ammo
						stored_slot_data.no_ammo = nil

						widget:set_ammo_for_slot(slot_name, ammo_count, remaining_ammo, using_single_clip)

						dirty = true
					end

					if slot_name == "slot_ranged" and stored_slot_data.overcharge_fraction then
						widget:set_overcharge_percentage(false, nil)

						stored_slot_data.overcharge_fraction = nil
					end
				else
					if not stored_slot_data.no_ammo then
						stored_slot_data.no_ammo = true
						dirty = true

						widget:set_ammo_for_slot(slot_name, nil, nil)

						stored_slot_data.overcharge_fraction = nil
						stored_slot_data.ammo_count = nil
						stored_slot_data.remaining_ammo = nil
					end

					if slot_name == "slot_ranged" then
						local has_overcharge, overcharge_fraction, _ = get_overcharge_amount(player_unit)

						if stored_slot_data.overcharge_fraction ~= overcharge_fraction then
							widget:set_overcharge_percentage(has_overcharge, overcharge_fraction)

							stored_slot_data.overcharge_fraction = overcharge_fraction
						end
					end
				end
			end
		end
	end

	if update_health_bar_status then
		local hide_health_bar = is_ready_for_assisted_respawn or is_dead

		widget:set_health_bar_status(not hide_health_bar, is_knocked_down, is_wounded)

		dirty = true
	end

	if dirty then
		widget:set_dirty()

		if self.cleanui then
			self.cleanui.dirty = true
		end
	end

	self.gamepad_was_active = gamepad_active
end

UnitFramesHandler.destroy = function (self)
	self.ui_animator = nil

	self:set_visible(false)

	local event_manager = Managers.state.event

	event_manager:unregister("add_damage_feedback_event", self)
	event_manager:unregister("add_respawn_counter_event", self)
end

UnitFramesHandler.set_visible = function (self, visible)
	self._is_visible = visible
	local parent = self._parent
	local ignore_own_player = parent:is_own_player_dead()
	local unit_frames = self._unit_frames

	for i = 1, #unit_frames, 1 do
		local unit_frame = unit_frames[i]
		local player_data = unit_frame.player_data

		if player_data.peer_id then
			if ignore_own_player and i == 1 then
				unit_frame.widget:set_visible(false)
			else
				unit_frame.widget:set_visible(visible)
			end
		elseif player_data.connecting_peer_id then
			unit_frame.widget:set_visible(visible)
		elseif not visible then
			unit_frame.widget:set_visible(false)
		end
	end
end

UnitFramesHandler.on_gamepad_activated = function (self)
	local my_unit_frame = self._unit_frames[1]

	if not my_unit_frame.gamepad_version then
		local is_visible = my_unit_frame.widget:is_visible()

		my_unit_frame.widget:destroy()

		local new_unit_frame = self:_create_unit_frame_by_type("player")
		new_unit_frame.player_data = my_unit_frame.player_data
		new_unit_frame.sync = true
		self._unit_frames[1] = new_unit_frame

		new_unit_frame.widget:set_visible(is_visible)
	end
end

UnitFramesHandler.on_gamepad_deactivated = function (self)
	local my_unit_frame = self._unit_frames[1]

	if my_unit_frame.gamepad_version then
		local is_visible = my_unit_frame.widget:is_visible()

		my_unit_frame.widget:destroy()

		local new_unit_frame = self:_create_unit_frame_by_type("player")
		new_unit_frame.player_data = my_unit_frame.player_data
		new_unit_frame.sync = true
		self._unit_frames[1] = new_unit_frame

		new_unit_frame.widget:set_visible(is_visible)
	end
end

UnitFramesHandler.update = function (self, dt, t)
	if not self._is_visible then
		return
	end

	local parent = self._parent
	local ignore_own_player = parent:is_own_player_dead()
	local gamepad_active = self.input_manager:is_device_active("gamepad") or PLATFORM ~= "win32"
	local use_game_pad = (gamepad_active or UISettings.use_gamepad_hud_layout == "always") and UISettings.use_gamepad_hud_layout ~= "never"

	if use_game_pad then
		if not self.gamepad_active_last_frame then
			self.gamepad_active_last_frame = true

			self:on_gamepad_activated()
		end
	elseif self.gamepad_active_last_frame then
		self.gamepad_active_last_frame = false

		self:on_gamepad_deactivated()
	end

	self:_handle_unit_frame_assigning()
	self:_sync_player_stats(self._unit_frames[self._current_frame_index])

	self._current_frame_index = 1 + self._current_frame_index % #self._unit_frames
	local unit_frames = self._unit_frames

	for i = 1, #unit_frames, 1 do
		local unit_frame = unit_frames[i]

		if i ~= 1 or not ignore_own_player then
			unit_frame.widget:update(dt, t)
		end

		if unit_frame.widget:show_respawn_ui() then
			unit_frame.widget:update_respawn_countdown(dt, t)
		end
	end

	if self._update_resolution_modified then
		self:resolution_modified()
	end

	self:_draw(dt)
end

UnitFramesHandler.resolution_modified = function (self)
	if not self._is_visible then
		self._update_resolution_modified = true

		return
	end

	local unit_frames = self._unit_frames

	for i = 1, #unit_frames, 1 do
		local unit_frame = unit_frames[i]

		unit_frame.widget:on_resolution_modified()
	end

	self._update_resolution_modified = nil
end

UnitFramesHandler._draw = function (self, dt)
	if not self._is_visible then
		return
	end

	local unit_frames = self._unit_frames

	for i = 1, #unit_frames, 1 do
		local unit_frame = unit_frames[i]

		unit_frame.widget:draw(dt)
	end
end

return
