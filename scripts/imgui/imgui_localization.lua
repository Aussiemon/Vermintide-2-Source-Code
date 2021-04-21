ImguiLocalization = class(ImguiLocalization)
local LOCALES = {
	"br-pt",
	"de",
	"en",
	"es",
	"fr",
	"it",
	"pl",
	"ru",
	"zh"
}

ImguiLocalization.init = function (self)
	self._text = ""
	self._cached_localizations = {}
	self._action_queue = {
		n = 0
	}
end

ImguiLocalization.update = function (self)
	local action = table.remove(self._action_queue)

	if action then
		action()
	end
end

ImguiLocalization.action_push = function (self, thunk)
	local queue = self._action_queue
	queue.n = queue.n + 1

	table.insert(queue, 1, thunk)
end

ImguiLocalization.draw = function (self)
	Imgui.begin_window("Localization", true)

	local current_locale = Managers.localizer:language_id()
	local queue_n = #self._action_queue
	local is_queue_empty = queue_n == 0

	if Imgui.begin_menu_bar() then
		if Imgui.menu_item("Save") then
			Managers.localizer:set_locale_override_setting(current_locale)
		end

		if Imgui.menu_item("Clear") then
			Managers.localizer:set_locale_override_setting(nil)
		end

		Imgui.end_menu_bar()
	end

	for i, locale in ipairs(LOCALES) do
		local is_selected = locale == current_locale

		if Imgui.radio_button(locale, is_selected) and is_queue_empty then
			Managers.localizer:_set_locale(locale)
		end

		Imgui.same_line()
	end

	Imgui.same_line(20)
	Imgui.text("Locale override")
	Imgui.separator()

	local text = Imgui.input_text("Localize text", self._text)
	self._text = text
	local queue = self._action_queue
	local cache = self._cached_localizations

	if Imgui.button("Localize") and is_queue_empty then
		queue.n = 0
		local j = table.find(LOCALES, current_locale)

		for i, locale in ipairs(LOCALES) do
			cache[i] = "<>"

			if i ~= j then
				self:action_push(NOP)
				self:action_push(function ()
					Managers.localizer:_set_locale(locale)
				end)
				self:action_push(NOP)
				self:action_push(function ()
					self._cached_localizations[i] = Localize(text)
				end)
			end
		end

		self:action_push(function ()
			Managers.localizer:_set_locale(current_locale)
		end)
		self:action_push(function ()
			self._cached_localizations[j] = Localize(text)
		end)
	end

	Imgui.progress_bar((queue.n > 0 and 1 - queue_n / queue.n) or 0)

	for i, locale in ipairs(LOCALES) do
		local loc_text = cache[i] or ""

		Imgui.text_colored(locale, 200, 200, 200, 255)
		Imgui.same_line(50 - Imgui.calculate_text_size(locale))

		if string.sub(loc_text, 1, 1) == "<" then
			Imgui.text_colored(loc_text, 255, 200, 200, 255)
		else
			Imgui.text(loc_text)
		end
	end

	Imgui.end_window()
end

ImguiLocalization.is_persistent = function (self)
	return false
end

return
