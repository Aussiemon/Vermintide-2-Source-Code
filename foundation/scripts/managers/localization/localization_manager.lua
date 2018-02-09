-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
LocalizationManager = class(LocalizationManager)
LocalizationManager.init = function (self, path)
	self.path = path

	assert(not self._localizer, "LocalizationManager already initialized")

	self._localizer = Localizer(path)
	self._macros = {}
	self._find_macro_callback_to_self = callback(self._find_macro, self)

	return 
end
LocalizationManager.add_macro = function (self, macro, callback_function)
	self._macros[macro] = callback_function

	return 
end
LocalizationManager.lookup = function (self, text_id)
	if script_data.show_longest_localizations then
		return localize_longest(text_id)
	end

	assert(self._localizer, "LocalizationManager not initialized")
	fassert(not string.find(text_id, " "), "Found space character in localization id %q", text_id)

	local str = Localizer.lookup(self._localizer, text_id) or "<" .. tostring(text_id) .. ">"

	return self.apply_macro(self, str)
end
LocalizationManager.apply_macro = function (self, str)
	local result, _ = string.gsub(str, "%b$;[%a%d_]*:", self._find_macro_callback_to_self)

	return result
end
LocalizationManager.simple_lookup = function (self, text_id)
	assert(self._localizer, "LocalizationManager not initialized")

	local str = Localizer.lookup(self._localizer, text_id) or "<" .. tostring(text_id) .. ">"

	return str
end
LocalizationManager._find_macro = function (self, macro_string)
	local arg_start = string.find(macro_string, ";")

	return self._macros[string.sub(macro_string, 2, arg_start - 1)](string.sub(macro_string, arg_start + 1, -2))
end
LocalizationManager.exists = function (self, text_id)
	assert(self._localizer, "LocalizationManager not initialized")

	return Localizer.lookup(self._localizer, text_id) ~= nil
end

function Localize(text_id)
	return Managers.localizer:lookup(text_id)
end

local locales = {
	"en",
	"fr",
	"de",
	"it",
	"sv"
}
local cached_strings = {}
local current_locale = 1
local cycle_last_frame = false
local updator_id = nil

local function change_locale(locale)
	Managers.package:unload("resource_packages/strings", "boot")
	Application.set_resource_property_preference_order(locale)
	Managers.package:load("resource_packages/strings", "boot")

	return 
end

local function update_locale_cycling(dt)

	-- decompilation error in this vicinity
	local pressed = false

	if not cycle_last_frame and pressed then
		current_locale = current_locale + 1

		if #locales < current_locale then
			current_locale = 1
		end

		local locale = locales[current_locale]

		print("switching locale to", locale)
		change_locale(locale)
	end

	cycle_last_frame = pressed

	return 
end

function enable_locale_cycling(enable)
	if enable then
		updator_id = updator_id or Managers.debug_updator:add_updator(update_locale_cycling)
	elseif updator_id then
		Managers.debug_updator:remove_updator(updator_id)

		updator_id = nil
	end

	return 
end

local function localize_one(text_id, locale)
	change_locale(locale)

	local path = Managers.localizer.path
	local localizer = Localizer(path)

	return Localizer.lookup(localizer, text_id) or "<>"
end

local function get_localizations(text_id)
	local localizations = {}

	for _, locale in ipairs(locales) do
		local localization = localize_one(text_id, locale)
		localizations[locale] = localization
	end

	return localizations
end

local function pick_longest(localizations)
	local final_localization = nil
	local longest = 0
	local debug_manager = nil

	for locale, localization in pairs(localizations) do
		local text = Managers.localizer:apply_macro(localization)
		local size = 10
		local length = 0

		if debug_manager then
			local width, height = Managers.state.debug:screen_text_extents(text, size)
			length = width
		else
			length = string.len(text)
		end

		if longest < length then
			longest = length
			final_localization = text
		end
	end

	return final_localization
end

function localize_longest(text_id)
	local localizations = cached_strings[text_id]

	if not localizations then
		localizations = get_localizations(text_id)
		cached_strings[text_id] = localizations
	end

	return pick_longest(localizations)
end

LocalizationManager.get_input_action = function (self, text_id)
	local str = Localizer.lookup(self._localizer, text_id) or "<" .. tostring(text_id) .. ">"
	local macro = string.match(str, "%b$;[%a_]*:")
	local input_action = nil

	if macro then
		local arg_start = string.find(macro, ";")
		local input_service_and_action = string.sub(macro, arg_start + 1, -2)
		local split_start, split_end = string.find(input_service_and_action, "__")
		input_action = string.sub(input_service_and_action, split_end + 1)
	end

	return input_action
end
LocalizationManager.replace_macro_in_string = function (self, text_id, replacement_str)
	local str = Localizer.lookup(self._localizer, text_id) or "<" .. tostring(text_id) .. ">"
	local result, _ = string.gsub(str, "%b$;[%a_]*:", replacement_str)

	return result, str, Localize(text_id)
end

return 
