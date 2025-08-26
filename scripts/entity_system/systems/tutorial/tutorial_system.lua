-- chunkname: @scripts/entity_system/systems/tutorial/tutorial_system.lua

require("scripts/entity_system/systems/tutorial/tutorial_templates")
require("scripts/entity_system/systems/tutorial/tutorial_condition_evaluator")

local TIME_TO_WAIT_BETWEEN_SHOWS = 30
local TOOLTIP_MINIMUM_SHOW_TIME = 0.3
local INFOSLATE_COOLDOWN = 100
local DO_TUT_RELOAD = true

function tutprintf(...)
	if script_data.tutorial_debug then
		printf(...)
	end
end

local function on_save_ended_callback()
	print("Tutorial - save done")
end

local function save(extension)
	local save_data = SaveData

	save_data.tutorial_points = extension.points
	save_data.completed_tutorials = extension.completed_tutorials

	Managers.save:auto_save(SaveFileName, SaveData, on_save_ended_callback)
end

local extensions = {
	"PlayerTutorialExtension",
	"ObjectiveHealthTutorialExtension",
	"ObjectivePickupTutorialExtension",
	"ObjectiveSocketTutorialExtension",
	"ObjectiveUnitExtension",
}

TutorialSystem = class(TutorialSystem, ExtensionSystemBase)

TutorialSystem.init = function (self, entity_system_creation_context, system_name)
	TutorialSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	self.player_units = {}
	self.pacing = "pacing_relax"
	self.dice_keeper = entity_system_creation_context.dice_keeper
	self.health_extensions = {}
	self.raycast_units = {}
	self._objective_tooltip_prioritized_list = nil
	self.frozen_unit_extension_data = {}
	self.unit_extension_data = {}
	self.gui = World.create_screen_gui(self.world, "material", "materials/fonts/gw_fonts", "immediate")

	local network_event_delegate = entity_system_creation_context.network_event_delegate

	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, "rpc_tutorial_message", "rpc_pacing_changed", "rpc_objective_unit_set_active", "rpc_prioritize_objective_tooltip", "rpc_objective_unit_set_always_show")

	SaveData.seen_handbook_popups = SaveData.seen_handbook_popups or {}

	Managers.state.event:register(self, "tutorial_trigger", "on_tutorial_trigger")

	self._condition_context = TutorialConditionEvaluator:new()
	DO_TUT_RELOAD = false
end

TutorialSystem.destroy = function (self)
	Managers.state.event:unregister(self, "tutorial_trigger")
	self.network_event_delegate:unregister(self)
	table.clear(self)
end

local dummy_input = {}

TutorialSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = {}

	if extension_name == "PlayerTutorialExtension" then
		self.player_units[unit] = extension
		extension.completed_tutorials = SaveData.completed_tutorials or {}
		extension.points = #extension.completed_tutorials
		extension.tooltip_tutorial = {
			active = false,
		}
		extension.objective_tooltips = {
			active = false,
			units_n = 0,
			units = {},
		}
		extension.shown_times = {}
		extension.data = {
			player_id = Network.peer_id(),
			statistics_db = self.statistics_db,
			dice_keeper = self.dice_keeper,
		}

		local tutorial_templates = TutorialTemplates

		for name, template in pairs(tutorial_templates) do
			extension.shown_times[name] = -1000

			template.init_data(extension.data)
		end
	end

	if extension_name == "ObjectiveHealthTutorialExtension" then
		Managers.state.event:trigger("tutorial_event_add_health_bar", unit)

		self.health_extensions[unit] = extension
	end

	if extension_name == "ObjectivePickupTutorialExtension" then
		extension.approach_text = Unit.get_data(unit, "approach_text") or "<approach_text not set>"
		extension.disregard = Unit.get_data(unit, "disable_objective_ui") or false
	end

	if extension_name == "ObjectiveSocketTutorialExtension" then
		extension.approach_text = Unit.get_data(unit, "approach_text") or "<approach_text not set>"
		extension.pickup_text = Unit.get_data(unit, "pickup_text") or "<pickup_text not set>"
	end

	if extension_name == "ObjectiveUnitExtension" then
		local server_only = Unit.get_data(unit, "objective_server_only")
		local network_synced
		local level_transition_handler = Managers.level_transition_handler
		local level_key = level_transition_handler:get_current_level_keys()
		local level_settings = LevelSettings[level_key]

		if level_settings.hub_level then
			network_synced = Unit.get_data(unit, "network_synced")
		else
			network_synced = true
		end

		local activate_func

		if Managers.player.is_server and not server_only then
			function activate_func(extension, active)
				if extension.active == active then
					Application.warning("[ObjectiveUnitExtension] Trying to set active on unit %q to %q when it's already %q", tostring(unit), active, extension.active)
				else
					extension.active = active

					local network_synced = extension.network_synced

					if network_synced then
						local network_manager = Managers.state.network
						local unit_id, is_level_unit = network_manager:game_object_or_level_id(extension.unit)

						network_manager.network_transmit:send_rpc_clients("rpc_objective_unit_set_active", unit_id, is_level_unit, active)
					end
				end
			end
		elseif Managers.player.is_server or not server_only then
			function activate_func(extension, active)
				extension.active = active
			end
		else
			function activate_func(extension, active)
				extension.active = active
			end
		end

		extension.unit = unit
		extension.active = false
		extension.proxy_active = extension_init_data.proxy_active
		extension.set_active = activate_func
		extension.server_only = server_only
		extension.network_synced = network_synced
		extension.always_show = extension_init_data.always_show or Unit.get_data(unit, "always_show")

		extension.set_always_show = function (extension, show)
			extension.always_show = show

			if Managers.player.is_server and not server_only then
				local network_synced = extension.network_synced

				if network_synced then
					local network_manager = Managers.state.network
					local unit_id, is_level_unit = network_manager:game_object_or_level_id(extension.unit)

					network_manager.network_transmit:send_rpc_clients("rpc_objective_unit_set_always_show", unit_id, is_level_unit, show)
				end
			end
		end
	end

	if not POSITION_LOOKUP[unit] then
		POSITION_LOOKUP[unit] = Unit.world_position(unit, 0)
	end

	ScriptUnit.set_extension(unit, "tutorial_system", extension, dummy_input)

	self.unit_extension_data[unit] = extension

	return extension
end

TutorialSystem.on_remove_extension = function (self, unit, extension_name)
	self:_cleanup_extension(unit)

	self.frozen_unit_extension_data[unit] = nil

	ScriptUnit.remove_extension(unit, "tutorial_system")
end

TutorialSystem.on_freeze_extension = function (self, unit, extension_name)
	self:freeze(unit, extension_name)
end

TutorialSystem.freeze = function (self, unit, extension_name, reason)
	local frozen_extensions = self.frozen_unit_extension_data

	if frozen_extensions[unit] then
		return
	end

	local extension = self.unit_extension_data[unit]

	fassert(extension, "Unit to freeze didn't have unfrozen extension")
	self:_cleanup_extension(unit)

	frozen_extensions[unit] = extension
end

TutorialSystem.unfreeze = function (self, unit, extension_name, data)
	local extension = self.frozen_unit_extension_data[unit]

	fassert(extension, "Unit to unfreeze didn't have frozen extension")

	self.frozen_unit_extension_data[unit] = nil
	self.unit_extension_data[unit] = extension

	if extension_name == "ObjectiveHealthTutorialExtension" then
		Managers.state.event:trigger("tutorial_event_add_health_bar", unit)

		self.health_extensions[unit] = extension
	elseif extension_name == "PlayerTutorialExtension" then
		self.player_units[unit] = extension
	end

	if not POSITION_LOOKUP[unit] then
		POSITION_LOOKUP[unit] = Unit.world_position(unit, 0)
	end
end

