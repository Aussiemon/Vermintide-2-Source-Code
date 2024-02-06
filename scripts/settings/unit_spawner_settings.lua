-- chunkname: @scripts/settings/unit_spawner_settings.lua

RagdollSettings = {
	max_num_ragdolls = 24,
	min_num_ragdolls = 10,
}

if IS_XB1 then
	RagdollSettings.min_num_ragdolls = 5
	RagdollSettings.max_num_ragdolls = 5
end

if IS_PS4 then
	RagdollSettings.min_num_ragdolls = 5
	RagdollSettings.max_num_ragdolls = 5
end
