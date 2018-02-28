local smart_objects = {
	["c2d8cb29-aa03-4e12-a4af-6a511de6c74d"] = {
		{
			smart_object_index = 1,
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
				10.526087760925293,
				-4.173457145690918,
				25.8112850189209
			},
			pos2 = {
				10.526087760925293,
				-2.1734564304351807,
				19.819604873657227
			}
		}
	},
	["3846161d-4f5c-4359-81eb-c23e83ac8c0b"] = {
		{
			smart_object_index = 2,
			smart_object_type = "ledges_with_fence",
			data = {
				is_on_edge = false,
				is_bidirectional = false,
				ledge_position1 = {
					20.509140014648438,
					-8.902447700500488,
					26.86281967163086
				},
				ledge_position2 = {
					20.10545539855957,
					-8.482502937316895,
					26.677806854248047
				},
				ledge_position = {
					20.30526351928711,
					-8.690354347229004,
					26.823989868164062
				}
			},
			pos1 = {
				21.202152252197266,
				-9.623373031616211,
				26.322511672973633
			},
			pos2 = {
				19.412443161010742,
				-7.761577129364014,
				20.294099807739258
			}
		},
		{
			smart_object_index = 3,
			smart_object_type = "ledges_with_fence",
			data = {
				is_on_edge = false,
				is_bidirectional = false,
				ledge_position1 = {
					20.120454788208008,
					-9.33802318572998,
					26.892358779907227
				},
				ledge_position2 = {
					19.71160316467285,
					-8.912701606750488,
					26.75706672668457
				},
				ledge_position = {
					19.88563346862793,
					-9.093737602233887,
					26.83864402770996
				}
			},
			pos1 = {
				20.8134708404541,
				-10.058952331542969,
				26.376262664794922
			},
			pos2 = {
				19.018590927124023,
				-8.191776275634766,
				20.512779235839844
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
