local definitions = local_require("scripts/ui/views/unit_frames_ui_definitions")
UnitFramesUI = class(UnitFramesUI)
local SLOTS_LIST = {
	"slot_1",
	"slot_2",
	"slot_3",
	"slot_4",
	"slot_5"
}
local MIN_HEALTH_DIVIDERS = 0
local MAX_HEALTH_DIVIDERS = 10
local reload = true
local teammate_inventory_widget_slots = {
	slot_healthkit = 1,
	slot_grenade = 3,
	slot_potion = 2
}
UnitFramesUI.init = function (self, ingame_ui_context)
	self.is_server = ingame_ui_context.is_server
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.player_manager = ingame_ui_context.player_manager
	self.profile_synchronizer = ingame_ui_context.profile_synchronizer
	self.peer_id = ingame_ui_context.peer_id
	self.local_player_id = ingame_ui_context.local_player_id
	self.lobby = ingame_ui_context.network_lobby
	self.slot_equip_animations = {}

	rawset(_G, "unit_frame_pointer", self)
	self.create_ui_elements(self)

	local player_portrait = self.player_portrait
	local portrait_content = player_portrait.content
	portrait_content.is_host = self.is_server
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local server_peer_id = network_transmit.server_peer_id
	self.host_peer_id = server_peer_id or network_transmit.peer_id
	self.shielded_players = {}

	return 
end
UnitFramesUI.create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self.player_portrait = UIWidget.init(definitions.player_portrait_widget_definition)
	self.other_player_portraits = {
		UIWidget.init(definitions.create_player_portrait_widget_definition_small(1)),
		UIWidget.init(definitions.create_player_portrait_widget_definition_small(2)),
		UIWidget.init(definitions.create_player_portrait_widget_definition_small(3))
	}
	self.other_player_inventories = {
		UIWidget.init(definitions.create_player_inventory_list_widget_definition(1)),
		UIWidget.init(definitions.create_player_inventory_list_widget_definition(2)),
		UIWidget.init(definitions.create_player_inventory_list_widget_definition(3))
	}

	for i = 1, #self.other_player_inventories, 1 do
		self.init_player_inventory_list(self, self.other_player_inventories[i], 3)
	end

	reload = false

	return 
end
local inventory_consumable_icons = definitions.inventory_consumable_icons
UnitFramesUI.init_player_inventory_list = function (self, widget, num_elements)
	local list_content = {}
	local item_styles = {}

	for i = 1, num_elements, 1 do
		list_content[i] = {
			item_highlight = "weapon_icon_glow",
			visible = true,
			item_texture = inventory_consumable_icons[i]
		}
		local item_size = (i == 1 and {
			62,
			62
		}) or {
			50,
			50
		}
		local list_member_offset = (i == 1 and {
			61,
			0,
			0
		}) or {
			54,
			0,
			0
		}
		local item_offset = (i == 1 and {
			0,
			0,
			0
		}) or {
			13,
			6,
			0
		}
		local item_glow_offset = (i == 1 and {
			0,
			0,
			2
		}) or {
			13,
			6,
			2
		}
		item_styles[i] = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			size = item_size,
			list_member_offset = list_member_offset,
			offset = item_offset,
			color = {
				255,
				255,
				255,
				255
			},
			item_highlight = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				color = {
					0,
					255,
					255,
					255
				},
				size = item_size,
				offset = item_glow_offset
			}
		}
	end

	widget.content.list_content = list_content
	widget.style.list_style.item_styles = item_styles
	widget.style.list_style.start_index = 1
	widget.style.list_style.num_draws = 3
	widget.element.pass_data[1].num_list_elements = nil

	return 
end
UnitFramesUI.destroy = function (self)
	self.set_visible(self, false)
	rawset(_G, "unit_frame_pointer", nil)
	GarbageLeakDetector.register_object(self, "unit_frame_gui")

	return 
end
UnitFramesUI.set_visible = function (self, visible)
	for i = 1, #self.other_player_portraits, 1 do
		local player_portrait_widget = self.other_player_portraits[i]

		UIRenderer.set_element_visible(self.ui_renderer, player_portrait_widget.element, visible)
	end

	UIRenderer.set_element_visible(self.ui_renderer, self.player_portrait.element, visible)

	return 
