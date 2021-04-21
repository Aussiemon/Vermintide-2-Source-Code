require("foundation/scripts/util/table")

Colors = Colors or {}
local ALPHA = 255
Colors.color_definitions = {
	maroon = {
		ALPHA,
		128,
		0,
		0
	},
	dark_red = {
		ALPHA,
		139,
		0,
		0
	},
	brown = {
		ALPHA,
		127,
		51,
		0
	},
	firebrick = {
		ALPHA,
		178,
		34,
		34
	},
	crimson = {
		ALPHA,
		220,
		20,
		60
	},
	red = {
		ALPHA,
		255,
		0,
		0
	},
	tomato = {
		ALPHA,
		255,
		99,
		71
	},
	coral = {
		ALPHA,
		255,
		127,
		80
	},
	indian_red = {
		ALPHA,
		205,
		92,
		92
	},
	light_coral = {
		ALPHA,
		240,
		128,
		128
	},
	dark_salmon = {
		ALPHA,
		233,
		150,
		122
	},
	salmon = {
		ALPHA,
		250,
		128,
		114
	},
	light_salmon = {
		ALPHA,
		255,
		160,
		122
	},
	cheeseburger = {
		ALPHA,
		255,
		168,
		0
	},
	orange_red = {
		ALPHA,
		255,
		69,
		0
	},
	dark_orange = {
		ALPHA,
		255,
		140,
		0
	},
	orange = {
		ALPHA,
		255,
		165,
		0
	},
	gold = {
		ALPHA,
		255,
		215,
		0
	},
	dark_golden_rod = {
		ALPHA,
		184,
		134,
		11
	},
	golden_rod = {
		ALPHA,
		218,
		165,
		32
	},
	pale_golden_rod = {
		ALPHA,
		238,
		232,
		170
	},
	dark_khaki = {
		ALPHA,
		189,
		183,
		107
	},
	khaki = {
		ALPHA,
		240,
		230,
		140
	},
	olive = {
		ALPHA,
		128,
		128,
		0
	},
	yellow = {
		ALPHA,
		255,
		255,
		0
	},
	yellow_green = {
		ALPHA,
		154,
		205,
		50
	},
	online_green = {
		ALPHA,
		145,
		226,
		42
	},
	dark_olive_green = {
		ALPHA,
		85,
		107,
		47
	},
	olive_drab = {
		ALPHA,
		107,
		142,
		35
	},
	lawn_green = {
		ALPHA,
		124,
		252,
		0
	},
	chart_reuse = {
		ALPHA,
		127,
		255,
		0
	},
	green_yellow = {
		ALPHA,
		173,
		255,
		47
	},
	dark_green = {
		ALPHA,
		0,
		100,
		0
	},
	green = {
		ALPHA,
		0,
		128,
		0
	},
	forest_green = {
		ALPHA,
		34,
		139,
		34
	},
	lime = {
		ALPHA,
		0,
		255,
		0
	},
	lime_green = {
		ALPHA,
		50,
		205,
		50
	},
	light_green = {
		ALPHA,
		144,
		238,
		144
	},
	pale_green = {
		ALPHA,
		152,
		251,
		152
	},
	dark_sea_green = {
		ALPHA,
		143,
		188,
		143
	},
	medium_spring_green = {
		ALPHA,
		0,
		250,
		154
	},
	spring_green = {
		ALPHA,
		0,
		255,
		127
	},
	sea_green = {
		ALPHA,
		46,
		139,
		87
	},
	medium_aqua_marine = {
		ALPHA,
		102,
		205,
		170
	},
	medium_sea_green = {
		ALPHA,
		60,
		179,
		113
	},
	light_sea_green = {
		ALPHA,
		32,
		178,
		170
	},
	dark_slate_gray = {
		ALPHA,
		47,
		79,
		79
	},
	teal = {
		ALPHA,
		0,
		128,
		128
	},
	dark_cyan = {
		ALPHA,
		0,
		139,
		139
	},
	aqua = {
		ALPHA,
		0,
		255,
		255
	},
	cyan = {
		ALPHA,
		0,
		255,
		255
	},
	light_cyan = {
		ALPHA,
		224,
		255,
		255
	},
	dark_turquoise = {
		ALPHA,
		0,
		206,
		209
	},
	turquoise = {
		ALPHA,
		64,
		224,
		208
	},
	medium_turquoise = {
		ALPHA,
		72,
		209,
		204
	},
	pale_turquoise = {
		ALPHA,
		175,
		238,
		238
	},
	aqua_marine = {
		ALPHA,
		127,
		255,
		212
	},
	powder_blue = {
		ALPHA,
		176,
		224,
		230
	},
	cadet_blue = {
		ALPHA,
		95,
		158,
		160
	},
	steel_blue = {
		ALPHA,
		70,
		130,
		180
	},
	corn_flower_blue = {
		ALPHA,
		100,
		149,
		237
	},
	deep_sky_blue = {
		ALPHA,
		0,
		191,
		255
	},
	dodger_blue = {
		ALPHA,
		30,
		144,
		255
	},
	light_blue = {
		ALPHA,
		173,
		216,
		230
	},
	sky_blue = {
		ALPHA,
		135,
		206,
		235
	},
	light_sky_blue = {
		ALPHA,
		135,
		206,
		250
	},
	midnight_blue = {
		ALPHA,
		25,
		25,
		112
	},
	navy = {
		ALPHA,
		0,
		0,
		128
	},
	dark_blue = {
		ALPHA,
		0,
		0,
		139
	},
	medium_blue = {
		ALPHA,
		0,
		0,
		205
	},
	blue = {
		ALPHA,
		0,
		0,
		255
	},
	royal_blue = {
		ALPHA,
		65,
		105,
		225
	},
	blue_violet = {
		ALPHA,
		138,
		43,
		226
	},
	indigo = {
		ALPHA,
		75,
		0,
		130
	},
	dark_slate_blue = {
		ALPHA,
		72,
		61,
		139
	},
	slate_blue = {
		ALPHA,
		106,
		90,
		205
	},
	medium_slate_blue = {
		ALPHA,
		123,
		104,
		238
	},
	medium_purple = {
		ALPHA,
		147,
		112,
		219
	},
	dark_magenta = {
		ALPHA,
		139,
		0,
		139
	},
	dark_violet = {
		ALPHA,
		148,
		0,
		211
	},
	dark_orchid = {
		ALPHA,
		153,
		50,
		204
	},
	medium_orchid = {
		ALPHA,
		186,
		85,
		211
	},
	purple = {
		ALPHA,
		128,
		0,
		128
	},
	thistle = {
		ALPHA,
		216,
		191,
		216
	},
	plum = {
		ALPHA,
		221,
		160,
		221
	},
	violet = {
		ALPHA,
		238,
		130,
		238
	},
	magenta = {
		ALPHA,
		255,
		0,
		255
	},
	orchid = {
		ALPHA,
		218,
		112,
		214
	},
	medium_violet_red = {
		ALPHA,
		199,
		21,
		133
	},
	pale_violet_red = {
		ALPHA,
		219,
		112,
		147
	},
	deep_pink = {
		ALPHA,
		255,
		20,
		147
	},
	hot_pink = {
		ALPHA,
		255,
		105,
		180
	},
	light_pink = {
		ALPHA,
		255,
		182,
		193
	},
	pink = {
		ALPHA,
		255,
		192,
		203
	},
	antique_white = {
		ALPHA,
		250,
		235,
		215
	},
	beige = {
		ALPHA,
		245,
		245,
		220
	},
	bisque = {
		ALPHA,
		255,
		228,
		196
	},
	blanched_almond = {
		ALPHA,
		255,
		235,
		205
	},
	wheat = {
		ALPHA,
		245,
		222,
		179
	},
	corn_silk = {
		ALPHA,
		255,
		248,
		220
	},
	lemon_chiffon = {
		ALPHA,
		255,
		250,
		205
	},
	light_golden_rod_yellow = {
		ALPHA,
		250,
		250,
		210
	},
	light_yellow = {
		ALPHA,
		255,
		255,
		224
	},
	saddle_brown = {
		ALPHA,
		139,
		69,
		19
	},
	sienna = {
		ALPHA,
		160,
		82,
		45
	},
	chocolate = {
		ALPHA,
		210,
		105,
		30
	},
	peru = {
		ALPHA,
		205,
		133,
		63
	},
	sandy_brown = {
		ALPHA,
		244,
		164,
		96
	},
	burly_wood = {
		ALPHA,
		222,
		184,
		135
	},
	tan = {
		ALPHA,
		210,
		180,
		140
	},
	rosy_brown = {
		ALPHA,
		188,
		143,
		143
	},
	moccasin = {
		ALPHA,
		255,
		228,
		181
	},
	navajo_white = {
		ALPHA,
		255,
		222,
		173
	},
	peach_puff = {
		ALPHA,
		255,
		218,
		185
	},
	misty_rose = {
		ALPHA,
		255,
		228,
		225
	},
	lavender_blush = {
		ALPHA,
		255,
		240,
		245
	},
	linen = {
		ALPHA,
		250,
		240,
		230
	},
	old_lace = {
		ALPHA,
		253,
		245,
		230
	},
	papaya_whip = {
		ALPHA,
		255,
		239,
		213
	},
	sea_shell = {
		ALPHA,
		255,
		245,
		238
	},
	mint_cream = {
		ALPHA,
		245,
		255,
		250
	},
	slate_gray = {
		ALPHA,
		112,
		128,
		144
	},
	light_slate_gray = {
		ALPHA,
		119,
		136,
		153
	},
	light_steel_blue = {
		ALPHA,
		176,
		196,
		222
	},
	lavender = {
		ALPHA,
		230,
		230,
		250
	},
	floral_white = {
		ALPHA,
		255,
		250,
		240
	},
	alice_blue = {
		ALPHA,
		240,
		248,
		255
	},
	ghost_white = {
		ALPHA,
		248,
		248,
		255
	},
	honeydew = {
		ALPHA,
		240,
		255,
		240
	},
	ivory = {
		ALPHA,
		255,
		255,
		240
	},
	azure = {
		ALPHA,
		240,
		255,
		255
	},
	snow = {
		ALPHA,
		255,
		250,
		250
	},
	black = {
		ALPHA,
		0,
		0,
		0
	},
	dim_gray = {
		ALPHA,
		105,
		105,
		105
	},
	gray = {
		ALPHA,
		128,
		128,
		128
	},
	dark_gray = {
		ALPHA,
		169,
		169,
		169
	},
	silver = {
		ALPHA,
		192,
		192,
		192
	},
	light_gray = {
		ALPHA,
		211,
		211,
		211
	},
	gainsboro = {
		ALPHA,
		220,
		220,
		220
	},
	white_smoke = {
		ALPHA,
		245,
		245,
		245
	},
	white = {
		ALPHA,
		255,
		255,
		255
	},
	default = {
		ALPHA,
		75,
		100,
		100
	},
	plentiful = {
		ALPHA,
		255,
		255,
		255
	},
	common = {
		ALPHA,
		41,
		138,
		15
	},
	rare = {
		ALPHA,
		33,
		88,
		169
	},
	exotic = {
		ALPHA,
		220,
		115,
		10
	},
	unique = {
		ALPHA,
		180,
		31,
		38
	},
	magic = {
		ALPHA,
		0,
		211,
		178
	},
	promo = {
		ALPHA,
		140,
		31,
		135
	},
	card_plentiful = {
		ALPHA,
		255,
		255,
		255
	},
	card_common = {
		ALPHA,
		0,
		255,
		0
	},
	card_rare = {
		ALPHA,
		0,
		0,
		255
	},
	card_exotic = {
		ALPHA,
		255,
		25,
		0
	},
	card_unique = {
		ALPHA,
		255,
		0,
		0
	},
	card_promo = {
		ALPHA,
		255,
		0,
		255
	},
	iron_tokens = {
		ALPHA,
		255,
		255,
		255
	},
	bronze_tokens = {
		ALPHA,
		115,
		197,
		42
	},
	silver_tokens = {
		ALPHA,
		30,
		116,
		189
	},
	gold_tokens = {
		ALPHA,
		236,
		107,
		20
	},
	drag_same_slot = {
		ALPHA,
		255,
		168,
		0
	},
	drag_same_slot_hover = {
		ALPHA,
		0,
		255,
		0
	},
	drag_same_slot_disabled = {
		ALPHA,
		255,
		0,
		0
	},
	credits_title = {
		ALPHA,
		255,
		168,
		0
	},
	credits_header = {
		ALPHA,
		255,
		215,
		0
	},
	credits_normal = {
		ALPHA,
		255,
		255,
		255
	},
	loading_screen_stone = {
		ALPHA,
		23,
		22,
		20
	},
	font_default = {
		ALPHA,
		181,
		181,
		181
	},
	font_title = {
		ALPHA,
		193,
		91,
		36
	},
	font_button_normal = {
		ALPHA,
		160,
		146,
		101
	},
	button_normal = {
		ALPHA,
		230,
		40,
		73
	},
	button_green = {
		ALPHA,
		0,
		200,
		10
	},
	button_red = {
		ALPHA,
		255,
		0,
		0
	},
	hit_marker_normal = {
		ALPHA,
		255,
		255,
		255
	},
	hit_marker_critical = {
		ALPHA,
		255,
		161,
		53
	},
	hit_marker_armored = {
		ALPHA,
		70,
		130,
		180
	},
	hit_marker_friendly = {
		ALPHA,
		50,
		205,
		50
	},
	twitch = {
		ALPHA,
		100,
		65,
		164
	},
	very_dark_gray = {
		ALPHA,
		80,
		80,
		80
	},
	wh_captain = {
		ALPHA,
		153,
		184,
		193
	},
	wh_bountyhunter = {
		ALPHA,
		198,
		154,
		74
	},
	wh_zealot = {
		ALPHA,
		202,
		197,
		174
	},
	wh_4 = {
		ALPHA,
		230,
		184,
		71
	},
	dr_ranger = {
		ALPHA,
		187,
		235,
		30
	},
	dr_ironbreaker = {
		ALPHA,
		41,
		219,
		255
	},
	dr_slayer = {
		ALPHA,
		228,
		0,
		0
	},
	dr_engineer = {
		ALPHA,
		255,
		191,
		4
	},
	we_waywatcher = {
		ALPHA,
		55,
		123,
		44
	},
	we_maidenguard = {
		ALPHA,
		74,
		145,
		236
	},
	we_shade = {
		ALPHA,
		151,
		99,
		192
	},
	we_4 = {
		ALPHA,
		113,
		113,
		66
	},
	es_mercenary = {
		ALPHA,
		204,
		128,
		128
	},
	es_huntsman = {
		ALPHA,
		114,
		130,
		67
	},
	es_knight = {
		ALPHA,
		36,
		84,
		173
	},
	es_questingknight = {
		ALPHA,
		255,
		191,
		4
	},
	bw_adept = {
		ALPHA,
		255,
		93,
		0
	},
	bw_scholar = {
		ALPHA,
		173,
		28,
		8
	},
	bw_unchained = {
		ALPHA,
		150,
		50,
		100
	},
	bw_4 = {
		ALPHA,
		28,
		32,
		53
	},
	empire_soldier_tutorial = {
		ALPHA,
		36,
		84,
		173
	},
	vs_poison_wind_globadier = {
		ALPHA,
		153,
		184,
		193
	},
	vs_gutter_runner = {
		ALPHA,
		198,
		154,
		74
	},
	vs_packmaster = {
		ALPHA,
		202,
		197,
		174
	},
	vs_corruptor = {
		ALPHA,
		187,
		235,
		30
	},
	vs_vortex_sorcerer = {
		ALPHA,
		41,
		219,
		255
	},
	vs_ratling_gunner = {
		ALPHA,
		228,
		0,
		0
	},
	vs_warpfire_thrower = {
		ALPHA,
		255,
		192,
		203
	},
	vs_chaos_troll = {
		ALPHA,
		55,
		123,
		44
	},
	vs_chaos_spawn = {
		ALPHA,
		74,
		145,
		236
	},
	vs_stormfiend = {
		ALPHA,
		151,
		99,
		192
	},
	vs_rat_ogre = {
		ALPHA,
		204,
		128,
		128
	},
	console_menu_rect = {
		ALPHA,
		0,
		0,
		0
	},
	healthkit_first_aid_kit_01 = {
		ALPHA,
		53,
		204,
		53
	},
	wpn_side_objective_tome_01 = {
		ALPHA,
		216,
		133,
		0
	},
	potion_healing_draught_01 = {
		ALPHA,
		53,
		204,
		53
	},
	potion_damage_boost_01 = {
		ALPHA,
		216,
		174,
		69
	},
	potion_speed_boost_01 = {
		ALPHA,
		65,
		169,
		228
	},
	potion_cooldown_reduction_01 = {
		ALPHA,
		197,
		91,
		255
	},
	wpn_grimoire_01 = {
		ALPHA,
		100,
		65,
		164
	},
	grenade_frag_01 = {
		ALPHA,
		240,
		32,
		0
	},
	grenade_frag_02 = {
		ALPHA,
		240,
		32,
		0
	},
	grenade_smoke_01 = {
		ALPHA,
		240,
		32,
		0
	},
	grenade_smoke_02 = {
		ALPHA,
		240,
		32,
		0
	},
	grenade_fire_01 = {
		ALPHA,
		240,
		32,
		0
	},
	grenade_fire_02 = {
		ALPHA,
		240,
		32,
		0
	},
	life = {
		ALPHA,
		50,
		205,
		50
	},
	metal = {
		ALPHA,
		255,
		255,
		0
	},
	death = {
		ALPHA,
		139,
		0,
		139
	},
	heavens = {
		ALPHA,
		0,
		191,
		255
	},
	light = {
		ALPHA,
		255,
		255,
		255
	},
	beasts = {
		ALPHA,
		139,
		69,
		19
	},
	fire = {
		ALPHA,
		220,
		20,
		60
	},
	shadow = {
		ALPHA,
		128,
		128,
		128
	},
	khorne = {
		ALPHA,
		254,
		52,
		31
	},
	tzeentch = {
		ALPHA,
		61,
		150,
		251
	},
	slaanesh = {
		ALPHA,
		236,
		109,
		251
	},
	nurgle = {
		ALPHA,
		200,
		230,
		81
	},
	deus_potion = {
		ALPHA,
		155,
		17,
		30
	}
}
Colors.indexed_colors, Colors.num_colors = table.values(Colors.color_definitions)

