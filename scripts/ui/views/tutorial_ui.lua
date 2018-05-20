-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
require("foundation/scripts/util/local_require")
require("scripts/ui/ui_animator")
require("scripts/ui/views/tutorial_tooltip_ui")

local definitions = local_require("scripts/ui/views/tutorial_ui_definitions")
script_data.disable_tutorial_ui = script_data.disable_tutorial_ui or Development.parameter("disable_tutorial_ui")
script_data.disable_info_slate_ui = script_data.disable_info_slate_ui or Development.parameter("disable_info_slate_ui")
local INFO_SLATES = {
	"mission_goal",
	"mission_objective",
	"side_mission",
	"tutorial",
	side_mission = 3,
	mission_objective = 2,
	tutorial = 4,
	mission_goal = 1
}
local RELOAD_TUTORIAL_UI = false
TutorialUI = class(TutorialUI)

local function convert_current_screen_resolution_position_to_target_resolution(pos_width, pos_height, resolution_width, resolution_height)
	local current_width = RESOLUTION_LOOKUP.res_w
	local current_height = RESOLUTION_LOOKUP.res_h
	local width = resolution_width / current_width * pos_width
	local height = resolution_height / current_height * pos_height

	return width, height
end

TutorialUI.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.player_manager = ingame_ui_context.player_manager
	self.camera_manager = ingame_ui_context.camera_manager
	self.world_manager = ingame_ui_context.world_manager
	self.peer_id = ingame_ui_context.peer_id
	self.platform = PLATFORM
	self.localized_texts = {
		hold = Localize("interaction_prefix_hold"),
		press = Localize("interaction_prefix_press"),
		to = Localize("interaction_to")
	}
	self.render_settings = {
		snap_pixel_positions = false
	}
	self.tooltip_animations = {}
	self.info_slate_entries = {}
	self.unused_info_slate_entry_scenegraphs = {}
	self.info_slate_widgets = {}
	self.entry_id_count = 0
	self.health_bars = {}
	self.objective_tooltip_widget_holders = {}
	self.widgets_for_update = {}
	self.num_widgets_for_update = 0
	self._objective_tooltip_position_lookup = {}
	self.queued_info_slate_entries = {
		mission_goal = {},
		mission_objective = {},
		side_mission = {},
		tutorial = {}
	}
	local world = self.world_manager:world("level_world")
	self.wwise_world = Managers.world:wwise_world(world)

	self:create_ui_elements()

	self.tutorial_tooltip_ui = TutorialTooltipUI:new(ingame_ui_context)
end

