PlayerUnitStatusSettings = PlayerUnitStatusSettings or {}
PlayerUnitStatusSettings.MAX_FATIGUE = 100
PlayerUnitStatusSettings.FATIGUE_DEGEN_DELAY = 1
PlayerUnitStatusSettings.FATIGUE_POINTS_DEGEN_AMOUNT = 1.5
PlayerUnitStatusSettings.move_speed_reduction_on_hit_low_health_threshold = 0.35
PlayerUnitStatusSettings.fatigue_low_health_threshold = 0.35
PlayerUnitStatusSettings.move_speed_reduction_on_hit_recover_time = 0.5
PlayerUnitStatusSettings.poison_dot_time = 1
PlayerUnitStatusSettings.poison_level_max = 5

PlayerUnitStatusSettings.poison_dot_function = function (poison_level)
	return poison_level * poison_level * 0.3
end

PlayerUnitStatusSettings.fatigue_points_to_trigger_vo = 4
PlayerUnitStatusSettings.fatigue_points_to_play_heavy_block_sfx = 2
PlayerUnitStatusSettings.fatigue_point_costs = {
	blocked_running = 1,
	ogre_shove = 150,
	blocked_attack = 1,
	chaos_cleave = 30,
	action_stun_push = 1,
	blocked_sv_cleave = 16,
	blocked_jump_slam = 10,
	blocked_berzerker = 0.75,
	blocked_shove = 5,
	blocked_ranged = 0.25,
	blocked_slam = 10,
	vomit_face = 2,
	sv_push = 4,
	blocked_sv_sweep = 4,
	plague_ground = 1,
	headshot_clan_rat = -1,
	headshot_special = -10,
	chaos_spawn_combo = 2,
	career_victor_captain = -10,
	complete = 150,
	action_dodge = 0,
	vomit_ground = 1,
	action_push = 2
}
PlayerUnitStatusSettings.WOUNDED_DEGEN_DELAY = 0.5
PlayerUnitStatusSettings.WOUNDED_DEGEN_AMOUNT = 0.25
PlayerUnitStatusSettings.WOUNDED_DEGEN_START = 3
PlayerUnitStatusSettings.NOT_WOUNDED_DEGEN_DELAY = 0.5
PlayerUnitStatusSettings.NOT_WOUNDED_DEGEN_AMOUNT = 0.25
PlayerUnitStatusSettings.NOT_WOUNDED_DEGEN_START = 3
PlayerUnitStatusSettings.SMITER_DEGEN_DELAY = 0.5
PlayerUnitStatusSettings.SMITER_DEGEN_AMOUNT = 0.25
PlayerUnitStatusSettings.SMITER_DEGEN_START = 3
PlayerUnitStatusSettings.LINESMAN_DEGEN_DELAY = 0.5
PlayerUnitStatusSettings.LINESMAN_DEGEN_AMOUNT = 0.25
PlayerUnitStatusSettings.LINESMAN_DEGEN_START = 3
PlayerUnitStatusSettings.TANK_DEGEN_DELAY = 0.5
PlayerUnitStatusSettings.TANK_DEGEN_AMOUNT = 0.25
PlayerUnitStatusSettings.TANK_DEGEN_START = 3
PlayerUnitStatusSettings.NINJA_DEGEN_DELAY = 0.5
PlayerUnitStatusSettings.NINJA_DEGEN_AMOUNT = 0.25
PlayerUnitStatusSettings.NINJA_DEGEN_START = 3
PlayerUnitStatusSettings.charge_values_offensive = {
	arrow_hit = 0.02,
	repeater_pistol_special = 0.01,
	bullet_hit = 0.02,
	debug_full = 1,
	brace_of_pistol_special = 0.01,
	zoomed_arrow_hit = 0.05,
	heavy_attack = 0.1,
	light_attack = 0.05
}
PlayerUnitStatusSettings.charge_values_defensive = {
	action_block = 0.01,
	action_push = 0.03,
	debug_full = 1,
	damage_taken = 0.05,
	catapulted = 0.02,
	pounced = 0.02
}
PlayerUnitStatusSettings.overcharge_values = {
	drakegun_basic = 2,
	beam_staff_alternate = 0.85,
	beam_staff_shotgun = 7,
	brace_of_drake_pistols_basic = 2.5,
	overcharge_debug_value = 2,
	fireball_charged = 7,
	charging = 0.2,
	spear_2 = 6,
	beam_staff_sniper = 8,
	flamethrower = 1.5,
	fireball_basic = 2.5,
	spear = 4,
	geiser_charged_2 = 12,
	spear_3 = 8,
	brace_of_drake_pistols_charged = 7,
	beam_staff_basic = 1,
	drakegun_charging = 0.1,
	geiser_push = 1,
	geiser_charged = 8,
	spark = 1
}
PlayerUnitStatusSettings.hanging_by_pack_master = {
	release_unhook_time_dead = 3,
	release_unhook_time = 1.5,
	damage_amount = 4,
	release_falling_time_dead = 3,
	release_falling_time = 4,
	release_dragging_time_dead = 0,
	hit_zone_name = "full",
	damage_type = "cutting",
	release_falling_time_ko = 3,
	release_unhook_time_ko = 4
}

return
