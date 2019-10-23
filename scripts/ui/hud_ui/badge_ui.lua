local definitions = local_require("scripts/ui/hud_ui/badge_ui_definitions")
local widget_definitions = definitions.widget_definitions
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
BadgeUI = class(BadgeUI)

BadgeUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._player_manager = ingame_ui_context.player_manager
	self._local_unique_id = ingame_ui_context.player:unique_id()
	self._world = ingame_ui_context.world_manager:world("level_world")
	self._wwise_world = Managers.world:wwise_world(self._world)
	self._render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true
	}
	self._ingame_ui_context = ingame_ui_context
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
	self._animations = {}
	self._active_badge_events = {}
	self._inactive_badge_events = {}
	self._badges_queue = {}

	self:create_ui_elements()
	rawset(_G, "badge_ui", self)

	local event_manager = Managers.state.event

	event_manager:register(self, "add_local_badge", "event_add_local_badge")
end

BadgeUI.destroy = function (self)
	GarbageLeakDetector.register_object(self, "badge_ui")

	local event_manager = Managers.state.event

	event_manager:unregister("add_badge", self)

	self.ui_animator = nil
end

BadgeUI.create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local inactive_badge_events = self._inactive_badge_events

	for _, widget in pairs(widget_definitions) do
		inactive_badge_events[#inactive_badge_events + 1] = UIWidget.init(widget)
	end
end

BadgeUI.update = function (self, dt, t)
	local animations = self._animations
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	for event_id, animation_data in pairs(animations) do
		local animation_id = animation_data.id

		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)
			self:_remove_active_badge(event_id)
			self:_add_badge_from_queue()
		end
	end

	self:draw(dt)
end

BadgeUI.draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_manager:get_service("ingame_menu")
	local render_settings = self._render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local events = self._active_badge_events

	for _, event in pairs(events) do
		UIRenderer.draw_widget(ui_renderer, event)
	end

	UIRenderer.end_pass(ui_renderer)
end

BadgeUI._get_badge = function (self, badge_id)
	local badge_name = NetworkLookup.badges[badge_id]
	local badge = BadgeDefinitions[badge_name]

	if not badge then
		return
	end

	return badge
end

BadgeUI.event_add_local_badge = function (self, badge_id)
	local badge = self:_get_badge(badge_id)

	if not badge then
		return
	end

	local hash = self._local_unique_id .. "_" .. badge_id

	self:add_badge(hash, badge)
end

BadgeUI.event_add_remote_player_badge = function (self, remote_player_peer_id, badge_id)
	local badge = self:_get_badge(badge_id)

	if not badge then
		return
	end

	local hash = remote_player_peer_id .. "_" .. badge_id

	self:add_badge(hash, badge)
end

BadgeUI._add_to_queue = function (self, hash, badge)
	local badges_queue = self._badges_queue

	for _, badge_in_queue in ipairs(badges_queue) do
		if badge_in_queue.hash == hash then
			badge_in_queue.amount = badge_in_queue.amount + 1

			return
		end
	end

	badges_queue[#badges_queue + 1] = {
		amount = 1,
		hash = hash,
		badge = badge
	}
end

BadgeUI.add_badge = function (self, hash, badge, add_to_queue, num_badges)
	local active_badge_events = self._active_badge_events
	local inactive_badge_events = self._inactive_badge_events

	if add_to_queue == nil then
		add_to_queue = true
	end

	if num_badges == nil then
		num_badges = 1
	end

	if add_to_queue and #inactive_badge_events == 0 then
		self:_add_to_queue(hash, badge)

		return
	end

	local widget = table.remove(inactive_badge_events, 1)
	local content = widget.content
	content.badge_texture_id = badge.texture_id
	content.text_name = badge.text
	content.text_desc = badge.description

	if num_badges > 1 then
		content.text_name = content.text_name .. " x" .. num_badges
	end

	local event_id = #active_badge_events + 1
	active_badge_events[event_id] = widget

	self:_start_animation("on_enter", event_id, widget)
end

BadgeUI._start_animation = function (self, animation_name, event_id, widget)
	local params = {
		wwise_world = self._wwise_world,
		render_settings = self._render_settings,
		ui_scenegraph = self._ui_scenegraph
	}
	local animation_id = self._ui_animator:start_animation(animation_name, widget, scenegraph_definition, params)
	self._animations[event_id] = {
		id = animation_id,
		name = animation_name
	}
end

BadgeUI._remove_active_badge = function (self, event_id)
	local active_badge_events = self._active_badge_events
	local inactive_badge_events = self._inactive_badge_events
	local widget = table.remove(active_badge_events, event_id)
	self._animations[event_id] = nil
	inactive_badge_events[#inactive_badge_events + 1] = widget
end

BadgeUI._add_badge_from_queue = function (self)
	if #self._inactive_badge_events == 0 then
		return
	end

	local badge_in_queue = table.remove(self._badges_queue, 1)

	if not badge_in_queue then
		return
	end

	local badge = badge_in_queue.badge
	local hash = badge_in_queue.hash

	self:add_badge(hash, badge, false, badge_in_queue.amount)
end

return
