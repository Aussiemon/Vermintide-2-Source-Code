-- chunkname: @scripts/utils/colors.lua

require("foundation/scripts/util/table")

Colors = Colors or {}
Colors.color_definitions = {
	maroon = {
		255,
		128,
		0,
		0,
	},
	dark_red = {
		255,
		139,
		0,
		0,
	},
	brown = {
		255,
		127,
		51,
		0,
	},
	firebrick = {
		255,
		178,
		34,
		34,
	},
	crimson = {
		255,
		220,
		20,
		60,
	},
	red = {
		255,
		255,
		0,
		0,
	},
	tomato = {
		255,
		255,
		99,
		71,
	},
	coral = {
		255,
		255,
		127,
		80,
	},
	indian_red = {
		255,
		205,
		92,
		92,
	},
	light_coral = {
		255,
		240,
		128,
		128,
	},
	dark_salmon = {
		255,
		233,
		150,
		122,
	},
	salmon = {
		255,
		250,
		128,
		114,
	},
	light_salmon = {
		255,
		255,
		160,
		122,
	},
	cheeseburger = {
		255,
		255,
		168,
		0,
	},
	orange_red = {
		255,
		255,
		69,
		0,
	},
	dark_orange = {
		255,
		255,
		140,
		0,
	},
	orange = {
		255,
		255,
		165,
		0,
	},
	gold = {
		255,
		255,
		215,
		0,
	},
	dark_golden_rod = {
		255,
		184,
		134,
		11,
	},
	golden_rod = {
		255,
		218,
		165,
		32,
	},
	pale_golden_rod = {
		255,
		238,
		232,
		170,
	},
	dark_khaki = {
		255,
		189,
		183,
		107,
	},
	khaki = {
		255,
		240,
		230,
		140,
	},
	olive = {
		255,
		128,
		128,
		0,
	},
	yellow = {
		255,
		255,
		255,
		0,
	},
	yellow_green = {
		255,
		154,
		205,
		50,
	},
	online_green = {
		255,
		145,
		226,
		42,
	},
	dark_olive_green = {
		255,
		85,
		107,
		47,
	},
	olive_drab = {
		255,
		107,
		142,
		35,
	},
	lawn_green = {
		255,
		124,
		252,
		0,
	},
	chart_reuse = {
		255,
		127,
		255,
		0,
	},
	green_yellow = {
		255,
		173,
		255,
		47,
	},
	dark_green = {
		255,
		0,
		100,
		0,
	},
	green = {
		255,
		0,
		128,
		0,
	},
	forest_green = {
		255,
		34,
		139,
		34,
	},
	lime = {
		255,
		0,
		255,
		0,
	},
	lime_green = {
		255,
		50,
		205,
		50,
	},
	light_green = {
		255,
		144,
		238,
		144,
	},
	pale_green = {
		255,
		152,
		251,
		152,
	},
	dark_sea_green = {
		255,
		143,
		188,
		143,
	},
	medium_spring_green = {
		255,
		0,
		250,
		154,
	},
	spring_green = {
		255,
		0,
		255,
		127,
	},
	sea_green = {
		255,
		46,
		139,
		87,
	},
	medium_aqua_marine = {
		255,
		102,
		205,
		170,
	},
	medium_sea_green = {
		255,
		60,
		179,
		113,
	},
	light_sea_green = {
		255,
		32,
		178,
		170,
	},
	dark_slate_gray = {
		255,
		47,
		79,
		79,
	},
	teal = {
		255,
		0,
		128,
		128,
	},
	dark_cyan = {
		255,
		0,
		139,
		139,
	},
	aqua = {
		255,
		0,
		255,
		255,
	},
	cyan = {
		255,
		0,
		255,
		255,
	},
	light_cyan = {
		255,
		224,
		255,
		255,
	},
	dark_turquoise = {
		255,
		0,
		206,
		209,
	},
	turquoise = {
		255,
		64,
		224,
		208,
	},
	medium_turquoise = {
		255,
		72,
		209,
		204,
	},
	pale_turquoise = {
		255,
		175,
		238,
		238,
	},
	aqua_marine = {
		255,
		127,
		255,
		212,
	},
	powder_blue = {
		255,
		176,
		224,
		230,
	},
	cadet_blue = {
		255,
		95,
		158,
		160,
	},
	steel_blue = {
		255,
		70,
		130,
		180,
	},
	corn_flower_blue = {
		255,
		100,
		149,
		237,
	},
	deep_sky_blue = {
		255,
		0,
		191,
		255,
	},
	dodger_blue = {
		255,
		30,
		144,
		255,
	},
	light_blue = {
		255,
		173,
		216,
		230,
	},
	sky_blue = {
		255,
		135,
		206,
		235,
	},
	light_sky_blue = {
		255,
		135,
		206,
		250,
	},
	midnight_blue = {
		255,
		25,
		25,
		112,
	},
	navy = {
		255,
		0,
		0,
		128,
	},
	dark_blue = {
		255,
		0,
		0,
		139,
	},
	medium_blue = {
		255,
		0,
		0,
		205,
	},
	blue = {
		255,
		0,
		0,
		255,
	},
	royal_blue = {
		255,
		65,
		105,
		225,
	},
	blue_violet = {
		255,
		138,
		43,
		226,
	},
	indigo = {
		255,
		75,
		0,
		130,
	},
	dark_slate_blue = {
		255,
		72,
		61,
		139,
	},
	slate_blue = {
		255,
		106,
		90,
		205,
	},
	medium_slate_blue = {
		255,
		123,
		104,
		238,
	},
	medium_purple = {
		255,
		147,
		112,
		219,
	},
	dark_magenta = {
		255,
		139,
		0,
		139,
	},
	dark_violet = {
		255,
		148,
		0,
		211,
	},
	dark_orchid = {
		255,
		153,
		50,
		204,
	},
	medium_orchid = {
		255,
		186,
		85,
		211,
	},
	purple = {
		255,
		128,
		0,
		128,
	},
	thistle = {
		255,
		216,
		191,
		216,
	},
	plum = {
		255,
		221,
		160,
		221,
	},
	violet = {
		255,
		238,
		130,
		238,
	},
	magenta = {
		255,
		255,
		0,
		255,
	},
	orchid = {
		255,
		218,
		112,
		214,
	},
	medium_violet_red = {
		255,
		199,
		21,
		133,
	},
	pale_violet_red = {
		255,
		219,
		112,
		147,
	},
	deep_pink = {
		255,
		255,
		20,
		147,
	},
	hot_pink = {
		255,
		255,
		105,
		180,
	},
	light_pink = {
		255,
		255,
		182,
		193,
	},
	pink = {
		255,
		255,
		192,
		203,
	},
	antique_white = {
		255,
		250,
		235,
		215,
	},
	beige = {
		255,
		245,
		245,
		220,
	},
	bisque = {
		255,
		255,
		228,
		196,
	},
	blanched_almond = {
		255,
		255,
		235,
		205,
	},
	wheat = {
		255,
		245,
		222,
		179,
	},
	corn_silk = {
		255,
		255,
		248,
		220,
	},
	lemon_chiffon = {
		255,
		255,
		250,
		205,
	},
	light_golden_rod_yellow = {
		255,
		250,
		250,
		210,
	},
	light_yellow = {
		255,
		255,
		255,
		224,
	},
	saddle_brown = {
		255,
		139,
		69,
		19,
	},
	sienna = {
		255,
		160,
		82,
		45,
	},
	chocolate = {
		255,
		210,
		105,
		30,
	},
	peru = {
		255,
		205,
		133,
		63,
	},
	sandy_brown = {
		255,
		244,
		164,
		96,
	},
	burly_wood = {
		255,
		222,
		184,
		135,
	},
	tan = {
		255,
		210,
		180,
		140,
	},
	rosy_brown = {
		255,
		188,
		143,
		143,
	},
	moccasin = {
		255,
		255,
		228,
		181,
	},
	navajo_white = {
		255,
		255,
		222,
		173,
	},
	peach_puff = {
		255,
		255,
		218,
		185,
	},
	misty_rose = {
		255,
		255,
		228,
		225,
	},
	lavender_blush = {
		255,
		255,
		240,
		245,
	},
	linen = {
		255,
		250,
		240,
		230,
	},
	old_lace = {
		255,
		253,
		245,
		230,
	},
	papaya_whip = {
		255,
		255,
		239,
		213,
	},
	sea_shell = {
		255,
		255,
		245,
		238,
	},
	mint_cream = {
		255,
		245,
		255,
		250,
	},
	slate_gray = {
		255,
		112,
		128,
		144,
	},
	light_slate_gray = {
		255,
		119,
		136,
		153,
	},
	light_steel_blue = {
		255,
		176,
		196,
		222,
	},
	lavender = {
		255,
		230,
		230,
		250,
	},
	floral_white = {
		255,
		255,
		250,
		240,
	},
	alice_blue = {
		255,
		240,
		248,
		255,
	},
	ghost_white = {
		255,
		248,
		248,
		255,
	},
	honeydew = {
		255,
		240,
		255,
		240,
	},
	ivory = {
		255,
		255,
		255,
		240,
	},
	azure = {
		255,
		240,
		255,
		255,
	},
	snow = {
		255,
		255,
		250,
		250,
	},
	black = {
		255,
		0,
		0,
		0,
	},
	dim_gray = {
		255,
		105,
		105,
		105,
	},
	gray = {
		255,
		128,
		128,
		128,
	},
	dark_gray = {
		255,
		169,
		169,
		169,
	},
	silver = {
		255,
		192,
		192,
		192,
	},
	light_gray = {
		255,
		211,
		211,
		211,
	},
	gainsboro = {
		255,
		220,
		220,
		220,
	},
	white_smoke = {
		255,
		245,
		245,
		245,
	},
	white = {
		255,
		255,
		255,
		255,
	},
	default = {
		255,
		75,
		100,
		100,
	},
	plentiful = {
		255,
		255,
		255,
		255,
	},
	common = {
		255,
		41,
		138,
		15,
	},
	rare = {
		255,
		33,
		88,
		169,
	},
	exotic = {
		255,
		220,
		115,
		10,
	},
	unique = {
		255,
		180,
		31,
		38,
	},
	magic = {
		255,
		0,
		211,
		178,
	},
	promo = {
		255,
		140,
		31,
		135,
	},
	card_plentiful = {
		255,
		255,
		255,
		255,
	},
	card_common = {
		255,
		0,
		255,
		0,
	},
	card_rare = {
		255,
		0,
		0,
		255,
	},
	card_exotic = {
		255,
		255,
		25,
		0,
	},
	card_unique = {
		255,
		255,
		0,
		0,
	},
	card_promo = {
		255,
		255,
		0,
		255,
	},
	iron_tokens = {
		255,
		255,
		255,
		255,
	},
	bronze_tokens = {
		255,
		115,
		197,
		42,
	},
	silver_tokens = {
		255,
		30,
		116,
		189,
	},
	gold_tokens = {
		255,
		236,
		107,
		20,
	},
	drag_same_slot = {
		255,
		255,
		168,
		0,
	},
	drag_same_slot_hover = {
		255,
		0,
		255,
		0,
	},
	drag_same_slot_disabled = {
		255,
		255,
		0,
		0,
	},
	credits_title = {
		255,
		255,
		168,
		0,
	},
	credits_header = {
		255,
		255,
		215,
		0,
	},
	credits_normal = {
		255,
		255,
		255,
		255,
	},
	loading_screen_stone = {
		255,
		23,
		22,
		20,
	},
	font_default = {
		255,
		181,
		181,
		181,
	},
	font_title = {
		255,
		193,
		91,
		36,
	},
	font_button_normal = {
		255,
		160,
		146,
		101,
	},
	button_normal = {
		255,
		230,
		40,
		73,
	},
	button_green = {
		255,
		0,
		200,
		10,
	},
	button_red = {
		255,
		255,
		0,
		0,
	},
	hit_marker_normal = {
		255,
		255,
		255,
		255,
	},
	hit_marker_critical = {
		255,
		255,
		161,
		53,
	},
	hit_marker_armored = {
		255,
		70,
		130,
		180,
	},
	hit_marker_friendly = {
		255,
		50,
		205,
		50,
	},
	twitch = {
		255,
		100,
		65,
		164,
	},
	very_dark_gray = {
		255,
		80,
		80,
		80,
	},
	wh_captain = {
		255,
		153,
		184,
		193,
	},
	wh_bountyhunter = {
		255,
		198,
		154,
		74,
	},
	wh_zealot = {
		255,
		202,
		197,
		174,
	},
	wh_priest = {
		255,
		230,
		184,
		71,
	},
	dr_ranger = {
		255,
		187,
		235,
		30,
	},
	dr_ironbreaker = {
		255,
		41,
		219,
		255,
	},
	dr_slayer = {
		255,
		228,
		0,
		0,
	},
	dr_engineer = {
		255,
		255,
		191,
		4,
	},
	we_waywatcher = {
		255,
		55,
		123,
		44,
	},
	we_maidenguard = {
		255,
		74,
		145,
		236,
	},
	we_shade = {
		255,
		151,
		99,
		192,
	},
	we_thornsister = {
		255,
		64,
		194,
		176,
	},
	es_mercenary = {
		255,
		204,
		128,
		128,
	},
	es_huntsman = {
		255,
		114,
		130,
		67,
	},
	es_knight = {
		255,
		36,
		84,
		173,
	},
	es_questingknight = {
		255,
		255,
		191,
		4,
	},
	bw_adept = {
		255,
		255,
		93,
		0,
	},
	bw_scholar = {
		255,
		173,
		28,
		8,
	},
	bw_unchained = {
		255,
		150,
		50,
		100,
	},
	bw_necromancer = {
		255,
		1,
		100,
		67,
	},
	empire_soldier_tutorial = {
		255,
		36,
		84,
		173,
	},
	vs_poison_wind_globadier = {
		255,
		153,
		184,
		193,
	},
	vs_gutter_runner = {
		255,
		198,
		154,
		74,
	},
	vs_packmaster = {
		255,
		202,
		197,
		174,
	},
	vs_ratling_gunner = {
		255,
		228,
		0,
		0,
	},
	vs_warpfire_thrower = {
		255,
		255,
		192,
		203,
	},
	vs_chaos_troll = {
		255,
		55,
		123,
		44,
	},
	vs_chaos_spawn = {
		255,
		74,
		145,
		236,
	},
	vs_stormfiend = {
		255,
		151,
		99,
		192,
	},
	vs_rat_ogre = {
		255,
		204,
		128,
		128,
	},
	console_menu_rect = {
		255,
		0,
		0,
		0,
	},
	healthkit_first_aid_kit_01 = {
		255,
		53,
		204,
		53,
	},
	wpn_side_objective_tome_01 = {
		255,
		216,
		133,
		0,
	},
	potion_healing_draught_01 = {
		255,
		53,
		204,
		53,
	},
	potion_damage_boost_01 = {
		255,
		216,
		174,
		69,
	},
	potion_speed_boost_01 = {
		255,
		65,
		169,
		228,
	},
	potion_cooldown_reduction_01 = {
		255,
		197,
		91,
		255,
	},
	wpn_grimoire_01 = {
		255,
		100,
		65,
		164,
	},
	grenade_frag_01 = {
		255,
		240,
		32,
		0,
	},
	grenade_frag_02 = {
		255,
		240,
		32,
		0,
	},
	grenade_smoke_01 = {
		255,
		240,
		32,
		0,
	},
	grenade_smoke_02 = {
		255,
		240,
		32,
		0,
	},
	grenade_fire_01 = {
		255,
		240,
		32,
		0,
	},
	grenade_fire_02 = {
		255,
		240,
		32,
		0,
	},
	life = {
		255,
		50,
		205,
		50,
	},
	metal = {
		255,
		255,
		255,
		0,
	},
	death = {
		255,
		139,
		0,
		139,
	},
	heavens = {
		255,
		0,
		191,
		255,
	},
	light = {
		255,
		255,
		255,
		255,
	},
	beasts = {
		255,
		139,
		69,
		19,
	},
	fire = {
		255,
		220,
		20,
		60,
	},
	shadow = {
		255,
		128,
		128,
		128,
	},
	khorne = {
		255,
		254,
		52,
		31,
	},
	tzeentch = {
		255,
		61,
		150,
		251,
	},
	slaanesh = {
		255,
		236,
		109,
		251,
	},
	nurgle = {
		255,
		200,
		230,
		81,
	},
	belakor = {
		255,
		172,
		134,
		218,
	},
	deus_potion = {
		255,
		155,
		17,
		30,
	},
}
Colors.indexed_colors, Colors.num_colors = table.values(Colors.color_definitions)

