require("scripts/ui/views/subtitle_gui")
require("scripts/ui/views/damage_indicator_gui")
require("scripts/ui/views/tutorial_ui")
require("scripts/ui/views/tutorial_input_ui")
require("scripts/ui/views/tutorial_intro_ui")
require("scripts/ui/views/interaction_ui")
require("scripts/ui/views/area_indicator_ui")
require("scripts/ui/views/mission_objective_ui")
require("scripts/ui/views/crosshair_ui")
require("scripts/ui/views/fatigue_ui")
require("scripts/ui/views/player_inventory_ui")
require("scripts/ui/views/bonus_dice_ui")
require("scripts/ui/views/gdc_start_ui")
require("scripts/ui/views/ingame_player_list_ui")
require("scripts/ui/hud_ui/wait_for_rescue_ui")
require("scripts/ui/views/positive_reinforcement_ui")
require("scripts/ui/hud_ui/item_received_feedback_ui")
require("scripts/ui/hud_ui/observer_ui")
require("scripts/ui/hud_ui/ingame_news_ticker_ui")
require("scripts/ui/hud_ui/game_timer_ui")
require("scripts/ui/hud_ui/endurance_badge_ui")
require("scripts/ui/hud_ui/difficulty_unlock_ui")
require("scripts/ui/hud_ui/unit_frames_handler")
require("scripts/ui/hud_ui/buff_ui")
require("scripts/ui/hud_ui/buff_presentation_ui")
require("scripts/ui/hud_ui/contract_log_ui")
require("scripts/ui/hud_ui/overcharge_bar_ui")
require("scripts/ui/hud_ui/equipment_ui")
require("scripts/ui/hud_ui/gamepad_equipment_ui")
require("scripts/ui/hud_ui/ability_ui")
require("scripts/ui/hud_ui/loot_objective_ui")
require("scripts/ui/hud_ui/boss_health_ui")
require("scripts/ui/hud_ui/twitch_vote_ui")
require("scripts/ui/hud_ui/floating_icon_ui")
require("scripts/ui/hud_ui/damage_numbers_ui")
require("scripts/ui/hud_ui/news_feed_ui")
require("scripts/ui/gift_popup/gift_popup_ui")
require("scripts/ui/ui_cleanui")

