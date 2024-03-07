-- chunkname: @scripts/network/unit_extension_templates.lua

local ai_locomotion_name = _G.GameSettingsDevelopment and GameSettingsDevelopment.use_engine_optimized_ai_locomotion and "AILocomotionExtensionC" or "AILocomotionExtension"
local eye_tracking_name = IS_WINDOWS and "PlayerEyeTrackingExtension" or nil
local unit_templates = {
	player_unit_base = {
		go_type = "player_unit",
		self_owned_extensions = {
			"PlayerInputExtension",
			"GenericCharacterStateMachineExtension",
			"BuffExtension",
			"CareerExtension",
			"SimpleInventoryExtension",
			"GenericUnitInteractorExtension",
			"GenericUnitInteractableExtension",
			"PlayerUnitHealthExtension",
			"GenericHitReactionExtension",
			"GenericDeathExtension",
			"PlayerUnitLocomotionExtension",
			"PlayerUnitFirstPerson",
			"GenericUnitAimExtension",
			"PlayerHud",
			"PlayerUnitAttachmentExtension",
			"PlayerUnitCosmeticExtension",
			"PlayerWhereaboutsExtension",
			"LocalPlayerVolumeExtension",
			"PlayerTutorialExtension",
			"StatisticsExtension",
			"ContextAwarePingExtension",
			"PlayerUnitFadeExtension",
			"PlayerUnitDarknessExtension",
			"PlayerUnitSmartTargetingExtension",
			"PlayerSoundEffectExtension",
			"PlayerUnitAttackIntensityExtension",
			"AICommanderExtension",
			eye_tracking_name,
		},
		self_owned_extensions_server = {
			"PlayerInputExtension",
			"GenericCharacterStateMachineExtension",
			"BuffExtension",
			"CareerExtension",
			"SimpleInventoryExtension",
			"GenericUnitInteractorExtension",
			"GenericUnitInteractableExtension",
			"PlayerUnitHealthExtension",
			"GenericHitReactionExtension",
			"GenericDeathExtension",
			"PlayerUnitLocomotionExtension",
			"PlayerUnitFirstPerson",
			"GenericUnitAimExtension",
			"PlayerHud",
			"PlayerUnitAttachmentExtension",
			"PlayerUnitCosmeticExtension",
			"PlayerWhereaboutsExtension",
			"TargetOverrideExtension",
			"AIPlayerSlotExtension",
			"PlayerVolumeExtension",
			"PlayerTutorialExtension",
			"StatisticsExtension",
			"ContextAwarePingExtension",
			"PlayerUnitFadeExtension",
			"PlayerUnitDarknessExtension",
			"PlayerUnitSmartTargetingExtension",
			"PlayerSoundEffectExtension",
			"PlayerUnitAttackIntensityExtension",
			"AICommanderExtension",
			eye_tracking_name,
		},
		husk_extensions = {
			"SimpleHuskInventoryExtension",
			"GenericHuskInteractorExtension",
			"GenericUnitInteractableExtension",
			"BuffExtension",
			"CareerExtension",
			"PlayerUnitHealthExtension",
			"GenericHitReactionExtension",
			"GenericDeathExtension",
			"PlayerHuskLocomotionExtension",
			"GenericUnitAimExtension",
			"PlayerUnitCosmeticExtension",
			"PlayerHuskAttachmentExtension",
			"StatisticsExtension",
			"PingTargetExtension",
			"PlayerUnitFadeExtension",
			"PlayerUnitDarknessExtension",
			"PlayerEquipmentWorldMarkerExtension",
		},
		husk_extensions_server = {
			"SimpleHuskInventoryExtension",
			"GenericHuskInteractorExtension",
			"GenericUnitInteractableExtension",
			"BuffExtension",
			"CareerExtension",
			"PlayerUnitHealthExtension",
			"GenericHitReactionExtension",
			"GenericDeathExtension",
			"PlayerHuskLocomotionExtension",
			"GenericUnitAimExtension",
			"PlayerUnitCosmeticExtension",
			"PlayerHuskAttachmentExtension",
			"PlayerWhereaboutsExtension",
			"TargetOverrideExtension",
			"AIPlayerSlotExtension",
			"PlayerVolumeExtension",
			"StatisticsExtension",
			"PingTargetExtension",
			"PlayerUnitFadeExtension",
			"PlayerUnitDarknessExtension",
			"PlayerUnitAttackIntensityExtension",
			"PlayerEquipmentWorldMarkerExtension",
			"AICommanderExtension",
		},
	},
	player_unit_3rd = {
		base_template = "player_unit_base",
		go_type = "player_unit",
		self_owned_extensions = {
			"GenericStatusExtension",
			"TalentExtension",
			"PlayerUnitOverchargeExtension",
			"PlayerUnitEnergyExtension",
			"PlayerUnitVisualEffectsExtension",
			"PlayerUnitWeaveLoadoutExtension",
			"DialogueActorExtension",
			"HealthTriggerExtension",
			"GenericDialogueContextExtension",
			"PlayerProximityExtension",
			"SurroundingObserverExtension",
			"PlayerOutlineExtension",
		},
		self_owned_extensions_server = {
			"GenericStatusExtension",
			"TalentExtension",
			"PlayerUnitOverchargeExtension",
			"PlayerUnitEnergyExtension",
			"PlayerUnitVisualEffectsExtension",
			"PlayerUnitWeaveLoadoutExtension",
			"DialogueActorExtension",
			"HealthTriggerExtension",
			"GenericDialogueContextExtension",
			"PlayerProximityExtension",
			"SurroundingObserverExtension",
			"GenericAggroableExtension",
			"PlayerOutlineExtension",
			"RoundStartedExtension",
		},
		husk_extensions = {
			"GenericStatusExtension",
			"PlayerHuskOverchargeExtension",
			"PlayerHuskEnergyExtension",
			"PlayerHuskVisualEffectsExtension",
			"PlayerHuskWeaveLoadoutExtension",
			"DialogueActorExtension",
			"HealthTriggerExtension",
			"GenericDialogueContextExtension",
			"PlayerProximityExtension",
			"SurroundingObserverHuskExtension",
			"PlayerHuskOutlineExtension",
			"PlayerUnitAttackIntensityExtension",
			"HuskTalentExtension",
		},
		husk_extensions_server = {
			"GenericStatusExtension",
			"HuskTalentExtension",
			"PlayerHuskOverchargeExtension",
			"PlayerHuskEnergyExtension",
			"PlayerHuskVisualEffectsExtension",
			"PlayerHuskWeaveLoadoutExtension",
			"DialogueActorExtension",
			"HealthTriggerExtension",
			"GenericDialogueContextExtension",
			"PlayerProximityExtension",
			"SurroundingObserverHuskExtension",
			"GenericAggroableExtension",
			"PlayerHuskOutlineExtension",
			"RoundStartedExtension",
		},
	},
	player_unit_3rd_tutorial = {
		go_type = "player_unit",
		self_owned_extensions = {
			"PlayerInputTutorialExtension",
			"GenericCharacterStateMachineExtension",
			"BuffExtension",
			"TalentExtension",
			"CareerExtension",
			"SimpleInventoryExtension",
			"GenericUnitInteractorExtension",
			"GenericUnitInteractableExtension",
			"PlayerUnitHealthExtension",
			"GenericStatusExtension",
			"GenericHitReactionExtension",
			"GenericDeathExtension",
			"PlayerUnitLocomotionExtension",
			"PlayerUnitFirstPerson",
			"GenericUnitAimExtension",
			"PlayerHud",
			"PlayerUnitAttachmentExtension",
			"PlayerUnitCosmeticExtension",
			"DialogueActorExtension",
			"SurroundingObserverExtension",
			"PlayerWhereaboutsExtension",
			"PlayerProximityExtension",
			"HealthTriggerExtension",
			"GenericDialogueContextExtension",
			"PlayerOutlineExtension",
			"PlayerTutorialExtension",
			"StatisticsExtension",
			"ContextAwarePingExtension",
			"PlayerUnitFadeExtension",
			"PlayerUnitDarknessExtension",
			"PlayerUnitSmartTargetingExtension",
			"PlayerUnitOverchargeExtension",
			"PlayerUnitEnergyExtension",
			"PlayerSoundEffectExtension",
			"PlayerUnitVisualEffectsExtension",
			"AICommanderExtension",
			eye_tracking_name,
		},
		self_owned_extensions_server = {
			"PlayerInputTutorialExtension",
			"GenericCharacterStateMachineExtension",
			"BuffExtension",
			"TalentExtension",
			"CareerExtension",
			"SimpleInventoryExtension",
			"GenericUnitInteractorExtension",
			"GenericUnitInteractableExtension",
			"PlayerUnitHealthExtension",
			"GenericStatusExtension",
			"GenericHitReactionExtension",
			"GenericDeathExtension",
			"PlayerUnitLocomotionExtension",
			"PlayerUnitFirstPerson",
			"GenericUnitAimExtension",
			"PlayerHud",
			"PlayerUnitAttachmentExtension",
			"PlayerUnitCosmeticExtension",
			"DialogueActorExtension",
			"SurroundingObserverExtension",
			"PlayerWhereaboutsExtension",
			"PlayerProximityExtension",
			"HealthTriggerExtension",
			"GenericDialogueContextExtension",
			"TargetOverrideExtension",
			"AIPlayerSlotExtension",
			"GenericAggroableExtension",
			"PlayerOutlineExtension",
			"PlayerVolumeExtension",
			"RoundStartedExtension",
			"PlayerTutorialExtension",
			"StatisticsExtension",
			"ContextAwarePingExtension",
			"PlayerUnitFadeExtension",
			"PlayerUnitDarknessExtension",
			"PlayerUnitSmartTargetingExtension",
			"PlayerUnitOverchargeExtension",
			"PlayerUnitEnergyExtension",
			"PlayerSoundEffectExtension",
			"PlayerUnitVisualEffectsExtension",
			"PlayerUnitAttackIntensityExtension",
			"AICommanderExtension",
			eye_tracking_name,
		},
		husk_extensions = {
			"SimpleHuskInventoryExtension",
			"GenericHuskInteractorExtension",
			"GenericUnitInteractableExtension",
			"BuffExtension",
			"CareerExtension",
			"PlayerUnitHealthExtension",
			"GenericStatusExtension",
			"GenericHitReactionExtension",
			"GenericDeathExtension",
			"PlayerHuskLocomotionExtension",
			"GenericUnitAimExtension",
			"DialogueActorExtension",
			"SurroundingObserverHuskExtension",
			"PlayerHuskOutlineExtension",
			"PlayerProximityExtension",
			"HealthTriggerExtension",
			"GenericDialogueContextExtension",
			"PlayerHuskAttachmentExtension",
			"StatisticsExtension",
			"PingTargetExtension",
			"PlayerUnitFadeExtension",
			"PlayerUnitDarknessExtension",
			"PlayerHuskOverchargeExtension",
			"PlayerHuskEnergyExtension",
			"PlayerHuskVisualEffectsExtension",
		},
		husk_extensions_server = {
			"SimpleHuskInventoryExtension",
			"GenericHuskInteractorExtension",
			"GenericUnitInteractableExtension",
			"BuffExtension",
			"HuskTalentExtension",
			"CareerExtension",
			"PlayerUnitHealthExtension",
			"GenericStatusExtension",
			"GenericHitReactionExtension",
			"GenericDeathExtension",
			"PlayerHuskLocomotionExtension",
			"GenericUnitAimExtension",
			"PlayerHuskAttachmentExtension",
			"DialogueActorExtension",
			"SurroundingObserverHuskExtension",
			"PlayerWhereaboutsExtension",
			"PlayerHuskOutlineExtension",
			"PlayerProximityExtension",
			"HealthTriggerExtension",
			"GenericDialogueContextExtension",
			"TargetOverrideExtension",
			"AIPlayerSlotExtension",
			"GenericAggroableExtension",
			"PlayerVolumeExtension",
			"RoundStartedExtension",
			"StatisticsExtension",
			"PingTargetExtension",
			"PlayerUnitFadeExtension",
			"PlayerUnitDarknessExtension",
			"PlayerHuskOverchargeExtension",
			"PlayerHuskEnergyExtension",
			"PlayerHuskVisualEffectsExtension",
		},
	},
	player_bot_unit = {
		go_type = "player_bot_unit",
		self_owned_extensions = {
			"PlayerBotBase",
			"AIBotGroupExtension",
			"PlayerBotInput",
			"PlayerBotNavigation",
			"GenericCharacterStateMachineExtension",
			"BuffExtension",
			"TalentExtension",
			"CareerExtension",
			"SimpleInventoryExtension",
			"GenericUnitInteractorExtension",
			"GenericUnitInteractableExtension",
			"PlayerUnitHealthExtension",
			"GenericStatusExtension",
			"GenericHitReactionExtension",
			"GenericDeathExtension",
			"PlayerUnitWeaveLoadoutExtension",
			"PlayerUnitLocomotionExtension",
			"PlayerUnitCosmeticExtension",
			"PlayerUnitAttachmentExtension",
			"PlayerBotUnitFirstPerson",
			"GenericUnitAimExtension",
			"DialogueActorExtension",
			"SurroundingObserverHuskExtension",
			"PlayerWhereaboutsExtension",
			"PlayerProximityExtension",
			"HealthTriggerExtension",
			"GenericDialogueContextExtension",
			"TargetOverrideExtension",
			"AIPlayerSlotExtension",
			"GenericAggroableExtension",
			"PlayerHuskOutlineExtension",
			"BotVolumeExtension",
			"StatisticsExtension",
			"PingTargetExtension",
			"PlayerUnitFadeExtension",
			"PlayerUnitDarknessExtension",
			"PlayerUnitOverchargeExtension",
			"PlayerUnitEnergyExtension",
			"PlayerUnitVisualEffectsExtension",
			"PlayerUnitAttackIntensityExtension",
			"PlayerEquipmentWorldMarkerExtension",
			"AICommanderExtension",
		},
		husk_extensions = {
			"SimpleHuskInventoryExtension",
			"GenericHuskInteractorExtension",
			"GenericUnitInteractableExtension",
			"BuffExtension",
			"CareerExtension",
			"PlayerUnitHealthExtension",
			"GenericStatusExtension",
			"GenericHitReactionExtension",
			"GenericDeathExtension",
			"PlayerHuskWeaveLoadoutExtension",
			"PlayerHuskLocomotionExtension",
			"GenericUnitAimExtension",
			"DialogueActorExtension",
			"SurroundingObserverHuskExtension",
			"PlayerHuskOutlineExtension",
			"PlayerProximityExtension",
			"HealthTriggerExtension",
			"GenericDialogueContextExtension",
			"StatisticsExtension",
			"PingTargetExtension",
			"PlayerUnitFadeExtension",
			"PlayerUnitCosmeticExtension",
			"PlayerHuskAttachmentExtension",
			"PlayerUnitDarknessExtension",
			"PlayerHuskOverchargeExtension",
			"PlayerHuskEnergyExtension",
			"PlayerHuskVisualEffectsExtension",
			"HuskTalentExtension",
			"PlayerEquipmentWorldMarkerExtension",
		},
	},
	ai_unit_base = {
		go_type = "ai_unit",
		self_owned_extensions = {
			ai_locomotion_name,
			"AINavigationExtension",
			"GenericHitReactionExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"EnemyOutlineExtension",
			"AIGroupMember",
			"DialogueActorExtension",
			"AIVolumeExtension",
			"AIUnitFadeExtension",
			"AISimpleExtension",
			"UnitFlowOverrideExtension",
		},
		husk_extensions = {
			"AiHuskLocomotionExtension",
			"GenericHitReactionExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"EnemyOutlineExtension",
			"DialogueActorExtension",
			"AIUnitFadeExtension",
			"AiHuskBaseExtension",
			"UnitFlowOverrideExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AINavigationExtension",
				"AIProximityExtension",
				"BuffExtension",
				"AIGroupMember",
				"DialogueActorExtension",
				"AIVolumeExtension",
				"AISimpleExtension",
			},
			husk_extensions = {
				"AiHuskLocomotionExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension",
				"AiHuskBaseExtension",
			},
		},
	},
	ai_unit_critter = {
		go_type = "ai_unit",
		self_owned_extensions = {
			ai_locomotion_name,
			"AINavigationExtension",
			"GenericHitReactionExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"DialogueActorExtension",
			"AIVolumeExtension",
			"AISimpleExtension",
		},
		husk_extensions = {
			"AiHuskLocomotionExtension",
			"GenericHitReactionExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"DialogueActorExtension",
			"AiHuskBaseExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AINavigationExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension",
				"AIVolumeExtension",
				"AISimpleExtension",
			},
			husk_extensions = {
				"AiHuskLocomotionExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension",
				"AiHuskBaseExtension",
			},
		},
	},
	ai_unit_critter_nurgling = {
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			ai_locomotion_name,
			"AINavigationExtension",
			"GenericHitReactionExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"AIGroupMember",
			"DialogueActorExtension",
			"AIVolumeExtension",
			"AISimpleExtension",
			"AIInventoryExtension",
		},
		husk_extensions = {
			"AiHuskLocomotionExtension",
			"GenericHitReactionExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"DialogueActorExtension",
			"AiHuskBaseExtension",
			"AIInventoryExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AINavigationExtension",
				"AIProximityExtension",
				"BuffExtension",
				"AIGroupMember",
				"DialogueActorExtension",
				"AIVolumeExtension",
				"AISimpleExtension",
			},
			husk_extensions = {
				"AiHuskLocomotionExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension",
				"AiHuskBaseExtension",
			},
		},
	},
	ai_unit_beastmen_bestigor = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_beastmen_bestigor",
		self_owned_extensions = {
			"AILineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"PingTargetExtension",
			"GenericUnitAnimationMovementExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
			"GenericUnitAnimationMovementExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AILineOfSightExtension",
				"AIEnemySlotExtension",
				"GenericUnitAnimationMovementExtension",
			},
			husk_extensions = {
				"GenericUnitAnimationMovementExtension",
			},
		},
	},
	ai_unit_beastmen_ungor_archer = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AILineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"PingTargetExtension",
			"GenericUnitAimExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
			"GenericUnitAimExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AILineOfSightExtension",
				"AIEnemySlotExtension",
				"GenericUnitAimExtension",
			},
			husk_extensions = {
				"GenericUnitAimExtension",
			},
		},
	},
	ai_unit_storm_vermin = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AILineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"PingTargetExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AILineOfSightExtension",
				"AIEnemySlotExtension",
			},
			husk_extensions = {},
		},
	},
	ai_unit_chaos_warrior = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AILineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"PingTargetExtension",
			"GenericUnitAimExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
			"GenericUnitAimExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AILineOfSightExtension",
				"AIEnemySlotExtension",
				"GenericUnitAimExtension",
			},
			husk_extensions = {
				"GenericUnitAimExtension",
			},
		},
	},
	ai_unit_training_dummy_bob = {
		go_type = "ai_unit_training_dummy_bob",
		self_owned_extensions = {
			"GenericHitReactionExtension",
			"TrainingDummyHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"ProjectilePhysicsUnitLocomotionExtension",
			"PickupUnitExtension",
			"EnemyOutlineExtension",
			"GenericUnitInteractableExtension",
			"LookatTargetExtension",
			"PickupProjectileVolumeExtension",
			"PingTargetExtension",
			"AIGroupMember",
			"DialogueActorExtension",
			"AIVolumeExtension",
			"AIUnitFadeExtension",
			"AISimpleExtension",
			"UnitFlowOverrideExtension",
		},
		husk_extensions = {
			"GenericHitReactionExtension",
			"TrainingDummyHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"EnemyOutlineExtension",
			"DialogueActorExtension",
			"AIUnitFadeExtension",
			"AiHuskBaseExtension",
			"UnitFlowOverrideExtension",
			"ProjectilePhysicsHuskLocomotionExtension",
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"LookatTargetExtension",
			"PingTargetExtension",
		},
	},
	ai_unit_chaos_exalted_champion = {
		base_template = "ai_unit_base",
		go_type = "ai_lord_with_inventory",
		self_owned_extensions = {
			"AILineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"PingTargetExtension",
			"GenericUnitAimExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
			"GenericUnitAimExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AILineOfSightExtension",
				"AIEnemySlotExtension",
				"GenericUnitAimExtension",
			},
			husk_extensions = {
				"GenericUnitAimExtension",
			},
		},
	},
	ai_unit_clan_rat = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AILineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"SoundSectorExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"SoundSectorExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AILineOfSightExtension",
				"AIEnemySlotExtension",
				"SoundSectorExtension",
			},
			husk_extensions = {
				"SoundSectorExtension",
			},
		},
	},
	ai_unit_shield_rat = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory_and_shield",
		self_owned_extensions = {
			"AILineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"AIShieldUserExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"AIShieldUserHuskExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AILineOfSightExtension",
				"AIEnemySlotExtension",
			},
			husk_extensions = {},
		},
	},
	ai_unit_plague_monk = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AILineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"PingTargetExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AILineOfSightExtension",
				"AIEnemySlotExtension",
			},
			husk_extensions = {},
		},
	},
	ai_unit_shield_marauder = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory_and_shield",
		self_owned_extensions = {
			"AILineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"AIShieldUserExtension",
			"GenericUnitAimExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"AIShieldUserHuskExtension",
			"GenericUnitAimExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AILineOfSightExtension",
				"AIEnemySlotExtension",
				"GenericUnitAimExtension",
			},
			husk_extensions = {
				"GenericUnitAimExtension",
			},
		},
	},
	ai_unit_shield_vermin = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory_and_shield",
		self_owned_extensions = {
			"AILineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"PingTargetExtension",
			"AIShieldUserExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
			"AIShieldUserHuskExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AILineOfSightExtension",
				"AIEnemySlotExtension",
			},
			husk_extensions = {},
		},
	},
	ai_unit_marauder = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AILineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"GenericUnitAimExtension",
			"SoundSectorExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"GenericUnitAimExtension",
			"SoundSectorExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AILineOfSightExtension",
				"AIEnemySlotExtension",
				"GenericUnitAimExtension",
				"SoundSectorExtension",
			},
			husk_extensions = {
				"GenericUnitAimExtension",
				"SoundSectorExtension",
			},
		},
	},
	ai_unit_skeleton_with_shield = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory_and_shield",
		self_owned_extensions = {
			"AILineOfSightExtension",
			"AIInventoryExtension",
			"AIShieldUserExtension",
			"AIEnemySlotExtension",
			"GenericUnitAimExtension",
			"SoundSectorExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"AIShieldUserHuskExtension",
			"GenericUnitAimExtension",
			"SoundSectorExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AILineOfSightExtension",
				"AIEnemySlotExtension",
				"GenericUnitAimExtension",
				"SoundSectorExtension",
			},
			husk_extensions = {
				"GenericUnitAimExtension",
				"SoundSectorExtension",
			},
		},
	},
	ai_unit_skeleton = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AILineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"GenericUnitAimExtension",
			"SoundSectorExtension",
			"GenericOutlineExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"GenericUnitAimExtension",
			"SoundSectorExtension",
			"GenericOutlineExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AILineOfSightExtension",
				"AIEnemySlotExtension",
				"GenericUnitAimExtension",
				"SoundSectorExtension",
			},
			husk_extensions = {
				"GenericUnitAimExtension",
				"SoundSectorExtension",
			},
		},
	},
	ai_unit_pet_skeleton = {
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			ai_locomotion_name,
			"AINavigationExtension",
			"GenericHitReactionExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"MinionOutlineExtension",
			"AIGroupMember",
			"DialogueActorExtension",
			"AIVolumeExtension",
			"AIUnitFadeExtension",
			"AISimpleExtension",
			"UnitFlowOverrideExtension",
			"AILineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"GenericUnitAimExtension",
			"SoundSectorExtension",
		},
		husk_extensions = {
			"AiHuskLocomotionExtension",
			"GenericHitReactionExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"MinionOutlineExtension",
			"DialogueActorExtension",
			"AIUnitFadeExtension",
			"AiHuskBaseExtension",
			"UnitFlowOverrideExtension",
			"AIInventoryExtension",
			"GenericUnitAimExtension",
			"SoundSectorExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AINavigationExtension",
				"AIProximityExtension",
				"BuffExtension",
				"AIGroupMember",
				"DialogueActorExtension",
				"AIVolumeExtension",
				"AISimpleExtension",
				"AILineOfSightExtension",
				"AIEnemySlotExtension",
				"GenericUnitAimExtension",
				"SoundSectorExtension",
			},
			husk_extensions = {
				"AiHuskLocomotionExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension",
				"AiHuskBaseExtension",
				"GenericUnitAimExtension",
				"SoundSectorExtension",
			},
		},
	},
	ai_unit_pet_skeleton_with_shield = {
		go_type = "ai_unit_with_inventory_and_shield",
		self_owned_extensions = {
			ai_locomotion_name,
			"AINavigationExtension",
			"GenericHitReactionExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"MinionOutlineExtension",
			"AIGroupMember",
			"DialogueActorExtension",
			"AIVolumeExtension",
			"AIUnitFadeExtension",
			"AISimpleExtension",
			"UnitFlowOverrideExtension",
			"AILineOfSightExtension",
			"AIInventoryExtension",
			"AIShieldUserExtension",
			"AIEnemySlotExtension",
			"GenericUnitAimExtension",
			"SoundSectorExtension",
		},
		husk_extensions = {
			"AiHuskLocomotionExtension",
			"GenericHitReactionExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"MinionOutlineExtension",
			"DialogueActorExtension",
			"AIUnitFadeExtension",
			"AiHuskBaseExtension",
			"UnitFlowOverrideExtension",
			"AIInventoryExtension",
			"AIShieldUserHuskExtension",
			"GenericUnitAimExtension",
			"SoundSectorExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AINavigationExtension",
				"AIProximityExtension",
				"BuffExtension",
				"AIGroupMember",
				"DialogueActorExtension",
				"AIVolumeExtension",
				"AISimpleExtension",
				"AILineOfSightExtension",
				"AIEnemySlotExtension",
				"GenericUnitAimExtension",
				"SoundSectorExtension",
			},
			husk_extensions = {
				"AiHuskLocomotionExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension",
				"AiHuskBaseExtension",
				"GenericUnitAimExtension",
				"SoundSectorExtension",
			},
		},
	},
	ai_unit_berzerker = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AILineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"GenericUnitAimExtension",
			"PingTargetExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"GenericUnitAimExtension",
			"PingTargetExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AILineOfSightExtension",
				"AIEnemySlotExtension",
				"GenericUnitAimExtension",
			},
			husk_extensions = {
				"GenericUnitAimExtension",
			},
		},
	},
	ai_unit_zombie = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AILineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AILineOfSightExtension",
				"AIEnemySlotExtension",
			},
			husk_extensions = {},
		},
	},
	ai_unit_raider = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AILineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"PingTargetExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AILineOfSightExtension",
				"AIEnemySlotExtension",
			},
			husk_extensions = {},
		},
	},
	ai_unit_loot_rat = {
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			ai_locomotion_name,
			"AINavigationExtension",
			"GenericHitReactionExtension",
			"LootRatHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"AIGroupMember",
			"DialogueActorExtension",
			"AIVolumeExtension",
			"AIInventoryExtension",
			"PingTargetExtension",
			"EnemyOutlineExtension",
			"AIUnitFadeExtension",
			"AISimpleExtension",
		},
		husk_extensions = {
			"AiHuskLocomotionExtension",
			"GenericHitReactionExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
			"BuffExtension",
			"AIProximityExtension",
			"ProjectileLinkerExtension",
			"DialogueActorExtension",
			"AIInventoryExtension",
			"PingTargetExtension",
			"EnemyOutlineExtension",
			"AIUnitFadeExtension",
			"AiHuskBaseExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AINavigationExtension",
				"AIProximityExtension",
				"BuffExtension",
				"AIGroupMember",
				"DialogueActorExtension",
				"AIVolumeExtension",
				"AISimpleExtension",
			},
			husk_extensions = {
				"AiHuskLocomotionExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension",
				"AiHuskBaseExtension",
			},
		},
	},
	ai_unit_rat_ogre = {
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			ai_locomotion_name,
			"AINavigationExtension",
			"GenericHitReactionExtension",
			"AIInventoryExtension",
			"RatOgreHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"AIGroupMember",
			"DialogueActorExtension",
			"AIVolumeExtension",
			"PingTargetExtension",
			"EnemyOutlineExtension",
			"AIUnitFadeExtension",
			"AISimpleExtension",
			"AIEnemySlotExtension",
		},
		husk_extensions = {
			"AiHuskLocomotionExtension",
			"GenericHitReactionExtension",
			"AIInventoryExtension",
			"RatOgreHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"DialogueActorExtension",
			"PingTargetExtension",
			"EnemyOutlineExtension",
			"AIUnitFadeExtension",
			"AiHuskBaseExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AINavigationExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension",
				"AIVolumeExtension",
				"AISimpleExtension",
				"AIEnemySlotExtension",
			},
			husk_extensions = {
				"AiHuskLocomotionExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension",
				"AiHuskBaseExtension",
			},
		},
	},
	ai_unit_chaos_troll = {
		go_type = "ai_unit_chaos_troll",
		self_owned_extensions = {
			ai_locomotion_name,
			"AINavigationExtension",
			"GenericHitReactionExtension",
			"AIInventoryExtension",
			"ChaosTrollHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"AIGroupMember",
			"DialogueActorExtension",
			"AIVolumeExtension",
			"PingTargetExtension",
			"EnemyOutlineExtension",
			"GenericUnitAimExtension",
			"AIUnitFadeExtension",
			"AILineOfSightExtension",
			"AISimpleExtension",
			"GenericUnitAnimationMovementExtension",
			"AIEnemySlotExtension",
		},
		husk_extensions = {
			"AiHuskLocomotionExtension",
			"GenericHitReactionExtension",
			"AIInventoryExtension",
			"ChaosTrollHuskHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"DialogueActorExtension",
			"PingTargetExtension",
			"EnemyOutlineExtension",
			"GenericUnitAimExtension",
			"AIUnitFadeExtension",
			"AiHuskBaseExtension",
			"GenericUnitAnimationMovementExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AINavigationExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension",
				"AIVolumeExtension",
				"AILineOfSightExtension",
				"AISimpleExtension",
				"GenericUnitAnimationMovementExtension",
				"AIEnemySlotExtension",
			},
			husk_extensions = {
				"AiHuskLocomotionExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension",
				"AiHuskBaseExtension",
				"GenericUnitAnimationMovementExtension",
			},
		},
	},
	ai_unit_stormfiend = {
		go_type = "ai_unit_stormfiend",
		self_owned_extensions = {
			ai_locomotion_name,
			"AINavigationExtension",
			"GenericHitReactionExtension",
			"AIInventoryExtension",
			"RatOgreHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"AIGroupMember",
			"DialogueActorExtension",
			"AIVolumeExtension",
			"PingTargetExtension",
			"EnemyOutlineExtension",
			"GenericUnitAimExtension",
			"AIUnitFadeExtension",
			"AILineOfSightExtension",
			"StormfiendBeamExtension",
			"AISimpleExtension",
			"AIEnemySlotExtension",
		},
		husk_extensions = {
			"AiHuskLocomotionExtension",
			"GenericHitReactionExtension",
			"AIInventoryExtension",
			"RatOgreHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"DialogueActorExtension",
			"PingTargetExtension",
			"EnemyOutlineExtension",
			"GenericUnitAimExtension",
			"AIUnitFadeExtension",
			"StormfiendBeamExtension",
			"AiHuskBaseExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AINavigationExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension",
				"AIVolumeExtension",
				"AILineOfSightExtension",
				"StormfiendBeamExtension",
				"AISimpleExtension",
				"AIEnemySlotExtension",
			},
			husk_extensions = {
				"AiHuskLocomotionExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension",
				"StormfiendBeamExtension",
				"AiHuskBaseExtension",
			},
		},
	},
	ai_unit_stormfiend_boss = {
		base_template = "ai_unit_stormfiend",
		go_type = "ai_unit_stormfiend_boss",
		self_owned_extensions = {},
		husk_extensions = {},
	},
	ai_unit_grey_seer = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_grey_seer",
		self_owned_extensions = {
			"PingTargetExtension",
		},
		husk_extensions = {
			"PingTargetExtension",
		},
	},
	ai_unit_chaos_spawn = {
		go_type = "ai_unit",
		self_owned_extensions = {
			ai_locomotion_name,
			"AINavigationExtension",
			"GenericHitReactionExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"AIGroupMember",
			"ProjectileLinkerExtension",
			"DialogueActorExtension",
			"AIVolumeExtension",
			"PingTargetExtension",
			"EnemyOutlineExtension",
			"AIUnitFadeExtension",
			"AISimpleExtension",
			"AIEnemySlotExtension",
		},
		husk_extensions = {
			"AiHuskLocomotionExtension",
			"GenericHitReactionExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"DialogueActorExtension",
			"PingTargetExtension",
			"EnemyOutlineExtension",
			"AIUnitFadeExtension",
			"AiHuskBaseExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AINavigationExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension",
				"AIVolumeExtension",
				"AISimpleExtension",
				"AIEnemySlotExtension",
			},
			husk_extensions = {
				"AiHuskLocomotionExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension",
				"AiHuskBaseExtension",
			},
		},
	},
	ai_unit_gutter_runner = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
		},
	},
	ai_unit_poison_wind_globadier = {
		base_template = "ai_unit_base",
		go_type = "ai_unit",
		self_owned_extensions = {
			"PingTargetExtension",
		},
		husk_extensions = {
			"PingTargetExtension",
		},
	},
	ai_unit_pack_master = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_pack_master",
		self_owned_extensions = {
			"AIInventoryExtension",
			"GenericUnitAimExtension",
			"PingTargetExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"GenericUnitAimExtension",
			"PingTargetExtension",
		},
	},
	ai_unit_ratling_gunner = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_ratling_gunner",
		self_owned_extensions = {
			"AIInventoryExtension",
			"GenericUnitAimExtension",
			"PingTargetExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"GenericUnitAimExtension",
			"PingTargetExtension",
		},
	},
	ai_unit_warpfire_thrower = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_warpfire_thrower",
		self_owned_extensions = {
			"AIInventoryExtension",
			"GenericUnitAimExtension",
			"PingTargetExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"GenericUnitAimExtension",
			"PingTargetExtension",
		},
	},
	ai_unit_chaos_tentacle_sorcerer = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"PingTargetExtension",
			},
			husk_extensions = {
				"PingTargetExtension",
			},
		},
	},
	ai_unit_chaos_corruptor_sorcerer = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
			"CorruptorBeamExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
			"CorruptorBeamExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"PingTargetExtension",
				"CorruptorBeamExtension",
			},
			husk_extensions = {
				"PingTargetExtension",
				"CorruptorBeamExtension",
			},
		},
	},
	ai_unit_curse_corruptor_sorcerer = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
			"CurseCorruptorBeamExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
			"CurseCorruptorBeamExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"PingTargetExtension",
				"CurseCorruptorBeamExtension",
			},
			husk_extensions = {
				"PingTargetExtension",
				"CurseCorruptorBeamExtension",
			},
		},
	},
	ai_unit_chaos_exalted_sorcerer = {
		base_template = "ai_unit_base",
		go_type = "ai_lord_with_inventory",
		self_owned_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"PingTargetExtension",
			},
			husk_extensions = {
				"PingTargetExtension",
			},
		},
	},
	ai_unit_chaos_dummy_sorcerer = {
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"GenericHealthExtension",
			"AIInventoryExtension",
			"GenericHitReactionExtension",
			"GenericDeathExtension",
			"ProjectileLinkerExtension",
			"BuffExtension",
			"AISimpleExtension",
		},
		husk_extensions = {
			"GenericHealthExtension",
			"AIInventoryExtension",
			"GenericHitReactionExtension",
			"GenericDeathExtension",
			"ProjectileLinkerExtension",
			"BuffExtension",
			"AiHuskBaseExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AISimpleExtension",
			},
			husk_extensions = {
				"AiHuskBaseExtension",
			},
		},
	},
	ai_unit_storm_vermin_champion = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AILineOfSightExtension",
			"AIInventoryExtension",
			"PingTargetExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AILineOfSightExtension",
			},
			husk_extensions = {},
		},
	},
	ai_unit_storm_vermin_warlord = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_storm_vermin_warlord",
		self_owned_extensions = {
			"AILineOfSightExtension",
			"AIInventoryExtension",
			"PingTargetExtension",
			"AIShieldUserExtension",
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AILineOfSightExtension",
			},
			husk_extensions = {},
		},
	},
	ai_unit_tentacle = {
		go_type = "ai_unit_tentacle",
		self_owned_extensions = {
			"GenericHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"TentacleSplineExtension",
			"DialogueActorExtension",
			"AISimpleExtension",
		},
		husk_extensions = {
			"GenericHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"TentacleSplineExtension",
			"DialogueActorExtension",
			"AiHuskBaseExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension",
				"AISimpleExtension",
			},
			husk_extensions = {
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension",
				"AiHuskBaseExtension",
			},
		},
	},
	ai_unit_tentacle_portal = {
		go_type = "ai_unit_tentacle_portal",
		self_owned_extensions = {
			"GenericHealthExtension",
			"GenericDeathExtension",
		},
		husk_extensions = {
			"GenericHealthExtension",
			"GenericDeathExtension",
		},
	},
	damage_wave_unit = {
		go_type = "damage_wave_unit",
		self_owned_extensions = {
			"DamageWaveExtension",
		},
		husk_extensions = {
			"DamageWaveHuskExtension",
		},
	},
	damage_blob_unit = {
		go_type = "damage_blob_unit",
		self_owned_extensions = {
			"DamageBlobExtension",
		},
		husk_extensions = {
			"DamageBlobHuskExtension",
		},
	},
	standard_unit = {
		go_type = "standard_unit",
		self_owned_extensions = {
			"BeastmenStandardHealthExtension",
			"GenericDeathExtension",
			"BeastmenStandardExtension",
			"ProjectileLinkerExtension",
			"PingTargetExtension",
			"EnemyOutlineExtension",
		},
		husk_extensions = {
			"BeastmenStandardHealthExtension",
			"GenericDeathExtension",
			"BeastmenStandardExtension",
			"ProjectileLinkerExtension",
			"PingTargetExtension",
			"EnemyOutlineExtension",
		},
	},
	ai_unit_vortex = {
		go_type = "ai_unit_vortex",
		self_owned_extensions = {
			ai_locomotion_name,
			"AINavigationExtension",
			"VortexExtension",
			"AISimpleExtension",
		},
		husk_extensions = {
			"AiHuskLocomotionExtension",
			"VortexHuskExtension",
			"AiHuskBaseExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AINavigationExtension",
				"AISimpleExtension",
			},
			husk_extensions = {
				"AiHuskBaseExtension",
			},
		},
	},
	ai_unit_plague_wave_spawner = {
		go_type = "ai_unit_plague_wave_spawner",
		self_owned_extensions = {
			"InvincibleHealthExtension",
			"AISimpleExtension",
		},
		husk_extensions = {
			"InvincibleHealthExtension",
			"AiHuskBaseExtension",
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AISimpleExtension",
			},
			husk_extensions = {
				"AiHuskBaseExtension",
			},
		},
	},
	ai_inventory_item = {
		go_type = "ai_inventory_item",
		self_owned_extensions = {
			"AIInventoryItemExtension",
		},
	},
	destructible_objective_unit = {
		go_type = "destructible_objective_unit",
		self_owned_extensions = {
			"GenericHealthExtension",
			"GenericHitReactionExtension",
			"GenericDeathExtension",
			"ObjectiveLightOutlineExtension",
		},
		husk_extensions = {
			"GenericHealthExtension",
			"GenericHitReactionExtension",
			"GenericDeathExtension",
			"ObjectiveLightOutlineExtension",
		},
	},
	aoe_unit = {
		go_type = "aoe_unit",
		self_owned_extensions = {
			"AreaDamageExtension",
		},
		husk_extensions = {
			"AreaDamageExtension",
		},
	},
	thorn_bush_unit = {
		go_type = "thorn_bush_unit",
		self_owned_extensions = {
			"AreaDamageExtension",
			"ThornMutatorExtension",
		},
		husk_extensions = {
			"AreaDamageExtension",
			"ThornMutatorExtension",
		},
	},
	shadow_flare_light = {
		go_type = "shadow_flare_light",
		self_owned_extensions = {
			"ShadowFlareExtension",
		},
		husk_extensions = {
			"ShadowFlareExtension",
		},
	},
	aoe_projectile_unit = {
		go_type = "aoe_projectile_unit",
		self_owned_extensions = {
			"ProjectileScriptUnitLocomotionExtension",
			"ProjectileRaycastImpactUnitExtension",
			"GenericImpactProjectileUnitExtension",
			"AreaDamageExtension",
		},
		husk_extensions = {
			"ProjectileScriptUnitLocomotionExtension",
			"GenericImpactProjectileUnitExtension",
			"AreaDamageExtension",
		},
	},
	aoe_projectile_unit_fixed_impact = {
		go_type = "aoe_projectile_unit_fixed_impact",
		self_owned_extensions = {
			"ProjectileScriptUnitLocomotionExtension",
			"ProjectileFixedImpactUnitExtension",
			"GenericImpactProjectileUnitExtension",
			"AreaDamageExtension",
		},
		husk_extensions = {
			"ProjectileScriptUnitLocomotionExtension",
			"GenericImpactProjectileUnitExtension",
			"AreaDamageExtension",
		},
	},
	timed_explosion_unit = {
		go_type = "timed_explosion_unit",
		self_owned_extensions = {
			"TimedExplosionExtension",
		},
		husk_extensions = {
			"TimedExplosionExtension",
		},
	},
	liquid_aoe_unit = {
		go_type = "liquid_aoe_unit",
		self_owned_extensions = {
			"LiquidAreaDamageExtension",
		},
		husk_extensions = {
			"LiquidAreaDamageHuskExtension",
		},
	},
	player_projectile_unit = {
		go_type = "player_projectile_unit",
		self_owned_extensions = {
			"ProjectileScriptUnitLocomotionExtension",
			"PlayerProjectileImpactUnitExtension",
			"PlayerProjectileUnitExtension",
		},
		husk_extensions = {
			"ProjectileScriptUnitLocomotionExtension",
			"PlayerProjectileHuskExtension",
		},
	},
	sticky_projectile_unit = {
		go_type = "sticky_projectile_unit",
		self_owned_extensions = {
			"ProjectileStickyLocomotion",
			"PlayerProjectileImpactUnitExtension",
			"PlayerProjectileUnitExtension",
		},
		husk_extensions = {
			"ProjectileStickyLocomotion",
			"PlayerProjectileHuskExtension",
		},
	},
	prop_projectile_unit = {
		go_type = "prop_projectile_unit",
		self_owned_extensions = {
			"ProjectilePhysicsUnitLocomotionExtension",
		},
		husk_extensions = {
			"ProjectilePhysicsHuskLocomotionExtension",
		},
	},
	vfx_scripted_projectile_unit = {
		go_type = "vfx_scripted_projectile_unit",
		self_owned_extensions = {
			"ProjectileScriptUnitLocomotionExtension",
			"ProjectileLinearSphereSweepImpactUnitExtension",
			"GenericImpactProjectileUnitExtension",
		},
		husk_extensions = {
			"ProjectileScriptUnitLocomotionExtension",
			"ProjectileLinearSphereSweepImpactUnitExtension",
			"GenericImpactProjectileUnitExtension",
		},
	},
	pickup_projectile_unit = {
		go_type = "pickup_projectile_unit",
		self_owned_extensions = {
			"ProjectilePhysicsUnitLocomotionExtension",
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"ObjectiveLightOutlineExtension",
			"LookatTargetExtension",
			"PickupProjectileVolumeExtension",
			"PingTargetExtension",
		},
		husk_extensions = {
			"ProjectilePhysicsHuskLocomotionExtension",
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"ObjectiveLightOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension",
		},
	},
	life_time_pickup_projectile_unit = {
		go_type = "pickup_projectile_unit",
		self_owned_extensions = {
			"ProjectilePhysicsUnitLocomotionExtension",
			"LifeTimePickupUnitExtension",
			"GenericUnitInteractableExtension",
			"ObjectiveLightOutlineExtension",
			"LookatTargetExtension",
			"PickupProjectileVolumeExtension",
			"PingTargetExtension",
		},
		husk_extensions = {
			"ProjectilePhysicsHuskLocomotionExtension",
			"LifeTimePickupUnitExtension",
			"GenericUnitInteractableExtension",
			"ObjectiveLightOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension",
		},
	},
	limited_owned_pickup_projectile_unit = {
		go_type = "limited_owned_pickup_projectile_unit",
		self_owned_extensions = {
			"ProjectilePhysicsUnitLocomotionExtension",
			"LimitedOwnedPickupUnitExtension",
			"GenericUnitInteractableExtension",
			"ObjectiveLightOutlineExtension",
			"LookatTargetExtension",
			"PickupProjectileVolumeExtension",
			"PingTargetExtension",
		},
		husk_extensions = {
			"ProjectilePhysicsHuskLocomotionExtension",
			"LimitedOwnedPickupUnitExtension",
			"GenericUnitInteractableExtension",
			"ObjectiveLightOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension",
		},
	},
	pickup_training_dummy_unit = {
		go_type = "pickup_training_dummy_unit",
		self_owned_extensions = {
			"TrainingDummyHealthExtension",
			"GenericDeathExtension",
			"GenericHitReactionExtension",
			"ProjectileLinkerExtension",
			"ProjectilePhysicsUnitLocomotionExtension",
			"PickupUnitExtension",
			"EnemyOutlineExtension",
			"GenericUnitInteractableExtension",
			"LookatTargetExtension",
			"PickupProjectileVolumeExtension",
			"PingTargetExtension",
			"BuffExtension",
		},
		husk_extensions = {
			"TrainingDummyHealthExtension",
			"GenericDeathExtension",
			"EnemyOutlineExtension",
			"GenericHitReactionExtension",
			"ProjectileLinkerExtension",
			"ProjectilePhysicsHuskLocomotionExtension",
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"LookatTargetExtension",
			"PingTargetExtension",
			"BuffExtension",
		},
	},
	versus_volume_objective_unit = {
		go_type = "versus_volume_objective_unit",
		self_owned_extensions = {
			"VersusVolumeObjectiveExtension",
		},
		husk_extensions = {
			"VersusVolumeObjectiveExtension",
		},
	},
	versus_mission_objective_unit = {
		go_type = "versus_mission_objective_unit",
		self_owned_extensions = {
			"VersusMissionObjectiveExtension",
		},
		husk_extensions = {
			"VersusMissionObjectiveExtension",
		},
	},
	versus_capture_point_objective_unit = {
		go_type = "versus_capture_point_objective_unit",
		self_owned_extensions = {
			"VersusCapturePointObjectiveExtension",
		},
		husk_extensions = {
			"VersusCapturePointObjectiveExtension",
		},
	},
	weave_capture_point_unit = {
		go_type = "weave_capture_point_unit",
		self_owned_extensions = {
			"WeaveCapturePointExtension",
			"ObjectiveUnitExtension",
		},
		husk_extensions = {
			"WeaveCapturePointExtension",
			"ObjectiveUnitExtension",
		},
	},
	weave_target_unit = {
		go_type = "weave_target_unit",
		self_owned_extensions = {
			"TargetHealthExtension",
			"ObjectiveUnitExtension",
			"WeaveTargetExtension",
		},
		husk_extensions = {
			"TargetHealthExtension",
			"ObjectiveUnitExtension",
			"WeaveTargetExtension",
		},
	},
	weave_doom_wheel = {
		go_type = "weave_doom_wheel_unit",
		self_owned_extensions = {
			"ObjectiveSocketTutorialExtension",
			"WeaveDoomWheelExtension",
			"ObjectiveSocketUnitExtension",
		},
		husk_extensions = {
			"ObjectiveSocketTutorialExtension",
			"WeaveDoomWheelExtension",
			"ObjectiveSocketUnitExtension",
		},
	},
	weave_interaction_unit = {
		go_type = "weave_interaction_unit",
		self_owned_extensions = {
			"ObjectiveUnitExtension",
			"GenericUnitInteractableExtension",
			"WeaveInteractionExtension",
		},
		husk_extensions = {
			"ObjectiveUnitExtension",
			"GenericUnitInteractableExtension",
			"WeaveInteractionExtension",
		},
	},
	weave_kill_enemies_unit = {
		go_type = "weave_kill_enemies_unit",
		self_owned_extensions = {
			"WeaveKillEnemiesExtension",
		},
		husk_extensions = {
			"WeaveKillEnemiesExtension",
		},
	},
	pickup_torch_unit_init = {
		go_type = "pickup_torch_unit_init",
		self_owned_extensions = {
			"ProjectilePhysicsUnitLocomotionExtension",
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"ObjectiveLightOutlineExtension",
			"LookatTargetExtension",
			"PickupProjectileVolumeExtension",
			"PingTargetExtension",
			"LightSourceExtension",
		},
		husk_extensions = {
			"ProjectilePhysicsHuskLocomotionExtension",
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"ObjectiveLightOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension",
			"LightSourceExtension",
		},
	},
	pickup_torch_unit = {
		go_type = "pickup_torch_unit",
		self_owned_extensions = {
			"ProjectilePhysicsUnitLocomotionExtension",
			"PlayerTeleportingPickupExtension",
			"GenericUnitInteractableExtension",
			"ObjectiveLightOutlineExtension",
			"LookatTargetExtension",
			"PickupProjectileVolumeExtension",
			"PingTargetExtension",
			"LightSourceExtension",
		},
		husk_extensions = {
			"ProjectilePhysicsHuskLocomotionExtension",
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"ObjectiveLightOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension",
			"LightSourceExtension",
		},
	},
	pickup_projectile_unit_limited = {
		go_type = "pickup_projectile_unit_limited",
		self_owned_extensions = {
			"ObjectivePickupTutorialExtension",
			"ProjectilePhysicsUnitLocomotionExtension",
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"ObjectiveLightOutlineExtension",
			"LookatTargetExtension",
			"PickupProjectileVolumeExtension",
			"LimitedItemExtension",
			"PingTargetExtension",
		},
		husk_extensions = {
			"ObjectivePickupTutorialExtension",
			"ProjectilePhysicsHuskLocomotionExtension",
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"ObjectiveLightOutlineExtension",
			"LookatTargetExtension",
			"LimitedItemExtension",
			"PingTargetExtension",
		},
	},
	explosive_pickup_projectile_unit = {
		go_type = "explosive_pickup_projectile_unit",
		self_owned_extensions = {
			"ProjectilePhysicsUnitLocomotionExtension",
			"ExplosiveBarrelHealthExtension",
			"GenericDeathExtension",
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"PickupOutlineExtension",
			"LookatTargetExtension",
			"ProjectileLinkerExtension",
			"PickupProjectileVolumeExtension",
			"PingTargetExtension",
		},
		husk_extensions = {
			"ProjectilePhysicsHuskLocomotionExtension",
			"ExplosiveBarrelHealthExtension",
			"GenericDeathExtension",
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"PickupOutlineExtension",
			"LookatTargetExtension",
			"ProjectileLinkerExtension",
			"PingTargetExtension",
		},
	},
	interaction_unit = {
		go_type = "prop_unit",
		self_owned_extensions = {
			"GenericUnitInteractableExtension",
			"GenericOutlineExtension",
		},
		husk_extensions = {
			"GenericUnitInteractableExtension",
			"GenericOutlineExtension",
		},
	},
	objective_unit = {
		go_type = "objective_unit",
		self_owned_extensions = {
			"ObjectiveUnitExtension",
		},
		husk_extensions = {
			"ObjectiveUnitExtension",
		},
	},
	nurgle_liquid_blob = {
		go_type = "prop_unit",
		self_owned_extensions = {
			"GenericHealthExtension",
			"GenericDeathExtension",
			"ProjectileLinkerExtension",
			"GenericHitReactionExtension",
		},
		husk_extensions = {
			"GenericHealthExtension",
			"GenericDeathExtension",
			"ProjectileLinkerExtension",
			"GenericHitReactionExtension",
		},
		remove_when_killed = {
			"GenericDeathExtension",
			"ProjectileLinkerExtension",
		},
	},
	explosive_pickup_projectile_unit_limited = {
		go_type = "explosive_pickup_projectile_unit_limited",
		self_owned_extensions = {
			"ObjectivePickupTutorialExtension",
			"ProjectilePhysicsUnitLocomotionExtension",
			"ExplosiveBarrelHealthExtension",
			"GenericDeathExtension",
			"LimitedItemExtension",
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"ObjectiveLightOutlineExtension",
			"LookatTargetExtension",
			"ProjectileLinkerExtension",
			"PickupProjectileVolumeExtension",
			"PingTargetExtension",
		},
		husk_extensions = {
			"ObjectivePickupTutorialExtension",
			"ProjectilePhysicsHuskLocomotionExtension",
			"ExplosiveBarrelHealthExtension",
			"GenericDeathExtension",
			"LimitedItemExtension",
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"ObjectiveLightOutlineExtension",
			"LookatTargetExtension",
			"ProjectileLinkerExtension",
			"PingTargetExtension",
		},
	},
	true_flight_projectile_unit = {
		go_type = "true_flight_projectile_unit",
		self_owned_extensions = {
			"ProjectileTrueFlightLocomotionExtension",
			"ProjectileRaycastImpactUnitExtension",
			"PlayerProjectileUnitExtension",
		},
		husk_extensions = {
			"ProjectileTrueFlightLocomotionExtension",
			"PlayerProjectileHuskExtension",
		},
	},
	ai_true_flight_projectile_unit = {
		go_type = "ai_true_flight_projectile_unit",
		self_owned_extensions = {
			"ProjectileTrueFlightLocomotionExtension",
			"ProjectileRaycastImpactUnitExtension",
			"GenericImpactProjectileUnitExtension",
		},
		husk_extensions = {
			"ProjectileTrueFlightLocomotionExtension",
			"GenericImpactProjectileUnitExtension",
		},
	},
	ai_true_flight_killable_projectile_unit = {
		go_type = "ai_true_flight_killable_projectile_unit",
		self_owned_extensions = {
			"ProjectileTrueFlightLocomotionExtension",
			"ProjectileRaycastImpactUnitExtension",
			"GenericImpactProjectileUnitExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
		},
		husk_extensions = {
			"ProjectileTrueFlightLocomotionExtension",
			"GenericImpactProjectileUnitExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
		},
	},
	ai_true_flight_projectile_unit_without_raycast = {
		go_type = "ai_true_flight_projectile_unit_without_raycast",
		self_owned_extensions = {
			"ProjectileTrueFlightLocomotionExtension",
			"GenericImpactProjectileUnitExtension",
		},
		husk_extensions = {
			"ProjectileTrueFlightLocomotionExtension",
			"GenericImpactProjectileUnitExtension",
		},
	},
	overpowering_blob_unit = {
		go_type = "overpowering_blob_unit",
		self_owned_extensions = {
			"OverpoweredBlobHealthExtension",
			"GenericDeathExtension",
		},
		husk_extensions = {
			"GenericHealthExtension",
			"GenericDeathExtension",
		},
	},
	prop_unit = {
		go_type = "prop_unit",
		self_owned_extensions = {},
		husk_extensions = {},
	},
	positioned_prop_unit = {
		go_type = "positioned_prop_unit",
		self_owned_extensions = {},
		husk_extensions = {},
	},
	network_synched_dummy_unit = {
		go_type = "network_synched_dummy_unit",
		self_owned_extensions = {},
		husk_extensions = {},
	},
	position_synched_dummy_unit = {
		go_type = "position_synched_dummy_unit",
		self_owned_extensions = {
			"UnitSynchronizationExtension",
		},
		husk_extensions = {
			"UnitSynchronizationExtension",
		},
	},
	position_synched_light_unit = {
		go_type = "position_synched_dummy_unit",
		self_owned_extensions = {
			"UnitSynchronizationExtension",
			"LightSourceExtension",
		},
		husk_extensions = {
			"UnitSynchronizationExtension",
			"LightSourceExtension",
		},
	},
	buff_aoe_unit = {
		go_type = "buff_aoe_unit",
		self_owned_extensions = {
			"BuffAreaExtension",
		},
		husk_extensions = {},
	},
	buff_unit = {
		go_type = "buff_unit",
		self_owned_extensions = {
			"BuffExtension",
		},
		husk_extensions = {
			"BuffExtension",
		},
	},
	thrown_weapon_unit = {
		go_type = "thrown_weapon_unit",
		self_owned_extensions = {},
		husk_extensions = {
			"ThrownUnitHuskExtension",
		},
	},
	camera_unit = {
		self_owned_extensions = {
			"GenericCameraExtension",
			"GenericCameraStateMachineExtension",
		},
	},
	navgraphconnector = {
		self_owned_extensions = {
			"NavGraphConnectorExtension",
		},
		husk_extensions = {},
	},
	pickup_unit = {
		go_type = "pickup_unit",
		self_owned_extensions = {
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"PickupOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension",
		},
		husk_extensions = {
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"PickupOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension",
		},
	},
	conditional_pickup_unit = {
		go_type = "pickup_unit",
		self_owned_extensions = {
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"ConditionalPickupOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension",
		},
		husk_extensions = {
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"ConditionalPickupOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension",
		},
	},
	life_time_pickup_unit = {
		go_type = "pickup_unit",
		self_owned_extensions = {
			"LifeTimePickupUnitExtension",
			"GenericUnitInteractableExtension",
			"PickupOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension",
		},
		husk_extensions = {
			"LifeTimePickupUnitExtension",
			"GenericUnitInteractableExtension",
			"PickupOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension",
		},
	},
	limited_owned_pickup_unit = {
		go_type = "limited_owned_pickup_unit",
		self_owned_extensions = {
			"LimitedOwnedPickupUnitExtension",
			"GenericUnitInteractableExtension",
			"PickupOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension",
		},
		husk_extensions = {
			"LimitedOwnedPickupUnitExtension",
			"GenericUnitInteractableExtension",
			"PickupOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension",
		},
	},
	battle_chatter_unit = {
		self_owned_extensions = {
			"LookatTargetExtension",
		},
		husk_extensions = {
			"LookatTargetExtension",
		},
	},
	weapon_unit_3p = {
		self_owned_extensions = {
			"HuskWeaponUnitExtension",
		},
	},
	torch_unit_3p = {
		self_owned_extensions = {
			"LightSourceExtension",
		},
		husk_extensions = {
			"LightSourceExtension",
		},
	},
	weapon_unit = {
		self_owned_extensions = {
			"WeaponUnitExtension",
		},
	},
	single_weapon_unit = {
		self_owned_extensions = {
			"SingleWeaponUnitExtension",
		},
		husk_extensions = {
			"SingleWeaponUnitExtension",
		},
	},
	weapon_unit_spread = {
		self_owned_extensions = {
			"WeaponUnitExtension",
			"WeaponSpreadExtension",
		},
	},
	weapon_unit_ammo = {
		self_owned_extensions = {
			"WeaponUnitExtension",
			"GenericAmmoUserExtension",
		},
	},
	weapon_unit_ammo_limited = {
		self_owned_extensions = {
			"WeaponUnitExtension",
			"GenericAmmoUserExtension",
			"HeldLimitedItemExtension",
		},
	},
	weapon_unit_ammo_spread = {
		self_owned_extensions = {
			"WeaponUnitExtension",
			"GenericAmmoUserExtension",
			"WeaponSpreadExtension",
		},
	},
	explosive_weapon_unit_ammo = {
		self_owned_extensions = {
			"WeaponUnitExtension",
			"GenericAmmoUserExtension",
			"ExplosiveBarrelHealthExtension",
			"GenericDeathExtension",
		},
	},
	explosive_weapon_unit_ammo_limited = {
		self_owned_extensions = {
			"WeaponUnitExtension",
			"GenericAmmoUserExtension",
			"HeldLimitedItemExtension",
			"ExplosiveBarrelHealthExtension",
			"GenericDeathExtension",
		},
	},
	weapon_unit_aim = {
		self_owned_extensions = {
			"WeaponUnitExtension",
			"GenericUnitAimExtension",
		},
		husk_extensions = {
			"GenericUnitAimExtension",
		},
	},
	ai_weapon_unit = {
		go_type = "ai_inventory_item",
		self_owned_extensions = {
			"AIInventoryItemExtension",
			"AiWeaponUnitExtension",
		},
	},
	ai_shield_unit = {
		go_type = "ai_inventory_item",
		self_owned_extensions = {
			"AIInventoryItemExtension",
			"ProjectileLinkerExtension",
		},
	},
	ai_helmet_unit = {
		go_type = "ai_inventory_item",
		self_owned_extensions = {
			"AIInventoryItemExtension",
			"ProjectileLinkerExtension",
		},
	},
	ai_outfit_unit = {
		go_type = "ai_inventory_item",
		self_owned_extensions = {
			"AIInventoryItemExtension",
		},
	},
	ai_inventory_unit = {
		go_type = "ai_inventory_item",
		self_owned_extensions = {
			"AIInventoryItemExtension",
			"ProjectileLinkerExtension",
		},
	},
	dynamic_gib_unit = {
		go_type = "dynamic_gib_unit",
		self_owned_extensions = {
			"ProjectileLinkerExtension",
		},
	},
	limited_item_track_spawner = {
		self_owned_extensions = {},
		self_owned_extensions_server = {
			"LimitedItemTrackSpawner",
		},
		husk_extensions = {},
		husk_extension_server = {},
	},
	weave_limited_item_track_spawner = {
		self_owned_extensions = {
			"WeaveLimitedItemSpawnerExtension",
		},
		self_owned_extensions_server = {
			"WeaveLimitedItemTrackSpawner",
			"WeaveLimitedItemSpawnerExtension",
		},
		husk_extensions = {},
		husk_extension_server = {},
	},
	interest_point = {
		go_type = "interest_point_unit",
		self_owned_extensions = {
			"AIInterestPointHuskExtension",
		},
		self_owned_extensions_server = {
			"AIInterestPointExtension",
		},
		husk_extensions = {
			"AIInterestPointHuskExtension",
		},
		husk_extension_server = {},
	},
	interest_point_level = {
		base_template = "interest_point",
		go_type = "interest_point_level_unit",
		self_owned_extensions_server = {},
		self_owned_extensions = {},
		husk_extensions = {},
	},
	base_level_unit = {
		go_type = "base_level_unit",
	},
	lure_unit = {
		go_type = "lure_unit",
		self_owned_extensions_server = {
			"LureHealthExtension",
			"GenericDeathExtension",
			"LureWhereaboutsExtension",
			"AIAggroableSlotExtension",
			"GenericAggroableExtension",
		},
		husk_extensions = {
			"LureHealthExtension",
			"GenericDeathExtension",
		},
	},
	rotating_hazard = {
		go_type = "rotating_hazard",
		self_owned_extensions = {
			"RotatingHazardExtension",
		},
		husk_extensions = {
			"RotatingHazardExtension",
		},
	},
	dialogue_node = {
		go_type = "dialogue_node",
		self_owned_extensions = {
			"DialogueActorExtension",
			"GlobalObserverExtension",
		},
		husk_extensions = {
			"DialogueActorExtension",
			"GlobalObserverExtension",
		},
	},
}

