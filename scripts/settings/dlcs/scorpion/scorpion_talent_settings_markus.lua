local buff_tweak_data = {}
TalentBuffTemplates = TalentBuffTemplates or {}
TalentBuffTemplates.empire_soldier = {}
TalentTrees = TalentTrees or {}
TalentTrees.empire_soldier = {
	{},
	{},
	{}
}
Talents = Talents or {}
Talents.empire_soldier = {}

for name, data in pairs(TalentBuffTemplates.empire_soldier) do
	local buffs = data.buffs

	fassert(#buffs == 1, "talent buff has more than one sub buff, add multiple buffs from the talent instead")

	local buff = buffs[1]
	buff.name = name
end

BuffUtils.apply_buff_tweak_data(TalentBuffTemplates.empire_soldier, buff_tweak_data)