TutorialSystem._cleanup_extension = function (self, unit)
	if self.health_extensions[unit] then
		self.health_extensions[unit] = nil

		Managers.state.event:trigger("tutorial_event_remove_health_bar", unit)
	end

	self.player_units[unit] = nil

	local extension = self.unit_extension_data[unit]

	if extension and extension.active then
		extension:set_active(false)
	end

	self.unit_extension_data[unit] = nil
end

TutorialSystem.physics_async_update = function (self, context, t)
	if script_data.tutorial_disabled then
		return
	end

	local world = self.world
	local raycast_units = self.raycast_units

	for unit, extension in pairs(self.player_units) do
		local raycast_unit = raycast_units[unit]

		raycast_units[unit] = nil

		local interactor_extension = ScriptUnit.extension(unit, "interactor_system")
		local is_looking_at_interactable = interactor_extension:is_looking_at_interactable()

		if is_looking_at_interactable then
			extension.tooltip_tutorial.active = false
		end

		local status_extension = ScriptUnit.extension(unit, "status_system")

		if not is_looking_at_interactable and not status_extension:is_disabled() then
			self:iterate_tooltips(t, unit, extension, raycast_unit, world)
		end

		self:iterate_objective_tooltips(t, unit, extension, raycast_unit, world)

		if (self.pacing == "pacing_peak_fade" or self.pacing == "pacing_relax") and not script_data.info_slates_disabled then
			self:iterate_info_slates(t, unit, extension, raycast_unit, world)
		end

		if extension.tooltip_tutorial.active then
			local shown_time = extension.shown_times[extension.tooltip_tutorial.name]

			if t > shown_time + TOOLTIP_MINIMUM_SHOW_TIME then
				extension.tooltip_tutorial.active = false
			end
		end

		if script_data.tutorial_debug then
			if DebugKeyHandler.key_pressed("f10", "add debug info slate", "tutorials") then
				local duration = math.random() * 5

				Managers.state.event:trigger("tutorial_event_queue_info_slate_entry", "tutorial", "DEBUG INFO SLATE, LOOK AT IT GOOOO", duration + 5)
			end

			local res_x, res_y = RESOLUTION_LOOKUP.res_w, RESOLUTION_LOOKUP.res_h

			Gui.rect(self.gui, Vector3(0, 0, 100), Vector2(350, res_y), Color(100, 25, 25, 25))
			Debug.text("Tutorial points : %d", extension.points)
			Debug.text("Completed tutorials:")
			Debug.text("Shelved tutorials:")

			for name, template in pairs(TutorialTemplates) do
				local last_shown_time = extension.shown_times[name]

				if t < last_shown_time + TIME_TO_WAIT_BETWEEN_SHOWS then
					Debug.text(" * %s, %.1fs", name, last_shown_time + TIME_TO_WAIT_BETWEEN_SHOWS - t)
				end
			end

			if extension.tooltip_tutorial.active then
				Debug.text("Tooltip tutorial: " .. extension.tooltip_tutorial.name)

				if extension.tooltip_tutorial.world_position then
					QuickDrawer:sphere(extension.tooltip_tutorial.world_position:unbox(), 1, Colors.get("brown"))
				end
			else
				Debug.text("Tooltip tutorial: inactive")
			end

			if raycast_unit == nil then
				Debug.text("Raycast unit: none")
			else
				Debug.text("Raycast unit: %s", Unit.debug_name(raycast_unit))
			end

			Debug.text("Extension data:")

			for k, v in pairs(extension.data) do
				Debug.text(" * %s = %s", k, tostring(v))
			end
		end
	end

	DO_TUT_RELOAD = false
end

