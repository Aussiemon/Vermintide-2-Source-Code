PlayerUnitDamageSettings = PlayerUnitDamageSettings or {}
PlayerUnitDamageSettings.chance_to_shield_on_damage_amount = 2
PlayerUnitDamageSettings.chance_to_shield_on_killing_blow_amount = 4
PlayerUnitDamageSettings.GRIMOIRE_HEALTH_DEBUFF = -0.3
PlayerUnitDamageSettings.SLAYER_CURSE_HEALTH_DEBUFF = -0.02
PlayerUnitDamageSettings.REGEN_DELAY = 6
PlayerUnitDamageSettings.REGEN_AMOUNT = 20
PlayerUnitDamageSettings.REGEN_RAMP_SPEED = 1

PlayerUnitDamageSettings.REGEN_FUNCTION = function (real_t)
	local t = real_t * PlayerUnitDamageSettings.REGEN_RAMP_SPEED

	return PlayerUnitDamageSettings.REGEN_AMOUNT * t * t
end

PlayerUnitDamageSettings.INSTAKILL_THRESHOLD = 100
PlayerUnitDamageSettings.INSTAKILL_HEALTH_FACTOR = 0
PlayerUnitDamageSettings.BANDAGED_HP = 120
PlayerUnitDamageSettings.REVIVED_HP = 120
PlayerUnitDamageSettings.REVIVE_TIME = 5
PlayerUnitDamageSettings.DAMAGE_VIGNETTE_BLEND_OUT = 0.3
PlayerUnitDamageSettings.DAMAGE_VIGNETTE_THRESHOLD = 2
PlayerUnitDamageSettings.MULTIPLE_HIT_MULTIPLIER = 0.5
PlayerUnitDamageSettings.LAST_DAMAGE_DEALER_RESET_TIME = 15
PlayerUnitDamageSettings.stun = PlayerUnitDamageSettings.stun or {}
PlayerUnitDamageSettings.stun.duration = 0.5
PlayerUnitDamageSettings.stun.damage_threshold = 95
PlayerUnitDamageSettings.stun.damage_threshold_with_stun_property = 1
PlayerUnitDamageSettings.stun.damage_types_with_stun_property = {
	slashing = false,
	blunt = false,
	cutting = false,
	piercing = false
}
PlayerUnitDamageSettings.stun.damage_types_without_stun_property = {
	slashing = false,
	blunt = false,
	cutting = false,
	piercing = false
}
PlayerUnitDamageSettings.stun_dismount = PlayerUnitDamageSettings.stun_dismount or {}
PlayerUnitDamageSettings.stun_dismount.duration = 1.6666666666666667
PlayerUnitDamageSettings.stun_push = PlayerUnitDamageSettings.stun_push or {}
PlayerUnitDamageSettings.stun_push.duration = 0.75
PlayerUnitDamageSettings.stun_push.hit_penalty = 0.5
PlayerUnitDamageSettings.stun_push.cooldown = 1
PlayerUnitDamageSettings.stun_shield_bash = PlayerUnitDamageSettings.stun_shield_bash or {}
PlayerUnitDamageSettings.stun_shield_bash.duration = 1.5
PlayerUnitDamageSettings.stun_shield_bash.hit_penalty = 0.1
PlayerUnitDamageSettings.stun_shield_bash.cooldown = 1
PlayerUnitDamageSettings.kd_bleeding = PlayerUnitDamageSettings.kd_bleeding or {}
PlayerUnitDamageSettings.kd_bleeding.dps = 0
PlayerUnitDamageSettings.dead_player_destroy_time = 5
PlayerUnitDamageSettings.dot_types = {
	bleeding = {},
	burning = {}
}