end
UnitFramesUI.update = function (self, dt, t, my_player)
	Profiler.start("update_unit_frames")

	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")
	local peer_id = self.peer_id
	local local_player_id = self.local_player_id
	local player_unit = my_player.player_unit

	if not player_unit then
		Profiler.stop("update_unit_frames")

		return 
	end

	self.update_portrait_frames(self, dt, my_player)
	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)

	self.overlay_time = (self.overlay_time or 0) + dt*1.4

	self.update_player_unit_frame(self, dt, t, ui_scenegraph, ui_renderer, peer_id, local_player_id, my_player)
	self.update_teammates_unit_frames(self, dt, t, ui_scenegraph, ui_renderer, my_player)
	self.update_health_animations(self, dt)
	self.update_slot_equip_animations(self, dt)
	UIRenderer.end_pass(ui_renderer)
	Profiler.stop("update_unit_frames")

	return 
end

local function get_portrait_frame_by_unit(network_manager, player_manager, unit_storage, unit)
	local player_portrait_frame = "unit_frame_01"
	local dead_portrait_frame = "unit_frame_death"
	local network_game = network_manager.game(network_manager)

	if network_game and not LEVEL_EDITOR_TEST then
		if Unit.alive(unit) then
			local go_id = unit_storage.go_id(unit_storage, unit)
			local prestige_level = GameSession.game_object_field(network_game, go_id, "prestige_level")

			if 0 < prestige_level then
				player_portrait_frame = definitions.get_portrait_from_level(prestige_level)
			end
		else
			player_portrait_frame = dead_portrait_frame
		end
	end

	return player_portrait_frame
end

UnitFramesUI.update_portrait_frames = function (self, dt, my_player)
	local network_manager = Managers.state.network
	local player_manager = self.player_manager
	local unit_storage = Managers.state.unit_storage
	local player_unit = my_player.player_unit
	self.player_portrait.content.portrait_frame = "unit_frame_01"
	local human_players = player_manager.human_and_bot_players(player_manager)
	local i = 0
	local other_player_portraits = self.other_player_portraits

	for index, player in pairs(human_players) do
		if player == my_player then
		else
			i = i + 1
			local player_portrait_widget = other_player_portraits[i]
			local unit = player.player_unit
			player_portrait_widget.content.portrait_frame = "unit_frame_01"
		end
	end

	return 
end

local function get_portrait_name_by_profile_index(profile_index)
	local scale = RESOLUTION_LOOKUP.scale
	local portrait_mapping = definitions.character_portrait_mapping
	local portrait_mapping_point_sample = definitions.character_portrait_mapping_point_sample
	local profile_data = SPProfiles[profile_index]
	local display_name = profile_data.display_name
	local character_portrait = portrait_mapping[display_name]
	local character_portrait_point_sample = scale == 1 and portrait_mapping_point_sample[display_name]

	return character_portrait, character_portrait_point_sample
end

