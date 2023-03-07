RagdollSettings = {
	min_num_ragdolls = 10,
	max_num_ragdolls = 24
}

if IS_XB1 then
	RagdollSettings.min_num_ragdolls = 5
	RagdollSettings.max_num_ragdolls = 5
end

if IS_PS4 then
	RagdollSettings.min_num_ragdolls = 5
	RagdollSettings.max_num_ragdolls = 5
end
