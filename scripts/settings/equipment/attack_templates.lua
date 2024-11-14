-- chunkname: @scripts/settings/equipment/attack_templates.lua

AttackTemplates = {}
AttackTemplates.knockdown_bleed = {
	damage_type = "knockdown_bleed",
}
AttackTemplates.poison_proc = {
	dot_type = "poison_dot",
}
AttackTemplates.added_push = {
	sound_type = "stun_heavy",
}
AttackTemplates.killing_blow_proc = {
	damage_type = "killing_blow",
	sound_type = "heavy",
	damage = {
		100,
		100,
		100,
	},
}
AttackTemplates.heroic_killing_blow_proc = {
	damage_type = "killing_blow",
	sound_type = "heavy",
	damage = {
		100,
		100,
		255,
	},
}
AttackTemplates.potion_damage_player = {
	damage = 10,
	damage_type = "slashing",
	sound_type = "light",
}
AttackTemplates.markus_knight_charge = {
	always_stagger = true,
	angle = "stab",
	damage_type = "blunt_linesman",
	sound_type = "heavy",
	stagger_value = 2,
}
AttackTemplates.markus_knight_charge_blast = {
	always_stagger = true,
	angle = "stab",
	damage_type = "heavy_blunt_linesman",
	sound_type = "heavy",
	stagger_value = 2,
}
AttackTemplates.ability_push = {
	always_stagger = true,
	angle = "stab",
	is_push = true,
	sound_type = "stun_heavy",
	stagger_value = 2,
}
AttackTemplates.light_slashing_linesman = {
	damage_type = "light_slashing_linesman",
	sound_type = "light",
}
AttackTemplates.light_slashing_linesman_executioner = {
	damage_type = "light_slashing_linesman",
	headshot_sound = "executioner_sword_critical",
	sound_type = "light",
}
AttackTemplates.light_slashing_linesman_hs = {
	damage_type = "light_slashing_linesman_hs",
	sound_type = "light",
	stagger_value = 1,
}
AttackTemplates.slashing_linesman_hs_2 = {
	damage_type = "slashing_linesman",
	sound_type = "light",
}
AttackTemplates.slashing_linesman = {
	damage_type = "slashing_linesman",
	sound_type = "medium",
}
AttackTemplates.slashing_linesman_executioner = {
	damage_type = "slashing_linesman",
	headshot_sound = "executioner_sword_critical",
	sound_type = "medium",
}
AttackTemplates.slashing_linesman_hs = {
	damage_type = "slashing_linesman",
	sound_type = "medium",
	stagger_value = 1,
}
AttackTemplates.slashing_linesman_AP = {
	damage_type = "slashing_linesman",
	sound_type = "medium",
	stagger_value = 2,
}
AttackTemplates.heavy_slashing_linesman = {
	damage_type = "heavy_slashing_linesman",
	sound_type = "heavy",
	stagger_value = 2,
}
AttackTemplates.heavy_slashing_linesman_hs = {
	damage_type = "heavy_slashing_linesman",
	sound_type = "heavy",
}
AttackTemplates.slashing_linesman_no_hs = {
	damage_type = "heavy_slashing_linesman",
	sound_type = "heavy",
	stagger_value = 1,
}
AttackTemplates.light_slashing_smiter = {
	damage_type = "light_slashing_smiter",
	sound_type = "light",
	stagger_angle = "down",
}
AttackTemplates.slashing_smiter = {
	damage_type = "slashing_smiter",
	shield_break = true,
	sound_type = "medium",
	stagger_angle = "smiter",
}
AttackTemplates.oneh_axe_slashing_smiter_ap = {
	damage_type = "slashing_smiter",
	shield_break = true,
	sound_type = "medium",
	stagger_angle = "smiter",
}
AttackTemplates.slashing_smiter_hs = {
	damage_type = "slashing_linesman",
	sound_type = "medium",
	stagger_angle = "smiter",
	stagger_value = 1,
}
AttackTemplates.heavy_slashing_smiter = {
	damage_type = "heavy_slashing_smiter",
	shield_break = true,
	sound_type = "heavy",
	stagger_angle = "smiter",
	stagger_value = 2,
}
AttackTemplates.heavy_slashing_smiter_hs = {
	damage_type = "heavy_slashing_smiter",
	shield_break = true,
	sound_type = "heavy",
	stagger_angle = "smiter",
	stagger_value = 2,
}
AttackTemplates.heavy_slashing_smiter_hs_executioner = {
	damage_type = "heavy_slashing_smiter",
	headshot_sound = "executioner_sword_critical",
	shield_break = true,
	sound_type = "heavy",
	stagger_angle = "smiter",
	stagger_value = 2,
}
AttackTemplates.light_slashing_fencer = {
	damage_type = "light_slashing_fencer",
	sound_type = "light",
}
AttackTemplates.light_slashing_fencer_hs = {
	damage_type = "light_slashing_fencer",
	sound_type = "light",
}
AttackTemplates.slashing_fencer_hs = {
	damage_type = "light_slashing_fencer",
	sound_type = "light",
}
AttackTemplates.slashing_fencer = {
	damage_type = "slashing_fencer",
	sound_type = "medium",
}
AttackTemplates.heavy_slashing_fencer = {
	damage_type = "heavy_slashing_fencer",
	sound_type = "heavy",
	stagger_angle = "stab",
	stagger_value = 2,
}
AttackTemplates.light_slashing_tank = {
	damage_type = "light_slashing_tank",
	sound_type = "light",
}
AttackTemplates.slashing_tank = {
	damage_type = "slashing_tank",
	sound_type = "medium",
	stagger_value = 2,
}
AttackTemplates.slashing_tank_hs = {
	damage_type = "slashing_tank",
	headshot_sound = "executioner_sword_critical",
	sound_type = "heavy",
	stagger_value = 2,
}
AttackTemplates.heavy_slashing_tank = {
	damage_type = "heavy_slashing_tank",
	sound_type = "heavy",
	stagger_value = 2,
}
AttackTemplates.slashing_upper = {
	damage_type = "slashing_smiter_uppercut",
	sound_type = "heavy",
	stagger_angle = "stab",
}
AttackTemplates.heavy_slashing_upper = {
	damage_type = "heavy_slashing_smiter_uppercut",
	sound_type = "heavy",
	stagger_angle = "stab",
}
AttackTemplates.light_slashing_HS = {
	damage_type = "light_slashing",
	sound_type = "light",
}
AttackTemplates.light_blunt_linesman = {
	damage_type = "light_blunt_linesman",
	sound_type = "light",
}
AttackTemplates.blunt_linesman = {
	damage_type = "blunt_linesman",
	sound_type = "medium",
}
AttackTemplates.heavy_blunt_linesman = {
	damage_type = "heavy_blunt_linesman",
	sound_type = "heavy",
}
AttackTemplates.light_blunt_smiter = {
	damage_type = "light_blunt_smiter",
	sound_type = "medium",
	stagger_angle = "down",
}
AttackTemplates.blunt_smiter = {
	damage_type = "blunt_smiter",
	sound_type = "medium",
	stagger_angle = "down",
	stagger_value = 2,
}
AttackTemplates.heavy_blunt_smiter = {
	damage_type = "heavy_blunt_smiter",
	shield_break = true,
	sound_type = "heavy",
	stagger_angle = "down",
	stagger_value = 2,
}
AttackTemplates.light_blunt_fencer = {
	damage_type = "light_blunt_fencer",
	sound_type = "light",
	stagger_angle = "stab",
}
AttackTemplates.blunt_fencer = {
	damage_type = "blunt_fencer",
	sound_type = "medium",
	stagger_angle = "stab",
}
AttackTemplates.heavy_blunt_fencer = {
	damage_type = "heavy_blunt_fencer",
	sound_type = "heavy",
	stagger_angle = "stab",
	stagger_value = 2,
}
AttackTemplates.light_blunt_tank = {
	damage_type = "light_blunt_tank",
	sound_type = "light",
}
AttackTemplates.light_blunt_tank_hs = {
	damage_type = "light_blunt_tank",
	sound_type = "light",
}
AttackTemplates.blunt_tank = {
	damage_type = "blunt_tank",
	sound_type = "medium",
}
AttackTemplates.blunt_tank_hs = {
	damage_type = "blunt_tank",
	sound_type = "medium",
}
AttackTemplates.blunt_tank_uppercut = {
	damage_type = "blunt_tank_uppercut",
	sound_type = "medium",
	stagger_angle = "stab",
}
AttackTemplates.blunt_tank_sb = {
	damage_type = "blunt_tank",
	sound_type = "heavy",
}
AttackTemplates.heavy_blunt_tank = {
	damage_type = "heavy_blunt_tank",
	sound_type = "heavy",
	stagger_value = 2,
}
AttackTemplates.light_blunt_HS = {
	damage_type = "light_blunt",
	sound_type = "light",
}
AttackTemplates.light_stab_smiter = {
	damage_type = "light_stab_smiter",
	sound_type = "light",
}
AttackTemplates.stab_smiter = {
	damage_type = "stab_smiter",
	sound_type = "medium",
	stagger_angle = "smiter",
	stagger_value = 1,
}
AttackTemplates.heavy_stab_smiter = {
	damage_type = "heavy_stab_smiter",
	sound_type = "heavy",
	stagger_angle = "stab",
}
AttackTemplates.light_stab_fencer = {
	damage_type = "light_stab_fencer",
	ranged_stagger = true,
	sound_type = "light",
	stagger_angle = "stab",
}
AttackTemplates.stab_fencer = {
	damage_type = "stab_fencer",
	headshot_multiplier = 1.75,
	ranged_stagger = true,
	sound_type = "medium",
	stagger_angle = "stab",
}
AttackTemplates.burning_stab_fencer = {
	damage_type = "burning_stab_fencer",
	ranged_stagger = true,
	sound_type = "medium",
	stagger_angle = "stab",
}
AttackTemplates.heavy_thrust_fencer = {
	damage_type = "heavy_stab_fencer",
	sound_type = "heavy",
	stagger_angle = "stab",
	stagger_value = 2,
}
AttackTemplates.heavy_stab_fencer = {
	damage_type = "heavy_stab_fencer",
	sound_type = "heavy",
	stagger_angle = "stab",
	stagger_value = 2,
}
AttackTemplates.light_burning_linesman = {
	damage_type = "light_burning_linesman",
	sound_type = "light",
}
AttackTemplates.burning_linesman = {
	damage_type = "burning_linesman",
	sound_type = "medium",
}
AttackTemplates.burning_tank = {
	damage_type = "burning_tank",
	sound_type = "medium",
	stagger_value = 2,
}
AttackTemplates.burning_smiter = {
	damage_type = "burning_smiter",
	sound_type = "medium",
	stagger_angle = "smiter",
	stagger_value = 2,
}
AttackTemplates.heavy_burning_tank = {
	damage_type = "heavy_burning_tank",
	sound_type = "heavy",
	stagger_value = 2,
}
AttackTemplates.basic_sweep_push = {
	is_push = true,
	sound_type = "stun_heavy",
	stagger_value = 2,
}
AttackTemplates.shield_slam = {
	is_push = true,
	sound_type = "heavy",
	stagger_angle = "stab",
	stagger_value = 2,
}
AttackTemplates.weak_sweep_push = {
	is_push = true,
	sound_type = "stun_light",
}
AttackTemplates.dagger_sweep_push = {
	is_push = true,
	sound_type = "stun_light",
}
AttackTemplates.heavy_sweep_push = {
	is_push = true,
	sound_type = "stun_heavy",
	stagger_value = 3,
}
AttackTemplates.upgraded_sweep_push = {
	is_push = true,
	sound_type = "stun_heavy",
	stagger_value = 3,
}
AttackTemplates.super_heavy_sweep_push = {
	is_push = true,
	sound_type = "stun_heavy",
	stagger_value = 4,
}
AttackTemplates.resistant_push = {
	is_push = true,
	sound_type = "stun_light",
}
AttackTemplates.basic_block = {
	sound_type = "stun_light",
}
AttackTemplates.attack_charge_push = {
	sound_type = "light",
}
AttackTemplates.heal_bandage = {
	heal_percent = 0.8,
	heal_type = "bandage",
	sound_type = "light",
	mechanism_overrides = {
		versus = {
			heal_percent = 1,
		},
	},
}
AttackTemplates.healing_draught = {
	heal_amount = 40,
	heal_type = "potion",
	sound_type = "light",
}
AttackTemplates.heal_on_killing_blow = {
	heal_amount = 4,
	heal_type = "heal_on_killing_blow",
	sound_type = "light",
}
AttackTemplates.shot_sniper = {
	damage_type = "shot_sniper",
	shield_break = true,
	sound_type = "heavy",
	stagger_angle = "stab",
	stagger_value = 2,
}
AttackTemplates.shot_carbine = {
	damage_type = "shot_carbine",
	ranged_stagger = true,
	sound_type = "heavy",
	stagger_angle = "stab",
	stagger_value = 2,
}
AttackTemplates.shot_repeating_handgun = {
	damage_type = "shot_repeating_handgun",
	ranged_stagger = true,
	sound_type = "heavy",
	stagger_angle = "stab",
	stagger_value = 2,
}
AttackTemplates.shot_machinegun = {
	damage_type = "shot_machinegun",
	sound_type = "light",
	stagger_angle = "stab",
	stagger_value = 2,
}
AttackTemplates.shot_shotgun = {
	damage_type = "shot_shotgun",
	sound_type = "heavy",
}
AttackTemplates.arrow_sniper = {
	damage_type = "arrow_sniper",
	sound_type = "heavy",
	stagger_angle = "stab",
	stagger_value = 2,
}
AttackTemplates.arrow_ungor = {
	damage_type = "cutting",
	sound_type = "heavy",
	stagger_angle = "stab",
	stagger_value = 2,
}
AttackTemplates.arrow_sniper_1 = {
	damage_type = "arrow_sniper",
	sound_type = "heavy",
	stagger_angle = "stab",
	stagger_value = 2,
}
AttackTemplates.arrow_carbine = {
	damage_type = "arrow_carbine",
	sound_type = "medium",
	stagger_angle = "stab",
}
AttackTemplates.elven_magic_arrow_carbine = {
	damage_type = "elven_magic_arrow_carbine",
	sound_type = "medium",
	stagger_angle = "stab",
}
AttackTemplates.arrow_machinegun = {
	damage_type = "arrow_machinegun",
	sound_type = "light",
	stagger_angle = "stab",
}
AttackTemplates.arrow_poison_machinegun = {
	damage_type = "arrow_poison",
	dot_type = "poison_dot",
	sound_type = "light",
}
AttackTemplates.arrow_poison_carbine = {
	damage_type = "arrow_poison",
	dot_on_wound = true,
	dot_type = "poison_dot",
	sound_type = "medium",
}
AttackTemplates.arrow_poison_sniper = {
	damage_type = "arrow_poison",
	sound_type = "heavy",
}
AttackTemplates.arrow_poison_aoe = {
	damage_type = "arrow_poison",
	sound_type = "medium",
	stagger_value = 2,
}
AttackTemplates.bolt_sniper = {
	damage_type = "bolt_sniper",
	sound_type = "heavy",
	stagger_value = 2,
}
AttackTemplates.throwing_axe = {
	damage_type = "throwing_axe",
	sound_type = "heavy",
	stagger_value = 2,
}
AttackTemplates.bolt_carbine = {
	damage_type = "bolt_carbine",
	sound_type = "heavy",
	stagger_value = 2,
}
AttackTemplates.bolt_machinegun = {
	damage_type = "bolt_machinegun",
	sound_type = "medium",
}
AttackTemplates.wizard_staff_geiser = {
	damage_type = "burn",
	dot_type = "burning_dot",
	sound_type = "light",
	damage = {
		0,
		0,
		4,
		0,
		0,
	},
}
AttackTemplates.wizard_staff_beam = {
	damage_type = "burn",
	dot_type = "burning_dot",
	sound_type = "light",
	stagger_angle = "stab",
	stagger_block_offset = true,
	damage = {
		1,
		0.5,
		1.5,
		1,
		1,
	},
}
AttackTemplates.wizard_staff_beam_sniper = {
	damage_type = "burn_sniper",
	sound_type = "heavy",
}
AttackTemplates.flamethrower_push = {
	damage_type = "burn_machinegun",
	sound_type = "medium",
	stagger_value = 2,
}
AttackTemplates.flamethrower = {
	damage_type = "burn_machinegun",
	sound_type = "medium",
	stagger_angle = "stab",
	stagger_value = 2,
	range_modifier_settings = {
		dropoff_end = 10,
		dropoff_start = 2,
	},
}
AttackTemplates.flame_blast = {
	damage_type = "burn_shotgun",
	sound_type = "medium",
	stagger_value = 2,
	range_modifier_settings = {
		dropoff_end = 10,
		dropoff_start = 2,
	},
}
AttackTemplates.wizard_staff_spark = {
	damage_type = "burn_machinegun",
	sound_type = "medium",
	stagger_angle = "stab",
}
AttackTemplates.wizard_staff_spear = {
	damage_type = "burn_sniper",
	sound_type = "heavy",
	stagger_angle = "stab",
	stagger_value = 2,
}
AttackTemplates.wizard_staff = {
	damage_type = "burn",
	sound_type = "light",
}
AttackTemplates.fireball = {
	damage_type = "burn_carbine",
	dot_type = "burning_dot",
	sound_type = "light",
}
AttackTemplates.drakegun = {
	dot_type = "burning_dot",
	stagger_value = 2,
}
AttackTemplates.drakegun_glance = {
	dot_type = "burning_dot",
	stagger_value = 2,
}
AttackTemplates.drake_pistol_shot = {
	damage_type = "burn_carbine",
	sound_type = "light",
	stagger_angle = "stab",
	stagger_value = 2,
	range_modifier_settings = {
		dropoff_end = 20,
		dropoff_start = 10,
	},
}
AttackTemplates.drake_pistol_charged = {
	damage_type = "burn_shotgun",
	dot_type = "burning_dot",
	sound_type = "medium",
	stagger_angle = "stab",
	stagger_value = 2,
	range_modifier_settings = {
		dropoff_end = 7,
		dropoff_start = 3,
	},
}
AttackTemplates.burning = {
	damage_type = "burn",
	sound_type = "light",
	damage = {
		1,
		1,
		4,
		0.5,
		1,
	},
}
AttackTemplates.poison_globe_ai_initial_damage = {
	damage_type = "poison",
	sound_type = "light",
}
AttackTemplates.chaos_zombie_explosion = {
	damage_type = "poison",
	sound_type = "heavy",
	stagger_value = 6,
	damage = {
		1,
		1,
		1,
		1,
		1,
	},
}
AttackTemplates.chaos_magic_missile = {
	damage_type = "poison",
	sound_type = "heavy",
	stagger_value = 6,
	damage = {
		1,
		1,
		1,
		1,
		1,
	},
}
AttackTemplates.death_explosion = {
	damage_type = "death_explosion",
	stagger_value = 1,
}
AttackTemplates.nurgle_ball = {
	damage_type = "cutting",
	stagger_value = 1,
}
AttackTemplates.blade_storm = {
	damage_type = "blade_storm",
	sound_type = "light",
}
AttackTemplates.grenade = {
	damage_type = "grenade",
	stagger_value = 2,
}
AttackTemplates.grenade_glance = {
	damage_type = "grenade_glance",
	stagger_value = 6,
}
AttackTemplates.fire_grenade_explosion = {
	damage_type = "fire_grenade_glance",
	dot_type = "burning_dot",
	stagger_value = 2,
}
AttackTemplates.fire_grenade_dot = {
	damage_type = "drakegun_shot",
	dot_type = "burning_dot",
	sound_type = "light",
}
AttackTemplates.elven_magic = {
	damage_type = "elven_magic",
	sound_type = "medium",
	stagger_value = 2,
}
AttackTemplates.military_finish = {
	damage_type = "military_finish",
	sound_type = "medium",
	stagger_value = 2,
}
AttackTemplates.spike_trap = {
	damage_type = "stab_smiter",
	sound_type = "medium",
	stagger_angle = "stab",
	damage = {
		4,
		0,
		8,
		1,
	},
}
AttackTemplates.environment_fire = {
	dot_type = "burning_dot",
}
AttackTemplates.payload_wagon = {}
AttackTemplates.sled = {}
AttackTemplates.trail_cog = {}
AttackTemplates.sawblade = {}
AttackTemplates.tower_wipe = {
	damage_type = "tower_wipe",
	sound_type = "medium",
	stagger_value = 2,
}

DLCUtils.require_list("attack_template_files_names")
