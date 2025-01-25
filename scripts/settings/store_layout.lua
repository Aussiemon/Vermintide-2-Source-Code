-- chunkname: @scripts/settings/store_layout.lua

require("scripts/settings/store_dlc_settings")

if not StoreLayoutConfig then
	StoreLayoutConfig = {
		menu_options = {
			"featured",
			"cosmetics",
			"bundles",
			"dlc",
			"versus",
		},
		pages = {},
		structure = {},
		global_shader_flag_overrides = {
			NECROMANCER_CAREER_REMAP = false,
		},
	}
	StoreLayoutConfig.structure = {
		bundles = 1,
		dlc = 1,
		featured = 1,
		cosmetics = {
			bardin = {
				ranger = {
					frames = "item_details",
					hats = "item_details",
					skins = "item_details",
					weapon_skins = "item_details",
				},
				ironbreaker = {
					frames = "item_details",
					hats = "item_details",
					skins = "item_details",
					weapon_skins = "item_details",
				},
				slayer = {
					frames = "item_details",
					hats = "item_details",
					skins = "item_details",
					weapon_skins = "item_details",
				},
				engineer = {
					frames = "item_details",
					hats = "item_details",
					skins = "item_details",
					weapon_skins = "item_details",
				},
			},
			kruber = {
				mercenary = {
					frames = "item_details",
					hats = "item_details",
					skins = "item_details",
					weapon_skins = "item_details",
				},
				huntsman = {
					frames = "item_details",
					hats = "item_details",
					skins = "item_details",
					weapon_skins = "item_details",
				},
				knight = {
					frames = "item_details",
					hats = "item_details",
					skins = "item_details",
					weapon_skins = "item_details",
				},
				questingknight = {
					frames = "item_details",
					hats = "item_details",
					skins = "item_details",
					weapon_skins = "item_details",
				},
			},
			kerillian = {
				waywatcher = {
					frames = "item_details",
					hats = "item_details",
					skins = "item_details",
					weapon_skins = "item_details",
				},
				maidenguard = {
					frames = "item_details",
					hats = "item_details",
					skins = "item_details",
					weapon_skins = "item_details",
				},
				shade = {
					frames = "item_details",
					hats = "item_details",
					skins = "item_details",
					weapon_skins = "item_details",
				},
			},
			victor = {
				captain = {
					frames = "item_details",
					hats = "item_details",
					skins = "item_details",
					weapon_skins = "item_details",
				},
				bountyhunter = {
					frames = "item_details",
					hats = "item_details",
					skins = "item_details",
					weapon_skins = "item_details",
				},
				zealot = {
					frames = "item_details",
					hats = "item_details",
					skins = "item_details",
					weapon_skins = "item_details",
				},
				priest = {
					frames = "item_details",
					hats = "item_details",
					skins = "item_details",
					weapon_skins = "item_details",
				},
			},
			sienna = {
				scholar = {
					frames = "item_details",
					hats = "item_details",
					skins = "item_details",
					weapon_skins = "item_details",
				},
				adept = {
					frames = "item_details",
					hats = "item_details",
					skins = "item_details",
					weapon_skins = "item_details",
				},
				unchained = {
					frames = "item_details",
					hats = "item_details",
					skins = "item_details",
					weapon_skins = "item_details",
				},
			},
			event = {
				frames = "item_details",
				hats = "item_details",
				skins = "item_details",
				weapon_skins = "item_details",
			},
		},
		versus = {
			frames = "item_details",
			pactsworn = "item_details",
			weapon_skins_versus = {
				bardin_versus = "item_list",
				kerillian_versus = "item_list",
				kruber_versus = "item_list",
				sienna_versus = "item_list",
				victor_versus = "item_list",
			},
			poses = {
				bardin_poses = "pose_items",
				kerillian_poses = "pose_items",
				kruber_poses = "pose_items",
				sienna_poses = "pose_items",
				victor_poses = "pose_items",
			},
		},
	}
	StoreLayoutConfig.pages.featured = {
		display_name = "menu_store_panel_title_featured",
		layout = "featured",
		rotation_timer = false,
		sound_event_enter = "Play_hud_store_category_front",
		slideshow = {},
		grid = {},
	}
	StoreLayoutConfig.pages.cosmetics = {
		display_name = "menu_store_panel_title_cosmetics",
		item_filter = "item_type ~= bundle and default_selection\t",
		layout = "category",
		sound_event_enter = "Play_hud_store_category_cosmetics",
		global_shader_flag_overrides = {
			NECROMANCER_CAREER_REMAP = false,
		},
	}
	StoreLayoutConfig.pages.discount_tab = {
		display_name = "menu_store_panel_title_discounts",
		item_filter = "discounted_items",
		layout = "item_list",
		sound_event_enter = "Play_hud_store_category_cosmetics",
		type = "item",
	}

	local dlc_content = {}
	local bundle_dlc_content = {}
	local bundle_lookup_table = {}
	local platform = PLATFORM

	for _, settings in ipairs(StoreDlcSettings) do
		local available_platforms = settings.available_platforms

		if not available_platforms or table.find(available_platforms, platform) then
			if settings.is_bundle then
				bundle_dlc_content[#bundle_dlc_content + 1] = settings.dlc_name
				bundle_lookup_table[settings.dlc_name] = settings
			else
				dlc_content[#dlc_content + 1] = settings.dlc_name
			end
		end
	end

	if IS_CONSOLE then
		StoreLayoutConfig.pages.bundles = {
			category_button_texture = "store_category_icon_weapons",
			display_name = "menu_store_category_title_bundles",
			layout = "dlc_list",
			sort_order = 3,
			sound_event_enter = "Play_hud_store_category_button",
			type = "dlc",
			content = bundle_dlc_content,
		}

		for bundle_dlc_name, dlc_settings in pairs(bundle_lookup_table) do
			StoreLayoutConfig.pages[bundle_dlc_name] = {
				layout = "item_list",
				sort_order = 1,
				type = "bundle_items",
				dlc_name = dlc_settings.dlc_name,
				bundle_contains = dlc_settings.bundle_contains,
				display_name = dlc_settings.name,
			}
		end
	else
		StoreLayoutConfig.pages.bundles = {
			category_button_texture = "store_category_icon_weapons",
			display_name = "menu_store_category_title_bundles",
			item_filter = "item_type == bundle",
			layout = "bundle_list",
			sort_order = 3,
			sound_event_enter = "Play_hud_store_category_button",
			type = "item",
		}
	end

	StoreLayoutConfig.pages.dlc = {
		display_name = "menu_store_panel_title_dlcs",
		layout = "dlc_list",
		sound_event_enter = "Play_hud_store_category_dlc",
		type = "dlc",
		content = dlc_content,
	}

	if not IS_CONSOLE then
		StoreLayoutConfig.pages.versus = {
			display_name = "menu_store_panel_title_versus",
			item_filter = "selection == versus and item_type ~= weapon_pose_bundle",
			layout = "category",
			sound_event_enter = "Play_hud_store_category_cosmetics",
			global_shader_flag_overrides = {
				NECROMANCER_CAREER_REMAP = false,
			},
		}
	end

	StoreLayoutConfig.pages.item_details = {
		display_name = "item_details",
		layout = "item_detailed",
		type = "item",
	}
	StoreLayoutConfig.pages.all_items = {
		display_name = "menu_store_category_title_all",
		layout = "item_list",
		type = "item",
	}
	StoreLayoutConfig.pages.hats = {
		category_button_texture = "store_category_icon_hats",
		display_name = "menu_store_category_title_character_hats",
		item_filter = "item_type == hat",
		layout = "item_list",
		sort_order = 1,
		sound_event_enter = "Play_hud_store_category_button",
		type = "item",
	}
	StoreLayoutConfig.pages.skins = {
		category_button_texture = "store_category_icon_skins",
		display_name = "menu_store_category_title_character_skins",
		item_filter = "item_type == skin and not is_pactsworn_item",
		layout = "item_list",
		sort_order = 2,
		sound_event_enter = "Play_hud_store_category_button",
		type = "item",
	}
	StoreLayoutConfig.pages.weapon_skins = {
		category_button_texture = "store_category_icon_weapons",
		display_name = "menu_store_category_title_weapon_illusions",
		item_filter = "item_type == weapon_skin",
		layout = "item_list",
		sort_order = 3,
		sound_event_enter = "Play_hud_store_category_button",
		type = "item",
	}
	StoreLayoutConfig.pages.frames = {
		category_button_texture = "store_category_icon_portrait_frames",
		display_name = "frame",
		item_filter = "item_type == frame",
		layout = "item_list",
		sort_order = 4,
		sound_event_enter = "Play_hud_store_category_button",
		type = "item",
	}

	if not IS_CONSOLE then
		StoreLayoutConfig.pages.pose_items = {
			category_button_texture = "store_category_icon_poses",
			display_name = "weapon_pose",
			exclusive_filter = true,
			item_filter = "item_type == weapon_pose_bundle and selection == versus",
			layout = "category",
			sort_order = 6,
			sound_event_enter = "Play_hud_store_category_button",
			type = "collection_item",
		}
		StoreLayoutConfig.pages.weapon_skins_versus = {
			category_button_texture = "store_category_icon_weapons",
			display_name = "menu_store_category_title_weapon_illusions",
			item_filter = "item_type == weapon_skin and selection == versus",
			layout = "category",
			sort_order = 3,
			sound_event_enter = "Play_hud_store_category_button",
			type = "item",
		}
		StoreLayoutConfig.pages.poses = {
			category_button_texture = "store_category_icon_poses",
			display_name = "weapon_pose",
			exclusive_filter = true,
			item_filter = "item_type == weapon_pose_bundle and selection == versus",
			layout = "category",
			sound_event_enter = "Play_hud_store_category_button",
			global_shader_flag_overrides = {
				NECROMANCER_CAREER_REMAP = false,
			},
		}
		StoreLayoutConfig.pages.kerillian_poses = {
			category_button_texture = "store_category_icon_kerillian_waystalker",
			display_name = "inventory_name_wood_elf",
			item_filter = "item_type == weapon_pose_bundle and selection == versus and can_wield_wood_elf",
			layout = "category",
			sort_order = 3,
			sound_event_enter = "Play_hud_store_kerillian",
			type = "collection_item",
		}
		StoreLayoutConfig.pages.kruber_poses = {
			category_button_texture = "store_category_icon_kruber_mercenary",
			display_name = "inventory_name_empire_soldier",
			item_filter = "item_type == weapon_pose_bundle and selection == versus and can_wield_empire_soldier",
			layout = "category",
			sort_order = 1,
			sound_event_enter = "Play_hud_store_kruber",
			type = "collection_item",
		}
		StoreLayoutConfig.pages.bardin_poses = {
			category_button_texture = "store_category_icon_bardin_ranger",
			display_name = "inventory_name_dwarf_ranger",
			item_filter = "item_type == weapon_pose_bundle and selection == versus and can_wield_dwarf_ranger",
			layout = "category",
			sort_order = 2,
			sound_event_enter = "Play_hud_store_bardin",
			type = "collection_item",
		}
		StoreLayoutConfig.pages.victor_poses = {
			category_button_texture = "store_category_icon_victor_captain",
			display_name = "inventory_name_witch_hunter",
			item_filter = "item_type == weapon_pose_bundle and selection == versus and can_wield_witch_hunter",
			layout = "category",
			sort_order = 4,
			sound_event_enter = "Play_hud_store_saltzpyre",
			type = "collection_item",
		}
		StoreLayoutConfig.pages.sienna_poses = {
			category_button_texture = "store_category_icon_sienna_scholar",
			display_name = "inventory_name_bright_wizard",
			item_filter = "item_type == weapon_pose_bundle and selection == versus and can_wield_bright_wizard",
			layout = "category",
			sort_order = 5,
			sound_event_enter = "Play_hud_store_sienna",
			type = "collection_item",
		}
		StoreLayoutConfig.pages.kerillian_versus = {
			category_button_texture = "store_category_icon_kerillian_waystalker",
			display_name = "inventory_name_wood_elf",
			item_filter = "item_type == weapon_skin and selection == versus and can_wield_wood_elf",
			layout = "item_list",
			sort_order = 3,
			sound_event_enter = "Play_hud_store_kerillian",
			type = "item",
		}
		StoreLayoutConfig.pages.kruber_versus = {
			category_button_texture = "store_category_icon_kruber_mercenary",
			display_name = "inventory_name_empire_soldier",
			item_filter = "item_type == weapon_skin and selection == versus and can_wield_empire_soldier",
			layout = "item_list",
			sort_order = 1,
			sound_event_enter = "Play_hud_store_kruber",
			type = "item",
		}
		StoreLayoutConfig.pages.bardin_versus = {
			category_button_texture = "store_category_icon_bardin_ranger",
			display_name = "inventory_name_dwarf_ranger",
			item_filter = "item_type == weapon_skin and selection == versus and can_wield_dwarf_ranger",
			layout = "item_list",
			sort_order = 2,
			sound_event_enter = "Play_hud_store_bardin",
			type = "item",
		}
		StoreLayoutConfig.pages.victor_versus = {
			category_button_texture = "store_category_icon_victor_captain",
			display_name = "inventory_name_witch_hunter",
			item_filter = "item_type == weapon_skin and selection == versus and can_wield_witch_hunter",
			layout = "item_list",
			sort_order = 4,
			sound_event_enter = "Play_hud_store_saltzpyre",
			type = "item",
		}
		StoreLayoutConfig.pages.sienna_versus = {
			category_button_texture = "store_category_icon_sienna_scholar",
			display_name = "inventory_name_bright_wizard",
			item_filter = "item_type == weapon_skin and selection == versus and can_wield_bright_wizard",
			layout = "item_list",
			sort_order = 5,
			sound_event_enter = "Play_hud_store_sienna",
			type = "item",
		}
		StoreLayoutConfig.pages.pactsworn = {
			category_button_texture = "store_category_icon_pactsworn",
			display_name = "dark_pact_skin",
			item_filter = "is_pactsworn_item",
			layout = "item_list",
			sort_order = 5,
			sound_event_enter = "Play_hud_store_category_button",
			type = "item",
		}
	end

	StoreLayoutConfig.pages.event = {
		category_button_texture = "store_category_icon_portrait_frames",
		display_name = "achv_menu_event_category_title",
		item_filter = "is_event_item",
		layout = "item_list",
		sort_order = 100,
		sound_event_enter = "Play_hud_store_category_button",
		type = "item",
	}
	StoreLayoutConfig.pages.bardin = {
		category_button_texture = "store_category_icon_bardin_ranger",
		display_name = "inventory_name_dwarf_ranger",
		item_filter = "can_wield_dwarf_ranger",
		layout = "category",
		sort_order = 2,
		sound_event_enter = "Play_hud_store_bardin",
	}
	StoreLayoutConfig.pages.ironbreaker = {
		category_button_texture = "store_category_icon_bardin_ironbreaker",
		display_name = "dr_ironbreaker",
		item_filter = "can_wield_dr_ironbreaker",
		layout = "category",
		sort_order = 2,
		sound_event_enter = "Play_hud_store_category_button",
	}
	StoreLayoutConfig.pages.slayer = {
		category_button_texture = "store_category_icon_bardin_slayer",
		display_name = "dr_slayer",
		item_filter = "can_wield_dr_slayer",
		layout = "category",
		sort_order = 3,
		sound_event_enter = "Play_hud_store_category_button",
	}
	StoreLayoutConfig.pages.ranger = {
		category_button_texture = "store_category_icon_bardin_ranger",
		display_name = "dr_ranger",
		item_filter = "can_wield_dr_ranger",
		layout = "category",
		sort_order = 1,
		sound_event_enter = "Play_hud_store_category_button",
	}
	StoreLayoutConfig.pages.engineer = {
		category_button_texture = "store_category_icon_bardin_engineer",
		display_name = "dr_engineer",
		item_filter = "can_wield_dr_engineer",
		layout = "category",
		sort_order = 4,
		sound_event_enter = "Play_hud_store_category_button",
	}
	StoreLayoutConfig.pages.kruber = {
		category_button_texture = "store_category_icon_kruber_mercenary",
		display_name = "inventory_name_empire_soldier",
		item_filter = "can_wield_empire_soldier",
		layout = "category",
		sort_order = 1,
		sound_event_enter = "Play_hud_store_kruber",
	}
	StoreLayoutConfig.pages.huntsman = {
		category_button_texture = "store_category_icon_kruber_huntsman",
		display_name = "es_huntsman",
		item_filter = "can_wield_es_huntsman",
		layout = "category",
		sort_order = 2,
		sound_event_enter = "Play_hud_store_category_button",
	}
	StoreLayoutConfig.pages.knight = {
		category_button_texture = "store_category_icon_kruber_knight",
		display_name = "es_knight",
		item_filter = "can_wield_es_knight",
		layout = "category",
		sort_order = 3,
		sound_event_enter = "Play_hud_store_category_button",
	}
	StoreLayoutConfig.pages.mercenary = {
		category_button_texture = "store_category_icon_kruber_mercenary",
		display_name = "es_mercenary",
		item_filter = "can_wield_es_mercenary",
		layout = "category",
		sort_order = 1,
		sound_event_enter = "Play_hud_store_category_button",
	}
	StoreLayoutConfig.pages.questingknight = {
		category_button_texture = "store_category_icon_kruber_questingknight",
		display_name = "es_questingknight",
		item_filter = "can_wield_es_questingknight",
		layout = "category",
		sort_order = 4,
		sound_event_enter = "Play_hud_store_category_button",
	}
	StoreLayoutConfig.pages.kerillian = {
		category_button_texture = "store_category_icon_kerillian_waystalker",
		display_name = "inventory_name_wood_elf",
		item_filter = "can_wield_wood_elf",
		layout = "category",
		sort_order = 3,
		sound_event_enter = "Play_hud_store_kerillian",
	}
	StoreLayoutConfig.pages.waywatcher = {
		category_button_texture = "store_category_icon_kerillian_waystalker",
		display_name = "we_waywatcher",
		item_filter = "can_wield_we_waywatcher",
		layout = "category",
		sort_order = 1,
		sound_event_enter = "Play_hud_store_category_button",
	}
	StoreLayoutConfig.pages.maidenguard = {
		category_button_texture = "store_category_icon_kerillian_handmaiden",
		display_name = "we_maidenguard",
		item_filter = "can_wield_we_maidenguard",
		layout = "category",
		sort_order = 2,
		sound_event_enter = "Play_hud_store_category_button",
	}
	StoreLayoutConfig.pages.shade = {
		category_button_texture = "store_category_icon_kerillian_shade",
		display_name = "we_shade",
		item_filter = "can_wield_we_shade",
		layout = "category",
		sort_order = 3,
		sound_event_enter = "Play_hud_store_category_button",
	}
	StoreLayoutConfig.pages.thornsister = {
		category_button_texture = "store_category_icon_kerillian_thornsister",
		display_name = "we_thornsister",
		item_filter = "can_wield_we_thornsister",
		layout = "category",
		sort_order = 4,
		sound_event_enter = "Play_hud_store_category_button",
	}
	StoreLayoutConfig.pages.victor = {
		category_button_texture = "store_category_icon_victor_captain",
		display_name = "inventory_name_witch_hunter",
		item_filter = "can_wield_witch_hunter",
		layout = "category",
		sort_order = 4,
		sound_event_enter = "Play_hud_store_saltzpyre",
	}
	StoreLayoutConfig.pages.captain = {
		category_button_texture = "store_category_icon_victor_captain",
		display_name = "wh_captain",
		item_filter = "can_wield_wh_captain",
		layout = "category",
		sort_order = 1,
		sound_event_enter = "Play_hud_store_category_button",
	}
	StoreLayoutConfig.pages.bountyhunter = {
		category_button_texture = "store_category_icon_victor_bountyhunter",
		display_name = "wh_bountyhunter",
		item_filter = "can_wield_wh_bountyhunter",
		layout = "category",
		sort_order = 2,
		sound_event_enter = "Play_hud_store_category_button",
	}
	StoreLayoutConfig.pages.zealot = {
		category_button_texture = "store_category_icon_victor_zealot",
		display_name = "wh_zealot",
		item_filter = "can_wield_wh_zealot",
		layout = "category",
		sort_order = 3,
		sound_event_enter = "Play_hud_store_category_button",
	}
	StoreLayoutConfig.pages.priest = {
		category_button_texture = "store_category_icon_priest",
		display_name = "wh_priest",
		item_filter = "can_wield_wh_priest",
		layout = "category",
		sort_order = 4,
		sound_event_enter = "Play_hud_store_category_button",
	}
	StoreLayoutConfig.pages.sienna = {
		category_button_texture = "store_category_icon_sienna_scholar",
		display_name = "inventory_name_bright_wizard",
		item_filter = "can_wield_bright_wizard",
		layout = "category",
		sort_order = 5,
		sound_event_enter = "Play_hud_store_sienna",
	}
	StoreLayoutConfig.pages.scholar = {
		category_button_texture = "store_category_icon_sienna_scholar",
		display_name = "bw_scholar",
		item_filter = "can_wield_bw_scholar",
		layout = "category",
		sort_order = 2,
		sound_event_enter = "Play_hud_store_category_button",
	}
	StoreLayoutConfig.pages.adept = {
		category_button_texture = "store_category_icon_sienna_adept",
		display_name = "bw_adept",
		item_filter = "can_wield_bw_adept",
		layout = "category",
		sort_order = 1,
		sound_event_enter = "Play_hud_store_category_button",
	}
	StoreLayoutConfig.pages.unchained = {
		category_button_texture = "store_category_icon_sienna_unchained",
		display_name = "bw_unchained",
		item_filter = "can_wield_bw_unchained",
		layout = "category",
		sort_order = 3,
		sound_event_enter = "Play_hud_store_category_button",
	}
	StoreLayoutConfig.pages.discounts = {
		category_button_texture = "store_category_icon_kruber_mercenary",
		display_name = "inventory_discounts",
		item_filter = "discounted_items",
		layout = "category",
		sort_order = 6,
		sound_event_enter = "Play_hud_store_kruber",
	}

	for dlc_name, dlc_settings in pairs(DLCSettings) do
		local store_layout = dlc_settings.store_layout

		if store_layout then
			table.append_recursive(StoreLayoutConfig, store_layout)
		end
	end
end

StoreLayoutConfig.make_sort_key = function (item)
	local backend_items = Managers.backend:get_interface("items")
	local data = item.data
	local key = item.key
	local item_type = key
	local prio = item.prio or 0
	local price = 0
	local rarity = item.rarity or "plentiful"
	local owned = (backend_items:has_item(key) or backend_items:has_weapon_illusion(key)) and 2 or 0

	if data then
		item_type = data.item_type or item.item_type

		if item_type == "weapon_skin" then
			item_type = data.matching_item_key or "weapon_skin"
		else
			item_type = item_type == "bundle" and "2.bundle" or item_type == "skin" and "1.skin" or item_type == "hat" and "0.hat" or key
		end

		prio = data.prio or prio
		rarity = data.rarity or rarity

		local current_prices = item.current_prices

		if current_prices then
			price = current_prices.SM or 0
		end

		if not owned and backend_items:has_bundle_contents(data.bundle_contains) then
			owned = 1
		end
	end

	prio = 65536 - prio

	if prio <= 0 then
		prio = 1
	end

	local sort_key = string.format("%01x%-16.16s%03x%04x%01x", owned, item_type, prio, price, ORDER_RARITY[rarity] or 0)

	return sort_key
end

StoreLayoutConfig.compare_sort_key = function (a, b)
	return a.sort_key < b.sort_key
end
