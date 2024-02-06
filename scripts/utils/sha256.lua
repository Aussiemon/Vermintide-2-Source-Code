﻿-- chunkname: @scripts/utils/sha256.lua

local MOD = 4294967296
local MODM = MOD - 1

local function memoize(f)
	local mt = {}
	local t = setmetatable({}, mt)

	mt.__index = function (self, k)
		local v = f(k)

		t[k] = v

		return v
	end

	return t
end

local function make_bitop_uncached(t, m)
	local function bitop(a, b)
		local res, p = 0, 1

		while a ~= 0 and b ~= 0 do
			local am, bm = a % m, b % m

			res = res + t[am][bm] * p
			a = (a - am) / m
			b = (b - bm) / m
			p = p * m
		end

		res = res + (a + b) * p

		return res
	end

	return bitop
end

local function make_bitop(t)
	local op1 = make_bitop_uncached(t, 2)
	local op2 = memoize(function (a)
		return memoize(function (b)
			return op1(a, b)
		end)
	end)

	return make_bitop_uncached(op2, 2^(t.n or 1))
end

local bxor1 = make_bitop({
	[0] = {
		[0] = 0,
		1,
	},
	{
		[0] = 1,
		0,
	},
	n = 4,
})

local function bxor(a, b, c, ...)
	local z

	if b then
		a = a % MOD
		b = b % MOD
		z = bxor1(a, b)

		if c then
			z = bxor(z, c, ...)
		end

		return z
	elseif a then
		return a % MOD
	else
		return 0
	end
end

local function band(a, b, c, ...)
	local z

	if b then
		a = a % MOD
		b = b % MOD
		z = (a + b - bxor1(a, b)) / 2

		if c then
			z = bit32_band(z, c, ...)
		end

		return z
	elseif a then
		return a % MOD
	else
		return MODM
	end
end

local function bnot(x)
	return (-1 - x) % MOD
end

local function rshift1(a, disp)
	if disp < 0 then
		return lshift(a, -disp)
	end

	return math.floor(a % 4294967296 / 2^disp)
end

local function rshift(x, disp)
	if disp > 31 or disp < -31 then
		return 0
	end

	return rshift1(x % MOD, disp)
end

local function lshift(a, disp)
	if disp < 0 then
		return rshift(a, -disp)
	end

	return a * 2^disp % 4294967296
end

local function rrotate(x, disp)
	x = x % MOD
	disp = disp % 32

	local low = band(x, 2^disp - 1)

	return rshift(x, disp) + lshift(low, 32 - disp)
end

local k = {
	1116352408,
	1899447441,
	3049323471,
	3921009573,
	961987163,
	1508970993,
	2453635748,
	2870763221,
	3624381080,
	310598401,
	607225278,
	1426881987,
	1925078388,
	2162078206,
	2614888103,
	3248222580,
	3835390401,
	4022224774,
	264347078,
	604807628,
	770255983,
	1249150122,
	1555081692,
	1996064986,
	2554220882,
	2821834349,
	2952996808,
	3210313671,
	3336571891,
	3584528711,
	113926993,
	338241895,
	666307205,
	773529912,
	1294757372,
	1396182291,
	1695183700,
	1986661051,
	2177026350,
	2456956037,
	2730485921,
	2820302411,
	3259730800,
	3345764771,
	3516065817,
	3600352804,
	4094571909,
	275423344,
	430227734,
	506948616,
	659060556,
	883997877,
	958139571,
	1322822218,
	1537002063,
	1747873779,
	1955562222,
	2024104815,
	2227730452,
	2361852424,
	2428436474,
	2756734187,
	3204031479,
	3329325298,
}

local function str2hexa(s)
	return (string.gsub(s, ".", function (c)
		return string.format("%02x", string.byte(c))
	end))
end

local function num2s(l, n)
	local s = ""

	for i = 1, n do
		local rem = l % 256

		s = string.char(rem) .. s
		l = (l - rem) / 256
	end

	return s
end

local function s232num(s, i)
	local n = 0

	for i = i, i + 3 do
		n = n * 256 + string.byte(s, i)
	end

	return n
end

local function preproc(msg, len)
	local extra = 64 - (len + 9) % 64

	len = num2s(8 * len, 8)
	msg = msg .. "\x80" .. string.rep("\x00", extra) .. len

	assert(#msg % 64 == 0)

	return msg
end

local function initH256(H)
	H[1] = 1779033703
	H[2] = 3144134277
	H[3] = 1013904242
	H[4] = 2773480762
	H[5] = 1359893119
	H[6] = 2600822924
	H[7] = 528734635
	H[8] = 1541459225

	return H
end

local function digestblock(msg, i, H)
	local w = {}

	for j = 1, 16 do
		w[j] = s232num(msg, i + (j - 1) * 4)
	end

	for j = 17, 64 do
		local v = w[j - 15]
		local s0 = bxor(rrotate(v, 7), rrotate(v, 18), rshift(v, 3))

		v = w[j - 2]
		w[j] = w[j - 16] + s0 + w[j - 7] + bxor(rrotate(v, 17), rrotate(v, 19), rshift(v, 10))
	end

	local a, b, c, d, e, f, g, h = H[1], H[2], H[3], H[4], H[5], H[6], H[7], H[8]

	for i = 1, 64 do
		local s0 = bxor(rrotate(a, 2), rrotate(a, 13), rrotate(a, 22))
		local maj = bxor(band(a, b), band(a, c), band(b, c))
		local t2 = s0 + maj
		local s1 = bxor(rrotate(e, 6), rrotate(e, 11), rrotate(e, 25))
		local ch = bxor(band(e, f), band(bnot(e), g))
		local t1 = h + s1 + ch + k[i] + w[i]

		h, g, f, e, d, c, b, a = g, f, e, d + t1, c, b, a, t1 + t2
	end

	H[1] = band(H[1] + a)
	H[2] = band(H[2] + b)
	H[3] = band(H[3] + c)
	H[4] = band(H[4] + d)
	H[5] = band(H[5] + e)
	H[6] = band(H[6] + f)
	H[7] = band(H[7] + g)
	H[8] = band(H[8] + h)
end

function sha256(msg)
	msg = preproc(msg, #msg)

	local H = initH256({})

	for i = 1, #msg, 64 do
		digestblock(msg, i, H)
	end

	return str2hexa(num2s(H[1], 4) .. num2s(H[2], 4) .. num2s(H[3], 4) .. num2s(H[4], 4) .. num2s(H[5], 4) .. num2s(H[6], 4) .. num2s(H[7], 4) .. num2s(H[8], 4))
end