local definitions = local_require("scripts/ui/views/ingame_hud_definitions")
IngameHud = class(IngameHud)
IngameHud.init = function (self, ingame_ui_context)
	self.is_in_inn = ingame_ui_context.is_in_inn
	local cutscene_system = Managers.state.entity:system("cutscene_system")
	self.cutscene_system = cutscene_system
	self.gdc_build = Development.parameter("gdc")
	local has_tobii = rawget(_G, "Tobii")

	if has_tobii then
		ingame_ui_context.cleanui = UICleanUI.create()
		self.cleanui = ingame_ui_context.cleanui
		self.cleanui.hud = self
	else
		self.cleanui = nil
	end

	self.ui_renderer = ingame_ui_context.ui_renderer
	self.input_manager = ingame_ui_context.input_manager

	self.create_ui_elements(self)

	self.profile_synchronizer = ingame_ui_context.profile_synchronizer
	self.peer_id = ingame_ui_context.peer_id
	self.player_manager = ingame_ui_context.player_manager
	self.mission_system = Managers.state.entity:system("mission_system")
	self.damage_indicator_gui = DamageIndicatorGui:new(ingame_ui_context)
	self.interaction_ui = InteractionUI:new(ingame_ui_context)
	self.tutorial_ui = TutorialUI:new(ingame_ui_context)
	self.area_indicator = AreaIndicatorUI:new(ingame_ui_context)
	self.mission_objective = MissionObjectiveUI:new(ingame_ui_context)
	self.loot_objective = LootObjectiveUI:new(ingame_ui_context)
	self.crosshair = CrosshairUI:new(ingame_ui_context)
	self.fatigue_ui = FatigueUI:new(ingame_ui_context)
	self.bonus_dice_ui = BonusDiceUI:new(ingame_ui_context)
	self.ingame_player_list_ui = IngamePlayerListUI:new(ingame_ui_context)
	self.wait_for_rescue_ui = WaitForRescueUI:new(ingame_ui_context)
	self.item_received_feedback_ui = ItemReceivedFeedbackUI:new(ingame_ui_context)
	self.positive_reinforcement_ui = PositiveReinforcementUI:new(ingame_ui_context)
	self.overcharge_bar_ui = OverchargeBarUI:new(ingame_ui_context)
	self.boss_health_ui = BossHealthUI:new(ingame_ui_context)
	local use_player_inventory = false

	if use_player_inventory then
		self.player_inventory_ui = PlayerInventoryUI:new(ingame_ui_context)
	end

	if not script_data.disable_news_ticker then
		self.ingame_news_ticker_ui = IngameNewsTickerUI:new(ingame_ui_context)
	end

	self.gift_popup_ui = GiftPopupUI:new(ingame_ui_context)
	self.unit_frames_handler = UnitFramesHandler:new(ingame_ui_context)
	self.buff_ui = BuffUI:new(ingame_ui_context)
	self.buff_presentation_ui = BuffPresentationUI:new(ingame_ui_context)
	self.equipment_ui = EquipmentUI:new(ingame_ui_context)
	self.gamepad_equipment_ui = GamePadEquipmentUI:new(ingame_ui_context)
	self.ability_ui = AbilityUI:new(ingame_ui_context)
	local backend_settings = GameSettingsDevelopment.backend_settings

	if not self.is_in_inn and backend_settings.quests_enabled then
		self.contract_log_ui = ContractLogUI:new(ingame_ui_context)
	end

	if self.is_in_inn or script_data.debug_show_damage_numbers then
		self.damage_numbers_ui = DamageNumbersUI:new(ingame_ui_context)
	end

	if self.is_in_inn then
		self.news_feed_ui = NewsFeedUI:new(ingame_ui_context)
		self.subtitle_gui = SubtitleGui:new(ingame_ui_context)
	else
		local twitch_ui = Managers.twitch and (Managers.twitch:is_connected() or Managers.twitch:is_activated())

		if twitch_ui then
			self.twitch_vote_ui = TwitchVoteUI:new(ingame_ui_context)
		else
			self.subtitle_gui = SubtitleGui:new(ingame_ui_context)
		end
	end

	local game_mode_key = Managers.state.game_mode:game_mode_key()

	if game_mode_key == "survival" then
		self.game_timer_ui = GameTimerUI:new(ingame_ui_context)
		self.difficulty_unlock_ui = DifficultyUnlockUI:new(ingame_ui_context)
	elseif game_mode_key == "tutorial" then
		self.tutorial_input_ui = TutorialInputUI:new(ingame_ui_context)
		self.tutorial_intro_ui = TutorialIntroUI:new(ingame_ui_context)
	end

	return 
end
IngameHud.destroy = function (self)
	if self.unit_frames_handler then
		self.unit_frames_handler:destroy()
	end

	if self.game_timer_ui then
		self.game_timer_ui:destroy()
	end

	if self.endurance_badge_ui then
		self.endurance_badge_ui:destroy()
	end

	if self.difficulty_unlock_ui then
		self.difficulty_unlock_ui:destroy()
	end

	if self.tutorial_input_ui then
		self.tutorial_input_ui:destroy()
	end

	if self.tutorial_intro_ui then
		self.tutorial_intro_ui:destroy()
	end

	if self.buff_ui then
		self.buff_ui:destroy()
	end

	if self.buff_presentation_ui then
		self.buff_presentation_ui:destroy()
	end

	if self.twitch_vote_ui then
		self.twitch_vote_ui:destroy()
	end

	if self.equipment_ui then
		self.equipment_ui:destroy()
	end

	if self.gamepad_equipment_ui then
		self.gamepad_equipment_ui:destroy()
	end

	if self.ability_ui then
		self.ability_ui:destroy()
	end

	if self.contract_log_ui then
		self.contract_log_ui:destroy()
	end

	if self.damage_numbers_ui then
		self.damage_numbers_ui:destroy()
	end

	if self.news_feed_ui then
		self.news_feed_ui:destroy()
	end

	if self.subtitle_gui then
		self.subtitle_gui:destroy()
	end

	self.damage_indicator_gui:destroy()
	self.tutorial_ui:destroy()
	self.interaction_ui:destroy()
	self.area_indicator:destroy()
	self.mission_objective:destroy()
	self.loot_objective:destroy()
	self.crosshair:destroy()
	self.fatigue_ui:destroy()

	if self.player_inventory_ui then
		self.player_inventory_ui:destroy()
	end

	self.overcharge_bar_ui:destroy()
	self.bonus_dice_ui:destroy()
	self.ingame_player_list_ui:destroy()
	self.wait_for_rescue_ui:destroy()
	self.positive_reinforcement_ui:destroy()
	self.item_received_feedback_ui:destroy()
	self.boss_health_ui:destroy()

	if self.observer_ui then
		self.observer_ui:destroy()
	end

	if self.gdc_build then
		self.gdc_start_ui:destroy()
	end

	self.gift_popup_ui:destroy()

	return 
