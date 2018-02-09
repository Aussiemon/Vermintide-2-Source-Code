local ai_locomotion_name = (_G.GameSettingsDevelopment and GameSettingsDevelopment.use_engine_optimized_ai_locomotion and "AILocomotionExtensionC") or "AILocomotionExtension"
local unit_templates = {
	player_unit_3rd = {
		go_type = "player_unit",
		self_owned_extensions = {
			"PlayerInputExtension",
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
			"PlayerEyeTrackingExtension",
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
			"PlayerSoundEffectExtension"
		},
		self_owned_extensions_server = {
			"PlayerInputExtension",
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
			"PlayerEyeTrackingExtension",
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
			"PlayerSoundEffectExtension"
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
			"PlayerUnitCosmeticExtension",
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
			"PlayerUnitDarknessExtension"
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
			"PlayerUnitCosmeticExtension",
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
			"PlayerUnitDarknessExtension"
		}
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
			"PlayerSoundEffectExtension"
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
			"PlayerSoundEffectExtension"
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
			"PlayerUnitDarknessExtension"
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
			"PlayerUnitDarknessExtension"
		}
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
			"CareerExtension",
			"SimpleInventoryExtension",
			"GenericUnitInteractorExtension",
			"GenericUnitInteractableExtension",
			"PlayerUnitHealthExtension",
			"GenericStatusExtension",
			"GenericHitReactionExtension",
			"GenericDeathExtension",
			"PlayerUnitLocomotionExtension",
			"PlayerBotUnitFirstPerson",
			"GenericUnitAimExtension",
			"PlayerUnitAttachmentExtension",
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
			"PlayerUnitCosmeticExtension",
			"PlayerUnitOverchargeExtension"
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
			"PlayerUnitCosmeticExtension",
			"PlayerUnitDarknessExtension"
		}
	},
	ai_pet_unit = {
		go_type = "ai_unit",
		self_owned_extensions = {
			"AISimpleExtension",
			ai_locomotion_name,
			"AINavigationExtension",
			"InvincibleHealthExtension"
		},
		husk_extensions = {
			"AiHuskBaseExtension",
			"AiHuskLocomotionExtension",
			"InvincibleHealthExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AISimpleExtension",
				"AINavigationExtension"
			},
			husk_extensions = {
				"AiHuskBaseExtension",
				"AiHuskLocomotionExtension"
			}
		}
	},
	ai_unit_base = {
		go_type = "ai_unit",
		self_owned_extensions = {
			"AISimpleExtension",
			ai_locomotion_name,
			"AINavigationExtension",
			"GenericHitReactionExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"SoundSectorExtension",
			"ProjectileLinkerExtension",
			"EnemyOutlineExtension",
			"AIGroupMember",
			"DialogueActorExtension",
			"AIVolumeExtension",
			"AIUnitFadeExtension"
		},
		husk_extensions = {
			"AiHuskBaseExtension",
			"AiHuskLocomotionExtension",
			"GenericHitReactionExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"SoundSectorExtension",
			"ProjectileLinkerExtension",
			"EnemyOutlineExtension",
			"DialogueActorExtension",
			"AIUnitFadeExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AISimpleExtension",
				"AINavigationExtension",
				"AIProximityExtension",
				"BuffExtension",
				"SoundSectorExtension",
				"AIGroupMember",
				"DialogueActorExtension",
				"AIVolumeExtension"
			},
			husk_extensions = {
				"AiHuskBaseExtension",
				"AiHuskLocomotionExtension",
				"AIProximityExtension",
				"BuffExtension",
				"SoundSectorExtension",
				"DialogueActorExtension"
			}
		}
	},
	ai_unit = {
		base_template = "ai_unit_base",
		go_type = "ai_unit",
		self_owned_extensions = {},
		husk_extensions = {}
	},
	ai_unit_critter = {
		go_type = "ai_unit",
		self_owned_extensions = {
			"AISimpleExtension",
			ai_locomotion_name,
			"AINavigationExtension",
			"GenericHitReactionExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"DialogueActorExtension",
			"AIVolumeExtension"
		},
		husk_extensions = {
			"AiHuskBaseExtension",
			"AiHuskLocomotionExtension",
			"GenericHitReactionExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"DialogueActorExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AISimpleExtension",
				"AINavigationExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension",
				"AIVolumeExtension"
			},
			husk_extensions = {
				"AiHuskBaseExtension",
				"AiHuskLocomotionExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension"
			}
		}
	},
	ai_unit_storm_vermin = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AIMeleeLineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"PingTargetExtension"
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AIMeleeLineOfSightExtension",
				"AIEnemySlotExtension"
			},
			husk_extensions = {}
		}
	},
	ai_unit_chaos_warrior = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory_and_target",
		self_owned_extensions = {
			"AIMeleeLineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"PingTargetExtension",
			"GenericUnitAimExtension"
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
			"GenericUnitAimExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AIMeleeLineOfSightExtension",
				"AIEnemySlotExtension",
				"GenericUnitAimExtension"
			},
			husk_extensions = {
				"GenericUnitAimExtension"
			}
		}
	},
	ai_unit_chaos_exalted_champion = {
		base_template = "ai_unit_base",
		go_type = "ai_lord_with_inventory_and_target",
		self_owned_extensions = {
			"AIMeleeLineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"PingTargetExtension",
			"GenericUnitAimExtension"
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
			"GenericUnitAimExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AIMeleeLineOfSightExtension",
				"AIEnemySlotExtension",
				"GenericUnitAimExtension"
			},
			husk_extensions = {
				"GenericUnitAimExtension"
			}
		}
	},
	ai_unit_clan_rat = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AIMeleeLineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension"
		},
		husk_extensions = {
			"AIInventoryExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AIMeleeLineOfSightExtension",
				"AIEnemySlotExtension"
			},
			husk_extensions = {}
		}
	},
	ai_unit_shield_rat = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory_and_shield",
		self_owned_extensions = {
			"AIMeleeLineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"AIShieldUserExtension"
		},
		husk_extensions = {
			"AIInventoryExtension",
			"AIShieldUserHuskExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AIMeleeLineOfSightExtension",
				"AIEnemySlotExtension"
			},
			husk_extensions = {}
		}
	},
	ai_unit_plague_monk = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AIMeleeLineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"PingTargetExtension"
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AIMeleeLineOfSightExtension",
				"AIEnemySlotExtension"
			},
			husk_extensions = {}
		}
	},
	ai_unit_shield_marauder = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory_and_shield_and_target",
		self_owned_extensions = {
			"AIMeleeLineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"AIShieldUserExtension",
			"GenericUnitAimExtension"
		},
		husk_extensions = {
			"AIInventoryExtension",
			"AIShieldUserHuskExtension",
			"GenericUnitAimExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AIMeleeLineOfSightExtension",
				"AIEnemySlotExtension",
				"GenericUnitAimExtension"
			},
			husk_extensions = {
				"GenericUnitAimExtension"
			}
		}
	},
	ai_unit_shield_vermin = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory_and_shield",
		self_owned_extensions = {
			"AIMeleeLineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"PingTargetExtension",
			"AIShieldUserExtension"
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
			"AIShieldUserHuskExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AIMeleeLineOfSightExtension",
				"AIEnemySlotExtension"
			},
			husk_extensions = {}
		}
	},
	ai_unit_marauder = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory_and_target",
		self_owned_extensions = {
			"AIMeleeLineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"GenericUnitAimExtension"
		},
		husk_extensions = {
			"AIInventoryExtension",
			"GenericUnitAimExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AIMeleeLineOfSightExtension",
				"AIEnemySlotExtension",
				"GenericUnitAimExtension"
			},
			husk_extensions = {
				"GenericUnitAimExtension"
			}
		}
	},
	ai_unit_berzerker = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory_and_target",
		self_owned_extensions = {
			"AIMeleeLineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"GenericUnitAimExtension",
			"PingTargetExtension"
		},
		husk_extensions = {
			"AIInventoryExtension",
			"GenericUnitAimExtension",
			"PingTargetExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AIMeleeLineOfSightExtension",
				"AIEnemySlotExtension",
				"GenericUnitAimExtension"
			},
			husk_extensions = {
				"GenericUnitAimExtension"
			}
		}
	},
	ai_unit_zombie = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AIMeleeLineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension"
		},
		husk_extensions = {
			"AIInventoryExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AIMeleeLineOfSightExtension",
				"AIEnemySlotExtension"
			},
			husk_extensions = {}
		}
	},
	ai_unit_raider = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AIMeleeLineOfSightExtension",
			"AIInventoryExtension",
			"AIEnemySlotExtension",
			"PingTargetExtension"
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AIMeleeLineOfSightExtension",
				"AIEnemySlotExtension"
			},
			husk_extensions = {}
		}
	},
	ai_unit_loot_rat = {
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AISimpleExtension",
			ai_locomotion_name,
			"AINavigationExtension",
			"GenericHitReactionExtension",
			"LootRatHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"SoundSectorExtension",
			"ProjectileLinkerExtension",
			"AIGroupMember",
			"DialogueActorExtension",
			"AIVolumeExtension",
			"AIInventoryExtension",
			"PingTargetExtension",
			"EnemyOutlineExtension",
			"AIUnitFadeExtension"
		},
		husk_extensions = {
			"AiHuskBaseExtension",
			"AiHuskLocomotionExtension",
			"GenericHitReactionExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
			"BuffExtension",
			"AIProximityExtension",
			"SoundSectorExtension",
			"ProjectileLinkerExtension",
			"DialogueActorExtension",
			"AIInventoryExtension",
			"PingTargetExtension",
			"EnemyOutlineExtension",
			"AIUnitFadeExtension"
		}
	},
	ai_unit_rat_ogre = {
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AISimpleExtension",
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
			"SoundSectorExtension",
			"AIUnitFadeExtension"
		},
		husk_extensions = {
			"AiHuskBaseExtension",
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
			"SoundSectorExtension",
			"AIUnitFadeExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AISimpleExtension",
				"AINavigationExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension",
				"AIVolumeExtension"
			},
			husk_extensions = {
				"AiHuskBaseExtension",
				"AiHuskLocomotionExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension"
			}
		}
	},
	ai_unit_chaos_troll = {
		go_type = "ai_unit_with_inventory_and_target",
		self_owned_extensions = {
			"AISimpleExtension",
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
			"SoundSectorExtension",
			"AIUnitFadeExtension"
		},
		husk_extensions = {
			"AiHuskBaseExtension",
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
			"SoundSectorExtension",
			"AIUnitFadeExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AISimpleExtension",
				"AINavigationExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension",
				"AIVolumeExtension"
			},
			husk_extensions = {
				"AiHuskBaseExtension",
				"AiHuskLocomotionExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension"
			}
		}
	},
	ai_unit_stormfiend = {
		go_type = "ai_unit_stormfiend",
		self_owned_extensions = {
			"AISimpleExtension",
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
			"SoundSectorExtension",
			"AIUnitFadeExtension",
			"AIMeleeLineOfSightExtension",
			"StormfiendBeamExtension"
		},
		husk_extensions = {
			"AiHuskBaseExtension",
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
			"SoundSectorExtension",
			"AIUnitFadeExtension",
			"StormfiendBeamExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AISimpleExtension",
				"AINavigationExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension",
				"AIVolumeExtension",
				"AIMeleeLineOfSightExtension",
				"StormfiendBeamExtension"
			},
			husk_extensions = {
				"AiHuskBaseExtension",
				"AiHuskLocomotionExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension",
				"StormfiendBeamExtension"
			}
		}
	},
	ai_unit_stormfiend_boss = {
		go_type = "ai_unit_stormfiend_boss",
		base_template = "ai_unit_stormfiend",
		self_owned_extensions = {},
		husk_extensions = {}
	},
	ai_unit_grey_seer = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_grey_seer",
		self_owned_extensions = {
			"PingTargetExtension"
		},
		husk_extensions = {
			"PingTargetExtension"
		}
	},
	ai_unit_chaos_spawn = {
		go_type = "ai_unit",
		self_owned_extensions = {
			"AISimpleExtension",
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
			"PingTargetExtension",
			"EnemyOutlineExtension",
			"SoundSectorExtension",
			"AIUnitFadeExtension"
		},
		husk_extensions = {
			"AiHuskBaseExtension",
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
			"SoundSectorExtension",
			"AIUnitFadeExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AISimpleExtension",
				"AINavigationExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension",
				"AIVolumeExtension"
			},
			husk_extensions = {
				"AiHuskBaseExtension",
				"AiHuskLocomotionExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension"
			}
		}
	},
	ai_unit_gutter_runner = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension"
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension"
		}
	},
	ai_unit_poison_wind_globadier = {
		base_template = "ai_unit_base",
		go_type = "ai_unit",
		self_owned_extensions = {
			"PingTargetExtension"
		},
		husk_extensions = {
			"PingTargetExtension"
		}
	},
	ai_unit_pack_master = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_pack_master",
		self_owned_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension"
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension"
		}
	},
	ai_unit_ratling_gunner = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_ratling_gunner",
		self_owned_extensions = {
			"AIInventoryExtension",
			"GenericUnitAimExtension",
			"PingTargetExtension"
		},
		husk_extensions = {
			"AIInventoryExtension",
			"GenericUnitAimExtension",
			"PingTargetExtension"
		}
	},
	ai_unit_warpfire_thrower = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_warpfire_thrower",
		self_owned_extensions = {
			"AIInventoryExtension",
			"GenericUnitAimExtension",
			"PingTargetExtension"
		},
		husk_extensions = {
			"AIInventoryExtension",
			"GenericUnitAimExtension",
			"PingTargetExtension"
		}
	},
	ai_unit_chaos_tentacle_sorcerer = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension"
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"PingTargetExtension",
				"GenericHitReactionExtension"
			},
			husk_extensions = {
				"PingTargetExtension",
				"GenericHitReactionExtension"
			}
		}
	},
	ai_unit_chaos_corruptor_sorcerer = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
			"CorruptorBeamExtension"
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
			"CorruptorBeamExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"PingTargetExtension",
				"CorruptorBeamExtension",
				"GenericHitReactionExtension"
			},
			husk_extensions = {
				"PingTargetExtension",
				"CorruptorBeamExtension",
				"GenericHitReactionExtension"
			}
		}
	},
	ai_unit_chaos_exalted_sorcerer = {
		base_template = "ai_unit_base",
		go_type = "ai_lord_with_inventory_and_target",
		self_owned_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension"
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"PingTargetExtension",
				"GenericHitReactionExtension"
			},
			husk_extensions = {
				"PingTargetExtension",
				"GenericHitReactionExtension"
			}
		}
	},
	ai_unit_chaos_dummy_sorcerer = {
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AISimpleExtension",
			"GenericHealthExtension",
			"AIInventoryExtension",
			"GenericHitReactionExtension",
			"GenericDeathExtension",
			"ProjectileLinkerExtension",
			"BuffExtension"
		},
		husk_extensions = {
			"AiHuskBaseExtension",
			"GenericHealthExtension",
			"AIInventoryExtension",
			"GenericHitReactionExtension",
			"GenericDeathExtension",
			"ProjectileLinkerExtension",
			"BuffExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AISimpleExtension"
			},
			husk_extensions = {
				"AiHuskBaseExtension"
			}
		}
	},
	ai_unit_storm_vermin_champion = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_with_inventory",
		self_owned_extensions = {
			"AIMeleeLineOfSightExtension",
			"AIInventoryExtension",
			"PingTargetExtension"
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AIMeleeLineOfSightExtension"
			},
			husk_extensions = {}
		}
	},
	ai_unit_storm_vermin_warlord = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_storm_vermin_warlord",
		self_owned_extensions = {
			"AIMeleeLineOfSightExtension",
			"AIInventoryExtension",
			"PingTargetExtension",
			"AIShieldUserExtension"
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AIMeleeLineOfSightExtension"
			},
			husk_extensions = {}
		}
	},
	ai_unit_tentacle = {
		go_type = "ai_unit_tentacle",
		self_owned_extensions = {
			"AISimpleExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"ProjectileLinkerExtension",
			"TentacleSplineExtension",
			"DialogueActorExtension"
		},
		husk_extensions = {
			"AiHuskBaseExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"BuffExtension",
			"SoundSectorExtension",
			"ProjectileLinkerExtension",
			"TentacleSplineExtension",
			"DialogueActorExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AISimpleExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension"
			},
			husk_extensions = {
				"AiHuskBaseExtension",
				"AIProximityExtension",
				"BuffExtension",
				"DialogueActorExtension"
			}
		}
	},
	ai_unit_tentacle_portal = {
		go_type = "ai_unit_tentacle_portal",
		self_owned_extensions = {
			"GenericHealthExtension",
			"GenericDeathExtension"
		},
		husk_extensions = {
			"GenericHealthExtension",
			"GenericDeathExtension"
		}
	},
	damage_wave_unit = {
		go_type = "damage_wave_unit",
		self_owned_extensions = {
			"DamageWaveExtension"
		},
		husk_extensions = {
			"DamageWaveHuskExtension"
		}
	},
	damage_blob_unit = {
		go_type = "damage_blob_unit",
		self_owned_extensions = {
			"DamageBlobExtension"
		},
		husk_extensions = {
			"DamageBlobHuskExtension"
		}
	},
	ai_unit_vortex = {
		go_type = "ai_unit_vortex",
		self_owned_extensions = {
			"AISimpleExtension",
			ai_locomotion_name,
			"AINavigationExtension",
			"VortexExtension"
		},
		husk_extensions = {
			"AiHuskBaseExtension",
			"AiHuskLocomotionExtension",
			"VortexHuskExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AISimpleExtension",
				"AINavigationExtension"
			},
			husk_extensions = {
				"AiHuskBaseExtension"
			}
		}
	},
	ai_unit_plague_wave_spawner = {
		go_type = "ai_unit_plague_wave_spawner",
		self_owned_extensions = {
			"AISimpleExtension",
			"InvincibleHealthExtension"
		},
		husk_extensions = {
			"AiHuskBaseExtension",
			"InvincibleHealthExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AISimpleExtension"
			},
			husk_extensions = {
				"AiHuskBaseExtension"
			}
		}
	},
	ai_inventory_item = {
		go_type = "ai_inventory_item",
		self_owned_extensions = {
			"AIInventoryItemExtension"
		}
	},
	aoe_unit = {
		go_type = "aoe_unit",
		self_owned_extensions = {
			"AreaDamageExtension"
		},
		husk_extensions = {
			"AreaDamageExtension"
		}
	},
	aoe_projectile_unit = {
		go_type = "aoe_projectile_unit",
		self_owned_extensions = {
			"ProjectileScriptUnitLocomotionExtension",
			"ProjectileRaycastImpactUnitExtension",
			"GenericImpactProjectileUnitExtension",
			"AreaDamageExtension"
		},
		husk_extensions = {
			"ProjectileScriptUnitLocomotionExtension",
			"GenericImpactProjectileUnitExtension",
			"AreaDamageExtension"
		}
	},
	liquid_aoe_unit = {
		go_type = "liquid_aoe_unit",
		self_owned_extensions = {
			"LiquidAreaDamageExtension"
		},
		husk_extensions = {
			"LiquidAreaDamageHuskExtension"
		}
	},
	player_projectile_unit = {
		go_type = "player_projectile_unit",
		self_owned_extensions = {
			"ProjectileScriptUnitLocomotionExtension",
			"PlayerProjectileImpactUnitExtension",
			"PlayerProjectileUnitExtension"
		},
		husk_extensions = {
			"ProjectileScriptUnitLocomotionExtension",
			"PlayerProjectileHuskExtension"
		}
	},
	flame_wave_projectile_unit = {
		go_type = "flame_wave_projectile_unit",
		self_owned_extensions = {
			"ProjectileFlameWaveLocomotionExtension",
			"PlayerProjectileImpactUnitExtension",
			"PlayerProjectileUnitExtension"
		},
		husk_extensions = {
			"ProjectileFlameWaveLocomotionExtension",
			"PlayerProjectileHuskExtension"
		}
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
			"PingTargetExtension"
		},
		husk_extensions = {
			"ProjectilePhysicsHuskLocomotionExtension",
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"ObjectiveLightOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension"
		}
	},
	pickup_training_dummy_unit = {
		go_type = "pickup_training_dummy_unit",
		self_owned_extensions = {
			"GenericHealthExtension",
			"GenericDeathExtension",
			"GenericHitReactionExtension",
			"ProjectileLinkerExtension",
			"ProjectilePhysicsUnitLocomotionExtension",
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"LookatTargetExtension",
			"PickupProjectileVolumeExtension",
			"PingTargetExtension"
		},
		husk_extensions = {
			"GenericHealthExtension",
			"GenericDeathExtension",
			"GenericHitReactionExtension",
			"ProjectileLinkerExtension",
			"ProjectilePhysicsHuskLocomotionExtension",
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"LookatTargetExtension",
			"PingTargetExtension"
		}
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
			"LightSourceExtension"
		},
		husk_extensions = {
			"ProjectilePhysicsHuskLocomotionExtension",
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"ObjectiveLightOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension",
			"LightSourceExtension"
		}
	},
	pickup_torch_unit = {
		go_type = "pickup_torch_unit",
		self_owned_extensions = {
			"ObjectivePickupTutorialExtension",
			"ProjectilePhysicsUnitLocomotionExtension",
			"PlayerTeleportingPickupExtension",
			"GenericUnitInteractableExtension",
			"ObjectiveLightOutlineExtension",
			"LookatTargetExtension",
			"PickupProjectileVolumeExtension",
			"PingTargetExtension",
			"LightSourceExtension"
		},
		husk_extensions = {
			"ObjectivePickupTutorialExtension",
			"ProjectilePhysicsHuskLocomotionExtension",
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"ObjectiveLightOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension",
			"LightSourceExtension"
		}
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
			"PingTargetExtension"
		},
		husk_extensions = {
			"ObjectivePickupTutorialExtension",
			"ProjectilePhysicsHuskLocomotionExtension",
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"ObjectiveLightOutlineExtension",
			"LookatTargetExtension",
			"LimitedItemExtension",
			"PingTargetExtension"
		}
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
			"PingTargetExtension"
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
			"PingTargetExtension"
		}
	},
	interaction_unit = {
		go_type = "prop_unit",
		self_owned_extensions = {
			"GenericUnitInteractableExtension",
			"GenericOutlineExtension"
		},
		husk_extensions = {
			"GenericUnitInteractableExtension",
			"GenericOutlineExtension"
		}
	},
	nurgle_liquid_blob = {
		go_type = "prop_unit",
		self_owned_extensions = {
			"GenericHealthExtension",
			"GenericDeathExtension",
			"ProjectileLinkerExtension",
			"GenericHitReactionExtension"
		},
		husk_extensions = {
			"GenericHealthExtension",
			"GenericDeathExtension",
			"ProjectileLinkerExtension",
			"GenericHitReactionExtension"
		},
		remove_when_killed = {
			"GenericDeathExtension",
			"ProjectileLinkerExtension"
		}
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
			"PingTargetExtension"
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
			"PingTargetExtension"
		}
	},
	true_flight_projectile_unit = {
		go_type = "true_flight_projectile_unit",
		self_owned_extensions = {
			"ProjectileTrueFlightLocomotionExtension",
			"ProjectileRaycastImpactUnitExtension",
			"PlayerProjectileUnitExtension"
		},
		husk_extensions = {
			"ProjectileTrueFlightLocomotionExtension",
			"PlayerProjectileHuskExtension"
		}
	},
	ai_true_flight_projectile_unit = {
		go_type = "ai_true_flight_projectile_unit",
		self_owned_extensions = {
			"ProjectileTrueFlightLocomotionExtension",
			"ProjectileRaycastImpactUnitExtension",
			"GenericImpactProjectileUnitExtension"
		},
		husk_extensions = {
			"ProjectileTrueFlightLocomotionExtension",
			"GenericImpactProjectileUnitExtension"
		}
	},
	ai_true_flight_killable_projectile_unit = {
		go_type = "ai_true_flight_killable_projectile_unit",
		self_owned_extensions = {
			"ProjectileTrueFlightLocomotionExtension",
			"ProjectileRaycastImpactUnitExtension",
			"GenericImpactProjectileUnitExtension",
			"GenericHealthExtension",
			"GenericDeathExtension"
		},
		husk_extensions = {
			"ProjectileTrueFlightLocomotionExtension",
			"GenericImpactProjectileUnitExtension",
			"GenericHealthExtension",
			"GenericDeathExtension"
		}
	},
	ai_true_flight_projectile_unit_without_raycast = {
		go_type = "ai_true_flight_projectile_unit_without_raycast",
		self_owned_extensions = {
			"ProjectileTrueFlightLocomotionExtension",
			"GenericImpactProjectileUnitExtension"
		},
		husk_extensions = {
			"ProjectileTrueFlightLocomotionExtension",
			"GenericImpactProjectileUnitExtension"
		}
	},
	overpowering_blob_unit = {
		go_type = "overpowering_blob_unit",
		self_owned_extensions = {
			"OverpoweredBlobHealthExtension",
			"GenericDeathExtension"
		},
		husk_extensions = {
			"GenericHealthExtension",
			"GenericDeathExtension"
		}
	},
	prop_unit = {
		go_type = "prop_unit",
		self_owned_extensions = {},
		husk_extensions = {}
	},
	network_synched_dummy_unit = {
		go_type = "network_synched_dummy_unit",
		self_owned_extensions = {},
		husk_extensions = {}
	},
	thrown_weapon_unit = {
		go_type = "thrown_weapon_unit",
		self_owned_extensions = {},
		husk_extensions = {
			"ThrownUnitHuskExtension"
		}
	},
	camera_unit = {
		self_owned_extensions = {
			"GenericCameraExtension",
			"GenericCameraStateMachineExtension"
		}
	},
	navgraphconnector = {
		self_owned_extensions = {
			"NavGraphConnectorExtension"
		},
		husk_extensions = {}
	},
	pickup_unit = {
		go_type = "pickup_unit",
		self_owned_extensions = {
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"PickupOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension"
		},
		husk_extensions = {
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"PickupOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension"
		}
	},
	conditional_pickup_unit = {
		go_type = "pickup_unit",
		self_owned_extensions = {
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"ConditionalPickupOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension"
		},
		husk_extensions = {
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"ConditionalPickupOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension"
		}
	},
	battle_chatter_unit = {
		self_owned_extensions = {
			"LookatTargetExtension"
		},
		husk_extensions = {
			"LookatTargetExtension"
		}
	},
	weapon_unit_3p = {
		self_owned_extensions = {}
	},
	torch_unit_3p = {
		self_owned_extensions = {
			"LightSourceExtension"
		},
		husk_extensions = {
			"LightSourceExtension"
		}
	},
	weapon_unit = {
		self_owned_extensions = {
			"WeaponUnitExtension"
		}
	},
	weapon_unit_spread = {
		self_owned_extensions = {
			"WeaponUnitExtension",
			"WeaponSpreadExtension"
		}
	},
	weapon_unit_ammo = {
		self_owned_extensions = {
			"WeaponUnitExtension",
			"GenericAmmoUserExtension"
		}
	},
	weapon_unit_ammo_limited = {
		self_owned_extensions = {
			"WeaponUnitExtension",
			"GenericAmmoUserExtension",
			"HeldLimitedItemExtension"
		}
	},
	weapon_unit_ammo_spread = {
		self_owned_extensions = {
			"WeaponUnitExtension",
			"GenericAmmoUserExtension",
			"WeaponSpreadExtension"
		}
	},
	explosive_weapon_unit_ammo = {
		self_owned_extensions = {
			"WeaponUnitExtension",
			"GenericAmmoUserExtension",
			"ExplosiveBarrelHealthExtension",
			"GenericDeathExtension"
		}
	},
	explosive_weapon_unit_ammo_limited = {
		self_owned_extensions = {
			"WeaponUnitExtension",
			"GenericAmmoUserExtension",
			"HeldLimitedItemExtension",
			"ExplosiveBarrelHealthExtension",
			"GenericDeathExtension"
		}
	},
	weapon_unit_aim = {
		self_owned_extensions = {
			"WeaponUnitExtension",
			"GenericUnitAimExtension"
		},
		husk_extensions = {
			"GenericUnitAimExtension"
		}
	},
	ai_weapon_unit = {
		go_type = "ai_inventory_item",
		self_owned_extensions = {
			"AIInventoryItemExtension",
			"AiWeaponUnitExtension"
		}
	},
	ai_shield_unit = {
		go_type = "ai_inventory_item",
		self_owned_extensions = {
			"AIInventoryItemExtension",
			"ProjectileLinkerExtension"
		}
	},
	ai_helmet_unit = {
		go_type = "ai_inventory_item",
		self_owned_extensions = {
			"AIInventoryItemExtension",
			"ProjectileLinkerExtension"
		}
	},
	limited_item_track_spawner = {
		self_owned_extensions = {},
		self_owned_extensions_server = {
			"LimitedItemTrackSpawner"
		},
		husk_extensions = {},
		husk_extension_server = {}
	},
	interest_point = {
		go_type = "interest_point_unit",
		self_owned_extensions = {
			"AIInterestPointHuskExtension"
		},
		self_owned_extensions_server = {
			"AIInterestPointExtension"
		},
		husk_extensions = {
			"AIInterestPointHuskExtension"
		},
		husk_extension_server = {}
	},
	interest_point_level = {
		base_template = "interest_point",
		go_type = "interest_point_level_unit",
		self_owned_extensions_server = {},
		self_owned_extensions = {},
		husk_extensions = {}
	},
	base_level_unit = {
		go_type = "base_level_unit"
	},
	lure_unit = {
		go_type = "lure_unit",
		self_owned_extensions_server = {
			"LureHealthExtension",
			"GenericDeathExtension",
			"LureWhereaboutsExtension",
			"AIAggroableSlotExtension",
			"GenericAggroableExtension"
		},
		husk_extensions = {
			"LureHealthExtension",
			"GenericDeathExtension"
		}
	}
}
local extension_table_names = {
	"self_owned_extensions",
	"self_owned_extensions_server",
	"husk_extensions",
	"husk_extensions_server"
}
local extension_table_names_n = #extension_table_names

