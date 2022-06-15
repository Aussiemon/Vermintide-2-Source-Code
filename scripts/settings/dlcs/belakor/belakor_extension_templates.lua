local unit_extension_templates = {
	orb_pickup_unit = {
		go_type = "orb_pickup_unit",
		self_owned_extensions = {
			"OrbPickupUnitExtension",
			"PickupOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension"
		},
		husk_extensions = {
			"OrbPickupUnitExtension",
			"PickupOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension"
		}
	},
	shadow_dagger_spawner = {
		go_type = "positioned_prop_unit",
		self_owned_extensions = {
			"ShadowDaggerSpawnerExtension"
		},
		husk_extensions = {}
	},
	shadow_dagger_unit = {
		go_type = "shadow_dagger_unit",
		self_owned_extensions = {
			"ProjectileScriptUnitLocomotionExtension",
			"ProjectileLinearSphereSweepImpactUnitExtension",
			"GenericImpactProjectileUnitExtension",
			"ShadowDaggerExtension"
		},
		husk_extensions = {
			"ProjectileScriptUnitLocomotionExtension",
			"GenericImpactProjectileUnitExtension"
		}
	},
	shadow_skull_unit = {
		go_type = "shadow_skull_unit",
		self_owned_extensions = {
			"GenericHitReactionExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"ProjectileLinkerExtension",
			"EnemyOutlineExtension",
			"AIGroupMember",
			"BuffExtension",
			"DialogueActorExtension",
			"AIVolumeExtension",
			"AISimpleExtension",
			"ProjectileHomingSkullLocomotionExtension",
			"ProjectileLinearSphereSweepImpactUnitExtension",
			"GenericImpactProjectileUnitExtension"
		},
		husk_extensions = {
			"GenericHitReactionExtension",
			"GenericHealthExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"ProjectileLinkerExtension",
			"BuffExtension",
			"EnemyOutlineExtension",
			"DialogueActorExtension",
			"AiHuskBaseExtension",
			"ProjectileExtrapolatedHuskLocomotionExtension",
			"GenericImpactProjectileUnitExtension"
		}
	},
	deus_belakor_locus = {
		go_type = "deus_belakor_locus",
		self_owned_extensions = {
			"GenericUnitInteractableExtension",
			"PickupUnitExtension",
			"GenericOutlineExtension",
			"DeusBelakorLocusExtension",
			"LookatTargetExtension",
			"PingTargetExtension"
		},
		husk_extensions = {
			"GenericUnitInteractableExtension",
			"PickupUnitExtension",
			"GenericOutlineExtension",
			"DeusBelakorLocusExtension",
			"LookatTargetExtension",
			"PingTargetExtension"
		}
	},
	belakor_crystal = {
		go_type = "belakor_crystal",
		self_owned_extensions = {
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"ObjectiveLightOutlineExtension",
			"LookatTargetExtension",
			"PickupProjectileVolumeExtension",
			"PingTargetExtension",
			"KillVolumeHandlerExtension",
			"DeusBelakorCrystalExtension"
		},
		husk_extensions = {
			"PickupUnitExtension",
			"GenericUnitInteractableExtension",
			"ObjectiveLightOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension",
			"DeusBelakorCrystalExtension"
		}
	},
	belakor_crystal_throw = {
		base_template = "belakor_crystal",
		go_type = "belakor_crystal_throw",
		self_owned_extensions = {
			"ObjectivePickupTutorialExtension",
			"ProjectilePhysicsUnitLocomotionExtension"
		},
		husk_extensions = {
			"ObjectivePickupTutorialExtension",
			"ProjectilePhysicsHuskLocomotionExtension"
		}
	},
	arena_belakor_big_statue_health = {
		go_type = "arena_belakor_big_statue_health",
		self_owned_extensions = {
			"GenericHealthExtension",
			"ObjectiveHealthTutorialExtension"
		},
		husk_extensions = {
			"GenericHealthExtension",
			"ObjectiveHealthTutorialExtension"
		}
	},
	belakor_totem = {
		go_type = "belakor_totem",
		self_owned_extensions = {
			"GenericHealthExtension",
			"GenericHitReactionExtension",
			"GenericDeathExtension",
			"AIProximityExtension",
			"AIGroupMember",
			"DialogueActorExtension",
			"ProjectileLinkerExtension",
			"ObjectiveHealthTutorialExtension",
			"DeusBelakorTotemExtension",
			"EnemyOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension",
			"BuffExtension",
			"AIVolumeExtension",
			"AISimpleExtension"
		},
		husk_extensions = {
			"GenericHealthExtension",
			"GenericHitReactionExtension",
			"AIProximityExtension",
			"ProjectileLinkerExtension",
			"BuffExtension",
			"ObjectiveHealthTutorialExtension",
			"GenericDeathExtension",
			"DeusBelakorTotemExtension",
			"EnemyOutlineExtension",
			"DialogueActorExtension",
			"AiHuskBaseExtension",
			"LookatTargetExtension",
			"PingTargetExtension"
		}
	},
	shadow_homing_skulls_spawner = {
		go_type = "shadow_homing_skulls_spawner",
		self_owned_extensions = {
			"ShadowHomingSkullsSpawnerExtension"
		},
		husk_extensions = {}
	},
	belakor_crystal_socket = {
		go_type = "belakor_crystal_socket",
		self_owned_extensions = {
			"ObjectiveSocketUnitExtension",
			"DeusBelakorStatueSocketExtension",
			"ObjectiveUnitExtension"
		},
		husk_extensions = {
			"ObjectiveSocketUnitExtension",
			"DeusBelakorStatueSocketExtension",
			"ObjectiveUnitExtension"
		}
	}
}

return unit_extension_templates
