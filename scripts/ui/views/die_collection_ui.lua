local create_category_widget, scenegraph_definition, dice_collection_widget = nil
local die_index_type = {
	"normal",
	"weighted",
	"golden"
}
DieCollectionUI = class(DieCollectionUI)
DieCollectionUI.init = function (self, dice_roller, ui_renderer, input_manager, scenegraph_id, topic_text, dies_enabled, world)
	self.dice_roller = dice_roller
	self.ui_renderer = ui_renderer
	self.input_manager = input_manager
	self.topic_text = topic_text
	self.dies_enabled = dies_enabled

	self.create_ui_elements(self)

	self.scenegraph_id = scenegraph_id
	self.wwise_world = Managers.world:wwise_world(world)

	return 
end
local button_name_index_list = {}
local button_hotspot_name_index_list = {}

for i = 1, 10, 1 do
	button_name_index_list[i] = "button_" .. i
	button_hotspot_name_index_list[i] = "button_" .. i .. "_hotspot"
end

DieCollectionUI.create_ui_elements = function (self)
	local category_widgets = {}
	local dice_roller = self.dice_roller
	local dies_enabled = self.dies_enabled
	local default_color = (dies_enabled and MenuGuiSettings.button_default) or MenuGuiSettings.button_disabled_dark

	for i = 1, 3, 1 do
		local scenegraph_id = "die_category_" .. i
		local category_widget_definition = create_category_widget(die_index_type[i], scenegraph_id, i)
		category_widgets[i] = UIWidget.init(category_widget_definition)
		local num_owned_die = dice_roller.max_num_dices(dice_roller, die_index_type[i])

		for j = 1, num_owned_die, 1 do
			category_widgets[i].content[button_name_index_list[j]].texture = "loot_screen_dice_" .. i
			category_widgets[i].content[button_name_index_list[j]].is_active = dies_enabled
			category_widgets[i].style[button_name_index_list[j]].color = default_color
		end

		for j = num_owned_die + 1, 10, 1 do
			category_widgets[i].content[button_name_index_list[j]].visible = false
		end
	end

	self.category_widgets = category_widgets
	dice_collection_widget.content.topic_text = self.topic_text
	category_widgets[4] = UIWidget.init(dice_collection_widget)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	return 
end
DieCollectionUI.update = function (self, dt)
	local ui_renderer = self.ui_renderer
	local input_service = self.input_manager:get_service("ingame_menu")
	local dice_roller = self.dice_roller
	local has_rolled = dice_roller.has_rolled

	UIRenderer.begin_pass(ui_renderer, self.ui_scenegraph, input_service, dt, self.scenegraph_id)

	for i, widget in ipairs(self.category_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)

		if i <= 3 then
			local category_type = die_index_type[i]
			local num_owned_die = dice_roller.max_num_dices(dice_roller, category_type)

			if not has_rolled then
				for j = 1, num_owned_die, 1 do
					local hotspot_name = button_hotspot_name_index_list[j]

					if widget.content[hotspot_name].is_clicked == 0 then
						local button_name = button_name_index_list[j]
						local new_color = nil

						if widget.content[button_name].is_active then
							new_color = MenuGuiSettings.button_disabled_dark

							dice_roller.decrease_die(dice_roller, die_index_type[i])

							widget.content[button_name].is_active = false

							WwiseWorld.trigger_event(self.wwise_world, "hud_dice_game_diselect_dice")
						else
							new_color = MenuGuiSettings.button_default

							dice_roller.increase_die(dice_roller, die_index_type[i])

							widget.content[button_name].is_active = true

							WwiseWorld.trigger_event(self.wwise_world, "hud_dice_game_select_dice")
						end

						widget.style[button_name].color = new_color
					end
				end
			else
				local num_rolled_type = 0

				for j = 1, num_owned_die, 1 do
					local button_name = button_name_index_list[j]
					local color = widget.style[button_name].color

					if widget.content[button_name].is_active then
						num_rolled_type = num_rolled_type + 1
						local die_result = dice_roller.is_dice_success(dice_roller, category_type, num_rolled_type)

						if die_result == "success" then
							widget.content[button_name].is_highlighted = true
							widget.content[button_name].highlight_texture = "loot_screen_dice_highlight_1"
						elseif die_result == "reroll" then
							widget.content[button_name].is_highlighted = true
							widget.content[button_name].is_reroll = true
							widget.content[button_name].highlight_texture = "loot_screen_dice_highlight_2"
						else
							widget.content[button_name].is_highlighted = nil
							widget.content[button_name].is_reroll = nil
						end
					end

					local hotspot_name = button_hotspot_name_index_list[j]

					if widget.content[hotspot_name].is_clicked == 0 then
					end
				end
			end
		end
	end

	UIRenderer.end_pass(ui_renderer)

	return 
