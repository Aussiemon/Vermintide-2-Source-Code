local definitions = local_require("scripts/ui/hud_ui/badge_ui_definitions")
local badge_widget_definition = definitions.badge_widget_definition
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
	self._wwise_world = ingame_ui_context.world_manager:wwise_world(self._world)
	self._render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true
	}
	self._ingame_ui_context = ingame_ui_context
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
	self._has_active_badge = false
	self._animations = {}
	self._badges_queue = {}

	self:_create_ui_elements()
	Managers.state.event:register(self, "add_local_badge", "event_add_local_badge")
end

BadgeUI.destroy = function (self)
	GarbageLeakDetector.register_object(self, "badge_ui")

	local event_manager = Managers.state.event

	event_manager:unregister("add_badge", self)

	self.ui_animator = nil
end

BadgeUI._create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._badge_widget = UIWidget.init(badge_widget_definition)
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

	self:_draw(dt)
end

BadgeUI._draw = function (self, dt)
	if not self._has_active_badge then
		return
	end

	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_manager:get_service("ingame_menu")
	local render_settings = self._render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)
	UIRenderer.draw_widget(ui_renderer, self._badge_widget)
	UIRenderer.end_pass(ui_renderer)
end

BadgeUI._get_badge = function (self, badge_id)
	local badge_name = NetworkLookup.badges[badge_id]
	local badge = BadgeDefinitions[badge_name]

	fassert(badge, "Unknown badge_id '%s'", badge_id)

	return badge
end

BadgeUI.event_add_local_badge = function (self, badge_id)
	self:add_badge(self._local_unique_id .. "_" .. badge_id, self:_get_badge(badge_id))
end

BadgeUI.event_add_remote_player_badge = function (self, remote_player_peer_id, badge_id)
	self:add_badge(remote_player_peer_id .. "_" .. badge_id, self:_get_badge(badge_id))
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
	if add_to_queue == nil then
		add_to_queue = true
	end

	if num_badges == nil then
		num_badges = 1
	end

	if add_to_queue and self._has_active_badge then
		self:_add_to_queue(hash, badge)

		return
	end

	self._has_active_badge = true
	local widget = self._badge_widget
	local content = widget.content
	local gui = self._ui_renderer.gui

	Material.set_texture(Gui.material(gui, "versus_badge_icon"), "diffuse_map", "gui/1080p/single_textures/carousel/badge_icons/" .. badge.texture_id .. "_icon")
	Material.set_texture(Gui.material(gui, "versus_badge_glow"), "diffuse_map", "gui/1080p/single_textures/carousel/badge_icons/" .. badge.texture_id .. "_glow")

	widget.style.frame_glow.color = badge.color
	widget.style.icon_glow.color = badge.color
	content.text_name = badge.text
	content.text_desc = badge.description

	if num_badges > 1 then
		content.text_name = content.text_name .. " x" .. num_badges
	end

	self:_start_animation("on_enter", 1, widget)
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
	self._animations[event_id] = nil
	self._has_active_badge = false
end

BadgeUI._add_badge_from_queue = function (self)
	if self._has_active_badge then
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