local tmp_peer_ids = {}
local tmp_peer_ids_by_index = {}
local tmp_peer_ids_by_index_old = {}
local modified_teammate = {}
UnitFramesUI.update_teammates_unit_frames = function (self, dt, t, ui_scenegraph, ui_renderer, my_player)
	local modified_teammate = modified_teammate

	Profiler.start("update_teammates_unit_frames")

	local profile_synchronizer = self.profile_synchronizer
	local human_players = self.player_manager:human_and_bot_players()
	local i = 0
	local other_player_portraits = self.other_player_portraits
	local other_player_inventories = self.other_player_inventories

	table.clear(tmp_peer_ids)

	tmp_peer_ids[self.peer_id] = true

	for index, player in pairs(human_players) do
		if player == my_player then
		else
			i = i + 1
			local player_inventory_widget = other_player_inventories[i]
			local player_portrait_widget = other_player_portraits[i]
			local player_peer_id = player.network_id(player)
			local is_player_server = self.host_peer_id == player_peer_id
			local profile_index = profile_synchronizer.profile_by_peer(profile_synchronizer, player_peer_id, player.local_player_id(player))

			if not profile_index then
			else
				tmp_peer_ids[player_peer_id] = true
				tmp_peer_ids_by_index[i] = player_peer_id
				local ingame_display_name = UIRenderer.crop_text(player.name(player), 26)
				local level = nil
				local is_player_controlled = player.is_player_controlled(player)

				if is_player_controlled then
					level = ExperienceSettings.get_player_level(player) or ""
				else
					level = "BOT"
				end

				modified_teammate[i] = player_portrait_widget.content.player_name ~= ingame_display_name
				modified_teammate[i] = modified_teammate[i] or player_portrait_widget.content.player_level ~= level
				player_portrait_widget.content.player_name = ingame_display_name
				player_portrait_widget.content.player_level = level
				local player_unit = player.player_unit
				local portrait_content = player_portrait_widget.content
				local portrait_style = player_portrait_widget.style
				local health_percent, is_dead, is_knocked_down, inventory_extension, dialogue_extension, needs_help, is_wounded, is_ready_for_assisted_respawn = nil
				local shield_percent = 0

				if player_unit then
					local health_extension = ScriptUnit.extension(player_unit, "health_system")
					local status_extension = ScriptUnit.extension(player_unit, "status_system")
					inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
					dialogue_extension = ScriptUnit.extension(player_unit, "dialogue_system")
					health_percent = health_extension.current_health_percent(health_extension)
					local max_health = health_extension.unmodified_max_health
					local has_shield, shield_amount = health_extension.has_assist_shield(health_extension)

					if has_shield then
						shield_percent = shield_amount/max_health

						if not self.shielded_players[i + 1] then
							local hp_bar_highlight = portrait_style.hp_bar_highlight
							hp_bar_highlight.color[1] = 255
							hp_bar_highlight.color[2] = 140
							hp_bar_highlight.color[3] = 180
							hp_bar_highlight.color[4] = 255
							player_portrait_widget.element.dirty = true
							self.shielded_players[i + 1] = true
						end
					elseif self.shielded_players[i + 1] then
						local hp_bar_highlight = portrait_style.hp_bar_highlight
						hp_bar_highlight.color[1] = 0
						hp_bar_highlight.color[2] = 0
						hp_bar_highlight.color[3] = 0
						hp_bar_highlight.color[4] = 0
						player_portrait_widget.element.dirty = true
						self.shielded_players[i + 1] = false
					end

					is_wounded = status_extension.is_wounded(status_extension)
					is_knocked_down = status_extension.is_knocked_down(status_extension) and 0 < health_percent
					is_ready_for_assisted_respawn = status_extension.is_ready_for_assisted_respawn(status_extension)
					needs_help = status_extension.is_grabbed_by_pack_master(status_extension) or is_ready_for_assisted_respawn or status_extension.is_hanging_from_hook(status_extension) or status_extension.is_pounced_down(status_extension) or status_extension.get_is_ledge_hanging(status_extension)
				else
					health_percent = 0
					is_knocked_down = false
				end

				modified_teammate[i] = modified_teammate[i] or portrait_content.hp_bar.draw_health_bar ~= not is_ready_for_assisted_respawn
				portrait_content.hp_bar.draw_health_bar = not is_ready_for_assisted_respawn

				if not self.is_server then
					portrait_content.is_host = is_player_controlled and is_player_server
				end

				is_dead = health_percent <= 0
				local show_overlay = false
				local show_icon = false
				local character_portrait = nil
				local num_of_health_dividers = 0

				if is_knocked_down then
					show_overlay = true
					show_icon = true
				elseif is_dead then
					show_overlay = true
				elseif needs_help then
					show_overlay = true
					show_icon = true
					num_of_health_dividers = MAX_HEALTH_DIVIDERS
				else
					num_of_health_dividers = MAX_HEALTH_DIVIDERS
				end

				local portrait_texture, portrait_texture_point_sample = get_portrait_name_by_profile_index(profile_index)
				character_portrait = portrait_texture

				if show_overlay then
					local alpha = 255

					if is_dead then
						portrait_content.portrait_overlay = "unit_frame_portrait_dead"
						alpha = 255
					elseif is_knocked_down then
						portrait_content.portrait_overlay = "unit_frame_portrait_dead"
						local i = math.sirp(0, 0.7, self.overlay_time)
						alpha = i*255
					elseif needs_help then
						portrait_content.portrait_overlay = "unit_frame_red_overlay"
						local i = math.sirp(0.6, 1, self.overlay_time)
						alpha = i*255
					end

					modified_teammate[i] = modified_teammate[i] or portrait_style.portrait_overlay.color[1] ~= alpha
					portrait_style.portrait_overlay.color[1] = alpha
				end

				if is_knocked_down or needs_help then
					local gui = ui_renderer.gui
					local gui_material = Gui.material(gui, portrait_texture_point_sample or portrait_texture)

					Material.set_vector2(gui_material, "saturate_params", Vector2(0.7, 1))
				else
					local gui = ui_renderer.gui
					local gui_material = Gui.material(gui, portrait_texture_point_sample or portrait_texture)

					Material.set_vector2(gui_material, "saturate_params", Vector2(0, 1))
				end

				local active_percentage = 1

				if player_unit then
					local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
					local num_grimoires = buff_extension.num_buff_perk(buff_extension, "skaven_grimoire")
					local multiplier = buff_extension.apply_buffs_to_value(buff_extension, PlayerUnitDamageSettings.GRIMOIRE_HEALTH_DEBUFF, StatBuffIndex.CURSE_PROTECTION)
					active_percentage = num_grimoires*multiplier + 1
				end

				fassert(health_percent*active_percentage <= 1, "Health was greater then 1. %s , %s", health_percent, active_percentage)

				local health_changed = self.on_player_health_changed(self, "player_" .. index, player_portrait_widget, health_percent*active_percentage)
				local grims_changed = self.on_num_grimoires_changed(self, "player_" .. index .. "_grimoires", player_portrait_widget, active_percentage - 1)
				modified_teammate[i] = modified_teammate[i] or health_changed or grims_changed
				local hp_bar_value = player_portrait_widget.content.hp_bar.bar_value
				local grimoire_value = player_portrait_widget.content.hp_bar_grimoire_debuff.bar_value
				player_portrait_widget.content.hp_bar_shield.bar_value_position = hp_bar_value
				player_portrait_widget.content.hp_bar_shield.bar_value_offset = grimoire_value
				player_portrait_widget.content.hp_bar_shield.bar_value_size = shield_percent
				local max_health_divider_content = portrait_content.hp_bar_max_health_divider
				max_health_divider_content.active = false
				local grimoire_icon_content = portrait_content.hp_bar_grimoire_icon
				grimoire_icon_content.active = false

				if active_percentage < 1 then
					max_health_divider_content.active = true
					local max_health_divider_style = player_portrait_widget.style.hp_bar_max_health_divider
					local default_bar_length = definitions.scenegraph_definition.hp_bar_grimoire_debuff_fill.size[1]
					local bar_value = portrait_content.hp_bar_grimoire_debuff.bar_value
					local bar_offset = -bar_value*default_bar_length
					max_health_divider_style.offset[1] = bar_offset
					grimoire_icon_content.active = true
					local grimoire_icon_style = player_portrait_widget.style.hp_bar_grimoire_icon
					grimoire_icon_style.offset[1] = bar_offset/2
				end

				low_health = (not is_dead and not is_knocked_down and health_percent < UISettings.unit_frames.low_health_threshold) or nil
				portrait_content.hp_bar.low_health = low_health or false
				portrait_content.hp_bar.is_knocked_down = is_knocked_down or false
				portrait_content.hp_bar.is_wounded = is_wounded or false
				portrait_content.character_portrait = character_portrait
				portrait_content.connecting = false
				portrait_content.display_portrait_icon = show_icon
				portrait_content.display_portrait_overlay = show_overlay
				portrait_style.hp_bar_divider.texture_amount = num_of_health_dividers

				if inventory_extension then
					local inventory_widgets = self.inventory_widgets
					local equipment = inventory_extension.equipment(inventory_extension)
					local inventory_slots = InventorySettings.slots
					local player_inventory_list_content = player_inventory_widget.content.list_content
					local player_inventory_item_styles = player_inventory_widget.style.list_style.item_styles

					for _, slot in ipairs(inventory_slots) do
						local slot_name = slot.name
						local widget_slot_index = teammate_inventory_widget_slots[slot_name]

						if widget_slot_index then
							local slot_data = equipment.slots[slot_name]
							local slot_visible = (slot_data and true) or false

							if slot_visible and not player_inventory_list_content[widget_slot_index].occupied then
								self.add_slot_equip_animation(self, "player_" .. index .. "_" .. slot_name .. "_equip_anim", player_inventory_item_styles[widget_slot_index].item_highlight)

								modified_teammate[i] = true
							end

							if slot_visible then
								local item_name = slot_data.item_data.name
								local texture_name = inventory_consumable_icons[item_name]
								player_inventory_list_content[widget_slot_index].item_texture = texture_name or "teammate_consumable_icon_medpack"
							else
								local texture_name = inventory_consumable_icons[widget_slot_index]
								player_inventory_list_content[widget_slot_index].item_texture = texture_name
							end

							player_inventory_list_content[widget_slot_index].occupied = slot_visible
						end
					end
				end

				local is_talking = false

				if dialogue_extension then
					is_talking = dialogue_extension.currently_playing_dialogue ~= nil
				end

				local talk_indicator_style = player_portrait_widget.style.talk_indicator_highlight
				local old_alpha = talk_indicator_style.color[1]
				old_alpha = old_alpha + ((is_talking and 1) or -1)*255*dt

				if is_talking then
					old_alpha = old_alpha + math.sin(t*3)*20
					old_alpha = old_alpha + math.cos((t + 1)*13)*20
					local scenegraph_size = self.ui_scenegraph[talk_indicator_style.scenegraph_id].size
					scenegraph_size[2] = math.sin(t*7)*15 + 70 + math.cos((t + 1)*17)*10
				end

				old_alpha = math.clamp(old_alpha, 0, 255)
				modified_teammate[i] = old_alpha ~= talk_indicator_style.color[1]
				talk_indicator_style.color[1] = old_alpha
			end
		end
	end

	local num_drawn_widgets = i

	if i < 3 then
		local members = self.lobby:members()

		if members then
			local lobby_members = members.get_members(members)

			for idx, peer_id in ipairs(lobby_members) do
				if not tmp_peer_ids[peer_id] then
					i = i + 1
					tmp_peer_ids[peer_id] = true
					tmp_peer_ids_by_index[i] = peer_id
					local player_portrait_widget = other_player_portraits[i]
					local player_inventory_widget = other_player_inventories[i]
					local portrait_content = player_portrait_widget.content
					portrait_content.connecting = true
					portrait_content.character_portrait = "unit_frame_portrait_matchmaking_03"
					portrait_content.player_name = ""
					portrait_content.display_portrait_overlay = false
					portrait_content.display_portrait_icon = false
					local connecting_icon_style = player_portrait_widget.style.connecting_icon
					local connecting_rotation_speed = 200
					local connecting_rotation_angle = (dt*connecting_rotation_speed)%360
					local connecting_radians = math.degrees_to_radians(connecting_rotation_angle)
					connecting_icon_style.angle = connecting_icon_style.angle + connecting_radians
					modified_teammate[i] = true
				end

				if i == 3 then
					break
				end
			end
		end
	end

	local resolution_modified = RESOLUTION_LOOKUP.modified

	for idx = 1, 3, 1 do
		local player_portrait_widget = other_player_portraits[idx]
		local player_inventory_widget = other_player_inventories[idx]
		local visible = idx <= i

		if visible then
			local player_changed = tmp_peer_ids_by_index[idx] ~= tmp_peer_ids_by_index_old[idx]

			if modified_teammate[idx] or resolution_modified or player_changed then
				modified_teammate[idx] = false
				player_portrait_widget.element.dirty = true
				player_inventory_widget.element.dirty = true
			end

			UIRenderer.draw_widget(ui_renderer, player_portrait_widget)
			UIRenderer.draw_widget(ui_renderer, player_inventory_widget)
		else
			UIRenderer.set_element_visible(ui_renderer, player_portrait_widget.element, false)
			UIRenderer.set_element_visible(ui_renderer, player_inventory_widget.element, false)
		end

		tmp_peer_ids_by_index_old[idx] = tmp_peer_ids_by_index[idx]
		tmp_peer_ids_by_index[idx] = nil
	end

	Profiler.stop("update_teammates_unit_frames")

	return 