end
local dice_categorys = {}

for i = 1, 3, 1 do
	local category = {
		passes = {
			{
				pass_type = "texture",
				texture_id = "large_dice_texture",
				scenegraph_id = "die_category_" .. i
			}
		}
	}
	dice_categorys[i] = category
	local num_passes = #category.passes

	for j = 1, 10, 1 do
		local scenegraph_id = "die_category_" .. i .. "_button_" .. j
		category.passes[(num_passes + j * 3) - 2] = {
			pass_type = "hotspot",
			content_id = "button_" .. j .. "_hotspot",
			scenegraph_id = scenegraph_id
		}
		category.passes[(num_passes + j * 3) - 1] = {
			texture_id = "texture",
			pass_type = "texture",
			content_id = "button_" .. j,
			style_id = "button_" .. j,
			scenegraph_id = scenegraph_id
		}
		category.passes[num_passes + j * 3] = {
			texture_id = "highlight_texture",
			pass_type = "texture",
			content_id = "button_" .. j,
			scenegraph_id = scenegraph_id .. "_highlight",
			content_check_function = function (content)
				return content.is_highlighted
			end
		}
	end
end

function create_category_widget(category_name, scenegraph_id, category_index)
	return {
		element = dice_categorys[category_index],
		content = {
			large_dice_texture = "loot_screen_dice_large_" .. category_index,
			button_1 = {
				texture = "loot_screen_dice_1",
				highlight_texture = "loot_screen_dice_highlight_1"
			},
			button_2 = {
				texture = "loot_screen_dice_1",
				highlight_texture = "loot_screen_dice_highlight_1"
			},
			button_3 = {
				texture = "loot_screen_dice_1",
				highlight_texture = "loot_screen_dice_highlight_1"
			},
			button_4 = {
				texture = "loot_screen_dice_1",
				highlight_texture = "loot_screen_dice_highlight_1"
			},
			button_5 = {
				texture = "loot_screen_dice_1",
				highlight_texture = "loot_screen_dice_highlight_1"
			},
			button_6 = {
				texture = "loot_screen_dice_1",
				highlight_texture = "loot_screen_dice_highlight_1"
			},
			button_7 = {
				texture = "loot_screen_dice_1",
				highlight_texture = "loot_screen_dice_highlight_1"
			},
			button_8 = {
				texture = "loot_screen_dice_1",
				highlight_texture = "loot_screen_dice_highlight_1"
			},
			button_9 = {
				texture = "loot_screen_dice_1",
				highlight_texture = "loot_screen_dice_highlight_1"
			},
			button_10 = {
				texture = "loot_screen_dice_1",
				highlight_texture = "loot_screen_dice_highlight_1"
			},
			button_1_hotspot = {},
			button_2_hotspot = {},
			button_3_hotspot = {},
			button_4_hotspot = {},
			button_5_hotspot = {},
			button_6_hotspot = {},
			button_7_hotspot = {},
			button_8_hotspot = {},
			button_9_hotspot = {},
			button_10_hotspot = {}
		},
		style = {
			background = {
				corner_radius = 4,
				color = Colors.color_definitions.light_gray
			},
			button_1 = {
				color = MenuGuiSettings.button_default
			},
			button_2 = {
				color = MenuGuiSettings.button_default
			},
			button_3 = {
				color = MenuGuiSettings.button_default
			},
			button_4 = {
				color = MenuGuiSettings.button_default
			},
			button_5 = {
				color = MenuGuiSettings.button_default
			},
			button_6 = {
				color = MenuGuiSettings.button_default
			},
			button_7 = {
				color = MenuGuiSettings.button_default
			},
			button_8 = {
				color = MenuGuiSettings.button_default
			},
			button_9 = {
				color = MenuGuiSettings.button_default
			},
			button_10 = {
				color = MenuGuiSettings.button_default
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local dietype_button_size = {
	36,
	36
}
local highlight_size = {
	46,
	46
}
local dietype_button_offset_x = 42
local dietype_button_offset_y = 42
local CATEGORY_OFFSET = 90
local CATEGORY_SIZE = {
	314,
	352
}
local SUB_CATEGORY_SIZE = {
	78,
	78
}
local BASE_CATEGORY_OFFSET_X = 12
local BASE_CATEGORY_OFFSET_Y = 20
scenegraph_definition = {
	die_panel = {
		size = {
			200,
			540
		}
	},
	die_category_base = {
		parent = "die_panel",
		position = {
			20,
			0,
			1
		},
		size = CATEGORY_SIZE
	},
	die_category_base_topic = {
		vertical_alignment = "top",
		parent = "die_category_base",
		position = {
			0,
			6,
			1
		},
		size = {
			CATEGORY_SIZE[1],
			48
		}
	},
	die_category_1 = {
		parent = "die_category_base",
		position = {
			BASE_CATEGORY_OFFSET_X,
			BASE_CATEGORY_OFFSET_Y + CATEGORY_OFFSET * 0,
			2
		},
		size = SUB_CATEGORY_SIZE
	},
	die_category_2 = {
		parent = "die_category_base",
		position = {
			BASE_CATEGORY_OFFSET_X,
			BASE_CATEGORY_OFFSET_Y + CATEGORY_OFFSET * 1,
			2
		},
		size = SUB_CATEGORY_SIZE
	},
	die_category_3 = {
		parent = "die_category_base",
		position = {
			BASE_CATEGORY_OFFSET_X,
			BASE_CATEGORY_OFFSET_Y + CATEGORY_OFFSET * 2,
			2
		},
		size = SUB_CATEGORY_SIZE
	}
}

for j = 1, 3, 1 do
	for i = 1, 10, 1 do
		local scenegraph_id = "die_category_" .. j .. "_button_" .. i
		scenegraph_definition[scenegraph_id] = {
			parent = "die_category_" .. j,
			position = {
				84 + (i - 1) % 5 * dietype_button_offset_x,
				dietype_button_offset_y - math.floor((i - 1) / 5) * dietype_button_offset_y,
				2
			},
			size = dietype_button_size
		}
		scenegraph_definition[scenegraph_id .. "_highlight"] = {
			parent = scenegraph_id,
			position = {
				-5,
				-5,
				-1
			},
			size = highlight_size
		}
	end
end

dice_collection_widget = {
	scenegraph_id = "die_category_base",
	element = {
		passes = {
			{
				pass_type = "texture",
				texture_id = "texture_id"
			},
			{
				scenegraph_id = "die_category_base_topic",
				style_id = "text",
				pass_type = "text",
				text_id = "topic_text"
			}
		}
	},
	content = {
		texture_id = "loot_screen_dice_bg",
		topic_text = "Level Die"
	},
	style = {
		text = {
			font_size = 24,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			text_color = Colors.color_definitions.white
		}
	}
}

return 