end
IngameHud.create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)

	return 
end
IngameHud.set_visible = function (self, visible, draw_playerlist)
	local ingame_player_list_ui = self.ingame_player_list_ui

	if ingame_player_list_ui and ingame_player_list_ui.active then
		if not draw_playerlist then
			self.ingame_player_list_ui:set_active(visible)
		elseif visible then
			self.ingame_player_list_ui:set_active(false)
		end
	end

	local is_own_player_dead = self.is_own_player_dead(self)

	if is_own_player_dead then
		local draw_death_hud = is_own_player_dead and not draw_playerlist and visible

		if self.observer_ui then
			self.observer_ui:set_visible(draw_death_hud)
		end

		if self.unit_frames_handler then
			local ignore_own_player = true

			self.unit_frames_handler:set_visible(draw_death_hud, ignore_own_player)
		end

		visible = false
	elseif self.unit_frames_handler then
		self.unit_frames_handler:set_visible(visible)
	end

	if self.player_inventory_ui then
		self.player_inventory_ui:set_visible(visible)
	end

	if self.game_timer_ui then
		self.game_timer_ui:set_visible(visible)
	end

	if self.endurance_badge_ui then
		self.endurance_badge_ui:set_visible(visible)
	end

	local difficulty_unlock_ui = self.difficulty_unlock_ui

	if difficulty_unlock_ui then
		difficulty_unlock_ui.set_visible(difficulty_unlock_ui, visible)
	end

	local tutorial_input_ui = self.tutorial_input_ui

	if tutorial_input_ui then
		tutorial_input_ui.set_visible(tutorial_input_ui, visible)
	end

	if self.buff_ui then
		self.buff_ui:set_visible(visible)
	end

	if self.news_feed_ui then
		self.news_feed_ui:set_visible(visible)
	end

	if self.twitch_vote_ui then
		self.twitch_vote_ui:set_visible(visible)
	end

	if self.equipment_ui then
		self.equipment_ui:set_visible(visible)
	end

	if self.gamepad_equipment_ui then
		self.gamepad_equipment_ui:set_visible(visible)
	end

	if self.ability_ui then
		self.ability_ui:set_visible(visible)
	end

	if self.contract_log_ui then
		self.contract_log_ui:set_visible(visible)
	end

	if self.tutorial_ui then
		self.tutorial_ui:set_visible(visible)
	end

	return 
end
IngameHud.is_own_player_dead = function (self)
	local peer_id = self.peer_id
	local my_player = self.player_manager:player_from_peer_id(peer_id)
	local player_unit = my_player.player_unit

	if not player_unit or not Unit.alive(player_unit) then
		return true
	else
		local status_extension = ScriptUnit.extension(player_unit, "status_system")

		return status_extension.is_ready_for_assisted_respawn(status_extension)
	end

	return 
end
IngameHud._update_survival_ui = function (self, dt, t)
	local game_timer_ui = self.game_timer_ui

	if game_timer_ui then
		local mission_system = self.mission_system
		local active_missions, completed_missions = mission_system.get_missions(mission_system)

		if active_missions then
			local mission_data = active_missions.survival_wave

			if mission_data then
				game_timer_ui.update(game_timer_ui, dt, mission_data)

				local endurance_badge_ui = self.endurance_badge_ui

				if endurance_badge_ui then
					endurance_badge_ui.update(endurance_badge_ui, dt)
				end

				local difficulty_unlock_ui = self.difficulty_unlock_ui

				if difficulty_unlock_ui then
					difficulty_unlock_ui.update(difficulty_unlock_ui, dt, mission_data)
				end
			end
		end
	end

	return 
end
IngameHud.is_cutscene_active = function (self)
	local cutscene_system = self.cutscene_system

	return cutscene_system.active_camera and not cutscene_system.ingame_hud_enabled
