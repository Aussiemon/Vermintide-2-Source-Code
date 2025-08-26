-- chunkname: @scripts/entity_system/systems/behaviour/behaviour_tree.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_random")
require("scripts/entity_system/systems/behaviour/nodes/bt_selector")
require("scripts/entity_system/systems/behaviour/nodes/bt_sequence")
require("scripts/entity_system/systems/behaviour/nodes/bt_conditions")
require("scripts/entity_system/systems/behaviour/nodes/bt_leave_hooks")
require("scripts/entity_system/systems/behaviour/nodes/bt_enter_hooks")
require("scripts/entity_system/systems/behaviour/nodes/bt_idle_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_combat_idle_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_dummy_idle_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_fallback_idle_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_find_ranged_position_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_move_to_ranged_position_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_follow_player_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_boss_follow_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_allied_avoid_combat_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_melee_overlap_attack_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_throw_weapon_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_rat_ogre_walk_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_melee_slam_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_jump_slam_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_jump_slam_impact_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_prepare_jump_slam_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_target_unreachable_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_target_rage_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_clan_rat_follow_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_bulwark_follow_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_critter_rat_flee_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_critter_rat_dig_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_critter_rat_scurry_under_door_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_loot_rat_dodge_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_loot_rat_flee_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_loot_rat_alerted_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_attack_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_combo_attack_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_climb_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_teleport_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_jump_across_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_jump_to_position_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_alerted_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_combat_shout_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_move_to_goal_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_transported_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_follow_commander_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_taunt_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_smash_door_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_interest_point_choose_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_interest_point_approach_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_interest_point_use_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_trigger_move_to_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_combat_step_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_dodge_back_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_transform_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_grey_seer_mounted_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_grey_seer_ground_combat_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_mount_unit_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_ninja_vanish_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_skulk_around_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_skulk_idle_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_ninja_approach_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_ninja_high_ground_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_prepare_for_crazy_jump_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_crazy_jump_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_target_pounced_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_circle_prey_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_throw_rock_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_utility_node")
require("scripts/entity_system/systems/behaviour/nodes/bt_fall_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_stagger_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_dummy_stagger_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_in_vortex_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_in_gravity_well_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_blocked_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_globadier_suicide_stagger_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_nil_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_spawning_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_throw_poison_globe_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_suicide_run_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_skulk_approach_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_advance_towards_players_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_move_to_players_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_observe_poison_wind_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_switch_weapons_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_zombie_explode_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_pack_master_skulk_around_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_pack_master_follow_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_pack_master_attack_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_pack_master_initial_pull_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_pack_master_drag_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_pack_master_hoist_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_pack_master_get_hook_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_pack_master_escort_rat_ogre_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_champion_attack_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_spawn_allies_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_teleport_to_commander_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_hesitate_action")
require("scripts/entity_system/systems/behaviour/nodes/storm_vermin/bt_storm_vermin_attack_action")
require("scripts/entity_system/systems/behaviour/nodes/storm_vermin/bt_storm_vermin_push_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_give_command_action")
require("scripts/entity_system/systems/behaviour/nodes/skaven_ratling_gunner/bt_ratling_gunner_approach_action")
require("scripts/entity_system/systems/behaviour/nodes/skaven_ratling_gunner/bt_ratling_gunner_move_to_shoot_action")
require("scripts/entity_system/systems/behaviour/nodes/skaven_ratling_gunner/bt_ratling_gunner_shoot_action")
require("scripts/entity_system/systems/behaviour/nodes/skaven_ratling_gunner/bt_ratling_gunner_windup_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_stormfiend_shoot_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_stormfiend_dual_shoot_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_warpfire_thrower_shoot_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_tentacle_spawn_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_tentacle_attack_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_tentacle_idle_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_vortex_fly_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_vortex_wander_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_vortex_spawn_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_vomit_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_troll_downed_action")
require("scripts/entity_system/systems/behaviour/nodes/chaos_sorcerer/bt_chaos_sorcerer_skulk_approach_action")
require("scripts/entity_system/systems/behaviour/nodes/chaos_sorcerer/bt_chaos_sorcerer_teleport_action")
require("scripts/entity_system/systems/behaviour/nodes/chaos_sorcerer/bt_chaos_sorcerer_summoning_action")
require("scripts/entity_system/systems/behaviour/nodes/chaos_sorcerer/bt_corruptor_grab_action")
require("scripts/entity_system/systems/behaviour/nodes/chaos_sorcerer/bt_quick_teleport_action")
require("scripts/entity_system/systems/behaviour/nodes/chaos_sorcerer/bt_chaos_sorcerer_plague_skulk_action")
require("scripts/entity_system/systems/behaviour/nodes/chaos_sorcerer/bt_chaos_sorcerer_tether_skulk_action")
require("scripts/entity_system/systems/behaviour/nodes/chaos_sorcerer/bt_chaos_exalted_sorcerer_skulk_action")
require("scripts/entity_system/systems/behaviour/nodes/chaos_sorcerer/bt_chaos_plague_wave_spawner_summoning_action")
require("scripts/entity_system/systems/behaviour/nodes/chaos_sorcerer/bt_cast_missile_action")
require("scripts/entity_system/systems/behaviour/nodes/bt_defensive_idle_action")
require("scripts/entity_system/systems/behaviour/nodes/chaos_spawn/bt_erratic_follow_action")
require("scripts/entity_system/systems/behaviour/nodes/chaos_spawn/bt_victim_grabbed_idle_action")
require("scripts/entity_system/systems/behaviour/nodes/chaos_spawn/bt_victim_grabbed_throw_away_action")
require("scripts/entity_system/systems/behaviour/nodes/chaos_spawn/bt_chew_attack_action")
require("scripts/entity_system/systems/behaviour/nodes/bot/bt_bot_activate_ability_action")
require("scripts/entity_system/systems/behaviour/nodes/bot/bt_bot_follow_action")
require("scripts/entity_system/systems/behaviour/nodes/bot/bt_bot_shoot_action")
require("scripts/entity_system/systems/behaviour/nodes/bot/bt_bot_melee_action")
require("scripts/entity_system/systems/behaviour/nodes/bot/bt_bot_interact_action")
require("scripts/entity_system/systems/behaviour/nodes/bot/bt_bot_inventory_switch_action")
require("scripts/entity_system/systems/behaviour/nodes/bot/bt_bot_teleport_to_ally_action")
require("scripts/entity_system/systems/behaviour/nodes/bot/bt_bot_reload_action")
require("scripts/entity_system/systems/behaviour/nodes/bot/bt_bot_heal_action")
require("scripts/entity_system/systems/behaviour/nodes/bot/bt_bot_drop_pickup_action")
require("scripts/entity_system/systems/behaviour/utility/utility")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_critter_pig")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_critter_rat")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_gutter_runner")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_horde_rat")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_horde_shield_rat")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_dummy_clan_rat")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_horde_vermin")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_loot_rat")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_ogre")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_pack_master")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_pack_rat")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_slave_rat")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_shield_rat")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_shield_vermin")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_plague_monk")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_skaven_poison_wind_globadier")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_skaven_ratling_gunner")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_stormfiend")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_stormfiend_boss")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_grey_seer")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_stormfiend_demo")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_storm_vermin")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_storm_vermin_champion")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_storm_vermin_warlord")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_storm_vermin_commander")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_skaven_warpfire_thrower")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_marauder")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_fanatic")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_marauder_tutorial")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_shield_marauder")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_berzerker")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_raider")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_raider_tutorial")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_tentacle")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_vortex")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_troll")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_troll_chief")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_dummy_troll")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_dummy_sorcerer")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_exalted_sorcerer")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_vortex_sorcerer")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_corruptor_sorcerer")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_tether_sorcerer")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_plague_wave_spawner")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_warrior")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_bulwark")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_exalted_champion_warcamp")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_exalted_champion_norsca")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_spawn")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_zombie")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_skeleton")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_ethereal_skeleton_with_hammer")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_ethereal_skeleton_with_shield")
require("scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_training_dummy")
DLCUtils.dofile_list("behaviour_tree_nodes")
DLCUtils.require_list("behaviour_trees_precompiled")

