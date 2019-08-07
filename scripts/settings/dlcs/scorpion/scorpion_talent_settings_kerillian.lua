local buff_tweak_data = {}
TalentBuffTemplates = TalentBuffTemplates or {}
TalentBuffTemplates.wood_elf = {}
TalentTrees = TalentTrees or {}
TalentTrees.wood_elf = {
	{},
	{},
	{}
}
Talents = Talents or {}
Talents.wood_elf = {}

for name, data in pairs(TalentBuffTemplates.wood_elf) do
	local buffs = data.buffs

	fassert(#buffs == 1, "talent buff has more than one sub buff, add multiple buffs from the talent instead")

	local buff = buffs[1]
	buff.name = name
end

BuffUtils.apply_buff_tweak_data(TalentBuffTemplates.wood_elf, buff_tweak_data)

return