TutorialUI.create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph)
	self.floating_icons_ui_scene_graph = UISceneGraph.init_scenegraph(definitions.floating_icons_scene_graph)
	self.tooltip_mission_widget = UIWidget.init(definitions.widgets.tooltip_mission)
	self.info_slate_mask = UIWidget.init(definitions.widgets.info_slate_mask)

	for i = 1, definitions.NUMBER_OF_INFO_SLATE_ENTRIES, 1 do
		self.info_slate_widgets[i] = UIWidget.init(definitions.info_slate_entries[i])
	end

	self.info_slate_widgets[INFO_SLATES.mission_goal].style.description_text.word_wrap = false
	self.info_slate_widgets[INFO_SLATES.mission_goal].style.description_text.font_type = "hell_shark"
	self.active_animations = {}

	self:add_info_slate_entries()

	for i = 1, definitions.NUMBER_OF_OBJECTIVE_TOOLTIPS, 1 do
		local scenegraph_root = "objective_tooltip_root_" .. i
		local scenegraph_id = "objective_tooltip_" .. i
		local scenegraph_text = "objective_tooltip_text" .. i
		local scenegraph_icon = "objective_tooltip_icon" .. i
		local scenegraph_arrow = "objective_tooltip_arrow" .. i
		self.objective_tooltip_widget_holders[i] = {
			widget = UIWidget.init(definitions.objective_tooltips[i]),
			animations = {},
			scenegraph_root = scenegraph_root,
			scenegraph_id = scenegraph_id,
			scenegraph_text = scenegraph_text,
			scenegraph_icon = scenegraph_icon,
			scenegraph_arrow = scenegraph_arrow
		}
	end

	self._widgets = {
		self.tooltip_widget,
		self.tooltip_mission_widget,
		self.info_slate_mask
	}

	for _, widget in pairs(self.info_slate_widgets) do
		self._widgets[#self._widgets + 1] = widget
	end

	RELOAD_TUTORIAL_UI = false
	self.ui_animator = UIAnimator:new(self.ui_scenegraph, definitions.animations)
	self.mission_goal_state = "invisible"
	self.mission_objective_state = "invisible"
	self.side_mission_state = "invisible"
	self.tutorial_state = "invisible"
	self.side_mission_visible_timer = 0
	self.info_slate_slots_taken = {}
end

TutorialUI.destroy = function (self)
	GarbageLeakDetector.register_object(self, "interaction_gui")
end

TutorialUI.get_player_first_person_extension = function (self)
	if self._first_person_extension then
		return self._first_person_extension
	else
		local peer_id = self.peer_id
		local my_player = self.player_manager:player_from_peer_id(peer_id)
		local player_unit = my_player.player_unit

		if player_unit and ScriptUnit.has_extension(player_unit, "first_person_system") then
			local first_person_extension = ScriptUnit.extension(player_unit, "first_person_system")
			self._first_person_extension = first_person_extension

			return first_person_extension
		end
	end
end

TutorialUI.update = function (self, dt, t)
	self._first_person_extension = nil

	if RELOAD_TUTORIAL_UI then
		self:create_ui_elements()
	end

	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local input_service = input_manager:get_service("Player")
	local gamepad_active = input_manager:is_device_active("gamepad")
	local resolution_modified = RESOLUTION_LOOKUP.modified

	if resolution_modified then
		for i = 1, definitions.NUMBER_OF_INFO_SLATE_ENTRIES, 1 do
			local widget = self.info_slate_widgets[i]
			widget.element.dirty = true
		end

		self.tutorial_tooltip_ui:set_dirty()
	end

	for name, ui_animation in pairs(self.tooltip_animations) do
		UIAnimation.update(ui_animation, dt)

		if UIAnimation.completed(ui_animation) then
			self.tooltip_animations[name] = nil
		end
	end

	local peer_id = self.peer_id
	local my_player = self.player_manager:player_from_peer_id(peer_id)
	local player_unit = my_player.player_unit

	if not player_unit then
		return
	end

	local render_tooltip_ui = false
	local tutorial_extension = ScriptUnit.extension(player_unit, "tutorial_system")
	self.mission_tutorial_tooltip_to_update = nil

	if tutorial_extension then
		local tooltip_tutorial = tutorial_extension.tooltip_tutorial
		local tooltip_tutorial_name = tooltip_tutorial and tooltip_tutorial.name
		local active_template = tooltip_tutorial_name and TutorialTemplates[tooltip_tutorial_name]

		if tooltip_tutorial.active then
			if active_template.is_mission_tutorial then
				self.mission_tutorial_tooltip_to_update = tooltip_tutorial

				self.tutorial_tooltip_ui:hide()
			end
		elseif self.active_tooltip_name or self.active_tooltip_widget then
			if active_template and active_template.is_mission_tutorial then
				UIRenderer.set_element_visible(ui_renderer, self.active_tooltip_widget.element, false)
			else
				self.tutorial_tooltip_ui:hide()
			end

			self.active_tooltip_widget = nil
			self.active_tooltip_name = nil
		end

		local objective_tooltips = tutorial_extension.objective_tooltips

		self:update_objective_tooltip(objective_tooltips, player_unit, dt)
	elseif self.active_tooltip_name or self.active_tooltip_widget then
		UIRenderer.set_element_visible(ui_renderer, self.active_tooltip_widget.element, false)

		self.active_tooltip_widget.element.dirty = true
		self.active_tooltip_name = nil
		self.active_tooltip_widget = nil
	end

	self.ui_animator:update(dt)
	self:update_info_slate_entries(dt, t)

	if not script_data.disable_tutorial_ui and render_tooltip_ui then
		self.tutorial_tooltip_ui:draw(dt, t)
	end
end

TutorialUI.pre_render_update = function (self, dt, t)
	local ui_scenegraph = self.floating_icons_ui_scene_graph
	local ui_renderer = self.ui_renderer
	local peer_id = self.peer_id
	local my_player = self.player_manager:player_from_peer_id(peer_id)
	local player_unit = my_player.player_unit

	if not player_unit then
		return
	end

	local input_manager = self.input_manager
	local input_service = input_manager:get_service("Player")
	local gamepad_active = input_manager:is_device_active("gamepad")
	local tutorial_extension = ScriptUnit.extension(player_unit, "tutorial_system")
	local widgets_for_update = self.widgets_for_update

	for i = 1, self.num_widgets_for_update, 1 do
		local data = widgets_for_update[i]

		self:update_objective_tooltip_widget(data[1], data[2], dt)
	end

	self:update_health_bars(dt, player_unit)

	local tooltip_tutorial = self.mission_tutorial_tooltip_to_update
	self.mission_tutorial_tooltip_to_update = nil

	if tooltip_tutorial then
		self:update_mission_tooltip(tooltip_tutorial, player_unit, dt)
	end

	if not script_data.disable_tutorial_ui then
		local first_person_extension = self:get_player_first_person_extension()

		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

		if first_person_extension.first_person_mode then
			local objective_tooltip_widget_holders = self.objective_tooltip_widget_holders

			for i = 1, definitions.NUMBER_OF_OBJECTIVE_TOOLTIPS, 1 do
				local widget_holder = objective_tooltip_widget_holders[i]

				if widget_holder.updated then
					UIRenderer.draw_widget(ui_renderer, widget_holder.widget)
				end
			end
		end

		if self.active_tooltip_widget and tooltip_tutorial then
			UIRenderer.draw_widget(ui_renderer, self.active_tooltip_widget)
		end

		if first_person_extension.first_person_mode then
			local health_bars = self.health_bars

			for i = 1, definitions.NUMBER_OF_HEALTH_BARS, 1 do
				local health_bar = health_bars[i]

				if health_bar then
					UIRenderer.draw_widget(ui_renderer, health_bar.widget)
				end
			end
		end

		UIRenderer.end_pass(ui_renderer)
	end
end

local center_position = {
	definitions.scenegraph.root.size[1] * 0.5,
	definitions.scenegraph.root.size[2] * 0.5
}

TutorialUI.update_mission_tooltip = function (self, tooltip_tutorial, player_unit, dt)
	local ui_scenegraph = self.floating_icons_ui_scene_graph
	local widget = self.tooltip_mission_widget
	local mission_tooltip_settings = UISettings.tutorial.mission_tooltip
	local tooltip_name = tooltip_tutorial.name
	local active_tooltip_name = self.active_tooltip_name
	local first_update = false

	if not active_tooltip_name or active_tooltip_name ~= tooltip_name then
		local active_template = TutorialTemplates[tooltip_name]
		local text = (active_template.text and Localize(active_template.text)) or ""
		widget.content.text = text
		self.active_tooltip_name = tooltip_name
		widget.content.texture_id = (active_template.icon and active_template.icon) or "hud_tutorial_icon_info"
		widget.style.texture_id.color[1] = 0
		widget.style.arrow.color[1] = 0
		self.mission_tooltip_animation_in_time = 0
		first_update = true
	end

	if tooltip_tutorial.world_position then
		local viewport_name = "player_1"
		local camera = nil

		if self.camera_manager:has_viewport(viewport_name) then
			local world_name = "level_world"
			local world_manager = self.world_manager

			if world_manager:has_world(world_name) then
				local world = world_manager:world(world_name)
				local viewport = ScriptWorld.viewport(world, viewport_name)
				camera = ScriptViewport.camera(viewport)
			end
		end

		local world_position = tooltip_tutorial.world_position:unbox()
		local first_person_extension = self:get_player_first_person_extension()
		local my_position = Vector3.copy(POSITION_LOOKUP[player_unit])
		local my_rotation = first_person_extension:current_rotation()
		local my_direction = Quaternion.forward(my_rotation)
		my_direction = Vector3.normalize(Vector3.flat(my_direction))
		local direction = Vector3.normalize(world_position - my_position)
		direction = Vector3.normalize(Vector3.flat(direction))
		local my_forward_dot = Vector3.dot(my_direction, direction)
		local right_vect = Quaternion.right(my_rotation)
		right_vect = Vector3.flat(right_vect)
		right_vect = Vector3.normalize(right_vect)
		local right_vect_dot = Vector3.dot(right_vect, direction)
		local x_pos, y_pos = self:convert_world_to_screen_position(camera, world_position)
		local clamped_x_pos, clamped_y_pos, is_clamped, is_behind = self:get_floating_icon_position(x_pos, y_pos, my_forward_dot, right_vect_dot, mission_tooltip_settings)

		if is_clamped or is_behind then
			if not self.mission_tooltip_animation_in_time then
				local arrow_size = ui_scenegraph.tooltip_mission_arrow.size
				local icon_size = ui_scenegraph.tooltip_mission_icon.size
				local height_from_center = y_pos - center_position[2]
				local arrow_angle, offset_x, offset_y, offset_z = self:get_arrow_angle_and_offset(my_forward_dot, right_vect_dot, arrow_size, icon_size, height_from_center)

				if offset_x ~= nil then
					local offset = widget.style.arrow.offset
					offset[1] = offset_x
					offset[2] = offset_y
					offset[3] = offset_z
				end

				widget.style.arrow.angle = arrow_angle
			end
		else
			widget.style.arrow.color[1] = 0
		end

		if not self.mission_tooltip_animation_in_time then
			self:floating_icon_animations(widget, self.tooltip_animations, is_behind, is_clamped, mission_tooltip_settings)
		end

		local use_screen_position = not is_clamped and not is_behind

		if self.mission_tooltip_animation_in_time then
			self.mission_tooltip_animation_in_time = self:animate_in_mission_tooltip(self.mission_tooltip_animation_in_time, use_screen_position, dt, widget, ui_scenegraph.tooltip_mission_icon.size)
		elseif use_screen_position then
			local current_size = ui_scenegraph.tooltip_mission_icon.size[1]
			local original_size = definitions.FLOATING_ICON_SIZE[1]
			local new_icon_size = self:get_icon_size(world_position, my_position, current_size, original_size, mission_tooltip_settings)
			ui_scenegraph.tooltip_mission_icon.size[1] = new_icon_size
			ui_scenegraph.tooltip_mission_icon.size[2] = new_icon_size
		else
			local original_size = definitions.FLOATING_ICON_SIZE[1]
			ui_scenegraph.tooltip_mission_icon.size[1] = original_size
			ui_scenegraph.tooltip_mission_icon.size[2] = original_size
		end

		local ui_local_position = ui_scenegraph.tooltip_mission_root.local_position
		local used_screen_position_last_frame = self.mission_tooltip_use_screen_position

		if (used_screen_position_last_frame and not use_screen_position) or (not used_screen_position_last_frame and use_screen_position) then
			self.mission_tooltip_lerp_speed = 0
		end

		if not first_update and self.mission_tooltip_lerp_speed then
			local lerp_speed = self.mission_tooltip_lerp_speed
			lerp_speed = math.min(lerp_speed + dt, 1)
			ui_local_position[1] = math.lerp(ui_local_position[1], clamped_x_pos, lerp_speed)
			ui_local_position[2] = math.lerp(ui_local_position[2], clamped_y_pos, lerp_speed)

			if lerp_speed == 1 then
				self.mission_tooltip_lerp_speed = nil
			else
				self.mission_tooltip_lerp_speed = lerp_speed
			end
		else
			ui_local_position[1] = clamped_x_pos
			ui_local_position[2] = clamped_y_pos
		end

		self.mission_tooltip_use_screen_position = use_screen_position
	else
		ui_scenegraph.tooltip_mission_root.local_position[1] = 0
		ui_scenegraph.tooltip_mission_root.local_position[2] = 0
	end

	self.active_tooltip_widget = widget
end

local unit_widget_lookup = {}
local new_units = {}
local unit_alive = Unit.alive

TutorialUI.update_objective_tooltip = function (self, objective_tooltips, player_unit, dt)
	local template_name = objective_tooltips.name
	local objective_units = objective_tooltips.units
	local objective_units_n = objective_tooltips.units_n
	local objective_tooltip_widget_holders = self.objective_tooltip_widget_holders
	local NUMBER_OF_OBJECTIVE_TOOLTIPS = definitions.NUMBER_OF_OBJECTIVE_TOOLTIPS
	local num_widgets_for_update = 0
	local widgets_for_update = self.widgets_for_update

	table.clear(unit_widget_lookup)

	for i = 1, NUMBER_OF_OBJECTIVE_TOOLTIPS, 1 do
		local widget_holder = objective_tooltip_widget_holders[i]
		widget_holder.updated = false

		if widget_holder.unit then
			unit_widget_lookup[widget_holder.unit] = i
		end
	end

	local new_units_n = 0
	local units_n = math.min(objective_units_n, NUMBER_OF_OBJECTIVE_TOOLTIPS)

	table.clear(self._objective_tooltip_position_lookup)

	for i = 1, units_n, 1 do
		repeat
			local objective_unit = objective_units[i]

			if not unit_alive(objective_unit) then
				break
			end

			local widget_holder_id = unit_widget_lookup[objective_unit]

			if widget_holder_id then
				local widget_holder = objective_tooltip_widget_holders[widget_holder_id]
				local animations = widget_holder.animations

				for name, ui_animations in pairs(animations) do
					UIAnimation.update(ui_animations, dt)

					if UIAnimation.completed(ui_animations) then
						animations[name] = nil
					end
				end

				num_widgets_for_update = num_widgets_for_update + 1
				local data = widgets_for_update[num_widgets_for_update]

				if not data then
					data = {}
					widgets_for_update[num_widgets_for_update] = data
				end

				data[1] = widget_holder
				data[2] = player_unit
				widget_holder.updated = true
			else
				new_units_n = new_units_n + 1
				new_units[new_units_n] = objective_unit
			end
		until true
	end

	for i = 1, NUMBER_OF_OBJECTIVE_TOOLTIPS, 1 do
		local widget_holder = objective_tooltip_widget_holders[i]

		if not widget_holder.updated then
			widget_holder.unit = nil
		end
	end

	for i = 1, new_units_n, 1 do
		local widget_holder = nil

		for j = 1, NUMBER_OF_OBJECTIVE_TOOLTIPS, 1 do
			if not objective_tooltip_widget_holders[j].updated then
				widget_holder = objective_tooltip_widget_holders[j]

				break
			end
		end

		fassert(widget_holder ~= nil, "sanity check")

		widget_holder.unit = new_units[i]

		self:setup_objective_tooltip_widget(widget_holder, objective_tooltips, player_unit, dt)

		num_widgets_for_update = num_widgets_for_update + 1
		local data = widgets_for_update[num_widgets_for_update]

		if not data then
			data = {}
			widgets_for_update[num_widgets_for_update] = data
		end

		data[1] = widget_holder
		data[2] = player_unit
		widget_holder.updated = true
	end

	self.num_widgets_for_update = num_widgets_for_update
end

TutorialUI.setup_objective_tooltip_widget = function (self, widget_holder, objective_tooltips, player_unit, dt)
	local widget = widget_holder.widget
	local template_name = objective_tooltips.name
	local template = TutorialTemplates[template_name]
	local unit = widget_holder.unit
	local unit_text = Unit.alive(unit) and Unit.get_data(unit, "tutorial_text_id")
	local text = unit_text or template.text or ""

	if template.alerts_horde then
		text = text .. "_alert_horde"
	end

	widget.content.text = (text ~= "" and Localize(text)) or ""

	if template.wave then
		widget.content.text = (text ~= "" and Localize(text) .. template.wave) or ""
	end

	widget.content.texture_id = template.icon or "hud_tutorial_icon_info"
	widget.style.texture_id.color[1] = 0
	widget.style.arrow.color[1] = 0
	widget.mission_tooltip_animation_in_time = 0
end

TutorialUI._floating_icon_overlap = function (self, widget_holder, x, y, scale)
	local lookup = self._objective_tooltip_position_lookup
	local overlap = nil

	for _, pos in pairs(lookup) do
		if ((pos[1] <= x and x <= pos[1] + 200 * scale) or (x <= pos[1] and pos[1] <= x + 200 * scale)) and ((pos[2] <= y and y <= pos[2] + definitions.FLOATING_ICON_SIZE[2] * scale) or (y <= pos[2] and pos[2] <= y + definitions.FLOATING_ICON_SIZE[2] * scale)) then
			if y < pos[2] then
				overlap = -definitions.FLOATING_ICON_SIZE[2] * 0.75 * scale

				break
			end

			overlap = definitions.FLOATING_ICON_SIZE[2] * 0.75 * scale

			break
		end
	end

	lookup[widget_holder.scenegraph_id] = {
		x,
		y
	}

	return overlap
end

local objective_tooltip_settings = UISettings.tutorial.objective_tooltip

TutorialUI.update_objective_tooltip_widget = function (self, widget_holder, player_unit, dt)
	local viewport_name = "player_1"
	local camera = nil

	if self.camera_manager:has_viewport(viewport_name) then
		local world_name = "level_world"
		local world_manager = self.world_manager

		if world_manager:has_world(world_name) then
			local world = world_manager:world(world_name)
			local viewport = ScriptWorld.viewport(world, viewport_name)
			camera = ScriptViewport.camera(viewport)
		end
	end

	local objective_unit = widget_holder.unit

	if not objective_unit or not Unit.alive(objective_unit) or not Unit.alive(player_unit) then
		return
	end

	local objective_unit_position = Unit.world_position(objective_unit, 0) + Vector3.up()
	local first_person_extension = self:get_player_first_person_extension()
	local player_position = first_person_extension:current_position()
	local player_rotation = first_person_extension:current_rotation()
	local player_direction_forward = Quaternion.forward(player_rotation)
	player_direction_forward = Vector3.normalize(Vector3.flat(player_direction_forward))
	local player_direction_right = Quaternion.right(player_rotation)
	player_direction_right = Vector3.normalize(Vector3.flat(player_direction_right))
	local offset = objective_unit_position - player_position
	local direction = Vector3.normalize(Vector3.flat(offset))
	local forward_dot = Vector3.dot(player_direction_forward, direction)
	local right_dot = Vector3.dot(player_direction_right, direction)
	local x_pos, y_pos = self:convert_world_to_screen_position(camera, objective_unit_position)
	local x, y, is_clamped, is_behind = self:get_floating_icon_position(x_pos, y_pos, forward_dot, right_dot, objective_tooltip_settings)
	local ui_scenegraph = self.floating_icons_ui_scene_graph
	local widget = widget_holder.widget
	local animation_in_time = widget_holder.animation_in_time

	if is_clamped or is_behind then
		if not animation_in_time then
			local arrow_size = ui_scenegraph[widget_holder.scenegraph_arrow].size
			local icon_size = ui_scenegraph[widget_holder.scenegraph_icon].size
			local height_from_center = y_pos - center_position[2]
			local arrow_angle, offset_x, offset_y, offset_z = self:get_arrow_angle_and_offset(forward_dot, right_dot, arrow_size, icon_size, height_from_center)

			if offset_x ~= nil then
				local offset = widget.style.arrow.offset
				offset[1] = offset_x
				offset[2] = offset_y
				offset[3] = offset_z
			end

			widget.style.arrow.angle = arrow_angle
		end
	else
		widget.style.arrow.color[1] = 0
	end

	if not animation_in_time then
		self:floating_icon_animations(widget, widget_holder.animations, is_behind, is_clamped, objective_tooltip_settings)
	end

	local use_screen_position = not is_clamped and not is_behind

	if animation_in_time then
		local size = ui_scenegraph[widget_holder.scenegraph_icon].size
		widget_holder.animation_in_time = self:animate_in_mission_tooltip(animation_in_time, use_screen_position, dt, widget, size)
	elseif use_screen_position then
		local current_size = ui_scenegraph[widget_holder.scenegraph_icon].size[1]
		local original_size = definitions.FLOATING_ICON_SIZE[1]
		local new_icon_size, new_icon_scale = self:get_icon_size(objective_unit_position, player_position, current_size, original_size, objective_tooltip_settings)
		ui_scenegraph.tooltip_mission_icon.size[1] = new_icon_size
		ui_scenegraph.tooltip_mission_icon.size[2] = new_icon_size
		widget.style.texture_id.size[1] = new_icon_size
		widget.style.texture_id.size[2] = new_icon_size
		widget.style.texture_id.offset[2] = new_icon_size * (1 - new_icon_scale)
		local font_size = math.lerp(widget_holder.current_font_size or 30, new_icon_scale * 30, 0.2)
		widget.style.text.font_size = font_size

		if widget.style.text_shadow then
			widget.style.text_shadow.font_size = font_size
		end

		ui_scenegraph[widget_holder.scenegraph_icon].size[1] = new_icon_size
		widget_holder.current_font_size = font_size
		local overlap = self:_floating_icon_overlap(widget_holder, x, y, new_icon_scale)

		if overlap then
			y = y + overlap
			widget_holder.lerp_speed = 0.6
		end
	else
		local original_size = definitions.FLOATING_ICON_SIZE[1]
		local size = ui_scenegraph[widget_holder.scenegraph_icon].size
		size[1] = original_size
		size[2] = original_size
		widget.style.texture_id.size[1] = original_size
		widget.style.texture_id.size[2] = original_size
		widget.style.texture_id.offset[2] = 0
		widget.style.text.font_size = 30

		if widget.style.text_shadow then
			widget.style.text_shadow.font_size = 30
		end

		ui_scenegraph[widget_holder.scenegraph_icon].size[1] = original_size
	end

	local used_screen_position_last_frame = widget_holder.use_screen_position

	if (used_screen_position_last_frame and not use_screen_position) or (not used_screen_position_last_frame and use_screen_position) then
		widget_holder.lerp_speed = 0
	end

	local ui_local_position = ui_scenegraph[widget_holder.scenegraph_root].local_position

	if widget_holder.lerp_speed then
		local lerp_speed = widget_holder.lerp_speed
		lerp_speed = math.min(lerp_speed + dt, 1)
		ui_local_position[1] = math.lerp(ui_local_position[1], x, lerp_speed)
		ui_local_position[2] = math.lerp(ui_local_position[2], y, lerp_speed)

		if lerp_speed == 1 then
			widget_holder.lerp_speed = nil
		else
			widget_holder.lerp_speed = lerp_speed
		end
	else
		ui_local_position[1] = x
		ui_local_position[2] = y
	end

	widget_holder.use_screen_position = use_screen_position
end

TutorialUI.get_floating_icon_position = function (self, screen_pos_x, screen_pos_y, forward_dot, right_dot, tooltip_settings)
	local root_size = UISceneGraph.get_size_scaled(self.ui_scenegraph, "root")
	local scale = RESOLUTION_LOOKUP.scale
	local scaled_root_size_x = root_size[1] * scale
	local scaled_root_size_y = root_size[2] * scale
	local scaled_root_size_x_half = scaled_root_size_x * 0.5
	local scaled_root_size_y_half = scaled_root_size_y * 0.5
	local screen_width = RESOLUTION_LOOKUP.res_w
	local screen_height = RESOLUTION_LOOKUP.res_h
	local center_pos_x = screen_width / 2
	local center_pos_y = screen_height / 2
	local x_diff = screen_pos_x - center_pos_x
	local y_diff = center_pos_y - screen_pos_y
	local is_x_clamped = false
	local is_y_clamped = false

	if math.abs(x_diff) > scaled_root_size_x_half * 0.9 then
		is_x_clamped = true
	end

	if math.abs(y_diff) > scaled_root_size_y_half * 0.9 then
		is_y_clamped = true
	end

	local clamped_x_pos = screen_pos_x
	local clamped_y_pos = screen_pos_y
	local is_behind = (forward_dot < 0 and true) or false
	local is_clamped = ((is_x_clamped or is_y_clamped) and true) or false

	if is_clamped or is_behind then
		local distance_from_center = tooltip_settings.distance_from_center
		clamped_x_pos = scaled_root_size_x_half + right_dot * distance_from_center.width * scale
		clamped_y_pos = scaled_root_size_y_half + forward_dot * distance_from_center.height * scale
	else
		local screen_pos_diff_x = screen_width - scaled_root_size_x
		local screen_pos_diff_y = screen_height - scaled_root_size_y
		clamped_x_pos = clamped_x_pos - screen_pos_diff_x / 2
		clamped_y_pos = clamped_y_pos - screen_pos_diff_y / 2
	end

	local inverse_scale = RESOLUTION_LOOKUP.inv_scale
	clamped_x_pos = clamped_x_pos * inverse_scale
	clamped_y_pos = clamped_y_pos * inverse_scale

	return clamped_x_pos, clamped_y_pos, is_clamped, is_behind
end

TutorialUI.floating_icon_animations = function (self, widget, animation_container, is_behind, is_clamped, tooltip_settings)
	local icon_style = widget.style.texture_id
	local text_style = widget.style.text
	local text_shadow_style = widget.style.text_shadow

	if is_clamped or is_behind then
		local alpha_fade_out_value = tooltip_settings.alpha_fade_out_value
		widget.style.arrow.color[1] = alpha_fade_out_value

		if not animation_container.out_of_view and icon_style.color[1] ~= alpha_fade_out_value then
			animation_container.in_of_view = nil
			animation_container.in_of_view_text = nil
			animation_container.in_of_view_text_shadow = nil
			local fade_out_time = tooltip_settings.fade_out_time
			animation_container.out_of_view = UIAnimation.init(UIAnimation.function_by_time, icon_style.color, 1, icon_style.color[1], alpha_fade_out_value, fade_out_time, math.easeInCubic)
			text_style.text_color[1] = 0
			text_shadow_style.text_color[1] = 0
		end
	else
		widget.style.arrow.color[1] = 0
		animation_container.out_of_view = nil

		if not animation_container.in_of_view and icon_style.color[1] ~= 255 then
			local fade_in_time = tooltip_settings.fade_in_time
			animation_container.in_of_view = UIAnimation.init(UIAnimation.function_by_time, icon_style.color, 1, icon_style.color[1], 255, fade_in_time, math.easeInCubic)
		end

		if not animation_container.in_of_view_text and text_style.text_color[1] ~= 255 then
			local fade_in_time = tooltip_settings.fade_in_time
			animation_container.in_of_view_text = UIAnimation.init(UIAnimation.function_by_time, text_style.text_color, 1, text_style.text_color[1], 255, fade_in_time, math.easeInCubic)
			animation_container.in_of_view_text_shadow = UIAnimation.init(UIAnimation.function_by_time, text_shadow_style.text_color, 1, text_shadow_style.text_color[1], 255, fade_in_time, math.easeInCubic)
		end
	end
end

TutorialUI.get_arrow_angle_and_offset = function (self, forward_dot, right_dot, arrow_size, icon_size, height_from_center)
	local static_angle_value = 1.57079633
	local offset_x = 0
	local offset_y = 0
	local offset_z = 0
	local angle = math.atan2(right_dot, forward_dot)

	if height_from_center < -400 and forward_dot > 0.6 then
		offset_y = -(icon_size[2] * 0.5 + arrow_size[2])
		static_angle_value = static_angle_value * 2
	elseif height_from_center > 400 and forward_dot > 0.6 then
		offset_y = icon_size[2] * 0.5 + arrow_size[2]
		static_angle_value = 0
	elseif angle > 0 then
		offset_x = icon_size[2] * 0.5 + arrow_size[2]
	elseif angle < 0 then
		offset_x = -(icon_size[2] * 0.5 + arrow_size[2])
		static_angle_value = -static_angle_value
	else
		offset_x, offset_y, offset_z = nil
		static_angle_value = 0
	end

	return static_angle_value, offset_x, offset_y, offset_z
end

TutorialUI.get_icon_size = function (self, position, player_position, current_size, original_size, tooltip_settings)
	local size = original_size
	local start_scale_distance = tooltip_settings.start_scale_distance
	local end_scale_distance = tooltip_settings.end_scale_distance
	local distance = Vector3.distance(position, player_position)
	local icon_scale = 1

	if start_scale_distance < distance then
		icon_scale = self:icon_scale_by_distance(distance - start_scale_distance, end_scale_distance)
		size = math.lerp(current_size, icon_scale * original_size, 0.2)
	end

	return size, icon_scale
end

TutorialUI.icon_scale_by_distance = function (self, current_distance, max_distance)
	local distance = math.min(max_distance, current_distance)
	distance = math.max(0, distance)
	local min_scale = UISettings.tutorial.mission_tooltip.minimum_icon_scale
	local scale = math.max(min_scale, 1 - distance / max_distance)

	return scale
end

TutorialUI.distance_between_screen_positions = function (self, position_a, position_b)
	local width = position_a[1] - position_b[1]
	local height = position_a[2] - position_b[2]

	if width < 0 then
		width = -1 * width
	end

	if height < 0 then
		height = -1 * height
	end

	return {
		width,
		height
	}
end

TutorialUI.convert_world_to_screen_position = function (self, camera, world_position)
	if camera then
		local world_to_screen = Camera.world_to_screen(camera, world_position)

		return world_to_screen.x, world_to_screen.y
	end
end

TutorialUI.animate_in_mission_tooltip = function (self, time, render_text, dt, widget, size_target)
	local icon_style = widget.style.texture_id
	local text_style = widget.style.text
	local total_time = 0.5
	time = time + dt
	local progress = math.min(time / total_time, 1)
	local icon_progress = math.min(progress / 0.5, 1)
	local text_progress = math.min(math.max(0, (progress - 0.5) / 0.5), 1)
	local catmullrom_value = math.catmullrom(icon_progress, 1, 0.9, 1, -0.1)
	local icon_style = widget.style.texture_id
	local icon_size = catmullrom_value * definitions.FLOATING_ICON_SIZE[1]
	size_target[1] = icon_size
	size_target[2] = icon_size
	icon_style.color[1] = math.min(progress * 4, 1) * 255
	local text_alpha = (render_text and 255 * text_progress) or 0
	widget.style.text.text_color[1] = text_alpha

	if widget.style.text_shadow then
		widget.style.text_shadow.text_color[1] = text_alpha
	end

	return (progress < 1 and time) or nil
end

TutorialUI.add_info_slate_entries = function (self)
	for i = 1, definitions.NUMBER_OF_INFO_SLATE_ENTRIES, 1 do
		local widget = self.info_slate_widgets[i]
		local scenegraph_id = widget.scenegraph_id
		widget.style.background_texture.color[1] = 0
		local text_scenegraph_id = scenegraph_id .. "_text"
		local icon_scenegraph_id = scenegraph_id .. "_icon"
		local icon_root_scenegraph_id = scenegraph_id .. "_icon_root"
		local left_frame_scenegraph_id = scenegraph_id .. "_left_frame"
		local frame_glow_middle_scenegraph_id = scenegraph_id .. "_frame_glow_middle"
		local frame_glow_uv_scenegraph_id = scenegraph_id .. "_frame_glow_uv"

		if INFO_SLATES[i] == "mission_goal" then
			widget.content.icon_texture.texture_id = "hud_tutorial_icon_mission"
		elseif INFO_SLATES[i] ~= "tutorial" then
			widget.content.icon_texture.texture_id = "hud_tutorial_icon_sidemission"
		end

		local entry = {
			widget = widget,
			scenegraph_id = scenegraph_id,
			text_scenegraph_id = text_scenegraph_id,
			icon_scenegraph_id = icon_scenegraph_id,
			icon_root_scenegraph_id = icon_root_scenegraph_id,
			entry_id = i
		}
		self.info_slate_entries[i] = entry
	end
end

TutorialUI.queue_info_slate_entry = function (self, info_slate_type, text, icon_texture, update_sound, template, unit, raycast_unit)
	local entry_id = self.entry_id_count + 1
	local queue = self.queued_info_slate_entries[info_slate_type]
	queue[entry_id] = {
		text = text,
		icon_texture = icon_texture,
		update_sound = update_sound,
		entry_id = entry_id,
		template = template,
		unit = unit,
		raycast_unit = raycast_unit
	}
	self.entry_id_count = entry_id

	return entry_id
end

TutorialUI.clear_tutorials = function (self)
	self.queued_info_slate_entries.tutorial = {}
	local ui_animator = self.ui_animator
	local info_slate = self.info_slate_entries[INFO_SLATES.tutorial]
	local widget = info_slate.widget
	local scenegraph_definition = definitions.scenegraph[widget.scenegraph_id]

	if self.tutorial_state ~= "animating_out" and self.tutorial_state ~= "invisible" then
		self.tutorial_anim_id = ui_animator:start_animation("info_slate_exit", widget, scenegraph_definition)
		self.tutorial_state = "animating_out"
	end
end

TutorialUI.complete_mission_info_slate = function (self, info_slate_type, entry_id)
	if info_slate_type == "side_mission" then
		return
	end

	self:play_sound("hud_info_slate_mission_complete")

	local queue = self.queued_info_slate_entries[info_slate_type]

	for index, entry in pairs(queue) do
		if entry.entry_id == entry_id then
			queue[index] = nil

			return
		end
	end
end

TutorialUI.update_info_slate_entry_text = function (self, info_slate_type, entry_id, text)
	local queue = self.queued_info_slate_entries[info_slate_type]

	for index, entry in pairs(queue) do
		if entry.entry_id == entry_id then
			local widget = entry.widget
			entry.updated = true
			entry.text = text

			self:play_sound("hud_info_slate_mission_update")

			return
		end
	end
end

local anim_params = {
	slot_1 = {
		end_id = "info_slate_slot1_end",
		start_id = "info_slate_slot1_start"
	},
	slot_2 = {
		end_id = "info_slate_slot2_end",
		start_id = "info_slate_slot2_start"
	}
}

TutorialUI.update_info_slate_entries = function (self, dt, t)
	local ui_scenegraph = self.ui_scenegraph
	local ui_animator = self.ui_animator
	local info_slate_entries = self.info_slate_entries

	if info_slate_entries then
		local queue = self.queued_info_slate_entries.mission_goal
		local mission_goal_slate = self.info_slate_entries[INFO_SLATES.mission_goal]
		local widget = mission_goal_slate.widget
		local scenegraph_definition = definitions.scenegraph[widget.scenegraph_id]
		self.mission_goal_state = self.mission_goal_state or "invisible"

		if self.mission_goal_state == "invisible" and self.mission_objective_state == "invisible" then
			local entry_id = next(queue)

			if entry_id and not self.info_slate_slots_taken[1] then
				self.info_slate_slots_taken[1] = true
				local entry = queue[entry_id]
				local text = entry.text
				self.mission_goal_entry = entry
				widget.content.description_text = text
				self.mission_goal_anim_id = ui_animator:start_animation("info_slate_enter", widget, scenegraph_definition, anim_params.slot_1)

				self:play_sound("hud_info_slate_mission_entry")

				self.mission_goal_state = "animating_in"
			end
		elseif self.mission_goal_state == "animating_in" then
			if ui_animator:is_animation_completed(self.mission_goal_anim_id) then
				self.mission_goal_anim_id = ui_animator:start_animation("mission_goal_wait", widget, scenegraph_definition)
				self.mission_goal_state = "waiting"
			end
		elseif self.mission_goal_state == "waiting" then
			if ui_animator:is_animation_completed(self.mission_goal_anim_id) then
				self.mission_goal_anim_id = ui_animator:start_animation("mission_goal_move_up", widget, scenegraph_definition)
				self.mission_goal_state = "animating_up"
			end
		elseif self.mission_goal_state == "animating_up" then
			if ui_animator:is_animation_completed(self.mission_goal_anim_id) then
				self.mission_goal_anim_id = nil
				self.mission_goal_state = "visible"
			end
		elseif self.mission_goal_state == "visible" then
			if queue[self.mission_goal_entry.entry_id] == nil then
				self.mission_goal_anim_id = ui_animator:start_animation("info_slate_exit", widget, scenegraph_definition)
				self.mission_goal_state = "animating_out"
			elseif next(self.queued_info_slate_entries.mission_objective) ~= nil then
				self.mission_goal_anim_id = ui_animator:start_animation("info_slate_exit", widget, scenegraph_definition)
				self.mission_goal_state = "animating_out"
			end
		elseif self.mission_goal_state == "animating_out" and ui_animator:is_animation_completed(self.mission_goal_anim_id) then
			UIRenderer.set_element_visible(self.ui_renderer, widget.element, false)

			self.info_slate_slots_taken[1] = false
			self.mission_goal_state = "invisible"
		end

		local queue = self.queued_info_slate_entries.mission_objective
		local info_slate = self.info_slate_entries[INFO_SLATES.mission_objective]
		local widget = info_slate.widget
		local scenegraph_definition = definitions.scenegraph[widget.scenegraph_id]
		self.mission_objective_state = self.mission_objective_state or "invisible"

		if self.mission_objective_state == "invisible" then
			local entry_id = next(queue)

			if entry_id and not self.info_slate_slots_taken[1] then
				for i = 1, 1, 1 do
					if not self.info_slate_slots_taken[i] then
						self.info_slate_slots_taken[i] = true
						local entry = queue[entry_id]
						entry.slot = i
						local text = entry.text
						self.mission_objective_entry = entry
						widget.content.description_text = text
						self.mission_objective_anim_id = ui_animator:start_animation("info_slate_enter", widget, scenegraph_definition, anim_params[(i == 1 and "slot_1") or "slot_2"])
						local entry_size = definitions.INFO_SLATE_ENTRY_SIZE
						local text_scenegraph_id = info_slate.text_scenegraph_id
						local icon_scenegraph_id = info_slate.icon_scenegraph_id
						local text_style = widget.style.description_text
						local text_height, num_texts = self:info_slate_text_height(text, text_style)
						local entry_height = math.max(entry_size[2], text_height)
						ui_scenegraph[text_scenegraph_id].size[2] = entry_height
						local std_height = ui_scenegraph[widget.scenegraph_id].size[2]
						ui_scenegraph[widget.scenegraph_id].size[2] = entry_height
						ui_scenegraph[widget.scenegraph_id].position[2] = ui_scenegraph[widget.scenegraph_id].position[2] - entry_height + entry_size[2]
						ui_scenegraph[info_slate.icon_root_scenegraph_id].vertical_alignment = (num_texts > 1 and "top") or "center"
						ui_scenegraph[info_slate.icon_root_scenegraph_id].position[2] = (num_texts > 1 and -10) or 0

						self:play_sound("hud_info_slate_mission_entry")

						self.mission_objective_state = "animating_in"

						break
					end
				end
			end
		elseif self.mission_objective_state == "animating_in" then
			if ui_animator:is_animation_completed(self.mission_objective_anim_id) then
				self.mission_objective_anim_id = ui_animator:start_animation("mission_goal_wait", widget, scenegraph_definition)
				self.mission_objective_state = "visible"
			end
		elseif self.mission_objective_state == "visible" then
			if self.mission_objective_entry.updated then
				self.mission_objective_entry.updated = nil
				self.mission_objective_anim_id = ui_animator:start_animation("info_slate_flash", widget, scenegraph_definition)
				self.mission_objective_state = "flashing"
				widget.content.description_text = self.mission_objective_entry.text
			elseif queue[self.mission_objective_entry.entry_id] == nil then
				self.mission_objective_anim_id = ui_animator:start_animation("info_slate_exit", widget, scenegraph_definition)
				self.mission_objective_state = "animating_out"
			end
		elseif self.mission_objective_state == "moving" then
			if ui_animator:is_animation_completed(self.mission_objective_anim_id) then
				self.mission_objective_state = "visible"
			end
		elseif self.mission_objective_state == "flashing" then
			if ui_animator:is_animation_completed(self.mission_objective_anim_id) then
				self.mission_objective_state = "visible"
			end
		elseif self.mission_objective_state == "animating_out" and ui_animator:is_animation_completed(self.mission_objective_anim_id) then
			UIRenderer.set_element_visible(self.ui_renderer, widget.element, false)

			self.info_slate_slots_taken[self.mission_objective_entry.slot] = false
			self.mission_objective_state = "invisible"
		end

		local queue = self.queued_info_slate_entries.side_mission
		local info_slate = self.info_slate_entries[INFO_SLATES.side_mission]
		local widget = info_slate.widget
		local scenegraph_definition = definitions.scenegraph[widget.scenegraph_id]
		self.side_mission_state = self.side_mission_state or "invisible"

		if self.side_mission_state == "invisible" then
			for entry_id, entry in pairs(queue) do
				if entry.updated then
					self.side_mission_state = "waiting_for_tutorial"

					break
				end
			end
		elseif self.side_mission_state == "waiting_for_tutorial" and self.tutorial_state == "invisible" then
			for i = 2, 2, 1 do
				if not self.info_slate_slots_taken[i] then
					self.info_slate_slots_taken[i] = true
					local entry = queue[next(queue)]
					entry.slot = i
					local text = entry.text
					self.side_mission_entry = entry
					widget.content.description_text = text
					local anim_param_name = (i == 1 and "slot_1") or (i == 2 and "slot_2") or "slot_3"
					self.side_mission_anim_id = ui_animator:start_animation("info_slate_enter", widget, scenegraph_definition, anim_params[anim_param_name])
					self.side_mission_state = "animating_in"

					break
				end
			end
		elseif self.side_mission_state == "animating_in" then
			if ui_animator:is_animation_completed(self.side_mission_anim_id) then
				self.side_mission_anim_id = ui_animator:start_animation("mission_goal_wait", widget, scenegraph_definition)
				self.side_mission_visible_timer = 0
				self.side_mission_state = "visible"
			end
		elseif self.side_mission_state == "visible" then
			self.side_mission_visible_timer = self.side_mission_visible_timer + dt

			if self.side_mission_visible_timer > 1 then
				local slot = self.side_mission_entry.slot
				local anim_param_name = (slot == 1 and "slot_1") or (slot == 2 and "slot_2") or "slot_3"
				self.side_mission_anim_id = ui_animator:start_animation("info_slate_exit", widget, scenegraph_definition, anim_params[anim_param_name])
				self.side_mission_state = "animating_out"
			elseif self.side_mission_entry.updated then
				self.side_mission_entry.updated = nil
				self.side_mission_anim_id = ui_animator:start_animation("info_slate_flash", widget, scenegraph_definition)
				self.side_mission_state = "flashing"
				widget.content.description_text = self.side_mission_entry.text
			elseif queue[self.side_mission_entry.entry_id] == nil then
				self.side_mission_anim_id = ui_animator:start_animation("info_slate_exit", widget, scenegraph_definition)
				self.side_mission_state = "animating_out"
			end
		elseif self.side_mission_state == "moving" then
			if ui_animator:is_animation_completed(self.side_mission_anim_id) then
				self.side_mission_visible_timer = 0
				self.side_mission_state = "visible"
			end
		elseif self.side_mission_state == "flashing" then
			if ui_animator:is_animation_completed(self.side_mission_anim_id) then
				self.side_mission_visible_timer = 0
				self.side_mission_state = "visible"
			end
		elseif self.side_mission_state == "animating_out" and ui_animator:is_animation_completed(self.side_mission_anim_id) then
			UIRenderer.set_element_visible(self.ui_renderer, widget.element, false)

			self.info_slate_slots_taken[self.side_mission_entry.slot] = false
			self.side_mission_state = "invisible"
		end

		local queue = self.queued_info_slate_entries.tutorial
		local info_slate = self.info_slate_entries[INFO_SLATES.tutorial]
		local widget = info_slate.widget
		local scenegraph_definition = definitions.scenegraph[widget.scenegraph_id]
		self.tutorial_state = self.tutorial_state or "invisible"
		local entry_id = self:_get_next_verified(queue, t)

		if self.tutorial_state == "invisible" and self.side_mission_state == "invisible" then
			if entry_id then
				for i = 2, 2, 1 do
					if not self.info_slate_slots_taken[i] then
						self.info_slate_slots_taken[i] = true
						local entry = queue[entry_id]
						entry.slot = i
						local text = entry.text
						self.tutorial_entry = entry
						widget.content.description_text = text
						self.tutorial_anim_id = ui_animator:start_animation("info_slate_enter", widget, scenegraph_definition, anim_params[(i == 1 and "slot_1") or "slot_2"])
						local entry_size = definitions.INFO_SLATE_ENTRY_SIZE
						local text_scenegraph_id = info_slate.text_scenegraph_id
						local icon_scenegraph_id = info_slate.icon_scenegraph_id
						local text_style = widget.style.description_text
						local text_height, num_texts = self:info_slate_text_height(text, text_style)
						local entry_height = math.max(entry_size[2], text_height)
						ui_scenegraph[text_scenegraph_id].size[2] = entry_height
						local std_height = ui_scenegraph[widget.scenegraph_id].size[2]
						ui_scenegraph[widget.scenegraph_id].size[2] = entry_height
						ui_scenegraph[widget.scenegraph_id].position[2] = ui_scenegraph[widget.scenegraph_id].position[2] - entry_height + entry_size[2]
						ui_scenegraph[info_slate.icon_root_scenegraph_id].vertical_alignment = (num_texts > 1 and "top") or "center"
						ui_scenegraph[info_slate.icon_root_scenegraph_id].position[2] = (num_texts > 1 and -10) or 0
						self.tutorial_state = "animating_in"

						break
					end
				end
			end
		elseif self.tutorial_state == "animating_in" then
			if ui_animator:is_animation_completed(self.tutorial_anim_id) then
				self.tutorial_anim_id = ui_animator:start_animation("mission_goal_wait", widget, scenegraph_definition)
				self.tutorial_visible_timer = 0
				self.tutorial_state = "visible"
			end
		elseif self.tutorial_state == "visible" then
			self.tutorial_visible_timer = self.tutorial_visible_timer + dt

			if self.tutorial_visible_timer > 10 then
				local slot = self.tutorial_entry.slot
				local anim_param_name = (slot == 1 and "slot_1") or (slot == 2 and "slot_2") or "slot_3"
				self.tutorial_anim_id = ui_animator:start_animation("info_slate_exit", widget, scenegraph_definition, anim_params[anim_param_name])
				self.tutorial_state = "animating_out"
			elseif self.tutorial_entry.updated then
				self.tutorial_entry.updated = nil
				self.tutorial_anim_id = ui_animator:start_animation("info_slate_flash", widget, scenegraph_definition)
				self.tutorial_state = "flashing"
				widget.content.description_text = self.tutorial_entry.text
			elseif self.side_mission_state == "waiting_for_tutorial" then
				self.tutorial_anim_id = ui_animator:start_animation("info_slate_exit", widget, scenegraph_definition)
				self.tutorial_state = "animating_out"
			end
		elseif self.tutorial_state == "moving" then
			if ui_animator:is_animation_completed(self.tutorial_anim_id) then
				self.info_slate_slots_taken[3 - self.tutorial_entry.slot] = false
				self.tutorial_state = "visible"
			end
		elseif self.tutorial_state == "flashing" then
			if ui_animator:is_animation_completed(self.tutorial_anim_id) then
				self.tutorial_state = "visible"
			end
		elseif self.tutorial_state == "animating_out" and ui_animator:is_animation_completed(self.tutorial_anim_id) then
			UIRenderer.set_element_visible(self.ui_renderer, widget.element, false)

			self.info_slate_slots_taken[self.tutorial_entry.slot] = false
			queue[self.tutorial_entry.entry_id] = nil
			self.tutorial_state = "invisible"
		end
	end
end

TutorialUI._get_next_verified = function (self, queue, t)
	local tutorial_system = Managers.state.entity:system("tutorial_system")

	while true do
		local entry_id, entry = next(queue)

		if not entry_id then
			return
		end

		local unit = entry.unit
		local template = entry.template
		local raycast_unit = entry.raycast_unit

		if not Unit.alive(unit) or not template then
			return entry_id
		end

		if tutorial_system:verify_info_slate(t, unit, raycast_unit, template) then
			return entry_id

			if entry_id then
				print("Verification failed: " .. entry.text)

				queue[entry_id] = nil

				if self.tutorial_state ~= "invisible" then
					local slot = self.tutorial_entry.slot
					local info_slate = self.info_slate_entries[INFO_SLATES.tutorial]
					local widget = info_slate.widget
					local scenegraph_definition = definitions.scenegraph[widget.scenegraph_id]
					local anim_param_name = (slot == 1 and "slot_1") or (slot == 2 and "slot_2") or "slot_3"

					self.ui_animator:stop_animation(self.tutorial_anim_id)

					self.tutorial_anim_id = self.ui_animator:start_animation("info_slate_exit", widget, scenegraph_definition, anim_params[anim_param_name])
					self.tutorial_state = "animating_out"
				end
			end
		end
	end
end

TutorialUI.info_slate_text_height = function (self, text, text_style)
	local entry_size = table.clone(definitions.INFO_SLATE_ENTRY_SIZE)
	entry_size[1] = entry_size[1] - 62
	local ui_renderer = self.ui_renderer
	local font, scaled_font_size = UIFontByResolution(text_style)
	local font_material, font_size, font_name = unpack(font)
	local font_height, font_min, font_max = UIGetFontHeight(self.ui_renderer.gui, font_name, scaled_font_size)
	font_height = font_max - font_min
	local texts = UIRenderer.word_wrap(ui_renderer, text, font[1], scaled_font_size, entry_size[1])
	local margin = 20
	local text_count = #texts

	return font_height * RESOLUTION_LOOKUP.inv_scale * text_count + margin, text_count
end

TutorialUI.play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)
end

