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

BuffUtils.copy_talent_buff_names(TalentBuffTemplates.dwarf_ranger)
BuffUtils.apply_buff_tweak_data(TalentBuffTemplates.dwarf_ranger, buff_tweak_data)

return
