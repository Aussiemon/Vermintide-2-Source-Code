-- chunkname: @scripts/helpers/emoji_helper.lua

ESCAPE_CHARACTERS = {
	"%",
	"(",
	")",
	".",
	"+",
	"-",
	"*",
	"?",
	"[",
	"^",
	"$",
}
EMOJI_SETTINGS = {
	{
		keys = ":smiley:",
		replacement_keys = ":)",
		texture = "emo_01",
		color = {
			255,
			0,
			255,
			0,
		},
	},
	{
		keys = ":open_mouth:",
		replacement_keys = ":O",
		texture = "emo_02",
		color = {
			255,
			255,
			0,
			0,
		},
	},
	{
		keys = ":shocked:",
		texture = "emo_03",
		color = {
			255,
			0,
			255,
			0,
		},
	},
	{
		keys = ":confused:",
		replacement_keys = ":/",
		texture = "emo_04",
		color = {
			255,
			0,
			255,
			0,
		},
	},
	{
		keys = ":stuck_out_tongue:",
		replacement_keys = ":p",
		texture = "emo_05",
		color = {
			255,
			0,
			255,
			0,
		},
	},
	{
		keys = ":neutral_face:",
		replacement_keys = ":|",
		texture = "emo_06",
		color = {
			255,
			0,
			255,
			0,
		},
	},
	{
		keys = ":disappointed:",
		replacement_keys = ":(",
		texture = "emo_07",
		color = {
			255,
			0,
			255,
			0,
		},
	},
	{
		keys = ":cry:",
		replacement_keys = ":'(",
		texture = "emo_08",
		color = {
			255,
			0,
			255,
			0,
		},
	},
	{
		keys = ":smile:",
		texture = "emo_09",
		color = {
			255,
			0,
			255,
			0,
		},
	},
	{
		keys = ":smirk:",
		replacement_keys = ";)",
		texture = "emo_10",
		color = {
			255,
			0,
			255,
			0,
		},
	},
	{
		keys = ":grinning:",
		replacement_keys = ":D",
		texture = "emo_11",
		color = {
			255,
			0,
			255,
			0,
		},
	},
	{
		keys = ":tired_face:",
		replacement_keys = ">_<",
		texture = "emo_12",
		color = {
			255,
			0,
			255,
			0,
		},
	},
	{
		keys = ":angry:",
		replacement_keys = ">:(",
		texture = "emo_13",
		color = {
			255,
			0,
			255,
			0,
		},
	},
	{
		keys = ":heart:",
		replacement_keys = "<3",
		texture = "emo_14",
		color = {
			255,
			0,
			255,
			0,
		},
	},
	{
		keys = ":broken_heart:",
		replacement_keys = "</3",
		texture = "emo_15",
		color = {
			255,
			0,
			255,
			0,
		},
	},
	{
		keys = ":sun:",
		texture = "emo_16",
		color = {
			255,
			0,
			255,
			0,
		},
	},
	{
		keys = ":cross:",
		texture = "emo_17",
		color = {
			255,
			0,
			255,
			0,
		},
	},
}

for _, emoji_data in ipairs(EMOJI_SETTINGS) do
	local pattern = emoji_data.keys

	for _, escape_character in ipairs(ESCAPE_CHARACTERS) do
		pattern = string.gsub(pattern, "%" .. escape_character, "%%" .. escape_character)
	end

	emoji_data.pattern = pattern

	local pattern = emoji_data.replacement_keys

	if pattern then
		for _, escape_character in ipairs(ESCAPE_CHARACTERS) do
			pattern = string.gsub(pattern, "%" .. escape_character, "%%" .. escape_character)
		end

		emoji_data.replacement_pattern = pattern
	end
end

EMOJI_SETTINGS_LUT = {}

for idx, emoji_data in ipairs(EMOJI_SETTINGS) do
	EMOJI_SETTINGS_LUT[emoji_data.keys] = idx
end

EMOJI_REPLACEMENTS = {}

for idx, emoji_data in ipairs(EMOJI_SETTINGS) do
	if emoji_data.replacement_keys then
		EMOJI_REPLACEMENTS[#EMOJI_REPLACEMENTS + 1] = {
			data = emoji_data,
			size = string.len(emoji_data.replacement_keys),
		}
	end
end

local function sort_func(a, b)
	return a.size > b.size
end

table.sort(EMOJI_REPLACEMENTS, sort_func)

EmojiHelper = {}

local EMOJIS = {}

EmojiHelper.parse_emojis = function (message)
	local match_str = message

	table.clear(EMOJIS)

	local start_index = string.find(match_str, ":")

	while start_index do
		local end_index = string.find(match_str, ":", start_index + 1)
		local emoji = string.sub(match_str, start_index, end_index)
		local emoji_idx = EMOJI_SETTINGS_LUT[emoji]

		if emoji_idx then
			EMOJIS[#EMOJIS + 1] = EMOJI_SETTINGS[emoji_idx]
			end_index = end_index + 1
		end

		if not end_index then
			return EMOJIS
		end

		match_str = string.sub(match_str, end_index)
		start_index = string.find(match_str, ":")
	end

	return EMOJIS
end

EmojiHelper.replace_emojis = function (text)
	for _, emoji_table in ipairs(EMOJI_REPLACEMENTS) do
		local emoji_data = emoji_table.data

		if emoji_data.replacement_pattern then
			text = string.gsub(text, emoji_data.replacement_pattern, emoji_data.keys)
		end
	end

	return text
end
