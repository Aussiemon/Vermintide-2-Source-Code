require("scripts/settings/level_settings")
require("scripts/settings/perlin_light_configurations")

PropsSystem = class(PropsSystem, ExtensionSystemBase)
local extensions = {
	"PerlinLightExtension",
	"BotNavTransitionExtension",
	"EndZoneExtension",
	"QuestChallengePropExtension"
}

PropsSystem.init = function (self, entity_system_creation_context, system_name)
	PropsSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	for k, v in pairs(PerlinLightConfigurations) do
		Light.add_flicker_configuration(k, v.persistance, v.octaves, v.min_value, v.frequency_multiplier, v.translation.persistance, v.translation.octaves, v.translation.jitter_multiplier_xy, v.translation.jitter_multiplier_z, v.translation.frequency_multiplier)
	end

	PerlinLightConfigurations_reload = false
end

PropsSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = nil

	if extension_name == "PerlinLightExtension" then
		local flicker_config_name = Unit.get_data(unit, "flicker_config")
		local light = Unit.light(unit, 0)

		Light.set_flicker_type(light, flicker_config_name)

		extension = {}
	else
		extension = PropsSystem.super.on_add_extension(self, world, unit, extension_name)
	end

	return extension
end

PropsSystem.on_remove_extension = function (self, unit, extension_name)
	if extension_name ~= "PerlinLightExtension" then
		PropsSystem.super.on_remove_extension(self, unit, extension_name)
	end
end

PropsSystem.update = function (self, context, t)
	if PerlinLightConfigurations_reload then
		for k, v in pairs(PerlinLightConfigurations) do
			Light.add_flicker_configuration(k, v.persistance, v.octaves, v.min_value, v.frequency_multiplier, v.translation.persistance, v.translation.octaves, v.translation.jitter_multiplier_xy, v.translation.jitter_multiplier_z, v.translation.frequency_multiplier)
		end

		PerlinLightConfigurations_reload = false
	end

	PropsSystem.super.update(self, context, t)
end

return
