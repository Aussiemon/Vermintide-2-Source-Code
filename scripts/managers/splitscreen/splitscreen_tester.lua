SPLITSCREEN_ENABLED = false

require("scripts/managers/input/input_manager")

SplitscreenTester = class(SplitscreenTester)

if PLATFORM == "win32" then
	SplitScreenTesterKeymaps = {
		toggle_splitscreen = {
			input_mappings = {
				{
					"keyboard",
					"j",
					"pressed"
				}
			}
		}
	}
elseif PLATFORM == "xb1" then
	SplitScreenTesterKeymaps = {
		toggle_splitscreen = {
			combination_type = "and",
			input_mappings = {
				{
					"gamepad",
					"left_thumb",
					"held"
				},
				{
					"gamepad",
					"right_thumb",
					"pressed"
				}
			}
		}
	}
elseif PLATFORM == "ps4" then
	SplitScreenTesterKeymaps = {
		toggle_splitscreen = {
			combination_type = "and",
			input_mappings = {
				{
					"gamepad",
					"l3",
					"held"
				},
				{
					"gamepad",
					"r3",
					"pressed"
				}
			}
		}
	}
end

SPLITSCREEN_OFFSET_X = 0.1
SPLITSCREEN_OFFSET_Y = 0
SPLITSCREEN_WIDTH = 0.625
SPLITSCREEN_HEIGHT = 0.5
SPLITSCREEN_OTHER_OFFSET_X = 0.275
SPLITSCREEN_OTHER_OFFSET_Y = 0.5
SPLITSCREEN_OTHER_WIDTH = 0.625
SPLITSCREEN_OTHER_HEIGHT = 0.5
SPLITSCREEN_RES_X = 1920 * SPLITSCREEN_WIDTH
SPLITSCREEN_RES_Y = 1080 * SPLITSCREEN_HEIGHT
SplitscreenTester.init = function (self)
	self._setup_names(self)
	self._setup_background(self)
	self._setup_input(self)

	self._splitscreen_active = false
	UISettings.use_hud_screen_fit = true

	return 
end
SplitscreenTester._setup_names = function (self)
	self._world_name = "splitscreen_background"
	self._viewport_name = "splitscreen_viewport"

	return 
end
SplitscreenTester._setup_background = function (self)
	self._world = Managers.world:create_world(self._world_name, GameSettingsDevelopment.default_environment, nil, 0, Application.DISABLE_PHYSICS, Application.DISABLE_APEX_CLOTH)

	ScriptWorld.deactivate(self._world)

	self._viewport = ScriptWorld.create_viewport(self._world, self._viewport_name, "overlay", 1, nil, nil, nil, true)

	ScriptWorld.deactivate_viewport(self._world, self._viewport)

	self._gui = World.create_screen_gui(self._world, "immediate")

	return 
end
SplitscreenTester._setup_input = function (self)
	self.input_manager = InputManager:new()

	self.input_manager:initialize_device("keyboard", 1)
	self.input_manager:initialize_device("mouse", 1)
	self.input_manager:initialize_device("gamepad")

	if PLATFORM ~= "xb1" and PLATFORM ~= "ps4" then
	end

	self.input_manager:create_input_service("splitscreen_tester", "SplitScreenTesterKeymaps")
	self.input_manager:map_device_to_service("splitscreen_tester", "keyboard")
	self.input_manager:map_device_to_service("splitscreen_tester", "gamepad")

	return 
end
SplitscreenTester.add_splitscreen_viewport = function (self, world)
	self._splitscreen_viewport = ScriptWorld.create_viewport(world, "splitscreen_viewport", "default", 2, Vector3.zero(), Quaternion.identity(), true)
	self._splitscreen_world = world

	Viewport.set_data(self._splitscreen_viewport, "avoid_shading_callback", true)
	Viewport.set_data(self._splitscreen_viewport, "no_scaling", true)
	Viewport.set_rect(self._splitscreen_viewport, SPLITSCREEN_OTHER_OFFSET_X, SPLITSCREEN_OTHER_OFFSET_Y, SPLITSCREEN_OTHER_WIDTH, SPLITSCREEN_OTHER_HEIGHT)

	if not self._splitscreen_active then
		ScriptWorld.deactivate_viewport(world, self._splitscreen_viewport)
		ScriptWorld.deactivate_viewport(self._world, self._viewport)
	end

	return 
end
SplitscreenTester.remove_splitscreen_viewport = function (self)
	self._splitscreen_viewport = nil
	self._splitscreen_world = nil

	return 
end
SplitscreenTester.update = function (self, dt, t)
	self._update_input(self, dt, t)

	if self._splitscreen_active then
		self._fill_background(self, dt, t)
		self._update_splitscreen_camera(self, dt, t)
	elseif self._splitscreen_viewport and self._splitscreen_world then
		ScriptWorld.deactivate_viewport(self._splitscreen_world, self._splitscreen_viewport)
		ScriptWorld.deactivate_viewport(self._world, self._viewport)
	end

	return 
end
SplitscreenTester._fill_background = function (self, dt, t)
	local w, h = Application.screen_resolution()

	Gui.rect(self._gui, Vector3(0, 0, 0), Vector2(w, h), Color(0, 0, 0))

	return 
