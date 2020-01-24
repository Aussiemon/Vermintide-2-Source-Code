if not rawget(_G, "StoreLayoutConfig") then
	StoreLayoutConfig = {
		menu_options = {
			"featured",
			"cosmetics",
			"dlc"
		},
		pages = {},
		structure = {},
		structure = {
			featured = 1,
			dlc = 1,
			cosmetics = {
				bardin = {
					ranger = {
						weapon_skins = "item_details",
						hats = "item_details",
						skins = "item_details"
					},
					ironbreaker = {
						weapon_skins = "item_details",
						hats = "item_details",
						skins = "item_details"
					},
					slayer = {
						weapon_skins = "item_details",
						hats = "item_details",
						skins = "item_details"
					}
				},
				kruber = {
					mercenary = {
						weapon_skins = "item_details",
						hats = "item_details",
						skins = "item_details"
					},
					huntsman = {
						weapon_skins = "item_details",
						hats = "item_details",
						skins = "item_details"
					},
					knight = {
						weapon_skins = "item_details",
						hats = "item_details",
						skins = "item_details"
					}
				},
				kerillian = {
					waywatcher = {
						weapon_skins = "item_details",
						hats = "item_details",
						skins = "item_details"
					},
					maidenguard = {
						weapon_skins = "item_details",
						hats = "item_details",
						skins = "item_details"
					},
					shade = {
						weapon_skins = "item_details",
						hats = "item_details",
						skins = "item_details"
					}
				},
				victor = {
					captain = {
						weapon_skins = "item_details",
						hats = "item_details",
						skins = "item_details"
					},
					bountyhunter = {
						weapon_skins = "item_details",
						hats = "item_details",
						skins = "item_details"
					},
					zealot = {
						weapon_skins = "item_details",
						hats = "item_details",
						skins = "item_details"
					}
				},
				sienna = {
					scholar = {
						weapon_skins = "item_details",
						hats = "item_details",
						skins = "item_details"
					},
					adept = {
						weapon_skins = "item_details",
						hats = "item_details",
						skins = "item_details"
					},
					unchained = {
						weapon_skins = "item_details",
						hats = "item_details",
						skins = "item_details"
					}
				}
			}
		}
	}
	StoreLayoutConfig.pages.featured = {
		sound_event_enter = "Play_hud_store_category_front",
		layout = "featured",
		display_name = "menu_store_panel_title_featured",
		slideshow = {},
		grid = {}
	}
	StoreLayoutConfig.pages.cosmetics = {
		sound_event_enter = "Play_hud_store_category_cosmetics",
		layout = "category",
		display_name = "menu_store_panel_title_cosmetics"
	}
	StoreLayoutConfig.pages.dlc = {
		sound_event_enter = "Play_hud_store_category_dlc",
		layout = "dlc_list",
		display_name = "menu_store_panel_title_dlcs",
		type = "dlc",
		content = {
			"scorpion",
			"holly",
			"bogenhafen",
			"pre_order"
		}
	}
	StoreLayoutConfig.pages.item_details = {
		layout = "item_detailed",
		display_name = "item_details",
		type = "item"
	}
	StoreLayoutConfig.pages.all_items = {
		layout = "item_list",
		display_name = "menu_store_category_title_all",
		type = "item"
	}
	StoreLayoutConfig.pages.hats = {
		sound_event_enter = "Play_hud_store_category_button",
		layout = "item_list",
		display_name = "menu_store_category_title_character_hats",
		type = "item",
		item_filter = "item_type == hat",
		sort_order = 1,
		category_button_texture = "store_category_icon_hats"
	}
	StoreLayoutConfig.pages.skins = {
		sound_event_enter = "Play_hud_store_category_button",
		layout = "item_list",
		display_name = "menu_store_category_title_character_skins",
		type = "item",
		item_filter = "item_type == skin",
		sort_order = 2,
		category_button_texture = "store_category_icon_skins"
	}
	StoreLayoutConfig.pages.weapon_skins = {
		sound_event_enter = "Play_hud_store_category_button",
		layout = "item_list",
		display_name = "menu_store_category_title_weapon_illusions",
		type = "item",
		item_filter = "item_type == weapon_skin",
		sort_order = 3,
		category_button_texture = "store_category_icon_weapons"
	}
	StoreLayoutConfig.pages.bardin = {
		sound_event_enter = "Play_hud_store_bardin",
		layout = "category",
		display_name = "inventory_name_dwarf_ranger",
		item_filter = "can_wield_dwarf_ranger",
		sort_order = 2,
		category_button_texture = "store_category_icon_bardin_ranger"
	}
	StoreLayoutConfig.pages.ironbreaker = {
		sound_event_enter = "Play_hud_store_category_button",
		layout = "category",
		display_name = "dr_ironbreaker",
		item_filter = "can_wield_dr_ironbreaker",
		sort_order = 2,
		category_button_texture = "store_category_icon_bardin_ironbreaker"
	}
	StoreLayoutConfig.pages.slayer = {
		sound_event_enter = "Play_hud_store_category_button",
		layout = "category",
		display_name = "dr_slayer",
		item_filter = "can_wield_dr_slayer",
		sort_order = 3,
		category_button_texture = "store_category_icon_bardin_slayer"
	}
	StoreLayoutConfig.pages.ranger = {
		sound_event_enter = "Play_hud_store_category_button",
		layout = "category",
		display_name = "dr_ranger",
		item_filter = "can_wield_dr_ranger",
		sort_order = 1,
		category_button_texture = "store_category_icon_bardin_ranger"
	}
	StoreLayoutConfig.pages.kruber = {
		sound_event_enter = "Play_hud_store_kruber",
		layout = "category",
		display_name = "inventory_name_empire_soldier",
		item_filter = "can_wield_empire_soldier",
		sort_order = 1,
		category_button_texture = "store_category_icon_kruber_mercenary"
	}
	StoreLayoutConfig.pages.huntsman = {
		sound_event_enter = "Play_hud_store_category_button",
		layout = "category",
		display_name = "es_huntsman",
		item_filter = "can_wield_es_huntsman",
		sort_order = 2,
		category_button_texture = "store_category_icon_kruber_huntsman"
	}
	StoreLayoutConfig.pages.knight = {
		sound_event_enter = "Play_hud_store_category_button",
		layout = "category",
		display_name = "es_knight",
		item_filter = "can_wield_es_knight",
		sort_order = 3,
		category_button_texture = "store_category_icon_kruber_knight"
	}
	StoreLayoutConfig.pages.mercenary = {
		sound_event_enter = "Play_hud_store_category_button",
		layout = "category",
		display_name = "es_mercenary",
		item_filter = "can_wield_es_mercenary",
		sort_order = 1,
		category_button_texture = "store_category_icon_kruber_mercenary"
	}
	StoreLayoutConfig.pages.kerillian = {
		sound_event_enter = "Play_hud_store_kerillian",
		layout = "category",
		display_name = "inventory_name_wood_elf",
		item_filter = "can_wield_wood_elf",
		sort_order = 3,
		category_button_texture = "store_category_icon_kerillian_waystalker"
	}
	StoreLayoutConfig.pages.waywatcher = {
		sound_event_enter = "Play_hud_store_category_button",
		layout = "category",
		display_name = "we_waywatcher",
		item_filter = "can_wield_we_waywatcher",
		sort_order = 1,
		category_button_texture = "store_category_icon_kerillian_waystalker"
	}
	StoreLayoutConfig.pages.maidenguard = {
		sound_event_enter = "Play_hud_store_category_button",
		layout = "category",
		display_name = "we_maidenguard",
		item_filter = "can_wield_we_maidenguard",
		sort_order = 2,
		category_button_texture = "store_category_icon_kerillian_handmaiden"
	}
	StoreLayoutConfig.pages.shade = {
		sound_event_enter = "Play_hud_store_category_button",
		layout = "category",
		display_name = "we_shade",
		item_filter = "can_wield_we_shade",
		sort_order = 3,
		category_button_texture = "store_category_icon_kerillian_shade"
	}
	StoreLayoutConfig.pages.victor = {
		sound_event_enter = "Play_hud_store_saltzpyre",
		layout = "category",
		display_name = "inventory_name_witch_hunter",
		item_filter = "can_wield_witch_hunter",
		sort_order = 4,
		category_button_texture = "store_category_icon_victor_captain"
	}
	StoreLayoutConfig.pages.captain = {
		sound_event_enter = "Play_hud_store_category_button",
		layout = "category",
		display_name = "wh_captain",
		item_filter = "can_wield_wh_captain",
		sort_order = 1,
		category_button_texture = "store_category_icon_victor_captain"
	}
	StoreLayoutConfig.pages.bountyhunter = {
		sound_event_enter = "Play_hud_store_category_button",
		layout = "category",
		display_name = "wh_bountyhunter",
		item_filter = "can_wield_wh_bountyhunter",
		sort_order = 2,
		category_button_texture = "store_category_icon_victor_bountyhunter"
	}
	StoreLayoutConfig.pages.zealot = {
		sound_event_enter = "Play_hud_store_category_button",
		layout = "category",
		display_name = "wh_zealot",
		item_filter = "can_wield_wh_zealot",
		sort_order = 3,
		category_button_texture = "store_category_icon_victor_zealot"
	}
	StoreLayoutConfig.pages.sienna = {
		sound_event_enter = "Play_hud_store_sienna",
		layout = "category",
		display_name = "inventory_name_bright_wizard",
		item_filter = "can_wield_bright_wizard",
		sort_order = 5,
		category_button_texture = "store_category_icon_sienna_scholar"
	}
	StoreLayoutConfig.pages.scholar = {
		sound_event_enter = "Play_hud_store_category_button",
		layout = "category",
		display_name = "bw_scholar",
		item_filter = "can_wield_bw_scholar",
		sort_order = 2,
		category_button_texture = "store_category_icon_sienna_scholar"
	}
	StoreLayoutConfig.pages.adept = {
		sound_event_enter = "Play_hud_store_category_button",
		layout = "category",
		display_name = "bw_adept",
		item_filter = "can_wield_bw_adept",
		sort_order = 1,
		category_button_texture = "store_category_icon_sienna_adept"
	}
	StoreLayoutConfig.pages.unchained = {
		sound_event_enter = "Play_hud_store_category_button",
		layout = "category",
		display_name = "bw_unchained",
		item_filter = "can_wield_bw_unchained",
		sort_order = 3,
		category_button_texture = "store_category_icon_sienna_unchained"
	}
end

return
