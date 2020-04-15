CutsceneSystem = class(CutsceneSystem, ExtensionSystemBase)
local extensions = {
	"CutsceneCamera"
}

CutsceneSystem.init = function (self, context, name)
	CutsceneSystem.super.init(self, context, name, extensions)

	self.world = context.world
	self.cameras = {}
	self.active_camera = nil
	self.ingame_hud_enabled = nil
	self.event_on_activate = nil
	self.event_on_deactivate = nil
	self.event_on_skip = nil
	self.cutscene_started = false
	self._should_hide_loading_icon = false
	self.ui_event_queue = pdArray.new()
end

CutsceneSystem.destroy = function (self)
	self.world = nil
	self.cameras = nil
	self.active_camera = nil
	self.ui_event_queue = nil

	if self._should_hide_loading_icon then
		Managers.transition:hide_loading_icon()

		self._should_hide_loading_icon = nil
	end
end

CutsceneSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = CutsceneSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)
	self.cameras[unit] = extension

	return extension
end

CutsceneSystem.on_remove_extension = function (self, unit, extension_name)
	local camera_to_remove = self.cameras[unit]
	local active_camera = self.active_camera

	if active_camera == camera_to_remove then
		active_camera = nil
	end

	camera_to_remove = nil

	CutsceneSystem.super.on_remove_extension(self, unit, extension_name)
end

CutsceneSystem.update = function (self)
	local active_camera = self.active_camera

	if active_camera then
		self:set_first_person_mode(false)
		active_camera:update()
	end

	self:handle_loading_icon()
end

CutsceneSystem.handle_loading_icon = function (self)
	if self.active_camera then
		Managers.transition:show_loading_icon()
	elseif not self.active_camera and self._should_hide_loading_icon then
		Managers.transition:hide_loading_icon()

		self._should_hide_loading_icon = nil
	end
end

CutsceneSystem.skip_pressed = function (self)
	if self.active_camera and script_data.skippable_cutscenes then
		if self.event_on_skip then
			local level = LevelHelper:current_level(self.world)

			Level.trigger_event(level, self.event_on_skip)
		end

		self.event_on_skip = nil

		self:flow_cb_deactivate_cutscene_cameras()
		self:flow_cb_deactivate_cutscene_logic()
	end
end

CutsceneSystem.set_first_person_mode = function (self, enabled)
	local local_player = Managers.player:local_player()
	local player_unit = local_player.player_unit

	if Unit.alive(player_unit) then
		local status_extension = ScriptUnit.extension(player_unit, "status_system")

		if not enabled or not status_extension:is_disabled() then
			local first_person_extension = ScriptUnit.extension(player_unit, "first_person_system")

			if enabled ~= first_person_extension.first_person_mode then
				first_person_extension:set_first_person_mode(enabled)
			end
		end
	end
end

CutsceneSystem.flow_cb_activate_cutscene_camera = function (self, camera_unit, transition_data, ingame_hud_enabled, letterbox_enabled)
	if not self.active_camera then
		self:set_first_person_mode(false)
	end

	local camera = self.cameras[camera_unit]

	camera:activate(transition_data)

	self.active_camera = camera
	self.ingame_hud_enabled = ingame_hud_enabled
	self._should_hide_loading_icon = true

	if PLATFORM == "ps4" then
		Managers.state.event:trigger("realtime_multiplay", false)
	end

	if PLATFORM ~= "win32" then
		Application.set_time_step_policy("throttle", 30)
	end

	pdArray.push_back2(self.ui_event_queue, "set_letterbox_enabled", letterbox_enabled)
end

CutsceneSystem.flow_cb_deactivate_cutscene_cameras = function (self)
	self:set_first_person_mode(true)

	self.active_camera = nil
	self.ingame_hud_enabled = true

	if self._should_hide_loading_icon then
		Managers.transition:hide_loading_icon()

		self._should_hide_loading_icon = nil
	end

	if PLATFORM == "ps4" then
		Managers.state.event:trigger("realtime_multiplay", true)
	end

	if PLATFORM ~= "win32" then
		Application.set_time_step_policy("no_throttle")
	end

	pdArray.push_back2(self.ui_event_queue, "set_letterbox_enabled", false)
end

CutsceneSystem.flow_cb_activate_cutscene_logic = function (self, player_input_enabled, event_on_activate, event_on_skip)
	if event_on_activate then
		local level = LevelHelper:current_level(self.world)

		Level.trigger_event(level, event_on_activate)
	end

	self.event_on_skip = event_on_skip
	self.cutscene_started = true

	pdArray.push_back2(self.ui_event_queue, "set_player_input_enabled", player_input_enabled)
end

CutsceneSystem.flow_cb_deactivate_cutscene_logic = function (self, event_on_deactivate)
	if event_on_deactivate then
		local level = LevelHelper:current_level(self.world)

		Level.trigger_event(level, event_on_deactivate)
	end

	self.event_on_skip = nil

	pdArray.push_back2(self.ui_event_queue, "set_player_input_enabled", true)
end

CutsceneSystem.flow_cb_cutscene_effect = function (self, name, flow_params)
	if name == "fx_fade" then
		local args = {
			flow_params.fade_in_time,
			flow_params.hold_time,
			flow_params.fade_out_time,
			flow_params.color
		}

		pdArray.push_back2(self.ui_event_queue, name, args)

		return
	elseif name == "fx_text_popup" then
		local args = {
			flow_params.fade_in_time,
			flow_params.hold_time,
			flow_params.fade_out_time,
			flow_params.text
		}

		pdArray.push_back2(self.ui_event_queue, name, args)

		return
	end

	fassert(false, "[CutsceneSystem] Tried to register unknown cutsene effect named %q from flow", name)
end

CutsceneSystem.has_intro_cutscene_finished_playing = function (self)
	return self.cutscene_started and self.ingame_hud_enabled
end

CutsceneSystem.fade_game_logo = function (self, is_fade_in, time)
	if is_fade_in then
		self.fade_in_game_logo = true
		self.fade_in_game_logo_time = time
		self.fade_out_game_logo = nil
		self.fade_out_game_logo_time = nil
	else
		self.fade_out_game_logo = true
		self.fade_out_game_logo_time = time
		self.fade_in_game_logo = nil
		self.fade_in_game_logo_time = nil
	end
end

return