for unit_template_name, template_data in pairs(unit_templates) do
	template_data.NAME = unit_template_name

	for i = 1, extension_table_names_n, 1 do
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

				for j = 1, inherited_extension_list_n, 1 do
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

				for j = 1, #inherited_remove_when_killed, 1 do
					local remove_when_killed = template_data.remove_when_killed[extension_table_name]
					remove_when_killed[#remove_when_killed + 1] = inherited_remove_when_killed[j]
				end
			end
		end

		template_data["num_" .. extension_table_name] = extension_list_n
		local remove_when_killed = template_data.remove_when_killed

		if remove_when_killed then
			for i = 1, extension_table_names_n, 1 do
				local extension_table_name = extension_table_names[i]
				local extension_list = remove_when_killed[extension_table_name]

				if extension_list then
					remove_when_killed["num_" .. extension_table_name] = #extension_list
				end
			end
		end
	end
end

unit_templates.get_extensions = function (unit, unit_template_name, is_husk, is_server)
	local extensions, num_extensions = nil
	local template = unit_templates[unit_template_name]

	if is_husk then
		if is_server and template.husk_extensions_server then
			num_extensions = template.num_husk_extensions_server
			extensions = template.husk_extensions_server
		else
			num_extensions = template.num_husk_extensions
			extensions = template.husk_extensions
		end
	elseif is_server and template.self_owned_extensions_server then
		num_extensions = template.num_self_owned_extensions_server
		extensions = template.self_owned_extensions_server
	else
		num_extensions = template.num_self_owned_extensions
		extensions = template.self_owned_extensions
	end

	return extensions, num_extensions
end
unit_templates.extensions_to_remove_on_death = function (unit_template_name, is_husk, is_server)
	local extensions, num_extensions = nil
	local remove_when_killed = unit_templates[unit_template_name].remove_when_killed

	if remove_when_killed == nil then
		return nil
	end

	if is_husk then
		if is_server and remove_when_killed.husk_extensions_server then
			num_extensions = remove_when_killed.num_husk_extensions_server
			extensions = remove_when_killed.husk_extensions_server
		else
			num_extensions = remove_when_killed.num_husk_extensions
			extensions = remove_when_killed.husk_extensions
		end
	elseif is_server and remove_when_killed.self_owned_extensions_server then
		num_extensions = remove_when_killed.num_self_owned_extensions_server
		extensions = remove_when_killed.self_owned_extensions_server
	else
		num_extensions = remove_when_killed.num_self_owned_extensions
		extensions = remove_when_killed.self_owned_extensions
	end

	if type(extensions) ~= "table" or type(num_extensions) ~= "number" then
		slot6 = 1
	end

	return extensions, num_extensions
end

return unit_templates
