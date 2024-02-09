-- chunkname: @scripts/ui/views/beta_overlay.lua

script_data.text_watermark = script_data.text_watermark or script_data.settings.text_watermark
script_data.text_watermark_disclaimer = script_data.text_watermark_disclaimer or script_data.settings.text_watermark_disclaimer
script_data.qr_watermark = script_data.qr_watermark or script_data.settings.qr_watermark

local Vector3, Gui = Vector3, Gui
local QR = dofile("scripts/ui/qr/qrencode")

BetaOverlay = class(BetaOverlay)

BetaOverlay.init = function (self, world)
	local top_world = Managers.world:world("top_ingame_view")
	local label = script_data.text_watermark

	if type(label) ~= "string" then
		label = "ALPHA"
	end

	self._world = world
	self._label = label
	self._data = self:_generate_qr()

	local disclaimer = script_data.text_watermark_disclaimer

	self._disclaimer = type(disclaimer) ~= "string" and "May not be representative of final product." or disclaimer
end

BetaOverlay._destroy_gui = function (self)
	if not self._gui then
		return
	end

	World.destroy_gui(self._world, self._gui)

	self._gui = nil
end

BetaOverlay.destroy = function (self)
	return self:_destroy_gui()
end

BetaOverlay._render_qr = function (self, screen, scale, pos_x, pos_y, base_box_size, white, black)
	local gui = self._gui
	local data = self._data
	local rows, cols = #data, #data[1]

	white = white or Color(255, 255, 255)
	black = black or Color(0, 0, 0)

	local box_size = scale * (base_box_size or 10)
	local size = Vector2(box_size, box_size)
	local pos = Vector3(0, 0, 1000)
	local offset_x = (screen[1] - (cols + 2) * box_size) * pos_x
	local offset_y = (screen[2] - (rows + 2) * box_size) * pos_y

	for y = 1, rows do
		local row = data[y]

		Vector3.set_y(pos, offset_y + y * box_size)

		for x = 1, rows do
			local color = black

			if row[x] < 0 then
				color = white
			end

			Vector3.set_x(pos, offset_x + x * box_size)
			Gui.rect(gui, pos, size, color)
		end
	end
end

BetaOverlay._render_watermark = function (self, screen, scale)
	local gui = self._gui
	local label = self._label
	local font, font_size = "materials/fonts/gw_head", 65 * scale
	local _, _, car = Gui.text_extents(gui, label, font, font_size)
	local pos = Vector3(screen[1] - car.x - scale * 35, screen[2] - scale * 116, 1000)

	Gui.text(gui, label, font, font_size, nil, pos, Color(100, 255, 255, 255))
end

BetaOverlay._render_disclaimer = function (self, screen, scale)
	local gui = self._gui
	local label = self._disclaimer
	local font, font_size = "materials/fonts/gw_head", 35 * scale
	local _, _, car = Gui.text_extents(gui, label, font, font_size)
	local pos = Vector3(screen[1] - car.x - scale * 35, screen[2] - scale * 150, 1000)

	Gui.text(gui, label, font, font_size, nil, pos, Color(100, 255, 255, 255))
end

BetaOverlay._generate_qr = function (self)
	local message = string.format("%16s:%8s:%12s:%08x", HAS_STEAM and Steam.user_id() or "", script_data.settings.content_revision or "", script_data.build_identifier or "", os.time()):gsub(" ", "0")
	local ok, data_or_err = QR.qrcode(message)

	if ok then
		return data_or_err
	end

	error(data_or_err)
end

BetaOverlay._create_gui = function (self)
	self._gui = World.create_screen_gui(self._world)

	local screen_width, screen_height = self._screen_width, self._screen_height
	local scale = math.min(screen_width / 1920, screen_height / 1080, 1)
	local screen = Vector2(screen_width, screen_height)

	if script_data.text_watermark then
		self:_render_watermark(screen, scale)
	end

	if script_data.text_watermark_disclaimer then
		self:_render_disclaimer(screen, scale)
	end

	if script_data.qr_watermark then
		local ALPHA = 5

		self:_render_qr(screen, scale, 0, 0, 10, Color(ALPHA, 255, 255, 0), Color(ALPHA, 0, 0, 255))
		self:_render_qr(screen, scale, 0, 1, 10, Color(ALPHA, 255, 0, 255), Color(ALPHA, 0, 255, 0))
		self:_render_qr(screen, scale, 1, 1, 10, Color(ALPHA, 0, 255, 255), Color(ALPHA, 255, 0, 0))
		self:_render_qr(screen, scale, 1, 0, 10, Color(ALPHA, 255, 0, 0), Color(ALPHA, 0, 255, 0))
		self:_render_qr(screen, scale, 0.5, 0.5, 10, Color(ALPHA, 0, 0, 0), Color(ALPHA, 255, 255, 255))
	end
end

BetaOverlay._reload = function (self)
	self:_destroy_gui()
	self:_create_gui()
end

local DO_RELOAD = true

BetaOverlay.update = function (self)
	local width, height = Gui.resolution()

	if DO_RELOAD or width ~= self._screen_width or height ~= self._screen_height then
		self._screen_width = width
		self._screen_height = height
		DO_RELOAD = false

		self:_reload()
	end
end
