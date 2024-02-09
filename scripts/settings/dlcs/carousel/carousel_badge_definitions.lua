-- chunkname: @scripts/settings/dlcs/carousel/carousel_badge_definitions.lua

BadgeDefinitions = BadgeDefinitions or {}

local function random_badge()
	return string.format("badge_generic_%02d", math.random(7))
end

local function random_color()
	return {
		255,
		math.random(255),
		math.random(255),
		math.random(255),
	}
end

BadgeDefinitions.kill_hero = {
	text = "Eliminated {#color(%d,%d,%d,%d)}%s{#reset()}!",
	texture_id = "badge_generic_01",
	bg_color = {
		255,
		126,
		0,
		0,
	},
	victim_text_color = {
		255,
		187,
		0,
		0,
	},
}
BadgeDefinitions.knock_down_hero = {
	text = "{#color(%d,%d,%d,%d)}%s{#reset()} Knocked Down!",
	texture_id = "badge_generic_02",
	bg_color = {
		255,
		173,
		133,
		0,
	},
	victim_text_color = {
		255,
		187,
		0,
		0,
	},
}
BadgeDefinitions.kill_pactsworn = {
	text = "Eliminated {#color(%d,%d,%d,%d)}%s{#reset()}!",
	texture_id = "badge_generic_01",
	bg_color = {
		255,
		126,
		0,
		0,
	},
	victim_text_color = {
		255,
		187,
		0,
		0,
	},
}
