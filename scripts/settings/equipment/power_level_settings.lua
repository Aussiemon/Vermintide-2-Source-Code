MIN_POWER_LEVEL = 0
MAX_POWER_LEVEL = 1000
BoostCurves = {
	default = {
		0,
		0.3,
		0.6,
		0.8,
		1
	},
	linesman_curve = {
		0,
		0.2,
		0.4,
		0.7,
		1
	},
	smiter_curve = {
		0,
		0.25,
		0.5,
		0.75,
		1
	},
	tank_curve = {
		0,
		0.25,
		0.5,
		0.75,
		1
	},
	ninja_curve = {
		0,
		0.5,
		0.7,
		0.85,
		1
	}
}
Cleave = {
	max = 50,
	min = 0
}
ImpactTypeOutput = {
	{
		max = 100,
		min = 0.5
	},
	{
		max = 100,
		min = 0.5
	},
	{
		max = 100,
		min = 0.5
	},
	{
		max = 100,
		min = 0.5
	},
	{
		max = 100,
		min = 0.5
	}
}
ImpactDurationOutput = {
	{
		max = 10,
		min = 1
	},
	{
		max = 10,
		min = 1
	},
	{
		max = 10,
		min = 1
	},
	{
		max = 10,
		min = 1
	},
	{
		max = 10,
		min = 1
	}
}
DefaultAttackerPowerLevelOffset = 0.25
DefaultStaggerDurationModifier = 1
DefaultStaggerDistanceModifier = 1
DefaultBoostCurveType = "default"
DefaultBoostCurveCoefficient = 1
DefaultPowerLevel = 195
MinFallDistanceForBonus = 3
FallingPowerLevelBonusMultiplier = 1.15
DefaultCleaveDistribution = {
	attack = 0.15,
	impact = 0.15
}
DefaultArmorPowerModifier = {
	attack = {
		1,
		0.5,
		2.5,
		1,
		0.75
	},
	impact = {
		1,
		0.5,
		2.5,
		1,
		0.75
	}
}
DefaultCriticalArmorPowerModifier = {
	1,
	1,
	3,
	0.5,
	1
}
DefaultPowerDistribution = {
	attack = 0.5,
	impact = 0.5
}
DefaultStaggerDuration = 1
DefaultRangeDropoffSettings = {
	dropoff_start = 10,
	dropoff_end = 30
}
DamageOutput = {
	{
		max = 100,
		min = 0
	},
	{
		max = 100,
		min = 0
	},
	{
		max = 100,
		min = 0
	},
	{
		max = 100,
		min = 0
	},
	{
		max = 100,
		min = 0
	}
}
PowerLevelThresholds = {
	{
		max = 100,
		min = 10
	},
	{
		max = 100,
		min = 10
	},
	{
		max = 100,
		min = 10
	},
	{
		max = 100,
		min = 10
	},
	{
		max = 100,
		min = 10
	},
	{
		max = 100,
		min = 10
	},
	{
		max = 300,
		min = 10
	},
	{
		max = 300,
		min = 10
	},
	{
		max = 300,
		min = 10
	},
	{
		max = 300,
		min = 10
	},
	{
		max = 300,
		min = 10
	},
	{
		max = 300,
		min = 10
	},
	{
		max = 300,
		min = 10
	},
	{
		max = 300,
		min = 10
	},
	{
		max = 300,
		min = 10
	},
	{
		max = 300,
		min = 10
	},
	{
		max = 300,
		min = 10
	},
	{
		max = 300,
		min = 10
	},
	{
		max = 300,
		min = 10
	},
	{
		max = 300,
		min = 10
	},
	{
		max = 300,
		min = 10
	},
	{
		max = 300,
		min = 10
	},
	{
		max = 300,
		min = 10
	},
	{
		max = 300,
		min = 10
	}
}
PowerLevelMaximums = {
	weapon = 300,
	jewellery = 300
}
PowerLevelFromLevelSettings = {
	starting_power_level = 180,
	power_level_per_level = 10
}

return 
