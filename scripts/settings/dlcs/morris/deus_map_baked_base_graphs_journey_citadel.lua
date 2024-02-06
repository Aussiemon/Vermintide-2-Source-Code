-- chunkname: @scripts/settings/dlcs/morris/deus_map_baked_base_graphs_journey_citadel.lua

return {
	[0] = {
		node_11 = {
			connected_to = 2,
			label = 4,
			layout_x = 0.5837227999458641,
			layout_y = 0.8712633315512156,
			name = "node_11",
			type = "TRAVEL",
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
			label = 1,
			layout_x = 0.4287294881909612,
			layout_y = 0.12360361498958282,
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
			layout_x = 0.6496513694402192,
			layout_y = 0.567723830385304,
			name = "node_8",
			type = "SHOP",
			prev = {
				[1] = "node_4",
				[2] = "node_11",
			},
			next = {
				[1] = "node_6",
			},
		},
		node_9 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.26286811360234597,
			layout_y = 0.5531534131831244,
			name = "node_9",
			type = "TRAVEL",
			prev = {
				[1] = "node_1",
				[2] = "node_13",
			},
			next = {
				[1] = "node_10",
			},
		},
		node_1 = {
			connected_to = 2,
			label = 1,
			layout_x = 0.1573749850602629,
			layout_y = 0.26868027184869525,
			name = "node_1",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
				[2] = "node_9",
			},
		},
		node_14 = {
			connected_to = 1,
			label = 5,
			layout_x = 0.30241506896117465,
			layout_y = 1,
			name = "node_14",
			type = "TRAVEL",
			prev = {
				[1] = "node_13",
			},
			next = {
				[1] = "node_10",
			},
		},
		final = {
			layout_x = 1,
			layout_y = 0.4546094776161927,
			name = "final",
			type = "ARENA",
			prev = {
				[1] = "node_6",
			},
			next = {},
		},
		start = {
			connected_to = 2,
			layout_x = 0,
			layout_y = 0.48202251538537705,
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
			layout_x = 0.8124042094693614,
			layout_y = 0.5228990738016958,
			name = "node_6",
			type = "SIGNATURE",
			prev = {
				"node_5",
				"node_8",
				"node_12",
			},
			next = {
				[1] = "final",
			},
		},
		node_12 = {
			connected_to = 1,
			layout_x = 0.7497939893927339,
			layout_y = 0.9246563162120202,
			name = "node_12",
			type = "SHOP",
			prev = {
				[1] = "node_11",
			},
			next = {
				[1] = "node_6",
			},
		},
		node_4 = {
			connected_to = 2,
			label = 2,
			layout_x = 0.5580031927959185,
			layout_y = 0.32113028797511917,
			name = "node_4",
			type = "TRAVEL",
			prev = {
				[1] = "node_3",
				[2] = "node_10",
			},
			next = {
				[1] = "node_5",
				[2] = "node_8",
			},
		},
		node_13 = {
			connected_to = 2,
			label = 3,
			layout_x = 0.1476744885734397,
			layout_y = 0.781342671836313,
			name = "node_13",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_9",
				[2] = "node_14",
			},
		},
		node_5 = {
			connected_to = 1,
			layout_x = 0.7253837725654373,
			layout_y = 0.1492982311711086,
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
			layout_x = 0.4262404665800695,
			layout_y = 0.712344160883225,
			name = "node_10",
			type = "SHOP",
			prev = {
				[1] = "node_9",
				[2] = "node_14",
			},
			next = {
				[1] = "node_4",
				[2] = "node_11",
			},
		},
		node_2 = {
			connected_to = 1,
			layout_x = 0.28076232254211814,
			layout_y = 0,
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
	[2] = {
		node_11 = {
			connected_to = 1,
			label = 5,
			layout_x = 0.2707210928296871,
			layout_y = 0.7447662008757209,
			name = "node_11",
			type = "TRAVEL",
			prev = {
				[1] = "node_1",
				[2] = "node_13",
			},
			next = {
				[1] = "node_12",
			},
		},
		node_3 = {
			connected_to = 1,
			label = 1,
			layout_x = 0.4640182057371875,
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
			layout_x = 0.6992470247392062,
			layout_y = 0.6782739257824493,
			name = "node_8",
			type = "SHOP",
			prev = {
				[1] = "node_4",
				[2] = "node_10",
			},
			next = {
				[1] = "node_6",
			},
		},
		node_9 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.44060195246329015,
			layout_y = 0.49966292279038127,
			name = "node_9",
			type = "TRAVEL",
			prev = {
				[1] = "node_2",
			},
			next = {
				[1] = "node_10",
			},
		},
		node_1 = {
			connected_to = 2,
			label = 1,
			layout_x = 0.17704688826062803,
			layout_y = 0.3571625193090358,
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
		final = {
			layout_x = 1,
			layout_y = 0.4388101313132944,
			name = "final",
			type = "ARENA",
			prev = {
				[1] = "node_6",
			},
			next = {},
		},
		start = {
			connected_to = 2,
			layout_x = 0,
			layout_y = 0.45792763124477026,
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
			layout_x = 0.8208412244080527,
			layout_y = 0.4696245041732077,
			name = "node_6",
			type = "SIGNATURE",
			prev = {
				[1] = "node_5",
				[2] = "node_8",
			},
			next = {
				[1] = "final",
			},
		},
		node_12 = {
			connected_to = 1,
			layout_x = 0.41896336581249616,
			layout_y = 1,
			name = "node_12",
			type = "SHOP",
			prev = {
				[1] = "node_11",
			},
			next = {
				[1] = "node_10",
			},
		},
		node_4 = {
			connected_to = 2,
			label = 2,
			layout_x = 0.606278243864985,
			layout_y = 0.26334842118946605,
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
			layout_x = 0.10943419727658593,
			layout_y = 0.7554357666875892,
			name = "node_13",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_11",
			},
		},
		node_5 = {
			connected_to = 1,
			layout_x = 0.7513871034143199,
			layout_y = 0.16148434298340786,
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
			label = 4,
			layout_x = 0.5444433324914865,
			layout_y = 0.7992342997071507,
			name = "node_10",
			type = "TRAVEL",
			prev = {
				[1] = "node_9",
				[2] = "node_12",
			},
			next = {
				[1] = "node_8",
			},
		},
		node_2 = {
			connected_to = 2,
			layout_x = 0.33417724118728365,
			layout_y = 0.2035984472469971,
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
	},
	[6] = {
		node_11 = {
			connected_to = 1,
			layout_x = 0.45519240939162525,
			layout_y = 0.8300581811558851,
			name = "node_11",
			type = "SHOP",
			prev = {
				[1] = "node_9",
				[2] = "node_13",
			},
			next = {
				[1] = "node_4",
			},
		},
		node_3 = {
			connected_to = 1,
			label = 1,
			layout_x = 0.4991588553231776,
			layout_y = 0.06614875243955969,
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
			layout_x = 0.7175514354354166,
			layout_y = 0.7812253864936286,
			name = "node_8",
			type = "SHOP",
			prev = {
				[1] = "node_4",
			},
			next = {
				[1] = "node_6",
			},
		},
		node_9 = {
			connected_to = 2,
			label = 3,
			layout_x = 0.3042926881217156,
			layout_y = 0.5357553020468329,
			name = "node_9",
			type = "TRAVEL",
			prev = {
				[1] = "node_1",
			},
			next = {
				[1] = "node_10",
				[2] = "node_11",
			},
		},
		node_1 = {
			connected_to = 2,
			label = 1,
			layout_x = 0.1717687798765419,
			layout_y = 0.25332374557289516,
			name = "node_1",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
				[2] = "node_9",
			},
		},
		final = {
			layout_x = 1,
			layout_y = 0.4315991319501357,
			name = "final",
			type = "ARENA",
			prev = {
				[1] = "node_6",
			},
			next = {},
		},
		start = {
			connected_to = 2,
			layout_x = 0,
			layout_y = 0.45650239643147034,
			name = "start",
			type = "START",
			next = {
				[1] = "node_1",
				[2] = "node_12",
			},
			prev = {},
		},
		node_6 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.8206036811532593,
			layout_y = 0.5043219592636717,
			name = "node_6",
			type = "SIGNATURE",
			prev = {
				[1] = "node_5",
				[2] = "node_8",
			},
			next = {
				[1] = "final",
			},
		},
		node_12 = {
			connected_to = 1,
			label = 4,
			layout_x = 0.12280755402777842,
			layout_y = 0.7997068504251369,
			name = "node_12",
			type = "TRAVEL",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_13",
			},
		},
		node_4 = {
			connected_to = 2,
			label = 2,
			layout_x = 0.5942085931500013,
			layout_y = 0.4857917038760978,
			name = "node_4",
			type = "TRAVEL",
			prev = {
				"node_3",
				"node_10",
				"node_11",
			},
			next = {
				[1] = "node_5",
				[2] = "node_8",
			},
		},
		node_13 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.29860140841226424,
			layout_y = 1,
			name = "node_13",
			type = "SIGNATURE",
			prev = {
				[1] = "node_12",
			},
			next = {
				[1] = "node_11",
			},
		},
		node_5 = {
			connected_to = 1,
			layout_x = 0.7224806082153064,
			layout_y = 0.22445146270685545,
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
			layout_x = 0.4471736327201422,
			layout_y = 0.4670142911008508,
			name = "node_10",
			type = "SHOP",
			prev = {
				[1] = "node_9",
			},
			next = {
				[1] = "node_4",
			},
		},
		node_2 = {
			connected_to = 1,
			layout_x = 0.3144230713638458,
			layout_y = 0,
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
	[9] = {
		node_11 = {
			connected_to = 1,
			label = 4,
			layout_x = 0.550424406275409,
			layout_y = 0.8679888833477805,
			name = "node_11",
			type = "SIGNATURE",
			prev = {
				[1] = "node_10",
				[2] = "node_13",
			},
			next = {
				[1] = "node_8",
			},
		},
		node_3 = {
			connected_to = 2,
			layout_x = 0.46129255783859835,
			layout_y = 0,
			name = "node_3",
			type = "SHOP",
			prev = {
				[1] = "node_2",
			},
			next = {
				[1] = "node_4",
				[2] = "node_9",
			},
		},
		node_8 = {
			connected_to = 1,
			layout_x = 0.6739434263381867,
			layout_y = 0.5824861178936959,
			name = "node_8",
			type = "SHOP",
			prev = {
				"node_4",
				"node_9",
				"node_11",
			},
			next = {
				[1] = "node_6",
			},
		},
		node_1 = {
			connected_to = 2,
			label = 1,
			layout_x = 0.16607330890162983,
			layout_y = 0.2917616102708692,
			name = "node_1",
			type = "TRAVEL",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
				[2] = "node_12",
			},
		},
		node_9 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.5677789881143774,
			layout_y = 0.3594413629247439,
			name = "node_9",
			type = "SIGNATURE",
			prev = {
				[1] = "node_3",
			},
			next = {
				[1] = "node_8",
			},
		},
		node_14 = {
			connected_to = 1,
			label = 4,
			layout_x = 0.10747362847450014,
			layout_y = 0.729735737783808,
			name = "node_14",
			type = "TRAVEL",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_12",
			},
		},
		final = {
			layout_x = 1,
			layout_y = 0.39654150148468503,
			name = "final",
			type = "ARENA",
			prev = {
				[1] = "node_6",
			},
			next = {},
		},
		start = {
			connected_to = 2,
			layout_x = 0,
			layout_y = 0.4120886295047995,
			name = "start",
			type = "START",
			next = {
				[1] = "node_1",
				[2] = "node_14",
			},
			prev = {},
		},
		node_6 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.8279066023596735,
			layout_y = 0.432986681430277,
			name = "node_6",
			type = "SIGNATURE",
			prev = {
				[1] = "node_5",
				[2] = "node_8",
			},
			next = {
				[1] = "final",
			},
		},
		node_12 = {
			connected_to = 2,
			label = 3,
			layout_x = 0.26923606335453026,
			layout_y = 0.6882002543892974,
			name = "node_12",
			type = "TRAVEL",
			prev = {
				[1] = "node_1",
				[2] = "node_14",
			},
			next = {
				[1] = "node_10",
				[2] = "node_13",
			},
		},
		node_4 = {
			connected_to = 2,
			label = 1,
			layout_x = 0.6196210531694535,
			layout_y = 0.06255913915585834,
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
		node_13 = {
			connected_to = 1,
			layout_x = 0.3968243857972001,
			layout_y = 1,
			name = "node_13",
			type = "SHOP",
			prev = {
				[1] = "node_12",
			},
			next = {
				[1] = "node_11",
			},
		},
		node_5 = {
			connected_to = 1,
			layout_x = 0.7717846716319232,
			layout_y = 0.09369688607566298,
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
			layout_x = 0.40437553001659926,
			layout_y = 0.5462710571870343,
			name = "node_10",
			type = "SHOP",
			prev = {
				[1] = "node_2",
				[2] = "node_12",
			},
			next = {
				[1] = "node_11",
			},
		},
		node_2 = {
			connected_to = 2,
			label = 2,
			layout_x = 0.3194593614199568,
			layout_y = 0.16706135996561353,
			name = "node_2",
			type = "TRAVEL",
			prev = {
				[1] = "node_1",
			},
			next = {
				[1] = "node_3",
				[2] = "node_10",
			},
		},
	},
	[10] = {
		node_11 = {
			connected_to = 1,
			layout_x = 0.37277481069121143,
			layout_y = 0.5171296163465983,
			name = "node_11",
			type = "SHOP",
			prev = {
				[1] = "node_2",
				[2] = "node_13",
			},
			next = {
				[1] = "node_8",
			},
		},
		node_3 = {
			connected_to = 2,
			layout_x = 0.4334420914004558,
			layout_y = 0.14609949812868916,
			name = "node_3",
			type = "SHOP",
			prev = {
				[1] = "node_2",
			},
			next = {
				[1] = "node_4",
				[2] = "node_8",
			},
		},
		node_10 = {
			connected_to = 1,
			layout_x = 0.7078092192084041,
			layout_y = 0.7812920439091289,
			name = "node_10",
			type = "SHOP",
			prev = {
				[1] = "node_8",
				[2] = "node_15",
			},
			next = {
				[1] = "node_6",
			},
		},
		node_8 = {
			connected_to = 2,
			label = 3,
			layout_x = 0.529297798074933,
			layout_y = 0.5628627370470987,
			name = "node_8",
			type = "TRAVEL",
			prev = {
				"node_3",
				"node_11",
				"node_14",
			},
			next = {
				[1] = "node_9",
				[2] = "node_10",
			},
		},
		node_1 = {
			connected_to = 1,
			label = 1,
			layout_x = 0.11859721176428013,
			layout_y = 0.20434062837686717,
			name = "node_1",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
			},
		},
		node_9 = {
			connected_to = 1,
			layout_x = 0.6735746812975324,
			layout_y = 0.45958173287340864,
			name = "node_9",
			type = "SHOP",
			prev = {
				[1] = "node_8",
			},
			next = {
				[1] = "node_6",
			},
		},
		node_14 = {
			connected_to = 2,
			layout_x = 0.4388698416362432,
			layout_y = 0.9039722402184235,
			name = "node_14",
			type = "SHOP",
			prev = {
				[1] = "node_13",
			},
			next = {
				[1] = "node_8",
				[2] = "node_15",
			},
		},
		final = {
			layout_x = 1,
			layout_y = 0.43027141042154654,
			name = "final",
			type = "ARENA",
			prev = {
				[1] = "node_6",
			},
			next = {},
		},
		node_15 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.5904910218112734,
			layout_y = 1,
			name = "node_15",
			type = "TRAVEL",
			prev = {
				[1] = "node_14",
			},
			next = {
				[1] = "node_10",
			},
		},
		node_6 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.8212720883393845,
			layout_y = 0.47368223999162073,
			name = "node_6",
			type = "SIGNATURE",
			prev = {
				"node_5",
				"node_9",
				"node_10",
			},
			next = {
				[1] = "final",
			},
		},
		node_12 = {
			connected_to = 2,
			label = 3,
			layout_x = 0.14862983293551557,
			layout_y = 0.6146044267038822,
			name = "node_12",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
				[2] = "node_13",
			},
		},
		node_4 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.581653718428839,
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
			label = 4,
			layout_x = 0.29036245324729737,
			layout_y = 0.7789779649042659,
			name = "node_13",
			type = "TRAVEL",
			prev = {
				[1] = "node_12",
			},
			next = {
				[1] = "node_11",
				[2] = "node_14",
			},
		},
		node_5 = {
			connected_to = 1,
			layout_x = 0.7465943679424847,
			layout_y = 0.12296902497936674,
			name = "node_5",
			type = "SHOP",
			prev = {
				[1] = "node_4",
			},
			next = {
				[1] = "node_6",
			},
		},
		start = {
			connected_to = 2,
			layout_x = 0,
			layout_y = 0.4289115105819608,
			name = "start",
			type = "START",
			next = {
				[1] = "node_1",
				[2] = "node_12",
			},
			prev = {},
		},
		node_2 = {
			connected_to = 2,
			label = 1,
			layout_x = 0.2705747754082472,
			layout_y = 0.3038534497373189,
			name = "node_2",
			type = "TRAVEL",
			prev = {
				[1] = "node_1",
				[2] = "node_12",
			},
			next = {
				[1] = "node_3",
				[2] = "node_11",
			},
		},
	},
	[11] = {
		node_11 = {
			connected_to = 2,
			label = 3,
			layout_x = 0.15578834363147445,
			layout_y = 0.5815577521223584,
			name = "node_11",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
				[2] = "node_12",
			},
		},
		node_3 = {
			connected_to = 2,
			layout_x = 0.4345563036719981,
			layout_y = 0.17315518815317846,
			name = "node_3",
			type = "SHOP",
			prev = {
				[1] = "node_2",
			},
			next = {
				[1] = "node_4",
				[2] = "node_9",
			},
		},
		node_8 = {
			connected_to = 1,
			layout_x = 0.6721191694091868,
			layout_y = 0.2971091130739293,
			name = "node_8",
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
			layout_x = 0.6895997344640165,
			layout_y = 0.7602061391982725,
			name = "node_10",
			type = "SHOP",
			prev = {
				[1] = "node_9",
				[2] = "node_14",
			},
			next = {
				[1] = "node_6",
			},
		},
		node_9 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.516307156181667,
			layout_y = 0.5328379394640738,
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
			connected_to = 1,
			label = 2,
			layout_x = 0.5655044969611074,
			layout_y = 1,
			name = "node_14",
			type = "TRAVEL",
			prev = {
				[1] = "node_13",
			},
			next = {
				[1] = "node_10",
			},
		},
		final = {
			layout_x = 1,
			layout_y = 0.3923304329690594,
			name = "final",
			type = "ARENA",
			prev = {
				[1] = "node_6",
			},
			next = {},
		},
		node_1 = {
			connected_to = 1,
			label = 1,
			layout_x = 0.12156712221170694,
			layout_y = 0.13916862704642738,
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
			layout_x = 0.8117017773232712,
			layout_y = 0.43797445125150136,
			name = "node_6",
			type = "SIGNATURE",
			prev = {
				"node_5",
				"node_8",
				"node_10",
			},
			next = {
				[1] = "final",
			},
		},
		node_12 = {
			connected_to = 1,
			layout_x = 0.27094655503003373,
			layout_y = 0.8233293363858178,
			name = "node_12",
			type = "SHOP",
			prev = {
				[1] = "node_11",
			},
			next = {
				[1] = "node_13",
			},
		},
		node_4 = {
			connected_to = 2,
			label = 2,
			layout_x = 0.5817162730113661,
			layout_y = 0,
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
			connected_to = 2,
			label = 4,
			layout_x = 0.4377821501508217,
			layout_y = 0.803129501059714,
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
		node_5 = {
			connected_to = 1,
			layout_x = 0.7533237047550572,
			layout_y = 0.035924235522634664,
			name = "node_5",
			type = "SHOP",
			prev = {
				[1] = "node_4",
			},
			next = {
				[1] = "node_6",
			},
		},
		start = {
			connected_to = 2,
			layout_x = 0,
			layout_y = 0.38141328746451986,
			name = "start",
			type = "START",
			next = {
				[1] = "node_1",
				[2] = "node_11",
			},
			prev = {},
		},
		node_2 = {
			connected_to = 1,
			label = 1,
			layout_x = 0.2647994833051871,
			layout_y = 0.26720061008977,
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
	[14] = {
		node_11 = {
			connected_to = 2,
			layout_x = 0.44890312974061036,
			layout_y = 0.5330271046580499,
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
			layout_x = 0.41574535388157224,
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
			layout_x = 0.6501274985721031,
			layout_y = 0.47920102373990175,
			name = "node_8",
			type = "SHOP",
			prev = {
				[1] = "node_4",
				[2] = "node_12",
			},
			next = {
				[1] = "node_6",
			},
		},
		node_1 = {
			connected_to = 1,
			label = 1,
			layout_x = 0.11816540555485971,
			layout_y = 0.19272590387020075,
			name = "node_1",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
			},
		},
		node_9 = {
			connected_to = 2,
			label = 3,
			layout_x = 0.165079711161104,
			layout_y = 0.5988473152138685,
			name = "node_9",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_2",
				[2] = "node_10",
			},
		},
		node_14 = {
			connected_to = 1,
			layout_x = 0.4323160053068383,
			layout_y = 1,
			name = "node_14",
			type = "SHOP",
			prev = {
				[1] = "node_10",
			},
			next = {
				[1] = "node_12",
			},
		},
		node_6 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.8133403252845689,
			layout_y = 0.47603874171145755,
			name = "node_6",
			type = "SIGNATURE",
			prev = {
				"node_5",
				"node_8",
				"node_13",
			},
			next = {
				[1] = "final",
			},
		},
		node_10 = {
			connected_to = 2,
			label = 3,
			layout_x = 0.3153971168865005,
			layout_y = 0.7750319991744987,
			name = "node_10",
			type = "TRAVEL",
			prev = {
				[1] = "node_9",
			},
			next = {
				[1] = "node_11",
				[2] = "node_14",
			},
		},
		final = {
			layout_x = 1,
			layout_y = 0.41586455597898436,
			name = "final",
			type = "ARENA",
			prev = {
				[1] = "node_6",
			},
			next = {},
		},
		node_12 = {
			connected_to = 2,
			label = 4,
			layout_x = 0.5678795879081614,
			layout_y = 0.7757198012782537,
			name = "node_12",
			type = "TRAVEL",
			prev = {
				[1] = "node_11",
				[2] = "node_14",
			},
			next = {
				[1] = "node_8",
				[2] = "node_13",
			},
		},
		node_4 = {
			connected_to = 2,
			label = 2,
			layout_x = 0.5555829759383343,
			layout_y = 0.20850375294265824,
			name = "node_4",
			type = "TRAVEL",
			prev = {
				[1] = "node_3",
				[2] = "node_11",
			},
			next = {
				[1] = "node_5",
				[2] = "node_8",
			},
		},
		node_13 = {
			connected_to = 1,
			layout_x = 0.7420221373149931,
			layout_y = 0.8440067910260932,
			name = "node_13",
			type = "SHOP",
			prev = {
				[1] = "node_12",
			},
			next = {
				[1] = "node_6",
			},
		},
		node_5 = {
			connected_to = 1,
			layout_x = 0.7317296381853038,
			layout_y = 0.11564465763572915,
			name = "node_5",
			type = "SHOP",
			prev = {
				[1] = "node_4",
			},
			next = {
				[1] = "node_6",
			},
		},
		start = {
			connected_to = 2,
			layout_x = 0,
			layout_y = 0.42397840432741873,
			name = "start",
			type = "START",
			next = {
				[1] = "node_1",
				[2] = "node_9",
			},
			prev = {},
		},
		node_2 = {
			connected_to = 1,
			layout_x = 0.272437308481413,
			layout_y = 0.24310322257224992,
			name = "node_2",
			type = "SHOP",
			prev = {
				[1] = "node_1",
				[2] = "node_9",
			},
			next = {
				[1] = "node_3",
			},
		},
	},
	[15] = {
		node_9 = {
			connected_to = 1,
			layout_x = 0.7006937589558274,
			layout_y = 0.7036737151291385,
			name = "node_9",
			type = "SHOP",
			prev = {
				"node_8",
				"node_11",
				"node_15",
			},
			next = {
				[1] = "node_6",
			},
		},
		node_14 = {
			connected_to = 2,
			layout_x = 0.4343695624192359,
			layout_y = 0.952685561563652,
			name = "node_14",
			type = "SHOP",
			prev = {
				[1] = "node_12",
			},
			next = {
				[1] = "node_11",
				[2] = "node_15",
			},
		},
		final = {
			layout_x = 1,
			layout_y = 0.4598667822257213,
			name = "final",
			type = "ARENA",
			prev = {
				[1] = "node_6",
			},
			next = {},
		},
		node_12 = {
			connected_to = 2,
			label = 6,
			layout_x = 0.2564145335161457,
			layout_y = 0.7303759676445974,
			name = "node_12",
			type = "TRAVEL",
			prev = {
				[1] = "node_1",
				[2] = "node_16",
			},
			next = {
				[1] = "node_13",
				[2] = "node_14",
			},
		},
		node_4 = {
			connected_to = 1,
			label = 2,
			layout_x = 0.6178715699408059,
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
			connected_to = 1,
			layout_x = 0.3959347374306898,
			layout_y = 0.6873135179179022,
			name = "node_13",
			type = "SHOP",
			prev = {
				[1] = "node_12",
			},
			next = {
				[1] = "node_11",
			},
		},
		start = {
			connected_to = 2,
			layout_x = 0,
			layout_y = 0.4788058205774801,
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
			layout_x = 0.30013759584366756,
			layout_y = 0.19782379876855513,
			name = "node_2",
			type = "SHOP",
			prev = {
				[1] = "node_1",
			},
			next = {
				[1] = "node_3",
				[2] = "node_10",
			},
		},
		node_11 = {
			connected_to = 1,
			label = 5,
			layout_x = 0.534371650101244,
			layout_y = 0.691809713415428,
			name = "node_11",
			type = "TRAVEL",
			prev = {
				"node_10",
				"node_13",
				"node_14",
			},
			next = {
				[1] = "node_9",
			},
		},
		node_3 = {
			connected_to = 2,
			label = 1,
			layout_x = 0.46207448509220833,
			layout_y = 0.07270196647770252,
			name = "node_3",
			type = "TRAVEL",
			prev = {
				[1] = "node_2",
			},
			next = {
				[1] = "node_4",
				[2] = "node_8",
			},
		},
		node_16 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.09660335395191873,
			layout_y = 0.7337782280481012,
			name = "node_16",
			type = "SIGNATURE",
			prev = {
				[1] = "start",
			},
			next = {
				[1] = "node_12",
			},
		},
		node_8 = {
			connected_to = 2,
			label = 3,
			layout_x = 0.6202948553133983,
			layout_y = 0.3470085105121055,
			name = "node_8",
			type = "TRAVEL",
			prev = {
				[1] = "node_3",
			},
			next = {
				[1] = "node_5",
				[2] = "node_9",
			},
		},
		node_1 = {
			connected_to = 2,
			label = 1,
			layout_x = 0.16400395702147755,
			layout_y = 0.3891219399881167,
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
			layout_x = 0.8287994898440675,
			layout_y = 0.4960979155901372,
			name = "node_6",
			type = "SIGNATURE",
			prev = {
				[1] = "node_5",
				[2] = "node_9",
			},
			next = {
				[1] = "final",
			},
		},
		node_15 = {
			connected_to = 1,
			label = 3,
			layout_x = 0.6153934679688778,
			layout_y = 1,
			name = "node_15",
			type = "TRAVEL",
			prev = {
				[1] = "node_14",
			},
			next = {
				[1] = "node_9",
			},
		},
		node_5 = {
			connected_to = 1,
			layout_x = 0.7462383044166822,
			layout_y = 0.21372237039666384,
			name = "node_5",
			type = "SHOP",
			prev = {
				[1] = "node_4",
				[2] = "node_8",
			},
			next = {
				[1] = "node_6",
			},
		},
		node_10 = {
			connected_to = 1,
			label = 4,
			layout_x = 0.4204027765807287,
			layout_y = 0.3982161239003032,
			name = "node_10",
			type = "TRAVEL",
			prev = {
				[1] = "node_2",
			},
			next = {
				[1] = "node_11",
			},
		},
	},
}
