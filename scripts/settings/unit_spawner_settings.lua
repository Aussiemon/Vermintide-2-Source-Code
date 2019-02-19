RagdollSettings = {
	min_num_ragdolls = 10,
	max_num_ragdolls = 24
}

if PLATFORM == "xb1" then
	RagdollSettings.min_num_ragdolls = 5
	RagdollSettings.max_num_ragdolls = 5
end

if PLATFORM == "ps4" then
	RagdollSettings.min_num_ragdolls = 5
	RagdollSettings.max_num_ragdolls = 5
end

return
