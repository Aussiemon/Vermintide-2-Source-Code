-- chunkname: @scripts/settings/attack_intensity_settings.lua

AttackIntensitySettings = AttackIntensitySettings or {}
AttackIntensitySettings.attack_type_intesities = {
	charge = true,
	cleave = true,
	frenzy = true,
	normal = true,
	push = true,
	running = true,
	sweep = true,
}
AttackIntensitySettings.difficulty = {}
AttackIntensitySettings.difficulty.normal = {
	normal = {
		decay = 1,
		decay_grace = 1,
		reset = 0.25,
		threshold = 2.5,
	},
	running = {
		decay = 1,
		decay_grace = 1,
		reset = 0.25,
		threshold = 2.5,
	},
	charge = {
		decay = 0.4,
		decay_grace = 1,
		reset = 0.25,
		threshold = 2.5,
	},
	cleave = {
		decay = 1,
		decay_grace = 1,
		reset = 0.25,
		threshold = 2.5,
	},
	sweep = {
		decay = 1,
		decay_grace = 1,
		reset = 0.25,
		threshold = 2.5,
	},
	frenzy = {
		decay = 1,
		decay_grace = 1,
		reset = 0.25,
		threshold = 2.5,
	},
	push = {
		decay = 1,
		decay_grace = 1,
		reset = 0.25,
		threshold = 2.5,
	},
}
AttackIntensitySettings.difficulty.hard = {
	normal = {
		decay = 1.2,
		decay_grace = 0.9,
		reset = 0.25,
		threshold = 3.5,
	},
	running = {
		decay = 1.2,
		decay_grace = 0.9,
		reset = 0.25,
		threshold = 3.5,
	},
	charge = {
		decay = 0.2857142857142857,
		decay_grace = 0.9,
		reset = 0.25,
		threshold = 2.5,
	},
	cleave = {
		decay = 1.2,
		decay_grace = 0.9,
		reset = 0.25,
		threshold = 3.5,
	},
	sweep = {
		decay = 1.2,
		decay_grace = 0.9,
		reset = 0.25,
		threshold = 3.5,
	},
	frenzy = {
		decay = 1.2,
		decay_grace = 0.9,
		reset = 0.25,
		threshold = 3.5,
	},
	push = {
		decay = 1,
		decay_grace = 0.9,
		reset = 0.25,
		threshold = 3.5,
	},
}
AttackIntensitySettings.difficulty.harder = {
	normal = {
		decay = 1.5,
		decay_grace = 0.7,
		reset = 0.25,
		threshold = 4,
	},
	running = {
		decay = 1.5,
		decay_grace = 0.7,
		reset = 0.25,
		threshold = 4,
	},
	charge = {
		decay = 0.4,
		decay_grace = 0.7,
		reset = 0.25,
		threshold = 2.5,
	},
	cleave = {
		decay = 1.5,
		decay_grace = 0.7,
		reset = 0.25,
		threshold = 4,
	},
	sweep = {
		decay = 1.5,
		decay_grace = 0.7,
		reset = 0.25,
		threshold = 4,
	},
	frenzy = {
		decay = 1.5,
		decay_grace = 0.7,
		reset = 0.25,
		threshold = 4,
	},
	push = {
		decay = 1,
		decay_grace = 0.7,
		reset = 0.25,
		threshold = 4,
	},
}
AttackIntensitySettings.difficulty.hardest = {
	normal = {
		decay = 1,
		decay_grace = 0.25,
		reset = 0.25,
		threshold = 10,
	},
	running = {
		decay = 1,
		decay_grace = 1,
		reset = 0.25,
		threshold = 10,
	},
	charge = {
		decay = 0.4,
		decay_grace = 0.4,
		reset = 0.25,
		threshold = 2.5,
	},
	cleave = {
		decay = 1,
		decay_grace = 1,
		reset = 0.25,
		threshold = 10,
	},
	sweep = {
		decay = 1,
		decay_grace = 1,
		reset = 0.25,
		threshold = 10,
	},
	frenzy = {
		decay = 1,
		decay_grace = 1,
		reset = 0.25,
		threshold = 10,
	},
	push = {
		decay = 1,
		decay_grace = 1,
		reset = 0.25,
		threshold = 5,
	},
}
AttackIntensitySettings.difficulty.cataclysm = table.clone(AttackIntensitySettings.difficulty.hardest)
AttackIntensitySettings.difficulty.cataclysm_2 = table.clone(AttackIntensitySettings.difficulty.hardest)
AttackIntensitySettings.difficulty.cataclysm_3 = table.clone(AttackIntensitySettings.difficulty.hardest)

for attack_type, _ in pairs(AttackIntensitySettings.attack_type_intesities) do
	for difficulty, data in pairs(AttackIntensitySettings.difficulty) do
		fassert(data[attack_type], "Missing settings for attack type [%s] in AttackIntensitySettings for difficulty [%s]", attack_type, difficulty)
	end
end