BehaviorTree = class(BehaviorTree)
BehaviorTree.types = {}

BehaviorTree.init = function (self, lua_tree_node, name)
	self._root = nil
	self._name = name
	self._action_data = {}

	self:parse_lua_tree(lua_tree_node)
end

BehaviorTree.action_data = function (self)
	return self._action_data
end

BehaviorTree.root = function (self)
	return self._root
end

BehaviorTree.name = function (self)
	return self._name
end

local CLASS_NAME = 1

local function create_btnode_from_lua_node(lua_node, parent_btnode)
	local class_name = lua_node[CLASS_NAME]
	local identifier = lua_node.name
	local condition_name = lua_node.condition or "always_true"
	local enter_hook_name = lua_node.enter_hook
	local leave_hook_name = lua_node.leave_hook
	local action_data = lua_node.action_data
	local class_type = rawget(_G, class_name)

	if not class_type then
		fassert(false, "BehaviorTree: no class registered named( %q )", tostring(class_name))
	else
		return class_type:new(identifier, parent_btnode, condition_name, enter_hook_name, leave_hook_name, lua_node), action_data
	end
end

BehaviorTree.parse_lua_tree = function (self, lua_root_node)
	self._root = create_btnode_from_lua_node(lua_root_node)

	self:parse_lua_node(lua_root_node, self._root)
end

BehaviorTree.parse_lua_node = function (self, lua_node, parent)
	local num_children = #lua_node

	for i = 2, num_children do
		local child = lua_node[i]
		local bt_node, action_data = create_btnode_from_lua_node(child, parent)

		if action_data then
			self._action_data[action_data.name] = action_data
		end

		fassert(bt_node.name, "Behaviour tree node with parent %q is missing name", lua_node.name)

		if parent then
			parent:add_child(bt_node)
		end

		self:parse_lua_node(child, bt_node)
	end

	if parent.ready then
		parent:ready(lua_node)
	end
end
