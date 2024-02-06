-- chunkname: @scripts/settings/dlcs/celebrate/celebrate_equipment_settings.lua

local settings = DLCSettings.celebrate

settings.item_master_list_file_names = {
	"scripts/settings/equipment/item_master_list_celebrate",
}
settings.weapon_template_file_names = {
	"scripts/settings/equipment/weapon_templates/beer_bottle",
	"scripts/settings/equipment/weapon_templates/bardin_survival_ale",
}
settings.inventory_package_list = {
	"units/weapons/player/wpn_ale/wpn_ale",
	"units/weapons/player/wpn_ale/wpn_ale_3p",
	"units/weapons/player/wpn_ale/wpn_ale_3ps",
	"units/weapons/player/pup_ale/pup_ale",
}
settings.action_template_file_names = {
	"scripts/unit_extensions/weapons/actions/action_one_time_consumable",
}
settings.action_classes_lookup = {
	one_time_consumable = "ActionOneTimeConsumable",
}
