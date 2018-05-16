if script_data.debug_lightfx then
	LightFX = LightFX or {}

	LightFX.set_color_in_cube = function (red, green, blue, intensity, blendtime)
		LightFX.color = {
			red,
			green,
			blue,
			intensity,
			blendtime
		}

		print(red, green, blue, intensity, blendtime)
	end
end

require("scripts/settings/light_fx_settings")

LightFXManager = class(LightFXManager)

LightFXManager.init = function (self)
	if not rawget(_G, "LightFX") then
		return
	end

	self._color_value = {}

	self:set_lightfx_color_scheme("loading")
end

LightFXManager.set_lightfx_color_scheme = function (self, color_scheme)
	fassert(type(color_scheme) == "string", "wrong indata in set_lightfx_color_scheme")

	if not rawget(_G, "LightFX") then
		return
	end

	if color_scheme == self._color_scheme then
		return
	end

	self._color_scheme = color_scheme

	if self._conditional_color_scheme then
		return
	end

	local v = self:_get_value_from_color_scheme(color_scheme)

	self:set_lightfx_color(v[1], v[2], v[3], v[4], v[5])
end

LightFXManager.set_lightfx_color = function (self, red, green, blue, intensity, blendtime)
	local v = self._color_value

	if v[1] == red and v[2] == green and v[3] == blue and v[4] == intensity and v[5] == blendtime then
		return
	end

	v[1] = red
	v[2] = green
	v[3] = blue
	v[4] = intensity
	v[5] = blendtime

	LightFX.set_color_in_cube(red, green, blue, intensity, blendtime)
end

LightFXManager._get_value_from_color_scheme = function (self, color_scheme)
	local color_scheme = LightFXSettings[color_scheme]
	local value = color_scheme.value
	local update_func = color_scheme.update_func

	if update_func then
		value = update_func(value)
	end

	return value
end

LightFXManager.update = function (self, dt)
	if not GameSettingsDevelopment.use_alien_fx then
		return
	end

	if not rawget(_G, "LightFX") then
		return
	end

	local t = Managers.time:time("main")
	local check_conditions = true
	local color_scheme = self._color_scheme
	local color_scheme_data = LightFXSettings[color_scheme]
	local conditional_color_scheme = self._conditional_color_scheme
	local conditional_color_scheme_timer = self._conditional_color_scheme_timer
	local conditional_scheme_was_set = self._conditional_color_scheme ~= nil

	if conditional_color_scheme then
		conditional_color_scheme_timer = conditional_color_scheme_timer and conditional_color_scheme_timer - dt

		if conditional_color_scheme_timer and conditional_color_scheme_timer > 0 then
			check_conditions = false
		elseif conditional_color_scheme.condition_func() then
			check_conditions = false
		else
			conditional_color_scheme = nil
		end
	end

	if check_conditions then
		for _, conditional_scheme in ipairs(LightFXConditionalSettings) do
			if conditional_scheme.condition_func() then
				conditional_color_scheme = conditional_scheme
				conditional_color_scheme_timer = conditional_color_scheme.time

				break
			end
		end
	end

	if conditional_color_scheme then
		local v = conditional_color_scheme.value

		conditional_color_scheme.update_func(dt, t, v)
	elseif conditional_scheme_was_set then
		local v = self:_get_value_from_color_scheme(self._color_scheme)

		self:set_lightfx_color(v[1], v[2], v[3], v[4], v[5])
	elseif color_scheme_data.update_func then
		local v = self:_get_value_from_color_scheme(color_scheme)

		self:set_lightfx_color(v[1], v[2], v[3], v[4], v[5])
	end

	self._conditional_color_scheme = conditional_color_scheme
	self._conditional_color_scheme_timer = conditional_color_scheme_timer

	if script_data.debug_lightfx then
		self:udpate_debug(dt)
	end
end

LightFXManager.udpate_debug = function (self, dt)
	if not rawget(_G, "DebugScreen") then
		return
	end

	local gui = DebugScreen.gui

	if not gui then
		return
	end

	local c = LightFX.color

	if not c then
		return
	end

	local res_x, res_y = Application.resolution()
	local size_x = 300
	local size_y = 100
	local pos_x = res_x / 2 - size_x / 2
	local pos_y = res_y - 10 - size_y
	local pos_z = 820
	local color = Color(c[4], c[1], c[2], c[3])

	Gui.rect(gui, Vector3(pos_x, pos_y, pos_z), Vector2(size_x, size_y), color)
end

return
