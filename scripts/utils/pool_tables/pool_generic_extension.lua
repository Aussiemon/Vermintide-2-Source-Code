local pool_size = 320
local hash_count = 30
POOL_generic_extension = POOL_generic_extension or {
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
	},
	{
		_INDEX = 141
	},
	{
		_INDEX = 142
	},
	{
		_INDEX = 143
	},
	{
		_INDEX = 144
	},
	{
		_INDEX = 145
	},
	{
		_INDEX = 146
	},
	{
		_INDEX = 147
	},
	{
		_INDEX = 148
	},
	{
		_INDEX = 149
	},
	{
		_INDEX = 150
	},
	{
		_INDEX = 151
	},
	{
		_INDEX = 152
	},
	{
		_INDEX = 153
	},
	{
		_INDEX = 154
	},
	{
		_INDEX = 155
	},
	{
		_INDEX = 156
	},
	{
		_INDEX = 157
	},
	{
		_INDEX = 158
	},
	{
		_INDEX = 159
	},
	{
		_INDEX = 160
	},
	{
		_INDEX = 161
	},
	{
		_INDEX = 162
	},
	{
		_INDEX = 163
	},
	{
		_INDEX = 164
	},
	{
		_INDEX = 165
	},
	{
		_INDEX = 166
	},
	{
		_INDEX = 167
	},
	{
		_INDEX = 168
	},
	{
		_INDEX = 169
	},
	{
		_INDEX = 170
	},
	{
		_INDEX = 171
	},
	{
		_INDEX = 172
	},
	{
		_INDEX = 173
	},
	{
		_INDEX = 174
	},
	{
		_INDEX = 175
	},
	{
		_INDEX = 176
	},
	{
		_INDEX = 177
	},
	{
		_INDEX = 178
	},
	{
		_INDEX = 179
	},
	{
		_INDEX = 180
	},
	{
		_INDEX = 181
	},
	{
		_INDEX = 182
	},
	{
		_INDEX = 183
	},
	{
		_INDEX = 184
	},
	{
		_INDEX = 185
	},
	{
		_INDEX = 186
	},
	{
		_INDEX = 187
	},
	{
		_INDEX = 188
	},
	{
		_INDEX = 189
	},
	{
		_INDEX = 190
	},
	{
		_INDEX = 191
	},
	{
		_INDEX = 192
	},
	{
		_INDEX = 193
	},
	{
		_INDEX = 194
	},
	{
		_INDEX = 195
	},
	{
		_INDEX = 196
	},
	{
		_INDEX = 197
	},
	{
		_INDEX = 198
	},
	{
		_INDEX = 199
	},
	{
		_INDEX = 200
	},
	{
		_INDEX = 201
	},
	{
		_INDEX = 202
	},
	{
		_INDEX = 203
	},
	{
		_INDEX = 204
	},
	{
		_INDEX = 205
	},
	{
		_INDEX = 206
	},
	{
		_INDEX = 207
	},
	{
		_INDEX = 208
	},
	{
		_INDEX = 209
	},
	{
		_INDEX = 210
	},
	{
		_INDEX = 211
	},
	{
		_INDEX = 212
	},
	{
		_INDEX = 213
	},
	{
		_INDEX = 214
	},
	{
		_INDEX = 215
	},
	{
		_INDEX = 216
	},
	{
		_INDEX = 217
	},
	{
		_INDEX = 218
	},
	{
		_INDEX = 219
	},
	{
		_INDEX = 220
	},
	{
		_INDEX = 221
	},
	{
		_INDEX = 222
	},
	{
		_INDEX = 223
	},
	{
		_INDEX = 224
	},
	{
		_INDEX = 225
	},
	{
		_INDEX = 226
	},
	{
		_INDEX = 227
	},
	{
		_INDEX = 228
	},
	{
		_INDEX = 229
	},
	{
		_INDEX = 230
	},
	{
		_INDEX = 231
	},
	{
		_INDEX = 232
	},
	{
		_INDEX = 233
	},
	{
		_INDEX = 234
	},
	{
		_INDEX = 235
	},
	{
		_INDEX = 236
	},
	{
		_INDEX = 237
	},
	{
		_INDEX = 238
	},
	{
		_INDEX = 239
	},
	{
		_INDEX = 240
	},
	{
		_INDEX = 241
	},
	{
		_INDEX = 242
	},
	{
		_INDEX = 243
	},
	{
		_INDEX = 244
	},
	{
		_INDEX = 245
	},
	{
		_INDEX = 246
	},
	{
		_INDEX = 247
	},
	{
		_INDEX = 248
	},
	{
		_INDEX = 249
	},
	{
		_INDEX = 250
	},
	{
		_INDEX = 251
	},
	{
		_INDEX = 252
	},
	{
		_INDEX = 253
	},
	{
		_INDEX = 254
	},
	{
		_INDEX = 255
	},
	{
		_INDEX = 256
	},
	{
		_INDEX = 257
	},
	{
		_INDEX = 258
	},
	{
		_INDEX = 259
	},
	{
		_INDEX = 260
	},
	{
		_INDEX = 261
	},
	{
		_INDEX = 262
	},
	{
		_INDEX = 263
	},
	{
		_INDEX = 264
	},
	{
		_INDEX = 265
	},
	{
		_INDEX = 266
	},
	{
		_INDEX = 267
	},
	{
		_INDEX = 268
	},
	{
		_INDEX = 269
	},
	{
		_INDEX = 270
	},
	{
		_INDEX = 271
	},
	{
		_INDEX = 272
	},
	{
		_INDEX = 273
	},
	{
		_INDEX = 274
	},
	{
		_INDEX = 275
	},
	{
		_INDEX = 276
	},
	{
		_INDEX = 277
	},
	{
		_INDEX = 278
	},
	{
		_INDEX = 279
	},
	{
		_INDEX = 280
	},
	{
		_INDEX = 281
	},
	{
		_INDEX = 282
	},
	{
		_INDEX = 283
	},
	{
		_INDEX = 284
	},
	{
		_INDEX = 285
	},
	{
		_INDEX = 286
	},
	{
		_INDEX = 287
	},
	{
		_INDEX = 288
	},
	{
		_INDEX = 289
	},
	{
		_INDEX = 290
	},
	{
		_INDEX = 291
	},
	{
		_INDEX = 292
	},
	{
		_INDEX = 293
	},
	{
		_INDEX = 294
	},
	{
		_INDEX = 295
	},
	{
		_INDEX = 296
	},
	{
		_INDEX = 297
	},
	{
		_INDEX = 298
	},
	{
		_INDEX = 299
	},
	{
		_INDEX = 300
	},
	{
		_INDEX = 301
	},
	{
		_INDEX = 302
	},
	{
		_INDEX = 303
	},
	{
		_INDEX = 304
	},
	{
		_INDEX = 305
	},
	{
		_INDEX = 306
	},
	{
		_INDEX = 307
	},
	{
		_INDEX = 308
	},
	{
		_INDEX = 309
	},
	{
		_INDEX = 310
	},
	{
		_INDEX = 311
	},
	{
		_INDEX = 312
	},
	{
		_INDEX = 313
	},
	{
		_INDEX = 314
	},
	{
		_INDEX = 315
	},
	{
		_INDEX = 316
	},
	{
		_INDEX = 317
	},
	{
		_INDEX = 318
	},
	{
		_INDEX = 319
	},
	{
		_INDEX = 320
	}
}

