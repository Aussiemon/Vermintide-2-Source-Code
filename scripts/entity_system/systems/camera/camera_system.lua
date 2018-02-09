require("scripts/unit_extensions/camera/generic_camera_extension")
require("scripts/unit_extensions/camera/states/camera_state_helper")
require("scripts/unit_extensions/camera/states/camera_state")
require("scripts/unit_extensions/camera/states/camera_state_idle")
require("scripts/unit_extensions/camera/states/camera_state_follow")
require("scripts/unit_extensions/camera/states/camera_state_follow_third_person")
require("scripts/unit_extensions/camera/states/camera_state_follow_third_person_ledge")
require("scripts/unit_extensions/camera/states/camera_state_follow_third_person_over_shoulder")
require("scripts/unit_extensions/camera/states/camera_state_follow_chaos_spawn_grabbed")
require("scripts/unit_extensions/camera/states/camera_state_observer")
require("scripts/unit_extensions/camera/states/camera_state_attract")
require("scripts/unit_extensions/camera/states/camera_state_map")

CameraSystem = class(CameraSystem, ExtensionSystemBase)
local extensions = {
	"GenericCameraExtension"
}
local RPCS = {
	"rpc_set_observer_camera"
}
CameraSystem.init = function (self, context, system_name)
	CameraSystem.super.init(self, context, system_name, extensions)

	self.camera_units = {}
	self.input_manager = context.input_manager
	local network_event_delegate = context.network_event_delegate

	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	self.network_event_delegate = network_event_delegate

	return 
end
CameraSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	return 
end
CameraSystem.idle_camera_dummy_spawned = function (self, camera_dummy_unit)
	local position = Unit.local_position(camera_dummy_unit, 0)
	local rotation = Unit.local_rotation(camera_dummy_unit, 0)

	for player, camera_unit in pairs(self.camera_units) do
		local camera_ext = ScriptUnit.extension(camera_unit, "camera_system")

		camera_ext.set_idle_position(camera_ext, position)
		camera_ext.set_idle_rotation(camera_ext, rotation)
	end

	return 
end
CameraSystem.external_state_change = function (self, player, state)
	local camera_unit = self.camera_units[player]

	if ScriptUnit.has_extension(camera_unit, "camera_system") then
		local camera_ext = ScriptUnit.extension(camera_unit, "camera_system")

		camera_ext.set_external_state_change(camera_ext, state)
	end

	return 
end
CameraSystem.set_follow_unit = function (self, player, follow_unit, follow_node_name)
	local camera_unit = self.camera_units[player]

	if ScriptUnit.has_extension(camera_unit, "camera_system") then
		local camera_ext = ScriptUnit.extension(camera_unit, "camera_system")
		local camera_state_ext = ScriptUnit.extension(camera_unit, "camera_state_machine_system")

		camera_ext.set_follow_unit(camera_ext, follow_unit, follow_node_name)

		local camera_state = camera_state_ext.state_machine.state_current

		if camera_state.refresh_follow_unit then
			local follow_node = (follow_unit and Unit.node(follow_unit, follow_node_name)) or nil

			camera_state.refresh_follow_unit(camera_state, follow_unit, follow_node)
		end
	end

	return 
end
CameraSystem.local_player_created = function (self, player)
	local camera_manager = Managers.state.camera
	local viewport_name = player.viewport_name

	self._setup_viewport(self, viewport_name)
	self._setup_camera(self, viewport_name)
	self._setup_camera_unit(self, player, viewport_name)
	camera_manager.set_camera_node(camera_manager, viewport_name, "first_person", "first_person_node")

	local camera_unit = self.camera_units[player]

	player.set_camera_follow_unit(player, camera_unit)

	return 
end
CameraSystem._setup_viewport = function (self, viewport_name)
	local camera_manager = Managers.state.camera

	camera_manager.create_viewport(camera_manager, viewport_name, Vector3.zero(), Quaternion.identity())

	return 
end
CameraSystem._setup_camera = function (self, viewport_name)
	local viewport = ScriptWorld.viewport(self.world, viewport_name)
	local camera = ScriptViewport.camera(viewport)
	local camera_manager = Managers.state.camera

	camera_manager.load_node_tree(camera_manager, viewport_name, "default", "world")
	camera_manager.load_node_tree(camera_manager, viewport_name, "first_person", "first_person")
	camera_manager.load_node_tree(camera_manager, viewport_name, "player_dead", "player_dead")
	camera_manager.load_node_tree(camera_manager, viewport_name, "cutscene", "cutscene")

	return 