if not Colors.distinct_colors_lookup then
	local i = 1
	local f = 92 + 63 * i % 3
	local g = f / 2
	Colors.distinct_colors_lookup = {
		{
			0,
			f,
			0
		},
		{
			0,
			0,
			f
		},
		{
			f,
			0,
			0
		},
		{
			f,
			f,
			0
		},
		{
			0,
			f,
			f
		},
		{
			f,
			0,
			f
		},
		{
			f,
			g,
			0
		},
		{
			f,
			0,
			g
		},
		{
			0,
			g,
			f
		},
		{
			g,
			0,
			f
		}
	}
end

Colors.get = function (name)
	local color = Colors.color_definitions[name]

	return Color(color[1], color[2], color[3], color[4])
end

Colors.get_color_with_alpha = function (name, alpha)
	local color = Colors.color_definitions[name]

	return Color(alpha, color[2], color[3], color[4])
end

Colors.get_table = function (name)
	local color = Colors.color_definitions[name]

	return {
		color[1],
		color[2],
		color[3],
		color[4]
	}
end

Colors.get_color_table_with_alpha = function (name, alpha)
	local color = Colors.color_definitions[name]

	return {
		alpha,
		color[2],
		color[3],
		color[4]
	}
end

Colors.get_indexed = function (index)
	local color = Colors.indexed_colors[index]

	return Color(color[1], color[2], color[3], color[4])
