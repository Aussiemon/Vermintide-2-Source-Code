local boss_waypoints = {}
local patrol_waypoints = {
	{
		travel_dist = 23.021728515625,
		id = "roaming_1",
		waypoints = {
			{
				-2,
				-27,
				0,
				23.021728515625
			},
			{
				18,
				-29,
				0,
				23.021728515625
			}
		},
		astar_points = {
			{
				-2,
				-27,
				0,
				0
			},
			{
				8,
				-28,
				0,
				0
			},
			{
				18,
				-29,
				0,
				0
			}
		}
	}
}
local event_waypoints = {}
local patrol_spline_version = "1"

return {
	version = patrol_spline_version,
	boss_waypoints = boss_waypoints,
	patrol_waypoints = patrol_waypoints,
	event_waypoints = event_waypoints
}
