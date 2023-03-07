require(script_data.FEATURE_old_map_ui and "scripts/ui/views/deus_menu/deus_map_ui" or "scripts/ui/views/deus_menu/deus_map_ui_v2")
require("scripts/ui/views/deus_menu/deus_map_scene")

local REAL_PLAYER_LOCAL_ID = 1
DeusMapView = class(DeusMapView)
local INPUT_SERVICE_NAME = "deus_map_input_service_name"

DeusMapView.init = function (self, context)
	self._ui = DeusMapUI:new(context)
	self._scene = DeusMapScene:new()
	self._active = false
	self._deus_run_controller = context.deus_run_controller
	local input_manager = context.input_manager
	self._input_manager = input_manager
	self._network_event_delegate = context.network_event_delegate

	input_manager:create_input_service(INPUT_SERVICE_NAME, "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service(INPUT_SERVICE_NAME, "keyboard")
	input_manager:map_device_to_service(INPUT_SERVICE_NAME, "mouse")
	input_manager:map_device_to_service(INPUT_SERVICE_NAME, "gamepad")
end

DeusMapView.start = function (self, params)
	fassert(params, "DeusMapView needs params to be set in order to function properly, see GameModeMapDeus")

	self._finish_cb = params.finish_cb
	self._active = true
	local input_manager = self._input_manager

	input_manager:capture_input({
		"mouse"
	}, 1, INPUT_SERVICE_NAME, "DeusMapView")
	ShowCursorStack.push()
	input_manager:enable_gamepad_cursor()

	local input_service = input_manager:get_service(INPUT_SERVICE_NAME)

	self._scene:on_enter(self._deus_run_controller:get_graph_data(), input_service, callback(self, "_node_pressed"), callback(self, "_node_hovered"), callback(self, "_node_unhovered"))
	self._ui:on_enter(input_service)
	self:_start()
end

DeusMapView._finish = function (self)
	local input_manager = self._input_manager

	input_manager:release_input({
		"mouse"
	}, 1, INPUT_SERVICE_NAME, "DeusMapView")
	ShowCursorStack.pop()
	input_manager:disable_gamepad_cursor()

	self._active = false

	self._scene:on_finish()
end

DeusMapView.update = function (self, dt, t)
	if self._active then
		self:_update(dt, t)
	end

	self._ui:update(dt, t)
	self._scene:update(dt, t, Managers.input:is_device_active("gamepad"))
end

DeusMapView.post_update = function (self, dt, t)
	self._scene:post_update(dt, t)
end

DeusMapView.input_service = function (self)
	return self._input_manager:get_service(INPUT_SERVICE_NAME)
end

DeusMapView.is_active = function (self)
	return self._active
end

DeusMapView.destroy = function (self)
	if self._active then
		self:_finish()
	end

	self._scene:destroy()
	self._ui:destroy()
end

DeusMapView.register_rpcs = function (self, network_event_delegate, network_transmit)
	if network_event_delegate then
		local subclass_rpcs = self._get_rpcs and self:_get_rpcs()

		if subclass_rpcs then
			network_event_delegate:register(self, unpack(subclass_rpcs))
		end
	end
end

DeusMapView.unregister_rpcs = function (self)
	if self._network_event_delegate then
		self._network_event_delegate:unregister(self)
	end
end

DeusMapView._start = function (self, params)
	return
end

DeusMapView._update = function (self, dt, t)
	return
end

DeusMapView._get_rpcs = function (self)
	return
end

DeusMapView._node_pressed = function (self, node_key)
	return
end

DeusMapView._node_hovered = function (self, node_key)
	return
end

DeusMapView._node_unhovered = function (self)
	return
end
