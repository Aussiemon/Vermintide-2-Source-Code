-- chunkname: @scripts/settings/equipment/material_settings_templates.lua

MaterialSettingsTemplates = {}

require("scripts/settings/equipment/weapon_material_settings_templates")
require("scripts/settings/equipment/skin_material_settings_templates")
require("scripts/settings/equipment/cosmetic_material_settings_templates")
require("scripts/settings/equipment/pickup_material_settings_templates")

MaterialSettingsTemplates.generated_portrait_frame = {
	portrait_frame = {
		texture = "gui/1080p/single_textures/generic/transparent_placeholder_texture",
		type = "texture",
	},
}

return MaterialSettingsTemplates
