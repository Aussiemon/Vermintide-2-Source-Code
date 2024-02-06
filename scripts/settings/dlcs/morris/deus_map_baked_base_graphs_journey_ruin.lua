-- chunkname: @scripts/settings/dlcs/morris/deus_map_baked_base_graphs_journey_ruin.lua

return {
	[0] = {
		node_19 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.7121196903334864,
			layout_y = 0.8700455706759692,
			name = "node_19",
			type = "SIGNATURE",
			prev = {
				[1] = "node_18",
				[2] = "node_21",
			},
			next = {
				[1] = "node_10",
			},
		},
		node_9 = {
			connected_to = 1,
			label = 4,
			layout_x = 0.6874760681638376,
			layout_y = 0.35660611714673907,
			name = "node_9",
			type = "SIGNATURE",
			prev = {
				[1] = "node_4",
				[2] = "node_13",
			},
			next = {
				[1] = "node_10",
			},
		},
		node_14 = {
			connected_to = 1,
			label = 5,
			layout_x = 0.6744333735011498,
			layout_y = 0.6098293355241489,
			name = "node_14",
			type = "SIGNATURE",
			prev = {
				[1] = "node_13",
				[2] = "node_18",
			},
			next = {
				[1] = "node_10",
			},
		},
		final = {
			layout_x = 1,
			layout_y = 0.4382208721337627,
			name = "final",
			type = "ARENA",
			prev = {
				"node_6",
				"node_8",
				"node_10",
			},
			next = {},
		},
		node_12 = {
			connected_to = 2,
			layout_x = 0.42581040720501506,
			layout_y = 0.30026192712652816,
			name = "node_12",
			type = "SHOP",
			prev = {
				[1] = "node_11",
			},
			next = {
				[1] = "node_4",
				[2] = "node_13",
			},
		},
		node_4 = {
			connected_to = 2,
			label = 2,
			layout_x = 0.5656574268029412,
			layout_y = 0.1256461738854647,
			name = "node_4",
			type = "TRAVEL",
			prev = {
				[1] = "node_3",
				[2] = "node_12",
			},
			next = {
				[1] = "node_5",
				[2] = "node_9",
			},
		},
		node_13 = {
			connected_to = 2,
			label = 4,
			layout_x = 0.5587441361606585,
			layout_y = 0.42140224331503956,
			name = "node_13",
			type = "TRAVEL",
			prev = {
				[1] = "node_12",
			},
			next = {
				[1] = "node_9",
				[2] = "node_14",
			},
		},
		node_20 = {
			connected_to = 2,
			layout_x = 0.4161679496907288,
			layout_y = 0.9189762616007114,
			name = "node_20",
			type = "SHOP",
			prev = {
				[1] = "node_16",
			},
			next = {
				[1] = "node_18",
				[2] = "node_21",
			},
		},
		start = {
			connected_to = 2,
			layout_x = 0,
			layout_y = 0.4549130485552151,
			name = "start",
			type = "START",
			next = {
				[1] = "node_1",
				[2] = "node_15",
			},
			prev = {},
		},
		node_2 = {
			connected_to = 1,
			layout_x = 0.23957172948797498,
			layout_y = 0.09215524278486302,
			name = "node_2",
			type = "SHOP",
			prev = {
				[1] = "node_1",
			},
			next = {
				[1] = "node_3",
			},
		},
		node_11 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.2632427623467295,
			layout_y = 0.39905977580293217,
			name = "node_11",
			type = "TRAVEL",
			prev = {
				[1] = "node_1",
			},
			next = {
				[1] = "node_12",
			},
		},
		node_3 = {
			connected_to = 1,
			label = 1,
			layout_x = 0.4037335484627524,
			layout_y = 0,
			name = "node_3",
			type = "TRAVEL",
			prev = {
				[1] = "node_2",
			},
			next = {
				[1] = "node_4",
			},
		},
		node_16 = {
			connected_to = 2,
			label = 6,
			layout_x = 0.2562467676560443,
			layout_y = 0.8103369229025039,
			name = "node_16",
			type = "TRAVEL",
			prev = {
				[1] = "node_15",
			},
			next = {
				[1] = "node_17",
				[2] = "node_20",
			},
		},
		node_8 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.868641901548558,
			layout_y = 0.3696959532568208,
			name = "node_8",
			type = "SIGNATURE",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_17 = {
			connected_to = 1,
			layout_x = 0.38104785891741144,
			layout_y = 0.671634431362278,
			name = "node_17",
			type = "SHOP",
			prev = {
				[1] = "node_16",
			},
			next = {
				[1] = "node_18",
			},
		},
		node_1 = {
			connected_to = 2,
			label = 1,
			layout_x = 0.12872723028946012,
			layout_y = 0.28592432658312167,
			name = "node_1",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
				[2] = "node_11",
			},
		},
		node_6 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.9179320466665882,
			layout_y = 0.1754997042079836,
			name = "node_6",
			type = "SIGNATURE",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_15 = {
			connected_to = 1,
			label = 5,
			layout_x = 0.1011593198410713,
			layout_y = 0.6802294379567957,
			name = "node_15",
			type = "TRAVEL",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_16",
			},
		},
		node_18 = {
			connected_to = 2,
			label = 4,
			layout_x = 0.545434414640425,
			layout_y = 0.7476021573333965,
			name = "node_18",
			type = "SIGNATURE",
			prev = {
				[1] = "node_17",
				[2] = "node_20",
			},
			next = {
				[1] = "node_14",
				[2] = "node_19",
			},
		},
		node_5 = {
			connected_to = 2,
			layout_x = 0.7578637003238679,
			layout_y = 0.11304105854721103,
			name = "node_5",
			type = "SHOP",
			prev = {
				[1] = "node_4",
			},
			next = {
				[1] = "node_6",
				[2] = "node_8",
			},
		},
		node_10 = {
			connected_to = 1,
			layout_x = 0.8322061382092447,
			layout_y = 0.6437056354842976,
			name = "node_10",
			type = "SHOP",
			prev = {
				"node_9",
				"node_14",
				"node_19",
			},
			next = {
				[1] = "final",
			},
		},
		node_21 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.5704436121315017,
			layout_y = 1,
			name = "node_21",
			type = "SIGNATURE",
			prev = {
				[1] = "node_20",
			},
			next = {
				[1] = "node_19",
			},
		},
	},
	{
		node_9 = {
			connected_to = 1,
			layout_x = 0.41725796702459594,
			layout_y = 0.5412142648305438,
			name = "node_9",
			type = "SHOP",
			prev = {
				[1] = "node_2",
				[2] = "node_14",
			},
			next = {
				[1] = "node_10",
			},
		},
		node_14 = {
			connected_to = 2,
			label = 4,
			layout_x = 0.2815964790368466,
			layout_y = 0.7125690512915223,
			name = "node_14",
			type = "TRAVEL",
			prev = {
				[1] = "node_1",
				[2] = "node_16",
			},
			next = {
				[1] = "node_9",
				[2] = "node_15",
			},
		},
		final = {
			layout_x = 1,
			layout_y = 0.4685563899319462,
			name = "final",
			type = "ARENA",
			prev = {
				"node_6",
				"node_8",
				"node_12",
			},
			next = {},
		},
		node_12 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.8574808184277082,
			layout_y = 0.8004392338236451,
			name = "node_12",
			type = "SIGNATURE",
			prev = {
				[1] = "node_11",
				[2] = "node_13",
			},
			next = {
				[1] = "final",
			},
		},
		node_4 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.5628666818960198,
			layout_y = 0.14811686651677589,
			name = "node_4",
			type = "TRAVEL",
			prev = {
				[1] = "node_3",
			},
			next = {
				[1] = "node_5",
			},
		},
		node_13 = {
			connected_to = 1,
			layout_x = 0.6990131403550625,
			layout_y = 1,
			name = "node_13",
			type = "SHOP",
			prev = {
				[1] = "node_10",
			},
			next = {
				[1] = "node_12",
			},
		},
		start = {
			connected_to = 2,
			layout_x = 0,
			layout_y = 0.48654070218259227,
			name = "start",
			type = "START",
			next = {
				[1] = "node_1",
				[2] = "node_16",
			},
			prev = {},
		},
		node_2 = {
			connected_to = 2,
			label = 1,
			layout_x = 0.32409938491909196,
			layout_y = 0.24225130469603678,
			name = "node_2",
			type = "TRAVEL",
			prev = {
				[1] = "node_1",
			},
			next = {
				[1] = "node_3",
				[2] = "node_9",
			},
		},
		node_11 = {
			connected_to = 2,
			layout_x = 0.7091464987527607,
			layout_y = 0.6368166240082666,
			name = "node_11",
			type = "SHOP",
			prev = {
				[1] = "node_10",
			},
			next = {
				[1] = "node_8",
				[2] = "node_12",
			},
		},
		node_3 = {
			connected_to = 1,
			layout_x = 0.42220382567763,
			layout_y = 0,
			name = "node_3",
			type = "SHOP",
			prev = {
				[1] = "node_2",
			},
			next = {
				[1] = "node_4",
			},
		},
		node_16 = {
			connected_to = 1,
			label = 4,
			layout_x = 0.11209659729735519,
			layout_y = 0.7623853835233584,
			name = "node_16",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_14",
			},
		},
		node_8 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.8219042916325315,
			layout_y = 0.42123374600027597,
			name = "node_8",
			type = "SIGNATURE",
			prev = {
				[1] = "node_5",
				[2] = "node_11",
			},
			next = {
				[1] = "final",
			},
		},
		node_1 = {
			connected_to = 2,
			label = 1,
			layout_x = 0.17093676289741302,
			layout_y = 0.38049049242773414,
			name = "node_1",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
				[2] = "node_14",
			},
		},
		node_6 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.9076568650829152,
			layout_y = 0.14967710300936726,
			name = "node_6",
			type = "SIGNATURE",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_15 = {
			connected_to = 1,
			layout_x = 0.40563091791859507,
			layout_y = 0.9822082678504775,
			name = "node_15",
			type = "SHOP",
			prev = {
				[1] = "node_14",
			},
			next = {
				[1] = "node_10",
			},
		},
		node_5 = {
			connected_to = 2,
			layout_x = 0.7342238067384675,
			layout_y = 0.1283091058307011,
			name = "node_5",
			type = "SHOP",
			prev = {
				[1] = "node_4",
			},
			next = {
				[1] = "node_6",
				[2] = "node_8",
			},
		},
		node_10 = {
			connected_to = 2,
			label = 3,
			layout_x = 0.5507425651849007,
			layout_y = 0.8012664828723239,
			name = "node_10",
			type = "TRAVEL",
			prev = {
				[1] = "node_9",
				[2] = "node_15",
			},
			next = {
				[1] = "node_11",
				[2] = "node_13",
			},
		},
	},
	[3] = {
		node_19 = {
			connected_to = 2,
			label = 3,
			layout_x = 0.43018792979808534,
			layout_y = 0.9380494614705178,
			name = "node_19",
			type = "TRAVEL",
			prev = {
				[1] = "node_18",
			},
			next = {
				[1] = "node_14",
				[2] = "node_20",
			},
		},
		node_9 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.39902743679429287,
			layout_y = 0.2003114705596979,
			name = "node_9",
			type = "TRAVEL",
			prev = {
				[1] = "node_2",
			},
			next = {
				[1] = "node_4",
			},
		},
		node_14 = {
			connected_to = 1,
			label = 4,
			layout_x = 0.552124682910309,
			layout_y = 0.7415645821109019,
			name = "node_14",
			type = "SIGNATURE",
			prev = {
				[1] = "node_13",
				[2] = "node_19",
			},
			next = {
				[1] = "node_15",
			},
		},
		final = {
			layout_x = 1,
			layout_y = 0.4727756128184678,
			name = "final",
			type = "ARENA",
			prev = {
				"node_6",
				"node_8",
				"node_16",
			},
			next = {},
		},
		node_12 = {
			connected_to = 1,
			label = 5,
			layout_x = 0.5750614866778844,
			layout_y = 0.4280107358002491,
			name = "node_12",
			type = "TRAVEL",
			prev = {
				[1] = "node_11",
				[2] = "node_13",
			},
			next = {
				[1] = "node_5",
			},
		},
		node_4 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.5443790727841895,
			layout_y = 0.15738957872473397,
			name = "node_4",
			type = "TRAVEL",
			prev = {
				"node_3",
				"node_9",
				"node_11",
			},
			next = {
				[1] = "node_5",
			},
		},
		node_13 = {
			connected_to = 2,
			layout_x = 0.42604153180265697,
			layout_y = 0.6304204381197471,
			name = "node_13",
			type = "SHOP",
			prev = {
				[1] = "node_10",
			},
			next = {
				[1] = "node_12",
				[2] = "node_14",
			},
		},
		node_20 = {
			connected_to = 1,
			label = 5,
			layout_x = 0.5944460537589816,
			layout_y = 1,
			name = "node_20",
			type = "TRAVEL",
			prev = {
				[1] = "node_19",
			},
			next = {
				[1] = "node_21",
			},
		},
		start = {
			connected_to = 2,
			layout_x = 0,
			layout_y = 0.48896515842172694,
			name = "start",
			type = "START",
			next = {
				[1] = "node_1",
				[2] = "node_17",
			},
			prev = {},
		},
		node_2 = {
			connected_to = 2,
			layout_x = 0.2531770941317078,
			layout_y = 0.14910785888992437,
			name = "node_2",
			type = "SHOP",
			prev = {
				[1] = "node_1",
			},
			next = {
				[1] = "node_3",
				[2] = "node_9",
			},
		},
		node_11 = {
			connected_to = 2,
			layout_x = 0.43038938596181897,
			layout_y = 0.4068379923166099,
			name = "node_11",
			type = "SHOP",
			prev = {
				[1] = "node_10",
			},
			next = {
				[1] = "node_4",
				[2] = "node_12",
			},
		},
		node_3 = {
			connected_to = 1,
			label = 1,
			layout_x = 0.4068742173359074,
			layout_y = 0,
			name = "node_3",
			type = "TRAVEL",
			prev = {
				[1] = "node_2",
			},
			next = {
				[1] = "node_4",
			},
		},
		node_16 = {
			connected_to = 1,
			layout_x = 0.8801109516144885,
			layout_y = 0.7201614822508285,
			name = "node_16",
			type = "SHOP",
			prev = {
				[1] = "node_15",
				[2] = "node_21",
			},
			next = {
				[1] = "final",
			},
		},
		node_8 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.8538566715987012,
			layout_y = 0.42481893586828984,
			name = "node_8",
			type = "SIGNATURE",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_17 = {
			connected_to = 2,
			label = 5,
			layout_x = 0.12833979555160752,
			layout_y = 0.68688347514966,
			name = "node_17",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_10",
				[2] = "node_18",
			},
		},
		node_1 = {
			connected_to = 2,
			label = 1,
			layout_x = 0.1387525259890414,
			layout_y = 0.34867981914050483,
			name = "node_1",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
				[2] = "node_10",
			},
		},
		node_6 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.9032925647669142,
			layout_y = 0.232569348029043,
			name = "node_6",
			type = "SIGNATURE",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_15 = {
			connected_to = 1,
			label = 6,
			layout_x = 0.7208503296165775,
			layout_y = 0.6445782589383369,
			name = "node_15",
			type = "TRAVEL",
			prev = {
				[1] = "node_14",
			},
			next = {
				[1] = "node_16",
			},
		},
		node_18 = {
			connected_to = 1,
			layout_x = 0.24476515438051136,
			layout_y = 0.8827363328183537,
			name = "node_18",
			type = "SHOP",
			prev = {
				[1] = "node_17",
			},
			next = {
				[1] = "node_19",
			},
		},
		node_5 = {
			connected_to = 2,
			layout_x = 0.7228912768154148,
			layout_y = 0.2567867735545754,
			name = "node_5",
			type = "SHOP",
			prev = {
				[1] = "node_4",
				[2] = "node_12",
			},
			next = {
				[1] = "node_6",
				[2] = "node_8",
			},
		},
		node_10 = {
			connected_to = 2,
			label = 4,
			layout_x = 0.26159331097763716,
			layout_y = 0.5320820016223201,
			name = "node_10",
			type = "TRAVEL",
			prev = {
				[1] = "node_1",
				[2] = "node_17",
			},
			next = {
				[1] = "node_11",
				[2] = "node_13",
			},
		},
		node_21 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.7567190919387266,
			layout_y = 0.9025920806635327,
			name = "node_21",
			type = "SIGNATURE",
			prev = {
				[1] = "node_20",
			},
			next = {
				[1] = "node_16",
			},
		},
	},
	[4] = {
		node_9 = {
			connected_to = 1,
			layout_x = 0.6752575442747897,
			layout_y = 0.5804655451726757,
			name = "node_9",
			type = "SHOP",
			prev = {
				[1] = "node_4",
				[2] = "node_14",
			},
			next = {
				[1] = "node_10",
			},
		},
		node_14 = {
			connected_to = 2,
			label = 5,
			layout_x = 0.5690942563042474,
			layout_y = 0.7955698201267881,
			name = "node_14",
			type = "TRAVEL",
			prev = {
				[1] = "node_13",
				[2] = "node_18",
			},
			next = {
				[1] = "node_9",
				[2] = "node_15",
			},
		},
		final = {
			layout_x = 1,
			layout_y = 0.45373281878084865,
			name = "final",
			type = "ARENA",
			prev = {
				"node_6",
				"node_8",
				"node_10",
			},
			next = {},
		},
		node_12 = {
			connected_to = 1,
			label = 4,
			layout_x = 0.25112220805203755,
			layout_y = 0.5266237992528048,
			name = "node_12",
			type = "TRAVEL",
			prev = {
				[1] = "node_1",
				[2] = "node_16",
			},
			next = {
				[1] = "node_13",
			},
		},
		node_4 = {
			connected_to = 2,
			label = 2,
			layout_x = 0.5665286703308814,
			layout_y = 0.29922607848755955,
			name = "node_4",
			type = "TRAVEL",
			prev = {
				"node_3",
				"node_11",
				"node_13",
			},
			next = {
				[1] = "node_5",
				[2] = "node_9",
			},
		},
		node_13 = {
			connected_to = 2,
			layout_x = 0.44775408498021557,
			layout_y = 0.5748982516411653,
			name = "node_13",
			type = "SHOP",
			prev = {
				[1] = "node_12",
			},
			next = {
				[1] = "node_4",
				[2] = "node_14",
			},
		},
		start = {
			connected_to = 2,
			layout_x = 0,
			layout_y = 0.4633085182761297,
			name = "start",
			type = "START",
			next = {
				[1] = "node_1",
				[2] = "node_16",
			},
			prev = {},
		},
		node_2 = {
			connected_to = 2,
			layout_x = 0.2954353287787541,
			layout_y = 0.08842629943751514,
			name = "node_2",
			type = "SHOP",
			prev = {
				[1] = "node_1",
			},
			next = {
				[1] = "node_3",
				[2] = "node_11",
			},
		},
		node_11 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.4089565964622798,
			layout_y = 0.2566122914338147,
			name = "node_11",
			type = "TRAVEL",
			prev = {
				[1] = "node_2",
			},
			next = {
				[1] = "node_4",
			},
		},
		node_3 = {
			connected_to = 1,
			label = 1,
			layout_x = 0.47204079351446276,
			layout_y = 0,
			name = "node_3",
			type = "TRAVEL",
			prev = {
				[1] = "node_2",
			},
			next = {
				[1] = "node_4",
			},
		},
		node_16 = {
			connected_to = 2,
			label = 4,
			layout_x = 0.13630946717500755,
			layout_y = 0.7113808520365593,
			name = "node_16",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_12",
				[2] = "node_17",
			},
		},
		node_8 = {
			connected_to = 1,
			layout_x = 0.8477158448543227,
			layout_y = 0.3926535525460106,
			name = "node_8",
			type = "SHOP",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_17 = {
			connected_to = 1,
			layout_x = 0.27247356843025605,
			layout_y = 0.9288679981998724,
			name = "node_17",
			type = "SHOP",
			prev = {
				[1] = "node_16",
			},
			next = {
				[1] = "node_18",
			},
		},
		node_1 = {
			connected_to = 2,
			label = 1,
			layout_x = 0.14837402727165402,
			layout_y = 0.2888605492983855,
			name = "node_1",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
				[2] = "node_12",
			},
		},
		node_6 = {
			connected_to = 1,
			layout_x = 0.9070180000983146,
			layout_y = 0.16224586960399767,
			name = "node_6",
			type = "SHOP",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_15 = {
			connected_to = 1,
			layout_x = 0.7239413560701233,
			layout_y = 0.9379793836640576,
			name = "node_15",
			type = "SHOP",
			prev = {
				[1] = "node_14",
			},
			next = {
				[1] = "node_10",
			},
		},
		node_5 = {
			connected_to = 2,
			label = 2,
			layout_x = 0.7363303495774732,
			layout_y = 0.1603557411937005,
			name = "node_5",
			type = "SIGNATURE",
			prev = {
				[1] = "node_4",
			},
			next = {
				[1] = "node_6",
				[2] = "node_8",
			},
		},
		node_10 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.8524785958524865,
			layout_y = 0.7352487391588557,
			name = "node_10",
			type = "SIGNATURE",
			prev = {
				[1] = "node_9",
				[2] = "node_15",
			},
			next = {
				[1] = "final",
			},
		},
		node_18 = {
			connected_to = 1,
			label = 1,
			layout_x = 0.4471009973760136,
			layout_y = 1,
			name = "node_18",
			type = "TRAVEL",
			prev = {
				[1] = "node_17",
			},
			next = {
				[1] = "node_14",
			},
		},
	},
	[7] = {
		node_11 = {
			connected_to = 2,
			layout_x = 0.40069801138495775,
			layout_y = 0.6365493905478619,
			name = "node_11",
			type = "SHOP",
			prev = {
				[1] = "node_2",
			},
			next = {
				[1] = "node_4",
				[2] = "node_12",
			},
		},
		node_3 = {
			connected_to = 1,
			layout_x = 0.3806399665505118,
			layout_y = 0.0552441309638203,
			name = "node_3",
			type = "SHOP",
			prev = {
				[1] = "node_2",
			},
			next = {
				[1] = "node_4",
			},
		},
		node_8 = {
			connected_to = 1,
			layout_x = 0.8333923577388221,
			layout_y = 0.2990282203520482,
			name = "node_8",
			type = "SHOP",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_1 = {
			connected_to = 1,
			label = 1,
			layout_x = 0.14296941964904808,
			layout_y = 0.1639964151709176,
			name = "node_1",
			type = "TRAVEL",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
			},
		},
		node_9 = {
			connected_to = 1,
			layout_x = 0.6492666304179079,
			layout_y = 0.5436633543554306,
			name = "node_9",
			type = "SHOP",
			prev = {
				[1] = "node_4",
				[2] = "node_12",
			},
			next = {
				[1] = "node_10",
			},
		},
		node_14 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.14120890356411417,
			layout_y = 0.6668071422642179,
			name = "node_14",
			type = "TRAVEL",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
			},
		},
		node_6 = {
			connected_to = 1,
			layout_x = 0.8815565082296376,
			layout_y = 0,
			name = "node_6",
			type = "SHOP",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_10 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.8338716031910521,
			layout_y = 0.739399402429579,
			name = "node_10",
			type = "SIGNATURE",
			prev = {
				[1] = "node_9",
				[2] = "node_13",
			},
			next = {
				[1] = "final",
			},
		},
		final = {
			layout_x = 1,
			layout_y = 0.371776534963114,
			name = "final",
			type = "ARENA",
			prev = {
				"node_6",
				"node_8",
				"node_10",
			},
			next = {},
		},
		node_12 = {
			connected_to = 2,
			label = 4,
			layout_x = 0.5465596397398224,
			layout_y = 0.8067192991461051,
			name = "node_12",
			type = "SIGNATURE",
			prev = {
				[1] = "node_11",
			},
			next = {
				[1] = "node_9",
				[2] = "node_13",
			},
		},
		node_4 = {
			connected_to = 2,
			label = 1,
			layout_x = 0.5257679783421754,
			layout_y = 0.258580605752083,
			name = "node_4",
			type = "SIGNATURE",
			prev = {
				[1] = "node_3",
				[2] = "node_11",
			},
			next = {
				[1] = "node_5",
				[2] = "node_9",
			},
		},
		node_13 = {
			connected_to = 1,
			layout_x = 0.6842716136998053,
			layout_y = 1,
			name = "node_13",
			type = "SHOP",
			prev = {
				[1] = "node_12",
			},
			next = {
				[1] = "node_10",
			},
		},
		node_5 = {
			connected_to = 2,
			label = 2,
			layout_x = 0.6930704686408858,
			layout_y = 0.01844589656296499,
			name = "node_5",
			type = "SIGNATURE",
			prev = {
				[1] = "node_4",
			},
			next = {
				[1] = "node_6",
				[2] = "node_8",
			},
		},
		start = {
			connected_to = 2,
			layout_x = 0,
			layout_y = 0.38720212972999846,
			name = "start",
			type = "START",
			next = {
				[1] = "node_1",
				[2] = "node_14",
			},
			prev = {},
		},
		node_2 = {
			connected_to = 2,
			label = 2,
			layout_x = 0.2754634302253966,
			layout_y = 0.39412330276976215,
			name = "node_2",
			type = "TRAVEL",
			prev = {
				[1] = "node_1",
				[2] = "node_14",
			},
			next = {
				[1] = "node_3",
				[2] = "node_11",
			},
		},
	},
	[8] = {
		node_9 = {
			connected_to = 1,
			label = 4,
			layout_x = 0.6625103236062012,
			layout_y = 0.6849286360869593,
			name = "node_9",
			type = "SIGNATURE",
			prev = {
				"node_4",
				"node_11",
				"node_14",
			},
			next = {
				[1] = "node_10",
			},
		},
		node_14 = {
			connected_to = 1,
			label = 5,
			layout_x = 0.57102611051651,
			layout_y = 1,
			name = "node_14",
			type = "TRAVEL",
			prev = {
				[1] = "node_13",
			},
			next = {
				[1] = "node_9",
			},
		},
		final = {
			layout_x = 1,
			layout_y = 0.455031434430949,
			name = "final",
			type = "ARENA",
			prev = {
				"node_6",
				"node_8",
				"node_10",
			},
			next = {},
		},
		node_12 = {
			connected_to = 2,
			label = 4,
			layout_x = 0.2843018733203015,
			layout_y = 0.5000945353615347,
			name = "node_12",
			type = "TRAVEL",
			prev = {
				[1] = "node_1",
				[2] = "node_15",
			},
			next = {
				[1] = "node_3",
				[2] = "node_13",
			},
		},
		node_4 = {
			connected_to = 2,
			label = 2,
			layout_x = 0.5838825094957835,
			layout_y = 0.14573594333813306,
			name = "node_4",
			type = "TRAVEL",
			prev = {
				[1] = "node_3",
			},
			next = {
				[1] = "node_5",
				[2] = "node_9",
			},
		},
		node_13 = {
			connected_to = 2,
			layout_x = 0.4190589560949468,
			layout_y = 0.7938252524723747,
			name = "node_13",
			type = "SHOP",
			prev = {
				[1] = "node_12",
				[2] = "node_16",
			},
			next = {
				[1] = "node_11",
				[2] = "node_14",
			},
		},
		start = {
			connected_to = 2,
			layout_x = 0,
			layout_y = 0.44946429144038585,
			name = "start",
			type = "START",
			next = {
				[1] = "node_1",
				[2] = "node_15",
			},
			prev = {},
		},
		node_2 = {
			connected_to = 1,
			label = 1,
			layout_x = 0.291636916722908,
			layout_y = 0,
			name = "node_2",
			type = "TRAVEL",
			prev = {
				[1] = "node_1",
			},
			next = {
				[1] = "node_3",
			},
		},
		node_11 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.5208245686432812,
			layout_y = 0.530029601337059,
			name = "node_11",
			type = "TRAVEL",
			prev = {
				[1] = "node_3",
				[2] = "node_13",
			},
			next = {
				[1] = "node_9",
			},
		},
		node_3 = {
			connected_to = 2,
			layout_x = 0.41890310586805757,
			layout_y = 0.23654645408023664,
			name = "node_3",
			type = "SHOP",
			prev = {
				[1] = "node_2",
				[2] = "node_12",
			},
			next = {
				[1] = "node_4",
				[2] = "node_11",
			},
		},
		node_16 = {
			connected_to = 1,
			label = 6,
			layout_x = 0.27874705232807223,
			layout_y = 0.986983640448471,
			name = "node_16",
			type = "TRAVEL",
			prev = {
				[1] = "node_15",
			},
			next = {
				[1] = "node_13",
			},
		},
		node_8 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.842263668236966,
			layout_y = 0.4383351990642756,
			name = "node_8",
			type = "SIGNATURE",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_1 = {
			connected_to = 2,
			label = 1,
			layout_x = 0.1571739366072051,
			layout_y = 0.23955892226231604,
			name = "node_1",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
				[2] = "node_12",
			},
		},
		node_6 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.8971987038054446,
			layout_y = 0.10689864510924942,
			name = "node_6",
			type = "SIGNATURE",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_15 = {
			connected_to = 2,
			label = 5,
			layout_x = 0.14717173439474665,
			layout_y = 0.729760299008403,
			name = "node_15",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_12",
				[2] = "node_16",
			},
		},
		node_5 = {
			connected_to = 2,
			layout_x = 0.7397051370711571,
			layout_y = 0.18147406269993452,
			name = "node_5",
			type = "SHOP",
			prev = {
				[1] = "node_4",
			},
			next = {
				[1] = "node_6",
				[2] = "node_8",
			},
		},
		node_10 = {
			connected_to = 1,
			layout_x = 0.8624753311649693,
			layout_y = 0.8181376254770742,
			name = "node_10",
			type = "SHOP",
			prev = {
				[1] = "node_9",
			},
			next = {
				[1] = "final",
			},
		},
	},
	[12] = {
		node_11 = {
			connected_to = 1,
			label = 4,
			layout_x = 0.15976560580001734,
			layout_y = 0.845479479430954,
			name = "node_11",
			type = "TRAVEL",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
			},
		},
		node_3 = {
			connected_to = 1,
			layout_x = 0.4199811023643944,
			layout_y = 0.5002624260168334,
			name = "node_3",
			type = "SHOP",
			prev = {
				[1] = "node_2",
			},
			next = {
				[1] = "node_4",
			},
		},
		node_8 = {
			connected_to = 1,
			layout_x = 0.815127018520904,
			layout_y = 0.4127710636321567,
			name = "node_8",
			type = "SHOP",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_9 = {
			connected_to = 1,
			layout_x = 0.6293897187798022,
			layout_y = 1,
			name = "node_9",
			type = "SHOP",
			prev = {
				[1] = "node_4",
			},
			next = {
				[1] = "node_10",
			},
		},
		final = {
			layout_x = 1,
			layout_y = 0.44765691146149605,
			name = "final",
			type = "ARENA",
			prev = {
				"node_6",
				"node_8",
				"node_10",
			},
			next = {},
		},
		node_1 = {
			connected_to = 1,
			label = 1,
			layout_x = 0.17305816387530312,
			layout_y = 0.13665031021452043,
			name = "node_1",
			type = "TRAVEL",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
			},
		},
		start = {
			connected_to = 2,
			layout_x = 0,
			layout_y = 0.4426309488883243,
			name = "start",
			type = "START",
			next = {
				[1] = "node_1",
				[2] = "node_11",
			},
			prev = {},
		},
		node_4 = {
			connected_to = 2,
			label = 2,
			layout_x = 0.5859545323378237,
			layout_y = 0.5526690507176941,
			name = "node_4",
			type = "SIGNATURE",
			prev = {
				[1] = "node_3",
			},
			next = {
				[1] = "node_5",
				[2] = "node_9",
			},
		},
		node_6 = {
			connected_to = 1,
			layout_x = 0.8515016750376871,
			layout_y = 0,
			name = "node_6",
			type = "SHOP",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_5 = {
			connected_to = 2,
			label = 2,
			layout_x = 0.6607024671083129,
			layout_y = 0.1180666152269934,
			name = "node_5",
			type = "TRAVEL",
			prev = {
				[1] = "node_4",
			},
			next = {
				[1] = "node_6",
				[2] = "node_8",
			},
		},
		node_10 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.8445438879416592,
			layout_y = 0.9528472864970626,
			name = "node_10",
			type = "TRAVEL",
			prev = {
				[1] = "node_9",
			},
			next = {
				[1] = "final",
			},
		},
		node_2 = {
			connected_to = 1,
			label = 1,
			layout_x = 0.24978196717548917,
			layout_y = 0.5047351112609548,
			name = "node_2",
			type = "SIGNATURE",
			prev = {
				[1] = "node_1",
				[2] = "node_11",
			},
			next = {
				[1] = "node_3",
			},
		},
	},
	[14] = {
		node_11 = {
			connected_to = 1,
			layout_x = 0.661969311361449,
			layout_y = 1,
			name = "node_11",
			type = "SHOP",
			prev = {
				[1] = "node_10",
			},
			next = {
				[1] = "node_12",
			},
		},
		node_3 = {
			connected_to = 2,
			label = 2,
			layout_x = 0.42036988886779436,
			layout_y = 0.5045345123221597,
			name = "node_3",
			type = "SIGNATURE",
			prev = {
				[1] = "node_2",
			},
			next = {
				[1] = "node_4",
				[2] = "node_10",
			},
		},
		node_8 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.6254185441601665,
			layout_y = 0.5035097043129395,
			name = "node_8",
			type = "TRAVEL",
			prev = {
				[1] = "node_4",
				[2] = "node_10",
			},
			next = {
				[1] = "node_9",
			},
		},
		node_9 = {
			connected_to = 1,
			layout_x = 0.8210281269960181,
			layout_y = 0.49937293611552547,
			name = "node_9",
			type = "SHOP",
			prev = {
				[1] = "node_8",
			},
			next = {
				[1] = "final",
			},
		},
		node_1 = {
			connected_to = 1,
			label = 1,
			layout_x = 0.15732375596379436,
			layout_y = 0.22957688348837121,
			name = "node_1",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
			},
		},
		final = {
			layout_x = 1,
			layout_y = 0.4599685817107978,
			name = "final",
			type = "ARENA",
			prev = {
				"node_6",
				"node_9",
				"node_12",
			},
			next = {},
		},
		start = {
			connected_to = 2,
			layout_x = 0,
			layout_y = 0.4547402912810743,
			name = "start",
			type = "START",
			next = {
				[1] = "node_1",
				[2] = "node_13",
			},
			prev = {},
		},
		node_6 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.860540872786134,
			layout_y = 0.1221248376676715,
			name = "node_6",
			type = "TRAVEL",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_12 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.8661110736300294,
			layout_y = 0.8587347398539996,
			name = "node_12",
			type = "TRAVEL",
			prev = {
				[1] = "node_11",
			},
			next = {
				[1] = "final",
			},
		},
		node_4 = {
			connected_to = 2,
			label = 1,
			layout_x = 0.5119322150258756,
			layout_y = 0.20970089778420847,
			name = "node_4",
			type = "TRAVEL",
			prev = {
				[1] = "node_3",
			},
			next = {
				[1] = "node_5",
				[2] = "node_8",
			},
		},
		node_13 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.14574594530125393,
			layout_y = 0.7510339759596772,
			name = "node_13",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
			},
		},
		node_5 = {
			connected_to = 1,
			layout_x = 0.6578544528431869,
			layout_y = 0,
			name = "node_5",
			type = "SHOP",
			prev = {
				[1] = "node_4",
			},
			next = {
				[1] = "node_6",
			},
		},
		node_10 = {
			connected_to = 2,
			label = 4,
			layout_x = 0.5117771221021145,
			layout_y = 0.7977340548772558,
			name = "node_10",
			type = "TRAVEL",
			prev = {
				[1] = "node_3",
			},
			next = {
				[1] = "node_8",
				[2] = "node_11",
			},
		},
		node_2 = {
			connected_to = 1,
			layout_x = 0.24492771221310233,
			layout_y = 0.5015704205650705,
			name = "node_2",
			type = "SHOP",
			prev = {
				[1] = "node_1",
				[2] = "node_13",
			},
			next = {
				[1] = "node_3",
			},
		},
	},
	[19] = {
		node_11 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.15976560580001734,
			layout_y = 0.845479479430954,
			name = "node_11",
			type = "TRAVEL",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
			},
		},
		node_3 = {
			connected_to = 1,
			layout_x = 0.4199811023643944,
			layout_y = 0.5002624260168334,
			name = "node_3",
			type = "SHOP",
			prev = {
				[1] = "node_2",
			},
			next = {
				[1] = "node_4",
			},
		},
		node_8 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.815127018520904,
			layout_y = 0.4127710636321567,
			name = "node_8",
			type = "SIGNATURE",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_9 = {
			connected_to = 1,
			label = 4,
			layout_x = 0.6293897187798022,
			layout_y = 1,
			name = "node_9",
			type = "SIGNATURE",
			prev = {
				[1] = "node_4",
			},
			next = {
				[1] = "node_10",
			},
		},
		final = {
			layout_x = 1,
			layout_y = 0.44765691146149605,
			name = "final",
			type = "ARENA",
			prev = {
				"node_6",
				"node_8",
				"node_10",
			},
			next = {},
		},
		node_1 = {
			connected_to = 1,
			label = 1,
			layout_x = 0.17305816387530312,
			layout_y = 0.13665031021452043,
			name = "node_1",
			type = "TRAVEL",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
			},
		},
		start = {
			connected_to = 2,
			layout_x = 0,
			layout_y = 0.4426309488883243,
			name = "start",
			type = "START",
			next = {
				[1] = "node_1",
				[2] = "node_11",
			},
			prev = {},
		},
		node_4 = {
			connected_to = 2,
			label = 1,
			layout_x = 0.5859545323378237,
			layout_y = 0.5526690507176941,
			name = "node_4",
			type = "SIGNATURE",
			prev = {
				[1] = "node_3",
			},
			next = {
				[1] = "node_5",
				[2] = "node_9",
			},
		},
		node_6 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.8515016750376871,
			layout_y = 0,
			name = "node_6",
			type = "SIGNATURE",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_5 = {
			connected_to = 2,
			layout_x = 0.6607024671083129,
			layout_y = 0.1180666152269934,
			name = "node_5",
			type = "SHOP",
			prev = {
				[1] = "node_4",
			},
			next = {
				[1] = "node_6",
				[2] = "node_8",
			},
		},
		node_10 = {
			connected_to = 1,
			layout_x = 0.8445438879416592,
			layout_y = 0.9528472864970626,
			name = "node_10",
			type = "SHOP",
			prev = {
				[1] = "node_9",
			},
			next = {
				[1] = "final",
			},
		},
		node_2 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.24978196717548917,
			layout_y = 0.5047351112609548,
			name = "node_2",
			type = "TRAVEL",
			prev = {
				[1] = "node_1",
				[2] = "node_11",
			},
			next = {
				[1] = "node_3",
			},
		},
	},
	[24] = {
		node_9 = {
			connected_to = 2,
			layout_x = 0.4432089063951708,
			layout_y = 0.3123916586074417,
			name = "node_9",
			type = "SHOP",
			prev = {
				[1] = "node_2",
				[2] = "node_11",
			},
			next = {
				[1] = "node_4",
				[2] = "node_10",
			},
		},
		node_14 = {
			connected_to = 2,
			label = 3,
			layout_x = 0.14955646072827278,
			layout_y = 0.6852104407319104,
			name = "node_14",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_11",
				[2] = "node_15",
			},
		},
		final = {
			layout_x = 1,
			layout_y = 0.4646651598973653,
			name = "final",
			type = "ARENA",
			prev = {
				[1] = "node_6",
				[2] = "node_8",
			},
			next = {},
		},
		node_12 = {
			connected_to = 2,
			layout_x = 0.4427586662161235,
			layout_y = 0.691264676128776,
			name = "node_12",
			type = "SHOP",
			prev = {
				[1] = "node_11",
				[2] = "node_15",
			},
			next = {
				[1] = "node_10",
				[2] = "node_13",
			},
		},
		node_4 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.6142266923854326,
			layout_y = 0.18938019754761448,
			name = "node_4",
			type = "TRAVEL",
			prev = {
				[1] = "node_3",
				[2] = "node_9",
			},
			next = {
				[1] = "node_5",
			},
		},
		node_13 = {
			connected_to = 1,
			label = 5,
			layout_x = 0.615817641836124,
			layout_y = 0.8133003365427212,
			name = "node_13",
			type = "TRAVEL",
			prev = {
				[1] = "node_12",
				[2] = "node_16",
			},
			next = {
				[1] = "node_5",
			},
		},
		start = {
			connected_to = 2,
			layout_x = 0,
			layout_y = 0.46513278703216404,
			name = "start",
			type = "START",
			next = {
				[1] = "node_1",
				[2] = "node_14",
			},
			prev = {},
		},
		node_2 = {
			connected_to = 2,
			label = 1,
			layout_x = 0.31294322536324,
			layout_y = 0.12532681308003282,
			name = "node_2",
			type = "TRAVEL",
			prev = {
				[1] = "node_1",
			},
			next = {
				[1] = "node_3",
				[2] = "node_9",
			},
		},
		node_11 = {
			connected_to = 2,
			label = 4,
			layout_x = 0.28866831575775964,
			layout_y = 0.5008000215922925,
			name = "node_11",
			type = "TRAVEL",
			prev = {
				[1] = "node_1",
				[2] = "node_14",
			},
			next = {
				[1] = "node_9",
				[2] = "node_12",
			},
		},
		node_3 = {
			connected_to = 1,
			layout_x = 0.4792407810040421,
			layout_y = 0,
			name = "node_3",
			type = "SHOP",
			prev = {
				[1] = "node_2",
			},
			next = {
				[1] = "node_4",
			},
		},
		node_16 = {
			connected_to = 1,
			layout_x = 0.4778900474051489,
			layout_y = 1,
			name = "node_16",
			type = "SHOP",
			prev = {
				[1] = "node_15",
			},
			next = {
				[1] = "node_13",
			},
		},
		node_8 = {
			connected_to = 1,
			layout_x = 0.8724085915468037,
			layout_y = 0.6782877625813192,
			name = "node_8",
			type = "SHOP",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_1 = {
			connected_to = 2,
			label = 1,
			layout_x = 0.1567904018690759,
			layout_y = 0.3012354059205374,
			name = "node_1",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
				[2] = "node_11",
			},
		},
		node_6 = {
			connected_to = 1,
			layout_x = 0.8627146088812269,
			layout_y = 0.3035657258282009,
			name = "node_6",
			type = "SHOP",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_15 = {
			connected_to = 2,
			label = 6,
			layout_x = 0.30895178577039156,
			layout_y = 0.8726589929412838,
			name = "node_15",
			type = "TRAVEL",
			prev = {
				[1] = "node_14",
			},
			next = {
				[1] = "node_12",
				[2] = "node_16",
			},
		},
		node_5 = {
			connected_to = 2,
			label = 2,
			layout_x = 0.726732802360939,
			layout_y = 0.500797144826242,
			name = "node_5",
			type = "SIGNATURE",
			prev = {
				"node_4",
				"node_10",
				"node_13",
			},
			next = {
				[1] = "node_6",
				[2] = "node_8",
			},
		},
		node_10 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.5603947721739869,
			layout_y = 0.5025113312480595,
			name = "node_10",
			type = "TRAVEL",
			prev = {
				[1] = "node_9",
				[2] = "node_12",
			},
			next = {
				[1] = "node_5",
			},
		},
	},
	[29] = {
		node_11 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.34087035649918473,
			layout_y = 1,
			name = "node_11",
			type = "SIGNATURE",
			prev = {
				[1] = "node_10",
			},
			next = {
				[1] = "node_3",
			},
		},
		node_3 = {
			connected_to = 1,
			layout_x = 0.4064454429658323,
			layout_y = 0.50433658498645,
			name = "node_3",
			type = "SHOP",
			prev = {
				[1] = "node_2",
				[2] = "node_11",
			},
			next = {
				[1] = "node_4",
			},
		},
		node_8 = {
			connected_to = 1,
			layout_x = 0.6591296435008149,
			layout_y = 0.9999999999999997,
			name = "node_8",
			type = "SHOP",
			prev = {
				[1] = "node_4",
			},
			next = {
				[1] = "node_9",
			},
		},
		node_9 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.8489841908594788,
			layout_y = 0.8752833372053129,
			name = "node_9",
			type = "TRAVEL",
			prev = {
				[1] = "node_8",
			},
			next = {
				[1] = "final",
			},
		},
		final = {
			layout_x = 1,
			layout_y = 0.43319249246751523,
			name = "final",
			type = "ARENA",
			prev = {
				[1] = "node_6",
				[2] = "node_9",
			},
			next = {},
		},
		node_1 = {
			connected_to = 1,
			label = 1,
			layout_x = 0.1591807027862862,
			layout_y = 0.0868728025422634,
			name = "node_1",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
			},
		},
		start = {
			connected_to = 2,
			layout_x = 0,
			layout_y = 0.4331924924675154,
			name = "start",
			type = "START",
			next = {
				[1] = "node_1",
				[2] = "node_10",
			},
			prev = {},
		},
		node_4 = {
			connected_to = 2,
			label = 2,
			layout_x = 0.593554557034167,
			layout_y = 0.5043365849864498,
			name = "node_4",
			type = "SIGNATURE",
			prev = {
				[1] = "node_3",
			},
			next = {
				[1] = "node_5",
				[2] = "node_8",
			},
		},
		node_6 = {
			connected_to = 1,
			layout_x = 0.8408192972137134,
			layout_y = 0.0868728025422637,
			name = "node_6",
			type = "SHOP",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_5 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.6533521277006283,
			layout_y = 0,
			name = "node_5",
			type = "TRAVEL",
			prev = {
				[1] = "node_4",
			},
			next = {
				[1] = "node_6",
			},
		},
		node_10 = {
			connected_to = 1,
			label = 4,
			layout_x = 0.15101580914052098,
			layout_y = 0.8752833372053133,
			name = "node_10",
			type = "TRAVEL",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_11",
			},
		},
		node_2 = {
			connected_to = 1,
			label = 1,
			layout_x = 0.3466478722993711,
			layout_y = 0,
			name = "node_2",
			type = "TRAVEL",
			prev = {
				[1] = "node_1",
			},
			next = {
				[1] = "node_3",
			},
		},
	},
	[31] = {
		node_11 = {
			connected_to = 1,
			layout_x = 0.4155330446031629,
			layout_y = 0.5384300426873827,
			name = "node_11",
			type = "SHOP",
			prev = {
				[1] = "node_10",
			},
			next = {
				[1] = "node_4",
			},
		},
		node_3 = {
			connected_to = 1,
			label = 1,
			layout_x = 0.49461230965158737,
			layout_y = 0,
			name = "node_3",
			type = "TRAVEL",
			prev = {
				[1] = "node_2",
			},
			next = {
				[1] = "node_4",
			},
		},
		node_8 = {
			connected_to = 1,
			layout_x = 0.8285025442622399,
			layout_y = 0.6637922661828196,
			name = "node_8",
			type = "SHOP",
			prev = {
				[1] = "node_5",
				[2] = "node_9",
			},
			next = {
				[1] = "final",
			},
		},
		node_9 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.689673828122672,
			layout_y = 0.9003398257642266,
			name = "node_9",
			type = "SIGNATURE",
			prev = {
				[1] = "node_4",
			},
			next = {
				[1] = "node_8",
			},
		},
		node_1 = {
			connected_to = 2,
			label = 1,
			layout_x = 0.1825276374758182,
			layout_y = 0.3153451542873034,
			name = "node_1",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
				[2] = "node_10",
			},
		},
		final = {
			layout_x = 1,
			layout_y = 0.4292454173132764,
			name = "final",
			type = "ARENA",
			prev = {
				[1] = "node_6",
				[2] = "node_8",
			},
			next = {},
		},
		start = {
			connected_to = 2,
			layout_x = 0,
			layout_y = 0.461057313658431,
			name = "start",
			type = "START",
			next = {
				[1] = "node_1",
				[2] = "node_13",
			},
			prev = {},
		},
		node_6 = {
			connected_to = 1,
			layout_x = 0.86829257979749,
			layout_y = 0.14007699254324654,
			name = "node_6",
			type = "SHOP",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_12 = {
			connected_to = 1,
			layout_x = 0.46133039863644015,
			layout_y = 1,
			name = "node_12",
			type = "SHOP",
			prev = {
				[1] = "node_10",
			},
			next = {
				[1] = "node_4",
			},
		},
		node_4 = {
			connected_to = 2,
			label = 2,
			layout_x = 0.5718810666449219,
			layout_y = 0.5367631477830703,
			name = "node_4",
			type = "TRAVEL",
			prev = {
				"node_3",
				"node_11",
				"node_12",
			},
			next = {
				[1] = "node_5",
				[2] = "node_9",
			},
		},
		node_13 = {
			connected_to = 1,
			label = 4,
			layout_x = 0.12016687886037433,
			layout_y = 0.825792399961844,
			name = "node_13",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_10",
			},
		},
		node_5 = {
			connected_to = 2,
			label = 2,
			layout_x = 0.714239466695083,
			layout_y = 0.2837414222882057,
			name = "node_5",
			type = "SIGNATURE",
			prev = {
				[1] = "node_4",
			},
			next = {
				[1] = "node_6",
				[2] = "node_8",
			},
		},
		node_10 = {
			connected_to = 2,
			label = 3,
			layout_x = 0.29392556928210856,
			layout_y = 0.7685489858373836,
			name = "node_10",
			type = "TRAVEL",
			prev = {
				[1] = "node_1",
				[2] = "node_13",
			},
			next = {
				[1] = "node_11",
				[2] = "node_12",
			},
		},
		node_2 = {
			connected_to = 1,
			layout_x = 0.3147409263109504,
			layout_y = 0.009038364501802886,
			name = "node_2",
			type = "SHOP",
			prev = {
				[1] = "node_1",
			},
			next = {
				[1] = "node_3",
			},
		},
	},
	[35] = {
		node_9 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.5632848016683755,
			layout_y = 0.3961930335144085,
			name = "node_9",
			type = "TRAVEL",
			prev = {
				[1] = "node_3",
			},
			next = {
				[1] = "node_10",
			},
		},
		node_14 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.521445986952238,
			layout_y = 0.6970819175144082,
			name = "node_14",
			type = "SIGNATURE",
			prev = {
				[1] = "node_13",
			},
			next = {
				[1] = "node_10",
			},
		},
		final = {
			layout_x = 1,
			layout_y = 0.48150216788190214,
			name = "final",
			type = "ARENA",
			prev = {
				"node_6",
				"node_8",
				"node_11",
			},
			next = {},
		},
		node_12 = {
			connected_to = 1,
			label = 5,
			layout_x = 0.25777484708354365,
			layout_y = 0.6709902481846023,
			name = "node_12",
			type = "TRAVEL",
			prev = {
				[1] = "node_1",
				[2] = "node_17",
			},
			next = {
				[1] = "node_13",
			},
		},
		node_4 = {
			connected_to = 1,
			label = 1,
			layout_x = 0.5552851047223988,
			layout_y = 0,
			name = "node_4",
			type = "TRAVEL",
			prev = {
				[1] = "node_3",
			},
			next = {
				[1] = "node_5",
			},
		},
		node_13 = {
			connected_to = 2,
			layout_x = 0.40140733093325476,
			layout_y = 0.8629426577984539,
			name = "node_13",
			type = "SHOP",
			prev = {
				[1] = "node_12",
			},
			next = {
				[1] = "node_14",
				[2] = "node_15",
			},
		},
		start = {
			connected_to = 2,
			layout_x = 0,
			layout_y = 0.5082005530443121,
			name = "start",
			type = "START",
			next = {
				[1] = "node_1",
				[2] = "node_17",
			},
			prev = {},
		},
		node_2 = {
			connected_to = 1,
			layout_x = 0.27854843776409155,
			layout_y = 0.22392047605616508,
			name = "node_2",
			type = "SHOP",
			prev = {
				[1] = "node_1",
			},
			next = {
				[1] = "node_3",
			},
		},
		node_11 = {
			connected_to = 1,
			layout_x = 0.8669172948208165,
			layout_y = 0.7840533438129794,
			name = "node_11",
			type = "SHOP",
			prev = {
				[1] = "node_10",
				[2] = "node_16",
			},
			next = {
				[1] = "final",
			},
		},
		node_3 = {
			connected_to = 2,
			label = 2,
			layout_x = 0.44405148054986826,
			layout_y = 0.19118735956075364,
			name = "node_3",
			type = "SIGNATURE",
			prev = {
				[1] = "node_2",
			},
			next = {
				[1] = "node_4",
				[2] = "node_9",
			},
		},
		node_16 = {
			connected_to = 1,
			label = 1,
			layout_x = 0.7352669550125098,
			layout_y = 1,
			name = "node_16",
			type = "TRAVEL",
			prev = {
				[1] = "node_15",
			},
			next = {
				[1] = "node_11",
			},
		},
		node_8 = {
			connected_to = 1,
			layout_x = 0.8211140219119685,
			layout_y = 0.4450333379844231,
			name = "node_8",
			type = "SHOP",
			prev = {
				[1] = "node_5",
				[2] = "node_10",
			},
			next = {
				[1] = "final",
			},
		},
		node_17 = {
			connected_to = 1,
			label = 5,
			layout_x = 0.10818242259295895,
			layout_y = 0.7616238481519628,
			name = "node_17",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_12",
			},
		},
		node_1 = {
			connected_to = 2,
			label = 1,
			layout_x = 0.1586777087304725,
			layout_y = 0.39869768287541435,
			name = "node_1",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
				[2] = "node_12",
			},
		},
		node_6 = {
			connected_to = 1,
			layout_x = 0.9098054603017129,
			layout_y = 0.19245982819554244,
			name = "node_6",
			type = "SHOP",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_15 = {
			connected_to = 2,
			label = 4,
			layout_x = 0.566536171040949,
			layout_y = 0.9788747409731068,
			name = "node_15",
			type = "SIGNATURE",
			prev = {
				[1] = "node_13",
			},
			next = {
				[1] = "node_10",
				[2] = "node_16",
			},
		},
		node_5 = {
			connected_to = 2,
			label = 2,
			layout_x = 0.735204364452063,
			layout_y = 0.1453232929618022,
			name = "node_5",
			type = "TRAVEL",
			prev = {
				[1] = "node_4",
			},
			next = {
				[1] = "node_6",
				[2] = "node_8",
			},
		},
		node_10 = {
			connected_to = 2,
			label = 4,
			layout_x = 0.6848348767894664,
			layout_y = 0.6585232307954216,
			name = "node_10",
			type = "TRAVEL",
			prev = {
				"node_9",
				"node_14",
				"node_15",
			},
			next = {
				[1] = "node_8",
				[2] = "node_11",
			},
		},
	},
	[39] = {
		node_19 = {
			connected_to = 1,
			label = 4,
			layout_x = 0.6972519304791434,
			layout_y = 0.7274024282428182,
			name = "node_19",
			type = "SIGNATURE",
			prev = {
				[1] = "node_18",
			},
			next = {
				[1] = "node_10",
			},
		},
		node_9 = {
			connected_to = 1,
			layout_x = 0.8568686322129029,
			layout_y = 0.4279840246320511,
			name = "node_9",
			type = "SHOP",
			prev = {
				[1] = "node_8",
			},
			next = {
				[1] = "final",
			},
		},
		node_14 = {
			connected_to = 1,
			layout_x = 0.3863085587407048,
			layout_y = 0.4057293317042295,
			name = "node_14",
			type = "SHOP",
			prev = {
				[1] = "node_13",
			},
			next = {
				[1] = "node_15",
			},
		},
		final = {
			layout_x = 1,
			layout_y = 0.42553551679295215,
			name = "final",
			type = "ARENA",
			prev = {
				"node_6",
				"node_9",
				"node_10",
			},
			next = {},
		},
		node_12 = {
			connected_to = 2,
			label = 5,
			layout_x = 0.12465517664047293,
			layout_y = 0.6499452703542637,
			name = "node_12",
			type = "TRAVEL",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_13",
				[2] = "node_16",
			},
		},
		node_4 = {
			connected_to = 2,
			label = 1,
			layout_x = 0.6033160129773375,
			layout_y = 0.03090281884882559,
			name = "node_4",
			type = "TRAVEL",
			prev = {
				[1] = "node_3",
			},
			next = {
				[1] = "node_5",
				[2] = "node_8",
			},
		},
		node_13 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.24213708271760065,
			layout_y = 0.4913070682233676,
			name = "node_13",
			type = "SIGNATURE",
			prev = {
				[1] = "node_12",
			},
			next = {
				[1] = "node_14",
			},
		},
		node_20 = {
			connected_to = 1,
			label = 5,
			layout_x = 0.7422380017775506,
			layout_y = 0.9447421728007661,
			name = "node_20",
			type = "SIGNATURE",
			prev = {
				[1] = "node_18",
			},
			next = {
				[1] = "node_10",
			},
		},
		start = {
			connected_to = 2,
			layout_x = 0,
			layout_y = 0.43056080779528355,
			name = "start",
			type = "START",
			next = {
				[1] = "node_1",
				[2] = "node_12",
			},
			prev = {},
		},
		node_2 = {
			connected_to = 1,
			layout_x = 0.24930170934733759,
			layout_y = 0.0675817851552707,
			name = "node_2",
			type = "SHOP",
			prev = {
				[1] = "node_1",
			},
			next = {
				[1] = "node_3",
			},
		},
		node_11 = {
			connected_to = 1,
			label = 4,
			layout_x = 0.545113129181939,
			layout_y = 0.22827600551072946,
			name = "node_11",
			type = "TRAVEL",
			prev = {
				[1] = "node_3",
			},
			next = {
				[1] = "node_8",
			},
		},
		node_3 = {
			connected_to = 2,
			label = 2,
			layout_x = 0.4282967950372966,
			layout_y = 0.030430027311674806,
			name = "node_3",
			type = "SIGNATURE",
			prev = {
				[1] = "node_2",
			},
			next = {
				[1] = "node_4",
				[2] = "node_11",
			},
		},
		node_16 = {
			connected_to = 2,
			label = 6,
			layout_x = 0.2589193387420625,
			layout_y = 0.8451940247353845,
			name = "node_16",
			type = "TRAVEL",
			prev = {
				[1] = "node_12",
			},
			next = {
				[1] = "node_17",
				[2] = "node_21",
			},
		},
		node_8 = {
			connected_to = 2,
			label = 3,
			layout_x = 0.6919973166817192,
			layout_y = 0.3699893732214522,
			name = "node_8",
			type = "TRAVEL",
			prev = {
				"node_4",
				"node_11",
				"node_15",
			},
			next = {
				[1] = "node_9",
				[2] = "node_10",
			},
		},
		node_17 = {
			connected_to = 1,
			layout_x = 0.4082953747119032,
			layout_y = 0.7535848035953547,
			name = "node_17",
			type = "SHOP",
			prev = {
				[1] = "node_16",
			},
			next = {
				[1] = "node_18",
			},
		},
		node_1 = {
			connected_to = 1,
			label = 1,
			layout_x = 0.10851526535803557,
			layout_y = 0.22341785028393754,
			name = "node_1",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
			},
		},
		node_6 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.9062033031914548,
			layout_y = 0.15699458239053152,
			name = "node_6",
			type = "TRAVEL",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_15 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.5447836985474654,
			layout_y = 0.49327371886926247,
			name = "node_15",
			type = "SIGNATURE",
			prev = {
				[1] = "node_14",
			},
			next = {
				[1] = "node_8",
			},
		},
		node_18 = {
			connected_to = 2,
			label = 2,
			layout_x = 0.5622246289640169,
			layout_y = 0.8865319879485565,
			name = "node_18",
			type = "SIGNATURE",
			prev = {
				[1] = "node_17",
				[2] = "node_21",
			},
			next = {
				[1] = "node_19",
				[2] = "node_20",
			},
		},
		node_5 = {
			connected_to = 1,
			layout_x = 0.7599555282499796,
			layout_y = 0,
			name = "node_5",
			type = "SHOP",
			prev = {
				[1] = "node_4",
			},
			next = {
				[1] = "node_6",
			},
		},
		node_10 = {
			connected_to = 1,
			layout_x = 0.8449591949806485,
			layout_y = 0.6765526274661324,
			name = "node_10",
			type = "SHOP",
			prev = {
				"node_8",
				"node_19",
				"node_20",
			},
			next = {
				[1] = "final",
			},
		},
		node_21 = {
			connected_to = 1,
			layout_x = 0.40012221502112544,
			layout_y = 1,
			name = "node_21",
			type = "SHOP",
			prev = {
				[1] = "node_16",
			},
			next = {
				[1] = "node_18",
			},
		},
	},
	[47] = {
		node_9 = {
			connected_to = 1,
			label = 4,
			layout_x = 0.5023965018299668,
			layout_y = 0.4553309440680521,
			name = "node_9",
			type = "TRAVEL",
			prev = {
				[1] = "node_3",
				[2] = "node_13",
			},
			next = {
				[1] = "node_10",
			},
		},
		node_14 = {
			connected_to = 2,
			label = 4,
			layout_x = 0.5438062918744428,
			layout_y = 0.9106516054717778,
			name = "node_14",
			type = "SIGNATURE",
			prev = {
				[1] = "node_13",
			},
			next = {
				[1] = "node_15",
				[2] = "node_16",
			},
		},
		final = {
			layout_x = 1,
			layout_y = 0.4256691897164434,
			name = "final",
			type = "ARENA",
			prev = {
				"node_6",
				"node_8",
				"node_11",
			},
			next = {},
		},
		node_12 = {
			connected_to = 2,
			label = 5,
			layout_x = 0.29151045870581915,
			layout_y = 0.43648527722013447,
			name = "node_12",
			type = "TRAVEL",
			prev = {
				[1] = "node_1",
			},
			next = {
				[1] = "node_3",
				[2] = "node_13",
			},
		},
		node_4 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.5394843819231298,
			layout_y = 0,
			name = "node_4",
			type = "SIGNATURE",
			prev = {
				[1] = "node_3",
			},
			next = {
				[1] = "node_5",
			},
		},
		node_13 = {
			connected_to = 2,
			layout_x = 0.3973879239558881,
			layout_y = 0.7032422122285487,
			name = "node_13",
			type = "SHOP",
			prev = {
				[1] = "node_12",
				[2] = "node_18",
			},
			next = {
				[1] = "node_9",
				[2] = "node_14",
			},
		},
		start = {
			connected_to = 2,
			layout_x = 0,
			layout_y = 0.44541744731494026,
			name = "start",
			type = "START",
			next = {
				[1] = "node_1",
				[2] = "node_17",
			},
			prev = {},
		},
		node_2 = {
			connected_to = 1,
			label = 1,
			layout_x = 0.26801546560822914,
			layout_y = 0.04581594920754672,
			name = "node_2",
			type = "TRAVEL",
			prev = {
				[1] = "node_1",
			},
			next = {
				[1] = "node_3",
			},
		},
		node_11 = {
			connected_to = 1,
			layout_x = 0.8301522001379286,
			layout_y = 0.7040787747645918,
			name = "node_11",
			type = "SHOP",
			prev = {
				"node_10",
				"node_15",
				"node_16",
			},
			next = {
				[1] = "final",
			},
		},
		node_3 = {
			connected_to = 2,
			layout_x = 0.4087556754426795,
			layout_y = 0.21183540073020152,
			name = "node_3",
			type = "SHOP",
			prev = {
				[1] = "node_2",
				[2] = "node_12",
			},
			next = {
				[1] = "node_4",
				[2] = "node_9",
			},
		},
		node_16 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.7162136830413934,
			layout_y = 1,
			name = "node_16",
			type = "TRAVEL",
			prev = {
				[1] = "node_14",
			},
			next = {
				[1] = "node_11",
			},
		},
		node_8 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.8546730959868696,
			layout_y = 0.34559100586740427,
			name = "node_8",
			type = "TRAVEL",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_17 = {
			connected_to = 1,
			label = 6,
			layout_x = 0.11178186980290929,
			layout_y = 0.7235117377072253,
			name = "node_17",
			type = "TRAVEL",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_18",
			},
		},
		node_1 = {
			connected_to = 2,
			label = 1,
			layout_x = 0.14777371481228976,
			layout_y = 0.25829523775086044,
			name = "node_1",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
				[2] = "node_12",
			},
		},
		node_6 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.9022371484773694,
			layout_y = 0.1159943749701961,
			name = "node_6",
			type = "TRAVEL",
			prev = {
				[1] = "node_5",
			},
			next = {
				[1] = "final",
			},
		},
		node_15 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.6740041732470147,
			layout_y = 0.7498192903526503,
			name = "node_15",
			type = "TRAVEL",
			prev = {
				[1] = "node_14",
			},
			next = {
				[1] = "node_11",
			},
		},
		node_5 = {
			connected_to = 2,
			layout_x = 0.7309757083673573,
			layout_y = 0.05945317904713494,
			name = "node_5",
			type = "SHOP",
			prev = {
				[1] = "node_4",
			},
			next = {
				[1] = "node_6",
				[2] = "node_8",
			},
		},
		node_10 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.6754825212318449,
			layout_y = 0.4482208441088144,
			name = "node_10",
			type = "SIGNATURE",
			prev = {
				[1] = "node_9",
			},
			next = {
				[1] = "node_11",
			},
		},
		node_18 = {
			connected_to = 1,
			label = 5,
			layout_x = 0.2635858331364232,
			layout_y = 0.893640476423129,
			name = "node_18",
			type = "SIGNATURE",
			prev = {
				[1] = "node_17",
			},
			next = {
				[1] = "node_13",
			},
		},
	},
}
