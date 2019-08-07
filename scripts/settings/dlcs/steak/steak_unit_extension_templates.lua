local unit_extension_templates = {
	ai_unit_beastmen_minotaur = {
		base_template = "ai_unit_base",
		go_type = "ai_unit_beastmen_minotaur",
		self_owned_extensions = {
			"AILineOfSightExtension",
			"AIInventoryExtension",
			"PingTargetExtension",
			"GenericUnitAnimationMovementExtension"
		},
		husk_extensions = {
			"AIInventoryExtension",
			"PingTargetExtension",
			"GenericUnitAnimationMovementExtension"
		},
		remove_when_killed = {
			self_owned_extensions = {
				"AILineOfSightExtension",
				"GenericUnitAnimationMovementExtension"
			},
			husk_extensions = {
				"GenericUnitAnimationMovementExtension"
			}
		}
	}
}

return unit_extension_templates
