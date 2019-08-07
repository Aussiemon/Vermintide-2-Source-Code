local buff_tweak_data = {}
TalentBuffTemplates = TalentBuffTemplates or {}
TalentBuffTemplates.dwarf_ranger = {}
TalentTrees = TalentTrees or {}
TalentTrees.dwarf_ranger = {
	{},
	{},
	{}
}
Talents = Talents or {}
Talents.dwarf_ranger = {}

for name, data in pairs(TalentBuffTemplates.dwarf_ranger) do
	local buffs = data.buffs

	fassert(#buffs == 1, "talent buff has more than one sub buff, add multiple buffs from the talent instead")

	local buff = buffs[1]
	buff.name = name
end

BuffUtils.apply_buff_tweak_data(TalentBuffTemplates.dwarf_ranger, buff_tweak_data)

return
