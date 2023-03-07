local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local scenegraph_definition = {
	screen = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.interaction
		}
	},
	pivot = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			0
		}
	},
	background = {
		vertical_alignment = "bottom",
		parent = "pivot",
		horizontal_alignment = "left",
		size = {
			400,
			218
		},
		position = {
			50,
			-178,
			-1
		}
	},
	item_tooltip = {
		vertical_alignment = "top",
		parent = "pivot",
		horizontal_alignment = "left",
		size = {
			400,
			0
		},
		position = {
			50,
			-180,
			10
		}
	},
	chest_content = {
		vertical_alignment = "top",
		parent = "background",
		horizontal_alignment = "left",
		size = {
			400,
			100
		},
		position = {
			0,
			-80,
			10
		}
	}
}
local tooltip_passes = {
	"equipped_item_title",
	"item_titles",
	"skin_applied",
	"fatigue",
	"item_power_level",
	"properties",
	"traits",
	"keywords"
}
local animation_definitions = {}
animation_definitions.on_enter = {
	{
		name = "fade_in",
		start_progress = 0,
		end_progress = 0.1,
		init = function (ui_scenegraph, scenegraph_definition, widgets, params)
			params.render_settings.alpha_multiplier = 0
		end,
		update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
			local anim_progress = math.easeInCubic(progress)
			params.render_settings.alpha_multiplier = anim_progress
		end,
		on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
			return
		end
	}
}
animation_definitions.chest_unlock_failed = {
	{
		name = "bounce",
		start_progress = 0,
		end_progress = 0.5,
		init = function (ui_scenegraph, scenegraph_definition, widgets, params)
			params.bounce_value = 1
		end,
		update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
			local anim_progress = math.easeInCubic(progress)
			local time = Managers.time:time("main")
			ui_scenegraph.pivot.local_position[1] = math.sin(time * 50) * 10 * (params.bounce_value - progress)
		end,
		on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
			return
		end
	}
}

local function create_chest_content_widget()
	return {
		scenegraph_id = "chest_content",
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "coin_icon",
					pass_type = "texture",
					content_check_function = function (content)
						return content.show_coin_icon
					end
				},
				{
					style_id = "cost_text",
					pass_type = "text",
					text_id = "cost_text",
					content_check_function = function (content)
						return content.cost_text
					end
				},
				{
					style_id = "rarity",
					pass_type = "text",
					text_id = "rarity_text",
					content_check_function = function (content)
						return content.rarity_text
					end
				},
				{
					style_id = "reward_info",
					pass_type = "text",
					text_id = "reward_info_text",
					content_check_function = function (content)
						return content.reward_info_text
					end
				},
				{
					style_id = "disabled_text",
					pass_type = "text",
					text_id = "disabled_text",
					content_check_function = function (content)
						return content.disabled_text
					end
				}
			}
		},
		content = {
			show_coin_icon = true,
			texture_id = "deus_icons_coin"
		},
		style = {
			coin_icon = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				color = {
					255,
					255,
					255,
					255
				},
				texture_size = {
					30,
					30
				},
				offset = {
					25,
					0,
					0
				}
			},
			cost_text = {
				vertical_alignment = "top",
				font_size = 28,
				localize = false,
				horizontal_alignment = "left",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = {
					255,
					255,
					255,
					255
				},
				offset = {
					60,
					0,
					0
				}
			},
			rarity = {
				vertical_alignment = "top",
				font_size = 18,
				localize = true,
				horizontal_alignment = "left",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = {
					255,
					255,
					255,
					255
				},
				offset = {
					25,
					-40,
					0
				}
			},
			reward_info = {
				vertical_alignment = "top",
				font_size = 28,
				localize = false,
				horizontal_alignment = "left",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = {
					255,
					255,
					255,
					255
				},
				offset = {
					25,
					-60,
					0
				}
			},
			disabled_text = {
				word_wrap = true,
				font_size = 28,
				localize = true,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				area_size = {
					350,
					200
				},
				text_color = {
					255,
					255,
					0,
					0
				},
				offset = {
					25,
					-20,
					0
				}
			}
		},
		offset = {
			0,
			0,
			0
		}
	}
end

local force_equipped = true
local widgets = {
	chest_content = create_chest_content_widget(),
	weapon_tooltip = UIWidgets.create_simple_item_presentation("item_tooltip", tooltip_passes, force_equipped),
	background = UIWidgets.create_simple_rect("background", {
		255,
		0,
		0,
		0
	}),
	frame = UIWidgets.create_frame("background", scenegraph_definition.background.size, "item_tooltip_frame_01")
}

return {
	animation_definitions = animation_definitions,
	scenegraph_definition = scenegraph_definition,
	widgets = widgets
}