end
IngameHud._update_clean_ui = function (self, dt, t, player, context)
	local has_tobii = rawget(_G, "Tobii") and Tobii.get_is_connected()

	if not has_tobii then
		return 
	end

	local use_clean_ui = Application.user_setting("tobii_eyetracking") and Application.user_setting("tobii_clean_ui")

	if not use_clean_ui then
		return 
	end

	local cleanui = self.cleanui

	if not self.cleanui then
		return 
	end

	UICleanUI.update(self.cleanui, dt, context)

	return 
end
IngameHud._update_crosshair_ui = function (self, dt, t, player, context)
	local player_unit = player.player_unit
	local crosshair_position_x, crosshair_position_y = self._update_crosshair_position(self, player_unit, dt)

	if self._crosshair_position_x ~= crosshair_position_x or self._crosshair_position_y ~= crosshair_position_y then
		self.crosshair:apply_crosshair_position(crosshair_position_x, crosshair_position_y)
		self.equipment_ui:apply_crosshair_position(crosshair_position_x, crosshair_position_y)
		self.gamepad_equipment_ui:apply_crosshair_position(crosshair_position_x, crosshair_position_y)
		self.overcharge_bar_ui:apply_crosshair_position(crosshair_position_x, crosshair_position_y)

		self._crosshair_position_x = crosshair_position_x
		self._crosshair_position_y = crosshair_position_y
	end

	return 
end
IngameHud._draw = function (self, dt, player, t, menu_active)
	local input_manager = self.input_manager
	local gamepad_active = input_manager.is_device_active(input_manager, "gamepad")
	local input_service = input_manager.get_service(input_manager, "ingame_menu")
	local active_cutscene = self.is_cutscene_active(self)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)

	if player and not active_cutscene then
		self.damage_indicator_gui:update(dt)
	end

	UIRenderer.end_pass(ui_renderer)

	return 
end
IngameHud.update = function (self, dt, t, menu_active, context)
	local active_cutscene = self.is_cutscene_active(self)
	local peer_id = self.peer_id
	local player = self.player_manager:player_from_peer_id(peer_id)

	self.gift_popup_ui:update(dt, t)
	self._draw(self, dt, player, t, menu_active)

	local player_list_active = self.ingame_player_list_ui.active
	local is_own_player_dead = self.is_own_player_dead(self)
	local gift_popup_active = self.gift_popup_ui:active()
	local disable_all_hud = gift_popup_active or active_cutscene or player_list_active
	local show_hud = not is_own_player_dead and not disable_all_hud
	local death_mode_visibility = not disable_all_hud and is_own_player_dead and not self.is_in_inn

	if show_hud ~= self.show_hud or death_mode_visibility ~= self.show_death_hud then
		self.set_visible(self, (is_own_player_dead and death_mode_visibility) or show_hud, player_list_active)

		self.show_hud = show_hud
		self.show_death_hud = death_mode_visibility
	end

	if show_hud then
		self._update_while_alive(self, dt, t, player, context)
	elseif death_mode_visibility then
		self._update_while_dead(self, dt, t, player, context)
	end

	self._update_always(self, dt, t, player, context)

	return 
end
IngameHud._update_always = function (self, dt, t, player, context)
	self._update_clean_ui(self, dt, t, player, context)
	self._update_crosshair_ui(self, dt, t, player, context)

	local active_cutscene = self.is_cutscene_active(self)

	if not active_cutscene then
	end

	if self.subtitle_gui then
		self.subtitle_gui:update(dt)
	end

	local ingame_player_list_ui = self.ingame_player_list_ui

	ingame_player_list_ui.update(ingame_player_list_ui, dt)

	if not script_data.disable_news_ticker and self.ingame_news_ticker_ui then
		self.ingame_news_ticker_ui:update(dt, t)
	end

	if self.gdc_build then
		self.gdc_start_ui:update(dt)
	end

	if self.damage_numbers_ui then
		self.damage_numbers_ui:update(dt)
	end

	if self.tutorial_intro_ui then
		self.tutorial_intro_ui:update(dt, t)
	end

	return 
