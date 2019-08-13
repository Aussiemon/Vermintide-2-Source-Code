require("foundation/scripts/util/local_require")
require("scripts/ui/ui_animator")
require("scripts/ui/ui_cleanui")

local definitions = local_require("scripts/ui/views/ingame_hud_definitions")
local components_hud_scale_lookup = definitions.components_hud_scale_lookup
IngameHud = class(IngameHud)

IngameHud.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self._peer_id = Network.peer_id()
	self._ingame_ui_context = ingame_ui_context
	self._currently_visible_components = {}
	local is_adventure_mechanism = Managers.mechanism:current_mechanism_name() == "adventure"
	local has_tobii = rawget(_G, "Tobii")

	if has_tobii and is_adventure_mechanism then
		ingame_ui_context.cleanui = UICleanUI.create(self._peer_id)
		self._clean_ui = ingame_ui_context.cleanui
		self._clean_ui.hud = self
		local is_tobii_connected = Tobii.get_is_connected()
		local clean_ui_enabled = Application.user_setting("tobii_eyetracking") and Application.user_setting("tobii_clean_ui")

		self:enable_clean_ui(is_tobii_connected and clean_ui_enabled)
	else
		self._clean_ui = nil
	end

	self:_initialize_components(ingame_ui_context)
end

IngameHud._initialize_components = function (self, ingame_ui_context)
	local is_in_inn = ingame_ui_context.is_in_inn
	local added_components = {}
	local added_components_array = {}
	local components = definitions.components

	for _, settings in ipairs(components) do
		local validation_function = settings.validation_function

		if not validation_function or validation_function(ingame_ui_context, is_in_inn) then
			local class_name = settings.class_name
			local class = rawget(_G, class_name)
			local component = class:new(self, ingame_ui_context)
			component.name = class_name
			added_components[class_name] = component
			added_components_array[#added_components_array + 1] = component
		end
	end

	self._components = added_components
	self._components_array = added_components_array
end

IngameHud.component = function (self, component_name)
	local components = self._components
	local component = components[component_name]

	return component
end

IngameHud._update_component_visibility = function (self)
	self._definitions = definitions
	local visibility_groups = definitions.visibility_groups
	local num_visibility_groups = #visibility_groups

	for i = 1, num_visibility_groups, 1 do
		local visibility_group = visibility_groups[i]
		local group_name = visibility_group.name
		local validation_function = visibility_group.validation_function

		if validation_function(self) then
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
			end

			break
		end
	end
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
	self:_reset_hud_frame_variables()
	self:_update_component_visibility()

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

		if use_custom_hud_scale and not hud_scale_applied and components_hud_scale_lookup[component_name] then
			hud_scale_applied = true

			self:_apply_hud_scale()
		end

		if resolution_modified and component.resolution_modified then
			component:resolution_modified()
		end

		if component.update and currently_visible_components[component_name] then
			component:update(dt, t, player)
		end
	end

	self:_update_clean_ui(dt, t)

	if hud_scale_applied then
		self:_abort_hud_scale()
	end
end

IngameHud.post_update = function (self, dt, t)
	self:_reset_hud_frame_variables()

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

		if use_custom_hud_scale and not hud_scale_applied and components_hud_scale_lookup[component_name] then
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

	self._scale_modified = nil
	self._resolution_modified = nil
end

IngameHud.destroy = function (self)
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

IngameHud._reset_hud_frame_variables = function (self)
	self._is_own_player_dead = nil
	self._is_cutscene_active = nil
	self._crosshair_position_x = nil
	self._crosshair_position_y = nil
end

IngameHud.is_cutscene_active = function (self)
	if not self._is_cutscene_active then
		local cutscene_system = Managers.state.entity:system("cutscene_system")
		self._is_cutscene_active = cutscene_system.active_camera and not cutscene_system.ingame_hud_enabled
	end

	return self._is_cutscene_active
end

IngameHud.is_own_player_dead = function (self)
	if not self._is_own_player_dead then
		local peer_id = self._peer_id
		local player_manager = Managers.player
		local my_player = player_manager:player_from_peer_id(peer_id)
		local player_unit = my_player and my_player.player_unit

		if not player_unit or not Unit.alive(player_unit) then
			self._is_own_player_dead = true
		else
			local status_extension = ScriptUnit.extension(player_unit, "status_system")
			self._is_own_player_dead = status_extension:is_ready_for_assisted_respawn()
		end
	end

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

	local had_tobii = self._had_tobii
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