if rawget(_G, "POOL_generic_extension_next_free") == nil then
	for i = 1, pool_size - 1, 1 do
		POOL_generic_extension[i]._NEXT_FREE = POOL_generic_extension[i + 1]
	end
end

POOL_generic_extension_next_free = POOL_generic_extension_next_free or POOL_generic_extension[1]
POOL_generic_extension_availability = POOL_generic_extension_availability or {
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
local POOL_generic_extension_availability = POOL_generic_extension_availability
local POOL_generic_extension = POOL_generic_extension
local POOL_generic_extension_next_free = POOL_generic_extension_next_free
POOL_generic_extension_free_count = POOL_generic_extension_free_count or pool_size

function POOL_generic_extension_acquire()
	local free_table = POOL_generic_extension_next_free

	assert(free_table, "Couldn't find available pool table for template 'generic_extension'")

	local next_free = free_table._NEXT_FREE
	free_table._NEXT_FREE = nil
	local _INDEX = free_table._INDEX

	for k, v in pairs(free_table) do
		free_table[k] = nil
	end

	POOL_generic_extension_next_free = next_free
	free_table._INDEX = _INDEX
	POOL_generic_extension_availability[_INDEX] = false
	POOL_generic_extension_free_count = POOL_generic_extension_free_count - 1

	return free_table
end

function POOL_generic_extension_release(pool_table)
	local next_free = POOL_generic_extension_next_free
	pool_table._NEXT_FREE = next_free
	POOL_generic_extension_next_free = pool_table
	POOL_generic_extension_availability[pool_table._INDEX] = true
	POOL_generic_extension_free_count = POOL_generic_extension_free_count + 1

	return 
end

POOL_tables = POOL_tables or {}
POOL_tables.generic_extension = {
	tables = POOL_generic_extension,
	acquire = POOL_generic_extension_acquire,
	release = POOL_generic_extension_release,
	availability = POOL_generic_extension_availability,
	size = pool_size,
	free_count = function ()
		return POOL_generic_extension_free_count
	end,
	hash_count = hash_count
}

return 