end

Colors.copy_to = function (dst, src)
	dst[1] = src[1]
	dst[2] = src[2]
	dst[3] = src[3]
	dst[4] = src[4]
end

Colors.copy_no_alpha_to = function (dst, src)
	dst[2] = src[2]
	dst[3] = src[3]
	dst[4] = src[4]
end

Colors.lerp_color_tables = function (color1, color2, t, out)
	out = out or {}
	local s = 1 - t
	out[1] = color1[1] * s + color2[1] * t
	out[2] = color1[2] * s + color2[2] * t
	out[3] = color1[3] * s + color2[3] * t
	out[4] = color1[4] * s + color2[4] * t

	return out
end

Colors.from_hex = function (hex)
	local r, g, b = string.match(hex, "^#?(%x%x)(%x%x)(%x%x)$")

	return tonumber(r, 16), tonumber(g, 16), tonumber(b, 16)
end

local function hue2rgb(p, q, t)
	if t < 0 then
		t = t + 1
	elseif t > 1 then
		t = t - 1
	end

	if t < 0.16666666666666666 then
		return p + (q - p) * 6 * t
	elseif t < 0.5 then
		return q
	elseif t < 0.6666666666666666 then
		return p + (q - p) * 6 * (0.6666666666666666 - t)
	end

	return p
end

Colors.hsl2rgb = function (h, s, l)
	local r, g, b = nil

	if s ~= 0 then
		local q = (l < 0.5 and l * (1 + s)) or s + l * (1 - s)
		local p = 2 * l - q
		r = hue2rgb(p, q, h + 0.3333333333333333)
		g = hue2rgb(p, q, h)
		b = hue2rgb(p, q, h - 0.3333333333333333)
	else
		b = l
		g = l
		r = l
	end

	local floor = math.floor

	return floor(r * 255 + 0.5), floor(g * 255 + 0.5), floor(b * 255 + 0.5)
end

return
