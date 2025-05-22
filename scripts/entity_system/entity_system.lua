-- chunkname: @scripts/entity_system/entity_system.lua

require("scripts/entity_system/systems/extension_system_base")
require("scripts/entity_system/systems/aggro/aggro_system")
require("scripts/entity_system/systems/ai/ai_system")
require("scripts/entity_system/systems/ai/ai_line_of_sight_system")
require("scripts/entity_system/systems/ai/ai_bot_group_system")
require("scripts/entity_system/systems/ai/ai_group_system")
require("scripts/entity_system/systems/ai/ai_inventory_system")
require("scripts/entity_system/systems/ai/ai_inventory_item_system")
require("scripts/entity_system/systems/ai/ai_interest_point_system")
require("scripts/entity_system/systems/ai/ai_navigation_system")
require("scripts/entity_system/systems/ai/ai_slot_system")
require("scripts/entity_system/systems/ai/ai_slot_system_2")
require("scripts/entity_system/systems/ai/nav_graph_system")
require("scripts/entity_system/systems/animation/animation_system")
require("scripts/entity_system/systems/animation/aim_system")
require("scripts/entity_system/systems/animation/animation_movement_system")
require("scripts/entity_system/systems/attachment/attachment_system")
require("scripts/entity_system/systems/cosmetic/cosmetic_system")
require("scripts/entity_system/systems/area_damage/area_damage_system")
require("scripts/entity_system/systems/audio/audio_system")
require("scripts/entity_system/systems/buff/buff_area_system")
require("scripts/entity_system/systems/buff/buff_system")
require("scripts/entity_system/systems/camera/camera_system")
require("scripts/entity_system/systems/world_marker/world_marker_system")
require("scripts/entity_system/systems/cutscene/cutscene_system")
require("scripts/entity_system/systems/darkness/darkness_system")
require("scripts/entity_system/systems/damage/death_system")
require("scripts/entity_system/systems/damage/health_system")
require("scripts/entity_system/systems/damage/health_trigger_system")
require("scripts/entity_system/systems/damage/hit_reaction_system")
require("scripts/entity_system/systems/dialogues/dialogue_system")
require("scripts/entity_system/systems/dialogues/dialogue_context_system")
require("scripts/entity_system/systems/dialogues/surrounding_aware_system")
require("scripts/entity_system/systems/doors/door_system")
require("scripts/entity_system/systems/fade/fade_system")
require("scripts/entity_system/systems/fade/fade_system_dummy")
require("scripts/entity_system/systems/first_person/first_person_system")
require("scripts/entity_system/systems/interaction/interaction_system")
require("scripts/entity_system/systems/interaction/interactable_system")
require("scripts/entity_system/systems/inventory/inventory_system")
require("scripts/entity_system/systems/leaderboard/leaderboard_system")
require("scripts/entity_system/systems/limited_item_track/limited_item_track_system")
require("scripts/entity_system/systems/locomotion/locomotion_system")
require("scripts/entity_system/systems/network/game_object_system")
require("scripts/entity_system/systems/objective_socket/objective_socket_system")
require("scripts/entity_system/systems/outlines/outline_system")
require("scripts/entity_system/systems/mutator_item/mutator_item_system")
require("scripts/entity_system/systems/pickups/pickup_system")
require("scripts/entity_system/systems/progress/progress_system")
require("scripts/entity_system/systems/projectile_impact/projectile_impact_system")
require("scripts/entity_system/systems/projectile_locomotion/projectile_locomotion_system")
require("scripts/entity_system/systems/round_started/round_started_system")
require("scripts/entity_system/systems/sound/sound_effect_system")
require("scripts/entity_system/systems/sound/sound_sector_system")
require("scripts/entity_system/systems/sound_environment/sound_environment_system")
require("scripts/entity_system/systems/sound_environment/sound_environment_system_dummy")
require("scripts/entity_system/systems/spawner/spawner_system")
require("scripts/entity_system/systems/statistics/statistics_system")
require("scripts/entity_system/systems/talents/talent_system")
require("scripts/entity_system/systems/volumes/volume_system")
require("scripts/entity_system/systems/projectile/projectile_system")
require("scripts/entity_system/systems/proximity/proximity_system")
require("scripts/entity_system/systems/projectile/projectile_linker_system")
require("scripts/entity_system/systems/props/end_zone_system")
require("scripts/entity_system/systems/props/props_system")
require("scripts/entity_system/systems/status/status_system")
require("scripts/entity_system/systems/transportation/transportation_system")
require("scripts/entity_system/systems/weapon/weapon_system")
require("scripts/entity_system/systems/weapon/ammo_system")
require("scripts/entity_system/systems/hud/hud_system")
require("scripts/entity_system/systems/tutorial/tutorial_system")
require("scripts/entity_system/systems/play_go_tutorial/play_go_tutorial_system")
require("scripts/entity_system/systems/mission/mission_system")
require("scripts/entity_system/systems/ping/ping_system")
require("scripts/entity_system/systems/payload/payload_system")
require("scripts/entity_system/systems/target_override/target_override_system")
require("scripts/entity_system/systems/position_lookup/position_lookup_system")
require("scripts/entity_system/systems/keep_decoration/keep_decoration_system")
require("scripts/entity_system/systems/whereabouts/whereabouts_system")
require("scripts/entity_system/systems/objective/objective_item_spawner_system")
require("scripts/entity_system/systems/objective/objective_system")
require("scripts/entity_system/systems/weaves/weave_loadout_system")
require("scripts/entity_system/systems/career/career_system")
require("scripts/entity_system/systems/disrupt_ritual/disrupt_ritual_system")
require("scripts/entity_system/systems/puzzle/puzzle_system")
require("scripts/entity_system/systems/unit_flow_override_system/unit_flow_override_system")
DLCUtils.require_list("systems")
require("scripts/unit_extensions/human/ai_player_unit/ai_anim_utils")
require("scripts/unit_extensions/human/ai_player_unit/ai_husk_base_extension")
require("scripts/unit_extensions/human/ai_player_unit/ai_simple_extension")
require("scripts/unit_extensions/human/ai_player_unit/ai_utils")
require("scripts/unit_extensions/generic/end_zone_extension")
require("scripts/unit_extensions/generic/bot_nav_transition_extension")
require("scripts/unit_extensions/generic/generic_aggroable_extension")
require("scripts/unit_extensions/generic/generic_ammo_user_extension")
require("scripts/unit_extensions/generic/generic_character_state_machine_extension")
require("scripts/unit_extensions/generic/generic_camera_state_machine_extension")
require("scripts/unit_extensions/generic/generic_death_extension")
require("scripts/unit_extensions/generic/generic_trail_extension")
require("scripts/unit_extensions/generic/generic_unit_aim_extension")
require("scripts/unit_extensions/generic/generic_hit_reaction_extension")
require("scripts/unit_extensions/generic/ai_line_of_sight_extension")
require("scripts/unit_extensions/generic/ladder_extension")
require("scripts/unit_extensions/generic/player_in_zone_extension")
require("scripts/unit_extensions/default_player_unit/player_eyetracking_extension")
require("scripts/unit_extensions/generic/shadow_flare_extension")
require("scripts/unit_extensions/generic/tentacle_spline_extension")
require("scripts/unit_extensions/generic/tentacle_templates")
require("scripts/unit_extensions/generic/thorn_mutator_extension")
require("scripts/unit_extensions/generic/scale_unit_extension")
require("scripts/unit_extensions/generic/store_display_item_gizmo_extension")
require("scripts/unit_extensions/generic/thrown_unit_husk_extension")
require("scripts/unit_extensions/ai_supplementary/beastmen_standard_extension")
require("scripts/unit_extensions/ai_supplementary/beastmen_standard_templates")
require("scripts/unit_extensions/ai_supplementary/unit_synchronization_extension")
require("scripts/unit_extensions/ai_supplementary/vortex_extension")
require("scripts/unit_extensions/ai_supplementary/vortex_templates")
require("scripts/unit_extensions/ai_supplementary/vortex_husk_extension")
require("scripts/unit_extensions/ai_supplementary/corruptor_beam_extension")
require("scripts/unit_extensions/ai_supplementary/stormfiend_beam_extension")
require("scripts/unit_extensions/weapons/area_damage/liquid/damage_wave_extension")
require("scripts/unit_extensions/weapons/area_damage/liquid/damage_wave_husk_extension")
require("scripts/unit_extensions/weapons/area_damage/liquid/damage_wave_templates")
require("scripts/unit_extensions/weapons/area_damage/liquid/damage_blob_extension")
require("scripts/unit_extensions/weapons/area_damage/liquid/damage_blob_husk_extension")
require("scripts/unit_extensions/weapons/area_damage/liquid/damage_blob_templates")
require("scripts/unit_extensions/default_player_unit/player_unit_attack_intensity_extension")
require("scripts/unit_extensions/default_player_unit/player_input_extension")
require("scripts/unit_extensions/default_player_unit/player_input_tutorial_extension")
require("scripts/unit_extensions/default_player_unit/player_sound_effect_extension")
require("scripts/unit_extensions/default_player_unit/player_whereabouts_extension")
require("scripts/unit_extensions/default_player_unit/lure_whereabouts_extension")
require("scripts/unit_extensions/human/player_bot_unit/player_bot_base")
require("scripts/unit_extensions/human/player_bot_unit/player_bot_input")
require("scripts/unit_extensions/human/player_bot_unit/player_bot_navigation")
require("scripts/unit_extensions/default_player_unit/talents/talent_extension")
require("scripts/unit_extensions/default_player_unit/talents/husk_talent_extension")
require("scripts/unit_extensions/default_player_unit/careers/career_extension")
require("scripts/unit_extensions/weapons/area_damage/area_damage_extension")
require("scripts/unit_extensions/weapons/area_damage/timed_explosion_extension")
require("scripts/unit_extensions/weapons/area_damage/proximity_mine_extension")
require("scripts/unit_extensions/weapons/area_damage/liquid/liquid_area_damage_extension")
require("scripts/unit_extensions/weapons/area_damage/liquid/liquid_area_damage_husk_extension")
require("scripts/unit_extensions/weapons/area_damage/liquid/liquid_area_damage_templates")
require("scripts/unit_extensions/weapons/area_damage/area_damage_templates")
require("scripts/unit_extensions/weapons/ammo/active_reload_ammo_user_extension")
require("scripts/unit_extensions/weapons/spread/weapon_spread_extension")
require("scripts/unit_extensions/default_player_unit/charge/player_husk_overcharge_extension")
require("scripts/unit_extensions/default_player_unit/charge/player_unit_overcharge_extension")
require("scripts/unit_extensions/default_player_unit/player_husk_visual_effects_extension")
require("scripts/unit_extensions/default_player_unit/player_unit_visual_effects_extension")
require("scripts/unit_extensions/default_player_unit/energy/player_unit_energy_extension")
require("scripts/unit_extensions/default_player_unit/energy/player_husk_energy_extension")
require("scripts/unit_extensions/default_player_unit/boons/boon_extension")
require("scripts/unit_extensions/default_player_unit/target_override_extension")
require("scripts/unit_extensions/cutscene_camera/cutscene_camera")
require("scripts/unit_extensions/smart_targeting/player_unit_smart_targeting_extension")
require("scripts/unit_extensions/human/ai_player_unit/ai_shield_user_extension")
require("scripts/unit_extensions/human/ai_player_unit/ai_shield_user_husk_extension")
require("scripts/unit_extensions/human/ai_player_unit/bulwark_shield_extension")
require("scripts/unit_extensions/human/ai_player_unit/bulwark_husk_shield_extension")
require("scripts/unit_extensions/props/quest_challenge_prop_extension")
require("scripts/unit_extensions/props/event_upsell_prop_extension")
require("scripts/unit_extensions/weaves/weave_capture_point_extension")
require("scripts/unit_extensions/weaves/weave_target_extension")
require("scripts/unit_extensions/weaves/weave_limited_item_spawner_extension")
require("scripts/unit_extensions/weaves/weave_doom_wheel_extension")
require("scripts/unit_extensions/weaves/weave_socket_extension")
require("scripts/unit_extensions/weaves/weave_item_extension")
require("scripts/unit_extensions/weaves/weave_interaction_extension")
require("scripts/unit_extensions/weaves/weave_kill_enemies_extension")
require("scripts/unit_extensions/level/event_light_spawner_extension")
require("scripts/unit_extensions/level/disrupt_ritual_extension")
DLCUtils.require_list("entity_extensions")

