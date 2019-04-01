local settings = DLCSettings.mutators_batch_02
settings.buff_templates = {
	slayer_curse_debuff = {
		buffs = {
			{
				perk = "slayer_curse",
				name = "slayer_curse_debuff",
				debuff = true,
				icon = "buff_icon_mutator_icon_slayer_curse",
				dormant = true
			}
		}
	}
}

return
