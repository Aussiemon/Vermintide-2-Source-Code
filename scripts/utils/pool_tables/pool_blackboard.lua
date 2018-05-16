local pool_size = 140
local hash_count = 75
POOL_blackboard = POOL_blackboard or {
	{
		_INDEX = 1
	},
	{
		_INDEX = 2
	},
	{
		_INDEX = 3
	},
	{
		_INDEX = 4
	},
	{
		_INDEX = 5
	},
	{
		_INDEX = 6
	},
	{
		_INDEX = 7
	},
	{
		_INDEX = 8
	},
	{
		_INDEX = 9
	},
	{
		_INDEX = 10
	},
	{
		_INDEX = 11
	},
	{
		_INDEX = 12
	},
	{
		_INDEX = 13
	},
	{
		_INDEX = 14
	},
	{
		_INDEX = 15
	},
	{
		_INDEX = 16
	},
	{
		_INDEX = 17
	},
	{
		_INDEX = 18
	},
	{
		_INDEX = 19
	},
	{
		_INDEX = 20
	},
	{
		_INDEX = 21
	},
	{
		_INDEX = 22
	},
	{
		_INDEX = 23
	},
	{
		_INDEX = 24
	},
	{
		_INDEX = 25
	},
	{
		_INDEX = 26
	},
	{
		_INDEX = 27
	},
	{
		_INDEX = 28
	},
	{
		_INDEX = 29
	},
	{
		_INDEX = 30
	},
	{
		_INDEX = 31
	},
	{
		_INDEX = 32
	},
	{
		_INDEX = 33
	},
	{
		_INDEX = 34
	},
	{
		_INDEX = 35
	},
	{
		_INDEX = 36
	},
	{
		_INDEX = 37
	},
	{
		_INDEX = 38
	},
	{
		_INDEX = 39
	},
	{
		_INDEX = 40
	},
	{
		_INDEX = 41
	},
	{
		_INDEX = 42
	},
	{
		_INDEX = 43
	},
	{
		_INDEX = 44
	},
	{
		_INDEX = 45
	},
	{
		_INDEX = 46
	},
	{
		_INDEX = 47
	},
	{
		_INDEX = 48
	},
	{
		_INDEX = 49
	},
	{
		_INDEX = 50
	},
	{
		_INDEX = 51
	},
	{
		_INDEX = 52
	},
	{
		_INDEX = 53
	},
	{
		_INDEX = 54
	},
	{
		_INDEX = 55
	},
	{
		_INDEX = 56
	},
	{
		_INDEX = 57
	},
	{
		_INDEX = 58
	},
	{
		_INDEX = 59
	},
	{
		_INDEX = 60
	},
	{
		_INDEX = 61
	},
	{
		_INDEX = 62
	},
	{
		_INDEX = 63
	},
	{
		_INDEX = 64
	},
	{
		_INDEX = 65
	},
	{
		_INDEX = 66
	},
	{
		_INDEX = 67
	},
	{
		_INDEX = 68
	},
	{
		_INDEX = 69
	},
	{
		_INDEX = 70
	},
	{
		_INDEX = 71
	},
	{
		_INDEX = 72
	},
	{
		_INDEX = 73
	},
	{
		_INDEX = 74
	},
	{
		_INDEX = 75
	},
	{
		_INDEX = 76
	},
	{
		_INDEX = 77
	},
	{
		_INDEX = 78
	},
	{
		_INDEX = 79
	},
	{
		_INDEX = 80
	},
	{
		_INDEX = 81
	},
	{
		_INDEX = 82
	},
	{
		_INDEX = 83
	},
	{
		_INDEX = 84
	},
	{
		_INDEX = 85
	},
	{
		_INDEX = 86
	},
	{
		_INDEX = 87
	},
	{
		_INDEX = 88
	},
	{
		_INDEX = 89
	},
	{
		_INDEX = 90
	},
	{
		_INDEX = 91
	},
	{
		_INDEX = 92
	},
	{
		_INDEX = 93
	},
	{
		_INDEX = 94
	},
	{
		_INDEX = 95
	},
	{
		_INDEX = 96
	},
	{
		_INDEX = 97
	},
	{
		_INDEX = 98
	},
	{
		_INDEX = 99
	},
	{
		_INDEX = 100
	},
	{
		_INDEX = 101
	},
	{
		_INDEX = 102
	},
	{
		_INDEX = 103
	},
	{
		_INDEX = 104
	},
	{
		_INDEX = 105
	},
	{
		_INDEX = 106
	},
	{
		_INDEX = 107
	},
	{
		_INDEX = 108
	},
	{
		_INDEX = 109
	},
	{
		_INDEX = 110
	},
	{
		_INDEX = 111
	},
	{
		_INDEX = 112
	},
	{
		_INDEX = 113
	},
	{
		_INDEX = 114
	},
	{
		_INDEX = 115
	},
	{
		_INDEX = 116
	},
	{
		_INDEX = 117
	},
	{
		_INDEX = 118
	},
	{
		_INDEX = 119
	},
	{
		_INDEX = 120
	},
	{
		_INDEX = 121
	},
	{
		_INDEX = 122
	},
	{
		_INDEX = 123
	},
	{
		_INDEX = 124
	},
	{
		_INDEX = 125
	},
	{
		_INDEX = 126
	},
	{
		_INDEX = 127
	},
	{
		_INDEX = 128
	},
	{
		_INDEX = 129
	},
	{
		_INDEX = 130
	},
	{
		_INDEX = 131
	},
	{
		_INDEX = 132
	},
	{
		_INDEX = 133
	},
	{
		_INDEX = 134
	},
	{
		_INDEX = 135
	},
	{
		_INDEX = 136
	},
	{
		_INDEX = 137
	},
	{
		_INDEX = 138
	},
	{
		_INDEX = 139
	},
	{
		_INDEX = 140
	}
}