TutorialUI.add_health_bar = function (self, unit)
	for i = 1, definitions.NUMBER_OF_HEALTH_BARS, 1 do
		if self.health_bars[i] == nil then
			local color = (Unit.has_data(unit, "health_bar_color") and Unit.get_data(unit, "health_bar_color")) or "red"
			local widget_definition = definitions.health_bar_definitions[i]
			local widget = UIWidget.init(widget_definition)
			widget.style.texture_fg.color = Colors.get_table(color)
			self.health_bars[i] = {
				health_percent = 1,
				init_position = true,
				visible_time = 0,
				damage_time = 0,
				visible = true,
				active = false,
				unit = unit,
				health_extension = ScriptUnit.extension(unit, "health_system"),
				widget = widget,
				scenegraph_definition = self.floating_icons_ui_scene_graph[widget_definition.scenegraph_id]
			}

			break
		end
	end
end

TutorialUI.remove_health_bar = function (self, unit)
	for i = 1, definitions.NUMBER_OF_HEALTH_BARS, 1 do
		local health_bar = self.health_bars[i]

		if health_bar and health_bar.unit == unit then
			self.health_bars[i] = nil

			break
		end
	end
end

TutorialUI.show_health_bar = function (self, unit, visible)
	for i = 1, definitions.NUMBER_OF_HEALTH_BARS, 1 do
		local health_bar = self.health_bars[i]

		if health_bar and health_bar.unit == unit then
			health_bar.visible = visible

			break
		end
	end
