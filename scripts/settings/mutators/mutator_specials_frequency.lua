return {
	description = "description_mutator_specials_frequency",
	icon = "mutator_icon_specials_frequency",
	display_name = "display_name_mutator_specials_frequency",
	spawn_time_reduction = 0.4,
	max_specials = 2,
	update_conflict_settings = function (context, data)
		local settings = CurrentSpecialsSettings

		if not settings.disabled then
			local template = data.template

			if settings.max_specials then
				settings.max_specials = settings.max_specials + template.max_specials
			end

			local spawn_time_reduction = template.spawn_time_reduction

			for method_name, method_settings in pairs(settings.methods) do
				local modified = false

				if method_name == "specials_by_time_window" then
					local spawn_interval = method_settings.spawn_interval
					spawn_interval[1] = spawn_interval[1] * spawn_time_reduction
					spawn_interval[2] = spawn_interval[2] * spawn_time_reduction
					modified = true
					local new_1 = spawn_interval[1]
					local new_2 = spawn_interval[2]
					local old_1 = new_1 / spawn_time_reduction
					slot15 = new_2 / spawn_time_reduction
				end

				if method_name == "specials_by_slots" then
					local spawn_cooldown = method_settings.spawn_cooldown
					spawn_cooldown[1] = spawn_cooldown[1] * spawn_time_reduction
					spawn_cooldown[2] = spawn_cooldown[2] * spawn_time_reduction
					modified = true
					local new_1 = spawn_cooldown[1]
					local new_2 = spawn_cooldown[2]
					local old_1 = new_1 / spawn_time_reduction
					slot15 = new_2 / spawn_time_reduction
				end

				fassert(modified, "MutatorSettings.specials_frequency: Found new method_name (%s)", method_name)
			end
		end
	end
}