DLCUtils.map_list("unit_extension_templates", function (file)
	table.merge(unit_templates, dofile(file))
end)

local extension_table_names = {
	"self_owned_extensions",
	"self_owned_extensions_server",
	"husk_extensions",
	"husk_extensions_server",
}
local extension_table_names_n = #extension_table_names

for unit_template_name, template_data in pairs(unit_templates) do
	template_data.NAME = unit_template_name

	for i = 1, extension_table_names_n do
		local extension_table_name = extension_table_names[i]
		local extension_list = template_data[extension_table_name] or {}
		local extension_list_n = #extension_list

		if template_data.base_template ~= nil then
			local inherited_template_name = template_data.base_template
			local inherited_template_data = unit_templates[inherited_template_name]

			assert(inherited_template_data.base_template == nil, "%s tried to inherit from template that had a base_template", unit_template_name)

			local inherited_extension_list = inherited_template_data[extension_table_name]

			if inherited_extension_list then
				inherited_extension_list_n = #inherited_extension_list

				for j = 1, inherited_extension_list_n do
					extension_list_n = extension_list_n + 1
					extension_list[extension_list_n] = inherited_extension_list[j]
				end
			end

			local inherited_remove_when_killed = inherited_template_data.remove_when_killed and inherited_template_data.remove_when_killed[extension_table_name]

			if inherited_remove_when_killed then
				if template_data.remove_when_killed == nil then
					template_data.remove_when_killed = {}
				end

				if template_data.remove_when_killed[extension_table_name] == nil then
					template_data.remove_when_killed[extension_table_name] = {}
				end

				for j = 1, #inherited_remove_when_killed do
					local remove_when_killed = template_data.remove_when_killed[extension_table_name]

					remove_when_killed[#remove_when_killed + 1] = inherited_remove_when_killed[j]
				end
			end
		end

		template_data["num_" .. extension_table_name] = extension_list_n

		local remove_when_killed = template_data.remove_when_killed

		if remove_when_killed then
			for i = 1, extension_table_names_n do
				local extension_table_name = extension_table_names[i]
				local extension_list = remove_when_killed[extension_table_name]

				if extension_list then
					remove_when_killed["num_" .. extension_table_name] = #extension_list
				end
			end
		end
	end
end

unit_templates.get_extensions = function (unit_template_name, is_husk, is_server)
	local extensions, num_extensions
	local template = unit_templates[unit_template_name]

	if is_husk then
		if is_server and template.husk_extensions_server then
			extensions, num_extensions = template.husk_extensions_server, template.num_husk_extensions_server
		else
			extensions, num_extensions = template.husk_extensions, template.num_husk_extensions
		end
	elseif is_server and template.self_owned_extensions_server then
		extensions, num_extensions = template.self_owned_extensions_server, template.num_self_owned_extensions_server
	else
		extensions, num_extensions = template.self_owned_extensions, template.num_self_owned_extensions
	end

	return extensions, num_extensions
end

unit_templates.extensions_to_remove_on_death = function (unit_template_name, is_husk, is_server)
	local extensions, num_extensions
	local remove_when_killed = unit_templates[unit_template_name].remove_when_killed

	if remove_when_killed == nil then
		return nil
	end

	if is_husk then
		if is_server and remove_when_killed.husk_extensions_server then
			extensions, num_extensions = remove_when_killed.husk_extensions_server, remove_when_killed.num_husk_extensions_server
		else
			extensions, num_extensions = remove_when_killed.husk_extensions, remove_when_killed.num_husk_extensions
		end
	elseif is_server and remove_when_killed.self_owned_extensions_server then
		extensions, num_extensions = remove_when_killed.self_owned_extensions_server, remove_when_killed.num_self_owned_extensions_server
	else
		extensions, num_extensions = remove_when_killed.self_owned_extensions, remove_when_killed.num_self_owned_extensions
	end

	return extensions, num_extensions
end

return unit_templates
