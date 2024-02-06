-- chunkname: @scripts/settings/dlcs/woods/career_ability_settings_woods.lua

require("scripts/settings/dlcs/woods/passive_ability_thornsister")

ActivatedAbilitySettings.we_thornsister = {
	{
		action_name = "action_career_we_thornsister",
		cooldown = 40,
		cost = 1,
		description = "career_active_desc_we_thornsister",
		display_name = "career_active_name_we_thornsister",
		icon = "kerillian_thornsister_activated_ability",
		weapon_name = "we_thornsister_career_skill_weapon",
	},
}
PassiveAbilitySettings.we_thornsister = {
	description = "career_passive_desc_we_thornsister",
	display_name = "career_passive_name_we_thornsister",
	icon = "kerillian_thornsister_passive",
	buffs = {
		"kerillian_thorn_sister_passive_healing_received_aura",
		"kerillian_thorn_sister_passive_temp_health_funnel_aura",
		"kerillian_thorn_sister_poison_on_hit",
		"thorn_sister_ability_cooldown_on_hit",
		"thorn_sister_ability_cooldown_on_damage_taken",
	},
	perks = {
		{
			description = "career_passive_desc_we_thornsister_a_2",
			display_name = "career_passive_name_we_thornsister_a_2",
		},
		{
			description = "career_passive_desc_we_thornsister_b",
			display_name = "career_passive_name_we_thornsister_b",
		},
		{
			description = "career_passive_desc_we_thornsister_c",
			display_name = "career_passive_name_we_thornsister_c",
		},
	},
	passive_ability_classes = {
		{
			name = "we_thornsister",
			ability_class = PassiveAbilityThornsister,
			init_data = {
				cooldown = 60,
				max_stacks = 1,
				starting_stack_count = 0,
			},
		},
	},
}
