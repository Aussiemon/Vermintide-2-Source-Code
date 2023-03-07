local buff_tweak_data = {}
TalentBuffTemplates = TalentBuffTemplates or {}
TalentBuffTemplates.witch_hunter = {}
TalentTrees = TalentTrees or {}
TalentTrees.witch_hunter = {
	{},
	{},
	{}
}
Talents = Talents or {}
Talents.witch_hunter = {}

for name, data in pairs(TalentBuffTemplates.witch_hunter) do
	local buffs = data.buffs

	fassert(#buffs == 1, "talent buff has more than one sub buff, add multiple buffs from the talent instead")

	local buff = buffs[1]
	buff.name = name
end

BuffUtils.apply_buff_tweak_data(TalentBuffTemplates.witch_hunter, buff_tweak_data)
