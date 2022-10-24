require("foundation/scripts/util/local_require")
require("scripts/ui/hud_ui/hud_customizer")
require("scripts/ui/hud_ui/component_list_definitions/hud_component_list_adventure")
require("scripts/ui/ui_animator")
require("scripts/ui/ui_cleanui")
DLCUtils.dofile("hud_component_list_path")

IngameHud = class(IngameHud)

IngameHud.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self._peer_id = Network.peer_id()
	self._ingame_ui_context = ingame_ui_context

	self:_setup_components()
end

IngameHud._setup_components = function (self)
	self._currently_visible_components = {}
	self._current_group_name = nil
	local ingame_ui_context = self._ingame_ui_context
	local tobii_available = Managers.mechanism:mechanism_setting("tobii_available")
	local has_tobii = rawget(_G, "Tobii")

	if has_tobii and tobii_available then
		ingame_ui_context.cleanui = UICleanUI.create(self._peer_id)
		self._clean_ui = ingame_ui_context.cleanui
		self._clean_ui.hud = self
		local is_tobii_connected = Tobii.get_is_connected()
		local clean_ui_enabled = Application.user_setting("tobii_eyetracking") and Application.user_setting("tobii_clean_ui")

		self:enable_clean_ui(is_tobii_connected and clean_ui_enabled)
	else
		self._clean_ui = nil
	end

	local game_mode_manager = Managers.state.game_mode
	local game_mode_settings = game_mode_manager:settings()
	local hud_component_list_path = game_mode_settings.hud_component_list_path
	local definitions = self:_setup_component_definitions(hud_component_list_path)
	self._definitions = definitions
	self._components_hud_scale_lookup = definitions.components_hud_scale_lookup

	self:_compile_component_list(ingame_ui_context, definitions.components)
	Managers.state.event:register(self, "player_party_changed", "event_player_party_changed")
end

IngameHud.reset_components = function (self)
	self:destroy()
	self:_setup_components()
end

IngameHud.event_player_party_changed = function (self, player, is_local, old_party_id, new_party_id)
	if not is_local then
		return
	end

	self:reset_components()
end