local ai_supplementary_system_extension = {
	"TentacleSplineExtension",
	"VortexExtension",
	"VortexHuskExtension",
	"ThrownUnitHuskExtension",
	"BeastmenStandardExtension",
	"UnitSynchronizationExtension",
	"GrudgeMarkSirenChainExtension",
}

EntitySystem = class(EntitySystem)

EntitySystem.init = function (self, entity_system_creation_context)
	assert(entity_system_creation_context.entity_manager, "Entity Manager is missing!")
	assert(entity_system_creation_context.world, "World is missing!")
	assert(entity_system_creation_context.unit_spawner, "Unit Spawner is missing!")

	self.entity_manager = entity_system_creation_context.entity_manager
	self.world = entity_system_creation_context.world
	self.unit_spawner = entity_system_creation_context.unit_spawner
	self.startup_data = entity_system_creation_context.startup_data
	self.is_server = entity_system_creation_context.is_server
	self.entity_system_bag = entity_system_creation_context.entity_system_bag
	self.network_clock = entity_system_creation_context.network_clock
	self.network_transmit = entity_system_creation_context.network_transmit
	self.statistics_db = entity_system_creation_context.statistics_db
	self.dice_keeper = entity_system_creation_context.dice_keeper
	self.system_update_context = {}

	self:_init_systems(entity_system_creation_context)
