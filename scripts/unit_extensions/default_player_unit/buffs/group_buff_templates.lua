-- chunkname: @scripts/unit_extensions/default_player_unit/buffs/group_buff_templates.lua

GroupBuffTemplates = {}
GroupBuffTemplates.grimoire = {
	buff_per_instance = "grimoire_health_debuff",
	side_name = "heroes",
}
GroupBuffTemplates.blightreaper_curse = {
	buff_per_instance = "blightreaper_curse",
	side_name = "heroes",
}

DLCUtils.merge("group_buff_templates", GroupBuffTemplates)
