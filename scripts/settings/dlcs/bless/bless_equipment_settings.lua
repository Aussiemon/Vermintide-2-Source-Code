local settings = DLCSettings.bless
settings.item_master_list_file_names = {
	"scripts/settings/dlcs/bless/item_master_list_bless"
}
settings.weapon_skins_file_names = {
	"scripts/settings/dlcs/bless/weapon_skins_bless"
}
settings.cosmetics_files = {
	"scripts/settings/dlcs/bless/cosmetics_bless"
}
settings.weapon_template_file_names = {
	"scripts/settings/equipment/weapon_templates/wh_priest_career_skill",
	"scripts/settings/equipment/weapon_templates/1h_hammers_priest",
	"scripts/settings/equipment/weapon_templates/1h_hammers_book_priest",
	"scripts/settings/equipment/weapon_templates/1h_hammers_shield_priest",
	"scripts/settings/equipment/weapon_templates/2h_hammers_priest",
	"scripts/settings/equipment/weapon_templates/dual_wield_hammers_priest",
	"scripts/settings/equipment/weapon_templates/1h_flails_shield"
}
settings.default_items = {
	wh_1h_hammer = {
		inventory_icon = "icon_wpn_wh_1h_hammer_01",
		description = "description_default_wh_1h_hammer",
		display_name = "wh_1h_hammer_blacksmith_name"
	},
	wh_2h_hammer = {
		inventory_icon = "icon_wpn_wh_2h_hammer_01",
		description = "description_default_wh_2h_hammer",
		display_name = "wh_2h_hammer_blacksmith_name"
	},
	wh_hammer_shield = {
		inventory_icon = "icon_wpn_wh_shield_01_t1",
		description = "description_default_wh_hammer_shield",
		display_name = "wh_hammer_shield_blacksmith_name"
	},
	wh_dual_hammer = {
		inventory_icon = "icon_wpn_wh_dual_hammer_skin_01_t1",
		description = "description_default_wh_dual_hammer",
		display_name = "wh_dual_hammer_blacksmith_name"
	},
	wh_hammer_book = {
		inventory_icon = "icon_wpn_wh_hammer_book_skin_01_t1",
		description = "description_default_wh_hammer_book",
		display_name = "wh_hammer_book_blacksmith_name"
	},
	wh_flail_shield = {
		inventory_icon = "icon_wpn_wh_flail_shield_skin_01_t1",
		description = "description_default_wh_flail_shield",
		display_name = "wh_flail_shield_blacksmith_name"
	}
}
settings.damage_profile_template_files_names = {
	"scripts/settings/equipment/damage_profile_templates_dlc_bless"
}
settings.attack_template_files_names = {}
settings.action_template_file_names = {
	"scripts/settings/dlcs/bless/action_career_wh_priest",
	"scripts/settings/dlcs/bless/action_career_wh_priest_target",
	"scripts/settings/dlcs/bless/action_wheel_selector",
	"scripts/settings/dlcs/bless/action_lunge",
	"scripts/settings/dlcs/bless/action_book_charge",
	"scripts/settings/dlcs/bless/action_dynamic_sweep"
}
settings.explosion_templates = {
	hammer_book_charged_impact_explosion = {
		explosion = {
			use_attacker_power_level = true,
			max_damage_radius_min = 0.2,
			sound_event_name = "priest_melee_book_charged_swing_impact",
			radius_max = 3.5,
			exponential_falloff = true,
			attacker_power_level_offset = 0.4,
			radius_min = 1.5,
			alert_enemies_radius = 10,
			no_friendly_fire = true,
			max_damage_radius_max = 0.25,
			alert_enemies = false,
			damage_profile = "hammer_book_charged_explosion",
			effect_name = "fx/wp_charged_hit_impact"
		}
	},
	victor_priest_melee_explosion = {
		explosion = {
			no_prop_damage = true,
			radius = 6,
			use_attacker_power_level = true,
			max_damage_radius = 3,
			always_hurt_players = false,
			alert_enemies = false,
			alert_enemies_radius = 15,
			attack_template = "drakegun",
			effect_name = "fx/wp_push",
			damage_type = "grenade",
			damage_profile = "shield_slam_aoe_priest",
			no_friendly_fire = true
		}
	},
	victor_priest_passive_explosion = {
		explosion = {
			no_prop_damage = true,
			radius = 8,
			use_attacker_power_level = true,
			max_damage_radius = 2,
			always_hurt_players = false,
			alert_enemies = false,
			alert_enemies_radius = 15,
			attack_template = "drakegun",
			sound_event_name = "career_talent_priest_unbreakable_push",
			damage_type = "grenade",
			damage_profile = "ability_push",
			no_friendly_fire = true
		}
	},
	victor_priest_career_skill_aftershock = {
		explosion = {
			no_prop_damage = true,
			radius = 1,
			use_attacker_power_level = true,
			max_damage_radius = 1,
			always_hurt_players = false,
			alert_enemies = false,
			alert_enemies_radius = 15,
			attack_template = "drakegun",
			effect_name = "fx/wp_enemy_explosion",
			damage_type = "grenade",
			damage_profile = "medium_push",
			no_friendly_fire = true
		}
	},
	victor_priest_activated_ability_nuke = {
		explosion = {
			use_attacker_power_level = true,
			radius = 5,
			alert_enemies = true,
			max_damage_radius = 3,
			alert_enemies_radius = 10,
			attacker_power_level_offset = 0.25,
			always_hurt_players = false,
			attack_template = "drakegun",
			no_friendly_fire = true,
			damage_profile_glance = "overcharge_explosion_glance_ability",
			sound_event_name = "career_ability_priest_explosion",
			damage_profile = "victor_priest_activated_ability_nuke_explosion",
			ignore_attacker_unit = true,
			effect_name = "fx/wp_explosion_allies"
		}
	}
}
settings.action_classes_lookup = {
	career_wh_priest = "ActionCareerWHPriest",
	dynamic_sweep = "ActionDynamicSweep",
	lunge = "ActionLunge",
	action_wheel_selector = "ActionWheelSelector",
	career_wh_priest_target = "ActionCareerWHPriestTarget",
	book_charge = "ActionBookCharge"
}
settings.inventory_package_list = {
	"resource_packages/careers/wh_priest",
	"units/beings/player/third_person_base/witch_hunter_warrior_priest/chr_third_person_base",
	"units/beings/player/third_person_base/witch_hunter_warrior_priest/chr_third_person_husk_base",
	"units/beings/player/witch_hunter_warrior_priest/first_person_base/chr_first_person_mesh",
	"units/beings/player/witch_hunter_warrior_priest/third_person_base/chr_third_person_mesh",
	"units/beings/player/witch_hunter_warrior_priest/skins/white/chr_witch_hunter_warrior_priest_white",
	"units/beings/player/witch_hunter_warrior_priest_skin_02/first_person_base/chr_first_person_mesh",
	"units/beings/player/witch_hunter_warrior_priest_skin_02/third_person_base/chr_third_person_mesh",
	"units/beings/player/witch_hunter_warrior_priest_skin_02/skins/variant_a/chr_witch_hunter_warrior_priest_02_a",
	"units/weapons/player/wpn_wh_1h_hammer_01/wpn_wh_1h_hammer_01",
	"units/weapons/player/wpn_wh_1h_hammer_01/wpn_wh_1h_hammer_01_3p",
	"units/weapons/player/wpn_wh_1h_hammer_02/wpn_wh_1h_hammer_02",
	"units/weapons/player/wpn_wh_1h_hammer_02/wpn_wh_1h_hammer_02_3p",
	"units/weapons/player/wpn_wh_1h_hammer_01/wpn_wh_1h_hammer_01_runed",
	"units/weapons/player/wpn_wh_1h_hammer_01/wpn_wh_1h_hammer_01_runed_3p",
	"units/weapons/player/wpn_wh_1h_hammer_02/wpn_wh_1h_hammer_02_runed",
	"units/weapons/player/wpn_wh_1h_hammer_02/wpn_wh_1h_hammer_02_runed_3p",
	"units/weapons/player/wpn_wh_1h_hammer_02/wpn_wh_1h_hammer_02_magic",
	"units/weapons/player/wpn_wh_1h_hammer_02/wpn_wh_1h_hammer_02_magic_3p",
	"units/weapons/player/wpn_wh_2h_hammer_01/wpn_wh_2h_hammer_01",
	"units/weapons/player/wpn_wh_2h_hammer_01/wpn_wh_2h_hammer_01_3p",
	"units/weapons/player/wpn_wh_2h_hammer_02/wpn_wh_2h_hammer_02",
	"units/weapons/player/wpn_wh_2h_hammer_02/wpn_wh_2h_hammer_02_3p",
	"units/weapons/player/wpn_wh_2h_hammer_01/wpn_wh_2h_hammer_01_runed",
	"units/weapons/player/wpn_wh_2h_hammer_01/wpn_wh_2h_hammer_01_runed_3p",
	"units/weapons/player/wpn_wh_2h_hammer_02/wpn_wh_2h_hammer_02_runed",
	"units/weapons/player/wpn_wh_2h_hammer_02/wpn_wh_2h_hammer_02_runed_3p",
	"units/weapons/player/wpn_wh_2h_hammer_02/wpn_wh_2h_hammer_02_magic",
	"units/weapons/player/wpn_wh_2h_hammer_02/wpn_wh_2h_hammer_02_magic_3p",
	"units/weapons/player/wpn_wh_shield_01/wpn_wh_shield_01_t1",
	"units/weapons/player/wpn_wh_shield_01/wpn_wh_shield_01_t1_3p",
	"units/weapons/player/wpn_wh_shield_01/wpn_wh_shield_01_t1_runed",
	"units/weapons/player/wpn_wh_shield_01/wpn_wh_shield_01_t1_runed_3p",
	"units/weapons/player/wpn_wh_shield_01/wpn_wh_shield_01_t1_magic",
	"units/weapons/player/wpn_wh_shield_01/wpn_wh_shield_01_t1_magic_3p",
	"units/weapons/player/wpn_wh_book_01/wpn_wh_book_01",
	"units/weapons/player/wpn_wh_book_01/wpn_wh_book_01_3p",
	"units/weapons/player/wpn_wh_book_02/wpn_wh_book_02",
	"units/weapons/player/wpn_wh_book_02/wpn_wh_book_02_3p",
	"units/weapons/player/wpn_wh_book_02/wpn_wh_book_02_runed",
	"units/weapons/player/wpn_wh_book_02/wpn_wh_book_02_runed_3p",
	"units/weapons/player/wpn_wh_book_02/wpn_wh_book_02_magic",
	"units/weapons/player/wpn_wh_book_02/wpn_wh_book_02_magic_3p",
	"units/beings/player/witch_hunter_warrior_priest/headpiece/wh_wp_hat_01",
	"units/beings/player/witch_hunter_warrior_priest/headpiece/wh_wp_hat_02",
	"units/beings/player/witch_hunter_warrior_priest/headpiece/wh_wp_hat_03",
	"units/beings/player/witch_hunter_warrior_priest/headpiece/wh_wp_hat_04"
}
settings.husk_lookup = {
	"units/beings/player/third_person_base/witch_hunter_warrior_priest/chr_third_person_husk_base"
}