TutorialSystem.iterate_tooltips = function (self, t, unit, extension, raycast_unit, world)
	local tooltip_templates = TutorialTooltipTemplates
	local tooltip_templates_n = TutorialTooltipTemplates_n
	local in_play_go = Managers.state.entity:system("play_go_tutorial_system"):active()
	local level_transition_handler = Managers.level_transition_handler
	local level_key = level_transition_handler:get_current_level_keys()
	local level_settings = LevelSettings[level_key]
	local is_in_inn = level_settings.hub_level

	for i = 1, tooltip_templates_n do
		repeat
			local template = tooltip_templates[i]
			local name = template.name

			if in_play_go and not template.allowed_in_tutorial then
				break
			elseif not in_play_go and template.incompatible_in_game then
				-- Nothing
			elseif not is_in_inn and template.inn_only then
				break
			end

			template.update_data(t, unit, extension.data)

			local ok, world_position = template.can_show(t, unit, extension.data, raycast_unit, world)

			if not ok then
				break
			end

			if template.get_text then
				template.text = template.get_text(extension.data)
			end

			if template.get_inputs then
				template.inputs = template.get_inputs(extension.data)
			end

			if template.get_gamepad_inputs then
				template.gamepad_inputs = template.get_gamepad_inputs(extension.data)
			end

			if template.get_force_update then
				template.force_update = template.get_force_update(extension.data)
			end

			extension.tooltip_tutorial.active = true
			extension.tooltip_tutorial.name = name

			if world_position then
				extension.tooltip_tutorial.world_position = Vector3Box(world_position)
			else
				extension.tooltip_tutorial.world_position = nil
			end

			extension.shown_times[name] = t

			return
		until true
	end
end

local unit_local_position = Unit.local_position
local vector3_distance_sq = Vector3.distance_squared
local sort_unit_position_upvalue

local function do_sort_objective_units(a, b)
	local a_pos = unit_local_position(a, 0)
	local b_pos = unit_local_position(b, 0)
	local a_dist_sq = vector3_distance_sq(sort_unit_position_upvalue, a_pos)
	local b_dist_sq = vector3_distance_sq(sort_unit_position_upvalue, b_pos)

	return a_dist_sq < b_dist_sq
end

