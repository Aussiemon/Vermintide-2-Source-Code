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
	}
}

return unit_extension_templates
