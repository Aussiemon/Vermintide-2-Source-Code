AttackTemplates = {
	knockdown_bleed = {
		damage_type = "knockdown_bleed"
	},
	poison_proc = {
		dot_template_name = "arrow_poison_dot",
		dot_type = "poison_dot"
	},
	added_push = {
		sound_type = "stun_heavy"
	},
	killing_blow_proc = {
		sound_type = "heavy",
		damage_type = "killing_blow",
		damage = {
			100,
			100,
			100
		}
	},
	heroic_killing_blow_proc = {
		sound_type = "heavy",
		damage_type = "killing_blow",
		damage = {
			100,
			100,
			255
		}
	},
	basic_debug_damage_ai = {
		sound_type = "light",
		damage_type = "slashing",
		damage = {
			1,
			1,
			10,
			1,
			1
		}
	},
	basic_debug_damage_player = {
		sound_type = "light",
		damage = 20,
		damage_type = "slashing"
	},
	slashing_buffed_damage = {
		sound_type = "light",
		damage_type = "slashing_buffed"
	},
	potion_damage_player = {
		sound_type = "light",
		damage = 10,
		damage_type = "slashing"
	},
	markus_knight_charge = {
		sound_type = "heavy",
		damage_type = "blunt_linesman",
		always_stagger = true,
		stagger_value = 2,
		angle = "stab"
	},
	markus_knight_charge_blast = {
		sound_type = "heavy",
		damage_type = "heavy_blunt_linesman",
		always_stagger = true,
		stagger_value = 2,
		angle = "stab"
	},
	ability_push = {
		is_push = true,
		sound_type = "stun_heavy",
		always_stagger = true,
		stagger_value = 2,
		angle = "stab"
	},
	light_slashing_linesman = {
		sound_type = "light",
		damage_type = "light_slashing_linesman"
	},
	light_slashing_linesman_executioner = {
		headshot_sound = "executioner_sword_critical",
		sound_type = "light",
		damage_type = "light_slashing_linesman"
	},
	light_slashing_linesman_hs = {
		stagger_value = 1,
		sound_type = "light",
		damage_type = "light_slashing_linesman_hs"
	},
	slashing_linesman_hs_2 = {
		sound_type = "light",
		damage_type = "slashing_linesman"
	},
	slashing_linesman = {
		sound_type = "medium",
		damage_type = "slashing_linesman"
	},
	slashing_linesman_executioner = {
		headshot_sound = "executioner_sword_critical",
		sound_type = "medium",
		damage_type = "slashing_linesman"
	},
	slashing_linesman_hs = {
		stagger_value = 1,
		sound_type = "medium",
		damage_type = "slashing_linesman"
	},
	slashing_linesman_AP = {
		stagger_value = 2,
		sound_type = "medium",
		damage_type = "slashing_linesman"
	},
	heavy_slashing_linesman = {
		stagger_value = 2,
		sound_type = "heavy",
		damage_type = "heavy_slashing_linesman"
	},
	heavy_slashing_linesman_hs = {
		sound_type = "heavy",
		damage_type = "heavy_slashing_linesman"
	},
	slashing_linesman_no_hs = {
		stagger_value = 1,
		sound_type = "heavy",
		damage_type = "heavy_slashing_linesman"
	},
	light_slashing_smiter = {
		stagger_angle = "down",
		sound_type = "light",
		damage_type = "light_slashing_smiter"
	},
	slashing_smiter = {
		shield_break = true,
		stagger_angle = "smiter",
		sound_type = "medium",
		damage_type = "slashing_smiter"
	},
	oneh_axe_slashing_smiter_ap = {
		stagger_angle = "smiter",
		shield_break = true,
		sound_type = "medium",
		damage_type = "slashing_smiter"
	},
	slashing_smiter_hs = {
		stagger_value = 1,
		stagger_angle = "smiter",
		sound_type = "medium",
		damage_type = "slashing_linesman"
	},
	heavy_slashing_smiter = {
		stagger_value = 2,
		shield_break = true,
		sound_type = "heavy",
		damage_type = "heavy_slashing_smiter",
		stagger_angle = "smiter"
	},
	heavy_slashing_smiter_hs = {
		stagger_value = 2,
		shield_break = true,
		sound_type = "heavy",
		damage_type = "heavy_slashing_smiter",
		stagger_angle = "smiter"
	},
	heavy_slashing_smiter_hs_executioner = {
		stagger_angle = "smiter",
		shield_break = true,
		sound_type = "heavy",
		damage_type = "heavy_slashing_smiter",
		stagger_value = 2,
		headshot_sound = "executioner_sword_critical"
	},
	light_slashing_fencer = {
		sound_type = "light",
		damage_type = "light_slashing_fencer"
	},
	light_slashing_fencer_hs = {
		sound_type = "light",
		damage_type = "light_slashing_fencer"
	},
	slashing_fencer_hs = {
		sound_type = "light",
		damage_type = "light_slashing_fencer"
	},
	slashing_fencer = {
		sound_type = "medium",
		damage_type = "slashing_fencer"
	},
	heavy_slashing_fencer = {
		stagger_value = 2,
		stagger_angle = "stab",
		sound_type = "heavy",
		damage_type = "heavy_slashing_fencer"
	},
	light_slashing_tank = {
		sound_type = "light",
		damage_type = "light_slashing_tank"
	},
	slashing_tank = {
		stagger_value = 2,
		sound_type = "medium",
		damage_type = "slashing_tank"
	},
	slashing_tank_hs = {
		stagger_value = 2,
		headshot_sound = "executioner_sword_critical",
		sound_type = "heavy",
		damage_type = "slashing_tank"
	},
	heavy_slashing_tank = {
		stagger_value = 2,
		sound_type = "heavy",
		damage_type = "heavy_slashing_tank"
	},
	slashing_upper = {
		stagger_angle = "stab",
		sound_type = "heavy",
		damage_type = "slashing_smiter_uppercut"
	},
	heavy_slashing_upper = {
		stagger_angle = "stab",
		sound_type = "heavy",
		damage_type = "heavy_slashing_smiter_uppercut"
	},
	light_slashing_HS = {
		sound_type = "light",
		damage_type = "light_slashing"
	},
	light_blunt_linesman = {
		sound_type = "light",
		damage_type = "light_blunt_linesman"
	},
	blunt_linesman = {
		sound_type = "medium",
		damage_type = "blunt_linesman"
	},
	heavy_blunt_linesman = {
		sound_type = "heavy",
		damage_type = "heavy_blunt_linesman"
	},
	light_blunt_smiter = {
		stagger_angle = "down",
		sound_type = "medium",
		damage_type = "light_blunt_smiter"
	},
	blunt_smiter = {
		stagger_value = 2,
		stagger_angle = "down",
		sound_type = "medium",
		damage_type = "blunt_smiter"
	},
	heavy_blunt_smiter = {
		stagger_value = 2,
		shield_break = true,
		sound_type = "heavy",
		damage_type = "heavy_blunt_smiter",
		stagger_angle = "down"
	},
	light_blunt_fencer = {
		stagger_angle = "stab",
		sound_type = "light",
		damage_type = "light_blunt_fencer"
	},
	blunt_fencer = {
		stagger_angle = "stab",
		sound_type = "medium",
		damage_type = "blunt_fencer"
	},
	heavy_blunt_fencer = {
		stagger_angle = "stab",
		stagger_value = 2,
		sound_type = "heavy",
		damage_type = "heavy_blunt_fencer"
	},
	light_blunt_tank = {
		sound_type = "light",
		damage_type = "light_blunt_tank"
	},
	light_blunt_tank_hs = {
		sound_type = "light",
		damage_type = "light_blunt_tank"
	},
	blunt_tank = {
		sound_type = "medium",
		damage_type = "blunt_tank"
	},
	blunt_tank_hs = {
		sound_type = "medium",
		damage_type = "blunt_tank"
	},
	blunt_tank_uppercut = {
		stagger_angle = "stab",
		sound_type = "medium",
		damage_type = "blunt_tank_uppercut"
	},
	blunt_tank_sb = {
		sound_type = "heavy",
		damage_type = "blunt_tank"
	},
	heavy_blunt_tank = {
		stagger_value = 2,
		sound_type = "heavy",
		damage_type = "heavy_blunt_tank"
	},
	light_blunt_HS = {
		sound_type = "light",
		damage_type = "light_blunt"
	},
	light_stab_linesman = {
		sound_type = "light",
		damage_type = "light_stab_linesman"
	},
	stab_linesman = {
		sound_type = "medium",
		damage_type = "stab_linesman"
	},
	heavy_stab_linesman = {
		sound_type = "heavy",
		damage_type = "heavy_stab_linesman"
	},
	light_stab_smiter = {
		sound_type = "light",
		damage_type = "light_stab_smiter"
	},
	stab_smiter = {
		stagger_value = 1,
		stagger_angle = "smiter",
		sound_type = "medium",
		damage_type = "stab_smiter"
	},
	heavy_stab_smiter = {
		stagger_angle = "stab",
		sound_type = "heavy",
		damage_type = "heavy_stab_smiter"
	},
	light_stab_fencer = {
		ranged_stagger = true,
		stagger_angle = "stab",
		sound_type = "light",
		damage_type = "light_stab_fencer"
	},
	stab_fencer = {
		headshot_multiplier = 1.75,
		sound_type = "medium",
		damage_type = "stab_fencer",
		ranged_stagger = true,
		stagger_angle = "stab"
	},
	burning_stab_fencer = {
		ranged_stagger = true,
		stagger_angle = "stab",
		sound_type = "medium",
		damage_type = "burning_stab_fencer"
	},
	heavy_thrust_fencer = {
		stagger_value = 2,
		stagger_angle = "stab",
		sound_type = "heavy",
		damage_type = "heavy_stab_fencer"
	},
	heavy_stab_fencer = {
		stagger_value = 2,
		stagger_angle = "stab",
		sound_type = "heavy",
		damage_type = "heavy_stab_fencer"
	},
	light_stab_tank = {
		stagger_value = 1,
		stagger_angle = "stab",
		sound_type = "light",
		damage_type = "light_stab_tank"
	},
	stab_tank = {
		stagger_value = 1,
		stagger_angle = "stab",
		sound_type = "medium",
		damage_type = "stab_tank"
	},
	heavy_stab_tank = {
		stagger_value = 2,
		stagger_angle = "stab",
		sound_type = "heavy",
		damage_type = "heavy_stab_tank"
	},
	light_burning_linesman = {
		sound_type = "light",
		damage_type = "light_burning_linesman"
	},
	burning_linesman = {
		sound_type = "medium",
		damage_type = "burning_linesman"
	},
	burning_tank = {
		stagger_value = 2,
		sound_type = "medium",
		damage_type = "burning_tank"
	},
	burning_smiter = {
		stagger_value = 2,
		stagger_angle = "smiter",
		sound_type = "medium",
		damage_type = "burning_smiter"
	},
	heavy_burning_tank = {
		stagger_value = 2,
		sound_type = "heavy",
		damage_type = "heavy_burning_tank"
	},
	basic_sweep_push = {
		is_push = true,
		stagger_value = 2,
		sound_type = "stun_heavy"
	},
	shield_slam = {
		is_push = true,
		stagger_angle = "stab",
		sound_type = "heavy",
		stagger_value = 2
	},
	weak_sweep_push = {
		sound_type = "stun_light",
		is_push = true
	},
	dagger_sweep_push = {
		sound_type = "stun_light",
		is_push = true
	},
	heavy_sweep_push = {
		is_push = true,
		stagger_value = 3,
		sound_type = "stun_heavy"
	},
	upgraded_sweep_push = {
		is_push = true,
		stagger_value = 3,
		sound_type = "stun_heavy"
	},
	super_heavy_sweep_push = {
		is_push = true,
		stagger_value = 4,
		sound_type = "stun_heavy"
	},
	resistant_push = {
		sound_type = "stun_light",
		is_push = true
	},
	basic_block = {
		sound_type = "stun_light"
	},
	attack_charge_push = {
		sound_type = "light"
	},
	heal_bandage = {
		heal_percent = 0.8,
		heal_type = "bandage",
		sound_type = "light"
	},
	healing_draught = {
		heal_amount = 40,
		heal_type = "potion",
		sound_type = "light"
	},
	heal_on_killing_blow = {
		heal_amount = 4,
		heal_type = "heal_on_killing_blow",
		sound_type = "light"
	},
	shot_sniper = {
		stagger_value = 2,
		shield_break = true,
		sound_type = "heavy",
		damage_type = "shot_sniper",
		stagger_angle = "stab"
	},
	shot_carbine = {
		stagger_value = 2,
		sound_type = "heavy",
		damage_type = "shot_carbine",
		ranged_stagger = true,
		stagger_angle = "stab"
	},
	shot_repeating_handgun = {
		stagger_value = 2,
		sound_type = "heavy",
		damage_type = "shot_repeating_handgun",
		ranged_stagger = true,
		stagger_angle = "stab"
	},
	shot_machinegun = {
		stagger_value = 2,
		stagger_angle = "stab",
		sound_type = "light",
		damage_type = "shot_machinegun"
	},
	shot_shotgun = {
		sound_type = "heavy",
		damage_type = "shot_shotgun"
	},
	arrow_sniper = {
		stagger_value = 2,
		stagger_angle = "stab",
		sound_type = "heavy",
		damage_type = "arrow_sniper"
	},
	arrow_ungor = {
		stagger_value = 2,
		stagger_angle = "stab",
		sound_type = "heavy",
		damage_type = "cutting"
	},
	arrow_sniper_1 = {
		stagger_value = 2,
		stagger_angle = "stab",
		sound_type = "heavy",
		damage_type = "arrow_sniper"
	},
	arrow_carbine = {
		stagger_angle = "stab",
		sound_type = "medium",
		damage_type = "arrow_carbine"
	},
	arrow_machinegun = {
		stagger_angle = "stab",
		sound_type = "light",
		damage_type = "arrow_machinegun"
	},
	arrow_poison_machinegun = {
		dot_type = "poison_dot",
		dot_template_name = "arrow_poison_dot",
		sound_type = "light",
		damage_type = "arrow_poison"
	},
	arrow_poison_carbine = {
		dot_type = "poison_dot",
		dot_on_wound = true,
		sound_type = "medium",
		damage_type = "arrow_poison",
		dot_template_name = "arrow_poison_dot"
	},
	arrow_poison_sniper = {
		sound_type = "heavy",
		damage_type = "arrow_poison"
	},
	arrow_poison_aoe = {
		stagger_value = 2,
		sound_type = "medium",
		damage_type = "arrow_poison"
	},
	bolt_sniper = {
		stagger_value = 2,
		sound_type = "heavy",
		damage_type = "bolt_sniper"
	},
	throwing_axe = {
		stagger_value = 2,
		sound_type = "heavy",
		damage_type = "throwing_axe"
	},
	bolt_carbine = {
		stagger_value = 2,
		sound_type = "heavy",
		damage_type = "bolt_carbine"
	},
	bolt_machinegun = {
		sound_type = "medium",
		damage_type = "bolt_machinegun"
	},
	wizard_staff_geiser = {
		dot_template_name = "burning_1W_dot",
		sound_type = "light",
		damage_type = "burn",
		dot_type = "burning_dot",
		damage = {
			0,
			0,
			4,
			0,
			0
		}
	},
	wizard_staff_beam = {
		stagger_block_offset = true,
		sound_type = "light",
		damage_type = "burn",
		dot_template_name = "beam_burning_dot",
		stagger_angle = "stab",
		dot_type = "burning_dot",
		damage = {
			1,
			0.5,
			1.5,
			1,
			1
		}
	},
	wizard_staff_beam_sniper = {
		sound_type = "heavy",
		damage_type = "burn_sniper"
	},
	flamethrower_push = {
		stagger_value = 2,
		sound_type = "medium",
		damage_type = "burn_machinegun"
	},
	flamethrower = {
		stagger_value = 2,
		sound_type = "medium",
		damage_type = "burn_machinegun",
		stagger_angle = "stab",
		range_dropoff_settings = {
			dropoff_start = 2,
			dropoff_end = 10
		}
	},
	flame_blast = {
		stagger_value = 2,
		sound_type = "medium",
		damage_type = "burn_shotgun",
		range_dropoff_settings = {
			dropoff_start = 2,
			dropoff_end = 10
		}
	},
	wizard_staff_spark = {
		stagger_angle = "stab",
		sound_type = "medium",
		damage_type = "burn_machinegun"
	},
	wizard_staff_spear = {
		stagger_value = 2,
		stagger_angle = "stab",
		sound_type = "heavy",
		damage_type = "burn_sniper"
	},
	wizard_staff = {
		sound_type = "light",
		damage_type = "burn"
	},
	fireball = {
		dot_type = "burning_dot",
		dot_template_name = "burning_1W_dot",
		sound_type = "light",
		damage_type = "burn_carbine"
	},
	drakegun = {
		dot_template_name = "burning_1W_dot",
		stagger_value = 2,
		dot_type = "burning_dot"
	},
	drakegun_glance = {
		dot_template_name = "burning_1W_dot",
		stagger_value = 2,
		dot_type = "burning_dot"
	},
	drake_pistol_shot = {
		stagger_value = 2,
		sound_type = "light",
		damage_type = "burn_carbine",
		stagger_angle = "stab",
		range_dropoff_settings = {
			dropoff_start = 10,
			dropoff_end = 20
		}
	},
	drake_pistol_charged = {
		stagger_value = 2,
		sound_type = "medium",
		damage_type = "burn_shotgun",
		dot_template_name = "burning_1W_dot",
		stagger_angle = "stab",
		dot_type = "burning_dot",
		range_dropoff_settings = {
			dropoff_start = 3,
			dropoff_end = 7
		}
	},
	burning = {
		sound_type = "light",
		damage_type = "burn",
		damage = {
			1,
			1,
			4,
			0.5,
			1
		}
	},
	poison_globe_ai_initial_damage = {
		sound_type = "light",
		damage_type = "poison"
	},
	chaos_zombie_explosion = {
		sound_type = "heavy",
		stagger_value = 6,
		damage_type = "poison",
		damage = {
			1,
			1,
			1,
			1,
			1
		}
	},
	chaos_magic_missile = {
		sound_type = "heavy",
		stagger_value = 6,
		damage_type = "poison",
		damage = {
			1,
			1,
			1,
			1,
			1
		}
	},
	corpse_explosion_default = {
		stagger_type = "ai_stagger",
		sound_type = "medium",
		damage_type = "buff"
	},
	death_explosion = {
		stagger_value = 1,
		damage_type = "death_explosion"
	},
	nurgle_ball = {
		stagger_value = 1,
		damage_type = "cutting"
	},
	blade_storm = {
		sound_type = "light",
		damage_type = "blade_storm"
	},
	grenade = {
		stagger_value = 2,
		damage_type = "grenade"
	},
	grenade_glance = {
		stagger_value = 6,
		damage_type = "grenade_glance"
	},
	fire_grenade_explosion = {
		dot_type = "burning_dot",
		stagger_value = 2,
		dot_template_name = "burning_3W_dot",
		damage_type = "fire_grenade_glance"
	},
	fire_grenade_dot = {
		dot_type = "burning_dot",
		dot_template_name = "burning_1W_dot",
		sound_type = "light",
		damage_type = "drakegun_shot"
	},
	elven_magic = {
		stagger_value = 2,
		sound_type = "medium",
		damage_type = "elven_magic"
	},
	military_finish = {
		stagger_value = 2,
		sound_type = "medium",
		damage_type = "military_finish"
	},
	spike_trap = {
		stagger_angle = "stab",
		sound_type = "medium",
		damage_type = "stab_smiter",
		damage = {
			4,
			0,
			8,
			1
		}
	},
	environment_fire = {
		dot_template_name = "burning_1W_dot",
		dot_type = "burning_dot"
	},
	payload_wagon = {}
}

for _, dlc in pairs(DLCSettings) do
	local file_names = dlc.attack_template_files_names

	if file_names then
		for _, file_name in ipairs(file_names) do
			require(file_name)
		end
	end
end

return
