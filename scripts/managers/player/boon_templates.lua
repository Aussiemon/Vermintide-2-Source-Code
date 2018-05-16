BoonTemplates = {
	reduced_damage = {
		reduced_damage_amount = 0.3,
		affects_allies = false,
		quest_ui_icon = "boon_icon_01_damage_reduced",
		ui_icon = "boon_icon_01_damage_reduced",
		duration = 7200,
		ui_name = "dlc1_3_1_buff_name_reduced_damage",
		tooltip = "dlc1_3_1_buff_name_reduced_damage_tooltip"
	},
	increased_damage = {
		increased_damage_amount = 0.25,
		affects_allies = false,
		quest_ui_icon = "boon_icon_02_damage_increased",
		ui_icon = "boon_icon_02_damage_increased",
		duration = 7200,
		ui_name = "dlc1_3_1_buff_name_increased_damage",
		tooltip = "dlc1_3_1_buff_name_increased_damage_tooltip"
	},
	bonus_starting_gear = {
		affects_allies = false,
		quest_ui_icon = "boon_icon_03_extra_starting_gear",
		ui_icon = "boon_icon_03_extra_starting_gear",
		duration = 3600,
		ui_name = "dlc1_3_1_buff_name_bonus_starting_gear",
		tooltip = "dlc1_3_1_buff_name_bonus_starting_gear_tooltip"
	},
	bonus_fatigue = {
		ui_name = "dlc1_3_1_buff_name_bonus_fatigue",
		affects_allies = false,
		quest_ui_icon = "boon_icon_06_stamina",
		ui_icon = "boon_icon_06_stamina",
		duration = 3600,
		fatigue_increase = 2,
		tooltip = "dlc1_3_1_buff_name_bonus_fatigue_tooltip"
	},
	increased_combat_movement = {
		affects_allies = false,
		multiplier = 0.8,
		quest_ui_icon = "boon_icon_04_reduced_slowing_effects",
		ui_icon = "boon_icon_04_reduced_slowing_effects",
		duration = 3600,
		ui_name = "dlc1_3_1_buff_name_increased_combat_movement",
		tooltip = "dlc1_3_1_buff_name_increased_combat_movement_tooltip"
	},
	increased_stagger_type = {
		ui_icon = "boon_icon_05_stagger_more",
		affects_allies = false,
		quest_ui_icon = "boon_icon_05_stagger_more",
		duration_multiplier = 0.5,
		duration = 3600,
		ui_name = "buff_description_increased_stagger_type",
		tooltip = "buff_description_increased_stagger_type_tooltip"
	}
}
MaxBoonDuration = 0
MaxDisplayableBoons = 4

for _, data in pairs(BoonTemplates) do
	local duration = data.duration

	if MaxBoonDuration < duration then
		MaxBoonDuration = duration
	end
end

return