IngameHud._setup_component_definitions = function (self, hud_component_list_path)
	local definitions = local_require(hud_component_list_path)
	local components = table.clone(definitions.components)
	local visibility_groups = definitions.visibility_groups
	local visibility_groups_lookup = {}

	for _, settings in ipairs(visibility_groups) do
		local name = settings.name
		visibility_groups_lookup[name] = settings
	end

	for name, dlc in pairs(DLCSettings) do
		local ingame_hud_components = dlc.ingame_hud_components

		if ingame_hud_components then
			for _, settings in pairs(ingame_hud_components) do
				local class_name = settings.class_name
				local add = true

				for i = 1, #components, 1 do
					if components[i].class_name == class_name then
						add = false
					end
				end

				if add then
					components[#components + 1] = table.clone(settings)
				end
			end
		end
	end

	local function sort_components_by_hud_scale(a, b)
		return b.use_hud_scale and not a.use_hud_scale
	end

	table.sort(components, sort_components_by_hud_scale)

	local components_lookup = {}
	local components_hud_scale_lookup = {}

	for _, settings in ipairs(components) do
		local name = settings.class_name
		components_lookup[name] = settings

		if settings.use_hud_scale then
			components_hud_scale_lookup[name] = true
		end
	end

	for _, settings in ipairs(components) do
		local class_name = settings.class_name
		local visibility_groups = settings.visibility_groups

		for _, group_name in ipairs(visibility_groups) do
			local visibility_group = visibility_groups_lookup[group_name]

			if visibility_group then
				fassert(visibility_group, "Could not find the visibility group: (%s) for component: (%s)", group_name, class_name)

				local validation_function = visibility_group.validation_function

				fassert(validation_function, "Could not find any validation_function for visibility group: (%s)", group_name)

				if not visibility_group.visible_components then
					visibility_group.visible_components = {}
				end

				local visible_components = visibility_group.visible_components
				visible_components[class_name] = true
			end
		end

		local filename = settings.filename

		require(filename)
	end

	return {
		components = components,
		components_lookup = components_lookup,
		components_hud_scale_lookup = components_hud_scale_lookup,
		visibility_groups = visibility_groups,
		visibility_groups_lookup = visibility_groups_lookup
	}
end

IngameHud._compile_component_list = function (self, ingame_ui_context, component_definitions)
	local component_list = {}
	local components = {}
	local components_array = {}
	local components_array_id_lookup = {}

	for i = 1, #component_definitions, 1 do
		local definition = component_definitions[i]
		local class_name = definition.class_name

		fassert(component_list[class_name] == nil, "Duplicate entries of component (%s)", class_name)

		component_list[class_name] = definition

		self:_add_component(component_list, components, components_array, components_array_id_lookup, class_name)
	end

	self._component_list = component_list
	self._components = components
	self._components_array = components_array
	self._components_array_id_lookup = components_array_id_lookup
end

IngameHud._add_component = function (self, component_list, components, components_array, components_array_id_lookup, class_name)
	local definition = component_list[class_name]

	fassert(definition, "No definition found for component (%s)", class_name)

	if components[class_name] ~= nil then
		table.dump(components, "Hud components:")
	end

	fassert(components[class_name] == nil, "Component (%s) is already added", class_name)

	local ingame_ui_context = self._ingame_ui_context
	local validation_function = definition.validation_function

	if not validation_function or validation_function(ingame_ui_context, ingame_ui_context.is_in_inn) then
		local class = rawget(_G, class_name)
		local component = class:new(self, ingame_ui_context)
		component.name = class_name
		components[class_name] = component
		local id = #components_array + 1
		components_array[id] = component
		components_array_id_lookup[component] = id
	end
end

IngameHud._remove_component = function (self, component_list, components, components_array, components_array_id_lookup, class_name)
	local component = components[class_name]

	if not component then
		local definition = component_list[class_name]

		fassert(definition.validation_function, "Component does not exist and doesn't have a validation_function, how did this happen?")

		local ingame_ui_context = self._ingame_ui_context
		local validated = definition.validation_function(ingame_ui_context, ingame_ui_context.is_in_inn)

		fassert(validated == false, "Validation functions returned true but component does not exist, somethings weird.")

		return
	end

	self._currently_visible_components[component.name] = nil
	local id = components_array_id_lookup[component]
	local last_component_id = #components_array
	local last_component = components_array[last_component_id]
	components_array[id] = last_component
	components_array_id_lookup[last_component] = id

	if component.destroy then
		component:destroy()
	end

	components[class_name] = nil
	components_array[last_component_id] = nil
	components_array_id_lookup[component] = nil
end

IngameHud.remove_components = function (self, components_to_remove)
	local component_list = self._component_list
	local components = self._components
	local components_array = self._components_array
	local components_array_id_lookup = self._components_array_id_lookup
	local num_components = #components_to_remove

	for i = 1, num_components, 1 do
		local class_name = components_to_remove[i]

		self:_remove_component(component_list, components, components_array, components_array_id_lookup, class_name)
	end
end

IngameHud.component = function (self, component_name)
	local components = self._components
	local component = components[component_name]

	return component
end

IngameHud._update_components_post_visibility = function (self)
	if self._update_post_visibility then
		local definitions = self._definitions
		local visibility_groups_lookup = definitions.visibility_groups_lookup
		local current_group_name = self._current_group_name
		local group_settings = visibility_groups_lookup[current_group_name]
		local components_array = self._components_array
		local visible_components = group_settings.visible_components

		for j = 1, #components_array, 1 do
			local component = components_array[j]
			local component_name = component.name
			local status = (visible_components and visible_components[component_name]) or false

			if component.post_visibility_changed then
				component:post_visibility_changed(status)
			end
		end

		self._update_post_visibility = false
	end
end

IngameHud._update_components_visibility = function (self)
	local definitions = self._definitions
	local visibility_groups = definitions.visibility_groups
	local num_visibility_groups = #visibility_groups
	local debug_visibility_group = script_data.debug_hud_visibility_group
	local handle_debug = debug_visibility_group and debug_visibility_group ~= "none"

	for i = 1, num_visibility_groups, 1 do
		local visibility_group = visibility_groups[i]
		local group_name = visibility_group.name
		local validation_function = visibility_group.validation_function
		local is_valid = false

		if handle_debug then
			is_valid = group_name == debug_visibility_group
		else
			is_valid = validation_function(self)
		end

		if is_valid then
			if group_name ~= self._current_group_name then
				local components_array = self._components_array
				local currently_visible_components = self._currently_visible_components
				local visible_components = visibility_group.visible_components

				for j = 1, #components_array, 1 do
					local component = components_array[j]
					local component_name = component.name
					local status = (visible_components and visible_components[component_name]) or false

					if component.set_visible then
						component:set_visible(status)
					end

					currently_visible_components[component_name] = status
				end

				self._current_group_name = group_name
				self._update_post_visibility = true
			end

			break
		end
	end

	if handle_debug then
		Debug.text("HUD visibility group: " .. tostring(self._current_group_name or "none"))
	end
end

IngameHud.get_hud_component = function (self, hud_component_name)
	return self._components[hud_component_name]
end

IngameHud._update_hud_scale = function (self)
	if not self._resolution_modified then
		self._resolution_modified = RESOLUTION_LOOKUP.modified
	end

	if not self._scale_modified then
		local hud_scale_multiplier = UISettings.hud_scale * 0.01
		self._scale_modified = self._hud_scale_multiplier ~= hud_scale_multiplier
		self._hud_scale_multiplier = hud_scale_multiplier
	end
end

IngameHud._apply_hud_scale = function (self)
	self:_update_hud_scale()

	local scale_modified = self._scale_modified
	local resolution_modified = self._resolution_modified
	local force_update = scale_modified or resolution_modified
	local hud_scale_multiplier = self._hud_scale_multiplier

	UPDATE_RESOLUTION_LOOKUP(force_update, hud_scale_multiplier)
end

IngameHud._abort_hud_scale = function (self)
	local scale_modified = self._scale_modified
	local resolution_modified = self._resolution_modified
	local force_update = scale_modified or resolution_modified

	UPDATE_RESOLUTION_LOOKUP(force_update)
end

IngameHud.update = function (self, dt, t)
	Profiler.start("IngameHud:update")
	self:_reset_hud_frame_variables()
	self:_update_components_visibility()

	local peer_id = self._peer_id
	local player_manager = Managers.player
	local player = player_manager:player_from_peer_id(peer_id)
	local currently_visible_components = self._currently_visible_components
	local components_array = self._components_array
	local use_custom_hud_scale = UISettings.use_custom_hud_scale
	local hud_scale_applied = false
	local resolution_modified = RESOLUTION_LOOKUP.modified

	for i = 1, #components_array, 1 do
		local component = components_array[i]
		local component_name = component.name

		if use_custom_hud_scale and not hud_scale_applied and self._components_hud_scale_lookup[component_name] then
			hud_scale_applied = true

			self:_apply_hud_scale()
		end

		if resolution_modified and component.resolution_modified then
			component:resolution_modified()
		end

		if component.update and currently_visible_components[component_name] then
			Profiler.start("ingame_hud." .. component_name .. ":update")
			component:update(dt, t, player)
			Profiler.stop("ingame_hud." .. component_name .. ":update")
		end
	end

	Profiler.start("Tobii")
	self:_update_clean_ui(dt, t)
	Profiler.stop("Tobii")

	if hud_scale_applied then
		self:_abort_hud_scale()
	end

	HudCustomizer.reset_button(self._ingame_ui_context.ui_renderer)
	Profiler.stop("IngameHud:update")
end

IngameHud.post_update = function (self, dt, t)
	self:_reset_hud_frame_variables()
	self:_update_components_post_visibility()

	local peer_id = self._peer_id
	local player_manager = Managers.player
	local player = player_manager:player_from_peer_id(peer_id)
	local currently_visible_components = self._currently_visible_components
	local components_array = self._components_array
	local use_custom_hud_scale = UISettings.use_custom_hud_scale
	local hud_scale_applied = false

	for i = 1, #components_array, 1 do
		local component = components_array[i]
		local component_name = component.name

		if use_custom_hud_scale and not hud_scale_applied and self._components_hud_scale_lookup[component_name] then
			hud_scale_applied = true

			self:_apply_hud_scale()
		end

		if component.post_update and currently_visible_components[component_name] then
			component:post_update(dt, t, player)
		end
	end

	if hud_scale_applied then
		self:_abort_hud_scale()
	end

	self._scale_modified = false
	self._resolution_modified = false
end

IngameHud.destroy = function (self)
	Managers.state.event:unregister("player_party_changed", self)

	local components_array = self._components_array

	for _, component in ipairs(components_array) do
		if component.destroy then
			component:destroy()
		end
	end

	self._components = nil
	self._components_array = nil
end

IngameHud.parent = function (self)
	return self._parent
end

IngameHud.input_service = function (self)
	return false
end

local function is_own_player_dead_helper(peer_id)
	if script_data.debug_hud_visibility_group == "dead" then
		return true
	end

	local player = Managers.player:player_from_peer_id(peer_id)
	local player_unit = player and player.player_unit

	if not player_unit or not Unit.alive(player_unit) then
		return true
	end

	return ScriptUnit.extension(player_unit, "status_system"):is_ready_for_assisted_respawn()
end

IngameHud.is_in_inn = function (self)
	return self._ingame_ui_context.is_in_inn
end

IngameHud._reset_hud_frame_variables = function (self)
	self._crosshair_position_x = false
	self._crosshair_position_y = false
	self._is_own_player_dead = is_own_player_dead_helper(self._peer_id)
end

IngameHud.is_own_player_dead = function (self)
	return self._is_own_player_dead
end

IngameHud.get_crosshair_position = function (self)
	if not self._crosshair_position_x or not self._crosshair_position_y then
		local inv_res_scale = RESOLUTION_LOOKUP.inv_scale
		local position_x = RESOLUTION_LOOKUP.res_w * 0.5 * inv_res_scale
		local position_y = RESOLUTION_LOOKUP.res_h * 0.5 * inv_res_scale
		local peer_id = self._peer_id
		local player_manager = Managers.player
		local my_player = player_manager:player_from_peer_id(peer_id)
		local player_unit = my_player and my_player.player_unit

		if Unit.alive(player_unit) then
			local eyetracking_extension = ScriptUnit.has_extension(player_unit, "eyetracking_system")

			if eyetracking_extension and eyetracking_extension:get_is_feature_enabled("tobii_extended_view") then
				local world_pos = eyetracking_extension:get_forward_rayhit()

				if world_pos then
					local player = Managers.player:owner(player_unit)
					local viewport_name = player.viewport_name
					local world_name = player.viewport_world_name
					local world = Managers.world:world(world_name)
					local viewport = ScriptWorld.viewport(world, viewport_name)
					local camera = ScriptViewport.camera(viewport)
					local position_in_screen = Camera.world_to_screen(camera, world_pos)
					position_x = position_in_screen.x * inv_res_scale
					position_y = position_in_screen.y * inv_res_scale
				end
			end
		end

		self._crosshair_position_x = position_x
		self._crosshair_position_y = position_y
	end

	return self._crosshair_position_x, self._crosshair_position_y
end

IngameHud.enable_clean_ui = function (self, enable)
	self._tobii_clean_ui_is_enabled = enable
end

IngameHud._update_clean_ui = function (self, dt, t)
	if not self._clean_ui then
		return
	end

	local had_tobii = self._had_tobii or false
	local has_tobii = rawget(_G, "Tobii") and Tobii.get_is_connected()

	if had_tobii ~= has_tobii then
		UICleanUI.update(self._clean_ui, dt)
	end

	self._had_tobii = has_tobii

	if not has_tobii then
		return
	end

	if self._tobii_clean_ui_was_enabled ~= self._tobii_clean_ui_is_enabled then
		UICleanUI.update(self._clean_ui, dt)
	end

	self._tobii_clean_ui_was_enabled = self._tobii_clean_ui_is_enabled

	if not self._tobii_clean_ui_is_enabled then
		return
	end

	UICleanUI.update(self._clean_ui, dt)
end

return
