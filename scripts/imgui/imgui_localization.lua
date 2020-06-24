ImguiLocalization = class(ImguiLocalization)
local LOCALES = {
	"en",
	"fr",
	"pl",
	"es",
	"tr",
	"de",
	"br-pt",
	"ru"
}

ImguiLocalization.init = function (self)
	local locale_name = Application.user_setting("language_id")
	self._locale_index = table.find(LOCALES, locale_name) or -1
	self._text = ""
end

ImguiLocalization.update = function (self)
	return
end

ImguiLocalization.draw = function (self)
	Imgui.begin_window("Localization")

	local prev_locale = LOCALES[self._locale_index]
	self._locale_index = Imgui.Combo("Locale override", self._locale_index - 1, LOCALES)
	local current_locale = LOCALES[self._locale_index]

	Imgui.same_line()

	if Imgui.small_button("Clear") then
		current_locale = nil
		self._locale_index = -1
	end

	if prev_locale ~= current_locale then
		print("Setting locale to:", current_locale)
		Application.set_user_setting("language_id", current_locale)
		Application.save_user_settings()

		if current_locale then
			OptionsView.reload_language(nil, current_locale)
		end
	end

	Imgui.separator()

	self._text = Imgui.input_text("Localize text", self._text)

	Imgui.text_colored("Localized:", 200, 200, 200, 255)
	Imgui.same_line()

	local localized = Localize(self._text)

	if string.sub(localized, 1, 1) == "<" then
		Imgui.text_colored(localized, 255, 200, 200, 255)
	else
		Imgui.text(localized)
	end

	Imgui.end_window()
end

ImguiLocalization.is_persistent = function (self)
	return false
end

return