end
UnitFramesUI.update_player_unit_frame = function (self, dt, t, ui_scenegraph, ui_renderer, peer_id, local_player_id, my_player)
	Profiler.start("update_player_unit_frame")

	local profile_synchronizer = self.profile_synchronizer
	local player_unit = my_player.player_unit
	local health_percent, total_health, is_knocked_down, is_dead, inventory_extension, dialogue_extension, needs_help, is_wounded, level, is_ready_for_assisted_respawn = nil
	local shield_percent = 0
	local active_percentage = 1
	local modified_portrait = false
	local player_portrait = self.player_portrait
	local portrait_content = player_portrait.content
	local portrait_style = player_portrait.style

	if player_unit then
		local health_extension = ScriptUnit.extension(player_unit, "health_system")
		local status_extension = ScriptUnit.extension(player_unit, "status_system")
		inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
		dialogue_extension = ScriptUnit.extension(player_unit, "dialogue_system")
		health_percent = health_extension.current_health_percent(health_extension)
		local max_health = health_extension.unmodified_max_health
		local has_shield, shield_amount = health_extension.has_assist_shield(health_extension)

		if has_shield then
			shield_percent = shield_amount/max_health

			if not self.shielded_players[1] then
				local hp_bar_highlight = portrait_style.hp_bar_highlight
				hp_bar_highlight.color[1] = 255
				hp_bar_highlight.color[2] = 140
				hp_bar_highlight.color[3] = 180
				hp_bar_highlight.color[4] = 255
				player_portrait.element.dirty = true
				self.shielded_players[1] = true
			end
		elseif self.shielded_players[1] then
			local hp_bar_highlight = portrait_style.hp_bar_highlight
			hp_bar_highlight.color[1] = 0
			hp_bar_highlight.color[2] = 0
			hp_bar_highlight.color[3] = 0
			hp_bar_highlight.color[4] = 0
			player_portrait.element.dirty = true
			self.shielded_players[1] = false
		end

		total_health = health_extension.health
		is_wounded = status_extension.is_wounded(status_extension)
		is_knocked_down = status_extension.is_knocked_down(status_extension) and 0 < health_percent
		is_ready_for_assisted_respawn = status_extension.is_ready_for_assisted_respawn(status_extension)
		needs_help = status_extension.is_pounced_down(status_extension) or status_extension.get_is_ledge_hanging(status_extension) or status_extension.is_grabbed_by_pack_master(status_extension) or is_ready_for_assisted_respawn or status_extension.is_hanging_from_hook(status_extension)
		level = ExperienceSettings.get_player_level(my_player) or ""
		local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
		local num_grimoires = buff_extension.num_buff_perk(buff_extension, "skaven_grimoire")
		local multiplier = buff_extension.apply_buffs_to_value(buff_extension, PlayerUnitDamageSettings.GRIMOIRE_HEALTH_DEBUFF, StatBuffIndex.CURSE_PROTECTION)
		active_percentage = num_grimoires*multiplier + 1
	else
		health_percent = 0
		is_knocked_down = false
		level = nil
	end

	portrait_content.hp_bar.draw_health_bar = not is_ready_for_assisted_respawn
	is_dead = health_percent <= 0
	local num_of_health_dividers = 0
	local low_health = (not is_dead and not is_knocked_down and health_percent < UISettings.unit_frames.low_health_threshold) or nil

	fassert(health_percent*active_percentage <= 1, "Health was greater then 1. %s , %s", health_percent, active_percentage)

	local health_changed = self.on_player_health_changed(self, "my_player", player_portrait, health_percent*active_percentage)
	local grims_changed = self.on_num_grimoires_changed(self, "my_player_grimoires", player_portrait, active_percentage - 1)
	modified_portrait = modified_portrait or health_changed or grims_changed
	local hp_bar_value = player_portrait.content.hp_bar.bar_value
	local grimoire_value = player_portrait.content.hp_bar_grimoire_debuff.bar_value
	portrait_content.hp_bar_shield.bar_value_position = hp_bar_value
	portrait_content.hp_bar_shield.bar_value_offset = grimoire_value
	portrait_content.hp_bar_shield.bar_value_size = shield_percent
	local max_health_divider_content = portrait_content.hp_bar_max_health_divider
	max_health_divider_content.active = false
	local grimoire_icon_content = portrait_content.hp_bar_grimoire_icon
	grimoire_icon_content.active = false

	if active_percentage < 1 then
		max_health_divider_content.active = true
		local max_health_divider_style = player_portrait.style.hp_bar_max_health_divider
		local default_bar_length = definitions.scenegraph_definition.hp_bar_grimoire_debuff_fill.size[1]
		local bar_value = portrait_content.hp_bar_grimoire_debuff.bar_value
		local bar_offset = bar_value*default_bar_length
		max_health_divider_style.offset[1] = bar_offset
		grimoire_icon_content.active = true
		local grimoire_icon_style = player_portrait.style.hp_bar_grimoire_icon
		grimoire_icon_style.offset[1] = bar_offset/2
	end

	local show_overlay = false
	local show_icon = false
	local profile_index = profile_synchronizer.profile_by_peer(profile_synchronizer, peer_id, local_player_id)

	if profile_index then
		local character_portrait = nil

		if is_knocked_down then
			show_overlay = true
			show_icon = true
		elseif is_dead then
			show_overlay = true
		elseif needs_help then
			show_overlay = true
			show_icon = true
			num_of_health_dividers = MAX_HEALTH_DIVIDERS
		else
			num_of_health_dividers = MAX_HEALTH_DIVIDERS
		end

		local portrait_texture, portrait_texture_point_sample = get_portrait_name_by_profile_index(profile_index)
		character_portrait = portrait_texture

		if show_overlay then
			local alpha = 255

			if is_dead then
				portrait_content.portrait_overlay = "unit_frame_portrait_dead"
				alpha = 255
			elseif is_knocked_down then
				portrait_content.portrait_overlay = "unit_frame_portrait_dead"
				local i = math.sirp(0, 0.7, self.overlay_time)
				alpha = i*255
			elseif needs_help then
				portrait_content.portrait_overlay = "unit_frame_red_overlay"
				local i = math.sirp(0.6, 1, self.overlay_time)
				alpha = i*255
			end

			modified_portrait = modified_portrait or portrait_style.portrait_overlay.color[1] ~= alpha
			portrait_style.portrait_overlay.color[1] = alpha
		end

		portrait_content.hp_bar.low_health = low_health or false
		portrait_content.hp_bar.is_knocked_down = is_knocked_down or false
		portrait_content.hp_bar.is_wounded = is_wounded or false
		portrait_content.character_portrait = character_portrait
		portrait_content.display_portrait_icon = show_icon
		portrait_content.display_portrait_overlay = show_overlay
		player_portrait.style.hp_bar_divider.texture_amount = num_of_health_dividers

		if is_knocked_down or needs_help then
			local gui = ui_renderer.gui
			local gui_material = Gui.material(gui, portrait_texture_point_sample or portrait_texture)

			Material.set_vector2(gui_material, "saturate_params", Vector2(0.7, 1))
		else
			local gui = ui_renderer.gui
			local gui_material = Gui.material(gui, portrait_texture_point_sample or portrait_texture)

			Material.set_vector2(gui_material, "saturate_params", Vector2(0, 1))
		end
	end

	local is_talking = false

	if dialogue_extension then
		is_talking = dialogue_extension.currently_playing_dialogue ~= nil
	end

	local talk_indicator_style = player_portrait.style.talk_indicator_highlight
	local old_alpha = talk_indicator_style.color[1]
	old_alpha = old_alpha + ((is_talking and 1) or -1)*255*dt

	if is_talking then
		old_alpha = old_alpha + math.sin(t*3)*20
		old_alpha = old_alpha + math.cos((t + 1)*13)*20
		local scenegraph_size = self.ui_scenegraph[talk_indicator_style.scenegraph_id].size
		scenegraph_size[2] = math.sin(t*7)*15 + 70 + math.cos((t + 1)*17)*10
	end

	old_alpha = math.clamp(old_alpha, 0, 255)
	modified_portrait = modified_portrait or talk_indicator_style.color[1] ~= old_alpha
	talk_indicator_style.color[1] = old_alpha
	portrait_content.player_level = level
	local resolution_modified = RESOLUTION_LOOKUP.modified

	if modified_portrait or resolution_modified then
		player_portrait.element.dirty = true
	end

	UIRenderer.draw_widget(ui_renderer, player_portrait)
	Profiler.stop("update_player_unit_frame")

	return 
