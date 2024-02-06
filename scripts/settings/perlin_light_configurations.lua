-- chunkname: @scripts/settings/perlin_light_configurations.lua

PerlinLightConfigurations = PerlinLightConfigurations or {}
PerlinLightConfigurations_reload = true
PerlinLightConfigurations.default = {
	frequency_multiplier = 1,
	min_value = 0.1,
	octaves = 5,
	persistance = 1,
	translation = {
		frequency_multiplier = 1,
		jitter_multiplier_xy = 0.1,
		jitter_multiplier_z = 0,
		octaves = 5,
		persistance = 1,
	},
}
PerlinLightConfigurations.default2 = {
	frequency_multiplier = 1,
	min_value = 0.2,
	octaves = 2,
	persistance = 2,
	translation = {
		frequency_multiplier = 1,
		jitter_multiplier_xy = 0.1,
		jitter_multiplier_z = 0,
		octaves = 4,
		persistance = 2,
	},
}
PerlinLightConfigurations.torch01 = {
	frequency_multiplier = 1,
	min_value = 0.1,
	octaves = 5,
	persistance = 1.5,
	translation = {
		frequency_multiplier = 1,
		jitter_multiplier_xy = 0.1,
		jitter_multiplier_z = 0,
		octaves = 5,
		persistance = 1.5,
	},
}
PerlinLightConfigurations.torch02 = {
	frequency_multiplier = 1,
	min_value = 0,
	octaves = 4,
	persistance = 1.4,
	translation = {
		frequency_multiplier = 1,
		jitter_multiplier_xy = 0.1,
		jitter_multiplier_z = 0,
		octaves = 4,
		persistance = 1.4,
	},
}
PerlinLightConfigurations.ambient_torch01 = {
	frequency_multiplier = 1,
	min_value = 0,
	octaves = 3,
	persistance = 1,
	translation = {
		frequency_multiplier = 1,
		jitter_multiplier_xy = 0.1,
		jitter_multiplier_z = 0,
		octaves = 3,
		persistance = 1,
	},
}
PerlinLightConfigurations.fire_big_intense = {
	frequency_multiplier = 1,
	min_value = 0.2,
	octaves = 5,
	persistance = 1,
	translation = {
		frequency_multiplier = 1,
		jitter_multiplier_xy = 0.1,
		jitter_multiplier_z = 0,
		octaves = 5,
		persistance = 1,
	},
}
PerlinLightConfigurations.fire_big_calm = {
	frequency_multiplier = 0.8,
	min_value = 0.2,
	octaves = 4,
	persistance = 1,
	translation = {
		frequency_multiplier = 0.6,
		jitter_multiplier_xy = 0.1,
		jitter_multiplier_z = 0,
		octaves = 4,
		persistance = 1,
	},
}
PerlinLightConfigurations.fire_small_intense = {
	frequency_multiplier = 0.6,
	min_value = 0,
	octaves = 4,
	persistance = 1,
	translation = {
		frequency_multiplier = 0.4,
		jitter_multiplier_xy = 0.05,
		jitter_multiplier_z = 0,
		octaves = 5,
		persistance = 1,
	},
}
PerlinLightConfigurations.fire_small_calm = {
	frequency_multiplier = 0.6,
	min_value = 0,
	octaves = 4,
	persistance = 1,
	translation = {
		frequency_multiplier = 0.6,
		jitter_multiplier_xy = 0.1,
		jitter_multiplier_z = 0,
		octaves = 4,
		persistance = 1,
	},
}
