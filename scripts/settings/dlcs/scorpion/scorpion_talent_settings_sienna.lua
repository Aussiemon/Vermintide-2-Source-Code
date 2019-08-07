local buff_tweak_data = {}
TalentBuffTemplates = TalentBuffTemplates or {}
TalentBuffTemplates.bright_wizard = {}
TalentTrees = TalentTrees or {}
TalentTrees.bright_wizard = {
	{},
	{},
	{}
}
Talents = Talents or {}
Talents.bright_wizard = {}

for name, data in pairs(TalentBuffTemplates.bright_wizard) do
	local buffs = data.buffs

	fassert(#buffs == 1, "talent buff has more than one sub buff, add multiple buffs from the talent instead")

	local buff = buffs[1]
	buff.name = name
end

BuffUtils.apply_buff_tweak_data(TalentBuffTemplates.bright_wizard, buff_tweak_data)

return
