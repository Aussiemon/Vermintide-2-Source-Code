return {
	[0] = {
		node_11 = {
			type = "TRAVEL",
			name = "node_11",
			layout_y = 0.8712633315512156,
			connected_to = 2,
			label = 4,
			layout_x = 0.5837227999458641,
			prev = {
				[1.0] = "node_10"
			},
			next = {
				[1.0] = "node_8",
				[2.0] = "node_12"
			}
		},
		node_3 = {
			type = "TRAVEL",
			name = "node_3",
			layout_y = 0.12360361498958282,
			connected_to = 1,
			label = 1,
			layout_x = 0.4287294881909612,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_4"
			}
		},
		node_8 = {
			name = "node_8",
			layout_y = 0.567723830385304,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.6496513694402192,
			prev = {
				[1.0] = "node_4",
				[2.0] = "node_11"
			},
			next = {
				[1.0] = "node_6"
			}
		},
		node_9 = {
			type = "TRAVEL",
			name = "node_9",
			layout_y = 0.5531534131831244,
			connected_to = 1,
			label = 3,
			layout_x = 0.26286811360234597,
			prev = {
				[1.0] = "node_1",
				[2.0] = "node_13"
			},
			next = {
				[1.0] = "node_10"
			}
		},
		node_1 = {
			type = "SIGNATURE",
			name = "node_1",
			layout_y = 0.26868027184869525,
			connected_to = 2,
			label = 1,
			layout_x = 0.1573749850602629,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2",
				[2.0] = "node_9"
			}
		},
		node_14 = {
			type = "TRAVEL",
			name = "node_14",
			layout_y = 1,
			connected_to = 1,
			label = 5,
			layout_x = 0.30241506896117465,
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
			layout_y = 0.4546094776161927,
			layout_x = 1,
			prev = {
				[1.0] = "node_6"
			},
			next = {}
		},
		start = {
			layout_y = 0.48202251538537705,
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
			type = "SIGNATURE",
			name = "node_6",
			layout_y = 0.5228990738016958,
			connected_to = 1,
			label = 2,
			layout_x = 0.8124042094693614,
			prev = {
				"node_5",
				"node_8",
				"node_12"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_12 = {
			name = "node_12",
			layout_y = 0.9246563162120202,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.7497939893927339,
			prev = {
				[1.0] = "node_11"
			},
			next = {
				[1.0] = "node_6"
			}
		},
		node_4 = {
			type = "TRAVEL",
			name = "node_4",
			layout_y = 0.32113028797511917,
			connected_to = 2,
			label = 2,
			layout_x = 0.5580031927959185,
			prev = {
				[1.0] = "node_3",
				[2.0] = "node_10"
			},
			next = {
				[1.0] = "node_5",
				[2.0] = "node_8"
			}
		},
		node_13 = {
			type = "SIGNATURE",
			name = "node_13",
			layout_y = 0.781342671836313,
			connected_to = 2,
			label = 3,
			layout_x = 0.1476744885734397,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_9",
				[2.0] = "node_14"
			}
		},
		node_5 = {
			name = "node_5",
			layout_y = 0.1492982311711086,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.7253837725654373,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_6"
			}
		},
		node_10 = {
			name = "node_10",
			layout_y = 0.712344160883225,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.4262404665800695,
			prev = {
				[1.0] = "node_9",
				[2.0] = "node_14"
			},
			next = {
				[1.0] = "node_4",
				[2.0] = "node_11"
			}
		},
		node_2 = {
			name = "node_2",
			layout_y = 0,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.28076232254211814,
			prev = {
				[1.0] = "node_1"
			},
			next = {
				[1.0] = "node_3"
			}
		}
	},
	[2] = {
		node_11 = {
			type = "TRAVEL",
			name = "node_11",
			layout_y = 0.7447662008757209,
			connected_to = 1,
			label = 5,
			layout_x = 0.2707210928296871,
			prev = {
				[1.0] = "node_1",
				[2.0] = "node_13"
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
			layout_x = 0.4640182057371875,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_4"
			}
		},
		node_8 = {
			name = "node_8",
			layout_y = 0.6782739257824493,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.6992470247392062,
			prev = {
				[1.0] = "node_4",
				[2.0] = "node_10"
			},
			next = {
				[1.0] = "node_6"
			}
		},
		node_9 = {
			type = "TRAVEL",
			name = "node_9",
			layout_y = 0.49966292279038127,
			connected_to = 1,
			label = 3,
			layout_x = 0.44060195246329015,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_10"
			}
		},
		node_1 = {
			type = "SIGNATURE",
			name = "node_1",
			layout_y = 0.3571625193090358,
			connected_to = 2,
			label = 1,
			layout_x = 0.17704688826062803,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2",
				[2.0] = "node_11"
			}
		},
		final = {
			name = "final",
			type = "ARENA",
			layout_y = 0.4388101313132944,
			layout_x = 1,
			prev = {
				[1.0] = "node_6"
			},
			next = {}
		},
		start = {
			layout_y = 0.45792763124477026,
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
			type = "SIGNATURE",
			name = "node_6",
			layout_y = 0.4696245041732077,
			connected_to = 1,
			label = 2,
			layout_x = 0.8208412244080527,
			prev = {
				[1.0] = "node_5",
				[2.0] = "node_8"
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
			layout_x = 0.41896336581249616,
			prev = {
				[1.0] = "node_11"
			},
			next = {
				[1.0] = "node_10"
			}
		},
		node_4 = {
			type = "TRAVEL",
			name = "node_4",
			layout_y = 0.26334842118946605,
			connected_to = 2,
			label = 2,
			layout_x = 0.606278243864985,
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
			layout_y = 0.7554357666875892,
			connected_to = 1,
			label = 3,
			layout_x = 0.10943419727658593,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_11"
			}
		},
		node_5 = {
			name = "node_5",
			layout_y = 0.16148434298340786,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.7513871034143199,
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
			layout_y = 0.7992342997071507,
			connected_to = 1,
			label = 4,
			layout_x = 0.5444433324914865,
			prev = {
				[1.0] = "node_9",
				[2.0] = "node_12"
			},
			next = {
				[1.0] = "node_8"
			}
		},
		node_2 = {
			name = "node_2",
			layout_y = 0.2035984472469971,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.33417724118728365,
			prev = {
				[1.0] = "node_1"
			},
			next = {
				[1.0] = "node_3",
				[2.0] = "node_9"
			}
		}
	},
	[6] = {
		node_11 = {
			name = "node_11",
			layout_y = 0.8300581811558851,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.45519240939162525,
			prev = {
				[1.0] = "node_9",
				[2.0] = "node_13"
			},
			next = {
				[1.0] = "node_4"
			}
		},
		node_3 = {
			type = "TRAVEL",
			name = "node_3",
			layout_y = 0.06614875243955969,
			connected_to = 1,
			label = 1,
			layout_x = 0.4991588553231776,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_4"
			}
		},
		node_8 = {
			name = "node_8",
			layout_y = 0.7812253864936286,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.7175514354354166,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_6"
			}
		},
		node_9 = {
			type = "TRAVEL",
			name = "node_9",
			layout_y = 0.5357553020468329,
			connected_to = 2,
			label = 3,
			layout_x = 0.3042926881217156,
			prev = {
				[1.0] = "node_1"
			},
			next = {
				[1.0] = "node_10",
				[2.0] = "node_11"
			}
		},
		node_1 = {
			type = "SIGNATURE",
			name = "node_1",
			layout_y = 0.25332374557289516,
			connected_to = 2,
			label = 1,
			layout_x = 0.1717687798765419,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2",
				[2.0] = "node_9"
			}
		},
		final = {
			name = "final",
			type = "ARENA",
			layout_y = 0.4315991319501357,
			layout_x = 1,
			prev = {
				[1.0] = "node_6"
			},
			next = {}
		},
		start = {
			layout_y = 0.45650239643147034,
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
		node_6 = {
			type = "SIGNATURE",
			name = "node_6",
			layout_y = 0.5043219592636717,
			connected_to = 1,
			label = 2,
			layout_x = 0.8206036811532593,
			prev = {
				[1.0] = "node_5",
				[2.0] = "node_8"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_12 = {
			type = "TRAVEL",
			name = "node_12",
			layout_y = 0.7997068504251369,
			connected_to = 1,
			label = 4,
			layout_x = 0.12280755402777842,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_13"
			}
		},
		node_4 = {
			type = "TRAVEL",
			name = "node_4",
			layout_y = 0.4857917038760978,
			connected_to = 2,
			label = 2,
			layout_x = 0.5942085931500013,
			prev = {
				"node_3",
				"node_10",
				"node_11"
			},
			next = {
				[1.0] = "node_5",
				[2.0] = "node_8"
			}
		},
		node_13 = {
			type = "SIGNATURE",
			name = "node_13",
			layout_y = 1,
			connected_to = 1,
			label = 3,
			layout_x = 0.29860140841226424,
			prev = {
				[1.0] = "node_12"
			},
			next = {
				[1.0] = "node_11"
			}
		},
		node_5 = {
			name = "node_5",
			layout_y = 0.22445146270685545,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.7224806082153064,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_6"
			}
		},
		node_10 = {
			name = "node_10",
			layout_y = 0.4670142911008508,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.4471736327201422,
			prev = {
				[1.0] = "node_9"
			},
			next = {
				[1.0] = "node_4"
			}
		},
		node_2 = {
			name = "node_2",
			layout_y = 0,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.3144230713638458,
			prev = {
				[1.0] = "node_1"
			},
			next = {
				[1.0] = "node_3"
			}
		}
	},
	[9] = {
		node_11 = {
			type = "SIGNATURE",
			name = "node_11",
			layout_y = 0.8679888833477805,
			connected_to = 1,
			label = 4,
			layout_x = 0.550424406275409,
			prev = {
				[1.0] = "node_10",
				[2.0] = "node_13"
			},
			next = {
				[1.0] = "node_8"
			}
		},
		node_3 = {
			name = "node_3",
			layout_y = 0,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.46129255783859835,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_4",
				[2.0] = "node_9"
			}
		},
		node_8 = {
			name = "node_8",
			layout_y = 0.5824861178936959,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.6739434263381867,
			prev = {
				"node_4",
				"node_9",
				"node_11"
			},
			next = {
				[1.0] = "node_6"
			}
		},
		node_1 = {
			type = "TRAVEL",
			name = "node_1",
			layout_y = 0.2917616102708692,
			connected_to = 2,
			label = 1,
			layout_x = 0.16607330890162983,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2",
				[2.0] = "node_12"
			}
		},
		node_9 = {
			type = "SIGNATURE",
			name = "node_9",
			layout_y = 0.3594413629247439,
			connected_to = 1,
			label = 3,
			layout_x = 0.5677789881143774,
			prev = {
				[1.0] = "node_3"
			},
			next = {
				[1.0] = "node_8"
			}
		},
		node_14 = {
			type = "TRAVEL",
			name = "node_14",
			layout_y = 0.729735737783808,
			connected_to = 1,
			label = 4,
			layout_x = 0.10747362847450014,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_12"
			}
		},
		final = {
			name = "final",
			type = "ARENA",
			layout_y = 0.39654150148468503,
			layout_x = 1,
			prev = {
				[1.0] = "node_6"
			},
			next = {}
		},
		start = {
			layout_y = 0.4120886295047995,
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
		node_6 = {
			type = "SIGNATURE",
			name = "node_6",
			layout_y = 0.432986681430277,
			connected_to = 1,
			label = 2,
			layout_x = 0.8279066023596735,
			prev = {
				[1.0] = "node_5",
				[2.0] = "node_8"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_12 = {
			type = "TRAVEL",
			name = "node_12",
			layout_y = 0.6882002543892974,
			connected_to = 2,
			label = 3,
			layout_x = 0.26923606335453026,
			prev = {
				[1.0] = "node_1",
				[2.0] = "node_14"
			},
			next = {
				[1.0] = "node_10",
				[2.0] = "node_13"
			}
		},
		node_4 = {
			type = "SIGNATURE",
			name = "node_4",
			layout_y = 0.06255913915585834,
			connected_to = 2,
			label = 1,
			layout_x = 0.6196210531694535,
			prev = {
				[1.0] = "node_3"
			},
			next = {
				[1.0] = "node_5",
				[2.0] = "node_8"
			}
		},
		node_13 = {
			name = "node_13",
			layout_y = 1,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.3968243857972001,
			prev = {
				[1.0] = "node_12"
			},
			next = {
				[1.0] = "node_11"
			}
		},
		node_5 = {
			name = "node_5",
			layout_y = 0.09369688607566298,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.7717846716319232,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_6"
			}
		},
		node_10 = {
			name = "node_10",
			layout_y = 0.5462710571870343,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.40437553001659926,
			prev = {
				[1.0] = "node_2",
				[2.0] = "node_12"
			},
			next = {
				[1.0] = "node_11"
			}
		},
		node_2 = {
			type = "TRAVEL",
			name = "node_2",
			layout_y = 0.16706135996561353,
			connected_to = 2,
			label = 2,
			layout_x = 0.3194593614199568,
			prev = {
				[1.0] = "node_1"
			},
			next = {
				[1.0] = "node_3",
				[2.0] = "node_10"
			}
		}
	},
	[10] = {
		node_11 = {
			name = "node_11",
			layout_y = 0.5171296163465983,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.37277481069121143,
			prev = {
				[1.0] = "node_2",
				[2.0] = "node_13"
			},
			next = {
				[1.0] = "node_8"
			}
		},
		node_3 = {
			name = "node_3",
			layout_y = 0.14609949812868916,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.4334420914004558,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_4",
				[2.0] = "node_8"
			}
		},
		node_10 = {
			name = "node_10",
			layout_y = 0.7812920439091289,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.7078092192084041,
			prev = {
				[1.0] = "node_8",
				[2.0] = "node_15"
			},
			next = {
				[1.0] = "node_6"
			}
		},
		node_8 = {
			type = "TRAVEL",
			name = "node_8",
			layout_y = 0.5628627370470987,
			connected_to = 2,
			label = 3,
			layout_x = 0.529297798074933,
			prev = {
				"node_3",
				"node_11",
				"node_14"
			},
			next = {
				[1.0] = "node_9",
				[2.0] = "node_10"
			}
		},
		node_1 = {
			type = "SIGNATURE",
			name = "node_1",
			layout_y = 0.20434062837686717,
			connected_to = 1,
			label = 1,
			layout_x = 0.11859721176428013,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2"
			}
		},
		node_9 = {
			name = "node_9",
			layout_y = 0.45958173287340864,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.6735746812975324,
			prev = {
				[1.0] = "node_8"
			},
			next = {
				[1.0] = "node_6"
			}
		},
		node_14 = {
			name = "node_14",
			layout_y = 0.9039722402184235,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.4388698416362432,
			prev = {
				[1.0] = "node_13"
			},
			next = {
				[1.0] = "node_8",
				[2.0] = "node_15"
			}
		},
		final = {
			name = "final",
			type = "ARENA",
			layout_y = 0.43027141042154654,
			layout_x = 1,
			prev = {
				[1.0] = "node_6"
			},
			next = {}
		},
		node_15 = {
			type = "TRAVEL",
			name = "node_15",
			layout_y = 1,
			connected_to = 1,
			label = 2,
			layout_x = 0.5904910218112734,
			prev = {
				[1.0] = "node_14"
			},
			next = {
				[1.0] = "node_10"
			}
		},
		node_6 = {
			type = "SIGNATURE",
			name = "node_6",
			layout_y = 0.47368223999162073,
			connected_to = 1,
			label = 2,
			layout_x = 0.8212720883393845,
			prev = {
				"node_5",
				"node_9",
				"node_10"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_12 = {
			type = "SIGNATURE",
			name = "node_12",
			layout_y = 0.6146044267038822,
			connected_to = 2,
			label = 3,
			layout_x = 0.14862983293551557,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2",
				[2.0] = "node_13"
			}
		},
		node_4 = {
			type = "TRAVEL",
			name = "node_4",
			layout_y = 0,
			connected_to = 1,
			label = 2,
			layout_x = 0.581653718428839,
			prev = {
				[1.0] = "node_3"
			},
			next = {
				[1.0] = "node_5"
			}
		},
		node_13 = {
			type = "TRAVEL",
			name = "node_13",
			layout_y = 0.7789779649042659,
			connected_to = 2,
			label = 4,
			layout_x = 0.29036245324729737,
			prev = {
				[1.0] = "node_12"
			},
			next = {
				[1.0] = "node_11",
				[2.0] = "node_14"
			}
		},
		node_5 = {
			name = "node_5",
			layout_y = 0.12296902497936674,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.7465943679424847,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_6"
			}
		},
		start = {
			layout_y = 0.4289115105819608,
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
			type = "TRAVEL",
			name = "node_2",
			layout_y = 0.3038534497373189,
			connected_to = 2,
			label = 1,
			layout_x = 0.2705747754082472,
			prev = {
				[1.0] = "node_1",
				[2.0] = "node_12"
			},
			next = {
				[1.0] = "node_3",
				[2.0] = "node_11"
			}
		}
	},
	[11] = {
		node_11 = {
			type = "SIGNATURE",
			name = "node_11",
			layout_y = 0.5815577521223584,
			connected_to = 2,
			label = 3,
			layout_x = 0.15578834363147445,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2",
				[2.0] = "node_12"
			}
		},
		node_3 = {
			name = "node_3",
			layout_y = 0.17315518815317846,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.4345563036719981,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_4",
				[2.0] = "node_9"
			}
		},
		node_8 = {
			name = "node_8",
			layout_y = 0.2971091130739293,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.6721191694091868,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_6"
			}
		},
		node_10 = {
			name = "node_10",
			layout_y = 0.7602061391982725,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.6895997344640165,
			prev = {
				[1.0] = "node_9",
				[2.0] = "node_14"
			},
			next = {
				[1.0] = "node_6"
			}
		},
		node_9 = {
			type = "TRAVEL",
			name = "node_9",
			layout_y = 0.5328379394640738,
			connected_to = 1,
			label = 3,
			layout_x = 0.516307156181667,
			prev = {
				[1.0] = "node_3",
				[2.0] = "node_13"
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
			label = 2,
			layout_x = 0.5655044969611074,
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
			layout_y = 0.3923304329690594,
			layout_x = 1,
			prev = {
				[1.0] = "node_6"
			},
			next = {}
		},
		node_1 = {
			type = "SIGNATURE",
			name = "node_1",
			layout_y = 0.13916862704642738,
			connected_to = 1,
			label = 1,
			layout_x = 0.12156712221170694,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2"
			}
		},
		node_6 = {
			type = "SIGNATURE",
			name = "node_6",
			layout_y = 0.43797445125150136,
			connected_to = 1,
			label = 2,
			layout_x = 0.8117017773232712,
			prev = {
				"node_5",
				"node_8",
				"node_10"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_12 = {
			name = "node_12",
			layout_y = 0.8233293363858178,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.27094655503003373,
			prev = {
				[1.0] = "node_11"
			},
			next = {
				[1.0] = "node_13"
			}
		},
		node_4 = {
			type = "TRAVEL",
			name = "node_4",
			layout_y = 0,
			connected_to = 2,
			label = 2,
			layout_x = 0.5817162730113661,
			prev = {
				[1.0] = "node_3"
			},
			next = {
				[1.0] = "node_5",
				[2.0] = "node_8"
			}
		},
		node_13 = {
			type = "TRAVEL",
			name = "node_13",
			layout_y = 0.803129501059714,
			connected_to = 2,
			label = 4,
			layout_x = 0.4377821501508217,
			prev = {
				[1.0] = "node_12"
			},
			next = {
				[1.0] = "node_9",
				[2.0] = "node_14"
			}
		},
		node_5 = {
			name = "node_5",
			layout_y = 0.035924235522634664,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.7533237047550572,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_6"
			}
		},
		start = {
			layout_y = 0.38141328746451986,
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
		node_2 = {
			type = "TRAVEL",
			name = "node_2",
			layout_y = 0.26720061008977,
			connected_to = 1,
			label = 1,
			layout_x = 0.2647994833051871,
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
			layout_y = 0.5330271046580499,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.44890312974061036,
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
			layout_x = 0.41574535388157224,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_4"
			}
		},
		node_8 = {
			name = "node_8",
			layout_y = 0.47920102373990175,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.6501274985721031,
			prev = {
				[1.0] = "node_4",
				[2.0] = "node_12"
			},
			next = {
				[1.0] = "node_6"
			}
		},
		node_1 = {
			type = "SIGNATURE",
			name = "node_1",
			layout_y = 0.19272590387020075,
			connected_to = 1,
			label = 1,
			layout_x = 0.11816540555485971,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2"
			}
		},
		node_9 = {
			type = "SIGNATURE",
			name = "node_9",
			layout_y = 0.5988473152138685,
			connected_to = 2,
			label = 3,
			layout_x = 0.165079711161104,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_2",
				[2.0] = "node_10"
			}
		},
		node_14 = {
			name = "node_14",
			layout_y = 1,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.4323160053068383,
			prev = {
				[1.0] = "node_10"
			},
			next = {
				[1.0] = "node_12"
			}
		},
		node_6 = {
			type = "SIGNATURE",
			name = "node_6",
			layout_y = 0.47603874171145755,
			connected_to = 1,
			label = 2,
			layout_x = 0.8133403252845689,
			prev = {
				"node_5",
				"node_8",
				"node_13"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_10 = {
			type = "TRAVEL",
			name = "node_10",
			layout_y = 0.7750319991744987,
			connected_to = 2,
			label = 3,
			layout_x = 0.3153971168865005,
			prev = {
				[1.0] = "node_9"
			},
			next = {
				[1.0] = "node_11",
				[2.0] = "node_14"
			}
		},
		final = {
			name = "final",
			type = "ARENA",
			layout_y = 0.41586455597898436,
			layout_x = 1,
			prev = {
				[1.0] = "node_6"
			},
			next = {}
		},
		node_12 = {
			type = "TRAVEL",
			name = "node_12",
			layout_y = 0.7757198012782537,
			connected_to = 2,
			label = 4,
			layout_x = 0.5678795879081614,
			prev = {
				[1.0] = "node_11",
				[2.0] = "node_14"
			},
			next = {
				[1.0] = "node_8",
				[2.0] = "node_13"
			}
		},
		node_4 = {
			type = "TRAVEL",
			name = "node_4",
			layout_y = 0.20850375294265824,
			connected_to = 2,
			label = 2,
			layout_x = 0.5555829759383343,
			prev = {
				[1.0] = "node_3",
				[2.0] = "node_11"
			},
			next = {
				[1.0] = "node_5",
				[2.0] = "node_8"
			}
		},
		node_13 = {
			name = "node_13",
			layout_y = 0.8440067910260932,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.7420221373149931,
			prev = {
				[1.0] = "node_12"
			},
			next = {
				[1.0] = "node_6"
			}
		},
		node_5 = {
			name = "node_5",
			layout_y = 0.11564465763572915,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.7317296381853038,
			prev = {
				[1.0] = "node_4"
			},
			next = {
				[1.0] = "node_6"
			}
		},
		start = {
			layout_y = 0.42397840432741873,
			name = "start",
			type = "START",
			connected_to = 2,
			layout_x = 0,
			next = {
				[1.0] = "node_1",
				[2.0] = "node_9"
			},
			prev = {}
		},
		node_2 = {
			name = "node_2",
			layout_y = 0.24310322257224992,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.272437308481413,
			prev = {
				[1.0] = "node_1",
				[2.0] = "node_9"
			},
			next = {
				[1.0] = "node_3"
			}
		}
	},
	[15] = {
		node_9 = {
			name = "node_9",
			layout_y = 0.7036737151291385,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.7006937589558274,
			prev = {
				"node_8",
				"node_11",
				"node_15"
			},
			next = {
				[1.0] = "node_6"
			}
		},
		node_14 = {
			name = "node_14",
			layout_y = 0.952685561563652,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.4343695624192359,
			prev = {
				[1.0] = "node_12"
			},
			next = {
				[1.0] = "node_11",
				[2.0] = "node_15"
			}
		},
		final = {
			name = "final",
			type = "ARENA",
			layout_y = 0.4598667822257213,
			layout_x = 1,
			prev = {
				[1.0] = "node_6"
			},
			next = {}
		},
		node_12 = {
			type = "TRAVEL",
			name = "node_12",
			layout_y = 0.7303759676445974,
			connected_to = 2,
			label = 6,
			layout_x = 0.2564145335161457,
			prev = {
				[1.0] = "node_1",
				[2.0] = "node_16"
			},
			next = {
				[1.0] = "node_13",
				[2.0] = "node_14"
			}
		},
		node_4 = {
			type = "TRAVEL",
			name = "node_4",
			layout_y = 0,
			connected_to = 1,
			label = 2,
			layout_x = 0.6178715699408059,
			prev = {
				[1.0] = "node_3"
			},
			next = {
				[1.0] = "node_5"
			}
		},
		node_13 = {
			name = "node_13",
			layout_y = 0.6873135179179022,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.3959347374306898,
			prev = {
				[1.0] = "node_12"
			},
			next = {
				[1.0] = "node_11"
			}
		},
		start = {
			layout_y = 0.4788058205774801,
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
			layout_y = 0.19782379876855513,
			connected_to = 2,
			type = "SHOP",
			layout_x = 0.30013759584366756,
			prev = {
				[1.0] = "node_1"
			},
			next = {
				[1.0] = "node_3",
				[2.0] = "node_10"
			}
		},
		node_11 = {
			type = "TRAVEL",
			name = "node_11",
			layout_y = 0.691809713415428,
			connected_to = 1,
			label = 5,
			layout_x = 0.534371650101244,
			prev = {
				"node_10",
				"node_13",
				"node_14"
			},
			next = {
				[1.0] = "node_9"
			}
		},
		node_3 = {
			type = "TRAVEL",
			name = "node_3",
			layout_y = 0.07270196647770252,
			connected_to = 2,
			label = 1,
			layout_x = 0.46207448509220833,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_4",
				[2.0] = "node_8"
			}
		},
		node_16 = {
			type = "SIGNATURE",
			name = "node_16",
			layout_y = 0.7337782280481012,
			connected_to = 1,
			label = 3,
			layout_x = 0.09660335395191873,
			prev = {
				[1.0] = "start"
			},
			next = {
				[1.0] = "node_12"
			}
		},
		node_8 = {
			type = "TRAVEL",
			name = "node_8",
			layout_y = 0.3470085105121055,
			connected_to = 2,
			label = 3,
			layout_x = 0.6202948553133983,
			prev = {
				[1.0] = "node_3"
			},
			next = {
				[1.0] = "node_5",
				[2.0] = "node_9"
			}
		},
		node_1 = {
			type = "SIGNATURE",
			name = "node_1",
			layout_y = 0.3891219399881167,
			connected_to = 2,
			label = 1,
			layout_x = 0.16400395702147755,
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
			layout_y = 0.4960979155901372,
			connected_to = 1,
			label = 2,
			layout_x = 0.8287994898440675,
			prev = {
				[1.0] = "node_5",
				[2.0] = "node_9"
			},
			next = {
				[1.0] = "final"
			}
		},
		node_15 = {
			type = "TRAVEL",
			name = "node_15",
			layout_y = 1,
			connected_to = 1,
			label = 3,
			layout_x = 0.6153934679688778,
			prev = {
				[1.0] = "node_14"
			},
			next = {
				[1.0] = "node_9"
			}
		},
		node_5 = {
			name = "node_5",
			layout_y = 0.21372237039666384,
			connected_to = 1,
			type = "SHOP",
			layout_x = 0.7462383044166822,
			prev = {
				[1.0] = "node_4",
				[2.0] = "node_8"
			},
			next = {
				[1.0] = "node_6"
			}
		},
		node_10 = {
			type = "TRAVEL",
			name = "node_10",
			layout_y = 0.3982161239003032,
			connected_to = 1,
			label = 4,
			layout_x = 0.4204027765807287,
			prev = {
				[1.0] = "node_2"
			},
			next = {
				[1.0] = "node_11"
			}
		}
	}
}