end
IngameHud._update_while_alive = function (self, dt, t, player, context)
	local game_mode = Managers.state.game_mode:game_mode()
	local game_mode_disable_hud = game_mode.game_mode_hud_disabled and game_mode.game_mode_hud_disabled(game_mode)

	if not game_mode_disable_hud then
		if self.unit_frames_handler then
			local ignore_own_player = false

			self.unit_frames_handler:update(dt, t, ignore_own_player)
		end

		if self.player_inventory_ui then
			self.player_inventory_ui:update(dt, t, player)
		end
	end

	if self.game_timer_ui then
		self.game_timer_ui:update(dt)
	end

	self.interaction_ui:update(dt, t, player)
	self.crosshair:update(dt)

	if self.tutorial_input_ui then
		self.tutorial_input_ui:update(dt, t)
	end

	if not game_mode_disable_hud then
		self.item_received_feedback_ui:update(dt, t)
		self.bonus_dice_ui:update(dt)
		self.fatigue_ui:update(dt)
		self.overcharge_bar_ui:update(dt, t, player)

		if self.buff_ui then
			self.buff_ui:update(dt, t)
		end

		if self.news_feed_ui then
			self.news_feed_ui:update(dt, t)
		end

		if self.buff_presentation_ui then
			self.buff_presentation_ui:update(dt, t)
		end

		if self.twitch_vote_ui then
			self.twitch_vote_ui:update(dt, t)
		end

		if self.equipment_ui then
			self.equipment_ui:update(dt, t)
		end

		if self.gamepad_equipment_ui then
			self.gamepad_equipment_ui:update(dt, t)
		end

		if self.ability_ui then
			self.ability_ui:update(dt, t)
		end

		self.loot_objective:update(dt, t)
		self.wait_for_rescue_ui:update(dt, t)
		self.boss_health_ui:update(dt, t)
		self.positive_reinforcement_ui:update(dt, t)
	end

	self.mission_objective:update(dt, t)
	self.area_indicator:update(dt)

	if self.contract_log_ui then
		self.contract_log_ui:update(dt, t)
	end

	return 
end
IngameHud._update_while_dead = function (self, dt, t, player, context)
	local observer_ui = self.observer_ui

	if observer_ui then
		self.observer_ui:update(dt, t)
	end

	local game_mode = Managers.state.game_mode:game_mode()
	local game_mode_disable_hud = game_mode.game_mode_hud_disabled and game_mode.game_mode_hud_disabled(game_mode)

	if not game_mode_disable_hud and self.unit_frames_handler then
		local ignore_own_player = true

		self.unit_frames_handler:update(dt, t, ignore_own_player)
	end

	if self.game_timer_ui then
		self.game_timer_ui:update(dt)
	end

	self.mission_objective:update(dt, t)
	self.loot_objective:update(dt, t)
	self.wait_for_rescue_ui:update(dt, t)
	self.boss_health_ui:update(dt, t)
	self.positive_reinforcement_ui:update(dt, t)
	self.area_indicator:update(dt)

	return 
end
IngameHud.post_update = function (self, dt, t, hud_visible)
	local is_own_player_dead = self.is_own_player_dead(self)

	if hud_visible then
		self.gift_popup_ui:post_update(dt, t)
	end

	local ingame_player_list_ui = self.ingame_player_list_ui

	ingame_player_list_ui.post_update(ingame_player_list_ui, dt)

	return 
end
IngameHud._update_crosshair_position = function (self, player_unit, dt)
	local inv_res_scale = RESOLUTION_LOOKUP.inv_scale
	local position_x = RESOLUTION_LOOKUP.res_w * 0.5 * inv_res_scale
	local position_y = RESOLUTION_LOOKUP.res_h * 0.5 * inv_res_scale

	if not Unit.alive(player_unit) then
		return position_x, position_y
	end

	local eyetracking_extension = ScriptUnit.has_extension(player_unit, "eyetracking_system")

	if eyetracking_extension and eyetracking_extension.get_is_feature_enabled(eyetracking_extension, "tobii_extended_view") then
		local world_pos = eyetracking_extension.get_forward_rayhit(eyetracking_extension)

		if world_pos then
			local player = Managers.player:owner(player_unit)
			local viewport_name = player.viewport_name
			local world_name = player.viewport_world_name
			local world = Managers.world:world(world_name)
			local viewport = ScriptWorld.viewport(world, viewport_name)
			local camera = ScriptViewport.camera(viewport)
			local position_in_screen = Camera.world_to_screen(camera, world_pos)
			position_in_screen.z = 1
			position_in_screen.x = position_in_screen.x * inv_res_scale
			position_in_screen.y = position_in_screen.y * inv_res_scale

			return position_in_screen.x, position_in_screen.y
		end
	end

	return position_x, position_y
end

return 