end

TutorialUI.update_health_bars = function (self, dt, player_unit)
	local first_person_extension = self:get_player_first_person_extension()
	local camera_position = first_person_extension:current_position()
	local camera_rotation = first_person_extension:current_rotation()
	local camera_forward = Quaternion.forward(camera_rotation)
	local viewport_name = "player_1"
	local camera = nil

	if self.camera_manager:has_viewport(viewport_name) then
		local world_name = "level_world"
		local world_manager = self.world_manager

		if world_manager:has_world(world_name) then
			local world = world_manager:world(world_name)
			local viewport = ScriptWorld.viewport(world, viewport_name)
			camera = ScriptViewport.camera(viewport)
		end
	end

	local ui_renderer = self.ui_renderer
	local health_bars = self.health_bars
	local inverse_scale = RESOLUTION_LOOKUP.inv_scale
	local math_floor = math.floor

	for i = 1, definitions.NUMBER_OF_HEALTH_BARS, 1 do
		local health_bar = health_bars[i]

		if health_bar then
			local hb_unit = health_bar.unit
			local hb_node_name = Unit.get_data(hb_unit, "health_bar_node")
			local hb_node = (hb_node_name and Unit.node(hb_unit, hb_node_name)) or 0
			local world_position = Unit.world_position(hb_unit, hb_node)
			local player_to_hb = Vector3.normalize(world_position - camera_position)
			local dot = Vector3.dot(camera_forward, player_to_hb)
			local health_percent_current = health_bar.health_extension:current_health_percent()
			local health_percent_last = health_bar.health_percent
			local damages, damages_n = health_bar.health_extension:recent_damages()
			local took_damage = damages_n > 0

			if took_damage then
				health_bar.visible_time = 1
				health_bar.damage_time = 0.5
			end

			health_bar.visible_time = health_bar.visible_time - dt
			health_bar.damage_time = health_bar.damage_time - dt

			if dot > 0 then
				local health_percent = health_percent_last

				if health_bar.visible_time > 0 and health_bar.damage_time < 0 and health_percent_current < health_percent_last then
					health_percent = math.max(health_percent_current, health_percent_last - dt)
					health_bar.health_percent = health_percent
				end

				health_percent = health_percent_current
				health_bar.health_percent = health_percent
				local x_pos, y_pos = self:convert_world_to_screen_position(camera, world_position)
				local scenegraph_definition = health_bar.scenegraph_definition
				local ui_local_position = scenegraph_definition.local_position
				ui_local_position[1] = x_pos * inverse_scale
				ui_local_position[2] = y_pos * inverse_scale
				local size = scenegraph_definition.size
				local style = health_bar.widget.style
				style.texture_fg.size[1] = size[1] * health_percent_current
				health_bar.widget.content.visible = true
			else
				health_bar.widget.content.visible = false
			end

			if health_bar.widget.content.visible ~= health_bar.visible then
				health_bar.widget.content.visible = health_bar.visible
			end
		end
	end
end

TutorialUI.set_visible = function (self, visible)
	self.tutorial_tooltip_ui:set_visible(visible)
end

return
