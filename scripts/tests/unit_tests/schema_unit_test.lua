local schema = Schema.define

local function odd_key_1()
	return
end

local odd_key_2 = {}
local odd_key_3 = -1
local _enum = {
	"a",
	"b",
	"c"
}
local _hashmap = {
	c = false,
	a = 0,
	b = "string"
}
local _odd_enum = {
	odd_key_1,
	odd_key_2,
	odd_key_3
}
local _odd_hashmap = {
	[odd_key_1] = 0,
	[odd_key_2] = "string",
	[odd_key_3] = false
}

local function is_five(val)
	return val == 5
end

local test_data = {
	key = "a",
	negative = -10,
	string = "hello",
	bool_true = true,
	bool_false = false,
	five = 5,
	zero = 0,
	big_number = math.huge,
	func_true = function ()
		return true
	end,
	func_false = function ()
		return false
	end,
	table_array = {
		1,
		2,
		3
	},
	multi_type_table_array = {
		1,
		"hi",
		{}
	},
	map = {
		c = 3,
		a = 1,
		b = 2
	},
	nested_map = {
		inner_map = {
			c = 3,
			a = 1,
			b = 2
		}
	},
	userdata = Vector3Box(1, 2, 3),
	keys = {
		"a",
		"b",
		"c"
	},
	odd_keys = {
		odd_key_1,
		odd_key_2,
		odd_key_3
	}
}
local GENERAL = schema("GENERAL", {
	strict = true,
	type = "table",
	map = {
		bool_true = {
			type = "boolean"
		},
		bool_false = {
			type = "boolean"
		},
		five = {
			type = "number"
		},
		zero = {
			type = "number"
		},
		negative = {
			type = "number"
		},
		big_number = {
			type = "number"
		},
		func_true = {
			type = "function"
		},
		func_false = {
			type = "function"
		},
		string = {
			type = "string"
		},
		table_array = {
			type = "table"
		},
		multi_type_table_array = {
			type = "table",
			table_array = {
				type = {
					"string",
					"number",
					"table"
				}
			}
		},
		map = {
			strict = true,
			type = "table",
			map = {
				a = {
					type = "number"
				},
				b = {
					type = "number"
				},
				c = {
					type = "number"
				}
			}
		},
		nested_map = {
			strict = true,
			type = "table",
			map = {
				inner_map = {
					strict = true,
					type = "table",
					map = {
						a = {
							type = "number"
						},
						b = {
							type = "number"
						},
						c = {
							type = "number"
						}
					}
				}
			}
		},
		userdata = {
			type = "userdata"
		},
		key = {
			type = "string"
		},
		keys = {
			type = "table"
		},
		odd_keys = {
			type = "table"
		}
	}
})

Schema.validate(GENERAL, test_data)

local NUMBERS = schema("NUMBERS", {
	type = "table",
	map = {
		five = {
			max = 5,
			min = 5,
			type = "number"
		},
		zero = {
			max = 0,
			min = 0,
			type = "number"
		},
		negative = {
			max = 0,
			type = "number"
		},
		big_number = {
			min = 0,
			type = "number"
		}
	}
})

Schema.validate(NUMBERS, test_data)

local ARRAY = schema("ARRAY", {
	type = "table",
	map = {
		table_array = {
			length = 3,
			type = "table",
			table_array = {
				type = "number"
			}
		}
	}
})

Schema.validate(ARRAY, test_data)

local LISTS = schema("LISTS", {
	type = "table",
	map = {
		map = {
			type = "table",
			table_values = {
				type = "number"
			}
		},
		nested_map = {
			type = "table",
			table_values = {
				type = "table",
				table_values = {
					type = "number"
				}
			}
		}
	}
})

Schema.validate(LISTS, test_data)

local ENUM = schema("ENUM", {
	type = "table",
	map = {
		key = {
			type = "string",
			enum = _enum
		},
		keys = {
			type = "table",
			table_array = {
				type = "string",
				enum = _enum
			}
		},
		odd_keys = {
			type = "table",
			table_array = {
				type = {
					"function",
					"number",
					"table"
				},
				enum = _odd_enum
			}
		}
	}
})

Schema.validate(ENUM, test_data)

local KEYS = schema("KEYS", {
	type = "table",
	map = {
		key = {
			type = "string",
			key = _hashmap
		},
		keys = {
			type = "table",
			table_array = {
				type = "string",
				key = _hashmap
			}
		},
		odd_keys = {
			type = "table",
			table_array = {
				type = {
					"function",
					"number",
					"table"
				},
				key = _odd_hashmap
			}
		}
	}
})

Schema.validate(KEYS, test_data)

local THUNK = schema("THUNK", {
	type = "table",
	map = {
		five = {
			type = "number",
			thunk = is_five
		}
	}
})

Schema.validate(THUNK, test_data)

return