if rawget(_G, "POOL_blackboard_next_free") == nil then
	for i = 1, pool_size - 1, 1 do
		POOL_blackboard[i]._NEXT_FREE = POOL_blackboard[i + 1]
	end
end

POOL_blackboard_next_free = POOL_blackboard_next_free or POOL_blackboard[1]
POOL_blackboard_availability = POOL_blackboard_availability or {
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true
}
local POOL_blackboard_availability = POOL_blackboard_availability
local POOL_blackboard = POOL_blackboard
local POOL_blackboard_next_free = POOL_blackboard_next_free
POOL_blackboard_free_count = POOL_blackboard_free_count or pool_size

function POOL_blackboard_acquire()
	local free_table = POOL_blackboard_next_free

	assert(free_table, "Couldn't find available pool table for template 'blackboard'")

	local next_free = free_table._NEXT_FREE
	free_table._NEXT_FREE = nil
	local _INDEX = free_table._INDEX

	for k, v in pairs(free_table) do
		free_table[k] = nil
	end

	POOL_blackboard_next_free = next_free
	free_table._INDEX = _INDEX
	POOL_blackboard_availability[_INDEX] = false
	POOL_blackboard_free_count = POOL_blackboard_free_count - 1

	return free_table
end

function POOL_blackboard_release(pool_table)
	local next_free = POOL_blackboard_next_free
	pool_table._NEXT_FREE = next_free
	POOL_blackboard_next_free = pool_table
	POOL_blackboard_availability[pool_table._INDEX] = true
	POOL_blackboard_free_count = POOL_blackboard_free_count + 1
end

POOL_tables = POOL_tables or {}
POOL_tables.blackboard = {
	tables = POOL_blackboard,
	acquire = POOL_blackboard_acquire,
	release = POOL_blackboard_release,
	availability = POOL_blackboard_availability,
	size = pool_size,
	free_count = function ()
		return POOL_blackboard_free_count
	end,
	hash_count = hash_count
}

return
