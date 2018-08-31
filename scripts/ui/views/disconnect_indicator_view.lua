require("foundation/scripts/util/local_require")
require("scripts/ui/ui_renderer")
require("scripts/ui/ui_elements")
require("scripts/ui/ui_element")
require("scripts/ui/ui_widgets")

local definitions = require("scripts/ui/views/disconnect_indicator_view_definitions")
local test_ui = false
DisconnectIndicatorView = class(DisconnectIndicatorView)
local fake_input_service = {
	get = function ()
		return
	end,
	has = function ()
		return
	end
}
DisconnectIndicatorView.FLASH_CYCLE = 0.5
DisconnectIndicatorView.SILENCE_THRESHOLD = 3

DisconnectIndicatorView.init = function (self, world)
	self._world = world
	self._ui_renderer = UIRenderer.create(world, "material", "materials/ui/ui_1080p_loading", "material", "materials/fonts/gw_fonts")
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._flash_counter = 0
	self._recalc_text_width = true
	self._text_width = 0
end

DisconnectIndicatorView.destroy = function (self)
	UIRenderer.destroy(self._ui_renderer, self._world)

	self._ui_renderer = nil
	DO_RELOAD = true
end

local DO_RELOAD = true

DisconnectIndicatorView.update = function (self, dt)
	if DO_RELOAD then
		DO_RELOAD = false
		self._recalc_text_width = true

		self:_create_ui_elements()
	end

	if not self:_is_visible() then
		self._flash_counter = 0

		return
	end

	self._flash_counter = self._flash_counter + dt

	while DisconnectIndicatorView.FLASH_CYCLE < self._flash_counter do
		self._flash_counter = self._flash_counter - DisconnectIndicatorView.FLASH_CYCLE
	end

	self:_draw(dt)
end

DisconnectIndicatorView._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	definitions.icon_text.content.text = Localize("lost_contact_with_host")
	self._icon_text_widget = UIWidget.init(definitions.icon_text)
end

DisconnectIndicatorView._is_visible = function (self)
	if DEDICATED_SERVER then
		return false
	end

	if test_ui then
		return true
	end

	local manager = Managers.state.network

	if manager == nil then
		return false
	end

	local lobby = manager:lobby()

	if lobby == nil then
		return false
	end

	local lobby_host = lobby:lobby_host()

	if lobby_host == nil then
		return false
	end

	local silence = Network.time_since_receive(lobby_host)

	return DisconnectIndicatorView.SILENCE_THRESHOLD < silence
end

DisconnectIndicatorView._set_transparency = function (self, alpha)
	local widget = self._icon_text_widget
	widget.style.text.text_color[1] = 255 * alpha
	widget.style.texture_id.color[1] = 255 * alpha
end

DisconnectIndicatorView._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	self._recalc_text_width = self._recalc_text_width or RESOLUTION_LOOKUP.modified

	if self._recalc_text_width then
		self._recalc_text_width = false
		local text_style = definitions.icon_text.style.text
		local font, scaled_font_size = UIFontByResolution(text_style)
		local text = definitions.icon_text.content.text
		local text_box_size = definitions.max_text_width / 1920 * RESOLUTION_LOOKUP.res_w
		self._text_width = math.min(UIRenderer.text_size(ui_renderer, text, font[1], scaled_font_size), text_box_size)
	end

	ui_scenegraph.indicator.local_position[1] = -((self._text_width + definitions.padding) / 2)
	local angle = self._flash_counter / DisconnectIndicatorView.FLASH_CYCLE * 2 * math.pi
	local alpha = math.abs(math.sin(angle))

	self:_set_transparency(alpha)
	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, fake_input_service, dt, nil, self._render_settings)
	UIRenderer.draw_widget(ui_renderer, self._icon_text_widget)
	UIRenderer.end_pass(ui_renderer)
end

return
