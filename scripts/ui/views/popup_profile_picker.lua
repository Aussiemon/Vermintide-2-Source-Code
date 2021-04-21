local definitions = local_require("scripts/ui/views/popup_profile_picker_definitions")
local FatUI = FatUI
local FatUILayout = FatUILayout
local Vector2 = Vector2
local Vector3 = Vector3
PopupProfilePicker = class(PopupProfilePicker)

PopupProfilePicker.init = function (self, ingame_ui_context)
	local input_manager = ingame_ui_context.input_manager
	self._ingame_ui = ingame_ui_context.ingame_ui
	self._wwise_world = ingame_ui_context.wwise_world
	self._input_manager = input_manager
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer

	input_manager:create_input_service("popup_profile_picker", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service("popup_profile_picker", "keyboard")
	input_manager:map_device_to_service("popup_profile_picker", "mouse")
	input_manager:map_device_to_service("popup_profile_picker", "gamepad")

	local input_service = Managers.input:get_service("popup_profile_picker")
	self._menu_input_desc = MenuInputDescriptionUI:new(nil, self._ui_top_renderer, input_service, 5, 900, definitions.generic_input_actions.default)

	self._menu_input_desc:set_input_description(nil)
	self:_initialize_data()
end

PopupProfilePicker._initialize_data = function (self)
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local profiles = {}

	for priority_index = 1, #ProfilePriority, 1 do
		local profile_index = ProfilePriority[priority_index]
		local profile_settings = SPProfiles[profile_index]
		local profile_name = profile_settings.display_name
		local profile_experience = hero_attributes:get(profile_name, "experience") or 0
		local profile_level = ExperienceSettings.get_level(profile_experience)
		local careers = {}
		local profile = {
			unavailable = true,
			index = profile_index,
			name = profile_settings.display_name,
			display_name = Localize(profile_settings.ingame_display_name),
			level = profile_level,
			texture = profile_settings.hero_selection_image,
			careers = careers
		}
		profiles[priority_index] = profile
		local profile_careers = profile_settings.careers

		for career_index = 1, #profile_careers, 1 do
			local career_settings = profile_careers[career_index]
			local is_career_unlocked, _, dlc_name = career_settings:is_unlocked_function(profile_name, profile_level)
			careers[career_index] = {
				index = career_index,
				name = career_settings.name,
				display_name = Localize(career_settings.display_name),
				profile = profile,
				locked = not is_career_unlocked,
				dlc_name = dlc_name,
				texture = "medium_" .. career_settings.portrait_image
			}
		end
	end

	self._profiles = profiles
	self._selected_profile = profiles[1]
	self._selected_career = self._selected_profile.careers[1]
end

local function UI_draw_profile_button(was_selected, profile, pos, size)
	local data, is_clicked = FatUI.use_behaviour(profile.display_name, "behaviour_button", pos, size)
	local state = data.state
	local is_selected = false
	local available = not profile.unavailable

	if not available then
		local lock_size = Vector2(100, 100)
		local lock_pos = Vector3(0, 0, 1) + FatUILayout.align_box(FatUILayout.CENTER, lock_size, pos, size)

		FatUI.draw_texture("hero_icon_unavailable", lock_pos, lock_size)
	end

	if is_clicked and not was_selected then
		if not profile.locked then
			FatUI.play_sound("play_gui_hero_select_hero_click")

			is_selected = true
		elseif career.dlc_name then
			FatUI.play_sound("Play_gui_locked_content")
		end
	elseif FatUI.on_hover(data) then
		FatUI.play_sound("Play_hud_hover")
	end

	if was_selected then
		local glow_length = 1.9074074074074074 * size[1]
		local glow_size = Vector2(glow_length, glow_length)
		local glow_pos = FatUILayout.align_box(FatUILayout.CENTER, glow_size, pos, size)

		FatUI.draw_texture("hero_icon_glow", glow_pos, glow_size)
	end

	local alpha = 230

	if data.is_hover then
		alpha = 255
	end

	FatUI.draw_texture(profile.texture, pos, size, Color(alpha, 255, 255, 255))

	return is_selected
end

local function UI_draw_career_button(was_selected, career, pos, size)
	if not career then
		local bg_size = Vector2(120, 140)

		FatUI.draw_texture("character_slot_empty", FatUILayout.align_box(FatUILayout.CENTER, bg_size, pos, size), bg_size)

		local lock_size = Vector2(76, 87)

		FatUI.draw_texture("icon_hourglass", FatUILayout.align_box(FatUILayout.CENTER, lock_size, pos, size), lock_size)

		return false
	end

	local data, is_clicked = FatUI.use_behaviour(career.display_name, "behaviour_button", pos, size)
	local state = data.state
	local is_selected = false

	if is_clicked and not was_selected then
		if not career.locked then
			is_selected = true

			FatUI.play_sound("play_gui_hero_select_career_click")
		elseif career.dlc_name then
			FatUI.play_sound("Play_gui_locked_content")
		end
	elseif FatUI.on_hover(data) then
		FatUI.play_sound("play_gui_start_menu_button_hover")
	end

	if was_selected then
		local frame_settings = UIFrameSettings.frame_outer_glow_01
		local frame_width = frame_settings.texture_sizes.horizontal[2]
		local frame_padding = Vector2(frame_width, frame_width)

		FatUI.draw_frame("frame_outer_glow_01", pos - frame_padding, size + 2 * frame_padding)
	end

	local available = true

	if career.profile.unavailable then
		local lock_size = Vector2(100, 100)
		local lock_pos = Vector3(0, 0, 1) + FatUILayout.align_box(FatUILayout.CENTER, lock_size, pos, size)

		FatUI.draw_texture("hero_icon_unavailable", lock_pos, lock_size)

		available = false
	elseif career.locked then
		local lock_size = Vector2(76, 87)
		local lock_pos = Vector3(0, 0, 1) + FatUILayout.align_box(FatUILayout.CENTER, lock_size, pos, size)
		local locked_texture = "hero_icon_locked"

		if career.dlc_name then
			locked_texture = "hero_icon_locked_gold"
		end

		FatUI.draw_texture(locked_texture, lock_pos, lock_size)

		available = false
	end

	local alpha = 230

	if data.is_hover then
		alpha = 255
	end

	if available then
		FatUI.draw_texture(career.texture, pos, size, Color(alpha, 255, 255, 255))
	else
		FatUI.draw_texture_saturated(career.texture, pos, size, Color(alpha, 255, 255, 255))
	end

	FatUI.draw_frame("menu_frame_12", Vector3(0, 0, 1) + pos, size)

	if career.dlc_name then
		FatUI.draw_frame("frame_corner_detail_01_gold", pos + Vector3(0, 0, 2), size)
	end

	return is_selected
end

local function UI_draw_info_panel(selected_profile, selected_career, info_pos, info_size)
	local info_lvl_size = Vector2(124, 138)
	local info_lvl_pos = Vector3(-62, 0, 2) + FatUILayout.align_box(FatUILayout.WEST, info_lvl_size, info_pos, info_size)

	FatUI.draw_texture("hero_level_bg", info_lvl_pos, info_lvl_size)
	FatUI.draw_text_multiline(selected_profile.level, "materials/fonts/gw_body", 52, FatUILayout.CENTER, Vector2(0, 5) + info_lvl_pos, info_lvl_size, Colors.get("font_default"))
	FatUI.draw_texture("item_slot_side_fade", info_pos, info_size, Color(0, 0, 0))
	FatUI.draw_bitmap("item_slot_side_effect", info_pos, info_size, Colors.get("font_title"))
	FatUI.draw_text_multiline(selected_career.display_name, "materials/fonts/gw_head", 40, FatUILayout.SOUTH_WEST, Vector3(75, 65, 1) + info_pos, info_size, Colors.get("font_title"))
	FatUI.draw_text_multiline(selected_profile.display_name, "materials/fonts/gw_body", 30, FatUILayout.NORTH_WEST, Vector3(75, -60, 1) + info_pos, info_size, Colors.get("font_default"))
end

PopupProfilePicker._draw = function (self, dt, t, time_left)
	FatUI.begin_group("PopupProfilePicker")

	local window_size = Vector2(975, (FatUI.gamepad_type and 600) or 720)
	local window_pos = FatUILayout.align_box(FatUILayout.CENTER, window_size, Vector3.zero(), FatUI.canvas)

	FatUI.draw_default_window("window", Localize("join_popup_title"), window_pos, window_size)
	FatUI.draw_text_multiline(Localize("join_popup_sub_title"), "materials/fonts/gw_body", 24, FatUILayout.NORTH, Vector3(0, -50, 2) + window_pos, window_size, Colors.get("font_default"))

	if time_left then
		local str = string.format("%s\n%02d:%02d", Localize("join_popup_timer_title"), time_left / 60, time_left % 60)

		FatUI.draw_text_multiline(str, "materials/fonts/gw_head", 28, FatUILayout.NORTH_EAST, Vector3(-50, -30, 3) + window_pos, window_size, Colors.get("font_default"))
	end

	local profile_list = self._profiles
	local profile_list_n = #profile_list
	local profile_size = Vector2(80, 80)
	local profile_width = profile_size[1] + 20
	local profile_root_pos = Vector3(0, -150, 3) + FatUILayout.align_box(FatUILayout.NORTH, Vector2(profile_width * profile_list_n, profile_size[2]), window_pos, window_size)

	for i = 1, profile_list_n, 1 do
		local profile = profile_list[i]
		local profile_pos = profile_root_pos + Vector2(profile_width * (i - 1), 0)
		local is_selected = self._selected_profile == profile

		if UI_draw_profile_button(is_selected, profile, profile_pos, profile_size) then
			local selected_career_index = math.min(self._selected_career.index, #profile.careers)
			self._selected_profile = profile
			self._selected_career = profile.careers[selected_career_index]
		end
	end

	local career_list = (self._selected_profile and self._selected_profile.careers) or profile_list[1]
	local career_list_n = 4
	local career_size = Vector2(110, 130)
	local career_width = 130
	local career_root_pos = Vector3(0, -175 - profile_size[2], 3) + FatUILayout.align_box(FatUILayout.NORTH, Vector2(career_width * career_list_n, career_size[2]), window_pos, window_size)

	for i = 1, career_list_n, 1 do
		local career = career_list[i]
		local career_pos = career_root_pos + Vector2(career_width * (i - 1), 0)
		local is_selected = self._selected_career == career

		if UI_draw_career_button(is_selected, career, career_pos, career_size) then
			self._selected_career = career
		end
	end

	local selected_profile = self._selected_profile
	local selected_career = self._selected_career
	local info_size = Vector2(441, 118)
	local info_pos = Vector3(65, -430, 3) + FatUILayout.align_box(FatUILayout.NORTH, info_size, window_pos, window_size)

	UI_draw_info_panel(selected_profile, selected_career, info_pos, info_size)

	local gamepad_type = FatUI.gamepad_type

	if gamepad_type then
		self:_draw_gamepad_actions(gamepad_type, dt)
	else
		local button_size = Vector2(300, 70)
		local button_1_pos = Vector3(80, 50, 3) + FatUILayout.align_box(FatUILayout.SOUTH_WEST, button_size, window_pos, window_size)
		local button_2_pos = Vector3(-80, 50, 3) + FatUILayout.align_box(FatUILayout.SOUTH_EAST, button_size, window_pos, window_size)

		if FatUI.draw_default_button("confirm", Localize("input_description_confirm"), button_1_pos, button_size) then
			self:_try_confirm()
		end

		if FatUI.draw_default_button("cancel", Localize("input_description_cancel"), button_2_pos, button_size) then
			self:_try_cancel()
		end
	end

	FatUI.close_group("PopupProfilePicker")
end

PopupProfilePicker._try_confirm = function (self)
	local selected_profile = self._selected_profile
	local selected_career = self._selected_career

	if not selected_profile.unavailable and not selected_career.locked then
		self:set_result(true)
	end
end

PopupProfilePicker._try_cancel = function (self)
	self:set_result(false, "cancelled")
end

PopupProfilePicker.update = function (self, dt, t)
	local cancel_at_t = self._cancel_at_t
	local time_left = cancel_at_t and cancel_at_t - t

	if cancel_at_t and time_left <= 0 then
		time_left = 0

		self:set_result(false, "timed_out")

		return
	end

	self:_update_unavailable()
	self:_draw(dt, t, time_left)
	self:_handle_input()
end

PopupProfilePicker._draw_gamepad_actions = function (self, gamepad_type, dt)
	local left_texture_settings = ButtonTextureByName("left_shoulder", gamepad_type)
	local size = Vector2(left_texture_settings.size[1], left_texture_settings.size[2])
	local pos = Vector3(680 - left_texture_settings.size[1] * 0.5, 637, 900)

	FatUI.draw_texture(left_texture_settings.texture, pos, size)

	local right_texture_settings = ButtonTextureByName("right_shoulder", gamepad_type)
	local size = Vector2(right_texture_settings.size[1], right_texture_settings.size[2])
	local pos = Vector3(1240 - left_texture_settings.size[1], 637, 900)

	FatUI.draw_texture(right_texture_settings.texture, pos, size)
	self._menu_input_desc:draw(self._ui_top_renderer, dt)
end

PopupProfilePicker._update_unavailable = function (self)
	local lobby_data = self._lobby_data
	local profiles = self._profiles

	for i = 1, #profiles, 1 do
		local profile = profiles[i]
		profile.unavailable = not ProfileSynchronizer.is_free_in_lobby(profile.index, lobby_data)
	end
end

PopupProfilePicker._INPUT_DEVICES = {
	"keyboard",
	"gamepad",
	"mouse"
}

PopupProfilePicker._select_profile = function (self, profile_index)
	local career_index = self._selected_career.index
	local profiles = self._profiles
	profile_index = math.clamp(profile_index, 1, #profiles)
	local profile = profiles[profile_index]
	self._selected_profile = profile
	local careers = profile.careers
	career_index = math.clamp(career_index, 1, #careers)
	self._selected_career = careers[career_index]
end

PopupProfilePicker._select_career = function (self, career_index)
	local careers = self._selected_profile.careers
	career_index = math.clamp(career_index, 1, #careers)
	self._selected_career = careers[career_index]
end

PopupProfilePicker._handle_input = function (self)
	local input_service = self:input_service()
	local profile_index = table.find(self._profiles, self._selected_profile) or 1

	if input_service:get("cycle_next") then
		self:_select_profile(profile_index + 1)
	elseif input_service:get("cycle_previous") then
		self:_select_profile(profile_index - 1)
	end

	local career_index = self._selected_career.index

	if input_service:get("move_right") then
		self:_select_career(career_index + 1)
	elseif input_service:get("move_left") then
		self:_select_career(career_index - 1)
	end

	if input_service:get("confirm") then
		self:_try_confirm()
	elseif input_service:get("back") or input_service:get("toggle_menu") then
		self:_try_cancel()
	end
end

PopupProfilePicker.show = function (self, current_profile_index, current_career_index, time_until_cancel, join_by_lobby_browser, _difficulty, lobby_data)
	self._join_lobby_result = nil
	self._cancel_at_t = time_until_cancel and Managers.time:time("ui") + time_until_cancel

	self._ingame_ui:handle_transition((join_by_lobby_browser and "exit_menu") or "close_active")
	ShowCursorStack.push()
	self._input_manager:capture_input(self._INPUT_DEVICES, 1, "popup_profile_picker", "PopupProfilePicker")

	self._lobby_data = lobby_data
end

PopupProfilePicker.hide = function (self)
	self._input_manager:release_input(self._INPUT_DEVICES, 1, "popup_profile_picker", "PopupProfilePicker")
	ShowCursorStack.pop()

	self._lobby_data = nil
end

PopupProfilePicker.set_result = function (self, accepted, cancel_reason)
	self._join_lobby_result = {
		accepted = accepted,
		selected_hero_name = accepted and self._selected_profile.name,
		selected_career_name = accepted and self._selected_career.name,
		reason = (not accepted and cancel_reason) or nil
	}
end

PopupProfilePicker.query_result = function (self)
	return self._join_lobby_result
end

PopupProfilePicker.set_difficulty = function (self, difficulty)
	return
end

PopupProfilePicker.input_service = function (self)
	return self._input_manager:get_service("popup_profile_picker")
end

return
