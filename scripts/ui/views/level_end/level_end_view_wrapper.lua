LevelEndViewWrapper = class(LevelEndViewWrapper)

LevelEndViewWrapper.init = function (self, level_end_view_context)
	self._level_end_view_context = level_end_view_context

	self:_create_world()
	self:_create_ui_renderer(self._world)
	self:_create_input_service()

	self._level_end_view = LevelEndView:new(level_end_view_context)
end

LevelEndViewWrapper._create_world = function (self)
	local flags = {
		Application.DISABLE_SOUND,
		Application.DISABLE_ESRAM,
		Application.ENABLE_VOLUMETRICS
	}

	if Application.user_setting("disable_apex_cloth") then
		table.insert(flags, Application.DISABLE_APEX_CLOTH)
	else
		table.insert(flags, Application.APEX_LOD_RESOURCE_BUDGET)
		table.insert(flags, Application.user_setting("apex_lod_resource_budget") or ApexClothQuality.high.apex_lod_resource_budget)
	end

	local layer = 2
	local world_name = "end_screen"
	local level_name = "levels/end_screen/world"
	local viewport_type = "default"
	local viewport_name = "end_screen_viewport"
	local shading_environment = "environment/ui_end_screen"
	local world = Managers.world:create_world(world_name, shading_environment, nil, layer, unpack(flags))

	World.set_data(world, "avoid_blend", true)

	local game_won = self._level_end_view_context.game_won
	local object_set = (game_won and "flow_victory") or "flow_defeat"
	local object_sets = {
		object_set
	}
	local level = ScriptWorld.load_level(world, level_name, object_sets, nil, nil, nil)

	Level.spawn_background(level)

	local viewport = ScriptWorld.create_viewport(world, viewport_name, viewport_type, layer)
	local fov = 65
	local camera = ScriptViewport.camera(viewport)

	Camera.set_vertical_fov(camera, (math.pi * fov) / 180)

	self._world_viewport = viewport
	self._world = world
	self._top_world = Managers.world:world("top_ingame_view")
	self._level_end_view_context.world = world
	self._level_end_view_context.world_viewport = viewport
end

LevelEndViewWrapper._create_ui_renderer = function (self, world)
	local materials = {
		"material",
		"materials/ui/ui_1080p_hud_atlas_textures",
		"material",
		"materials/ui/ui_1080p_hud_single_textures",
		"material",
		"materials/ui/ui_1080p_menu_atlas_textures",
		"material",
		"materials/ui/ui_1080p_menu_single_textures",
		"material",
		"materials/ui/ui_1080p_common",
		"material",
		"materials/fonts/gw_fonts"
	}
	self._ui_renderer = UIRenderer.create(world, unpack(materials))
	self._ui_top_renderer = UIRenderer.create(self._top_world, unpack(materials))
	self._level_end_view_context.ui_renderer = self._ui_renderer
	self._level_end_view_context.ui_top_renderer = self._ui_top_renderer
end

LevelEndViewWrapper._create_input_service = function (self)
	local input_manager = Managers.input

	input_manager:create_input_service("end_of_level", "IngameMenuKeymaps", "EndLevelViewKeymapsFilters")
	input_manager:map_device_to_service("end_of_level", "keyboard")
	input_manager:map_device_to_service("end_of_level", "mouse")
	input_manager:map_device_to_service("end_of_level", "gamepad")
	input_manager:block_device_except_service("end_of_level", "keyboard", 1)
	input_manager:block_device_except_service("end_of_level", "mouse", 1)
	input_manager:block_device_except_service("end_of_level", "gamepad", 1)

	self._level_end_view_context.input_manager = input_manager
end

LevelEndViewWrapper.destroy = function (self)
	if not Managers.chat:chat_is_focused() then
		local input_manager = Managers.input

		input_manager:device_unblock_all_services("keyboard")
		input_manager:device_unblock_all_services("mouse")
		input_manager:device_unblock_all_services("gamepad")
	end

	self._level_end_view:destroy()

	self._level_end_view = nil

	UIRenderer.destroy(self._ui_renderer, self._world)

	self._ui_renderer = nil

	UIRenderer.destroy(self._ui_top_renderer, self._top_world)

	self._ui_top_renderer = nil

	Managers.world:destroy_world(self._world)

	self._world = nil
	self._top_world = nil
	self._level_end_view_context = nil
end

LevelEndViewWrapper.game_state_changed = function (self)
	self:_create_input_service()

	local input_manager = Managers.input
	self._level_end_view_context.input_manager = input_manager

	self._level_end_view:set_input_manager(input_manager)
end

LevelEndViewWrapper.start = function (self)
	self._level_end_view:start()
end

LevelEndViewWrapper.done = function (self)
	return self._level_end_view:done()
end

LevelEndViewWrapper.register_rpcs = function (self, network_event_delegate)
	self._level_end_view:register_rpcs(network_event_delegate)
end

LevelEndViewWrapper.unregister_rpcs = function (self)
	self._level_end_view:unregister_rpcs()
end

LevelEndViewWrapper.left_lobby = function (self)
	self._level_end_view:left_lobby()
end

LevelEndViewWrapper.level_end_view = function (self)
	return self._level_end_view
end

LevelEndViewWrapper.update = function (self, dt, t)
	self._level_end_view:update(dt, t)
end

return
