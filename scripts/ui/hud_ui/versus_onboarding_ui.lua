-- chunkname: @scripts/ui/hud_ui/versus_onboarding_ui.lua

local definitions = local_require("scripts/ui/hud_ui/versus_onboarding_ui_definitions")
local scenegraph_definition = definitions.scenegraph
local widget_definitions = definitions.widgets
local animation_definitions = definitions.animations_definitions

VersusOnboardingUI = class(VersusOnboardingUI)

VersusOnboardingUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._render_settings = {
		snap_pixel_positions = true,
	}
	self._player_manager = ingame_ui_context.player_manager
	self._profile_synchronizer = ingame_ui_context.profile_synchronizer

	local player = ingame_ui_context.player

	self._player = player
	self._peer_id = player:network_id()
	self._local_player_id = player:local_player_id()
	self._local_player = self._player_manager:local_player()
	self._side = Managers.state.side:get_side_from_player_unique_id(player:unique_id())
	self._gamepad_active = self._input_manager:is_device_active("gamepad")

	self:_create_ui_elements()
end

VersusOnboardingUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
	self._animations = {}

	local widget_def
	local side = self._side:name()

	if self._side:name() == "heroes" then
		widget_def = UIWidgets.create_hero_onboarding_tutorial_widget("side_pivot_heroes", scenegraph_definition.side_pivot_heroes.size, {
			-400,
			0,
			5,
		})
	elseif self._side:name() == "dark_pact" then
		widget_def = UIWidgets.create_dark_pact_onboarding_tutorial_widget("side_pivot_dark_pact", scenegraph_definition.side_pivot_dark_pact.size, {
			-400,
			0,
			5,
		})
	end

	if widget_def then
		self._onboarding_widget = UIWidget.init(widget_def)
	end

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
end

VersusOnboardingUI.destroy = function (self)
	return
end

VersusOnboardingUI._setup_career_info_widget = function (self, profile_index, career_index)
	if not self._should_draw then
		return
	end

	self._current_profile_index = profile_index
	self._current_career_index = career_index

	local profile_settings, info_settings, career_settings
	local is_hero_side = self._side:name() ~= "dark_pact"

	if profile_index and career_index then
		profile_settings = SPProfiles[profile_index]
		career_settings = profile_settings.careers[career_index]
		info_settings = is_hero_side and self:_get_hero_side_info(career_settings) or career_settings.career_info_settings
	end

	if info_settings then
		local widget = self._onboarding_widget

		self:_populate_help_widget_info(profile_settings, career_settings, info_settings, widget, is_hero_side)
	end
end

VersusOnboardingUI._populate_help_widget_info = function (self, profile_settings, career_settings, info_settings, widget, is_hero)
	local content = widget.content
	local style = widget.style
	local abilities_string = ""
	local gamepad_active = self._input_manager:is_device_active("gamepad")

	for i = 1, 2 do
		local info = info_settings[i]
		local is_last = info_settings[i + 1] == nil

		if info then
			if is_hero then
				local input_str = ""
				local input_action = info.keybind

				if input_action then
					input_str = gamepad_active and " $KEY;Player__" .. input_action .. ": " or "{#color(193,91,36)}[" .. input_action .. "]{#reset()} : "
				end

				content["ability_" .. i .. "_icon"] = info.icon
				content["ability_" .. i .. "_name"] = input_str .. Localize(info.title)
				content["ability_" .. i .. "_description"] = info.description
			else
				local input_action

				input_action = gamepad_active and info.gamepad_input or info.input_action

				if input_action then
					local str = " $KEY;Player__" .. input_action .. ":"

					abilities_string = abilities_string .. string.format(Localize(info.description), str) .. (is_last and "" or "\n\n")
				else
					abilities_string = abilities_string .. Localize(info.description) .. (is_last and "" or "\n\n")
				end

				content.abilities_tooltip = abilities_string
				content.description = Localize(career_settings.description)
			end
		end
	end

	content.hero_text = Localize(career_settings.name)

	if is_hero then
		local profile_icon = UISettings.hero_icons.medium_white[profile_settings.display_name]

		content.career_icon = profile_icon

		local width = UIUtils.get_text_width(self._ui_renderer, style.hero_text, content.hero_text)
		local widget_size = scenegraph_definition.side_pivot_heroes.size
		local offset_x = widget_size[1] - (width + 25 + 64)

		style.career_icon.offset[1] = offset_x
	end
