LocalizationManager = class(LocalizationManager)

LocalizationManager.init = function (self)
	self:_setup_localizers()

	self._macros = {}
	self._find_macro_callback_to_self = callback(self._find_macro, self)
	local has_steam = rawget(_G, "Steam")
	local language_id = Application.user_setting("language_id") or (has_steam and Steam:language()) or "en"
	self._language_id = language_id
end

LocalizationManager._setup_localizers = function (self)
	fassert(not self._localizers, "LocalizationManager already initialized")

	self._localizers = {}

	for dlc, settings in pairs(DLCSettings) do
		local localization = settings.localization

		if localization and Application.can_get("strings", localization) then
			self._localizers[#self._localizers + 1] = Localizer(localization)
		end
	end

	if #self._localizers == 0 then
		self._localizers[#self._localizers + 1] = Localizer("localization/game")
	end
end

LocalizationManager._base_lookup = function (self, text_id)
	local localizers = self._localizers

	for ii = 1, #localizers, 1 do
		local localizer = localizers[ii]
		local text = Localizer.lookup(localizer, text_id)

		if text then
			return text
		end
	end
end

LocalizationManager.add_macro = function (self, macro, callback_function)
	self._macros[macro] = callback_function
end

LocalizationManager.language_id = function (self)
	return self._language_id
end

LocalizationManager.text_to_upper = function (self, text)
	return Utf8.upper(text)
end

LocalizationManager.lookup = function (self, text_id)
	if script_data.show_longest_localizations then
		return localize_longest(text_id)
	end

	fassert(self._localizers, "LocalizationManager not initialized")

	local str = self:_base_lookup(text_id) or "<" .. tostring(text_id) .. ">"

	return self:apply_macro(str)
end

LocalizationManager.apply_macro = function (self, str)
	local result, _ = string.gsub(str, "%b$;[%a%d_]*:", self._find_macro_callback_to_self)

	return result
end

LocalizationManager.simple_lookup = function (self, text_id)
	fassert(self._localizers, "LocalizationManager not initialized")

	local str = self:_base_lookup(text_id) or "<" .. tostring(text_id) .. ">"

	return str
end

LocalizationManager._find_macro = function (self, macro_string)
	local arg_start = string.find(macro_string, ";")

	return self._macros[string.sub(macro_string, 2, arg_start - 1)](string.sub(macro_string, arg_start + 1, -2))
end

LocalizationManager.exists = function (self, text_id)
	fassert(self._localizers, "LocalizationManager not initialized")

	return self:_base_lookup(text_id) ~= nil
end

function Localize(text_id)
	return Managers.localizer:lookup(text_id)
end

function LocalizeArray(text_ids, result)
	result = result or {}
	local num_ids = #text_ids

	for i = 1, num_ids, 1 do
		local text_id = text_ids[i]
		result[i] = Localize(text_id)
	end

	return result
end

function TextToUpper(text)
	return Managers.localizer:text_to_upper(text)
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
end

local function update_locale_cycling(dt)
	local pressed = false
	pressed = (true or not DebugKeyHandler.enabled or DebugKeyHandler.key_pressed("k", "cycle locale", "gui", "left shift")) and cycle and shift

	if not cycle_last_frame and pressed then
		current_locale = current_locale + 1

		if current_locale > #locales then
			current_locale = 1
		end

		local locale = locales[current_locale]

		print("switching locale to", locale)
		change_locale(locale)
	end

	cycle_last_frame = pressed
end

function enable_locale_cycling(enable)
	if enable then
		updator_id = updator_id or Managers.debug_updator:add_updator(update_locale_cycling)
	elseif updator_id then
		Managers.debug_updator:remove_updator(updator_id)

		updator_id = nil
	end
end

local function localize_one(text_id, locale)
	change_locale(locale)

	local path = Managers.localizer.path
	local localizer = Localizer(path)

	return self:_base_lookup(text_id) or "<>"
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

local INPUT_ACTIONS = {}

LocalizationManager.get_input_action = function (self, text_id)
	local str = self:_base_lookup(text_id) or "<" .. tostring(text_id) .. ">"
	local macro = string.match(str, "%b$;[%a%d_]*:")
	local input_service_name = nil

	table.clear(INPUT_ACTIONS)

	while macro do
		local start_index, end_index = string.find(str, macro)
		str = string.sub(str, end_index + 2)
		local arg_start = string.find(macro, ";")
		local input_service_and_action = string.sub(macro, arg_start + 1, -2)
		local split_start, split_end = string.find(input_service_and_action, "__")
		input_service_name = string.sub(input_service_and_action, 1, split_start - 1)
		INPUT_ACTIONS[#INPUT_ACTIONS + 1] = string.sub(input_service_and_action, split_end + 1)
		macro = string.match(str, "%b$;[%a%d_]*:")
	end

	return INPUT_ACTIONS[1], INPUT_ACTIONS, input_service_name
end

LocalizationManager.replace_macro_in_string = function (self, text_id, replacement_str)
	local str = self:_base_lookup(text_id) or "<" .. tostring(text_id) .. ">"
	local result, num_replacements = string.gsub(str, "%b$;[%a%d_]*:", replacement_str)

	return result, str, Localize(text_id), num_replacements
end

return