TutorialSystem.prioritize_objective_tooltip = function (self, objective_tooltip_name, reset)
	if reset then
		self._objective_tooltip_prioritized_list = nil
		self._prioritized_objective_tooltip = nil

		return
	end

	fassert(TutorialTemplates[objective_tooltip_name], "[TutorialSystem] There is no TutorialObjectiveTooltipTemplate with the name %s", objective_tooltip_name)
	fassert(TutorialTemplates[objective_tooltip_name].display_type == "objective_tooltip", "[TutorialSystem] The tutorial template with the name %s is not an objective tooltip template (%s)", objective_tooltip_name, TutorialTemplates[objective_tooltip_name].display_type)

	local objective_tooltip_templates_n = TutorialObjectiveTooltipTemplates_n

	self._objective_tooltip_prioritized_list = {}
	self._objective_tooltip_prioritized_list[#self._objective_tooltip_prioritized_list + 1] = TutorialTemplates[objective_tooltip_name]

	for i = 1, objective_tooltip_templates_n do
		if TutorialObjectiveTooltipTemplates[i].name ~= objective_tooltip_name then
			self._objective_tooltip_prioritized_list[#self._objective_tooltip_prioritized_list + 1] = TutorialObjectiveTooltipTemplates[i]
		end
	end

	self._prioritized_objective_tooltip = objective_tooltip_name
end

TutorialSystem.iterate_objective_tooltips = function (self, t, unit, extension, raycast_unit, world)
	local objective_tooltip_templates = self._objective_tooltip_prioritized_list or TutorialObjectiveTooltipTemplates
	local objective_tooltip_templates_n = TutorialObjectiveTooltipTemplates_n
	local objective_tooltips = extension.objective_tooltips

	objective_tooltips.units_n = 0

	for i = 1, objective_tooltip_templates_n do
		repeat
			local template = objective_tooltip_templates[i]
			local name = template.name

			template.update_data(t, unit, extension.data)

			local ok, objective_units, objective_units_n = template.can_show(t, unit, extension.data, raycast_unit, world)

			if not ok then
				break
			end

			if template.get_text then
				template.text = template.get_text(extension.data)
			end

			if template.get_action then
				template.action = template.get_action(extension.data)
			end

			if template.get_icon then
				template.icon = template.get_icon(extension.data)
			end

			if template.get_alert then
				template.alerts_horde = template.get_alert(extension.data)
			end

			if template.get_wave then
				template.wave = template.get_wave(extension.data)
			end

			objective_tooltips.active = true
			objective_tooltips.name = name
			objective_tooltips.units_n = objective_units_n

			local saved_units = objective_tooltips.units

			for i = 1, objective_units_n do
				saved_units[i] = objective_units[i]
			end

			local i = objective_units_n + 1

			while saved_units[i] do
				saved_units[i] = nil
				i = i + 1
			end

			if objective_units_n > 1 then
				local unit_position = Unit.local_position(unit, 0)

				sort_unit_position_upvalue = unit_position

				local sort_func = do_sort_objective_units

				table.sort(saved_units, sort_func)

				sort_unit_position_upvalue = nil
			end

			return
		until true
	end
end

TutorialSystem.verify_info_slate = function (self, t, unit, raycast_unit, template)
	local extension = self.player_units[unit]
	local world = self.world

	if template.do_not_verify then
		return true
	end

	return template.can_show(t, unit, extension.data, raycast_unit, world)
end

TutorialSystem.iterate_info_slates = function (self, t, unit, extension, raycast_unit, world)
	if Application.user_setting("tutorials_enabled") then
		local info_slate_templates = TutorialInfoSlateTemplates
		local info_slate_templates_n = TutorialInfoSlateTemplates_n

		for i = 1, info_slate_templates_n do
			repeat
				local template = info_slate_templates[i]
				local name = template.name
				local cooldown = template.cooldown and template.cooldown or INFOSLATE_COOLDOWN

				if t < extension.shown_times[name] + cooldown then
					break
				end

				if template.can_show(t, unit, extension.data, raycast_unit, world) then
					extension.shown_times[name] = t

					local text = template.get_text and template.get_text(extension.data, template) or template.text

					text = Localize(text)

					Managers.state.event:trigger("tutorial_event_queue_info_slate_entry", text, nil, nil, template, unit, raycast_unit)
				end
			until true
		end
	else
		Managers.state.event:trigger("tutorial_event_clear_tutorials")
	end
end

TutorialSystem.on_tutorial_trigger = function (self, trigger_name)
	local ctx = self._condition_context

	if ctx:get("has_max_level_character") then
		return
	end

	ctx:clear_cache()

	local seen_handbook_popups = SaveData.seen_handbook_popups

	for popup_id, popup_settings in pairs(HandbookSettings.popups) do
		if seen_handbook_popups[popup_id] then
			-- Nothing
		elseif not table.find(popup_settings.triggers, trigger_name) then
			-- Nothing
		else
			local conditions = popup_settings.conditions

			if conditions then
				for i = 1, #conditions do
					local cond_name = conditions[i]

					if not ctx:get(cond_name) then
						goto label_1_0
					end
				end
			end

			local condition_func = popup_settings.custom_condition

			if condition_func and not condition_func(ctx) then
				-- Nothing
			else
				Managers.state.event:trigger("ui_show_popup", popup_id, "handbook")

				seen_handbook_popups[popup_id] = true
			end
		end

		::label_1_0::
	end
end

TutorialSystem.rpc_tutorial_message = function (self, channel_id, template_id, message_id)
	local template_name = NetworkLookup.tutorials[template_id]

	if not template_name then
		return
	end

	local message = NetworkLookup.tutorials[message_id]
	local template = TutorialTemplates[template_name]

	for unit, extension in pairs(self.player_units) do
		local data = extension.data

		template.on_message(data, message)
	end
end

TutorialSystem.rpc_pacing_changed = function (self, channel_id, pacing_id)
	local pacing = NetworkLookup.pacing[pacing_id]

	self.pacing = pacing

	tutprintf("Changing pacing state to %s", pacing)
end

TutorialSystem.rpc_objective_unit_set_active = function (self, channel_id, level_object_id, is_level_unit, activate)
	local unit = Managers.state.network:game_object_or_level_unit(level_object_id, is_level_unit)
	local extension = ScriptUnit.has_extension(unit, "tutorial_system")

	if extension then
		extension:set_active(activate)
	end
end

TutorialSystem.rpc_prioritize_objective_tooltip = function (self, channel_id, prioritized_objective_tooltip_id)
	local prioritized_objective_tooltip = NetworkLookup.objective_tooltips[prioritized_objective_tooltip_id]

	self:prioritize_objective_tooltip(prioritized_objective_tooltip)
end

TutorialSystem.rpc_objective_unit_set_always_show = function (self, channel_id, object_id, is_level_unit, show)
	local unit = Managers.state.network:game_object_or_level_unit(object_id, is_level_unit)
	local extension = ScriptUnit.has_extension(unit, "tutorial_system")

	if extension then
		extension:set_always_show(show)
	end
end

TutorialSystem.flow_callback_show_health_bar = function (self, unit, show)
	local event_manager = Managers.state.event

	event_manager:trigger("tutorial_event_show_health_bar", unit, show)
end

TutorialSystem.flow_callback_tutorial_message = function (self, template_name, message)
	if Managers.player.is_server then
		local template_id = NetworkLookup.tutorials[template_name]
		local message_id = NetworkLookup.tutorials[message]
		local network_manager = Managers.state.network

		network_manager.network_transmit:send_rpc_all("rpc_tutorial_message", template_id, message_id)
	end
end

TutorialSystem.hot_join_sync = function (self, peer_id)
	local network_manager = Managers.state.network
	local units = Managers.state.entity:get_entities("ObjectiveUnitExtension")

	for objective_unit, extension in pairs(units) do
		if extension.active and not extension.server_only and extension.network_synced then
			local unit_id, is_level_unit = network_manager:game_object_or_level_id(objective_unit)

			network_manager.network_transmit:send_rpc("rpc_objective_unit_set_active", peer_id, unit_id, is_level_unit, true)
		end
	end

	if self._prioritized_objective_tooltip then
		local prioritized_objective_tooltip_id = NetworkLookup.objective_tooltips[self._prioritized_objective_tooltip]

		network_manager.network_transmit:send_rpc("rpc_prioritize_objective_tooltip", peer_id, prioritized_objective_tooltip_id)
	end
end

TutorialSystem.update = function (self, context, t)
	if script_data.tutorial_disabled then
		return
	end

	local world = self.world
	local physics_world = World.get_data(self.world, "physics_world")
	local raycast_units = self.raycast_units

	for unit, extension in pairs(self.player_units) do
		if DO_TUT_RELOAD or DebugKeyHandler.key_pressed("f3", "reset tutorials", "tutorials") then
			extension.completed_tutorials = {}
			extension.points = 0
			extension.tooltip_tutorial.active = false
			extension.data = {
				player_id = Network.peer_id(),
				statistics_db = self.statistics_db,
				dice_keeper = self.dice_keeper,
			}

			for name, template in pairs(TutorialTemplates) do
				extension.shown_times[name] = -1000

				template.init_data(extension.data)
			end
		end

		local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
		local camera_position = first_person_extension:current_position()
		local camera_rotation = first_person_extension:current_rotation()
		local camera_forward = Quaternion.forward(camera_rotation)
		local result, hit_position, hit_distance, normal, actor = PhysicsWorld.immediate_raycast(physics_world, camera_position + camera_forward, camera_forward, 30, "closest", "collision_filter", "filter_tutorial")
		local raycast_unit

		if result and actor then
			raycast_unit = Actor.unit(actor)

			if not HEALTH_ALIVE[raycast_unit] then
				raycast_unit = nil
			end
		end

		raycast_units[unit] = raycast_unit
	end
end
