﻿-- chunkname: @scripts/entity_system/systems/behaviour/trees/chaos/chaos_exalted_champion_behavior.lua

local ACTIONS = BreedActions.chaos_exalted_champion
local CHAOS_EXALTED_CHAMPION_WARCAMP_COMBAT = {
	"BTUtilityNode",
	{
		"BTSequence",
		action_data = ACTIONS.spawn_sequence,
		{
			"BTChampionAttackAction",
			name = "special_attack_aoe",
			action_data = ACTIONS.special_attack_aoe_defensive,
		},
		{
			"BTSpawnAllies",
			name = "spawn_allies",
			action_data = ACTIONS.spawn_allies,
		},
		name = "spawn_sequence",
	},
	{
		"BTSequence",
		action_data = ACTIONS.angry_charge_sequence,
		{
			"BTMeleeOverlapAttackAction",
			name = "angry_charge",
			action_data = ACTIONS.angry_charge,
		},
		{
			"BTMeleeOverlapAttackAction",
			name = "angry_charge",
			action_data = ACTIONS.angry_charge,
		},
		{
			"BTMeleeOverlapAttackAction",
			name = "angry_charge",
			action_data = ACTIONS.angry_charge,
		},
		name = "angry_charge_sequence",
	},
	{
		"BTClanRatFollowAction",
		name = "follow",
		action_data = ACTIONS.follow,
	},
	{
		"BTThrowWeaponAction",
		name = "throw_weapon",
		action_data = ACTIONS.throw_weapon,
	},
	{
		"BTMeleeOverlapAttackAction",
		name = "charge",
		action_data = ACTIONS.charge,
	},
	{
		"BTChampionAttackAction",
		name = "special_attack_aoe",
		action_data = ACTIONS.special_attack_aoe,
	},
	{
		"BTStormVerminAttackAction",
		enter_hook = "keep_target",
		leave_hook = "reset_keep_target",
		name = "special_attack_cleave",
		action_data = ACTIONS.special_attack_cleave,
	},
	{
		"BTStormVerminAttackAction",
		name = "special_attack_sweep",
		action_data = ACTIONS.special_attack_sweep,
	},
	{
		"BTStormVerminAttackAction",
		name = "special_attack_launch",
		action_data = ACTIONS.special_attack_launch,
	},
	{
		"BTStormVerminAttackAction",
		name = "special_attack_kick",
		action_data = ACTIONS.special_attack_kick,
	},
	condition = "can_see_player",
	name = "in_combat",
}
local CHAOS_EXALTED_CHAMPION_WARCAMP_DEFENSIVE = {
	"BTUtilityNode",
	{
		"BTChampionAttackAction",
		name = "special_attack_aoe_defensive",
		action_data = ACTIONS.special_attack_aoe_defensive,
	},
	{
		"BTThrowWeaponAction",
		name = "throw_weapon",
		action_data = ACTIONS.throw_weapon,
	},
	{
		"BTStormVerminAttackAction",
		name = "special_attack_launch_defensive",
		action_data = ACTIONS.special_attack_launch_defensive,
	},
	{
		"BTStormVerminAttackAction",
		name = "special_attack_kick",
		action_data = ACTIONS.special_attack_kick,
	},
	condition = "should_be_defensive",
	name = "in_defensive",
}
local CHAOS_EXALTED_CHAMPION_NORSCA_COMBAT = {
	"BTUtilityNode",
	{
		"BTClanRatFollowAction",
		name = "follow",
		action_data = ACTIONS.follow,
	},
	{
		"BTMeleeOverlapAttackAction",
		name = "norsca_charge",
		action_data = ACTIONS.norsca_charge,
	},
	{
		"BTStormVerminAttackAction",
		name = "special_attack_cleave",
		action_data = ACTIONS.special_attack_cleave,
	},
	{
		"BTStormVerminAttackAction",
		name = "special_attack_sweep",
		action_data = ACTIONS.special_attack_sweep,
	},
	{
		"BTStormVerminAttackAction",
		name = "special_attack_launch",
		action_data = ACTIONS.special_attack_launch,
	},
	condition = "can_see_player",
	name = "in_combat",
}
local CHAOS_EXALTED_CHAMPION_SMART_OBJECT = {
	"BTSelector",
	{
		"BTTeleportAction",
		condition = "at_teleport_smartobject",
		name = "teleport",
	},
	{
		"BTClimbAction",
		condition = "at_climb_smartobject",
		name = "climb",
	},
	{
		"BTJumpAcrossAction",
		condition = "at_jump_smartobject",
		name = "jump_across",
	},
	{
		"BTSmashDoorAction",
		condition = "at_door_smartobject",
		name = "smash_door",
		action_data = ACTIONS.smash_door,
	},
	condition = "at_smartobject",
	name = "smartobject",
}

BreedBehaviors.chaos_exalted_champion_warcamp = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn",
	},
	{
		"BTSelector",
		action_data = ACTIONS.intro_sequence,
		{
			"BTMoveToGoalAction",
			condition = "has_goal_destination",
			name = "move_to_goal",
			action_data = ACTIONS.follow,
		},
		{
			"BTIdleAction",
			name = "intro_idle",
			action_data = ACTIONS.intro_idle,
		},
		condition = "lord_intro",
		enter_hook = "on_chaos_exalted_champion_intro_enter",
		leave_hook = "on_lord_intro_leave",
		name = "intro_sequence",
	},
	{
		"BTFallAction",
		condition = "is_falling",
		name = "falling",
	},
	CHAOS_EXALTED_CHAMPION_SMART_OBJECT,
	{
		"BTChampionAttackAction",
		condition = "warcamp_retaliation_aoe",
		leave_hook = "reset_chain_stagger",
		name = "retaliation_aoe",
		action_data = ACTIONS.special_attack_retaliation_aoe,
	},
	{
		"BTStaggerAction",
		condition = "stagger",
		name = "stagger",
		action_data = ACTIONS.stagger,
	},
	CHAOS_EXALTED_CHAMPION_WARCAMP_DEFENSIVE,
	CHAOS_EXALTED_CHAMPION_WARCAMP_COMBAT,
	{
		"BTIdleAction",
		name = "defensive_idle",
		action_data = ACTIONS.defensive_idle,
	},
	{
		"BTIdleAction",
		condition = "no_target",
		name = "idle",
	},
	{
		"BTFallbackIdleAction",
		name = "fallback_idle",
	},
	name = "horde",
}
BreedBehaviors.chaos_exalted_champion_norsca = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn",
	},
	{
		"BTFallAction",
		condition = "is_falling",
		name = "falling",
	},
	{
		"BTTransformAction",
		condition = "boss_phase_two",
		name = "transform",
		action_data = ACTIONS.transform,
	},
	CHAOS_EXALTED_CHAMPION_SMART_OBJECT,
	{
		"BTStaggerAction",
		condition = "stagger",
		name = "stagger",
		action_data = ACTIONS.stagger,
	},
	CHAOS_EXALTED_CHAMPION_NORSCA_COMBAT,
	{
		"BTIdleAction",
		condition = "no_target",
		name = "idle",
	},
	{
		"BTFallbackIdleAction",
		name = "fallback_idle",
	},
	name = "horde",
}
