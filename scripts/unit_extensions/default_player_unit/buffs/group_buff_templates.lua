GroupBuffTemplates = {
	grimoire = {
		buff_per_instance = "grimoire_health_debuff"
	},
	blightreaper_curse = {
		buff_per_instance = "blightreaper_curse"
	}
}

for _, dlc in pairs(DLCSettings) do
	local group_buff_templates = dlc.group_buff_templates

	if group_buff_templates then
		table.merge_recursive(GroupBuffTemplates, group_buff_templates)
	end
end

return
