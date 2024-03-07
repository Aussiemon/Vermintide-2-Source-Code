-- chunkname: @scripts/entity_system/systems/camera/camera_system.lua

require("scripts/unit_extensions/camera/generic_camera_extension")
require("scripts/unit_extensions/camera/states/camera_state_helper")
require("scripts/unit_extensions/camera/states/camera_state")
require("scripts/unit_extensions/camera/states/camera_state_idle")
require("scripts/unit_extensions/camera/states/camera_state_follow")
require("scripts/unit_extensions/camera/states/camera_state_follow_third_person")
require("scripts/unit_extensions/camera/states/camera_state_follow_third_person_ledge")
require("scripts/unit_extensions/camera/states/camera_state_follow_third_person_over_shoulder")
require("scripts/unit_extensions/camera/states/camera_state_follow_third_person_smart_climbing")
require("scripts/unit_extensions/camera/states/camera_state_follow_third_person_tunneling")
require("scripts/unit_extensions/camera/states/camera_state_follow_chaos_spawn_grabbed")
require("scripts/unit_extensions/camera/states/camera_state_observer")
require("scripts/unit_extensions/camera/states/camera_state_attract")
require("scripts/unit_extensions/camera/states/camera_state_interaction")
require("scripts/unit_extensions/camera/states/camera_state_observer_spectator")

CameraSystem = class(CameraSystem, ExtensionSystemBase)

local extensions = {
	"GenericCameraExtension",
}
local RPCS = {
	"rpc_set_observer_camera",
}

CameraSystem.init = function (self, context, system_name)
	CameraSystem.super.init(self, context, system_name, extensions)

	self.camera_units = {}
	self.unit_extension_data = {}
	self.input_manager = context.input_manager

	local network_event_delegate = context.network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	self.network_event_delegate = network_event_delegate
end

CameraSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)
end

CameraSystem.idle_camera_dummy_spawned = function (self, camera_dummy_unit)
	local position = Unit.local_position(camera_dummy_unit, 0)
	local rotation = Unit.local_rotation(camera_dummy_unit, 0)

	for player, camera_unit in pairs(self.camera_units) do
		local camera_ext = self.unit_extension_data[camera_unit]

		camera_ext:set_idle_position(position)
		camera_ext:set_idle_rotation(rotation)
	end
end

CameraSystem.external_state_change = function (self, player, state, params)
	local camera_unit = self.camera_units[player]
	local camera_ext = self.unit_extension_data[camera_unit]

	if camera_ext then
		camera_ext:set_external_state_change(state, params)
	end
end

CameraSystem.external_state_change_delayed = function (self, player, state, params, t)
	local camera_unit = self.camera_units[player]
	local camera_ext = self.unit_extension_data[camera_unit]

	if camera_ext then
		camera_ext:set_delayed_external_state_change(state, params, t)
	end
end

CameraSystem.set_follow_unit = function (self, player, follow_unit, follow_node_name)
	local camera_unit = self.camera_units[player]
	local camera_ext = self.unit_extension_data[camera_unit]

	if camera_ext then
		local camera_state_ext = ScriptUnit.extension(camera_unit, "camera_state_machine_system")

		camera_ext:set_follow_unit(follow_unit, follow_node_name)

		local camera_state = camera_state_ext.state_machine.state_current

		if camera_state.refresh_follow_unit then
			local follow_node = follow_unit and Unit.node(follow_unit, follow_node_name) or nil

			camera_state:refresh_follow_unit(follow_unit, follow_node)
		end
	end
end

CameraSystem.get_follow_data = function (self, player)
	local camera_unit = self.camera_units[player]
	local camera_ext = self.unit_extension_data[camera_unit]

	if camera_ext then
		local follow_unit, follow_unit_node = camera_ext:get_follow_data()

		return follow_unit, follow_unit_node
	end
end

CameraSystem.update_tunnel_camera_position = function (self, player, position)
	local camera_unit = self.camera_units[player]
	local camera_state_ext = ScriptUnit.has_extension(camera_unit, "camera_state_machine_system")

	if camera_state_ext then
		local camera_state = camera_state_ext.state_machine.state_current

		if camera_state.update_tunnel_camera_position then
			camera_state:update_tunnel_camera_position(position)
		end
	end
end

CameraSystem.local_player_created = function (self, player)
	local camera_manager = Managers.state.camera
	local viewport_name = player.viewport_name

	self:_setup_viewport(viewport_name)
	self:_setup_camera(viewport_name)
	self:_setup_camera_unit(player, viewport_name)
	camera_manager:set_camera_node(viewport_name, "first_person", "first_person_node")

	local camera_unit = self.camera_units[player]

	player:set_camera_follow_unit(camera_unit)
