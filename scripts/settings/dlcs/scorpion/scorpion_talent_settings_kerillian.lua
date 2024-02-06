-- chunkname: @scripts/settings/dlcs/scorpion/scorpion_talent_settings_kerillian.lua

local buff_tweak_data = {}

TalentBuffTemplates = TalentBuffTemplates or {}
TalentBuffTemplates.wood_elf = {}
TalentTrees = TalentTrees or {}
TalentTrees.wood_elf = {
	{},
	{},
	{},
}
Talents = Talents or {}
Talents.wood_elf = {}

BuffUtils.copy_talent_buff_names(TalentBuffTemplates.wood_elf)
BuffUtils.apply_buff_tweak_data(TalentBuffTemplates.wood_elf, buff_tweak_data)