end
SplitscreenTester._update_splitscreen_camera = function (self, dt, t)
	if self._splitscreen_world and self._splitscreen_viewport then
		local active = Viewport.get_data(self._splitscreen_viewport, "active")
		local splitscreen_bot = Managers.player:bots()[1]

		if splitscreen_bot then
			local bot_unit = splitscreen_bot.player_unit

			if Unit.alive(bot_unit) then
				if not active then
					ScriptWorld.activate_viewport(self._splitscreen_world, self._splitscreen_viewport)
					ScriptWorld.activate_viewport(self._world, self._viewport)
				end

				local bot_unit = splitscreen_bot.player_unit
				local node = Unit.node(bot_unit, "j_head")
				local bot_fwd = Vector3.flat(Quaternion.forward(Unit.world_rotation(bot_unit, node)))
				local camera_rot = Quaternion.look(bot_fwd, Vector3.up())
				local camera_pos = Unit.world_position(bot_unit, node) + bot_fwd * 0.1
				local camera = ScriptViewport.camera(self._splitscreen_viewport)

				ScriptCamera.set_local_position(camera, camera_pos)
				ScriptCamera.set_local_rotation(camera, camera_rot)

				local camera_unit = Camera.get_data(camera, "unit")

				World.update_unit(self._splitscreen_world, camera_unit)
			end
		elseif active then
			ScriptWorld.deactivate_viewport(self._splitscreen_world, self._splitscreen_viewport)
		end
	end

	return 
end
SplitscreenTester._update_input = function (self, dt, t)
	self.input_manager:update(dt, t)

	local input_service = self.input_manager:get_service("splitscreen_tester")

	if input_service and input_service.get(input_service, "toggle_splitscreen") then
		print("hej")

		self._splitscreen_active = not self._splitscreen_active

		self._resize_viewports(self)
	end

	return 
end
SplitscreenTester._resize_viewports = function (self)
	local multiplier_x = (self._splitscreen_active and SPLITSCREEN_WIDTH) or 1 / SPLITSCREEN_WIDTH
	local multiplier_y = (self._splitscreen_active and SPLITSCREEN_HEIGHT) or 1 / SPLITSCREEN_HEIGHT
	local extra_offset_x = (self._splitscreen_active and SPLITSCREEN_OFFSET_X) or 0
	local extra_offset_y = (self._splitscreen_active and SPLITSCREEN_OFFSET_Y) or 0
	local worlds = Managers.world._worlds

	for _, world in pairs(worlds) do
		local viewports = World.get_data(world, "viewports")

		for _, viewport in pairs(viewports) do
			local no_scaling = Viewport.get_data(viewport, "no_scaling")

			if not no_scaling then
				local rect = Viewport.get_data(viewport, "rect")

				Viewport.set_rect(viewport, rect[1] * multiplier_x, rect[2] * multiplier_y, rect[3] * multiplier_x, rect[4] * multiplier_y, extra_offset_x)
				print("Resizing: " .. Viewport.get_data(viewport, "name"), rect[1] * multiplier_x, rect[2] * multiplier_y, rect[3] * multiplier_x, rect[4] * multiplier_y)
			end
		end
	end

	return 
end
SplitscreenTester.active = function (self)
	return self._splitscreen_active
end
SplitscreenTester.destroy = function (self)
	Managers.world:destroy_world(self._world_name)

	return 
end
viewport_set_rect = viewport_set_rect or Viewport.set_rect
Viewport.set_rect = function (viewport, offset_x, offset_y, size_x, size_y, extra_offset_x, extra_offset_y)
	local extra_offset_x = extra_offset_x or 0
	local extra_offset_y = extra_offset_y or 0

	Viewport.set_data(viewport, "rect", {
		offset_x,
		offset_y,
		size_x,
		size_y
	})
	viewport_set_rect(viewport, offset_x + extra_offset_x, offset_y + extra_offset_y, size_x, size_y)

	return 
end
application_resolution = application_resolution or Application.resolution
Application.resolution = function ()
	local splitscreen = (Managers.splitscreen and Managers.splitscreen:active()) or false
	local multiplier_x = (splitscreen and SPLITSCREEN_WIDTH) or 1
	local multiplier_y = (splitscreen and SPLITSCREEN_HEIGHT) or 1
	local w, h = application_resolution()

	return w * multiplier_x, h * multiplier_y
end
gui_resolution = gui_resolution or Gui.resolution
Gui.resolution = function ()
	local splitscreen = (Managers.splitscreen and Managers.splitscreen:active()) or false
	local multiplier_x = (splitscreen and SPLITSCREEN_WIDTH) or 1
	local multiplier_y = (splitscreen and SPLITSCREEN_HEIGHT) or 1
	local w, h = gui_resolution()

	return w * multiplier_x, h * multiplier_y
end
Application.screen_resolution = function ()
	return application_resolution()
end
camera_world_to_screen = camera_world_to_screen or Camera.world_to_screen
Camera.world_to_screen = function (...)
	local pos = camera_world_to_screen(...)

	if Managers.splitscreen and Managers.splitscreen:active() then
		pos[1] = pos[1] * SPLITSCREEN_WIDTH
	end

	return pos
end

return 
