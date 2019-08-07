local settings = DLCSettings.belladonna
settings.unit_gib_settings = {
	beastmen_gor = {
		parts = {
			head = {
				gib_push_force = 1,
				parent_scale = 0.01,
				gib_helmet_link_node = "a_helmet",
				gib_unit_template = "dynamic_gib_unit",
				stump_parent_align_node = "j_spine1",
				parent_hide_group = "gib_head",
				gib_parent_align_node = "j_neck_1",
				gib_push_actor = "c_ragdoll",
				stump_unit = "units/beings/enemies/beastmen_gor/gibs/beastmen_gor_stump_head",
				stop_death_sound = true,
				vfx = "fx/impact_blood_maim_beast",
				gib_unit = "units/beings/enemies/beastmen_gor/gibs/beastmen_gor_gib_head",
				stump_link_nodes = {
					"j_spine1",
					"j_neck",
					"j_neck_1",
					"j_leftshoulder",
					"j_rightshoulder"
				},
				parent_link_nodes = {
					"j_spine1",
					"j_neck",
					"j_neck_1",
					"j_leftshoulder",
					"j_rightshoulder"
				},
				parent_destroy_actors = {
					"c_neck",
					"c_head"
				},
				parent_scale_nodes = {
					"j_neck_1_scale"
				},
				ragdoll_destroy_actors = {
					"j_head",
					"j_neck"
				},
				disable_gibs = {
					"upperbody"
				}
			},
			left_arm = {
				stump_unit = "units/beings/enemies/beastmen_gor/gibs/beastmen_gor_stump_l_arm",
				gib_unit = "units/beings/enemies/beastmen_gor/gibs/beastmen_gor_gib_l_arm",
				parent_scale = 0.01,
				gib_push_force = 1,
				stump_parent_align_node = "j_leftshoulder",
				gib_parent_align_node = "j_leftforearm",
				gib_push_actor = "c_ragdoll",
				vfx = "fx/impact_blood_maim_beast",
				gib_unit_template = "dynamic_gib_unit",
				stump_link_nodes = {
					"j_leftshoulder",
					"j_leftarm"
				},
				parent_link_nodes = {
					"j_leftshoulder",
					"j_leftarm"
				},
				parent_destroy_actors = {
					"c_leftforearm",
					"c_lefthand"
				},
				parent_scale_nodes = {
					"j_leftforearm_scale"
				},
				ragdoll_destroy_actors = {
					"j_leftforearm",
					"j_lefthand"
				},
				disable_gibs = {
					"upperbody"
				}
			},
			left_leg = {
				stump_unit = "units/beings/enemies/beastmen_gor/gibs/beastmen_gor_stump_l_leg",
				gib_unit = "units/beings/enemies/beastmen_gor/gibs/beastmen_gor_gib_l_leg",
				parent_scale = 0.01,
				gib_push_force = 1,
				stump_parent_align_node = "j_hips",
				gib_parent_align_node = "j_leftupleg",
				gib_push_actor = "j_leftupleg",
				vfx = "fx/impact_blood_maim_beast",
				parent_hide_group = "gib_l_leg",
				gib_unit_template = "dynamic_gib_unit",
				stump_link_nodes = {
					"j_hips",
					"j_spine",
					"j_spine_scale",
					"j_leftupleg",
					"j_rightupleg"
				},
				parent_link_nodes = {
					"j_hips",
					"j_spine",
					"j_spine_scale",
					"j_leftupleg",
					"j_rightupleg_scale"
				},
				parent_destroy_actors = {
					"c_leftleg",
					"c_leftfoot"
				},
				parent_scale_nodes = {
					"j_leftupleg_scale"
				},
				ragdoll_destroy_actors = {
					"j_leftleg",
					"j_leftfoot"
				}
			},
			right_arm = {
				stump_unit = "units/beings/enemies/beastmen_gor/gibs/beastmen_gor_stump_r_arm",
				gib_unit = "units/beings/enemies/beastmen_gor/gibs/beastmen_gor_gib_r_arm",
				parent_scale = 0.01,
				gib_push_force = 1,
				stump_parent_align_node = "j_rightshoulder",
				gib_parent_align_node = "j_rightforearm",
				gib_push_actor = "c_ragdoll",
				vfx = "fx/impact_blood_maim_beast",
				gib_unit_template = "dynamic_gib_unit",
				stump_link_nodes = {
					"j_rightshoulder",
					"j_rightarm"
				},
				parent_link_nodes = {
					"j_rightshoulder",
					"j_rightarm"
				},
				parent_destroy_actors = {
					"c_rightforearm",
					"c_righthand"
				},
				parent_scale_nodes = {
					"j_rightforearm_scale"
				},
				ragdoll_destroy_actors = {
					"j_rightforearm",
					"j_righthand"
				},
				disable_gibs = {
					"upperbody"
				}
			},
			right_leg = {
				stump_unit = "units/beings/enemies/beastmen_gor/gibs/beastmen_gor_stump_r_leg",
				gib_unit = "units/beings/enemies/beastmen_gor/gibs/beastmen_gor_gib_r_leg",
				parent_scale = 0.01,
				gib_push_force = 1,
				stump_parent_align_node = "j_hips",
				gib_parent_align_node = "j_rightupleg",
				gib_push_actor = "j_rightupleg",
				vfx = "fx/impact_blood_maim_beast",
				parent_hide_group = "gib_r_leg",
				gib_unit_template = "dynamic_gib_unit",
				stump_link_nodes = {
					"j_hips",
					"j_spine",
					"j_spine_scale",
					"j_leftupleg",
					"j_rightupleg"
				},
				parent_link_nodes = {
					"j_hips",
					"j_spine",
					"j_spine_scale",
					"j_leftupleg_scale",
					"j_rightupleg"
				},
				parent_destroy_actors = {
					"c_rightleg",
					"c_rightfoot"
				},
				parent_scale_nodes = {
					"j_rightupleg_scale"
				},
				ragdoll_destroy_actors = {
					"j_rightleg",
					"j_rightfoot"
				}
			},
			upperbody = {
				gib_push_actor = "j_spine1",
				parent_scale = 0.01,
				gib_helmet_link_node = "a_helmet",
				gib_unit_template = "dynamic_gib_unit",
				stump_parent_align_node = "j_hips",
				gib_parent_align_node = "j_spine",
				parent_hide_group = "gib_upper_body",
				stump_unit = "units/beings/enemies/beastmen_gor/gibs/beastmen_gor_stump_upper_body",
				gib_push_force = 3.5,
				vfx = "fx/impact_blood_maim_beast",
				gib_unit = "units/beings/enemies/beastmen_gor/gibs/beastmen_gor_gib_upper_body",
				stump_link_nodes = {
					"j_hips",
					"j_spine",
					"j_leftupleg_scale",
					"j_rightupleg_scale"
				},
				parent_link_nodes = {
					"j_hips",
					"j_spine",
					"j_leftupleg_scale",
					"j_rightupleg_scale"
				},
				parent_destroy_actors = {
					"c_leftarm",
					"c_leftforearm",
					"c_lefthand",
					"c_rightarm",
					"c_rightforearm",
					"c_righthand",
					"c_spine1",
					"c_neck",
					"c_head"
				},
				parent_scale_nodes = {
					"j_spine_scale"
				},
				ragdoll_destroy_actors = {
					"j_leftshoulder",
					"j_leftarm",
					"j_leftforearm",
					"j_lefthand",
					"j_rightshoulder",
					"j_rightarm",
					"j_rightforearm",
					"j_righthand",
					"j_spine1",
					"j_neck",
					"j_head"
				},
				disable_gibs = {
					"head",
					"left_arm",
					"right_arm"
				}
			}
		},
		explode = {
			vfx_align_node = "root_point",
			vfx = "fx/chr_beastmen_dismembered",
			push_force_multiplier = 3,
			part_combos = {
				{
					"upperbody",
					"right_leg"
				},
				{
					"left_arm",
					"left_leg"
				},
				{
					"right_arm",
					"right_leg"
				},
				{
					"upperbody",
					"left_leg"
				},
				{
					"head",
					"left_arm",
					"right_leg"
				},
				{
					"head",
					"right_arm",
					"left_leg"
				},
				{
					"head",
					"right_arm",
					"left_arm"
				},
				{
					"head",
					"right_arm",
					"left_arm",
					"right_leg",
					"left_leg"
				},
				{
					"right_arm",
					"left_arm",
					"right_leg",
					"left_leg"
				},
				{
					"upperbody",
					"left_leg",
					"right_leg"
				}
			}
		}
	},
	beastmen_ungor = {
		parts = {
			head = {
				gib_push_force = 1,
				parent_scale = 0.01,
				stump_unit = "units/beings/enemies/beastmen_ungor/gibs/beastmen_ungor_stump_neck",
				stump_parent_align_node = "j_spine1",
				gib_parent_align_node = "j_neck",
				gib_push_actor = "c_gib",
				stop_death_sound = true,
				send_outfit_event = "hide_head",
				vfx = "fx/impact_blood_maim_beast",
				gib_unit = "units/beings/enemies/beastmen_ungor/gibs/beastmen_ungor_gib_neck",
				gib_unit_template = "dynamic_gib_unit",
				stump_link_nodes = {
					"j_spine1",
					"j_neck",
					"j_leftshoulder",
					"j_rightshoulder",
					"j_leftarm",
					"j_rightarm"
				},
				parent_link_nodes = {
					"j_spine1",
					"j_neck",
					"j_leftshoulder",
					"j_rightshoulder",
					"j_leftarm",
					"j_rightarm"
				},
				parent_destroy_actors = {
					"c_neck",
					"c_head"
				},
				parent_scale_nodes = {
					"j_neck_scale"
				},
				ragdoll_destroy_actors = {
					"j_head",
					"j_neck_1",
					"j_neck"
				},
				disable_gibs = {
					"upperbody"
				}
			},
			left_arm = {
				stump_unit = "units/beings/enemies/beastmen_ungor/gibs/beastmen_ungor_stump_l_arm",
				gib_unit = "units/beings/enemies/beastmen_ungor/gibs/beastmen_ungor_gib_l_arm",
				parent_scale = 0.01,
				gib_push_force = 1.5,
				stump_parent_align_node = "j_spine1",
				gib_parent_align_node = "j_leftarm",
				gib_push_actor = "c_gib",
				vfx = "fx/impact_blood_maim_beast",
				gib_unit_template = "dynamic_gib_unit",
				stump_link_nodes = {
					"j_spine1",
					"j_leftshoulder",
					"j_leftarm"
				},
				parent_link_nodes = {
					"j_spine1",
					"j_leftshoulder",
					"j_leftarm"
				},
				parent_destroy_actors = {
					"c_leftarm",
					"c_leftforearm",
					"c_lefthand"
				},
				parent_scale_nodes = {
					"j_leftarm_scale"
				},
				ragdoll_destroy_actors = {
					"j_leftforearm",
					"j_lefthand"
				},
				disable_gibs = {
					"upperbody"
				}
			},
			left_leg = {
				stump_unit = "units/beings/enemies/beastmen_ungor/gibs/beastmen_ungor_stump_l_leg",
				gib_unit = "units/beings/enemies/beastmen_ungor/gibs/beastmen_ungor_gib_l_leg",
				parent_scale = 0.01,
				gib_push_force = 1.5,
				stump_parent_align_node = "j_hips",
				gib_parent_align_node = "j_leftupleg",
				gib_push_actor = "c_gib",
				vfx = "fx/impact_blood_maim_beast",
				gib_unit_template = "dynamic_gib_unit",
				stump_link_nodes = {
					"j_hips",
					"j_leftupleg"
				},
				parent_link_nodes = {
					"j_hips",
					"j_leftupleg"
				},
				parent_destroy_actors = {
					"c_leftleg",
					"c_leftfoot"
				},
				parent_scale_nodes = {
					"j_leftupleg_scale"
				},
				ragdoll_destroy_actors = {
					"j_leftleg",
					"j_leftfoot"
				}
			},
			right_arm = {
				stump_unit = "units/beings/enemies/beastmen_ungor/gibs/beastmen_ungor_stump_r_arm",
				gib_unit = "units/beings/enemies/beastmen_ungor/gibs/beastmen_ungor_gib_r_arm",
				parent_scale = 0.01,
				gib_push_force = 1.5,
				stump_parent_align_node = "j_spine1",
				gib_parent_align_node = "j_rightarm",
				gib_push_actor = "c_gib",
				vfx = "fx/impact_blood_maim_beast",
				gib_unit_template = "dynamic_gib_unit",
				stump_link_nodes = {
					"j_spine1",
					"j_rightshoulder",
					"j_rightarm"
				},
				parent_link_nodes = {
					"j_spine1",
					"j_rightshoulder",
					"j_rightarm"
				},
				parent_destroy_actors = {
					"c_rightarm",
					"c_rightforearm",
					"c_righthand"
				},
				parent_scale_nodes = {
					"j_rightarm_scale"
				},
				ragdoll_destroy_actors = {
					"j_rightforearm",
					"j_righthand"
				},
				disable_gibs = {
					"upperbody"
				}
			},
			right_leg = {
				stump_unit = "units/beings/enemies/beastmen_ungor/gibs/beastmen_ungor_stump_r_leg",
				gib_unit = "units/beings/enemies/beastmen_ungor/gibs/beastmen_ungor_gib_r_leg",
				parent_scale = 0.01,
				gib_push_force = 1.5,
				stump_parent_align_node = "j_hips",
				gib_parent_align_node = "j_rightupleg",
				gib_push_actor = "c_gib",
				vfx = "fx/impact_blood_maim_beast",
				gib_unit_template = "dynamic_gib_unit",
				stump_link_nodes = {
					"j_hips",
					"j_rightupleg"
				},
				parent_link_nodes = {
					"j_hips",
					"j_rightupleg"
				},
				parent_destroy_actors = {
					"c_rightleg",
					"c_rightfoot"
				},
				parent_scale_nodes = {
					"j_rightupleg_scale"
				},
				ragdoll_destroy_actors = {
					"j_rightleg",
					"j_rightfoot"
				}
			},
			upperbody = {
				gib_push_actor = "j_spine1",
				parent_scale = 0.01,
				stump_unit = "units/beings/enemies/beastmen_ungor/gibs/beastmen_ungor_stump_upperbody",
				stump_parent_align_node = "j_hips",
				gib_parent_align_node = "j_spine1",
				parent_hide_group = "vg_upperbody",
				gib_push_force = 2.5,
				send_outfit_event = "hide_upper",
				vfx = "fx/impact_blood_maim_beast",
				gib_unit = "units/beings/enemies/beastmen_ungor/gibs/beastmen_ungor_gib_upperbody",
				gib_unit_template = "dynamic_gib_unit",
				stump_link_nodes = {
					"j_hips",
					"j_spine"
				},
				parent_link_nodes = {
					"j_hips",
					"j_spine"
				},
				parent_destroy_actors = {
					"c_leftarm",
					"c_leftforearm",
					"c_lefthand",
					"c_rightarm",
					"c_rightforearm",
					"c_righthand",
					"c_spine2",
					"c_neck",
					"c_head"
				},
				parent_scale_nodes = {
					"j_spine1_scale"
				},
				ragdoll_destroy_actors = {
					"j_leftshoulder",
					"j_leftarm",
					"j_leftforearm",
					"j_lefthand",
					"j_rightshoulder",
					"j_rightarm",
					"j_rightforearm",
					"j_righthand",
					"j_spine1",
					"j_neck",
					"j_neck_1",
					"j_head"
				},
				disable_gibs = {
					"head",
					"left_arm",
					"right_arm"
				}
			}
		},
		explode = {
			vfx_align_node = "root_point",
			vfx = "fx/chr_beastmen_dismembered",
			push_force_multiplier = 3,
			part_combos = {
				{
					"upperbody",
					"right_leg"
				},
				{
					"right_arm",
					"left_leg"
				},
				{
					"left_arm",
					"right_leg"
				},
				{
					"upperbody",
					"left_leg"
				},
				{
					"head",
					"left_arm",
					"right_leg"
				},
				{
					"head",
					"right_arm",
					"left_leg"
				},
				{
					"head",
					"right_arm",
					"left_arm"
				},
				{
					"head",
					"right_arm",
					"left_arm",
					"right_leg",
					"left_leg"
				},
				{
					"right_arm",
					"left_arm",
					"right_leg",
					"left_leg"
				},
				{
					"upperbody",
					"left_leg",
					"right_leg"
				}
			}
		}
	}
}
settings.unit_gib_settings.beastmen_ungor_archer = table.create_copy(settings.unit_gib_settings.beastmen_ungor_archer, settings.unit_gib_settings.beastmen_ungor)
settings.unit_gib_settings.beastmen_bestigor = table.create_copy(settings.unit_gib_settings.beastmen_bestigor, settings.unit_gib_settings.beastmen_gor)
settings.unit_gib_settings.beastmen_bestigor.parts.head.gib_unit = "units/beings/enemies/beastmen_bestigor/gibs/beastmen_bestigor_gib_head"
settings.unit_gib_settings.beastmen_bestigor.parts.left_arm.gib_unit = "units/beings/enemies/beastmen_bestigor/gibs/beastmen_bestigor_gib_l_arm"
settings.unit_gib_settings.beastmen_bestigor.parts.left_leg.gib_unit = "units/beings/enemies/beastmen_bestigor/gibs/beastmen_bestigor_gib_l_leg"
settings.unit_gib_settings.beastmen_bestigor.parts.right_arm.gib_unit = "units/beings/enemies/beastmen_bestigor/gibs/beastmen_bestigor_gib_r_arm"
settings.unit_gib_settings.beastmen_bestigor.parts.right_leg.gib_unit = "units/beings/enemies/beastmen_bestigor/gibs/beastmen_bestigor_gib_r_leg"
settings.unit_gib_settings.beastmen_standard_bearer = table.create_copy(settings.unit_gib_settings.beastmen_standard_bearer, settings.unit_gib_settings.beastmen_gor)
settings.unit_gib_settings.beastmen_standard_bearer.parts.left_arm.gib_unit = "units/beings/enemies/beastmen_standard_bearer/gibs/beastmen_standard_bearer_gib_l_arm"
settings.unit_gib_settings.beastmen_standard_bearer.parts.left_leg.gib_unit = "units/beings/enemies/beastmen_bestigor/gibs/beastmen_bestigor_gib_l_leg"
settings.unit_gib_settings.beastmen_standard_bearer.parts.right_arm.gib_unit = "units/beings/enemies/beastmen_standard_bearer/gibs/beastmen_standard_bearer_gib_r_arm"
settings.unit_gib_settings.beastmen_standard_bearer.parts.right_leg.gib_unit = "units/beings/enemies/beastmen_bestigor/gibs/beastmen_bestigor_gib_r_leg"
settings.unit_gib_settings.beastmen_standard_bearer.parts.upperbody.gib_unit = "units/beings/enemies/beastmen_standard_bearer/gibs/beastmen_standard_bearer_gib_upper_body"

return
