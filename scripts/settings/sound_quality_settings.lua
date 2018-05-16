local platform = PLATFORM

if platform == "win32" then
	SoundQualitySettings = {
		templates = {
			low = {
				max_num_voices = 28,
				sound_performance = 1,
				occlusion = false
			},
			medium = {
				max_num_voices = 64,
				sound_performance = 0.5,
				occlusion = false
			},
			high = {
				max_num_voices = 80,
				sound_performance = 0,
				occlusion = true
			}
		}
	}
elseif platform == "xb1" then
	SoundQualitySettings = {
		templates = {
			low = {
				max_num_voices = 28,
				sound_performance = 1,
				occlusion = false
			},
			medium = {
				max_num_voices = 64,
				sound_performance = 0.5,
				occlusion = false
			},
			high = {
				max_num_voices = 80,
				sound_performance = 0,
				occlusion = true
			}
		}
	}
elseif platform == "ps4" then
	SoundQualitySettings = {
		templates = {
			low = {
				max_num_voices = 28,
				sound_performance = 1,
				occlusion = false
			},
			medium = {
				max_num_voices = 64,
				sound_performance = 0.5,
				occlusion = false
			},
			high = {
				max_num_voices = 80,
				sound_performance = 0,
				occlusion = true
			}
		}
	}
end

assert(SoundQualitySettings, "No SoundQualitySettings set?")

SoundQualitySettings.get_quality_template = function (sound_quality)
	local quality_template = SoundQualitySettings.templates[sound_quality]

	if not quality_template then
		local default_sound_quality = DefaultUserSettings.get("user_settings", "sound_quality")
		quality_template = SoundQualitySettings.templates[default_sound_quality]

		if not LEVEL_EDITOR_TEST then
			printf("[SoundQualitySettings] No quality template for %q, using default %q", sound_quality, default_sound_quality)
		end
	end

	return quality_template
end

SoundQualitySettings.set_sound_quality = function (wwise_world, sound_quality)
	local quality_template = SoundQualitySettings.get_quality_template(sound_quality)
	local sound_performance = quality_template.sound_performance

	WwiseWorld.set_global_parameter(wwise_world, "sound_performance", sound_performance)

	local max_num_voices = quality_template.max_num_voices

	Wwise.set_max_num_voices(max_num_voices)

	local occlusion = quality_template.occlusion
end

return
