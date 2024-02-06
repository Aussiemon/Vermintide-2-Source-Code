-- chunkname: @scripts/ui/views/end_screens/defeat_end_screen_ui_definitions.lua

local scenegraph = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.end_screen_banner,
		},
		size = {
			1920,
			1080,
		},
	},
	end_screen_banner_defeat = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			0,
			0,
			2,
		},
		size = {
			680,
			240,
		},
	},
	defeat_effect_1 = {
		horizontal_alignment = "center",
		parent = "end_screen_banner_defeat",
		vertical_alignment = "center",
		position = {
			50,
			-100,
			-2,
		},
		size = {
			1080,
			600,
		},
	},
	defeat_effect_2 = {
		horizontal_alignment = "center",
		parent = "end_screen_banner_defeat",
		vertical_alignment = "center",
		position = {
			-50,
			-200,
			-1,
		},
		size = {
			230,
			400,
		},
	},
	title_text_defeat = {
		horizontal_alignment = "center",
		parent = "end_screen_banner_defeat",
		vertical_alignment = "top",
		position = {
			0,
			90,
			3,
		},
		size = {
			1200,
			100,
		},
	},
}
local title_text_defeat_style = {
	font_size = 100,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("red", 255),
	offset = {
		0,
		0,
		2,
	},
}
local widgets = {
	title_text = UIWidgets.create_simple_text(Localize("end_screen_loss"), "title_text_defeat", nil, nil, title_text_defeat_style),
	banner = UIWidgets.create_simple_texture("end_screen_banner_defeat", "end_screen_banner_defeat"),
	effect_1 = UIWidgets.create_simple_texture("end_screen_effect_defeat_1", "defeat_effect_1"),
	effect_2 = UIWidgets.create_simple_texture("end_screen_effect_defeat_2", "defeat_effect_2"),
}
local animations = {
	defeat = {
		{
			end_progress = 1.8,
			name = "entry",
			start_progress = 1.4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				widgets.banner.style.texture_id.color[1] = 0
				widgets.effect_1.style.texture_id.color[1] = 0
				widgets.effect_2.style.texture_id.color[1] = 0
				widgets.title_text.style.text.text_color[1] = 0
				widgets.title_text.style.text_shadow.text_color[1] = 0
				params.draw_flags.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeCubic(progress)
				local size_fraction = math.easeCubic(1 - progress)
				local anim_size_fraction = math.catmullrom(size_fraction, 1.8, 0, 1, -1)

				widgets.banner.style.texture_id.color[1] = 255 * anim_fraction

				local banner_default_size = scenegraph_definition.end_screen_banner_defeat.size

				ui_scenegraph.end_screen_banner_defeat.size[1] = banner_default_size[1] + banner_default_size[1] * 3 * anim_size_fraction
				ui_scenegraph.end_screen_banner_defeat.size[2] = banner_default_size[2] + banner_default_size[2] * 3 * anim_size_fraction
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 2.2,
			name = "text",
			start_progress = 1.8,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeCubic(progress)
				local anim_font_size_fraction = math.ease_in_exp(1 - progress)
				local alpha = 255 * anim_fraction
				local text_style = widgets.title_text.style.text
				local text_shadow_style = widgets.title_text.style.text_shadow

				text_style.text_color[1] = alpha
				text_shadow_style.text_color[1] = alpha

				local new_text_size = 100 + 100 * anim_font_size_fraction

				text_style.font_size = new_text_size
				text_shadow_style.font_size = new_text_size
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 1.5,
			name = "effect_1",
			start_progress = 1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeCubic(progress)
				local alpha = 255 * anim_fraction

				widgets.effect_1.style.texture_id.color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 3,
			name = "effect_2",
			start_progress = 1.7,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.ease_out_quad(progress)
				local alpha = 255 * anim_fraction

				widgets.effect_2.style.texture_id.color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 6.5,
			name = "fade_out",
			start_progress = 6,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeInCubic(progress)

				params.draw_flags.alpha_multiplier = 1 - anim_fraction
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

return {
	scenegraph_definition = scenegraph,
	widget_definitions = widgets,
	animation_definitions = animations,
}
