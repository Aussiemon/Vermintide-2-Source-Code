local boss_waypoints = {
	[4] = {
		{
			travel_dist = 685.502638489008,
			id = "boss_1",
			waypoints = {
				{
					-12,
					243,
					0,
					685.502638489008
				},
				{
					10,
					220,
					0,
					685.502638489008
				},
				{
					-12,
					188.59423828125,
					0,
					661.4577089846134
				}
			}
		}
	}
}
local patrol_waypoints = {
	{
		travel_dist = 636.6810213625431,
		id = "roaming_2",
		waypoints = {
			{
				6,
				194.31007385253906,
				0,
				636.6810213625431
			},
			{
				6,
				112.33006286621094,
				0,
				636.6810213625431
			}
		}
	},
	{
		travel_dist = 676.8928515017033,
		id = "roaming_1",
		waypoints = {
			{
				6,
				235,
				0,
				676.8928515017033
			},
			{
				6,
				117,
				0,
				676.8928515017033
			}
		}
	}
}
local event_waypoints = {
	{
		travel_dist = 481.9417884349823,
		id = "event_1",
		waypoints = {
			{
				13.649999618530273,
				60.87999725341797,
				9.999999974752427e-07,
				481.9417884349823
			},
			{
				-13.179999351501465,
				57.77000045776367,
				0,
				481.9417884349823
			},
			{
				14.90999984741211,
				-3.2899999618530273,
				0,
				268.23331904411316
			}
		}
	}
}
local patrol_spline_version = "1"

return {
	version = patrol_spline_version,
	boss_waypoints = boss_waypoints,
	patrol_waypoints = patrol_waypoints,
	event_waypoints = event_waypoints
}