end

VersusOnboardingUI._set_widget_dirty = function (self, widget)
	widget.element.dirty = true
end

VersusOnboardingUI._update_career_status = function (self)
	local profile_index, career_index = self._profile_synchronizer:profile_by_peer(self._peer_id, self._local_player_id)
	local gamepad_active = self._input_manager:is_device_active("gamepad")

	if profile_index ~= self._current_profile_index or career_index ~= self._current_career_index or gamepad_active ~= self._gamepad_active then
		self._gamepad_active = gamepad_active

		self:_setup_career_info_widget(profile_index, career_index)
	end
end

VersusOnboardingUI._update_visibility = function (self)
	local is_dark_pact = self._side:name() == "dark_pact"
	local local_player_unit = self._local_player.player_unit
	local ghost_mode_ext = ScriptUnit.has_extension(local_player_unit, "ghost_mode_system")
	local is_in_ghost_mode = ghost_mode_ext and ghost_mode_ext:is_in_ghost_mode()

	if is_in_ghost_mode and Application.user_setting("toggle_pactsworn_help_ui") then
		return true
	end

	local input_service = Managers.input:get_service("Player")
	local held = input_service:get("show_career_help")
	local show = held and not is_in_ghost_mode

	return show
end

VersusOnboardingUI.update = function (self, dt, t)
	local should_draw = self:_update_visibility()

	if should_draw ~= self._should_draw then
		if self._anim_id and self._ui_animator:is_animation_completed(self._anim_id) then
			self._anim_id = nil
		end

		if not self._anim_id then
			local animation_name = should_draw and "enter" or "exit"
			local widget = self._onboarding_widget
			local params = {
				self = self,
			}

			self._anim_id = self._ui_animator:start_animation(animation_name, widget, scenegraph_definition, params)
		end
	end

	self:_update_career_status()
	self._ui_animator:update(dt, t)
	self:_draw(dt)
end

VersusOnboardingUI._draw = function (self, dt)
	if not self._should_draw then
		return
	end

	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_manager:get_service("ingame_menu")
	local render_settings = self._render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	if self._onboarding_widget then
		UIRenderer.draw_widget(ui_renderer, self._onboarding_widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

VersusOnboardingUI.get_input_texture_data = function (self, input_action, gamepad_active)
	local input_manager = self._input_manager
	local input_service = input_manager:get_service("Player")

	return UISettings.get_gamepad_input_texture_data(input_service, input_action, gamepad_active)
end

VersusOnboardingUI._get_hero_side_info = function (self, career_settings)
	local gamepad_active = self._input_manager:is_device_active("gamepad")
	local info_settings = {}
	local career_skill_data = {}
	local career_name = career_settings.name
	local profile = PROFILES_BY_CAREER_NAMES[career_name]
	local profile_index = profile.index
	local career_index = career_index_from_name(profile_index, career_name)
	local activated_ability_data = CareerUtils.get_ability_data(profile_index, career_index, 1)

	career_skill_data.title = activated_ability_data.display_name or "PLACEHOLDER"
	career_skill_data.description = UIUtils.get_ability_description(activated_ability_data) or Localize("PLACEHOLDER")
	career_skill_data.icon = activated_ability_data.icon or "icons_placeholder"
	career_skill_data.ability_type = Localize("hero_view_activated_ability")

	local input_action = gamepad_active and "ability" or "action_career"
	local button_texture_data, button_name = self:get_input_texture_data(input_action, gamepad_active)

	career_skill_data.keybind = gamepad_active and input_action or button_name

	local passive_skill_data = {}
	local passive_ability_data = CareerUtils.get_passive_ability_by_career(career_settings)

	passive_skill_data.title = passive_ability_data.display_name or "PLACEHOLDER"
	passive_skill_data.description = UIUtils.get_ability_description(passive_ability_data) or Localize("PLACEHOLDER")
	passive_skill_data.icon = passive_ability_data.icon or "icons_placeholder"
	passive_skill_data.ability_type = Localize("hero_view_passive_ability")

	table.insert(info_settings, career_skill_data)
	table.insert(info_settings, passive_skill_data)

	return info_settings
end
