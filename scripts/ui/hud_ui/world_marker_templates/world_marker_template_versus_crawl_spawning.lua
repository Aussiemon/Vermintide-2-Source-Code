-- chunkname: @scripts/ui/hud_ui/world_marker_templates/world_marker_template_versus_crawl_spawning.lua

local NAME = "spawning"

WorldMarkerTemplates = WorldMarkerTemplates or {}

require("scripts/ui/hud_ui/world_marker_templates/world_marker_template_versus_climbing")

local climbing = WorldMarkerTemplates.climbing
local template = table.merge(WorldMarkerTemplates[NAME] or {}, climbing)

WorldMarkerTemplates[NAME] = template

template.on_enter = function (widget)
	climbing.on_enter(widget)

	widget.content.icon = "world_marker_versus_pactsworn_interact_spawning"
end

template.update_function = function (ui_renderer, widget, marker, settings, dt, t)
	local content = widget.content
	local style = widget.style
	local icon_style = style.icon
	local distance = content.distance
	local progress = content.progress
	local attack_held = Managers.input:get_service("Player"):get("action_one_hold")

	if distance <= 3 and not marker.raycast_result and not attack_held then
		progress = math.min(1, progress + dt * 3.5)
	else
		progress = math.max(0, progress - dt * 15)
	end

	content.progress = progress
	style.background.color[1] = 175 * progress

	if marker.raycast_result or attack_held then
		Colors.copy_to(icon_style.color, icon_style.color_occluded)
	else
		Colors.lerp_color_tables(icon_style.color_inactive, icon_style.color_active, progress, icon_style.color)
	end

	local fade_progress = (settings.max_distance - distance) / settings.fade_distance

	if fade_progress < 1 then
		icon_style.color[1] = icon_style.color[1] * fade_progress
	end

	local local_player_unit = Managers.player:local_player().player_unit
	local ghost_mode_extension = ScriptUnit.has_extension(local_player_unit, "ghost_mode_system")

	if not ghost_mode_extension:is_in_ghost_mode() then
		widget.alpha_multiplier = 0
	else
		widget.alpha_multiplier = 1
	end

	return false
end
