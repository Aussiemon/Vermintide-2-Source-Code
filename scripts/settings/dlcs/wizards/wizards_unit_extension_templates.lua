local unit_extension_templates = {
	ai_unit_chaos_exalted_sorcerer_drachenfels = {
		base_template = "ai_unit_base",
		go_type = "ai_lord_with_inventory",
		self_owned_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
			"AILineOfSightExtension"
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AILineOfSightExtension",
				"PingTargetExtension"
			},
			husk_extensions = {
				"PingTargetExtension"
			}
		}
	},
	trail_urn_alignment = {
		go_type = "trail_urn_alignment",
		self_owned_extensions = {
			"GenericUnitInteractableExtension",
			"TrailUrnAlignmentExtension",
			"GenericOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension"
		},
		husk_extensions = {
			"GenericUnitInteractableExtension",
			"TrailUrnAlignmentExtension",
			"GenericOutlineExtension",
			"LookatTargetExtension",
			"PingTargetExtension"
		}
	},
	trail_cog_pickup_projectile_unit_limited = {
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
	}
}

return unit_extension_templates
