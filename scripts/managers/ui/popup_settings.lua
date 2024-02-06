-- chunkname: @scripts/managers/ui/popup_settings.lua

PopupSettings = {
	{
		class = "PopupProfilePicker",
		file = "scripts/ui/views/popup_profile_picker",
		name = "profile_picker",
		singleton = true,
	},
}
PopupSettingsByName = {}

for i, settings in pairs(PopupSettings) do
	local name = settings.name

	PopupSettingsByName[name] = settings
end
