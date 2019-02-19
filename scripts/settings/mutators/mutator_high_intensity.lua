return {
	description = "description_mutator_high_intensity",
	icon = "mutator_icon_powerful_elites",
	display_name = "display_name_mutator_high_intensity",
	update_conflict_settings = function (context, data)
		CurrentIntensitySettings.max_intensity = 200
		CurrentIntensitySettings.decay_per_second = 10
		CurrentIntensitySettings.decay_delay = 0.5
		CurrentIntensitySettings.intensity_add_per_percent_dmg_taken = 0.1
		CurrentPacing.delay_horde_threat_value = 200
		CurrentPacing.delay_specials_threat_value = 200
		CurrentPacing.delay_mini_patrol_threat_value = 200
	end
}