end
UnitFramesUI.on_player_health_changed = function (self, name, widget, health_percent)
	local lol = math.random()

	if not self.bar_animations_data then
		self.bar_animations_data = {}
	end

	local unit_frames_settings = UISettings.unit_frames

	if not self.bar_animations_data[name] then
		local widget_animation_data = {
			low_health_animation = UIAnimation.init(UIAnimation.pulse_animation, widget.style.hp_bar.color, 1, unit_frames_settings.low_health_animation_alpha_from, unit_frames_settings.low_health_animation_alpha_to, unit_frames_settings.low_health_animation_time)
		}
	end

	self.bar_animations_data[name] = widget_animation_data
	local health_percent_current = widget_animation_data.current_health
	widget_animation_data.current_health = health_percent

	if health_percent ~= health_percent_current then
		local is_knocked_down = widget.content.hp_bar.is_knocked_down
		local current_bar_health = widget.content.hp_bar.bar_value
		local lerp_time = UISettings.unit_frames.health_bar_lerp_time
		local anim_time = nil

		if current_bar_health < health_percent then
			anim_time = (health_percent - current_bar_health)*lerp_time
		else
			anim_time = (current_bar_health - health_percent)*lerp_time
		end

		local animate_highlight = (not is_knocked_down and health_percent < (health_percent_current or 1)) or false
		widget_animation_data.animate_highlight = (not animate_highlight or 0) and widget_animation_data.animate_highlight
		widget_animation_data.animate = true
		widget_animation_data.new_health = health_percent
		widget_animation_data.previous_health = current_bar_health
		widget_animation_data.time = 0
		widget_animation_data.total_time = anim_time
		widget_animation_data.widget = widget
		widget_animation_data.bar = widget.content.hp_bar

		return true
	end

	return 