end

EntitySystem._init_systems = function (self, entity_system_creation_context)
	local no_pre_update, has_pre_update, has_post_update, dont_run_on_dedicated_server = false, true, true, true

	entity_system_creation_context.entity_system = self

	local is_versus = Managers.mechanism:current_mechanism_name() == "versus"

	print("entity_system: is_versus", is_versus)
	self:_add_system("ai_bot_group_system", AIBotGroupSystem, entity_system_creation_context)
	self:_add_system("target_override_system", TargetOverrideSystem, entity_system_creation_context, {
		"TargetOverrideExtension",
	})
	self:_add_system("ai_system", AISystem, entity_system_creation_context)
	self:_add_system("ai_line_of_sight_system", AILineOfSightSystem, entity_system_creation_context)
	self:_add_system("ai_interest_point_system", AIInterestPointSystem, entity_system_creation_context)
	self:_add_system("input_system", ExtensionSystemBase, entity_system_creation_context, {
		"PlayerInputExtension",
		"PlayerInputTutorialExtension",
		"PlayerBotInput",
	}, nil, has_pre_update)
	self:_add_system("position_lookup_system", PositionLookupSystem, entity_system_creation_context)
	self:_add_system("darkness_system", DarknessSystem, entity_system_creation_context, {
		"LightSourceExtension",
	})
	self:_add_system("character_state_machine_system", ExtensionSystemBase, entity_system_creation_context, {
		"GenericCharacterStateMachineExtension",
	})
	self:_add_system("ladder_system", ExtensionSystemBase, entity_system_creation_context, {
		"LadderExtension",
	})
	self:_add_system("inventory_system", InventorySystem, entity_system_creation_context)
	self:_add_system("pickup_system", PickupSystem, entity_system_creation_context)
	self:_add_system("attachment_system", AttachmentSystem, entity_system_creation_context)
	self:_add_system("cosmetic_system", CosmeticSystem, entity_system_creation_context)
	self:_add_system("ai_shield_system", ExtensionSystemBase, entity_system_creation_context, {
		"AIShieldUserExtension",
		"AIShieldUserHuskExtension",
		"BulwarkShieldExtension",
		"BulwarkHuskShieldExtension",
	})
	self:_add_system("ai_inventory_system", AIInventorySystem, entity_system_creation_context)
	self:_add_system("ai_inventory_item_system", AIInventoryItemSystem, entity_system_creation_context)
	self:_add_system("objective_socket_system", ObjectiveSocketSystem, entity_system_creation_context)
	self:_add_system("objective_item_spawner_system", ObjectiveItemSpawnerSystem, entity_system_creation_context)
	self:_add_system("objective_system", ObjectiveSystem, entity_system_creation_context)
	self:_add_system("limited_item_track_system", LimitedItemTrackSystem, entity_system_creation_context)
	self:_add_system("aggro_system", AggroSystem, entity_system_creation_context)
	self:_add_system("ping_system", PingSystem, entity_system_creation_context)
	self:_add_system("smart_targeting_system", ExtensionSystemBase, entity_system_creation_context, {
		"PlayerUnitSmartTargetingExtension",
	})
	self:_add_system("weapon_system", WeaponSystem, entity_system_creation_context)
	self:_add_system("projectile_locomotion_system", ProjectileLocomotionSystem, entity_system_creation_context)
	self:_add_system("projectile_impact_system", ProjectileImpactSystem, entity_system_creation_context)
	self:_add_system("projectile_linker_system", ProjectileLinkerSystem, entity_system_creation_context)
	self:_add_system("projectile_system", ProjectileSystem, entity_system_creation_context)
	self:_add_system("mutator_item_system", MutatorItemSystem, entity_system_creation_context)
	self:_add_system("weave_loadout_system", WeaveLoadoutSystem, entity_system_creation_context)
	self:_add_system("puzzle_system", PuzzleSystem, entity_system_creation_context)

	if is_versus then
		self:_add_system("ghost_mode_system", GhostModeSystem, entity_system_creation_context)
		self:_add_system("versus_horde_ability_system", VersusHordeAbilitySystem, entity_system_creation_context)
	else
		self.entity_manager:add_ignore_extensions({
			"PlayerEquipmentWorldMarkerExtension",
		})
	end

	self:_add_system("world_marker_system", WorldMarkerSystem, entity_system_creation_context)

	if DEDICATED_SERVER then
		self.entity_manager:add_ignore_extensions({
			"UnitFlowOverrideExtension",
		})
	end

	self:_add_system("buff_system", BuffSystem, entity_system_creation_context)
	self:_add_system("buff_area_system", BuffAreaSystem, entity_system_creation_context)
	self:_add_system("talent_system", TalentSystem, entity_system_creation_context)
	self:_add_system("ammo_system", AmmoSystem, entity_system_creation_context)
	self:_add_system("spread_system", ExtensionSystemBase, entity_system_creation_context, {
		"WeaponSpreadExtension",
	})
	self:_add_system("health_system", HealthSystem, entity_system_creation_context)
	self:_add_system("status_system", StatusSystem, entity_system_creation_context)
	self:_add_system("attack_intensity_system", ExtensionSystemBase, entity_system_creation_context, {
		"PlayerUnitAttackIntensityExtension",
	})
	self:_add_system("hit_reaction_system", HitReactionSystem, entity_system_creation_context)
	self:_add_system("overcharge_system", ExtensionSystemBase, entity_system_creation_context, {
		"PlayerUnitOverchargeExtension",
		"PlayerHuskOverchargeExtension",
	})
	self:_add_system("trail_system", ExtensionSystemBase, entity_system_creation_context, {
		"GenericTrailExtension",
	})
	self:_add_system("sound_effect_system", SoundEffectSystem, entity_system_creation_context)
	self:_add_system("visual_effects_system", ExtensionSystemBase, entity_system_creation_context, {
		"PlayerUnitVisualEffectsExtension",
		"PlayerHuskVisualEffectsExtension",
	}, nil, nil, nil, dont_run_on_dedicated_server)
	self:_add_system("ai_slot_system", AISlotSystem2, entity_system_creation_context)
	self:_add_system("ai_commander_system", AICommanderSystem, entity_system_creation_context)
	self:_add_system("area_damage_system", AreaDamageSystem, entity_system_creation_context)
	self:_add_system("death_system", DeathSystem, entity_system_creation_context)
	self:_add_system("interactor_system", InteractionSystem, entity_system_creation_context)
	self:_add_system("interactable_system", InteractableSystem, entity_system_creation_context)
	self:_add_system("ai_group_system", AIGroupSystem, entity_system_creation_context)
	self:_add_system("ai_navigation_system", AINavigationSystem, entity_system_creation_context, {
		"AINavigationExtension",
		"PlayerBotNavigation",
	}, nil, no_pre_update, has_post_update)
	self:_add_system("whereabouts_system", WhereaboutsSystem, entity_system_creation_context, {
		"PlayerWhereaboutsExtension",
		"LureWhereaboutsExtension",
		"JumpsWhereaboutsExtension",
	}, nil, no_pre_update)
	self:_add_system("ai_supplementary_system", ExtensionSystemBase, entity_system_creation_context, ai_supplementary_system_extension)
	self:_add_system("ai_beam_effect_system", ExtensionSystemBase, entity_system_creation_context, {
		"CorruptorBeamExtension",
		"StormfiendBeamExtension",
		"CurseCorruptorBeamExtension",
	})
	self:_add_system("door_system", DoorSystem, entity_system_creation_context)
	self:_add_system("payload_system", PayloadSystem, entity_system_creation_context)
	self:_add_system("career_system", CareerSystem, entity_system_creation_context)
	self:_add_system("event_spawner_system", ExtensionSystemBase, entity_system_creation_context, {
		"EventLightSpawnerExtension",
	})
	self:_add_system("disrupt_ritual_system", DisruptRitualSystem, entity_system_creation_context, {
		"DisruptRitualExtension",
	})

	if Managers.state.game_mode:settings().use_keep_decorations then
		self:_add_system("keep_decoration_system", KeepDecorationSystem, entity_system_creation_context)
	else
		self.entity_manager:add_ignore_extensions({
			"KeepDecorationPaintingExtension",
		})
	end

	self:_add_system("aim_system", AimSystem, entity_system_creation_context, {
		"GenericUnitAimExtension",
	})
	self:_add_system("animation_movement_system", AnimationMovementSystem, entity_system_creation_context, {
		"GenericUnitAnimationMovementSystem",
	})
	self:_add_system("transportation_system", TransportationSystem, entity_system_creation_context, nil, nil, no_pre_update, has_post_update)
	self:_add_system("locomotion_system", LocomotionSystem, entity_system_creation_context, nil, nil, no_pre_update, has_post_update)
	self:_add_system("animation_system", AnimationSystem, entity_system_creation_context)

	if IS_WINDOWS then
		self:_add_system("eyetracking_system", ExtensionSystemBase, entity_system_creation_context, {
			"PlayerEyeTrackingExtension",
		})
	end

	self:_add_system("first_person_system", FirstPersonSystem, entity_system_creation_context)

	if DEDICATED_SERVER then
		self:_add_system("fade_system", FadeSystemDummy, entity_system_creation_context)
	else
		self:_add_system("fade_system", FadeSystem, entity_system_creation_context)
	end

	self:_add_system("camera_state_machine_system", ExtensionSystemBase, entity_system_creation_context, {
		"GenericCameraStateMachineExtension",
	})
	self:_add_system("camera_system", CameraSystem, entity_system_creation_context, nil, nil, no_pre_update, has_post_update)
	self:_add_system("sound_sector_system", SoundSectorSystem, entity_system_creation_context, nil, nil, nil, nil, nil)
	self:_add_system("volume_system", VolumeSystem, entity_system_creation_context)
	self:_add_system("cutscene_system", CutsceneSystem, entity_system_creation_context)
	self:_add_system("outline_system", OutlineSystem, entity_system_creation_context, nil, nil, nil, nil, dont_run_on_dedicated_server)
	self:_add_system("play_go_tutorial_system", PlayGoTutorialSystem, entity_system_creation_context)
	self:_add_system("tutorial_system", TutorialSystem, entity_system_creation_context)
	self:_add_system("mission_system", MissionSystem, entity_system_creation_context)
	self:_add_system("hud_system", HUDSystem, entity_system_creation_context)
	self:_add_system("round_started_system", RoundStartedSystem, entity_system_creation_context)
	self:_add_system("spawner_system", SpawnerSystem, entity_system_creation_context)
	self:_add_system("props_system", PropsSystem, entity_system_creation_context, {
		"BotNavTransitionExtension",
	}, {
		"PerlinLightExtension",
		"QuestChallengePropExtension",
		"EventUpsellPropExtension",
	})
	self:_add_system("end_zone_system", EndZoneSystem, entity_system_creation_context)
	self:_add_system("progress_system", ProgressSystem, entity_system_creation_context)
	self:_add_system("nav_graph_system", NavGraphSystem, entity_system_creation_context)
	self:_add_system("audio_system", AudioSystem, entity_system_creation_context)

	if DEDICATED_SERVER then
		self:_add_system("sound_environment_system", SoundEnvironmentSystemDummy, entity_system_creation_context)
	else
		self:_add_system("sound_environment_system", SoundEnvironmentSystem, entity_system_creation_context)
	end

	self:_add_system("game_object_system", GameObjectSystem, entity_system_creation_context)
	self:_add_system("statistics_system", StatisticsSystem, entity_system_creation_context)
	self:_add_system("dialogue_context_system", DialogueContextSystem, entity_system_creation_context)
	self:_add_system("health_trigger_system", HealthTriggerSystem, entity_system_creation_context)
	self:_add_system("surrounding_aware_system", SurroundingAwareSystem, entity_system_creation_context)
	self:_add_system("dialogue_system", DialogueSystem, entity_system_creation_context, nil, nil, no_pre_update, has_post_update)
	self:_add_system("proximity_system", ProximitySystem, entity_system_creation_context, nil, nil, no_pre_update, has_post_update)
	self:_add_system("energy_system", ExtensionSystemBase, entity_system_creation_context, {
		"PlayerUnitEnergyExtension",
		"PlayerHuskEnergyExtension",
	})
	self:_add_system("boon_system", ExtensionSystemBase, entity_system_creation_context, {
		"BoonExtension",
	})
	self:_add_system("unit_flow_override_system", UnitFlowOverrideSystem, entity_system_creation_context, nil, nil, nil, nil, dont_run_on_dedicated_server)

	for _, dlc in pairs(DLCSettings) do
		local entity_system_params = dlc.entity_system_params or {}

		for _, params in pairs(entity_system_params) do
			local system_name = params.system_name
			local system_class = rawget(_G, params.system_class_name)
			local context = params.context or entity_system_creation_context
			local extension_list = params.extension_list

			self:_add_system(system_name, system_class, context, extension_list)
		end
	end