if not Colors.distinct_colors_lookup then
	local i = 1
	local f = 92 + 63 * (i % 3)
	local g = f / 2

	Colors.distinct_colors_lookup = {
		{
			0,
			f,
			0,
		},
		{
			0,
			0,
			f,
		},
		{
			f,
			0,
			0,
		},
		{
			f,
			f,
			0,
		},
		{
			0,
			f,
			f,
		},
		{
			f,
			0,
			f,
		},
		{
			f,
			g,
			0,
		},
		{
			f,
			0,
			g,
		},
		{
			0,
			g,
			f,
		},
		{
			g,
			0,
			f,
		},
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
		color[4],
	}
end

Colors.get_color_table_with_alpha = function (name, alpha)
	local color = Colors.color_definitions[name]

	return {
		alpha,
		color[2],
		color[3],
		color[4],
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

Colors.set = function (dst, a, r, g, b)
	dst[1] = a
	dst[2] = r
	dst[3] = g
	dst[4] = b
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
	local r, g, b

	if s ~= 0 then
		local q = l < 0.5 and l * (1 + s) or s + l * (1 - s)
		local p = 2 * l - q

		r = hue2rgb(p, q, h + 0.3333333333333333)
		g = hue2rgb(p, q, h)
		b = hue2rgb(p, q, h - 0.3333333333333333)
	else
		r, g, b = l, l, l
	end

	local floor = math.floor

	return floor(r * 255 + 0.5), floor(g * 255 + 0.5), floor(b * 255 + 0.5)
end

local DARKEN_FACTOR = 0.7

Colors.darker = function (col, k)
	k = DARKEN_FACTOR^(k or 1)
	col[2], col[3], col[4] = col[2] * k, col[3] * k, col[4] * k
end

Colors.brighter = function (col, k)
	return Colors.darker(col, -k)
end

Colors.luminance = function (col)
	return 0.2126 * col[2] + 0.7152 * col[3] + 0.0722 * col[4]
end
