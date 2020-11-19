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

ImguiLocalization.reload_ui = function (self)
	printf("[ImguiLocalization] reload_ui()")

	for pkg in pairs(package.loaded) do
		if string.find(pkg, "^scripts/ui") then
			package.loaded[pkg] = nil
		end
	end

	require("scripts/ui/views/ingame_ui")

	local state_in_game_running = rawget(_G, "_state_in_game_running")

	if not state_in_game_running then
		return
	end

	local ingame_ui = state_in_game_running.ingame_ui

	if ingame_ui then
		local current_transition = ingame_ui.last_transition_name
		local current_params = ingame_ui.last_transition_params

		print(current_transition)
		state_in_game_running:create_ingame_ui(state_in_game_running.ingame_ui_context)

		if current_transition then
			ingame_ui:handle_transition(current_transition, current_params)
		end
	end
end

ImguiLocalization.reload_package = function (self, packages, package_name)
	DeadlockStack.pause()

	local handle = packages[package_name]

	ResourcePackage.unload(handle)
	Application.release_resource_package(handle)

	handle = Application.resource_package(package_name)

	ResourcePackage.load(handle)
	ResourcePackage.flush(handle)

	packages[package_name] = handle

	DeadlockStack.unpause()
end

ImguiLocalization.reload_locale_packages = function (self, locale, dont_reload_fonts)
	printf("[ImguiLocalization] reload_locale_packages(%q)", locale)
	Application.set_resource_property_preference_order(locale, "en")
	self:reload_package(Boot.startup_package_handles, "resource_packages/strings")

	if not dont_reload_fonts then
		self:reload_package(Boot.startup_package_handles, "resource_packages/fonts")
	end
end

ImguiLocalization.set_locale = function (self, locale, lightweight)
	print("Setting locale to:", locale)
	DeadlockStack.pause()

	Managers.localizer._language_id = locale

	self:reload_locale_packages(locale, lightweight)

	if not lightweight then
		Managers.backend:get_interface("cdn"):load_backend_localizations(locale, function (localizations)
			if localizations then
				Managers.localizer:append_backend_localizations(localizations)
			end
		end)
	end

	self:reload_ui()
	collectgarbage()
	DeadlockStack.unpause()
end

ImguiLocalization.save_locale = function (self, locale)
	Application.set_user_setting("language_id", locale)
	Application.save_user_settings()
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

	local current_locale = Managers.localizer._language_id
	local queue_n = #self._action_queue
	local is_queue_empty = queue_n == 0

	if Imgui.begin_menu_bar() then
		if Imgui.menu_item("Save") then
			self:save_locale(current_locale)
		end

		if Imgui.menu_item("Clear") then
			self:save_locale(nil)
		end

		Imgui.end_menu_bar()
	end

	for i, locale in ipairs(LOCALES) do
		local is_selected = locale == current_locale

		if Imgui.radio_button(locale, is_selected) and is_queue_empty then
			self:set_locale(locale)
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
					self:set_locale(locale)
				end)
				self:action_push(NOP)
				self:action_push(function ()
					self._cached_localizations[i] = Localize(text)
				end)
			end
		end

		self:action_push(function ()
			self:set_locale(current_locale)
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