end

EntitySystem.register_system = function (self, system_object, system_name, ...)
	return
end

EntitySystem._add_system = function (self, name, class, context, extension_list, extension_list_ignore_on_dedicated, has_pre_update, has_post_update, dont_run_on_dedicated_server)
	if DEDICATED_SERVER and dont_run_on_dedicated_server then
		local ignore_extensions = class.system_extensions or {}

		if extension_list then
			table.append(ignore_extensions, extension_list)
		end

		self.entity_manager:add_ignore_extensions(ignore_extensions)
	else
		local extensions = {}

		if extension_list ~= nil then
			table.append(extensions, extension_list)
		end

		if not DEDICATED_SERVER and extension_list_ignore_on_dedicated ~= nil then
			table.append(extensions, extension_list_ignore_on_dedicated)
		end

		local system = class:new(context, name, extensions)
		local block_pre_update = not has_pre_update
		local block_post_update = not has_post_update

		self.entity_system_bag:add_system(system, block_pre_update, block_post_update)

		if DEDICATED_SERVER and extension_list_ignore_on_dedicated ~= nil then
			self.entity_manager:add_ignore_extensions(extension_list_ignore_on_dedicated)
		end
	end
end

EntitySystem.pre_update = function (self, dt)
	self:system_update("pre_update", dt)