end
UnitFramesUI.on_num_grimoires_changed = function (self, name, widget, health_debuff_percent)
	if not self.bar_animations_data then
		self.bar_animations_data = {}
	end

	local unit_frames_settings = UISettings.unit_frames
	local widget_animation_data = self.bar_animations_data[name] or {}

	if health_debuff_percent ~= widget_animation_data.current_health_debuff then
		local current_bar_health_debuff = widget.content.hp_bar_grimoire_debuff.bar_value
		local lerp_time = UISettings.unit_frames.health_bar_lerp_time
		local anim_time = nil

		if current_bar_health_debuff < health_debuff_percent then
			anim_time = (health_debuff_percent - current_bar_health_debuff)*lerp_time
		else
			anim_time = (current_bar_health_debuff - health_debuff_percent)*lerp_time
		end

		widget_animation_data.animate = true
		widget_animation_data.new_health = health_debuff_percent
		widget_animation_data.previous_health = current_bar_health_debuff
		widget_animation_data.time = 0
		widget_animation_data.total_time = anim_time
		widget_animation_data.widget = widget
		widget_animation_data.bar = widget.content.hp_bar_grimoire_debuff
	end

	widget_animation_data.current_health_debuff = health_debuff_percent
	self.bar_animations_data[name] = widget_animation_data

	return 
