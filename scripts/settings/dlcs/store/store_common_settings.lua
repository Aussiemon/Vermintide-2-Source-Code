-- chunkname: @scripts/settings/dlcs/store/store_common_settings.lua

local settings = DLCSettings.store

settings.interactions = {
	"store_access",
}
settings.interactions_filenames = {
	"scripts/settings/store_interactions",
}
settings.backend_interfaces = {
	peddler = {
		ignore_on_dedicated_server = true,
		playfab_class = "BackendInterfacePeddlerPlayFab",
		playfab_file = "scripts/managers/backend_playfab/backend_interface_peddler_playfab",
	},
}
settings.backend_localizations = {
	peddler = {
		["br-pt"] = "store_localization_br-pt",
		de = "store_localization_de",
		en = "store_localization_en",
		es = "store_localization_es",
		fr = "store_localization_fr",
		it = "store_localization_it",
		ja = "store_localization_ja",
		pl = "store_localization_pl",
		ru = "store_localization_ru",
		zh = "store_localization_zh",
	},
}
