local unit_extension_templates = {
	ai_unit_beastmen_minotaur = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_beastmen_minotaur",
		self_owned_extensions = {
			"AILineOfSightExtension",
			"AIInventoryExtension",
			"PingTargetExtension",
			"GenericUnitAnimationMovementExtension",
			"AIEnemySlotExtension"
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
			"GenericUnitAnimationMovementExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AILineOfSightExtension",
				"GenericUnitAnimationMovementExtension",
				"AIEnemySlotExtension"
			},
			husk_extensions = {
				"GenericUnitAnimationMovementExtension"
			}
		}
	}
}

return unit_extension_templates
