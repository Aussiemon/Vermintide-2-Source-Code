PopupSettings = {
	{
		singleton = true,
		name = "profile_picker",
		class = "PopupProfilePicker",
		file = "scripts/ui/views/popup_profile_picker"
	}
}
PopupSettingsByName = {}

for i, settings in pairs(PopupSettings) do
	local name = settings.name
	PopupSettingsByName[name] = settings
end

return