end
UnitFramesUI.update_player_bar_animation = function (self, widget, bar, time, total_time, anim_start_health, anim_end_health, dt)
	time = time + dt

	if 0 < total_time then
		local style = widget.style
		local progress = math.min(time/total_time, 1)
		local catmullrom_value = math.catmullrom(progress, -14, 0, 0, 0)
		local weight = 7
		local weighted_average = (progress*(weight - 1) + 1)/weight
		local bar_fraction = nil

		if anim_start_health < anim_end_health then
			bar_fraction = anim_start_health + (anim_end_health - anim_start_health)*weighted_average
		else
			bar_fraction = anim_start_health - (anim_start_health - anim_end_health)*weighted_average
		end

		bar.bar_value = bar_fraction
		widget.element.dirty = true

		return (progress < 1 and time) or nil
	end

	bar.bar_value = anim_end_health

	return nil
end
UnitFramesUI.update_damage_highlight = function (self, widget, time, dt)
	local total_time = 0.2
	time = time + dt

	if 0 < total_time then
		local style = widget.style
		local progress = math.min(time/total_time, 1)
		local catmullrom_value = math.catmullrom(progress, -8, 0, 0, -8)
		local highlight_alpha = catmullrom_value*255
		style.hp_bar_highlight.color[1] = highlight_alpha
		widget.element.dirty = true

		return (progress < 1 and time) or nil
	end

	return nil
