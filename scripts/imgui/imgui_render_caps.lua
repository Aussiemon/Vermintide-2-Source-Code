local RENDER_CAPS = {
	"d3d12",
	"dlss_supported",
	"dlss_g_supported",
	"reflex_supported",
	"use_deferred_contexts"
}
ImguiRenderCaps = class(ImguiRenderCaps)

ImguiRenderCaps.init = function (self)
	return
end

ImguiRenderCaps.update = function (self)
	return
end

local function set_all(t, k, v)
	for i = 1, #k do
		t[k[i]] = v
	end
end

ImguiRenderCaps.draw = function (self)
	local do_close = Imgui.begin_window("Render Caps", "menu_bar")

	if Imgui.begin_menu_bar() then
		local flush = false

		if Imgui.menu_item("Save") then
			flush = true
		end

		if Imgui.menu_item("Enable all") then
			set_all(RENDER_CAPS_OVERRIDES, RENDER_CAPS, true)

			flush = true
		end

		if Imgui.menu_item("Disable all") then
			set_all(RENDER_CAPS_OVERRIDES, RENDER_CAPS, false)

			flush = true
		end

		if Imgui.menu_item("Clear all") then
			table.clear(RENDER_CAPS_OVERRIDES)

			flush = true
		end

		if flush then
			Application.set_user_setting("render_caps_overrides", RENDER_CAPS_OVERRIDES)
			Application.save_user_settings()
		end

		Imgui.end_menu_bar()
	end

	Imgui.begin_child_window("Caps", 0, 0, true)

	for i = 1, #RENDER_CAPS do
		local cap = RENDER_CAPS[i]

		Imgui.text(cap .. ":")
		Imgui.same_line()

		local val = Application_render_caps(cap)

		if val == true then
			Imgui.text_colored("true", 0, 255, 0, 255)
		elseif val == false then
			Imgui.text_colored("false", 255, 0, 0, 255)
		elseif val == nil then
			Imgui.text_colored("nil", 127, 127, 127, 255)
		end

		Imgui.same_line(360 - Imgui.calculate_text_size(cap .. ":" .. tostring(val)))

		local val = RENDER_CAPS_OVERRIDES[cap]

		if Imgui.radio_button("false##" .. cap, val == false) then
			val = false
		end

		Imgui.same_line()

		if Imgui.radio_button("true##" .. cap, val == true) then
			val = true
		end

		Imgui.same_line(30)

		if Imgui.small_button("Clear##" .. cap) then
			val = nil
		end

		RENDER_CAPS_OVERRIDES[cap] = val
	end

	Imgui.end_child_window()
	Imgui.end_window()

	return do_close
end

ImguiRenderCaps.is_persistent = function (self)
	return false
end