end

CameraSystem._setup_viewport = function (self, viewport_name)
	local camera_manager = Managers.state.camera

	camera_manager:create_viewport(viewport_name, Vector3.zero(), Quaternion.identity())
end

CameraSystem._setup_camera = function (self, viewport_name)
	local viewport = ScriptWorld.viewport(self.world, viewport_name)
	local camera = ScriptViewport.camera(viewport)
	local camera_manager = Managers.state.camera

	camera_manager:load_node_tree(viewport_name, "default", "world")
	camera_manager:load_node_tree(viewport_name, "first_person", "first_person")
	camera_manager:load_node_tree(viewport_name, "player_dead", "player_dead")
	camera_manager:load_node_tree(viewport_name, "cutscene", "cutscene")
end

CameraSystem._setup_camera_unit = function (self, player, viewport_name)
	local unit_name = DefaultUnits.standard.backlit_camera
	local unit_template_name = "camera_unit"
	local position = Vector3.zero()
	local rotation = Quaternion.identity()
	local camera_state_class_list = {}
	local profile_index = player:profile_index() or 1
	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local career_index = player:career_index() or 1
	local career = profile.careers[career_index]
	local camera_state_class_list = {}

	for _, camera_state_name in ipairs(career.camera_state_list) do
		camera_state_class_list[#camera_state_class_list + 1] = rawget(_G, camera_state_name)
	end

	local extension_init_data = {
		camera_state_machine_system = {
			start_state = "idle",
			camera_state_class_list = camera_state_class_list,
		},
		camera_system = {
			player = player,
		},
	}
	local camera_unit = Managers.state.unit_spawner:spawn_local_unit_with_extensions(unit_name, unit_template_name, extension_init_data, position, rotation)

	self.camera_units[player] = camera_unit

	local camera_ext = ScriptUnit.extension(camera_unit, "camera_system")

	self.unit_extension_data[camera_unit] = camera_ext

	camera_ext:set_idle_position(position)
	camera_ext:set_idle_rotation(rotation)
	Unit.set_data(camera_unit, "camera", "settings_tree", "first_person")
	Unit.set_data(camera_unit, "camera", "settings_node", "first_person_node")
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
end

CameraSystem.set_backlight_color = function (self, color, intensity)
	for _, unit in pairs(self.camera_units) do
		local light = Unit.light(unit, "light")

		Light.set_color(light, color)
		Light.set_intensity(light, intensity)
	end
end

CameraSystem.set_backlight_falloff = function (self, start_falloff, end_falloff, exponent)
	for _, unit in pairs(self.camera_units) do
		local light = Unit.light(unit, "light")

		Light.set_falloff_start(light, start_falloff)
		Light.set_falloff_end(light, end_falloff)
	end
end

local dummy_input = {}

CameraSystem.update = function (self, context)
	local dt = context.dt
	local t = context.t
	local camera_manager = Managers.state.camera

	for player, camera_unit in pairs(self.camera_units) do
		local viewport_name = player.viewport_name
		local node_name = Unit.get_data(camera_unit, "camera", "settings_node")

		if node_name ~= camera_manager:current_camera_node(viewport_name) then
			local tree_name = Unit.get_data(camera_unit, "camera", "settings_tree")

			camera_manager:set_camera_node(viewport_name, tree_name, node_name)
		end

		camera_manager:update(dt, t, viewport_name)

		local camera_ext = self.unit_extension_data[camera_unit]

		camera_ext:update(camera_unit, dummy_input, dt, context, t)
	end
end

CameraSystem.post_update = function (self, context)
	local dt = context.dt
	local t = context.t
	local camera_manager = Managers.state.camera

	for player, camera_unit in pairs(self.camera_units) do
		local viewport_name = player.viewport_name

		camera_manager:post_update(dt, t, viewport_name)
	end
end

CameraSystem.rpc_set_observer_camera = function (self, channel_id, local_player_id)
	local player = Managers.player:local_player(local_player_id)

	CharacterStateHelper.change_camera_state(player, "observer")
end

CameraSystem.initialize_camera_states = function (self, player, profile_index, career_index)
	local profile = SPProfiles[profile_index]
	local career = profile.careers[career_index]
	local camera_state_list = career.camera_state_list
	local camera_state_class_list = {}

	for _, camera_state_name in ipairs(camera_state_list) do
		camera_state_class_list[#camera_state_class_list + 1] = rawget(_G, camera_state_name)
	end

	local camera_state_extension = ScriptUnit.has_extension(player.camera_follow_unit, "camera_state_machine_system")

	camera_state_extension:reinitialize_camera_states(camera_state_class_list, "idle")
end