end
CameraSystem._setup_camera_unit = function (self, player, viewport_name)
	local unit_name = DefaultUnits.standard.backlit_camera
	local unit_template_name = "camera_unit"
	local position = Vector3.zero()
	local rotation = Quaternion.identity()
	local camera_state_class_list = {
		CameraStateIdle,
		CameraStateFollow,
		CameraStateFollowThirdPerson,
		CameraStateFollowAttract,
		CameraStateFollowThirdPersonLedge,
		CameraStateFollowThirdPersonOverShoulder,
		CameraStateFollowChaosSpawnGrabbed,
		CameraStateObserver,
		CameraStateMap
	}
	local extension_init_data = {
		camera_state_machine_system = {
			start_state = "idle",
			camera_state_class_list = camera_state_class_list
		},
		camera_system = {
			player = player
		}
	}
	local camera_unit = Managers.state.unit_spawner:spawn_local_unit_with_extensions(unit_name, unit_template_name, extension_init_data, position, rotation)
	local camera_ext = ScriptUnit.extension(camera_unit, "camera_system")

	camera_ext.set_idle_position(camera_ext, position)
	camera_ext.set_idle_rotation(camera_ext, rotation)
	Unit.set_data(camera_unit, "camera", "settings_tree", "first_person")
	Unit.set_data(camera_unit, "camera", "settings_node", "first_person_node")

	self.camera_units[player] = camera_unit

	Managers.state.camera:set_node_tree_root_unit(viewport_name, "first_person", camera_unit, "rp_root", true)
	Managers.state.camera:set_node_tree_root_unit(viewport_name, "player_dead", camera_unit, "rp_root", true)
	Managers.state.camera:set_node_tree_root_unit(viewport_name, "default", camera_unit, "rp_root", true)

	if not script_data.disable_camera_backlight then
		local level_settings = LevelHelper:current_level_settings()
		local backlight = level_settings.camera_backlight

		if backlight then
			local light = Unit.light(camera_unit, "light")

			if light then
				Light.set_color(light, backlight.color:unbox())
				Light.set_intensity(light, backlight.intensity)
				Light.set_falloff_start(light, backlight.start_falloff)
				Light.set_falloff_end(light, backlight.end_falloff)
			end
		end
	end

	return 
end
CameraSystem.set_backlight_color = function (self, color, intensity)
	for _, unit in pairs(self.camera_units) do
		local light = Unit.light(unit, "light")

		Light.set_color(light, color)
		Light.set_intensity(light, intensity)
	end

	return 
end
CameraSystem.set_backlight_falloff = function (self, start_falloff, end_falloff, exponent)
	for _, unit in pairs(self.camera_units) do
		local light = Unit.light(unit, "light")

		Light.set_falloff_start(light, start_falloff)
		Light.set_falloff_end(light, end_falloff)
	end

	return 
end
CameraSystem.update = function (self, context)
	local dt = context.dt
	local t = context.t
	local camera_manager = Managers.state.camera

	for player, camera_unit in pairs(self.camera_units) do
		local viewport_name = player.viewport_name
		local tree_name = Unit.get_data(camera_unit, "camera", "settings_tree")
		local node_name = Unit.get_data(camera_unit, "camera", "settings_node")

		if node_name ~= camera_manager.current_camera_node(camera_manager, viewport_name) then
			camera_manager.set_camera_node(camera_manager, viewport_name, tree_name, node_name)
		end

		camera_manager.update(camera_manager, dt, t, viewport_name)
	end

	return 
end
CameraSystem.post_update = function (self, context)
	local dt = context.dt
	local t = context.t
	local camera_manager = Managers.state.camera

	for player, camera_unit in pairs(self.camera_units) do
		local viewport_name = player.viewport_name

		camera_manager.post_update(camera_manager, dt, t, viewport_name)
	end

	Managers.state.entity:system("tutorial_system"):pre_render_update(dt, t)

	return 
end
CameraSystem.rpc_set_observer_camera = function (self, sender, local_player_id)
	local player = Managers.player:local_player(local_player_id)

	CharacterStateHelper.change_camera_state(player, "observer")

	return 
end

return 
