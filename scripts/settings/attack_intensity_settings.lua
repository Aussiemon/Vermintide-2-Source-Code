AttackIntensitySettings = AttackIntensitySettings or {}
AttackIntensitySettings.attack_type_intesities = {
	cleave = true,
	sweep = true,
	charge = true,
	frenzy = true,
	push = true,
	running = true,
	normal = true
}
AttackIntensitySettings.difficulty = {
	normal = {
		normal = {
			threshold = 2.5,
			decay = 1,
			decay_grace = 1,
			reset = 0.25
		},
		running = {
			threshold = 2.5,
			decay = 1,
			decay_grace = 1,
			reset = 0.25
		},
		charge = {
			threshold = 2.5,
			decay = 0.4,
			decay_grace = 1,
			reset = 0.25
		},
		cleave = {
			threshold = 2.5,
			decay = 1,
			decay_grace = 1,
			reset = 0.25
		},
		sweep = {
			threshold = 2.5,
			decay = 1,
			decay_grace = 1,
			reset = 0.25
		},
		frenzy = {
			threshold = 2.5,
			decay = 1,
			decay_grace = 1,
			reset = 0.25
		},
		push = {
			threshold = 2.5,
			decay = 1,
			decay_grace = 1,
			reset = 0.25
		}
	},
	hard = {
		normal = {
			threshold = 3.5,
			decay = 1.2,
			decay_grace = 0.9,
			reset = 0.25
		},
		running = {
			threshold = 3.5,
			decay = 1.2,
			decay_grace = 0.9,
			reset = 0.25
		},
		charge = {
			threshold = 2.5,
			decay = 0.2857142857142857,
			decay_grace = 0.9,
			reset = 0.25
		},
		cleave = {
			threshold = 3.5,
			decay = 1.2,
			decay_grace = 0.9,
			reset = 0.25
		},
		sweep = {
			threshold = 3.5,
			decay = 1.2,
			decay_grace = 0.9,
			reset = 0.25
		},
		frenzy = {
			threshold = 3.5,
			decay = 1.2,
			decay_grace = 0.9,
			reset = 0.25
		},
		push = {
			threshold = 3.5,
			decay = 1,
			decay_grace = 0.9,
			reset = 0.25
		}
	},
	harder = {
		normal = {
			threshold = 4,
			decay = 1.5,
			decay_grace = 0.7,
			reset = 0.25
		},
		running = {
			threshold = 4,
			decay = 1.5,
			decay_grace = 0.7,
			reset = 0.25
		},
		charge = {
			threshold = 2.5,
			decay = 0.4,
			decay_grace = 0.7,
			reset = 0.25
		},
		cleave = {
			threshold = 4,
			decay = 1.5,
			decay_grace = 0.7,
			reset = 0.25
		},
		sweep = {
			threshold = 4,
			decay = 1.5,
			decay_grace = 0.7,
			reset = 0.25
		},
		frenzy = {
			threshold = 4,
			decay = 1.5,
			decay_grace = 0.7,
			reset = 0.25
		},
		push = {
			threshold = 4,
			decay = 1,
			decay_grace = 0.7,
			reset = 0.25
		}
	},
	hardest = {
		normal = {
			threshold = 10,
			decay = 1,
			decay_grace = 0.25,
			reset = 0.25
		},
		running = {
			threshold = 10,
			decay = 1,
			decay_grace = 1,
			reset = 0.25
		},
		charge = {
			threshold = 2.5,
			decay = 0.4,
			decay_grace = 0.4,
			reset = 0.25
		},
		cleave = {
			threshold = 10,
			decay = 1,
			decay_grace = 1,
			reset = 0.25
		},
		sweep = {
			threshold = 10,
			decay = 1,
			decay_grace = 1,
			reset = 0.25
		},
		frenzy = {
			threshold = 10,
			decay = 1,
			decay_grace = 1,
			reset = 0.25
		},
		push = {
			threshold = 5,
			decay = 1,
			decay_grace = 1,
			reset = 0.25
		}
	}
}
AttackIntensitySettings.difficulty.cataclysm = table.clone(AttackIntensitySettings.difficulty.hardest)
AttackIntensitySettings.difficulty.cataclysm_2 = table.clone(AttackIntensitySettings.difficulty.hardest)
AttackIntensitySettings.difficulty.cataclysm_3 = table.clone(AttackIntensitySettings.difficulty.hardest)

for attack_type, _ in pairs(AttackIntensitySettings.attack_type_intesities) do
	for difficulty, data in pairs(AttackIntensitySettings.difficulty) do
		fassert(data[attack_type], "Missing settings for attack type [%s] in AttackIntensitySettings for difficulty [%s]", attack_type, difficulty)
	end
end
