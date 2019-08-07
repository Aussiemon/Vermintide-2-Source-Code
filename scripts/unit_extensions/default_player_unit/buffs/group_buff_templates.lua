GroupBuffTemplates = {
	grimoire = {
		buff_per_instance = "grimoire_health_debuff",
		side_name = "heroes"
	},
	blightreaper_curse = {
		buff_per_instance = "blightreaper_curse",
		side_name = "heroes"
	}
}

for _, dlc in pairs(DLCSettings) do
	local group_buff_templates = dlc.group_buff_templates

	if group_buff_templates then
		table.merge_recursive(GroupBuffTemplates, group_buff_templates)
	end
end

return
