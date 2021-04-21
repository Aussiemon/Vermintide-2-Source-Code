require("scripts/ui/views/deus_menu/deus_run_stats_ui")

DeusRunStatsView = class(DeusRunStatsView)
local REAL_PLAYER_LOCAL_ID = 1

DeusRunStatsView.init = function (self, parent, ingame_ui_context)
	self._ui = DeusRunStatsUi:new(ingame_ui_context, self)
	self._ingame_hud = parent
	self._is_server = ingame_ui_context.is_server
	self._deus_run_controller = Managers.mechanism:game_mechanism():get_deus_run_controller()
	local input_service_name = "deus_run_stats_view"
	local input_manager = ingame_ui_context.input_manager
	self._input_manager = input_manager
	self._input_service_name = input_service_name

	input_manager:create_input_service(input_service_name, "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service(input_service_name, "keyboard")
	input_manager:map_device_to_service(input_service_name, "gamepad")
	input_manager:map_device_to_service(input_service_name, "mouse")
end

DeusRunStatsView.on_enter = function (self)
	self._input_manager:capture_input({
		"keyboard",
		"gamepad",
		"mouse"
	}, 1, self._input_service_name, "DeusRunStatsView")
end

DeusRunStatsView.on_exit = function (self)
	self._input_manager:release_input({
		"keyboard",
		"gamepad",
		"mouse"
	}, 1, self._input_service_name, "DeusRunStatsView")
end

DeusRunStatsView.update = function (self, dt, t)
	self._ui:update(dt, t)
	self:_handle_input(dt, t)
end

DeusRunStatsView.input_service = function (self)
	return self._input_manager:get_service(self._input_service_name)
end

DeusRunStatsView.is_ui_active = function (self)
	return self._ui:active()
end

DeusRunStatsView._handle_input = function (self, dt, t)
	local input_service = self._input_manager:get_service(self._input_service_name)
	local new_active = input_service:get("hotkey_deus_inventory", false)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local ui_active = self._ui:active()

	if ui_active then
		if input_service:get("right_press") then
			self._ui:lock(true)
		end
	elseif ui_active ~= new_active and new_active == true then
		self:_update_top_bar()
		self:_update_dynamic_values()

		if gamepad_active then
			self._ui:lock(true)
		end
	end

	self._ui:set_active(self._ui:locked() or new_active)
end

DeusRunStatsView.destroy = function (self)
	self._ui:destroy()
end

DeusRunStatsView._update_top_bar = function (self)
	local peer_id = self._deus_run_controller:get_own_peer_id()
	local profile_index, career_index = self._deus_run_controller:get_player_profile(peer_id, REAL_PLAYER_LOCAL_ID)
	local player_level = self._deus_run_controller:get_player_level(peer_id)
	local portrait_frame = self._deus_run_controller:get_player_frame(peer_id)
	local profile_settings = SPProfiles[profile_index]
	local career_settings = profile_settings.careers[career_index]
	local ingame_display_name = (profile_settings and profile_settings.ingame_display_name) or "unspawned"
	local difficulty_name = self._deus_run_controller:get_run_difficulty()
	local node = self._deus_run_controller:get_current_node()
	local level_key = node.level
	local level_settings = LevelSettings[level_key]
	local level_name = level_settings.display_name
	local curse = node.curse
	local mutator_handler = Managers.state.game_mode._mutator_handler
	local is_active = mutator_handler:has_activated_mutator(curse)
	local curse_data = nil

	if curse and is_active then
		local mutator_templates = MutatorTemplates
		curse_data = curse and {
			sub_title = "deus_curse",
			display_name = mutator_templates[curse].display_name,
			description = mutator_templates[curse].description,
			icon = mutator_templates[curse].icon
		}
	end

	local data = {
		curse = curse_data,
		level_name = level_name,
		difficulty_name = DifficultySettings[difficulty_name].display_name,
		career_display_name = career_settings.display_name,
		portrait_frame = portrait_frame,
		portrait_image = career_settings.portrait_image,
		player_level_text = player_level or "n/a",
		ingame_display_name = ingame_display_name
	}

	self._ui:update_top_bar(data)
end

DeusRunStatsView._update_dynamic_values = function (self)
	local run_controller = self._deus_run_controller
	local blessings = run_controller:get_blessings()
	local peer_id = run_controller:get_own_peer_id()
	local power_ups = run_controller:get_player_power_ups(peer_id, REAL_PLAYER_LOCAL_ID)
	local party_power_ups = run_controller:get_party_power_ups()
	local profile_index, career_index = run_controller:get_player_profile(peer_id, REAL_PLAYER_LOCAL_ID)
	local data = {
		blessings = blessings,
		power_ups = power_ups,
		party_power_ups = party_power_ups,
		profile_index = profile_index,
		career_index = career_index
	}

	self._ui:update_dynamic_values(data)
end

return