end
UnitFramesUI.update_talk_highlight = function (self, widget, time, dt)
	local total_time = 0.2
	time = time + dt

	if 0 < total_time then
		local style = widget.style
		local progress = math.min(time/total_time, 1)
		local catmullrom_value = math.catmullrom(progress, -8, 0, 0, -8)
		local highlight_alpha = catmullrom_value*255
		style.hp_bar_highlight.color[1] = highlight_alpha

		return (progress < 1 and time) or nil
	end

	return nil
end
UnitFramesUI.update_health_animations = function (self, dt)
	Profiler.start("update_unit_frames_animations")

	local bar_animations = self.bar_animations_data

	if bar_animations then
		for name, animation_data in pairs(bar_animations) do
			local widget = animation_data.widget
			local bar = animation_data.bar

			if bar.low_health then
				UIAnimation.update(animation_data.low_health_animation, dt)
			end

			if animation_data.animate_highlight and not self.shielded_players[1] then
				animation_data.animate_highlight = self.update_damage_highlight(self, widget, animation_data.animate_highlight, dt)
			end

			if animation_data.animate then
				local time = animation_data.time
				local total_time = animation_data.total_time
				local new_health = animation_data.new_health
				local previous_health = animation_data.previous_health
				local time_left = self.update_player_bar_animation(self, widget, bar, time, total_time, previous_health, new_health, dt)

				if time_left then
					animation_data.time = time_left
				else
					animation_data.animate = nil
				end
			end
		end
	end

	Profiler.stop("update_unit_frames_animations")

	return 
end
UnitFramesUI.add_slot_equip_animation = function (self, name, style)
	local animations = self.slot_equip_animations
	local inventory_hud_settings = UISettings.inventory_hud
	local total_time = inventory_hud_settings.equip_animation_duration
	local animation = animations[name]

	if animation then
		animation.total_time = total_time
		animation.time = 0
	else
		animations[name] = {
			time = 0,
			total_time = total_time,
			style = style
		}
	end

	return 
end
UnitFramesUI.animate_slot_equip = function (self, animation_data, dt)
	local style = animation_data.style
	local total_time = animation_data.total_time
	local time = animation_data.time
	time = time + dt
	local progress = math.min(time/total_time, 1)
	local catmullrom_value = math.catmullrom(progress, -10, 0, 0, -4)
	style.color[1] = catmullrom_value*255
	animation_data.time = time

	return (progress < 1 and animation_data) or nil
end
UnitFramesUI.update_slot_equip_animations = function (self, dt)
	local animations = self.slot_equip_animations

	for scenegraph_id, animation_data in pairs(animations) do
		animations[scenegraph_id] = self.animate_slot_equip(self, animation_data, dt)
	end

	return 
end

return 
