require("foundation/scripts/util/local_require")
require("scripts/ui/ui_renderer")
require("scripts/ui/ui_elements")
require("scripts/ui/ui_widgets")

local definitions = require("scripts/ui/views/loading_icon_view_definitions")
local FADE_TIME = 0.5
local loading_icon_data = {
	frames_per_second = 30
}
local LOADING_ICON_BASE_NAME = "loadingicon_0000"
local FRAME_COUNT = 86
loading_icon_data.image_db = {}
local image_db = loading_icon_data.image_db

for i = 0, FRAME_COUNT - 1, 1 do
	image_db[#image_db + 1] = LOADING_ICON_BASE_NAME .. string.format("%02d", i)
end

LoadingIconView = class(LoadingIconView)

LoadingIconView.init = function (self, world)
	self._world = world
	self._ui_renderer = UIRenderer.create(world, "material", "materials/ui/ui_1080p_loading")
	self._render_settings = {
		snap_pixel_positions = true
	}

	self:_create_ui_elements()

	self._icon_fade_timer = 0
	self._show_loading_icon = false
end

LoadingIconView._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self._loading_icon_widget = UIWidget.init(definitions.loading_icon)
end

LoadingIconView.show_loading_icon = function (self)
	self._show_loading_icon = true
end

LoadingIconView.hide_loading_icon = function (self)
	self._show_loading_icon = false
end

LoadingIconView.show_icon_background = function (self)
	local widget = self._loading_icon_widget
	widget.style.background_rect.color[1] = 255
end

LoadingIconView.hide_icon_background = function (self)
	local widget = self._loading_icon_widget
	widget.style.background_rect.color[1] = 0
end

LoadingIconView.active = function (self)
	return self._show_loading_icon or self._icon_fade_timer > 0
end

local DO_RELOAD = true

LoadingIconView.update = function (self, dt)
	if DO_RELOAD then
		DO_RELOAD = false

		self:_create_ui_elements()
	end

	if self:active() then
		self:_update_loading_icon(dt)
		self:_draw(dt)
	end
end

LoadingIconView._update_loading_icon = function (self, dt)
	local widget = self._loading_icon_widget
	local loading_icon_content = widget.content
	local loading_icon_style = widget.style.loading_icon
	local current_index = loading_icon_content.current_index
	local icon_data = loading_icon_data
	local speed = 1 / icon_data.frames_per_second

	if not self.icon_timer then
		self.icon_timer = speed
	else
		local timer = self.icon_timer - math.min(dt, 0.05)

		if timer <= 0 then
			local new_index = 1 + current_index % #icon_data.image_db
			loading_icon_content.current_index = new_index
			loading_icon_content.loading_icon_id = icon_data.image_db[new_index]
			self.icon_timer = timer + speed
		else
			self.icon_timer = timer
		end
	end

	if self._show_loading_icon then
		self._icon_fade_timer = math.clamp(self._icon_fade_timer + dt, 0, FADE_TIME)
	else
		self._icon_fade_timer = math.clamp(self._icon_fade_timer - dt, 0, FADE_TIME)
	end

	loading_icon_style.color[1] = self._icon_fade_timer / FADE_TIME * 255
end

LoadingIconView._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, FAKE_INPUT_SERVICE, dt, nil, self._render_settings)
	UIRenderer.draw_widget(ui_renderer, self._loading_icon_widget)
	UIRenderer.end_pass(ui_renderer)
end

LoadingIconView.destroy = function (self)
	UIRenderer.destroy(self._ui_renderer, self._world)
end

return