end

EntitySystem.update = function (self, dt)
	self:system_update("update", dt)
end

EntitySystem.unsafe_entity_update = function (self, dt)
	self:system_update("unsafe_entity_update", dt)
end

EntitySystem.post_update = function (self, dt)
	self:system_update("post_update", dt)
end

EntitySystem.physics_async_update = function (self)
	self:system_update("physics_async_update", self.system_update_context.dt)
end

EntitySystem.system_update = function (self, update_func, dt)
	local entity_system_update_context = self.system_update_context

	entity_system_update_context.world = self.world
	entity_system_update_context.dt = dt
	entity_system_update_context.entity_manager = self.entity_manager
	entity_system_update_context.t = Managers.time:time("game")
	entity_system_update_context.network_transmit = self.network_transmit
	entity_system_update_context.statistics_db = self.statistics_db
	entity_system_update_context.dice_keeper = self.dice_keeper

	if World.get_data(entity_system_update_context.world, "paused") then
		return
	end

	self.entity_system_bag:update(entity_system_update_context, update_func)
end

EntitySystem.commit_and_remove_pending_units = function (self)
	local unit_spawner = self.unit_spawner

	unit_spawner.locked = false

	unit_spawner:commit_and_remove_pending_units()

	unit_spawner.locked = true
end

EntitySystem.hot_join_sync = function (self, peer_id)
	self.entity_system_bag:hot_join_sync(peer_id)
end

EntitySystem.destroy = function (self)
	local units = World.units(self.world)

	self.entity_manager:unregister_units(units, #units)
	GarbageLeakDetector.register_object(self.system_update_context, "EntitySystemUpdateContext")

	self.system_update_context = nil

	GarbageLeakDetector.register_object(self, "EntitySystem")
end
