local definitions = local_require("scripts/ui/hud_ui/buff_presentation_ui_definitions")
local animation_definitions = definitions.animation_definitions
local scenegraph_definition = definitions.scenegraph_definition
BuffPresentationUI = class(BuffPresentationUI)

BuffPresentationUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	local world = ingame_ui_context.world_manager:world("level_world")
	self.wwise_world = Managers.world:wwise_world(world)

	self:create_ui_elements()
	rawset(_G, "buff_presentation_ui", self)
end

BuffPresentationUI.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.presentation_widget = UIWidget.init(definitions.widget_definitions.presentation_widget)
	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
	self._animations = {}
	self._buffs_to_add = {}
	self._added_buff_presentations = {}
	self._buffs_presented = {}

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)
end

BuffPresentationUI.destroy = function (self)
	self.ui_animator = nil

	rawset(_G, "buff_presentation_ui", nil)
end

local customizer_data = {
	root_scenegraph_id = "presentation_widget",
	label = "Buff",
	registry_key = "buff_present",
	drag_scenegraph_id = "presentation_widget_dragger"
}

BuffPresentationUI.update = function (self, dt)
	if HudCustomizer.run(self.ui_renderer, self.ui_scenegraph, customizer_data) then
		UISceneGraph.update_scenegraph(self.ui_scenegraph)
	end

	self:_sync_buffs()
	self:_next_buff(dt)

	if self._active_buff_name then
		self:update_animations(dt)
		self:draw(dt)
	end
end

BuffPresentationUI.update_animations = function (self, dt)
	local animations = self._animations
	local ui_animator = self.ui_animator

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

BuffPresentationUI.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)
	UIRenderer.draw_widget(ui_renderer, self.presentation_widget)
	UIRenderer.end_pass(ui_renderer)
end

BuffPresentationUI._clear_animations = function (self)
	for animation_name, animation_id in pairs(self._animations) do
		self.ui_animator:stop_animation(animation_id)
	end

	table.clear(self._animations)
end

BuffPresentationUI._start_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self.wwise_world
	}
	local anim_id = self.ui_animator:start_animation(animation_name, self.presentation_widget, scenegraph_definition, params)
	self._animations[key] = anim_id
end

BuffPresentationUI._sync_buffs = function (self)
	local debug_buffs = Development.parameter("debug_player_buffs")
	local t = Managers.time:time("game")
	local player = Managers.player:local_player(1)
	local player_unit = player.player_unit

	if player_unit then
		local buffs_to_add = self._buffs_to_add
		local buffs_presented = self._buffs_presented

		table.clear(buffs_to_add)

		local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
		local active_buffs = buff_extension:active_buffs()
		local num_buffs = #active_buffs

		for i = 1, num_buffs, 1 do
			local buff = active_buffs[i]
			local buff_template = buff.template
			local name = buff_template.name
			local handle_buff = debug_buffs or (buff_template.icon ~= nil and buff_template.priority_buff and not buffs_to_add[name] and not buffs_presented[name])

			if handle_buff then
				self:_add_buff(buff)

				buffs_to_add[name] = buff
			end
		end

		for index, buff in ipairs(self._added_buff_presentations) do
			local buff_name = buff.name
			local remove_buff = true

			for name, _ in pairs(buffs_to_add) do
				if name == buff_name then
					remove_buff = false

					break
				end
			end

			if remove_buff then
				self:_remove_buff(buff_name)
			end
		end

		for name, _ in pairs(buffs_presented) do
			local buff_removed = true

			for i = 1, num_buffs, 1 do
				local buff = active_buffs[i]
				local buff_template = buff.template
				local buff_name = buff_template.name

				if name == buff_name then
					buff_removed = false

					break
				end
			end

			if buff_removed then
				buffs_presented[name] = nil
			end
		end
	end
end

BuffPresentationUI._add_buff = function (self, buff)
	local added_buff_presentations = self._added_buff_presentations
	local buff_template = buff.template
	local buff_name = buff_template.name

	for _, buff in ipairs(added_buff_presentations) do
		if buff.name == buff_name then
			return
		end
	end

	self._added_buff_presentations[#self._added_buff_presentations + 1] = buff_template
end

BuffPresentationUI._remove_buff = function (self, buff_name)
	local index = nil

	for idx, buff in ipairs(self._added_buff_presentations) do
		if buff.name == buff_name then
			index = idx

			break
		end
	end

	if index then
		local buff = self._added_buff_presentations[index]

		if buff then
			table.remove(self._added_buff_presentations, index)
		end
	end
end

BuffPresentationUI._next_buff = function (self, dt)
	local added_buff_presentations = self._added_buff_presentations

	if not self._active_buff_name or (self._active_buff_name and not self._animations.presentation) then
		if self._active_buff_name then
			self._buffs_presented[self._active_buff_name] = true
			self._active_buff_name = nil

			table.remove(added_buff_presentations, 1)
		end

		if #added_buff_presentations > 0 then
			local current_buff = added_buff_presentations[1]
			self._active_buff_name = current_buff.name

			self:_set_buff_to_present(current_buff)
			self:_start_animation("presentation", "presentation")
		end
	end
end

BuffPresentationUI._set_buff_to_present = function (self, buff)
	local widget = self.presentation_widget
	local icon = buff.icon or "icons_placeholder"
	widget.content.texture_icon = icon
end

return
