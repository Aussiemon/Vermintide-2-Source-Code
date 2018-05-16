local smart_objects = {
	["c2d8cb29-aa03-4e12-a4af-6a511de6c74d"] = {
		{
			smart_object_index = 3,
			smart_object_type = "ledges",
			data = {
				is_bidirectional = false,
				is_on_edge = true,
				is_on_small_fence = false,
				ledge_position = {
					10.526087760925293,
					-3.173456907272339,
					25.824405670166016
				}
			},
			pos1 = {
				10.526086807250977,
				-4.173456192016602,
				25.829416275024414
			},
			pos2 = {
				10.526086807250977,
				-2.173457384109497,
				19.83039093017578
			}
		}
	},
	["3846161d-4f5c-4359-81eb-c23e83ac8c0b"] = {
		{
			smart_object_index = 1,
			smart_object_type = "ledges_with_fence",
			data = {
				is_on_edge = false,
				is_bidirectional = false,
				ledge_position1 = {
					20.509138107299805,
					-8.902448654174805,
					26.86281967163086
				},
				ledge_position2 = {
					20.10545539855957,
					-8.482501983642578,
					26.677804946899414
				},
				ledge_position = {
					20.305265426635742,
					-8.690353393554688,
					26.823989868164062
				}
			},
			pos1 = {
				21.202150344848633,
				-9.623373985290527,
				26.266504287719727
			},
			pos2 = {
				19.412443161010742,
				-7.761577129364014,
				20.300722122192383
			}
		},
		{
			smart_object_index = 2,
			smart_object_type = "ledges_with_fence",
			data = {
				is_on_edge = false,
				is_bidirectional = false,
				ledge_position1 = {
					20.120458602905273,
					-9.338027954101562,
					26.892356872558594
				},
				ledge_position2 = {
					19.71160125732422,
					-8.912703514099121,
					26.75706672668457
				},
				ledge_position = {
					19.88563346862793,
					-9.093738555908203,
					26.838645935058594
				}
			},
			pos1 = {
				20.8134765625,
				-10.058958053588867,
				26.308998107910156
			},
			pos2 = {
				19.01858901977539,
				-8.191778182983398,
				20.512649536132812
			}
		}
	}
}
local smart_object_count = 3
local version = "v1"
local ledgelator_version = "2017.MAY.05.05"

return {
	smart_objects = smart_objects,
	smart_object_count = smart_object_count,
	version = version,
	ledgelator_version = ledgelator_version
}
