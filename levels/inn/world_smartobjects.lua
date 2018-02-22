local smart_objects = {
	["c2d8cb29-aa03-4e12-a4af-6a511de6c74d"] = {
		{
			smart_object_index = 2,
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
				19.81491470336914
			}
		}
	},
	["3846161d-4f5c-4359-81eb-c23e83ac8c0b"] = {
		{
			smart_object_index = 1,
			smart_object_type = "ledges_with_fence",
			data = {
				is_on_edge = false,
				ledge_position1 = {
					26.233774185180664,
					-4.816127300262451,
					26.99319076538086
				},
				ledge_position2 = {
					26.6505184173584,
					-4.399382591247559,
					26.866178512573242
				},
				ledge_position = {
					26.542200088500977,
					-4.5077009201049805,
					26.91699981689453
				}
			},
			pos1 = {
				25.526668548583984,
				-5.523234844207764,
				26.233057022094727
			},
			pos2 = {
				27.357624053955078,
				-3.6922767162323,
				21.494335174560547
			}
		}
	}
}
local smart_object_count = 2
local version = "v1"
local ledgelator_version = "2017.MAY.05.05"

return {
	smart_objects = smart_objects,
	smart_object_count = smart_object_count,
	version = version,
	ledgelator_version = ledgelator_version
}
