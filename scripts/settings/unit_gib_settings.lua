require("foundation/scripts/util/table")

UnitGibSettings = {
	skaven_clan_rat = {
		parts = {
			head = {
				stump_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_clanrat_stump_head",
				gib_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_clanrat_gib_head",
				parent_scale = 0.01,
				gib_push_force = 1,
				stump_parent_align_node = "j_neck",
				gib_parent_align_node = "j_neck_1",
				gib_push_actor = "c_gib_head",
				vfx = "fx/impact_blood_maim",
				parent_hide_group = "head_hood",
				gib_unit_template = "dynamic_gib_unit",
				stop_death_sound = true,
				stump_link_nodes = {
					"j_spine1",
					"j_neck"
				},
				parent_link_nodes = {
					"j_spine1",
					"j_neck"
				},
				parent_destroy_actors = {
					"c_neck",
					"c_head"
				},
				parent_scale_nodes = {
					"j_neck_1"
				},
				ragdoll_destroy_actors = {
					"j_head",
					"j_neck_1",
					"j_neck"
				}
			},
			left_arm = {
				stump_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_clanrat_stump_left_arm",
				gib_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_clanrat_gib_left_arm",
				parent_scale = 0.01,
				gib_push_force = 1.5,
				stump_parent_align_node = "j_leftshoulder",
				gib_parent_align_node = "j_leftarm",
				gib_push_actor = "j_leftarm",
				vfx = "fx/impact_blood_maim",
				gib_unit_template = "dynamic_gib_unit",
				stump_link_nodes = {
					"j_spine",
					"j_spine1",
					"j_leftshoulder",
					"j_leftarm"
				},
				parent_link_nodes = {
					"j_spine",
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
					"j_leftarm",
					"j_leftforearm",
					"j_lefthand"
				}
			},
			left_leg = {
				stump_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_clanrat_stump_left_leg",
				gib_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_clanrat_gib_left_leg",
				parent_scale = 0.01,
				gib_push_force = 1.5,
				stump_parent_align_node = "j_hips",
				gib_parent_align_node = "j_leftupleg",
				gib_push_actor = "j_leftupleg",
				vfx = "fx/impact_blood_maim",
				gib_unit_template = "dynamic_gib_unit",
				stump_link_nodes = {
					"j_hips",
					"j_spine",
					"j_tail1",
					"j_rightupleg",
					"j_leftupleg"
				},
				parent_link_nodes = {
					"j_hips",
					"j_spine",
					"j_tail1",
					"j_rightupleg",
					"j_leftupleg"
				},
				parent_destroy_actors = {
					"c_leftupleg",
					"c_leftleg",
					"c_leftfoot",
					"c_lefttoebase"
				},
				parent_scale_nodes = {
					"j_leftupleg_scale"
				},
				ragdoll_destroy_actors = {
					"j_leftupleg",
					"j_leftleg",
					"j_leftfoot",
					"j_lefttoebase"
				}
			},
			right_arm = {
				stump_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_clanrat_stump_right_arm",
				gib_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_clanrat_gib_right_arm",
				parent_scale = 0.01,
				gib_push_force = 1.5,
				stump_parent_align_node = "j_rightshoulder",
				gib_parent_align_node = "j_rightarm",
				gib_push_actor = "j_rightarm",
				vfx = "fx/impact_blood_maim",
				gib_unit_template = "dynamic_gib_unit",
				stump_link_nodes = {
					"j_spine",
					"j_spine1",
					"j_rightshoulder",
					"j_rightarm"
				},
				parent_link_nodes = {
					"j_spine",
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
					"j_rightarm",
					"j_rightforearm",
					"j_righthand"
				}
			},
			right_leg = {
				stump_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_clanrat_stump_right_leg",
				gib_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_clanrat_gib_right_leg",
				parent_scale = 0.01,
				gib_push_force = 1.5,
				stump_parent_align_node = "j_hips",
				gib_parent_align_node = "j_rightupleg",
				gib_push_actor = "j_rightupleg",
				vfx = "fx/impact_blood_maim",
				gib_unit_template = "dynamic_gib_unit",
				stump_link_nodes = {
					"j_hips",
					"j_spine",
					"j_leftupleg",
					"j_tail1",
					"j_rightupleg"
				},
				parent_link_nodes = {
					"j_hips",
					"j_spine",
					"j_leftupleg",
					"j_tail1",
					"j_rightupleg"
				},
				parent_destroy_actors = {
					"c_rightupleg",
					"c_rightleg",
					"c_rightfoot",
					"c_righttoebase"
				},
				parent_scale_nodes = {
					"j_rightupleg_scale"
				},
				ragdoll_destroy_actors = {
					"j_rightupleg",
					"j_rightleg",
					"j_rightfoot",
					"j_righttoebase"
				}
			},
			tail = {
				stump_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_clanrat_stump_tail",
				gib_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_clanrat_gib_tail",
				parent_scale = 0.01,
				gib_push_force = 2,
				stump_parent_align_node = "j_hips",
				gib_parent_align_node = "j_tail1",
				gib_push_actor = "j_tail1",
				vfx = "fx/impact_blood_wound_02",
				gib_unit_template = "dynamic_gib_unit",
				stump_link_nodes = {
					"j_hips",
					"j_spine",
					"j_leftupleg",
					"j_rightupleg"
				},
				parent_link_nodes = {
					"j_hips",
					"j_spine",
					"j_leftupleg",
					"j_rightupleg"
				},
				parent_destroy_actors = {
					"c_tail1",
					"c_tail2",
					"c_tail3",
					"c_tail4",
					"c_tail5",
					"c_tail6"
				},
				parent_scale_nodes = {
					"j_tail1_scale"
				},
				ragdoll_destroy_actors = {
					"j_tail1",
					"j_tail2",
					"j_tail3",
					"j_tail4",
					"j_tail5",
					"j_tail6"
				}
			},
			upperbody = {
				stump_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_clanrat_stump_upperbody",
				gib_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_clanrat_gib_upperbody",
				parent_scale = 0.01,
				gib_push_force = 4,
				stump_parent_align_node = "j_hips",
				gib_parent_align_node = "j_spine",
				gib_push_actor = "j_spine",
				vfx = "fx/impact_blood_maim",
				gib_unit_template = "dynamic_gib_unit",
				stump_link_nodes = {
					"j_hips",
					"j_leftupleg",
					"j_tail1",
					"j_rightupleg"
				},
				parent_link_nodes = {
					"j_hips",
					"j_leftupleg",
					"j_tail1",
					"j_rightupleg"
				},
				parent_destroy_actors = {
					"c_leftarm",
					"c_leftforearm",
					"c_lefthand",
					"c_rightarm",
					"c_rightforearm",
					"c_righthand",
					"c_spine",
					"c_spine2",
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
					"j_spine",
					"j_spine1",
					"j_neck",
					"j_neck_1",
					"j_head"
				}
			}
		},
		explode = {
			vfx_align_node = "root_point",
			vfx = "fx/chr_skaven_dismembered",
			part_combos = {
				{
					"head",
					"right_leg"
				},
				{
					"head",
					"left_leg"
				},
				{
					"upperbody",
					"right_leg",
					"tail"
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
					"left_arm"
				},
				{
					"head",
					"right_arm",
					"tail"
				},
				{
					"upperbody"
				},
				{
					"right_arm",
					"left_arm"
				},
				{
					"right_leg",
					"left_leg"
				},
				{
					"right_arm",
					"left_arm",
					"right_leg",
					"left_leg"
				}
			}
		}
	}
}
UnitGibSettings.skaven_clan_rat_with_shield = table.create_copy(UnitGibSettings.skaven_clan_rat_with_shield, UnitGibSettings.skaven_clan_rat)
UnitGibSettings.skaven_loot_rat = table.create_copy(UnitGibSettings.skaven_loot_rat, UnitGibSettings.skaven_clan_rat)
UnitGibSettings.skaven_clan_rat_baked = table.create_copy(UnitGibSettings.skaven_clan_rat_baked, UnitGibSettings.skaven_clan_rat)
UnitGibSettings.skaven_clan_rat_with_shield_baked = table.create_copy(UnitGibSettings.skaven_clan_rat_with_shield_baked, UnitGibSettings.skaven_clan_rat_baked)
UnitGibSettings.skaven_slave = {
	parts = {
		head = {
			stump_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_slave_stump_head",
			gib_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_slave_gib_head",
			parent_scale = 0.01,
			gib_push_force = 0.75,
			stump_parent_align_node = "j_neck",
			gib_parent_align_node = "j_neck_1",
			gib_push_actor = "c_gib_head",
			vfx = "fx/impact_blood_maim",
			stop_death_sound = true,
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_spine1",
				"j_neck"
			},
			parent_link_nodes = {
				"j_spine1",
				"j_neck"
			},
			parent_destroy_actors = {
				"c_neck",
				"c_head"
			},
			parent_scale_nodes = {
				"j_neck_1"
			},
			ragdoll_destroy_actors = {
				"j_head",
				"j_neck_1",
				"j_neck"
			}
		},
		left_arm = {
			stump_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_slave_stump_left_arm",
			gib_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_slave_gib_left_arm",
			parent_scale = 0.01,
			gib_push_force = 1.5,
			stump_parent_align_node = "j_leftshoulder",
			gib_parent_align_node = "j_leftarm",
			gib_push_actor = "j_leftarm",
			vfx = "fx/impact_blood_maim",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_spine",
				"j_spine1",
				"j_leftshoulder",
				"j_leftarm"
			},
			parent_link_nodes = {
				"j_spine",
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
				"j_leftarm",
				"j_leftforearm",
				"j_lefthand"
			}
		},
		left_leg = {
			stump_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_slave_stump_left_leg",
			gib_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_slave_gib_left_leg",
			parent_scale = 0.01,
			gib_push_force = 1.5,
			stump_parent_align_node = "j_hips",
			gib_parent_align_node = "j_leftupleg",
			gib_push_actor = "j_leftupleg",
			vfx = "fx/impact_blood_maim",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_hips",
				"j_spine",
				"j_tail1",
				"j_rightupleg",
				"j_leftupleg"
			},
			parent_link_nodes = {
				"j_hips",
				"j_spine",
				"j_tail1",
				"j_rightupleg",
				"j_leftupleg"
			},
			parent_destroy_actors = {
				"c_leftupleg",
				"c_leftleg",
				"c_leftfoot",
				"c_lefttoebase"
			},
			parent_scale_nodes = {
				"j_leftupleg_scale"
			},
			ragdoll_destroy_actors = {
				"j_leftupleg",
				"j_leftleg",
				"j_leftfoot",
				"j_lefttoebase"
			}
		},
		right_arm = {
			stump_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_slave_stump_right_arm",
			gib_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_slave_gib_right_arm",
			parent_scale = 0.01,
			gib_push_force = 1.5,
			stump_parent_align_node = "j_rightshoulder",
			gib_parent_align_node = "j_rightarm",
			gib_push_actor = "j_rightarm",
			vfx = "fx/impact_blood_maim",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_spine",
				"j_spine1",
				"j_rightshoulder",
				"j_rightarm"
			},
			parent_link_nodes = {
				"j_spine",
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
				"j_rightarm",
				"j_rightforearm",
				"j_righthand"
			}
		},
		right_leg = {
			stump_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_slave_stump_right_leg",
			gib_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_slave_gib_right_leg",
			parent_scale = 0.01,
			gib_push_force = 1.5,
			stump_parent_align_node = "j_hips",
			gib_parent_align_node = "j_rightupleg",
			gib_push_actor = "j_rightupleg",
			vfx = "fx/impact_blood_maim",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_hips",
				"j_spine",
				"j_leftupleg",
				"j_tail1",
				"j_rightupleg"
			},
			parent_link_nodes = {
				"j_hips",
				"j_spine",
				"j_leftupleg",
				"j_tail1",
				"j_rightupleg"
			},
			parent_destroy_actors = {
				"c_rightupleg",
				"c_rightleg",
				"c_rightfoot",
				"c_righttoebase"
			},
			parent_scale_nodes = {
				"j_rightupleg_scale"
			},
			ragdoll_destroy_actors = {
				"j_rightupleg",
				"j_rightleg",
				"j_rightfoot",
				"j_righttoebase"
			}
		},
		tail = {
			stump_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_slave_stump_tail",
			gib_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_slave_gib_tail",
			parent_scale = 0.01,
			gib_push_force = 2,
			stump_parent_align_node = "j_hips",
			gib_parent_align_node = "j_tail1",
			gib_push_actor = "j_tail1",
			vfx = "fx/impact_blood_wound_02",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_hips",
				"j_spine",
				"j_leftupleg",
				"j_rightupleg"
			},
			parent_link_nodes = {
				"j_hips",
				"j_spine",
				"j_leftupleg",
				"j_rightupleg"
			},
			parent_destroy_actors = {
				"c_tail1",
				"c_tail2",
				"c_tail3",
				"c_tail4",
				"c_tail5",
				"c_tail6"
			},
			parent_scale_nodes = {
				"j_tail1_scale"
			},
			ragdoll_destroy_actors = {
				"j_tail1",
				"j_tail2",
				"j_tail3",
				"j_tail4",
				"j_tail5",
				"j_tail6"
			}
		},
		upperbody = {
			stump_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_slave_stump_upperbody",
			gib_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_slave_gib_upperbody",
			parent_scale = 0.01,
			gib_push_force = 3,
			stump_parent_align_node = "j_hips",
			gib_parent_align_node = "j_spine",
			gib_push_actor = "j_spine",
			vfx = "fx/impact_blood_maim",
			parent_hide_group = "dismember_torso",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_hips",
				"j_leftupleg",
				"j_tail1",
				"j_rightupleg"
			},
			parent_link_nodes = {
				"j_hips",
				"j_leftupleg",
				"j_tail1",
				"j_rightupleg"
			},
			parent_destroy_actors = {
				"c_leftarm",
				"c_leftforearm",
				"c_lefthand",
				"c_rightarm",
				"c_rightforearm",
				"c_righthand",
				"c_spine",
				"c_spine2",
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
				"j_spine",
				"j_spine1",
				"j_neck",
				"j_neck_1",
				"j_head"
			}
		},
		upperbody_right = {
			stump_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_slave_stump_upperbody_right",
			gib_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_slave_gib_upperbody_right",
			parent_scale = 0.01,
			gib_push_force = 1.5,
			stump_parent_align_node = "j_hips",
			gib_parent_align_node = "j_spine1",
			gib_push_actor = "j_spine1",
			vfx = "fx/impact_blood_maim",
			parent_hide_group = "dismember_torso",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_hips",
				"j_spine",
				"j_spine1",
				"j_leftshoulder",
				"j_leftarm",
				"j_leftforearm",
				"j_lefthand"
			},
			parent_link_nodes = {
				"j_hips",
				"j_spine",
				"j_spine1",
				"j_leftshoulder",
				"j_leftarm",
				"j_leftforearm",
				"j_lefthand"
			},
			parent_destroy_actors = {
				"c_rightarm",
				"c_rightforearm",
				"c_righthand",
				"c_neck",
				"c_head"
			},
			parent_scale_nodes = {
				"j_neck",
				"j_rightshoulder"
			},
			ragdoll_destroy_actors = {
				"j_rightshoulder",
				"j_rightarm",
				"j_rightforearm",
				"j_righthand",
				"j_neck",
				"j_neck_1",
				"j_head"
			}
		},
		upperbody_left = {
			stump_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_slave_stump_upperbody_left",
			gib_unit = "units/beings/enemies/skaven_clan_rat/gibs/skaven_slave_gib_upperbody_left",
			parent_scale = 0.01,
			gib_push_force = 1.5,
			stump_parent_align_node = "j_hips",
			gib_parent_align_node = "j_spine1",
			gib_push_actor = "j_spine1",
			vfx = "fx/impact_blood_maim",
			parent_hide_group = "dismember_torso",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_hips",
				"j_spine",
				"j_spine1",
				"j_rightshoulder",
				"j_rightarm",
				"j_rightforearm",
				"j_righthand"
			},
			parent_link_nodes = {
				"j_hips",
				"j_spine",
				"j_spine1",
				"j_rightshoulder",
				"j_rightarm",
				"j_rightforearm",
				"j_righthand"
			},
			parent_destroy_actors = {
				"c_leftarm",
				"c_leftforearm",
				"c_lefthand",
				"c_neck",
				"c_head"
			},
			parent_scale_nodes = {
				"j_neck",
				"j_leftshoulder"
			},
			ragdoll_destroy_actors = {
				"j_leftshoulder",
				"j_leftarm",
				"j_leftforearm",
				"j_lefthand",
				"j_neck",
				"j_neck_1",
				"j_head"
			}
		}
	},
	explode = {
		vfx_align_node = "root_point",
		vfx = "fx/chr_skaven_dismembered",
		part_combos = {
			{
				"head",
				"right_leg"
			},
			{
				"head",
				"left_leg"
			},
			{
				"upperbody_left",
				"right_leg",
				"tail"
			},
			{
				"upperbody_left",
				"right_arm"
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
				"upperbody_right",
				"left_leg"
			},
			{
				"upperbody_right",
				"left_arm"
			},
			{
				"head",
				"left_arm"
			},
			{
				"head",
				"right_arm",
				"tail"
			},
			{
				"upperbody",
				"tail"
			},
			{
				"right_arm",
				"left_arm"
			},
			{
				"right_leg",
				"left_leg"
			},
			{
				"upperbody"
			}
		}
	}
}
UnitGibSettings.skaven_slave_baked = table.create_copy(UnitGibSettings.skaven_slave_baked, UnitGibSettings.skaven_slave)
UnitGibSettings.skaven_storm_vermin = {
	parts = {
		head = {
			stump_unit = "units/beings/enemies/skaven_stormvermin/gibs/skaven_stormvermin_stump_head",
			gib_unit = "units/beings/enemies/skaven_stormvermin/gibs/skaven_stormvermin_gib_head",
			parent_scale = 0.01,
			gib_push_force = 1,
			stump_parent_align_node = "j_neck",
			gib_parent_align_node = "j_neck_1",
			gib_push_actor = "c_gib_head",
			vfx = "fx/impact_blood_maim",
			stop_death_sound = true,
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_spine1",
				"j_neck"
			},
			parent_link_nodes = {
				"j_spine1",
				"j_neck"
			},
			parent_destroy_actors = {
				"c_neck",
				"c_head"
			},
			parent_scale_nodes = {
				"j_neck_1"
			},
			ragdoll_destroy_actors = {
				"j_head",
				"j_neck_1",
				"j_neck"
			}
		},
		left_arm = {
			stump_unit = "units/beings/enemies/skaven_stormvermin/gibs/skaven_stormvermin_stump_left_arm",
			gib_unit = "units/beings/enemies/skaven_stormvermin/gibs/skaven_stormvermin_gib_left_arm",
			parent_scale = 0.01,
			gib_push_force = 1.5,
			stump_parent_align_node = "j_leftshoulder",
			gib_parent_align_node = "j_leftarm",
			gib_push_actor = "j_leftarm",
			vfx = "fx/impact_blood_maim",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_spine",
				"j_spine1",
				"j_leftshoulder"
			},
			parent_link_nodes = {
				"j_spine",
				"j_spine1",
				"j_leftshoulder"
			},
			parent_destroy_actors = {
				"c_leftarm",
				"c_leftforearm",
				"c_lefthand"
			},
			parent_scale_nodes = {
				"j_leftarm"
			},
			ragdoll_destroy_actors = {
				"j_leftarm",
				"j_leftforearm",
				"j_lefthand"
			}
		},
		left_leg = {
			stump_unit = "units/beings/enemies/skaven_stormvermin/gibs/skaven_stormvermin_stump_left_leg",
			gib_unit = "units/beings/enemies/skaven_stormvermin/gibs/skaven_stormvermin_gib_left_leg",
			parent_scale = 0.01,
			gib_push_force = 1.5,
			stump_parent_align_node = "j_hips",
			gib_parent_align_node = "j_leftupleg",
			gib_push_actor = "j_leftleg",
			vfx = "fx/impact_blood_maim",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_leftupleg"
			},
			parent_link_nodes = {
				"j_leftupleg"
			},
			parent_destroy_actors = {
				"c_leftleg",
				"c_leftfoot",
				"c_lefttoebase"
			},
			parent_scale_nodes = {
				"j_leftleg"
			},
			ragdoll_destroy_actors = {
				"j_leftleg",
				"j_leftfoot",
				"j_lefttoebase"
			}
		},
		right_arm = {
			stump_unit = "units/beings/enemies/skaven_stormvermin/gibs/skaven_stormvermin_stump_right_arm",
			gib_unit = "units/beings/enemies/skaven_stormvermin/gibs/skaven_stormvermin_gib_right_arm",
			parent_scale = 0.01,
			gib_push_force = 1.5,
			stump_parent_align_node = "j_rightshoulder",
			gib_parent_align_node = "j_rightarm",
			gib_push_actor = "j_rightarm",
			vfx = "fx/impact_blood_maim",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_spine",
				"j_spine1",
				"j_rightshoulder"
			},
			parent_link_nodes = {
				"j_spine",
				"j_spine1",
				"j_rightshoulder"
			},
			parent_destroy_actors = {
				"c_rightarm",
				"c_rightforearm",
				"c_righthand"
			},
			parent_scale_nodes = {
				"j_rightarm"
			},
			ragdoll_destroy_actors = {
				"j_rightarm",
				"j_rightforearm",
				"j_righthand"
			}
		},
		right_leg = {
			stump_unit = "units/beings/enemies/skaven_stormvermin/gibs/skaven_stormvermin_stump_right_leg",
			gib_unit = "units/beings/enemies/skaven_stormvermin/gibs/skaven_stormvermin_gib_right_leg",
			parent_scale = 0.01,
			gib_push_force = 1.5,
			stump_parent_align_node = "j_hips",
			gib_parent_align_node = "j_rightupleg",
			gib_push_actor = "j_rightleg",
			vfx = "fx/impact_blood_maim",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_rightupleg"
			},
			parent_link_nodes = {
				"j_rightupleg"
			},
			parent_destroy_actors = {
				"c_rightleg",
				"c_rightfoot",
				"c_righttoebase"
			},
			parent_scale_nodes = {
				"j_rightleg"
			},
			ragdoll_destroy_actors = {
				"j_rightleg",
				"j_rightfoot",
				"j_righttoebase"
			}
		},
		tail = {
			stump_unit = "units/beings/enemies/skaven_stormvermin/gibs/skaven_stormvermin_stump_tail",
			gib_unit = "units/beings/enemies/skaven_stormvermin/gibs/skaven_stormvermin_gib_tail",
			parent_scale = 0.01,
			gib_push_force = 2,
			stump_parent_align_node = "j_hips",
			gib_parent_align_node = "j_tail2",
			gib_push_actor = "j_tail2",
			vfx = "fx/impact_blood_wound_02",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_hips",
				"j_tail1"
			},
			parent_link_nodes = {
				"j_hips",
				"j_tail1"
			},
			parent_destroy_actors = {
				"c_tail2",
				"c_tail3",
				"c_tail4",
				"c_tail5",
				"c_tail6"
			},
			parent_scale_nodes = {
				"j_tail2"
			},
			ragdoll_destroy_actors = {
				"j_tail2",
				"j_tail3",
				"j_tail4",
				"j_tail5",
				"j_tail6"
			}
		},
		upperbody = {
			stump_unit = "units/beings/enemies/skaven_stormvermin/gibs/skaven_stormvermin_stump_upperbody",
			gib_unit = "units/beings/enemies/skaven_stormvermin/gibs/skaven_stormvermin_gib_upperbody",
			parent_scale = 0.01,
			gib_push_force = 4,
			stump_parent_align_node = "j_hips",
			gib_parent_align_node = "j_spine",
			gib_push_actor = "j_spine",
			vfx = "fx/impact_blood_maim",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_hips",
				"j_leftupleg",
				"j_tail1",
				"j_rightupleg"
			},
			parent_link_nodes = {
				"j_hips",
				"j_leftupleg",
				"j_tail1",
				"j_rightupleg"
			},
			parent_destroy_actors = {
				"c_leftarm",
				"c_leftforearm",
				"c_lefthand",
				"c_rightarm",
				"c_rightforearm",
				"c_righthand",
				"c_spine",
				"c_spine2",
				"c_neck",
				"c_head"
			},
			parent_scale_nodes = {
				"j_spine"
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
				"j_spine",
				"j_spine1",
				"j_neck",
				"j_neck_1",
				"j_head"
			}
		}
	},
	explode = {
		vfx_align_node = "root_point",
		vfx = "fx/chr_skaven_dismembered",
		part_combos = {
			{
				"head",
				"right_leg"
			},
			{
				"head",
				"left_leg"
			},
			{
				"upperbody",
				"right_leg",
				"tail"
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
				"left_arm"
			},
			{
				"head",
				"right_arm",
				"tail"
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
				"left_arm"
			},
			{
				"right_leg",
				"left_leg"
			},
			{
				"upperbody",
				"right_leg",
				"left_leg"
			}
		}
	}
}
UnitGibSettings.skaven_storm_vermin_baked = table.create_copy(UnitGibSettings.skaven_storm_vermin_baked, UnitGibSettings.skaven_storm_vermin)
UnitGibSettings.skaven_storm_vermin_commander = table.create_copy(UnitGibSettings.skaven_storm_vermin_commander, UnitGibSettings.skaven_storm_vermin)
UnitGibSettings.skaven_storm_vermin_commander_baked = table.create_copy(UnitGibSettings.skaven_storm_vermin_commander_baked, UnitGibSettings.skaven_storm_vermin)
UnitGibSettings.skaven_storm_vermin_with_shield = table.create_copy(UnitGibSettings.skaven_storm_vermin_with_shield, UnitGibSettings.skaven_storm_vermin)
UnitGibSettings.skaven_storm_vermin_with_shield_baked = table.create_copy(UnitGibSettings.skaven_storm_vermin_with_shield_baked, UnitGibSettings.skaven_storm_vermin)
UnitGibSettings.chaos_marauder = {
	parts = {
		head = {
			gib_unit_template = "dynamic_gib_unit",
			parent_scale = 0,
			gib_helmet_link_node = "a_helmet",
			stump_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_stump_head",
			stump_parent_align_node = "j_spine1",
			stop_death_sound = true,
			gib_parent_align_node = "j_neck",
			pulp_stump_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_stump_head",
			gib_push_actor = "c_ragdoll",
			gib_push_force = 1,
			vfx = "fx/impact_blood_maim_chaos",
			gib_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_gib_head",
			stump_link_nodes = {
				"j_spine1",
				"j_leftshoulder",
				"j_rightshoulder",
				"j_neck"
			},
			parent_link_nodes = {
				"j_spine1",
				"j_leftshoulder",
				"j_rightshoulder",
				"j_neck"
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
				"j_neck"
			}
		},
		left_arm = {
			stump_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_stump_left_arm",
			gib_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_gib_left_arm",
			parent_scale = 0,
			gib_push_force = 1,
			stump_parent_align_node = "j_leftshoulder",
			gib_parent_align_node = "j_leftarm",
			gib_push_actor = "c_ragdoll",
			vfx = "fx/impact_blood_maim_chaos",
			parent_hide_group = "vg_arm_left_1",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_hips",
				"j_spine",
				"j_spine1",
				"j_neck",
				"j_leftshoulder",
				"j_leftarm"
			},
			parent_link_nodes = {
				"j_hips",
				"j_spine",
				"j_spine1",
				"j_neck",
				"j_leftshoulder",
				"j_leftarm"
			},
			parent_destroy_actors = {
				"c_lefthand",
				"c_leftforearm",
				"c_leftarm"
			},
			parent_scale_nodes = {
				"j_leftarm_scale"
			},
			ragdoll_destroy_actors = {
				"j_lefthand",
				"j_leftforearm",
				"j_leftarm"
			}
		},
		left_hand = {
			stump_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_stump_left_hand",
			gib_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_gib_left_hand",
			parent_scale = 0,
			gib_push_force = 0.5,
			stump_parent_align_node = "j_leftforearm",
			gib_parent_align_node = "j_lefthand",
			gib_push_actor = "c_ragdoll",
			vfx = "fx/impact_blood_maim_chaos",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_leftforearm"
			},
			parent_link_nodes = {
				"j_leftforearm"
			},
			parent_destroy_actors = {
				"c_lefthand"
			},
			parent_scale_nodes = {
				"j_lefthand"
			},
			ragdoll_destroy_actors = {
				"j_lefthand"
			}
		},
		left_lowerleg = {
			stump_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_stump_left_lowerleg",
			gib_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_gib_left_lowerleg",
			parent_scale = 0,
			gib_push_force = 0.75,
			stump_parent_align_node = "j_leftupleg",
			gib_parent_align_node = "j_leftleg",
			gib_push_actor = "c_ragdoll",
			vfx = "fx/impact_blood_maim_chaos",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_leftupleg"
			},
			parent_link_nodes = {
				"j_leftupleg"
			},
			parent_destroy_actors = {
				"c_leftfoot",
				"c_leftleg"
			},
			parent_scale_nodes = {
				"j_leftleg"
			},
			ragdoll_destroy_actors = {
				"j_leftfoot",
				"j_leftleg"
			}
		},
		right_arm = {
			stump_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_stump_right_arm",
			gib_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_gib_right_arm",
			parent_scale = 0,
			gib_push_force = 1,
			stump_parent_align_node = "j_rightshoulder",
			gib_parent_align_node = "j_rightarm",
			gib_push_actor = "c_ragdoll",
			vfx = "fx/impact_blood_maim_chaos",
			parent_hide_group = "vg_arm_right_1",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_hips",
				"j_spine",
				"j_spine1",
				"j_neck",
				"j_rightshoulder",
				"j_rightarm"
			},
			parent_link_nodes = {
				"j_hips",
				"j_spine",
				"j_spine1",
				"j_neck",
				"j_rightshoulder",
				"j_rightarm"
			},
			parent_destroy_actors = {
				"c_righthand",
				"c_rightforearm",
				"c_rightarm"
			},
			parent_scale_nodes = {
				"j_rightarm_scale"
			},
			ragdoll_destroy_actors = {
				"j_righthand",
				"j_rightforearm",
				"j_rightarm"
			}
		},
		right_hand = {
			stump_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_stump_right_hand",
			gib_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_gib_right_hand",
			parent_scale = 0,
			gib_push_force = 0.5,
			stump_parent_align_node = "j_rightforearm",
			gib_parent_align_node = "j_righthand",
			gib_push_actor = "c_ragdoll",
			vfx = "fx/impact_blood_maim_chaos",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_rightforearm"
			},
			parent_link_nodes = {
				"j_rightforearm"
			},
			parent_destroy_actors = {
				"c_righthand"
			},
			parent_scale_nodes = {
				"j_righthand"
			},
			ragdoll_destroy_actors = {
				"j_righthand"
			}
		},
		right_lowerleg = {
			stump_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_stump_right_lowerleg",
			gib_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_gib_right_lowerleg",
			parent_scale = 0,
			gib_push_force = 0.75,
			stump_parent_align_node = "j_rightupleg",
			gib_parent_align_node = "j_rightleg",
			gib_push_actor = "c_ragdoll",
			vfx = "fx/impact_blood_maim_chaos",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_rightupleg"
			},
			parent_link_nodes = {
				"j_rightupleg"
			},
			parent_destroy_actors = {
				"c_rightfoot",
				"c_rightleg"
			},
			parent_scale_nodes = {
				"j_rightleg"
			},
			ragdoll_destroy_actors = {
				"j_rightfoot",
				"j_rightleg"
			}
		},
		upperbody = {
			gib_unit_template = "dynamic_gib_unit",
			gib_helmet_link_node = "a_helmet",
			gib_push_force = 2,
			stump_parent_align_node = "j_hips",
			gib_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_gib_upperbody",
			gib_parent_align_node = "j_spine",
			gib_push_actor = "j_spine1",
			parent_scale = 0,
			vfx = "fx/impact_blood_maim_chaos",
			stump_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_stump_upperbody",
			parent_hide_group = "vg_torso",
			stump_link_nodes = {
				"j_hips"
			},
			parent_link_nodes = {
				"j_hips"
			},
			parent_destroy_actors = {
				"c_leftshoulder",
				"c_leftarm",
				"c_leftforearm",
				"c_lefthand",
				"c_rightshoulder",
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
			}
		}
	},
	explode = {
		vfx_align_node = "root_point",
		vfx = "fx/chr_skaven_dismembered",
		part_combos = {
			{
				"head",
				"right_lowerleg"
			},
			{
				"head",
				"left_lowerleg"
			},
			{
				"upperbody",
				"right_lowerleg"
			},
			{
				"left_arm",
				"left_lowerleg"
			},
			{
				"right_arm",
				"right_lowerleg"
			},
			{
				"upperbody",
				"left_lowerleg"
			},
			{
				"head",
				"left_arm"
			},
			{
				"head",
				"right_arm"
			},
			{
				"right_arm",
				"left_arm",
				"right_lowerleg",
				"left_lowerleg"
			},
			{
				"head",
				"right_arm",
				"left_arm",
				"right_lowerleg",
				"left_lowerleg"
			},
			{
				"right_lowerleg",
				"left_lowerleg"
			},
			{
				"right_arm",
				"left_arm"
			}
		}
	}
}
UnitGibSettings.chaos_marauder_baked = table.create_copy(UnitGibSettings.chaos_marauder_baked, UnitGibSettings.chaos_marauder)
UnitGibSettings.chaos_marauder_baked.parts.upperbody.gib_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_gib_upperbody_baked"
UnitGibSettings.chaos_marauder_with_shield = table.create_copy(UnitGibSettings.chaos_marauder_with_shield, UnitGibSettings.chaos_marauder)
UnitGibSettings.chaos_marauder_with_shield_baked = table.create_copy(UnitGibSettings.chaos_marauder_with_shield_baked, UnitGibSettings.chaos_marauder_with_shield)
UnitGibSettings.chaos_marauder_with_shield_baked.parts.upperbody.gib_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_gib_upperbody_baked"
UnitGibSettings.chaos_marauder_tutorial = table.create_copy(UnitGibSettings.chaos_marauder_tutorial, UnitGibSettings.chaos_marauder)
UnitGibSettings.chaos_berzerker = table.create_copy(UnitGibSettings.chaos_berzerker, UnitGibSettings.chaos_marauder)
UnitGibSettings.chaos_berzerker.parts.upperbody.gib_unit = "units/beings/enemies/chaos_berzerker/gibs/chaos_berzerker_gib_upperbody"
UnitGibSettings.chaos_berzerker_baked = table.create_copy(UnitGibSettings.chaos_berzerker_baked, UnitGibSettings.chaos_berzerker)
UnitGibSettings.chaos_raider = {
	parts = {
		left_arm = {
			stump_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_stump_left_arm",
			gib_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_gib_left_arm",
			parent_scale = 0,
			gib_push_force = 1,
			stump_parent_align_node = "j_leftshoulder",
			gib_parent_align_node = "j_leftarm",
			gib_push_actor = "c_ragdoll",
			vfx = "fx/impact_blood_maim_chaos",
			parent_hide_group = "vg_arm_left_1",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_hips",
				"j_spine",
				"j_spine1",
				"j_neck",
				"j_leftshoulder",
				"j_leftarm"
			},
			parent_link_nodes = {
				"j_hips",
				"j_spine",
				"j_spine1",
				"j_neck",
				"j_leftshoulder",
				"j_leftarm"
			},
			parent_destroy_actors = {
				"c_lefthand",
				"c_leftforearm",
				"c_leftarm"
			},
			parent_scale_nodes = {
				"j_leftarm_scale"
			},
			ragdoll_destroy_actors = {
				"j_lefthand",
				"j_leftforearm",
				"j_leftarm"
			}
		},
		left_hand = {
			stump_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_stump_left_hand",
			gib_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_gib_left_hand",
			parent_scale = 0,
			gib_push_force = 0.5,
			stump_parent_align_node = "j_leftforearm",
			gib_parent_align_node = "j_lefthand",
			gib_push_actor = "c_ragdoll",
			vfx = "fx/impact_blood_maim_chaos",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_leftforearm"
			},
			parent_link_nodes = {
				"j_leftforearm"
			},
			parent_destroy_actors = {
				"c_lefthand"
			},
			parent_scale_nodes = {
				"j_lefthand"
			},
			ragdoll_destroy_actors = {
				"j_lefthand"
			}
		},
		left_lowerleg = {
			stump_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_stump_left_lowerleg",
			gib_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_gib_left_lowerleg",
			parent_scale = 0,
			gib_push_force = 0.75,
			stump_parent_align_node = "j_leftupleg",
			gib_parent_align_node = "j_leftleg",
			gib_push_actor = "c_ragdoll",
			vfx = "fx/impact_blood_maim_chaos",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_leftupleg"
			},
			parent_link_nodes = {
				"j_leftupleg"
			},
			parent_destroy_actors = {
				"c_leftfoot",
				"c_leftleg"
			},
			parent_scale_nodes = {
				"j_leftleg"
			},
			ragdoll_destroy_actors = {
				"j_leftfoot",
				"j_leftleg"
			}
		},
		right_arm = {
			stump_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_stump_right_arm",
			gib_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_gib_right_arm",
			parent_scale = 0,
			gib_push_force = 1,
			stump_parent_align_node = "j_rightshoulder",
			gib_parent_align_node = "j_rightarm",
			gib_push_actor = "c_ragdoll",
			vfx = "fx/impact_blood_maim_chaos",
			parent_hide_group = "vg_arm_right_1",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_hips",
				"j_spine",
				"j_spine1",
				"j_neck",
				"j_rightshoulder",
				"j_rightarm"
			},
			parent_link_nodes = {
				"j_hips",
				"j_spine",
				"j_spine1",
				"j_neck",
				"j_rightshoulder",
				"j_rightarm"
			},
			parent_destroy_actors = {
				"c_righthand",
				"c_rightforearm",
				"c_rightarm"
			},
			parent_scale_nodes = {
				"j_rightarm_scale"
			},
			ragdoll_destroy_actors = {
				"j_righthand",
				"j_rightforearm",
				"j_rightarm"
			}
		},
		right_hand = {
			stump_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_stump_right_hand",
			gib_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_gib_right_hand",
			parent_scale = 0,
			gib_push_force = 0.5,
			stump_parent_align_node = "j_rightforearm",
			gib_parent_align_node = "j_righthand",
			gib_push_actor = "c_ragdoll",
			vfx = "fx/impact_blood_maim_chaos",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_rightforearm"
			},
			parent_link_nodes = {
				"j_rightforearm"
			},
			parent_destroy_actors = {
				"c_righthand"
			},
			parent_scale_nodes = {
				"j_righthand"
			},
			ragdoll_destroy_actors = {
				"j_righthand"
			}
		},
		right_lowerleg = {
			stump_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_stump_right_lowerleg",
			gib_unit = "units/beings/enemies/chaos_marauder/gibs/chaos_marauder_gib_right_lowerleg",
			parent_scale = 0,
			gib_push_force = 0.75,
			stump_parent_align_node = "j_rightupleg",
			gib_parent_align_node = "j_rightleg",
			gib_push_actor = "c_ragdoll",
			vfx = "fx/impact_blood_maim_chaos",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_rightupleg"
			},
			parent_link_nodes = {
				"j_rightupleg"
			},
			parent_destroy_actors = {
				"c_rightfoot",
				"c_rightleg"
			},
			parent_scale_nodes = {
				"j_rightleg"
			},
			ragdoll_destroy_actors = {
				"j_rightfoot",
				"j_rightleg"
			}
		}
	},
	explode = {
		vfx_align_node = "root_point",
		vfx = "fx/chr_skaven_dismembered",
		part_combos = {
			{
				"left_arm",
				"left_lowerleg"
			},
			{
				"right_arm",
				"right_lowerleg"
			},
			{
				"right_arm",
				"left_arm",
				"right_lowerleg",
				"left_lowerleg"
			},
			{
				"right_lowerleg",
				"left_lowerleg"
			},
			{
				"right_arm",
				"left_arm"
			}
		}
	}
}
UnitGibSettings.chaos_raider_baked = table.create_copy(UnitGibSettings.chaos_raider_baked, UnitGibSettings.chaos_raider)
UnitGibSettings.chaos_raider_tutorial = table.create_copy(UnitGibSettings.chaos_raider_tutorial, UnitGibSettings.chaos_raider)
UnitGibSettings.chaos_fanatic = {
	parts = {
		head = {
			stump_unit = "units/beings/enemies/chaos_fanatic/gibs/chaos_fanatic_stump_head",
			gib_unit = "units/beings/enemies/chaos_fanatic/gibs/chaos_fanatic_gib_head",
			parent_scale = 0,
			gib_push_force = 1,
			stump_parent_align_node = "j_spine1",
			gib_parent_align_node = "j_neck",
			gib_push_actor = "c_ragdoll",
			parent_hide_group = "vg_gib_head",
			vfx = "fx/impact_blood_maim_chaos",
			gib_unit_template = "dynamic_gib_unit",
			stop_death_sound = true,
			stump_link_nodes = {
				"j_spine1",
				"j_leftshoulder",
				"j_leftarm",
				"j_rightshoulder",
				"j_rightarm",
				"j_neck"
			},
			parent_link_nodes = {
				"j_spine1",
				"j_leftshoulder",
				"j_leftarm_scale",
				"j_rightshoulder",
				"j_rightarm_scale",
				"j_neck"
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
				"j_neck"
			}
		},
		left_arm = {
			stump_unit = "units/beings/enemies/chaos_fanatic/gibs/chaos_fanatic_stump_left_arm",
			gib_unit = "units/beings/enemies/chaos_fanatic/gibs/chaos_fanatic_gib_left_arm",
			parent_scale = 0,
			gib_push_force = 1,
			stump_parent_align_node = "j_leftshoulder",
			gib_parent_align_node = "j_leftarm",
			gib_push_actor = "c_ragdoll",
			parent_hide_group = "vg_gib_arm_left",
			vfx = "fx/impact_blood_maim_chaos",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_hips",
				"j_spine",
				"j_spine1",
				"j_neck",
				"j_leftshoulder",
				"j_leftarm"
			},
			parent_link_nodes = {
				"j_hips",
				"j_spine",
				"j_spine1",
				"j_neck",
				"j_leftshoulder",
				"j_leftarm"
			},
			parent_destroy_actors = {
				"c_lefthand",
				"c_leftforearm",
				"c_leftarm"
			},
			parent_scale_nodes = {
				"j_leftarm_scale"
			},
			ragdoll_destroy_actors = {
				"j_lefthand",
				"j_leftforearm",
				"j_leftarm"
			}
		},
		left_lowerleg = {
			stump_unit = "units/beings/enemies/chaos_fanatic/gibs/chaos_fanatic_stump_left_lowerleg",
			gib_unit = "units/beings/enemies/chaos_fanatic/gibs/chaos_fanatic_gib_left_lowerleg",
			parent_scale = 0,
			gib_push_force = 0.75,
			stump_parent_align_node = "j_leftupleg",
			gib_parent_align_node = "j_leftleg",
			gib_push_actor = "c_ragdoll",
			vfx = "fx/impact_blood_maim_chaos",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_leftupleg"
			},
			parent_link_nodes = {
				"j_leftupleg"
			},
			parent_destroy_actors = {
				"c_leftfoot",
				"c_leftleg"
			},
			parent_scale_nodes = {
				"j_leftleg"
			},
			ragdoll_destroy_actors = {
				"j_leftfoot",
				"j_leftleg"
			}
		},
		right_arm = {
			stump_unit = "units/beings/enemies/chaos_fanatic/gibs/chaos_fanatic_stump_right_arm",
			gib_unit = "units/beings/enemies/chaos_fanatic/gibs/chaos_fanatic_gib_right_arm",
			parent_scale = 0,
			gib_push_force = 1,
			stump_parent_align_node = "j_rightshoulder",
			gib_parent_align_node = "j_rightarm",
			gib_push_actor = "c_ragdoll",
			parent_hide_group = "vg_gib_arm_right",
			vfx = "fx/impact_blood_maim_chaos",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_hips",
				"j_spine",
				"j_spine1",
				"j_neck",
				"j_rightshoulder",
				"j_rightarm"
			},
			parent_link_nodes = {
				"j_hips",
				"j_spine",
				"j_spine1",
				"j_neck",
				"j_rightshoulder",
				"j_rightarm"
			},
			parent_destroy_actors = {
				"c_righthand",
				"c_rightforearm",
				"c_rightarm"
			},
			parent_scale_nodes = {
				"j_rightarm_scale"
			},
			ragdoll_destroy_actors = {
				"j_righthand",
				"j_rightforearm",
				"j_rightarm"
			}
		},
		right_lowerleg = {
			stump_unit = "units/beings/enemies/chaos_fanatic/gibs/chaos_fanatic_stump_right_lowerleg",
			gib_unit = "units/beings/enemies/chaos_fanatic/gibs/chaos_fanatic_gib_right_lowerleg",
			parent_scale = 0,
			gib_push_force = 0.75,
			stump_parent_align_node = "j_rightupleg",
			gib_parent_align_node = "j_rightleg",
			gib_push_actor = "c_ragdoll",
			vfx = "fx/impact_blood_maim_chaos",
			gib_unit_template = "dynamic_gib_unit",
			stump_link_nodes = {
				"j_rightupleg"
			},
			parent_link_nodes = {
				"j_rightupleg"
			},
			parent_destroy_actors = {
				"c_rightfoot",
				"c_rightleg"
			},
			parent_scale_nodes = {
				"j_rightleg"
			},
			ragdoll_destroy_actors = {
				"j_rightfoot",
				"j_rightleg"
			}
		},
		upperbody = {
			gib_unit_template = "dynamic_gib_unit",
			gib_helmet_link_node = "a_helmet",
			gib_push_force = 2,
			stump_parent_align_node = "j_hips",
			gib_unit = "units/beings/enemies/chaos_fanatic/gibs/chaos_fanatic_gib_upperbody",
			gib_parent_align_node = "j_spine",
			gib_push_actor = "j_spine1",
			parent_scale = 0,
			parent_hide_group = "vg_gib_torso",
			vfx = "fx/impact_blood_maim_chaos",
			stump_unit = "units/beings/enemies/chaos_fanatic/gibs/chaos_fanatic_stump_upperbody",
			stump_link_nodes = {
				"j_hips"
			},
			parent_link_nodes = {
				"j_hips"
			},
			parent_destroy_actors = {
				"c_leftshoulder",
				"c_leftarm",
				"c_leftforearm",
				"c_lefthand",
				"c_rightshoulder",
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
			}
		}
	},
	explode = {
		vfx_align_node = "root_point",
		vfx = "fx/chr_skaven_dismembered",
		part_combos = {
			{
				"head",
				"right_lowerleg"
			},
			{
				"head",
				"left_lowerleg"
			},
			{
				"upperbody",
				"right_lowerleg"
			},
			{
				"left_arm",
				"left_lowerleg"
			},
			{
				"right_arm",
				"right_lowerleg"
			},
			{
				"upperbody",
				"left_lowerleg"
			},
			{
				"head",
				"left_arm"
			},
			{
				"head",
				"right_arm"
			},
			{
				"right_arm",
				"left_arm",
				"right_lowerleg",
				"left_lowerleg"
			},
			{
				"head",
				"right_arm",
				"left_arm",
				"right_lowerleg",
				"left_lowerleg"
			},
			{
				"right_lowerleg",
				"left_lowerleg"
			},
			{
				"right_arm",
				"left_arm"
			}
		}
	}
}
UnitGibSettings.chaos_fanatic_baked = table.create_copy(UnitGibSettings.chaos_fanatic_baked, UnitGibSettings.chaos_fanatic)
UnitGibSettings.chaos_zombie = {
	parts = {
		gib_01 = {
			gib_parent_align_node = "j_leftleg",
			gib_unit = "units/beings/enemies/chaos_nurgle_corpses/gibs/chr_nurgle_corpse_gib_01",
			gib_push_actor = "c_ragdoll",
			gib_push_force = 2,
			gib_unit_template = "dynamic_gib_unit"
		},
		gib_02 = {
			gib_parent_align_node = "j_rightleg",
			gib_unit = "units/beings/enemies/chaos_nurgle_corpses/gibs/chr_nurgle_corpse_gib_02",
			gib_push_actor = "c_ragdoll",
			gib_push_force = 2,
			gib_unit_template = "dynamic_gib_unit"
		},
		gib_03 = {
			gib_parent_align_node = "j_spine1",
			gib_unit = "units/beings/enemies/chaos_nurgle_corpses/gibs/chr_nurgle_corpse_gib_03",
			gib_push_actor = "c_ragdoll",
			gib_push_force = 2,
			gib_unit_template = "dynamic_gib_unit"
		},
		gib_04 = {
			gib_parent_align_node = "j_spine1",
			gib_unit = "units/beings/enemies/chaos_nurgle_corpses/gibs/chr_nurgle_corpse_gib_04",
			gib_push_actor = "c_ragdoll",
			gib_push_force = 2,
			gib_unit_template = "dynamic_gib_unit"
		},
		gib_05 = {
			gib_parent_align_node = "j_leftupleg",
			gib_unit = "units/beings/enemies/chaos_nurgle_corpses/gibs/chr_nurgle_corpse_gib_05",
			gib_push_actor = "c_ragdoll",
			gib_push_force = 2,
			gib_unit_template = "dynamic_gib_unit"
		},
		gib_06 = {
			gib_parent_align_node = "j_rightupleg",
			gib_unit = "units/beings/enemies/chaos_nurgle_corpses/gibs/chr_nurgle_corpse_gib_06",
			gib_push_actor = "c_ragdoll",
			gib_push_force = 2,
			gib_unit_template = "dynamic_gib_unit"
		},
		gib_07 = {
			gib_parent_align_node = "j_spine1",
			gib_unit = "units/beings/enemies/chaos_nurgle_corpses/gibs/chr_nurgle_corpse_gib_07",
			gib_push_actor = "c_ragdoll",
			gib_push_force = 2,
			gib_unit_template = "dynamic_gib_unit"
		},
		gib_08 = {
			gib_parent_align_node = "j_spine1",
			gib_unit = "units/beings/enemies/chaos_nurgle_corpses/gibs/chr_nurgle_corpse_gib_08",
			gib_push_actor = "c_ragdoll",
			gib_push_force = 2,
			gib_unit_template = "dynamic_gib_unit"
		}
	},
	explode = {
		part_combos = {
			{
				"gib_07",
				"gib_02",
				"gib_04"
			},
			{
				"gib_07",
				"gib_02",
				"gib_06"
			},
			{
				"gib_07",
				"gib_04",
				"gib_05"
			},
			{
				"gib_08",
				"gib_01",
				"gib_03"
			},
			{
				"gib_08",
				"gib_03",
				"gib_06"
			},
			{
				"gib_08",
				"gib_07",
				"gib_05"
			},
			{
				"gib_01",
				"gib_04",
				"gib_05",
				"gib_08"
			},
			{
				"gib_02",
				"gib_03",
				"gib_06",
				"gib_07"
			},
			{
				"gib_01",
				"gib_03",
				"gib_06"
			},
			{
				"gib_02",
				"gib_04",
				"gib_05"
			}
		}
	}
}

return
