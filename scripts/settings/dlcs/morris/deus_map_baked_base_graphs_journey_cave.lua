return {
	[0] = {
		node_19 = {
			layout_y = 0.8700455706759692,
			name = "node_19",
			type = "SIGNATURE",
			connected_to = 1,
			label = 3,
			layout_x = 0.7121196903334864,
			prev = {
				[1.0] = "node_18",
				[2.0] = "node_21"
			},
			next = {
				[1.0] = "node_10"
			}
		},
		node_9 = {
			type = "SIGNATURE",
			name = "node_9",
			layout_y = 0.35660611714673907,
			connected_to = 1,
			label = 4,
			layout_x = 0.6874760681638376,
			prev = {
				[1.0] = "node_4",
				[2.0] = "node_13"
			},
			next = {
				[1.0] = "node_10"
			}
		},
		node_14 = {
			type = "SIGNATURE",
			name = "node_14",
			layout_y = 0.6098293355241489,
			connected_to = 1,
			label = 5,
			layout_x = 0.6744333735011498,
			prev = {
				[1.0] = "node_13",
				[2.0] = "node_18"
			},
			next = {
				[1.0] = "node_10"
			}
		},
		final = {
			name = "final",
			type = "ARENA",
			layout_y = 0.4382208721337627,
			layout_x = 1,
			prev = {
				"node_6",
				"node_8",
				"node_10"
			},
			next = {}
		},
		node_12 = {
			name = "node_12",
			layout_y = 0.30026192712652816,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.42581040720501506,
			prev = {
				[1.0] = "node_11"
			},
			next = {
				[1.0] = "node_4",
				[2.0] = "node_13"
			}
		},
		node_4 = {
			type = "TRAVEL",
			name = "node_4",
			layout_y = 0.1256461738854647,
			connected_to = 2,
			label = 2,
			layout_x = 0.5656574268029412,
			prev = {
				[1.0] = "node_3",
				[2.0] = "node_12"
			},
			next = {
				[1.0] = "node_5",
				[2.0] = "node_9"
			}
		},
		node_13 = {
			type = "TRAVEL",
			name = "node_13",
			layout_y = 0.42140224331503956,
			connected_to = 2,
			label = 4,
			layout_x = 0.5587441361606585,
			prev = {
				[1.0] = "node_12"
			},
			next = {
				[1.0] = "node_9",
				[2.0] = "node_14"
			}
		},
		node_20 = {
			name = "node_20",
			layout_y = 0.9189762616007114,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.4161679496907288,
			prev = {
				[1.0] = "node_16"
			},
			next = {
				[1.0] = "node_18",
				[2.0] = "node_21"
			}
		},
		start = {
			layout_y = 0.4549130485552151,
			name = "start",
			type = "START",
			connected_to = 2,
			layout_x = 0,
			next = {
				[1.0] = "node_1",
				[2.0] = "node_15"
			},
			prev = {}
		},
		node_2 = {
			name = "node_2",
			layout_y = 0.09215524278486302,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.23957172948797498,
			prev = {
				[1.0] = "node_1"
			},
			next = {
				[1.0] = "node_3"
			}
		},
		node_11 = {
			type = "TRAVEL",
			name = "node_11",
			layout_y = 0.39905977580293217,
			connected_to = 1,
			label = 3,
			layout_x = 0.2632427623467295,
			prev = {
				[1.0] = "node_1"
			},
			next = {
				[1.0] = "node_12"
			}
		},
		node_3 = {
			type = "TRAVEL",
			name = "node_3",
			layout_y = 0,
			connected_to = 1,
			label = 1,
			layout_x = 0.4037335484627524,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_4"
			}
		},
		node_16 = {
			type = "TRAVEL",
			name = "node_16",
			layout_y = 0.8103369229025039,
			connected_to = 2,
			label = 6,
			layout_x = 0.2562467676560443,
			prev = {
				[1.0] = "node_15"
			},
			next = {
				[1.0] = "node_17",
				[2.0] = "node_20"
			}
		},
		node_8 = {
			type = "SIGNATURE",
			name = "node_8",
			layout_y = 0.3696959532568208,
			connected_to = 1,
			label = 3,
			layout_x = 0.868641901548558,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_17 = {
			name = "node_17",
			layout_y = 0.671634431362278,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.38104785891741144,
			prev = {
				[1.0] = "node_16"
			},
			next = {
				[1.0] = "node_18"
			}
		},
		node_1 = {
			type = "SIGNATURE",
			name = "node_1",
			layout_y = 0.28592432658312167,
			connected_to = 2,
			label = 1,
			layout_x = 0.12872723028946012,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2",
				[2.0] = "node_11"
			}
		},
		node_6 = {
			type = "SIGNATURE",
			name = "node_6",
			layout_y = 0.1754997042079836,
			connected_to = 1,
			label = 2,
			layout_x = 0.9179320466665882,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_15 = {
			type = "TRAVEL",
			name = "node_15",
			layout_y = 0.6802294379567957,
			connected_to = 1,
			label = 5,
			layout_x = 0.1011593198410713,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_16"
			}
		},
		node_18 = {
			type = "SIGNATURE",
			name = "node_18",
			layout_y = 0.7476021573333965,
			connected_to = 2,
			label = 4,
			layout_x = 0.545434414640425,
			prev = {
				[1.0] = "node_17",
				[2.0] = "node_20"
			},
			next = {
				[1.0] = "node_14",
				[2.0] = "node_19"
			}
		},
		node_5 = {
			name = "node_5",
			layout_y = 0.11304105854721103,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.7578637003238679,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_6",
				[2.0] = "node_8"
			}
		},
		node_10 = {
			name = "node_10",
			layout_y = 0.6437056354842976,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.8322061382092447,
			prev = {
				"node_9",
				"node_14",
				"node_19"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_21 = {
			type = "SIGNATURE",
			name = "node_21",
			layout_y = 1,
			connected_to = 1,
			label = 2,
			layout_x = 0.5704436121315017,
			prev = {
				[1.0] = "node_20"
			},
			next = {
				[1.0] = "node_19"
			}
		}
	},
	{
		node_9 = {
			name = "node_9",
			layout_y = 0.5412142648305438,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.41725796702459594,
			prev = {
				[1.0] = "node_2",
				[2.0] = "node_14"
			},
			next = {
				[1.0] = "node_10"
			}
		},
		node_14 = {
			type = "TRAVEL",
			name = "node_14",
			layout_y = 0.7125690512915223,
			connected_to = 2,
			label = 4,
			layout_x = 0.2815964790368466,
			prev = {
				[1.0] = "node_1",
				[2.0] = "node_16"
			},
			next = {
				[1.0] = "node_9",
				[2.0] = "node_15"
			}
		},
		final = {
			name = "final",
			type = "ARENA",
			layout_y = 0.4685563899319462,
			layout_x = 1,
			prev = {
				"node_6",
				"node_8",
				"node_12"
			},
			next = {}
		},
		node_12 = {
			type = "SIGNATURE",
			name = "node_12",
			layout_y = 0.8004392338236451,
			connected_to = 1,
			label = 2,
			layout_x = 0.8574808184277082,
			prev = {
				[1.0] = "node_11",
				[2.0] = "node_13"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_4 = {
			type = "TRAVEL",
			name = "node_4",
			layout_y = 0.14811686651677589,
			connected_to = 1,
			label = 2,
			layout_x = 0.5628666818960198,
			prev = {
				[1.0] = "node_3"
			},
			next = {
				[1.0] = "node_5"
			}
		},
		node_13 = {
			name = "node_13",
			layout_y = 1,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.6990131403550625,
			prev = {
				[1.0] = "node_10"
			},
			next = {
				[1.0] = "node_12"
			}
		},
		start = {
			layout_y = 0.48654070218259227,
			name = "start",
			type = "START",
			connected_to = 2,
			layout_x = 0,
			next = {
				[1.0] = "node_1",
				[2.0] = "node_16"
			},
			prev = {}
		},
		node_2 = {
			type = "TRAVEL",
			name = "node_2",
			layout_y = 0.24225130469603678,
			connected_to = 2,
			label = 1,
			layout_x = 0.32409938491909196,
			prev = {
				[1.0] = "node_1"
			},
			next = {
				[1.0] = "node_3",
				[2.0] = "node_9"
			}
		},
		node_11 = {
			name = "node_11",
			layout_y = 0.6368166240082666,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.7091464987527607,
			prev = {
				[1.0] = "node_10"
			},
			next = {
				[1.0] = "node_8",
				[2.0] = "node_12"
			}
		},
		node_3 = {
			name = "node_3",
			layout_y = 0,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.42220382567763,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_4"
			}
		},
		node_16 = {
			type = "SIGNATURE",
			name = "node_16",
			layout_y = 0.7623853835233584,
			connected_to = 1,
			label = 4,
			layout_x = 0.11209659729735519,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_14"
			}
		},
		node_8 = {
			type = "SIGNATURE",
			name = "node_8",
			layout_y = 0.42123374600027597,
			connected_to = 1,
			label = 3,
			layout_x = 0.8219042916325315,
			prev = {
				[1.0] = "node_5",
				[2.0] = "node_11"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_1 = {
			type = "SIGNATURE",
			name = "node_1",
			layout_y = 0.38049049242773414,
			connected_to = 2,
			label = 1,
			layout_x = 0.17093676289741302,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2",
				[2.0] = "node_14"
			}
		},
		node_6 = {
			type = "SIGNATURE",
			name = "node_6",
			layout_y = 0.14967710300936726,
			connected_to = 1,
			label = 2,
			layout_x = 0.9076568650829152,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_15 = {
			name = "node_15",
			layout_y = 0.9822082678504775,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.40563091791859507,
			prev = {
				[1.0] = "node_14"
			},
			next = {
				[1.0] = "node_10"
			}
		},
		node_5 = {
			name = "node_5",
			layout_y = 0.1283091058307011,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.7342238067384675,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_6",
				[2.0] = "node_8"
			}
		},
		node_10 = {
			type = "TRAVEL",
			name = "node_10",
			layout_y = 0.8012664828723239,
			connected_to = 2,
			label = 3,
			layout_x = 0.5507425651849007,
			prev = {
				[1.0] = "node_9",
				[2.0] = "node_15"
			},
			next = {
				[1.0] = "node_11",
				[2.0] = "node_13"
			}
		}
	},
	[3] = {
		node_19 = {
			type = "TRAVEL",
			name = "node_19",
			layout_y = 0.9380494614705178,
			connected_to = 2,
			label = 3,
			layout_x = 0.43018792979808534,
			prev = {
				[1.0] = "node_18"
			},
			next = {
				[1.0] = "node_14",
				[2.0] = "node_20"
			}
		},
		node_9 = {
			type = "TRAVEL",
			name = "node_9",
			layout_y = 0.2003114705596979,
			connected_to = 1,
			label = 3,
			layout_x = 0.39902743679429287,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_4"
			}
		},
		node_14 = {
			type = "SIGNATURE",
			name = "node_14",
			layout_y = 0.7415645821109019,
			connected_to = 1,
			label = 4,
			layout_x = 0.552124682910309,
			prev = {
				[1.0] = "node_13",
				[2.0] = "node_19"
			},
			next = {
				[1.0] = "node_15"
			}
		},
		final = {
			name = "final",
			type = "ARENA",
			layout_y = 0.4727756128184678,
			layout_x = 1,
			prev = {
				"node_6",
				"node_8",
				"node_16"
			},
			next = {}
		},
		node_12 = {
			type = "TRAVEL",
			name = "node_12",
			layout_y = 0.4280107358002491,
			connected_to = 1,
			label = 5,
			layout_x = 0.5750614866778844,
			prev = {
				[1.0] = "node_11",
				[2.0] = "node_13"
			},
			next = {
				[1.0] = "node_5"
			}
		},
		node_4 = {
			type = "TRAVEL",
			name = "node_4",
			layout_y = 0.15738957872473397,
			connected_to = 1,
			label = 2,
			layout_x = 0.5443790727841895,
			prev = {
				"node_3",
				"node_9",
				"node_11"
			},
			next = {
				[1.0] = "node_5"
			}
		},
		node_13 = {
			name = "node_13",
			layout_y = 0.6304204381197471,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.42604153180265697,
			prev = {
				[1.0] = "node_10"
			},
			next = {
				[1.0] = "node_12",
				[2.0] = "node_14"
			}
		},
		node_20 = {
			type = "TRAVEL",
			name = "node_20",
			layout_y = 1,
			connected_to = 1,
			label = 5,
			layout_x = 0.5944460537589816,
			prev = {
				[1.0] = "node_19"
			},
			next = {
				[1.0] = "node_21"
			}
		},
		start = {
			layout_y = 0.48896515842172694,
			name = "start",
			type = "START",
			connected_to = 2,
			layout_x = 0,
			next = {
				[1.0] = "node_1",
				[2.0] = "node_17"
			},
			prev = {}
		},
		node_2 = {
			name = "node_2",
			layout_y = 0.14910785888992437,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.2531770941317078,
			prev = {
				[1.0] = "node_1"
			},
			next = {
				[1.0] = "node_3",
				[2.0] = "node_9"
			}
		},
		node_11 = {
			name = "node_11",
			layout_y = 0.4068379923166099,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.43038938596181897,
			prev = {
				[1.0] = "node_10"
			},
			next = {
				[1.0] = "node_4",
				[2.0] = "node_12"
			}
		},
		node_3 = {
			type = "TRAVEL",
			name = "node_3",
			layout_y = 0,
			connected_to = 1,
			label = 1,
			layout_x = 0.4068742173359074,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_4"
			}
		},
		node_16 = {
			name = "node_16",
			layout_y = 0.7201614822508285,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.8801109516144885,
			prev = {
				[1.0] = "node_15",
				[2.0] = "node_21"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_8 = {
			type = "SIGNATURE",
			name = "node_8",
			layout_y = 0.42481893586828984,
			connected_to = 1,
			label = 3,
			layout_x = 0.8538566715987012,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_17 = {
			type = "SIGNATURE",
			name = "node_17",
			layout_y = 0.68688347514966,
			connected_to = 2,
			label = 5,
			layout_x = 0.12833979555160752,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_10",
				[2.0] = "node_18"
			}
		},
		node_1 = {
			type = "SIGNATURE",
			name = "node_1",
			layout_y = 0.34867981914050483,
			connected_to = 2,
			label = 1,
			layout_x = 0.1387525259890414,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2",
				[2.0] = "node_10"
			}
		},
		node_6 = {
			type = "SIGNATURE",
			name = "node_6",
			layout_y = 0.232569348029043,
			connected_to = 1,
			label = 2,
			layout_x = 0.9032925647669142,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_15 = {
			type = "TRAVEL",
			name = "node_15",
			layout_y = 0.6445782589383369,
			connected_to = 1,
			label = 6,
			layout_x = 0.7208503296165775,
			prev = {
				[1.0] = "node_14"
			},
			next = {
				[1.0] = "node_16"
			}
		},
		node_18 = {
			name = "node_18",
			layout_y = 0.8827363328183537,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.24476515438051136,
			prev = {
				[1.0] = "node_17"
			},
			next = {
				[1.0] = "node_19"
			}
		},
		node_5 = {
			name = "node_5",
			layout_y = 0.2567867735545754,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.7228912768154148,
			prev = {
				[1.0] = "node_4",
				[2.0] = "node_12"
			},
			next = {
				[1.0] = "node_6",
				[2.0] = "node_8"
			}
		},
		node_10 = {
			type = "TRAVEL",
			name = "node_10",
			layout_y = 0.5320820016223201,
			connected_to = 2,
			label = 4,
			layout_x = 0.26159331097763716,
			prev = {
				[1.0] = "node_1",
				[2.0] = "node_17"
			},
			next = {
				[1.0] = "node_11",
				[2.0] = "node_13"
			}
		},
		node_21 = {
			type = "SIGNATURE",
			name = "node_21",
			layout_y = 0.9025920806635327,
			connected_to = 1,
			label = 3,
			layout_x = 0.7567190919387266,
			prev = {
				[1.0] = "node_20"
			},
			next = {
				[1.0] = "node_16"
			}
		}
	},
	[4] = {
		node_9 = {
			name = "node_9",
			layout_y = 0.5804655451726757,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.6752575442747897,
			prev = {
				[1.0] = "node_4",
				[2.0] = "node_14"
			},
			next = {
				[1.0] = "node_10"
			}
		},
		node_14 = {
			type = "TRAVEL",
			name = "node_14",
			layout_y = 0.7955698201267881,
			connected_to = 2,
			label = 5,
			layout_x = 0.5690942563042474,
			prev = {
				[1.0] = "node_13",
				[2.0] = "node_18"
			},
			next = {
				[1.0] = "node_9",
				[2.0] = "node_15"
			}
		},
		final = {
			name = "final",
			type = "ARENA",
			layout_y = 0.45373281878084865,
			layout_x = 1,
			prev = {
				"node_6",
				"node_8",
				"node_10"
			},
			next = {}
		},
		node_12 = {
			type = "TRAVEL",
			name = "node_12",
			layout_y = 0.5266237992528048,
			connected_to = 1,
			label = 4,
			layout_x = 0.25112220805203755,
			prev = {
				[1.0] = "node_1",
				[2.0] = "node_16"
			},
			next = {
				[1.0] = "node_13"
			}
		},
		node_4 = {
			type = "TRAVEL",
			name = "node_4",
			layout_y = 0.29922607848755955,
			connected_to = 2,
			label = 2,
			layout_x = 0.5665286703308814,
			prev = {
				"node_3",
				"node_11",
				"node_13"
			},
			next = {
				[1.0] = "node_5",
				[2.0] = "node_9"
			}
		},
		node_13 = {
			name = "node_13",
			layout_y = 0.5748982516411653,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.44775408498021557,
			prev = {
				[1.0] = "node_12"
			},
			next = {
				[1.0] = "node_4",
				[2.0] = "node_14"
			}
		},
		start = {
			layout_y = 0.4633085182761297,
			name = "start",
			type = "START",
			connected_to = 2,
			layout_x = 0,
			next = {
				[1.0] = "node_1",
				[2.0] = "node_16"
			},
			prev = {}
		},
		node_2 = {
			name = "node_2",
			layout_y = 0.08842629943751514,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.2954353287787541,
			prev = {
				[1.0] = "node_1"
			},
			next = {
				[1.0] = "node_3",
				[2.0] = "node_11"
			}
		},
		node_11 = {
			type = "TRAVEL",
			name = "node_11",
			layout_y = 0.2566122914338147,
			connected_to = 1,
			label = 3,
			layout_x = 0.4089565964622798,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_4"
			}
		},
		node_3 = {
			type = "TRAVEL",
			name = "node_3",
			layout_y = 0,
			connected_to = 1,
			label = 1,
			layout_x = 0.47204079351446276,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_4"
			}
		},
		node_16 = {
			type = "SIGNATURE",
			name = "node_16",
			layout_y = 0.7113808520365593,
			connected_to = 2,
			label = 4,
			layout_x = 0.13630946717500755,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_12",
				[2.0] = "node_17"
			}
		},
		node_8 = {
			name = "node_8",
			layout_y = 0.3926535525460106,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.8477158448543227,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_17 = {
			name = "node_17",
			layout_y = 0.9288679981998724,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.27247356843025605,
			prev = {
				[1.0] = "node_16"
			},
			next = {
				[1.0] = "node_18"
			}
		},
		node_1 = {
			type = "SIGNATURE",
			name = "node_1",
			layout_y = 0.2888605492983855,
			connected_to = 2,
			label = 1,
			layout_x = 0.14837402727165402,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2",
				[2.0] = "node_12"
			}
		},
		node_6 = {
			name = "node_6",
			layout_y = 0.16224586960399767,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.9070180000983146,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_15 = {
			name = "node_15",
			layout_y = 0.9379793836640576,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.7239413560701233,
			prev = {
				[1.0] = "node_14"
			},
			next = {
				[1.0] = "node_10"
			}
		},
		node_5 = {
			type = "SIGNATURE",
			name = "node_5",
			layout_y = 0.1603557411937005,
			connected_to = 2,
			label = 2,
			layout_x = 0.7363303495774732,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_6",
				[2.0] = "node_8"
			}
		},
		node_10 = {
			type = "SIGNATURE",
			name = "node_10",
			layout_y = 0.7352487391588557,
			connected_to = 1,
			label = 3,
			layout_x = 0.8524785958524865,
			prev = {
				[1.0] = "node_9",
				[2.0] = "node_15"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_18 = {
			type = "TRAVEL",
			name = "node_18",
			layout_y = 1,
			connected_to = 1,
			label = 1,
			layout_x = 0.4471009973760136,
			prev = {
				[1.0] = "node_17"
			},
			next = {
				[1.0] = "node_14"
			}
		}
	},
	[7] = {
		node_11 = {
			name = "node_11",
			layout_y = 0.6365493905478619,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.40069801138495775,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_4",
				[2.0] = "node_12"
			}
		},
		node_3 = {
			name = "node_3",
			layout_y = 0.0552441309638203,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.3806399665505118,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_4"
			}
		},
		node_8 = {
			name = "node_8",
			layout_y = 0.2990282203520482,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.8333923577388221,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_1 = {
			type = "TRAVEL",
			name = "node_1",
			layout_y = 0.1639964151709176,
			connected_to = 1,
			label = 1,
			layout_x = 0.14296941964904808,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2"
			}
		},
		node_9 = {
			name = "node_9",
			layout_y = 0.5436633543554306,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.6492666304179079,
			prev = {
				[1.0] = "node_4",
				[2.0] = "node_12"
			},
			next = {
				[1.0] = "node_10"
			}
		},
		node_14 = {
			type = "TRAVEL",
			name = "node_14",
			layout_y = 0.6668071422642179,
			connected_to = 1,
			label = 3,
			layout_x = 0.14120890356411417,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2"
			}
		},
		node_6 = {
			name = "node_6",
			layout_y = 0,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.8815565082296376,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_10 = {
			type = "SIGNATURE",
			name = "node_10",
			layout_y = 0.739399402429579,
			connected_to = 1,
			label = 3,
			layout_x = 0.8338716031910521,
			prev = {
				[1.0] = "node_9",
				[2.0] = "node_13"
			},
			next = {
				[1.0] = "final"
			}
		},
		final = {
			name = "final",
			type = "ARENA",
			layout_y = 0.371776534963114,
			layout_x = 1,
			prev = {
				"node_6",
				"node_8",
				"node_10"
			},
			next = {}
		},
		node_12 = {
			type = "SIGNATURE",
			name = "node_12",
			layout_y = 0.8067192991461051,
			connected_to = 2,
			label = 4,
			layout_x = 0.5465596397398224,
			prev = {
				[1.0] = "node_11"
			},
			next = {
				[1.0] = "node_9",
				[2.0] = "node_13"
			}
		},
		node_4 = {
			type = "SIGNATURE",
			name = "node_4",
			layout_y = 0.258580605752083,
			connected_to = 2,
			label = 1,
			layout_x = 0.5257679783421754,
			prev = {
				[1.0] = "node_3",
				[2.0] = "node_11"
			},
			next = {
				[1.0] = "node_5",
				[2.0] = "node_9"
			}
		},
		node_13 = {
			name = "node_13",
			layout_y = 1,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.6842716136998053,
			prev = {
				[1.0] = "node_12"
			},
			next = {
				[1.0] = "node_10"
			}
		},
		node_5 = {
			type = "SIGNATURE",
			name = "node_5",
			layout_y = 0.01844589656296499,
			connected_to = 2,
			label = 2,
			layout_x = 0.6930704686408858,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_6",
				[2.0] = "node_8"
			}
		},
		start = {
			layout_y = 0.38720212972999846,
			name = "start",
			type = "START",
			connected_to = 2,
			layout_x = 0,
			next = {
				[1.0] = "node_1",
				[2.0] = "node_14"
			},
			prev = {}
		},
		node_2 = {
			type = "TRAVEL",
			name = "node_2",
			layout_y = 0.39412330276976215,
			connected_to = 2,
			label = 2,
			layout_x = 0.2754634302253966,
			prev = {
				[1.0] = "node_1",
				[2.0] = "node_14"
			},
			next = {
				[1.0] = "node_3",
				[2.0] = "node_11"
			}
		}
	},
	[8] = {
		node_9 = {
			type = "SIGNATURE",
			name = "node_9",
			layout_y = 0.6849286360869593,
			connected_to = 1,
			label = 4,
			layout_x = 0.6625103236062012,
			prev = {
				"node_4",
				"node_11",
				"node_14"
			},
			next = {
				[1.0] = "node_10"
			}
		},
		node_14 = {
			type = "TRAVEL",
			name = "node_14",
			layout_y = 1,
			connected_to = 1,
			label = 5,
			layout_x = 0.57102611051651,
			prev = {
				[1.0] = "node_13"
			},
			next = {
				[1.0] = "node_9"
			}
		},
		final = {
			name = "final",
			type = "ARENA",
			layout_y = 0.455031434430949,
			layout_x = 1,
			prev = {
				"node_6",
				"node_8",
				"node_10"
			},
			next = {}
		},
		node_12 = {
			type = "TRAVEL",
			name = "node_12",
			layout_y = 0.5000945353615347,
			connected_to = 2,
			label = 4,
			layout_x = 0.2843018733203015,
			prev = {
				[1.0] = "node_1",
				[2.0] = "node_15"
			},
			next = {
				[1.0] = "node_3",
				[2.0] = "node_13"
			}
		},
		node_4 = {
			type = "TRAVEL",
			name = "node_4",
			layout_y = 0.14573594333813306,
			connected_to = 2,
			label = 2,
			layout_x = 0.5838825094957835,
			prev = {
				[1.0] = "node_3"
			},
			next = {
				[1.0] = "node_5",
				[2.0] = "node_9"
			}
		},
		node_13 = {
			name = "node_13",
			layout_y = 0.7938252524723747,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.4190589560949468,
			prev = {
				[1.0] = "node_12",
				[2.0] = "node_16"
			},
			next = {
				[1.0] = "node_11",
				[2.0] = "node_14"
			}
		},
		start = {
			layout_y = 0.44946429144038585,
			name = "start",
			type = "START",
			connected_to = 2,
			layout_x = 0,
			next = {
				[1.0] = "node_1",
				[2.0] = "node_15"
			},
			prev = {}
		},
		node_2 = {
			type = "TRAVEL",
			name = "node_2",
			layout_y = 0,
			connected_to = 1,
			label = 1,
			layout_x = 0.291636916722908,
			prev = {
				[1.0] = "node_1"
			},
			next = {
				[1.0] = "node_3"
			}
		},
		node_11 = {
			type = "TRAVEL",
			name = "node_11",
			layout_y = 0.530029601337059,
			connected_to = 1,
			label = 3,
			layout_x = 0.5208245686432812,
			prev = {
				[1.0] = "node_3",
				[2.0] = "node_13"
			},
			next = {
				[1.0] = "node_9"
			}
		},
		node_3 = {
			name = "node_3",
			layout_y = 0.23654645408023664,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.41890310586805757,
			prev = {
				[1.0] = "node_2",
				[2.0] = "node_12"
			},
			next = {
				[1.0] = "node_4",
				[2.0] = "node_11"
			}
		},
		node_16 = {
			type = "TRAVEL",
			name = "node_16",
			layout_y = 0.986983640448471,
			connected_to = 1,
			label = 6,
			layout_x = 0.27874705232807223,
			prev = {
				[1.0] = "node_15"
			},
			next = {
				[1.0] = "node_13"
			}
		},
		node_8 = {
			type = "SIGNATURE",
			name = "node_8",
			layout_y = 0.4383351990642756,
			connected_to = 1,
			label = 3,
			layout_x = 0.842263668236966,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_1 = {
			type = "SIGNATURE",
			name = "node_1",
			layout_y = 0.23955892226231604,
			connected_to = 2,
			label = 1,
			layout_x = 0.1571739366072051,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2",
				[2.0] = "node_12"
			}
		},
		node_6 = {
			type = "SIGNATURE",
			name = "node_6",
			layout_y = 0.10689864510924942,
			connected_to = 1,
			label = 2,
			layout_x = 0.8971987038054446,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_15 = {
			type = "SIGNATURE",
			name = "node_15",
			layout_y = 0.729760299008403,
			connected_to = 2,
			label = 5,
			layout_x = 0.14717173439474665,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_12",
				[2.0] = "node_16"
			}
		},
		node_5 = {
			name = "node_5",
			layout_y = 0.18147406269993452,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.7397051370711571,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_6",
				[2.0] = "node_8"
			}
		},
		node_10 = {
			name = "node_10",
			layout_y = 0.8181376254770742,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.8624753311649693,
			prev = {
				[1.0] = "node_9"
			},
			next = {
				[1.0] = "final"
			}
		}
	},
	[12] = {
		node_11 = {
			type = "TRAVEL",
			name = "node_11",
			layout_y = 0.845479479430954,
			connected_to = 1,
			label = 4,
			layout_x = 0.15976560580001734,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2"
			}
		},
		node_3 = {
			name = "node_3",
			layout_y = 0.5002624260168334,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.4199811023643944,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_4"
			}
		},
		node_8 = {
			name = "node_8",
			layout_y = 0.4127710636321567,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.815127018520904,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_9 = {
			name = "node_9",
			layout_y = 1,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.6293897187798022,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_10"
			}
		},
		final = {
			name = "final",
			type = "ARENA",
			layout_y = 0.44765691146149605,
			layout_x = 1,
			prev = {
				"node_6",
				"node_8",
				"node_10"
			},
			next = {}
		},
		node_1 = {
			type = "TRAVEL",
			name = "node_1",
			layout_y = 0.13665031021452043,
			connected_to = 1,
			label = 1,
			layout_x = 0.17305816387530312,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2"
			}
		},
		start = {
			layout_y = 0.4426309488883243,
			name = "start",
			type = "START",
			connected_to = 2,
			layout_x = 0,
			next = {
				[1.0] = "node_1",
				[2.0] = "node_11"
			},
			prev = {}
		},
		node_4 = {
			type = "SIGNATURE",
			name = "node_4",
			layout_y = 0.5526690507176941,
			connected_to = 2,
			label = 2,
			layout_x = 0.5859545323378237,
			prev = {
				[1.0] = "node_3"
			},
			next = {
				[1.0] = "node_5",
				[2.0] = "node_9"
			}
		},
		node_6 = {
			name = "node_6",
			layout_y = 0,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.8515016750376871,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_5 = {
			type = "TRAVEL",
			name = "node_5",
			layout_y = 0.1180666152269934,
			connected_to = 2,
			label = 2,
			layout_x = 0.6607024671083129,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_6",
				[2.0] = "node_8"
			}
		},
		node_10 = {
			type = "TRAVEL",
			name = "node_10",
			layout_y = 0.9528472864970626,
			connected_to = 1,
			label = 3,
			layout_x = 0.8445438879416592,
			prev = {
				[1.0] = "node_9"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_2 = {
			type = "SIGNATURE",
			name = "node_2",
			layout_y = 0.5047351112609548,
			connected_to = 1,
			label = 1,
			layout_x = 0.24978196717548917,
			prev = {
				[1.0] = "node_1",
				[2.0] = "node_11"
			},
			next = {
				[1.0] = "node_3"
			}
		}
	},
	[14] = {
		node_11 = {
			name = "node_11",
			layout_y = 1,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.661969311361449,
			prev = {
				[1.0] = "node_10"
			},
			next = {
				[1.0] = "node_12"
			}
		},
		node_3 = {
			type = "SIGNATURE",
			name = "node_3",
			layout_y = 0.5045345123221597,
			connected_to = 2,
			label = 2,
			layout_x = 0.42036988886779436,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_4",
				[2.0] = "node_10"
			}
		},
		node_8 = {
			type = "TRAVEL",
			name = "node_8",
			layout_y = 0.5035097043129395,
			connected_to = 1,
			label = 3,
			layout_x = 0.6254185441601665,
			prev = {
				[1.0] = "node_4",
				[2.0] = "node_10"
			},
			next = {
				[1.0] = "node_9"
			}
		},
		node_9 = {
			name = "node_9",
			layout_y = 0.49937293611552547,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.8210281269960181,
			prev = {
				[1.0] = "node_8"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_1 = {
			type = "SIGNATURE",
			name = "node_1",
			layout_y = 0.22957688348837121,
			connected_to = 1,
			label = 1,
			layout_x = 0.15732375596379436,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2"
			}
		},
		final = {
			name = "final",
			type = "ARENA",
			layout_y = 0.4599685817107978,
			layout_x = 1,
			prev = {
				"node_6",
				"node_9",
				"node_12"
			},
			next = {}
		},
		start = {
			layout_y = 0.4547402912810743,
			name = "start",
			type = "START",
			connected_to = 2,
			layout_x = 0,
			next = {
				[1.0] = "node_1",
				[2.0] = "node_13"
			},
			prev = {}
		},
		node_6 = {
			type = "TRAVEL",
			name = "node_6",
			layout_y = 0.1221248376676715,
			connected_to = 1,
			label = 2,
			layout_x = 0.860540872786134,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_12 = {
			type = "TRAVEL",
			name = "node_12",
			layout_y = 0.8587347398539996,
			connected_to = 1,
			label = 2,
			layout_x = 0.8661110736300294,
			prev = {
				[1.0] = "node_11"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_4 = {
			type = "TRAVEL",
			name = "node_4",
			layout_y = 0.20970089778420847,
			connected_to = 2,
			label = 1,
			layout_x = 0.5119322150258756,
			prev = {
				[1.0] = "node_3"
			},
			next = {
				[1.0] = "node_5",
				[2.0] = "node_8"
			}
		},
		node_13 = {
			type = "SIGNATURE",
			name = "node_13",
			layout_y = 0.7510339759596772,
			connected_to = 1,
			label = 3,
			layout_x = 0.14574594530125393,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2"
			}
		},
		node_5 = {
			name = "node_5",
			layout_y = 0,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.6578544528431869,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_6"
			}
		},
		node_10 = {
			type = "TRAVEL",
			name = "node_10",
			layout_y = 0.7977340548772558,
			connected_to = 2,
			label = 4,
			layout_x = 0.5117771221021145,
			prev = {
				[1.0] = "node_3"
			},
			next = {
				[1.0] = "node_8",
				[2.0] = "node_11"
			}
		},
		node_2 = {
			name = "node_2",
			layout_y = 0.5015704205650705,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.24492771221310233,
			prev = {
				[1.0] = "node_1",
				[2.0] = "node_13"
			},
			next = {
				[1.0] = "node_3"
			}
		}
	},
	[19] = {
		node_11 = {
			type = "TRAVEL",
			name = "node_11",
			layout_y = 0.845479479430954,
			connected_to = 1,
			label = 3,
			layout_x = 0.15976560580001734,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2"
			}
		},
		node_3 = {
			name = "node_3",
			layout_y = 0.5002624260168334,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.4199811023643944,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_4"
			}
		},
		node_8 = {
			type = "SIGNATURE",
			name = "node_8",
			layout_y = 0.4127710636321567,
			connected_to = 1,
			label = 3,
			layout_x = 0.815127018520904,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_9 = {
			type = "SIGNATURE",
			name = "node_9",
			layout_y = 1,
			connected_to = 1,
			label = 4,
			layout_x = 0.6293897187798022,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_10"
			}
		},
		final = {
			name = "final",
			type = "ARENA",
			layout_y = 0.44765691146149605,
			layout_x = 1,
			prev = {
				"node_6",
				"node_8",
				"node_10"
			},
			next = {}
		},
		node_1 = {
			type = "TRAVEL",
			name = "node_1",
			layout_y = 0.13665031021452043,
			connected_to = 1,
			label = 1,
			layout_x = 0.17305816387530312,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2"
			}
		},
		start = {
			layout_y = 0.4426309488883243,
			name = "start",
			type = "START",
			connected_to = 2,
			layout_x = 0,
			next = {
				[1.0] = "node_1",
				[2.0] = "node_11"
			},
			prev = {}
		},
		node_4 = {
			type = "SIGNATURE",
			name = "node_4",
			layout_y = 0.5526690507176941,
			connected_to = 2,
			label = 1,
			layout_x = 0.5859545323378237,
			prev = {
				[1.0] = "node_3"
			},
			next = {
				[1.0] = "node_5",
				[2.0] = "node_9"
			}
		},
		node_6 = {
			type = "SIGNATURE",
			name = "node_6",
			layout_y = 0,
			connected_to = 1,
			label = 2,
			layout_x = 0.8515016750376871,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_5 = {
			name = "node_5",
			layout_y = 0.1180666152269934,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.6607024671083129,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_6",
				[2.0] = "node_8"
			}
		},
		node_10 = {
			name = "node_10",
			layout_y = 0.9528472864970626,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.8445438879416592,
			prev = {
				[1.0] = "node_9"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_2 = {
			type = "TRAVEL",
			name = "node_2",
			layout_y = 0.5047351112609548,
			connected_to = 1,
			label = 2,
			layout_x = 0.24978196717548917,
			prev = {
				[1.0] = "node_1",
				[2.0] = "node_11"
			},
			next = {
				[1.0] = "node_3"
			}
		}
	},
	[24] = {
		node_9 = {
			name = "node_9",
			layout_y = 0.3123916586074417,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.4432089063951708,
			prev = {
				[1.0] = "node_2",
				[2.0] = "node_11"
			},
			next = {
				[1.0] = "node_4",
				[2.0] = "node_10"
			}
		},
		node_14 = {
			type = "SIGNATURE",
			name = "node_14",
			layout_y = 0.6852104407319104,
			connected_to = 2,
			label = 3,
			layout_x = 0.14955646072827278,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_11",
				[2.0] = "node_15"
			}
		},
		final = {
			name = "final",
			type = "ARENA",
			layout_y = 0.4646651598973653,
			layout_x = 1,
			prev = {
				[1.0] = "node_6",
				[2.0] = "node_8"
			},
			next = {}
		},
		node_12 = {
			name = "node_12",
			layout_y = 0.691264676128776,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.4427586662161235,
			prev = {
				[1.0] = "node_11",
				[2.0] = "node_15"
			},
			next = {
				[1.0] = "node_10",
				[2.0] = "node_13"
			}
		},
		node_4 = {
			type = "TRAVEL",
			name = "node_4",
			layout_y = 0.18938019754761448,
			connected_to = 1,
			label = 2,
			layout_x = 0.6142266923854326,
			prev = {
				[1.0] = "node_3",
				[2.0] = "node_9"
			},
			next = {
				[1.0] = "node_5"
			}
		},
		node_13 = {
			type = "TRAVEL",
			name = "node_13",
			layout_y = 0.8133003365427212,
			connected_to = 1,
			label = 5,
			layout_x = 0.615817641836124,
			prev = {
				[1.0] = "node_12",
				[2.0] = "node_16"
			},
			next = {
				[1.0] = "node_5"
			}
		},
		start = {
			layout_y = 0.46513278703216404,
			name = "start",
			type = "START",
			connected_to = 2,
			layout_x = 0,
			next = {
				[1.0] = "node_1",
				[2.0] = "node_14"
			},
			prev = {}
		},
		node_2 = {
			type = "TRAVEL",
			name = "node_2",
			layout_y = 0.12532681308003282,
			connected_to = 2,
			label = 1,
			layout_x = 0.31294322536324,
			prev = {
				[1.0] = "node_1"
			},
			next = {
				[1.0] = "node_3",
				[2.0] = "node_9"
			}
		},
		node_11 = {
			type = "TRAVEL",
			name = "node_11",
			layout_y = 0.5008000215922925,
			connected_to = 2,
			label = 4,
			layout_x = 0.28866831575775964,
			prev = {
				[1.0] = "node_1",
				[2.0] = "node_14"
			},
			next = {
				[1.0] = "node_9",
				[2.0] = "node_12"
			}
		},
		node_3 = {
			name = "node_3",
			layout_y = 0,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.4792407810040421,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_4"
			}
		},
		node_16 = {
			name = "node_16",
			layout_y = 1,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.4778900474051489,
			prev = {
				[1.0] = "node_15"
			},
			next = {
				[1.0] = "node_13"
			}
		},
		node_8 = {
			name = "node_8",
			layout_y = 0.6782877625813192,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.8724085915468037,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_1 = {
			type = "SIGNATURE",
			name = "node_1",
			layout_y = 0.3012354059205374,
			connected_to = 2,
			label = 1,
			layout_x = 0.1567904018690759,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2",
				[2.0] = "node_11"
			}
		},
		node_6 = {
			name = "node_6",
			layout_y = 0.3035657258282009,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.8627146088812269,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_15 = {
			type = "TRAVEL",
			name = "node_15",
			layout_y = 0.8726589929412838,
			connected_to = 2,
			label = 6,
			layout_x = 0.30895178577039156,
			prev = {
				[1.0] = "node_14"
			},
			next = {
				[1.0] = "node_12",
				[2.0] = "node_16"
			}
		},
		node_5 = {
			type = "SIGNATURE",
			name = "node_5",
			layout_y = 0.500797144826242,
			connected_to = 2,
			label = 2,
			layout_x = 0.726732802360939,
			prev = {
				"node_4",
				"node_10",
				"node_13"
			},
			next = {
				[1.0] = "node_6",
				[2.0] = "node_8"
			}
		},
		node_10 = {
			type = "TRAVEL",
			name = "node_10",
			layout_y = 0.5025113312480595,
			connected_to = 1,
			label = 3,
			layout_x = 0.5603947721739869,
			prev = {
				[1.0] = "node_9",
				[2.0] = "node_12"
			},
			next = {
				[1.0] = "node_5"
			}
		}
	},
	[29] = {
		node_11 = {
			type = "SIGNATURE",
			name = "node_11",
			layout_y = 1,
			connected_to = 1,
			label = 3,
			layout_x = 0.34087035649918473,
			prev = {
				[1.0] = "node_10"
			},
			next = {
				[1.0] = "node_3"
			}
		},
		node_3 = {
			name = "node_3",
			layout_y = 0.50433658498645,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.4064454429658323,
			prev = {
				[1.0] = "node_2",
				[2.0] = "node_11"
			},
			next = {
				[1.0] = "node_4"
			}
		},
		node_8 = {
			name = "node_8",
			layout_y = 0.9999999999999997,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.6591296435008149,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_9"
			}
		},
		node_9 = {
			type = "TRAVEL",
			name = "node_9",
			layout_y = 0.8752833372053129,
			connected_to = 1,
			label = 3,
			layout_x = 0.8489841908594788,
			prev = {
				[1.0] = "node_8"
			},
			next = {
				[1.0] = "final"
			}
		},
		final = {
			name = "final",
			type = "ARENA",
			layout_y = 0.43319249246751523,
			layout_x = 1,
			prev = {
				[1.0] = "node_6",
				[2.0] = "node_9"
			},
			next = {}
		},
		node_1 = {
			type = "SIGNATURE",
			name = "node_1",
			layout_y = 0.0868728025422634,
			connected_to = 1,
			label = 1,
			layout_x = 0.1591807027862862,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2"
			}
		},
		start = {
			layout_y = 0.4331924924675154,
			name = "start",
			type = "START",
			connected_to = 2,
			layout_x = 0,
			next = {
				[1.0] = "node_1",
				[2.0] = "node_10"
			},
			prev = {}
		},
		node_4 = {
			type = "SIGNATURE",
			name = "node_4",
			layout_y = 0.5043365849864498,
			connected_to = 2,
			label = 2,
			layout_x = 0.593554557034167,
			prev = {
				[1.0] = "node_3"
			},
			next = {
				[1.0] = "node_5",
				[2.0] = "node_8"
			}
		},
		node_6 = {
			name = "node_6",
			layout_y = 0.0868728025422637,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.8408192972137134,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_5 = {
			type = "TRAVEL",
			name = "node_5",
			layout_y = 0,
			connected_to = 1,
			label = 2,
			layout_x = 0.6533521277006283,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_6"
			}
		},
		node_10 = {
			type = "TRAVEL",
			name = "node_10",
			layout_y = 0.8752833372053133,
			connected_to = 1,
			label = 4,
			layout_x = 0.15101580914052098,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_11"
			}
		},
		node_2 = {
			type = "TRAVEL",
			name = "node_2",
			layout_y = 0,
			connected_to = 1,
			label = 1,
			layout_x = 0.3466478722993711,
			prev = {
				[1.0] = "node_1"
			},
			next = {
				[1.0] = "node_3"
			}
		}
	},
	[31] = {
		node_11 = {
			name = "node_11",
			layout_y = 0.5384300426873827,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.4155330446031629,
			prev = {
				[1.0] = "node_10"
			},
			next = {
				[1.0] = "node_4"
			}
		},
		node_3 = {
			type = "TRAVEL",
			name = "node_3",
			layout_y = 0,
			connected_to = 1,
			label = 1,
			layout_x = 0.49461230965158737,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_4"
			}
		},
		node_8 = {
			name = "node_8",
			layout_y = 0.6637922661828196,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.8285025442622399,
			prev = {
				[1.0] = "node_5",
				[2.0] = "node_9"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_9 = {
			type = "SIGNATURE",
			name = "node_9",
			layout_y = 0.9003398257642266,
			connected_to = 1,
			label = 3,
			layout_x = 0.689673828122672,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_8"
			}
		},
		node_1 = {
			type = "SIGNATURE",
			name = "node_1",
			layout_y = 0.3153451542873034,
			connected_to = 2,
			label = 1,
			layout_x = 0.1825276374758182,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2",
				[2.0] = "node_10"
			}
		},
		final = {
			name = "final",
			type = "ARENA",
			layout_y = 0.4292454173132764,
			layout_x = 1,
			prev = {
				[1.0] = "node_6",
				[2.0] = "node_8"
			},
			next = {}
		},
		start = {
			layout_y = 0.461057313658431,
			name = "start",
			type = "START",
			connected_to = 2,
			layout_x = 0,
			next = {
				[1.0] = "node_1",
				[2.0] = "node_13"
			},
			prev = {}
		},
		node_6 = {
			name = "node_6",
			layout_y = 0.14007699254324654,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.86829257979749,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_12 = {
			name = "node_12",
			layout_y = 1,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.46133039863644015,
			prev = {
				[1.0] = "node_10"
			},
			next = {
				[1.0] = "node_4"
			}
		},
		node_4 = {
			type = "TRAVEL",
			name = "node_4",
			layout_y = 0.5367631477830703,
			connected_to = 2,
			label = 2,
			layout_x = 0.5718810666449219,
			prev = {
				"node_3",
				"node_11",
				"node_12"
			},
			next = {
				[1.0] = "node_5",
				[2.0] = "node_9"
			}
		},
		node_13 = {
			type = "SIGNATURE",
			name = "node_13",
			layout_y = 0.825792399961844,
			connected_to = 1,
			label = 4,
			layout_x = 0.12016687886037433,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_10"
			}
		},
		node_5 = {
			type = "SIGNATURE",
			name = "node_5",
			layout_y = 0.2837414222882057,
			connected_to = 2,
			label = 2,
			layout_x = 0.714239466695083,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_6",
				[2.0] = "node_8"
			}
		},
		node_10 = {
			type = "TRAVEL",
			name = "node_10",
			layout_y = 0.7685489858373836,
			connected_to = 2,
			label = 3,
			layout_x = 0.29392556928210856,
			prev = {
				[1.0] = "node_1",
				[2.0] = "node_13"
			},
			next = {
				[1.0] = "node_11",
				[2.0] = "node_12"
			}
		},
		node_2 = {
			name = "node_2",
			layout_y = 0.009038364501802886,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.3147409263109504,
			prev = {
				[1.0] = "node_1"
			},
			next = {
				[1.0] = "node_3"
			}
		}
	},
	[35] = {
		node_9 = {
			type = "TRAVEL",
			name = "node_9",
			layout_y = 0.3961930335144085,
			connected_to = 1,
			label = 3,
			layout_x = 0.5632848016683755,
			prev = {
				[1.0] = "node_3"
			},
			next = {
				[1.0] = "node_10"
			}
		},
		node_14 = {
			type = "SIGNATURE",
			name = "node_14",
			layout_y = 0.6970819175144082,
			connected_to = 1,
			label = 3,
			layout_x = 0.521445986952238,
			prev = {
				[1.0] = "node_13"
			},
			next = {
				[1.0] = "node_10"
			}
		},
		final = {
			name = "final",
			type = "ARENA",
			layout_y = 0.48150216788190214,
			layout_x = 1,
			prev = {
				"node_6",
				"node_8",
				"node_11"
			},
			next = {}
		},
		node_12 = {
			type = "TRAVEL",
			name = "node_12",
			layout_y = 0.6709902481846023,
			connected_to = 1,
			label = 5,
			layout_x = 0.25777484708354365,
			prev = {
				[1.0] = "node_1",
				[2.0] = "node_17"
			},
			next = {
				[1.0] = "node_13"
			}
		},
		node_4 = {
			type = "TRAVEL",
			name = "node_4",
			layout_y = 0,
			connected_to = 1,
			label = 1,
			layout_x = 0.5552851047223988,
			prev = {
				[1.0] = "node_3"
			},
			next = {
				[1.0] = "node_5"
			}
		},
		node_13 = {
			name = "node_13",
			layout_y = 0.8629426577984539,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.40140733093325476,
			prev = {
				[1.0] = "node_12"
			},
			next = {
				[1.0] = "node_14",
				[2.0] = "node_15"
			}
		},
		start = {
			layout_y = 0.5082005530443121,
			name = "start",
			type = "START",
			connected_to = 2,
			layout_x = 0,
			next = {
				[1.0] = "node_1",
				[2.0] = "node_17"
			},
			prev = {}
		},
		node_2 = {
			name = "node_2",
			layout_y = 0.22392047605616508,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.27854843776409155,
			prev = {
				[1.0] = "node_1"
			},
			next = {
				[1.0] = "node_3"
			}
		},
		node_11 = {
			name = "node_11",
			layout_y = 0.7840533438129794,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.8669172948208165,
			prev = {
				[1.0] = "node_10",
				[2.0] = "node_16"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_3 = {
			type = "SIGNATURE",
			name = "node_3",
			layout_y = 0.19118735956075364,
			connected_to = 2,
			label = 2,
			layout_x = 0.44405148054986826,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_4",
				[2.0] = "node_9"
			}
		},
		node_16 = {
			layout_y = 1,
			name = "node_16",
			type = "TRAVEL",
			connected_to = 1,
			label = 1,
			layout_x = 0.7352669550125098,
			prev = {
				[1.0] = "node_15"
			},
			next = {
				[1.0] = "node_11"
			}
		},
		node_8 = {
			name = "node_8",
			layout_y = 0.4450333379844231,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.8211140219119685,
			prev = {
				[1.0] = "node_5",
				[2.0] = "node_10"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_17 = {
			type = "SIGNATURE",
			name = "node_17",
			layout_y = 0.7616238481519628,
			connected_to = 1,
			label = 5,
			layout_x = 0.10818242259295895,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_12"
			}
		},
		node_1 = {
			type = "SIGNATURE",
			name = "node_1",
			layout_y = 0.39869768287541435,
			connected_to = 2,
			label = 1,
			layout_x = 0.1586777087304725,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2",
				[2.0] = "node_12"
			}
		},
		node_6 = {
			name = "node_6",
			layout_y = 0.19245982819554244,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.9098054603017129,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_15 = {
			type = "SIGNATURE",
			name = "node_15",
			layout_y = 0.9788747409731068,
			connected_to = 2,
			label = 4,
			layout_x = 0.566536171040949,
			prev = {
				[1.0] = "node_13"
			},
			next = {
				[1.0] = "node_10",
				[2.0] = "node_16"
			}
		},
		node_5 = {
			type = "TRAVEL",
			name = "node_5",
			layout_y = 0.1453232929618022,
			connected_to = 2,
			label = 2,
			layout_x = 0.735204364452063,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_6",
				[2.0] = "node_8"
			}
		},
		node_10 = {
			type = "TRAVEL",
			name = "node_10",
			layout_y = 0.6585232307954216,
			connected_to = 2,
			label = 4,
			layout_x = 0.6848348767894664,
			prev = {
				"node_9",
				"node_14",
				"node_15"
			},
			next = {
				[1.0] = "node_8",
				[2.0] = "node_11"
			}
		}
	},
	[39] = {
		node_19 = {
			layout_y = 0.7274024282428182,
			name = "node_19",
			type = "SIGNATURE",
			connected_to = 1,
			label = 4,
			layout_x = 0.6972519304791434,
			prev = {
				[1.0] = "node_18"
			},
			next = {
				[1.0] = "node_10"
			}
		},
		node_9 = {
			name = "node_9",
			layout_y = 0.4279840246320511,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.8568686322129029,
			prev = {
				[1.0] = "node_8"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_14 = {
			name = "node_14",
			layout_y = 0.4057293317042295,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.3863085587407048,
			prev = {
				[1.0] = "node_13"
			},
			next = {
				[1.0] = "node_15"
			}
		},
		final = {
			name = "final",
			type = "ARENA",
			layout_y = 0.42553551679295215,
			layout_x = 1,
			prev = {
				"node_6",
				"node_9",
				"node_10"
			},
			next = {}
		},
		node_12 = {
			type = "TRAVEL",
			name = "node_12",
			layout_y = 0.6499452703542637,
			connected_to = 2,
			label = 5,
			layout_x = 0.12465517664047293,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_13",
				[2.0] = "node_16"
			}
		},
		node_4 = {
			type = "TRAVEL",
			name = "node_4",
			layout_y = 0.03090281884882559,
			connected_to = 2,
			label = 1,
			layout_x = 0.6033160129773375,
			prev = {
				[1.0] = "node_3"
			},
			next = {
				[1.0] = "node_5",
				[2.0] = "node_8"
			}
		},
		node_13 = {
			type = "SIGNATURE",
			name = "node_13",
			layout_y = 0.4913070682233676,
			connected_to = 1,
			label = 3,
			layout_x = 0.24213708271760065,
			prev = {
				[1.0] = "node_12"
			},
			next = {
				[1.0] = "node_14"
			}
		},
		node_20 = {
			layout_y = 0.9447421728007661,
			name = "node_20",
			type = "SIGNATURE",
			connected_to = 1,
			label = 5,
			layout_x = 0.7422380017775506,
			prev = {
				[1.0] = "node_18"
			},
			next = {
				[1.0] = "node_10"
			}
		},
		start = {
			layout_y = 0.43056080779528355,
			name = "start",
			type = "START",
			connected_to = 2,
			layout_x = 0,
			next = {
				[1.0] = "node_1",
				[2.0] = "node_12"
			},
			prev = {}
		},
		node_2 = {
			name = "node_2",
			layout_y = 0.0675817851552707,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.24930170934733759,
			prev = {
				[1.0] = "node_1"
			},
			next = {
				[1.0] = "node_3"
			}
		},
		node_11 = {
			type = "TRAVEL",
			name = "node_11",
			layout_y = 0.22827600551072946,
			connected_to = 1,
			label = 4,
			layout_x = 0.545113129181939,
			prev = {
				[1.0] = "node_3"
			},
			next = {
				[1.0] = "node_8"
			}
		},
		node_3 = {
			type = "SIGNATURE",
			name = "node_3",
			layout_y = 0.030430027311674806,
			connected_to = 2,
			label = 2,
			layout_x = 0.4282967950372966,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_4",
				[2.0] = "node_11"
			}
		},
		node_16 = {
			type = "TRAVEL",
			name = "node_16",
			layout_y = 0.8451940247353845,
			connected_to = 2,
			label = 6,
			layout_x = 0.2589193387420625,
			prev = {
				[1.0] = "node_12"
			},
			next = {
				[1.0] = "node_17",
				[2.0] = "node_21"
			}
		},
		node_8 = {
			type = "TRAVEL",
			name = "node_8",
			layout_y = 0.3699893732214522,
			connected_to = 2,
			label = 3,
			layout_x = 0.6919973166817192,
			prev = {
				"node_4",
				"node_11",
				"node_15"
			},
			next = {
				[1.0] = "node_9",
				[2.0] = "node_10"
			}
		},
		node_17 = {
			name = "node_17",
			layout_y = 0.7535848035953547,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.4082953747119032,
			prev = {
				[1.0] = "node_16"
			},
			next = {
				[1.0] = "node_18"
			}
		},
		node_1 = {
			type = "SIGNATURE",
			name = "node_1",
			layout_y = 0.22341785028393754,
			connected_to = 1,
			label = 1,
			layout_x = 0.10851526535803557,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2"
			}
		},
		node_6 = {
			type = "TRAVEL",
			name = "node_6",
			layout_y = 0.15699458239053152,
			connected_to = 1,
			label = 2,
			layout_x = 0.9062033031914548,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_15 = {
			type = "SIGNATURE",
			name = "node_15",
			layout_y = 0.49327371886926247,
			connected_to = 1,
			label = 2,
			layout_x = 0.5447836985474654,
			prev = {
				[1.0] = "node_14"
			},
			next = {
				[1.0] = "node_8"
			}
		},
		node_18 = {
			type = "SIGNATURE",
			name = "node_18",
			layout_y = 0.8865319879485565,
			connected_to = 2,
			label = 2,
			layout_x = 0.5622246289640169,
			prev = {
				[1.0] = "node_17",
				[2.0] = "node_21"
			},
			next = {
				[1.0] = "node_19",
				[2.0] = "node_20"
			}
		},
		node_5 = {
			name = "node_5",
			layout_y = 0,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.7599555282499796,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_6"
			}
		},
		node_10 = {
			name = "node_10",
			layout_y = 0.6765526274661324,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.8449591949806485,
			prev = {
				"node_8",
				"node_19",
				"node_20"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_21 = {
			name = "node_21",
			layout_y = 1,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.40012221502112544,
			prev = {
				[1.0] = "node_16"
			},
			next = {
				[1.0] = "node_18"
			}
		}
	},
	[47] = {
		node_9 = {
			type = "TRAVEL",
			name = "node_9",
			layout_y = 0.4553309440680521,
			connected_to = 1,
			label = 4,
			layout_x = 0.5023965018299668,
			prev = {
				[1.0] = "node_3",
				[2.0] = "node_13"
			},
			next = {
				[1.0] = "node_10"
			}
		},
		node_14 = {
			type = "SIGNATURE",
			name = "node_14",
			layout_y = 0.9106516054717778,
			connected_to = 2,
			label = 4,
			layout_x = 0.5438062918744428,
			prev = {
				[1.0] = "node_13"
			},
			next = {
				[1.0] = "node_15",
				[2.0] = "node_16"
			}
		},
		final = {
			name = "final",
			type = "ARENA",
			layout_y = 0.4256691897164434,
			layout_x = 1,
			prev = {
				"node_6",
				"node_8",
				"node_11"
			},
			next = {}
		},
		node_12 = {
			type = "TRAVEL",
			name = "node_12",
			layout_y = 0.43648527722013447,
			connected_to = 2,
			label = 5,
			layout_x = 0.29151045870581915,
			prev = {
				[1.0] = "node_1"
			},
			next = {
				[1.0] = "node_3",
				[2.0] = "node_13"
			}
		},
		node_4 = {
			type = "SIGNATURE",
			name = "node_4",
			layout_y = 0,
			connected_to = 1,
			label = 2,
			layout_x = 0.5394843819231298,
			prev = {
				[1.0] = "node_3"
			},
			next = {
				[1.0] = "node_5"
			}
		},
		node_13 = {
			name = "node_13",
			layout_y = 0.7032422122285487,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.3973879239558881,
			prev = {
				[1.0] = "node_12",
				[2.0] = "node_18"
			},
			next = {
				[1.0] = "node_9",
				[2.0] = "node_14"
			}
		},
		start = {
			layout_y = 0.44541744731494026,
			name = "start",
			type = "START",
			connected_to = 2,
			layout_x = 0,
			next = {
				[1.0] = "node_1",
				[2.0] = "node_17"
			},
			prev = {}
		},
		node_2 = {
			type = "TRAVEL",
			name = "node_2",
			layout_y = 0.04581594920754672,
			connected_to = 1,
			label = 1,
			layout_x = 0.26801546560822914,
			prev = {
				[1.0] = "node_1"
			},
			next = {
				[1.0] = "node_3"
			}
		},
		node_11 = {
			name = "node_11",
			layout_y = 0.7040787747645918,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.8301522001379286,
			prev = {
				"node_10",
				"node_15",
				"node_16"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_3 = {
			name = "node_3",
			layout_y = 0.21183540073020152,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.4087556754426795,
			prev = {
				[1.0] = "node_2",
				[2.0] = "node_12"
			},
			next = {
				[1.0] = "node_4",
				[2.0] = "node_9"
			}
		},
		node_16 = {
			type = "TRAVEL",
			name = "node_16",
			layout_y = 1,
			connected_to = 1,
			label = 2,
			layout_x = 0.7162136830413934,
			prev = {
				[1.0] = "node_14"
			},
			next = {
				[1.0] = "node_11"
			}
		},
		node_8 = {
			type = "TRAVEL",
			name = "node_8",
			layout_y = 0.34559100586740427,
			connected_to = 1,
			label = 3,
			layout_x = 0.8546730959868696,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_17 = {
			type = "TRAVEL",
			name = "node_17",
			layout_y = 0.7235117377072253,
			connected_to = 1,
			label = 6,
			layout_x = 0.11178186980290929,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_18"
			}
		},
		node_1 = {
			type = "SIGNATURE",
			name = "node_1",
			layout_y = 0.25829523775086044,
			connected_to = 2,
			label = 1,
			layout_x = 0.14777371481228976,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2",
				[2.0] = "node_12"
			}
		},
		node_6 = {
			type = "TRAVEL",
			name = "node_6",
			layout_y = 0.1159943749701961,
			connected_to = 1,
			label = 2,
			layout_x = 0.9022371484773694,
			prev = {
				[1.0] = "node_5"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_15 = {
			type = "TRAVEL",
			name = "node_15",
			layout_y = 0.7498192903526503,
			connected_to = 1,
			label = 3,
			layout_x = 0.6740041732470147,
			prev = {
				[1.0] = "node_14"
			},
			next = {
				[1.0] = "node_11"
			}
		},
		node_5 = {
			name = "node_5",
			layout_y = 0.05945317904713494,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.7309757083673573,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_6",
				[2.0] = "node_8"
			}
		},
		node_10 = {
			type = "SIGNATURE",
			name = "node_10",
			layout_y = 0.4482208441088144,
			connected_to = 1,
			label = 3,
			layout_x = 0.6754825212318449,
			prev = {
				[1.0] = "node_9"
			},
			next = {
				[1.0] = "node_11"
			}
		},
		node_18 = {
			type = "SIGNATURE",
			name = "node_18",
			layout_y = 0.893640476423129,
			connected_to = 1,
			label = 5,
			layout_x = 0.2635858331364232,
			prev = {
				[1.0] = "node_17"
			},
			next = {
				[1.0] = "node_13"
			}
		}
	}
}
