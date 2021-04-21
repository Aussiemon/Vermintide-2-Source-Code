StoreBundleLayouts = {
	test_bundle_1016 = {
		{
			id = "slayer_hat_1002",
			type = "item"
		},
		{
			id = "unchained_hat_1003",
			type = "item"
		},
		{
			id = "slayer_hat_1002",
			type = "item"
		}
	},
	mercenary_bundle_0001 = {
		{
			id = "dlc_feature_1",
			type = "big_image",
			settings = {
				text = "",
				texture_path = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_shade",
				localize = false,
				texture_package = "resource_packages/store/bundle_icons/store_item_icon_shade_bundle_0001",
				image_size = {
					800,
					592
				}
			}
		},
		{
			type = "spacing"
		},
		{
			type = "divider_horizontal"
		},
		{
			type = "spacing"
		},
		{
			type = "header_text",
			settings = {
				text = "menu_store_dlc_title_including",
				localize = true
			}
		},
		{
			type = "inject_bundle_items"
		},
		{
			type = "body_text",
			settings = {
				text = "mercenary_bundle_01_desc",
				localize = true
			}
		},
		{
			type = "spacing"
		},
		{
			type = "divider_horizontal"
		},
		{
			type = "spacing"
		}
	}
}

return
